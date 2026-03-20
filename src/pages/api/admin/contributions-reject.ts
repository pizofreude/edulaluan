// EduLaluan API: Reject Contribution
// POST /api/admin/contributions/:id/reject
// Description: Reject a contribution with reason and anti-gaming checks

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
    const { rejectionReason, moderatorNotes } = body;

    if (!rejectionReason) {
      return new Response(
        JSON.stringify({ error: 'Rejection reason is required' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

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
      .select('user_id, type, title, status')
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

    // Update contribution status
    const { error: updateError } = await supabase
      .from('contributions')
      .update({
        status: 'rejected',
        moderator_id: user.id,
        moderated_at: new Date().toISOString(),
        rejection_reason: rejectionReason,
        moderation_notes: moderatorNotes || null
      })
      .eq('id', contributionId);

    if (updateError) {
      throw updateError;
    }

    // Update user stats (increment rejection count)
    const { data: userStats } = await supabase
      .from('users')
      .select('rejection_count, total_submissions, approval_rate, tier')
      .eq('id', contribution.user_id)
      .single();

    if (userStats) {
      const newRejectionCount = (userStats.rejection_count || 0) + 1;
      const newTotalSubmissions = (userStats.total_submissions || 0) + 1;
      const newApprovalRate = userStats.total_submissions > 0
        ? ((userStats.total_submissions - newRejectionCount) / newTotalSubmissions) * 100
        : 0;

      await supabase
        .from('users')
        .update({
          rejection_count: newRejectionCount,
          total_submissions: newTotalSubmissions,
          approval_rate: newApprovalRate
        })
        .eq('id', contribution.user_id);

      // ANTI-GAMING CHECK: Auto-demote if rejection rate > 30%
      const rejectionRate = newRejectionCount / newTotalSubmissions * 100;
      
      if (rejectionRate > 30 && userStats.tier > 1) {
        const newTier = userStats.tier - 1;
        
        await supabase
          .from('users')
          .update({ tier: newTier })
          .eq('id', contribution.user_id);

        // Notify user about demotion
        await supabase
          .from('user_notifications')
          .insert({
            user_id: contribution.user_id,
            type: 'tier_demoted',
            title: 'Tier Status Updated',
            message: `Your tier has been adjusted from ${userStats.tier} to ${newTier} due to high rejection rate. Keep contributing quality content!`,
            link: '/user/dashboard'
          });

        // Notify admin
        await supabase
          .from('admin_notifications')
          .insert({
            type: 'tier_demotion',
            message: `User ${contribution.user_id} demoted from Tier ${userStats.tier} to Tier ${newTier}`,
            priority: 'normal',
            user_id: contribution.user_id
          });
      }
    }

    // Send notification to user
    await supabase
      .from('user_notifications')
      .insert({
        user_id: contribution.user_id,
        type: 'contribution_rejected',
        title: 'Contribution Update',
        message: `Your submission "${contribution.title}" was rejected. Reason: ${rejectionReason}${moderatorNotes ? ` - ${moderatorNotes}` : ''}`,
        link: '/user/submissions',
        contribution_id: contributionId
      });

    // Log audit event
    await supabase
      .from('audit_logs')
      .insert({
        table_name: 'contributions',
        record_id: contributionId,
        action: 'REJECT',
        new_value: { 
          status: 'rejected', 
          rejection_reason: rejectionReason, 
          moderator_id: user.id 
        },
        user_id: user.id
      });

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        message: 'Contribution rejected',
        rejectionReason,
        userNotified: true
      }), 
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error: any) {
    console.error('Reject contribution error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Failed to reject contribution' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
