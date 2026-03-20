-- EduLaluan Database Schema
-- Migration: 002_gamification.sql
-- Description: Contributions, points, badges, leaderboards, and gamification system
-- Date: March 2026

-- =============================================
-- CONTRIBUTIONS TABLE (All user submissions)
-- =============================================

CREATE TABLE IF NOT EXISTS contributions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    type TEXT NOT NULL, -- 'resource', 'financial_aid', 'feature_request', 'issue_report', 'circumcision'
    title TEXT NOT NULL,
    description TEXT,
    url TEXT, -- For resource/financial_aid submissions
    category_id UUID REFERENCES categories(id), -- For resource submissions
    status TEXT DEFAULT 'pending', -- 'pending', 'approved', 'rejected', 'changes_requested'
    points_earned INTEGER DEFAULT 0,
    moderator_id UUID REFERENCES public.users(id), -- Admin/moderator who reviewed
    moderated_at TIMESTAMPTZ,
    moderation_notes TEXT,
    rejection_reason TEXT,
    metadata JSONB DEFAULT '{}', -- Additional data based on type
    submitted_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_contribution_type CHECK (type IN ('resource', 'financial_aid', 'feature_request', 'issue_report', 'circumcision')),
    CONSTRAINT chk_contribution_status CHECK (status IN ('pending', 'approved', 'rejected', 'changes_requested')),
    CONSTRAINT chk_points_earned CHECK (points_earned >= 0)
);

-- Create indexes for contribution queries
CREATE INDEX IF NOT EXISTS idx_contributions_user ON contributions(user_id);
CREATE INDEX IF NOT EXISTS idx_contributions_type ON contributions(type);
CREATE INDEX IF NOT EXISTS idx_contributions_status ON contributions(status);
CREATE INDEX IF NOT EXISTS idx_contributions_submitted ON contributions(submitted_at DESC);
CREATE INDEX IF NOT EXISTS idx_contributions_moderated ON contributions(moderated_at DESC);

-- =============================================
-- POINT TRANSACTIONS TABLE (Audit trail for points)
-- =============================================

CREATE TABLE IF NOT EXISTS point_transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    contribution_id UUID REFERENCES contributions(id) ON DELETE SET NULL,
    points INTEGER NOT NULL,
    type TEXT NOT NULL, -- 'earn', 'redeem', 'adjustment', 'penalty'
    description TEXT NOT NULL,
    balance_after INTEGER, -- Running balance for easy debugging
    created_at TIMESTAMPTZ DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) -- For manual adjustments
    
    -- Constraints
    CONSTRAINT chk_transaction_type CHECK (type IN ('earn', 'redeem', 'adjustment', 'penalty'))
);

-- Create indexes for point transaction queries
CREATE INDEX IF NOT EXISTS idx_point_transactions_user ON point_transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_point_transactions_contribution ON point_transactions(contribution_id);
CREATE INDEX IF NOT EXISTS idx_point_transactions_created ON point_transactions(created_at DESC);

-- =============================================
-- BADGES TABLE (Badge definitions)
-- =============================================

CREATE TABLE IF NOT EXISTS badges (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    icon_url TEXT, -- SVG or image URL
    points_required INTEGER DEFAULT 0,
    tier_required INTEGER DEFAULT 1, -- 1-4
    category TEXT DEFAULT 'general', -- 'general', 'resource', 'community', 'special'
    is_one_time BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_badge_tier CHECK (tier_required BETWEEN 1 AND 4),
    CONSTRAINT chk_badge_category CHECK (category IN ('general', 'resource', 'community', 'special'))
);

-- Create index for badge lookups
CREATE INDEX IF NOT EXISTS idx_badges_tier ON badges(tier_required);
CREATE INDEX IF NOT EXISTS idx_badges_category ON badges(category);

-- =============================================
-- USER BADGES TABLE (Earned badges)
-- =============================================

CREATE TABLE IF NOT EXISTS user_badges (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    badge_id UUID NOT NULL REFERENCES badges(id) ON DELETE CASCADE,
    earned_at TIMESTAMPTZ DEFAULT NOW(),
    is_displayed BOOLEAN DEFAULT TRUE, -- User can choose to hide badges
    context JSONB DEFAULT '{}', -- Additional context (e.g., "for 50 resources")
    
    -- Ensure unique badges per user (for one-time badges)
    CONSTRAINT unique_user_badge UNIQUE (user_id, badge_id)
);

-- Create indexes for user badge queries
CREATE INDEX IF NOT EXISTS idx_user_badges_user ON user_badges(user_id);
CREATE INDEX IF NOT EXISTS idx_user_badges_badge ON user_badges(badge_id);
CREATE INDEX IF NOT EXISTS idx_user_badges_displayed ON user_badges(is_displayed);

-- =============================================
-- LEADERBOARD CACHE TABLE (Materialized rankings)
-- =============================================

CREATE TABLE IF NOT EXISTS leaderboard_cache (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    category TEXT NOT NULL DEFAULT 'all_time', -- 'all_time', 'monthly', 'weekly', 'by_type'
    subtype TEXT, -- For type-specific leaderboards (e.g., 'resource', 'financial_aid')
    total_points INTEGER NOT NULL DEFAULT 0,
    total_contributions INTEGER NOT NULL DEFAULT 0,
    rank INTEGER NOT NULL DEFAULT 0,
    period_start DATE, -- For monthly/weekly leaderboards
    period_end DATE,
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Ensure unique user per category/period
    CONSTRAINT unique_leaderboard_entry UNIQUE (user_id, category, subtype, period_start)
);

-- Create indexes for leaderboard queries
CREATE INDEX IF NOT EXISTS idx_leaderboard_category ON leaderboard_cache(category);
CREATE INDEX IF NOT EXISTS idx_leaderboard_subtype ON leaderboard_cache(subtype);
CREATE INDEX IF NOT EXISTS idx_leaderboard_points ON leaderboard_cache(total_points DESC);
CREATE INDEX IF NOT EXISTS idx_leaderboard_rank ON leaderboard_cache(rank);
CREATE INDEX IF NOT EXISTS idx_leaderboard_period ON leaderboard_cache(period_start, period_end);

-- =============================================
-- WEEKLY SUBMISSION LIMITS TABLE (Rate limiting)
-- =============================================

CREATE TABLE IF NOT EXISTS weekly_submission_limits (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    week_start DATE NOT NULL, -- Monday of the week
    submission_count INTEGER DEFAULT 0,
    tier_limit INTEGER NOT NULL, -- Limit based on user tier at week start
    cooldown_until TIMESTAMPTZ, -- After hitting limit, when they can submit again
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Ensure unique user per week
    CONSTRAINT unique_user_week UNIQUE (user_id, week_start)
);

-- Create indexes for rate limit queries
CREATE INDEX IF NOT EXISTS idx_weekly_limits_user ON weekly_submission_limits(user_id);
CREATE INDEX IF NOT EXISTS idx_weekly_limits_week ON weekly_submission_limits(week_start);

-- =============================================
-- FUNCTIONS AND TRIGGERS
-- =============================================

-- Function to get submission limit by tier
CREATE OR REPLACE FUNCTION get_submission_limit_for_tier(p_tier INTEGER)
RETURNS INTEGER AS $$
BEGIN
    CASE p_tier
        WHEN 1 THEN RETURN 4;  -- Newcomer: 4/week
        WHEN 2 THEN RETURN 6;  -- Regular: 6/week
        WHEN 3 THEN RETURN 10; -- Champion: 10/week
        WHEN 4 THEN RETURN 20; -- Leader: 20/week
        ELSE RETURN 4;
    END CASE;
END;
$$ LANGUAGE plpgsql;

-- Function to get cooldown hours by tier
CREATE OR REPLACE FUNCTION get_cooldown_hours_for_tier(p_tier INTEGER)
RETURNS INTEGER AS $$
BEGIN
    CASE p_tier
        WHEN 1 THEN RETURN 24; -- Newcomer: 24h after limit
        WHEN 2 THEN RETURN 12; -- Regular: 12h
        WHEN 3 THEN RETURN 6;  -- Champion: 6h
        WHEN 4 THEN RETURN 2;  -- Leader: 2h
        ELSE RETURN 24;
    END CASE;
END;
$$ LANGUAGE plpgsql;

-- Function to check submission limit
CREATE OR REPLACE FUNCTION check_submission_limit(p_user_id UUID)
RETURNS TABLE (
    can_submit BOOLEAN,
    current_count INTEGER,
    limit_count INTEGER,
    cooldown_until TIMESTAMPTZ,
    message TEXT
) AS $$
DECLARE
    user_tier INTEGER;
    week_start_date DATE;
    current_submissions INTEGER;
    submission_limit INTEGER;
    cooldown_hours INTEGER;
    cooldown_end TIMESTAMPTZ;
BEGIN
    -- Get user tier
    SELECT tier INTO user_tier FROM public.users WHERE id = p_user_id;
    
    -- Get current week start (Monday)
    week_start_date := date_trunc('week', CURRENT_DATE, 'Monday')::DATE;
    
    -- Get submission limit for tier
    submission_limit := get_submission_limit_for_tier(user_tier);
    cooldown_hours := get_cooldown_hours_for_tier(user_tier);
    
    -- Get current submissions this week
    SELECT submission_count, cooldown_until
    INTO current_submissions, cooldown_end
    FROM weekly_submission_limits
    WHERE user_id = p_user_id AND week_start = week_start_date;
    
    -- Default values if no record exists
    current_submissions := COALESCE(current_submissions, 0);
    cooldown_end := COALESCE(cooldown_end, CURRENT_TIMESTAMP);
    
    -- Check if can submit
    IF current_submissions < submission_limit THEN
        can_submit := TRUE;
        message := FORMAT('You can submit %s more contribution(s) this week.', 
                         submission_limit - current_submissions);
    ELSIF CURRENT_TIMESTAMP >= cooldown_end THEN
        -- Cooldown expired, can submit again
        can_submit := TRUE;
        message := 'Cooldown expired. You can submit again.';
    ELSE
        can_submit := FALSE;
        cooldown_end := cooldown_end;
        message := FORMAT('Weekly limit reached. Cooldown until %s.', 
                         TO_CHAR(cooldown_end, 'YYYY-MM-DD HH24:MI'));
    END IF;
    
    limit_count := submission_limit;
END;
$$ LANGUAGE plpgsql;

-- Function to update weekly submission count
CREATE OR REPLACE FUNCTION update_weekly_submission_count()
RETURNS TRIGGER AS $$
DECLARE
    week_start_date DATE;
    user_tier INTEGER;
    submission_limit INTEGER;
    cooldown_hours INTEGER;
BEGIN
    -- Get week start (Monday)
    week_start_date := date_trunc('week', CURRENT_DATE, 'Monday')::DATE;
    
    -- Get user tier
    SELECT tier INTO user_tier FROM public.users WHERE id = NEW.user_id;
    
    -- Get limits
    submission_limit := get_submission_limit_for_tier(user_tier);
    cooldown_hours := get_cooldown_hours_for_tier(user_tier);
    
    -- Upsert weekly limit record
    INSERT INTO weekly_submission_limits (user_id, week_start, submission_count, tier_limit, cooldown_until)
    VALUES (NEW.user_id, week_start_date, 1, submission_limit, 
            CURRENT_TIMESTAMP + (cooldown_hours || ' hours')::INTERVAL)
    ON CONFLICT (user_id, week_start) DO UPDATE
    SET 
        submission_count = weekly_submission_limits.submission_count + 1,
        cooldown_until = CURRENT_TIMESTAMP + (cooldown_hours || ' hours')::INTERVAL,
        updated_at = NOW();
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to award points for approved contribution
CREATE OR REPLACE FUNCTION award_contribution_points()
RETURNS TRIGGER AS $$
DECLARE
    points_to_award INTEGER;
    user_email TEXT;
BEGIN
    -- Only process approved contributions
    IF NEW.status = 'approved' AND (OLD.status IS NULL OR OLD.status != 'approved') THEN
        -- Determine points based on type
        CASE NEW.type
            WHEN 'resource' THEN points_to_award := 50;
            WHEN 'financial_aid' THEN points_to_award := 50;
            WHEN 'circumcision' THEN points_to_award := 75; -- Higher need
            WHEN 'feature_request' THEN points_to_award := 10;
            WHEN 'issue_report' THEN points_to_award := 10;
            ELSE points_to_award := 0;
        END CASE;
        
        -- Get user email for description
        SELECT email INTO user_email FROM public.users WHERE id = NEW.user_id;
        
        -- Insert point transaction
        INSERT INTO point_transactions (user_id, contribution_id, points, type, description, balance_after)
        SELECT 
            NEW.user_id,
            NEW.id,
            points_to_award,
            'earn',
            FORMAT('%s approved: %s', INITCAP(NEW.type), NEW.title),
            u.points_balance + points_to_award
        FROM public.users u
        WHERE u.id = NEW.user_id;
        
        -- Update contribution points_earned
        UPDATE contributions SET points_earned = points_to_award WHERE id = NEW.id;
        
        -- Check badge eligibility
        PERFORM check_badge_eligibility(NEW.user_id);
        
        -- Update leaderboard cache
        PERFORM refresh_leaderboard_cache(NEW.user_id);
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to check badge eligibility
CREATE OR REPLACE FUNCTION check_badge_eligibility(p_user_id UUID)
RETURNS VOID AS $$
DECLARE
    user_points INTEGER;
    user_tier INTEGER;
    user_contributions INTEGER;
    badge_record RECORD;
BEGIN
    -- Get user stats
    SELECT points_balance, tier, total_contributions
    INTO user_points, user_tier, user_contributions
    FROM public.users
    WHERE id = p_user_id;
    
    -- Check each badge
    FOR badge_record IN 
        SELECT * FROM badges 
        WHERE tier_required <= user_tier 
        AND points_required <= user_points
    LOOP
        -- Insert badge if not already earned (for one-time badges)
        IF badge_record.is_one_time THEN
            INSERT INTO user_badges (user_id, badge_id, earned_at, context)
            SELECT p_user_id, badge_record.id, NOW(), 
                   jsonb_build_object('points', user_points, 'tier', user_tier)
            WHERE NOT EXISTS (
                SELECT 1 FROM user_badges 
                WHERE user_id = p_user_id AND badge_id = badge_record.id
            );
        ELSE
            -- For repeatable badges, just insert (could add logic for upgrades)
            INSERT INTO user_badges (user_id, badge_id, earned_at, context)
            VALUES (p_user_id, badge_record.id, NOW(),
                   jsonb_build_object('points', user_points, 'tier', user_tier))
            ON CONFLICT (user_id, badge_id) DO NOTHING;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Function to refresh leaderboard cache for a user
CREATE OR REPLACE FUNCTION refresh_leaderboard_cache(p_user_id UUID)
RETURNS VOID AS $$
DECLARE
    user_points INTEGER;
    user_contributions INTEGER;
BEGIN
    -- Get user stats
    SELECT points_balance, total_contributions
    INTO user_points, user_contributions
    FROM public.users
    WHERE id = p_user_id;
    
    -- Update all-time leaderboard
    INSERT INTO leaderboard_cache (user_id, category, subtype, total_points, total_contributions, rank, updated_at)
    VALUES (p_user_id, 'all_time', NULL, user_points, user_contributions, 0, NOW())
    ON CONFLICT (user_id, category, subtype, period_start) DO UPDATE
    SET 
        total_points = user_points,
        total_contributions = user_contributions,
        updated_at = NOW();
    
    -- Update rankings
    PERFORM update_leaderboard_ranks();
END;
$$ LANGUAGE plpgsql;

-- Function to update leaderboard ranks
CREATE OR REPLACE FUNCTION update_leaderboard_ranks()
RETURNS VOID AS $$
BEGIN
    -- Update all-time ranks
    WITH ranked AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY total_points DESC, total_contributions DESC) as new_rank
        FROM leaderboard_cache
        WHERE category = 'all_time'
    )
    UPDATE leaderboard_cache lc
    SET rank = r.new_rank
    FROM ranked r
    WHERE lc.id = r.id;
END;
$$ LANGUAGE plpgsql;

-- Function to reset weekly limits (called weekly via cron)
CREATE OR REPLACE FUNCTION reset_weekly_limits()
RETURNS VOID AS $$
BEGIN
    -- Archive old weekly limits (optional: move to history table)
    -- For now, just let them accumulate (they're keyed by week_start)
    NULL;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- TRIGGERS
-- =============================================

-- Trigger to update weekly submission count on contribution insert
DROP TRIGGER IF EXISTS on_contribution_insert_update_weekly ON contributions;
CREATE TRIGGER on_contribution_insert_update_weekly
    AFTER INSERT ON contributions
    FOR EACH ROW
    EXECUTE FUNCTION update_weekly_submission_count();

-- Trigger to award points on contribution approval
DROP TRIGGER IF EXISTS on_contribution_approve_award_points ON contributions;
CREATE TRIGGER on_contribution_approve_award_points
    AFTER INSERT OR UPDATE ON contributions
    FOR EACH ROW
    EXECUTE FUNCTION award_contribution_points();

-- =============================================
-- SEED DATA: BADGE DEFINITIONS
-- =============================================

-- Tier 1 Badges (Newcomer)
INSERT INTO badges (name, slug, description, points_required, tier_required, category, is_one_time) VALUES
    ('Welcome', 'welcome', 'Welcome to EduLaluan! Here''s 10 points to get started.', 0, 1, 'general', TRUE),
    ('First Contribution', 'first-contribution', 'Submitted your first contribution to the community.', 10, 1, 'general', TRUE),
    ('Helper', 'helper', 'Had your first contribution approved.', 20, 1, 'general', TRUE)
ON CONFLICT (slug) DO NOTHING;

-- Tier 2 Badges (Regular)
INSERT INTO badges (name, slug, description, points_required, tier_required, category, is_one_time) VALUES
    ('Resource Finder', 'resource-finder', 'Contributed 5 approved educational resources.', 50, 2, 'resource', TRUE),
    ('Consistent Helper', 'consistent-helper', 'Had 10 contributions approved.', 100, 2, 'community', TRUE),
    ('Quality Contributor', 'quality-contributor', 'Maintained 90% approval rate.', 150, 2, 'general', TRUE)
ON CONFLICT (slug) DO NOTHING;

-- Tier 3 Badges (Champion)
INSERT INTO badges (name, slug, description, points_required, tier_required, category, is_one_time) VALUES
    ('Education Expert', 'education-expert', 'Contributed 20 approved educational resources.', 500, 3, 'resource', TRUE),
    ('Community Champion', 'community-champion', 'Had 50 contributions approved.', 1000, 3, 'community', TRUE),
    ('Trusted Voice', 'trusted-voice', 'Maintained 95% approval rate for 1 year.', 1500, 3, 'general', TRUE)
ON CONFLICT (slug) DO NOTHING;

-- Tier 4 Badges (Leader)
INSERT INTO badges (name, slug, description, points_required, tier_required, category, is_one_time) VALUES
    ('Legendary Contributor', 'legendary-contributor', 'Had 100+ contributions approved.', 2000, 4, 'community', TRUE),
    ('Community Leader', 'community-leader', 'Had 200+ contributions approved over 2 years.', 3000, 4, 'community', TRUE),
    ('Hall of Fame', 'hall-of-fame', 'Lifetime achievement award for exceptional contributions.', 5000, 4, 'special', TRUE)
ON CONFLICT (slug) DO NOTHING;

-- Special Badges
INSERT INTO badges (name, slug, description, points_required, tier_required, category, is_one_time) VALUES
    ('Circumcision Advocate', 'circumcision-advocate', 'Contributed first approved circumcision resource.', 75, 1, 'special', TRUE),
    ('Feature Requester', 'feature-requester', 'Submitted first approved feature request.', 10, 1, 'general', TRUE),
    ('Bug Hunter', 'bug-hunter', 'Reported first approved issue.', 10, 1, 'general', TRUE)
ON CONFLICT (slug) DO NOTHING;

-- =============================================
-- ROW LEVEL SECURITY (RLS)
-- =============================================

-- Enable RLS on contributions
ALTER TABLE contributions ENABLE ROW LEVEL SECURITY;

-- Users can view their own contributions
CREATE POLICY "Users can view own contributions" ON contributions
    FOR SELECT
    USING (auth.uid() = user_id);

-- Users can create contributions
CREATE POLICY "Users can create contributions" ON contributions
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Users can update own pending contributions
CREATE POLICY "Users can update own contributions" ON contributions
    FOR UPDATE
    USING (auth.uid() = user_id AND status = 'pending');

-- Public can view approved contributions
CREATE POLICY "Public can view approved contributions" ON contributions
    FOR SELECT
    USING (status = 'approved');

-- Admins/moderators can view all contributions
CREATE POLICY "Admins can view all contributions" ON contributions
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND (is_admin = TRUE OR is_moderator = TRUE)
        )
    );

-- Admins/moderators can update all contributions
CREATE POLICY "Admins can update all contributions" ON contributions
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND (is_admin = TRUE OR is_moderator = TRUE)
        )
    );

-- Enable RLS on point_transactions
ALTER TABLE point_transactions ENABLE ROW LEVEL SECURITY;

-- Users can view their own transactions
CREATE POLICY "Users can view own transactions" ON point_transactions
    FOR SELECT
    USING (auth.uid() = user_id);

-- Admins can view all transactions
CREATE POLICY "Admins can view all transactions" ON point_transactions
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Enable RLS on badges
ALTER TABLE badges ENABLE ROW LEVEL SECURITY;

-- Public can view badges
CREATE POLICY "Public can view badges" ON badges
    FOR SELECT
    USING (TRUE);

-- Only admins can modify badges
CREATE POLICY "Admins can modify badges" ON badges
    FOR ALL
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );

-- Enable RLS on user_badges
ALTER TABLE user_badges ENABLE ROW LEVEL SECURITY;

-- Users can view their own badges
CREATE POLICY "Users can view own badges" ON user_badges
    FOR SELECT
    USING (auth.uid() = user_id);

-- Public can view displayed badges
CREATE POLICY "Public can view displayed badges" ON user_badges
    FOR SELECT
    USING (is_displayed = TRUE);

-- Users can update their own badge display settings
CREATE POLICY "Users can update own badge display" ON user_badges
    FOR UPDATE
    USING (auth.uid() = user_id);

-- Enable RLS on leaderboard_cache
ALTER TABLE leaderboard_cache ENABLE ROW LEVEL SECURITY;

-- Public can view leaderboard
CREATE POLICY "Public can view leaderboard" ON leaderboard_cache
    FOR SELECT
    USING (TRUE);

-- Enable RLS on weekly_submission_limits
ALTER TABLE weekly_submission_limits ENABLE ROW LEVEL SECURITY;

-- Users can view their own limits
CREATE POLICY "Users can view own limits" ON weekly_submission_limits
    FOR SELECT
    USING (auth.uid() = user_id);

-- =============================================
-- COMMENTS
-- =============================================

COMMENT ON TABLE contributions IS 'All user submissions requiring moderation';
COMMENT ON COLUMN contributions.type IS 'resource, financial_aid, feature_request, issue_report, circumcision';
COMMENT ON COLUMN contributions.status IS 'pending, approved, rejected, changes_requested';
COMMENT ON TABLE point_transactions IS 'Audit trail for all point changes';
COMMENT ON TABLE badges IS 'Badge definitions (achievements)';
COMMENT ON TABLE user_badges IS 'Badges earned by users';
COMMENT ON TABLE leaderboard_cache IS 'Cached leaderboard rankings for performance';
COMMENT ON TABLE weekly_submission_limits IS 'Rate limiting: submissions per week by tier';
