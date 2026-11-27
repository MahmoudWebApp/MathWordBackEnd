-- One-time owner-authorized v80 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v80-grade-3-repeated-unknown-addition-1$mw$,$mw$repeated-unknown-addition$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-3$mw$,3,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"المجهول المتكرر","En":"Repeated unknown"},"Question":{"Ar":"في المعادلة $x+x+x=27$ يمثل الرمز نفسه العدد نفسه كل مرة. ما قيمة $x$؟","En":"In $x+x+x=27$, the same symbol stands for the same number each time. What is $x$?"},"Options":[{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد مرات تكرار المجهول.","En":"This is the number of copies of the unknown."}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 3 لا يقسم المجموع إلى ثلاث حصص متساوية.","En":"Subtracting 3 does not split the total into three equal shares."}},{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الأعداد الثلاثة.","En":"This is the sum of the three copies."}}],"Hints":[{"Ar":"كم مرة ظهر المجهول؟","En":"How many copies of the unknown appear?"},{"Ar":"قسّم المجموع إلى حصص متساوية.","En":"Split the total into equal shares."}],"Solution":{"Idea":{"Ar":"جمع العدد نفسه ثلاث مرات يعادل ضربه في 3.","En":"Adding the same number three times equals multiplying by 3."},"FormulaLatex":"3x=27","Steps":[{"Ar":"نكتب المجموع على صورة ضرب في 3.","En":"Rewrite the repeated sum as multiplication by 3."},{"Ar":"نقسم 27 على 3.","En":"Divide 27 by 3."}],"Substitution":{"Ar":"$27\\div3=9$","En":"$27\\div3=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مجموع 9 و9 و9 يساوي 27.","En":"The sum of 9, 9 and 9 is 27."},"CommonError":{"Ar":"الخلط بين عدد التكرارات وقيمة المجهول.","En":"Confusing the number of copies with the unknown value."}}}$mw$::jsonb,$mw$جمع العدد نفسه ثلاث مرات يعادل ضربه في 3.

$3x=27$

1. نكتب المجموع على صورة ضرب في 3.

2. نقسم 27 على 3.

$27\div3=9$

$9$

مجموع 9 و9 و9 يساوي 27.

الخلط بين عدد التكرارات وقيمة المجهول.$mw$,$mw$Adding the same number three times equals multiplying by 3.

$3x=27$

1. Rewrite the repeated sum as multiplication by 3.

2. Divide 27 by 3.

$27\div3=9$

$9$

The sum of 9, 9 and 9 is 27.

Confusing the number of copies with the unknown value.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم مرة ظهر المجهول؟","En":"How many copies of the unknown appear?"},{"Ar":"قسّم المجموع إلى حصص متساوية.","En":"Split the total into equal shares."}],"Solution":{"Idea":{"Ar":"جمع العدد نفسه ثلاث مرات يعادل ضربه في 3.","En":"Adding the same number three times equals multiplying by 3."},"FormulaLatex":"3x=27","Steps":[{"Ar":"نكتب المجموع على صورة ضرب في 3.","En":"Rewrite the repeated sum as multiplication by 3."},{"Ar":"نقسم 27 على 3.","En":"Divide 27 by 3."}],"Substitution":{"Ar":"$27\\div3=9$","En":"$27\\div3=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مجموع 9 و9 و9 يساوي 27.","En":"The sum of 9, 9 and 9 is 27."},"CommonError":{"Ar":"الخلط بين عدد التكرارات وقيمة المجهول.","En":"Confusing the number of copies with the unknown value."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد مرات تكرار المجهول.","En":"This is the number of copies of the unknown."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح 3 لا يقسم المجموع إلى ثلاث حصص متساوية.","En":"Subtracting 3 does not split the total into three equal shares."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الأعداد الثلاثة.","En":"This is the sum of the three copies."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-compare-additive-unknowns-1$mw$,$mw$compare-additive-unknowns$mw$,$mw$primary-one-step-additive-equations$mw$,$mw$grade-3$mw$,3,1,2,7,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":7,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة مجهولين","En":"Comparing unknowns"},"Question":{"Ar":"إذا كان $a+4=18$ و$b+7=18$، فبكم يزيد العدد $a$ على العدد $b$؟","En":"If $a+4=18$ and $b+7=18$, how much greater is $a$ than $b$?"},"Options":[{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجهول الثاني وليس الفرق.","En":"This is the second unknown, not the difference."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجهول الأول وليس الفرق.","En":"This is the first unknown, not the difference."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا العدد المضاف في المعادلة الثانية.","En":"This is the addend in the second equation."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"استعمل الطرح لإيجاد كل مجهول.","En":"Use subtraction to find each unknown."},{"Ar":"اطرح الأصغر من الأكبر.","En":"Subtract the smaller from the larger."}],"Solution":{"Idea":{"Ar":"نستعيد المجهولين ثم نحسب الفرق.","En":"Find both unknowns and then their difference."},"FormulaLatex":"a=18-4,\\quad b=18-7","Steps":[{"Ar":"المجهول الأول 14 والثاني 11.","En":"The first unknown is 14 and the second is 11."},{"Ar":"نطرح 11 من 14.","En":"Subtract 11 from 14."}],"Substitution":{"Ar":"$14-11=3$","En":"$14-11=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند زيادة 11 بمقدار 3 نحصل على 14، وكلا المجموعين يساوي 18.","En":"Adding 3 to 11 gives 14, and both equations total 18."},"CommonError":{"Ar":"اختيار أحد المجهولين بدلاً من الفرق.","En":"Choosing one unknown instead of their difference."}}}$mw$::jsonb,$mw$نستعيد المجهولين ثم نحسب الفرق.

$a=18-4,\quad b=18-7$

1. المجهول الأول 14 والثاني 11.

2. نطرح 11 من 14.

$14-11=3$

$3$

عند زيادة 11 بمقدار 3 نحصل على 14، وكلا المجموعين يساوي 18.

اختيار أحد المجهولين بدلاً من الفرق.$mw$,$mw$Find both unknowns and then their difference.

$a=18-4,\quad b=18-7$

1. The first unknown is 14 and the second is 11.

2. Subtract 11 from 14.

$14-11=3$

$3$

Adding 3 to 11 gives 14, and both equations total 18.

Choosing one unknown instead of their difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل الطرح لإيجاد كل مجهول.","En":"Use subtraction to find each unknown."},{"Ar":"اطرح الأصغر من الأكبر.","En":"Subtract the smaller from the larger."}],"Solution":{"Idea":{"Ar":"نستعيد المجهولين ثم نحسب الفرق.","En":"Find both unknowns and then their difference."},"FormulaLatex":"a=18-4,\\quad b=18-7","Steps":[{"Ar":"المجهول الأول 14 والثاني 11.","En":"The first unknown is 14 and the second is 11."},{"Ar":"نطرح 11 من 14.","En":"Subtract 11 from 14."}],"Substitution":{"Ar":"$14-11=3$","En":"$14-11=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند زيادة 11 بمقدار 3 نحصل على 14، وكلا المجموعين يساوي 18.","En":"Adding 3 to 11 gives 14, and both equations total 18."},"CommonError":{"Ar":"اختيار أحد المجهولين بدلاً من الفرق.","En":"Choosing one unknown instead of their difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا المجهول الثاني وليس الفرق.","En":"This is the second unknown, not the difference."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا المجهول الأول وليس الفرق.","En":"This is the first unknown, not the difference."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا العدد المضاف في المعادلة الثانية.","En":"This is the addend in the second equation."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-inverse-operation-product-1$mw$,$mw$inverse-operation-product$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-3$mw$,3,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عكس الضرب","En":"Undoing multiplication"},"Question":{"Ar":"أي عملية حسابية تعطي قيمة $x$ في المعادلة $6x=42$؟","En":"Which calculation gives the value of $x$ in $6x=42$?"},"Options":[{"LatexCode":"42-6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الطرح لا يعكس الضرب.","En":"Subtraction does not undo multiplication."}},{"LatexCode":"42\\div6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"42+6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع يزيد العدد ولا يعكس الضرب.","En":"Addition increases the number instead of undoing multiplication."}},{"LatexCode":"42\\times6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضرب مرة أخرى بدلاً من عكس الضرب.","En":"This multiplies again instead of undoing multiplication."}}],"Hints":[{"Ar":"ما العملية العكسية للضرب؟","En":"What is the inverse of multiplication?"},{"Ar":"ابحث عن حجم كل حصة من ست حصص متساوية.","En":"Find the size of each of six equal shares."}],"Solution":{"Idea":{"Ar":"نقسم على العامل المعروف.","En":"Divide by the known factor."},"FormulaLatex":"x=42\\div6","Steps":[{"Ar":"نقسم طرفي المعادلة على 6.","En":"Divide both sides by 6."},{"Ar":"العملية المطلوبة قسمة 42 على 6.","En":"The required calculation is 42 divided by 6."}],"Substitution":{"Ar":"$42\\div6=7$","En":"$42\\div6=7$"},"Result":{"Ar":"$42\\div6$","En":"$42\\div6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"حاصل ضرب 7 في 6 يساوي 42.","En":"Multiplying 7 by 6 gives 42."},"CommonError":{"Ar":"استعمال الطرح بدلاً من القسمة.","En":"Using subtraction instead of division."}}}$mw$::jsonb,$mw$نقسم على العامل المعروف.

$x=42\div6$

1. نقسم طرفي المعادلة على 6.

2. العملية المطلوبة قسمة 42 على 6.

$42\div6=7$

$42\div6$

حاصل ضرب 7 في 6 يساوي 42.

استعمال الطرح بدلاً من القسمة.$mw$,$mw$Divide by the known factor.

$x=42\div6$

1. Divide both sides by 6.

2. The required calculation is 42 divided by 6.

$42\div6=7$

$42\div6$

Multiplying 7 by 6 gives 42.

Using subtraction instead of division.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ما العملية العكسية للضرب؟","En":"What is the inverse of multiplication?"},{"Ar":"ابحث عن حجم كل حصة من ست حصص متساوية.","En":"Find the size of each of six equal shares."}],"Solution":{"Idea":{"Ar":"نقسم على العامل المعروف.","En":"Divide by the known factor."},"FormulaLatex":"x=42\\div6","Steps":[{"Ar":"نقسم طرفي المعادلة على 6.","En":"Divide both sides by 6."},{"Ar":"العملية المطلوبة قسمة 42 على 6.","En":"The required calculation is 42 divided by 6."}],"Substitution":{"Ar":"$42\\div6=7$","En":"$42\\div6=7$"},"Result":{"Ar":"$42\\div6$","En":"$42\\div6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"حاصل ضرب 7 في 6 يساوي 42.","En":"Multiplying 7 by 6 gives 42."},"CommonError":{"Ar":"استعمال الطرح بدلاً من القسمة.","En":"Using subtraction instead of division."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الطرح لا يعكس الضرب.","En":"Subtraction does not undo multiplication."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الجمع يزيد العدد ولا يعكس الضرب.","En":"Addition increases the number instead of undoing multiplication."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يضرب مرة أخرى بدلاً من عكس الضرب.","En":"This multiplies again instead of undoing multiplication."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-product-change-fixed-factor-1$mw$,$mw$product-change-fixed-factor$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-3$mw$,3,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير العدد في كل مجموعة","En":"Change in each group"},"Question":{"Ar":"أربع مجموعات متساوية تضم معاً 28 قطعة. وبعد إضافة العدد نفسه من القطع إلى كل مجموعة صار المجموع 40 قطعة. كم قطعة أضيفت إلى كل مجموعة؟","En":"Four equal groups contain 28 pieces in total. The same number is added to every group, making 40 pieces in all. How many pieces were added to each group?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع في المجموعة قبل الإضافة.","En":"This is the original group size."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع المضافة إلى المجموعات كلها.","En":"This is the number added to all groups."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع في المجموعة بعد الإضافة.","En":"This is the final group size."}}],"Hints":[{"Ar":"أوجد مقدار الزيادة الكلية.","En":"Find the increase in the total."},{"Ar":"وزع الزيادة على المجموعات الأربع بالتساوي.","En":"Share the increase equally among four groups."}],"Solution":{"Idea":{"Ar":"الزيادة الكلية موزعة بالتساوي.","En":"The increase is shared equally."},"FormulaLatex":"4x=40-28","Steps":[{"Ar":"زاد المجموع 12 قطعة.","En":"The total increased by 12."},{"Ar":"نقسم الزيادة على 4.","En":"Divide the increase by 4."}],"Substitution":{"Ar":"$12\\div4=3$","En":"$12\\div4=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كانت كل مجموعة تضم 7 قطع وأصبحت تضم 10، أي زادت 3.","En":"Each group grew from 7 to 10, an increase of 3."},"CommonError":{"Ar":"اعتبار الزيادة الكلية زيادة كل مجموعة.","En":"Treating the total increase as each group's increase."}}}$mw$::jsonb,$mw$الزيادة الكلية موزعة بالتساوي.

$4x=40-28$

1. زاد المجموع 12 قطعة.

2. نقسم الزيادة على 4.

$12\div4=3$

$3$

كانت كل مجموعة تضم 7 قطع وأصبحت تضم 10، أي زادت 3.

اعتبار الزيادة الكلية زيادة كل مجموعة.$mw$,$mw$The increase is shared equally.

$4x=40-28$

1. The total increased by 12.

2. Divide the increase by 4.

$12\div4=3$

$3$

Each group grew from 7 to 10, an increase of 3.

Treating the total increase as each group's increase.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أوجد مقدار الزيادة الكلية.","En":"Find the increase in the total."},{"Ar":"وزع الزيادة على المجموعات الأربع بالتساوي.","En":"Share the increase equally among four groups."}],"Solution":{"Idea":{"Ar":"الزيادة الكلية موزعة بالتساوي.","En":"The increase is shared equally."},"FormulaLatex":"4x=40-28","Steps":[{"Ar":"زاد المجموع 12 قطعة.","En":"The total increased by 12."},{"Ar":"نقسم الزيادة على 4.","En":"Divide the increase by 4."}],"Substitution":{"Ar":"$12\\div4=3$","En":"$12\\div4=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كانت كل مجموعة تضم 7 قطع وأصبحت تضم 10، أي زادت 3.","En":"Each group grew from 7 to 10, an increase of 3."},"CommonError":{"Ar":"اعتبار الزيادة الكلية زيادة كل مجموعة.","En":"Treating the total increase as each group's increase."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع في المجموعة قبل الإضافة.","En":"This is the original group size."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع المضافة إلى المجموعات كلها.","En":"This is the number added to all groups."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع في المجموعة بعد الإضافة.","En":"This is the final group size."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-additive-equation-balance-change-1$mw$,$mw$additive-equation-balance-change$mw$,$mw$primary-one-step-additive-equations$mw$,$mw$grade-3$mw$,3,1,2,7,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":7,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المحافظة على التساوي","En":"Preserving equality"},"Question":{"Ar":"المعادلة $x+8=19$ صحيحة. إذا زدنا الطرف الأيسر بمقدار 5 فأصبح $x+13$، فما العدد الذي يجب أن يكون في الطرف الأيمن حتى يبقى التساوي صحيحاً؟","En":"The equation $x+8=19$ is true. If the left side increases by 5 to become $x+13$, what must the right side be to keep the equality true?"},"Options":[{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إنقاص الطرف الأيمن يخل بالتساوي.","En":"Decreasing the right side breaks equality."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ترك الطرف الأيمن دون تغيير يخل بالتساوي.","En":"Leaving the right side unchanged breaks equality."}},{"LatexCode":"32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 13 لا مقدار الزيادة 5.","En":"This adds 13 rather than the increase of 5."}}],"Hints":[{"Ar":"الطرفان متساويان في البداية.","En":"The sides are initially equal."},{"Ar":"غيّر الطرف الآخر بالمقدار نفسه وفي الاتجاه نفسه.","En":"Change the other side by the same amount and direction."}],"Solution":{"Idea":{"Ar":"زيادة الطرفين بالمقدار نفسه تحافظ على المساواة.","En":"Increasing both sides equally preserves equality."},"FormulaLatex":"x+8+5=19+5","Steps":[{"Ar":"زاد الطرف الأيسر بمقدار 5.","En":"The left side increased by 5."},{"Ar":"نزيد 19 بمقدار 5 أيضاً.","En":"Increase 19 by 5 as well."}],"Substitution":{"Ar":"$19+5=24$","En":"$19+5=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المجهول 11؛ ومجموع 11 و13 يساوي 24.","En":"The unknown is 11; 11 plus 13 equals 24."},"CommonError":{"Ar":"تغيير طرف واحد دون الآخر.","En":"Changing only one side."}}}$mw$::jsonb,$mw$زيادة الطرفين بالمقدار نفسه تحافظ على المساواة.

$x+8+5=19+5$

1. زاد الطرف الأيسر بمقدار 5.

2. نزيد 19 بمقدار 5 أيضاً.

$19+5=24$

$24$

المجهول 11؛ ومجموع 11 و13 يساوي 24.

تغيير طرف واحد دون الآخر.$mw$,$mw$Increasing both sides equally preserves equality.

$x+8+5=19+5$

1. The left side increased by 5.

2. Increase 19 by 5 as well.

$19+5=24$

$24$

The unknown is 11; 11 plus 13 equals 24.

Changing only one side.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الطرفان متساويان في البداية.","En":"The sides are initially equal."},{"Ar":"غيّر الطرف الآخر بالمقدار نفسه وفي الاتجاه نفسه.","En":"Change the other side by the same amount and direction."}],"Solution":{"Idea":{"Ar":"زيادة الطرفين بالمقدار نفسه تحافظ على المساواة.","En":"Increasing both sides equally preserves equality."},"FormulaLatex":"x+8+5=19+5","Steps":[{"Ar":"زاد الطرف الأيسر بمقدار 5.","En":"The left side increased by 5."},{"Ar":"نزيد 19 بمقدار 5 أيضاً.","En":"Increase 19 by 5 as well."}],"Substitution":{"Ar":"$19+5=24$","En":"$19+5=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المجهول 11؛ ومجموع 11 و13 يساوي 24.","En":"The unknown is 11; 11 plus 13 equals 24."},"CommonError":{"Ar":"تغيير طرف واحد دون الآخر.","En":"Changing only one side."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"إنقاص الطرف الأيمن يخل بالتساوي.","En":"Decreasing the right side breaks equality."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ترك الطرف الأيمن دون تغيير يخل بالتساوي.","En":"Leaving the right side unchanged breaks equality."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 13 لا مقدار الزيادة 5.","En":"This adds 13 rather than the increase of 5."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-consistent-additive-equations-1$mw$,$mw$consistent-additive-equations$mw$,$mw$primary-one-step-additive-equations$mw$,$mw$grade-3$mw$,3,1,2,7,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":7,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد يحقق شرطين","En":"A number satisfying two conditions"},"Question":{"Ar":"ما العدد $n$ الذي يجعل المعادلتين $n+6=17$ و$n-4=7$ صحيحتين معاً؟","En":"What number $n$ makes both $n+6=17$ and $n-4=7$ true?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج الطرح وليس المجهول.","En":"This is the subtraction result, not the unknown."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج طرح 4 من 17 ولا يحقق الشرطين.","En":"This subtracts 4 from 17 and satisfies neither equation."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"21","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج جمع 4 إلى 17 ولا يحقق المعادلتين.","En":"This adds 4 to 17 and satisfies neither equation."}}],"Hints":[{"Ar":"ابدأ بالمعادلة الأولى واستعمل العملية العكسية.","En":"Start with the first equation and use its inverse."},{"Ar":"جرّب الناتج في المعادلة الثانية أيضاً.","En":"Test the result in the second equation too."}],"Solution":{"Idea":{"Ar":"القيمة يجب أن تحقق الشرطين.","En":"The value must satisfy both conditions."},"FormulaLatex":"n=17-6","Steps":[{"Ar":"نطرح 6 من 17 فنجد 11.","En":"Subtract 6 from 17 to get 11."},{"Ar":"نعوض 11 في المعادلة الثانية فنجد 7.","En":"Substitute 11 in the second equation to get 7."}],"Substitution":{"Ar":"$11+6=17,\\quad11-4=7$","En":"$11+6=17,\\quad11-4=7$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تحققت المعادلتان بالعدد نفسه.","En":"Both equations hold for the same value."},"CommonError":{"Ar":"اختيار عدد دون اختبار الشرطين.","En":"Choosing a number without checking both conditions."}}}$mw$::jsonb,$mw$القيمة يجب أن تحقق الشرطين.

$n=17-6$

1. نطرح 6 من 17 فنجد 11.

2. نعوض 11 في المعادلة الثانية فنجد 7.

$11+6=17,\quad11-4=7$

$11$

تحققت المعادلتان بالعدد نفسه.

اختيار عدد دون اختبار الشرطين.$mw$,$mw$The value must satisfy both conditions.

$n=17-6$

1. Subtract 6 from 17 to get 11.

2. Substitute 11 in the second equation to get 7.

$11+6=17,\quad11-4=7$

$11$

Both equations hold for the same value.

Choosing a number without checking both conditions.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالمعادلة الأولى واستعمل العملية العكسية.","En":"Start with the first equation and use its inverse."},{"Ar":"جرّب الناتج في المعادلة الثانية أيضاً.","En":"Test the result in the second equation too."}],"Solution":{"Idea":{"Ar":"القيمة يجب أن تحقق الشرطين.","En":"The value must satisfy both conditions."},"FormulaLatex":"n=17-6","Steps":[{"Ar":"نطرح 6 من 17 فنجد 11.","En":"Subtract 6 from 17 to get 11."},{"Ar":"نعوض 11 في المعادلة الثانية فنجد 7.","En":"Substitute 11 in the second equation to get 7."}],"Substitution":{"Ar":"$11+6=17,\\quad11-4=7$","En":"$11+6=17,\\quad11-4=7$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تحققت المعادلتان بالعدد نفسه.","En":"Both equations hold for the same value."},"CommonError":{"Ar":"اختيار عدد دون اختبار الشرطين.","En":"Choosing a number without checking both conditions."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج الطرح وليس المجهول.","En":"This is the subtraction result, not the unknown."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج طرح 4 من 17 ولا يحقق الشرطين.","En":"This subtracts 4 from 17 and satisfies neither equation."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا ناتج جمع 4 إلى 17 ولا يحقق المعادلتين.","En":"This adds 4 to 17 and satisfies neither equation."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-same-shaded-count-different-position-1$mw$,$mw$same-shaded-count-different-position$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"موضع الأجزاء الملونة","En":"Position of shaded parts"},"Question":{"Ar":"شريطان متساويان مقسمان إلى ستة أجزاء متساوية لكل منهما. لُوّن في الأول الجزآن الأول والثاني، وفي الثاني الجزآن الأول والسادس. ما الكسر الذي يمثل الجزء الملون في كل شريط؟","En":"Two equal strips each have six equal parts. The first two parts of one strip are shaded; the first and sixth parts of the other are shaded. What fraction is shaded in each strip?"},"Options":[{"LatexCode":"\\frac{2}{6}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{4}{6}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأجزاء غير الملونة من كل شريط.","En":"This counts the unshaded parts of each strip."}},{"LatexCode":"\\frac{5}{6}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يمثل خمسة أجزاء ملونة، بينما لُوّن جزآن فقط.","En":"This represents five shaded parts, but only two are shaded."}},{"LatexCode":"\\frac{1}{6}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب جزءاً ملوناً واحداً فقط.","En":"This counts only one shaded part."}}],"Hints":[{"Ar":"عد الأجزاء الملونة في كل شريط.","En":"Count shaded parts of each strip."},{"Ar":"تباعد الأجزاء لا يغير حجمها أو عددها.","En":"Separating the parts does not change their size or number."}],"Solution":{"Idea":{"Ar":"الكسر يعتمد على عدد الأجزاء المتساوية الملونة لا ترتيبها.","En":"The fraction depends on the count of equal shaded parts, not their positions."},"FormulaLatex":"\\frac{2}{6}","Steps":[{"Ar":"في كل شريط ستة أجزاء متساوية.","En":"Each strip has six equal parts."},{"Ar":"لُوّن جزآن من كل شريط.","En":"Two parts of each strip are shaded."}],"Substitution":{"Ar":"$\\frac{2}{6}$","En":"$\\frac{2}{6}$"},"Result":{"Ar":"$\\frac{2}{6}$","En":"$\\frac{2}{6}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"في الحالتين لدينا جزآن ملونان من ستة أجزاء.","En":"In both cases there are two shaded parts out of six."},"CommonError":{"Ar":"اعتقاد أن الأجزاء يجب أن تكون متجاورة.","En":"Thinking the parts must be adjacent."}}}$mw$::jsonb,$mw$الكسر يعتمد على عدد الأجزاء المتساوية الملونة لا ترتيبها.

$\frac{2}{6}$

1. في كل شريط ستة أجزاء متساوية.

2. لُوّن جزآن من كل شريط.

$\frac{2}{6}$

$\frac{2}{6}$

في الحالتين لدينا جزآن ملونان من ستة أجزاء.

اعتقاد أن الأجزاء يجب أن تكون متجاورة.$mw$,$mw$The fraction depends on the count of equal shaded parts, not their positions.

$\frac{2}{6}$

1. Each strip has six equal parts.

2. Two parts of each strip are shaded.

$\frac{2}{6}$

$\frac{2}{6}$

In both cases there are two shaded parts out of six.

Thinking the parts must be adjacent.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد الأجزاء الملونة في كل شريط.","En":"Count shaded parts of each strip."},{"Ar":"تباعد الأجزاء لا يغير حجمها أو عددها.","En":"Separating the parts does not change their size or number."}],"Solution":{"Idea":{"Ar":"الكسر يعتمد على عدد الأجزاء المتساوية الملونة لا ترتيبها.","En":"The fraction depends on the count of equal shaded parts, not their positions."},"FormulaLatex":"\\frac{2}{6}","Steps":[{"Ar":"في كل شريط ستة أجزاء متساوية.","En":"Each strip has six equal parts."},{"Ar":"لُوّن جزآن من كل شريط.","En":"Two parts of each strip are shaded."}],"Substitution":{"Ar":"$\\frac{2}{6}$","En":"$\\frac{2}{6}$"},"Result":{"Ar":"$\\frac{2}{6}$","En":"$\\frac{2}{6}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"في الحالتين لدينا جزآن ملونان من ستة أجزاء.","En":"In both cases there are two shaded parts out of six."},"CommonError":{"Ar":"اعتقاد أن الأجزاء يجب أن تكون متجاورة.","En":"Thinking the parts must be adjacent."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأجزاء غير الملونة من كل شريط.","En":"This counts the unshaded parts of each strip."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يمثل خمسة أجزاء ملونة، بينما لُوّن جزآن فقط.","En":"This represents five shaded parts, but only two are shaded."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب جزءاً ملوناً واحداً فقط.","En":"This counts only one shaded part."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-half-of-one-quarter-model-1$mw$,$mw$half-of-one-quarter-model$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نصف قطعة من الكل","En":"Half of a piece of the whole"},"Question":{"Ar":"قُسّم شريط إلى أربعة أرباع متساوية. قُطع ربع واحد إلى نصفين متساويين، وبقيت الأرباع الأخرى كما هي. ما الكسر من الشريط الأصلي الذي تمثله إحدى القطعتين الصغيرتين؟","En":"A strip is divided into four equal quarters. One quarter is cut into two equal halves, while the other quarters stay unchanged. What fraction of the original strip is one small piece?"},"Options":[{"LatexCode":"\\frac{1}{2}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هي نصف ربع، لا نصف الشريط.","En":"It is half a quarter, not half the strip."}},{"LatexCode":"\\frac{1}{5}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تظهر خمس قطع لكنها غير متساوية.","En":"There are five pieces but they are unequal."}},{"LatexCode":"\\frac{1}{4}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حجم الربع كاملاً قبل قطعه.","En":"This is the whole quarter before cutting."}},{"LatexCode":"\\frac{1}{8}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تخيل قطع كل ربع بالطريقة نفسها.","En":"Imagine cutting every quarter in the same way."},{"Ar":"كم قطعة صغيرة متساوية تملأ الشريط كله؟","En":"How many equal small pieces would fill the strip?"}],"Solution":{"Idea":{"Ar":"نصف الربع جزء من ثمانية أجزاء متساوية.","En":"Half a quarter is one of eight equal parts."},"FormulaLatex":"4\\times2=8","Steps":[{"Ar":"يمكن تقسيم كل ربع إلى قطعتين صغيرتين.","En":"Each quarter can be split into two small pieces."},{"Ar":"تكفي ثماني قطع صغيرة لملء الشريط.","En":"Eight small pieces would fill the strip."}],"Substitution":{"Ar":"$\\frac{1}{8}$","En":"$\\frac{1}{8}$"},"Result":{"Ar":"$\\frac{1}{8}$","En":"$\\frac{1}{8}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"قطعتان تكونان ربعاً وأربعة أرباع تكون الشريط.","En":"Two pieces make a quarter; four quarters make the strip."},"CommonError":{"Ar":"اتخاذ عدد القطع غير المتساوية مقاماً للكسر.","En":"Using the count of unequal pieces as denominator."}}}$mw$::jsonb,$mw$نصف الربع جزء من ثمانية أجزاء متساوية.

$4\times2=8$

1. يمكن تقسيم كل ربع إلى قطعتين صغيرتين.

2. تكفي ثماني قطع صغيرة لملء الشريط.

$\frac{1}{8}$

$\frac{1}{8}$

قطعتان تكونان ربعاً وأربعة أرباع تكون الشريط.

اتخاذ عدد القطع غير المتساوية مقاماً للكسر.$mw$,$mw$Half a quarter is one of eight equal parts.

$4\times2=8$

1. Each quarter can be split into two small pieces.

2. Eight small pieces would fill the strip.

$\frac{1}{8}$

$\frac{1}{8}$

Two pieces make a quarter; four quarters make the strip.

Using the count of unequal pieces as denominator.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل قطع كل ربع بالطريقة نفسها.","En":"Imagine cutting every quarter in the same way."},{"Ar":"كم قطعة صغيرة متساوية تملأ الشريط كله؟","En":"How many equal small pieces would fill the strip?"}],"Solution":{"Idea":{"Ar":"نصف الربع جزء من ثمانية أجزاء متساوية.","En":"Half a quarter is one of eight equal parts."},"FormulaLatex":"4\\times2=8","Steps":[{"Ar":"يمكن تقسيم كل ربع إلى قطعتين صغيرتين.","En":"Each quarter can be split into two small pieces."},{"Ar":"تكفي ثماني قطع صغيرة لملء الشريط.","En":"Eight small pieces would fill the strip."}],"Substitution":{"Ar":"$\\frac{1}{8}$","En":"$\\frac{1}{8}$"},"Result":{"Ar":"$\\frac{1}{8}$","En":"$\\frac{1}{8}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"قطعتان تكونان ربعاً وأربعة أرباع تكون الشريط.","En":"Two pieces make a quarter; four quarters make the strip."},"CommonError":{"Ar":"اتخاذ عدد القطع غير المتساوية مقاماً للكسر.","En":"Using the count of unequal pieces as denominator."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هي نصف ربع، لا نصف الشريط.","En":"It is half a quarter, not half the strip."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تظهر خمس قطع لكنها غير متساوية.","En":"There are five pieces but they are unequal."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا حجم الربع كاملاً قبل قطعه.","En":"This is the whole quarter before cutting."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-two-unit-numberline-scale-1$mw$,$mw$two-unit-numberline-scale$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد طول الوحدة","En":"Identifying unit length"},"Question":{"Ar":"على خط أعداد، قُسّمت المسافة من 0 إلى 2 إلى ثمانية أجزاء متساوية. ما الكسر الذي يمثل موضع العلامة الثالثة بعد الصفر؟","En":"On a number line, the interval from 0 to 2 is divided into eight equal parts. What fraction labels the third tick after zero?"},"Options":[{"LatexCode":"\\frac{3}{8}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعد المسافة من 0 إلى 2 وحدة واحدة.","En":"This treats the distance from 0 to 2 as one unit."}},{"LatexCode":"\\frac{3}{4}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{1}{4}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا موضع العلامة الأولى.","En":"This labels the first tick."}},{"LatexCode":"\\frac{3}{2}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا موضع العلامة السادسة.","En":"This labels the sixth tick."}}],"Hints":[{"Ar":"المسافة المعطاة تساوي وحدتين.","En":"The interval spans two units."},{"Ar":"كم جزءاً متساوياً يقع بين 0 و1؟","En":"How many equal intervals lie between 0 and 1?"}],"Solution":{"Idea":{"Ar":"نحدد أجزاء الوحدة الواحدة أولاً.","En":"First identify the parts of one unit."},"FormulaLatex":"8\\div2=4","Steps":[{"Ar":"لكل وحدة أربعة أجزاء متساوية.","En":"There are four equal parts per unit."},{"Ar":"العلامة الثالثة تقع عند ثلاثة أرباع.","En":"The third tick is at three quarters."}],"Substitution":{"Ar":"$\\frac{3}{4}$","En":"$\\frac{3}{4}$"},"Result":{"Ar":"$\\frac{3}{4}$","En":"$\\frac{3}{4}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"العلامة الرابعة توافق 1، والثالثة قبلها بربع.","En":"The fourth tick is 1; the third is a quarter before it."},"CommonError":{"Ar":"عد أجزاء وحدتين وكأنها أجزاء وحدة واحدة.","En":"Counting parts of two units as parts of one."}}}$mw$::jsonb,$mw$نحدد أجزاء الوحدة الواحدة أولاً.

$8\div2=4$

1. لكل وحدة أربعة أجزاء متساوية.

2. العلامة الثالثة تقع عند ثلاثة أرباع.

$\frac{3}{4}$

$\frac{3}{4}$

العلامة الرابعة توافق 1، والثالثة قبلها بربع.

عد أجزاء وحدتين وكأنها أجزاء وحدة واحدة.$mw$,$mw$First identify the parts of one unit.

$8\div2=4$

1. There are four equal parts per unit.

2. The third tick is at three quarters.

$\frac{3}{4}$

$\frac{3}{4}$

The fourth tick is 1; the third is a quarter before it.

Counting parts of two units as parts of one.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المسافة المعطاة تساوي وحدتين.","En":"The interval spans two units."},{"Ar":"كم جزءاً متساوياً يقع بين 0 و1؟","En":"How many equal intervals lie between 0 and 1?"}],"Solution":{"Idea":{"Ar":"نحدد أجزاء الوحدة الواحدة أولاً.","En":"First identify the parts of one unit."},"FormulaLatex":"8\\div2=4","Steps":[{"Ar":"لكل وحدة أربعة أجزاء متساوية.","En":"There are four equal parts per unit."},{"Ar":"العلامة الثالثة تقع عند ثلاثة أرباع.","En":"The third tick is at three quarters."}],"Substitution":{"Ar":"$\\frac{3}{4}$","En":"$\\frac{3}{4}$"},"Result":{"Ar":"$\\frac{3}{4}$","En":"$\\frac{3}{4}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"العلامة الرابعة توافق 1، والثالثة قبلها بربع.","En":"The fourth tick is 1; the third is a quarter before it."},"CommonError":{"Ar":"عد أجزاء وحدتين وكأنها أجزاء وحدة واحدة.","En":"Counting parts of two units as parts of one."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يعد المسافة من 0 إلى 2 وحدة واحدة.","En":"This treats the distance from 0 to 2 as one unit."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا موضع العلامة الأولى.","En":"This labels the first tick."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا موضع العلامة السادسة.","En":"This labels the sixth tick."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-tick-versus-interval-count-1$mw$,$mw$tick-versus-interval-count$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"العلامات والفواصل","En":"Ticks and intervals"},"Question":{"Ar":"على خط أعداد من 0 إلى 1 ست علامات متساوية التباعد، تشمل علامتي 0 و1. ما الكسر عند أول علامة بعد 0؟","En":"A number line from 0 to 1 has six equally spaced ticks, including 0 and 1. What fraction labels the first tick after 0?"},"Options":[{"LatexCode":"\\frac{1}{6}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعد العلامات لا الفواصل بينها.","En":"This counts ticks rather than intervals."}},{"LatexCode":"\\frac{1}{4}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل أحد الفواصل الخمسة.","En":"This omits one of the five intervals."}},{"LatexCode":"\\frac{1}{5}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{2}{5}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا موضع العلامة الثانية بعد الصفر.","En":"This labels the second tick after zero."}}],"Hints":[{"Ar":"الفاصل هو المسافة بين علامتين متجاورتين.","En":"An interval is the space between neighboring ticks."},{"Ar":"ارسم ست علامات وعد المسافات بينها.","En":"Draw six ticks and count the spaces between them."}],"Solution":{"Idea":{"Ar":"عدد الفواصل أقل بواحد من عدد العلامات.","En":"There is one fewer interval than ticks."},"FormulaLatex":"6-1=5","Steps":[{"Ar":"العلامات الست تحدد خمسة فواصل متساوية.","En":"Six ticks determine five equal intervals."},{"Ar":"العلامة الأولى بعد الصفر تبعد خمس الوحدة.","En":"The first tick after zero is one fifth away."}],"Substitution":{"Ar":"$\\frac{1}{5}$","En":"$\\frac{1}{5}$"},"Result":{"Ar":"$\\frac{1}{5}$","En":"$\\frac{1}{5}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"خمسة أخماس تساوي وحدة كاملة.","En":"Five fifths make one whole unit."},"CommonError":{"Ar":"اعتبار عدد العلامات هو عدد الأجزاء.","En":"Treating the tick count as the part count."}}}$mw$::jsonb,$mw$عدد الفواصل أقل بواحد من عدد العلامات.

$6-1=5$

1. العلامات الست تحدد خمسة فواصل متساوية.

2. العلامة الأولى بعد الصفر تبعد خمس الوحدة.

$\frac{1}{5}$

$\frac{1}{5}$

خمسة أخماس تساوي وحدة كاملة.

اعتبار عدد العلامات هو عدد الأجزاء.$mw$,$mw$There is one fewer interval than ticks.

$6-1=5$

1. Six ticks determine five equal intervals.

2. The first tick after zero is one fifth away.

$\frac{1}{5}$

$\frac{1}{5}$

Five fifths make one whole unit.

Treating the tick count as the part count.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"الفاصل هو المسافة بين علامتين متجاورتين.","En":"An interval is the space between neighboring ticks."},{"Ar":"ارسم ست علامات وعد المسافات بينها.","En":"Draw six ticks and count the spaces between them."}],"Solution":{"Idea":{"Ar":"عدد الفواصل أقل بواحد من عدد العلامات.","En":"There is one fewer interval than ticks."},"FormulaLatex":"6-1=5","Steps":[{"Ar":"العلامات الست تحدد خمسة فواصل متساوية.","En":"Six ticks determine five equal intervals."},{"Ar":"العلامة الأولى بعد الصفر تبعد خمس الوحدة.","En":"The first tick after zero is one fifth away."}],"Substitution":{"Ar":"$\\frac{1}{5}$","En":"$\\frac{1}{5}$"},"Result":{"Ar":"$\\frac{1}{5}$","En":"$\\frac{1}{5}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"خمسة أخماس تساوي وحدة كاملة.","En":"Five fifths make one whole unit."},"CommonError":{"Ar":"اعتبار عدد العلامات هو عدد الأجزاء.","En":"Treating the tick count as the part count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يعد العلامات لا الفواصل بينها.","En":"This counts ticks rather than intervals."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل أحد الفواصل الخمسة.","En":"This omits one of the five intervals."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا موضع العلامة الثانية بعد الصفر.","En":"This labels the second tick after zero."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-fraction-reference-nongreen-1$mw$,$mw$fraction-reference-nongreen$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المجموعة المرجعية","En":"The reference group"},"Question":{"Ar":"في فسيفساء 4 مربعات حمراء و3 زرقاء ومربعان أخضران، كلها متساوية المساحة. إذا نظرنا فقط إلى المربعات غير الخضراء، فما الكسر الذي تمثله المربعات الحمراء من تلك المجموعة؟","En":"A mosaic has 4 red squares, 3 blue squares and 2 green squares, all of equal area. Considering only the non-green squares, what fraction of that group is red?"},"Options":[{"LatexCode":"\\frac{4}{9}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضم الخضراء إلى المجموعة المرجعية.","En":"This includes green squares in the reference group."}},{"LatexCode":"\\frac{3}{7}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يمثل المربعات الزرقاء.","En":"This is the blue fraction."}},{"LatexCode":"\\frac{2}{7}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يستعمل عدد المربعات المستبعدة كبسط.","En":"This uses the excluded count as numerator."}},{"LatexCode":"\\frac{4}{7}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"أي الألوان تدخل في المجموعة المطلوبة؟","En":"Which colors belong to the requested group?"},{"Ar":"اجمع عدد المربعات الحمراء والزرقاء.","En":"Add the red and blue counts."}],"Solution":{"Idea":{"Ar":"نحدد المجموعة المرجعية قبل حساب الكسر.","En":"Identify the reference group first."},"FormulaLatex":"4+3=7","Steps":[{"Ar":"المجموعة غير الخضراء تضم 7 مربعات.","En":"The non-green group has 7 squares."},{"Ar":"منها 4 حمراء.","En":"Four of them are red."}],"Substitution":{"Ar":"$\\frac{4}{7}$","En":"$\\frac{4}{7}$"},"Result":{"Ar":"$\\frac{4}{7}$","En":"$\\frac{4}{7}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربعة حمراء وثلاثة زرقاء تكمل المجموعة.","En":"Four red and three blue squares make the group."},"CommonError":{"Ar":"استعمال جميع المربعات مقاماً رغم استبعاد الخضراء.","En":"Using all squares as denominator despite excluding green ones."}}}$mw$::jsonb,$mw$نحدد المجموعة المرجعية قبل حساب الكسر.

$4+3=7$

1. المجموعة غير الخضراء تضم 7 مربعات.

2. منها 4 حمراء.

$\frac{4}{7}$

$\frac{4}{7}$

أربعة حمراء وثلاثة زرقاء تكمل المجموعة.

استعمال جميع المربعات مقاماً رغم استبعاد الخضراء.$mw$,$mw$Identify the reference group first.

$4+3=7$

1. The non-green group has 7 squares.

2. Four of them are red.

$\frac{4}{7}$

$\frac{4}{7}$

Four red and three blue squares make the group.

Using all squares as denominator despite excluding green ones.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أي الألوان تدخل في المجموعة المطلوبة؟","En":"Which colors belong to the requested group?"},{"Ar":"اجمع عدد المربعات الحمراء والزرقاء.","En":"Add the red and blue counts."}],"Solution":{"Idea":{"Ar":"نحدد المجموعة المرجعية قبل حساب الكسر.","En":"Identify the reference group first."},"FormulaLatex":"4+3=7","Steps":[{"Ar":"المجموعة غير الخضراء تضم 7 مربعات.","En":"The non-green group has 7 squares."},{"Ar":"منها 4 حمراء.","En":"Four of them are red."}],"Substitution":{"Ar":"$\\frac{4}{7}$","En":"$\\frac{4}{7}$"},"Result":{"Ar":"$\\frac{4}{7}$","En":"$\\frac{4}{7}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربعة حمراء وثلاثة زرقاء تكمل المجموعة.","En":"Four red and three blue squares make the group."},"CommonError":{"Ar":"استعمال جميع المربعات مقاماً رغم استبعاد الخضراء.","En":"Using all squares as denominator despite excluding green ones."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يضم الخضراء إلى المجموعة المرجعية.","En":"This includes green squares in the reference group."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يمثل المربعات الزرقاء.","En":"This is the blue fraction."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يستعمل عدد المربعات المستبعدة كبسط.","En":"This uses the excluded count as numerator."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-overlapping-row-column-shading-1$mw$,$mw$overlapping-row-column-shading$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تلوين صف وعمود","En":"Shading a row and column"},"Question":{"Ar":"مربع مكوّن من 4 صفوف و4 أعمدة من خلايا متساوية. لُوّن الصف الأول والعمود الأول بالكامل، مع احتساب الخلية المشتركة مرة واحدة. ما الكسر الملون من المربع؟","En":"A square has 4 rows and 4 columns of equal cells. The entire first row and first column are shaded, counting their shared cell only once. What fraction is shaded?"},"Options":[{"LatexCode":"\\frac{8}{16}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعد الخلية المشتركة مرتين.","En":"This counts the shared cell twice."}},{"LatexCode":"\\frac{7}{16}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{4}{16}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب صفاً واحداً أو عموداً فقط.","En":"This counts only a row or column."}},{"LatexCode":"\\frac{6}{16}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح خليتين بدلاً من واحدة.","En":"This subtracts two cells instead of one."}}],"Hints":[{"Ar":"عد جميع الخلايا أولاً.","En":"Count all cells first."},{"Ar":"بعد تلوين الصف، كم خلية جديدة يضيفها العمود؟","En":"After shading the row, how many new cells does the column add?"}],"Solution":{"Idea":{"Ar":"نحسب الخلايا المختلفة الملونة ثم ننسبها للكل.","En":"Count distinct shaded cells and relate them to the whole."},"FormulaLatex":"4\\times4=16,\\quad4+3=7","Steps":[{"Ar":"في المربع 16 خلية متساوية.","En":"There are 16 equal cells."},{"Ar":"الصف يلون أربع خلايا والعمود يضيف ثلاثاً.","En":"The row shades four cells and the column adds three."}],"Substitution":{"Ar":"$\\frac{7}{16}$","En":"$\\frac{7}{16}$"},"Result":{"Ar":"$\\frac{7}{16}$","En":"$\\frac{7}{16}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تبقى تسع خلايا غير ملونة، و7 مع 9 يساوي 16.","En":"Nine cells remain unshaded; 7 plus 9 equals 16."},"CommonError":{"Ar":"عد خلية التقاطع مرتين.","En":"Counting the intersection twice."}}}$mw$::jsonb,$mw$نحسب الخلايا المختلفة الملونة ثم ننسبها للكل.

$4\times4=16,\quad4+3=7$

1. في المربع 16 خلية متساوية.

2. الصف يلون أربع خلايا والعمود يضيف ثلاثاً.

$\frac{7}{16}$

$\frac{7}{16}$

تبقى تسع خلايا غير ملونة، و7 مع 9 يساوي 16.

عد خلية التقاطع مرتين.$mw$,$mw$Count distinct shaded cells and relate them to the whole.

$4\times4=16,\quad4+3=7$

1. There are 16 equal cells.

2. The row shades four cells and the column adds three.

$\frac{7}{16}$

$\frac{7}{16}$

Nine cells remain unshaded; 7 plus 9 equals 16.

Counting the intersection twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد جميع الخلايا أولاً.","En":"Count all cells first."},{"Ar":"بعد تلوين الصف، كم خلية جديدة يضيفها العمود؟","En":"After shading the row, how many new cells does the column add?"}],"Solution":{"Idea":{"Ar":"نحسب الخلايا المختلفة الملونة ثم ننسبها للكل.","En":"Count distinct shaded cells and relate them to the whole."},"FormulaLatex":"4\\times4=16,\\quad4+3=7","Steps":[{"Ar":"في المربع 16 خلية متساوية.","En":"There are 16 equal cells."},{"Ar":"الصف يلون أربع خلايا والعمود يضيف ثلاثاً.","En":"The row shades four cells and the column adds three."}],"Substitution":{"Ar":"$\\frac{7}{16}$","En":"$\\frac{7}{16}$"},"Result":{"Ar":"$\\frac{7}{16}$","En":"$\\frac{7}{16}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تبقى تسع خلايا غير ملونة، و7 مع 9 يساوي 16.","En":"Nine cells remain unshaded; 7 plus 9 equals 16."},"CommonError":{"Ar":"عد خلية التقاطع مرتين.","En":"Counting the intersection twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يعد الخلية المشتركة مرتين.","En":"This counts the shared cell twice."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب صفاً واحداً أو عموداً فقط.","En":"This counts only a row or column."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح خليتين بدلاً من واحدة.","En":"This subtracts two cells instead of one."},"Order":4}]}$mw$),
($mw$growth-v80-grade-3-quarter-of-longer-whole-1$mw$,$mw$quarter-of-longer-whole$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كسور من وحدتين مختلفتين","En":"Fractions of different wholes"},"Question":{"Ar":"طول الشريط B يساوي نصف طول الشريط A. ما الكسر من الشريط B الذي يساوي في الطول ربع الشريط A؟","En":"Strip B is half as long as strip A. What fraction of strip B equals one quarter of strip A in length?"},"Options":[{"LatexCode":"\\frac{1}{4}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الربعان من شريطين مختلفي الطول لا يتساويان هنا.","En":"Quarters of these different wholes are unequal."}},{"LatexCode":"\\frac{1}{8}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا أقصر من ربع الشريط الأطول.","En":"This is shorter than a quarter of the longer strip."}},{"LatexCode":"\\frac{1}{2}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{3}{4}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا أطول من ربع الشريط A.","En":"This exceeds a quarter of strip A."}}],"Hints":[{"Ar":"تخيل وضع نسختين من B بجانب بعضهما.","En":"Imagine two copies of B placed end to end."},{"Ar":"اقسم كل نسخة إلى نصفين وعد القطع التي تملأ A.","En":"Halve each copy and count the pieces filling A."}],"Solution":{"Idea":{"Ar":"نصف الشريط الأقصر يمثل ربع الشريط الذي يبلغ ضعف طوله.","En":"Half of the shorter strip is a quarter of the strip twice its length."},"FormulaLatex":"2\\times2=4","Steps":[{"Ar":"الشريط A يساوي شريطين من طول B.","En":"Strip A equals two copies of B."},{"Ar":"بتنصيف كل منهما نحصل على أربعة أرباع من A.","En":"Halving each gives four quarters of A."}],"Substitution":{"Ar":"$\\frac{1}{2}$","En":"$\\frac{1}{2}$"},"Result":{"Ar":"$\\frac{1}{2}$","En":"$\\frac{1}{2}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربعة أنصاف من B تملأ A كاملاً.","En":"Four halves of B fill all of A."},"CommonError":{"Ar":"مقارنة الكسور دون مراعاة اختلاف طول الكل.","En":"Comparing fractions without considering the different wholes."}}}$mw$::jsonb,$mw$نصف الشريط الأقصر يمثل ربع الشريط الذي يبلغ ضعف طوله.

$2\times2=4$

1. الشريط A يساوي شريطين من طول B.

2. بتنصيف كل منهما نحصل على أربعة أرباع من A.

$\frac{1}{2}$

$\frac{1}{2}$

أربعة أنصاف من B تملأ A كاملاً.

مقارنة الكسور دون مراعاة اختلاف طول الكل.$mw$,$mw$Half of the shorter strip is a quarter of the strip twice its length.

$2\times2=4$

1. Strip A equals two copies of B.

2. Halving each gives four quarters of A.

$\frac{1}{2}$

$\frac{1}{2}$

Four halves of B fill all of A.

Comparing fractions without considering the different wholes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل وضع نسختين من B بجانب بعضهما.","En":"Imagine two copies of B placed end to end."},{"Ar":"اقسم كل نسخة إلى نصفين وعد القطع التي تملأ A.","En":"Halve each copy and count the pieces filling A."}],"Solution":{"Idea":{"Ar":"نصف الشريط الأقصر يمثل ربع الشريط الذي يبلغ ضعف طوله.","En":"Half of the shorter strip is a quarter of the strip twice its length."},"FormulaLatex":"2\\times2=4","Steps":[{"Ar":"الشريط A يساوي شريطين من طول B.","En":"Strip A equals two copies of B."},{"Ar":"بتنصيف كل منهما نحصل على أربعة أرباع من A.","En":"Halving each gives four quarters of A."}],"Substitution":{"Ar":"$\\frac{1}{2}$","En":"$\\frac{1}{2}$"},"Result":{"Ar":"$\\frac{1}{2}$","En":"$\\frac{1}{2}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربعة أنصاف من B تملأ A كاملاً.","En":"Four halves of B fill all of A."},"CommonError":{"Ar":"مقارنة الكسور دون مراعاة اختلاف طول الكل.","En":"Comparing fractions without considering the different wholes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الربعان من شريطين مختلفي الطول لا يتساويان هنا.","En":"Quarters of these different wholes are unequal."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا أقصر من ربع الشريط الأطول.","En":"This is shorter than a quarter of the longer strip."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا أطول من ربع الشريط A.","En":"This exceeds a quarter of strip A."},"Order":4}]}$mw$);
DO $$ BEGIN IF EXISTS (SELECT 1 FROM (SELECT track, category, count(*) n FROM growth_batch GROUP BY 1,2) b WHERE b.n+(SELECT count(*) FROM "LearningTrackProblems" tp JOIN "Problems" p ON p."Id"=tp."ProblemId" WHERE tp."TrackId"=b.track AND p."CategoryId"=b.category)>20) THEN RAISE EXCEPTION 'Target already filled'; END IF; END $$;
CREATE TEMP TABLE growth_seen ON COMMIT DROP AS SELECT upper(regexp_replace(btrim(ar),'[[:space:]]+',' ','g')) ar,upper(regexp_replace(btrim(en),'[[:space:]]+',' ','g')) en FROM (SELECT "QuestionTextAr" ar,"QuestionTextEn" en FROM public."Problems" UNION ALL SELECT "QuestionTextAr","QuestionTextEn" FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn' AND "WizardJson" IS NOT NULL UNION ALL SELECT "WizardJson"::jsonb#>>'{Question,Ar}',"WizardJson"::jsonb#>>'{Question,En}' FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn') q;
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM growth_seen q WHERE q.ar=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR q.en=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO growth_seen VALUES (upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')),upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')));
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v80 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
