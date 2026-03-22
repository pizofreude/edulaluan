// EduLaluan API: Get Leaderboard Data
// GET /api/leaderboard?period=all-time&page=1&limit=100

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const GET: APIRoute = async ({ url }) => {
  try {
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    // Use service role key to bypass RLS policies
    const supabaseServiceKey = import.meta.env.SUPABASE_SECRET_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(JSON.stringify({ error: 'Missing Supabase credentials' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Parse query params
    const period = url.searchParams.get('period') || 'all-time';
    const page = parseInt(url.searchParams.get('page') || '1', 10);
    const limit = parseInt(url.searchParams.get('limit') || '100', 10);
    const offset = (page - 1) * limit;

    // Build query - use service role key so RLS is bypassed
    let query = supabase
      .from('users')
      .select('id, email, full_name, avatar_url, points_balance, tier, total_contributions, approval_rate', { count: 'exact' });

    // Apply ordering based on period
    switch (period) {
      case 'all-time':
        query = query.order('points_balance', { ascending: false, nullsFirst: false });
        break;
      case '30-day':
        // For 30-day, we need to sum point_transactions
        // This is a simplified version - in production, use a materialized view
        query = query.order('points_balance', { ascending: false, nullsFirst: false });
        break;
      default:
        query = query.order('points_balance', { ascending: false, nullsFirst: false });
    }

    // Apply pagination
    query = query.range(offset, offset + limit - 1);

    const { data: users, error, count } = await query;

    if (error) {
      console.error('Leaderboard API error:', error);
      return new Response(JSON.stringify({ error: 'Failed to fetch leaderboard' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Calculate total pages
    const totalPages = count ? Math.ceil(count / limit) : 1;

    // Format response
    const leaders = (users || []).map((user, index) => ({
      rank: offset + index + 1,
      userId: user.id,
      username: user.full_name || user.email?.split('@')[0] || 'Anonymous',
      email: user.email,
      avatarUrl: user.avatar_url,
      points: user.points_balance || 0,
      tier: user.tier || 1,
      totalContributions: user.total_contributions || 0,
      approvalRate: parseFloat(user.approval_rate) || 0
    }));

    return new Response(JSON.stringify({
      period,
      page,
      limit,
      totalPages,
      totalLeaders: count || 0,
      leaders
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });

  } catch (error) {
    console.error('Leaderboard API error:', error);
    return new Response(JSON.stringify({ error: 'Internal server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
