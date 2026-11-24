-- MathWorld production reconciliation preflight (read-only).
-- Run on the verified production target immediately before a controlled backup,
-- and again on an independently restored copy before/after rehearsing EF migrations.
-- No credentials or user-level records are returned. No DDL or DML is performed.
-- Expected: all six findings = 0. Nonzero findings require investigation.
-- Zero findings do NOT establish backup recoverability or full schema equivalence.
-- 2026-11-24: all six checks returned zero on the live MathWorldDB.
WITH public_tables AS (
 SELECT c.oid, c.relrowsecurity
 FROM pg_class c JOIN pg_namespace n ON n.oid=c.relnamespace
 WHERE n.nspname='public' AND c.relkind IN ('r','p')
), expected_indexes(name) AS (
 VALUES ('UX_Problems_StageQuestionArNormalized'),('UX_Problems_StageQuestionEnNormalized')
)
SELECT 'public tables with RLS disabled' AS check_name, count(*)::bigint AS findings
FROM public_tables WHERE NOT relrowsecurity
UNION ALL SELECT 'public tables granting API roles any direct table privilege',count(*)
FROM public_tables WHERE EXISTS (
 SELECT 1 FROM unnest(ARRAY['anon','authenticated']) AS r(role_name)
 CROSS JOIN unnest(ARRAY['SELECT','INSERT','UPDATE','DELETE','TRUNCATE','REFERENCES','TRIGGER']) AS p(priv)
 WHERE has_table_privilege(r.role_name,oid,p.priv))
UNION ALL SELECT 'missing or unusable normalized question indexes',count(*)
FROM expected_indexes e WHERE NOT EXISTS (
 SELECT 1 FROM pg_index i JOIN pg_class c ON c.oid=i.indexrelid
 WHERE c.relname=e.name AND i.indrelid='public."Problems"'::regclass
 AND i.indisunique AND i.indisvalid AND i.indisready)
UNION ALL SELECT 'unvalidated public constraints',count(*)
FROM pg_constraint WHERE connamespace='public'::regnamespace AND NOT convalidated
UNION ALL SELECT 'duplicate Arabic normalized question groups',count(*)
FROM (SELECT "StageId",md5(regexp_replace(lower(btrim("QuestionTextAr")),'[[:space:]]+',' ','g'))
 FROM public."Problems" GROUP BY 1,2 HAVING count(*)>1) d
UNION ALL SELECT 'duplicate English normalized question groups',count(*)
FROM (SELECT "StageId",md5(regexp_replace(lower(btrim("QuestionTextEn")),'[[:space:]]+',' ','g'))
 FROM public."Problems" GROUP BY 1,2 HAVING count(*)>1) d;

-- Capture aggregate counts from a consistent backup/maintenance window;
-- compare the restored copy with that snapshot, not with stale fixed values.
SELECT 'EF history' AS metric,count(*)::bigint AS total FROM public."__EFMigrationsHistory"
UNION ALL SELECT 'Supabase history',count(*) FROM supabase_migrations.schema_migrations
UNION ALL SELECT 'Problems',count(*) FROM public."Problems"
UNION ALL SELECT 'Categories',count(*) FROM public."Categories"
UNION ALL SELECT 'Stages',count(*) FROM public."EducationalStages"
UNION ALL SELECT 'Skills',count(*) FROM public."CurriculumSkills"
UNION ALL SELECT 'Users',count(*) FROM public."Users"
UNION ALL SELECT 'User progress',count(*) FROM public."UserProgresses"
UNION ALL SELECT 'Attempts',count(*) FROM public."ProblemAttempts"
UNION ALL SELECT 'Subscription grants',count(*) FROM public."SubscriptionGrants";

-- Backup/restore gate:
-- Free plan: no automatic daily backups. Use the documented Supabase CLI logical
-- backup procedure (roles, schema, data, and migration ledgers; separately preserve
-- storage objects and any required configuration). Keep encrypted off-repo.
-- https://supabase.com/docs/guides/platform/migrating-within-supabase/backup-restore
-- Verify restore on a separate PostgreSQL/Supabase instance, including data and
-- complete schema/grants/index definitions. Rehearse migration only there first.
-- Never run a reset, restore, or history repair against production as a test.
-- Do not merge #147 merely because this read-only preflight passes.
