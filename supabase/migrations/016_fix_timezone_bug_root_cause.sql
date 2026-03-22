-- EduLaluan Database Schema
-- Migration: 016_fix_timezone_bug_root_cause.sql
-- Description: Fix the actual date_trunc calls causing timezone errors
-- Date: March 2026

-- =============================================
-- FIX DATE_TRUNC IN DATABASE FUNCTIONS
-- =============================================

-- Fix check_weekly_submission_limit function
CREATE OR REPLACE FUNCTION check_weekly_submission_limit(p_user_id UUID)
RETURNS TABLE (
    can_submit BOOLEAN,
    current_count INTEGER,
    weekly_limit INTEGER,
    cooldown_until TIMESTAMPTZ,
    message TEXT
) AS $$
DECLARE
    user_tier INTEGER;
    week_start_date DATE;
    submission_limit INTEGER;
    cooldown_hours INTEGER;
    current_submissions INTEGER;
    cooldown_end TIMESTAMPTZ;
BEGIN
    -- Get user tier
    SELECT tier INTO user_tier FROM public.users WHERE id = p_user_id;

    -- Get current week start (Monday) - FIXED: use simple date math
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;

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
        can_submit := TRUE;
        message := 'Cooldown expired. You can submit again.';
        current_count := 0;
    ELSE
        can_submit := FALSE;
        cooldown_until := cooldown_end;
        message := FORMAT('Weekly limit reached. Cooldown until %s.',
                         TO_CHAR(cooldown_end, 'YYYY-MM-DD HH24:MI'));
    END IF;

    current_count := current_submissions;
    weekly_limit := submission_limit;
    
    IF NOT can_submit AND cooldown_until IS NULL THEN
        cooldown_until := cooldown_end;
    END IF;

    RETURN NEXT;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Fix get_or_create_weekly_limit function
CREATE OR REPLACE FUNCTION get_or_create_weekly_limit(p_user_id UUID)
RETURNS SETOF weekly_submission_limits AS $$
DECLARE
    week_start_date DATE;
    result_row weekly_submission_limits;
BEGIN
    -- Get week start (Monday) - FIXED: use simple date math
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;

    -- Try to get existing record
    SELECT * INTO result_row
    FROM weekly_submission_limits
    WHERE user_id = p_user_id AND week_start = week_start_date;

    -- Create if doesn't exist
    IF NOT FOUND THEN
        INSERT INTO weekly_submission_limits (user_id, week_start, submission_count)
        VALUES (p_user_id, week_start_date, 0)
        RETURNING * INTO result_row;
    END IF;

    RETURN NEXT result_row;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
