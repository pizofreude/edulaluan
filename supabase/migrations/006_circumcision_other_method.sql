-- EduLaluan Database Schema
-- Migration: 006_circumcision_other_method.sql
-- Description: Add support for custom/other circumcision methods
-- Date: March 2026

-- =============================================
-- ADD CUSTOM METHOD FIELD
-- =============================================

-- Add column for custom method specification
ALTER TABLE circumcision_submissions 
ADD COLUMN IF NOT EXISTS method_other TEXT;

-- Add check constraint for other method
ALTER TABLE circumcision_submissions 
DROP CONSTRAINT IF EXISTS chk_other_method_required;

ALTER TABLE circumcision_submissions
ADD CONSTRAINT chk_other_method_required CHECK (
    (method != 'other' OR method_other IS NOT NULL) AND
    (method != 'other' OR LENGTH(method_other) >= 3)
);

-- Add comment for clarity
COMMENT ON COLUMN circumcision_submissions.method_other IS 
'Custom method name when method="other". Required if method is "other", must be at least 3 characters.';

-- Update female method check to include 'other'
ALTER TABLE circumcision_submissions 
DROP CONSTRAINT IF EXISTS chk_female_method;

ALTER TABLE circumcision_submissions
ADD CONSTRAINT chk_female_method CHECK (
    (gender = 'female' AND method IN ('needle_prick', 'other')) OR
    (gender = 'male' AND method IN ('conventional_sleeve', 'dorsal_slit', 'laser', 'tara_klamp', 'alisklamp', 'plastibell', 'stapler_zsr', 'other'))
);

-- Create index for method_other searches
CREATE INDEX IF NOT EXISTS idx_circumcision_method_other ON circumcision_submissions(method_other) 
WHERE method_other IS NOT NULL;
