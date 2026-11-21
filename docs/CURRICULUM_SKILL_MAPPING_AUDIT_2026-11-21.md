# Curriculum taxonomy: initial live-data tagging (2026-11-21)

## Scope and outcome
Connected Supabase project MathWorldDB was updated in **development** only. All new taxonomy domains/skills remain **unpublished**; the 386 existing problems remain untouched.

- Four learning stages and 16 existing categories.
- 386 current problems; **386/386** now linked to exactly one **draft primary skill**.
- **75** skill records, including the 6 previously tagged primary arithmetic skills plus 69 from a reviewed template-group mapping of the other 360 problems.
- Eight top-level domains, not a fixed category count. No new categories published yet.
- 0 external framework code mappings currently; these require exact and grade-appropriate verification, especially MSC2020 for university content.
- 17 skills have one problem; 22 have fewer than three problems; 41 have one digit-normalized question template, showing incomplete diversity even though every existing question is mapped. Numeric-normalization is a screening heuristic, NOT expert judgment.
- 0 problems missing a primary skill, 0 invalid cross-category primary links in mapping input.
- 7 users, 37 attempts and 30 progress records remained as is. No account, auth, Premium or Free policy changes.

## Changes
- 5 new Postgres taxonomy tables, all with RLS enabled and no public direct table access; schema as in `Migrations/20261121220000_CurriculumTaxonomy.cs`.
- 8 unpublished top-level domains.
- 75 draft skills and 386 primary problem-skill links.
- `scripts/seed_curriculum_problem_skills_batch2.sql`: traceable, idempotent mapping for 360 problems; transactional assertion that no problem remains untagged.
- `Controllers/CurriculumController.cs`: public reference frameworks with non-accreditation disclaimer; only published domains/skills returned.
- `Controllers/AdminCurriculumSkillsController.cs`: admin-only live curriculum coverage by category and objective, with active-admin check and invalid-link report.
- Index fix for category foreign key added after advisor warning.

## Developer cautions and checks
- Database changes verified via Supabase SQL, but **no dotnet build** available here. GitHub draft PR / CI should run before merging.
- EF migration history and model snapshot require reconciliation with Supabase-applied migrations before Render deployment. The SQL migration is idempotent, but no production rollout has happened.
- Next.js admin skill coverage UI lives in separate branch `feature/curriculum-skill-coverage-20261121`, depends on new backend route.
- Web and Flutter student-facing Cambridge/Common Core/PISA/MSC2020 educational methodology notes were already merged in prior PRs, so no duplicate implementation was necessary.
- Existing categories remain broad. Next phase: split by coherent topics only after introducing diverse, reviewed questions so no empty/low-value categories are published. Do not auto-publish or display student skill mastery based on draft tags.
- Free still has two unlocked categories per stage and unlimited attempts; Premium unlocks all. No daily quota or pricing change.

## Content needs
Prioritize 17 single-question skills and 41 one-template skills; build conceptual, procedural, reasoning, application and misconception probes with varied representations. Validate distractors, bilingual mathematical wording, answers, stage placement and exact standard links. Editorial pilot in existing Backend PR #53 remains draft-only. Publication must be an explicit reviewed step.
