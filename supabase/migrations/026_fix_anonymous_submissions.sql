-- EduLaluan Database Schema
-- Migration: 026_fix_anonymous_submissions.sql
-- Description: Add is_anonymous flag and fix user_id tracking for contributions
-- Date: March 22, 2026

-- =============================================
-- FIX ANONYMOUS SUBMISSIONS
-- =============================================

-- Add is_anonymous column to contributions table
ALTER TABLE contributions 
ADD COLUMN IF NOT EXISTS is_anonymous BOOLEAN DEFAULT false;

-- Add comment
COMMENT ON COLUMN contributions.is_anonymous IS 'If true, hide submitter identity in admin UI';

-- Create index for filtering
CREATE INDEX IF NOT EXISTS idx_contributions_anonymous ON contributions(is_anonymous);

-- =============================================
-- UPDATE INSERT FUNCTION TO ACCEPT USER_ID
-- =============================================

-- Drop old function
DROP FUNCTION IF EXISTS insert_contribution_direct(TEXT, TEXT, TEXT, TEXT, JSONB);

-- Recreate with user_id and is_anonymous parameters
CREATE OR REPLACE FUNCTION insert_contribution_direct(
  p_user_id UUID,
  p_type TEXT,
  p_title TEXT,
  p_description TEXT DEFAULT NULL,
  p_url TEXT DEFAULT NULL,
  p_metadata JSONB DEFAULT '{}',
  p_is_anonymous BOOLEAN DEFAULT false
) RETURNS UUID AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO contributions (user_id, type, title, description, url, metadata, is_anonymous, status, submitted_at)
  VALUES (p_user_id, p_type, p_title, p_description, p_url, p_metadata, p_is_anonymous, 'pending', CURRENT_TIMESTAMP)
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- UPDATE EXISTING NULL USER_IDS
-- =============================================

-- Note: Existing contributions with NULL user_id will remain anonymous
-- This is intentional to preserve historical data
