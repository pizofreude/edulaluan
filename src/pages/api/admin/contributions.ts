// EduLaluan API: Get Moderation Queue
// GET /api/admin/contributions
// Description: Get pending contributions for moderation

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const GET: APIRoute = async ({ request, url }) => {
  try {
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

    // Parse query parameters
    const searchParams = new URL(url).searchParams;
    const status = searchParams.get('status') || 'pending';
    const type = searchParams.get('type'); // Filter by type
    const priority = searchParams.get('priority'); // 'high', 'normal', 'low'
    const limit = parseInt(searchParams.get('limit') || '50');

    // Build query with moderation_queue view for smart ordering
    let query = supabase
      .from('moderation_queue')
      .select('*', { count: 'exact' })
      .limit(limit);

    // Apply filters
    if (type) {
      query = query.eq('type', type);
    }

    if (priority) {
      query = query.eq('priority', priority);
    }

    const { data: contributions, error: fetchError, count } = await query;

    if (fetchError) {
      console.error('Failed to fetch moderation queue:', fetchError);
      return new Response(
        JSON.stringify({ error: 'Failed to fetch moderation queue' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get quick stats
    const { count: pendingCount } = await supabase
      .from('contributions')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'pending');

    const { count: approvedToday } = await supabase
      .from('contributions')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'approved')
      .gte('moderated_at', new Date().setHours(0, 0, 0, 0));

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        contributions,
        stats: {
          pending: pendingCount || 0,
          approvedToday: approvedToday || 0
        },
        pagination: {
          total: count || 0,
          limit
        }
      }), 
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('Get moderation queue error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
