-- Check what's actually causing the error
-- Run this in Supabase SQL Editor

-- List ALL triggers on contributions table
SELECT 
    tgname as trigger_name,
    tgrelid::regclass as table_name,
    pg_get_triggerdef(oid) as definition
FROM pg_trigger 
WHERE tgrelid = 'contributions'::regclass;

-- Check if there are any functions with date_trunc
SELECT 
    proname as function_name,
    prosrc as source_code
FROM pg_proc 
WHERE prosrc LIKE '%date_trunc%Monday%';
