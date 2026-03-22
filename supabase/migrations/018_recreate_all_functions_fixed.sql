-- EduLaluan Database Schema
-- Migration: 018_recreate_all_functions_fixed.sql
-- Description: Recreate ALL functions with fixed date math (no date_trunc)
-- Date: March 2026

-- =============================================
-- RECREATE ALL FUNCTIONS WITH FIXES
-- =============================================

-- Drop and recreate can_submit_contribution
DROP FUNCTION IF EXISTS can_submit_contribution(UUID);
CREATE OR REPLACE FUNCTION can_submit_contribution(p_user_id UUID)
RETURNS TABLE (can_submit BOOLEAN, message TEXT, weekly_limit INTEGER, current_count INTEGER) AS $$
DECLARE
    user_tier INTEGER;
    week_start_date DATE;
    submission_limit INTEGER;
    current_submissions INTEGER;
BEGIN
    SELECT tier INTO user_tier FROM public.users WHERE id = p_user_id;
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;
    submission_limit := CASE user_tier WHEN 1 THEN 4 WHEN 2 THEN 6 WHEN 3 THEN 10 ELSE 20 END;
    SELECT COALESCE(submission_count, 0) INTO current_submissions FROM weekly_submission_limits WHERE user_id = p_user_id AND week_start = week_start_date;
    IF current_submissions < submission_limit THEN
        can_submit := TRUE; message := FORMAT('You can submit %s more contribution(s) this week.', submission_limit - current_submissions);
    ELSE
        can_submit := FALSE; message := 'Weekly submission limit reached.';
    END IF;
    weekly_limit := submission_limit; current_count := current_submissions;
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop and recreate get_weekly_submission_count
DROP FUNCTION IF EXISTS get_weekly_submission_count(UUID);
CREATE OR REPLACE FUNCTION get_weekly_submission_count(p_user_id UUID) RETURNS INTEGER AS $$
DECLARE week_start_date DATE; submission_count INTEGER;
BEGIN
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;
    SELECT COALESCE(submission_count, 0) INTO submission_count FROM weekly_submission_limits WHERE user_id = p_user_id AND week_start = week_start_date;
    RETURN submission_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop and recreate check_weekly_submission_limit
DROP FUNCTION IF EXISTS check_weekly_submission_limit(UUID);
CREATE OR REPLACE FUNCTION check_weekly_submission_limit(p_user_id UUID) RETURNS TABLE (can_submit BOOLEAN, current_count INTEGER, weekly_limit INTEGER, cooldown_until TIMESTAMPTZ, message TEXT) AS $$
DECLARE user_tier INTEGER; week_start_date DATE; submission_limit INTEGER; current_submissions INTEGER; cooldown_end TIMESTAMPTZ;
BEGIN
    SELECT tier INTO user_tier FROM public.users WHERE id = p_user_id;
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;
    submission_limit := CASE user_tier WHEN 1 THEN 4 WHEN 2 THEN 6 WHEN 3 THEN 10 ELSE 20 END;
    SELECT submission_count, cooldown_until INTO current_submissions, cooldown_end FROM weekly_submission_limits WHERE user_id = p_user_id AND week_start = week_start_date;
    current_submissions := COALESCE(current_submissions, 0); cooldown_end := COALESCE(cooldown_end, CURRENT_TIMESTAMP);
    IF current_submissions < submission_limit THEN can_submit := TRUE; message := FORMAT('You can submit %s more contribution(s) this week.', submission_limit - current_submissions);
    ELSIF CURRENT_TIMESTAMP >= cooldown_end THEN can_submit := TRUE; message := 'Cooldown expired.'; current_count := 0;
    ELSE can_submit := FALSE; cooldown_until := cooldown_end; message := FORMAT('Cooldown until %s.', TO_CHAR(cooldown_end, 'YYYY-MM-DD HH24:MI'));
    END IF;
    current_count := current_submissions; weekly_limit := submission_limit;
    IF NOT can_submit AND cooldown_until IS NULL THEN cooldown_until := cooldown_end; END IF;
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop and recreate get_or_create_weekly_limit
DROP FUNCTION IF EXISTS get_or_create_weekly_limit(UUID);
CREATE OR REPLACE FUNCTION get_or_create_weekly_limit(p_user_id UUID) RETURNS SETOF weekly_submission_limits AS $$
DECLARE week_start_date DATE; result_row weekly_submission_limits;
BEGIN
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;
    SELECT * INTO result_row FROM weekly_submission_limits WHERE user_id = p_user_id AND week_start = week_start_date;
    IF NOT FOUND THEN INSERT INTO weekly_submission_limits (user_id, week_start, submission_count) VALUES (p_user_id, week_start_date, 0) RETURNING * INTO result_row; END IF;
    RETURN NEXT result_row;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop and recreate get_submission_limit_for_tier
DROP FUNCTION IF EXISTS get_submission_limit_for_tier(INTEGER);
CREATE OR REPLACE FUNCTION get_submission_limit_for_tier(tier INTEGER) RETURNS INTEGER AS $$
BEGIN RETURN CASE tier WHEN 1 THEN 4 WHEN 2 THEN 6 WHEN 3 THEN 10 ELSE 20 END; END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Drop and recreate get_cooldown_hours_for_tier
DROP FUNCTION IF EXISTS get_cooldown_hours_for_tier(INTEGER);
CREATE OR REPLACE FUNCTION get_cooldown_hours_for_tier(tier INTEGER) RETURNS INTEGER AS $$
BEGIN RETURN CASE tier WHEN 1 THEN 24 WHEN 2 THEN 12 WHEN 3 THEN 6 ELSE 2 END; END;
$$ LANGUAGE plpgsql IMMUTABLE;
