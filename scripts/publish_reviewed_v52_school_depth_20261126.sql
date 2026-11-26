-- One-time owner-authorized v52 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v52-grade-1-category-data-missing-one-in-each-group-1$mw$,$mw$category-data-missing-one-in-each-group$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال عددين","En":"Completing two counts"},"Question":{"Ar":"في سجل ألعاب، اختار 3 أطفال الكرة و5 أطفال القفز. نضيف طفلاً واحداً إلى كل مجموعة. ما مجموع الأطفال الآن؟","En":"A game record has three children choosing ball games and five choosing jumping. One child joins each group. What is the new total?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع قبل الإضافة.","En":"The original total."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف طفلاً واحداً فقط.","En":"Adds only one child."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف ثلاثة أطفال.","En":"Adds three children."}}],"Hints":[{"Ar":"كم أصبح العدد في كل مجموعة؟","En":"What is each new count?"},{"Ar":"اجمع العددين الجديدين.","En":"Add the new counts."}],"Solution":{"Idea":{"Ar":"نزيد كل عدد بمقدار واحد ثم نجمع.","En":"Increase both counts by one, then add."},"FormulaLatex":"(3+1)+(5+1)","Steps":[{"Ar":"$3+1=4$","En":"$3+1=4$"},{"Ar":"$5+1=6$","En":"$5+1=6$"},{"Ar":"$4+6=10$","En":"$4+6=10$"}],"Substitution":{"Ar":"$3+1=4$","En":"$3+1=4$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10-2=8$","En":"$10-2=8$"},"CommonError":{"Ar":"طفل واحد لكل مجموعة يعني طفلين بالمجموع.","En":"One child per group means two in total."}}}$mw$::jsonb,$mw$نزيد كل عدد بمقدار واحد ثم نجمع.

$(3+1)+(5+1)$

1. $3+1=4$

2. $5+1=6$

3. $4+6=10$

$3+1=4$

$10$

$10-2=8$

طفل واحد لكل مجموعة يعني طفلين بالمجموع.$mw$,$mw$Increase both counts by one, then add.

$(3+1)+(5+1)$

1. $3+1=4$

2. $5+1=6$

3. $4+6=10$

$3+1=4$

$10$

$10-2=8$

One child per group means two in total.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم أصبح العدد في كل مجموعة؟","En":"What is each new count?"},{"Ar":"اجمع العددين الجديدين.","En":"Add the new counts."}],"Solution":{"Idea":{"Ar":"نزيد كل عدد بمقدار واحد ثم نجمع.","En":"Increase both counts by one, then add."},"FormulaLatex":"(3+1)+(5+1)","Steps":[{"Ar":"$3+1=4$","En":"$3+1=4$"},{"Ar":"$5+1=6$","En":"$5+1=6$"},{"Ar":"$4+6=10$","En":"$4+6=10$"}],"Substitution":{"Ar":"$3+1=4$","En":"$3+1=4$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10-2=8$","En":"$10-2=8$"},"CommonError":{"Ar":"طفل واحد لكل مجموعة يعني طفلين بالمجموع.","En":"One child per group means two in total."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المجموع قبل الإضافة.","En":"The original total."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف طفلاً واحداً فقط.","En":"Adds only one child."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف ثلاثة أطفال.","En":"Adds three children."},"Order":4}]}$mw$),
($mw$growth-v52-grade-1-category-data-duplicate-single-category-identify-smallest-1$mw$,$mw$category-data-duplicate-single-category-identify-smallest$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"الفئة الأقل بعد التصحيح","En":"Smallest category after correction"},"Question":{"Ar":"عدد السيارات الحمراء 4 والزرقاء 3 والخضراء 5. تبيّن أن سيارتين حمراوين عُدّتا مرتين، فحُذفت العدتان الزائدتان. ما عدد السيارات في الفئة الأقل بعد التصحيح؟","En":"There are four recorded red cars, three blue cars and five green cars. Two red cars were each counted twice; the two extra counts are removed. What is the smallest corrected category count?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أقل عدد قبل التصحيح.","En":"The smallest count before correction."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد الحمراء قبل التصحيح.","En":"The original red count."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد الخضراء.","En":"The green count."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اطرح العدتين الزائدتين من الحمراء فقط.","En":"Subtract two extra counts from red only."},{"Ar":"قارن الأعداد الثلاثة.","En":"Compare the three counts."}],"Solution":{"Idea":{"Ar":"نصحح عدد الحمراء ثم نقارن الفئات.","En":"Correct the red count, then compare categories."},"FormulaLatex":"4-2=2","Steps":[{"Ar":"$4-2=2$","En":"$4-2=2$"},{"Ar":"$2<3<5$","En":"$2<3<5$"}],"Substitution":{"Ar":"$4-2=2$","En":"$4-2=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+2=4$","En":"$2+2=4$"},"CommonError":{"Ar":"لا تقارن الأعداد قبل تصحيحها.","En":"Do not compare before correcting counts."}}}$mw$::jsonb,$mw$نصحح عدد الحمراء ثم نقارن الفئات.

$4-2=2$

1. $4-2=2$

2. $2<3<5$

$4-2=2$

$2$

$2+2=4$

لا تقارن الأعداد قبل تصحيحها.$mw$,$mw$Correct the red count, then compare categories.

$4-2=2$

1. $4-2=2$

2. $2<3<5$

$4-2=2$

$2$

$2+2=4$

Do not compare before correcting counts.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اطرح العدتين الزائدتين من الحمراء فقط.","En":"Subtract two extra counts from red only."},{"Ar":"قارن الأعداد الثلاثة.","En":"Compare the three counts."}],"Solution":{"Idea":{"Ar":"نصحح عدد الحمراء ثم نقارن الفئات.","En":"Correct the red count, then compare categories."},"FormulaLatex":"4-2=2","Steps":[{"Ar":"$4-2=2$","En":"$4-2=2$"},{"Ar":"$2<3<5$","En":"$2<3<5$"}],"Substitution":{"Ar":"$4-2=2$","En":"$4-2=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+2=4$","En":"$2+2=4$"},"CommonError":{"Ar":"لا تقارن الأعداد قبل تصحيحها.","En":"Do not compare before correcting counts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أقل عدد قبل التصحيح.","En":"The smallest count before correction."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدد الحمراء قبل التصحيح.","En":"The original red count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدد الخضراء.","En":"The green count."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v52-grade-2-pictograph-total-symbols-redistribution-difference-1$mw$,$mw$pictograph-total-symbols-redistribution-difference$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"فرق العدد بعد نقل عنصر","En":"Difference after moving an item"},"Question":{"Ar":"كل ● يمثل كتاباً. A: ●●●●●؛ B: ●●. نُقل كتاب واحد من A إلى B. كم كتاباً يزيد A على B الآن؟","En":"Each ● represents one book. A: ●●●●●; B: ●●. One book moves from A to B. How many more books does A have now?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفرق القديم.","En":"The old difference."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد A الجديد.","En":"The new A count."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار النقص في الفرق لا الفرق الجديد.","En":"This is the decrease in the difference, not the new difference."}}],"Hints":[{"Ar":"الرف A يفقد كتاباً.","En":"Shelf A loses one book."},{"Ar":"الرف B يكسب كتاباً.","En":"Shelf B gains one book."}],"Solution":{"Idea":{"Ar":"نطرح واحداً من A ونضيفه إلى B قبل المقارنة.","En":"Subtract one from A and add it to B before comparing."},"FormulaLatex":"(5-1)-(2+1)","Steps":[{"Ar":"$5-1=4$","En":"$5-1=4$"},{"Ar":"$2+1=3$","En":"$2+1=3$"},{"Ar":"$4-3=1$","En":"$4-3=1$"}],"Substitution":{"Ar":"$5-1=4$","En":"$5-1=4$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+3=5+2$","En":"$4+3=5+2$"},"CommonError":{"Ar":"النقل يغير العدد في الرفين معاً.","En":"Moving an item changes both counts."}}}$mw$::jsonb,$mw$نطرح واحداً من A ونضيفه إلى B قبل المقارنة.

$(5-1)-(2+1)$

1. $5-1=4$

2. $2+1=3$

3. $4-3=1$

$5-1=4$

$1$

$4+3=5+2$

النقل يغير العدد في الرفين معاً.$mw$,$mw$Subtract one from A and add it to B before comparing.

$(5-1)-(2+1)$

1. $5-1=4$

2. $2+1=3$

3. $4-3=1$

$5-1=4$

$1$

$4+3=5+2$

Moving an item changes both counts.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"الرف A يفقد كتاباً.","En":"Shelf A loses one book."},{"Ar":"الرف B يكسب كتاباً.","En":"Shelf B gains one book."}],"Solution":{"Idea":{"Ar":"نطرح واحداً من A ونضيفه إلى B قبل المقارنة.","En":"Subtract one from A and add it to B before comparing."},"FormulaLatex":"(5-1)-(2+1)","Steps":[{"Ar":"$5-1=4$","En":"$5-1=4$"},{"Ar":"$2+1=3$","En":"$2+1=3$"},{"Ar":"$4-3=1$","En":"$4-3=1$"}],"Substitution":{"Ar":"$5-1=4$","En":"$5-1=4$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+3=5+2$","En":"$4+3=5+2$"},"CommonError":{"Ar":"النقل يغير العدد في الرفين معاً.","En":"Moving an item changes both counts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الفرق القديم.","En":"The old difference."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدد A الجديد.","En":"The new A count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار النقص في الفرق لا الفرق الجديد.","En":"This is the decrease in the difference, not the new difference."},"Order":4}]}$mw$),
($mw$growth-v52-grade-2-pictograph-three-rows-equalize-minimum-removals-1$mw$,$mw$pictograph-three-rows-equalize-minimum-removals$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تساوي صفوف السجل","En":"Equalizing pictograph rows"},"Question":{"Ar":"كل ● يمثل قلماً. A: ●●●●؛ B: ●●؛ C: ●●●. نريد جعل الأعداد متساوية بالحذف فقط. ما أقل عدد من الرموز التي يجب حذفها إجمالاً؟","En":"Each ● represents one pen. A: ●●●●; B: ●●; C: ●●●. We want equal counts using removals only. What is the fewest symbols to remove altogether?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يحذف أكثر من اللازم.","En":"Removes more than necessary."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يصحح C فقط.","En":"Corrects C only."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يصحح A فقط.","En":"Corrects A only."}}],"Hints":[{"Ar":"لا يمكن زيادة B.","En":"B cannot be increased."},{"Ar":"احذف الزائد من A وC.","En":"Remove the excess from A and C."}],"Solution":{"Idea":{"Ar":"أكبر عدد مشترك ممكن بالحذف هو أصغر عدد حالي.","En":"The largest attainable equal count using removals is the smallest existing count."},"FormulaLatex":"(4-2)+(3-2)","Steps":[{"Ar":"$4-2=2$","En":"$4-2=2$"},{"Ar":"$3-2=1$","En":"$3-2=1$"},{"Ar":"$2+1=3$","En":"$2+1=3$"}],"Substitution":{"Ar":"$4-2=2$","En":"$4-2=2$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9-3=6=3\\cdot2$","En":"$9-3=6=3\\cdot2$"},"CommonError":{"Ar":"يجب أن تصبح الصفوف الثلاثة متساوية.","En":"All three rows must become equal."}}}$mw$::jsonb,$mw$أكبر عدد مشترك ممكن بالحذف هو أصغر عدد حالي.

$(4-2)+(3-2)$

1. $4-2=2$

2. $3-2=1$

3. $2+1=3$

$4-2=2$

$3$

$9-3=6=3\cdot2$

يجب أن تصبح الصفوف الثلاثة متساوية.$mw$,$mw$The largest attainable equal count using removals is the smallest existing count.

$(4-2)+(3-2)$

1. $4-2=2$

2. $3-2=1$

3. $2+1=3$

$4-2=2$

$3$

$9-3=6=3\cdot2$

All three rows must become equal.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لا يمكن زيادة B.","En":"B cannot be increased."},{"Ar":"احذف الزائد من A وC.","En":"Remove the excess from A and C."}],"Solution":{"Idea":{"Ar":"أكبر عدد مشترك ممكن بالحذف هو أصغر عدد حالي.","En":"The largest attainable equal count using removals is the smallest existing count."},"FormulaLatex":"(4-2)+(3-2)","Steps":[{"Ar":"$4-2=2$","En":"$4-2=2$"},{"Ar":"$3-2=1$","En":"$3-2=1$"},{"Ar":"$2+1=3$","En":"$2+1=3$"}],"Substitution":{"Ar":"$4-2=2$","En":"$4-2=2$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9-3=6=3\\cdot2$","En":"$9-3=6=3\\cdot2$"},"CommonError":{"Ar":"يجب أن تصبح الصفوف الثلاثة متساوية.","En":"All three rows must become equal."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يحذف أكثر من اللازم.","En":"Removes more than necessary."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يصحح C فقط.","En":"Corrects C only."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يصحح A فقط.","En":"Corrects A only."},"Order":4}]}$mw$),
($mw$growth-v52-grade-3-additive-equation-equal-sum-compensation-1$mw$,$mw$additive-equation-equal-sum-compensation$mw$,$mw$primary-one-step-additive-equations$mw$,$mw$grade-3$mw$,3,1,2,7,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":7,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"موازنة مجموعين","En":"Balancing two sums"},"Question":{"Ar":"ما العدد n الذي يجعل $17+6=15+n$؟","En":"What number n makes $17+6=15+n$ true?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أنقص 2 بدلاً من زيادته.","En":"Subtracts two instead of adding it."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ترك الحد الآخر دون تعديل.","En":"Leaves the other addend unchanged."}},{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع الكلي.","En":"This is the full sum."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب الطرف الأيسر.","En":"Calculate the left side."},{"Ar":"ما العدد الذي يكمل 15 إلى 23؟","En":"What completes fifteen to twenty-three?"}],"Solution":{"Idea":{"Ar":"نحسب المجموع الأول ثم نطرح 15.","En":"Find the first sum and subtract fifteen."},"FormulaLatex":"n=17+6-15","Steps":[{"Ar":"$17+6=23$","En":"$17+6=23$"},{"Ar":"$23-15=8$","En":"$23-15=8$"}],"Substitution":{"Ar":"$17+6=23$","En":"$17+6=23$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15+8=23$","En":"$15+8=23$"},"CommonError":{"Ar":"المساواة تتطلب أن يتساوى مجموع الطرفين.","En":"Equality requires the same total on both sides."}}}$mw$::jsonb,$mw$نحسب المجموع الأول ثم نطرح 15.

$n=17+6-15$

1. $17+6=23$

2. $23-15=8$

$17+6=23$

$8$

$15+8=23$

المساواة تتطلب أن يتساوى مجموع الطرفين.$mw$,$mw$Find the first sum and subtract fifteen.

$n=17+6-15$

1. $17+6=23$

2. $23-15=8$

$17+6=23$

$8$

$15+8=23$

Equality requires the same total on both sides.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"احسب الطرف الأيسر.","En":"Calculate the left side."},{"Ar":"ما العدد الذي يكمل 15 إلى 23؟","En":"What completes fifteen to twenty-three?"}],"Solution":{"Idea":{"Ar":"نحسب المجموع الأول ثم نطرح 15.","En":"Find the first sum and subtract fifteen."},"FormulaLatex":"n=17+6-15","Steps":[{"Ar":"$17+6=23$","En":"$17+6=23$"},{"Ar":"$23-15=8$","En":"$23-15=8$"}],"Substitution":{"Ar":"$17+6=23$","En":"$17+6=23$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15+8=23$","En":"$15+8=23$"},"CommonError":{"Ar":"المساواة تتطلب أن يتساوى مجموع الطرفين.","En":"Equality requires the same total on both sides."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أنقص 2 بدلاً من زيادته.","En":"Subtracts two instead of adding it."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ترك الحد الآخر دون تعديل.","En":"Leaves the other addend unchanged."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع الكلي.","En":"This is the full sum."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v52-grade-3-place-value-regroup-one-hundred-into-tens-1$mw$,$mw$place-value-regroup-one-hundred-into-tens$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تفكيك مئة إلى عشرات","En":"Regrouping a hundred into tens"},"Question":{"Ar":"يتكون العدد 360 من 3 مئات و6 عشرات. إذا استبدلنا مئة واحدة بعشرات دون تغيير العدد، فكم عشرة يصبح لدينا؟","En":"The number 360 consists of three hundreds and six tens. If one hundred is regrouped into tens without changing the number, how many tens are there now?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العشرات المضافة فقط.","En":"Only the added tens."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد العشرات إذا فككنا كل المئات.","En":"The tens count if all hundreds are regrouped."}},{"LatexCode":"16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد العشرات قبل التفكيك.","En":"The original tens count."}}],"Hints":[{"Ar":"كم عشرة في مئة واحدة؟","En":"How many tens are in one hundred?"},{"Ar":"أضفها إلى الست الموجودة.","En":"Add them to the existing six."}],"Solution":{"Idea":{"Ar":"مئة واحدة تعادل عشر عشرات.","En":"One hundred is ten tens."},"FormulaLatex":"100=10\\cdot10","Steps":[{"Ar":"$6+10=16$","En":"$6+10=16$"}],"Substitution":{"Ar":"$6+10=16$","En":"$6+10=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot100+16\\cdot10=360$","En":"$2\\cdot100+16\\cdot10=360$"},"CommonError":{"Ar":"فكك مئة واحدة فقط.","En":"Regroup just one hundred."}}}$mw$::jsonb,$mw$مئة واحدة تعادل عشر عشرات.

$100=10\cdot10$

1. $6+10=16$

$6+10=16$

$16$

$2\cdot100+16\cdot10=360$

فكك مئة واحدة فقط.$mw$,$mw$One hundred is ten tens.

$100=10\cdot10$

1. $6+10=16$

$6+10=16$

$16$

$2\cdot100+16\cdot10=360$

Regroup just one hundred.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم عشرة في مئة واحدة؟","En":"How many tens are in one hundred?"},{"Ar":"أضفها إلى الست الموجودة.","En":"Add them to the existing six."}],"Solution":{"Idea":{"Ar":"مئة واحدة تعادل عشر عشرات.","En":"One hundred is ten tens."},"FormulaLatex":"100=10\\cdot10","Steps":[{"Ar":"$6+10=16$","En":"$6+10=16$"}],"Substitution":{"Ar":"$6+10=16$","En":"$6+10=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot100+16\\cdot10=360$","En":"$2\\cdot100+16\\cdot10=360$"},"CommonError":{"Ar":"فكك مئة واحدة فقط.","En":"Regroup just one hundred."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"العشرات المضافة فقط.","En":"Only the added tens."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدد العشرات إذا فككنا كل المئات.","En":"The tens count if all hundreds are regrouped."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدد العشرات قبل التفكيك.","En":"The original tens count."},"Order":4}]}$mw$),
($mw$growth-v52-grade-3-number-comparison-same-digits-minimum-difference-1$mw$,$mw$number-comparison-same-digits-minimum-difference$mw$,$mw$number-comparison$mw$,$mw$grade-3$mw$,3,1,81,304,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":304,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أصغر عدد من أرقام معطاة","En":"Smallest number from given digits"},"Question":{"Ar":"كوّن أصغر عدد من ثلاثة أرقام باستخدام 0 و4 و7 مرة واحدة لكل رقم. ما العدد؟","En":"Form the smallest three-digit number using 0, 4 and 7 once each. What is the number?"},"Options":[{"LatexCode":"704","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بدأ بأكبر رقم غير صفري.","En":"Starts with the largest nonzero digit."}},{"LatexCode":"407","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"47","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يتكون من ثلاثة أرقام.","En":"Not a three-digit number."}},{"LatexCode":"470","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وضع 7 قبل الصفر.","En":"Places seven before zero."}}],"Hints":[{"Ar":"لا يبدأ عدد من ثلاثة أرقام بالصفر.","En":"A three-digit number cannot start with zero."},{"Ar":"بعد 4 ضع أصغر رقم باقٍ.","En":"After four, place the smallest remaining digit."}],"Solution":{"Idea":{"Ar":"نضع أصغر رقم غير صفري في المئات ثم أصغر رقم باقٍ في العشرات.","En":"Put the smallest nonzero digit in hundreds and the smallest remaining digit in tens."},"FormulaLatex":"400+0+7","Steps":[{"Ar":"$400+0+7=407$","En":"$400+0+7=407$"}],"Substitution":{"Ar":"$400+0+7=407$","En":"$400+0+7=407$"},"Result":{"Ar":"$407$","En":"$407$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$407<470<704<740$","En":"$407<470<704<740$"},"CommonError":{"Ar":"لا تضع الصفر في منزلة المئات.","En":"Do not place zero in the hundreds place."}}}$mw$::jsonb,$mw$نضع أصغر رقم غير صفري في المئات ثم أصغر رقم باقٍ في العشرات.

$400+0+7$

1. $400+0+7=407$

$400+0+7=407$

$407$

$407<470<704<740$

لا تضع الصفر في منزلة المئات.$mw$,$mw$Put the smallest nonzero digit in hundreds and the smallest remaining digit in tens.

$400+0+7$

1. $400+0+7=407$

$400+0+7=407$

$407$

$407<470<704<740$

Do not place zero in the hundreds place.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لا يبدأ عدد من ثلاثة أرقام بالصفر.","En":"A three-digit number cannot start with zero."},{"Ar":"بعد 4 ضع أصغر رقم باقٍ.","En":"After four, place the smallest remaining digit."}],"Solution":{"Idea":{"Ar":"نضع أصغر رقم غير صفري في المئات ثم أصغر رقم باقٍ في العشرات.","En":"Put the smallest nonzero digit in hundreds and the smallest remaining digit in tens."},"FormulaLatex":"400+0+7","Steps":[{"Ar":"$400+0+7=407$","En":"$400+0+7=407$"}],"Substitution":{"Ar":"$400+0+7=407$","En":"$400+0+7=407$"},"Result":{"Ar":"$407$","En":"$407$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$407<470<704<740$","En":"$407<470<704<740$"},"CommonError":{"Ar":"لا تضع الصفر في منزلة المئات.","En":"Do not place zero in the hundreds place."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"بدأ بأكبر رقم غير صفري.","En":"Starts with the largest nonzero digit."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يتكون من ثلاثة أرقام.","En":"Not a three-digit number."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"وضع 7 قبل الصفر.","En":"Places seven before zero."},"Order":4}]}$mw$),
($mw$growth-v52-grade-4-division-remainder-capacity-unused-1$mw$,$mw$division-remainder-capacity-unused$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-4$mw$,4,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أماكن فارغة بعد توزيع","En":"Unused places after allocation"},"Question":{"Ar":"لدينا 5 صناديق يتسع كل منها لثماني كرات. وُضعت 37 كرة فيها. كم مكاناً فارغاً بقي إجمالاً؟","En":"Five boxes can hold eight balls each. Thirty-seven balls are placed in them. How many places remain empty altogether?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد الصناديق.","En":"The number of boxes."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"سعة الصندوق الواحد.","En":"One box's capacity."}},{"LatexCode":"37","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد الكرات الموضوعة.","En":"The number of balls placed."}}],"Hints":[{"Ar":"كم مكاناً في الصناديق كلها؟","En":"How many places across all boxes?"},{"Ar":"اطرح الأماكن المشغولة.","En":"Subtract occupied places."}],"Solution":{"Idea":{"Ar":"نحسب السعة الكلية ثم نطرح عدد الكرات.","En":"Find total capacity and subtract the occupied places."},"FormulaLatex":"5\\cdot8-37","Steps":[{"Ar":"$5\\cdot8=40$","En":"$5\\cdot8=40$"},{"Ar":"$40-37=3$","En":"$40-37=3$"}],"Substitution":{"Ar":"$5\\cdot8=40$","En":"$5\\cdot8=40$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$37+3=40$","En":"$37+3=40$"},"CommonError":{"Ar":"لا تخلط عدد الكرات الباقية بعد القسمة مع الأماكن الفارغة.","En":"Do not confuse leftover balls with empty places."}}}$mw$::jsonb,$mw$نحسب السعة الكلية ثم نطرح عدد الكرات.

$5\cdot8-37$

1. $5\cdot8=40$

2. $40-37=3$

$5\cdot8=40$

$3$

$37+3=40$

لا تخلط عدد الكرات الباقية بعد القسمة مع الأماكن الفارغة.$mw$,$mw$Find total capacity and subtract the occupied places.

$5\cdot8-37$

1. $5\cdot8=40$

2. $40-37=3$

$5\cdot8=40$

$3$

$37+3=40$

Do not confuse leftover balls with empty places.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم مكاناً في الصناديق كلها؟","En":"How many places across all boxes?"},{"Ar":"اطرح الأماكن المشغولة.","En":"Subtract occupied places."}],"Solution":{"Idea":{"Ar":"نحسب السعة الكلية ثم نطرح عدد الكرات.","En":"Find total capacity and subtract the occupied places."},"FormulaLatex":"5\\cdot8-37","Steps":[{"Ar":"$5\\cdot8=40$","En":"$5\\cdot8=40$"},{"Ar":"$40-37=3$","En":"$40-37=3$"}],"Substitution":{"Ar":"$5\\cdot8=40$","En":"$5\\cdot8=40$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$37+3=40$","En":"$37+3=40$"},"CommonError":{"Ar":"لا تخلط عدد الكرات الباقية بعد القسمة مع الأماكن الفارغة.","En":"Do not confuse leftover balls with empty places."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدد الصناديق.","En":"The number of boxes."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"سعة الصندوق الواحد.","En":"One box's capacity."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدد الكرات الموضوعة.","En":"The number of balls placed."},"Order":4}]}$mw$),
($mw$growth-v52-grade-4-division-quotient-change-double-divisor-1$mw$,$mw$division-quotient-change-double-divisor$mw$,$mw$primary-division$mw$,$mw$grade-4$mw$,4,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تأثير مضاعفة المقسوم عليه","En":"Effect of doubling a divisor"},"Question":{"Ar":"نعلم أن $120\\div6=20$. ما ناتج $120\\div12$؟","En":"Given $120\\div6=20$, what is $120\\div12$?"},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يغير الناتج رغم تغيير المقسوم عليه.","En":"Keeps the old quotient despite changing the divisor."}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف الناتج بدلاً من تنصيفه.","En":"Doubles rather than halves the quotient."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المقسوم عليه الجديد.","En":"This is the new divisor."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"12 ضعف 6.","En":"Twelve is twice six."},{"Ar":"فكر في عدد المجموعات إذا تضاعف حجم المجموعة.","En":"Consider the group count when group size doubles."}],"Solution":{"Idea":{"Ar":"إذا بقي المقسوم ثابتاً وتضاعف المقسوم عليه، ينصف خارج القسمة.","En":"With the dividend fixed, doubling the divisor halves the quotient."},"FormulaLatex":"120/(2\\cdot6)=(120/6)/2","Steps":[{"Ar":"$20/2=10$","En":"$20/2=10$"}],"Substitution":{"Ar":"$20/2=10$","En":"$20/2=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot10=120$","En":"$12\\cdot10=120$"},"CommonError":{"Ar":"لا تضاعف خارج القسمة مع المقسوم عليه.","En":"Do not double the quotient along with the divisor."}}}$mw$::jsonb,$mw$إذا بقي المقسوم ثابتاً وتضاعف المقسوم عليه، ينصف خارج القسمة.

$120/(2\cdot6)=(120/6)/2$

1. $20/2=10$

$20/2=10$

$10$

$12\cdot10=120$

لا تضاعف خارج القسمة مع المقسوم عليه.$mw$,$mw$With the dividend fixed, doubling the divisor halves the quotient.

$120/(2\cdot6)=(120/6)/2$

1. $20/2=10$

$20/2=10$

$10$

$12\cdot10=120$

Do not double the quotient along with the divisor.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"12 ضعف 6.","En":"Twelve is twice six."},{"Ar":"فكر في عدد المجموعات إذا تضاعف حجم المجموعة.","En":"Consider the group count when group size doubles."}],"Solution":{"Idea":{"Ar":"إذا بقي المقسوم ثابتاً وتضاعف المقسوم عليه، ينصف خارج القسمة.","En":"With the dividend fixed, doubling the divisor halves the quotient."},"FormulaLatex":"120/(2\\cdot6)=(120/6)/2","Steps":[{"Ar":"$20/2=10$","En":"$20/2=10$"}],"Substitution":{"Ar":"$20/2=10$","En":"$20/2=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot10=120$","En":"$12\\cdot10=120$"},"CommonError":{"Ar":"لا تضاعف خارج القسمة مع المقسوم عليه.","En":"Do not double the quotient along with the divisor."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يغير الناتج رغم تغيير المقسوم عليه.","En":"Keeps the old quotient despite changing the divisor."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف الناتج بدلاً من تنصيفه.","En":"Doubles rather than halves the quotient."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا المقسوم عليه الجديد.","En":"This is the new divisor."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v52-grade-4-mass-three-equal-objects-total-mixed-1$mw$,$mw$mass-three-equal-objects-total-mixed$mw$,$mw$mass$mw$,$mw$grade-4$mw$,4,1,82,322,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":322,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كتلة مجموعات متساوية","En":"Mass of equal objects"},"Question":{"Ar":"كتلة كل علبة 1 كغ و250 غ. ما كتلة ثلاث علب بالغرام؟","En":"Each box has mass 1 kg 250 g. What is the mass of three boxes in grams?"},"Options":[{"LatexCode":"3250","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 250 غ مرة واحدة فقط.","En":"Adds 250 g only once."}},{"LatexCode":"3750","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1250","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"كتلة علبة واحدة.","En":"Mass of one box."}},{"LatexCode":"3000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل 250 غ في كل علبة.","En":"Omits 250 g in every box."}}],"Hints":[{"Ar":"كم غراماً في الكيلوغرام؟","En":"How many grams are in a kilogram?"},{"Ar":"اضرب الكتلة الكاملة في ثلاثة.","En":"Multiply the full mass by three."}],"Solution":{"Idea":{"Ar":"نحول كتلة العلبة إلى غرامات ثم نضرب في ثلاثة.","En":"Convert one box to grams and multiply by three."},"FormulaLatex":"3(1000+250)","Steps":[{"Ar":"$1000+250=1250$","En":"$1000+250=1250$"},{"Ar":"$3\\cdot1250=3750$","En":"$3\\cdot1250=3750$"}],"Substitution":{"Ar":"$1000+250=1250$","En":"$1000+250=1250$"},"Result":{"Ar":"$3750$","En":"$3750$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$3750/3=1250$","En":"$3750/3=1250$"},"CommonError":{"Ar":"يجب حساب جزء الغرامات لكل علبة.","En":"Include the gram portion for each box."}}}$mw$::jsonb,$mw$نحول كتلة العلبة إلى غرامات ثم نضرب في ثلاثة.

$3(1000+250)$

1. $1000+250=1250$

2. $3\cdot1250=3750$

$1000+250=1250$

$3750$ غ

$3750/3=1250$

يجب حساب جزء الغرامات لكل علبة.$mw$,$mw$Convert one box to grams and multiply by three.

$3(1000+250)$

1. $1000+250=1250$

2. $3\cdot1250=3750$

$1000+250=1250$

$3750$ g

$3750/3=1250$

Include the gram portion for each box.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم غراماً في الكيلوغرام؟","En":"How many grams are in a kilogram?"},{"Ar":"اضرب الكتلة الكاملة في ثلاثة.","En":"Multiply the full mass by three."}],"Solution":{"Idea":{"Ar":"نحول كتلة العلبة إلى غرامات ثم نضرب في ثلاثة.","En":"Convert one box to grams and multiply by three."},"FormulaLatex":"3(1000+250)","Steps":[{"Ar":"$1000+250=1250$","En":"$1000+250=1250$"},{"Ar":"$3\\cdot1250=3750$","En":"$3\\cdot1250=3750$"}],"Substitution":{"Ar":"$1000+250=1250$","En":"$1000+250=1250$"},"Result":{"Ar":"$3750$","En":"$3750$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$3750/3=1250$","En":"$3750/3=1250$"},"CommonError":{"Ar":"يجب حساب جزء الغرامات لكل علبة.","En":"Include the gram portion for each box."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أضاف 250 غ مرة واحدة فقط.","En":"Adds 250 g only once."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"كتلة علبة واحدة.","En":"Mass of one box."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل 250 غ في كل علبة.","En":"Omits 250 g in every box."},"Order":4}]}$mw$),
($mw$growth-v52-grade-6-triangle-area-height-ratio-from-same-base-1$mw$,$mw$triangle-area-height-ratio-from-same-base$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة ارتفاعين من مساحتين","En":"Height ratio from areas"},"Question":{"Ar":"مثلثان لهما قاعدة بالطول نفسه. مساحة الأول 24 سم² ومساحة الثاني 36 سم². ما نسبة ارتفاع الثاني إلى ارتفاع الأول؟","En":"Two triangles have bases of the same length. Their areas are 24 cm² and 36 cm² respectively. What is the ratio of the second height to the first?"},"Options":[{"LatexCode":"\\frac32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب النسبة.","En":"Reverses the ratio."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس نسبة المساحتين.","En":"Not the area ratio."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فرق المساحتين لا نسبتهما.","En":"The difference of areas, not their ratio."}}],"Hints":[{"Ar":"عامل القاعدة نفسه في المساحتين.","En":"The base factor is the same in both areas."},{"Ar":"اقسم المساحة الثانية على الأولى.","En":"Divide the second area by the first."}],"Solution":{"Idea":{"Ar":"عند تساوي القاعدتين تتناسب المساحتان مع الارتفاعين.","En":"With equal bases, areas are proportional to heights."},"FormulaLatex":"h_2/h_1=A_2/A_1","Steps":[{"Ar":"$36/24=3/2$","En":"$36/24=3/2$"}],"Substitution":{"Ar":"$36/24=3/2$","En":"$36/24=3/2$"},"Result":{"Ar":"$\\frac32$","En":"$\\frac32$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24\\cdot3/2=36$","En":"$24\\cdot3/2=36$"},"CommonError":{"Ar":"انتبه إلى اتجاه النسبة المطلوبة.","En":"Keep the requested ratio direction."}}}$mw$::jsonb,$mw$عند تساوي القاعدتين تتناسب المساحتان مع الارتفاعين.

$h_2/h_1=A_2/A_1$

1. $36/24=3/2$

$36/24=3/2$

$\frac32$

$24\cdot3/2=36$

انتبه إلى اتجاه النسبة المطلوبة.$mw$,$mw$With equal bases, areas are proportional to heights.

$h_2/h_1=A_2/A_1$

1. $36/24=3/2$

$36/24=3/2$

$\frac32$

$24\cdot3/2=36$

Keep the requested ratio direction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عامل القاعدة نفسه في المساحتين.","En":"The base factor is the same in both areas."},{"Ar":"اقسم المساحة الثانية على الأولى.","En":"Divide the second area by the first."}],"Solution":{"Idea":{"Ar":"عند تساوي القاعدتين تتناسب المساحتان مع الارتفاعين.","En":"With equal bases, areas are proportional to heights."},"FormulaLatex":"h_2/h_1=A_2/A_1","Steps":[{"Ar":"$36/24=3/2$","En":"$36/24=3/2$"}],"Substitution":{"Ar":"$36/24=3/2$","En":"$36/24=3/2$"},"Result":{"Ar":"$\\frac32$","En":"$\\frac32$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24\\cdot3/2=36$","En":"$24\\cdot3/2=36$"},"CommonError":{"Ar":"انتبه إلى اتجاه النسبة المطلوبة.","En":"Keep the requested ratio direction."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب النسبة.","En":"Reverses the ratio."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ليس نسبة المساحتين.","En":"Not the area ratio."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"فرق المساحتين لا نسبتهما.","En":"The difference of areas, not their ratio."},"Order":4}]}$mw$),
($mw$growth-v52-grade-6-mean-bound-unknown-equal-value-all-1$mw$,$mw$mean-bound-unknown-equal-value-all$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-6$mw$,6,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متوسط وحدود القيم","En":"Mean at the upper bound"},"Question":{"Ar":"أربع درجات لا تزيد أي منها على 10، ومتوسطها يساوي 10. كم درجة منها تساوي 10؟","En":"Four scores are each at most 10, and their mean is 10. How many of the scores equal 10?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"درجتان أقل تمنعان الوصول إلى مجموع 40.","En":"Two smaller scores prevent a total of forty."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حتى درجة واحدة أصغر تخفض المتوسط.","En":"Even one smaller score lowers the mean."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لو كانت البقية أصغر لانخفض المتوسط.","En":"If the others were smaller, the mean would fall."}}],"Hints":[{"Ar":"احسب مجموع الدرجات المطلوب.","En":"Find the required score total."},{"Ar":"هل يمكن تعويض درجة أقل بدرجة أكبر من 10؟","En":"Can a lower score be offset by a score above ten?"}],"Solution":{"Idea":{"Ar":"المجموع المطلوب 40، ولا يمكن بلوغه إلا إذا كانت كل درجة 10.","En":"The required total is forty, attainable only if all scores are ten."},"FormulaLatex":"S=4\\cdot10","Steps":[{"Ar":"$S=40$","En":"$S=40$"},{"Ar":"$10+10+10+10=40$","En":"$10+10+10+10=40$"}],"Substitution":{"Ar":"$S=40$","En":"$S=40$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$40/4=10$","En":"$40/4=10$"},"CommonError":{"Ar":"المتوسط يساوي الحد الأعلى فقط عندما تساويه كل القيم.","En":"The mean equals the upper bound only when every value equals it."}}}$mw$::jsonb,$mw$المجموع المطلوب 40، ولا يمكن بلوغه إلا إذا كانت كل درجة 10.

$S=4\cdot10$

1. $S=40$

2. $10+10+10+10=40$

$S=40$

$4$

$40/4=10$

المتوسط يساوي الحد الأعلى فقط عندما تساويه كل القيم.$mw$,$mw$The required total is forty, attainable only if all scores are ten.

$S=4\cdot10$

1. $S=40$

2. $10+10+10+10=40$

$S=40$

$4$

$40/4=10$

The mean equals the upper bound only when every value equals it.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مجموع الدرجات المطلوب.","En":"Find the required score total."},{"Ar":"هل يمكن تعويض درجة أقل بدرجة أكبر من 10؟","En":"Can a lower score be offset by a score above ten?"}],"Solution":{"Idea":{"Ar":"المجموع المطلوب 40، ولا يمكن بلوغه إلا إذا كانت كل درجة 10.","En":"The required total is forty, attainable only if all scores are ten."},"FormulaLatex":"S=4\\cdot10","Steps":[{"Ar":"$S=40$","En":"$S=40$"},{"Ar":"$10+10+10+10=40$","En":"$10+10+10+10=40$"}],"Substitution":{"Ar":"$S=40$","En":"$S=40$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$40/4=10$","En":"$40/4=10$"},"CommonError":{"Ar":"المتوسط يساوي الحد الأعلى فقط عندما تساويه كل القيم.","En":"The mean equals the upper bound only when every value equals it."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"درجتان أقل تمنعان الوصول إلى مجموع 40.","En":"Two smaller scores prevent a total of forty."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حتى درجة واحدة أصغر تخفض المتوسط.","En":"Even one smaller score lowers the mean."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لو كانت البقية أصغر لانخفض المتوسط.","En":"If the others were smaller, the mean would fall."},"Order":4}]}$mw$),
($mw$growth-v52-grade-6-signed-number-between-equal-negative-fractions-1$mw$,$mw$signed-number-between-equal-negative-fractions$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,345,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":345,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة تمثيلين للعدد السالب","En":"Comparing signed fraction representations"},"Question":{"Ar":"أي عدد من الخيارات يساوي $-\\frac{6}{8}$؟","En":"Which number equals $-\\frac68$?"},"Options":[{"LatexCode":"-1.25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس القسمة أو تجاوز الواحد.","En":"Reverses division or exceeds one in magnitude."}},{"LatexCode":"-0.75","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.75","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف الإشارة السالبة.","En":"Drops the negative sign."}},{"LatexCode":"-0.6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل البسط كرقم عشري مباشرة.","En":"Treats the numerator as a decimal digit directly."}}],"Hints":[{"Ar":"اقسم البسط والمقام على 2.","En":"Divide numerator and denominator by two."},{"Ar":"حوّل ثلاثة أرباع إلى عدد عشري سالب.","En":"Convert three quarters to a negative decimal."}],"Solution":{"Idea":{"Ar":"نبسط الكسر ثم نحوله إلى عدد عشري مع الحفاظ على الإشارة.","En":"Simplify and convert to decimal while preserving the sign."},"FormulaLatex":"-6/8=-3/4","Steps":[{"Ar":"$3/4=0.75$","En":"$3/4=0.75$"},{"Ar":"$-6/8=-0.75$","En":"$-6/8=-0.75$"}],"Substitution":{"Ar":"$3/4=0.75$","En":"$3/4=0.75$"},"Result":{"Ar":"$-0.75$","En":"$-0.75$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-0.75\\cdot8=-6$","En":"$-0.75\\cdot8=-6$"},"CommonError":{"Ar":"لا تحذف السالب عند تغيير التمثيل.","En":"Keep the negative sign when changing representations."}}}$mw$::jsonb,$mw$نبسط الكسر ثم نحوله إلى عدد عشري مع الحفاظ على الإشارة.

$-6/8=-3/4$

1. $3/4=0.75$

2. $-6/8=-0.75$

$3/4=0.75$

$-0.75$

$-0.75\cdot8=-6$

لا تحذف السالب عند تغيير التمثيل.$mw$,$mw$Simplify and convert to decimal while preserving the sign.

$-6/8=-3/4$

1. $3/4=0.75$

2. $-6/8=-0.75$

$3/4=0.75$

$-0.75$

$-0.75\cdot8=-6$

Keep the negative sign when changing representations.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم البسط والمقام على 2.","En":"Divide numerator and denominator by two."},{"Ar":"حوّل ثلاثة أرباع إلى عدد عشري سالب.","En":"Convert three quarters to a negative decimal."}],"Solution":{"Idea":{"Ar":"نبسط الكسر ثم نحوله إلى عدد عشري مع الحفاظ على الإشارة.","En":"Simplify and convert to decimal while preserving the sign."},"FormulaLatex":"-6/8=-3/4","Steps":[{"Ar":"$3/4=0.75$","En":"$3/4=0.75$"},{"Ar":"$-6/8=-0.75$","En":"$-6/8=-0.75$"}],"Substitution":{"Ar":"$3/4=0.75$","En":"$3/4=0.75$"},"Result":{"Ar":"$-0.75$","En":"$-0.75$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-0.75\\cdot8=-6$","En":"$-0.75\\cdot8=-6$"},"CommonError":{"Ar":"لا تحذف السالب عند تغيير التمثيل.","En":"Keep the negative sign when changing representations."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عكس القسمة أو تجاوز الواحد.","En":"Reverses division or exceeds one in magnitude."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حذف الإشارة السالبة.","En":"Drops the negative sign."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامل البسط كرقم عشري مباشرة.","En":"Treats the numerator as a decimal digit directly."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v52 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
