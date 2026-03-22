// EduLaluan API: User Signup - Simplified (no public.users dependency)
// POST /api/auth/signup
// Description: Handle user signup with email/password

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { email, password, fullName, areasOfInterest } = body;

    console.log('[Signup API] Received signup request for:', email);

    if (!email || !password) {
      return new Response(
        JSON.stringify({ error: 'Email and password are required' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    // Support both new (SUPABASE_SECRET_KEY) and legacy (SUPABASE_SERVICE_ROLE_KEY) key names
    const supabaseSecretKey = import.meta.env.SUPABASE_SECRET_KEY || import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseSecretKey) {
      return new Response(
        JSON.stringify({ error: 'Server configuration error - missing Supabase credentials' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseSecretKey);

    // Create user with Supabase Auth
    console.log('[Signup API] Creating user...');
    const { data: authData, error: authError } = await supabase.auth.admin.createUser({
      email,
      password,
      email_confirm: true,
      user_metadata: {
        full_name: fullName || email.split('@')[0],
        areas_of_interest: areasOfInterest || [],
        points_balance: 10,
        tier: 1
      }
    });

    if (authError) {
      console.error('[Signup API] Auth error:', authError.message);
      if (authError.message.includes('already been registered')) {
        return new Response(
          JSON.stringify({ error: 'This email is already registered. Please login instead.' }),
          { status: 409, headers: { 'Content-Type': 'application/json' } }
        );
      }
      return new Response(
        JSON.stringify({ error: authError.message }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    console.log('[Signup API] User created successfully:', authData.user.id);

    // Automatically sign in the user after successful signup
    console.log('[Signup API] Signing in user...');
    const { data: signInData, error: signInError } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (signInError) {
      console.error('[Signup API] Sign in error:', signInError.message);
      // Continue anyway - user is created, they can login manually
    }

    // Set the session cookies
    const headers = new Headers({ 'Content-Type': 'application/json' });
    if (signInData?.session) {
      const { access_token, refresh_token, expires_in } = signInData.session;
      // These cookies will be set by the client-side Supabase client
      headers.set('X-Session-Access-Token', access_token);
      headers.set('X-Session-Refresh-Token', refresh_token);
      headers.set('X-Session-Expires-In', expires_in.toString());
    }

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Account created successfully!',
        user: {
          id: authData.user.id,
          email: authData.user.email,
          fullName: fullName || email.split('@')[0],
          pointsBalance: 10,
          tier: 1
        },
        session: !!signInData?.session // Indicate if session was created
      }),
      { status: 201, headers }
    );

  } catch (error) {
    console.error('[Signup API] Unexpected error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
