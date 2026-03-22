-- EduLaluan Database Schema
-- Migration: 024_manual_create_super_admin.sql
-- Description: Manually create super admin user for pizofreude
-- Date: March 2026

-- =============================================
-- MANUAL SUPER ADMIN CREATION
-- =============================================

-- First, find your auth.users record
-- Run this query to get your auth user ID:
-- SELECT id, email FROM auth.users WHERE email LIKE '%pizofreude%';

-- Then manually insert into public.users
-- Replace 'YOUR-AUTH-USER-ID' with your actual auth user ID from the query above

INSERT INTO public.users (id, email, full_name, avatar_url, is_admin, is_moderator, points_balance, tier)
SELECT 
    id,
    email,
    COALESCE(raw_user_meta_data->>'full_name', split_part(email, '@', 1)) as full_name,
    raw_user_meta_data->>'avatar_url' as avatar_url,
    true as is_admin,  -- Make you super admin
    false as is_moderator,
    10 as points_balance,  -- Welcome bonus
    1 as tier
FROM auth.users
WHERE email LIKE '%pizofreude%'
ON CONFLICT (id) DO UPDATE SET
    is_admin = true,
    email = EXCLUDED.email,
    full_name = COALESCE(EXCLUDED.full_name, public.users.full_name);

-- Verify the user was created
-- SELECT email, is_admin, is_moderator, points_balance FROM public.users WHERE email LIKE '%pizofreude%';
