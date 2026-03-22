-- EduLaluan Database Schema
-- Migration: 008_fix_circumcision_notification.sql
-- Description: Fix circumcision submission notification to use correct function signature
-- Date: March 2026

-- =============================================
-- FIX CIRCUMCISION NOTIFICATION FUNCTION
-- =============================================

-- Recreate the notification function without emoji and with proper handling
CREATE OR REPLACE FUNCTION notify_circumcision_submission()
RETURNS TRIGGER AS $$
DECLARE
    v_user_email TEXT;
BEGIN
    -- Get user email if available (for future use)
    IF NEW.user_id IS NOT NULL THEN
        SELECT email INTO v_user_email FROM public.users WHERE id = NEW.user_id;
    END IF;

    -- Send high-priority admin notification
    PERFORM send_admin_notification(
        'new_contribution',
        FORMAT('New circumcision submission from %s at %s (%s)',
               COALESCE(NEW.display_name, 'Anonymous'),
               NEW.clinic_name,
               NEW.location),
        'high',
        NEW.contribution_id,
        NEW.user_id,
        'New Circumcision Submission'
    );

    -- If FGM check failed, send urgent notification
    IF NEW.fgm_check_passed = FALSE THEN
        PERFORM send_admin_notification(
            'urgent',
            FORMAT('FGM CHECK FAILED: Submission from %s at %s requires immediate review',
                   COALESCE(NEW.display_name, 'Anonymous'),
                   NEW.clinic_name),
            'urgent',
            NEW.contribution_id,
            NEW.user_id,
            'URGENT: FGM Check Failed'
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Recreate the validate function to remove emoji
CREATE OR REPLACE FUNCTION validate_circumcision_submission()
RETURNS TRIGGER AS $$
DECLARE
    fgm_keywords TEXT[] := ARRAY[
        'cut', 'cutting', 'remove', 'removal', 'excision', 'infibulation',
        'tissue', 'flesh', 'sew', 'sewing', 'close', 'closing'
    ];
    keyword TEXT;
BEGIN
    -- Only check female submissions
    IF NEW.gender = 'female' THEN
        -- Check experience narrative for FGM keywords
        FOREACH keyword IN ARRAY fgm_keywords LOOP
            IF LOWER(NEW.experience_narrative) LIKE '%' || keyword || '%' THEN
                NEW.fgm_check_passed := FALSE;
                NEW.fgm_check_notes := FORMAT('FGM keyword detected: %s', keyword);
                RETURN NEW;
            END IF;
        END LOOP;

        -- Check method is appropriate for female
        IF NEW.method != 'needle_prick' AND NEW.method != 'other' THEN
            NEW.fgm_check_passed := FALSE;
            NEW.fgm_check_notes := 'Invalid method for female circumcision';
            RETURN NEW;
        END IF;
    END IF;

    -- All checks passed
    NEW.fgm_check_passed := TRUE;
    NEW.fgm_check_notes := 'Passed automated FGM prevention check';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
