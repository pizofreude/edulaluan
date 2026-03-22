// EduLaluan API: Admin Settings
// GET /api/admin/settings - Get current settings
// PUT /api/admin/settings - Update settings (demo data toggle, etc.)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

// GET: Get admin settings
export const GET: APIRoute = async ({ request }) => {
  try {
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabasePublishableKey || !supabaseServiceKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Try to get access token from cookies first (SSR flow)
    let accessToken: string | null = null;

    // Check for SSR cookie (sb-{project-ref}-auth-token)
    const cookieHeader = request.headers.get('cookie') || '';
    const projectRef = supabaseUrl.split('://')[1].split('.')[0];
    const ssrCookieName = `sb-${projectRef}-auth-token`;

    if (cookieHeader) {
      const cookieMatch = cookieHeader.match(new RegExp(`${ssrCookieName}=([^;]+)`));
      if (cookieMatch) {
        try {
          const cookieData = JSON.parse(decodeURIComponent(cookieMatch[1]));
          accessToken = cookieData?.access_token || null;
        } catch (e) {
          console.warn('Failed to parse SSR cookie:', e);
        }
      }
    }

    // If no SSR cookie, the client needs to send access token in Authorization header
    if (!accessToken) {
      const authHeader = request.headers.get('authorization');
      if (authHeader && authHeader.startsWith('Bearer ')) {
        accessToken = authHeader.substring(7);
      }
    }

    if (!accessToken) {
      console.error('No access token found in cookies or Authorization header');
      return new Response(
        JSON.stringify({ error: 'Authentication required - please log in again' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Use service role client to verify user and get role
    const adminSupabase = createClient(supabaseUrl, supabaseServiceKey);

    const { data: { user }, error: userError } = await adminSupabase.auth.getUser(accessToken);

    if (userError || !user) {
      console.error('Failed to get user:', userError);
      return new Response(
        JSON.stringify({ error: 'Invalid or expired token' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get user role
    const { data: userData, error: userRoleError } = await adminSupabase
      .from('users')
      .select('is_admin, role')
      .eq('id', user.id)
      .single();

    if (userRoleError || !userData) {
      console.error('Failed to get user role:', userRoleError);
      return new Response(
        JSON.stringify({ error: 'User profile not found' }),
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Check admin access
    if (!userData.is_admin) {
      return new Response(
        JSON.stringify({ error: 'Admin access required' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get current settings
    const { data: settings, error: fetchError } = await adminSupabase
      .from('admin_settings')
      .select('*')
      .single();

    if (fetchError) {
      console.error('Failed to fetch settings:', fetchError);
      return new Response(
        JSON.stringify({ error: 'Failed to fetch settings' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get additional stats
    const { count: demoUsersCount } = await adminSupabase
      .from('users')
      .select('*', { count: 'exact', head: true })
      .eq('is_demo', true);

    const { count: pendingContributions } = await adminSupabase
      .from('contributions')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'pending');

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        settings: {
          demoDataEnabled: settings?.demo_data_enabled ?? true,
          allowPublicContributions: settings?.allow_public_contributions ?? true,
          requireEmailVerification: settings?.require_email_verification ?? true,
          maintenanceMode: settings?.maintenance_mode ?? false
        },
        stats: {
          demoUsersCount: demoUsersCount || 0,
          pendingContributions: pendingContributions || 0
        }
      }), 
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error: any) {
    console.error('Get settings error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Failed to get settings' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};

// PUT: Update admin settings
export const PUT: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { demoDataEnabled, allowPublicContributions, requireEmailVerification, maintenanceMode } = body;

    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabasePublishableKey = import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabasePublishableKey || !supabaseServiceKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Try to get access token from cookies first (SSR flow)
    let accessToken: string | null = null;

    // Check for SSR cookie (sb-{project-ref}-auth-token)
    const cookieHeader = request.headers.get('cookie') || '';
    const projectRef = supabaseUrl.split('://')[1].split('.')[0];
    const ssrCookieName = `sb-${projectRef}-auth-token`;

    if (cookieHeader) {
      const cookieMatch = cookieHeader.match(new RegExp(`${ssrCookieName}=([^;]+)`));
      if (cookieMatch) {
        try {
          const cookieData = JSON.parse(decodeURIComponent(cookieMatch[1]));
          accessToken = cookieData?.access_token || null;
        } catch (e) {
          console.warn('Failed to parse SSR cookie:', e);
        }
      }
    }

    // If no SSR cookie, the client needs to send access token in Authorization header
    if (!accessToken) {
      const authHeader = request.headers.get('authorization');
      if (authHeader && authHeader.startsWith('Bearer ')) {
        accessToken = authHeader.substring(7);
      }
    }

    if (!accessToken) {
      console.error('No access token found in cookies or Authorization header');
      return new Response(
        JSON.stringify({ error: 'Authentication required - please log in again' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Use service role client to verify user and get role
    const adminSupabase = createClient(supabaseUrl, supabaseServiceKey);

    const { data: { user }, error: userError } = await adminSupabase.auth.getUser(accessToken);

    if (userError || !user) {
      console.error('Failed to get user:', userError);
      return new Response(
        JSON.stringify({ error: 'Invalid or expired token' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get user role
    const { data: userData, error: userRoleError } = await adminSupabase
      .from('users')
      .select('is_admin, role')
      .eq('id', user.id)
      .single();

    if (userRoleError || !userData) {
      console.error('Failed to get user role:', userRoleError);
      return new Response(
        JSON.stringify({ error: 'User profile not found' }),
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Check admin access
    if (!userData.is_admin) {
      return new Response(
        JSON.stringify({ error: 'Admin access required' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Build update object
    const updateData: Record<string, any> = {
      updated_at: new Date().toISOString(),
      updated_by: user.id
    };

    if (typeof demoDataEnabled === 'boolean') {
      updateData.demo_data_enabled = demoDataEnabled;
    }

    if (typeof allowPublicContributions === 'boolean') {
      updateData.allow_public_contributions = allowPublicContributions;
    }

    if (typeof requireEmailVerification === 'boolean') {
      updateData.require_email_verification = requireEmailVerification;
    }

    if (typeof maintenanceMode === 'boolean') {
      updateData.maintenance_mode = maintenanceMode;
    }

    // Check if there's anything to update
    if (Object.keys(updateData).length <= 2) { // Only updated_at and updated_by
      return new Response(
        JSON.stringify({ error: 'No settings provided to update' }), 
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Update settings
    const { error: updateError, data: updatedSettings } = await adminSupabase
      .from('admin_settings')
      .update(updateData)
      .eq('id', (await adminSupabase.from('admin_settings').select('id').single()).data?.id)
      .select()
      .single();

    if (updateError) {
      console.error('Failed to update settings:', updateError);
      return new Response(
        JSON.stringify({ error: 'Failed to update settings' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // If demo data toggle changed, handle demo users
    if (typeof demoDataEnabled === 'boolean') {
      if (!demoDataEnabled) {
        // Disable demo data - mark all demo users as inactive (soft delete)
        await adminSupabase
          .from('users')
          .update({ is_demo: false })
          .eq('is_demo', true);
      }
    }

    // Log audit event
    await adminSupabase
      .from('audit_logs')
      .insert({
        table_name: 'admin_settings',
        record_id: updatedSettings.id,
        action: 'UPDATE',
        new_value: updateData,
        user_id: user.id
      });

    // Success response
    return new Response(
      JSON.stringify({ 
        success: true,
        message: 'Settings updated successfully',
        settings: {
          demoDataEnabled: updatedSettings.demo_data_enabled,
          allowPublicContributions: updatedSettings.allow_public_contributions,
          requireEmailVerification: updatedSettings.require_email_verification,
          maintenanceMode: updatedSettings.maintenance_mode
        }
      }), 
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );

  } catch (error: any) {
    console.error('Update settings error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Failed to update settings' }), 
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
