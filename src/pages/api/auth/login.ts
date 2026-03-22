// EduLaluan API: User Login
// POST /api/auth/login
// Description: Handle user login with email/password or GitHub OAuth

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { email, password, provider } = body;

    // Handle GitHub OAuth
    if (provider === 'github') {
      const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
      const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

      if (!supabaseUrl || !supabasePublishableKey) {
        return new Response(
          JSON.stringify({ error: 'Server configuration error' }),
          { status: 500, headers: { 'Content-Type': 'application/json' } }
        );
      }

      // Determine redirect URL based on environment
      // Astro's import.meta.env.SITE is set in astro.config.mjs
      const siteUrl = import.meta.env.SITE || 'https://edulaluan.netlify.app';
      const redirectTo = `${siteUrl}/auth/callback`;

      const supabase = createClient(supabaseUrl, supabasePublishableKey);

      const { data, error } = await supabase.auth.signInWithOAuth({
        provider: 'github',
        options: {
          redirectTo
        }
      });

      if (error) {
        return new Response(
          JSON.stringify({ error: error.message }),
          { status: 400, headers: { 'Content-Type': 'application/json' } }
        );
      }

      return new Response(
        JSON.stringify({ url: data.url }),
        { status: 200, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Handle email/password login
    if (!email || !password) {
      return new Response(
        JSON.stringify({ error: 'Email and password are required' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Initialize Supabase client (client-side for auth)
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

    if (!supabaseUrl || !supabasePublishableKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabasePublishableKey);

    // Attempt login
    const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
      email,
      password
    });

    if (authError) {
      // Check if it's a 2FA required error
      if (authError.message.includes('MFA') || authError.message.includes('2FA')) {
        return new Response(
          JSON.stringify({
            error: '2FA required',
            requires2FA: true,
            sessionId: (authData?.session as any)?.id
          }),
          { status: 403, headers: { 'Content-Type': 'application/json' } }
        );
      }

      return new Response(
        JSON.stringify({ error: 'Invalid email or password' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Update last login timestamp
    await supabase
      .from('users')
      .update({ last_login_at: new Date().toISOString() })
      .eq('id', authData.user.id);

    // Get user profile
    const { data: userProfile } = await supabase
      .from('users')
      .select('id, email, full_name, avatar_url, tier, points_balance, is_admin, is_moderator')
      .eq('id', authData.user.id)
      .single();

    // Success response
    return new Response(
      JSON.stringify({
        success: true,
        message: 'Login successful',
        user: userProfile,
        session: {
          accessToken: authData.session.access_token,
          refreshToken: authData.session.refresh_token,
          expiresAt: authData.session.expires_at
        }
      }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('Login error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
