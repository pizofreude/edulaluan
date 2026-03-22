// EduLaluan API: Set/Update Username
// POST /api/user/set-username
// Description: Set or update user's username with 90-day cooldown enforcement

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';
import { validateUsername, USERNAME_RULES, canChangeUsername } from '../../../lib/username';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const { username } = await request.json();

    if (!username) {
      return new Response(
        JSON.stringify({ error: 'Username is required' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 1: Validate username format
    const validation = validateUsername(username);
    if (!validation.valid) {
      return new Response(
        JSON.stringify({ error: validation.error }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 2: Get authenticated user
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SECRET_KEY || import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      console.error('[Set Username] Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get access token from Authorization header
    const authHeader = request.headers.get('authorization');
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const accessToken = authHeader.substring(7);

    // Get user from access token
    const { data: { user }, error: userError } = await supabase.auth.getUser(accessToken);

    if (userError || !user) {
      console.error('[Set Username] Failed to get user:', userError);
      return new Response(
        JSON.stringify({ error: 'Invalid or expired token' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 3: Get current user data from database
    const { data: userData, error: fetchError } = await supabase
      .from('users')
      .select('id, username, username_updated_at')
      .eq('id', user.id)
      .single();

    if (fetchError) {
      console.error('[Set Username] Failed to fetch user data:', fetchError);
      return new Response(
        JSON.stringify({ error: 'User profile not found' }),
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 4: Check cooldown if user already has a username
    if (userData?.username && userData.username_updated_at) {
      const { canChange, daysRemaining } = canChangeUsername(userData.username_updated_at);

      if (!canChange) {
        return new Response(
          JSON.stringify({ 
            error: `You can only change your username once every ${USERNAME_RULES.COOLDOWN_DAYS} days. ${daysRemaining} days remaining.`,
            cooldown: true,
            daysRemaining
          }),
          { status: 429, headers: { 'Content-Type': 'application/json' } }
        );
      }
    }

    // Step 5: Check if username is already taken (by another user)
    const { data: existing, error: existingError } = await supabase
      .from('users')
      .select('id')
      .ilike('username', username.trim())
      .neq('id', user.id) // Exclude current user
      .single();

    if (existingError && existingError.code !== 'PGRST116') {
      console.error('[Set Username] Failed to check existing username:', existingError);
      return new Response(
        JSON.stringify({ error: 'Failed to check username availability' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    if (existing) {
      return new Response(
        JSON.stringify({ error: 'Username is already taken' }),
        { status: 409, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 6: Check reserved usernames
    const { data: reserved } = await supabase
      .from('reserved_usernames')
      .select('id')
      .ilike('username', username.trim())
      .single();

    if (reserved) {
      return new Response(
        JSON.stringify({ error: 'This username is reserved and cannot be used' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 7: Update username
    const normalizedUsername = username.trim().toLowerCase();
    const { error: updateError } = await supabase
      .from('users')
      .update({ 
        username: normalizedUsername,
        username_updated_at: new Date().toISOString()
      })
      .eq('id', user.id);

    if (updateError) {
      console.error('[Set Username] Failed to update username:', updateError);
      return new Response(
        JSON.stringify({ error: 'Failed to set username' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Step 8: Log audit event
    await supabase
      .from('audit_logs')
      .insert({
        table_name: 'users',
        record_id: user.id,
        action: 'UPDATE',
        new_value: { username: normalizedUsername },
        user_id: user.id,
        description: `Username set to "${normalizedUsername}"`
      });

    // Success!
    return new Response(
      JSON.stringify({ 
        success: true, 
        username: normalizedUsername,
        message: userData?.username 
          ? 'Username updated successfully' 
          : 'Username set successfully'
      }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error: any) {
    console.error('[Set Username] Unexpected error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'An unexpected error occurred' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
