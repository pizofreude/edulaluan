// EduLaluan API: Submit Contribution
// POST /api/contributions
// Description: Submit a new contribution (resource, financial_aid, feature_request, issue_report, circumcision)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { type, title, description, url, categoryId, metadata, isAnonymous } = body;

    // Minimal validation
    if (!type || !title) {
      return new Response(JSON.stringify({ error: 'Type and title required' }), { status: 400 });
    }

    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;
    const supabaseServiceKey = import.meta.env.SUPABASE_SECRET_KEY;

    if (!supabaseUrl || !supabasePublishableKey || !supabaseServiceKey) {
      return new Response(JSON.stringify({ error: 'Missing credentials' }), { status: 500 });
    }

    // Get access token from Authorization header
    const authHeader = request.headers.get('authorization');
    let accessToken: string | null = null;

    if (authHeader && authHeader.startsWith('Bearer ')) {
      accessToken = authHeader.substring(7);
    }

    if (!accessToken) {
      return new Response(JSON.stringify({ error: 'Authentication required' }), { status: 401 });
    }

    // Get current user from access token
    const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey);
    const { data: { user }, error: userError } = await supabaseAdmin.auth.getUser(accessToken);

    if (userError || !user) {
      console.error('Failed to get user:', userError);
      return new Response(JSON.stringify({ error: 'Invalid or expired token' }), { status: 401 });
    }

    // DIRECT INSERT with user_id and is_anonymous flag
    const { data: contribution, error: insertError } = await supabaseAdmin.rpc('insert_contribution_direct', {
      p_user_id: user.id,
      p_type: type,
      p_title: title,
      p_description: description || null,
      p_url: url || null,
      p_metadata: metadata || {},
      p_is_anonymous: isAnonymous || false
    });

    if (insertError) {
      console.error('Insert error:', insertError);
      return new Response(JSON.stringify({ error: insertError.message }), { status: 500 });
    }

    return new Response(JSON.stringify({ success: true, id: contribution }), { status: 201 });

  } catch (error) {
    console.error('Error:', error);
    return new Response(JSON.stringify({ error: 'Server error' }), { status: 500 });
  }
};
