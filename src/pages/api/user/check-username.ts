// EduLaluan API: Check Username Availability
// POST /api/user/check-username
// Description: Validate username format and check if it's available

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';
import { validateUsername, generateSuggestions } from '../../../lib/username';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const { username } = await request.json();

    if (!username) {
      return new Response(
        JSON.stringify({ 
          available: false, 
          error: 'Username is required' 
        }), 
        { 
          status: 400, 
          headers: { 'Content-Type': 'application/json' } 
        }
      );
    }

    // Step 1: Client-side validation (format, length, reserved list)
    const validation = validateUsername(username);
    if (!validation.valid) {
      return new Response(
        JSON.stringify({ 
          available: false, 
          error: validation.error,
          suggestions: validation.suggestions 
        }), 
        { 
          status: 400, 
          headers: { 'Content-Type': 'application/json' } 
        }
      );
    }

    // Step 2: Database check for existing username
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SECRET_KEY || import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      console.error('[Check Username] Missing Supabase credentials');
      return new Response(
        JSON.stringify({ 
          available: false, 
          error: 'Server configuration error' 
        }), 
        { 
          status: 500, 
          headers: { 'Content-Type': 'application/json' } 
        }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Check if username exists (case-insensitive)
    const { data: existing, error: fetchError } = await supabase
      .from('users')
      .select('id, username')
      .ilike('username', username.trim())
      .single();

    if (fetchError && fetchError.code !== 'PGRST116') { // PGRST116 = not found
      console.error('[Check Username] Database error:', fetchError);
      return new Response(
        JSON.stringify({ 
          available: false, 
          error: 'Failed to check availability' 
        }), 
        { 
          status: 500, 
          headers: { 'Content-Type': 'application/json' } 
        }
      );
    }

    if (existing) {
      // Username is taken - generate suggestions
      const suggestions = generateSuggestions(username.trim(), 'taken');
      
      return new Response(
        JSON.stringify({ 
          available: false, 
          error: 'Username is already taken',
          suggestions,
          taken: true
        }), 
        { 
          status: 409, 
          headers: { 'Content-Type': 'application/json' } 
        }
      );
    }

    // Step 3: Check reserved usernames table (extra safety)
    const { data: reserved } = await supabase
      .from('reserved_usernames')
      .select('id, username, reason')
      .ilike('username', username.trim())
      .single();

    if (reserved) {
      return new Response(
        JSON.stringify({ 
          available: false, 
          error: `This username is reserved: ${reserved.reason || 'System reserved'}`,
          reserved: true
        }), 
        { 
          status: 403, 
          headers: { 'Content-Type': 'application/json' } 
        }
      );
    }

    // Username is available!
    return new Response(
      JSON.stringify({ 
        available: true, 
        username: username.trim().toLowerCase(),
        message: 'Username is available' 
      }), 
      { 
        status: 200, 
        headers: { 'Content-Type': 'application/json' } 
      }
    );

  } catch (error: any) {
    console.error('[Check Username] Unexpected error:', error);
    return new Response(
      JSON.stringify({ 
        available: false, 
        error: error.message || 'An unexpected error occurred' 
      }), 
      { 
        status: 500, 
        headers: { 'Content-Type': 'application/json' } 
      }
    );
  }
};
