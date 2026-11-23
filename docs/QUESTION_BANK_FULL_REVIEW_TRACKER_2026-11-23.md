# MathWorld — question-bank and solution-method review tracker

## Consolidated live release gate — 23 November 2026 (latest; supersedes older snapshots below)

The production database was independently re-read after the latest guarded corrections and source merges.

| Student-facing stage | Published questions | Arabic explanations under 55 chars | English explanations under 55 chars |
|---|---:|---:|---:|
| Primary | 151 | 0 | 0 |
| Lower secondary | 140 | 0 | 0 |
| Upper secondary | 150 | 0 | 0 |
| University | 160 | 0 | 0 |
| **Total** | **601** | **0** | **0** |

- All **601** published problems are covered by recorded individual educational review batches; approximately **468 bilingual worked explanations were expanded and 133 previously adequate explanations retained**, counting the final 3 university clarity fixes as expanded. These are **internal mathematical/editorial checks**, not third-party curriculum certification or full classroom validation.
- Database structural health (latest read): **601 Problems / 24 Categories / 94 published CurriculumSkills spanning all 24 categories**, **zero empty categories**, **zero missing problem-skill links**, **zero questions lacking four distinct options or exactly one correct key**, **zero brief bilingual explanations under 55 characters**. No learner progress, original correct answers or Free/Premium access was intentionally changed in the explanation batches.
- University completion: PRs **#127** (32 ODE problems, 22 revised), **#129** (22 sequences problems, 12 revised), **#130** (60 multivariable/linear-algebra problems, 45 revised), and **#131** (3 final concise explanations) were merged following successful CI and exact production readbacks. Earlier university categories #16 and #24 were reviewed independently. Original conflicting PRs #126 and #128 were closed in favor of the merged rebases, not abandoned features.
- **Editorial draft records:** 222 total, including **160 still Draft** and **62 Published editorial metadata rows**; the latter already correspond to live questions and are **not an extra 62** to publish. There are **15 topic proposal records: 11 Draft, 4 Published**.
- All **160 pending DraftItems** passed a structural audit: four answer options with one designated correct option, bilingual question/solution/learning-objective fields, primary skill keys, unique content keys and question texts, valid difficulty and PISA process fields; no exact live duplicate or same-stage numeric-only question-template collision in this scan. **This does not certify all 160 mathematical answers**.
- **36 of the 160 pending drafts have also received independent per-question arithmetic/time validation** and versioned read-only QA fixtures: 24 for primary Number Sense & Place Value (merged PR **#132**) and 12 for primary Measurement & Unit Conversion (merged PR **#133**). Both topics remain **unpublished**: editorial approval and explicit admin publishing must not be bypassed. **124 pending drafts still need independent mathematical/content reviews**, plus bilingual learning-skill linking and icon/category publication validation.
- Prior read-only analysis found **63 published numeric-template families** with 3+ near-identical formulations, containing 315 problems, or 252 additional number variants beyond a representative per family. This is a **variety risk**, not grounds to delete problems or historical student progress.
- Production web deployment was reported `READY` by Vercel and latest Android CI is successful, but this **is not evidence of successful end-to-end login, API, export, Premium, daily-challenge, device or performance testing**. Backend Render rollout remains unverified. Hostinger migration is **explicitly postponed** until launch; do not move hosting as part of this audit.
- Release gates remaining outside the published-question mathematical audit: independent mathematics and subject coverage for 124 remaining drafts, administrator review/publish of new topics with no empty categories and stage-specific icons, numeric-template diversification without erasing solved history, complete web/mobile/Admin/API regression and accessibility tests, actual backend deploy verification, and signed Android device/Google-login smoke test.


## University review — limits and discrete mathematics (23 November 2026)

- Individually reviewed **46 university problems** in Limits/Continuity (18; category 16) and Logic/Discrete Mathematics (28; category 24). Twenty-two original explanations were adequate; **24 bilingual explanations were expanded** with precise Intermediate Value Theorem hypotheses, differentiability/continuity, logic equivalences, graph handshaking, counting, pigeonhole, trees, equivalence classes and propositional truth tables.
- A fresh branch from the latest main superseded conflicting old PR #124, keeping the verified educational contents without overwriting the newly merged secondary CI. Independent math/logical-oracle CI plus backend/problem-integrity checks passed.
- Exact-original-text and correct-option-guarded production SQL succeeded; live readback verified **24/24 updated Arabic and English explanations and 24/24 unchanged correct-option IDs/text**. No changes to published questions, categories, student history or access.
- Cumulative: **487/601** student-visible problems individually reviewed (151 elementary, 140 middle, 150 secondary, 46 university). **386 explanations expanded**, **101 retained as adequate**. **114 university published questions remain** across multivariable calculus, linear algebra, differential equations and sequences/convergence. Separately, **160 DraftItems remain unpublished pending review**.


## Secondary-stage final concise-explanation verification (23 November 2026)

- The **ten** mathematically correct but abbreviated secondary explanations (IDs 45,63,442,509,637,710,769,770,861,862) have now been expanded with laws, substitutions and proof/check steps in both Arabic and English.
- The exact-old-question/explanation/correct-option-guarded SQL transaction succeeded, and post-application production readback confirmed **10/10 bilingual updated texts and 10/10 unchanged correct answer options**. All three CI checks on the patch branch passed.
- **All 441 elementary/middle/secondary published questions individually reviewed; 362 explanation texts substantively improved and 79 left unchanged**. No primary/middle/secondary Arabic or English explanation is under 55 characters after these changes. **160 university questions** remain for review and **160 DraftItems remain unpublished**.


## Verified complete individual secondary-school review (23 November 2026)

- Individually reviewed all **56** remaining secondary Trigonometry and Calculus questions (category **10: 28** and category **11: 28**). Existing 11 adequate explanations stayed unchanged; **45** received rule-led worked solution detail for exact trigonometric ratios/special angles and calculus power differentiation/integration.
- Independent symbolic/numeric math oracles and GitHub Actions checks passed. One-time exact source/answer-guarded production SQL applied. **Live readback: 45/45 matching bilingual explanations and 45/45 original correct option IDs/text**; no student history, question or access changes.
- **Milestone: all 441 published stage-one through stage-three questions have been individually reviewed** (151 elementary + 140 middle + 150 secondary), with **352 improved explanations** and **89 retained as sufficiently clear** in their respective initial reviews. Remaining **160 published university questions** and **160 unpublished editorial DraftItems** are distinct work queues.
- Final short-text triage found ten *mathematically correct but abbreviated* secondary explanations (IDs **45,63,442,509,637,710,769,770,861,862**) for clarity expansion in a separate guarded follow-up. Do not confuse text length with an arithmetic correctness failure.


## Verified secondary-school continuation — advanced algebra and sequences (23 November 2026)

- All **62** student-facing questions in secondary **Advanced Algebra (category 9, 32)** and **Sequences/Series (category 23, 30)** were individually inspected. **24** original explanations were already mathematically adequate and were retained.
- Improved **38** bilingual law-and-substitution explanations, including inverse logarithms, zero-product roots, Vieta sums/products, discriminant, factoring, arithmetic and geometric sequence terms/sums, recurrences, and telescoping cancellation.
- Independent numerical/expression oracles and all existing CI checks passed. The one-time transaction matched exact old texts/question/correct-answer guards. **Production readback: 38/38 matching bilingual explanations and 38/38 original correct-option IDs/text unchanged**. No student-history, question or subscription mutation.
- Cumulative individually reviewed **385/601** published questions (151 elementary + 140 middle + 94 secondary). **307 explanations improved**, **78 retained as adequate**; **216** student-facing questions remain (56 secondary trigonometry/calculus and 160 university). DraftItems remain staged, not exposed.


## Verified secondary-school continuation — probability and descriptive statistics (23 November 2026)

- Individually reviewed all **32** student-facing questions of stage-three **Probability/Combinatorics (category 12, 21)** and **Descriptive Statistics (category 35, 11)**. Fifteen originally clear solutions were kept; **17** received fuller Arabic/English formulas, steps and checks.
- Independent CI recomputed all involved fair-coin independent-event and exactly-two-heads probabilities with exact rational values, weighted arithmetic means and population variance. Deliberately unreduced original fraction answers were preserved.
- The guarded SQL transaction changed only bilingual explanation columns, conditional on original question, prior explanation and correct-answer flag/text. **Live readback verified 17/17 bilingual edits and 17/17 original correct-answer choices**. No question/history/access changes.
- **Cumulative audited: 323/601** individual published problems (151 elementary + 140 middle + 32 secondary), **269 improved explanations** and **54 already adequate**. **278** still await individual review: 118 other secondary and 160 university. Unpublished DraftItems remain outside student content until independent review.


## Middle-stage final short-explanation audit (23 November 2026)

- Four mathematically correct but short stage-two explanations (IDs **41, 44, 59, 857**) received explicit bilingual rule-based steps: positive integer exponent, right-triangle Pythagoras, constant unit-rate price and two-point coordinate distance.
- CI validated independent arithmetic and immutable answer IDs. One-time atomic, exact-source guarded DB transaction succeeded; **4/4 bilingual descriptions and 4/4 unchanged correct option IDs/text were verified on the active database**.
- **Final cumulative first-two-stage checkpoint:** all **291** elementary/middle published questions individually inspected; **252** worked explanations expanded; **39** already appropriate and left unchanged. **Zero** primary or middle Arabic and English explanations below 55 characters at final readback.
- Remaining separately reviewed questions: **310** (150 upper secondary and 160 university), plus the distinct **160 unpublished DraftItems**. Length alone is not a substitute for mathematical correctness or independent educator validation.


## Verified complete middle-stage individual question review (23 November 2026)

- Individually reviewed **all 56** student-visible stage-two **Number Theory/Exponents (category 5; 28)** and **Algebra/Functions (category 6; 28)** questions. Five existing explanations (IDs 12,13,41,14,15) were mathematically adequate as originally written and retained in this batch.
- Improved **51** bilingual worked solutions with exponent product/quotient/zero/negative rules, GCD/LCM, cube volume, linear and quadratic function evaluation, inverse linear equations, coordinate slopes and contextual equations.
- Independent arithmetic and original answer-key oracles plus all three GitHub Actions workflows passed. A one-time exact source/answer guarded transaction updated only two solution fields. **Live readback confirmed 51/51 bilingual explanations and 51/51 unchanged correct option IDs/text**; no student progress, scores, options, questions or subscription fields changed.
- **Milestone: 291/601 published questions individually inspected** (all **151 primary** and all **140 middle**), **248 explanations substantively improved**, **43 accepted**. **310** published questions (150 upper secondary + 160 university) remain for independent review.
- Follow-up clarity screen: three short Arabic texts and three short English texts were counted in middle stage, involving four unique IDs **41,44,59,857**. They are mathematically correct but can be expanded for explicit pedagogy and formula context; do not label shortness an arithmetic failure.
- **160 DraftItems remain unpublished** and require separate diversity/accuracy review before new category/problem publication.


## Verified middle-school continuation — ratios and triangles (23 November 2026)

- Reviewed all **48 student-visible problems** across stage-two **Ratios and Proportions (category 7; 28)** and **Triangles, Similarity and Pythagoras (category 34; 20)**. Nine originally adequate explanations (IDs **16,17,43,59,44,855,856,857,858**) were left intact.
- Improved **39** bilingual law-led explanations, including consistent-price ratios, percent discounts/increases, map scales, ratio group splitting, Pythagorean hypotenuse and missing-leg formulas, and similarity length scaling.
- CI independent numerical oracles and existing backend/integrity checks passed; transactional live update matched all expected original rows. **Production readback verified 39/39 bilingual explanations and 39/39 unchanged answer option IDs/text**, without touching questions or learner data.
- Cumulative audited published problems: **235/601 individually reviewed** (151 primary + 84 middle), with **197 explanations expanded** and **38 already adequate**. The remaining **366 published problems** await individual review (56 middle, 150 upper secondary, 160 university). This is a targeted review, not an external standards endorsement.


## Verified middle-school continuation — geometry and data (23 November 2026)

- Individually reviewed all **36** student-visible problems across stage-two **Geometry/Angle Measurement (category 8, 20 items)** and **Statistics/Data Analysis (category 22, 16 items)**. Five explanations (problem IDs **18,19,430,478,480**) already communicated correct relevant methods; they were retained.
- Improved **31** specific bilingual worked solutions, with polygon interior-angle law, circle/semicircle area, isosceles triangle and vertical-angle relations, weighted means, IQR, median/mode/range, relative frequency, mean absolute deviation, charts and percent reasoning. Independent math and correct-option assertions passed in CI.
- A one-time exact-source-and-answer-matched SQL transaction changed only the two explanation text columns. **Production readback: 31/31 updated bilingual texts matched and 31/31 original correct option IDs/text preserved.** Questions, stage/category, answers, options, progress, subscriptions and history were not changed.
- Cumulative reviewed published bank: **187/601** individually inspected (entire elementary stage 151, plus 36 middle-stage). **158 distinct explanations improved**, 29 retained. **414** remain unreviewed; this is a targeted editorial audit, not a claim of external curriculum accreditation.
- Middle-stage categories **5,6,7,34** (104 published questions) still need individualized review. Staged drafts remain unpublished pending independent answer and pedagogy checks.


## Final elementary-stage clarity audit (23 November 2026)

- The two short but numerically correct explanations (IDs **422** and **476**) have now been expanded in both languages with named conversion/percentage principles, calculation and inverse check.
- Atomic, source-guarded transaction and live readback matched **2/2 bilingual explanations** and **2/2 original answer option IDs/text**, with no changes to student history, questions or access.
- **Final primary-stage total: 151/151 questions individually reviewed; 127 bilingual worked explanations enhanced; 24 already adequate and unchanged**.
- **Zero** primary-stage Arabic explanations and **zero** English explanations under 55 characters after the updates. This is a length/coverage signal, not automatic proof that every explanation is pedagogically perfect.
- Remaining individually unreviewed student-facing bank: **450 questions** in stages 2–4, plus **160 DraftItems** not published to students.


## Verified complete stage-one question-bank review (23 November 2026)

- Individually audited **all 34 primary fractions/decimals questions**, including percentage, rounding, fraction arithmetic and equivalent fractions; **16** original explanations were already adequate, while **18** bilingual worked explanations were expanded (IDs 423,424,426,427,477,617,618,619,620,693,694,695,696,817,818,819,820,822).
- Independent CI checked exact rational arithmetic, percent calculations, decimal rounding and comparison direction with immutable answer IDs. The one-time atomic explanation-only SQL patch succeeded, and live readback verified **18/18 updated Arabic+English descriptions and 18/18 original correct-answer options**, without changing any learner data, progress or question.
- Read-only equivalence check on all 34 fractions category questions parsed 29 correct options numerically and found **zero equivalent distractors**. Five non-scalar/combined-expression option forms (IDs 422,472,503,507,696) require semantic comparison rather than scalar parsing; their correctness was reviewed as individual concepts, not asserted by that numeric detector.
- **Milestone: all 151 published elementary-stage questions have been individually reviewed** across six categories. **125** descriptions were substantively enhanced with laws, steps and reasoning in Arabic and English, and **26** were already suitable. No published question was added, deleted, moved, or re-keyed in these explanation-only changes.
- **450 questions in the other three stages** still require individual mathematical/editing review. The separate **160 staged DraftItems across four stages** remain unpublished until they pass educator-reviewed diversity, answer-equivalence and bilingual-content checks.


## Verified continuation — completed primary geometry category (23 November 2026)

- All **28** primary geometry/measurement questions now have individually reviewed law-led worked solutions. The preceding review had improved 12; the remaining **16** (IDs 71,86,101,131,155,167,191,203,168,180,192,204,169,181,193,205) were corrected with rectangle area/perimeter, triangle angle sum, or metre-centimetre conversion formulas, substitutions and units.
- Independent geometry and arithmetic oracles passed in curriculum CI. The one-time atomic source/answer-guarded DB patch was executed; production readback confirms **16/16 new bilingual explanations** and **16/16 unchanged correct answer option IDs/text**. User history, options, stages and Premium access were not changed.
- Cumulative audit: **117 individual published questions reviewed, 107 bilingual explanations expanded, 10 already adequate**, with **484 other published problems not yet individually reviewed**. Stage-one categories 1,2,3,4,33 are now reviewed; stage-one fractions category 21 (34 questions) remains.


## Verified continuation — primary statistics and probability (23 November 2026)

- Independently reviewed **all 24** category-4 primary questions; two already appropriately explained (IDs 10 and 11), while **22 required clearer mathematical reasoning**.
- Improved 22 bilingual solutions showing mean = total/number, mode = most frequent, median = middle sorted item, and equal-likelihood probability = favorable/possible. For question 207, explained **5/15 = 1/3** without changing the original correct fraction option; no equivalent distractor exists in that option set.
- Independent Python fraction and numerical oracles plus three GitHub Actions checks **passed**. A one-time exact-source, answer-key-guarded transaction changed only bilingual explanation columns. **Production readback: 22/22 Arabic/English texts matched and 22/22 original correct option IDs/text were preserved.**
- Cumulative: **101 published questions individually reviewed; 91 improved explanations and 10 accepted as-is**, covering primary arithmetic, multiplication/division, early algebra, data/probability, and 12 reviewed geometry examples. **500 other published problems are not yet fully reviewed**. A completed review does not imply endorsement/certification by external curricula.
- Read-only structural scan of all 601 current published questions found **63 numeric-template families with 3 or more near-identical wordings**, containing **315 questions** and **252 additional number-only variants beyond one representative per family**. These are *potential repetition markers* (not 252 incorrect questions); proposed future diversification must preserve existing student history and keep drafts hidden pending review.


## Verified continuation — primary early algebra (23 November 2026)

- Reviewed **all 28** published questions of stage-one category **2** (early algebra); **7 already adequately explained** and unchanged (IDs 6,7,154,166,178,190,202).
- Updated **21 Arabic/English explanations** (IDs 38,54,70,85,100,115,130,152,164,176,188,200,153,165,177,189,201,689,690,691,692), explaining inverse operations, two-step equations, fixed-increment sequences and equal division. Numerical answers were calculated independently and matched against published correct option IDs.
- Production transaction matched exact question/previous text/stage/category/only-one-correct-option preconditions for every row. Post-update readback: **21/21 bilingual explanations matched, 21/21 correct option IDs/text preserved**. No changes to user data or Free/Premium rules.
- Cumulative in the present targeted review: **77 individual questions reviewed** across these three educational categories and earlier geometry examples, **69 improved explanations** and **8 already adequate**. **524 other published questions remain outside this individual review**. This is not mathematical certification for the remaining bank.
- Repeated numerical variants in early algebra (groups of five for sequences, variable evaluation and equation forms) remain a curriculum-diversity risk; proposals must be checked against existing student history before a safe future replacement.


## Verified continuation — multiplication/division (23 November 2026)

- Independently reviewed **all 21 published items** in primary stage category **33** (Multiplication and Division). Problem **5** already had an adequate bilingual solution and was left intact.
- Improved **20 distinct solutions** (IDs **53, 149, 150, 151, 161, 162, 163, 173, 174, 175, 185, 186, 187, 197, 198, 199, 851, 852, 853, 854**) with the relevant math rule or concept, intermediate substitutions/checks, relevant units and Arabic/English parity. Source: `content/editorial/primary-multiplication-division-solution-laws-20261123.json`.
- Committed a one-time **transactionally guarded explanation-only** script `scripts/apply_primary_multiplication_division_solution_laws_20261123.sql`; source text, immutable IDs, correct option flag/text and stage/category all had to match or the transaction would abort.
- **Production readback verified 20/20 bilingual edits and 20/20 unchanged correct options.** No question, option, category, learner history, progress, favorites, subscription, or access setting changed.
- Cumulative in this series: **48 distinct published explanations expanded** across earlier geometry and primary arithmetic reviews plus this category; **one extra category-33 explanation was examined and left unchanged**. This does not certify all 601 solutions.
- Structural publication totals remain **601 Problems / 24 Categories / 94 published category skills / 160 unpublished DraftItems**.

### Template repetition discovered during read-only review

Several concept families currently contain **five number-only variants**. Examples: category 2 one-step equations (IDs 70,85,100,115,130), two-step equations (152,164,176,188,200), arithmetic sequences (153,165,177,189,201), and substitution expressions (154,166,178,190,202); category 3 has similar repeated perimeter/area and unit-conversion templates. This is an instructional-diversity flag, **not proof of invalid arithmetic or permission to delete/move published records**. Keep learner progress and current answer keys, prepare genuine non-equivalent reasoning replacements as Draft, and gate any future publication with bilingual educator review and safe migration of question history.

**23 November 2026 · read-only live DB baseline + unpublished content proposals**

> **Verified subsequent production update (23 November 2026, after this baseline):** Supabase now holds **601 published questions**, **24 categories**, **94/94 published bilingual skills covering all 24 categories**, and **222 editorial item records (160 still Draft; 62 already Published and exact-matched to live questions)**. The older 19-published-skills figure below is a historical snapshot; the 160 Draft-item count remains current. Nine geometry explanation-only revisions (problem IDs **8, 9, 39, 55, 156, 157, 613, 614, 615**) were applied from `scripts/apply_nine_reviewed_geometry_solution_laws_20261123.sql` using exact prior-state, correct-answer and stage/category guards; readback matched **9/9** updated Arabic/English texts and **9/9** original correct answer IDs. Problem 616 had already been corrected in the independent geometry set (IDs 116, 179, 616), giving **12 distinct geometry student-facing worked solutions revised**. A separate guarded 16-row primary arithmetic batch (IDs 3,36,37,69,84,99,114,129,609,610,611,612,761,762,763,764) was applied and independently verified **16/16** bilingual updates with **16/16** unchanged correct option IDs. Combined, **28 distinct worked solutions** were revised. The remaining **573/601** solutions have **not** been fully reviewed or certified. No attempt, access, subscription, option or question text was changed. The source 10-item JSON remains an *editorial snapshot*, not a script to overwrite the already-corrected problem 616.

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
