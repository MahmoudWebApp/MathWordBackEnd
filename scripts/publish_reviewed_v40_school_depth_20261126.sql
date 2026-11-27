-- One-time owner-authorized v40 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v40-grade-3-time-half-hour-intervals-1$mw$,$mw$time-half-hour-intervals$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"وحدات نصف الساعة","En":"Half-hour intervals"},"Question":{"Ar":"كم فترة كاملة طول كل منها نصف ساعة توجد في ساعتين ونصف؟","En":"How many complete half-hour intervals are there in two and a half hours?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يقل عن الفترات في ساعتين وحدهما.","En":"3 is fewer than the intervals in two hours alone."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يهمل نصف الساعة الأخير.","En":"4 omits the last half-hour."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يعادل ثلاث ساعات.","En":"6 corresponds to three hours."}}],"Hints":[{"Ar":"كم نصف ساعة في الساعة الواحدة؟","En":"How many half-hours are in one hour?"},{"Ar":"أضف نصف الساعة الأخيرة.","En":"Add the final half-hour."}],"Solution":{"Idea":{"Ar":"كل ساعة تحتوي فترتين من نصف ساعة.","En":"Each hour contains two half-hour intervals."},"FormulaLatex":"2\\cdot2+1=5","Steps":[{"Ar":"في ساعتين أربع فترات.","En":"Two hours contain four intervals."},{"Ar":"$4+1=5$","En":"$4+1=5$"}],"Substitution":{"Ar":"$4+1=5$","En":"$4+1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot30=150$","En":"$5\\cdot30=150$"},"CommonError":{"Ar":"3 يقل عن الفترات في ساعتين وحدهما.","En":"3 is fewer than the intervals in two hours alone."}}}$mw$::jsonb,$mw$كل ساعة تحتوي فترتين من نصف ساعة.

$2\cdot2+1=5$

1. في ساعتين أربع فترات.

2. $4+1=5$

$4+1=5$

$5$

$5\cdot30=150$

3 يقل عن الفترات في ساعتين وحدهما.$mw$,$mw$Each hour contains two half-hour intervals.

$2\cdot2+1=5$

1. Two hours contain four intervals.

2. $4+1=5$

$4+1=5$

$5$

$5\cdot30=150$

3 is fewer than the intervals in two hours alone.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم نصف ساعة في الساعة الواحدة؟","En":"How many half-hours are in one hour?"},{"Ar":"أضف نصف الساعة الأخيرة.","En":"Add the final half-hour."}],"Solution":{"Idea":{"Ar":"كل ساعة تحتوي فترتين من نصف ساعة.","En":"Each hour contains two half-hour intervals."},"FormulaLatex":"2\\cdot2+1=5","Steps":[{"Ar":"في ساعتين أربع فترات.","En":"Two hours contain four intervals."},{"Ar":"$4+1=5$","En":"$4+1=5$"}],"Substitution":{"Ar":"$4+1=5$","En":"$4+1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot30=150$","En":"$5\\cdot30=150$"},"CommonError":{"Ar":"3 يقل عن الفترات في ساعتين وحدهما.","En":"3 is fewer than the intervals in two hours alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 يقل عن الفترات في ساعتين وحدهما.","En":"3 is fewer than the intervals in two hours alone."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 يهمل نصف الساعة الأخير.","En":"4 omits the last half-hour."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"6 يعادل ثلاث ساعات.","En":"6 corresponds to three hours."},"Order":4}]}$mw$),
($mw$growth-v40-grade-4-equation-solution-after-coefficient-change-1$mw$,$mw$equation-solution-after-coefficient-change$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير الحل عند مضاعفة المعامل","En":"Solution after doubling the coefficient"},"Question":{"Ar":"للمعادلة 3x=24 حل. إذا استبدلنا 3 بالعدد 6 وبقي الطرف الأيمن 24، فما الحل الجديد؟","En":"The equation 3x=24 has a solution. If 3 is replaced by 6 and the right side stays 24, what is the new solution?"},"Options":[{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 حل المعادلة الأصلية.","En":"8 solves the original equation."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"16 يضاعف الحل بدلاً من تنصيفه.","En":"16 doubles rather than halves the solution."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18 ينتج من الطرح.","En":"18 comes from subtraction."}}],"Hints":[{"Ar":"اكتب المعادلة الجديدة.","En":"Write the new equation."},{"Ar":"اقسم 24 على 6.","En":"Divide 24 by 6."}],"Solution":{"Idea":{"Ar":"نقسم الناتج الثابت على المعامل الجديد.","En":"Divide the unchanged product by the new coefficient."},"FormulaLatex":"x=24/6","Steps":[{"Ar":"$6x=24$","En":"$6x=24$"},{"Ar":"$x=4$","En":"$x=4$"}],"Substitution":{"Ar":"$x=4$","En":"$x=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot4=24$","En":"$6\\cdot4=24$"},"CommonError":{"Ar":"8 حل المعادلة الأصلية.","En":"8 solves the original equation."}}}$mw$::jsonb,$mw$نقسم الناتج الثابت على المعامل الجديد.

$x=24/6$

1. $6x=24$

2. $x=4$

$x=4$

$4$

$6\cdot4=24$

8 حل المعادلة الأصلية.$mw$,$mw$Divide the unchanged product by the new coefficient.

$x=24/6$

1. $6x=24$

2. $x=4$

$x=4$

$4$

$6\cdot4=24$

8 solves the original equation.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب المعادلة الجديدة.","En":"Write the new equation."},{"Ar":"اقسم 24 على 6.","En":"Divide 24 by 6."}],"Solution":{"Idea":{"Ar":"نقسم الناتج الثابت على المعامل الجديد.","En":"Divide the unchanged product by the new coefficient."},"FormulaLatex":"x=24/6","Steps":[{"Ar":"$6x=24$","En":"$6x=24$"},{"Ar":"$x=4$","En":"$x=4$"}],"Substitution":{"Ar":"$x=4$","En":"$x=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot4=24$","En":"$6\\cdot4=24$"},"CommonError":{"Ar":"8 حل المعادلة الأصلية.","En":"8 solves the original equation."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8 حل المعادلة الأصلية.","En":"8 solves the original equation."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"16 يضاعف الحل بدلاً من تنصيفه.","En":"16 doubles rather than halves the solution."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"18 ينتج من الطرح.","En":"18 comes from subtraction."},"Order":4}]}$mw$),
($mw$growth-v40-grade-4-length-millimeter-centimeter-equivalence-1$mw$,$mw$length-millimeter-centimeter-equivalence$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحويل السنتيمترات والمليمترات","En":"Centimetres and millimetres"},"Question":{"Ar":"أي طول يساوي 68 ملم بالضبط؟","En":"Which length is exactly equal to 68 mm?"},"Options":[{"LatexCode":"6\\mathrm{\\ cm}+8\\mathrm{\\ mm}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6\\mathrm{\\ cm}+80\\mathrm{\\ mm}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي 140 ملم.","En":"This equals 140 mm."}},{"LatexCode":"8\\mathrm{\\ cm}+6\\mathrm{\\ mm}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي 86 ملم.","En":"This equals 86 mm."}},{"LatexCode":"68\\mathrm{\\ cm}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي 680 ملم.","En":"This equals 680 mm."}}],"Hints":[{"Ar":"قسّم 68 إلى عشرات وآحاد.","En":"Separate 68 into tens and ones."},{"Ar":"كل عشرة مليمترات تعادل سنتيمتراً.","En":"Every ten millimetres equal one centimetre."}],"Solution":{"Idea":{"Ar":"كل سنتيمتر يساوي عشرة مليمترات.","En":"Each centimetre equals ten millimetres."},"FormulaLatex":"68=6\\cdot10+8","Steps":[{"Ar":"$6\\cdot10=60$","En":"$6\\cdot10=60$"},{"Ar":"$60+8=68$","En":"$60+8=68$"}],"Substitution":{"Ar":"$60+8=68$","En":"$60+8=68$"},"Result":{"Ar":"$6\\mathrm{\\ cm}+8\\mathrm{\\ mm}$","En":"$6\\mathrm{\\ cm}+8\\mathrm{\\ mm}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$68/10=6.8$","En":"$68/10=6.8$"},"CommonError":{"Ar":"هذا يساوي 140 ملم.","En":"This equals 140 mm."}}}$mw$::jsonb,$mw$كل سنتيمتر يساوي عشرة مليمترات.

$68=6\cdot10+8$

1. $6\cdot10=60$

2. $60+8=68$

$60+8=68$

$6\mathrm{\ cm}+8\mathrm{\ mm}$

$68/10=6.8$

هذا يساوي 140 ملم.$mw$,$mw$Each centimetre equals ten millimetres.

$68=6\cdot10+8$

1. $6\cdot10=60$

2. $60+8=68$

$60+8=68$

$6\mathrm{\ cm}+8\mathrm{\ mm}$

$68/10=6.8$

This equals 140 mm.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قسّم 68 إلى عشرات وآحاد.","En":"Separate 68 into tens and ones."},{"Ar":"كل عشرة مليمترات تعادل سنتيمتراً.","En":"Every ten millimetres equal one centimetre."}],"Solution":{"Idea":{"Ar":"كل سنتيمتر يساوي عشرة مليمترات.","En":"Each centimetre equals ten millimetres."},"FormulaLatex":"68=6\\cdot10+8","Steps":[{"Ar":"$6\\cdot10=60$","En":"$6\\cdot10=60$"},{"Ar":"$60+8=68$","En":"$60+8=68$"}],"Substitution":{"Ar":"$60+8=68$","En":"$60+8=68$"},"Result":{"Ar":"$6\\mathrm{\\ cm}+8\\mathrm{\\ mm}$","En":"$6\\mathrm{\\ cm}+8\\mathrm{\\ mm}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$68/10=6.8$","En":"$68/10=6.8$"},"CommonError":{"Ar":"هذا يساوي 140 ملم.","En":"This equals 140 mm."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي 140 ملم.","En":"This equals 140 mm."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي 86 ملم.","En":"This equals 86 mm."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي 680 ملم.","En":"This equals 680 mm."},"Order":4}]}$mw$),
($mw$growth-v40-grade-5-estimate-choose-closest-compatible-quotient-1$mw$,$mw$estimate-choose-closest-compatible-quotient$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار تقدير معقول للقسمة","En":"Choosing a reasonable quotient estimate"},"Question":{"Ar":"نريد تقدير 612÷29. أي تعبير هو الأنسب إذا قرّبنا 612 إلى أقرب مئة و29 إلى أقرب عشرة؟","En":"To estimate 612÷29, which expression is appropriate if 612 is rounded to the nearest hundred and 29 to the nearest ten?"},"Options":[{"LatexCode":"600/20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"29 أقرب إلى 30.","En":"29 is closer to 30."}},{"LatexCode":"600/30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"700/30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"612 أقرب إلى 600.","En":"612 is closer to 600."}},{"LatexCode":"610/30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"610 تقريب لأقرب عشرة لا مئة.","En":"610 is rounded to tens, not hundreds."}}],"Hints":[{"Ar":"قرّب المقسوم لأقرب مئة.","En":"Round the dividend to the nearest hundred."},{"Ar":"قرّب المقسوم عليه لأقرب عشرة.","En":"Round the divisor to the nearest ten."}],"Solution":{"Idea":{"Ar":"نتبع دقة التقريب المحددة لكل عدد على حدة.","En":"Follow the specified rounding precision for each number."},"FormulaLatex":"600/30","Steps":[{"Ar":"$612\\to600$","En":"$612\\to600$"},{"Ar":"$29\\to30$","En":"$29\\to30$"},{"Ar":"$600/30=20$","En":"$600/30=20$"}],"Substitution":{"Ar":"$600/30=20$","En":"$600/30=20$"},"Result":{"Ar":"$600/30$","En":"$600/30$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$30\\cdot20=600$","En":"$30\\cdot20=600$"},"CommonError":{"Ar":"29 أقرب إلى 30.","En":"29 is closer to 30."}}}$mw$::jsonb,$mw$نتبع دقة التقريب المحددة لكل عدد على حدة.

$600/30$

1. $612\to600$

2. $29\to30$

3. $600/30=20$

$600/30=20$

$600/30$

$30\cdot20=600$

29 أقرب إلى 30.$mw$,$mw$Follow the specified rounding precision for each number.

$600/30$

1. $612\to600$

2. $29\to30$

3. $600/30=20$

$600/30=20$

$600/30$

$30\cdot20=600$

29 is closer to 30.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قرّب المقسوم لأقرب مئة.","En":"Round the dividend to the nearest hundred."},{"Ar":"قرّب المقسوم عليه لأقرب عشرة.","En":"Round the divisor to the nearest ten."}],"Solution":{"Idea":{"Ar":"نتبع دقة التقريب المحددة لكل عدد على حدة.","En":"Follow the specified rounding precision for each number."},"FormulaLatex":"600/30","Steps":[{"Ar":"$612\\to600$","En":"$612\\to600$"},{"Ar":"$29\\to30$","En":"$29\\to30$"},{"Ar":"$600/30=20$","En":"$600/30=20$"}],"Substitution":{"Ar":"$600/30=20$","En":"$600/30=20$"},"Result":{"Ar":"$600/30$","En":"$600/30$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$30\\cdot20=600$","En":"$30\\cdot20=600$"},"CommonError":{"Ar":"29 أقرب إلى 30.","En":"29 is closer to 30."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"29 أقرب إلى 30.","En":"29 is closer to 30."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"612 أقرب إلى 600.","En":"612 is closer to 600."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"610 تقريب لأقرب عشرة لا مئة.","En":"610 is rounded to tens, not hundreds."},"Order":4}]}$mw$),
($mw$growth-v40-grade-6-triangle-area-exterior-height-selection-1$mw$,$mw$triangle-area-exterior-height-selection$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الارتفاع الموافق للقاعدة","En":"Height corresponding to a base"},"Question":{"Ar":"في مثلث منفرج الزاوية طول قاعدته 9 سم، وطول الضلع المائل 10 سم، والمسافة العمودية من الرأس إلى امتداد القاعدة 4 سم. ما المساحة؟","En":"An obtuse triangle has base 9 cm, a slanted side 10 cm, and perpendicular distance from its opposite vertex to the extended base 4 cm. What is its area?"},"Options":[{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 يستعمل الضلع المائل بدل القاعدة.","En":"20 uses the slanted side instead of the base."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"36 يهمل النصف.","En":"36 omits the half."}},{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"45 يستعمل الضلع المائل كارتفاع.","En":"45 uses the slanted side as height."}}],"Hints":[{"Ar":"اختر المسافة العمودية لا الضلع المائل.","En":"Choose the perpendicular distance, not the slanted side."},{"Ar":"اضرب القاعدة في الارتفاع واقسم على 2.","En":"Multiply base by height and divide by two."}],"Solution":{"Idea":{"Ar":"الارتفاع هو المسافة العمودية إلى خط القاعدة ولو وقع خارج المثلث.","En":"The height is the perpendicular distance to the base line even when outside the triangle."},"FormulaLatex":"A=\\frac12 bh","Steps":[{"Ar":"$b=9,\\quad h=4$","En":"$b=9,\\quad h=4$"},{"Ar":"$A=9\\cdot4/2=18$","En":"$A=9\\cdot4/2=18$"}],"Substitution":{"Ar":"$A=9\\cdot4/2=18$","En":"$A=9\\cdot4/2=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$2\\cdot18/9=4$","En":"$2\\cdot18/9=4$"},"CommonError":{"Ar":"20 يستعمل الضلع المائل بدل القاعدة.","En":"20 uses the slanted side instead of the base."}}}$mw$::jsonb,$mw$الارتفاع هو المسافة العمودية إلى خط القاعدة ولو وقع خارج المثلث.

$A=\frac12 bh$

1. $b=9,\quad h=4$

2. $A=9\cdot4/2=18$

$A=9\cdot4/2=18$

$18$ سم²

$2\cdot18/9=4$

20 يستعمل الضلع المائل بدل القاعدة.$mw$,$mw$The height is the perpendicular distance to the base line even when outside the triangle.

$A=\frac12 bh$

1. $b=9,\quad h=4$

2. $A=9\cdot4/2=18$

$A=9\cdot4/2=18$

$18$ cm²

$2\cdot18/9=4$

20 uses the slanted side instead of the base.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اختر المسافة العمودية لا الضلع المائل.","En":"Choose the perpendicular distance, not the slanted side."},{"Ar":"اضرب القاعدة في الارتفاع واقسم على 2.","En":"Multiply base by height and divide by two."}],"Solution":{"Idea":{"Ar":"الارتفاع هو المسافة العمودية إلى خط القاعدة ولو وقع خارج المثلث.","En":"The height is the perpendicular distance to the base line even when outside the triangle."},"FormulaLatex":"A=\\frac12 bh","Steps":[{"Ar":"$b=9,\\quad h=4$","En":"$b=9,\\quad h=4$"},{"Ar":"$A=9\\cdot4/2=18$","En":"$A=9\\cdot4/2=18$"}],"Substitution":{"Ar":"$A=9\\cdot4/2=18$","En":"$A=9\\cdot4/2=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$2\\cdot18/9=4$","En":"$2\\cdot18/9=4$"},"CommonError":{"Ar":"20 يستعمل الضلع المائل بدل القاعدة.","En":"20 uses the slanted side instead of the base."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"20 يستعمل الضلع المائل بدل القاعدة.","En":"20 uses the slanted side instead of the base."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"36 يهمل النصف.","En":"36 omits the half."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"45 يستعمل الضلع المائل كارتفاع.","En":"45 uses the slanted side as height."},"Order":4}]}$mw$),
($mw$growth-v40-grade-6-signed-rational-order-mixed-notation-1$mw$,$mw$signed-rational-order-mixed-notation$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,345,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":345,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب أعداد سالبة بتمثيلات مختلفة","En":"Ordering negative numbers in mixed notation"},"Question":{"Ar":"أي عدد هو الأصغر: −0.6، −3/4، −0.5، −1/4؟","En":"Which number is smallest: −0.6, −3/4, −0.5, −1/4?"},"Options":[{"LatexCode":"-0.6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−0.6 أكبر من −0.75.","En":"−0.6 is greater than −0.75."}},{"LatexCode":"-\\frac34","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-0.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−0.5 أكبر من −0.75.","En":"−0.5 is greater than −0.75."}},{"LatexCode":"-\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−0.25 أقرب للصفر.","En":"−0.25 is closer to zero."}}],"Hints":[{"Ar":"حوّل الكسرين إلى عشريين.","En":"Convert the fractions to decimals."},{"Ar":"الأصغر يقع أقصى اليسار.","En":"The smallest lies farthest left."}],"Solution":{"Idea":{"Ar":"نوحّد التمثيل ثم نقارن؛ العدد السالب الأبعد عن الصفر هو الأصغر.","En":"Use a common representation; the negative number farther from zero is smaller."},"FormulaLatex":" -0.75<-0.6<-0.5<-0.25","Steps":[{"Ar":"$-3/4=-0.75$","En":"$-3/4=-0.75$"},{"Ar":"$-1/4=-0.25$","En":"$-1/4=-0.25$"}],"Substitution":{"Ar":"$-1/4=-0.25$","En":"$-1/4=-0.25$"},"Result":{"Ar":"$-\\frac34$","En":"$-\\frac34$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-0.75<-0.6$","En":"$-0.75<-0.6$"},"CommonError":{"Ar":"−0.6 أكبر من −0.75.","En":"−0.6 is greater than −0.75."}}}$mw$::jsonb,$mw$نوحّد التمثيل ثم نقارن؛ العدد السالب الأبعد عن الصفر هو الأصغر.

$ -0.75<-0.6<-0.5<-0.25$

1. $-3/4=-0.75$

2. $-1/4=-0.25$

$-1/4=-0.25$

$-\frac34$

$-0.75<-0.6$

−0.6 أكبر من −0.75.$mw$,$mw$Use a common representation; the negative number farther from zero is smaller.

$ -0.75<-0.6<-0.5<-0.25$

1. $-3/4=-0.75$

2. $-1/4=-0.25$

$-1/4=-0.25$

$-\frac34$

$-0.75<-0.6$

−0.6 is greater than −0.75.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الكسرين إلى عشريين.","En":"Convert the fractions to decimals."},{"Ar":"الأصغر يقع أقصى اليسار.","En":"The smallest lies farthest left."}],"Solution":{"Idea":{"Ar":"نوحّد التمثيل ثم نقارن؛ العدد السالب الأبعد عن الصفر هو الأصغر.","En":"Use a common representation; the negative number farther from zero is smaller."},"FormulaLatex":" -0.75<-0.6<-0.5<-0.25","Steps":[{"Ar":"$-3/4=-0.75$","En":"$-3/4=-0.75$"},{"Ar":"$-1/4=-0.25$","En":"$-1/4=-0.25$"}],"Substitution":{"Ar":"$-1/4=-0.25$","En":"$-1/4=-0.25$"},"Result":{"Ar":"$-\\frac34$","En":"$-\\frac34$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-0.75<-0.6$","En":"$-0.75<-0.6$"},"CommonError":{"Ar":"−0.6 أكبر من −0.75.","En":"−0.6 is greater than −0.75."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−0.6 أكبر من −0.75.","En":"−0.6 is greater than −0.75."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"−0.5 أكبر من −0.75.","En":"−0.5 is greater than −0.75."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"−0.25 أقرب للصفر.","En":"−0.25 is closer to zero."},"Order":4}]}$mw$),
($mw$growth-v40-grade-7-inequality-negative-multiplier-context-free-1$mw$,$mw$inequality-negative-multiplier-context-free$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-7$mw$,7,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حل متراجحة بقسمة سالبة","En":"Solving with negative division"},"Question":{"Ar":"أي عدد يمثل أكبر حل صحيح للمتراجحة $-5x>16$؟","En":"What is the greatest integer solution of $-5x>16$?"},"Options":[{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−3 يعطي 15 فقط.","En":"−3 gives only 15."}},{"LatexCode":"-4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يعطي −15.","En":"3 gives −15."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يعطي −20.","En":"4 gives −20."}}],"Hints":[{"Ar":"اعكس الإشارة عند القسمة على −5.","En":"Reverse the inequality when dividing by −5."},{"Ar":"ابحث عن العدد الصحيح الأقرب من الأسفل.","En":"Find the nearest integer below the bound."}],"Solution":{"Idea":{"Ar":"نقسم على معامل سالب فنعكس الإشارة، ثم نختار أكبر عدد صحيح يحقق الشرط.","En":"Divide by the negative coefficient, reverse the inequality, then choose the greatest integer satisfying it."},"FormulaLatex":"x<-16/5","Steps":[{"Ar":"$x<-3.2$","En":"$x<-3.2$"},{"Ar":"أكبر عدد صحيح أقل من −3.2 هو −4.","En":"The greatest integer below −3.2 is −4."}],"Substitution":{"Ar":"$x<-3.2$","En":"$x<-3.2$"},"Result":{"Ar":"$-4$","En":"$-4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-5(-4)=20>16$","En":"$-5(-4)=20>16$"},"CommonError":{"Ar":"−3 يعطي 15 فقط.","En":"−3 gives only 15."}}}$mw$::jsonb,$mw$نقسم على معامل سالب فنعكس الإشارة، ثم نختار أكبر عدد صحيح يحقق الشرط.

$x<-16/5$

1. $x<-3.2$

2. أكبر عدد صحيح أقل من −3.2 هو −4.

$x<-3.2$

$-4$

$-5(-4)=20>16$

−3 يعطي 15 فقط.$mw$,$mw$Divide by the negative coefficient, reverse the inequality, then choose the greatest integer satisfying it.

$x<-16/5$

1. $x<-3.2$

2. The greatest integer below −3.2 is −4.

$x<-3.2$

$-4$

$-5(-4)=20>16$

−3 gives only 15.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اعكس الإشارة عند القسمة على −5.","En":"Reverse the inequality when dividing by −5."},{"Ar":"ابحث عن العدد الصحيح الأقرب من الأسفل.","En":"Find the nearest integer below the bound."}],"Solution":{"Idea":{"Ar":"نقسم على معامل سالب فنعكس الإشارة، ثم نختار أكبر عدد صحيح يحقق الشرط.","En":"Divide by the negative coefficient, reverse the inequality, then choose the greatest integer satisfying it."},"FormulaLatex":"x<-16/5","Steps":[{"Ar":"$x<-3.2$","En":"$x<-3.2$"},{"Ar":"أكبر عدد صحيح أقل من −3.2 هو −4.","En":"The greatest integer below −3.2 is −4."}],"Substitution":{"Ar":"$x<-3.2$","En":"$x<-3.2$"},"Result":{"Ar":"$-4$","En":"$-4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-5(-4)=20>16$","En":"$-5(-4)=20>16$"},"CommonError":{"Ar":"−3 يعطي 15 فقط.","En":"−3 gives only 15."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−3 يعطي 15 فقط.","En":"−3 gives only 15."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"3 يعطي −15.","En":"3 gives −15."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"4 يعطي −20.","En":"4 gives −20."},"Order":4}]}$mw$),
($mw$growth-v40-grade-8-distribution-same-median-different-range-1$mw$,$mw$distribution-same-median-different-range$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-8$mw$,8,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة انتشار مجموعتين","En":"Comparing spread of two sets"},"Question":{"Ar":"المجموعتان A=(4,5,6) وB=(1,5,9). أي عبارة صحيحة؟ A: وسيط A أكبر؛ B: وسيط B أكبر؛ C: الوسيطان متساويان ومدى B أكبر؛ D: الوسيطان والمديان متساوية.","En":"Sets A=(4,5,6) and B=(1,5,9). Which statement is true? A: A has a larger median; B: B has a larger median; C: equal medians and B has a larger range; D: equal medians and equal ranges."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الوسيطان 5.","En":"Both medians are 5."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الوسيطان متساويان.","En":"The medians are equal."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المديان 2 و8 مختلفان.","En":"The ranges 2 and 8 differ."}}],"Hints":[{"Ar":"حدد القيمة الوسطى لكل مجموعة.","En":"Find each middle value."},{"Ar":"احسب أكبر قيمة ناقص أصغر قيمة.","En":"Compute maximum minus minimum."}],"Solution":{"Idea":{"Ar":"الوسيط يصف المركز والمدى يصف الانتشار؛ قد يتساوى المركز ويختلف الانتشار.","En":"Median describes centre and range describes spread; centres can match while spreads differ."},"FormulaLatex":"R_A=6-4=2,\\quad R_B=9-1=8","Steps":[{"Ar":"$M_A=M_B=5$","En":"$M_A=M_B=5$"},{"Ar":"$8>2$","En":"$8>2$"}],"Substitution":{"Ar":"$8>2$","En":"$8>2$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$R_B-R_A=6$","En":"$R_B-R_A=6$"},"CommonError":{"Ar":"الوسيطان 5.","En":"Both medians are 5."}}}$mw$::jsonb,$mw$الوسيط يصف المركز والمدى يصف الانتشار؛ قد يتساوى المركز ويختلف الانتشار.

$R_A=6-4=2,\quad R_B=9-1=8$

1. $M_A=M_B=5$

2. $8>2$

$8>2$

$C$

$R_B-R_A=6$

الوسيطان 5.$mw$,$mw$Median describes centre and range describes spread; centres can match while spreads differ.

$R_A=6-4=2,\quad R_B=9-1=8$

1. $M_A=M_B=5$

2. $8>2$

$8>2$

$C$

$R_B-R_A=6$

Both medians are 5.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد القيمة الوسطى لكل مجموعة.","En":"Find each middle value."},{"Ar":"احسب أكبر قيمة ناقص أصغر قيمة.","En":"Compute maximum minus minimum."}],"Solution":{"Idea":{"Ar":"الوسيط يصف المركز والمدى يصف الانتشار؛ قد يتساوى المركز ويختلف الانتشار.","En":"Median describes centre and range describes spread; centres can match while spreads differ."},"FormulaLatex":"R_A=6-4=2,\\quad R_B=9-1=8","Steps":[{"Ar":"$M_A=M_B=5$","En":"$M_A=M_B=5$"},{"Ar":"$8>2$","En":"$8>2$"}],"Substitution":{"Ar":"$8>2$","En":"$8>2$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$R_B-R_A=6$","En":"$R_B-R_A=6$"},"CommonError":{"Ar":"الوسيطان 5.","En":"Both medians are 5."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الوسيطان 5.","En":"Both medians are 5."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الوسيطان متساويان.","En":"The medians are equal."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المديان 2 و8 مختلفان.","En":"The ranges 2 and 8 differ."},"Order":4}]}$mw$),
($mw$growth-v40-grade-8-inequality-equivalent-interval-from-two-conditions-1$mw$,$mw$inequality-equivalent-interval-from-two-conditions$mw$,$mw$number-line-solutions$mw$,$mw$grade-8$mw$,8,2,84,326,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":326,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"دمج شرطين على خط الأعداد","En":"Combining two number-line bounds"},"Question":{"Ar":"أي متراجحة واحدة تصف الأعداد الحقيقية التي تحقق معاً x≥−1 وx<4؟","En":"Which single inequality describes all real numbers satisfying both x≥−1 and x<4?"},"Options":[{"LatexCode":"-1<x<4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستبعد −1 خطأً.","En":"Incorrectly excludes −1."}},{"LatexCode":"-1\\le x<4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-1\\le x\\le4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يشمل 4 خطأً.","En":"Incorrectly includes 4."}},{"LatexCode":"x\\ge4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يخالف شرط x<4.","En":"Violates x<4."}}],"Hints":[{"Ar":"هل −1 مشمول؟","En":"Is −1 included?"},{"Ar":"هل 4 مشمول؟","En":"Is 4 included?"}],"Solution":{"Idea":{"Ar":"نأخذ تقاطع الشرطين؛ الطرف الأول مشمول والثاني غير مشمول.","En":"Intersect the conditions; the lower endpoint is included and the upper endpoint is excluded."},"FormulaLatex":" -1\\le x<4","Steps":[{"Ar":"−1 يحقق الشرطين.","En":"−1 satisfies both."},{"Ar":"4 لا يحقق الشرط الثاني.","En":"4 fails the second condition."}],"Substitution":{"Ar":"$ -1\\le x<4$","En":"$ -1\\le x<4$"},"Result":{"Ar":"$-1\\le x<4$","En":"$-1\\le x<4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-1\\le0<4$","En":"$-1\\le0<4$"},"CommonError":{"Ar":"يستبعد −1 خطأً.","En":"Incorrectly excludes −1."}}}$mw$::jsonb,$mw$نأخذ تقاطع الشرطين؛ الطرف الأول مشمول والثاني غير مشمول.

$ -1\le x<4$

1. −1 يحقق الشرطين.

2. 4 لا يحقق الشرط الثاني.

$ -1\le x<4$

$-1\le x<4$

$-1\le0<4$

يستبعد −1 خطأً.$mw$,$mw$Intersect the conditions; the lower endpoint is included and the upper endpoint is excluded.

$ -1\le x<4$

1. −1 satisfies both.

2. 4 fails the second condition.

$ -1\le x<4$

$-1\le x<4$

$-1\le0<4$

Incorrectly excludes −1.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل −1 مشمول؟","En":"Is −1 included?"},{"Ar":"هل 4 مشمول؟","En":"Is 4 included?"}],"Solution":{"Idea":{"Ar":"نأخذ تقاطع الشرطين؛ الطرف الأول مشمول والثاني غير مشمول.","En":"Intersect the conditions; the lower endpoint is included and the upper endpoint is excluded."},"FormulaLatex":" -1\\le x<4","Steps":[{"Ar":"−1 يحقق الشرطين.","En":"−1 satisfies both."},{"Ar":"4 لا يحقق الشرط الثاني.","En":"4 fails the second condition."}],"Substitution":{"Ar":"$ -1\\le x<4$","En":"$ -1\\le x<4$"},"Result":{"Ar":"$-1\\le x<4$","En":"$-1\\le x<4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-1\\le0<4$","En":"$-1\\le0<4$"},"CommonError":{"Ar":"يستبعد −1 خطأً.","En":"Incorrectly excludes −1."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يستبعد −1 خطأً.","En":"Incorrectly excludes −1."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يشمل 4 خطأً.","En":"Incorrectly includes 4."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يخالف شرط x<4.","En":"Violates x<4."},"Order":4}]}$mw$),
($mw$growth-v40-grade-8-sample-space-restricted-pairs-no-repetition-1$mw$,$mw$sample-space-restricted-pairs-no-repetition$mw$,$mw$sample-spaces$mw$,$mw$grade-8$mw$,8,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أزواج مرتبة دون تكرار","En":"Ordered pairs without repetition"},"Question":{"Ar":"تُختار بطاقتان مختلفتان بالتتابع من البطاقات A وB وC وD دون إعادة. كم زوجاً مرتباً يبدأ بالبطاقة A؟","En":"Two distinct cards are chosen in order from A, B, C, D without replacement. How many ordered pairs start with A?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 يهمل بطاقة ممكنة.","En":"2 omits one possible card."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يسمح بتكرار A.","En":"4 allows A twice."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 يعد جميع الأزواج دون تثبيت الأولى.","En":"12 counts all ordered pairs."}}],"Hints":[{"Ar":"هل يمكن اختيار A مرة ثانية؟","En":"Can A be selected again?"},{"Ar":"عد البطاقات المتبقية فقط.","En":"Count only the remaining cards."}],"Solution":{"Idea":{"Ar":"بعد تثبيت البطاقة الأولى، تبقى ثلاث بطاقات ممكنة للثانية.","En":"After fixing the first card, three choices remain for the second."},"FormulaLatex":"1\\cdot3=3","Steps":[{"Ar":"البطاقة الأولى A ثابتة.","En":"The first card is fixed as A."},{"Ar":"الثانية B أو C أو D.","En":"The second is B, C or D."}],"Substitution":{"Ar":"$1\\cdot3=3$","En":"$1\\cdot3=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأزواج هي AB وAC وAD.","En":"The pairs are AB, AC and AD."},"CommonError":{"Ar":"2 يهمل بطاقة ممكنة.","En":"2 omits one possible card."}}}$mw$::jsonb,$mw$بعد تثبيت البطاقة الأولى، تبقى ثلاث بطاقات ممكنة للثانية.

$1\cdot3=3$

1. البطاقة الأولى A ثابتة.

2. الثانية B أو C أو D.

$1\cdot3=3$

$3$

الأزواج هي AB وAC وAD.

2 يهمل بطاقة ممكنة.$mw$,$mw$After fixing the first card, three choices remain for the second.

$1\cdot3=3$

1. The first card is fixed as A.

2. The second is B, C or D.

$1\cdot3=3$

$3$

The pairs are AB, AC and AD.

2 omits one possible card.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل يمكن اختيار A مرة ثانية؟","En":"Can A be selected again?"},{"Ar":"عد البطاقات المتبقية فقط.","En":"Count only the remaining cards."}],"Solution":{"Idea":{"Ar":"بعد تثبيت البطاقة الأولى، تبقى ثلاث بطاقات ممكنة للثانية.","En":"After fixing the first card, three choices remain for the second."},"FormulaLatex":"1\\cdot3=3","Steps":[{"Ar":"البطاقة الأولى A ثابتة.","En":"The first card is fixed as A."},{"Ar":"الثانية B أو C أو D.","En":"The second is B, C or D."}],"Substitution":{"Ar":"$1\\cdot3=3$","En":"$1\\cdot3=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأزواج هي AB وAC وAD.","En":"The pairs are AB, AC and AD."},"CommonError":{"Ar":"2 يهمل بطاقة ممكنة.","En":"2 omits one possible card."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 يهمل بطاقة ممكنة.","En":"2 omits one possible card."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"4 يسمح بتكرار A.","En":"4 allows A twice."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 يعد جميع الأزواج دون تثبيت الأولى.","En":"12 counts all ordered pairs."},"Order":4}]}$mw$),
($mw$growth-v40-grade-9-probability-intersection-from-union-1$mw$,$mw$probability-intersection-from-union$mw$,$mw$simple-compound-events$mw$,$mw$grade-9$mw$,9,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال تقاطع حدثين","En":"Probability of an intersection"},"Question":{"Ar":"إذا كان P(A)=0.6 وP(B)=0.5 وP(A∪B)=0.8، فما P(A∩B)؟","En":"If P(A)=0.6, P(B)=0.5 and P(A∪B)=0.8, what is P(A∩B)?"},"Options":[{"LatexCode":"0.1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.1 فرق احتمالَي الحدثين.","En":"0.1 is the difference of event probabilities."}},{"LatexCode":"0.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.2 احتمال متمم الاتحاد.","En":"0.2 is the complement of the union."}},{"LatexCode":"0.3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.5 احتمال B وحده.","En":"0.5 is P(B)."}}],"Hints":[{"Ar":"استخدم قاعدة احتمال الاتحاد.","En":"Use the union probability rule."},{"Ar":"اعزل احتمال التقاطع.","En":"Isolate the intersection probability."}],"Solution":{"Idea":{"Ar":"مجموع الاحتمالين يحسب التقاطع مرتين، فنطرحه مرة.","En":"Adding the probabilities counts their intersection twice, so subtract it once."},"FormulaLatex":"P(A\\cap B)=P(A)+P(B)-P(A\\cup B)","Steps":[{"Ar":"$0.6+0.5=1.1$","En":"$0.6+0.5=1.1$"},{"Ar":"$1.1-0.8=0.3$","En":"$1.1-0.8=0.3$"}],"Substitution":{"Ar":"$1.1-0.8=0.3$","En":"$1.1-0.8=0.3$"},"Result":{"Ar":"$0.3$","En":"$0.3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$0.6+0.5-0.3=0.8$","En":"$0.6+0.5-0.3=0.8$"},"CommonError":{"Ar":"0.1 فرق احتمالَي الحدثين.","En":"0.1 is the difference of event probabilities."}}}$mw$::jsonb,$mw$مجموع الاحتمالين يحسب التقاطع مرتين، فنطرحه مرة.

$P(A\cap B)=P(A)+P(B)-P(A\cup B)$

1. $0.6+0.5=1.1$

2. $1.1-0.8=0.3$

$1.1-0.8=0.3$

$0.3$

$0.6+0.5-0.3=0.8$

0.1 فرق احتمالَي الحدثين.$mw$,$mw$Adding the probabilities counts their intersection twice, so subtract it once.

$P(A\cap B)=P(A)+P(B)-P(A\cup B)$

1. $0.6+0.5=1.1$

2. $1.1-0.8=0.3$

$1.1-0.8=0.3$

$0.3$

$0.6+0.5-0.3=0.8$

0.1 is the difference of event probabilities.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استخدم قاعدة احتمال الاتحاد.","En":"Use the union probability rule."},{"Ar":"اعزل احتمال التقاطع.","En":"Isolate the intersection probability."}],"Solution":{"Idea":{"Ar":"مجموع الاحتمالين يحسب التقاطع مرتين، فنطرحه مرة.","En":"Adding the probabilities counts their intersection twice, so subtract it once."},"FormulaLatex":"P(A\\cap B)=P(A)+P(B)-P(A\\cup B)","Steps":[{"Ar":"$0.6+0.5=1.1$","En":"$0.6+0.5=1.1$"},{"Ar":"$1.1-0.8=0.3$","En":"$1.1-0.8=0.3$"}],"Substitution":{"Ar":"$1.1-0.8=0.3$","En":"$1.1-0.8=0.3$"},"Result":{"Ar":"$0.3$","En":"$0.3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$0.6+0.5-0.3=0.8$","En":"$0.6+0.5-0.3=0.8$"},"CommonError":{"Ar":"0.1 فرق احتمالَي الحدثين.","En":"0.1 is the difference of event probabilities."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"0.1 فرق احتمالَي الحدثين.","En":"0.1 is the difference of event probabilities."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"0.2 احتمال متمم الاتحاد.","En":"0.2 is the complement of the union."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"0.5 احتمال B وحده.","En":"0.5 is P(B)."},"Order":4}]}$mw$),
($mw$growth-v40-grade-10-coordinate-line-collinear-missing-y-1$mw$,$mw$coordinate-line-collinear-missing-y$mw$,$mw$coordinate-lines$mw$,$mw$grade-10$mw$,10,3,88,329,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":329,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نقاط على مستقيم واحد","En":"Collinear points"},"Question":{"Ar":"تقع النقاط (1,2) و(3,6) و(5,k) على مستقيم واحد. ما k؟","En":"Points (1,2), (3,6) and (5,k) lie on the same line. What is k?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يعطي ميلاً 1.","En":"8 gives slope 1."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 يعطي ميلاً 1.5.","En":"9 gives slope 1.5."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 يعطي ميلاً 3.","En":"12 gives slope 3."}}],"Hints":[{"Ar":"احسب الميل بين أول نقطتين.","En":"Find the slope between the first two points."},{"Ar":"استعمل الميل نفسه للنقطتين الأخيرتين.","En":"Use the same slope for the last two points."}],"Solution":{"Idea":{"Ar":"ميل المستقيم ثابت بين أي نقطتين عليه.","En":"A line has constant slope between any two of its points."},"FormulaLatex":"\\frac{6-2}{3-1}=\\frac{k-6}{5-3}","Steps":[{"Ar":"$4/2=2$","En":"$4/2=2$"},{"Ar":"$k-6=4$","En":"$k-6=4$"},{"Ar":"$k=10$","En":"$k=10$"}],"Substitution":{"Ar":"$k=10$","En":"$k=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(10-6)/(5-3)=2$","En":"$(10-6)/(5-3)=2$"},"CommonError":{"Ar":"8 يعطي ميلاً 1.","En":"8 gives slope 1."}}}$mw$::jsonb,$mw$ميل المستقيم ثابت بين أي نقطتين عليه.

$\frac{6-2}{3-1}=\frac{k-6}{5-3}$

1. $4/2=2$

2. $k-6=4$

3. $k=10$

$k=10$

$10$

$(10-6)/(5-3)=2$

8 يعطي ميلاً 1.$mw$,$mw$A line has constant slope between any two of its points.

$\frac{6-2}{3-1}=\frac{k-6}{5-3}$

1. $4/2=2$

2. $k-6=4$

3. $k=10$

$k=10$

$10$

$(10-6)/(5-3)=2$

8 gives slope 1.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الميل بين أول نقطتين.","En":"Find the slope between the first two points."},{"Ar":"استعمل الميل نفسه للنقطتين الأخيرتين.","En":"Use the same slope for the last two points."}],"Solution":{"Idea":{"Ar":"ميل المستقيم ثابت بين أي نقطتين عليه.","En":"A line has constant slope between any two of its points."},"FormulaLatex":"\\frac{6-2}{3-1}=\\frac{k-6}{5-3}","Steps":[{"Ar":"$4/2=2$","En":"$4/2=2$"},{"Ar":"$k-6=4$","En":"$k-6=4$"},{"Ar":"$k=10$","En":"$k=10$"}],"Substitution":{"Ar":"$k=10$","En":"$k=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(10-6)/(5-3)=2$","En":"$(10-6)/(5-3)=2$"},"CommonError":{"Ar":"8 يعطي ميلاً 1.","En":"8 gives slope 1."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"8 يعطي ميلاً 1.","En":"8 gives slope 1."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"9 يعطي ميلاً 1.5.","En":"9 gives slope 1.5."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 يعطي ميلاً 3.","En":"12 gives slope 3."},"Order":4}]}$mw$),
($mw$growth-v40-grade-11-dot-product-zero-vector-orthogonality-criterion-1$mw$,$mw$dot-product-zero-vector-orthogonality-criterion$mw$,$mw$dot-product$mw$,$mw$grade-11$mw$,11,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار التعامد من المركبات","En":"Checking orthogonality by components"},"Question":{"Ar":"أي متجه من الخيارات عمودي على المتجه (2,3) وغير صفري؟","En":"Which option is a nonzero vector perpendicular to (2,3)?"},"Options":[{"LatexCode":"(2,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب القياسي 13.","En":"The dot product is 13."}},{"LatexCode":"(3,2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب القياسي 12.","En":"The dot product is 12."}},{"LatexCode":"(-3,2)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(0,0)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المتجه صفري ويخالف الشرط.","En":"It is the zero vector and violates the condition."}}],"Hints":[{"Ar":"اختبر حاصل الضرب القياسي.","En":"Test the dot product."},{"Ar":"استبعد المتجه الصفري حسب الشرط.","En":"Exclude the zero vector as required."}],"Solution":{"Idea":{"Ar":"المتجهان غير الصفريين متعامدان إذا كان ضربهما القياسي صفراً.","En":"Two nonzero vectors are perpendicular when their dot product is zero."},"FormulaLatex":"2a+3b=0","Steps":[{"Ar":"$2(-3)+3(2)=-6+6=0$","En":"$2(-3)+3(2)=-6+6=0$"},{"Ar":"المتجه (−3,2) غير صفري.","En":"The vector (−3,2) is nonzero."}],"Substitution":{"Ar":"$2(-3)+3(2)=-6+6=0$","En":"$2(-3)+3(2)=-6+6=0$"},"Result":{"Ar":"$(-3,2)$","En":"$(-3,2)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-3)^2+2^2=13>0$","En":"$(-3)^2+2^2=13>0$"},"CommonError":{"Ar":"الضرب القياسي 13.","En":"The dot product is 13."}}}$mw$::jsonb,$mw$المتجهان غير الصفريين متعامدان إذا كان ضربهما القياسي صفراً.

$2a+3b=0$

1. $2(-3)+3(2)=-6+6=0$

2. المتجه (−3,2) غير صفري.

$2(-3)+3(2)=-6+6=0$

$(-3,2)$

$(-3)^2+2^2=13>0$

الضرب القياسي 13.$mw$,$mw$Two nonzero vectors are perpendicular when their dot product is zero.

$2a+3b=0$

1. $2(-3)+3(2)=-6+6=0$

2. The vector (−3,2) is nonzero.

$2(-3)+3(2)=-6+6=0$

$(-3,2)$

$(-3)^2+2^2=13>0$

The dot product is 13.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اختبر حاصل الضرب القياسي.","En":"Test the dot product."},{"Ar":"استبعد المتجه الصفري حسب الشرط.","En":"Exclude the zero vector as required."}],"Solution":{"Idea":{"Ar":"المتجهان غير الصفريين متعامدان إذا كان ضربهما القياسي صفراً.","En":"Two nonzero vectors are perpendicular when their dot product is zero."},"FormulaLatex":"2a+3b=0","Steps":[{"Ar":"$2(-3)+3(2)=-6+6=0$","En":"$2(-3)+3(2)=-6+6=0$"},{"Ar":"المتجه (−3,2) غير صفري.","En":"The vector (−3,2) is nonzero."}],"Substitution":{"Ar":"$2(-3)+3(2)=-6+6=0$","En":"$2(-3)+3(2)=-6+6=0$"},"Result":{"Ar":"$(-3,2)$","En":"$(-3,2)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-3)^2+2^2=13>0$","En":"$(-3)^2+2^2=13>0$"},"CommonError":{"Ar":"الضرب القياسي 13.","En":"The dot product is 13."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الضرب القياسي 13.","En":"The dot product is 13."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الضرب القياسي 12.","En":"The dot product is 12."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المتجه صفري ويخالف الشرط.","En":"It is the zero vector and violates the condition."},"Order":4}]}$mw$),
($mw$growth-v40-grade-12-circle-line-number-intersections-distance-1$mw$,$mw$circle-line-number-intersections-distance$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد نقاط تقاطع مستقيم ودائرة","En":"Number of line-circle intersections"},"Question":{"Ar":"كم نقطة تقاطع بين الدائرة $x^2+y^2=16$ والمستقيم y=5؟","En":"How many intersection points do the circle $x^2+y^2=16$ and the line y=5 have?"},"Options":[{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تقاطع واحد يتطلب التماس عند مسافة 4.","En":"One intersection requires tangency at distance four."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تقاطعان يتطلبان مسافة أقل من نصف القطر.","En":"Two intersections require distance below the radius."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المستقيم لا يقطع دائرة في أربع نقاط.","En":"A line cannot intersect a circle at four points."}}],"Hints":[{"Ar":"عوّض y=5 في معادلة الدائرة.","En":"Substitute y=5 into the circle equation."},{"Ar":"هل يمكن أن يكون مربع عدد حقيقي سالباً؟","En":"Can a real square be negative?"}],"Solution":{"Idea":{"Ar":"إذا كانت المسافة العمودية من المركز إلى المستقيم أكبر من نصف القطر فلا تقاطع.","En":"If perpendicular distance from the centre to the line exceeds the radius, there is no intersection."},"FormulaLatex":"x^2+25=16","Steps":[{"Ar":"$x^2=-9$","En":"$x^2=-9$"},{"Ar":"لا يوجد عدد حقيقي مربعه سالب.","En":"No real number has a negative square."}],"Substitution":{"Ar":"$x^2=-9$","En":"$x^2=-9$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5>4$","En":"$5>4$"},"CommonError":{"Ar":"تقاطع واحد يتطلب التماس عند مسافة 4.","En":"One intersection requires tangency at distance four."}}}$mw$::jsonb,$mw$إذا كانت المسافة العمودية من المركز إلى المستقيم أكبر من نصف القطر فلا تقاطع.

$x^2+25=16$

1. $x^2=-9$

2. لا يوجد عدد حقيقي مربعه سالب.

$x^2=-9$

$0$

$5>4$

تقاطع واحد يتطلب التماس عند مسافة 4.$mw$,$mw$If perpendicular distance from the centre to the line exceeds the radius, there is no intersection.

$x^2+25=16$

1. $x^2=-9$

2. No real number has a negative square.

$x^2=-9$

$0$

$5>4$

One intersection requires tangency at distance four.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض y=5 في معادلة الدائرة.","En":"Substitute y=5 into the circle equation."},{"Ar":"هل يمكن أن يكون مربع عدد حقيقي سالباً؟","En":"Can a real square be negative?"}],"Solution":{"Idea":{"Ar":"إذا كانت المسافة العمودية من المركز إلى المستقيم أكبر من نصف القطر فلا تقاطع.","En":"If perpendicular distance from the centre to the line exceeds the radius, there is no intersection."},"FormulaLatex":"x^2+25=16","Steps":[{"Ar":"$x^2=-9$","En":"$x^2=-9$"},{"Ar":"لا يوجد عدد حقيقي مربعه سالب.","En":"No real number has a negative square."}],"Substitution":{"Ar":"$x^2=-9$","En":"$x^2=-9$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5>4$","En":"$5>4$"},"CommonError":{"Ar":"تقاطع واحد يتطلب التماس عند مسافة 4.","En":"One intersection requires tangency at distance four."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تقاطع واحد يتطلب التماس عند مسافة 4.","En":"One intersection requires tangency at distance four."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تقاطعان يتطلبان مسافة أقل من نصف القطر.","En":"Two intersections require distance below the radius."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المستقيم لا يقطع دائرة في أربع نقاط.","En":"A line cannot intersect a circle at four points."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v40 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
