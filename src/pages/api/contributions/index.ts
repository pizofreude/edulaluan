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

    // Minimal validation
    if (!type || !title) {
      return new Response(JSON.stringify({ error: 'Type and title required' }), { status: 400 });
    }

    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SECRET_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(JSON.stringify({ error: 'Missing credentials' }), { status: 500 });
    }

    const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey);

    // DIRECT INSERT - No function calls, no triggers
    const { data: contribution, error: insertError } = await supabaseAdmin.rpc('insert_contribution_direct', {
      p_type: type,
      p_title: title,
      p_description: description || null,
      p_url: url || null,
      p_metadata: metadata || {}
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
