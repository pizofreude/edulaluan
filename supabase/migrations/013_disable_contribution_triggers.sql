-- EduLaluan Database Schema
-- Migration: 013_disable_contribution_triggers.sql
-- Description: Disable contribution triggers that have timezone bugs
-- Date: March 2026

-- =============================================
-- DISABLE CONTRIBUTION TRIGGERS
-- =============================================

-- Drop triggers that call functions with timezone bugs
DROP TRIGGER IF EXISTS notify_new_contribution ON contributions;
DROP TRIGGER IF EXISTS check_submission_limit ON contributions;
DROP TRIGGER IF EXISTS create_weekly_submission_limit ON contributions;

-- Triggers can be re-enabled after fixing timezone issues in functions
