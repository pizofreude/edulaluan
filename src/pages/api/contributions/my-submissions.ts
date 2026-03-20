// EduLaluan API: Get My Submissions
// GET /api/contributions/my-submissions
// Description: Get current user's contribution submissions

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const GET: APIRoute = async ({ request, url }) => {
  try {
    // Initialize Supabase client
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseAnonKey = import.meta.env.PUBLIC_SUPABASE_ANON_KEY;
    
    if (!supabaseUrl || !supabaseAnonKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseAnonKey);

    // Get current user from session
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }), 
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Parse query parameters
    const searchParams = new URL(url).searchParams;
    const status = searchParams.get('status'); // 'pending', 'approved', 'rejected', 'all'
    const type = searchParams.get('type'); // Filter by type
    const limit = parseInt(searchParams.get('limit') || '20');
    const offset = parseInt(searchParams.get('offset') || '0');

    // Build query
    let query = supabase
      .from('contributions')
      .select(`
        id,
        type,
        title,
        description,
        url,
        status,
        points_earned,
        moderated_at,
        moderation_notes,
        rejection_reason,
        submitted_at,
        category:category_id (
          id,
          name,
          slug
        )
      `, { count: 'exact' })
      .eq('user_id', user.id)
      .order('submitted_at', { ascending: false })
      .range(offset, offset + limit - 1);

    // Apply filters
    if (status && status !== 'all') {
      query = query.eq('status', status);
    }

    if (type) {
      query = query.eq('type', type);
    }

    const { data: contributions, error: fetchError, count } = await query;

    if (fetchError) {
      console.error('Failed to fetch contributions:', fetchError);
      return new Response(
        JSON.stringify({ error: 'Failed to fetch submissions' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get user's total stats
    const { data: stats } = await supabase
      .from('users')
      .select('total_contributions, total_submissions, approval_rate, points_balance')
      .eq('id', user.id)
      .single();

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        contributions,
        pagination: {
          total: count || 0,
          limit,
          offset,
          hasMore: (offset + limit) < (count || 0)
        },
        stats: stats || {
          total_contributions: 0,
          total_submissions: 0,
          approval_rate: 0,
          points_balance: 0
        }
      }), 
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('Get submissions error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
