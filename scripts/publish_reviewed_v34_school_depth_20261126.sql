-- One-time owner-authorized v34 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v34-grade-4-recover-coefficient-known-solution-1$mw$,$mw$recover-coefficient-known-solution$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إيجاد معامل مجهول","En":"Finding an unknown coefficient"},"Question":{"Ar":"المعادلة ak=56 تتحقق عندما k=8. ما قيمة a؟","En":"The equation ak=56 is satisfied when k=8. What is a?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6×8=48 لا 56.","En":"6×8=48, not 56."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8×8=64.","En":"8×8=64."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"48 ناتج الطرح لا القسمة.","En":"48 is the subtraction result, not the quotient."}}],"Hints":[{"Ar":"عوّض 8 مكان k.","En":"Substitute 8 for k."},{"Ar":"ما العدد الذي إذا ضربناه في 8 أعطى 56؟","En":"What number multiplied by 8 gives 56?"}],"Solution":{"Idea":{"Ar":"نعوّض بالقيمة المعروفة ثم نجد العامل المجهول بالقسمة.","En":"Substitute the known value, then divide to find the unknown factor."},"FormulaLatex":"a=56/8","Steps":[{"Ar":"$8a=56$","En":"$8a=56$"},{"Ar":"$a=56\\div8$","En":"$a=56\\div8$"}],"Substitution":{"Ar":"$56\\div8=7$","En":"$56\\div8=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7\\cdot8=56$","En":"$7\\cdot8=56$"},"CommonError":{"Ar":"لا تطرح العامل المعروف من الناتج.","En":"Do not subtract the known factor from the product."}}}$mw$::jsonb,$mw$نعوّض بالقيمة المعروفة ثم نجد العامل المجهول بالقسمة.

$a=56/8$

1. $8a=56$

2. $a=56\div8$

$56\div8=7$

$7$

$7\cdot8=56$

لا تطرح العامل المعروف من الناتج.$mw$,$mw$Substitute the known value, then divide to find the unknown factor.

$a=56/8$

1. $8a=56$

2. $a=56\div8$

$56\div8=7$

$7$

$7\cdot8=56$

Do not subtract the known factor from the product.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض 8 مكان k.","En":"Substitute 8 for k."},{"Ar":"ما العدد الذي إذا ضربناه في 8 أعطى 56؟","En":"What number multiplied by 8 gives 56?"}],"Solution":{"Idea":{"Ar":"نعوّض بالقيمة المعروفة ثم نجد العامل المجهول بالقسمة.","En":"Substitute the known value, then divide to find the unknown factor."},"FormulaLatex":"a=56/8","Steps":[{"Ar":"$8a=56$","En":"$8a=56$"},{"Ar":"$a=56\\div8$","En":"$a=56\\div8$"}],"Substitution":{"Ar":"$56\\div8=7$","En":"$56\\div8=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7\\cdot8=56$","En":"$7\\cdot8=56$"},"CommonError":{"Ar":"لا تطرح العامل المعروف من الناتج.","En":"Do not subtract the known factor from the product."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"6×8=48 لا 56.","En":"6×8=48, not 56."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8×8=64.","En":"8×8=64."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"48 ناتج الطرح لا القسمة.","En":"48 is the subtraction result, not the quotient."},"Order":4}]}$mw$),
($mw$growth-v34-grade-4-unknown-factor-model-selection-1$mw$,$mw$unknown-factor-model-selection$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار معادلة المجموعات المتساوية","En":"Choosing an equal-groups equation"},"Question":{"Ar":"في كل صندوق 6 أقلام. عدد الصناديق n، ومجموع الأقلام 72. أي معادلة تمثل الموقف؟","En":"Each box contains 6 pens. There are n boxes and 72 pens altogether. Which equation models this situation?"},"Options":[{"LatexCode":"n+6=72","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع لا يمثل ستة أقلام في كل صندوق.","En":"Addition does not represent six pens per box."}},{"LatexCode":"n\\div6=72","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القسمة هنا لا تعطي المجموع.","En":"This division does not give the total."}},{"LatexCode":"6n=72","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"72n=6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"72 هو المجموع وليس عدد الأقلام في كل صندوق.","En":"72 is the total, not the number in each box."}}],"Hints":[{"Ar":"هل المجموعات متساوية؟","En":"Are the groups equal?"},{"Ar":"اضرب عدد الصناديق في عدد الأقلام في الصندوق.","En":"Multiply box count by pens per box."}],"Solution":{"Idea":{"Ar":"المجموع يساوي عدد المجموعات مضروباً في عدد العناصر في كل مجموعة.","En":"The total is the number of groups times the number of items per group."},"FormulaLatex":"T=n\\cdot6","Steps":[{"Ar":"عدد الصناديق غير معلوم، وهو n.","En":"The unknown number of boxes is n."},{"Ar":"في كل صندوق ستة أقلام، فنضرب n في 6.","En":"Each box has six pens, so multiply n by 6."}],"Substitution":{"Ar":"$T=72=6n$","En":"$T=72=6n$"},"Result":{"Ar":"$6n=72$","En":"$6n=72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot12=72$","En":"$6\\cdot12=72$"},"CommonError":{"Ar":"لا تخلط بين العدد الكلي وعدد عناصر المجموعة.","En":"Do not confuse total count with items per group."}}}$mw$::jsonb,$mw$المجموع يساوي عدد المجموعات مضروباً في عدد العناصر في كل مجموعة.

$T=n\cdot6$

1. عدد الصناديق غير معلوم، وهو n.

2. في كل صندوق ستة أقلام، فنضرب n في 6.

$T=72=6n$

$6n=72$

$6\cdot12=72$

لا تخلط بين العدد الكلي وعدد عناصر المجموعة.$mw$,$mw$The total is the number of groups times the number of items per group.

$T=n\cdot6$

1. The unknown number of boxes is n.

2. Each box has six pens, so multiply n by 6.

$T=72=6n$

$6n=72$

$6\cdot12=72$

Do not confuse total count with items per group.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل المجموعات متساوية؟","En":"Are the groups equal?"},{"Ar":"اضرب عدد الصناديق في عدد الأقلام في الصندوق.","En":"Multiply box count by pens per box."}],"Solution":{"Idea":{"Ar":"المجموع يساوي عدد المجموعات مضروباً في عدد العناصر في كل مجموعة.","En":"The total is the number of groups times the number of items per group."},"FormulaLatex":"T=n\\cdot6","Steps":[{"Ar":"عدد الصناديق غير معلوم، وهو n.","En":"The unknown number of boxes is n."},{"Ar":"في كل صندوق ستة أقلام، فنضرب n في 6.","En":"Each box has six pens, so multiply n by 6."}],"Substitution":{"Ar":"$T=72=6n$","En":"$T=72=6n$"},"Result":{"Ar":"$6n=72$","En":"$6n=72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot12=72$","En":"$6\\cdot12=72$"},"CommonError":{"Ar":"لا تخلط بين العدد الكلي وعدد عناصر المجموعة.","En":"Do not confuse total count with items per group."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الجمع لا يمثل ستة أقلام في كل صندوق.","En":"Addition does not represent six pens per box."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"القسمة هنا لا تعطي المجموع.","En":"This division does not give the total."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"72 هو المجموع وليس عدد الأقلام في كل صندوق.","En":"72 is the total, not the number in each box."},"Order":4}]}$mw$),
($mw$growth-v34-grade-7-fractional-coefficient-equation-1$mw$,$mw$fractional-coefficient-equation$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة بمعامل كسري","En":"Equation with a fractional coefficient"},"Question":{"Ar":"حل المعادلة $\\frac34x-2=7$.","En":"Solve $\\frac34x-2=7$."},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 قيمة ثلاثة أرباع x لا قيمة x.","En":"9 is three quarters of x, not x itself."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{27}{4}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضرب 9 في ثلاثة أرباع بدلاً من مقلوبها.","En":"Multiplies 9 by three quarters instead of its reciprocal."}},{"LatexCode":"\\frac{20}{3}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينتج عن طرح 2 من 7 بدلاً من جمعهما.","En":"Subtracts 2 from 7 rather than adding."}}],"Hints":[{"Ar":"أضف 2 إلى الطرفين.","En":"Add 2 to both sides."},{"Ar":"اضرب الطرفين في مقلوب ثلاثة أرباع.","En":"Multiply both sides by the reciprocal of three quarters."}],"Solution":{"Idea":{"Ar":"نعزل الحد الذي يحتوي المتغير ثم نضرب الطرفين بمقلوب المعامل الكسري.","En":"Isolate the variable term and multiply both sides by the reciprocal of its fractional coefficient."},"FormulaLatex":"x=(7+2)\\cdot\\frac43","Steps":[{"Ar":"$\\frac34x=7+2=9$","En":"$\\frac34x=7+2=9$"},{"Ar":"$x=9\\cdot\\frac43=12$","En":"$x=9\\cdot\\frac43=12$"}],"Substitution":{"Ar":"$x=12$","En":"$x=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac34\\cdot12-2=7$","En":"$\\frac34\\cdot12-2=7$"},"CommonError":{"Ar":"لا تضرب في المعامل نفسه عند عزله.","En":"Do not multiply by the coefficient itself when isolating the variable."}}}$mw$::jsonb,$mw$نعزل الحد الذي يحتوي المتغير ثم نضرب الطرفين بمقلوب المعامل الكسري.

$x=(7+2)\cdot\frac43$

1. $\frac34x=7+2=9$

2. $x=9\cdot\frac43=12$

$x=12$

$12$

$\frac34\cdot12-2=7$

لا تضرب في المعامل نفسه عند عزله.$mw$,$mw$Isolate the variable term and multiply both sides by the reciprocal of its fractional coefficient.

$x=(7+2)\cdot\frac43$

1. $\frac34x=7+2=9$

2. $x=9\cdot\frac43=12$

$x=12$

$12$

$\frac34\cdot12-2=7$

Do not multiply by the coefficient itself when isolating the variable.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أضف 2 إلى الطرفين.","En":"Add 2 to both sides."},{"Ar":"اضرب الطرفين في مقلوب ثلاثة أرباع.","En":"Multiply both sides by the reciprocal of three quarters."}],"Solution":{"Idea":{"Ar":"نعزل الحد الذي يحتوي المتغير ثم نضرب الطرفين بمقلوب المعامل الكسري.","En":"Isolate the variable term and multiply both sides by the reciprocal of its fractional coefficient."},"FormulaLatex":"x=(7+2)\\cdot\\frac43","Steps":[{"Ar":"$\\frac34x=7+2=9$","En":"$\\frac34x=7+2=9$"},{"Ar":"$x=9\\cdot\\frac43=12$","En":"$x=9\\cdot\\frac43=12$"}],"Substitution":{"Ar":"$x=12$","En":"$x=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac34\\cdot12-2=7$","En":"$\\frac34\\cdot12-2=7$"},"CommonError":{"Ar":"لا تضرب في المعامل نفسه عند عزله.","En":"Do not multiply by the coefficient itself when isolating the variable."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"9 قيمة ثلاثة أرباع x لا قيمة x.","En":"9 is three quarters of x, not x itself."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يضرب 9 في ثلاثة أرباع بدلاً من مقلوبها.","En":"Multiplies 9 by three quarters instead of its reciprocal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ينتج عن طرح 2 من 7 بدلاً من جمعهما.","En":"Subtracts 2 from 7 rather than adding."},"Order":4}]}$mw$),
($mw$growth-v34-grade-7-grouped-linear-equation-context-1$mw$,$mw$grouped-linear-equation-context$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تكلفة مجموعات متطابقة","En":"Cost of identical groups"},"Question":{"Ar":"اشترت مدرسة ثلاث مجموعات متطابقة، في كل مجموعة دفتر بسعر x وحدات نقدية وغلاف بسعر 4 وحدات. دفعت 45 وحدة إجمالاً. ما سعر الدفتر الواحد؟","En":"A school buys three identical sets, each with a notebook costing x currency units and a cover costing 4 units. The total is 45 units. What is the price of one notebook?"},"Options":[{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"13 لا يحقق مجموع 45 لثلاث مجموعات.","En":"13 does not give a total of 45 for three sets."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 سعر المجموعة كاملة بما فيها الغلاف.","En":"15 is the price of a whole set including the cover."}},{"LatexCode":"41","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"41 يطرح سعر غلاف واحد من مجموع المجموعات الثلاث.","En":"41 subtracts one cover from the total of three sets."}}],"Hints":[{"Ar":"كم ثمن مجموعة واحدة؟","En":"What is the price of one set?"},{"Ar":"استبعد ثمن الغلاف من ثمن المجموعة.","En":"Subtract the cover cost from the set price."}],"Solution":{"Idea":{"Ar":"نحسب سعر المجموعة الواحدة بالقسمة ثم نطرح سعر الغلاف.","En":"Divide to find the price per set, then subtract the cover price."},"FormulaLatex":"3(x+4)=45","Steps":[{"Ar":"$x+4=45/3=15$","En":"$x+4=45/3=15$"},{"Ar":"$x=15-4=11$","En":"$x=15-4=11$"}],"Substitution":{"Ar":"$x=11$","En":"$x=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3(11+4)=45$","En":"$3(11+4)=45$"},"CommonError":{"Ar":"الغلاف موجود في كل مجموعة، لا مرة واحدة فقط.","En":"Every set includes a cover, not just one cover overall."}}}$mw$::jsonb,$mw$نحسب سعر المجموعة الواحدة بالقسمة ثم نطرح سعر الغلاف.

$3(x+4)=45$

1. $x+4=45/3=15$

2. $x=15-4=11$

$x=11$

$11$

$3(11+4)=45$

الغلاف موجود في كل مجموعة، لا مرة واحدة فقط.$mw$,$mw$Divide to find the price per set, then subtract the cover price.

$3(x+4)=45$

1. $x+4=45/3=15$

2. $x=15-4=11$

$x=11$

$11$

$3(11+4)=45$

Every set includes a cover, not just one cover overall.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم ثمن مجموعة واحدة؟","En":"What is the price of one set?"},{"Ar":"استبعد ثمن الغلاف من ثمن المجموعة.","En":"Subtract the cover cost from the set price."}],"Solution":{"Idea":{"Ar":"نحسب سعر المجموعة الواحدة بالقسمة ثم نطرح سعر الغلاف.","En":"Divide to find the price per set, then subtract the cover price."},"FormulaLatex":"3(x+4)=45","Steps":[{"Ar":"$x+4=45/3=15$","En":"$x+4=45/3=15$"},{"Ar":"$x=15-4=11$","En":"$x=15-4=11$"}],"Substitution":{"Ar":"$x=11$","En":"$x=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3(11+4)=45$","En":"$3(11+4)=45$"},"CommonError":{"Ar":"الغلاف موجود في كل مجموعة، لا مرة واحدة فقط.","En":"Every set includes a cover, not just one cover overall."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"13 لا يحقق مجموع 45 لثلاث مجموعات.","En":"13 does not give a total of 45 for three sets."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"15 سعر المجموعة كاملة بما فيها الغلاف.","En":"15 is the price of a whole set including the cover."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"41 يطرح سعر غلاف واحد من مجموع المجموعات الثلاث.","En":"41 subtracts one cover from the total of three sets."},"Order":4}]}$mw$),
($mw$growth-v34-grade-1-category-count-tied-largest-1$mw$,$mw$category-count-tied-largest$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قراءة أكبر عدد مشترك","En":"Reading tied largest counts"},"Question":{"Ar":"في سجل الألوان المفضلة: الأحمر 5، الأزرق 3، الأخضر 5، الأصفر 2. كم لوناً حصل على أكبر عدد من الاختيارات؟","En":"Favourite colour counts are red 5, blue 3, green 5 and yellow 2. How many colours received the largest number of choices?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يوجد لونان متساويان في العدد الأكبر.","En":"Two colours tie for the largest count."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة ليس عدد الألوان صاحبة العدد الأكبر.","En":"Three is not the number of colours with the largest count."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 عدد الاختيارات لكل لون فائز، وليس عدد الألوان.","En":"5 is the largest vote count, not the number of colours."}}],"Hints":[{"Ar":"ابحث عن أكبر عدد في السجل.","En":"Find the largest number in the record."},{"Ar":"هل يتكرر هذا العدد عند أكثر من لون؟","En":"Does that number occur for more than one colour?"}],"Solution":{"Idea":{"Ar":"نحدد العدد الأكبر ثم نعد الفئات التي تساويه.","En":"Find the largest count, then count the categories matching it."},"FormulaLatex":"5=5>3>2","Steps":[{"Ar":"أكبر عدد من الاختيارات هو 5.","En":"The largest choice count is 5."},{"Ar":"الأحمر والأخضر فقط لهما هذا العدد.","En":"Only red and green have this count."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5=5$","En":"$5=5$"},"CommonError":{"Ar":"المطلوب عدد الألوان لا عدد الاختيارات.","En":"Count colours, not choices."}}}$mw$::jsonb,$mw$نحدد العدد الأكبر ثم نعد الفئات التي تساويه.

$5=5>3>2$

1. أكبر عدد من الاختيارات هو 5.

2. الأحمر والأخضر فقط لهما هذا العدد.

$1+1=2$

$2$

$5=5$

المطلوب عدد الألوان لا عدد الاختيارات.$mw$,$mw$Find the largest count, then count the categories matching it.

$5=5>3>2$

1. The largest choice count is 5.

2. Only red and green have this count.

$1+1=2$

$2$

$5=5$

Count colours, not choices.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابحث عن أكبر عدد في السجل.","En":"Find the largest number in the record."},{"Ar":"هل يتكرر هذا العدد عند أكثر من لون؟","En":"Does that number occur for more than one colour?"}],"Solution":{"Idea":{"Ar":"نحدد العدد الأكبر ثم نعد الفئات التي تساويه.","En":"Find the largest count, then count the categories matching it."},"FormulaLatex":"5=5>3>2","Steps":[{"Ar":"أكبر عدد من الاختيارات هو 5.","En":"The largest choice count is 5."},{"Ar":"الأحمر والأخضر فقط لهما هذا العدد.","En":"Only red and green have this count."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5=5$","En":"$5=5$"},"CommonError":{"Ar":"المطلوب عدد الألوان لا عدد الاختيارات.","En":"Count colours, not choices."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يوجد لونان متساويان في العدد الأكبر.","En":"Two colours tie for the largest count."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة ليس عدد الألوان صاحبة العدد الأكبر.","En":"Three is not the number of colours with the largest count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"5 عدد الاختيارات لكل لون فائز، وليس عدد الألوان.","En":"5 is the largest vote count, not the number of colours."},"Order":4}]}$mw$),
($mw$growth-v34-grade-2-rectangular-equal-parts-unshaded-fraction-1$mw$,$mw$rectangular-equal-parts-unshaded-fraction$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"الجزء غير الملوّن من شكل","En":"Uncoloured part of a shape"},"Question":{"Ar":"قُسّم مستطيل إلى أربعة أجزاء متساوية المساحة. لُوّن جزء واحد بالأزرق وجزء آخر بالأحمر. ما الكسر الذي يمثل المساحة غير الملوّنة؟","En":"A rectangle is partitioned into four equal-area parts. One part is coloured blue and another red. What fraction of the rectangle is uncoloured?"},"Options":[{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربع واحد يهمل جزءاً غير ملوّن.","En":"One quarter misses an uncoloured part."}},{"LatexCode":"\\frac24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أرباع تستبعد جزءاً ملوّناً واحداً فقط.","En":"Three quarters excludes only one coloured part."}},{"LatexCode":"\\frac44","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعة أرباع تمثل الشكل كله.","En":"Four quarters represent the entire shape."}}],"Hints":[{"Ar":"عد الأجزاء الملوّنة أولاً.","En":"Count the coloured parts first."},{"Ar":"كم جزءاً يبقى من الأربعة؟","En":"How many of the four parts remain?"}],"Solution":{"Idea":{"Ar":"كل جزء يساوي ربع المساحة، ونجمع الأجزاء غير الملوّنة فقط.","En":"Each part is one quarter of the area; count only the uncoloured parts."},"FormulaLatex":"\\frac{4-2}{4}","Steps":[{"Ar":"جزآن مختلفان ملوّنان من أصل أربعة.","En":"Two distinct parts out of four are coloured."},{"Ar":"يبقى جزآن غير ملوّنين.","En":"Two parts remain uncoloured."}],"Substitution":{"Ar":"$\\frac{4-2}{4}=\\frac24$","En":"$\\frac{4-2}{4}=\\frac24$"},"Result":{"Ar":"$\\frac24$","En":"$\\frac24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac24+\\frac24=1$","En":"$\\frac24+\\frac24=1$"},"CommonError":{"Ar":"لا تغير المقام؛ المستطيل ما زال مكوّناً من أربعة أجزاء.","En":"Keep the denominator: the rectangle still has four parts."}}}$mw$::jsonb,$mw$كل جزء يساوي ربع المساحة، ونجمع الأجزاء غير الملوّنة فقط.

$\frac{4-2}{4}$

1. جزآن مختلفان ملوّنان من أصل أربعة.

2. يبقى جزآن غير ملوّنين.

$\frac{4-2}{4}=\frac24$

$\frac24$

$\frac24+\frac24=1$

لا تغير المقام؛ المستطيل ما زال مكوّناً من أربعة أجزاء.$mw$,$mw$Each part is one quarter of the area; count only the uncoloured parts.

$\frac{4-2}{4}$

1. Two distinct parts out of four are coloured.

2. Two parts remain uncoloured.

$\frac{4-2}{4}=\frac24$

$\frac24$

$\frac24+\frac24=1$

Keep the denominator: the rectangle still has four parts.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد الأجزاء الملوّنة أولاً.","En":"Count the coloured parts first."},{"Ar":"كم جزءاً يبقى من الأربعة؟","En":"How many of the four parts remain?"}],"Solution":{"Idea":{"Ar":"كل جزء يساوي ربع المساحة، ونجمع الأجزاء غير الملوّنة فقط.","En":"Each part is one quarter of the area; count only the uncoloured parts."},"FormulaLatex":"\\frac{4-2}{4}","Steps":[{"Ar":"جزآن مختلفان ملوّنان من أصل أربعة.","En":"Two distinct parts out of four are coloured."},{"Ar":"يبقى جزآن غير ملوّنين.","En":"Two parts remain uncoloured."}],"Substitution":{"Ar":"$\\frac{4-2}{4}=\\frac24$","En":"$\\frac{4-2}{4}=\\frac24$"},"Result":{"Ar":"$\\frac24$","En":"$\\frac24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac24+\\frac24=1$","En":"$\\frac24+\\frac24=1$"},"CommonError":{"Ar":"لا تغير المقام؛ المستطيل ما زال مكوّناً من أربعة أجزاء.","En":"Keep the denominator: the rectangle still has four parts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ربع واحد يهمل جزءاً غير ملوّن.","En":"One quarter misses an uncoloured part."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أرباع تستبعد جزءاً ملوّناً واحداً فقط.","En":"Three quarters excludes only one coloured part."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أربعة أرباع تمثل الشكل كله.","En":"Four quarters represent the entire shape."},"Order":4}]}$mw$),
($mw$growth-v34-grade-4-addition-associative-group-to-thousand-1$mw$,$mw$addition-associative-group-to-thousand$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تجميع حدود الجمع","En":"Regrouping addends"},"Question":{"Ar":"لحساب 625+184+375+216 ذهنياً، أي زوج من الحدود يعطي 1000 بالضبط؟","En":"To calculate 625+184+375+216 mentally, which pair of addends totals exactly 1000?"},"Options":[{"LatexCode":"625+184","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 809.","En":"Their sum is 809."}},{"LatexCode":"184+216","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 400.","En":"Their sum is 400."}},{"LatexCode":"375+216","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 591.","En":"Their sum is 591."}},{"LatexCode":"625+375","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ابحث عن عددين يكمل أحدهما الآخر إلى ألف.","En":"Look for two numbers that complement each other to one thousand."},{"Ar":"ابدأ بالحد 625.","En":"Start with the addend 625."}],"Solution":{"Idea":{"Ar":"يمكن تبديل ترتيب حدود الجمع وتجميعها لتسهيل الحساب.","En":"The addends can be reordered and grouped to simplify addition."},"FormulaLatex":"(625+375)+(184+216)","Steps":[{"Ar":"نكمل العدد 625 إلى 1000 بالبحث عن الفرق.","En":"Find the amount needed to bring 625 to 1000."},{"Ar":"$1000-625=375$","En":"$1000-625=375$"}],"Substitution":{"Ar":"$625+375=1000$","En":"$625+375=1000$"},"Result":{"Ar":"$625+375$","En":"$625+375$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1000+400=1400$","En":"$1000+400=1400$"},"CommonError":{"Ar":"لا تفترض أن الحدين المتجاورين هما الأسهل للجمع.","En":"Do not assume adjacent addends are the easiest pair."}}}$mw$::jsonb,$mw$يمكن تبديل ترتيب حدود الجمع وتجميعها لتسهيل الحساب.

$(625+375)+(184+216)$

1. نكمل العدد 625 إلى 1000 بالبحث عن الفرق.

2. $1000-625=375$

$625+375=1000$

$625+375$

$1000+400=1400$

لا تفترض أن الحدين المتجاورين هما الأسهل للجمع.$mw$,$mw$The addends can be reordered and grouped to simplify addition.

$(625+375)+(184+216)$

1. Find the amount needed to bring 625 to 1000.

2. $1000-625=375$

$625+375=1000$

$625+375$

$1000+400=1400$

Do not assume adjacent addends are the easiest pair.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابحث عن عددين يكمل أحدهما الآخر إلى ألف.","En":"Look for two numbers that complement each other to one thousand."},{"Ar":"ابدأ بالحد 625.","En":"Start with the addend 625."}],"Solution":{"Idea":{"Ar":"يمكن تبديل ترتيب حدود الجمع وتجميعها لتسهيل الحساب.","En":"The addends can be reordered and grouped to simplify addition."},"FormulaLatex":"(625+375)+(184+216)","Steps":[{"Ar":"نكمل العدد 625 إلى 1000 بالبحث عن الفرق.","En":"Find the amount needed to bring 625 to 1000."},{"Ar":"$1000-625=375$","En":"$1000-625=375$"}],"Substitution":{"Ar":"$625+375=1000$","En":"$625+375=1000$"},"Result":{"Ar":"$625+375$","En":"$625+375$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1000+400=1400$","En":"$1000+400=1400$"},"CommonError":{"Ar":"لا تفترض أن الحدين المتجاورين هما الأسهل للجمع.","En":"Do not assume adjacent addends are the easiest pair."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 809.","En":"Their sum is 809."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 400.","En":"Their sum is 400."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 591.","En":"Their sum is 591."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v34-grade-5-multiplicative-two-pack-sizes-total-1$mw$,$mw$multiplicative-two-pack-sizes-total$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-5$mw$,5,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حساب محتوى عبوات مختلفة","En":"Counting items in different pack sizes"},"Question":{"Ar":"في المخزن 12 علبة تحوي كل منها 24 قطعة، و8 علب تحوي كل منها 15 قطعة. كم قطعة في العلب كلها؟","En":"A store has 12 boxes of 24 pieces each and 8 boxes of 15 pieces each. How many pieces are there in all boxes?"},"Options":[{"LatexCode":"300","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"300 لا يساوي مجموع الناتجين 288 و120.","En":"300 is not the sum of the products 288 and 120."}},{"LatexCode":"408","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"480","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"480 ينتج من اعتبار العلب العشرين كلها تحوي 24 قطعة.","En":"480 treats all twenty boxes as containing 24 pieces."}},{"LatexCode":"780","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"780 يضرب مجموع أعداد العلب في مجموع القطع لكل علبة.","En":"780 multiplies the combined box count by the combined pack sizes."}}],"Hints":[{"Ar":"لا تتساوى أعداد القطع في كل العلب.","En":"The box sizes are different."},{"Ar":"احسب قطع كل نوع على حدة.","En":"Count the pieces of each type separately."}],"Solution":{"Idea":{"Ar":"نحسب حاصل الضرب لكل نوع من العلب على حدة ثم نجمع الناتجين.","En":"Multiply separately for each box type, then add the products."},"FormulaLatex":"T=12\\cdot24+8\\cdot15","Steps":[{"Ar":"$12\\cdot24=288$","En":"$12\\cdot24=288$"},{"Ar":"$8\\cdot15=120$","En":"$8\\cdot15=120$"}],"Substitution":{"Ar":"$288+120=408$","En":"$288+120=408$"},"Result":{"Ar":"$408$","En":"$408$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$408-120=288$","En":"$408-120=288$"},"CommonError":{"Ar":"لا تجمع سعات العلب ثم تضربها في العدد الكلي.","En":"Do not add pack sizes and multiply by total box count."}}}$mw$::jsonb,$mw$نحسب حاصل الضرب لكل نوع من العلب على حدة ثم نجمع الناتجين.

$T=12\cdot24+8\cdot15$

1. $12\cdot24=288$

2. $8\cdot15=120$

$288+120=408$

$408$

$408-120=288$

لا تجمع سعات العلب ثم تضربها في العدد الكلي.$mw$,$mw$Multiply separately for each box type, then add the products.

$T=12\cdot24+8\cdot15$

1. $12\cdot24=288$

2. $8\cdot15=120$

$288+120=408$

$408$

$408-120=288$

Do not add pack sizes and multiply by total box count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لا تتساوى أعداد القطع في كل العلب.","En":"The box sizes are different."},{"Ar":"احسب قطع كل نوع على حدة.","En":"Count the pieces of each type separately."}],"Solution":{"Idea":{"Ar":"نحسب حاصل الضرب لكل نوع من العلب على حدة ثم نجمع الناتجين.","En":"Multiply separately for each box type, then add the products."},"FormulaLatex":"T=12\\cdot24+8\\cdot15","Steps":[{"Ar":"$12\\cdot24=288$","En":"$12\\cdot24=288$"},{"Ar":"$8\\cdot15=120$","En":"$8\\cdot15=120$"}],"Substitution":{"Ar":"$288+120=408$","En":"$288+120=408$"},"Result":{"Ar":"$408$","En":"$408$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$408-120=288$","En":"$408-120=288$"},"CommonError":{"Ar":"لا تجمع سعات العلب ثم تضربها في العدد الكلي.","En":"Do not add pack sizes and multiply by total box count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"300 لا يساوي مجموع الناتجين 288 و120.","En":"300 is not the sum of the products 288 and 120."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"480 ينتج من اعتبار العلب العشرين كلها تحوي 24 قطعة.","En":"480 treats all twenty boxes as containing 24 pieces."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"780 يضرب مجموع أعداد العلب في مجموع القطع لكل علبة.","En":"780 multiplies the combined box count by the combined pack sizes."},"Order":4}]}$mw$),
($mw$growth-v34-grade-5-estimate-choose-precision-budget-1$mw$,$mw$estimate-choose-precision-budget$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقدير كافٍ لاتخاذ قرار","En":"Estimating to make a decision"},"Question":{"Ar":"تبلغ أسعار ثلاثة أغراض 198 و297 و398 وحدة نقدية. قرّب كل سعر إلى أقرب مئة. هل تكفي ميزانية 850 وحدة بحسب هذا التقدير، وكم الفرق بين الميزانية والتقدير؟ اختر مقدار النقص في الميزانية.","En":"Three items cost 198, 297 and 398 currency units. Round each price to the nearest hundred. How much does a budget of 850 fall short of this estimated total?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"التقدير 900 أكبر من الميزانية.","En":"The estimate of 900 exceeds the budget."}},{"LatexCode":"43","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"43 هو النقص بالنسبة إلى المجموع الدقيق، لا التقديري.","En":"43 is the shortfall against the exact sum, not the estimate."}},{"LatexCode":"50","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"150","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"150 لا يساوي الفرق بين 900 و850.","En":"150 is not the difference between 900 and 850."}}],"Hints":[{"Ar":"قرّب إلى أقرب مئة لا عشرة.","En":"Round to the nearest hundred, not ten."},{"Ar":"اطرح الميزانية من المجموع التقديري.","En":"Subtract the budget from the estimated total."}],"Solution":{"Idea":{"Ar":"نقرب الأسعار منفصلة ثم نقارن مجموعها التقديري بالميزانية.","En":"Round each price separately, then compare their estimated total with the budget."},"FormulaLatex":"E=200+300+400","Steps":[{"Ar":"$198\\to200,\\quad297\\to300,\\quad398\\to400$","En":"$198\\to200,\\quad297\\to300,\\quad398\\to400$"},{"Ar":"$E=900$","En":"$E=900$"}],"Substitution":{"Ar":"$900-850=50$","En":"$900-850=50$"},"Result":{"Ar":"$50$","En":"$50$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$850+50=900$","En":"$850+50=900$"},"CommonError":{"Ar":"لا تستبدل المجموع التقديري بالمجموع الدقيق.","En":"Do not substitute the exact total for the requested estimate."}}}$mw$::jsonb,$mw$نقرب الأسعار منفصلة ثم نقارن مجموعها التقديري بالميزانية.

$E=200+300+400$

1. $198\to200,\quad297\to300,\quad398\to400$

2. $E=900$

$900-850=50$

$50$

$850+50=900$

لا تستبدل المجموع التقديري بالمجموع الدقيق.$mw$,$mw$Round each price separately, then compare their estimated total with the budget.

$E=200+300+400$

1. $198\to200,\quad297\to300,\quad398\to400$

2. $E=900$

$900-850=50$

$50$

$850+50=900$

Do not substitute the exact total for the requested estimate.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قرّب إلى أقرب مئة لا عشرة.","En":"Round to the nearest hundred, not ten."},{"Ar":"اطرح الميزانية من المجموع التقديري.","En":"Subtract the budget from the estimated total."}],"Solution":{"Idea":{"Ar":"نقرب الأسعار منفصلة ثم نقارن مجموعها التقديري بالميزانية.","En":"Round each price separately, then compare their estimated total with the budget."},"FormulaLatex":"E=200+300+400","Steps":[{"Ar":"$198\\to200,\\quad297\\to300,\\quad398\\to400$","En":"$198\\to200,\\quad297\\to300,\\quad398\\to400$"},{"Ar":"$E=900$","En":"$E=900$"}],"Substitution":{"Ar":"$900-850=50$","En":"$900-850=50$"},"Result":{"Ar":"$50$","En":"$50$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$850+50=900$","En":"$850+50=900$"},"CommonError":{"Ar":"لا تستبدل المجموع التقديري بالمجموع الدقيق.","En":"Do not substitute the exact total for the requested estimate."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"التقدير 900 أكبر من الميزانية.","En":"The estimate of 900 exceeds the budget."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"43 هو النقص بالنسبة إلى المجموع الدقيق، لا التقديري.","En":"43 is the shortfall against the exact sum, not the estimate."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"150 لا يساوي الفرق بين 900 و850.","En":"150 is not the difference between 900 and 850."},"Order":4}]}$mw$),
($mw$growth-v34-grade-12-reciprocal-identity-combined-square-1$mw$,$mw$reciprocal-identity-combined-square$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبسيط تعبير مثلثي مقلوب","En":"Simplifying a reciprocal trigonometric expression"},"Question":{"Ar":"لزاوية حقيقية θ تحقق sin θ ≠ 0، ما قيمة cot² θ − csc² θ؟","En":"For a real angle θ with sin θ ≠ 0, what is cot² θ − csc² θ?"},"Options":[{"LatexCode":"-1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفرق ليس صفراً لأن المربعين يختلفان بواحد.","En":"The difference is not zero because the squares differ by one."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 ينتج من عكس ترتيب الطرح.","En":"1 reverses the subtraction order."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 لا ينتج من متطابقة فيثاغورس.","En":"2 does not follow from the Pythagorean identity."}}],"Hints":[{"Ar":"حوّل cot وcsc إلى نسب بدلالة الجيب وجيب التمام.","En":"Rewrite cot and csc using sine and cosine."},{"Ar":"استخدم متطابقة فيثاغورس مع مراعاة ترتيب الطرح.","En":"Use the Pythagorean identity, keeping the subtraction order."}],"Solution":{"Idea":{"Ar":"نقسم متطابقة الجيب وجيب التمام على مربع الجيب غير الصفري.","En":"Divide the sine-cosine identity by the nonzero square of sine."},"FormulaLatex":"1+\\cot^2\\theta=\\csc^2\\theta","Steps":[{"Ar":"$\\sin^2\\theta+\\cos^2\\theta=1$","En":"$\\sin^2\\theta+\\cos^2\\theta=1$"},{"Ar":"$1+\\frac{\\cos^2\\theta}{\\sin^2\\theta}=\\frac1{\\sin^2\\theta}$","En":"$1+\\frac{\\cos^2\\theta}{\\sin^2\\theta}=\\frac1{\\sin^2\\theta}$"}],"Substitution":{"Ar":"$\\cot^2\\theta-\\csc^2\\theta=-1$","En":"$\\cot^2\\theta-\\csc^2\\theta=-1$"},"Result":{"Ar":"$-1$","En":"$-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=90^\\circ:\\ 0-1=-1$","En":"$\\theta=90^\\circ:\\ 0-1=-1$"},"CommonError":{"Ar":"لا تقلب ترتيب الحدين؛ النتيجة سالبة.","En":"Do not reverse the terms; the result is negative."}}}$mw$::jsonb,$mw$نقسم متطابقة الجيب وجيب التمام على مربع الجيب غير الصفري.

$1+\cot^2\theta=\csc^2\theta$

1. $\sin^2\theta+\cos^2\theta=1$

2. $1+\frac{\cos^2\theta}{\sin^2\theta}=\frac1{\sin^2\theta}$

$\cot^2\theta-\csc^2\theta=-1$

$-1$

$\theta=90^\circ:\ 0-1=-1$

لا تقلب ترتيب الحدين؛ النتيجة سالبة.$mw$,$mw$Divide the sine-cosine identity by the nonzero square of sine.

$1+\cot^2\theta=\csc^2\theta$

1. $\sin^2\theta+\cos^2\theta=1$

2. $1+\frac{\cos^2\theta}{\sin^2\theta}=\frac1{\sin^2\theta}$

$\cot^2\theta-\csc^2\theta=-1$

$-1$

$\theta=90^\circ:\ 0-1=-1$

Do not reverse the terms; the result is negative.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل cot وcsc إلى نسب بدلالة الجيب وجيب التمام.","En":"Rewrite cot and csc using sine and cosine."},{"Ar":"استخدم متطابقة فيثاغورس مع مراعاة ترتيب الطرح.","En":"Use the Pythagorean identity, keeping the subtraction order."}],"Solution":{"Idea":{"Ar":"نقسم متطابقة الجيب وجيب التمام على مربع الجيب غير الصفري.","En":"Divide the sine-cosine identity by the nonzero square of sine."},"FormulaLatex":"1+\\cot^2\\theta=\\csc^2\\theta","Steps":[{"Ar":"$\\sin^2\\theta+\\cos^2\\theta=1$","En":"$\\sin^2\\theta+\\cos^2\\theta=1$"},{"Ar":"$1+\\frac{\\cos^2\\theta}{\\sin^2\\theta}=\\frac1{\\sin^2\\theta}$","En":"$1+\\frac{\\cos^2\\theta}{\\sin^2\\theta}=\\frac1{\\sin^2\\theta}$"}],"Substitution":{"Ar":"$\\cot^2\\theta-\\csc^2\\theta=-1$","En":"$\\cot^2\\theta-\\csc^2\\theta=-1$"},"Result":{"Ar":"$-1$","En":"$-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=90^\\circ:\\ 0-1=-1$","En":"$\\theta=90^\\circ:\\ 0-1=-1$"},"CommonError":{"Ar":"لا تقلب ترتيب الحدين؛ النتيجة سالبة.","En":"Do not reverse the terms; the result is negative."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الفرق ليس صفراً لأن المربعين يختلفان بواحد.","En":"The difference is not zero because the squares differ by one."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"1 ينتج من عكس ترتيب الطرح.","En":"1 reverses the subtraction order."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"2 لا ينتج من متطابقة فيثاغورس.","En":"2 does not follow from the Pythagorean identity."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v34 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
