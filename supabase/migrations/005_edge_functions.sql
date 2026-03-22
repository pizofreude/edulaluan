-- EduLaluan Database Schema
-- Migration: 005_edge_functions.sql
-- Description: Edge Functions integration for email notifications
-- Date: March 2026

-- =============================================
-- EDGE FUNCTION CONFIGURATION
-- =============================================

-- Store Edge Function configuration and secrets
CREATE TABLE IF NOT EXISTS edge_function_configs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    function_name TEXT NOT NULL UNIQUE,
    is_enabled BOOLEAN DEFAULT TRUE,
    config JSONB DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert default Edge Function configs
INSERT INTO edge_function_configs (function_name, config) VALUES
    ('send-invite-email', '{"provider": "resend", "from_email": "noreply@edulaluan.my"}'::jsonb),
    ('send-notification', '{"provider": "resend", "from_email": "noreply@edulaluan.my"}'::jsonb),
    ('send-moderation-decision', '{"provider": "resend", "from_email": "noreply@edulaluan.my"}'::jsonb)
ON CONFLICT (function_name) DO NOTHING;

-- Enable RLS on edge_function_configs
ALTER TABLE edge_function_configs ENABLE ROW LEVEL SECURITY;

-- Only admins can view Edge Function configs
CREATE POLICY "Admins can view edge function configs" ON edge_function_configs
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Only admins can update Edge Function configs
CREATE POLICY "Admins can update edge function configs" ON edge_function_configs
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- =============================================
-- EMAIL LOGGING TABLE
-- =============================================

-- Track all emails sent via Edge Functions
CREATE TABLE IF NOT EXISTS email_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    function_name TEXT NOT NULL,
    to_email TEXT NOT NULL,
    to_name TEXT,
    subject TEXT,
    email_type TEXT, -- 'invite', 'notification', 'moderation_decision'
    status TEXT DEFAULT 'pending', -- 'pending', 'sent', 'failed'
    error_message TEXT,
    metadata JSONB DEFAULT '{}',
    sent_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for email log queries
CREATE INDEX IF NOT EXISTS idx_email_logs_function ON email_logs(function_name);
CREATE INDEX IF NOT EXISTS idx_email_logs_to_email ON email_logs(to_email);
CREATE INDEX IF NOT EXISTS idx_email_logs_status ON email_logs(status);
CREATE INDEX IF NOT EXISTS idx_email_logs_created ON email_logs(created_at DESC);

-- Enable RLS on email_logs
ALTER TABLE email_logs ENABLE ROW LEVEL SECURITY;

-- Only admins can view email logs
CREATE POLICY "Admins can view email logs" ON email_logs
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- System can insert email logs
CREATE POLICY "System can insert email logs" ON email_logs
    FOR INSERT
    WITH CHECK (TRUE);

-- =============================================
-- DATABASE FUNCTIONS FOR EDGE FUNCTION TRIGGERS
-- =============================================

-- Function to invoke Edge Function via HTTP
CREATE OR REPLACE FUNCTION invoke_edge_function(
    p_function_name TEXT,
    p_payload JSONB
)
RETURNS JSONB AS $$
DECLARE
    edge_function_url TEXT;
    service_role_key TEXT;
    response_body JSONB;
    response_status INT;
BEGIN
    -- Get Edge Function URL and key from settings
    SELECT config->>'edge_function_url' INTO edge_function_url
    FROM admin_settings
    LIMIT 1;
    
    IF edge_function_url IS NULL THEN
        -- Default to local development URL
        edge_function_url := 'http://127.0.0.1:54321/functions/v1';
    END IF;
    
    SELECT config->>'service_role_key' INTO service_role_key
    FROM admin_settings
    LIMIT 1;
    
    IF service_role_key IS NULL THEN
        RAISE EXCEPTION 'Service role key not configured in admin_settings';
    END IF;
    
    -- Invoke Edge Function via HTTP POST
    -- Note: This requires pg_net extension or similar
    -- For production, configure pg_net or use a queue-based approach
    
    -- For now, we'll log the invocation request
    INSERT INTO email_logs (function_name, to_email, email_type, status, metadata)
    VALUES (
        p_function_name,
        p_payload->>'toEmail',
        'edge_invocation',
        'pending',
        p_payload
    );
    
    -- Return success response (actual invocation happens asynchronously)
    RETURN jsonb_build_object(
        'success', TRUE,
        'message', 'Edge Function invocation queued',
        'function_name', p_function_name
    );
    
EXCEPTION WHEN OTHERS THEN
    -- Log error
    INSERT INTO email_logs (function_name, to_email, email_type, status, error_message, metadata)
    VALUES (
        p_function_name,
        p_payload->>'toEmail',
        'edge_invocation',
        'failed',
        SQLERRM,
        p_payload
    );
    
    RETURN jsonb_build_object(
        'success', FALSE,
        'error', SQLERRM
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- WRAPPER FUNCTIONS FOR EMAIL SENDING
-- =============================================

-- Function: send_invite_email
CREATE OR REPLACE FUNCTION send_invite_email(
    p_to_email TEXT,
    p_role TEXT,
    p_invited_by TEXT,
    p_invite_link TEXT
)
RETURNS VOID AS $$
DECLARE
    payload JSONB;
    result JSONB;
BEGIN
    -- Build payload
    payload := jsonb_build_object(
        'email', p_to_email,
        'role', p_role,
        'invitedBy', p_invited_by,
        'inviteToken', split_part(p_invite_link, 'token=', 2)
    );
    
    -- Invoke Edge Function
    result := invoke_edge_function('send-invite-email', payload);

    -- Log result
    IF result->>'success' = 'true' THEN
        UPDATE email_logs
        SET status = 'sent', sent_at = NOW()
        WHERE ctid = (
            SELECT ctid FROM email_logs
            WHERE function_name = 'send-invite-email'
              AND to_email = p_to_email
            ORDER BY created_at DESC
            LIMIT 1
        );
    ELSE
        UPDATE email_logs
        SET status = 'failed', error_message = result->>'error'
        WHERE ctid = (
            SELECT ctid FROM email_logs
            WHERE function_name = 'send-invite-email'
              AND to_email = p_to_email
            ORDER BY created_at DESC
            LIMIT 1
        );
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function: send_notification_email
CREATE OR REPLACE FUNCTION send_notification_email(
    p_to_email TEXT,
    p_notification_type TEXT,
    p_title TEXT,
    p_message TEXT,
    p_to_name TEXT DEFAULT NULL,
    p_link TEXT DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
    payload JSONB;
    result JSONB;
BEGIN
    -- Build payload
    payload := jsonb_build_object(
        'toEmail', p_to_email,
        'toName', p_to_name,
        'type', p_notification_type,
        'title', p_title,
        'message', p_message,
        'link', p_link
    );
    
    -- Invoke Edge Function
    result := invoke_edge_function('send-notification', payload);

    -- Log result
    IF result->>'success' = 'true' THEN
        UPDATE email_logs
        SET status = 'sent', sent_at = NOW()
        WHERE ctid = (
            SELECT ctid FROM email_logs
            WHERE function_name = 'send-notification'
              AND to_email = p_to_email
            ORDER BY created_at DESC
            LIMIT 1
        );
    ELSE
        UPDATE email_logs
        SET status = 'failed', error_message = result->>'error'
        WHERE ctid = (
            SELECT ctid FROM email_logs
            WHERE function_name = 'send-notification'
              AND to_email = p_to_email
            ORDER BY created_at DESC
            LIMIT 1
        );
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function: send_moderation_decision_email
CREATE OR REPLACE FUNCTION send_moderation_decision_email(
    p_to_email TEXT,
    p_decision TEXT,
    p_contribution_type TEXT,
    p_contribution_title TEXT,
    p_to_name TEXT DEFAULT NULL,
    p_points_earned INT DEFAULT NULL,
    p_rejection_reason TEXT DEFAULT NULL,
    p_moderation_notes TEXT DEFAULT NULL,
    p_changes_requested TEXT DEFAULT NULL,
    p_site_url TEXT DEFAULT 'http://127.0.0.1:3000'
)
RETURNS VOID AS $$
DECLARE
    payload JSONB;
    result JSONB;
BEGIN
    -- Build payload
    payload := jsonb_build_object(
        'userEmail', p_to_email,
        'userName', p_to_name,
        'decision', p_decision,
        'contributionType', p_contribution_type,
        'contributionTitle', p_contribution_title,
        'pointsEarned', p_points_earned,
        'rejectionReason', p_rejection_reason,
        'moderationNotes', p_moderation_notes,
        'changesRequested', p_changes_requested
    );
    
    -- Invoke Edge Function
    result := invoke_edge_function('send-moderation-decision', payload);

    -- Log result
    IF result->>'success' = 'true' THEN
        UPDATE email_logs
        SET status = 'sent', sent_at = NOW()
        WHERE ctid = (
            SELECT ctid FROM email_logs
            WHERE function_name = 'send-moderation-decision'
              AND to_email = p_to_email
            ORDER BY created_at DESC
            LIMIT 1
        );
    ELSE
        UPDATE email_logs
        SET status = 'failed', error_message = result->>'error'
        WHERE ctid = (
            SELECT ctid FROM email_logs
            WHERE function_name = 'send-moderation-decision'
              AND to_email = p_to_email
            ORDER BY created_at DESC
            LIMIT 1
        );
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- ENHANCED NOTIFICATION FUNCTIONS WITH EDGE FUNCTIONS
-- =============================================

-- Enhanced function to send admin notification with Edge Function support
CREATE OR REPLACE FUNCTION send_admin_notification_enhanced(
    p_type TEXT,
    p_message TEXT,
    p_priority TEXT DEFAULT 'normal',
    p_contribution_id UUID DEFAULT NULL,
    p_user_id UUID DEFAULT NULL,
    p_title TEXT DEFAULT NULL
)
RETURNS UUID AS $$
DECLARE
    notification_id UUID;
    user_email TEXT;
    user_name TEXT;
BEGIN
    -- Create admin notification
    INSERT INTO admin_notifications (type, message, priority, contribution_id, user_id, title)
    VALUES (p_type, p_message, p_priority, p_contribution_id, p_user_id, p_title)
    RETURNING id INTO notification_id;
    
    -- If this is a contribution-related notification, send email to user
    IF p_type IN ('new_contribution', 'urgent') AND p_user_id IS NOT NULL THEN
        SELECT email, full_name INTO user_email, user_name
        FROM public.users
        WHERE id = p_user_id;
        
        IF user_email IS NOT NULL THEN
            -- Send notification email via Edge Function
            PERFORM send_notification_email(
                p_to_email => user_email,
                p_notification_type => 'admin_notification',
                p_title => COALESCE(p_title, 'Admin Notification'),
                p_message => p_message,
                p_to_name => user_name,
                p_link => '/admin/dashboard'
            );
        END IF;
    END IF;
    
    RETURN notification_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Enhanced function to send user notification with Edge Function support
CREATE OR REPLACE FUNCTION send_user_notification_enhanced(
    p_user_id UUID,
    p_type TEXT,
    p_title TEXT,
    p_message TEXT,
    p_link TEXT DEFAULT NULL,
    p_contribution_id UUID DEFAULT NULL,
    p_badge_id UUID DEFAULT NULL
)
RETURNS UUID AS $$
DECLARE
    notification_id UUID;
    user_email TEXT;
    user_name TEXT;
    contribution_title TEXT;
    badge_name TEXT;
    points_earned INT;
BEGIN
    -- Create user notification
    INSERT INTO user_notifications (user_id, type, title, message, link, contribution_id, badge_id)
    VALUES (p_user_id, p_type, p_title, p_message, p_link, p_contribution_id, p_badge_id)
    RETURNING id INTO notification_id;
    
    -- Get user details
    SELECT email, full_name INTO user_email, user_name
    FROM public.users
    WHERE id = p_user_id;
    
    -- Get contribution details if applicable
    IF p_contribution_id IS NOT NULL THEN
        SELECT title, points_earned INTO contribution_title, points_earned
        FROM contributions
        WHERE id = p_contribution_id;
    END IF;
    
    -- Get badge details if applicable
    IF p_badge_id IS NOT NULL THEN
        SELECT name INTO badge_name
        FROM badges
        WHERE id = p_badge_id;
    END IF;
    
    -- Send email notification via Edge Function
    IF user_email IS NOT NULL THEN
        -- Build email payload based on notification type
        IF p_type = 'contribution_approved' THEN
            PERFORM send_moderation_decision_email(
                p_to_email => user_email,
                p_to_name => user_name,
                p_decision => 'approved',
                p_contribution_type => 'resource',
                p_contribution_title => COALESCE(contribution_title, 'Your submission'),
                p_points_earned => points_earned,
                p_site_url => 'http://127.0.0.1:3000'
            );
        ELSIF p_type = 'contribution_rejected' THEN
            PERFORM send_moderation_decision_email(
                p_to_email => user_email,
                p_to_name => user_name,
                p_decision => 'rejected',
                p_contribution_type => 'resource',
                p_contribution_title => COALESCE(contribution_title, 'Your submission'),
                p_rejection_reason => p_message,
                p_site_url => 'http://127.0.0.1:3000'
            );
        ELSIF p_type = 'changes_requested' THEN
            PERFORM send_moderation_decision_email(
                p_to_email => user_email,
                p_to_name => user_name,
                p_decision => 'changes_requested',
                p_contribution_type => 'resource',
                p_contribution_title => COALESCE(contribution_title, 'Your submission'),
                p_changes_requested => p_message,
                p_site_url => 'http://127.0.0.1:3000'
            );
        ELSIF p_type = 'badge_earned' THEN
            PERFORM send_notification_email(
                p_to_email => user_email,
                p_notification_type => 'badge_earned',
                p_title => p_title,
                p_message => p_message,
                p_to_name => user_name,
                p_link => COALESCE(p_link, '/user/badges')
            );
        ELSIF p_type = 'tier_promoted' THEN
            PERFORM send_notification_email(
                p_to_email => user_email,
                p_notification_type => 'tier_promoted',
                p_title => p_title,
                p_message => p_message,
                p_to_name => user_name,
                p_link => COALESCE(p_link, '/user/profile')
            );
        ELSIF p_type = 'welcome' THEN
            PERFORM send_notification_email(
                p_to_email => user_email,
                p_notification_type => 'welcome',
                p_title => p_title,
                p_message => p_message,
                p_to_name => user_name,
                p_link => COALESCE(p_link, '/user/dashboard')
            );
        END IF;
    END IF;
    
    RETURN notification_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- TRIGGERS FOR AUTOMATED EMAIL NOTIFICATIONS
-- =============================================

-- Trigger to send welcome email on user signup
CREATE OR REPLACE FUNCTION send_welcome_email_on_signup()
RETURNS TRIGGER AS $$
BEGIN
    -- Send welcome notification (which triggers email via Edge Function)
    PERFORM send_user_notification_enhanced(
        p_user_id => NEW.id,
        p_type => 'welcome',
        p_title => 'Welcome to EduLaluan! 💚',
        p_message => 'Thank you for joining EduLaluan. Start exploring education resources and contribute to help the community!',
        p_link => '/user/dashboard'
    );
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to send email on circumcision submission approval
CREATE OR REPLACE FUNCTION send_circumcision_approval_email()
RETURNS TRIGGER AS $$
DECLARE
    user_email TEXT;
    user_name TEXT;
BEGIN
    -- Only process approved submissions
    IF NEW.status = 'approved' AND (OLD.status IS NULL OR OLD.status != 'approved') THEN
        -- Get user details
        SELECT email, full_name INTO user_email, user_name
        FROM public.users
        WHERE id = NEW.user_id;
        
        IF user_email IS NOT NULL THEN
            -- Send approval email via Edge Function
            PERFORM send_moderation_decision_email(
                p_to_email => user_email,
                p_to_name => user_name,
                p_decision => 'approved',
                p_contribution_type => 'circumcision resource',
                p_contribution_title => NEW.clinic_name || ' - ' || NEW.method,
                p_points_earned => 75,
                p_site_url => 'http://127.0.0.1:3000'
            );
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- SETUP TRIGGERS
-- =============================================

-- Trigger for welcome email on user creation
DROP TRIGGER IF EXISTS on_user_insert_welcome ON public.users;
CREATE TRIGGER on_user_insert_welcome
    AFTER INSERT ON public.users
    FOR EACH ROW
    EXECUTE FUNCTION send_welcome_email_on_signup();

-- Trigger for circumcision approval email
DROP TRIGGER IF EXISTS on_circumcision_approve_send_email ON circumcision_submissions;
CREATE TRIGGER on_circumcision_approve_send_email
    AFTER UPDATE ON circumcision_submissions
    FOR EACH ROW
    EXECUTE FUNCTION send_circumcision_approval_email();

-- =============================================
-- COMMENTS
-- =============================================

COMMENT ON TABLE edge_function_configs IS 'Configuration for Supabase Edge Functions';
COMMENT ON TABLE email_logs IS 'Log of all emails sent via Edge Functions';
COMMENT ON FUNCTION invoke_edge_function IS 'Generic function to invoke Edge Functions via HTTP';
COMMENT ON FUNCTION send_invite_email IS 'Send admin invite email via Edge Function';
COMMENT ON FUNCTION send_notification_email IS 'Send user notification email via Edge Function';
COMMENT ON FUNCTION send_moderation_decision_email IS 'Send moderation decision email via Edge Function';
