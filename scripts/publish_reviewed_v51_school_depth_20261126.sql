-- One-time owner-authorized v51 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v51-grade-7-linear-equation-distributive-context-change-1$mw$,$mw$linear-equation-distributive-context-change$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محيط مستطيل بعرض مجهول","En":"Rectangle perimeter with unknown width"},"Question":{"Ar":"طول مستطيل يزيد على عرضه x بمقدار 3، ومحيطه 30. ما العرض؟","En":"A rectangle has width x and length 3 units more than its width. Its perimeter is 30. Find the width."},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 3 من نصف المحيط دون القسمة.","En":"Subtracts three from half the perimeter without dividing."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الطول.","En":"This is the length."}},{"LatexCode":"7.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض تساوي الطول والعرض.","En":"Assumes a square."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب الطول بدلالة العرض.","En":"Express length in terms of width."},{"Ar":"اقسم المحيط على 2 أولاً.","En":"Halve the perimeter first."}],"Solution":{"Idea":{"Ar":"نعوض الطول x+3 في قانون المحيط.","En":"Substitute length x+3 into the perimeter formula."},"FormulaLatex":"2(x+x+3)=30","Steps":[{"Ar":"$2x+3=15$","En":"$2x+3=15$"},{"Ar":"$2x=12$","En":"$2x=12$"},{"Ar":"$x=6$","En":"$x=6$"}],"Substitution":{"Ar":"$2x+3=15$","En":"$2x+3=15$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(6+9)=30$","En":"$2(6+9)=30$"},"CommonError":{"Ar":"نصف المحيط مجموع الطول والعرض وليس العرض وحده.","En":"Half the perimeter is length plus width, not width alone."}}}$mw$::jsonb,$mw$نعوض الطول x+3 في قانون المحيط.

$2(x+x+3)=30$

1. $2x+3=15$

2. $2x=12$

3. $x=6$

$2x+3=15$

$6$

$2(6+9)=30$

نصف المحيط مجموع الطول والعرض وليس العرض وحده.$mw$,$mw$Substitute length x+3 into the perimeter formula.

$2(x+x+3)=30$

1. $2x+3=15$

2. $2x=12$

3. $x=6$

$2x+3=15$

$6$

$2(6+9)=30$

Half the perimeter is length plus width, not width alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الطول بدلالة العرض.","En":"Express length in terms of width."},{"Ar":"اقسم المحيط على 2 أولاً.","En":"Halve the perimeter first."}],"Solution":{"Idea":{"Ar":"نعوض الطول x+3 في قانون المحيط.","En":"Substitute length x+3 into the perimeter formula."},"FormulaLatex":"2(x+x+3)=30","Steps":[{"Ar":"$2x+3=15$","En":"$2x+3=15$"},{"Ar":"$2x=12$","En":"$2x=12$"},{"Ar":"$x=6$","En":"$x=6$"}],"Substitution":{"Ar":"$2x+3=15$","En":"$2x+3=15$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(6+9)=30$","En":"$2(6+9)=30$"},"CommonError":{"Ar":"نصف المحيط مجموع الطول والعرض وليس العرض وحده.","En":"Half the perimeter is length plus width, not width alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 3 من نصف المحيط دون القسمة.","En":"Subtracts three from half the perimeter without dividing."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا الطول.","En":"This is the length."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يفترض تساوي الطول والعرض.","En":"Assumes a square."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v51-grade-8-vertical-angle-adjacent-ratio-1$mw$,$mw$vertical-angle-adjacent-ratio$mw$,$mw$middle-vertical-angles$mw$,$mw$grade-8$mw$,8,2,8,38,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":38,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زوايا متقابلة ومتجاورة","En":"Vertical and adjacent angles"},"Question":{"Ar":"يتقاطع مستقيمان. إحدى الزوايا ضعف الزاوية المجاورة لها. ما قياس الزاوية المقابلة بالرأس للزاوية الأكبر بالدرجات؟","En":"Two lines intersect. One angle is twice its adjacent angle. What is the vertically opposite angle to the larger angle, in degrees?"},"Options":[{"LatexCode":"120","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قياس الزاوية الأصغر.","En":"The smaller angle."}},{"LatexCode":"90","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض التعامد.","En":"Assumes perpendicular lines."}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع الزاويتين المتجاورتين.","En":"The sum of adjacent angles."}}],"Hints":[{"Ar":"رمز للأصغر بـ x.","En":"Let the smaller angle be x."},{"Ar":"الزاوية المقابلة بالرأس تساوي الأكبر.","En":"The vertical angle equals the larger one."}],"Solution":{"Idea":{"Ar":"المتجاورتان على مستقيم مجموعهما 180 والمتقابلتان بالرأس متساويتان.","En":"Adjacent angles on a line sum to 180 and vertical angles are equal."},"FormulaLatex":"x+2x=180","Steps":[{"Ar":"$3x=180$","En":"$3x=180$"},{"Ar":"$x=60$","En":"$x=60$"},{"Ar":"$2x=120$","En":"$2x=120$"}],"Substitution":{"Ar":"$3x=180$","En":"$3x=180$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$60+120=180$","En":"$60+120=180$"},"CommonError":{"Ar":"لا تخلط المتقابلتين بالرأس والمتجاورتين.","En":"Do not confuse vertical and adjacent angles."}}}$mw$::jsonb,$mw$المتجاورتان على مستقيم مجموعهما 180 والمتقابلتان بالرأس متساويتان.

$x+2x=180$

1. $3x=180$

2. $x=60$

3. $2x=120$

$3x=180$

$120$

$60+120=180$

لا تخلط المتقابلتين بالرأس والمتجاورتين.$mw$,$mw$Adjacent angles on a line sum to 180 and vertical angles are equal.

$x+2x=180$

1. $3x=180$

2. $x=60$

3. $2x=120$

$3x=180$

$120$

$60+120=180$

Do not confuse vertical and adjacent angles.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"رمز للأصغر بـ x.","En":"Let the smaller angle be x."},{"Ar":"الزاوية المقابلة بالرأس تساوي الأكبر.","En":"The vertical angle equals the larger one."}],"Solution":{"Idea":{"Ar":"المتجاورتان على مستقيم مجموعهما 180 والمتقابلتان بالرأس متساويتان.","En":"Adjacent angles on a line sum to 180 and vertical angles are equal."},"FormulaLatex":"x+2x=180","Steps":[{"Ar":"$3x=180$","En":"$3x=180$"},{"Ar":"$x=60$","En":"$x=60$"},{"Ar":"$2x=120$","En":"$2x=120$"}],"Substitution":{"Ar":"$3x=180$","En":"$3x=180$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$60+120=180$","En":"$60+120=180$"},"CommonError":{"Ar":"لا تخلط المتقابلتين بالرأس والمتجاورتين.","En":"Do not confuse vertical and adjacent angles."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قياس الزاوية الأصغر.","En":"The smaller angle."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يفترض التعامد.","En":"Assumes perpendicular lines."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مجموع الزاويتين المتجاورتين.","En":"The sum of adjacent angles."},"Order":4}]}$mw$),
($mw$growth-v51-grade-8-median-change-in-order-with-tied-center-1$mw$,$mw$median-change-in-order-with-tied-center$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الوسيط بعد إضافة تكرار","En":"Median after adding a repeated value"},"Question":{"Ar":"القيم المرتبة هي 2،4،8،10. أضيفت قيمة 4 أخرى. ما الوسيط الجديد؟","En":"The sorted values are 2,4,8,10. Another value of 4 is added. What is the new median?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الوسيط قبل الإضافة.","En":"The original median."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القيمة الرابعة في القائمة الجديدة.","En":"The fourth new observation."}},{"LatexCode":"5.6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المتوسط الحسابي الجديد.","En":"The new mean."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"أعد ترتيب القيم بعد الإضافة.","En":"Sort after insertion."},{"Ar":"اختر القيمة الثالثة من خمس.","En":"Choose the third of five."}],"Solution":{"Idea":{"Ar":"بعد الإضافة يصبح العدد فردياً والوسيط هو القيمة الثالثة.","En":"After insertion the count is odd and the median is third."},"FormulaLatex":"i=(5+1)/2","Steps":[{"Ar":"$2,4,4,8,10$","En":"$2,4,4,8,10$"},{"Ar":"$i=3$","En":"$i=3$"},{"Ar":"$x_3=4$","En":"$x_3=4$"}],"Substitution":{"Ar":"$2,4,4,8,10$","En":"$2,4,4,8,10$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2<4\\le4\\le8<10$","En":"$2<4\\le4\\le8<10$"},"CommonError":{"Ar":"لا تستعمل متوسط القيمتين الوسطيتين بعد تحول العدد إلى فردي.","En":"Do not average two middle values once the count is odd."}}}$mw$::jsonb,$mw$بعد الإضافة يصبح العدد فردياً والوسيط هو القيمة الثالثة.

$i=(5+1)/2$

1. $2,4,4,8,10$

2. $i=3$

3. $x_3=4$

$2,4,4,8,10$

$4$

$2<4\le4\le8<10$

لا تستعمل متوسط القيمتين الوسطيتين بعد تحول العدد إلى فردي.$mw$,$mw$After insertion the count is odd and the median is third.

$i=(5+1)/2$

1. $2,4,4,8,10$

2. $i=3$

3. $x_3=4$

$2,4,4,8,10$

$4$

$2<4\le4\le8<10$

Do not average two middle values once the count is odd.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أعد ترتيب القيم بعد الإضافة.","En":"Sort after insertion."},{"Ar":"اختر القيمة الثالثة من خمس.","En":"Choose the third of five."}],"Solution":{"Idea":{"Ar":"بعد الإضافة يصبح العدد فردياً والوسيط هو القيمة الثالثة.","En":"After insertion the count is odd and the median is third."},"FormulaLatex":"i=(5+1)/2","Steps":[{"Ar":"$2,4,4,8,10$","En":"$2,4,4,8,10$"},{"Ar":"$i=3$","En":"$i=3$"},{"Ar":"$x_3=4$","En":"$x_3=4$"}],"Substitution":{"Ar":"$2,4,4,8,10$","En":"$2,4,4,8,10$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2<4\\le4\\le8<10$","En":"$2<4\\le4\\le8<10$"},"CommonError":{"Ar":"لا تستعمل متوسط القيمتين الوسطيتين بعد تحول العدد إلى فردي.","En":"Do not average two middle values once the count is odd."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الوسيط قبل الإضافة.","En":"The original median."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"القيمة الرابعة في القائمة الجديدة.","En":"The fourth new observation."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"المتوسط الحسابي الجديد.","En":"The new mean."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v51-grade-8-sample-space-distinct-products-not-pairs-1$mw$,$mw$sample-space-distinct-products-not-pairs$mw$,$mw$sample-spaces$mw$,$mw$grade-8$mw$,8,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد النواتج المختلفة","En":"Distinct product outcomes"},"Question":{"Ar":"تُختار قيمة من {1,2,3} وقيمة من {2,4}، ثم تضرب القيمتان. كم حاصل ضرب مختلفاً يمكن الحصول عليه؟","En":"Choose one value from {1,2,3} and one from {2,4}, then multiply. How many distinct products are possible?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد الناتج 4 مرتين.","En":"Counts product four twice."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمثل عدد الأزواج أو النواتج.","En":"Neither the pair count nor the product count."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد قيم المجموعة الأولى فقط.","En":"Counts only the first set."}}],"Hints":[{"Ar":"اكتب ست عمليات ضرب.","En":"List all six products."},{"Ar":"احذف كل قيمة مكررة.","En":"Remove repeated values."}],"Solution":{"Idea":{"Ar":"نسرد النواتج ونزيل التكرار.","En":"List products and remove duplicates."},"FormulaLatex":"\\{1,2,3\\}\\times\\{2,4\\}","Steps":[{"Ar":"$1\\cdot2=2,\\ 1\\cdot4=4$","En":"$1\\cdot2=2,\\ 1\\cdot4=4$"},{"Ar":"$2\\cdot2=4,\\ 2\\cdot4=8$","En":"$2\\cdot2=4,\\ 2\\cdot4=8$"},{"Ar":"$3\\cdot2=6,\\ 3\\cdot4=12$","En":"$3\\cdot2=6,\\ 3\\cdot4=12$"}],"Substitution":{"Ar":"$1\\cdot2=2,\\ 1\\cdot4=4$","En":"$1\\cdot2=2,\\ 1\\cdot4=4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|\\{2,4,6,8,12\\}|=5$","En":"$|\\{2,4,6,8,12\\}|=5$"},"CommonError":{"Ar":"عدد الأزواج ليس دائماً عدد النواتج المختلفة.","En":"The pair count need not equal the number of distinct results."}}}$mw$::jsonb,$mw$نسرد النواتج ونزيل التكرار.

$\{1,2,3\}\times\{2,4\}$

1. $1\cdot2=2,\ 1\cdot4=4$

2. $2\cdot2=4,\ 2\cdot4=8$

3. $3\cdot2=6,\ 3\cdot4=12$

$1\cdot2=2,\ 1\cdot4=4$

$5$

$|\{2,4,6,8,12\}|=5$

عدد الأزواج ليس دائماً عدد النواتج المختلفة.$mw$,$mw$List products and remove duplicates.

$\{1,2,3\}\times\{2,4\}$

1. $1\cdot2=2,\ 1\cdot4=4$

2. $2\cdot2=4,\ 2\cdot4=8$

3. $3\cdot2=6,\ 3\cdot4=12$

$1\cdot2=2,\ 1\cdot4=4$

$5$

$|\{2,4,6,8,12\}|=5$

The pair count need not equal the number of distinct results.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب ست عمليات ضرب.","En":"List all six products."},{"Ar":"احذف كل قيمة مكررة.","En":"Remove repeated values."}],"Solution":{"Idea":{"Ar":"نسرد النواتج ونزيل التكرار.","En":"List products and remove duplicates."},"FormulaLatex":"\\{1,2,3\\}\\times\\{2,4\\}","Steps":[{"Ar":"$1\\cdot2=2,\\ 1\\cdot4=4$","En":"$1\\cdot2=2,\\ 1\\cdot4=4$"},{"Ar":"$2\\cdot2=4,\\ 2\\cdot4=8$","En":"$2\\cdot2=4,\\ 2\\cdot4=8$"},{"Ar":"$3\\cdot2=6,\\ 3\\cdot4=12$","En":"$3\\cdot2=6,\\ 3\\cdot4=12$"}],"Substitution":{"Ar":"$1\\cdot2=2,\\ 1\\cdot4=4$","En":"$1\\cdot2=2,\\ 1\\cdot4=4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|\\{2,4,6,8,12\\}|=5$","En":"$|\\{2,4,6,8,12\\}|=5$"},"CommonError":{"Ar":"عدد الأزواج ليس دائماً عدد النواتج المختلفة.","En":"The pair count need not equal the number of distinct results."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعد الناتج 4 مرتين.","En":"Counts product four twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا يمثل عدد الأزواج أو النواتج.","En":"Neither the pair count nor the product count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدد قيم المجموعة الأولى فقط.","En":"Counts only the first set."},"Order":4}]}$mw$),
($mw$growth-v51-grade-9-pythagorean-square-diagonal-area-1$mw$,$mw$pythagorean-square-diagonal-area$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة مربع من قطره","En":"Square area from diagonal"},"Question":{"Ar":"قطر مربع طوله $10\\sqrt2$. ما مساحة المربع؟","En":"A square has diagonal $10\\sqrt2$. What is its area?"},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين المساحة والطول.","En":"Confuses area with length."}},{"LatexCode":"100","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم مربع القطر على أربعة.","En":"Divides the squared diagonal by four."}},{"LatexCode":"200","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع القطر وليس مساحة المربع.","En":"The squared diagonal, not the square area."}}],"Hints":[{"Ar":"اكتب فيثاغورس للساقين المتساويتين.","En":"Apply Pythagoras to equal legs."},{"Ar":"المساحة هي مربع الضلع.","En":"Area is the squared side."}],"Solution":{"Idea":{"Ar":"يشكل القطر مثلثاً قائماً بساقين متساويتين.","En":"The diagonal forms a right triangle with equal legs."},"FormulaLatex":"d^2=2s^2","Steps":[{"Ar":"$(10\\sqrt2)^2=200$","En":"$(10\\sqrt2)^2=200$"},{"Ar":"$s^2=200/2=100$","En":"$s^2=200/2=100$"}],"Substitution":{"Ar":"$(10\\sqrt2)^2=200$","En":"$(10\\sqrt2)^2=200$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10^2+10^2=200$","En":"$10^2+10^2=200$"},"CommonError":{"Ar":"لا تستعمل مربع القطر مباشرة كمساحة.","En":"Do not use the squared diagonal as the area."}}}$mw$::jsonb,$mw$يشكل القطر مثلثاً قائماً بساقين متساويتين.

$d^2=2s^2$

1. $(10\sqrt2)^2=200$

2. $s^2=200/2=100$

$(10\sqrt2)^2=200$

$100$

$10^2+10^2=200$

لا تستعمل مربع القطر مباشرة كمساحة.$mw$,$mw$The diagonal forms a right triangle with equal legs.

$d^2=2s^2$

1. $(10\sqrt2)^2=200$

2. $s^2=200/2=100$

$(10\sqrt2)^2=200$

$100$

$10^2+10^2=200$

Do not use the squared diagonal as the area.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب فيثاغورس للساقين المتساويتين.","En":"Apply Pythagoras to equal legs."},{"Ar":"المساحة هي مربع الضلع.","En":"Area is the squared side."}],"Solution":{"Idea":{"Ar":"يشكل القطر مثلثاً قائماً بساقين متساويتين.","En":"The diagonal forms a right triangle with equal legs."},"FormulaLatex":"d^2=2s^2","Steps":[{"Ar":"$(10\\sqrt2)^2=200$","En":"$(10\\sqrt2)^2=200$"},{"Ar":"$s^2=200/2=100$","En":"$s^2=200/2=100$"}],"Substitution":{"Ar":"$(10\\sqrt2)^2=200$","En":"$(10\\sqrt2)^2=200$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10^2+10^2=200$","En":"$10^2+10^2=200$"},"CommonError":{"Ar":"لا تستعمل مربع القطر مباشرة كمساحة.","En":"Do not use the squared diagonal as the area."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خلط بين المساحة والطول.","En":"Confuses area with length."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم مربع القطر على أربعة.","En":"Divides the squared diagonal by four."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مربع القطر وليس مساحة المربع.","En":"The squared diagonal, not the square area."},"Order":4}]}$mw$),
($mw$growth-v51-grade-9-similar-triangle-perimeter-area-scale-check-1$mw$,$mw$similar-triangle-perimeter-area-scale-check$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة المحيط من نسبة المساحة","En":"Perimeter ratio from area ratio"},"Question":{"Ar":"مثلثان متشابهان، نسبة مساحة الأكبر إلى الأصغر 49:9. محيط الأصغر 18. ما محيط الأكبر؟","En":"Two triangles are similar with larger-to-smaller area ratio 49:9. The smaller perimeter is 18. What is the larger perimeter?"},"Options":[{"LatexCode":"42","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"98","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب المحيط بنسبة المساحات.","En":"Scales perimeter by the area ratio."}},{"LatexCode":"54","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل العدد 3 بدلاً من النسبة.","En":"Uses three instead of the ratio."}},{"LatexCode":"126","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب في 7 دون القسمة على 3.","En":"Multiplies by seven without dividing by three."}}],"Hints":[{"Ar":"نسبة المساحات مربع نسبة الأطوال.","En":"Area ratio is the squared length ratio."},{"Ar":"اضرب المحيط في 7/3.","En":"Multiply the perimeter by 7/3."}],"Solution":{"Idea":{"Ar":"نأخذ الجذر التربيعي لنسبة المساحات لإيجاد نسبة الأطوال.","En":"Take the square root of the area ratio to get the length ratio."},"FormulaLatex":"k=\\sqrt{49/9}","Steps":[{"Ar":"$k=7/3$","En":"$k=7/3$"},{"Ar":"$18\\cdot7/3=42$","En":"$18\\cdot7/3=42$"}],"Substitution":{"Ar":"$k=7/3$","En":"$k=7/3$"},"Result":{"Ar":"$42$","En":"$42$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(42/18)^2=49/9$","En":"$(42/18)^2=49/9$"},"CommonError":{"Ar":"المحيط يتغير خطياً لا تربيعياً.","En":"Perimeter scales linearly, not quadratically."}}}$mw$::jsonb,$mw$نأخذ الجذر التربيعي لنسبة المساحات لإيجاد نسبة الأطوال.

$k=\sqrt{49/9}$

1. $k=7/3$

2. $18\cdot7/3=42$

$k=7/3$

$42$

$(42/18)^2=49/9$

المحيط يتغير خطياً لا تربيعياً.$mw$,$mw$Take the square root of the area ratio to get the length ratio.

$k=\sqrt{49/9}$

1. $k=7/3$

2. $18\cdot7/3=42$

$k=7/3$

$42$

$(42/18)^2=49/9$

Perimeter scales linearly, not quadratically.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"نسبة المساحات مربع نسبة الأطوال.","En":"Area ratio is the squared length ratio."},{"Ar":"اضرب المحيط في 7/3.","En":"Multiply the perimeter by 7/3."}],"Solution":{"Idea":{"Ar":"نأخذ الجذر التربيعي لنسبة المساحات لإيجاد نسبة الأطوال.","En":"Take the square root of the area ratio to get the length ratio."},"FormulaLatex":"k=\\sqrt{49/9}","Steps":[{"Ar":"$k=7/3$","En":"$k=7/3$"},{"Ar":"$18\\cdot7/3=42$","En":"$18\\cdot7/3=42$"}],"Substitution":{"Ar":"$k=7/3$","En":"$k=7/3$"},"Result":{"Ar":"$42$","En":"$42$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(42/18)^2=49/9$","En":"$(42/18)^2=49/9$"},"CommonError":{"Ar":"المحيط يتغير خطياً لا تربيعياً.","En":"Perimeter scales linearly, not quadratically."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضرب المحيط بنسبة المساحات.","En":"Scales perimeter by the area ratio."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل العدد 3 بدلاً من النسبة.","En":"Uses three instead of the ratio."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضرب في 7 دون القسمة على 3.","En":"Multiplies by seven without dividing by three."},"Order":4}]}$mw$),
($mw$growth-v51-grade-9-probability-with-replacement-exactly-one-success-1$mw$,$mw$probability-with-replacement-exactly-one-success$mw$,$mw$simple-compound-events$mw$,$mw$grade-9$mw$,9,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال نجاح واحد بالضبط","En":"Exactly one success"},"Question":{"Ar":"كيس فيه كرتان حمراوان وثلاث زرق. نسحب كرتين عشوائياً مع إعادة الأولى قبل السحب الثاني. ما احتمال الحصول على حمراء واحدة بالضبط؟","En":"A bag has two red and three blue balls. Two random draws are made with replacement. What is the probability of exactly one red ball?"},"Options":[{"LatexCode":"\\frac4{25}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتمال حمراوين.","En":"Probability of two reds."}},{"LatexCode":"\\frac9{25}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتمال زرقاوين.","En":"Probability of two blues."}},{"LatexCode":"\\frac{12}{25}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac6{25}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يحسب ترتيباً واحداً فقط.","En":"Counts just one order."}}],"Hints":[{"Ar":"الإعادة تبقي الاحتمالات ثابتة.","En":"Replacement preserves the probabilities."},{"Ar":"احسب الترتيبين واجمعهما.","En":"Count both orders and add."}],"Solution":{"Idea":{"Ar":"الحالتان المتنافيتان أحمر ثم أزرق أو أزرق ثم أحمر.","En":"The disjoint cases are red then blue or blue then red."},"FormulaLatex":"P=2(2/5)(3/5)","Steps":[{"Ar":"$P(RB)=6/25$","En":"$P(RB)=6/25$"},{"Ar":"$P(BR)=6/25$","En":"$P(BR)=6/25$"},{"Ar":"$P=12/25$","En":"$P=12/25$"}],"Substitution":{"Ar":"$P(RB)=6/25$","En":"$P(RB)=6/25$"},"Result":{"Ar":"$\\frac{12}{25}$","En":"$\\frac{12}{25}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4/25+12/25+9/25=1$","En":"$4/25+12/25+9/25=1$"},"CommonError":{"Ar":"لا تهمل أحد الترتيبين.","En":"Do not omit either order."}}}$mw$::jsonb,$mw$الحالتان المتنافيتان أحمر ثم أزرق أو أزرق ثم أحمر.

$P=2(2/5)(3/5)$

1. $P(RB)=6/25$

2. $P(BR)=6/25$

3. $P=12/25$

$P(RB)=6/25$

$\frac{12}{25}$

$4/25+12/25+9/25=1$

لا تهمل أحد الترتيبين.$mw$,$mw$The disjoint cases are red then blue or blue then red.

$P=2(2/5)(3/5)$

1. $P(RB)=6/25$

2. $P(BR)=6/25$

3. $P=12/25$

$P(RB)=6/25$

$\frac{12}{25}$

$4/25+12/25+9/25=1$

Do not omit either order.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الإعادة تبقي الاحتمالات ثابتة.","En":"Replacement preserves the probabilities."},{"Ar":"احسب الترتيبين واجمعهما.","En":"Count both orders and add."}],"Solution":{"Idea":{"Ar":"الحالتان المتنافيتان أحمر ثم أزرق أو أزرق ثم أحمر.","En":"The disjoint cases are red then blue or blue then red."},"FormulaLatex":"P=2(2/5)(3/5)","Steps":[{"Ar":"$P(RB)=6/25$","En":"$P(RB)=6/25$"},{"Ar":"$P(BR)=6/25$","En":"$P(BR)=6/25$"},{"Ar":"$P=12/25$","En":"$P=12/25$"}],"Substitution":{"Ar":"$P(RB)=6/25$","En":"$P(RB)=6/25$"},"Result":{"Ar":"$\\frac{12}{25}$","En":"$\\frac{12}{25}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4/25+12/25+9/25=1$","En":"$4/25+12/25+9/25=1$"},"CommonError":{"Ar":"لا تهمل أحد الترتيبين.","En":"Do not omit either order."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"احتمال حمراوين.","En":"Probability of two reds."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"احتمال زرقاوين.","En":"Probability of two blues."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يحسب ترتيباً واحداً فقط.","En":"Counts just one order."},"Order":4}]}$mw$),
($mw$growth-v51-grade-10-arithmetic-sequence-symmetric-index-property-1$mw$,$mw$arithmetic-sequence-symmetric-index-property$mw$,$mw$s-sequences-series-arithmetic-sequences$mw$,$mw$grade-10$mw$,10,3,23,104,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":104,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حد في منتصف حدين","En":"Middle indexed term"},"Question":{"Ar":"في متتالية حسابية $a_4=13$ و$a_{10}=37$. ما قيمة $a_7$؟","En":"In an arithmetic sequence, $a_4=13$ and $a_{10}=37$. Find $a_7$."},"Options":[{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع الحدين لا متوسطهما.","En":"Adds the two terms without averaging."}},{"LatexCode":"25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق الحدين المعطيين.","En":"This is the difference of the given terms."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس متوسط الحدين.","En":"Not their midpoint."}}],"Hints":[{"Ar":"لاحظ أن 7 منتصف 4 و10.","En":"Notice seven is midway between four and ten."},{"Ar":"احسب متوسط الحدين.","En":"Average the two terms."}],"Solution":{"Idea":{"Ar":"الحد الواقع في منتصف الفهرسين هو متوسط الحدين.","En":"The term midway between two indices is their average."},"FormulaLatex":"a_7=(a_4+a_{10})/2","Steps":[{"Ar":"$d=(37-13)/6=4$","En":"$d=(37-13)/6=4$"},{"Ar":"$a_7=13+3\\cdot4=25$","En":"$a_7=13+3\\cdot4=25$"}],"Substitution":{"Ar":"$d=(37-13)/6=4$","En":"$d=(37-13)/6=4$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$37-25=25-13=12$","En":"$37-25=25-13=12$"},"CommonError":{"Ar":"لا تخلط فرق الحدين مع قيمة الحد الأوسط.","En":"Do not confuse the difference with the middle term."}}}$mw$::jsonb,$mw$الحد الواقع في منتصف الفهرسين هو متوسط الحدين.

$a_7=(a_4+a_{10})/2$

1. $d=(37-13)/6=4$

2. $a_7=13+3\cdot4=25$

$d=(37-13)/6=4$

$25$

$37-25=25-13=12$

لا تخلط فرق الحدين مع قيمة الحد الأوسط.$mw$,$mw$The term midway between two indices is their average.

$a_7=(a_4+a_{10})/2$

1. $d=(37-13)/6=4$

2. $a_7=13+3\cdot4=25$

$d=(37-13)/6=4$

$25$

$37-25=25-13=12$

Do not confuse the difference with the middle term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لاحظ أن 7 منتصف 4 و10.","En":"Notice seven is midway between four and ten."},{"Ar":"احسب متوسط الحدين.","En":"Average the two terms."}],"Solution":{"Idea":{"Ar":"الحد الواقع في منتصف الفهرسين هو متوسط الحدين.","En":"The term midway between two indices is their average."},"FormulaLatex":"a_7=(a_4+a_{10})/2","Steps":[{"Ar":"$d=(37-13)/6=4$","En":"$d=(37-13)/6=4$"},{"Ar":"$a_7=13+3\\cdot4=25$","En":"$a_7=13+3\\cdot4=25$"}],"Substitution":{"Ar":"$d=(37-13)/6=4$","En":"$d=(37-13)/6=4$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$37-25=25-13=12$","En":"$37-25=25-13=12$"},"CommonError":{"Ar":"لا تخلط فرق الحدين مع قيمة الحد الأوسط.","En":"Do not confuse the difference with the middle term."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مجموع الحدين لا متوسطهما.","En":"Adds the two terms without averaging."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق الحدين المعطيين.","En":"This is the difference of the given terms."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ليس متوسط الحدين.","En":"Not their midpoint."},"Order":4}]}$mw$),
($mw$growth-v51-grade-10-geometric-sequence-negative-ratio-sign-parity-1$mw$,$mw$geometric-sequence-negative-ratio-sign-parity$mw$,$mw$s-sequences-series-geometric-sequences$mw$,$mw$grade-10$mw$,10,3,23,103,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":103,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إشارة حد في متتالية هندسية","En":"Sign of a geometric term"},"Question":{"Ar":"متتالية هندسية حدها الأول موجب ونسبتها المشتركة سالبة. أي فهرس من الخيارات يوافق حداً سالباً؟","En":"A geometric sequence has positive first term and negative common ratio. Which listed index has a negative term?"},"Options":[{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحد الأول موجب.","En":"The first term is positive."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أس النسبة أربعة وهو زوجي.","En":"The ratio exponent is even (four)."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أس النسبة عشرة وهو زوجي.","En":"The ratio exponent is even (ten)."}}],"Hints":[{"Ar":"اكتب أس النسبة بدلالة الفهرس.","En":"Write the exponent in terms of the index."},{"Ar":"اختر أساً فردياً.","En":"Choose an odd exponent."}],"Solution":{"Idea":{"Ar":"إشارة الحد تعتمد على زوجية أس النسبة n−1.","En":"The sign depends on the parity of exponent n−1."},"FormulaLatex":"a_n=a_1r^{n-1}","Steps":[{"Ar":"$8-1=7$","En":"$8-1=7$"},{"Ar":"$(-1)^7=-1$","En":"$(-1)^7=-1$"}],"Substitution":{"Ar":"$8-1=7$","En":"$8-1=7$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-1)^4=(-1)^{10}=1$","En":"$(-1)^4=(-1)^{10}=1$"},"CommonError":{"Ar":"لا تختبر زوجية n بدلاً من n−1 دون الانتباه للحد الأول.","En":"Remember the exponent is n−1, not n."}}}$mw$::jsonb,$mw$إشارة الحد تعتمد على زوجية أس النسبة n−1.

$a_n=a_1r^{n-1}$

1. $8-1=7$

2. $(-1)^7=-1$

$8-1=7$

$8$

$(-1)^4=(-1)^{10}=1$

لا تختبر زوجية n بدلاً من n−1 دون الانتباه للحد الأول.$mw$,$mw$The sign depends on the parity of exponent n−1.

$a_n=a_1r^{n-1}$

1. $8-1=7$

2. $(-1)^7=-1$

$8-1=7$

$8$

$(-1)^4=(-1)^{10}=1$

Remember the exponent is n−1, not n.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب أس النسبة بدلالة الفهرس.","En":"Write the exponent in terms of the index."},{"Ar":"اختر أساً فردياً.","En":"Choose an odd exponent."}],"Solution":{"Idea":{"Ar":"إشارة الحد تعتمد على زوجية أس النسبة n−1.","En":"The sign depends on the parity of exponent n−1."},"FormulaLatex":"a_n=a_1r^{n-1}","Steps":[{"Ar":"$8-1=7$","En":"$8-1=7$"},{"Ar":"$(-1)^7=-1$","En":"$(-1)^7=-1$"}],"Substitution":{"Ar":"$8-1=7$","En":"$8-1=7$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-1)^4=(-1)^{10}=1$","En":"$(-1)^4=(-1)^{10}=1$"},"CommonError":{"Ar":"لا تختبر زوجية n بدلاً من n−1 دون الانتباه للحد الأول.","En":"Remember the exponent is n−1, not n."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الحد الأول موجب.","En":"The first term is positive."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أس النسبة أربعة وهو زوجي.","En":"The ratio exponent is even (four)."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أس النسبة عشرة وهو زوجي.","En":"The ratio exponent is even (ten)."},"Order":4}]}$mw$),
($mw$growth-v51-grade-10-vector-linear-combination-inverse-components-1$mw$,$mw$vector-linear-combination-inverse-components$mw$,$mw$vector-components$mw$,$mw$grade-10$mw$,10,3,87,340,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":340,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع متجه من محصلته","En":"Recovering a vector from a resultant"},"Question":{"Ar":"إذا كان $2u+v=(9,1)$ و$v=(3,-5)$، فما مركبتا u؟","En":"If $2u+v=(9,1)$ and $v=(3,-5)$, what are the components of u?"},"Options":[{"LatexCode":"(6,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مركبتا 2u.","En":"These are the components of 2u."}},{"LatexCode":"(6,-2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع v بدلاً من طرحه ثم قسم.","En":"Adds v instead of subtracting it, then divides."}},{"LatexCode":"(3,-2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ في طرح المركبة السالبة.","En":"Mishandles subtraction of a negative component."}},{"LatexCode":"(3,3)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اطرح v من الطرفين.","En":"Subtract v from both sides."},{"Ar":"اقسم كل مركبة على اثنين.","En":"Halve each component."}],"Solution":{"Idea":{"Ar":"نطرح المتجه المعروف ثم نقسم كل مركبة على اثنين.","En":"Subtract the known vector and divide each component by two."},"FormulaLatex":"u=((9,1)-v)/2","Steps":[{"Ar":"$2u=(6,6)$","En":"$2u=(6,6)$"},{"Ar":"$u=(3,3)$","En":"$u=(3,3)$"}],"Substitution":{"Ar":"$2u=(6,6)$","En":"$2u=(6,6)$"},"Result":{"Ar":"$(3,3)$","En":"$(3,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(3,3)+(3,-5)=(9,1)$","En":"$2(3,3)+(3,-5)=(9,1)$"},"CommonError":{"Ar":"طرح مركبة سالبة يعني إضافة مقدارها.","En":"Subtracting a negative component adds its magnitude."}}}$mw$::jsonb,$mw$نطرح المتجه المعروف ثم نقسم كل مركبة على اثنين.

$u=((9,1)-v)/2$

1. $2u=(6,6)$

2. $u=(3,3)$

$2u=(6,6)$

$(3,3)$

$2(3,3)+(3,-5)=(9,1)$

طرح مركبة سالبة يعني إضافة مقدارها.$mw$,$mw$Subtract the known vector and divide each component by two.

$u=((9,1)-v)/2$

1. $2u=(6,6)$

2. $u=(3,3)$

$2u=(6,6)$

$(3,3)$

$2(3,3)+(3,-5)=(9,1)$

Subtracting a negative component adds its magnitude.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح v من الطرفين.","En":"Subtract v from both sides."},{"Ar":"اقسم كل مركبة على اثنين.","En":"Halve each component."}],"Solution":{"Idea":{"Ar":"نطرح المتجه المعروف ثم نقسم كل مركبة على اثنين.","En":"Subtract the known vector and divide each component by two."},"FormulaLatex":"u=((9,1)-v)/2","Steps":[{"Ar":"$2u=(6,6)$","En":"$2u=(6,6)$"},{"Ar":"$u=(3,3)$","En":"$u=(3,3)$"}],"Substitution":{"Ar":"$2u=(6,6)$","En":"$2u=(6,6)$"},"Result":{"Ar":"$(3,3)$","En":"$(3,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(3,3)+(3,-5)=(9,1)$","En":"$2(3,3)+(3,-5)=(9,1)$"},"CommonError":{"Ar":"طرح مركبة سالبة يعني إضافة مقدارها.","En":"Subtracting a negative component adds its magnitude."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه مركبتا 2u.","En":"These are the components of 2u."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع v بدلاً من طرحه ثم قسم.","En":"Adds v instead of subtracting it, then divides."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أخطأ في طرح المركبة السالبة.","En":"Mishandles subtraction of a negative component."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v51-grade-10-coordinate-line-horizontal-vertical-intersection-1$mw$,$mw$coordinate-line-horizontal-vertical-intersection$mw$,$mw$coordinate-lines$mw$,$mw$grade-10$mw$,10,3,88,329,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":329,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقاطع مستقيمين خاصين","En":"Intersection of special lines"},"Question":{"Ar":"ما نقطة تقاطع المستقيمين $x=-3$ و$y=5$؟","En":"What is the intersection of the lines $x=-3$ and $y=5$?"},"Options":[{"LatexCode":"(3,5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف إشارة x السالبة.","En":"Drops the negative x sign."}},{"LatexCode":"(-3,-5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"غيّر إشارة y.","En":"Changes the y sign."}},{"LatexCode":"(-3,5)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(5,-3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بدّل ترتيب الإحداثيين.","En":"Swaps the coordinate order."}}],"Hints":[{"Ar":"المستقيم الأول يثبت x.","En":"The first line fixes x."},{"Ar":"اكتب الإحداثي الأفقي قبل الرأسي.","En":"Write the horizontal coordinate first."}],"Solution":{"Idea":{"Ar":"نقطة التقاطع تحقق المعادلتين في الوقت نفسه.","En":"The intersection satisfies both equations."},"FormulaLatex":"x=-3,\\quad y=5","Steps":[{"Ar":"$(x,y)=(-3,5)$","En":"$(x,y)=(-3,5)$"}],"Substitution":{"Ar":"$(x,y)=(-3,5)$","En":"$(x,y)=(-3,5)$"},"Result":{"Ar":"$(-3,5)$","En":"$(-3,5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x+3=0,\\quad y-5=0$","En":"$x+3=0,\\quad y-5=0$"},"CommonError":{"Ar":"لا تبدل ترتيب x وy.","En":"Do not swap x and y."}}}$mw$::jsonb,$mw$نقطة التقاطع تحقق المعادلتين في الوقت نفسه.

$x=-3,\quad y=5$

1. $(x,y)=(-3,5)$

$(x,y)=(-3,5)$

$(-3,5)$

$x+3=0,\quad y-5=0$

لا تبدل ترتيب x وy.$mw$,$mw$The intersection satisfies both equations.

$x=-3,\quad y=5$

1. $(x,y)=(-3,5)$

$(x,y)=(-3,5)$

$(-3,5)$

$x+3=0,\quad y-5=0$

Do not swap x and y.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المستقيم الأول يثبت x.","En":"The first line fixes x."},{"Ar":"اكتب الإحداثي الأفقي قبل الرأسي.","En":"Write the horizontal coordinate first."}],"Solution":{"Idea":{"Ar":"نقطة التقاطع تحقق المعادلتين في الوقت نفسه.","En":"The intersection satisfies both equations."},"FormulaLatex":"x=-3,\\quad y=5","Steps":[{"Ar":"$(x,y)=(-3,5)$","En":"$(x,y)=(-3,5)$"}],"Substitution":{"Ar":"$(x,y)=(-3,5)$","En":"$(x,y)=(-3,5)$"},"Result":{"Ar":"$(-3,5)$","En":"$(-3,5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x+3=0,\\quad y-5=0$","En":"$x+3=0,\\quad y-5=0$"},"CommonError":{"Ar":"لا تبدل ترتيب x وy.","En":"Do not swap x and y."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حذف إشارة x السالبة.","En":"Drops the negative x sign."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"غيّر إشارة y.","En":"Changes the y sign."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"بدّل ترتيب الإحداثيين.","En":"Swaps the coordinate order."},"Order":4}]}$mw$),
($mw$growth-v51-grade-11-combinations-complementary-selection-excluded-1$mw$,$mw$combinations-complementary-selection-excluded$mw$,$mw$secondary-combinations$mw$,$mw$grade-11$mw$,11,3,12,56,$mw${"StageId":3,"CategoryId":12,"PrimarySkillId":56,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار عن طريق المستبعدين","En":"Selection through its complement"},"Question":{"Ar":"من 9 أشخاص مختلفين نختار لجنة من 7 دون ترتيب. كم لجنة ممكنة؟","En":"From nine distinct people, choose an unordered committee of seven. How many committees are possible?"},"Options":[{"LatexCode":"21","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يحسب اختيار شخصين من سبعة.","En":"Chooses two from seven."}},{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"72","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد ترتيب الشخصين المستبعدين مرتين.","En":"Counts the two excluded people in both orders."}},{"LatexCode":"63","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب 9 في 7 دون استعمال التوافيق.","En":"Multiplies nine by seven without combinations."}}],"Hints":[{"Ar":"كم شخصاً لن يدخل اللجنة؟","En":"How many people are excluded?"},{"Ar":"اختر المستبعدين دون ترتيب.","En":"Choose the excluded pair without order."}],"Solution":{"Idea":{"Ar":"اختيار سبعة يكافئ تحديد الشخصين المستبعدين.","En":"Choosing seven is equivalent to choosing the two excluded people."},"FormulaLatex":"\\binom97=\\binom92","Steps":[{"Ar":"$\\binom92=9\\cdot8/2$","En":"$\\binom92=9\\cdot8/2$"},{"Ar":"$=36$","En":"$=36$"}],"Substitution":{"Ar":"$\\binom92=9\\cdot8/2$","En":"$\\binom92=9\\cdot8/2$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36\\cdot2=72$","En":"$36\\cdot2=72$"},"CommonError":{"Ar":"لا تعد تبديل ترتيب المستبعدين لجنة جديدة.","En":"Do not count different orders of the excluded pair as new committees."}}}$mw$::jsonb,$mw$اختيار سبعة يكافئ تحديد الشخصين المستبعدين.

$\binom97=\binom92$

1. $\binom92=9\cdot8/2$

2. $=36$

$\binom92=9\cdot8/2$

$36$

$36\cdot2=72$

لا تعد تبديل ترتيب المستبعدين لجنة جديدة.$mw$,$mw$Choosing seven is equivalent to choosing the two excluded people.

$\binom97=\binom92$

1. $\binom92=9\cdot8/2$

2. $=36$

$\binom92=9\cdot8/2$

$36$

$36\cdot2=72$

Do not count different orders of the excluded pair as new committees.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم شخصاً لن يدخل اللجنة؟","En":"How many people are excluded?"},{"Ar":"اختر المستبعدين دون ترتيب.","En":"Choose the excluded pair without order."}],"Solution":{"Idea":{"Ar":"اختيار سبعة يكافئ تحديد الشخصين المستبعدين.","En":"Choosing seven is equivalent to choosing the two excluded people."},"FormulaLatex":"\\binom97=\\binom92","Steps":[{"Ar":"$\\binom92=9\\cdot8/2$","En":"$\\binom92=9\\cdot8/2$"},{"Ar":"$=36$","En":"$=36$"}],"Substitution":{"Ar":"$\\binom92=9\\cdot8/2$","En":"$\\binom92=9\\cdot8/2$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36\\cdot2=72$","En":"$36\\cdot2=72$"},"CommonError":{"Ar":"لا تعد تبديل ترتيب المستبعدين لجنة جديدة.","En":"Do not count different orders of the excluded pair as new committees."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يحسب اختيار شخصين من سبعة.","En":"Chooses two from seven."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عد ترتيب الشخصين المستبعدين مرتين.","En":"Counts the two excluded people in both orders."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضرب 9 في 7 دون استعمال التوافيق.","En":"Multiplies nine by seven without combinations."},"Order":4}]}$mw$),
($mw$growth-v51-grade-11-dot-product-bilinearity-difference-known-1$mw$,$mw$dot-product-bilinearity-difference-known$mw$,$mw$dot-product$mw$,$mw$grade-11$mw$,11,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الضرب القياسي من قيم معلومة","En":"Dot product from given products"},"Question":{"Ar":"إذا كان $u\\cdot v=7$ و$u\\cdot w=-2$، فما $u\\cdot(2v-3w)$؟","En":"If $u\\cdot v=7$ and $u\\cdot w=-2$, find $u\\cdot(2v-3w)$."},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 6 بدلاً من إضافة 6.","En":"Subtracts six instead of adding it."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل المعاملين.","En":"Omits the coefficients."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل حد w.","En":"Omits the w term."}},{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"وزع الضرب القياسي.","En":"Distribute the dot product."},{"Ar":"انتبه إلى حاصل ضرب سالبين.","En":"Notice the product of two negatives."}],"Solution":{"Idea":{"Ar":"الضرب القياسي خطي في كل متجه.","En":"The dot product is linear in each argument."},"FormulaLatex":"u\\cdot(2v-3w)=2(u\\cdot v)-3(u\\cdot w)","Steps":[{"Ar":"$2\\cdot7-3(-2)$","En":"$2\\cdot7-3(-2)$"},{"Ar":"$14+6=20$","En":"$14+6=20$"}],"Substitution":{"Ar":"$2\\cdot7-3(-2)$","En":"$2\\cdot7-3(-2)$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$20-14=6=-3(-2)$","En":"$20-14=6=-3(-2)$"},"CommonError":{"Ar":"لا تحذف إشارة الضرب القياسي المعطى.","En":"Retain the sign of the given dot product."}}}$mw$::jsonb,$mw$الضرب القياسي خطي في كل متجه.

$u\cdot(2v-3w)=2(u\cdot v)-3(u\cdot w)$

1. $2\cdot7-3(-2)$

2. $14+6=20$

$2\cdot7-3(-2)$

$20$

$20-14=6=-3(-2)$

لا تحذف إشارة الضرب القياسي المعطى.$mw$,$mw$The dot product is linear in each argument.

$u\cdot(2v-3w)=2(u\cdot v)-3(u\cdot w)$

1. $2\cdot7-3(-2)$

2. $14+6=20$

$2\cdot7-3(-2)$

$20$

$20-14=6=-3(-2)$

Retain the sign of the given dot product.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزع الضرب القياسي.","En":"Distribute the dot product."},{"Ar":"انتبه إلى حاصل ضرب سالبين.","En":"Notice the product of two negatives."}],"Solution":{"Idea":{"Ar":"الضرب القياسي خطي في كل متجه.","En":"The dot product is linear in each argument."},"FormulaLatex":"u\\cdot(2v-3w)=2(u\\cdot v)-3(u\\cdot w)","Steps":[{"Ar":"$2\\cdot7-3(-2)$","En":"$2\\cdot7-3(-2)$"},{"Ar":"$14+6=20$","En":"$14+6=20$"}],"Substitution":{"Ar":"$2\\cdot7-3(-2)$","En":"$2\\cdot7-3(-2)$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$20-14=6=-3(-2)$","En":"$20-14=6=-3(-2)$"},"CommonError":{"Ar":"لا تحذف إشارة الضرب القياسي المعطى.","En":"Retain the sign of the given dot product."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 6 بدلاً من إضافة 6.","En":"Subtracts six instead of adding it."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل المعاملين.","En":"Omits the coefficients."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أهمل حد w.","En":"Omits the w term."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND q."WizardJson" IS NOT NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND (upper(regexp_replace(btrim(q."WizardJson"::jsonb#>>'{Question,Ar}'),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."WizardJson"::jsonb#>>'{Question,En}'),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Wizard duplicate %',b.key; END IF;
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v51 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
