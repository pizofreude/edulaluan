// EduLaluan API: Admin Settings
// GET /api/admin/settings - Get current settings
// PUT /api/admin/settings - Update settings (demo data toggle, etc.)

import type { APIRoute } from 'astro';
import { createClient } from '@supabase/supabase-js';

export const prerender = false;

// GET: Get admin settings
export const GET: APIRoute = async () => {
  try {
    // Initialize Supabase client (service role for admin access)
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseUrl || !supabaseServiceKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get current user and verify admin status
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }), 
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const { data: userData } = await supabase
      .from('users')
      .select('is_admin')
      .eq('id', user.id)
      .single();

    if (!userData || !userData.is_admin) {
      return new Response(
        JSON.stringify({ error: 'Admin access required' }), 
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Get current settings
    const { data: settings, error: fetchError } = await supabase
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
    const { count: demoUsersCount } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true })
      .eq('is_demo', true);

    const { count: pendingContributions } = await supabase
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

    // Initialize Supabase client (service role for admin access)
    const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
    const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseUrl || !supabaseServiceKey) {
      console.error('Missing Supabase credentials');
      return new Response(
        JSON.stringify({ error: 'Server configuration error' }), 
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get current user and verify admin status
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Authentication required' }), 
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const { data: userData } = await supabase
      .from('users')
      .select('is_admin')
      .eq('id', user.id)
      .single();

    if (!userData || !userData.is_admin) {
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
    const { error: updateError, data: updatedSettings } = await supabase
      .from('admin_settings')
      .update(updateData)
      .eq('id', (await supabase.from('admin_settings').select('id').single()).data?.id)
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
        await supabase
          .from('users')
          .update({ is_demo: false })
          .eq('is_demo', true);
      }
    }

    // Log audit event
    await supabase
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
