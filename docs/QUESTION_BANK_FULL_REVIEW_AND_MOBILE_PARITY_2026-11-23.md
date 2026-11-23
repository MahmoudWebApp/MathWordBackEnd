# MathWorld — unified question bank & skill-coverage review (2026-11-23)

## Verified live baseline (Supabase read-only queries, after 3 reviewed corrections)

- **4 stages, 24 published categories, 601 student-facing problems**; no published problem/category was added or moved by this review.
- **94 bilingual CurriculumSkills, all mapped to one of the 24 existing categories**. Zero orphan references, stage mismatches, missing bilingual titles or descriptions.
- **19 skills published, 75 skills unpublished**; only **4 of 24 categories** presently have a published skill. Do not duplicate skills as JSON/text on Categories: the existing normalized `CurriculumSkills.CategoryId` relationship is the correct category-owned source of truth.
- **15 CurriculumTopicProposals, 214 CurriculumDraftItems**, including 11 unpublished proposed subjects. Their publication status is *not* equivalent to a student-visible category.
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

1. **Skill coverage:** Review 75 pending skill records; publish approved skill objectives by category so all 24 existing categories have at least one meaningful published learning outcome. Verify public web, student web and Flutter all see identical API results.
2. **Explanation quality:** Triage 354 short Arabic and 327 short English answers, then complete an actual per-item review of all 601. Avoid claiming the three examples certify the remaining 598.
3. **New content:** Review 11 proposed categories and draft items, prepare diversified bilingual questions and independent answer/duplicate checks; publish only through approved content pipeline with stage/category access verification.
4. **Presentation:** Preserve narrow right/left-aligned count+icon panels, stage-colored category counts, and individual 'View skills' dialogs. Use current shared APIs and existing CompactProblemCount on Flutter.
5. **Regression:** For every release, compare category totals, skill mappings, answer keys, free first-two-category policy, Premium locks, daily challenge, solution display, RTL/LTR and real student progress in both clients.

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

No new schema, Premium status, attempts, or learner data modifications were made as part of the editorial queue. The three targeted solution text corrections are the only production content modifications in this review.
