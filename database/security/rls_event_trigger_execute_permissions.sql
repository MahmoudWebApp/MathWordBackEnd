-- MathWorld / Supabase database security hardening (2026-11-18)
--
-- The public.rls_auto_enable() function is a SECURITY DEFINER event-trigger
-- function. It automatically enables RLS on new public tables via event
-- trigger ensure_rls. It must not be RPC-callable by public Data API roles.
--
-- Applied to production Supabase on 2026-11-18 and verified using:
--   SELECT has_function_privilege('anon',
--     'public.rls_auto_enable()', 'EXECUTE');
--   SELECT has_function_privilege('authenticated',
--     'public.rls_auto_enable()', 'EXECUTE');
-- Both returned false. Event trigger ensure_rls remained enabled.
--
-- The ASP.NET backend uses PostgreSQL directly. Existing public tables
-- have RLS enabled; anon and authenticated have no direct table access.
-- The security advisor's "RLS enabled without policies" notices are
-- intentional for these backend-managed tables, not evidence of a bypass.

REVOKE EXECUTE ON FUNCTION public.rls_auto_enable()
  FROM PUBLIC, anon, authenticated;
