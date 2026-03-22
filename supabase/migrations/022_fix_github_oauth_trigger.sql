-- EduLaluan Database Schema
-- Migration: 022_fix_github_oauth_trigger.sql
-- Description: Fix GitHub OAuth user creation by using SECURITY INVOKER
-- Date: March 2026

-- =============================================
-- FIX OAUTH USER CREATION
-- =============================================

-- Drop and recreate the function with SECURITY INVOKER instead of DEFINER
-- This allows the trigger to run with the user's permissions during OAuth flow
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS create_public_user_record();

-- Recreate function with SECURITY INVOKER
CREATE OR REPLACE FUNCTION create_public_user_record()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert with explicit ID to match auth.users
    INSERT INTO public.users (id, email, full_name, avatar_url, is_admin)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1)),
        COALESCE(NEW.raw_user_meta_data->>'avatar_url', NULL),
        -- Auto-set super admin for pizofreude
        CASE 
            WHEN NEW.email = 'pizofreude@users.noreply.github.com' THEN true
            ELSE false
        END
    )
    ON CONFLICT (id) DO NOTHING;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Recreate trigger
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION create_public_user_record();

-- Ensure public.users table allows inserts from auth trigger
-- This policy allows the trigger to insert user records
DROP POLICY IF EXISTS "System can create user records" ON users;
CREATE POLICY "System can create user records" ON users
    FOR INSERT
    WITH CHECK (true);

-- Allow users to view their own profile
DROP POLICY IF EXISTS "Users can view own profile" ON users;
CREATE POLICY "Users can view own profile" ON users
    FOR SELECT
    USING (auth.uid() = id);

-- Allow users to update their own profile
DROP POLICY IF EXISTS "Users can update own profile" ON users;
CREATE POLICY "Users can update own profile" ON users
    FOR UPDATE
    USING (auth.uid() = id);
