-- One-time owner-authorized v63 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v63-grade-4-division-remainder-reinterpret-full-trips-1$mw$,$mw$division-remainder-reinterpret-full-trips$mw$,$mw$primary-division$mw$,$mw$grade-4$mw$,4,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد رحلات لنقل جميع العناصر","En":"Trips to transport all items"},"Question":{"Ar":"تنقل عربة 9 صناديق في الرحلة الواحدة على الأكثر. ما أقل عدد من الرحلات اللازمة لنقل 47 صندوقاً؟","En":"A cart carries at most nine boxes per trip. What is the fewest trips needed to transport all 47 boxes?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تكفي ست رحلات بالفعل.","En":"Six trips already suffice."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الصناديق الأقصى في الرحلة.","En":"This is the maximum boxes per trip."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تترك صندوقين دون نقل.","En":"Leaves two boxes behind."}}],"Hints":[{"Ar":"كم رحلة ممتلئة يمكن تنفيذها؟","En":"How many full trips fit?"},{"Ar":"هل يمكن ترك الصندوقين الباقيين؟","En":"Can the remaining two boxes be left behind?"}],"Solution":{"Idea":{"Ar":"نحتاج رحلة إضافية للباقي بعد الرحلات الممتلئة.","En":"The remainder requires one extra trip after the full trips."},"FormulaLatex":"47=9\\cdot5+2","Steps":[{"Ar":"$5\\cdot9=45$","En":"$5\\cdot9=45$"},{"Ar":"$5+1=6$","En":"$5+1=6$"}],"Substitution":{"Ar":"$47-45=2$","En":"$47-45=2$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$45<47\\le54$","En":"$45<47\\le54$"},"CommonError":{"Ar":"تترك صندوقين دون نقل.","En":"Leaves two boxes behind."}}}$mw$::jsonb,$mw$نحتاج رحلة إضافية للباقي بعد الرحلات الممتلئة.

$47=9\cdot5+2$

1. $5\cdot9=45$

2. $5+1=6$

$47-45=2$

$6$

$45<47\le54$

تترك صندوقين دون نقل.$mw$,$mw$The remainder requires one extra trip after the full trips.

$47=9\cdot5+2$

1. $5\cdot9=45$

2. $5+1=6$

$47-45=2$

$6$

$45<47\le54$

Leaves two boxes behind.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم رحلة ممتلئة يمكن تنفيذها؟","En":"How many full trips fit?"},{"Ar":"هل يمكن ترك الصندوقين الباقيين؟","En":"Can the remaining two boxes be left behind?"}],"Solution":{"Idea":{"Ar":"نحتاج رحلة إضافية للباقي بعد الرحلات الممتلئة.","En":"The remainder requires one extra trip after the full trips."},"FormulaLatex":"47=9\\cdot5+2","Steps":[{"Ar":"$5\\cdot9=45$","En":"$5\\cdot9=45$"},{"Ar":"$5+1=6$","En":"$5+1=6$"}],"Substitution":{"Ar":"$47-45=2$","En":"$47-45=2$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$45<47\\le54$","En":"$45<47\\le54$"},"CommonError":{"Ar":"تترك صندوقين دون نقل.","En":"Leaves two boxes behind."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تكفي ست رحلات بالفعل.","En":"Six trips already suffice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الصناديق الأقصى في الرحلة.","En":"This is the maximum boxes per trip."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تترك صندوقين دون نقل.","En":"Leaves two boxes behind."},"Order":4}]}$mw$),
($mw$growth-v63-grade-7-range-duplicate-extreme-removal-invariance-1$mw$,$mw$range-duplicate-extreme-removal-invariance$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-7$mw$,7,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مدى بعد حذف قيمة كبرى مكررة","En":"Range after removing a repeated maximum"},"Question":{"Ar":"البيانات هي 4،7،10،10. حُذفت إحدى القيمتين اللتين تساويان 10. ما المدى الجديد؟","En":"The data are 4,7,10,10. One of the two observations equal to ten is removed. Find the new range."},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ما زالت القيم غير متساوية.","En":"The observations still differ."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تبقى قيمة 10 في البيانات، فلا تصبح 7 هي الكبرى.","En":"A ten remains, so seven is not the maximum."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة الكبرى وليست المدى.","En":"This is the maximum, not the range."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب القيم بعد الحذف.","En":"List the remaining observations."},{"Ar":"حدد أكبر وأصغر قيمة.","En":"Identify the largest and smallest values."}],"Solution":{"Idea":{"Ar":"حذف نسخة واحدة من قيمة كبرى مكررة لا يغير القيمة الكبرى.","En":"Removing one copy of a repeated maximum does not change the maximum."},"FormulaLatex":"R=10-4","Steps":[{"Ar":"$R=6$","En":"$R=6$"}],"Substitution":{"Ar":"$10-4$","En":"$10-4$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+6=10$","En":"$4+6=10$"},"CommonError":{"Ar":"ما زالت القيم غير متساوية.","En":"The observations still differ."}}}$mw$::jsonb,$mw$حذف نسخة واحدة من قيمة كبرى مكررة لا يغير القيمة الكبرى.

$R=10-4$

1. $R=6$

$10-4$

$6$

$4+6=10$

ما زالت القيم غير متساوية.$mw$,$mw$Removing one copy of a repeated maximum does not change the maximum.

$R=10-4$

1. $R=6$

$10-4$

$6$

$4+6=10$

The observations still differ.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب القيم بعد الحذف.","En":"List the remaining observations."},{"Ar":"حدد أكبر وأصغر قيمة.","En":"Identify the largest and smallest values."}],"Solution":{"Idea":{"Ar":"حذف نسخة واحدة من قيمة كبرى مكررة لا يغير القيمة الكبرى.","En":"Removing one copy of a repeated maximum does not change the maximum."},"FormulaLatex":"R=10-4","Steps":[{"Ar":"$R=6$","En":"$R=6$"}],"Substitution":{"Ar":"$10-4$","En":"$10-4$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+6=10$","En":"$4+6=10$"},"CommonError":{"Ar":"ما زالت القيم غير متساوية.","En":"The observations still differ."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ما زالت القيم غير متساوية.","En":"The observations still differ."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تبقى قيمة 10 في البيانات، فلا تصبح 7 هي الكبرى.","En":"A ten remains, so seven is not the maximum."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة الكبرى وليست المدى.","En":"This is the maximum, not the range."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v63-grade-7-summary-statistics-identify-mean-median-mode-same-1$mw$,$mw$summary-statistics-identify-mean-median-mode-same$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-7$mw$,7,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تساوي مقاييس النزعة المركزية","En":"Equal measures of central tendency"},"Question":{"Ar":"أي مجموعة من الخيارات يتساوى فيها المتوسط الحسابي والوسيط والمنوال؟","En":"Which listed data set has equal mean, median and mode?"},"Options":[{"LatexCode":"(1,2,2,7)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"متوسطها 3 ووسيطها ومنوالها 2.","En":"Mean three, median and mode two."}},{"LatexCode":"(2,3,3,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"متوسطها 4 ووسيطها ومنوالها 3.","En":"Mean four, median and mode three."}},{"LatexCode":"(1,1,3,7)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"متوسطها 3 ووسيطها 2 ومنوالها 1.","En":"Mean three, median two, mode one."}},{"LatexCode":"(2,4,4,6)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ابدأ بالمجموعة التي تتكرر فيها قيمة وسطى.","En":"Start with a set having a repeated middle value."},{"Ar":"تحقق من المتوسط أيضاً.","En":"Check the mean as well."}],"Solution":{"Idea":{"Ar":"نحسب المقاييس الثلاثة ونبحث عن مجموعة تتطابق نتائجها.","En":"Compute all three measures and find the set where they match."},"FormulaLatex":"\\bar x=(2+4+4+6)/4","Steps":[{"Ar":"$\\bar x=4$","En":"$\\bar x=4$"},{"Ar":"$M=(4+4)/2=4$","En":"$M=(4+4)/2=4$"},{"Ar":"$\\operatorname{mode}=4$","En":"$\\operatorname{mode}=4$"}],"Substitution":{"Ar":"$16/4$","En":"$16/4$"},"Result":{"Ar":"$(2,4,4,6)$","En":"$(2,4,4,6)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\bar x=M=\\operatorname{mode}=4$","En":"$\\bar x=M=\\operatorname{mode}=4$"},"CommonError":{"Ar":"متوسطها 3 ووسيطها ومنوالها 2.","En":"Mean three, median and mode two."}}}$mw$::jsonb,$mw$نحسب المقاييس الثلاثة ونبحث عن مجموعة تتطابق نتائجها.

$\bar x=(2+4+4+6)/4$

1. $\bar x=4$

2. $M=(4+4)/2=4$

3. $\operatorname{mode}=4$

$16/4$

$(2,4,4,6)$

$\bar x=M=\operatorname{mode}=4$

متوسطها 3 ووسيطها ومنوالها 2.$mw$,$mw$Compute all three measures and find the set where they match.

$\bar x=(2+4+4+6)/4$

1. $\bar x=4$

2. $M=(4+4)/2=4$

3. $\operatorname{mode}=4$

$16/4$

$(2,4,4,6)$

$\bar x=M=\operatorname{mode}=4$

Mean three, median and mode two.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالمجموعة التي تتكرر فيها قيمة وسطى.","En":"Start with a set having a repeated middle value."},{"Ar":"تحقق من المتوسط أيضاً.","En":"Check the mean as well."}],"Solution":{"Idea":{"Ar":"نحسب المقاييس الثلاثة ونبحث عن مجموعة تتطابق نتائجها.","En":"Compute all three measures and find the set where they match."},"FormulaLatex":"\\bar x=(2+4+4+6)/4","Steps":[{"Ar":"$\\bar x=4$","En":"$\\bar x=4$"},{"Ar":"$M=(4+4)/2=4$","En":"$M=(4+4)/2=4$"},{"Ar":"$\\operatorname{mode}=4$","En":"$\\operatorname{mode}=4$"}],"Substitution":{"Ar":"$16/4$","En":"$16/4$"},"Result":{"Ar":"$(2,4,4,6)$","En":"$(2,4,4,6)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\bar x=M=\\operatorname{mode}=4$","En":"$\\bar x=M=\\operatorname{mode}=4$"},"CommonError":{"Ar":"متوسطها 3 ووسيطها ومنوالها 2.","En":"Mean three, median and mode two."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"متوسطها 3 ووسيطها ومنوالها 2.","En":"Mean three, median and mode two."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"متوسطها 4 ووسيطها ومنوالها 3.","En":"Mean four, median and mode three."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"متوسطها 3 ووسيطها 2 ومنوالها 1.","En":"Mean three, median two, mode one."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v63-grade-4-multiplication-distributive-error-omit-tens-term-1$mw$,$mw$multiplication-distributive-error-omit-tens-term$mw$,$mw$primary-multiplication$mw$,$mw$grade-4$mw$,4,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح حاصل ضرب بتفكيك العشرات","En":"Correcting a product decomposition"},"Question":{"Ar":"لحساب $34\\times6$، كتب طالب $30+4\\times6$. كم يجب أن يضيف إلى ناتجه ليحصل على الناتج الصحيح؟","En":"To calculate $34\\times6$, a pupil writes $30+4\\times6$. How much must be added to the pupil's result to obtain the correct product?"},"Options":[{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب الآحاد.","En":"This is the ones product."}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حد العشرات قبل الضرب.","En":"This is the tens part before multiplication."}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب العشرات كاملاً لا الفرق.","En":"This is the full tens product, not the difference."}},{"LatexCode":"150","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب ناتج الطالب.","En":"Find the pupil's result."},{"Ar":"احسب الفرق عن الناتج الصحيح.","En":"Find the difference from the correct product."}],"Solution":{"Idea":{"Ar":"يجب ضرب العشرات والآحاد كليهما في 6.","En":"Both tens and ones must be multiplied by six."},"FormulaLatex":"(30\\cdot6+4\\cdot6)-(30+4\\cdot6)","Steps":[{"Ar":"$30\\cdot6=180$","En":"$30\\cdot6=180$"},{"Ar":"$180-30=150$","En":"$180-30=150$"}],"Substitution":{"Ar":"$180-30$","En":"$180-30$"},"Result":{"Ar":"$150$","En":"$150$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$54+150=204=34\\cdot6$","En":"$54+150=204=34\\cdot6$"},"CommonError":{"Ar":"هذا حاصل ضرب الآحاد.","En":"This is the ones product."}}}$mw$::jsonb,$mw$يجب ضرب العشرات والآحاد كليهما في 6.

$(30\cdot6+4\cdot6)-(30+4\cdot6)$

1. $30\cdot6=180$

2. $180-30=150$

$180-30$

$150$

$54+150=204=34\cdot6$

هذا حاصل ضرب الآحاد.$mw$,$mw$Both tens and ones must be multiplied by six.

$(30\cdot6+4\cdot6)-(30+4\cdot6)$

1. $30\cdot6=180$

2. $180-30=150$

$180-30$

$150$

$54+150=204=34\cdot6$

This is the ones product.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب ناتج الطالب.","En":"Find the pupil's result."},{"Ar":"احسب الفرق عن الناتج الصحيح.","En":"Find the difference from the correct product."}],"Solution":{"Idea":{"Ar":"يجب ضرب العشرات والآحاد كليهما في 6.","En":"Both tens and ones must be multiplied by six."},"FormulaLatex":"(30\\cdot6+4\\cdot6)-(30+4\\cdot6)","Steps":[{"Ar":"$30\\cdot6=180$","En":"$30\\cdot6=180$"},{"Ar":"$180-30=150$","En":"$180-30=150$"}],"Substitution":{"Ar":"$180-30$","En":"$180-30$"},"Result":{"Ar":"$150$","En":"$150$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$54+150=204=34\\cdot6$","En":"$54+150=204=34\\cdot6$"},"CommonError":{"Ar":"هذا حاصل ضرب الآحاد.","En":"This is the ones product."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب الآحاد.","En":"This is the ones product."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا حد العشرات قبل الضرب.","En":"This is the tens part before multiplication."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب العشرات كاملاً لا الفرق.","En":"This is the full tens product, not the difference."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v63-grade-7-median-frequency-counts-locate-middle-1$mw$,$mw$median-frequency-counts-locate-middle$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-7$mw$,7,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"وسيط من تكرارات القيم","En":"Median from frequency counts"},"Question":{"Ar":"في سجل من 11 قراءة، تكررت القيمة 2 ثلاث مرات، والقيمة 5 أربع مرات، والقيمة 9 أربع مرات. ما الوسيط؟","En":"In a record of eleven observations, the value 2 occurs three times, 5 occurs four times and 9 occurs four times. Find the median."},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تشغل القيمة 2 المواضع الثلاثة الأولى فقط.","En":"Two occupies only the first three positions."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تبدأ القيمة 9 من الموضع الثامن.","En":"Nine begins at the eighth position."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا رقم موضع الوسيط وليس قيمته.","En":"This is the median's position, not its value."}}],"Hints":[{"Ar":"ما موضع القيمة الوسطى بين 11 قراءة؟","En":"Where is the middle observation among eleven?"},{"Ar":"تشغل القيمة 5 المواضع من الرابع إلى السابع.","En":"Five occupies positions four through seven."}],"Solution":{"Idea":{"Ar":"نحدد موضع الوسيط ثم نستعمل التكرار التراكمي لتحديد قيمته.","En":"Locate the median position and use cumulative counts to identify its value."},"FormulaLatex":"i=(n+1)/2","Steps":[{"Ar":"$i=6$","En":"$i=6$"},{"Ar":"$3<6\\le3+4=7$","En":"$3<6\\le3+4=7$"},{"Ar":"$M=5$","En":"$M=5$"}],"Substitution":{"Ar":"$(11+1)/2=6$","En":"$(11+1)/2=6$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2,2,2,5,5,5,5,9,9,9,9$","En":"$2,2,2,5,5,5,5,9,9,9,9$"},"CommonError":{"Ar":"لا تخلط رقم الموضع بقيمة القراءة عند ذلك الموضع.","En":"Do not confuse the position with the observation at that position."}}}$mw$::jsonb,$mw$نحدد موضع الوسيط ثم نستعمل التكرار التراكمي لتحديد قيمته.

$i=(n+1)/2$

1. $i=6$

2. $3<6\le3+4=7$

3. $M=5$

$(11+1)/2=6$

$5$

$2,2,2,5,5,5,5,9,9,9,9$

لا تخلط رقم الموضع بقيمة القراءة عند ذلك الموضع.$mw$,$mw$Locate the median position and use cumulative counts to identify its value.

$i=(n+1)/2$

1. $i=6$

2. $3<6\le3+4=7$

3. $M=5$

$(11+1)/2=6$

$5$

$2,2,2,5,5,5,5,9,9,9,9$

Do not confuse the position with the observation at that position.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما موضع القيمة الوسطى بين 11 قراءة؟","En":"Where is the middle observation among eleven?"},{"Ar":"تشغل القيمة 5 المواضع من الرابع إلى السابع.","En":"Five occupies positions four through seven."}],"Solution":{"Idea":{"Ar":"نحدد موضع الوسيط ثم نستعمل التكرار التراكمي لتحديد قيمته.","En":"Locate the median position and use cumulative counts to identify its value."},"FormulaLatex":"i=(n+1)/2","Steps":[{"Ar":"$i=6$","En":"$i=6$"},{"Ar":"$3<6\\le3+4=7$","En":"$3<6\\le3+4=7$"},{"Ar":"$M=5$","En":"$M=5$"}],"Substitution":{"Ar":"$(11+1)/2=6$","En":"$(11+1)/2=6$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2,2,2,5,5,5,5,9,9,9,9$","En":"$2,2,2,5,5,5,5,9,9,9,9$"},"CommonError":{"Ar":"لا تخلط رقم الموضع بقيمة القراءة عند ذلك الموضع.","En":"Do not confuse the position with the observation at that position."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تشغل القيمة 2 المواضع الثلاثة الأولى فقط.","En":"Two occupies only the first three positions."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تبدأ القيمة 9 من الموضع الثامن.","En":"Nine begins at the eighth position."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا رقم موضع الوسيط وليس قيمته.","En":"This is the median's position, not its value."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v63 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
