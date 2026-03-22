import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';
import type { Database } from '../../types/supabase';

export const GET: APIRoute = async () => {
  const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
  const supabaseKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY || import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;

  if (!supabaseUrl || !supabaseKey) {
    return new Response(JSON.stringify({ error: 'Missing Supabase credentials' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }

  const supabase = createClient<Database>(supabaseUrl, supabaseKey);

  try {
    const { data, error } = await supabase
      .from('resources')
      .select(`
        *,
        category:categories(slug, name),
        cost_type:cost_types(slug, name),
        mode:delivery_modes(slug, name),
        income_groups:resource_income_groups(
          income_groups:income_groups(slug, name)
        ),
        education_levels:resource_education_levels(
          education_levels:education_levels(slug, name)
        ),
        languages:resource_languages(
          languages:languages(code, name)
        ),
        tags:resource_tags(
          tags:tags(slug, name)
        )
      `)
      .order('created_at', { ascending: false });

    if (error) throw error;

    return new Response(JSON.stringify({ data }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });
  } catch (error) {
    return new Response(JSON.stringify({ error: 'Failed to fetch resources' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
