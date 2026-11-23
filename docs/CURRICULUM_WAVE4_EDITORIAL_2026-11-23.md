# MathWorld curriculum — wave 4 editorial development (2026-11-23)

## Scope and publication gate

This adds **56 bilingual, mathematically checked editorial drafts** in two complementary batches (24 initial questions + 32 deeper questions). Nothing in this branch
automatically publishes a learner question or category. The student-facing baseline remains
**24 categories / 601 questions** until separate educator approval and a staged release.

| Stage | Canonical key | Editorial work | Items | Skill coverage |
|---|---|---|---:|---|
| Primary | `p-number-sense` | Extend an existing **Draft proposal** | 14 | place value, comparisons, rounding, counting |
| Lower secondary | `m-probability` | New **Draft proposal** | 14 | sample space, compound events, frequency |
| Upper secondary | `s-vectors` | New **Draft proposal** | 14 | components, magnitude, dot product |
| University | `u-optimization` | New **Draft proposal** | 14 | unconstrained/constrained optima, convexity |

These are **starter batches**, not complete categories. They should not go public with
fourteen questions simply to inflate the category count. Add pedagogically diverse conceptual,
reasoning, visual, word-problem, diagnostic and advanced items after review. The curriculum
catalogue has no fixed number-of-categories quota.

## Quality gates implemented

- Every item has Arabic/English question text, explanation and learning objective.
- Four distinct language-neutral math options, exactly one marked correct.
- Standalone Python checks compute correct answers independently using fractions,
  integer arithmetic, vector operations, derivatives, and constrained extrema.
- Test rejects numeric-equivalent distractors and normalized prompt duplication against
  existing editorial JSON files. Published database question overlap is a **separate review**.
- All skills resolve against `content/catalog/international-mathworld-taxonomy-v2.json`.
- Stored `pisaProcess` is a MathWorld reasoning-process tag, **not** an OECD endorsement.

Run:
```bash
python3 tests/check_curriculum_wave4_20261123.py
python3 tests/check_curriculum_wave4_depth_20261123.py
python3 scripts/generate_curriculum_wave4_draft_sql.py --check
python3 scripts/generate_curriculum_wave4_depth_sql.py --check
```

After bilingual educator review, a reviewer can inspect the generated SQL with:
```bash
python3 scripts/generate_curriculum_wave4_draft_sql.py > /tmp/wave4_draft.sql
python3 scripts/generate_curriculum_wave4_depth_sql.py > /tmp/wave4_depth_draft.sql
```
The first script inserts only `CurriculumTopicProposals` and `CurriculumDraftItems` as `Draft`.
The second inserts only `CurriculumDraftItems`, matching the four existing unpublished
proposals. Both are idempotent, transactional and guard topic stage/publication status. SQL generation never writes to a database.
**Do not execute it in production without reviewing the live schema and existing
topic statuses.**

## Verified editorial staging status — 23 November 2026

- The **56** new manuscripts are present in the `CurriculumDraftItems` table, all with `EditorialStatus='Draft'` (14 per subject).
- `p-number-sense` has **22** total draft items (8 earlier manuscripts plus 14 new). Each of the other three topics has 14.
- Editorial staging now has **15 topic proposals and 214 draft/content-review records**, including previously published-status editorial records.
- The student-facing bank remains unchanged: **601 Problems and 24 Categories**. We did not modify individual accounts, attempts, premium access, or category permissions.
- Post-staging SQL audit found **zero missing 4-option lists, zero items with a non-unique correct answer, and zero direct Arabic templates matching the live bank after normalizing numerals**. This is a **structural comparison only**; near-semantic duplicates and educational suitability require human review.
- GitHub Actions curriculum checks, the backend build check and the PostgreSQL integrity check passed on the new-questions branch.
- These draft-only writes do **not** deploy to Render or Vercel and do not make new topics visible to students.

## Content-quality growth still required

1. Expand every proposed topic with varied representation types and diagnostic misconceptions, not just changed values.
2. Inspect the **252 arithmetic-variant extras** identified by the 22 November bank audit; preserve useful fluency practice but don't count each as a distinct skill.
3. Review the 52-topic reference catalogue against the 24 published categories; publish new coherent categories only after proper content breadth.
4. Safely split broad existing categories where educational concepts differ, without changing historical student attempt ownership, progress, or the two-category Free selection.
5. Obtain independent bilingual mathematics/educator review and review new icons in both RTL/LTR web/Flutter before publication.

## Publication checklist (not completed)

1. Independent mathematics educator validates all statements, distractors,
   explanations, difficulty levels, and age suitability.
2. Arabic and English subject editor reviews language and mathematical notation.
3. Check student-facing existing `Problems` data for semantic near-duplicates,
   not just different numbers.
4. For any overlapping broad category, plan **student-attempt-safe** category
   migration, preserve current category access and respect the Free two-category
   policy without auto-reassigning the free pair.
5. Review new stage-tinted SVG icons on web/Flutter; verify bilingual RTL/LTR display.
6. Publish topic with meaningful breadth, not a placeholder; retest APIs, mobile,
   dashboards, progress counts, and unlock behavior.

Standards provide reference vocabulary and progression: Common Core / Cambridge for
school learning objectives; OECD PISA for math reasoning; MAA CUPM / MSC2020 for
university curricular context. MathWorld is independently developed and is neither
endorsed by nor certified by those bodies.
