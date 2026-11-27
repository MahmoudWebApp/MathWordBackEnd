-- One-time owner-authorized v89 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v89-grade-5-substitution-fraction-of-variable-1$mw$,$mw$substitution-fraction-of-variable$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معامل كسري","En":"Fractional coefficient"},"Question":{"Ar":"إذا كان $t=24$، فما قيمة $\\frac34t-5$؟","En":"If $t=24$, what is the value of $\\frac34t-5$?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربع 24 يساوي 6، لكن المطلوب ثلاثة أرباع قبل الطرح.","En":"One quarter is 6, but three quarters are required before subtraction."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 5 من 24 دون تطبيق المعامل الكسري.","En":"This subtracts 5 from 24 without applying the fractional coefficient."}},{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 5 إلى ثلاثة أرباع 24 بدلاً من طرحها.","En":"This adds 5 to three quarters of 24 instead of subtracting it."}}],"Hints":[{"Ar":"اقسم 24 على 4.","En":"Divide 24 by 4."},{"Ar":"اضرب الناتج في 3 ثم اطرح 5.","En":"Multiply by 3, then subtract 5."}],"Solution":{"Idea":{"Ar":"نحسب المعامل الكسري مضروباً في قيمة المتغير قبل الطرح.","En":"Evaluate the fractional coefficient times the variable before subtracting."},"FormulaLatex":"\\frac34\\times24-5","Steps":[{"Ar":"ربع 24 يساوي 6.","En":"One quarter of 24 is 6."},{"Ar":"ثلاثة أرباعه 18، فنطرح 5.","En":"Three quarters is 18; subtract 5."}],"Substitution":{"Ar":"$18-5=13$","En":"$18-5=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إضافة 5 إلى 13 تعيد 18، وهي ثلاثة أرباع 24.","En":"Adding 5 to 13 gives 18, three quarters of 24."},"CommonError":{"Ar":"استعمال المقام وحده وإهمال البسط.","En":"Using only the denominator and ignoring the numerator."}}}$mw$::jsonb,$mw$نحسب المعامل الكسري مضروباً في قيمة المتغير قبل الطرح.

$\frac34\times24-5$

1. ربع 24 يساوي 6.

2. ثلاثة أرباعه 18، فنطرح 5.

$18-5=13$

$13$

إضافة 5 إلى 13 تعيد 18، وهي ثلاثة أرباع 24.

استعمال المقام وحده وإهمال البسط.$mw$,$mw$Evaluate the fractional coefficient times the variable before subtracting.

$\frac34\times24-5$

1. One quarter of 24 is 6.

2. Three quarters is 18; subtract 5.

$18-5=13$

$13$

Adding 5 to 13 gives 18, three quarters of 24.

Using only the denominator and ignoring the numerator.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم 24 على 4.","En":"Divide 24 by 4."},{"Ar":"اضرب الناتج في 3 ثم اطرح 5.","En":"Multiply by 3, then subtract 5."}],"Solution":{"Idea":{"Ar":"نحسب المعامل الكسري مضروباً في قيمة المتغير قبل الطرح.","En":"Evaluate the fractional coefficient times the variable before subtracting."},"FormulaLatex":"\\frac34\\times24-5","Steps":[{"Ar":"ربع 24 يساوي 6.","En":"One quarter of 24 is 6."},{"Ar":"ثلاثة أرباعه 18، فنطرح 5.","En":"Three quarters is 18; subtract 5."}],"Substitution":{"Ar":"$18-5=13$","En":"$18-5=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إضافة 5 إلى 13 تعيد 18، وهي ثلاثة أرباع 24.","En":"Adding 5 to 13 gives 18, three quarters of 24."},"CommonError":{"Ar":"استعمال المقام وحده وإهمال البسط.","En":"Using only the denominator and ignoring the numerator."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ربع 24 يساوي 6، لكن المطلوب ثلاثة أرباع قبل الطرح.","En":"One quarter is 6, but three quarters are required before subtraction."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 5 من 24 دون تطبيق المعامل الكسري.","En":"This subtracts 5 from 24 without applying the fractional coefficient."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 5 إلى ثلاثة أرباع 24 بدلاً من طرحها.","En":"This adds 5 to three quarters of 24 instead of subtracting it."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-substitution-repeated-variable-sign-1$mw$,$mw$substitution-repeated-variable-sign$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تكرار المتغير مع الطرح","En":"Repeated variable with subtraction"},"Question":{"Ar":"إذا كان $k=8$، فما قيمة $5k-(k+7)$؟","En":"If $k=8$, what is the value of $5k-(k+7)$?"},"Options":[{"LatexCode":"25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"39","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 8 ثم يضيف 7 بدلاً من طرح مجموعهما.","En":"This subtracts 8 then adds 7 instead of subtracting their sum."}},{"LatexCode":"32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 8 فقط ويهمل 7.","En":"This subtracts only 8 and omits 7."}},{"LatexCode":"47","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 7 إلى 40 دون طرح القوس.","En":"This adds 7 to 40 without subtracting the parentheses."}}],"Hints":[{"Ar":"عوّض 8 في الموضعين.","En":"Substitute 8 in both positions."},{"Ar":"احسب مجموع القوس ثم اطرحه كاملاً.","En":"Evaluate the parenthesized sum, then subtract all of it."}],"Solution":{"Idea":{"Ar":"إشارة الطرح قبل القوس تنطبق على مجموع ما بداخله.","En":"Subtraction before parentheses applies to their entire sum."},"FormulaLatex":"5\\times8-(8+7)","Steps":[{"Ar":"حاصل الضرب 40 ومجموع القوس 15.","En":"The product is 40 and the parenthesized sum is 15."},{"Ar":"نطرح 15 من 40.","En":"Subtract 15 from 40."}],"Substitution":{"Ar":"$40-15=25$","En":"$40-15=25$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"25 مع 15 يعيد 40.","En":"25 plus 15 returns 40."},"CommonError":{"Ar":"طرح أول حد في القوس وإضافة الحد الثاني.","En":"Subtracting the first term but adding the second."}}}$mw$::jsonb,$mw$إشارة الطرح قبل القوس تنطبق على مجموع ما بداخله.

$5\times8-(8+7)$

1. حاصل الضرب 40 ومجموع القوس 15.

2. نطرح 15 من 40.

$40-15=25$

$25$

25 مع 15 يعيد 40.

طرح أول حد في القوس وإضافة الحد الثاني.$mw$,$mw$Subtraction before parentheses applies to their entire sum.

$5\times8-(8+7)$

1. The product is 40 and the parenthesized sum is 15.

2. Subtract 15 from 40.

$40-15=25$

$25$

25 plus 15 returns 40.

Subtracting the first term but adding the second.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض 8 في الموضعين.","En":"Substitute 8 in both positions."},{"Ar":"احسب مجموع القوس ثم اطرحه كاملاً.","En":"Evaluate the parenthesized sum, then subtract all of it."}],"Solution":{"Idea":{"Ar":"إشارة الطرح قبل القوس تنطبق على مجموع ما بداخله.","En":"Subtraction before parentheses applies to their entire sum."},"FormulaLatex":"5\\times8-(8+7)","Steps":[{"Ar":"حاصل الضرب 40 ومجموع القوس 15.","En":"The product is 40 and the parenthesized sum is 15."},{"Ar":"نطرح 15 من 40.","En":"Subtract 15 from 40."}],"Substitution":{"Ar":"$40-15=25$","En":"$40-15=25$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"25 مع 15 يعيد 40.","En":"25 plus 15 returns 40."},"CommonError":{"Ar":"طرح أول حد في القوس وإضافة الحد الثاني.","En":"Subtracting the first term but adding the second."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 8 ثم يضيف 7 بدلاً من طرح مجموعهما.","En":"This subtracts 8 then adds 7 instead of subtracting their sum."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 8 فقط ويهمل 7.","En":"This subtracts only 8 and omits 7."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 7 إلى 40 دون طرح القوس.","En":"This adds 7 to 40 without subtracting the parentheses."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-substitution-variable-in-denominator-1$mw$,$mw$substitution-variable-in-denominator$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المتغير في المقام","En":"Variable in the denominator"},"Question":{"Ar":"إذا كان $d=4$، فما قيمة $36/d+3$؟","En":"If $d=4$, what is the value of $36/d+3$?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"36 مقسومة على 4 تساوي 9، ثم نضيف 3 لا نطرحها.","En":"36 divided by 4 is 9; add 3 rather than subtracting it."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا خارج القسمة قبل إضافة 3.","En":"This is the quotient before adding 3."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"39","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل القسمة على d.","En":"This ignores division by d."}}],"Hints":[{"Ar":"استبدل المقام بالعدد 4.","En":"Replace the denominator with 4."},{"Ar":"أجر القسمة قبل الجمع.","En":"Perform division before addition."}],"Solution":{"Idea":{"Ar":"نستبدل المتغير في المقام ثم نطبق ترتيب العمليات.","En":"Substitute in the denominator, then follow the order of operations."},"FormulaLatex":"\\frac{36}{4}+3","Steps":[{"Ar":"36 مقسومة على 4 تساوي 9.","En":"36 divided by 4 equals 9."},{"Ar":"نضيف 3 إلى 9.","En":"Add 3 to 9."}],"Substitution":{"Ar":"$9+3=12$","En":"$9+3=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا طرحنا 3 من الناتج وضربنا في 4 نحصل على 36.","En":"Subtracting 3 from the result and multiplying by 4 returns 36."},"CommonError":{"Ar":"جمع العدد 3 مع المقام دون أقواس.","En":"Adding 3 to the denominator without parentheses."}}}$mw$::jsonb,$mw$نستبدل المتغير في المقام ثم نطبق ترتيب العمليات.

$\frac{36}{4}+3$

1. 36 مقسومة على 4 تساوي 9.

2. نضيف 3 إلى 9.

$9+3=12$

$12$

إذا طرحنا 3 من الناتج وضربنا في 4 نحصل على 36.

جمع العدد 3 مع المقام دون أقواس.$mw$,$mw$Substitute in the denominator, then follow the order of operations.

$\frac{36}{4}+3$

1. 36 divided by 4 equals 9.

2. Add 3 to 9.

$9+3=12$

$12$

Subtracting 3 from the result and multiplying by 4 returns 36.

Adding 3 to the denominator without parentheses.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبدل المقام بالعدد 4.","En":"Replace the denominator with 4."},{"Ar":"أجر القسمة قبل الجمع.","En":"Perform division before addition."}],"Solution":{"Idea":{"Ar":"نستبدل المتغير في المقام ثم نطبق ترتيب العمليات.","En":"Substitute in the denominator, then follow the order of operations."},"FormulaLatex":"\\frac{36}{4}+3","Steps":[{"Ar":"36 مقسومة على 4 تساوي 9.","En":"36 divided by 4 equals 9."},{"Ar":"نضيف 3 إلى 9.","En":"Add 3 to 9."}],"Substitution":{"Ar":"$9+3=12$","En":"$9+3=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا طرحنا 3 من الناتج وضربنا في 4 نحصل على 36.","En":"Subtracting 3 from the result and multiplying by 4 returns 36."},"CommonError":{"Ar":"جمع العدد 3 مع المقام دون أقواس.","En":"Adding 3 to the denominator without parentheses."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"36 مقسومة على 4 تساوي 9، ثم نضيف 3 لا نطرحها.","En":"36 divided by 4 is 9; add 3 rather than subtracting it."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا خارج القسمة قبل إضافة 3.","En":"This is the quotient before adding 3."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل القسمة على d.","En":"This ignores division by d."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-substitution-identify-correct-variable-replacement-1$mw$,$mw$substitution-identify-correct-variable-replacement$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار خطوة التعويض","En":"Choosing the substitution step"},"Question":{"Ar":"في التعبير $2a+3b$، إذا كان $a=6$ و$b=4$، فأي عملية تمثل التعويض الصحيح قبل إجراء الحساب؟","En":"For $2a+3b$, given $a=6$ and $b=4$, which calculation shows the correct substitution before evaluating?"},"Options":[{"LatexCode":"2\\times4+3\\times6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يبدل قيم المتغيرين.","En":"This swaps the variable values."}},{"LatexCode":"2+6+3+4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المعامل بجوار المتغير يعني الضرب لا الجمع.","En":"A coefficient beside a variable means multiplication, not addition."}},{"LatexCode":"2\\times6+3\\times4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2\\times6+3\\times6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمة b هي 4 وليست 6.","En":"b equals 4, not 6."}}],"Hints":[{"Ar":"حدد قيمة a وقيمة b كلّاً على حدة.","En":"Identify a and b separately."},{"Ar":"حافظ على معامل كل متغير عند التعويض.","En":"Keep each variable's coefficient during substitution."}],"Solution":{"Idea":{"Ar":"نستبدل الرموز بقيمها مع إبقاء العمليات كما هي.","En":"Replace symbols with their values while preserving operations."},"FormulaLatex":"2a+3b","Steps":[{"Ar":"الحد 2a يصبح 2 مضروبة في 6.","En":"2a becomes 2 times 6."},{"Ar":"الحد 3b يصبح 3 مضروبة في 4.","En":"3b becomes 3 times 4."}],"Substitution":{"Ar":"$2\\times6+3\\times4=24$","En":"$2\\times6+3\\times4=24$"},"Result":{"Ar":"$2\\times6+3\\times4$","En":"$2\\times6+3\\times4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان الناتجان يساوي كل منهما 12، ومجموعهما 24.","En":"Both resulting terms equal 12, totaling 24."},"CommonError":{"Ar":"تبديل قيم المتغيرات أو حذف الضرب الضمني.","En":"Swapping variable values or omitting implicit multiplication."}}}$mw$::jsonb,$mw$نستبدل الرموز بقيمها مع إبقاء العمليات كما هي.

$2a+3b$

1. الحد 2a يصبح 2 مضروبة في 6.

2. الحد 3b يصبح 3 مضروبة في 4.

$2\times6+3\times4=24$

$2\times6+3\times4$

الحدان الناتجان يساوي كل منهما 12، ومجموعهما 24.

تبديل قيم المتغيرات أو حذف الضرب الضمني.$mw$,$mw$Replace symbols with their values while preserving operations.

$2a+3b$

1. 2a becomes 2 times 6.

2. 3b becomes 3 times 4.

$2\times6+3\times4=24$

$2\times6+3\times4$

Both resulting terms equal 12, totaling 24.

Swapping variable values or omitting implicit multiplication.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد قيمة a وقيمة b كلّاً على حدة.","En":"Identify a and b separately."},{"Ar":"حافظ على معامل كل متغير عند التعويض.","En":"Keep each variable's coefficient during substitution."}],"Solution":{"Idea":{"Ar":"نستبدل الرموز بقيمها مع إبقاء العمليات كما هي.","En":"Replace symbols with their values while preserving operations."},"FormulaLatex":"2a+3b","Steps":[{"Ar":"الحد 2a يصبح 2 مضروبة في 6.","En":"2a becomes 2 times 6."},{"Ar":"الحد 3b يصبح 3 مضروبة في 4.","En":"3b becomes 3 times 4."}],"Substitution":{"Ar":"$2\\times6+3\\times4=24$","En":"$2\\times6+3\\times4=24$"},"Result":{"Ar":"$2\\times6+3\\times4$","En":"$2\\times6+3\\times4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان الناتجان يساوي كل منهما 12، ومجموعهما 24.","En":"Both resulting terms equal 12, totaling 24."},"CommonError":{"Ar":"تبديل قيم المتغيرات أو حذف الضرب الضمني.","En":"Swapping variable values or omitting implicit multiplication."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يبدل قيم المتغيرين.","En":"This swaps the variable values."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المعامل بجوار المتغير يعني الضرب لا الجمع.","En":"A coefficient beside a variable means multiplication, not addition."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قيمة b هي 4 وليست 6.","En":"b equals 4, not 6."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-substitution-expression-change-single-input-1$mw$,$mw$substitution-expression-change-single-input$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر تغير المدخل","En":"Effect of an input change"},"Question":{"Ar":"يعطي التعبير $4n+7$ قيمة عند $n=3$ وقيمة أخرى عند $n=4$. ما مقدار الزيادة في قيمة التعبير؟","En":"The expression $4n+7$ has one value at $n=3$ and another at $n=4$. By how much does its value increase?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يزيد n بمقدار واحد لكن الحد 4n يزيد بأربعة.","En":"n rises by one but 4n rises by four."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 حد ثابت لا يتغير.","En":"7 is constant and does not change."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يجمع المعامل والثابت، مع أن الثابت لا يؤثر في الفرق.","En":"This adds coefficient and constant, though the constant does not affect the difference."}}],"Hints":[{"Ar":"احسب قيمة التعبير عند n يساوي 3.","En":"Evaluate the expression at n equal to 3."},{"Ar":"أعد الحساب عند n يساوي 4 ثم اطرح.","En":"Evaluate at n equal to 4 and subtract."}],"Solution":{"Idea":{"Ar":"نقارن قيم التعبير عند مدخلين مختلفين مع ثبات الحد الثابت.","En":"Compare values at two inputs while the constant stays fixed."},"FormulaLatex":"4\\times3+7=19","Steps":[{"Ar":"القيمة الأولى 19.","En":"The first value is 19."},{"Ar":"القيمة الثانية 16 مع 7 أي 23.","En":"The second value is 16 plus 7, or 23."}],"Substitution":{"Ar":"$23-19=4$","En":"$23-19=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"زيادة المدخل واحداً تزيد أربعة أمثاله بمقدار 4.","En":"Increasing the input by one increases four times that input by 4."},"CommonError":{"Ar":"اعتبار زيادة المدخل مساوية دائماً لزيادة المخرج.","En":"Assuming input and output always increase by the same amount."}}}$mw$::jsonb,$mw$نقارن قيم التعبير عند مدخلين مختلفين مع ثبات الحد الثابت.

$4\times3+7=19$

1. القيمة الأولى 19.

2. القيمة الثانية 16 مع 7 أي 23.

$23-19=4$

$4$

زيادة المدخل واحداً تزيد أربعة أمثاله بمقدار 4.

اعتبار زيادة المدخل مساوية دائماً لزيادة المخرج.$mw$,$mw$Compare values at two inputs while the constant stays fixed.

$4\times3+7=19$

1. The first value is 19.

2. The second value is 16 plus 7, or 23.

$23-19=4$

$4$

Increasing the input by one increases four times that input by 4.

Assuming input and output always increase by the same amount.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب قيمة التعبير عند n يساوي 3.","En":"Evaluate the expression at n equal to 3."},{"Ar":"أعد الحساب عند n يساوي 4 ثم اطرح.","En":"Evaluate at n equal to 4 and subtract."}],"Solution":{"Idea":{"Ar":"نقارن قيم التعبير عند مدخلين مختلفين مع ثبات الحد الثابت.","En":"Compare values at two inputs while the constant stays fixed."},"FormulaLatex":"4\\times3+7=19","Steps":[{"Ar":"القيمة الأولى 19.","En":"The first value is 19."},{"Ar":"القيمة الثانية 16 مع 7 أي 23.","En":"The second value is 16 plus 7, or 23."}],"Substitution":{"Ar":"$23-19=4$","En":"$23-19=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"زيادة المدخل واحداً تزيد أربعة أمثاله بمقدار 4.","En":"Increasing the input by one increases four times that input by 4."},"CommonError":{"Ar":"اعتبار زيادة المدخل مساوية دائماً لزيادة المخرج.","En":"Assuming input and output always increase by the same amount."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يزيد n بمقدار واحد لكن الحد 4n يزيد بأربعة.","En":"n rises by one but 4n rises by four."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"7 حد ثابت لا يتغير.","En":"7 is constant and does not change."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يجمع المعامل والثابت، مع أن الثابت لا يؤثر في الفرق.","En":"This adds coefficient and constant, though the constant does not affect the difference."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-substitution-parentheses-expression-compare-1$mw$,$mw$substitution-parentheses-expression-compare$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"موضع الأقواس","En":"Placement of parentheses"},"Question":{"Ar":"عند $r=3$، قارن التعبيرين $(2+r)\\times5$ و$2+r\\times5$. بكم يزيد الأول على الثاني؟","En":"At $r=3$, compare $(2+r)\\times5$ and $2+r\\times5$. How much greater is the first?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأقواس تغير العملية التي تنفذ أولاً.","En":"Parentheses change which operation is performed first."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 هو عامل الضرب وليس فرق القيمتين.","En":"5 is the multiplier, not the difference."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفرق 25 ناقص 17، وليس 25 ناقص 15.","En":"The difference is 25 minus 17, not 25 minus 15."}}],"Hints":[{"Ar":"احسب الأول مع تنفيذ القوس أولاً.","En":"Evaluate the first with parentheses first."},{"Ar":"احسب الثاني مع تنفيذ الضرب أولاً.","En":"Evaluate the second with multiplication first."}],"Solution":{"Idea":{"Ar":"الأقواس تغير ترتيب العمليات بعد التعويض.","En":"Parentheses change the order of operations after substitution."},"FormulaLatex":"(2+3)\\times5=25","Steps":[{"Ar":"الأول يساوي 25.","En":"The first equals 25."},{"Ar":"الثاني يساوي 2 مع 15 أي 17.","En":"The second equals 2 plus 15, or 17."}],"Substitution":{"Ar":"$25-17=8$","En":"$25-17=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إضافة 8 إلى 17 تعيد 25.","En":"Adding 8 to 17 gives 25."},"CommonError":{"Ar":"تجاهل الأقواس ومعاملة التعبيرين بالطريقة نفسها.","En":"Ignoring parentheses and treating both expressions alike."}}}$mw$::jsonb,$mw$الأقواس تغير ترتيب العمليات بعد التعويض.

$(2+3)\times5=25$

1. الأول يساوي 25.

2. الثاني يساوي 2 مع 15 أي 17.

$25-17=8$

$8$

إضافة 8 إلى 17 تعيد 25.

تجاهل الأقواس ومعاملة التعبيرين بالطريقة نفسها.$mw$,$mw$Parentheses change the order of operations after substitution.

$(2+3)\times5=25$

1. The first equals 25.

2. The second equals 2 plus 15, or 17.

$25-17=8$

$8$

Adding 8 to 17 gives 25.

Ignoring parentheses and treating both expressions alike.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الأول مع تنفيذ القوس أولاً.","En":"Evaluate the first with parentheses first."},{"Ar":"احسب الثاني مع تنفيذ الضرب أولاً.","En":"Evaluate the second with multiplication first."}],"Solution":{"Idea":{"Ar":"الأقواس تغير ترتيب العمليات بعد التعويض.","En":"Parentheses change the order of operations after substitution."},"FormulaLatex":"(2+3)\\times5=25","Steps":[{"Ar":"الأول يساوي 25.","En":"The first equals 25."},{"Ar":"الثاني يساوي 2 مع 15 أي 17.","En":"The second equals 2 plus 15, or 17."}],"Substitution":{"Ar":"$25-17=8$","En":"$25-17=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إضافة 8 إلى 17 تعيد 25.","En":"Adding 8 to 17 gives 25."},"CommonError":{"Ar":"تجاهل الأقواس ومعاملة التعبيرين بالطريقة نفسها.","En":"Ignoring parentheses and treating both expressions alike."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الأقواس تغير العملية التي تنفذ أولاً.","En":"Parentheses change which operation is performed first."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"5 هو عامل الضرب وليس فرق القيمتين.","En":"5 is the multiplier, not the difference."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الفرق 25 ناقص 17، وليس 25 ناقص 15.","En":"The difference is 25 minus 17, not 25 minus 15."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-triangle-area-parallel-line-same-height-1$mw$,$mw$triangle-area-parallel-line-same-height$mw$,$mw$primary-triangle-area$mw$,$mw$grade-5$mw$,5,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ثبات المساحة عند تحريك الرأس","En":"Area under vertex movement"},"Question":{"Ar":"مثلث قاعدته 10 cm وارتفاعه العمودي 6 cm. تحرك رأسه المقابل للقاعدة على خط موازٍ لها وعلى المسافة العمودية نفسها، دون تغيير القاعدة. ما مساحته الجديدة بالسنتيمتر المربع؟","En":"A triangle has base 10 cm and perpendicular height 6 cm. Its opposite vertex moves along a line parallel to the base at the same perpendicular distance, with the base unchanged. What is its new area in square centimetres?"},"Options":[{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المساحة الأصلية 30 ولا يوجد سبب لتنصيفها مرة أخرى.","En":"The original area is 30 and there is no reason to halve it again."}},{"LatexCode":"30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60 هو حاصل ضرب القاعدة والارتفاع قبل أخذ النصف.","En":"60 is the base-height product before halving."}},{"LatexCode":"90","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حركة الرأس لا تضيف مساحة ثابتة جديدة.","En":"Moving the vertex does not add a fixed new area."}}],"Hints":[{"Ar":"هل تغير طول القاعدة؟","En":"Did the base length change?"},{"Ar":"هل تغير البعد العمودي للرأس عن خط القاعدة؟","En":"Did the perpendicular distance to the base line change?"}],"Solution":{"Idea":{"Ar":"مساحة المثلث تعتمد على القاعدة والارتفاع العمودي لا على موضع الرأس أفقياً.","En":"Triangle area depends on base and perpendicular height, not the horizontal vertex position."},"FormulaLatex":"A=\\frac{10\\times6}{2}","Steps":[{"Ar":"القاعدة ما زالت 10 cm.","En":"The base remains 10 cm."},{"Ar":"الارتفاع ما زال 6 cm، فتظل المساحة 30.","En":"The height remains 6 cm, so area remains 30."}],"Substitution":{"Ar":"$60\\div2=30$","En":"$60\\div2=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القيمتان في قانون المساحة لم تتغيرا.","En":"Neither quantity in the area formula changed."},"CommonError":{"Ar":"افتراض تغير المساحة لأن شكل المثلث تغير.","En":"Assuming area changes because the triangle's shape changes."}}}$mw$::jsonb,$mw$مساحة المثلث تعتمد على القاعدة والارتفاع العمودي لا على موضع الرأس أفقياً.

$A=\frac{10\times6}{2}$

1. القاعدة ما زالت 10 cm.

2. الارتفاع ما زال 6 cm، فتظل المساحة 30.

$60\div2=30$

$30$

القيمتان في قانون المساحة لم تتغيرا.

افتراض تغير المساحة لأن شكل المثلث تغير.$mw$,$mw$Triangle area depends on base and perpendicular height, not the horizontal vertex position.

$A=\frac{10\times6}{2}$

1. The base remains 10 cm.

2. The height remains 6 cm, so area remains 30.

$60\div2=30$

$30$

Neither quantity in the area formula changed.

Assuming area changes because the triangle's shape changes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل تغير طول القاعدة؟","En":"Did the base length change?"},{"Ar":"هل تغير البعد العمودي للرأس عن خط القاعدة؟","En":"Did the perpendicular distance to the base line change?"}],"Solution":{"Idea":{"Ar":"مساحة المثلث تعتمد على القاعدة والارتفاع العمودي لا على موضع الرأس أفقياً.","En":"Triangle area depends on base and perpendicular height, not the horizontal vertex position."},"FormulaLatex":"A=\\frac{10\\times6}{2}","Steps":[{"Ar":"القاعدة ما زالت 10 cm.","En":"The base remains 10 cm."},{"Ar":"الارتفاع ما زال 6 cm، فتظل المساحة 30.","En":"The height remains 6 cm, so area remains 30."}],"Substitution":{"Ar":"$60\\div2=30$","En":"$60\\div2=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القيمتان في قانون المساحة لم تتغيرا.","En":"Neither quantity in the area formula changed."},"CommonError":{"Ar":"افتراض تغير المساحة لأن شكل المثلث تغير.","En":"Assuming area changes because the triangle's shape changes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المساحة الأصلية 30 ولا يوجد سبب لتنصيفها مرة أخرى.","En":"The original area is 30 and there is no reason to halve it again."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"60 هو حاصل ضرب القاعدة والارتفاع قبل أخذ النصف.","En":"60 is the base-height product before halving."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حركة الرأس لا تضيف مساحة ثابتة جديدة.","En":"Moving the vertex does not add a fixed new area."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-triangle-angle-classify-missing-obtuse-1$mw$,$mw$triangle-angle-classify-missing-obtuse$mw$,$mw$primary-triangle-angle-sum$mw$,$mw$grade-5$mw$,5,1,3,15,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":15,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصنيف الزاوية المجهولة","En":"Classifying the missing angle"},"Question":{"Ar":"في مثلث قياس زاويتين 35 و45 درجة. أي وصف للزاوية الثالثة صحيح؟ A: حادة؛ B: قائمة؛ C: منفرجة؛ D: مستقيمة.","En":"A triangle has angles of 35 and 45 degrees. Which describes the third angle? A: acute; B: right; C: obtuse; D: straight."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قياس الزاوية الثالثة 100 درجة، وهو أكبر من 90.","En":"The third angle is 100 degrees, greater than 90."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الزاوية القائمة تساوي 90 لا 100 درجة.","En":"A right angle is 90 degrees, not 100."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الزاوية المستقيمة تساوي 180 درجة، ولا تكون زاوية داخلية لمثلث غير منعدم.","En":"A straight angle is 180 degrees and is not an interior angle of a nondegenerate triangle."}}],"Hints":[{"Ar":"اجمع 35 و45.","En":"Add 35 and 45."},{"Ar":"اطرح من 180 وقارن الناتج مع 90.","En":"Subtract from 180 and compare with 90."}],"Solution":{"Idea":{"Ar":"نحسب الزاوية ثم نصنفها وفق قياسها.","En":"Find the angle and classify it by its measure."},"FormulaLatex":"180-(35+45)=100","Steps":[{"Ar":"مجموع المعطيين 80 درجة.","En":"The given angles total 80 degrees."},{"Ar":"الثالثة 100 درجة، بين 90 و180، فهي منفرجة.","En":"The third is 100 degrees, between 90 and 180, so obtuse."}],"Substitution":{"Ar":"$90<100<180$","En":"$90<100<180$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"35 مع 45 مع 100 تساوي 180.","En":"35 plus 45 plus 100 equals 180."},"CommonError":{"Ar":"تصنيف المثلث من الزاويتين المعطيتين دون حساب الثالثة.","En":"Classifying from only the given angles without finding the third."}}}$mw$::jsonb,$mw$نحسب الزاوية ثم نصنفها وفق قياسها.

$180-(35+45)=100$

1. مجموع المعطيين 80 درجة.

2. الثالثة 100 درجة، بين 90 و180، فهي منفرجة.

$90<100<180$

$C$

35 مع 45 مع 100 تساوي 180.

تصنيف المثلث من الزاويتين المعطيتين دون حساب الثالثة.$mw$,$mw$Find the angle and classify it by its measure.

$180-(35+45)=100$

1. The given angles total 80 degrees.

2. The third is 100 degrees, between 90 and 180, so obtuse.

$90<100<180$

$C$

35 plus 45 plus 100 equals 180.

Classifying from only the given angles without finding the third.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع 35 و45.","En":"Add 35 and 45."},{"Ar":"اطرح من 180 وقارن الناتج مع 90.","En":"Subtract from 180 and compare with 90."}],"Solution":{"Idea":{"Ar":"نحسب الزاوية ثم نصنفها وفق قياسها.","En":"Find the angle and classify it by its measure."},"FormulaLatex":"180-(35+45)=100","Steps":[{"Ar":"مجموع المعطيين 80 درجة.","En":"The given angles total 80 degrees."},{"Ar":"الثالثة 100 درجة، بين 90 و180، فهي منفرجة.","En":"The third is 100 degrees, between 90 and 180, so obtuse."}],"Substitution":{"Ar":"$90<100<180$","En":"$90<100<180$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"35 مع 45 مع 100 تساوي 180.","En":"35 plus 45 plus 100 equals 180."},"CommonError":{"Ar":"تصنيف المثلث من الزاويتين المعطيتين دون حساب الثالثة.","En":"Classifying from only the given angles without finding the third."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قياس الزاوية الثالثة 100 درجة، وهو أكبر من 90.","En":"The third angle is 100 degrees, greater than 90."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الزاوية القائمة تساوي 90 لا 100 درجة.","En":"A right angle is 90 degrees, not 100."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الزاوية المستقيمة تساوي 180 درجة، ولا تكون زاوية داخلية لمثلث غير منعدم.","En":"A straight angle is 180 degrees and is not an interior angle of a nondegenerate triangle."},"Order":4}]}$mw$),
($mw$growth-v89-grade-5-triangle-angle-correction-total-excess-1$mw$,$mw$triangle-angle-correction-total-excess$mw$,$mw$primary-triangle-angle-sum$mw$,$mw$grade-5$mw$,5,1,3,15,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":15,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح قياس زاوية","En":"Correcting an angle measurement"},"Question":{"Ar":"كتب طالب قياسات زوايا مثلث على أنها 48 و62 و80 درجة. إذا كان القياسان الأولان صحيحين، فبكم يجب إنقاص القياس الثالث ليصح السجل؟","En":"A pupil records triangle angles of 48, 62 and 80 degrees. If the first two measurements are correct, by how many degrees must the third be reduced to fix the record?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إنقاص 5 يجعل المجموع 185 لا 180.","En":"Reducing by 5 leaves a total of 185, not 180."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إنقاص 20 يجعل المجموع 170.","En":"Reducing by 20 leaves a total of 170."}},{"LatexCode":"70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"70 هو القياس الصحيح للزاوية الثالثة وليس مقدار الإنقاص.","En":"70 is the correct third angle, not the reduction."}}],"Hints":[{"Ar":"اجمع القياسات الثلاثة المسجلة.","En":"Add the three recorded measurements."},{"Ar":"احسب مقدار تجاوز المجموع للعدد 180.","En":"Find how much the sum exceeds 180."}],"Solution":{"Idea":{"Ar":"بما أن أول قياسين صحيحان، فإن الخطأ كله في القياس الثالث.","En":"With the first two correct, the entire error is in the third angle."},"FormulaLatex":"48+62+80=190","Steps":[{"Ar":"المجموع المسجل 190 درجة.","En":"The recorded total is 190 degrees."},{"Ar":"يجب أن ينقص بمقدار 10 درجات.","En":"It must be reduced by 10 degrees."}],"Substitution":{"Ar":"$190-180=10$","En":"$190-180=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"48 مع 62 مع 70 تساوي 180.","En":"48 plus 62 plus 70 equals 180."},"CommonError":{"Ar":"إعطاء القياس بعد التصحيح بدلاً من مقدار التعديل.","En":"Giving the corrected measure rather than the adjustment."}}}$mw$::jsonb,$mw$بما أن أول قياسين صحيحان، فإن الخطأ كله في القياس الثالث.

$48+62+80=190$

1. المجموع المسجل 190 درجة.

2. يجب أن ينقص بمقدار 10 درجات.

$190-180=10$

$10$

48 مع 62 مع 70 تساوي 180.

إعطاء القياس بعد التصحيح بدلاً من مقدار التعديل.$mw$,$mw$With the first two correct, the entire error is in the third angle.

$48+62+80=190$

1. The recorded total is 190 degrees.

2. It must be reduced by 10 degrees.

$190-180=10$

$10$

48 plus 62 plus 70 equals 180.

Giving the corrected measure rather than the adjustment.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع القياسات الثلاثة المسجلة.","En":"Add the three recorded measurements."},{"Ar":"احسب مقدار تجاوز المجموع للعدد 180.","En":"Find how much the sum exceeds 180."}],"Solution":{"Idea":{"Ar":"بما أن أول قياسين صحيحان، فإن الخطأ كله في القياس الثالث.","En":"With the first two correct, the entire error is in the third angle."},"FormulaLatex":"48+62+80=190","Steps":[{"Ar":"المجموع المسجل 190 درجة.","En":"The recorded total is 190 degrees."},{"Ar":"يجب أن ينقص بمقدار 10 درجات.","En":"It must be reduced by 10 degrees."}],"Substitution":{"Ar":"$190-180=10$","En":"$190-180=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"48 مع 62 مع 70 تساوي 180.","En":"48 plus 62 plus 70 equals 180."},"CommonError":{"Ar":"إعطاء القياس بعد التصحيح بدلاً من مقدار التعديل.","En":"Giving the corrected measure rather than the adjustment."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"إنقاص 5 يجعل المجموع 185 لا 180.","En":"Reducing by 5 leaves a total of 185, not 180."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"إنقاص 20 يجعل المجموع 170.","En":"Reducing by 20 leaves a total of 170."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"70 هو القياس الصحيح للزاوية الثالثة وليس مقدار الإنقاص.","En":"70 is the correct third angle, not the reduction."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v89 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
