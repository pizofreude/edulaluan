-- EduLaluan Database Schema
-- Migration: 028_reserved_usernames.sql
-- Description: Create reserved_usernames table to prevent squatting on important names
-- Date: March 22, 2026

-- =============================================
-- CREATE RESERVED_USERNAMES TABLE
-- =============================================

CREATE TABLE IF NOT EXISTS reserved_usernames (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  username TEXT NOT NULL,
  reason TEXT DEFAULT 'System reserved',
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  
  CONSTRAINT chk_reserved_username_format 
  CHECK (
    LENGTH(username) >= 3 AND 
    LENGTH(username) <= 30 AND 
    username ~ '^[a-zA-Z][a-zA-Z0-9_]*$'
  )
);

-- Create unique index (case-insensitive)
CREATE UNIQUE INDEX IF NOT EXISTS idx_reserved_usernames_lower 
ON reserved_usernames(LOWER(username));

-- Create index for fast lookups
CREATE INDEX IF NOT EXISTS idx_reserved_usernames_username 
ON reserved_usernames(username);

-- Add comment
COMMENT ON TABLE reserved_usernames IS 'Prevents users from claiming important, brand, or system-related usernames';
COMMENT ON COLUMN reserved_usernames.reason IS 'Reason for reservation (e.g., "System reserved", "Brand protection", "Profanity filter")';

-- =============================================
-- SEED RESERVED USERNAMES
-- =============================================

-- System & Administrative Names
INSERT INTO reserved_usernames (username, reason) VALUES
  ('admin', 'System reserved - administrative account'),
  ('administrator', 'System reserved - administrative account'),
  ('superadmin', 'System reserved - super administrator'),
  ('moderator', 'System reserved - moderation team'),
  ('system', 'System reserved - system account'),
  ('root', 'System reserved - root account'),
  ('sysop', 'System reserved - system operator'),
  ('support', 'System reserved - support team'),
  ('help', 'System reserved - help desk'),
  ('service', 'System reserved - service account');

-- Brand & Product Names
INSERT INTO reserved_usernames (username, reason) VALUES
  ('edulaluan', 'Brand protection - project name'),
  ('edulaluan_team', 'Brand protection - official team'),
  ('edulaluan_official', 'Brand protection - official account'),
  ('krackathon', 'Brand protection - event name'),
  ('godamsahur', 'Brand protection - partner name');

-- Confusion Prevention
INSERT INTO reserved_usernames (username, reason) VALUES
  ('null', 'Confusion prevention - null value'),
  ('undefined', 'Confusion prevention - undefined value'),
  ('anonymous', 'Confusion prevention - anonymous submissions'),
  ('unknown', 'Confusion prevention - unknown user'),
  ('deleted', 'Confusion prevention - deleted accounts'),
  ('removed', 'Confusion prevention - removed accounts');

-- Common Short Names (prevent squatting)
INSERT INTO reserved_usernames (username, reason) VALUES
  ('user', 'Common name reservation'),
  ('guest', 'Common name reservation'),
  ('visitor', 'Common name reservation'),
  ('member', 'Common name reservation'),
  ('test', 'Common name reservation'),
  ('testing', 'Common name reservation'),
  ('demo', 'Common name reservation'),
  ('example', 'Common name reservation');

-- Malaysian Context (respect cultural sensitivity)
INSERT INTO reserved_usernames (username, reason) VALUES
  ('datuk', 'Cultural title - respect'),
  ('tan_sri', 'Cultural title - respect'),
  ('tun', 'Cultural title - respect'),
  ('sultan', 'Cultural title - respect'),
  ('raja', 'Cultural title - respect');

-- =============================================
-- CREATE FUNCTION TO CHECK RESERVED USERNAMES
-- =============================================

CREATE OR REPLACE FUNCTION is_username_reserved(check_username TEXT)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM reserved_usernames 
    WHERE LOWER(username) = LOWER(check_username)
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- ADD TRIGGER TO PREVENT RESERVED USERNAME INSERT
-- =============================================

-- Function to check reserved usernames before insert/update
CREATE OR REPLACE FUNCTION check_reserved_username()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if new username is reserved
  IF NEW.username IS NOT NULL AND 
     EXISTS (
       SELECT 1 FROM reserved_usernames 
       WHERE LOWER(username) = LOWER(NEW.username)
     ) THEN
    RAISE EXCEPTION 'Username "%" is reserved and cannot be used', NEW.username;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Drop existing trigger if exists
DROP TRIGGER IF EXISTS trg_check_reserved_username ON users;

-- Create trigger
CREATE TRIGGER trg_check_reserved_username
  BEFORE INSERT OR UPDATE OF username ON users
  FOR EACH ROW
  EXECUTE FUNCTION check_reserved_username();

-- =============================================
-- VERIFICATION QUERY
-- =============================================

-- Run this to verify the migration:
-- SELECT COUNT(*) as total_reserved FROM reserved_usernames;
-- SELECT username, reason FROM reserved_usernames ORDER BY username;

-- Test the function:
-- SELECT is_username_reserved('admin'); -- Should return true
-- SELECT is_username_reserved('ahmadr'); -- Should return false
