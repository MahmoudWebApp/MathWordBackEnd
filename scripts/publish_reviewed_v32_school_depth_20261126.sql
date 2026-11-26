-- One-time owner-authorized v32 primary depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v32-grade-4-unknown-factor-equation-equivalence-1$mw$,$mw$unknown-factor-equation-equivalence$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلتان لهما الحل نفسه","En":"Equations with the same solution"},"Question":{"Ar":"أي معادلة من الخيارات لها الحل نفسه للمتغير k في المعادلة 4k=36؟","En":"Which equation has the same solution for k as 4k=36?"},"Options":[{"LatexCode":"3k=18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حلها 6.","En":"Its solution is 6."}},{"LatexCode":"5k=45","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6k=48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حلها 8.","En":"Its solution is 8."}},{"LatexCode":"7k=70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حلها 10.","En":"Its solution is 10."}}],"Hints":[{"Ar":"أوجد قيمة العامل المجهول أولاً.","En":"Find the unknown factor first."},{"Ar":"اختبر القيمة نفسها في كل خيار.","En":"Test the same value in each option."}],"Solution":{"Idea":{"Ar":"نجد العامل المجهول بالقسمة على المعامل غير الصفري، ثم نقارن الحلول.","En":"Find the unknown factor by dividing by the nonzero coefficient, then compare solutions."},"FormulaLatex":"ak=b\\Rightarrow k=b/a","Steps":[{"Ar":"$k=36/4=9$","En":"$k=36/4=9$"},{"Ar":"نعوّض بالقيمة 9 في كل معادلة؛ فقط المعادلة ذات المعامل 5 تعطي الطرف الأيمن المطلوب.","En":"Substitute 9 into each equation; only the equation with coefficient 5 gives the required right-hand side."}],"Substitution":{"Ar":"$5\\cdot9=45$","En":"$5\\cdot9=45$"},"Result":{"Ar":"$5k=45$","En":"$5k=45$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$45/5=36/4=9$","En":"$45/5=36/4=9$"},"CommonError":{"Ar":"لا تقارن المعاملات وحدها.","En":"Do not compare coefficients alone."}}}$mw$::jsonb,$mw$نجد العامل المجهول بالقسمة على المعامل غير الصفري، ثم نقارن الحلول.

$ak=b\Rightarrow k=b/a$

1. $k=36/4=9$

2. نعوّض بالقيمة 9 في كل معادلة؛ فقط المعادلة ذات المعامل 5 تعطي الطرف الأيمن المطلوب.

$5\cdot9=45$

$5k=45$

$45/5=36/4=9$

لا تقارن المعاملات وحدها.$mw$,$mw$Find the unknown factor by dividing by the nonzero coefficient, then compare solutions.

$ak=b\Rightarrow k=b/a$

1. $k=36/4=9$

2. Substitute 9 into each equation; only the equation with coefficient 5 gives the required right-hand side.

$5\cdot9=45$

$5k=45$

$45/5=36/4=9$

Do not compare coefficients alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أوجد قيمة العامل المجهول أولاً.","En":"Find the unknown factor first."},{"Ar":"اختبر القيمة نفسها في كل خيار.","En":"Test the same value in each option."}],"Solution":{"Idea":{"Ar":"نجد العامل المجهول بالقسمة على المعامل غير الصفري، ثم نقارن الحلول.","En":"Find the unknown factor by dividing by the nonzero coefficient, then compare solutions."},"FormulaLatex":"ak=b\\Rightarrow k=b/a","Steps":[{"Ar":"$k=36/4=9$","En":"$k=36/4=9$"},{"Ar":"نعوّض بالقيمة 9 في كل معادلة؛ فقط المعادلة ذات المعامل 5 تعطي الطرف الأيمن المطلوب.","En":"Substitute 9 into each equation; only the equation with coefficient 5 gives the required right-hand side."}],"Substitution":{"Ar":"$5\\cdot9=45$","En":"$5\\cdot9=45$"},"Result":{"Ar":"$5k=45$","En":"$5k=45$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$45/5=36/4=9$","En":"$45/5=36/4=9$"},"CommonError":{"Ar":"لا تقارن المعاملات وحدها.","En":"Do not compare coefficients alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حلها 6.","En":"Its solution is 6."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حلها 8.","En":"Its solution is 8."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حلها 10.","En":"Its solution is 10."},"Order":4}]}$mw$),
($mw$growth-v32-grade-5-rounding-estimate-signed-error-1$mw$,$mw$rounding-estimate-signed-error$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اتجاه خطأ التقدير","En":"Direction of estimation error"},"Question":{"Ar":"قرّبت ليلى العددين 347 و168 إلى أقرب عشرة ثم جمعتهما. بكم يزيد مجموعها التقديري على المجموع الدقيق؟","En":"Layla rounds 347 and 168 to the nearest ten before adding. By how much does her estimate exceed the exact sum?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 خطأ تقريب العدد الثاني وحده.","En":"2 is the rounding error of the second number alone."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 خطأ تقريب العدد الأول وحده.","En":"3 is the rounding error of the first number alone."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 مقدار منزلة التقريب لا الخطأ الفعلي.","En":"10 is the rounding place, not the actual error."}}],"Hints":[{"Ar":"قرّب كل عدد على حدة.","En":"Round each number separately."},{"Ar":"قارن مجموع العددين المقربين بالمجموع الدقيق.","En":"Compare the rounded sum with the exact sum."}],"Solution":{"Idea":{"Ar":"الزيادة في مجموع التقدير تساوي مجموع زيادات التقريب عندما يقرب العددان إلى الأعلى.","En":"The excess in the estimate equals the sum of the rounding increases when both values round upward."},"FormulaLatex":"E=(350+170)-(347+168)","Steps":[{"Ar":"$347\\to350,\\quad168\\to170$","En":"$347\\to350,\\quad168\\to170$"},{"Ar":"$350+170=520,\\quad347+168=515$","En":"$350+170=520,\\quad347+168=515$"}],"Substitution":{"Ar":"$520-515=5$","En":"$520-515=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$(350-347)+(170-168)=3+2=5$","En":"$(350-347)+(170-168)=3+2=5$"},"CommonError":{"Ar":"لا تخلط بين مقدار التقريب وخطأ التقدير.","En":"Do not confuse the rounding place with the estimation error."}}}$mw$::jsonb,$mw$الزيادة في مجموع التقدير تساوي مجموع زيادات التقريب عندما يقرب العددان إلى الأعلى.

$E=(350+170)-(347+168)$

1. $347\to350,\quad168\to170$

2. $350+170=520,\quad347+168=515$

$520-515=5$

$5$

$(350-347)+(170-168)=3+2=5$

لا تخلط بين مقدار التقريب وخطأ التقدير.$mw$,$mw$The excess in the estimate equals the sum of the rounding increases when both values round upward.

$E=(350+170)-(347+168)$

1. $347\to350,\quad168\to170$

2. $350+170=520,\quad347+168=515$

$520-515=5$

$5$

$(350-347)+(170-168)=3+2=5$

Do not confuse the rounding place with the estimation error.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قرّب كل عدد على حدة.","En":"Round each number separately."},{"Ar":"قارن مجموع العددين المقربين بالمجموع الدقيق.","En":"Compare the rounded sum with the exact sum."}],"Solution":{"Idea":{"Ar":"الزيادة في مجموع التقدير تساوي مجموع زيادات التقريب عندما يقرب العددان إلى الأعلى.","En":"The excess in the estimate equals the sum of the rounding increases when both values round upward."},"FormulaLatex":"E=(350+170)-(347+168)","Steps":[{"Ar":"$347\\to350,\\quad168\\to170$","En":"$347\\to350,\\quad168\\to170$"},{"Ar":"$350+170=520,\\quad347+168=515$","En":"$350+170=520,\\quad347+168=515$"}],"Substitution":{"Ar":"$520-515=5$","En":"$520-515=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$(350-347)+(170-168)=3+2=5$","En":"$(350-347)+(170-168)=3+2=5$"},"CommonError":{"Ar":"لا تخلط بين مقدار التقريب وخطأ التقدير.","En":"Do not confuse the rounding place with the estimation error."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 خطأ تقريب العدد الثاني وحده.","En":"2 is the rounding error of the second number alone."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3 خطأ تقريب العدد الأول وحده.","En":"3 is the rounding error of the first number alone."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"10 مقدار منزلة التقريب لا الخطأ الفعلي.","En":"10 is the rounding place, not the actual error."},"Order":4}]}$mw$),
($mw$growth-v32-grade-2-pictograph-equal-rows-missing-symbols-1$mw$,$mw$pictograph-equal-rows-missing-symbols$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إكمال تمثيل مصور","En":"Completing a pictograph"},"Question":{"Ar":"كل رمز ● يمثل صوتاً واحداً. في سجل التصويت: A: ●●، B: ●●●●●، C: ●●●. يريد المعلم إضافة أصوات إلى A فقط حتى يتساوى عدده مع B. كم رمزاً يضيف؟","En":"Each ● represents one vote. The record is A: ●●; B: ●●●●●; C: ●●●. How many symbols must be added to A alone so that its count equals B?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 عدد أصوات A قبل الإضافة.","En":"2 is A's original count."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 العدد المطلوب بعد الإضافة، لا عدد الرموز المضافة.","En":"5 is the target total, not the added count."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 مجموع A وB قبل الإضافة.","En":"7 is the original combined count of A and B."}}],"Hints":[{"Ar":"عد رموز A وB فقط.","En":"Count the symbols in A and B only."},{"Ar":"كم رمزاً ينقص A ليصل إلى خمسة؟","En":"How many more symbols does A need to reach five?"}],"Solution":{"Idea":{"Ar":"نقرأ الرموز بوحدة واحدة ونجد الفرق بين الصفين.","En":"Read the one-unit symbols and find the difference between the two rows."},"FormulaLatex":"5-2","Steps":[{"Ar":"في A رمزان وفي B خمسة رموز.","En":"A has two symbols and B has five."},{"Ar":"نطابق رمزي A مع اثنين من B؛ يتبقى ثلاثة في B.","En":"Match A's two symbols with two in B; three remain in B."}],"Substitution":{"Ar":"$5-2=3$","En":"$5-2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$2+3=5$","En":"$2+3=5$"},"CommonError":{"Ar":"لا تضف أصوات C لأنها ليست جزءاً من المقارنة.","En":"Do not include C because it is not part of the comparison."}}}$mw$::jsonb,$mw$نقرأ الرموز بوحدة واحدة ونجد الفرق بين الصفين.

$5-2$

1. في A رمزان وفي B خمسة رموز.

2. نطابق رمزي A مع اثنين من B؛ يتبقى ثلاثة في B.

$5-2=3$

$3$

$2+3=5$

لا تضف أصوات C لأنها ليست جزءاً من المقارنة.$mw$,$mw$Read the one-unit symbols and find the difference between the two rows.

$5-2$

1. A has two symbols and B has five.

2. Match A's two symbols with two in B; three remain in B.

$5-2=3$

$3$

$2+3=5$

Do not include C because it is not part of the comparison.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد رموز A وB فقط.","En":"Count the symbols in A and B only."},{"Ar":"كم رمزاً ينقص A ليصل إلى خمسة؟","En":"How many more symbols does A need to reach five?"}],"Solution":{"Idea":{"Ar":"نقرأ الرموز بوحدة واحدة ونجد الفرق بين الصفين.","En":"Read the one-unit symbols and find the difference between the two rows."},"FormulaLatex":"5-2","Steps":[{"Ar":"في A رمزان وفي B خمسة رموز.","En":"A has two symbols and B has five."},{"Ar":"نطابق رمزي A مع اثنين من B؛ يتبقى ثلاثة في B.","En":"Match A's two symbols with two in B; three remain in B."}],"Substitution":{"Ar":"$5-2=3$","En":"$5-2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$2+3=5$","En":"$2+3=5$"},"CommonError":{"Ar":"لا تضف أصوات C لأنها ليست جزءاً من المقارنة.","En":"Do not include C because it is not part of the comparison."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 عدد أصوات A قبل الإضافة.","En":"2 is A's original count."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"5 العدد المطلوب بعد الإضافة، لا عدد الرموز المضافة.","En":"5 is the target total, not the added count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"7 مجموع A وB قبل الإضافة.","En":"7 is the original combined count of A and B."},"Order":4}]}$mw$),
($mw$growth-v32-grade-4-addition-compensation-preserved-sum-1$mw$,$mw$addition-compensation-preserved-sum$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الحفاظ على مجموع عددين","En":"Preserving a sum"},"Question":{"Ar":"لحساب 398+267 بسهولة، زاد سامر العدد الأول بمقدار 2. ما العدد الذي يجب أن يستعمله بدلاً من 267 حتى يبقى المجموع نفسه؟","En":"To simplify 398+267, Samer increases the first addend by 2. Which number should replace 267 to keep the sum unchanged?"},"Options":[{"LatexCode":"265","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"267","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الإبقاء على 267 يزيد المجموع بمقدار 2.","En":"Keeping 267 increases the sum by 2."}},{"LatexCode":"269","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زيادة الحدين بمقدار 2 تزيد المجموع بمقدار 4.","En":"Increasing both addends by 2 increases the sum by 4."}},{"LatexCode":"400","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"400 هو الحد الأول بعد التعديل.","En":"400 is the adjusted first addend."}}],"Hints":[{"Ar":"كم زاد الحد الأول؟","En":"How much did the first addend increase?"},{"Ar":"أنقص الحد الآخر بالمقدار نفسه.","En":"Decrease the other addend by the same amount."}],"Solution":{"Idea":{"Ar":"زيادة أحد الحدين وإنقاص الآخر بالمقدار نفسه يحافظان على المجموع.","En":"Increasing one addend and decreasing the other by the same amount preserves the sum."},"FormulaLatex":"a+b=(a+c)+(b-c)","Steps":[{"Ar":"$398+2=400$","En":"$398+2=400$"},{"Ar":"نعوض الزيادة بإنقاص العدد الثاني بمقدار 2.","En":"Compensate for the increase by reducing the second addend by 2."}],"Substitution":{"Ar":"$267-2=265$","En":"$267-2=265$"},"Result":{"Ar":"$265$","En":"$265$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$398+267=665=400+265$","En":"$398+267=665=400+265$"},"CommonError":{"Ar":"لا تزد الحدين معاً عند الحفاظ على المجموع.","En":"Do not increase both addends when preserving the sum."}}}$mw$::jsonb,$mw$زيادة أحد الحدين وإنقاص الآخر بالمقدار نفسه يحافظان على المجموع.

$a+b=(a+c)+(b-c)$

1. $398+2=400$

2. نعوض الزيادة بإنقاص العدد الثاني بمقدار 2.

$267-2=265$

$265$

$398+267=665=400+265$

لا تزد الحدين معاً عند الحفاظ على المجموع.$mw$,$mw$Increasing one addend and decreasing the other by the same amount preserves the sum.

$a+b=(a+c)+(b-c)$

1. $398+2=400$

2. Compensate for the increase by reducing the second addend by 2.

$267-2=265$

$265$

$398+267=665=400+265$

Do not increase both addends when preserving the sum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم زاد الحد الأول؟","En":"How much did the first addend increase?"},{"Ar":"أنقص الحد الآخر بالمقدار نفسه.","En":"Decrease the other addend by the same amount."}],"Solution":{"Idea":{"Ar":"زيادة أحد الحدين وإنقاص الآخر بالمقدار نفسه يحافظان على المجموع.","En":"Increasing one addend and decreasing the other by the same amount preserves the sum."},"FormulaLatex":"a+b=(a+c)+(b-c)","Steps":[{"Ar":"$398+2=400$","En":"$398+2=400$"},{"Ar":"نعوض الزيادة بإنقاص العدد الثاني بمقدار 2.","En":"Compensate for the increase by reducing the second addend by 2."}],"Substitution":{"Ar":"$267-2=265$","En":"$267-2=265$"},"Result":{"Ar":"$265$","En":"$265$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$398+267=665=400+265$","En":"$398+267=665=400+265$"},"CommonError":{"Ar":"لا تزد الحدين معاً عند الحفاظ على المجموع.","En":"Do not increase both addends when preserving the sum."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الإبقاء على 267 يزيد المجموع بمقدار 2.","En":"Keeping 267 increases the sum by 2."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"زيادة الحدين بمقدار 2 تزيد المجموع بمقدار 4.","En":"Increasing both addends by 2 increases the sum by 4."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"400 هو الحد الأول بعد التعديل.","En":"400 is the adjusted first addend."},"Order":4}]}$mw$),
($mw$growth-v32-grade-5-multiplication-double-half-invariant-1$mw$,$mw$multiplication-double-half-invariant$mw$,$mw$primary-multiplication$mw$,$mw$grade-5$mw$,5,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مضاعفة عامل وتنصيف الآخر","En":"Doubling and halving factors"},"Question":{"Ar":"أي حاصل ضرب يساوي 16×35 ويمكن الحصول عليه بتنصيف العامل الأول ومضاعفة العامل الثاني؟","En":"Which product equals 16×35 and is obtained by halving the first factor and doubling the second?"},"Options":[{"LatexCode":"8\\times35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينصف الناتج بدلاً من الحفاظ عليه.","En":"This halves the product."}},{"LatexCode":"32\\times70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مضاعفة العاملين تجعل الناتج أربعة أمثاله.","En":"Doubling both factors quadruples the product."}},{"LatexCode":"8\\times70","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16\\times70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مضاعفة عامل واحد تضاعف الناتج.","En":"Doubling only one factor doubles the product."}}],"Hints":[{"Ar":"احسب نصف 16.","En":"Find half of 16."},{"Ar":"احسب ضعف 35 واستعمل العاملين معاً.","En":"Double 35 and use both adjusted factors."}],"Solution":{"Idea":{"Ar":"تنصيف عامل ومضاعفة الآخر يحافظان على حاصل الضرب.","En":"Halving one factor and doubling the other preserves the product."},"FormulaLatex":"ab=(a/2)(2b)","Steps":[{"Ar":"$16/2=8$","En":"$16/2=8$"},{"Ar":"$2\\cdot35=70$","En":"$2\\cdot35=70$"}],"Substitution":{"Ar":"$16\\cdot35=8\\cdot70$","En":"$16\\cdot35=8\\cdot70$"},"Result":{"Ar":"$8\\times70$","En":"$8\\times70$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$16\\cdot35=560=8\\cdot70$","En":"$16\\cdot35=560=8\\cdot70$"},"CommonError":{"Ar":"لا تعدل عاملاً واحداً فقط.","En":"Do not adjust only one factor."}}}$mw$::jsonb,$mw$تنصيف عامل ومضاعفة الآخر يحافظان على حاصل الضرب.

$ab=(a/2)(2b)$

1. $16/2=8$

2. $2\cdot35=70$

$16\cdot35=8\cdot70$

$8\times70$

$16\cdot35=560=8\cdot70$

لا تعدل عاملاً واحداً فقط.$mw$,$mw$Halving one factor and doubling the other preserves the product.

$ab=(a/2)(2b)$

1. $16/2=8$

2. $2\cdot35=70$

$16\cdot35=8\cdot70$

$8\times70$

$16\cdot35=560=8\cdot70$

Do not adjust only one factor.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب نصف 16.","En":"Find half of 16."},{"Ar":"احسب ضعف 35 واستعمل العاملين معاً.","En":"Double 35 and use both adjusted factors."}],"Solution":{"Idea":{"Ar":"تنصيف عامل ومضاعفة الآخر يحافظان على حاصل الضرب.","En":"Halving one factor and doubling the other preserves the product."},"FormulaLatex":"ab=(a/2)(2b)","Steps":[{"Ar":"$16/2=8$","En":"$16/2=8$"},{"Ar":"$2\\cdot35=70$","En":"$2\\cdot35=70$"}],"Substitution":{"Ar":"$16\\cdot35=8\\cdot70$","En":"$16\\cdot35=8\\cdot70$"},"Result":{"Ar":"$8\\times70$","En":"$8\\times70$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"$16\\cdot35=560=8\\cdot70$","En":"$16\\cdot35=560=8\\cdot70$"},"CommonError":{"Ar":"لا تعدل عاملاً واحداً فقط.","En":"Do not adjust only one factor."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ينصف الناتج بدلاً من الحفاظ عليه.","En":"This halves the product."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مضاعفة العاملين تجعل الناتج أربعة أمثاله.","En":"Doubling both factors quadruples the product."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مضاعفة عامل واحد تضاعف الناتج.","En":"Doubling only one factor doubles the product."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v32 primary depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
