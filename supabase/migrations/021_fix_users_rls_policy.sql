-- EduLaluan Database Schema
-- Migration: 021_fix_users_rls_policy.sql
-- Description: Fix infinite recursion in users table RLS policy
-- Date: March 2026

-- =============================================
-- FIX USERS TABLE RLS POLICY
-- =============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Users are viewable by everyone" ON users;
DROP POLICY IF EXISTS "Users can update own profile" ON users;
DROP POLICY IF EXISTS "Enable read access for all users" ON users;

-- Create simple select policy that doesn't cause recursion
CREATE POLICY "Users are viewable by everyone" ON users
  FOR SELECT
  USING (true);

-- Allow users to update their own profile
CREATE POLICY "Users can update own profile" ON users
  FOR UPDATE
  USING (auth.uid() = id);

-- Allow authenticated users to insert their own profile
CREATE POLICY "Users can insert own profile" ON users
  FOR INSERT
  WITH CHECK (auth.uid() = id);
