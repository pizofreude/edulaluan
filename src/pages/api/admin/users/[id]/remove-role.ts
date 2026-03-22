// EduLaluan API: Remove Admin Role
// POST /api/admin/users/:id/remove-role
// Description: Remove admin/moderator role from user (Super Admin only)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request, params }) => {
  try {
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(JSON.stringify({ error: 'Missing Supabase credentials' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get current user and verify SUPER ADMIN status
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
      return new Response(JSON.stringify({ error: 'Authentication required' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    const { data: userData } = await supabase
      .from('users')
      .select('role')
      .eq('id', user.id)
      .single();

    if (userData?.role !== 'super_admin') {
      return new Response(JSON.stringify({ error: 'Super Admin access required' }), {
        status: 403,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    const targetUserId = params.id;

    if (!targetUserId) {
      return new Response(JSON.stringify({ error: 'User ID required' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Check if trying to remove super admin (should be blocked by DB trigger, but double-check)
    const { data: targetUser } = await supabase
      .from('users')
      .select('role, email')
      .eq('id', targetUserId)
      .single();

    if (!targetUser) {
      return new Response(JSON.stringify({ error: 'User not found' }), {
        status: 404,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    if (targetUser.role === 'super_admin') {
      return new Response(JSON.stringify({ 
        error: 'Cannot remove Super Admin role. This action is blocked for system security.' 
      }), {
        status: 403,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Remove admin role (set back to 'user')
    const { error: updateError } = await supabase
      .from('users')
      .update({ role: 'user' })
      .eq('id', targetUserId);

    if (updateError) {
      console.error('Failed to remove admin role:', updateError);
      return new Response(JSON.stringify({ error: 'Failed to remove admin role' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    return new Response(JSON.stringify({
      success: true,
      message: `${targetUser.role} role removed from ${targetUser.email}`
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });

  } catch (error) {
    console.error('Remove admin error:', error);
    return new Response(JSON.stringify({ error: 'Internal server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
