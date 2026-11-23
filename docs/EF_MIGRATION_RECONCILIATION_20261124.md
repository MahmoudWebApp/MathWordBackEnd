# EF Core / PostgreSQL migration-history reconciliation — MathWorld

**Read-only audit, 2026-11-24. Do not run migrations or mutate production from this document.**

## Confirmed mismatch

The MathWorldDB PostgreSQL database reported **19** rows in `public."__EFMigrationsHistory"`; the newest was `20261117210000_AddStudentNotifications`. The default backend branch includes these five later migrations, **none of which appears in the EF history table**:

| Migration ID | Observed database effects (sample, not an exhaustive schema diff) |
| --- | --- |
| `20261120193000_BilingualCurriculumDescriptions` | `EducationalStages.DescriptionAr/En` and `Categories.DescriptionAr/En` present |
| `20261121220000_CurriculumTaxonomy` | `CurriculumDomains`, `CurriculumSkills` present |
| `20261121231500_CurriculumTopicProposals` | `CurriculumTopicProposals` present |
| `20261121233000_CurriculumDraftItems` | `CurriculumDraftItems` present |
| `20261121235500_PreventDuplicateProblemQuestions` | Both `UX_Problems_StageQuestionArNormalized` and `UX_Problems_StageQuestionEnNormalized` present |

**Implication:** Objects may have been added by direct SQL or a partial out-of-band deployment. The presence of an object is *not* proof that all columns, defaults, constraints, indexes, permissions and policies match the migration. Do **not** repair this by blindly inserting into `__EFMigrationsHistory`, dropping tables, rerunning all migrations on production, or resetting the database.

## Read-only queries for reproduction

Use a read-only connection, never print connection strings, and verify the targeted database is the expected MathWorld database.

```sql
SELECT "MigrationId", "ProductVersion"
FROM public."__EFMigrationsHistory"
ORDER BY "MigrationId";

WITH expected(migration_id) AS (VALUES
 ('20261120193000_BilingualCurriculumDescriptions'),
 ('20261121220000_CurriculumTaxonomy'),
 ('20261121231500_CurriculumTopicProposals'),
 ('20261121233000_CurriculumDraftItems'),
 ('20261121235500_PreventDuplicateProblemQuestions')
)
SELECT e.migration_id, h."MigrationId" IS NOT NULL AS tracked
FROM expected e
LEFT JOIN public."__EFMigrationsHistory" h ON e.migration_id = h."MigrationId"
ORDER BY e.migration_id;

SELECT table_name, column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN (
   'EducationalStages','Categories','CurriculumDomains','CurriculumSkills',
   'CurriculumTopicProposals','CurriculumDraftItems','Problems')
ORDER BY table_name, ordinal_position;

SELECT schemaname, tablename, indexname, indexdef
FROM pg_catalog.pg_indexes
WHERE schemaname = 'public' AND
 (tablename IN ('Problems','CurriculumSkills','CurriculumTopicProposals','CurriculumDraftItems'))
ORDER BY tablename, indexname;

SELECT conrelid::regclass AS table_name, conname, contype, pg_get_constraintdef(oid) AS definition
FROM pg_catalog.pg_constraint
WHERE connamespace = 'public'::regnamespace
  AND conrelid::regclass::text IN
    ('"CurriculumDomains"','"CurriculumSkills"','"CurriculumTopicProposals"','"CurriculumDraftItems"')
ORDER BY 1, 2;
```

## Safe reconciliation gate

1. **Freeze writes to the target during the controlled change window** and save the actual application commit, applied migration list, schema dump, and a restorable backup. Test restore on a separate database. Do not copy production secrets into GitHub or test artifacts.
2. On the restored/isolated database, compare each `Up()` migration to the actual schema, including RLS/grants, indexes, unique key behavior, FKs, data types, defaults, column nullability, and any prior hand-run scripts.
3. Resolve each discrepancy with a reviewed *additive* corrective migration or exact data-preserving SQL after testing. A migration present in Git history but absent from EF history **must not** be assumed safe to replay without review. Make no historical data edits without a rollback plan.
4. Reconcile EF history **only after verifying effects precisely**, and with a documented change reviewed under the real deployed EF Core runtime version. Review the future `dotnet ef database update` plan for unexpected actions on a restore first.
5. Recheck migration count, known constraints, row totals, login, four-option/single-correct checks, existing user progress, subscriptions, published curriculum and student APIs. Only then classify the blocker resolved.
6. Review Supabase advisor results independently. `rls_enabled_no_policy` at `INFO` can be deliberate when the app uses a private service-side database connection; check exposed API grants and role separation before adding policies. Do not remove an index only because an advisor says "unused".

## Initial safe content checks (2026-11-24)

Read-only counts: **4 stages, 35 categories, 773 problems, 140 published skills, 234 published editorial items**. Integrity checks: **0** problems with fewer/more than four options; **0** problems without exactly one correct option; **0** empty categories; **0** published skills without problem mappings. These checks do not certify mathematical correctness or solutions. All counts are dated snapshots, not expected constants.

**Status:** needs isolated restore-based comparison before any production EF migration. This audit intentionally makes no database changes.
