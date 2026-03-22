-- EduLaluan Database Schema
-- Migration: 025_add_role_system.sql
-- Description: Add proper role hierarchy with Super Admin protection
-- Date: March 2026

-- =============================================
-- ROLE SYSTEM MIGRATION
-- =============================================

-- 1. Add role column to users table
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS role TEXT DEFAULT 'user' CHECK (role IN ('super_admin', 'admin', 'moderator', 'user'));

-- 2. Migrate existing flags to role system
-- Set Super Admin (you)
UPDATE public.users 
SET role = 'super_admin' 
WHERE email = 'ahafeezs@outlook.de' OR email LIKE '%pizofreude%';

-- Set Admins (previously is_admin = true)
UPDATE public.users 
SET role = 'admin' 
WHERE (is_admin = true OR is_moderator = true) 
AND role = 'user';

-- 3. Drop old flag columns (optional - commented out for safety)
-- ALTER TABLE public.users DROP COLUMN IF EXISTS is_admin;
-- ALTER TABLE public.users DROP COLUMN IF EXISTS is_moderator;

-- 4. Create index for role lookups
CREATE INDEX IF NOT EXISTS idx_users_role ON public.users(role);

-- =============================================
-- SUPER ADMIN PROTECTION
-- =============================================

-- Function to prevent Super Admin removal/demotion
CREATE OR REPLACE FUNCTION public.protect_super_admin()
RETURNS TRIGGER AS $$
BEGIN
    -- Prevent deleting super admins
    IF TG_OP = 'DELETE' AND OLD.role = 'super_admin' THEN
        RAISE EXCEPTION 'Cannot remove Super Admin account. This action is blocked for system security.';
    END IF;
    
    -- Prevent demoting super admins
    IF TG_OP = 'UPDATE' AND OLD.role = 'super_admin' AND NEW.role != 'super_admin' THEN
        RAISE EXCEPTION 'Cannot demote Super Admin. This action is blocked for system security.';
    END IF;
    
    -- Prevent changing super admin's email (prevents account takeover)
    IF TG_OP = 'UPDATE' AND OLD.role = 'super_admin' AND NEW.email != OLD.email THEN
        RAISE EXCEPTION 'Cannot change Super Admin email. Contact system support if this needs to be changed.';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create protection trigger
DROP TRIGGER IF EXISTS protect_super_admin ON public.users;
CREATE TRIGGER protect_super_admin
    BEFORE UPDATE OR DELETE ON public.users
    FOR EACH ROW
    EXECUTE FUNCTION public.protect_super_admin();

-- =============================================
-- ROLE-BASED ACCESS CONTROL (RLS Policies)
-- =============================================

-- Enable RLS on users table
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Drop existing policies to recreate with role checks
DROP POLICY IF EXISTS "Users can view own profile" ON public.users;
DROP POLICY IF EXISTS "Users can update own profile" ON public.users;
DROP POLICY IF EXISTS "System can create user records" ON public.users;
DROP POLICY IF EXISTS "Admins can view all users" ON public.users;
DROP POLICY IF EXISTS "Super admin can manage admin roles" ON public.users;

-- Policy 1: Users can view their own profile
CREATE POLICY "Users can view own profile" ON public.users
    FOR SELECT
    USING (auth.uid() = id);

-- Policy 2: Admins and Super Admins can view all users
CREATE POLICY "Admins can view all users" ON public.users
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.users cu
            WHERE cu.id = auth.uid()
            AND cu.role IN ('super_admin', 'admin')
        )
    );

-- Policy 3: Users can update their own profile (except role)
CREATE POLICY "Users can update own profile" ON public.users
    FOR UPDATE
    USING (auth.uid() = id)
    WITH CHECK (
        auth.uid() = id AND 
        role = (SELECT role FROM public.users WHERE id = auth.uid())
    );

-- Policy 4: Super Admin can manage admin roles (invite/remove admins)
CREATE POLICY "Super admin can manage admin roles" ON public.users
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.users cu
            WHERE cu.id = auth.uid()
            AND cu.role = 'super_admin'
        )
    );

-- Policy 5: System can create user records (for OAuth trigger)
CREATE POLICY "System can create user records" ON public.users
    FOR INSERT
    WITH CHECK (true);

-- =============================================
-- UPDATE OAUTH TRIGGER TO USE ROLE
-- =============================================

-- Drop old trigger
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS public.create_public_user_record();
DROP FUNCTION IF EXISTS public.handle_new_user();

-- Create new function with role support
CREATE OR REPLACE FUNCTION public.create_public_user_record()
RETURNS TRIGGER 
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.users (id, email, full_name, avatar_url, role, points_balance, tier)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1)),
        COALESCE(NEW.raw_user_meta_data->>'avatar_url', NULL),
        -- Auto-set Super Admin for specific emails
        CASE 
            WHEN NEW.email LIKE '%pizofreude%' OR NEW.email LIKE '%ahafeezs%' 
            THEN 'super_admin'
            ELSE 'user'
        END,
        10,  -- Welcome bonus points
        1    -- Newcomer tier
    )
    ON CONFLICT (id) DO UPDATE SET
        email = EXCLUDED.email,
        full_name = COALESCE(EXCLUDED.full_name, public.users.full_name),
        avatar_url = COALESCE(EXCLUDED.avatar_url, public.users.avatar_url);
    
    RETURN NEW;
END;
$$;

-- Recreate trigger
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION public.create_public_user_record();

-- =============================================
-- HELPER FUNCTIONS FOR ADMIN MANAGEMENT
-- =============================================

-- Function to check if current user is Super Admin
CREATE OR REPLACE FUNCTION public.is_super_admin()
RETURNS BOOLEAN AS $$
DECLARE
    cu_role TEXT;
BEGIN
    SELECT role INTO cu_role
    FROM public.users
    WHERE id = auth.uid();
    
    RETURN cu_role = 'super_admin';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to check if current user is Admin or Super Admin
CREATE OR REPLACE FUNCTION public.is_admin_or_higher()
RETURNS BOOLEAN AS $$
DECLARE
    cu_role TEXT;
BEGIN
    SELECT role INTO cu_role
    FROM public.users
    WHERE id = auth.uid();
    
    RETURN cu_role IN ('super_admin', 'admin');
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to check if current user is Moderator or higher
CREATE OR REPLACE FUNCTION public.is_moderator_or_higher()
RETURNS BOOLEAN AS $$
DECLARE
    cu_role TEXT;
BEGIN
    SELECT role INTO cu_role
    FROM public.users
    WHERE id = auth.uid();
    
    RETURN cu_role IN ('super_admin', 'admin', 'moderator');
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- VERIFICATION QUERIES
-- =============================================

-- Run these to verify the migration:

-- 1. Check your role
-- SELECT email, role FROM public.users WHERE email = 'ahafeezs@outlook.de';
-- Should return: role = 'super_admin'

-- 2. Check all roles distribution
-- SELECT role, COUNT(*) FROM public.users GROUP BY role;

-- 3. Test Super Admin protection (should fail)
-- UPDATE public.users SET role = 'user' WHERE email = 'ahafeezs@outlook.de';
-- Should raise: "Cannot demote Super Admin"

-- 4. Test helper functions
-- SELECT public.is_super_admin(); -- Should return true for you
