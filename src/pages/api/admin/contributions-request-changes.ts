// EduLaluan API: Request Changes for Contribution
// POST /api/admin/contributions/:id/request-changes
// Description: Request changes from contributor with feedback

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
    const { changeReasons, moderatorNotes } = body;

    if (!changeReasons || !Array.isArray(changeReasons) || changeReasons.length === 0) {
      return new Response(
        JSON.stringify({ error: 'At least one change reason is required' }), 
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

    // Format change reasons into readable message
    const reasonsMap: Record<string, string> = {
      'missing_info': 'Missing required information',
      'broken_url': 'URL is broken or inaccessible',
      'short_description': 'Description too short or unclear',
      'category_mismatch': 'Category does not match content',
      'duplicate': 'Duplicate submission',
      'quality_standards': 'Does not meet quality standards',
      'other': 'Other'
    };

    const reasonsText = changeReasons
      .map((r: string) => reasonsMap[r] || r)
      .join(', ');

    // Update contribution status
    const { error: updateError } = await supabase
      .from('contributions')
      .update({
        status: 'changes_requested',
        moderator_id: user.id,
        moderated_at: new Date().toISOString(),
        moderation_notes: moderatorNotes || null,
        metadata: {
          change_reasons: changeReasons,
          change_requested_at: new Date().toISOString()
        }
      })
      .eq('id', contributionId);

    if (updateError) {
      throw updateError;
    }

    // Send notification to user
    await supabase
      .from('user_notifications')
      .insert({
        user_id: contribution.user_id,
        type: 'changes_requested',
        title: 'Changes Requested for Your Submission',
        message: `Your submission "${contribution.title}" needs changes. Reasons: ${reasonsText}${moderatorNotes ? ` - ${moderatorNotes}` : ''}. Please update and resubmit.`,
        link: '/user/submissions',
        contribution_id: contributionId
      });

    // Log audit event
    await supabase
      .from('audit_logs')
      .insert({
        table_name: 'contributions',
        record_id: contributionId,
        action: 'REQUEST_CHANGES',
        new_value: { 
          status: 'changes_requested', 
          change_reasons: changeReasons,
          moderator_id: user.id 
        },
        user_id: user.id
      });

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        message: 'Changes requested',
        reasons: changeReasons.map((r: string) => reasonsMap[r] || r),
        userNotified: true
      }), 
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error: any) {
    console.error('Request changes error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Failed to request changes' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
