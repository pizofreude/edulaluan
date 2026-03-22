-- EduLaluan Database Schema
-- Migration: 009_disable_circumcision_notify_trigger.sql
-- Description: Temporarily disable notification trigger to fix timezone error
-- Date: March 2026

-- =============================================
-- DISABLE NOTIFICATION TRIGGER
-- =============================================

-- Drop the notify trigger temporarily
DROP TRIGGER IF EXISTS on_circumcision_insert_notify ON circumcision_submissions;

-- Keep validation and contribution creation triggers
-- Notification can be re-enabled after fixing timezone issues
