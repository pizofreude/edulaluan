// EduLaluan API: Send Admin Invite
// POST /api/admin/invite
// Description: Send invite email to new admin/moderator

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { email, role = 'admin', permissions } = body;

    // Validation
    if (!email) {
      return new Response(
        JSON.stringify({ error: 'Email is required' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Email format validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return new Response(
        JSON.stringify({ error: 'Invalid email format' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Validate role
    if (!['admin', 'moderator'].includes(role)) {
      return new Response(
        JSON.stringify({ error: 'Role must be "admin" or "moderator"' }), 
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

    // Get current user and verify admin status
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }), 
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const { data: userData } = await supabase
      .from('users')
      .select('is_admin')
      .eq('id', user.id)
      .single();

    if (!userData || !userData.is_admin) {
      return new Response(
        JSON.stringify({ error: 'Admin access required' }), 
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Check if email already exists as user
    const { data: existingUser } = await supabase
      .from('users')
      .select('id, email')
      .eq('email', email)
      .single();

    if (existingUser) {
      return new Response(
        JSON.stringify({ 
          error: 'This email is already registered as a user',
          existingUserId: existingUser.id
        }), 
        { status: 409, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Check if invite already exists
    const { data: existingInvite } = await supabase
      .from('admin_invites')
      .select('id, status')
      .eq('email', email)
      .eq('status', 'pending')
      .single();

    if (existingInvite) {
      return new Response(
        JSON.stringify({ error: 'An invite has already been sent to this email' }), 
        { status: 409, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Generate invite token using crypto API
    const inviteToken = crypto.randomUUID();
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7); // 7 days expiry

    // Create invite record
    const { error: insertError } = await supabase
      .from('admin_invites')
      .insert({
        email,
        token: inviteToken,
        role,
        permissions: permissions || (role === 'admin' 
          ? ['moderate_submissions', 'manage_users', 'view_analytics']
          : ['moderate_submissions']
        ),
        invited_by: user.id,
        expires_at: expiresAt.toISOString()
      });

    if (insertError) {
      console.error('Failed to create invite:', insertError);
      return new Response(
        JSON.stringify({ error: 'Failed to create invite' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // TODO: Send email via Supabase Edge Function + Resend
    // For now, return the invite link for manual sending
    const inviteLink = `${new URL(request.url).origin}/auth/signup?invite=${inviteToken}`;

    // Log audit event
    await supabase
      .from('audit_logs')
      .insert({
        table_name: 'admin_invites',
        record_id: inviteToken,
        action: 'CREATE',
        new_value: { email, role, permissions },
        user_id: user.id
      });

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        message: `Invite sent to ${email}`,
        invite: {
          email,
          role,
          expiresAt: expiresAt.toISOString(),
          inviteLink
        },
        note: 'In production, this will send an email. For now, use the inviteLink manually.'
      }), 
      { status: 201, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error: any) {
    console.error('Admin invite error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Failed to send invite' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
