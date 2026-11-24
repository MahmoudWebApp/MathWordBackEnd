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

## Supabase migration ledger cross-check

A separate **read-only** query using the Supabase migration-ledger interface found eight Supabase schema migration records:

| Supabase migration ID | Supabase migration name | Corresponding EF migration or area (inferred by name/effects; compare SQL before certifying equivalence) |
| --- | --- | --- |
| `20261113081151` | `mathworld_add_student_learning_stage_fix_20261113` | Student-stage schema, earlier work |
| `20261120183534` | `mathworld_bilingual_stage_category_descriptions_20261120` | `20261120193000_BilingualCurriculumDescriptions` |
| `20261121181652` | `curriculum_taxonomy_20261121` | `20261121220000_CurriculumTaxonomy` |
| `20261121181720` | `secure_curriculum_taxonomy_20261121` | Taxonomy access/grants and RLS |
| `20261121183315` | `curriculum_skills_category_index_20261121` | Taxonomy skill/category indexes |
| `20261121185633` | `curriculum_editorial_topic_proposals_20261121` | `20261121231500_CurriculumTopicProposals` |
| `20261121185926` | `curriculum_private_draft_items_20261121` | `20261121233000_CurriculumDraftItems` |
| `20261121205359` | `prevent_duplicate_stage_questions_20261121` | `20261121235500_PreventDuplicateProblemQuestions` |

**Root-cause hypothesis sharpened:** the same conceptual changes were implemented through Supabase migrations, while corresponding later Entity Framework migrations remain unapplied in `__EFMigrationsHistory`. Because the two migration systems use different ledgers and IDs, the current state can remain *physically present but logically pending* to EF. **Matching names are not proof of byte-for-byte DDL equivalence.** Compare migration SQL, defaults, constraints, index functions, RLS/grants, data changes and schema snapshots on an isolated restore before choosing one canonical migration authority or recording any reconciliation.

The Supabase project currently reports **zero development branches**, so there is no pre-existing isolated branch to serve as a restore/rehearsal environment. Creating one may incur usage charges and does not automatically copy production data; do not create it automatically. The user database was **not modified** during this check.

## Verified semantic differences between migration systems

Inspected the actual SQL stored in `supabase_migrations.schema_migrations.statements` and reopened all five EF Core `Migrations/*.cs` files on `main` (read-only on the live DB). **These differences are proven from the source scripts**, rather than inferred from migration names:

| Area | Supabase migration | Corresponding EF `Up()` | Consequence |
| --- | --- | --- | --- |
| Stage/category descriptions | Adds bilingual columns **and conditionally fills initial descriptions** for four stages and the initial sixteen categories | Adds the same four columns but **does not seed descriptions** | A fresh EF-only installation can lack the public descriptions that already exist on the Supabase-managed installation |
| Curriculum taxonomy access control | Separate `secure_curriculum_taxonomy_20261121` enables RLS on five core taxonomy tables and revokes direct `anon/authenticated` access to them; another migration adds the category index | `20261121220000_CurriculumTaxonomy` defines the tables and category index but **does not enable RLS or revoke API-role access on the five taxonomy tables** | Fresh EF-only database setup would not reproduce the existing taxonomy security configuration; assess Data API exposure and add a reviewed equivalent hardening step before release |
| Topic proposals / private drafts | Table/index creation, RLS and revoke grants | Conditional table/index creation, enables RLS and conditionally revokes grants where roles exist | Broad design agrees; full schema checks still required |
| Normalized-question uniqueness | Two unique functional indexes on Arabic/English question text per stage | Same functional unique indexes using MD5 and normalized whitespace | Broad design agrees; verify actual expression definitions rather than treating index names as proof |

**Never equate the Supabase migration ledger with EF Core history.** The databases can have the same objects while startup readiness still detects pending EF migrations. Do not backfill `__EFMigrationsHistory`, replay historical migrations, or change DDL on production until an isolated restore and precise schema/data equivalence review is complete.

Suggested safe next step: a **version-controlled, additive security migration** for future EF-managed installations, paired with a documented data-only seed strategy, after deciding the single schema migration authority. Do **not** rewrite already-shipped migration history in an uncontrolled environment.

## Safe reconciliation gate

1. **Freeze writes to the target during the controlled change window** and save the actual application commit, applied migration list, schema dump, and a restorable backup. Test restore on a separate database. Do not copy production secrets into GitHub or test artifacts.
2. On the restored/isolated database, compare each `Up()` migration to the actual schema, including RLS/grants, indexes, unique key behavior, FKs, data types, defaults, column nullability, and any prior hand-run scripts.
3. Resolve each discrepancy with a reviewed *additive* corrective migration or exact data-preserving SQL after testing. A migration present in Git history but absent from EF history **must not** be assumed safe to replay without review. Make no historical data edits without a rollback plan.
4. Reconcile EF history **only after verifying effects precisely**, and with a documented change reviewed under the real deployed EF Core runtime version. Review the future `dotnet ef database update` plan for unexpected actions on a restore first.
5. Recheck migration count, known constraints, row totals, login, four-option/single-correct checks, existing user progress, subscriptions, published curriculum and student APIs. Only then classify the blocker resolved.
6. Review Supabase advisor results independently. `rls_enabled_no_policy` at `INFO` can be deliberate when the app uses a private service-side database connection; check exposed API grants and role separation before adding policies. Do not remove an index only because an advisor says "unused".

## Read-only object-level comparison (follow-up)

Compared the actual MathWorldDB schema against the five later `Up()` migration files without running any DDL:

- **All 19 checked objects exist:** the seven curriculum tables and twelve explicitly named secondary/unique indexes, including both normalized-question unique indexes.
- Four stage/category bilingual description columns exist with `text NOT NULL DEFAULT ''`, consistent with the checked migration.
- Checked curriculum FKs, primary keys, uniqueness and validation constraints appear present, including a non-self prerequisite check, skill-standard mapping type constraint, topic proposed-count constraint and draft difficulty 1–5 check. This is a targeted check, **not** an exhaustive exact-schema equivalence proof.
- On `CurriculumDraftItems` and `CurriculumTopicProposals`, RLS is enabled, and direct `SELECT` privileges are absent for both `anon` and `authenticated` database roles. Do not interpret an `rls_enabled_no_policy` informational lint alone as proof of unauthorized access.
- **None of the five migration IDs is recorded in the EF history table.** This mismatch remains active despite the presence of the observed objects.
- `Program.cs` applies migrations on startup only when `Database:ApplyMigrationsOnStartup` is enabled, and the `/health/ready` endpoint checks pending EF migrations. **The actual Render environment configuration and running backend revision were not verified**, so no claim is made that production automatically migrates or that readiness is green.
- Production reconciliation must account for migrations that use `CREATE TABLE IF NOT EXISTS`: if a table exists with a different shape, this syntax does not repair it. Verify all columns, types, defaults, constraints, indexes, grants, RLS and previous manual SQL against a **restored isolated** database before updating EF history or applying new migrations.

**Disposition:** audit refined; **P0 schema-history blocker remains open**. No production SQL write performed.

## Initial safe content checks (2026-11-24)

Read-only counts: **4 stages, 35 categories, 773 problems, 140 published skills, 234 published editorial items**. Integrity checks: **0** problems with fewer/more than four options; **0** problems without exactly one correct option; **0** empty categories; **0** published skills without problem mappings. These checks do not certify mathematical correctness or solutions. All counts are dated snapshots, not expected constants.

**Status:** needs isolated restore-based comparison before any production EF migration. This audit intentionally makes no database changes.
