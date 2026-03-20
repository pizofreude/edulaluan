// EduLaluan API: User Signup
// POST /api/auth/signup
// Description: Handle user signup with email/password, demo data conflict check

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { email, password, fullName, areasOfInterest } = body;

    // Validation
    if (!email || !password) {
      return new Response(
        JSON.stringify({ 
          error: 'Email and password are required',
          details: { email: !email, password: !password }
        }), 
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

    // Password strength validation (min 8 chars)
    if (password.length < 8) {
      return new Response(
        JSON.stringify({ error: 'Password must be at least 8 characters long' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Initialize Supabase client
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseUrl || !supabaseServiceKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false
      }
    });

    // CRITICAL: Check for demo user conflict BEFORE creating account
    const { data: existingDemoUser } = await supabase
      .from('users')
      .select('id, is_demo')
      .eq('email', email)
      .eq('is_demo', true)
      .single();

    if (existingDemoUser) {
      // Delete demo user to allow real user signup
      const { error: deleteError } = await supabase
        .from('users')
        .delete()
        .eq('id', existingDemoUser.id);

      if (deleteError) {
        console.error('Failed to delete demo user:', deleteError);
        // Continue anyway - Supabase auth will handle duplicate email
      }
    }

    // Create user with Supabase Auth
    const { data: authData, error: authError } = await supabase.auth.admin.createUser({
      email,
      password,
      email_confirm: true, // Auto-confirm for now (can be changed later)
      user_metadata: {
        full_name: fullName || email.split('@')[0],
        areas_of_interest: areasOfInterest || []
      }
    });

    if (authError) {
      // Handle duplicate email error
      if (authError.message.includes('already been registered')) {
        return new Response(
          JSON.stringify({ error: 'This email is already registered. Please login instead.' }), 
          { status: 409, headers: { 'Content-Type': 'application/json' } }
        );
      }

      console.error('Auth error:', authError);
      return new Response(
        JSON.stringify({ error: authError.message }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Update public.users record (trigger should have created it, but ensure data is correct)
    const { error: updateError } = await supabase
      .from('users')
      .update({
        full_name: fullName || email.split('@')[0],
        areas_of_interest: areasOfInterest || [],
        is_demo: false
      })
      .eq('id', authData.user.id);

    if (updateError) {
      console.error('Failed to update user profile:', updateError);
      // Non-critical, continue
    }

    // Award welcome bonus (10 points) - already set as default in DB schema
    // But let's create a point transaction record for audit trail
    const { error: pointsError } = await supabase
      .from('point_transactions')
      .insert({
        user_id: authData.user.id,
        points: 10,
        type: 'earn',
        description: 'Welcome bonus - Sign up for EduLaluan',
        balance_after: 10
      });

    if (pointsError) {
      console.error('Failed to award welcome bonus:', pointsError);
      // Non-critical, continue
    }

    // Award "Welcome" badge
    const { data: welcomeBadge } = await supabase
      .from('badges')
      .select('id')
      .eq('slug', 'welcome')
      .single();

    if (welcomeBadge) {
      await supabase
        .from('user_badges')
        .insert({
          user_id: authData.user.id,
          badge_id: welcomeBadge.id,
          earned_at: new Date().toISOString(),
          context: { points: 10, tier: 1 }
        });
    }

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true, 
        message: 'Account created successfully!',
        user: {
          id: authData.user.id,
          email: authData.user.email,
          fullName: fullName || email.split('@')[0],
          pointsBalance: 10, // Welcome bonus
          tier: 1
        }
      }), 
      { status: 201, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('Signup error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
