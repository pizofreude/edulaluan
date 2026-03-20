// EduLaluan API: Submit Contribution
// POST /api/contributions
// Description: Submit a new contribution (resource, financial_aid, feature_request, issue_report, circumcision)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { type, title, description, url, categoryId, metadata } = body;

    // Validation
    if (!type || !title) {
      return new Response(
        JSON.stringify({ error: 'Type and title are required' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Validate contribution type
    const validTypes = ['resource', 'financial_aid', 'feature_request', 'issue_report', 'circumcision'];
    if (!validTypes.includes(type)) {
      return new Response(
        JSON.stringify({ error: 'Invalid contribution type' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Validate description length
    if (description && description.length < 50) {
      return new Response(
        JSON.stringify({ error: 'Description must be at least 50 characters' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Initialize Supabase client
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseAnonKey = import.meta.env.PUBLIC_SUPABASE_ANON_KEY;
    
    if (!supabaseUrl || !supabaseAnonKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseAnonKey);

    // Get current user from session
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }), 
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get user tier and check submission limit
    const { data: userData } = await supabase
      .from('users')
      .select('tier, points_balance')
      .eq('id', user.id)
      .single();

    if (!userData) {
      return new Response(
        JSON.stringify({ error: 'User profile not found' }), 
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Check weekly submission limit
    const weekStart = new Date();
    const dayOfWeek = weekStart.getDay();
    const diff = weekStart.getDate() - dayOfWeek + (dayOfWeek === 0 ? -6 : 1); // Adjust to Monday
    weekStart.setDate(diff);
    weekStart.setHours(0, 0, 0, 0);

    const { data: weeklyLimit } = await supabase
      .from('weekly_submission_limits')
      .select('submission_count, tier_limit, cooldown_until')
      .eq('user_id', user.id)
      .eq('week_start', weekStart.toISOString().split('T')[0])
      .single();

    const submissionLimit = userData.tier === 1 ? 4 : userData.tier === 2 ? 6 : userData.tier === 3 ? 10 : 20;
    
    if (weeklyLimit && weeklyLimit.submission_count >= submissionLimit) {
      const cooldownUntil = new Date(weeklyLimit.cooldown_until);
      if (new Date() < cooldownUntil) {
        return new Response(
          JSON.stringify({ 
            error: 'Weekly submission limit reached',
            cooldownUntil: cooldownUntil.toISOString(),
            message: `You can submit again after ${cooldownUntil.toLocaleString()}`
          }), 
          { status: 429, headers: { 'Content-Type': 'application/json' } }
        );
      }
    }

    // Check for duplicate URL (for resource/financial_aid submissions)
    if (url && (type === 'resource' || type === 'financial_aid')) {
      const { data: existing } = await supabase
        .from('contributions')
        .select('id, status')
        .eq('url', url)
        .in('status', ['pending', 'approved'])
        .single();

      if (existing) {
        return new Response(
          JSON.stringify({ 
            error: 'This URL has already been submitted',
            existingId: existing.id,
            existingStatus: existing.status
          }), 
          { status: 409, headers: { 'Content-Type': 'application/json' } }
        );
      }
    }

    // Insert contribution
    const { data: contribution, error: insertError } = await supabase
      .from('contributions')
      .insert({
        user_id: user.id,
        type,
        title,
        description,
        url,
        category_id: categoryId,
        status: 'pending',
        metadata: metadata || {}
      })
      .select()
      .single();

    if (insertError) {
      console.error('Failed to insert contribution:', insertError);
      return new Response(
        JSON.stringify({ error: 'Failed to submit contribution' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        message: 'Contribution submitted successfully! It will be reviewed within 24-48 hours.',
        contribution: {
          id: contribution.id,
          type: contribution.type,
          title: contribution.title,
          status: contribution.status,
          submittedAt: contribution.submitted_at
        }
      }), 
      { status: 201, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('Contribution submission error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
