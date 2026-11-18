# MathWorld — additive curriculum expansion, editorial draft v1

Status: **review required, NOT seeded or published**. Existing `EducationalStage.Id`, `Category.Id`, problem IDs, progress, and attempts must never be renumbered. Stage mapping is determined from actual database IDs, not guessed from names. Admin review is mandatory before publishing.

## Proposed category catalogue (bilingual)

| Key | Arabic | English | Scope |
|---|---|---|---|
| arithmetic-foundations | العمليات الحسابية | Arithmetic foundations | early stages |
| fractions-decimals | الكسور والأعداد العشرية | Fractions and decimals | primary/intermediate |
| ratios-percentages | النسب والتناسب والمئويات | Ratios, proportions and percentages | intermediate |
| algebra-equations | الجبر والمعادلات | Algebra and equations | intermediate/secondary |
| geometry-measurement | الهندسة والقياس | Geometry and measurement | primary/intermediate |
| functions-graphs | الدوال والتمثيل البياني | Functions and graphs | secondary |
| statistics-probability | الإحصاء والاحتمالات | Statistics and probability | intermediate/secondary |
| trigonometry | حساب المثلثات | Trigonometry | secondary |
| vectors-coordinates | المتجهات والإحداثيات | Vectors and coordinates | secondary |
| calculus-intro | مقدمة في التفاضل والتكامل | Introduction to calculus | advanced secondary |

## Editorial sample questions (not production inserts)

Every item below has one correct answer, three plausible distractors, a bilingual prompt, and a worked solution. Assign stage/category only after curriculum review.

| Key | Arabic question | English question | Options (correct bold) | Explanation |
|---|---|---|---|---|
| fractions-01 | احسب: ٣/٤ + ١/٨ | Compute 3/4 + 1/8 | 1/2, 5/8, **7/8**, 1 | 3/4 = 6/8; 6/8 + 1/8 = 7/8 |
| ratios-01 | إذا كان ثمن ٣ دفاتر ١٢، فما ثمن ٥ دفاتر بالسعر نفسه؟ | If 3 notebooks cost 12, what do 5 cost at the same rate? | 15, **20**, 24, 30 | Unit price = 12/3 = 4; 5 × 4 = 20 |
| algebra-01 | حل: ٢س + ٥ = ١٧ | Solve 2x + 5 = 17 | 5, **6**, 7, 11 | 2x = 12; x = 6 |
| geometry-01 | مستطيل طوله ٨ وعرضه ٣، ما مساحته؟ | A rectangle has length 8 and width 3. Find its area. | 11, 22, **24**, 48 | Area = length × width = 8 × 3 = 24 square units |
| functions-01 | إذا كانت د(س)=٣س−٢، أوجد د(٤) | If f(x)=3x−2, find f(4) | 8, **10**, 12, 14 | f(4) = 3×4 − 2 = 10 |
| probability-01 | نرمي قطعة نقد عادلة مرتين، ما احتمال ظهور صورتين؟ | Toss a fair coin twice. Probability of two heads? | 1/2, 1/3, **1/4**, 3/4 | Four equally likely outcomes, one HH |
| trig-01 | في مثلث قائم، إذا كان المقابل ٣ والوتر ٥، ما جيب الزاوية؟ | In a right triangle, opposite side 3 and hypotenuse 5. Find sine. | 3/4, **3/5**, 4/5, 5/3 | sin θ = opposite / hypotenuse = 3/5 |
| vectors-01 | أوجد طول المتجه (٣،٤) | Find magnitude of vector (3,4) | 4, **5**, 7, 25 | √(3²+4²) = 5 |
| calculus-01 | أوجد مشتقة س² + ٣س | Differentiate x² + 3x | x+3, **2x+3**, 2x, x²+3 | Power rule: d(x²)/dx = 2x and d(3x)/dx = 3 |
| arithmetic-01 | احسب: ٧ × ٨ − ٦ | Compute 7 × 8 − 6 | 42, 48, **50**, 58 | Multiply first: 56 − 6 = 50 |

## Safe import and UI requirements
1. Query actual stage/category IDs and detect semantic duplicates before proposing additions.
2. Store stable content keys in a dedicated catalogue/import mapping, never infer uniqueness from mutable display names.
3. Preview all additions, validate one correct option and 4 distinct choices, language and LaTeX correctness, category-stage consistency, and explanation; use transactions and idempotent inserts.
4. Keep all content unpublished until editor/admin approval and review of regional curriculum.
5. Use one shared icon key per category with mapped web SVG and Flutter assets; provide fallback and accessibility text.
6. UI review: responsive problem cards, consistent stage/category colors, math typesetting, RTL/LTR ordering, readable explanations, and no change to existing branding without verification.
7. Content volume goal is **at least 10 reviewed questions per stage/level as previously requested**, expanded later by category; Free entitlement remains 10 *new attempts per stage per UTC day*, a separate rule.

This document is a concrete editorial starting set, not evidence of new database categories or published questions.
