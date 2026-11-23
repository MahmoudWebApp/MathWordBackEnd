# MathWorld curriculum — wave 4 editorial development (2026-11-23)

## Scope and publication gate

This adds **24 bilingual, mathematically checked editorial drafts**. Nothing in this branch
automatically publishes a learner question or category. The student-facing baseline remains
**24 categories / 601 questions** until separate educator approval and a staged release.

| Stage | Canonical key | Editorial work | Items | Skill coverage |
|---|---|---|---:|---|
| Primary | `p-number-sense` | Extend an existing **Draft proposal** | 6 | place value, comparisons, rounding, counting |
| Lower secondary | `m-probability` | New **Draft proposal** | 6 | sample space, compound events, frequency |
| Upper secondary | `s-vectors` | New **Draft proposal** | 6 | components, magnitude, dot product |
| University | `u-optimization` | New **Draft proposal** | 6 | unconstrained/constrained optima, convexity |

These are **starter batches**, not complete categories. They should not go public with
six questions simply to inflate the category count. Add pedagogically diverse conceptual,
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
python3 scripts/generate_curriculum_wave4_draft_sql.py --check
```

After bilingual educator review, a reviewer can inspect the generated SQL with:
```bash
python3 scripts/generate_curriculum_wave4_draft_sql.py > /tmp/wave4_draft.sql
```
The generated script inserts only `CurriculumTopicProposals` and
`CurriculumDraftItems` as `Draft`. It is idempotent, transactional and guards
topic stage and publication status. SQL generation never writes to a database.
**Do not execute it in production without reviewing the live schema and existing
topic statuses.**

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
