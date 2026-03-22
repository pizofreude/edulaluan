// EduLaluan API: Submit Circumcision Experience
// POST /api/circumcision/submit
// Description: Handle circumcision experience submission

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    console.log('[Circumcision Submit API] Received submission request');

    const body = await request.json();
    const {
      displayName,
      isAnonymous,
      gender,
      method,
      methodOther,
      clinicName,
      location,
      practitionerName,
      clinicContact,
      experience,
    } = body;

    // Validation
    if (!gender || !method || !clinicName || !location || !experience) {
      return new Response(
        JSON.stringify({ error: 'Missing required fields' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    if (experience.length < 30) {
      return new Response(
        JSON.stringify({ error: 'Experience must be at least 30 characters' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    if (method === 'Other' && !methodOther?.trim()) {
      return new Response(
        JSON.stringify({ error: 'Please specify the custom method' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseSecretKey = import.meta.env.SUPABASE_SECRET_KEY || import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseSecretKey) {
      console.error('[Circumcision Submit API] Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseSecretKey);

    // Get user from auth header
    const authHeader = request.headers.get('Authorization');
    let userId: string | null = null;
    
    if (authHeader && authHeader.startsWith('Bearer ')) {
      const accessToken = authHeader.substring(7);
      const { data: { user } } = await supabase.auth.getUser(accessToken);
      
      if (user) {
        // Check if user exists in public.users table
        const { data: publicUser } = await supabase
          .from('users')
          .select('id')
          .eq('id', user.id)
          .single();
        
        // Only set userId if user exists in public.users
        userId = publicUser?.id || null;
        
        console.log('[Circumcision Submit API] User found:', !!publicUser, 'ID:', userId);
      }
    }

    // Prepare method value (convert to snake_case for database)
    const methodValue = method.toLowerCase()
      .replace(/\//g, '_')
      .replace(/ /g, '_');

    // Insert into circumcision_submissions table
    // Note: contribution_id is NULL for now - can be created later by moderation system
    const { data: submission, error: insertError } = await supabase
      .from('circumcision_submissions')
      .insert({
        user_id: userId,
        contribution_id: null, // Will be created by moderation system if approved
        display_name: isAnonymous ? 'Anonymous' : displayName,
        is_anonymous: isAnonymous || false,
        gender: gender.toLowerCase(),
        method: methodValue,
        method_other: method === 'Other' ? methodOther.trim() : null,
        clinic_name: clinicName.trim(),
        location: location.trim(),
        doctor_name: practitionerName?.trim() || null,
        contact_info: clinicContact?.trim() || null,
        experience_narrative: experience.trim(),
        status: 'pending',
      })
      .select()
      .single();

    if (insertError) {
      console.error('[Circumcision Submit API] Insert error:', insertError);
      return new Response(
        JSON.stringify({ error: insertError.message }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    console.log('[Circumcision Submit API] Submission created:', submission.id);

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: 'Submission received',
        submissionId: submission.id 
      }),
      { status: 201, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error) {
    console.error('[Circumcision Submit API] Unexpected error:', error);
    return new Response(
      JSON.stringify({ error: 'An unexpected error occurred' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
