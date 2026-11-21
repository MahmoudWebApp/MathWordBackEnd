# MathWorld read-only database curriculum audit — 2026-11-21

Status: **observed on connected MathWorldDB Supabase, read-only SQL; no rows changed, no production deployment**.

## Inventory
| StageId | Arabic stage | Category IDs | Categories | Problems |
|---|---|---|---:|---:|
|1|المرحلة الابتدائية|1–4|4|98|
|2|المرحلة الإعدادية|5–8|4|96|
|3|المرحلة الثانوية|9–12|4|96|
|4|المرحلة الجامعية|13–16|4|96|
|**Total**|||**16**|**386**|

Current categories, each with item count:
- Primary: 1 الأعداد والعمليات الحسابية (26), 2 التفكير الجبري المبكر (24), 3 الهندسة والقياس (24), 4 البيانات والاحتمالات (24).
- Middle: 5 نظرية الأعداد والأسس (24), 6 الجبر والدوال (24), 7 النسب والتناسب (24), 8 الهندسة والبراهين (24).
- Secondary: 9 الجبر المتقدم (24), 10 حساب المثلثات (24), 11 التفاضل والتكامل (24), 12 الإحصاء والاحتمالات المتقدم (24).
- University: 13 التفاضل متعدد المتغيرات (24), 14 الجبر الخطي (24), 15 المعادلات التفاضلية (24), 16 التحليل الحقيقي (24).

## Automated integrity checks
- 0 categories with no problems.
- 0 problems with category-stage mismatch.
- 0 problems missing Arabic or English title, question text or detailed solution.
- 0 categories with missing Arabic/English description.
- All 386 problems have exactly four distinct choice strings, exactly one marked correct; 1544 option records total.
- 37 attempt rows and 30 user-progress rows exist and MUST be preserved.
- Exact normalized Arabic-question duplicate: Problems **3 and 4** (same title, question and detailed solution, within category 1). Problem 3 has 1 attempt + 1 progress; problem 4 has 2 attempts + 2 progress rows. **Do not delete or remap without a dedicated history-safe migration approved and tested.**
- These are structural/content-string checks only, **not** proof of mathematical correctness, equivalent English copy, intended difficulty, or absence of semantic/templated duplicates.

## Next actions, in order
1. Generate a **read-only per-problem semantic curriculum audit**, mapping every existing question to domain, specific concept, learning objective, prerequisite and applicable framework. CCSS/Cambridge are references for school stages; university needs separate tertiary discipline references, and PISA is for applicable reasoning contexts, not universal accreditation.
2. Spot-check and mathematically verify answers, reasoning, ambiguity, language parity and grade level; flag near-duplicate templates beyond exact same text.
3. Review proposed split/retain/move of existing broad categories with actual student impact; preserve current IDs and free category selections.
4. Produce gap matrix by actual objective coverage. Do not infer coverage from raw number of questions; 24 questions/category could hide substantial undercoverage.
5. Only after editor approval: introduce additive taxonomy tables/API in a branch, idempotent migrations, then Next.js and Flutter explanation and UI parity, and finally reviewed content batches.
6. Re-run automated integrity and historical attempt/progress checks before release; do not deploy automatically.

## Existing editorial policy remains
- Dynamic number of categories per stage based on coherent concepts, no forced quota.
- Question volume per skill according to educational evidence and variety; no superficial number swaps.
- Free can access **two** stage categories with unlimited attempts, Premium all categories; **no daily question quota**.
- Do not imply formal endorsement/accreditation from CCSS/Cambridge/OECD.
