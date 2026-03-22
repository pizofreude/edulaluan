-- EduLaluan Database Schema
-- Migration: 015_fix_contributions_table.sql
-- Description: Recreate contributions table without problematic triggers/constraints
-- Date: March 2026

-- =============================================
-- FIX CONTRIBUTIONS TABLE
-- =============================================

-- First, drop the problematic foreign key to users (causes cascade issues)
ALTER TABLE contributions DROP CONSTRAINT IF EXISTS contributions_user_id_fkey;

-- Recreate without CASCADE (use SET NULL instead)
ALTER TABLE contributions 
ADD CONSTRAINT contributions_user_id_fkey 
FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;

-- Drop any remaining triggers that might call timezone functions
DROP TRIGGER IF EXISTS on_contribution_insert ON contributions;
DROP TRIGGER IF EXISTS on_contribution_update ON contributions;
DROP TRIGGER IF EXISTS contribution_before_insert ON contributions;

-- Drop functions that might be called
DROP FUNCTION IF EXISTS process_contribution_insert();
DROP FUNCTION IF EXISTS process_contribution_update();
