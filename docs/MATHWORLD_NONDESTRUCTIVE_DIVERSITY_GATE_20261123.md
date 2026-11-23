# MathWorld — non-destructive content diversity release gate

**Production snapshot:** 23 November 2026. This is a quality-control baseline, not permission to delete or change any student's solved questions.

## Findings

- **601** published questions across **24** categories. A normalized English-question template scan groups **63** template families with three or more examples, covering **315** questions and **252** numerical variants beyond one representative in each family.
- Distribution: elementary **16 families/80 questions**; middle **16/80**; secondary **16/80**; university **15/75**.
- The most repetitive families contain five number-only variants of the same instructional wording. Examples: rectangle perimeter (**category 3**, IDs 155,167,179,191,203); early algebra 'solve x+#=#' (**category 2**, IDs 70,85,100,115,130); middle-school least-common-multiple exercises (**category 5**, IDs 211,223,235,247,259).
- The analysis counts *text skeletons*, not exact math duplicates. Repeated forms can help intentional spaced practice, so **none of the 315 questions is automatically invalid**.
- Live cross-bank scan after 12 new logarithm DraftItems were added found **zero same-stage numeric-template collisions between any of the 172 draft questions and the 601 published questions, and zero among the 172 drafts themselves**. This is a heuristic check and does not replace independent mathematics review.

## Preserve past student learning

Never erase, renumber, silently rewrite, or replace published problems merely to change a template, because student answers, mistake history, solved status, challenges and existing analytics may refer to those question IDs. Do not reset progress or change correct answer IDs for aesthetic variety.

## Safe implementation order

1. Retain the versioned snapshot at `docs/review-data/published-template-diversity-20261123.json`. Re-run the **read-only** report `scripts/audit_published_problem_variety_20261123.sql` before each substantive bank content publication.
2. Add **new bilingual DraftItems** using distinct concepts or contexts rather than changing a few numbers: data interpretation, graph/table reading, choosing a method, identifying incorrect reasoning, proving why a formula applies, multi-step modelling and real constraints.
3. For each new candidate enforce an independent mathematical oracle, four distinct answer options, exactly one correct key, law-first worked solutions, learning-skill mapping and its suitable education stage. Run numeric-skeleton collision checks **against both existing published Problems and unpublished DraftItems**, not just within the new batch.
4. Preserve proposals and new content as `Draft` until explicit administrator approval of topic taxonomy, stage-specific icon, published category/skill relationship and distribution. **Do not publish or create empty categories automatically.**
5. When planning student practice order, avoid five near-identical formulations consecutively; retain all published IDs and learner progress. A diversified selection UX would require separate API/web/mobile tests and approval, so it is **not claimed as implemented** here.
6. Validate Free vs Premium access, lesson reset boundaries, error notebook and progress counts after any later publication; do not conflate new DraftItems with student-visible questions.

## Alignment for original new questions

The question design can draw on the mathematical processes of the [OECD PISA 2022 Mathematics Framework](https://www.oecd.org/en/publications/pisa-2022-assessment-and-analytical-framework_dfe0bf9c-en/full-report/component-3.html) and relevant grade-level guidance such as [Common Core High School Functions](https://www.thecorestandards.org/Math/Content/HSF/). These frameworks inform educational variety; this project has **not** been externally certified.

## Open product gates

The currently published 315 numeric variants remain live and unchanged. Follow-up content design should prioritize differentiated new questions in the 20 affected category IDs; this audit only maps the work. Full admin approval, published-category skill and icon checks, actual backend deployment confirmation and device/web E2E testing remain separate.
