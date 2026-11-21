# Curriculum taxonomy implementation — batch 1 (2026-11-21)

## Applied to connected MathWorldDB
- Added tables: CurriculumDomains, CurriculumSkills, CurriculumSkillStandards, CurriculumSkillPrerequisites, CurriculumProblemSkills.
- Enabled RLS on all five newly added tables and revoked anon/authenticated table access. Backend direct database access is expected; public API explicitly selects published material only.
- Seeded 8 **draft / unpublished** domain definitions. The eight are top-level domains, NOT a mandated category count.
- Audited **existing primary stage/category 1**: the 26 question texts were individually inspected. Seeded 6 draft skills with 26 primary question links:
  - addition 1
  - subtraction 3 (IDs 3 and 4 are exact duplicates)
  - multistep arithmetic 5 (same numerical pattern repeated)
  - multiplication 7
  - division 5
  - multiplicative word problems 5 (same pen-price template repeated).
- All existing question bank, student accounts, subscriptions, user progress and attempts left in place until replacement content is reviewed.
- No CCSS/Cambridge standard-to-skill mapping has been asserted yet: mapping requires exact grade/objective verification; PISA is a reasoning framework, not a blanket accreditation.
- Nothing new has been published to learners.

## Code on feature/curriculum-standards-taxonomy-2026-11
- Models/CurriculumTaxonomy.cs: five linked entities.
- Data/AppDbContext.cs: EF Core mappings, keys and indexes.
- Migrations/20261121220000_CurriculumTaxonomy.cs: idempotent schema creation.
- Controllers/CurriculumController.cs: bilingual standards disclaimer, published domains API, stage-scoped published skills API.

## Integration caveats
- Direct Supabase migrations were applied separately from EF migrations: before any Render rollout, reconcile EF migration history, update the EF model snapshot, ensure seed/security migrations are reproducible and run a .NET build/test. Do NOT mark Render deployment as complete.
- No corresponding Next.js or Flutter code changes yet. UI cannot show skills until reviewed and published.
- Subsequent work needs curriculum review of remaining 360 problems, replacement of repetitive templates, stage-specific taxonomy (including university references), Free/Premium regression tests, and public + Flutter curriculum explanation UI.
