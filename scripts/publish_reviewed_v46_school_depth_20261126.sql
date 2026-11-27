-- One-time owner-authorized v46 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v46-grade-7-linear-equation-consecutive-integers-sum-1$mw$,$mw$linear-equation-consecutive-integers-sum$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عددان صحيحان متتاليان","En":"Consecutive integers"},"Question":{"Ar":"مجموع عددين صحيحين متتاليين يساوي 49. ما العدد الأصغر؟","En":"Two consecutive integers sum to 49. What is the smaller integer?"},"Options":[{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"23+24=47.","En":"23+24=47."}},{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"25 هو العدد الأكبر.","En":"25 is the larger integer."}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"26+27=53.","En":"26+27=53."}}],"Hints":[{"Ar":"الفرق بين العددين واحد.","En":"The integers differ by one."},{"Ar":"اكتب مجموعهما بدلالة x.","En":"Express their sum in terms of x."}],"Solution":{"Idea":{"Ar":"إذا كان الأصغر x فالتالي x+1.","En":"If the smaller integer is x, the next is x+1."},"FormulaLatex":"x+(x+1)=49","Steps":[{"Ar":"$2x=48$","En":"$2x=48$"},{"Ar":"$x=24$","En":"$x=24$"}],"Substitution":{"Ar":"$x=24$","En":"$x=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24+25=49$","En":"$24+25=49$"},"CommonError":{"Ar":"23+24=47.","En":"23+24=47."}}}$mw$::jsonb,$mw$إذا كان الأصغر x فالتالي x+1.

$x+(x+1)=49$

1. $2x=48$

2. $x=24$

$x=24$

$24$

$24+25=49$

23+24=47.$mw$,$mw$If the smaller integer is x, the next is x+1.

$x+(x+1)=49$

1. $2x=48$

2. $x=24$

$x=24$

$24$

$24+25=49$

23+24=47.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الفرق بين العددين واحد.","En":"The integers differ by one."},{"Ar":"اكتب مجموعهما بدلالة x.","En":"Express their sum in terms of x."}],"Solution":{"Idea":{"Ar":"إذا كان الأصغر x فالتالي x+1.","En":"If the smaller integer is x, the next is x+1."},"FormulaLatex":"x+(x+1)=49","Steps":[{"Ar":"$2x=48$","En":"$2x=48$"},{"Ar":"$x=24$","En":"$x=24$"}],"Substitution":{"Ar":"$x=24$","En":"$x=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24+25=49$","En":"$24+25=49$"},"CommonError":{"Ar":"23+24=47.","En":"23+24=47."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"23+24=47.","En":"23+24=47."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"25 هو العدد الأكبر.","En":"25 is the larger integer."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"26+27=53.","En":"26+27=53."},"Order":4}]}$mw$),
($mw$growth-v46-grade-7-inequality-boundary-order-inclusion-test-1$mw$,$mw$inequality-boundary-order-inclusion-test$mw$,$mw$number-line-solutions$mw$,$mw$grade-7$mw$,7,2,84,326,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":326,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار حدود متراجحة","En":"Checking an inequality boundary"},"Question":{"Ar":"أي متراجحة من الخيارات يقبل حلها العدد 4 ولا يقبل العدد 3؟","En":"Which inequality admits 4 as a solution but does not admit 3?"},"Options":[{"LatexCode":"x>4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستبعد 4.","En":"Excludes four."}},{"LatexCode":"x<4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستبعد 4 ويقبل 3.","En":"Excludes four and admits three."}},{"LatexCode":"x\\ge4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x\\ge3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يقبل العددين.","En":"Admits both values."}}],"Hints":[{"Ar":"هل الحد 4 مشمول أم مستبعد؟","En":"Is the endpoint four included or excluded?"},{"Ar":"اختبر 3 أيضاً.","En":"Test three as well."}],"Solution":{"Idea":{"Ar":"نختبر العددين في كل شرط، فنبحث عن شرط يشمل 4 ويستبعد 3.","En":"Test both values in each condition to find one including 4 and excluding 3."},"FormulaLatex":"4\\ge4,\\quad3<4","Steps":[{"Ar":"تتضمن المتراجحة x≥4 الحد 4.","En":"The inequality x≥4 includes its endpoint."},{"Ar":"العدد 3 أصغر من الحد فلا ينتمي للحلول.","En":"Three is below the bound and is excluded."}],"Substitution":{"Ar":"العدد 3 أصغر من الحد فلا ينتمي للحلول.","En":"Three is below the bound and is excluded."},"Result":{"Ar":"$x\\ge4$","En":"$x\\ge4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\ge4,\\quad3\\not\\ge4$","En":"$4\\ge4,\\quad3\\not\\ge4$"},"CommonError":{"Ar":"يستبعد 4.","En":"Excludes four."}}}$mw$::jsonb,$mw$نختبر العددين في كل شرط، فنبحث عن شرط يشمل 4 ويستبعد 3.

$4\ge4,\quad3<4$

1. تتضمن المتراجحة x≥4 الحد 4.

2. العدد 3 أصغر من الحد فلا ينتمي للحلول.

العدد 3 أصغر من الحد فلا ينتمي للحلول.

$x\ge4$

$4\ge4,\quad3\not\ge4$

يستبعد 4.$mw$,$mw$Test both values in each condition to find one including 4 and excluding 3.

$4\ge4,\quad3<4$

1. The inequality x≥4 includes its endpoint.

2. Three is below the bound and is excluded.

Three is below the bound and is excluded.

$x\ge4$

$4\ge4,\quad3\not\ge4$

Excludes four.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل الحد 4 مشمول أم مستبعد؟","En":"Is the endpoint four included or excluded?"},{"Ar":"اختبر 3 أيضاً.","En":"Test three as well."}],"Solution":{"Idea":{"Ar":"نختبر العددين في كل شرط، فنبحث عن شرط يشمل 4 ويستبعد 3.","En":"Test both values in each condition to find one including 4 and excluding 3."},"FormulaLatex":"4\\ge4,\\quad3<4","Steps":[{"Ar":"تتضمن المتراجحة x≥4 الحد 4.","En":"The inequality x≥4 includes its endpoint."},{"Ar":"العدد 3 أصغر من الحد فلا ينتمي للحلول.","En":"Three is below the bound and is excluded."}],"Substitution":{"Ar":"العدد 3 أصغر من الحد فلا ينتمي للحلول.","En":"Three is below the bound and is excluded."},"Result":{"Ar":"$x\\ge4$","En":"$x\\ge4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\ge4,\\quad3\\not\\ge4$","En":"$4\\ge4,\\quad3\\not\\ge4$"},"CommonError":{"Ar":"يستبعد 4.","En":"Excludes four."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يستبعد 4.","En":"Excludes four."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يستبعد 4 ويقبل 3.","En":"Excludes four and admits three."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يقبل العددين.","En":"Admits both values."},"Order":4}]}$mw$),
($mw$growth-v46-grade-7-probability-fair-game-compare-events-1$mw$,$mw$probability-fair-game-compare-events$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة فرص الفوز","En":"Comparing winning chances"},"Question":{"Ar":"على قرص بستة قطاعات متساوية مرقمة من 1 إلى 6، يفوز A إذا ظهر عدد أولي ويفوز B إذا ظهر عدد أكبر من 4. ما الفرق بين احتمالَي الفوز A وB؟","En":"On a spinner with six equal sectors numbered 1 to 6, A wins on a prime number and B wins on a number above 4. What is P(A)−P(B)?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد نتائج الحدثين مختلف.","En":"The favourable counts differ."}},{"LatexCode":"\\frac16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال B وحده.","En":"This is P(B) alone."}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال A وحده.","En":"This is P(A) alone."}}],"Hints":[{"Ar":"تذكر أن 1 ليس عدداً أولياً.","En":"Remember that one is not prime."},{"Ar":"قارن عدد النتائج الملائمة لكل حدث.","En":"Compare the favourable counts."}],"Solution":{"Idea":{"Ar":"نعد النتائج الملائمة لكل حدث ونقسم على ستة ثم نطرح.","En":"Count favourable outcomes for each event, divide by six, and subtract."},"FormulaLatex":"P(A)-P(B)=3/6-2/6","Steps":[{"Ar":"الأعداد الأولية 2 و3 و5، والأعداد الأكبر من 4 هي 5 و6.","En":"The primes are 2, 3, 5; the numbers above four are 5, 6."},{"Ar":"$3/6-2/6=1/6$","En":"$3/6-2/6=1/6$"}],"Substitution":{"Ar":"$3/6-2/6=1/6$","En":"$3/6-2/6=1/6$"},"Result":{"Ar":"$\\frac16$","En":"$\\frac16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2-1/3=1/6$","En":"$1/2-1/3=1/6$"},"CommonError":{"Ar":"عدد نتائج الحدثين مختلف.","En":"The favourable counts differ."}}}$mw$::jsonb,$mw$نعد النتائج الملائمة لكل حدث ونقسم على ستة ثم نطرح.

$P(A)-P(B)=3/6-2/6$

1. الأعداد الأولية 2 و3 و5، والأعداد الأكبر من 4 هي 5 و6.

2. $3/6-2/6=1/6$

$3/6-2/6=1/6$

$\frac16$

$1/2-1/3=1/6$

عدد نتائج الحدثين مختلف.$mw$,$mw$Count favourable outcomes for each event, divide by six, and subtract.

$P(A)-P(B)=3/6-2/6$

1. The primes are 2, 3, 5; the numbers above four are 5, 6.

2. $3/6-2/6=1/6$

$3/6-2/6=1/6$

$\frac16$

$1/2-1/3=1/6$

The favourable counts differ.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تذكر أن 1 ليس عدداً أولياً.","En":"Remember that one is not prime."},{"Ar":"قارن عدد النتائج الملائمة لكل حدث.","En":"Compare the favourable counts."}],"Solution":{"Idea":{"Ar":"نعد النتائج الملائمة لكل حدث ونقسم على ستة ثم نطرح.","En":"Count favourable outcomes for each event, divide by six, and subtract."},"FormulaLatex":"P(A)-P(B)=3/6-2/6","Steps":[{"Ar":"الأعداد الأولية 2 و3 و5، والأعداد الأكبر من 4 هي 5 و6.","En":"The primes are 2, 3, 5; the numbers above four are 5, 6."},{"Ar":"$3/6-2/6=1/6$","En":"$3/6-2/6=1/6$"}],"Substitution":{"Ar":"$3/6-2/6=1/6$","En":"$3/6-2/6=1/6$"},"Result":{"Ar":"$\\frac16$","En":"$\\frac16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2-1/3=1/6$","En":"$1/2-1/3=1/6$"},"CommonError":{"Ar":"عدد نتائج الحدثين مختلف.","En":"The favourable counts differ."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عدد نتائج الحدثين مختلف.","En":"The favourable counts differ."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال B وحده.","En":"This is P(B) alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال A وحده.","En":"This is P(A) alone."},"Order":4}]}$mw$),
($mw$growth-v46-grade-8-sample-space-branch-dependent-options-1$mw$,$mw$sample-space-branch-dependent-options$mw$,$mw$sample-spaces$mw$,$mw$grade-8$mw$,8,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"خيارات متفرعة غير متساوية","En":"Unequal branches of choices"},"Question":{"Ar":"يمكن اختيار المسار A أو B أو C. للمسار A خياران للنقل، وللمسار B أربعة خيارات، وللمسار C خيار واحد. يختار المسافر مساراً واحداً وطريقة نقل متاحة له. كم خطة مختلفة توجد؟","En":"A traveller chooses route A, B or C. Route A offers two transport options, B offers four, and C offers one. The traveller chooses one route and one available transport option for it. How many distinct plans exist?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل المسار C.","En":"Omits route C."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضرب 2 في 4 بدلاً من الجمع.","En":"Multiplies two and four instead of adding."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض أربعة خيارات لكل مسار.","En":"Assumes four choices per route."}}],"Hints":[{"Ar":"عدد خيارات النقل مختلف بين المسارات.","En":"Transport counts differ across routes."},{"Ar":"اجمع الخيارات ولا تضرب أعداد الفروع.","En":"Add rather than multiply the branch counts."}],"Solution":{"Idea":{"Ar":"نجمع عدد الخيارات في الفروع المنفصلة لأن المسافر يختار مساراً واحداً فقط.","En":"Add the choices on disjoint branches because exactly one route is selected."},"FormulaLatex":"2+4+1=7","Steps":[{"Ar":"للمسارين A وB ست خطط معاً.","En":"Routes A and B have six plans altogether."},{"Ar":"$6+1=7$","En":"$6+1=7$"}],"Substitution":{"Ar":"$6+1=7$","En":"$6+1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7-1=6$","En":"$7-1=6$"},"CommonError":{"Ar":"يهمل المسار C.","En":"Omits route C."}}}$mw$::jsonb,$mw$نجمع عدد الخيارات في الفروع المنفصلة لأن المسافر يختار مساراً واحداً فقط.

$2+4+1=7$

1. للمسارين A وB ست خطط معاً.

2. $6+1=7$

$6+1=7$

$7$

$7-1=6$

يهمل المسار C.$mw$,$mw$Add the choices on disjoint branches because exactly one route is selected.

$2+4+1=7$

1. Routes A and B have six plans altogether.

2. $6+1=7$

$6+1=7$

$7$

$7-1=6$

Omits route C.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عدد خيارات النقل مختلف بين المسارات.","En":"Transport counts differ across routes."},{"Ar":"اجمع الخيارات ولا تضرب أعداد الفروع.","En":"Add rather than multiply the branch counts."}],"Solution":{"Idea":{"Ar":"نجمع عدد الخيارات في الفروع المنفصلة لأن المسافر يختار مساراً واحداً فقط.","En":"Add the choices on disjoint branches because exactly one route is selected."},"FormulaLatex":"2+4+1=7","Steps":[{"Ar":"للمسارين A وB ست خطط معاً.","En":"Routes A and B have six plans altogether."},{"Ar":"$6+1=7$","En":"$6+1=7$"}],"Substitution":{"Ar":"$6+1=7$","En":"$6+1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7-1=6$","En":"$7-1=6$"},"CommonError":{"Ar":"يهمل المسار C.","En":"Omits route C."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يهمل المسار C.","En":"Omits route C."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يضرب 2 في 4 بدلاً من الجمع.","En":"Multiplies two and four instead of adding."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يفترض أربعة خيارات لكل مسار.","En":"Assumes four choices per route."},"Order":4}]}$mw$),
($mw$growth-v46-grade-9-inequality-parameter-matching-cutoff-1$mw$,$mw$inequality-parameter-matching-cutoff$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد ثابت متراجحة","En":"Determining an inequality constant"},"Question":{"Ar":"إذا كانت مجموعة حلول المتراجحة $3x+a\\le15$ هي بالضبط $x\\le4$، فما قيمة الثابت a؟","En":"If the solution set of $3x+a\\le15$ is exactly $x\\le4$, what is the constant a?"},"Options":[{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−3 يعطي الحد 6.","En":"−3 gives boundary six."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 هو حد الحل لا الثابت.","En":"Four is the solution bound, not the constant."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 قيمة 3x عند الحد.","En":"Twelve is 3x at the boundary."}}],"Hints":[{"Ar":"ما القيمة التي تقع عند حد الحل؟","En":"Which value is at the solution boundary?"},{"Ar":"عوّض بها في المساواة.","En":"Substitute it into the equality."}],"Solution":{"Idea":{"Ar":"عند الحد المشمول تكون المساواة صحيحة.","En":"At the included boundary, equality holds."},"FormulaLatex":"3\\cdot4+a=15","Steps":[{"Ar":"$12+a=15$","En":"$12+a=15$"},{"Ar":"$a=3$","En":"$a=3$"}],"Substitution":{"Ar":"$a=3$","En":"$a=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3x+3\\le15\\iff x\\le4$","En":"$3x+3\\le15\\iff x\\le4$"},"CommonError":{"Ar":"−3 يعطي الحد 6.","En":"−3 gives boundary six."}}}$mw$::jsonb,$mw$عند الحد المشمول تكون المساواة صحيحة.

$3\cdot4+a=15$

1. $12+a=15$

2. $a=3$

$a=3$

$3$

$3x+3\le15\iff x\le4$

−3 يعطي الحد 6.$mw$,$mw$At the included boundary, equality holds.

$3\cdot4+a=15$

1. $12+a=15$

2. $a=3$

$a=3$

$3$

$3x+3\le15\iff x\le4$

−3 gives boundary six.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما القيمة التي تقع عند حد الحل؟","En":"Which value is at the solution boundary?"},{"Ar":"عوّض بها في المساواة.","En":"Substitute it into the equality."}],"Solution":{"Idea":{"Ar":"عند الحد المشمول تكون المساواة صحيحة.","En":"At the included boundary, equality holds."},"FormulaLatex":"3\\cdot4+a=15","Steps":[{"Ar":"$12+a=15$","En":"$12+a=15$"},{"Ar":"$a=3$","En":"$a=3$"}],"Substitution":{"Ar":"$a=3$","En":"$a=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3x+3\\le15\\iff x\\le4$","En":"$3x+3\\le15\\iff x\\le4$"},"CommonError":{"Ar":"−3 يعطي الحد 6.","En":"−3 gives boundary six."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−3 يعطي الحد 6.","En":"−3 gives boundary six."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"4 هو حد الحل لا الثابت.","En":"Four is the solution bound, not the constant."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 قيمة 3x عند الحد.","En":"Twelve is 3x at the boundary."},"Order":4}]}$mw$),
($mw$growth-v46-grade-10-mean-frequency-unknown-count-1$mw$,$mw$mean-frequency-unknown-count$mw$,$mw$secondary-arithmetic-mean$mw$,$mw$grade-10$mw$,10,3,35,53,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":53,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تكرار مجهول من المتوسط","En":"Unknown frequency from a mean"},"Question":{"Ar":"تظهر القيمة 4 ثلاث مرات، وتظهر القيمة 10 عدداً مجهولاً n من المرات. إذا كان المتوسط الحسابي 8، فما n؟","En":"The value 4 occurs three times and the value 10 occurs an unknown number n of times. If the arithmetic mean is 8, find n."},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"n=2 يعطي متوسط 6.4.","En":"n=2 gives mean 6.4."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"n=3 يعطي متوسط 7.","En":"n=3 gives mean seven."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 قيمة 2n لا n.","En":"Twelve is 2n, not n."}}],"Hints":[{"Ar":"اكتب مجموع القيم بدلالة n.","En":"Write the sum of observations in terms of n."},{"Ar":"عدد القيم الكلي هو 3+n.","En":"The total count is 3+n."}],"Solution":{"Idea":{"Ar":"نكتب المتوسط موزوناً بالتكرار ثم نحل المعادلة.","En":"Write the frequency-weighted mean and solve the equation."},"FormulaLatex":"(12+10n)/(3+n)=8","Steps":[{"Ar":"$12+10n=24+8n$","En":"$12+10n=24+8n$"},{"Ar":"$2n=12\\Rightarrow n=6$","En":"$2n=12\\Rightarrow n=6$"}],"Substitution":{"Ar":"$2n=12\\Rightarrow n=6$","En":"$2n=12\\Rightarrow n=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(12+60)/9=8$","En":"$(12+60)/9=8$"},"CommonError":{"Ar":"n=2 يعطي متوسط 6.4.","En":"n=2 gives mean 6.4."}}}$mw$::jsonb,$mw$نكتب المتوسط موزوناً بالتكرار ثم نحل المعادلة.

$(12+10n)/(3+n)=8$

1. $12+10n=24+8n$

2. $2n=12\Rightarrow n=6$

$2n=12\Rightarrow n=6$

$6$

$(12+60)/9=8$

n=2 يعطي متوسط 6.4.$mw$,$mw$Write the frequency-weighted mean and solve the equation.

$(12+10n)/(3+n)=8$

1. $12+10n=24+8n$

2. $2n=12\Rightarrow n=6$

$2n=12\Rightarrow n=6$

$6$

$(12+60)/9=8$

n=2 gives mean 6.4.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب مجموع القيم بدلالة n.","En":"Write the sum of observations in terms of n."},{"Ar":"عدد القيم الكلي هو 3+n.","En":"The total count is 3+n."}],"Solution":{"Idea":{"Ar":"نكتب المتوسط موزوناً بالتكرار ثم نحل المعادلة.","En":"Write the frequency-weighted mean and solve the equation."},"FormulaLatex":"(12+10n)/(3+n)=8","Steps":[{"Ar":"$12+10n=24+8n$","En":"$12+10n=24+8n$"},{"Ar":"$2n=12\\Rightarrow n=6$","En":"$2n=12\\Rightarrow n=6$"}],"Substitution":{"Ar":"$2n=12\\Rightarrow n=6$","En":"$2n=12\\Rightarrow n=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(12+60)/9=8$","En":"$(12+60)/9=8$"},"CommonError":{"Ar":"n=2 يعطي متوسط 6.4.","En":"n=2 gives mean 6.4."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"n=2 يعطي متوسط 6.4.","En":"n=2 gives mean 6.4."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"n=3 يعطي متوسط 7.","En":"n=3 gives mean seven."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 قيمة 2n لا n.","En":"Twelve is 2n, not n."},"Order":4}]}$mw$),
($mw$growth-v46-grade-10-vector-closed-triangle-displacement-1$mw$,$mw$vector-closed-triangle-displacement$mw$,$mw$vector-components$mw$,$mw$grade-10$mw$,10,3,87,340,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":340,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إغلاق مسار متجهي","En":"Closing a vector path"},"Question":{"Ar":"يتحرك جسم بإزاحتين (3,−2) ثم (−1,5). ما متجه الإزاحة الثالثة التي تعيده إلى نقطة البداية؟","En":"An object moves by displacements (3,−2) and then (−1,5). What third displacement returns it to its starting point?"},"Options":[{"LatexCode":"(2,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المحصلة لا عكسها.","En":"This is the resultant, not its opposite."}},{"LatexCode":"(-2,-3)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(-4,7)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا لا يجعل المحصلة صفراً.","En":"This does not make the sum zero."}},{"LatexCode":"(4,-7)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا لا يعكس المحصلة الصحيحة.","En":"This does not reverse the correct resultant."}}],"Hints":[{"Ar":"اجمع الإزاحتين الأوليين.","En":"Add the first two displacements."},{"Ar":"اعكس اتجاه المحصلة.","En":"Reverse the resultant direction."}],"Solution":{"Idea":{"Ar":"مجموع إزاحات المسار المغلق متجه صفري.","En":"Displacements around a closed path sum to the zero vector."},"FormulaLatex":"w=-(u+v)","Steps":[{"Ar":"$u+v=(2,3)$","En":"$u+v=(2,3)$"},{"Ar":"$w=(-2,-3)$","En":"$w=(-2,-3)$"}],"Substitution":{"Ar":"$w=(-2,-3)$","En":"$w=(-2,-3)$"},"Result":{"Ar":"$(-2,-3)$","En":"$(-2,-3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(3,-2)+(-1,5)+(-2,-3)=(0,0)$","En":"$(3,-2)+(-1,5)+(-2,-3)=(0,0)$"},"CommonError":{"Ar":"هذه المحصلة لا عكسها.","En":"This is the resultant, not its opposite."}}}$mw$::jsonb,$mw$مجموع إزاحات المسار المغلق متجه صفري.

$w=-(u+v)$

1. $u+v=(2,3)$

2. $w=(-2,-3)$

$w=(-2,-3)$

$(-2,-3)$

$(3,-2)+(-1,5)+(-2,-3)=(0,0)$

هذه المحصلة لا عكسها.$mw$,$mw$Displacements around a closed path sum to the zero vector.

$w=-(u+v)$

1. $u+v=(2,3)$

2. $w=(-2,-3)$

$w=(-2,-3)$

$(-2,-3)$

$(3,-2)+(-1,5)+(-2,-3)=(0,0)$

This is the resultant, not its opposite.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع الإزاحتين الأوليين.","En":"Add the first two displacements."},{"Ar":"اعكس اتجاه المحصلة.","En":"Reverse the resultant direction."}],"Solution":{"Idea":{"Ar":"مجموع إزاحات المسار المغلق متجه صفري.","En":"Displacements around a closed path sum to the zero vector."},"FormulaLatex":"w=-(u+v)","Steps":[{"Ar":"$u+v=(2,3)$","En":"$u+v=(2,3)$"},{"Ar":"$w=(-2,-3)$","En":"$w=(-2,-3)$"}],"Substitution":{"Ar":"$w=(-2,-3)$","En":"$w=(-2,-3)$"},"Result":{"Ar":"$(-2,-3)$","En":"$(-2,-3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(3,-2)+(-1,5)+(-2,-3)=(0,0)$","En":"$(3,-2)+(-1,5)+(-2,-3)=(0,0)$"},"CommonError":{"Ar":"هذه المحصلة لا عكسها.","En":"This is the resultant, not its opposite."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه المحصلة لا عكسها.","En":"This is the resultant, not its opposite."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا لا يجعل المحصلة صفراً.","En":"This does not make the sum zero."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا لا يعكس المحصلة الصحيحة.","En":"This does not reverse the correct resultant."},"Order":4}]}$mw$),
($mw$growth-v46-grade-11-trig-equal-squares-derive-absolute-value-1$mw$,$mw$trig-equal-squares-derive-absolute-value$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-11$mw$,11,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تساوي مربعي النسب","En":"Equal squared trigonometric ratios"},"Question":{"Ar":"إذا كان $\\sin^2\\theta=\\cos^2\\theta$، فما القيمة الدقيقة لـ $|\\sin\\theta|$؟","En":"If $\\sin^2\\theta=\\cos^2\\theta$, what is the exact value of $|\\sin\\theta|$?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الصفر يجعل مجموع المربعين صفراً.","En":"Zero makes the sum of squares zero."}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع الجيب، لا قيمته المطلقة.","En":"This is sine squared, not its absolute value."}},{"LatexCode":"\\frac{\\sqrt2}{2}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يجعل مجموع المربعين اثنين.","En":"This makes the sum of squares two."}}],"Hints":[{"Ar":"استبدل مربع جيب التمام بمربع الجيب.","En":"Replace cosine squared by sine squared."},{"Ar":"خذ الجذر غير السالب.","En":"Take the nonnegative square root."}],"Solution":{"Idea":{"Ar":"المربعان متساويان ومجموعهما واحد، لذا يساوي كل منهما نصفاً.","En":"The squares are equal and sum to one, so each is one half."},"FormulaLatex":"2\\sin^2\\theta=1","Steps":[{"Ar":"$\\sin^2\\theta=1/2$","En":"$\\sin^2\\theta=1/2$"},{"Ar":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$","En":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$"}],"Substitution":{"Ar":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$","En":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$"},"Result":{"Ar":"$\\frac{\\sqrt2}{2}$","En":"$\\frac{\\sqrt2}{2}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(\\sqrt2/2)^2=1$","En":"$2(\\sqrt2/2)^2=1$"},"CommonError":{"Ar":"الصفر يجعل مجموع المربعين صفراً.","En":"Zero makes the sum of squares zero."}}}$mw$::jsonb,$mw$المربعان متساويان ومجموعهما واحد، لذا يساوي كل منهما نصفاً.

$2\sin^2\theta=1$

1. $\sin^2\theta=1/2$

2. $|\sin\theta|=\sqrt{1/2}=\sqrt2/2$

$|\sin\theta|=\sqrt{1/2}=\sqrt2/2$

$\frac{\sqrt2}{2}$

$2(\sqrt2/2)^2=1$

الصفر يجعل مجموع المربعين صفراً.$mw$,$mw$The squares are equal and sum to one, so each is one half.

$2\sin^2\theta=1$

1. $\sin^2\theta=1/2$

2. $|\sin\theta|=\sqrt{1/2}=\sqrt2/2$

$|\sin\theta|=\sqrt{1/2}=\sqrt2/2$

$\frac{\sqrt2}{2}$

$2(\sqrt2/2)^2=1$

Zero makes the sum of squares zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبدل مربع جيب التمام بمربع الجيب.","En":"Replace cosine squared by sine squared."},{"Ar":"خذ الجذر غير السالب.","En":"Take the nonnegative square root."}],"Solution":{"Idea":{"Ar":"المربعان متساويان ومجموعهما واحد، لذا يساوي كل منهما نصفاً.","En":"The squares are equal and sum to one, so each is one half."},"FormulaLatex":"2\\sin^2\\theta=1","Steps":[{"Ar":"$\\sin^2\\theta=1/2$","En":"$\\sin^2\\theta=1/2$"},{"Ar":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$","En":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$"}],"Substitution":{"Ar":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$","En":"$|\\sin\\theta|=\\sqrt{1/2}=\\sqrt2/2$"},"Result":{"Ar":"$\\frac{\\sqrt2}{2}$","En":"$\\frac{\\sqrt2}{2}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(\\sqrt2/2)^2=1$","En":"$2(\\sqrt2/2)^2=1$"},"CommonError":{"Ar":"الصفر يجعل مجموع المربعين صفراً.","En":"Zero makes the sum of squares zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الصفر يجعل مجموع المربعين صفراً.","En":"Zero makes the sum of squares zero."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع الجيب، لا قيمته المطلقة.","En":"This is sine squared, not its absolute value."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يجعل مجموع المربعين اثنين.","En":"This makes the sum of squares two."},"Order":4}]}$mw$),
($mw$growth-v46-grade-11-vector-unit-vector-opposite-direction-1$mw$,$mw$vector-unit-vector-opposite-direction$mw$,$mw$magnitude$mw$,$mw$grade-11$mw$,11,3,87,339,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":339,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متجه وحدة بالاتجاه المعاكس","En":"Unit vector in the opposite direction"},"Question":{"Ar":"أي متجه وحدة له الاتجاه المعاكس للمتجه (−8,6)؟","En":"Which unit vector points opposite to the vector (−8,6)?"},"Options":[{"LatexCode":"(-4/5,3/5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"له اتجاه المتجه الأصلي.","En":"Points in the original direction."}},{"LatexCode":"(4/5,-3/5)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(8,-6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"معياره 10 وليس واحداً.","En":"Has norm ten, not one."}},{"LatexCode":"(3/5,4/5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا متجه متعامد لا معاكس.","En":"This is perpendicular, not opposite."}}],"Hints":[{"Ar":"احسب معيار المتجه المعطى.","En":"Find the original norm."},{"Ar":"اعكس الإشارتين واقسم على المعيار.","En":"Reverse both signs and divide by the norm."}],"Solution":{"Idea":{"Ar":"نعكس المتجه ونقسم مركبتيه على معياره.","En":"Negate the vector and divide its components by its norm."},"FormulaLatex":"w=-u/\\|u\\|","Steps":[{"Ar":"$\\|u\\|=\\sqrt{64+36}=10$","En":"$\\|u\\|=\\sqrt{64+36}=10$"},{"Ar":"$w=(8/10,-6/10)=(4/5,-3/5)$","En":"$w=(8/10,-6/10)=(4/5,-3/5)$"}],"Substitution":{"Ar":"$w=(8/10,-6/10)=(4/5,-3/5)$","En":"$w=(8/10,-6/10)=(4/5,-3/5)$"},"Result":{"Ar":"$(4/5,-3/5)$","En":"$(4/5,-3/5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(4/5)^2+(-3/5)^2=1$","En":"$(4/5)^2+(-3/5)^2=1$"},"CommonError":{"Ar":"له اتجاه المتجه الأصلي.","En":"Points in the original direction."}}}$mw$::jsonb,$mw$نعكس المتجه ونقسم مركبتيه على معياره.

$w=-u/\|u\|$

1. $\|u\|=\sqrt{64+36}=10$

2. $w=(8/10,-6/10)=(4/5,-3/5)$

$w=(8/10,-6/10)=(4/5,-3/5)$

$(4/5,-3/5)$

$(4/5)^2+(-3/5)^2=1$

له اتجاه المتجه الأصلي.$mw$,$mw$Negate the vector and divide its components by its norm.

$w=-u/\|u\|$

1. $\|u\|=\sqrt{64+36}=10$

2. $w=(8/10,-6/10)=(4/5,-3/5)$

$w=(8/10,-6/10)=(4/5,-3/5)$

$(4/5,-3/5)$

$(4/5)^2+(-3/5)^2=1$

Points in the original direction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب معيار المتجه المعطى.","En":"Find the original norm."},{"Ar":"اعكس الإشارتين واقسم على المعيار.","En":"Reverse both signs and divide by the norm."}],"Solution":{"Idea":{"Ar":"نعكس المتجه ونقسم مركبتيه على معياره.","En":"Negate the vector and divide its components by its norm."},"FormulaLatex":"w=-u/\\|u\\|","Steps":[{"Ar":"$\\|u\\|=\\sqrt{64+36}=10$","En":"$\\|u\\|=\\sqrt{64+36}=10$"},{"Ar":"$w=(8/10,-6/10)=(4/5,-3/5)$","En":"$w=(8/10,-6/10)=(4/5,-3/5)$"}],"Substitution":{"Ar":"$w=(8/10,-6/10)=(4/5,-3/5)$","En":"$w=(8/10,-6/10)=(4/5,-3/5)$"},"Result":{"Ar":"$(4/5,-3/5)$","En":"$(4/5,-3/5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(4/5)^2+(-3/5)^2=1$","En":"$(4/5)^2+(-3/5)^2=1$"},"CommonError":{"Ar":"له اتجاه المتجه الأصلي.","En":"Points in the original direction."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"له اتجاه المتجه الأصلي.","En":"Points in the original direction."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"معياره 10 وليس واحداً.","En":"Has norm ten, not one."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا متجه متعامد لا معاكس.","En":"This is perpendicular, not opposite."},"Order":4}]}$mw$),
($mw$growth-v46-grade-12-dot-product-projection-prescribed-unknown-component-1$mw$,$mw$dot-product-projection-prescribed-unknown-component$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مركبة مجهولة من إسقاط موقّع","En":"Unknown component from signed projection"},"Question":{"Ar":"المتجه u=(a,4) والمتجه v=(3,4). إذا كان الإسقاط القياسي الموقّع لـ u على اتجاه v يساوي 5، فما a؟","En":"Vectors are u=(a,4) and v=(3,4). If the signed scalar projection of u onto the direction of v is 5, what is a?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"a=1 يعطي 19/5.","En":"a=1 gives 19/5."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"a=5 يعطي 31/5.","En":"a=5 gives 31/5."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 قيمة 3a لا a.","En":"Nine is 3a, not a."}}],"Hints":[{"Ar":"احسب معيار v.","En":"Find the norm of v."},{"Ar":"ساوِ نسبة الضرب القياسي إلى المعيار بالعدد 5.","En":"Set the dot product divided by the norm equal to five."}],"Solution":{"Idea":{"Ar":"الإسقاط القياسي الموقّع هو الضرب القياسي مقسوماً على معيار متجه الاتجاه.","En":"Signed scalar projection equals the dot product divided by the direction vector's norm."},"FormulaLatex":"(u\\cdot v)/\\|v\\|=(3a+16)/5","Steps":[{"Ar":"$(3a+16)/5=5$","En":"$(3a+16)/5=5$"},{"Ar":"$3a=9\\Rightarrow a=3$","En":"$3a=9\\Rightarrow a=3$"}],"Substitution":{"Ar":"$3a=9\\Rightarrow a=3$","En":"$3a=9\\Rightarrow a=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(9+16)/5=5$","En":"$(9+16)/5=5$"},"CommonError":{"Ar":"a=1 يعطي 19/5.","En":"a=1 gives 19/5."}}}$mw$::jsonb,$mw$الإسقاط القياسي الموقّع هو الضرب القياسي مقسوماً على معيار متجه الاتجاه.

$(u\cdot v)/\|v\|=(3a+16)/5$

1. $(3a+16)/5=5$

2. $3a=9\Rightarrow a=3$

$3a=9\Rightarrow a=3$

$3$

$(9+16)/5=5$

a=1 يعطي 19/5.$mw$,$mw$Signed scalar projection equals the dot product divided by the direction vector's norm.

$(u\cdot v)/\|v\|=(3a+16)/5$

1. $(3a+16)/5=5$

2. $3a=9\Rightarrow a=3$

$3a=9\Rightarrow a=3$

$3$

$(9+16)/5=5$

a=1 gives 19/5.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب معيار v.","En":"Find the norm of v."},{"Ar":"ساوِ نسبة الضرب القياسي إلى المعيار بالعدد 5.","En":"Set the dot product divided by the norm equal to five."}],"Solution":{"Idea":{"Ar":"الإسقاط القياسي الموقّع هو الضرب القياسي مقسوماً على معيار متجه الاتجاه.","En":"Signed scalar projection equals the dot product divided by the direction vector's norm."},"FormulaLatex":"(u\\cdot v)/\\|v\\|=(3a+16)/5","Steps":[{"Ar":"$(3a+16)/5=5$","En":"$(3a+16)/5=5$"},{"Ar":"$3a=9\\Rightarrow a=3$","En":"$3a=9\\Rightarrow a=3$"}],"Substitution":{"Ar":"$3a=9\\Rightarrow a=3$","En":"$3a=9\\Rightarrow a=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(9+16)/5=5$","En":"$(9+16)/5=5$"},"CommonError":{"Ar":"a=1 يعطي 19/5.","En":"a=1 gives 19/5."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"a=1 يعطي 19/5.","En":"a=1 gives 19/5."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"a=5 يعطي 31/5.","En":"a=5 gives 31/5."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"9 قيمة 3a لا a.","En":"Nine is 3a, not a."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v46 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
