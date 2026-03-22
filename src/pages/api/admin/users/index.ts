// EduLaluan API: Get Users
// GET /api/admin/users
// Description: Get list of users with role filter (Admin+ only)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const GET: APIRoute = async ({ request }) => {
  try {
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabasePublishableKey || !supabaseServiceKey) {
      return new Response(JSON.stringify({ error: 'Missing Supabase credentials' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Try to get access token from cookies first (SSR flow)
    let accessToken: string | null = null;
    
    // Check for SSR cookie (sb-{project-ref}-auth-token)
    const cookieHeader = request.headers.get('cookie') || '';
    const projectRef = supabaseUrl.split('://')[1].split('.')[0];
    const ssrCookieName = `sb-${projectRef}-auth-token`;
    
    if (cookieHeader) {
      const cookieMatch = cookieHeader.match(new RegExp(`${ssrCookieName}=([^;]+)`));
      if (cookieMatch) {
        try {
          const cookieData = JSON.parse(decodeURIComponent(cookieMatch[1]));
          accessToken = cookieData?.access_token || null;
        } catch (e) {
          console.warn('Failed to parse SSR cookie:', e);
        }
      }
    }

    // If no SSR cookie, the client needs to send access token in Authorization header
    if (!accessToken) {
      const authHeader = request.headers.get('authorization');
      if (authHeader && authHeader.startsWith('Bearer ')) {
        accessToken = authHeader.substring(7);
      }
    }

    if (!accessToken) {
      console.error('No access token found in cookies or Authorization header');
      return new Response(JSON.stringify({ error: 'Authentication required - please log in again' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Use service role client to verify user and get role
    const adminSupabase = createClient(supabaseUrl, supabaseServiceKey);
    
    // Get user from access token
    const { data: { user }, error: userError } = await adminSupabase.auth.getUser(accessToken);

    if (userError || !user) {
      console.error('Invalid access token:', userError);
      return new Response(JSON.stringify({ error: 'Authentication required - invalid token' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Check user's role
    const { data: userData } = await adminSupabase
      .from('users')
      .select('role')
      .eq('id', user.id)
      .single();

    if (!userData || !['super_admin', 'admin'].includes(userData.role)) {
      return new Response(JSON.stringify({ error: 'Admin access required' }), {
        status: 403,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Parse query params
    const url = new URL(request.url);
    const roles = url.searchParams.get('roles')?.split(',') || ['super_admin', 'admin', 'moderator'];

    // Get users with specified roles using service role
    const { data: users, error } = await adminSupabase
      .from('users')
      .select('id, email, full_name, avatar_url, role, created_at, last_login_at')
      .in('role', roles)
      .order('created_at', { ascending: false });

    if (error) {
      console.error('Failed to fetch users:', error);
      return new Response(JSON.stringify({ error: 'Failed to fetch users' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    return new Response(JSON.stringify({
      success: true,
      users: users || [],
      count: users?.length || 0
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });

  } catch (error) {
    console.error('Get users error:', error);
    return new Response(JSON.stringify({ error: 'Internal server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
