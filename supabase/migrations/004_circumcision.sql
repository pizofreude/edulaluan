-- EduLaluan Database Schema
-- Migration: 004_circumcision.sql
-- Description: Circumcision submissions table with specialized moderation and FGM prevention
-- Date: March 2026

-- =============================================
-- CIRCUMCISION SUBMISSIONS TABLE
-- =============================================

CREATE TABLE IF NOT EXISTS circumcision_submissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE SET NULL, -- NULL for anonymous
    contribution_id UUID REFERENCES contributions(id) ON DELETE CASCADE, -- Link to main contribution
    
    -- Display information
    display_name TEXT, -- User's chosen display name or "Anonymous"
    is_anonymous BOOLEAN DEFAULT FALSE,
    
    -- Submission details
    gender TEXT NOT NULL, -- 'male' or 'female'
    method TEXT NOT NULL, -- Dynamic based on gender
    clinic_name TEXT NOT NULL,
    location TEXT NOT NULL, -- City, State
    doctor_name TEXT, -- Optional
    contact_info TEXT, -- Optional: phone or social media
    experience_narrative TEXT NOT NULL,
    
    -- Moderation
    status TEXT DEFAULT 'pending', -- 'pending', 'approved', 'rejected'
    moderator_id UUID REFERENCES public.users(id),
    moderated_at TIMESTAMPTZ,
    moderation_notes TEXT,
    rejection_reason TEXT,
    
    -- FGM prevention check (critical for female submissions)
    fgm_check_passed BOOLEAN DEFAULT TRUE, -- Auto-checked on insert
    fgm_check_notes TEXT,
    
    -- Timestamps
    submitted_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_circumcision_gender CHECK (gender IN ('male', 'female')),
    CONSTRAINT chk_circumcision_status CHECK (status IN ('pending', 'approved', 'rejected')),
    CONSTRAINT chk_experience_length CHECK (LENGTH(experience_narrative) >= 30),
    CONSTRAINT chk_female_method CHECK (
        gender = 'female' AND method = 'needle_prick'
        OR
        gender = 'male' AND method IN ('conventional_sleeve', 'dorsal_slit', 'laser', 'tara_klamp', 'alisklamp', 'plastibell', 'stapler_zsr')
    )
);

-- Create indexes for circumcision submission queries
CREATE INDEX IF NOT EXISTS idx_circumcision_user ON circumcision_submissions(user_id);
CREATE INDEX IF NOT EXISTS idx_circumcision_gender ON circumcision_submissions(gender);
CREATE INDEX IF NOT EXISTS idx_circumcision_status ON circumcision_submissions(status);
CREATE INDEX IF NOT EXISTS idx_circumcision_submitted ON circumcision_submissions(submitted_at DESC);
CREATE INDEX IF NOT EXISTS idx_circumcision_contribution ON circumcision_submissions(contribution_id);

-- =============================================
-- FUNCTIONS FOR CIRCUMCISION SUBMISSIONS
-- =============================================

-- Function to check FGM-related keywords (CRITICAL for female submissions)
CREATE OR REPLACE FUNCTION check_fgm_keywords(p_text TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    fgm_keywords TEXT[] := ARRAY[
        'cut', 'cutting', 'remove', 'removal', 'excision', 'infibulation',
        'tissue', 'flesh', 'sew', 'sewing', 'close', 'closing'
    ];
    keyword TEXT;
BEGIN
    -- Check for FGM-related keywords
    FOREACH keyword IN ARRAY fgm_keywords LOOP
        IF LOWER(p_text) LIKE '%' || keyword || '%' THEN
            RETURN FALSE; -- FGM keyword detected
        END IF;
    END LOOP;
    
    RETURN TRUE; -- No FGM keywords found
END;
$$ LANGUAGE plpgsql;

-- Function to validate circumcision submission before insert
CREATE OR REPLACE FUNCTION validate_circumcision_submission()
RETURNS TRIGGER AS $$
DECLARE
    fgm_passed BOOLEAN;
    fgm_notes TEXT;
BEGIN
    -- For female submissions, perform FGM check
    IF NEW.gender = 'female' THEN
        -- Method must be "needle_prick" only
        IF NEW.method != 'needle_prick' THEN
            RAISE EXCEPTION 'Female circumcision method must be "needle_prick" only';
        END IF;
        
        -- Check experience narrative for FGM keywords
        fgm_passed := check_fgm_keywords(NEW.experience_narrative);
        
        IF NOT fgm_passed THEN
            -- FGM keywords detected - flag for manual review
            NEW.fgm_check_passed := FALSE;
            NEW.fgm_check_notes := 'Potential FGM-related content detected. Requires admin review.';
            NEW.status := 'pending'; -- Force pending status
        ELSE
            NEW.fgm_check_passed := TRUE;
            NEW.fgm_check_notes := 'FGM check passed. No harmful content detected.';
        END IF;
    ELSE
        -- Male submissions: auto-pass FGM check
        NEW.fgm_check_passed := TRUE;
        NEW.fgm_check_notes := NULL;
    END IF;
    
    -- Anonymize display name if requested
    IF NEW.is_anonymous THEN
        NEW.display_name := 'Anonymous';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to create contribution record from circumcision submission
CREATE OR REPLACE FUNCTION create_circumcision_contribution()
RETURNS TRIGGER AS $$
BEGIN
    -- Only create contribution on insert
    IF TG_OP = 'INSERT' AND NEW.contribution_id IS NULL THEN
        -- Insert into contributions table
        INSERT INTO contributions (user_id, type, title, description, status, metadata)
        VALUES (
            NEW.user_id,
            'circumcision',
            COALESCE(NEW.display_name, 'Anonymous') || ' - ' || INITCAP(NEW.gender) || ' Circumcision Experience',
            NEW.experience_narrative,
            'pending',
            jsonb_build_object(
                'clinic_name', NEW.clinic_name,
                'location', NEW.location,
                'doctor_name', NEW.doctor_name,
                'contact_info', NEW.contact_info,
                'gender', NEW.gender,
                'method', NEW.method,
                'fgm_check_passed', NEW.fgm_check_passed
            )
        )
        RETURNING id INTO NEW.contribution_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to notify on circumcision submission (HIGH PRIORITY)
CREATE OR REPLACE FUNCTION notify_circumcision_submission()
RETURNS TRIGGER AS $$
DECLARE
    v_user_email TEXT;
BEGIN
    -- Get user email if available
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
        'high', -- High priority for circumcision submissions
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

-- Function to award points on circumcision submission approval
CREATE OR REPLACE FUNCTION award_circumcision_points()
RETURNS TRIGGER AS $$
BEGIN
    -- Only process approved submissions
    IF NEW.status = 'approved' AND (OLD.status IS NULL OR OLD.status != 'approved') THEN
        -- Award 75 points for approved circumcision resource (higher need)
        INSERT INTO point_transactions (user_id, contribution_id, points, type, description)
        SELECT 
            NEW.user_id,
            NEW.contribution_id,
            75,
            'earn',
            FORMAT('Circumcision resource approved: %s', NEW.clinic_name)
        WHERE NEW.user_id IS NOT NULL;
        
        -- Update contribution points
        UPDATE contributions 
        SET points_earned = 75 
        WHERE id = NEW.contribution_id;
        
        -- Check for "Circumcision Advocate" badge
        IF NEW.user_id IS NOT NULL THEN
            PERFORM check_badge_eligibility(NEW.user_id);
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- TRIGGERS
-- =============================================

-- Trigger to validate submission before insert
DROP TRIGGER IF EXISTS on_circumcision_insert_validate ON circumcision_submissions;
CREATE TRIGGER on_circumcision_insert_validate
    BEFORE INSERT ON circumcision_submissions
    FOR EACH ROW
    EXECUTE FUNCTION validate_circumcision_submission();

-- Trigger to create contribution record after insert
DROP TRIGGER IF EXISTS on_circumcision_insert_create_contribution ON circumcision_submissions;
CREATE TRIGGER on_circumcision_insert_create_contribution
    AFTER INSERT ON circumcision_submissions
    FOR EACH ROW
    EXECUTE FUNCTION create_circumcision_contribution();

-- Trigger to notify admins on new submission
DROP TRIGGER IF EXISTS on_circumcision_insert_notify ON circumcision_submissions;
CREATE TRIGGER on_circumcision_insert_notify
    AFTER INSERT ON circumcision_submissions
    FOR EACH ROW
    EXECUTE FUNCTION notify_circumcision_submission();

-- Trigger to award points on approval
DROP TRIGGER IF EXISTS on_circumcision_approve_award_points ON circumcision_submissions;
CREATE TRIGGER on_circumcision_approve_award_points
    AFTER UPDATE ON circumcision_submissions
    FOR EACH ROW
    EXECUTE FUNCTION award_circumcision_points();

-- =============================================
-- ROW LEVEL SECURITY (RLS)
-- =============================================

-- Enable RLS on circumcision_submissions
ALTER TABLE circumcision_submissions ENABLE ROW LEVEL SECURITY;

-- Users can view their own submissions
CREATE POLICY "Users can view own submissions" ON circumcision_submissions
    FOR SELECT
    USING (auth.uid() = user_id OR is_anonymous = TRUE);

-- Users can create submissions
CREATE POLICY "Users can create submissions" ON circumcision_submissions
    FOR INSERT
    WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

-- Public can view approved submissions
CREATE POLICY "Public can view approved submissions" ON circumcision_submissions
    FOR SELECT
    USING (status = 'approved');

-- Admins/moderators can view all submissions
CREATE POLICY "Admins can view all submissions" ON circumcision_submissions
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND (is_admin = TRUE OR is_moderator = TRUE)
        )
    );

-- Admins/moderators can update all submissions
CREATE POLICY "Admins can update all submissions" ON circumcision_submissions
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND (is_admin = TRUE OR is_moderator = TRUE)
        )
    );

-- =============================================
-- VIEWS FOR ADMIN DASHBOARD
-- =============================================

-- View: Circumcision submissions pending moderation
CREATE OR REPLACE VIEW circumcision_moderation_queue AS
SELECT 
    cs.id,
    cs.contribution_id,
    cs.display_name,
    cs.is_anonymous,
    cs.gender,
    cs.method,
    cs.clinic_name,
    cs.location,
    cs.doctor_name,
    cs.contact_info,
    cs.experience_narrative,
    cs.status,
    cs.fgm_check_passed,
    cs.fgm_check_notes,
    cs.submitted_at,
    u.email as user_email,
    u.tier as user_tier,
    u.approval_rate as user_approval_rate
FROM circumcision_submissions cs
LEFT JOIN public.users u ON cs.user_id = u.id
WHERE cs.status = 'pending'
ORDER BY 
    CASE WHEN cs.fgm_check_passed = FALSE THEN 0 ELSE 1 END, -- FGM failures first
    cs.submitted_at DESC;

-- View: Approved circumcision resources (for public display)
CREATE OR REPLACE VIEW approved_circumcision_resources AS
SELECT 
    cs.id,
    cs.display_name,
    cs.gender,
    cs.method,
    cs.clinic_name,
    cs.location,
    cs.doctor_name,
    cs.contact_info,
    cs.experience_narrative,
    cs.submitted_at,
    -- Count by gender for filter display
    COUNT(*) OVER (PARTITION BY cs.gender) as gender_count
FROM circumcision_submissions cs
WHERE cs.status = 'approved'
ORDER BY cs.submitted_at DESC;

-- =============================================
-- COMMENTS
-- =============================================

COMMENT ON TABLE circumcision_submissions IS 'Community-submitted circumcision experiences (requires moderation)';
COMMENT ON COLUMN circumcision_submissions.gender IS 'male or female (female method locked to needle_prick)';
COMMENT ON COLUMN circumcision_submissions.method IS 'Dynamic options based on gender';
COMMENT ON COLUMN circumcision_submissions.fgm_check_passed IS 'Auto-check for FGM-related keywords';
COMMENT ON COLUMN circumcision_submissions.is_anonymous IS 'Hide user identity, display as "Anonymous"';
COMMENT ON FUNCTION check_fgm_keywords IS 'Detect FGM-related harmful content in submissions';
COMMENT ON VIEW circumcision_moderation_queue IS 'Admin view: pending circumcision submissions';
COMMENT ON VIEW approved_circumcision_resources IS 'Public view: approved circumcision resources';

-- =============================================
-- EDITORIAL NOTICE CONTENT (For frontend display)
-- =============================================

-- Store the FGM editorial notice in a queryable format for the frontend
CREATE TABLE IF NOT EXISTS editorial_notices (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_key TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    notice_type TEXT DEFAULT 'warning', -- 'warning', 'info', 'important'
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert the critical FGM editorial notice for circumcision page
INSERT INTO editorial_notices (page_key, title, content, notice_type) VALUES
    (
        'circumcision-fgm-notice',
        'Important: Female Sunat (Circumcision) Clarification',
        'Female sunat involves only a gentle needle prick on the clitoral hood. There is: No cutting. No tissue removal. No lasting anatomical alteration. This is categorically different from Female Genital Mutilation (FGM). FGM is harmful, condemned by international health bodies, and is not Islamic practice.',
        'warning'
    )
ON CONFLICT (page_key) DO NOTHING;

-- Enable RLS on editorial_notices
ALTER TABLE editorial_notices ENABLE ROW LEVEL SECURITY;

-- Public can view active editorial notices
CREATE POLICY "Public can view editorial notices" ON editorial_notices
    FOR SELECT
    USING (is_active = TRUE);

-- Only admins can modify editorial notices
CREATE POLICY "Admins can modify editorial notices" ON editorial_notices
    FOR ALL
    USING (
        EXISTS (
            SELECT 1 FROM public.users 
            WHERE id = auth.uid() AND is_admin = TRUE
        )
    );
