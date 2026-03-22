-- EduLaluan Database Schema  
-- Migration: 020_nuke_contributions_table.sql
-- Description: Drop and recreate contributions table from scratch without any bugs
-- Date: March 2026

-- =============================================
-- NUKE AND RECREATE CONTRIBUTIONS TABLE
-- =============================================

-- Drop dependent objects first
DROP FUNCTION IF EXISTS insert_contribution_direct CASCADE;

-- Drop the table completely
DROP TABLE IF EXISTS contributions CASCADE;

-- Recreate from scratch with NO triggers, NO problematic defaults
CREATE TABLE contributions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE SET NULL,
    type TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    url TEXT,
    category_id UUID REFERENCES categories(id),
    status TEXT DEFAULT 'pending',
    points_earned INTEGER DEFAULT 0,
    moderator_id UUID REFERENCES public.users(id),
    moderated_at TIMESTAMPTZ,
    moderation_notes TEXT,
    rejection_reason TEXT,
    metadata JSONB DEFAULT '{}',
    submitted_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT chk_contribution_type CHECK (type IN ('resource', 'financial_aid', 'feature_request', 'issue_report', 'circumcision')),
    CONSTRAINT chk_contribution_status CHECK (status IN ('pending', 'approved', 'rejected', 'changes_requested'))
);

-- Create indexes
CREATE INDEX idx_contributions_user ON contributions(user_id);
CREATE INDEX idx_contributions_type ON contributions(type);
CREATE INDEX idx_contributions_status ON contributions(status);
CREATE INDEX idx_contributions_submitted ON contributions(submitted_at DESC);

-- Recreate the direct insert function
CREATE OR REPLACE FUNCTION insert_contribution_direct(
  p_type TEXT,
  p_title TEXT,
  p_description TEXT DEFAULT NULL,
  p_url TEXT DEFAULT NULL,
  p_metadata JSONB DEFAULT '{}'
) RETURNS UUID AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO contributions (type, title, description, url, metadata, status, submitted_at)
  VALUES (p_type, p_title, p_description, p_url, p_metadata, 'pending', CURRENT_TIMESTAMP)
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION insert_contribution_direct TO authenticated;
GRANT EXECUTE ON FUNCTION insert_contribution_direct TO anon;
