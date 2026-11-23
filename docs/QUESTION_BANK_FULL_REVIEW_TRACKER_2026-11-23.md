# MathWorld — question-bank and solution-method review tracker
**23 November 2026 · read-only live DB baseline + unpublished content proposals**

> **Verified subsequent production update (23 November 2026, after this baseline):** Supabase now holds **601 published questions**, **24 categories**, **94/94 published bilingual skills covering all 24 categories**, and **222 unpublished draft items**. The older 19-published/160-draft counts below are historical snapshots, not current state. Nine geometry explanation-only revisions (problem IDs **8, 9, 39, 55, 156, 157, 613, 614, 615**) were applied from `scripts/apply_nine_reviewed_geometry_solution_laws_20261123.sql` using exact prior-state, correct-answer and stage/category guards; readback matched **9/9** updated Arabic/English texts and **9/9** original correct answer IDs. Problem 616 had already been corrected in the independent geometry set (IDs 116, 179, 616), giving **12 distinct geometry student-facing worked solutions revised**. A separate guarded 16-row primary arithmetic batch (IDs 3,36,37,69,84,99,114,129,609,610,611,612,761,762,763,764) was applied and independently verified **16/16** bilingual updates with **16/16** unchanged correct option IDs. Combined, **28 distinct worked solutions** were revised. The remaining **573/601** solutions have **not** been fully reviewed or certified. No attempt, access, subscription, option or question text was changed. The source 10-item JSON remains an *editorial snapshot*, not a script to overwrite the already-corrected problem 616.

## The live baseline (verified against Supabase, not guessed)

| Stage | Published categories | Published questions | Arabic explanation under 55 chars | English explanation under 55 chars |
|---|---:|---:|---:|---:|
| Primary | 6 | 151 | 96 | 94 |
| Lower secondary | 6 | 140 | 90 | 87 |
| Upper secondary | 6 | 150 | 90 | 80 |
| University | 6 | 160 | 80 | 68 |
| **Total** | **24** | **601** | **356** | **329** |

- All 601 questions have one mapped primary skill, four options and one correct option per the earlier structural bank audit. This does **not** certify the mathematics of all answers.
- There are **94 learning skills attached to 24 real Categories**; **19 public** and **75 unpublished**. The public API must never leak unpublished editorial objectives. All 19 currently public objectives have an Arabic and English *description identical to their title*, so fuller descriptions need review.
- Starting baseline was **152 Draft question records** and **11 draft topic proposals**. On 23 November, eight independently checked wave-five records were staged transactionally as `CurriculumDraftItems.EditorialStatus='Draft'`; **now 160 unpublished drafts**. No new public Categories or Problems were inserted.
- The earlier numeric-structure audit identified **252 additional digit-only variants** grouped in repeated question templates; these are **review indicators**, not automatically removable duplicates or independent evidence of mastery.

## Immediate change sets (not live question mutations)

**Geometry solution review — 10 questions:** `content/editorial/solution-law-review-wave1-20261123.json`.
IDs 8, 9, 39, 55, 156, 157, 613, 614, 615, 616. Each stores old Arabic/English explanations for optimistic conflict checks, new detailed laws, substitutions, intermediate steps, answer units and immutable expected correct-option ID. Independent numeric oracles in `tests/check_solution_law_review_wave1_20261123.py`. All remain editorial `Draft`; no API, student or correct-answer mutations.

**Next reasoning wave — 8 original draft questions:** `content/editorial/curriculum-wave5-reasoning-20261123.json` with 2 in each existing draft proposal:
- Primary: place value/counting, with digit restrictions and subtraction/regrouping.
- Lower secondary: conditional probability after an even die roll; exactly-one-six ordered pairs.
- Upper secondary: inverse vector norm with sign constraint; dot product distributivity.
- University: boundary minimum on a constrained domain; coupled quadratic global minimum using Hessian.
Every item includes one matching primary skill, specific bilingual learning objectives, an applicable mathematical rule, worked steps and four distinct answer choices. Mathematical oracles and cross-wave exact question checks are in `tests/check_curriculum_wave5_reasoning_20261123.py`. **The eight are now stored in Supabase as Draft-only `CurriculumDraftItems` (two records per topic), using a guarded idempotent transaction; they are not student-visible.**

**First bilingual learning-objective descriptions — 11 editorial proposals:** `content/editorial/primary-skill-description-review-20261123.json` improves three primary Addition/Subtraction skills, five Geometry/Measurement skills, and three Multiplication/Division skills. Each records the immutable SkillId, StageId, CategoryId, StableKey and current bilingual description for comparison, with proposed teachable objectives. All eleven currently have `IsPublished=false`; these are **not** public until reviewed and explicitly approved. The scope and non-publication conditions are enforced in the wave-five test.

**Direct comparison to the live published bank:** the eight new wave-five draft Arabic and English question texts were compared against all currently published `Problems` on 23 November 2026, ignoring surrounding whitespace and case. Each had **zero exact live matches**. This does not rule out semantic near-duplicates.

## Solution quality standard (each individual item)

1. Verify the question's statement, assumptions, stage suitability, primary learning skill and whether there is exactly one mathematically correct answer.
2. Give the required formula or named mathematical principle **only when applicable**. Conceptual questions need an explanatory principle, not an invented symbolic formula.
3. Identify the given quantities and units. Substitute into the correct law and show at least one intermediate reasoning step.
4. State and interpret the result and its units; check it against the immutable correct option.
5. Review Arabic + English texts and mixed-direction/LaTeX rendering in **web and Flutter**, including small screens and dark/light.
6. Preserve all published Problem IDs, option IDs, attempt history, completion, favorites and Free/Premium gates. Correcting an existing answer key is a **separate** educator-reviewed change, not part of solution-only editing.

**Example:** For a 10 cm × 6 cm rectangle cut by one diagonal, state rectangle area = length × width = 60 cm²; the diagonal creates two equal-area triangles; each is 60 ÷ 2 = **30 cm²**. State why the division by two is valid. A response of “10 × 6 = 60, half is 30” alone is insufficient instruction.

## Current review priority (count of short Arabic explanations, not automatic defect finding)

| Category | Short Arabic | Total questions |
|---|---:|---:|
| Upper-secondary advanced algebra | 27 | 32 |
| Lower-secondary algebra and functions | 24 | 28 |
| University linear algebra | 24 | 32 |
| Upper-secondary calculus | 23 | 28 |
| Lower-secondary ratios and proportions | 22 | 28 |
| Primary data and probability | 21 | 24 |
| University multivariable calculus | 21 | 28 |
| Primary early algebraic thinking | 20 | 28 |
| Primary geometry and measurement | 20 | 28 |

Run the full per-category/individual roster with `scripts/audit_question_solution_principles_20261123.sql`, a **SELECT-only** report.

## Topic expansion gate — quality before quantity

International reference progression: CCSS school skills and mathematical practice; Cambridge Primary/Lower Secondary progression; OECD PISA reasoning and applied modelling; MAA CUPM / MSC2020 for university subject grouping. These are **references, not official accreditation or endorsement**. The taxonomy is Stage → Mathematical Domain → coherent Category → measurable Skill → graded, diverse Question.

Already proposed topics may be split or expanded only when distinct prerequisite/skill clusters exist. There is no fixed ten-per-stage or ten-per-skill quota. Prefer distinct diagnostic misconceptions, representations, mathematical reasoning, diagrams, word problems and genuine cognitive variety over numeric clones.

To publish a coherent new category: educator validates all questions, distractors and bilingual solutions; category has sufficient depth to avoid a next-day dead end; category/skill identifiers are mapped; any moved published question protects existing attempts; two configured Free category IDs remain unchanged; same topic names/icons/skills and access work in Flutter and web. Approve and publish through the existing editorial workflow; **never auto-publish all Draft statuses**.

## Remaining work, explicitly not closed

- Independently verify and revise **all 601** published worked explanations. The 10 draft revisions are a **first reviewed batch**, not evidence that the other 591 were completed.
- Human/editorial verification of 160 staged drafts (including eight newly authored wave-five items), 11 proposals, and skill descriptions/standard mappings; publish only approved categories/questions and skills.
- Semantic near-duplicate checks against the published DB and academic correctness beyond syntactic/answer-oracle checks, including 252 numeric-template variants.
- Full production API verification and acceptance tests in a real browser and signed Android build after controlled content publication.
- Continue expanding category depth based on the per-skill coverage audit (80 skills previously had fewer than eight distinct questions, none fewer than five), not by forcing a quota.

The only live data write in this wave inserted eight unpublished `CurriculumDraftItems` after CI checks and exact live-text overlap screening. Post-write verification: **601 published Problems, 24 published Categories, 160 DraftItems, eight wave-five DraftItems, 19 published skills**. No schema, public `Categories`/`Problems`, `CurriculumSkills.IsPublished`, attempts, progress, subscriptions or Free-category access were changed.
