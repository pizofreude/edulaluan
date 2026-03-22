-- EduLaluan Database Schema
-- Migration: 003_moderation.sql
-- Description: Admin notifications, user notifications, and moderation enhancements
-- Date: March 2026

-- =============================================
-- ADMIN NOTIFICATIONS TABLE
-- =============================================

CREATE TABLE IF NOT EXISTS admin_notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    type TEXT NOT NULL, -- 'new_contribution', 'urgent', 'system_alert', 'tier_demotion'
    contribution_id UUID REFERENCES contributions(id) ON DELETE SET NULL,
    user_id UUID REFERENCES public.users(id) ON DELETE SET NULL,
    priority TEXT DEFAULT 'normal', -- 'low', 'normal', 'high', 'urgent'
    title TEXT,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMPTZ,
    read_by UUID REFERENCES public.users(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_notification_priority CHECK (priority IN ('low', 'normal', 'high', 'urgent')),
    CONSTRAINT chk_notification_type CHECK (type IN ('new_contribution', 'urgent', 'system_alert', 'tier_demotion', 'user_report'))
);

-- Create indexes for notification queries
CREATE INDEX IF NOT EXISTS idx_admin_notifications_type ON admin_notifications(type);
CREATE INDEX IF NOT EXISTS idx_admin_notifications_priority ON admin_notifications(priority);
CREATE INDEX IF NOT EXISTS idx_admin_notifications_is_read ON admin_notifications(is_read);
CREATE INDEX IF NOT EXISTS idx_admin_notifications_created ON admin_notifications(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_admin_notifications_contribution ON admin_notifications(contribution_id);

-- =============================================
-- USER NOTIFICATIONS TABLE
-- =============================================

CREATE TABLE IF NOT EXISTS user_notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    type TEXT NOT NULL, -- 'contribution_approved', 'contribution_rejected', 'changes_requested', 'badge_earned', 'tier_promoted', 'welcome'
    contribution_id UUID REFERENCES contributions(id) ON DELETE SET NULL,
    badge_id UUID REFERENCES badges(id) ON DELETE SET NULL,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    link TEXT, -- Optional link to related content
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_user_notification_type CHECK (type IN (
        'contribution_approved', 
        'contribution_rejected', 
        'changes_requested', 
        'badge_earned', 
        'tier_promoted', 
        'welcome',
        'admin_invite'
    ))
);

-- Create indexes for user notification queries
CREATE INDEX IF NOT EXISTS idx_user_notifications_user ON user_notifications(user_id);
CREATE INDEX IF NOT EXISTS idx_user_notifications_type ON user_notifications(type);
CREATE INDEX IF NOT EXISTS idx_user_notifications_is_read ON user_notifications(is_read);
CREATE INDEX IF NOT EXISTS idx_user_notifications_created ON user_notifications(created_at DESC);

-- =============================================
-- MODERATION QUEUE VIEW (Helper for admin dashboard)
-- =============================================

CREATE OR REPLACE VIEW moderation_queue AS
SELECT 
    c.id,
    c.user_id,
    u.email as user_email,
    u.full_name as user_name,
    u.tier as user_tier,
    u.approval_rate as user_approval_rate,
    u.total_contributions as user_total_contributions,
    c.type,
    c.title,
    c.description,
    c.url,
    c.category_id,
    cat.name as category_name,
    c.status,
    c.points_earned,
    c.submitted_at,
    -- Auto-check flags
    EXISTS (
        SELECT 1 FROM resources r 
        WHERE r.url = c.url
    ) as is_duplicate_url,
    LENGTH(c.description) >= 50 as has_adequate_description,
    -- Priority calculation
    CASE 
        WHEN c.type = 'circumcision' THEN 'high'
        WHEN u.tier = 1 THEN 'normal'
        WHEN u.approval_rate >= 90 THEN 'low'
        ELSE 'normal'
    END as priority
FROM contributions c
JOIN public.users u ON c.user_id = u.id
LEFT JOIN categories cat ON c.category_id = cat.id
WHERE c.status = 'pending'
ORDER BY 
    CASE 
        WHEN c.type = 'circumcision' THEN 0
        WHEN u.tier = 1 THEN 1
        WHEN u.approval_rate >= 90 THEN 3
        ELSE 2
    END,
    c.submitted_at DESC;

-- =============================================
-- FUNCTIONS FOR NOTIFICATIONS
-- =============================================

-- Function to send admin notification
CREATE OR REPLACE FUNCTION send_admin_notification(
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
BEGIN
    INSERT INTO admin_notifications (type, message, priority, contribution_id, user_id, title)
    VALUES (p_type, p_message, p_priority, p_contribution_id, p_user_id, p_title)
    RETURNING id INTO notification_id;
    
    -- Update admin settings to increment pending count
    IF p_type = 'new_contribution' THEN
        -- Could add a counter column to admin_settings for quick badge display
        NULL;
    END IF;
    
    RETURN notification_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to send user notification
CREATE OR REPLACE FUNCTION send_user_notification(
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
BEGIN
    INSERT INTO user_notifications (user_id, type, title, message, link, contribution_id, badge_id)
    VALUES (p_user_id, p_type, p_title, p_message, p_link, p_contribution_id, p_badge_id)
    RETURNING id INTO notification_id;
    
    RETURN notification_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to notify on new contribution
CREATE OR REPLACE FUNCTION notify_new_contribution()
RETURNS TRIGGER AS $$
BEGIN
    -- Send admin notification
    PERFORM send_admin_notification(
        'new_contribution',
        FORMAT('New %s submission from %s: %s', 
               INITCAP(NEW.type),
               (SELECT email FROM public.users WHERE id = NEW.user_id),
               NEW.title),
        CASE 
            WHEN NEW.type = 'circumcision' THEN 'high'
            ELSE 'normal'
        END,
        NEW.id,
        NEW.user_id,
        FORMAT('New %s Submission', INITCAP(NEW.type))
    );
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to notify on contribution decision
CREATE OR REPLACE FUNCTION notify_contribution_decision()
RETURNS TRIGGER AS $$
DECLARE
    user_email TEXT;
    notification_type TEXT;
    notification_title TEXT;
    notification_message TEXT;
    notification_link TEXT;
BEGIN
    -- Only process status changes to approved/rejected/changes_requested
    IF (NEW.status = 'approved' AND (OLD.status IS NULL OR OLD.status != 'approved')) OR
       (NEW.status = 'rejected' AND OLD.status != 'rejected') OR
       (NEW.status = 'changes_requested' AND OLD.status != 'changes_requested') THEN
       
        -- Get user email
        SELECT email INTO user_email FROM public.users WHERE id = NEW.user_id;
        
        -- Determine notification type and message
        IF NEW.status = 'approved' THEN
            notification_type := 'contribution_approved';
            notification_title := 'Contribution Approved!';
            notification_message := FORMAT('Your %s submission "%s" has been approved. You earned %s points!',
                                          NEW.type, NEW.title, NEW.points_earned);
            notification_link := '/user/submissions';
        ELSIF NEW.status = 'rejected' THEN
            notification_type := 'contribution_rejected';
            notification_title := 'Contribution Update';
            notification_message := FORMAT('Your submission "%s" was rejected. Reason: %s',
                                          NEW.title, COALESCE(NEW.rejection_reason, 'See moderation notes'));
            notification_link := '/user/submissions';
        ELSIF NEW.status = 'changes_requested' THEN
            notification_type := 'changes_requested';
            notification_title := 'Changes Requested';
            notification_message := FORMAT('Your submission "%s" needs changes. Feedback: %s',
                                          NEW.title, COALESCE(NEW.moderation_notes, 'See details'));
            notification_link := '/user/submissions';
        END IF;
        
        -- Send user notification
        PERFORM send_user_notification(
            NEW.user_id,
            notification_type,
            notification_title,
            notification_message,
            notification_link,
            NEW.id
        );
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to notify on badge earned
CREATE OR REPLACE FUNCTION notify_badge_earned()
RETURNS TRIGGER AS $$
DECLARE
    badge_name TEXT;
    badge_description TEXT;
BEGIN
    -- Get badge details
    SELECT name, description INTO badge_name, badge_description
    FROM badges
    WHERE id = NEW.badge_id;
    
    -- Send user notification
    PERFORM send_user_notification(
        NEW.user_id,
        'badge_earned',
        'Badge Earned! 🏆',
        FORMAT('You earned the "%s" badge! %s', badge_name, badge_description),
        '/user/badges',
        NULL,
        NEW.badge_id
    );
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to log audit event (generic)
CREATE OR REPLACE FUNCTION log_audit_event(
    p_table_name TEXT,
    p_record_id UUID,
    p_action TEXT,
    p_old_value JSONB DEFAULT NULL,
    p_new_value JSONB DEFAULT NULL,
    p_user_id UUID DEFAULT NULL
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO audit_logs (table_name, record_id, action, old_value, new_value, user_id)
    VALUES (p_table_name, p_record_id, p_action, p_old_value, p_new_value, p_user_id);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to auto-cleanup old notifications (called via cron)
CREATE OR REPLACE FUNCTION cleanup_old_notifications()
RETURNS VOID AS $$
BEGIN
    -- Delete read notifications older than 90 days
    DELETE FROM admin_notifications
    WHERE is_read = TRUE AND created_at < NOW() - INTERVAL '90 days';
    
    DELETE FROM user_notifications
    WHERE is_read = TRUE AND created_at < NOW() - INTERVAL '90 days';
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- TRIGGERS
-- =============================================

-- Trigger to notify admins on new contribution
DROP TRIGGER IF EXISTS on_contribution_insert_notify_admin ON contributions;
CREATE TRIGGER on_contribution_insert_notify_admin
    AFTER INSERT ON contributions
    FOR EACH ROW
    EXECUTE FUNCTION notify_new_contribution();

-- Trigger to notify users on contribution decision
DROP TRIGGER IF EXISTS on_contribution_decision_notify_user ON contributions;
CREATE TRIGGER on_contribution_decision_notify_user
    AFTER UPDATE ON contributions
    FOR EACH ROW
    EXECUTE FUNCTION notify_contribution_decision();

-- Trigger to notify on badge earned
DROP TRIGGER IF EXISTS on_user_badge_insert_notify ON user_badges;
CREATE TRIGGER on_user_badge_insert_notify
    AFTER INSERT ON user_badges
    FOR EACH ROW
    EXECUTE FUNCTION notify_badge_earned();

-- =============================================
-- AUDIT TRIGGERS FOR CONTRIBUTIONS
-- =============================================

-- Function to audit contribution changes
CREATE OR REPLACE FUNCTION audit_contribution_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        PERFORM log_audit_event('contributions', NEW.id, 'INSERT', NULL, to_jsonb(NEW), NEW.user_id);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        PERFORM log_audit_event('contributions', NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW), auth.uid());
        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        PERFORM log_audit_event('contributions', OLD.id, 'DELETE', to_jsonb(OLD), NULL, auth.uid());
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to audit contribution changes
DROP TRIGGER IF EXISTS on_contribution_audit ON contributions;
CREATE TRIGGER on_contribution_audit
    AFTER INSERT OR UPDATE OR DELETE ON contributions
    FOR EACH ROW
    EXECUTE FUNCTION audit_contribution_changes();

-- =============================================
-- ROW LEVEL SECURITY (RLS)
-- =============================================

-- Enable RLS on admin_notifications
ALTER TABLE admin_notifications ENABLE ROW LEVEL SECURITY;

-- Only admins/moderators can view admin notifications
CREATE POLICY "Admins can view admin notifications" ON admin_notifications
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND (is_admin = TRUE OR is_moderator = TRUE)
        )
    );

-- Only admins can update admin notifications (mark as read)
CREATE POLICY "Admins can update admin notifications" ON admin_notifications
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- System can insert admin notifications (via SECURITY DEFINER functions)
CREATE POLICY "System can insert admin notifications" ON admin_notifications
    FOR INSERT
    WITH CHECK (TRUE);

-- Enable RLS on user_notifications
ALTER TABLE user_notifications ENABLE ROW LEVEL SECURITY;

-- Users can view their own notifications
CREATE POLICY "Users can view own notifications" ON user_notifications
    FOR SELECT
    USING (auth.uid() = user_id);

-- Users can update their own notifications (mark as read)
CREATE POLICY "Users can update own notifications" ON user_notifications
    FOR UPDATE
    USING (auth.uid() = user_id);

-- System can insert user notifications
CREATE POLICY "System can insert user notifications" ON user_notifications
    FOR INSERT
    WITH CHECK (TRUE);

-- =============================================
-- COMMENTS
-- =============================================

COMMENT ON TABLE admin_notifications IS 'Notifications for admins/moderators';
COMMENT ON TABLE user_notifications IS 'Notifications for regular users';
COMMENT ON VIEW moderation_queue IS 'Helper view for admin dashboard moderation queue';
COMMENT ON FUNCTION send_admin_notification IS 'Create admin notification with proper priority';
COMMENT ON FUNCTION send_user_notification IS 'Create user notification';
