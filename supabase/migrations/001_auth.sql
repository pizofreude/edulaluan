-- EduLaluan Database Schema
-- Migration: 001_auth.sql
-- Description: User authentication, admin settings, admin invites, and 2FA support
-- Date: March 2026

-- =============================================
-- USERS TABLE (Public profile extending auth.users)
-- =============================================

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL UNIQUE,
    full_name TEXT,
    avatar_url TEXT,
    areas_of_interest TEXT[] DEFAULT '{}',
    points_balance INTEGER DEFAULT 10, -- Welcome bonus
    tier INTEGER DEFAULT 1, -- 1=Newcomer, 2=Regular, 3=Champion, 4=Leader
    rejection_count INTEGER DEFAULT 0,
    total_contributions INTEGER DEFAULT 0,
    total_submissions INTEGER DEFAULT 0,
    approval_rate NUMERIC(5,2) DEFAULT 0,
    is_demo BOOLEAN DEFAULT FALSE,
    is_admin BOOLEAN DEFAULT FALSE,
    is_moderator BOOLEAN DEFAULT FALSE,
    two_factor_enabled BOOLEAN DEFAULT FALSE,
    two_factor_backup_codes TEXT[], -- Hashed backup codes
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    last_login_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_points_balance CHECK (points_balance >= 0),
    CONSTRAINT chk_tier CHECK (tier BETWEEN 1 AND 4),
    CONSTRAINT chk_rejection_count CHECK (rejection_count >= 0),
    CONSTRAINT chk_approval_rate CHECK (approval_rate BETWEEN 0 AND 100)
);

-- Create index for user searches
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_tier ON users(tier);
CREATE INDEX IF NOT EXISTS idx_users_points ON users(points_balance DESC);
CREATE INDEX IF NOT EXISTS idx_users_is_demo ON users(is_demo);

-- =============================================
-- ADMIN SETTINGS TABLE
-- =============================================

CREATE TABLE IF NOT EXISTS admin_settings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    demo_data_enabled BOOLEAN DEFAULT TRUE,
    allow_public_contributions BOOLEAN DEFAULT TRUE,
    require_email_verification BOOLEAN DEFAULT TRUE,
    maintenance_mode BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    updated_by UUID REFERENCES users(id)
);

-- Insert default admin settings
INSERT INTO admin_settings (demo_data_enabled, allow_public_contributions, require_email_verification)
VALUES (TRUE, TRUE, TRUE)
ON CONFLICT DO NOTHING;

-- =============================================
-- ADMIN INVITES TABLE
-- =============================================

CREATE TABLE IF NOT EXISTS admin_invites (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT NOT NULL UNIQUE,
    token TEXT NOT NULL UNIQUE,
    role TEXT NOT NULL DEFAULT 'admin', -- 'admin' or 'moderator'
    permissions TEXT[] DEFAULT '{moderate_submissions,manage_users,view_analytics}',
    invited_by UUID REFERENCES users(id),
    invited_at TIMESTAMPTZ DEFAULT NOW(),
    expires_at TIMESTAMPTZ NOT NULL,
    used_at TIMESTAMPTZ,
    used_by_user_id UUID REFERENCES users(id),
    status TEXT DEFAULT 'pending', -- 'pending', 'used', 'expired', 'revoked'
    
    -- Constraints
    CONSTRAINT chk_invite_status CHECK (status IN ('pending', 'used', 'expired', 'revoked')),
    CONSTRAINT chk_invite_expiry CHECK (expires_at > invited_at)
);

-- Create index for invite lookups
CREATE INDEX IF NOT EXISTS idx_admin_invites_token ON admin_invites(token);
CREATE INDEX IF NOT EXISTS idx_admin_invites_email ON admin_invites(email);
CREATE INDEX IF NOT EXISTS idx_admin_invites_status ON admin_invites(status);

-- =============================================
-- FUNCTIONS AND TRIGGERS
-- =============================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to auto-create public.users record when auth.users is created
CREATE OR REPLACE FUNCTION create_public_user_record()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.users (id, email, full_name, avatar_url)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1)),
        COALESCE(NEW.raw_user_meta_data->>'avatar_url', NULL)
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create public.users record on auth.users insert
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION create_public_user_record();

-- Function to check and delete demo user on conflict
CREATE OR REPLACE FUNCTION check_and_delete_demo_user()
RETURNS TRIGGER AS $$
DECLARE
    demo_user_id UUID;
BEGIN
    -- Check if there's a demo user with the same email
    SELECT id INTO demo_user_id
    FROM public.users
    WHERE email = NEW.email AND is_demo = TRUE;
    
    -- If demo user exists, delete it
    IF demo_user_id IS NOT NULL THEN
        -- Delete the auth.users record (will cascade to public.users)
        DELETE FROM auth.users WHERE id = demo_user_id;
        
        -- Log the deletion
        INSERT INTO audit_logs (table_name, record_id, action, old_value, new_value, user_id)
        VALUES ('users', demo_user_id, 'demo_user_deleted', 
                row_to_json(NEW), NULL, NEW.id);
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to update user stats after contribution
CREATE OR REPLACE FUNCTION update_user_stats()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' AND NEW.status = 'approved' THEN
        UPDATE public.users
        SET 
            points_balance = points_balance + NEW.points_earned,
            total_contributions = total_contributions + 1,
            total_submissions = total_submissions + 1,
            approval_rate = CASE 
                WHEN total_submissions + 1 > 0 
                THEN ((approval_rate * total_submissions) + 100) / (total_submissions + 1)
                ELSE 100
            END
        WHERE id = NEW.user_id;
    ELSIF TG_OP = 'INSERT' AND NEW.status = 'rejected' THEN
        UPDATE public.users
        SET 
            total_submissions = total_submissions + 1,
            rejection_count = rejection_count + 1,
            approval_rate = CASE 
                WHEN total_submissions + 1 > 0 
                THEN (approval_rate * total_submissions) / (total_submissions + 1)
                ELSE 0
            END
        WHERE id = NEW.user_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to check tier eligibility
CREATE OR REPLACE FUNCTION check_tier_eligibility(p_user_id UUID)
RETURNS INTEGER AS $$
DECLARE
    user_points INTEGER;
    user_contributions INTEGER;
    user_approval_rate NUMERIC;
    user_months_active INTEGER;
    current_tier INTEGER;
BEGIN
    SELECT points_balance, total_contributions, approval_rate,
           EXTRACT(MONTH FROM AGE(NOW(), created_at))::INTEGER
    INTO user_points, user_contributions, user_approval_rate, user_months_active
    FROM public.users
    WHERE id = p_user_id;
    
    current_tier := 1;
    
    -- Tier 4: Community Leader (2001+ points, 2+ years, 90%+ approval, admin approval needed)
    IF user_points >= 2001 AND user_months_active >= 24 AND user_approval_rate >= 90 THEN
        current_tier := 4;
    -- Tier 3: Community Champion (501+ points, 6+ months, 85%+ approval)
    ELSIF user_points >= 501 AND user_months_active >= 6 AND user_approval_rate >= 85 THEN
        current_tier := 3;
    -- Tier 2: Regular Contributor (101+ points)
    ELSIF user_points >= 101 THEN
        current_tier := 2;
    END IF;
    
    RETURN current_tier;
END;
$$ LANGUAGE plpgsql;

-- Function to check tier demotion
CREATE OR REPLACE FUNCTION check_tier_demotion(p_user_id UUID)
RETURNS VOID AS $$
DECLARE
    user_rejection_rate NUMERIC;
    user_current_tier INTEGER;
    new_tier INTEGER;
BEGIN
    SELECT rejection_count::NUMERIC / NULLIF(total_submissions, 0) * 100,
           tier
    INTO user_rejection_rate, user_current_tier
    FROM public.users
    WHERE id = p_user_id;
    
    -- If rejection rate > 30%, demote one tier
    IF user_rejection_rate > 30 AND user_current_tier > 1 THEN
        new_tier := user_current_tier - 1;
        
        UPDATE public.users
        SET tier = new_tier
        WHERE id = p_user_id;
        
        -- Log the demotion
        INSERT INTO admin_notifications (type, message, priority)
        VALUES ('tier_demotion', 
                FORMAT('User %s demoted from Tier %s to Tier %s due to high rejection rate', 
                       p_user_id, user_current_tier, new_tier),
                'normal');
    END IF;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- ROW LEVEL SECURITY (RLS)
-- =============================================

-- Enable RLS on users table
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Users can view their own profile
CREATE POLICY "Users can view own profile" ON public.users
    FOR SELECT
    USING (auth.uid() = id);

-- Users can update their own profile
CREATE POLICY "Users can update own profile" ON public.users
    FOR UPDATE
    USING (auth.uid() = id);

-- Public can view basic user info (for leaderboards, etc.)
CREATE POLICY "Public can view basic user info" ON public.users
    FOR SELECT
    USING (TRUE);

-- Only admins can view all users
CREATE POLICY "Admins can view all users" ON public.users
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Only admins can update user roles
CREATE POLICY "Admins can update user roles" ON public.users
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Enable RLS on admin_settings table
ALTER TABLE public.admin_settings ENABLE ROW LEVEL SECURITY;

-- Only admins can view admin settings
CREATE POLICY "Admins can view admin settings" ON public.admin_settings
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Only admins can update admin settings
CREATE POLICY "Admins can update admin settings" ON public.admin_settings
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Enable RLS on admin_invites table
ALTER TABLE public.admin_invites ENABLE ROW LEVEL SECURITY;

-- Only admins can view invites
CREATE POLICY "Admins can view invites" ON public.admin_invites
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Only admins can create invites
CREATE POLICY "Admins can create invites" ON public.admin_invites
    FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Users can view their own invite (by email match)
CREATE POLICY "Users can view own invite" ON public.admin_invites
    FOR SELECT
    USING (email = (SELECT email FROM auth.users WHERE id = auth.uid()));

-- =============================================
-- AUDIT LOGS TABLE (Created here for trigger dependency)
-- =============================================

CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    table_name TEXT NOT NULL,
    record_id UUID NOT NULL,
    action TEXT NOT NULL, -- 'INSERT', 'UPDATE', 'DELETE'
    old_value JSONB,
    new_value JSONB,
    user_id UUID REFERENCES users(id),
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create index for audit log queries
CREATE INDEX IF NOT EXISTS idx_audit_logs_table ON audit_logs(table_name);
CREATE INDEX IF NOT EXISTS idx_audit_logs_record ON audit_logs(record_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created ON audit_logs(created_at DESC);

-- Enable RLS on audit_logs
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- Only admins can view audit logs
CREATE POLICY "Admins can view audit logs" ON audit_logs
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- =============================================
-- COMMENTS
-- =============================================

COMMENT ON TABLE public.users IS 'User profiles extending Supabase auth.users';
COMMENT ON COLUMN public.users.tier IS '1=Newcomer, 2=Regular, 3=Champion, 4=Leader';
COMMENT ON COLUMN public.users.is_demo IS 'True for demo/test accounts (auto-deleted on real signup)';
COMMENT ON COLUMN public.users.is_admin IS 'True for admin accounts (created via invite)';
COMMENT ON COLUMN public.users.is_moderator IS 'True for community moderators (Tier 4 + admin approval)';
COMMENT ON TABLE public.admin_settings IS 'Platform-wide admin settings';
COMMENT ON COLUMN public.admin_settings.demo_data_enabled IS 'Toggle demo data visibility';
COMMENT ON TABLE public.admin_invites IS 'Admin/moderator invite tokens';
COMMENT ON TABLE audit_logs IS 'Audit trail for all database changes';
