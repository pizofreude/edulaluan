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

    // Get access token from Authorization header
    const authHeader = request.headers.get('authorization');
    let accessToken: string | null = null;
    
    if (authHeader && authHeader.startsWith('Bearer ')) {
      accessToken = authHeader.substring(7);
    }

    if (!accessToken) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get current user from access token
    const { data: { user }, error: userError } = await supabase.auth.getUser(accessToken);

    if (userError || !user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required - invalid token' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const { data: userData } = await supabase
      .from('users')
      .select('role')
      .eq('id', user.id)
      .single();

    if (!userData || !['super_admin', 'admin', 'moderator'].includes(userData.role)) {
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

    // Query contributions table directly with user join
    let query = supabase
      .from('contributions')
      .select(`
        *,
        user:users!contributions_user_id_fkey(
          id,
          email,
          full_name,
          tier,
          approval_rate,
          total_contributions,
          avatar_url
        ),
        category:categories!left(
          id,
          name
        )
      `, { count: 'exact' })
      .eq('status', status)
      .limit(limit);

    // Apply filters
    if (type) {
      query = query.eq('type', type);
    }

    const { data: contributions, error: fetchError, count } = await query;

    if (fetchError) {
      console.error('Failed to fetch contributions:', fetchError);
      return new Response(
        JSON.stringify({ error: 'Failed to fetch contributions: ' + fetchError.message }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Success response
    return new Response(
      JSON.stringify({
        success: true,
        contributions: contributions || [],
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
