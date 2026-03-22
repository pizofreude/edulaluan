-- EduLaluan Database Schema
-- Migration: 007_contributions_allow_null_user.sql
-- Description: Make user_id nullable in contributions table for anonymous submissions
-- Date: March 2026

-- =============================================
-- MAKE USER_ID NULLABLE IN CONTRIBUTIONS
-- =============================================

-- Allow NULL user_id for anonymous contributions
ALTER TABLE contributions 
ALTER COLUMN user_id DROP NOT NULL;

-- Update comment
COMMENT ON COLUMN contributions.user_id IS 'User who made the contribution. NULL for anonymous submissions.';

-- Update ON DELETE behavior (already CASCADE, but making explicit)
-- Note: Existing FK constraint already has ON DELETE CASCADE
