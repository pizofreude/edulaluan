-- EduLaluan Database Schema
-- Migration: 027_add_username_to_users.sql
-- Description: Add username column for privacy-preserving public identity
-- Date: March 22, 2026

-- =============================================
-- ADD USERNAME TO USERS TABLE
-- =============================================

-- Add username column (nullable - optional for users)
ALTER TABLE users 
ADD COLUMN IF NOT EXISTS username TEXT,
ADD COLUMN IF NOT EXISTS username_updated_at TIMESTAMPTZ;

-- Add comment
COMMENT ON COLUMN users.username IS 'Unique public identifier for leaderboard and contributions. Can be changed once per 90 days.';
COMMENT ON COLUMN users.username_updated_at IS 'Timestamp of last username change (for cooldown enforcement)';

-- =============================================
-- CREATE UNIQUE INDEX (CASE-INSENSITIVE)
-- =============================================

-- Use functional index for case-insensitive uniqueness
-- This prevents both 'AhmadR' and 'ahmadr' from existing
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_username_lower 
ON users(LOWER(username)) 
WHERE username IS NOT NULL;

-- =============================================
-- ADD FORMAT VALIDATION CONSTRAINT
-- =============================================

-- Username rules:
-- - 3 to 30 characters
-- - Must start with a letter (a-z, A-Z)
-- - Can contain letters, numbers, and underscores only
-- - No spaces or special characters

ALTER TABLE users 
DROP CONSTRAINT IF EXISTS chk_username_format;

ALTER TABLE users 
ADD CONSTRAINT chk_username_format 
CHECK (
  username IS NULL OR (
    LENGTH(username) >= 3 AND 
    LENGTH(username) <= 30 AND 
    username ~ '^[a-zA-Z][a-zA-Z0-9_]*$'
  )
);

-- =============================================
-- ADD TRIGGER TO AUTO-UPDATE TIMESTAMP
-- =============================================

-- Function to update username_updated_at
CREATE OR REPLACE FUNCTION update_username_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.username IS DISTINCT FROM OLD.username THEN
    NEW.username_updated_at = CURRENT_TIMESTAMP;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Drop existing trigger if exists
DROP TRIGGER IF EXISTS trg_update_username_timestamp ON users;

-- Create trigger
CREATE TRIGGER trg_update_username_timestamp
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION update_username_updated_at();

-- =============================================
-- SET DEFAULT FOR NEW USERS (NULL - OPTIONAL)
-- =============================================

-- No default value - username is optional
-- Users can set it via UI when ready

-- =============================================
-- VERIFICATION QUERY
-- =============================================

-- Run this to verify the migration:
-- SELECT column_name, data_type, is_nullable
-- FROM information_schema.columns
-- WHERE table_name = 'users' AND column_name IN ('username', 'username_updated_at');
