-- EduLaluan Database Schema
-- Migration: 012_disable_all_circumcision_triggers.sql
-- Description: Disable all triggers on circumcision_submissions to isolate the error
-- Date: March 2026

-- =============================================
-- DISABLE ALL TRIGGERS TEMPORARILY
-- =============================================

-- Drop all triggers on circumcision_submissions
DROP TRIGGER IF EXISTS on_circumcision_insert_validate ON circumcision_submissions;
DROP TRIGGER IF EXISTS on_circumcision_insert_create_contribution ON circumcision_submissions;
DROP TRIGGER IF EXISTS on_circumcision_insert_notify ON circumcision_submissions;
DROP TRIGGER IF EXISTS on_circumcision_approve_award_points ON circumcision_submissions;

-- Now submissions will work without any trigger processing
-- Triggers can be re-enabled one by one to identify the problematic one
