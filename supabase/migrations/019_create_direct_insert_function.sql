-- EduLaluan Database Schema
-- Migration: 019_create_direct_insert_function.sql
-- Description: Create RPC function for direct insert without triggers
-- Date: March 2026

-- =============================================
-- CREATE DIRECT INSERT FUNCTION
-- =============================================

-- Create function that bypasses all triggers
CREATE OR REPLACE FUNCTION insert_contribution_direct(
  p_type TEXT,
  p_title TEXT,
  p_description TEXT DEFAULT NULL,
  p_url TEXT DEFAULT NULL,
  p_metadata JSONB DEFAULT '{}'
) RETURNS UUID AS $$
DECLARE
  new_id UUID;
BEGIN
  INSERT INTO contributions (type, title, description, url, metadata, status, submitted_at)
  VALUES (p_type, p_title, p_description, p_url, p_metadata, 'pending', NOW())
  RETURNING id INTO new_id;
  
  RETURN new_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission
GRANT EXECUTE ON FUNCTION insert_contribution_direct TO authenticated;
GRANT EXECUTE ON FUNCTION insert_contribution_direct TO anon;
