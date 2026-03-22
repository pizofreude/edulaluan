-- EduLaluan Database Schema
-- Migration: 023_fix_oauth_user_creation.sql
-- Description: Simplify OAuth user creation - remove problematic trigger
-- Date: March 2026

-- =============================================
-- SIMPLIFY OAUTH USER CREATION
-- =============================================

-- Drop the problematic trigger
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS create_public_user_record();

-- Create a simpler function that handles duplicates gracefully
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    -- Use INSERT ... ON CONFLICT DO NOTHING to avoid duplicates
    INSERT INTO public.users (id, email, full_name, avatar_url, is_admin)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1)),
        COALESCE(NEW.raw_user_meta_data->>'avatar_url', NULL),
        CASE 
            WHEN NEW.email LIKE '%pizofreude%' THEN true
            ELSE false
        END
    )
    ON CONFLICT (id) DO UPDATE SET
        email = EXCLUDED.email,
        full_name = COALESCE(EXCLUDED.full_name, public.users.full_name),
        avatar_url = COALESCE(EXCLUDED.avatar_url, public.users.avatar_url);
    
    RETURN NEW;
EXCEPTION
    WHEN OTHERS THEN
        -- Log error but don't fail the auth flow
        RAISE NOTICE 'Error creating user record: %', SQLERRM;
        RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Recreate trigger with the new function
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_new_user();

-- Make sure users table has proper constraints
-- Email should be unique but allow NULLs for OAuth users who don't provide email
ALTER TABLE public.users DROP CONSTRAINT IF EXISTS users_email_key;
CREATE UNIQUE INDEX IF NOT EXISTS users_email_idx ON public.users(email) WHERE email IS NOT NULL;
