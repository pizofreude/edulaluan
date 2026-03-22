// EduLaluan API: Get Current User's Rank
// GET /api/leaderboard/my-rank

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const GET: APIRoute = async ({ request }) => {
  try {
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SECRET_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(JSON.stringify({ error: 'Missing Supabase credentials' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get auth header to identify the user
    const authHeader = request.headers.get('Authorization');
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    const accessToken = authHeader.substring(7);
    
    // Get user from token (using auth API, not database)
    const { data: { user: authUser }, error: authError } = await supabase.auth.getUser(accessToken);
    
    if (authError || !authUser) {
      return new Response(JSON.stringify({ error: 'Invalid token' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Get user's points (service role bypasses RLS)
    const { data: userData } = await supabase
      .from('users')
      .select('points_balance')
      .eq('id', authUser.id)
      .single();

    if (!userData) {
      return new Response(JSON.stringify({ error: 'User not found' }), {
        status: 404,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Calculate rank (count users with more points) - service role bypasses RLS
    const { count: usersAbove } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true })
      .gt('points_balance', userData.points_balance || 0);

    const rank = (usersAbove || 0) + 1;

    // Get total users for percentile - service role bypasses RLS
    const { count: totalUsers } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true });

    const percentile = totalUsers ? ((totalUsers - rank) / totalUsers * 100).toFixed(1) : '0';

    return new Response(JSON.stringify({
      rank,
      points: userData.points_balance || 0,
      totalUsers: totalUsers || 0,
      percentile: parseFloat(percentile),
      message: rank <= 100 ? `You're in the top ${rank}!` : `You're in the top ${100 - parseFloat(percentile)}%`
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });

  } catch (error) {
    console.error('My Rank API error:', error);
    return new Response(JSON.stringify({ error: 'Internal server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
