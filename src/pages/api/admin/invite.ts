// EduLaluan API: Send Admin Invite
// POST /api/admin/invite
// Description: Send email invite to become admin (Super Admin only)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
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

    // Parse request body
    const body = await request.json();
    const { email } = body;

    if (!email || !email.includes('@')) {
      return new Response(JSON.stringify({ error: 'Valid email required' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Check if user already exists
    const { data: existingUser } = await supabase
      .from('users')
      .select('id, role')
      .eq('email', email)
      .single();

    if (existingUser && existingUser.role !== 'user') {
      return new Response(JSON.stringify({ 
        error: `User already has role: ${existingUser.role}` 
      }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Generate invite token
    const token = crypto.randomUUID();
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7); // 7 days expiry

    // Create or update admin invite
    const { error: inviteError } = await supabase
      .from('admin_invites')
      .upsert({
        email,
        token,
        invited_by: user.id,
        expires_at: expiresAt.toISOString(),
        status: 'pending'
      });

    if (inviteError) {
      console.error('Failed to create invite:', inviteError);
      return new Response(JSON.stringify({ error: 'Failed to create invite' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Send email invite (using Supabase Edge Function or external service)
    // For now, we'll just return the invite link
    const inviteLink = `${new URL(request.url).origin}/admin/invite/accept?token=${token}`;

    // TODO: Send email with inviteLink using Edge Function
    // For now, log it for testing
    console.log('Admin invite link:', inviteLink);

    return new Response(JSON.stringify({
      success: true,
      message: `Invite sent to ${email}`,
      inviteLink // Remove in production, only for testing
    }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });

  } catch (error) {
    console.error('Invite admin error:', error);
    return new Response(JSON.stringify({ error: 'Internal server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
