# MathWorld — unified question bank & skill-coverage review (2026-11-23)

## Verified live baseline (Supabase read-only queries, after 3 reviewed corrections)

- **4 stages, 24 published categories, 601 student-facing problems**; no published problem/category was added or moved by this review.
- **94 bilingual CurriculumSkills, all mapped to one of the 24 existing categories**. Zero orphan references, stage mismatches, missing bilingual titles or descriptions.
- **94 / 94 skills now published across all 24 categories**. Originally only 19 were published across 4 categories. We reviewed and published 75 bilingual objectives, improved the original 19 descriptions, and verified zero orphan/mismatched links and zero descriptions repeating their titles. Do not duplicate skills as JSON/text on Categories: `CurriculumSkills.CategoryId` is the normalized source of truth.
- **15 CurriculumTopicProposals and 222 editorial item records on the latest read** (160 status `Draft`, 62 status `Published` in editorial metadata), including 11 unpublished proposed subjects. Initial read earlier in the review showed 214 records; this collection changed during the session. Editorial status is *not* equivalent to a student-visible `Problems` row or category.
- **601 worked solutions**: 354 Arabic and 327 English solutions are under 55 characters (triage only, not an error rate). Three specific solutions have now been revised to explicitly name the mathematical law in both languages.
- These counts were checked directly against the **active production database**, not inferred from seed files.

## Confirmed UI parity (current main branch)

| UX | Public web | Learner web | Flutter |
| --- | --- | --- | --- |
| Per-category skills button/dialog | CategorySkillsDialog | CategorySkillsDialog | category_skills_dialog |
| Category progress and problem counts | stage accent and compact count | stage accent and count | stage palette and compact count |
| Solved and favorite summary | account-only | compact icon+count | compact_problem_count |
| Solving solution | read-only gated | bilingual API-owned | bilingual API-owned |

Do not re-add global skills under every category card, or duplicate the source in a new category text field. **The visible gap is publishing verified, meaningful objectives for each existing category**, not building a second frontend dialog.

## Worked-solution editorial contract

Every published problem must be reviewed independently, not mass-prefixed with one generic formula:

1. Read the **question, options, correct answer, stage, and category** and independently solve it.
2. State the *relevant law or reasoning principle* clearly (Arabic/English). Conceptual questions may have a rule, not a symbolic formula.
3. Show given values, substitution, intermediate steps, correctly dimensioned final result and a brief explanation *why*.
4. Test correct option against independent calculation; flag ambiguous or equivalent distractors.
5. Ensure Arabic/English meaning matches and mathematical notation renders in web and Flutter.
6. Preserve user attempts, progress, badges, favorites, and Premium access. A solution-text change must not alter answer keys or award points.
7. Record immutable problem ID, old/new text and source category before a reviewed change.

### Three verified geometry examples corrected in live production

| Problem ID | Principle | Result | Editorial artifact |
| --- | --- | --- | --- |
| 116 | rectangle area = length × width | 9 × 6 = 54 cm² | verified-solution-laws-sample-20261123.json |
| 179 | rectangle perimeter = 2 × (length + width) | 2 × (9 + 6) = 30 cm | same |
| 616 | triangle area = (base × perpendicular height)/2; rectangle diagonal bisects area | 10 × 6 / 2 = 30 cm² | same |

Changes applied transactionally with exact old Arabic/English text, stage, category, and IDs as preconditions. Post-update readback confirmed both language labels and unchanged association to stage 1/category 3. Do not rerun the one-time SQL script; it intentionally rejects changed source data.

## Expansion queue (existing unpublished proposals)

Existing topic proposals with draft counts:

| Stage | New topic | Drafts |
| --- | --- | ---: |
| Primary | Number sense & place value | 24 |
| Primary | Measurement & unit conversion | 12 |
| Lower secondary | Integers & rational numbers | 8 |
| Lower secondary | Linear inequalities | 12 |
| Lower secondary | Probability & compound events | 16 |
| Upper secondary | Exponential/logarithmic functions | 8 |
| Upper secondary | Analytic geometry | 12 |
| Upper secondary | Vectors | 16 |
| University | Mathematical statistics | 8 |
| University | Numerical analysis | 12 |
| University | Optimization | 16 |

The 4 remaining proposal records concern already-published topics; they are not additional new categories.

**Do not auto-publish** a proposal with 8–16 draft items just to increase counts. Expand conceptual diversity (reasoning, diagnostics, real-life context, diagrams, increasing difficulty), remove near-duplicates and obtain independent bilingual mathematics review. Use the existing MathWorld international taxonomy crosswalk (Common Core / Cambridge references for school concepts, PISA as reasoning-process reference, CUPM/MSC context at university level). These are references, not endorsement or certification.

## Prioritized release gates

1. **Skill coverage completed at DB/API level:** 75 reviewed bilingual objectives published; 19 previous objectives enriched, giving 94 published skills covering all 24 categories. Check real API dialogs on public/student web and Flutter after refetch, including RTL/LTR. This is a platform curriculum review, not external standards certification.
2. **Explanation quality:** Triage 354 short Arabic and 327 short English answers, then complete an actual per-item review of all 601. Avoid claiming the three examples certify the remaining 598.
3. **New content:** Review 11 proposed categories and draft items, prepare diversified bilingual questions and independent answer/duplicate checks; publish only through approved content pipeline with stage/category access verification.
4. **Presentation:** Preserve narrow right/left-aligned count+icon panels, stage-colored category counts, and individual 'View skills' dialogs. Use current shared APIs and existing CompactProblemCount on Flutter.
5. **Regression:** For every release, compare category totals, skill mappings, answer keys, free first-two-category policy, Premium locks, daily challenge, solution display, RTL/LTR and real student progress in both clients.

## Published skill publication audit, 23 November 2026

- Existing 75 skill IDs 1–75 were updated with mathematically specific, bilingual outcomes and marked published only after verifying exact old names, stage, category, descriptions, and **at least five linked problems per skill**. All-or-nothing transaction asserts 75 matching rows.
- Existing 19 published skills (IDs 93–109,112–113) received improved bilingual descriptions with an exact-match, 19-row transactional assertion; their published status was already true.
- Original before-state snapshots, revised objective JSON and guarded one-time SQL scripts are versioned in `content/editorial/` and `scripts/`. Do not rerun one-time scripts.
- Live post-update verification: **94 skills, 94 published, 24 represented categories, zero category-stage mismatch and zero descriptions equal to their titles.**
- This metadata describes learning targets; it is not an endorsement from Common Core, Cambridge, OECD, or a claim that all 601 solutions were fully reviewed.

## Reproducible read-only SQL

```sql
SELECT c."StageId", c."Id", c."NameAr", COUNT(DISTINCT p."Id") AS problems,
       COUNT(DISTINCT s."Id") FILTER (WHERE s."IsPublished") AS published_skills
FROM public."Categories" c
LEFT JOIN public."Problems" p ON p."CategoryId" = c."Id"
LEFT JOIN public."CurriculumSkills" s ON s."CategoryId" = c."Id"
GROUP BY c."StageId", c."Id", c."NameAr"
ORDER BY c."StageId", c."Id";

SELECT COUNT(*) AS total,
  COUNT(*) FILTER (WHERE CHAR_LENGTH(BTRIM(COALESCE("DetailedSolutionAr", ''))) < 55) AS short_ar,
  COUNT(*) FILTER (WHERE CHAR_LENGTH(BTRIM(COALESCE("DetailedSolutionEn", ''))) < 55) AS short_en
FROM public."Problems";
```

No new schema, Premium status, attempts, or learner data modifications were made. Production content changes were restricted to the three reviewed solution-text corrections and publication/description upgrades for 94 existing skills. The 601 published problems and 24 categories remain unchanged; new subject proposals remain unpublished; the 222 editorial records are a mix of draft and published *editorial statuses*, not 222 new learner-visible questions.
