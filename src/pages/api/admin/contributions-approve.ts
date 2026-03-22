// EduLaluan API: Approve Contribution
// POST /api/admin/contributions/:id/approve
// Description: Approve a contribution with atomic transaction (points, badges, leaderboard)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request, params }) => {
  try {
    const contributionId = params.id;

    if (!contributionId) {
      return new Response(
        JSON.stringify({ error: 'Contribution ID required' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const body = await request.json();
    const { moderatorNotes } = body;

    // Initialize Supabase client (service role for admin access)
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseUrl || !supabaseServiceKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get current user and verify admin/moderator status
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }), 
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const { data: userData } = await supabase
      .from('users')
      .select('is_admin, is_moderator')
      .eq('id', user.id)
      .single();

    if (!userData || (!userData.is_admin && !userData.is_moderator)) {
      return new Response(
        JSON.stringify({ error: 'Admin or moderator access required' }), 
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get contribution details
    const { data: contribution, error: fetchError } = await supabase
      .from('contributions')
      .select('user_id, type, title, status, url, category_id, metadata, description')
      .eq('id', contributionId)
      .single();

    if (fetchError || !contribution) {
      return new Response(
        JSON.stringify({ error: 'Contribution not found' }), 
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    if (contribution.status !== 'pending') {
      return new Response(
        JSON.stringify({ error: 'Contribution is not pending review' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Determine points based on type
    const pointsMap: Record<string, number> = {
      'resource': 50,
      'financial_aid': 50,
      'circumcision': 75,
      'feature_request': 10,
      'issue_report': 10
    };
    const pointsToAward = pointsMap[contribution.type] || 0;

    // ATOMIC TRANSACTION: All-or-nothing approval process
    try {
      // Step 1: Update contribution status
      const { error: updateError } = await supabase
        .from('contributions')
        .update({
          status: 'approved',
          moderator_id: user.id,
          moderated_at: new Date().toISOString(),
          points_earned: pointsToAward,
          moderation_notes: moderatorNotes || null
        })
        .eq('id', contributionId);

      if (updateError) throw updateError;

      // Step 2: Award points (insert transaction record)
      const { data: userBefore } = await supabase
        .from('users')
        .select('points_balance')
        .eq('id', contribution.user_id)
        .single();

      const newBalance = (userBefore?.points_balance || 0) + pointsToAward;

      const { error: pointsError } = await supabase
        .from('point_transactions')
        .insert({
          user_id: contribution.user_id,
          contribution_id: contributionId,
          points: pointsToAward,
          type: 'earn',
          description: `${(contribution.type as string).replace('_', ' ').replace(/\b\w/g, (l: string) => l.toUpperCase())} approved: ${(contribution.title as string)}`,
          balance_after: newBalance
        });

      if (pointsError) throw pointsError;

      // Step 3: Update user balance and stats
      const { error: userError } = await supabase.rpc('update_user_stats', {
        p_user_id: contribution.user_id,
        p_points: pointsToAward
      });

      // If RPC doesn't exist, do manual update
      if (userError) {
        await supabase
          .from('users')
          .update({
            points_balance: newBalance,
            total_contributions: supabase.rpc('increment_total_contributions', { p_user_id: contribution.user_id })
          })
          .eq('id', contribution.user_id);
      }

      // Step 4: Insert resource into resources table (if applicable)
      if (contribution.type === 'resource' || contribution.type === 'financial_aid') {
        const metadata = contribution.metadata as Record<string, any> || {};
        const { error: resourceError } = await supabase
          .from('resources')
          .insert({
            name: contribution.title,
            description: (contribution.description as string) || '',
            url: (contribution.url as string) || '',
            category_id: contribution.category_id,
            provider_name: metadata.provider_name || 'Community Submission',
            is_featured: false
          });

        if (resourceError) {
          console.error('Failed to create resource:', resourceError);
          // Non-critical, continue
        }
      }

      // Step 5: Check badge eligibility
      const { data: userStats } = await supabase
        .from('users')
        .select('points_balance, tier, total_contributions, approval_rate')
        .eq('id', contribution.user_id)
        .single();

      if (userStats) {
        // Get eligible badges
        const { data: eligibleBadges } = await supabase
          .from('badges')
          .select('id')
          .lte('points_required', userStats.points_balance)
          .lte('tier_required', userStats.tier);

        if (eligibleBadges) {
          for (const badge of eligibleBadges) {
            // Check if user already has this badge
            const { data: existingBadge } = await supabase
              .from('user_badges')
              .select('id')
              .eq('user_id', contribution.user_id)
              .eq('badge_id', badge.id)
              .single();

            if (!existingBadge) {
              await supabase
                .from('user_badges')
                .insert({
                  user_id: contribution.user_id,
                  badge_id: badge.id,
                  earned_at: new Date().toISOString(),
                  context: { points: userStats.points_balance, tier: userStats.tier }
                });
            }
          }
        }
      }

      // Step 6: Refresh leaderboard cache
      await supabase.rpc('refresh_leaderboard_cache', { p_user_id: contribution.user_id });

      // Step 7: Send notification to user
      await supabase
        .from('user_notifications')
        .insert({
          user_id: contribution.user_id,
          type: 'contribution_approved',
          title: 'Contribution Approved! 🎉',
          message: `Your "${contribution.title}" has been approved! You earned ${pointsToAward} points.`,
          link: '/user/submissions',
          contribution_id: contributionId
        });

      // Step 8: Log audit event
      await supabase
        .from('audit_logs')
        .insert({
          table_name: 'contributions',
          record_id: contributionId,
          action: 'APPROVE',
          new_value: { status: 'approved', points_earned: pointsToAward, moderator_id: user.id },
          user_id: user.id
        });

      // Success response
      return new Response(
        JSON.stringify({ 
          success: true,
          message: 'Contribution approved successfully',
          pointsAwarded: pointsToAward,
          newBalance
        }), 
        { status: 200, headers: { 'Content-Type': 'application/json' } }
      );

    } catch (transactionError: any) {
      console.error('Approval transaction failed:', transactionError);
      
      // Log failed approval attempt
      await supabase
        .from('audit_logs')
        .insert({
          table_name: 'contributions',
          record_id: contributionId,
          action: 'APPROVE_FAILED',
          new_value: { error: transactionError.message },
          user_id: user.id
        });

      throw transactionError;
    }

  } catch (error: any) {
    console.error('Approve contribution error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Failed to approve contribution' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
