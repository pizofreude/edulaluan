-- EduLaluan Database Schema
-- Migration: 017_fix_all_remaining_timezone_bugs.sql
-- Description: Fix ALL remaining date_trunc bugs in gamification functions
-- Date: March 2026

-- =============================================
-- FIX ALL REMAINING DATE_TRUNC BUGS
-- =============================================

-- Fix can_submit_contribution function (line 211 in 002_gamification.sql)
CREATE OR REPLACE FUNCTION can_submit_contribution(p_user_id UUID)
RETURNS TABLE (
    can_submit BOOLEAN,
    message TEXT,
    weekly_limit INTEGER,
    current_count INTEGER
) AS $$
DECLARE
    user_tier INTEGER;
    week_start_date DATE;
    submission_limit INTEGER;
    current_submissions INTEGER;
BEGIN
    -- Get user tier
    SELECT tier INTO user_tier FROM public.users WHERE id = p_user_id;

    -- Get current week start (Monday) - FIXED: use simple date math
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;

    -- Get submission limit for tier
    submission_limit := get_submission_limit_for_tier(user_tier);

    -- Get current submissions this week
    SELECT submission_count INTO current_submissions
    FROM weekly_submission_limits
    WHERE user_id = p_user_id AND week_start = week_start_date;

    -- Default value if no record exists
    current_submissions := COALESCE(current_submissions, 0);

    -- Check if can submit
    IF current_submissions < submission_limit THEN
        can_submit := TRUE;
        message := FORMAT('You can submit %s more contribution(s) this week.',
                         submission_limit - current_submissions);
    ELSE
        can_submit := FALSE;
        message := 'Weekly submission limit reached.';
    END IF;

    weekly_limit := submission_limit;
    current_count := current_submissions;

    RETURN NEXT;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Fix get_weekly_submission_count function (line 257 in 002_gamification.sql)
CREATE OR REPLACE FUNCTION get_weekly_submission_count(p_user_id UUID)
RETURNS INTEGER AS $$
DECLARE
    week_start_date DATE;
    submission_count INTEGER;
BEGIN
    -- Get week start (Monday) - FIXED: use simple date math
    week_start_date := CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INTEGER + 1;

    -- Get submission count
    SELECT COALESCE(submission_count, 0) INTO submission_count
    FROM weekly_submission_limits
    WHERE user_id = p_user_id AND week_start = week_start_date;

    RETURN submission_count;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
