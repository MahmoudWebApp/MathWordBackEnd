-- One-time owner-authorized v57 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v57-grade-1-counting-ordinal-number-of-children-ahead-1$mw$,$mw$counting-ordinal-number-of-children-ahead$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عدد الأطفال قبل موضع محدد","En":"Counting children ahead"},"Question":{"Ar":"تقف ليلى في المكان التاسع من الأمام. كم طفلاً يقف أمامها؟","En":"Layla is ninth from the front of a line. How many children stand ahead of her?"},"Options":[{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينقص طفلين من رقم الموضع.","En":"Subtracts two from the position."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد ليلى مع الأطفال أمامها.","En":"Includes Layla in the count ahead."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يزيد واحداً على رقم الموضع.","En":"Adds one to the position."}}],"Hints":[{"Ar":"لا تعد ليلى نفسها.","En":"Do not count Layla herself."},{"Ar":"اطرح واحداً من ترتيبها.","En":"Subtract one from her position."}],"Solution":{"Idea":{"Ar":"رقم الموضع يشمل الطفل نفسه؛ نطرح واحداً.","En":"The position includes the child herself; subtract one."},"FormulaLatex":"9-1","Steps":[{"Ar":"$9-1=8$","En":"$9-1=8$"}],"Substitution":{"Ar":"$9-1$","En":"$9-1$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8+1=9$","En":"$8+1=9$"},"CommonError":{"Ar":"ينقص طفلين من رقم الموضع.","En":"Subtracts two from the position."}}}$mw$::jsonb,$mw$رقم الموضع يشمل الطفل نفسه؛ نطرح واحداً.

$9-1$

1. $9-1=8$

$9-1$

$8$

$8+1=9$

ينقص طفلين من رقم الموضع.$mw$,$mw$The position includes the child herself; subtract one.

$9-1$

1. $9-1=8$

$9-1$

$8$

$8+1=9$

Subtracts two from the position.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لا تعد ليلى نفسها.","En":"Do not count Layla herself."},{"Ar":"اطرح واحداً من ترتيبها.","En":"Subtract one from her position."}],"Solution":{"Idea":{"Ar":"رقم الموضع يشمل الطفل نفسه؛ نطرح واحداً.","En":"The position includes the child herself; subtract one."},"FormulaLatex":"9-1","Steps":[{"Ar":"$9-1=8$","En":"$9-1=8$"}],"Substitution":{"Ar":"$9-1$","En":"$9-1$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8+1=9$","En":"$8+1=9$"},"CommonError":{"Ar":"ينقص طفلين من رقم الموضع.","En":"Subtracts two from the position."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ينقص طفلين من رقم الموضع.","En":"Subtracts two from the position."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعد ليلى مع الأطفال أمامها.","En":"Includes Layla in the count ahead."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يزيد واحداً على رقم الموضع.","En":"Adds one to the position."},"Order":4}]}$mw$),
($mw$growth-v57-grade-1-counting-number-neighbors-sum-1$mw$,$mw$counting-number-neighbors-sum$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"جيران عدد","En":"Number neighbors"},"Question":{"Ar":"ما العدد الذي يأتي مباشرة قبل 18 ومباشرة بعد 16؟","En":"Which number comes immediately before 18 and immediately after 16?"},"Options":[{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أحد العددين المعطيين.","En":"One of the given numbers."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يأتي بعد 18.","En":"Comes after eighteen."}},{"LatexCode":"17","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يسبق 16.","En":"Comes before sixteen."}}],"Hints":[{"Ar":"ابدأ من 16.","En":"Start at sixteen."},{"Ar":"زد واحداً فقط.","En":"Add just one."}],"Solution":{"Idea":{"Ar":"الأعداد المتتالية تزيد واحداً في كل خطوة.","En":"Consecutive counting numbers increase by one at each step."},"FormulaLatex":"16+1=18-1","Steps":[{"Ar":"$16+1=17$","En":"$16+1=17$"}],"Substitution":{"Ar":"$16+1$","En":"$16+1$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$17+1=18$","En":"$17+1=18$"},"CommonError":{"Ar":"يسبق 16.","En":"Comes before sixteen."}}}$mw$::jsonb,$mw$الأعداد المتتالية تزيد واحداً في كل خطوة.

$16+1=18-1$

1. $16+1=17$

$16+1$

$17$

$17+1=18$

يسبق 16.$mw$,$mw$Consecutive counting numbers increase by one at each step.

$16+1=18-1$

1. $16+1=17$

$16+1$

$17$

$17+1=18$

Comes before sixteen.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابدأ من 16.","En":"Start at sixteen."},{"Ar":"زد واحداً فقط.","En":"Add just one."}],"Solution":{"Idea":{"Ar":"الأعداد المتتالية تزيد واحداً في كل خطوة.","En":"Consecutive counting numbers increase by one at each step."},"FormulaLatex":"16+1=18-1","Steps":[{"Ar":"$16+1=17$","En":"$16+1=17$"}],"Substitution":{"Ar":"$16+1$","En":"$16+1$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$17+1=18$","En":"$17+1=18$"},"CommonError":{"Ar":"يسبق 16.","En":"Comes before sixteen."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أحد العددين المعطيين.","En":"One of the given numbers."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يأتي بعد 18.","En":"Comes after eighteen."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يسبق 16.","En":"Comes before sixteen."},"Order":4}]}$mw$),
($mw$growth-v57-grade-5-probability-certain-event-number-bound-1$mw$,$mw$probability-certain-event-number-bound$mw$,$mw$primary-simple-probability$mw$,$mw$grade-5$mw$,5,1,4,17,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":17,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حدث مؤكد","En":"Certain event"},"Question":{"Ar":"عند رمي حجر نرد عادل مرقم من 1 إلى 6، ما احتمال الحصول على عدد أصغر من 7؟","En":"A fair die is numbered 1 to 6. What is the probability of rolling a number less than seven?"},"Options":[{"LatexCode":"\\frac56","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استبعد نتيجة ممكنة دون سبب.","En":"Excludes a possible outcome without reason."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جميع النتائج تحقق الشرط وليس العكس.","En":"All outcomes satisfy the condition, not none."}},{"LatexCode":"\\frac16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد نتيجة واحدة فقط.","En":"Counts just one outcome."}}],"Hints":[{"Ar":"اكتب الأعداد على النرد.","En":"List the die outcomes."},{"Ar":"كم منها أصغر من 7؟","En":"How many are below seven?"}],"Solution":{"Idea":{"Ar":"جميع النتائج الست أقل من سبعة.","En":"All six outcomes are below seven."},"FormulaLatex":"P=6/6","Steps":[{"Ar":"$6/6=1$","En":"$6/6=1$"}],"Substitution":{"Ar":"$6/6$","En":"$6/6$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6<7$","En":"$6<7$"},"CommonError":{"Ar":"جميع النتائج تحقق الشرط وليس العكس.","En":"All outcomes satisfy the condition, not none."}}}$mw$::jsonb,$mw$جميع النتائج الست أقل من سبعة.

$P=6/6$

1. $6/6=1$

$6/6$

$1$

$6<7$

جميع النتائج تحقق الشرط وليس العكس.$mw$,$mw$All six outcomes are below seven.

$P=6/6$

1. $6/6=1$

$6/6$

$1$

$6<7$

All outcomes satisfy the condition, not none.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الأعداد على النرد.","En":"List the die outcomes."},{"Ar":"كم منها أصغر من 7؟","En":"How many are below seven?"}],"Solution":{"Idea":{"Ar":"جميع النتائج الست أقل من سبعة.","En":"All six outcomes are below seven."},"FormulaLatex":"P=6/6","Steps":[{"Ar":"$6/6=1$","En":"$6/6=1$"}],"Substitution":{"Ar":"$6/6$","En":"$6/6$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6<7$","En":"$6<7$"},"CommonError":{"Ar":"جميع النتائج تحقق الشرط وليس العكس.","En":"All outcomes satisfy the condition, not none."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استبعد نتيجة ممكنة دون سبب.","En":"Excludes a possible outcome without reason."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جميع النتائج تحقق الشرط وليس العكس.","En":"All outcomes satisfy the condition, not none."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عد نتيجة واحدة فقط.","En":"Counts just one outcome."},"Order":4}]}$mw$),
($mw$growth-v57-grade-5-mean-total-inferred-known-average-count-1$mw$,$mw$mean-total-inferred-known-average-count$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-5$mw$,5,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج مجموع من متوسط","En":"Total from a mean"},"Question":{"Ar":"متوسط عدد الصفحات التي قرأها طالب يومياً خلال أربعة أيام هو 9 صفحات. كم صفحة قرأ إجمالاً؟","En":"A pupil reads an average of nine pages per day over four days. How many pages are read in total?"},"Options":[{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المتوسط اليومي.","En":"This is the daily mean."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المتوسط وعدد الأيام.","En":"Adds mean and day count."}},{"LatexCode":"\\frac94","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم المتوسط بدلاً من ضربه.","En":"Divides instead of multiplying."}}],"Hints":[{"Ar":"كم يوماً في الفترة؟","En":"How many days are included?"},{"Ar":"اضرب المتوسط في عدد الأيام.","En":"Multiply the mean by the day count."}],"Solution":{"Idea":{"Ar":"المجموع يساوي المتوسط مضروباً في عدد القيم.","En":"The total equals the mean times the count."},"FormulaLatex":"S=\\bar x n","Steps":[{"Ar":"$S=36$","En":"$S=36$"}],"Substitution":{"Ar":"$9\\cdot4$","En":"$9\\cdot4$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36/4=9$","En":"$36/4=9$"},"CommonError":{"Ar":"هذا المتوسط اليومي.","En":"This is the daily mean."}}}$mw$::jsonb,$mw$المجموع يساوي المتوسط مضروباً في عدد القيم.

$S=\bar x n$

1. $S=36$

$9\cdot4$

$36$

$36/4=9$

هذا المتوسط اليومي.$mw$,$mw$The total equals the mean times the count.

$S=\bar x n$

1. $S=36$

$9\cdot4$

$36$

$36/4=9$

This is the daily mean.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم يوماً في الفترة؟","En":"How many days are included?"},{"Ar":"اضرب المتوسط في عدد الأيام.","En":"Multiply the mean by the day count."}],"Solution":{"Idea":{"Ar":"المجموع يساوي المتوسط مضروباً في عدد القيم.","En":"The total equals the mean times the count."},"FormulaLatex":"S=\\bar x n","Steps":[{"Ar":"$S=36$","En":"$S=36$"}],"Substitution":{"Ar":"$9\\cdot4$","En":"$9\\cdot4$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36/4=9$","En":"$36/4=9$"},"CommonError":{"Ar":"هذا المتوسط اليومي.","En":"This is the daily mean."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا المتوسط اليومي.","En":"This is the daily mean."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع المتوسط وعدد الأيام.","En":"Adds mean and day count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم المتوسط بدلاً من ضربه.","En":"Divides instead of multiplying."},"Order":4}]}$mw$),
($mw$growth-v57-grade-5-median-remove-smallest-and-largest-invariance-1$mw$,$mw$median-remove-smallest-and-largest-invariance$mw$,$mw$primary-median$mw$,$mw$grade-5$mw$,5,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"وسيط بعد حذف الطرفين","En":"Median after removing extremes"},"Question":{"Ar":"القيم المرتبة هي 2،5،8،9،14. حُذفت أصغر قيمة وأكبر قيمة. ما وسيط القيم الباقية؟","En":"The ordered values are 2,5,8,9,14. The smallest and largest are removed. What is the median of the remaining values?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه أول قيمة باقية.","En":"This is the first remaining value."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه آخر قيمة باقية.","En":"This is the last remaining value."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا متوسط 5 و9.","En":"This is the mean of five and nine."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احذف 2 و14.","En":"Remove two and fourteen."},{"Ar":"اختر القيمة الوسطى من الثلاث.","En":"Choose the middle of the three."}],"Solution":{"Idea":{"Ar":"حذف قيمة من كل طرف يبقي القيمة الوسطى في المنتصف.","En":"Removing one value at each end preserves the middle observation."},"FormulaLatex":"(3+1)/2=2","Steps":[{"Ar":"$x_2=8$","En":"$x_2=8$"}],"Substitution":{"Ar":"$5,8,9$","En":"$5,8,9$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5<8<9$","En":"$5<8<9$"},"CommonError":{"Ar":"هذه أول قيمة باقية.","En":"This is the first remaining value."}}}$mw$::jsonb,$mw$حذف قيمة من كل طرف يبقي القيمة الوسطى في المنتصف.

$(3+1)/2=2$

1. $x_2=8$

$5,8,9$

$8$

$5<8<9$

هذه أول قيمة باقية.$mw$,$mw$Removing one value at each end preserves the middle observation.

$(3+1)/2=2$

1. $x_2=8$

$5,8,9$

$8$

$5<8<9$

This is the first remaining value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احذف 2 و14.","En":"Remove two and fourteen."},{"Ar":"اختر القيمة الوسطى من الثلاث.","En":"Choose the middle of the three."}],"Solution":{"Idea":{"Ar":"حذف قيمة من كل طرف يبقي القيمة الوسطى في المنتصف.","En":"Removing one value at each end preserves the middle observation."},"FormulaLatex":"(3+1)/2=2","Steps":[{"Ar":"$x_2=8$","En":"$x_2=8$"}],"Substitution":{"Ar":"$5,8,9$","En":"$5,8,9$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5<8<9$","En":"$5<8<9$"},"CommonError":{"Ar":"هذه أول قيمة باقية.","En":"This is the first remaining value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه أول قيمة باقية.","En":"This is the first remaining value."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه آخر قيمة باقية.","En":"This is the last remaining value."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا متوسط 5 و9.","En":"This is the mean of five and nine."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v57-grade-8-slope-negative-rise-from-known-run-1$mw$,$mw$slope-negative-rise-from-known-run$mw$,$mw$middle-slope$mw$,$mw$grade-8$mw$,8,2,6,29,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":29,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير رأسي من ميل معلوم","En":"Rise from a known slope"},"Question":{"Ar":"ميل مستقيم يساوي −3. إذا زاد x بمقدار 4، فما مقدار تغير y الموقّع؟","En":"A line has slope −3. If x increases by four, what is the signed change in y?"},"Options":[{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الميل لا التغير الرأسي.","En":"This is the slope, not the rise."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الميل والتغير الأفقي.","En":"Adds slope and horizontal change."}},{"LatexCode":"-12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل إشارة الميل السالبة.","En":"Drops the negative slope sign."}}],"Hints":[{"Ar":"استعمل تعريف الميل.","En":"Use the slope definition."},{"Ar":"احتفظ بإشارة السالب.","En":"Keep the negative sign."}],"Solution":{"Idea":{"Ar":"التغير الرأسي يساوي الميل مضروباً في التغير الأفقي.","En":"Vertical change equals slope times horizontal change."},"FormulaLatex":"\\Delta y=m\\Delta x","Steps":[{"Ar":"$\\Delta y=-12$","En":"$\\Delta y=-12$"}],"Substitution":{"Ar":"$(-3)\\cdot4$","En":"$(-3)\\cdot4$"},"Result":{"Ar":"$-12$","En":"$-12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-12/4=-3$","En":"$-12/4=-3$"},"CommonError":{"Ar":"أهمل إشارة الميل السالبة.","En":"Drops the negative slope sign."}}}$mw$::jsonb,$mw$التغير الرأسي يساوي الميل مضروباً في التغير الأفقي.

$\Delta y=m\Delta x$

1. $\Delta y=-12$

$(-3)\cdot4$

$-12$

$-12/4=-3$

أهمل إشارة الميل السالبة.$mw$,$mw$Vertical change equals slope times horizontal change.

$\Delta y=m\Delta x$

1. $\Delta y=-12$

$(-3)\cdot4$

$-12$

$-12/4=-3$

Drops the negative slope sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل تعريف الميل.","En":"Use the slope definition."},{"Ar":"احتفظ بإشارة السالب.","En":"Keep the negative sign."}],"Solution":{"Idea":{"Ar":"التغير الرأسي يساوي الميل مضروباً في التغير الأفقي.","En":"Vertical change equals slope times horizontal change."},"FormulaLatex":"\\Delta y=m\\Delta x","Steps":[{"Ar":"$\\Delta y=-12$","En":"$\\Delta y=-12$"}],"Substitution":{"Ar":"$(-3)\\cdot4$","En":"$(-3)\\cdot4$"},"Result":{"Ar":"$-12$","En":"$-12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-12/4=-3$","En":"$-12/4=-3$"},"CommonError":{"Ar":"أهمل إشارة الميل السالبة.","En":"Drops the negative slope sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا الميل لا التغير الرأسي.","En":"This is the slope, not the rise."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع الميل والتغير الأفقي.","En":"Adds slope and horizontal change."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل إشارة الميل السالبة.","En":"Drops the negative slope sign."},"Order":4}]}$mw$),
($mw$growth-v57-grade-8-exponent-negative-power-product-reciprocal-1$mw$,$mw$exponent-negative-power-product-reciprocal$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حاصل ضرب قوتين متعاكستين","En":"Product of inverse powers"},"Question":{"Ar":"ما قيمة $7^4\\cdot7^{-4}$؟","En":"Evaluate $7^4\\cdot7^{-4}$."},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأس صفر لكن قيمة القوة ليست صفراً.","En":"The exponent is zero, but the power is not zero."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الأس 1 بدلاً من صفر.","En":"Uses exponent one instead of zero."}},{"LatexCode":"7^8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل إشارة الأس الثاني.","En":"Drops the sign of the second exponent."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اجمع 4 و−4.","En":"Add four and negative four."},{"Ar":"تذكر قوة الصفر لأساس غير صفري.","En":"Recall zero power of a nonzero base."}],"Solution":{"Idea":{"Ar":"عند ضرب قوتين لهما الأساس نفسه نجمع الأسين.","En":"When multiplying powers of the same base, add exponents."},"FormulaLatex":"a^ma^n=a^{m+n}","Steps":[{"Ar":"$7^0=1$","En":"$7^0=1$"}],"Substitution":{"Ar":"$7^{4+(-4)}$","En":"$7^{4+(-4)}$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7^4/7^4=1$","En":"$7^4/7^4=1$"},"CommonError":{"Ar":"الأس صفر لكن قيمة القوة ليست صفراً.","En":"The exponent is zero, but the power is not zero."}}}$mw$::jsonb,$mw$عند ضرب قوتين لهما الأساس نفسه نجمع الأسين.

$a^ma^n=a^{m+n}$

1. $7^0=1$

$7^{4+(-4)}$

$1$

$7^4/7^4=1$

الأس صفر لكن قيمة القوة ليست صفراً.$mw$,$mw$When multiplying powers of the same base, add exponents.

$a^ma^n=a^{m+n}$

1. $7^0=1$

$7^{4+(-4)}$

$1$

$7^4/7^4=1$

The exponent is zero, but the power is not zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع 4 و−4.","En":"Add four and negative four."},{"Ar":"تذكر قوة الصفر لأساس غير صفري.","En":"Recall zero power of a nonzero base."}],"Solution":{"Idea":{"Ar":"عند ضرب قوتين لهما الأساس نفسه نجمع الأسين.","En":"When multiplying powers of the same base, add exponents."},"FormulaLatex":"a^ma^n=a^{m+n}","Steps":[{"Ar":"$7^0=1$","En":"$7^0=1$"}],"Substitution":{"Ar":"$7^{4+(-4)}$","En":"$7^{4+(-4)}$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7^4/7^4=1$","En":"$7^4/7^4=1$"},"CommonError":{"Ar":"الأس صفر لكن قيمة القوة ليست صفراً.","En":"The exponent is zero, but the power is not zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الأس صفر لكن قيمة القوة ليست صفراً.","En":"The exponent is zero, but the power is not zero."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الأس 1 بدلاً من صفر.","En":"Uses exponent one instead of zero."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أهمل إشارة الأس الثاني.","En":"Drops the sign of the second exponent."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v57-grade-11-derivative-constant-difference-between-functions-1$mw$,$mw$derivative-constant-difference-between-functions$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر ثابت على المشتقة","En":"Effect of a constant on a derivative"},"Question":{"Ar":"إذا كان $g(x)=f(x)+12$ حيث f كثيرة حدود، فما $g'(x)-f'(x)$؟","En":"If $g(x)=f(x)+12$ for a polynomial f, what is $g'(x)-f'(x)$?"},"Options":[{"LatexCode":"-12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس فرق الدالتين دون اشتقاق.","En":"Reverses the function difference without differentiating."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل الثابت كأنه x.","En":"Treats the constant as x."}},{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط فرق الدالتين بفرق مشتقتيهما.","En":"Confuses the function difference with the derivative difference."}}],"Hints":[{"Ar":"اشتق الطرفين.","En":"Differentiate both sides."},{"Ar":"اطرح المشتقتين.","En":"Subtract the derivatives."}],"Solution":{"Idea":{"Ar":"مشتقة الثابت صفر.","En":"The derivative of a constant is zero."},"FormulaLatex":"g'=f'+0","Steps":[{"Ar":"$g'-f'=0$","En":"$g'-f'=0$"}],"Substitution":{"Ar":"$g'-f'=f'-f'$","En":"$g'-f'=f'-f'$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac{d}{dx}(12)=0$","En":"$\\frac{d}{dx}(12)=0$"},"CommonError":{"Ar":"خلط فرق الدالتين بفرق مشتقتيهما.","En":"Confuses the function difference with the derivative difference."}}}$mw$::jsonb,$mw$مشتقة الثابت صفر.

$g'=f'+0$

1. $g'-f'=0$

$g'-f'=f'-f'$

$0$

$\frac{d}{dx}(12)=0$

خلط فرق الدالتين بفرق مشتقتيهما.$mw$,$mw$The derivative of a constant is zero.

$g'=f'+0$

1. $g'-f'=0$

$g'-f'=f'-f'$

$0$

$\frac{d}{dx}(12)=0$

Confuses the function difference with the derivative difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشتق الطرفين.","En":"Differentiate both sides."},{"Ar":"اطرح المشتقتين.","En":"Subtract the derivatives."}],"Solution":{"Idea":{"Ar":"مشتقة الثابت صفر.","En":"The derivative of a constant is zero."},"FormulaLatex":"g'=f'+0","Steps":[{"Ar":"$g'-f'=0$","En":"$g'-f'=0$"}],"Substitution":{"Ar":"$g'-f'=f'-f'$","En":"$g'-f'=f'-f'$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac{d}{dx}(12)=0$","En":"$\\frac{d}{dx}(12)=0$"},"CommonError":{"Ar":"خلط فرق الدالتين بفرق مشتقتيهما.","En":"Confuses the function difference with the derivative difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عكس فرق الدالتين دون اشتقاق.","En":"Reverses the function difference without differentiating."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل الثابت كأنه x.","En":"Treats the constant as x."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خلط فرق الدالتين بفرق مشتقتيهما.","En":"Confuses the function difference with the derivative difference."},"Order":4}]}$mw$),
($mw$growth-v57-grade-11-derivative-polynomial-even-symmetry-origin-1$mw$,$mw$derivative-polynomial-even-symmetry-origin$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مشتقة كثيرة حدود زوجية عند الأصل","En":"Derivative of an even polynomial at zero"},"Question":{"Ar":"إذا كان $f(x)=4x^4-3x^2+9$، فما ميل المماس عند x=0؟","En":"If $f(x)=4x^4-3x^2+9$, what is the tangent slope at x=0?"},"Options":[{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا معامل الحد التكعيبي في المشتقة.","En":"This is the cubic coefficient of the derivative."}},{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الدالة عند الأصل.","En":"This is the function value at zero."}},{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا معامل الحد التربيعي الأصلي.","En":"This is the original quadratic coefficient."}}],"Hints":[{"Ar":"اشتق كل حد.","En":"Differentiate each term."},{"Ar":"عوّض x=0 بعد الاشتقاق.","En":"Substitute x=0 after differentiating."}],"Solution":{"Idea":{"Ar":"ميل المماس يساوي قيمة المشتقة عند النقطة.","En":"The tangent slope is the derivative evaluated at the point."},"FormulaLatex":"f'(x)=16x^3-6x","Steps":[{"Ar":"$f'(0)=0$","En":"$f'(0)=0$"}],"Substitution":{"Ar":"$16(0)^3-6(0)$","En":"$16(0)^3-6(0)$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(0)=16\\cdot0-6\\cdot0=0$","En":"$f'(0)=16\\cdot0-6\\cdot0=0$"},"CommonError":{"Ar":"هذه قيمة الدالة عند الأصل.","En":"This is the function value at zero."}}}$mw$::jsonb,$mw$ميل المماس يساوي قيمة المشتقة عند النقطة.

$f'(x)=16x^3-6x$

1. $f'(0)=0$

$16(0)^3-6(0)$

$0$

$f'(0)=16\cdot0-6\cdot0=0$

هذه قيمة الدالة عند الأصل.$mw$,$mw$The tangent slope is the derivative evaluated at the point.

$f'(x)=16x^3-6x$

1. $f'(0)=0$

$16(0)^3-6(0)$

$0$

$f'(0)=16\cdot0-6\cdot0=0$

This is the function value at zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشتق كل حد.","En":"Differentiate each term."},{"Ar":"عوّض x=0 بعد الاشتقاق.","En":"Substitute x=0 after differentiating."}],"Solution":{"Idea":{"Ar":"ميل المماس يساوي قيمة المشتقة عند النقطة.","En":"The tangent slope is the derivative evaluated at the point."},"FormulaLatex":"f'(x)=16x^3-6x","Steps":[{"Ar":"$f'(0)=0$","En":"$f'(0)=0$"}],"Substitution":{"Ar":"$16(0)^3-6(0)$","En":"$16(0)^3-6(0)$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(0)=16\\cdot0-6\\cdot0=0$","En":"$f'(0)=16\\cdot0-6\\cdot0=0$"},"CommonError":{"Ar":"هذه قيمة الدالة عند الأصل.","En":"This is the function value at zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا معامل الحد التكعيبي في المشتقة.","En":"This is the cubic coefficient of the derivative."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الدالة عند الأصل.","En":"This is the function value at zero."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا معامل الحد التربيعي الأصلي.","En":"This is the original quadratic coefficient."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v57 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
