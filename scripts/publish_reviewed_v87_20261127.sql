-- One-time owner-authorized v87 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v87-grade-4-addition-double-carry-from-ones-1$mw$,$mw$addition-double-carry-from-ones$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حمل أكثر من عشرة","En":"Carrying more than one ten"},"Question":{"Ar":"عند جمع الأعداد 128 و237 و349 عمودياً، ما عدد العشرات التي تُحمل من عمود الآحاد إلى عمود العشرات؟","En":"When adding 128, 237 and 349 in columns, how many tens are carried from the ones column into the tens column?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع الآحاد 24، وفيه عشرتان كاملتان.","En":"The ones total 24, containing two full tens."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاث عشرات تحتاج إلى 30 آحاداً على الأقل، والمجموع 24.","En":"Three tens require at least 30 ones, but the total is 24."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 هو رقم الآحاد الباقي وليس مقدار الحمل.","En":"4 is the remaining ones digit, not the carry."}}],"Hints":[{"Ar":"اجمع 8 و7 و9.","En":"Add 8, 7 and 9."},{"Ar":"افصل العشرات الكاملة عن الآحاد الباقية.","En":"Separate complete tens from the remaining ones."}],"Solution":{"Idea":{"Ar":"قد ينتج أكثر من عشرة عند جمع ثلاثة أرقام.","En":"Adding three digits can produce more than one ten."},"FormulaLatex":"8+7+9=24","Steps":[{"Ar":"مجموع الآحاد 24.","En":"The ones total 24."},{"Ar":"نعيد تجميع 20 آحاداً في عشرتين ونترك 4 آحاد.","En":"Regroup 20 ones into two tens, leaving four ones."}],"Substitution":{"Ar":"$24=2\\times10+4$","En":"$24=2\\times10+4$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عشرتان وأربع آحاد تعيدان 24.","En":"Two tens and four ones make 24."},"CommonError":{"Ar":"افتراض أن الحمل يساوي واحداً دائماً.","En":"Assuming the carry is always one."}}}$mw$::jsonb,$mw$قد ينتج أكثر من عشرة عند جمع ثلاثة أرقام.

$8+7+9=24$

1. مجموع الآحاد 24.

2. نعيد تجميع 20 آحاداً في عشرتين ونترك 4 آحاد.

$24=2\times10+4$

$2$

عشرتان وأربع آحاد تعيدان 24.

افتراض أن الحمل يساوي واحداً دائماً.$mw$,$mw$Adding three digits can produce more than one ten.

$8+7+9=24$

1. The ones total 24.

2. Regroup 20 ones into two tens, leaving four ones.

$24=2\times10+4$

$2$

Two tens and four ones make 24.

Assuming the carry is always one.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع 8 و7 و9.","En":"Add 8, 7 and 9."},{"Ar":"افصل العشرات الكاملة عن الآحاد الباقية.","En":"Separate complete tens from the remaining ones."}],"Solution":{"Idea":{"Ar":"قد ينتج أكثر من عشرة عند جمع ثلاثة أرقام.","En":"Adding three digits can produce more than one ten."},"FormulaLatex":"8+7+9=24","Steps":[{"Ar":"مجموع الآحاد 24.","En":"The ones total 24."},{"Ar":"نعيد تجميع 20 آحاداً في عشرتين ونترك 4 آحاد.","En":"Regroup 20 ones into two tens, leaving four ones."}],"Substitution":{"Ar":"$24=2\\times10+4$","En":"$24=2\\times10+4$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عشرتان وأربع آحاد تعيدان 24.","En":"Two tens and four ones make 24."},"CommonError":{"Ar":"افتراض أن الحمل يساوي واحداً دائماً.","En":"Assuming the carry is always one."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مجموع الآحاد 24، وفيه عشرتان كاملتان.","En":"The ones total 24, containing two full tens."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاث عشرات تحتاج إلى 30 آحاداً على الأقل، والمجموع 24.","En":"Three tens require at least 30 ones, but the total is 24."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"4 هو رقم الآحاد الباقي وليس مقدار الحمل.","En":"4 is the remaining ones digit, not the carry."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-addition-round-sum-vs-round-addends-1$mw$,$mw$addition-round-sum-vs-round-addends$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طريقتان للتقريب","En":"Two ways to round"},"Question":{"Ar":"لجمع 248 و248، قرّب سامر كل عدد إلى أقرب مئة قبل الجمع، بينما جمعت نور العددين بدقة ثم قرّبت المجموع إلى أقرب مئة. بكم يزيد ناتج نور على ناتج سامر؟","En":"For 248 + 248, Samer rounds each addend to the nearest hundred before adding, while Noor adds exactly and then rounds the sum to the nearest hundred. By how much is Noor's result greater?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تقريب الأعداد أولاً يعطي 400، وتقريب المجموع يعطي 500.","En":"Rounding the addends first gives 400; rounding the sum gives 500."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"48 فرق تقريب عدد واحد، لا فرق الناتجين.","En":"48 is the rounding difference for one addend, not the two results."}},{"LatexCode":"96","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"96 هو فرق 496 و400 قبل تقريب المجموع.","En":"96 is the difference between 496 and 400 before rounding the sum."}},{"LatexCode":"100","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"قرّب 248 إلى أقرب مئة.","En":"Round 248 to the nearest hundred."},{"Ar":"احسب المجموع الدقيق ثم قرّبه وقارن الناتجين.","En":"Compute the exact sum, round it and compare."}],"Solution":{"Idea":{"Ar":"قد يختلف تقريب المجموع عن مجموع الأعداد المقرّبة.","En":"Rounding a sum can differ from adding rounded numbers."},"FormulaLatex":"200+200=400","Steps":[{"Ar":"ناتج سامر 400.","En":"Samer obtains 400."},{"Ar":"المجموع الدقيق 496 ويُقرّب إلى 500.","En":"The exact sum is 496, which rounds to 500."}],"Substitution":{"Ar":"$500-400=100$","En":"$500-400=100$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"496 أقرب إلى 500 منه إلى 400.","En":"496 is closer to 500 than to 400."},"CommonError":{"Ar":"افتراض أن ترتيب الجمع والتقريب لا يؤثر أبداً.","En":"Assuming rounding and adding always give the same result regardless of order."}}}$mw$::jsonb,$mw$قد يختلف تقريب المجموع عن مجموع الأعداد المقرّبة.

$200+200=400$

1. ناتج سامر 400.

2. المجموع الدقيق 496 ويُقرّب إلى 500.

$500-400=100$

$100$

496 أقرب إلى 500 منه إلى 400.

افتراض أن ترتيب الجمع والتقريب لا يؤثر أبداً.$mw$,$mw$Rounding a sum can differ from adding rounded numbers.

$200+200=400$

1. Samer obtains 400.

2. The exact sum is 496, which rounds to 500.

$500-400=100$

$100$

496 is closer to 500 than to 400.

Assuming rounding and adding always give the same result regardless of order.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قرّب 248 إلى أقرب مئة.","En":"Round 248 to the nearest hundred."},{"Ar":"احسب المجموع الدقيق ثم قرّبه وقارن الناتجين.","En":"Compute the exact sum, round it and compare."}],"Solution":{"Idea":{"Ar":"قد يختلف تقريب المجموع عن مجموع الأعداد المقرّبة.","En":"Rounding a sum can differ from adding rounded numbers."},"FormulaLatex":"200+200=400","Steps":[{"Ar":"ناتج سامر 400.","En":"Samer obtains 400."},{"Ar":"المجموع الدقيق 496 ويُقرّب إلى 500.","En":"The exact sum is 496, which rounds to 500."}],"Substitution":{"Ar":"$500-400=100$","En":"$500-400=100$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"496 أقرب إلى 500 منه إلى 400.","En":"496 is closer to 500 than to 400."},"CommonError":{"Ar":"افتراض أن ترتيب الجمع والتقريب لا يؤثر أبداً.","En":"Assuming rounding and adding always give the same result regardless of order."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تقريب الأعداد أولاً يعطي 400، وتقريب المجموع يعطي 500.","En":"Rounding the addends first gives 400; rounding the sum gives 500."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"48 فرق تقريب عدد واحد، لا فرق الناتجين.","En":"48 is the rounding difference for one addend, not the two results."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"96 هو فرق 496 و400 قبل تقريب المجموع.","En":"96 is the difference between 496 and 400 before rounding the sum."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-addition-inverse-check-identify-1$mw$,$mw$addition-inverse-check-identify$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التحقق من الجمع","En":"Checking addition"},"Question":{"Ar":"كتب طالب $378+456=834$. أي عملية طرح تتحقق مباشرة من صحة جمعه باستخدام المجموع والعدد الأول؟","En":"A pupil writes $378+456=834$. Which subtraction directly checks the addition using the total and the first addend?"},"Options":[{"LatexCode":"834-378=456","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"834-456=378","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه تتحقق باستخدام العدد الثاني، لا الأول كما طلب السؤال.","En":"This checks using the second addend, not the first as requested."}},{"LatexCode":"456-378=78","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه تحسب الفرق بين العددين ولا تستخدم المجموع.","En":"This finds the difference between addends without using the total."}},{"LatexCode":"834-378=466","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 378 من 834 يعطي 456 لا 466.","En":"Subtracting 378 from 834 gives 456, not 466."}}],"Hints":[{"Ar":"اطرح العدد الأول من المجموع.","En":"Subtract the first addend from the total."},{"Ar":"يجب أن تحصل على العدد الثاني.","En":"The result must equal the second addend."}],"Solution":{"Idea":{"Ar":"الجمع والطرح عمليتان عكسيتان.","En":"Addition and subtraction are inverse operations."},"FormulaLatex":"834-378=456","Steps":[{"Ar":"المجموع المكتوب 834 والعدد الأول 378.","En":"The reported total is 834 and the first addend is 378."},{"Ar":"نطرح الأول من المجموع فنحصل على 456.","En":"Subtract the first addend from the total to obtain 456."}],"Substitution":{"Ar":"$834-378=456$","En":"$834-378=456$"},"Result":{"Ar":"$834-378=456$","En":"$834-378=456$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"456 مع 378 يساوي 834 بالفعل.","En":"456 plus 378 indeed equals 834."},"CommonError":{"Ar":"طرح العددين المضافين من بعضهما بدلاً من طرح أحدهما من المجموع.","En":"Subtracting one addend from the other instead of subtracting an addend from the total."}}}$mw$::jsonb,$mw$الجمع والطرح عمليتان عكسيتان.

$834-378=456$

1. المجموع المكتوب 834 والعدد الأول 378.

2. نطرح الأول من المجموع فنحصل على 456.

$834-378=456$

$834-378=456$

456 مع 378 يساوي 834 بالفعل.

طرح العددين المضافين من بعضهما بدلاً من طرح أحدهما من المجموع.$mw$,$mw$Addition and subtraction are inverse operations.

$834-378=456$

1. The reported total is 834 and the first addend is 378.

2. Subtract the first addend from the total to obtain 456.

$834-378=456$

$834-378=456$

456 plus 378 indeed equals 834.

Subtracting one addend from the other instead of subtracting an addend from the total.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح العدد الأول من المجموع.","En":"Subtract the first addend from the total."},{"Ar":"يجب أن تحصل على العدد الثاني.","En":"The result must equal the second addend."}],"Solution":{"Idea":{"Ar":"الجمع والطرح عمليتان عكسيتان.","En":"Addition and subtraction are inverse operations."},"FormulaLatex":"834-378=456","Steps":[{"Ar":"المجموع المكتوب 834 والعدد الأول 378.","En":"The reported total is 834 and the first addend is 378."},{"Ar":"نطرح الأول من المجموع فنحصل على 456.","En":"Subtract the first addend from the total to obtain 456."}],"Substitution":{"Ar":"$834-378=456$","En":"$834-378=456$"},"Result":{"Ar":"$834-378=456$","En":"$834-378=456$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"456 مع 378 يساوي 834 بالفعل.","En":"456 plus 378 indeed equals 834."},"CommonError":{"Ar":"طرح العددين المضافين من بعضهما بدلاً من طرح أحدهما من المجموع.","En":"Subtracting one addend from the other instead of subtracting an addend from the total."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه تتحقق باستخدام العدد الثاني، لا الأول كما طلب السؤال.","En":"This checks using the second addend, not the first as requested."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه تحسب الفرق بين العددين ولا تستخدم المجموع.","En":"This finds the difference between addends without using the total."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح 378 من 834 يعطي 456 لا 466.","En":"Subtracting 378 from 834 gives 456, not 466."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-equation-reversed-division-error-1$mw$,$mw$equation-reversed-division-error$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح ترتيب القسمة","En":"Correcting division order"},"Question":{"Ar":"لحل $12x=144$ كتب طالب $x=12\\div144$. أي تصحيح يوضح العملية المطلوبة؟","En":"To solve $12x=144$, a pupil writes $x=12\\div144$. Which correction shows the required operation?"},"Options":[{"LatexCode":"x=144-12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الطرح لا يعكس ضرب المجهول في 12.","En":"Subtraction does not undo multiplication by 12."}},{"LatexCode":"x=144\\div12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x=144\\times12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب يزيد أثر المعامل بدلاً من إزالته.","En":"Multiplication increases the effect of the coefficient rather than removing it."}},{"LatexCode":"x=12+144","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع ليس العملية العكسية للضرب.","En":"Addition is not the inverse of multiplication."}}],"Hints":[{"Ar":"اقسم طرفي المعادلة على معامل x.","En":"Divide both sides by the coefficient of x."},{"Ar":"ضع الناتج 144 في البسط والمعامل 12 في المقام.","En":"Put the product 144 in the numerator and coefficient 12 in the denominator."}],"Solution":{"Idea":{"Ar":"نعزل المجهول بقسمة حاصل الضرب على المعامل.","En":"Isolate the unknown by dividing the product by the coefficient."},"FormulaLatex":"\\frac{12x}{12}=\\frac{144}{12}","Steps":[{"Ar":"الطرف الأيسر يصبح x.","En":"The left side becomes x."},{"Ar":"الطرف الأيمن 144 مقسوماً على 12 يساوي 12.","En":"The right side is 144 divided by 12, which equals 12."}],"Substitution":{"Ar":"$x=12$","En":"$x=12$"},"Result":{"Ar":"$x=144\\div12$","En":"$x=144\\div12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالتعويض نجد 12 في 12 يساوي 144.","En":"Substitution gives 12 times 12 equals 144."},"CommonError":{"Ar":"عكس المقسوم والمقسوم عليه.","En":"Reversing dividend and divisor."}}}$mw$::jsonb,$mw$نعزل المجهول بقسمة حاصل الضرب على المعامل.

$\frac{12x}{12}=\frac{144}{12}$

1. الطرف الأيسر يصبح x.

2. الطرف الأيمن 144 مقسوماً على 12 يساوي 12.

$x=12$

$x=144\div12$

بالتعويض نجد 12 في 12 يساوي 144.

عكس المقسوم والمقسوم عليه.$mw$,$mw$Isolate the unknown by dividing the product by the coefficient.

$\frac{12x}{12}=\frac{144}{12}$

1. The left side becomes x.

2. The right side is 144 divided by 12, which equals 12.

$x=12$

$x=144\div12$

Substitution gives 12 times 12 equals 144.

Reversing dividend and divisor.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم طرفي المعادلة على معامل x.","En":"Divide both sides by the coefficient of x."},{"Ar":"ضع الناتج 144 في البسط والمعامل 12 في المقام.","En":"Put the product 144 in the numerator and coefficient 12 in the denominator."}],"Solution":{"Idea":{"Ar":"نعزل المجهول بقسمة حاصل الضرب على المعامل.","En":"Isolate the unknown by dividing the product by the coefficient."},"FormulaLatex":"\\frac{12x}{12}=\\frac{144}{12}","Steps":[{"Ar":"الطرف الأيسر يصبح x.","En":"The left side becomes x."},{"Ar":"الطرف الأيمن 144 مقسوماً على 12 يساوي 12.","En":"The right side is 144 divided by 12, which equals 12."}],"Substitution":{"Ar":"$x=12$","En":"$x=12$"},"Result":{"Ar":"$x=144\\div12$","En":"$x=144\\div12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالتعويض نجد 12 في 12 يساوي 144.","En":"Substitution gives 12 times 12 equals 144."},"CommonError":{"Ar":"عكس المقسوم والمقسوم عليه.","En":"Reversing dividend and divisor."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الطرح لا يعكس ضرب المجهول في 12.","En":"Subtraction does not undo multiplication by 12."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الضرب يزيد أثر المعامل بدلاً من إزالته.","En":"Multiplication increases the effect of the coefficient rather than removing it."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الجمع ليس العملية العكسية للضرب.","En":"Addition is not the inverse of multiplication."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-equation-solution-scale-right-side-1$mw$,$mw$equation-solution-scale-right-side$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير الحل مع الناتج","En":"Scaling the solution"},"Question":{"Ar":"نعلم أن حل $7x=42$ هو $x=6$. إذا أصبحت المعادلة $7y=126$، فما قيمة y باستخدام الحل المعلوم؟","En":"The solution of $7x=42$ is $x=6$. If the new equation is $7y=126$, what is y using the known solution?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يعطي 42 فقط، لا 126.","En":"6 gives 42, not 126."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"126 يساوي ثلاثة أمثال 42 لا مثليه.","En":"126 is three times 42, not twice."}},{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"84","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"84 هو الفرق بين الناتجين وليس الحل.","En":"84 is the difference between products, not the solution."}}],"Hints":[{"Ar":"كم مرة يحتوي 126 على 42؟","En":"How many times does 42 fit into 126?"},{"Ar":"ضاعف الحل 6 بالعامل نفسه.","En":"Scale the solution 6 by the same factor."}],"Solution":{"Idea":{"Ar":"مع ثبات المعامل، يتغير الحل بالعامل نفسه الذي يتغير به حاصل الضرب.","En":"With a fixed coefficient, the solution scales by the same factor as the product."},"FormulaLatex":"126=3\\times42","Steps":[{"Ar":"الناتج الجديد ثلاثة أمثال القديم.","En":"The new product is three times the old one."},{"Ar":"الحل الجديد ثلاثة أمثال 6.","En":"The new solution is three times 6."}],"Substitution":{"Ar":"$y=3\\times6=18$","En":"$y=3\\times6=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"7 في 18 يساوي 126.","En":"7 times 18 equals 126."},"CommonError":{"Ar":"إضافة فرق الناتجين مباشرة إلى الحل.","En":"Adding the product difference directly to the solution."}}}$mw$::jsonb,$mw$مع ثبات المعامل، يتغير الحل بالعامل نفسه الذي يتغير به حاصل الضرب.

$126=3\times42$

1. الناتج الجديد ثلاثة أمثال القديم.

2. الحل الجديد ثلاثة أمثال 6.

$y=3\times6=18$

$18$

7 في 18 يساوي 126.

إضافة فرق الناتجين مباشرة إلى الحل.$mw$,$mw$With a fixed coefficient, the solution scales by the same factor as the product.

$126=3\times42$

1. The new product is three times the old one.

2. The new solution is three times 6.

$y=3\times6=18$

$18$

7 times 18 equals 126.

Adding the product difference directly to the solution.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم مرة يحتوي 126 على 42؟","En":"How many times does 42 fit into 126?"},{"Ar":"ضاعف الحل 6 بالعامل نفسه.","En":"Scale the solution 6 by the same factor."}],"Solution":{"Idea":{"Ar":"مع ثبات المعامل، يتغير الحل بالعامل نفسه الذي يتغير به حاصل الضرب.","En":"With a fixed coefficient, the solution scales by the same factor as the product."},"FormulaLatex":"126=3\\times42","Steps":[{"Ar":"الناتج الجديد ثلاثة أمثال القديم.","En":"The new product is three times the old one."},{"Ar":"الحل الجديد ثلاثة أمثال 6.","En":"The new solution is three times 6."}],"Substitution":{"Ar":"$y=3\\times6=18$","En":"$y=3\\times6=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"7 في 18 يساوي 126.","En":"7 times 18 equals 126."},"CommonError":{"Ar":"إضافة فرق الناتجين مباشرة إلى الحل.","En":"Adding the product difference directly to the solution."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"6 يعطي 42 فقط، لا 126.","En":"6 gives 42, not 126."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"126 يساوي ثلاثة أمثال 42 لا مثليه.","En":"126 is three times 42, not twice."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"84 هو الفرق بين الناتجين وليس الحل.","En":"84 is the difference between products, not the solution."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-equation-known-product-commutative-factor-1$mw$,$mw$equation-known-product-commutative-factor$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استخدام حقيقة ضرب معروفة","En":"Using a known multiplication fact"},"Question":{"Ar":"يعلم طالب أن $16\\times5=80$. أي قيمة تحل المعادلة $5x=80$ دون إعادة حساب حاصل الضرب؟","En":"A pupil knows that $16\\times5=80$. Which value solves $5x=80$ without recalculating the product?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 في 5 يساوي 25.","En":"5 times 5 equals 25."}},{"LatexCode":"16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"75","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"75 هو ناتج طرح 5 من 80 وليس خارج القسمة.","En":"75 is 80 minus 5, not the quotient."}},{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 في 80 يساوي 400.","En":"5 times 80 equals 400."}}],"Hints":[{"Ar":"تذكر خاصية تبديل عاملي الضرب.","En":"Recall that multiplication factors can be swapped."},{"Ar":"أعد كتابة 16 في 5 على صورة 5 في عدد.","En":"Rewrite 16 times 5 as 5 times a number."}],"Solution":{"Idea":{"Ar":"تبديل ترتيب عاملي الضرب يحافظ على الناتج.","En":"Swapping multiplication factors preserves the product."},"FormulaLatex":"16\\times5=5\\times16","Steps":[{"Ar":"نعلم أن 5 في 16 يساوي 80.","En":"We know that 5 times 16 equals 80."},{"Ar":"إذن 16 هي القيمة التي تحقق المعادلة.","En":"Therefore 16 satisfies the equation."}],"Substitution":{"Ar":"$5\\times16=80$","En":"$5\\times16=80$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"قسمة 80 على 5 تعيد 16.","En":"80 divided by 5 returns 16."},"CommonError":{"Ar":"اختيار المعامل بدلاً من العامل المجهول.","En":"Choosing the coefficient rather than the unknown factor."}}}$mw$::jsonb,$mw$تبديل ترتيب عاملي الضرب يحافظ على الناتج.

$16\times5=5\times16$

1. نعلم أن 5 في 16 يساوي 80.

2. إذن 16 هي القيمة التي تحقق المعادلة.

$5\times16=80$

$16$

قسمة 80 على 5 تعيد 16.

اختيار المعامل بدلاً من العامل المجهول.$mw$,$mw$Swapping multiplication factors preserves the product.

$16\times5=5\times16$

1. We know that 5 times 16 equals 80.

2. Therefore 16 satisfies the equation.

$5\times16=80$

$16$

80 divided by 5 returns 16.

Choosing the coefficient rather than the unknown factor.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تذكر خاصية تبديل عاملي الضرب.","En":"Recall that multiplication factors can be swapped."},{"Ar":"أعد كتابة 16 في 5 على صورة 5 في عدد.","En":"Rewrite 16 times 5 as 5 times a number."}],"Solution":{"Idea":{"Ar":"تبديل ترتيب عاملي الضرب يحافظ على الناتج.","En":"Swapping multiplication factors preserves the product."},"FormulaLatex":"16\\times5=5\\times16","Steps":[{"Ar":"نعلم أن 5 في 16 يساوي 80.","En":"We know that 5 times 16 equals 80."},{"Ar":"إذن 16 هي القيمة التي تحقق المعادلة.","En":"Therefore 16 satisfies the equation."}],"Substitution":{"Ar":"$5\\times16=80$","En":"$5\\times16=80$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"قسمة 80 على 5 تعيد 16.","En":"80 divided by 5 returns 16."},"CommonError":{"Ar":"اختيار المعامل بدلاً من العامل المجهول.","En":"Choosing the coefficient rather than the unknown factor."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 في 5 يساوي 25.","En":"5 times 5 equals 25."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"75 هو ناتج طرح 5 من 80 وليس خارج القسمة.","En":"75 is 80 minus 5, not the quotient."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"5 في 80 يساوي 400.","En":"5 times 80 equals 400."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-capacity-transfer-to-fill-limit-1$mw$,$mw$capacity-transfer-to-fill-limit$mw$,$mw$capacity$mw$,$mw$grade-4$mw$,4,1,82,320,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":320,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نقل الماء دون فيضان","En":"Transferring without overflow"},"Question":{"Ar":"في إبريق A كمية 900 mL، وفي إبريق B كمية 650 mL وسعته 1 L. نملأ B من A حتى يمتلئ تماماً دون سكب. كم مليلتراً يبقى في A؟","En":"Jug A contains 900 mL; jug B contains 650 mL and has a capacity of 1 L. Fill B from A until B is completely full, without spilling. How many millilitres remain in A?"},"Options":[{"LatexCode":"250","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نقل 350 mL من 900 mL يترك 550 mL.","En":"Moving 350 mL from 900 mL leaves 550 mL."}},{"LatexCode":"350","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"350 هو المقدار المنقول لا المتبقي.","En":"350 is the transferred amount, not the remainder."}},{"LatexCode":"550","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"650","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"650 كانت كمية B قبل النقل.","En":"650 was the initial amount in B."}}],"Hints":[{"Ar":"احسب السعة الفارغة في B.","En":"Find the empty capacity in B."},{"Ar":"اطرح مقدار النقل من كمية A.","En":"Subtract the transfer amount from A."}],"Solution":{"Idea":{"Ar":"ننقل فقط المقدار اللازم لإكمال سعة الإبريق الثاني.","En":"Transfer only what is needed to fill the second jug."},"FormulaLatex":"1000-650=350","Steps":[{"Ar":"يحتاج B إلى 350 mL.","En":"B needs 350 mL."},{"Ar":"يبقى في A مقدار 900 ناقص 350.","En":"A retains 900 minus 350 mL."}],"Substitution":{"Ar":"$900-350=550$","En":"$900-350=550$"},"Result":{"Ar":"$550$","En":"$550$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كان المجموع 1550 mL وما زال 1000 مع 550 يساوي 1550.","En":"The total remains 1550 mL: 1000 plus 550."},"CommonError":{"Ar":"الإجابة بمقدار الماء المنقول بدلاً من المتبقي.","En":"Giving the amount transferred instead of the amount remaining."}}}$mw$::jsonb,$mw$ننقل فقط المقدار اللازم لإكمال سعة الإبريق الثاني.

$1000-650=350$

1. يحتاج B إلى 350 mL.

2. يبقى في A مقدار 900 ناقص 350.

$900-350=550$

$550$

كان المجموع 1550 mL وما زال 1000 مع 550 يساوي 1550.

الإجابة بمقدار الماء المنقول بدلاً من المتبقي.$mw$,$mw$Transfer only what is needed to fill the second jug.

$1000-650=350$

1. B needs 350 mL.

2. A retains 900 minus 350 mL.

$900-350=550$

$550$

The total remains 1550 mL: 1000 plus 550.

Giving the amount transferred instead of the amount remaining.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب السعة الفارغة في B.","En":"Find the empty capacity in B."},{"Ar":"اطرح مقدار النقل من كمية A.","En":"Subtract the transfer amount from A."}],"Solution":{"Idea":{"Ar":"ننقل فقط المقدار اللازم لإكمال سعة الإبريق الثاني.","En":"Transfer only what is needed to fill the second jug."},"FormulaLatex":"1000-650=350","Steps":[{"Ar":"يحتاج B إلى 350 mL.","En":"B needs 350 mL."},{"Ar":"يبقى في A مقدار 900 ناقص 350.","En":"A retains 900 minus 350 mL."}],"Substitution":{"Ar":"$900-350=550$","En":"$900-350=550$"},"Result":{"Ar":"$550$","En":"$550$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كان المجموع 1550 mL وما زال 1000 مع 550 يساوي 1550.","En":"The total remains 1550 mL: 1000 plus 550."},"CommonError":{"Ar":"الإجابة بمقدار الماء المنقول بدلاً من المتبقي.","En":"Giving the amount transferred instead of the amount remaining."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"نقل 350 mL من 900 mL يترك 550 mL.","En":"Moving 350 mL from 900 mL leaves 550 mL."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"350 هو المقدار المنقول لا المتبقي.","En":"350 is the transferred amount, not the remainder."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"650 كانت كمية B قبل النقل.","En":"650 was the initial amount in B."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-capacity-two-cup-sizes-exact-fill-1$mw$,$mw$capacity-two-cup-sizes-exact-fill$mw$,$mw$capacity$mw$,$mw$grade-4$mw$,4,1,82,320,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":320,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قياس كمية بكوبين مختلفين","En":"Measuring with two cup sizes"},"Question":{"Ar":"يريد طفل قياس 1 L من الماء. ملأ كوباً سعته 400 mL مرة واحدة. كم مرة يحتاج إلى ملء كوب سعته 150 mL لإكمال اللتر بالضبط؟","En":"A child needs to measure 1 L of water. A 400 mL cup is filled once. How many times must a 150 mL cup be filled to make exactly one litre?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مرتان تعطيان 300 mL فقط من 600 mL المطلوبة.","En":"Two fills give only 300 of the needed 600 mL."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاث مرات تعطي 450 mL فقط.","En":"Three fills give only 450 mL."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ست مرات تعطي 900 mL إضافية وتتجاوز اللتر.","En":"Six fills add 900 mL and exceed a litre."}}],"Hints":[{"Ar":"حوّل 1 L إلى mL واطرح 400.","En":"Convert 1 L to mL and subtract 400."},{"Ar":"اقسم المقدار الباقي على 150.","En":"Divide the remaining amount by 150."}],"Solution":{"Idea":{"Ar":"نحسب الكمية المتبقية ثم عدد الأكواب الصغيرة اللازمة.","En":"Find the remaining volume and divide by the small cup capacity."},"FormulaLatex":"1000-400=600","Steps":[{"Ar":"نحتاج 600 mL بعد الكوب الأول.","En":"We need 600 mL after the first cup."},{"Ar":"600 مقسومة على 150 تساوي أربع مرات.","En":"600 divided by 150 equals four fills."}],"Substitution":{"Ar":"$600\\div150=4$","En":"$600\\div150=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"400 مع أربعة أمثال 150 يساوي 1000 mL.","En":"400 plus four times 150 equals 1000 mL."},"CommonError":{"Ar":"قسمة اللتر كاملاً على سعة الكوب الصغير رغم استعمال الكوب الأول.","En":"Dividing the entire litre by the small cup size despite using the first cup."}}}$mw$::jsonb,$mw$نحسب الكمية المتبقية ثم عدد الأكواب الصغيرة اللازمة.

$1000-400=600$

1. نحتاج 600 mL بعد الكوب الأول.

2. 600 مقسومة على 150 تساوي أربع مرات.

$600\div150=4$

$4$

400 مع أربعة أمثال 150 يساوي 1000 mL.

قسمة اللتر كاملاً على سعة الكوب الصغير رغم استعمال الكوب الأول.$mw$,$mw$Find the remaining volume and divide by the small cup capacity.

$1000-400=600$

1. We need 600 mL after the first cup.

2. 600 divided by 150 equals four fills.

$600\div150=4$

$4$

400 plus four times 150 equals 1000 mL.

Dividing the entire litre by the small cup size despite using the first cup.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل 1 L إلى mL واطرح 400.","En":"Convert 1 L to mL and subtract 400."},{"Ar":"اقسم المقدار الباقي على 150.","En":"Divide the remaining amount by 150."}],"Solution":{"Idea":{"Ar":"نحسب الكمية المتبقية ثم عدد الأكواب الصغيرة اللازمة.","En":"Find the remaining volume and divide by the small cup capacity."},"FormulaLatex":"1000-400=600","Steps":[{"Ar":"نحتاج 600 mL بعد الكوب الأول.","En":"We need 600 mL after the first cup."},{"Ar":"600 مقسومة على 150 تساوي أربع مرات.","En":"600 divided by 150 equals four fills."}],"Substitution":{"Ar":"$600\\div150=4$","En":"$600\\div150=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"400 مع أربعة أمثال 150 يساوي 1000 mL.","En":"400 plus four times 150 equals 1000 mL."},"CommonError":{"Ar":"قسمة اللتر كاملاً على سعة الكوب الصغير رغم استعمال الكوب الأول.","En":"Dividing the entire litre by the small cup size despite using the first cup."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مرتان تعطيان 300 mL فقط من 600 mL المطلوبة.","En":"Two fills give only 300 of the needed 600 mL."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ثلاث مرات تعطي 450 mL فقط.","En":"Three fills give only 450 mL."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ست مرات تعطي 900 mL إضافية وتتجاوز اللتر.","En":"Six fills add 900 mL and exceed a litre."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-mass-complement-pair-to-target-1$mw$,$mw$mass-complement-pair-to-target$mw$,$mw$mass$mw$,$mw$grade-4$mw$,4,1,82,322,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":322,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار كتلتين","En":"Choosing two masses"},"Question":{"Ar":"لدينا أربع قطع كتلها: 650 g و850 g و1 kg و1 kg 150 g. أي زوج مجموع كتلتيه 2 kg بالضبط؟ A: 650 و850؛ B: 650 و1150؛ C: 850 و1150؛ D: 1000 و1150 (بالغرام).","En":"Four objects have masses 650 g, 850 g, 1 kg and 1 kg 150 g. Which pair totals exactly 2 kg? A: 650 and 850; B: 650 and 1150; C: 850 and 1150; D: 1000 and 1150 (in grams)."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"650 مع 850 يساوي 1500 g.","En":"650 plus 850 is 1500 g."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"650 مع 1150 يساوي 1800 g.","En":"650 plus 1150 is 1800 g."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1000 مع 1150 يساوي 2150 g.","En":"1000 plus 1150 is 2150 g."}}],"Hints":[{"Ar":"حوّل الهدف 2 kg إلى غرامات.","En":"Convert the target 2 kg to grams."},{"Ar":"اجمع كتل كل زوج وقارن مع 2000.","En":"Add each pair and compare with 2000."}],"Solution":{"Idea":{"Ar":"نبحث عن زوج يحقق الكتلة المطلوبة بعد توحيد الوحدات.","En":"Find a pair matching the target mass in a common unit."},"FormulaLatex":"2\\,\\mathrm{kg}=2000\\,\\mathrm{g}","Steps":[{"Ar":"القطعة الأخيرة كتلتها 1150 g.","En":"The last object has mass 1150 g."},{"Ar":"850 مع 1150 يساوي 2000 g.","En":"850 plus 1150 equals 2000 g."}],"Substitution":{"Ar":"$850+1150=2000$","En":"$850+1150=2000$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"2000 g تساوي 2 kg بالضبط.","En":"2000 g equals exactly 2 kg."},"CommonError":{"Ar":"تقريب الكتل بدلاً من التحقق من المجموع الدقيق.","En":"Rounding masses instead of checking the exact total."}}}$mw$::jsonb,$mw$نبحث عن زوج يحقق الكتلة المطلوبة بعد توحيد الوحدات.

$2\,\mathrm{kg}=2000\,\mathrm{g}$

1. القطعة الأخيرة كتلتها 1150 g.

2. 850 مع 1150 يساوي 2000 g.

$850+1150=2000$

$C$

2000 g تساوي 2 kg بالضبط.

تقريب الكتل بدلاً من التحقق من المجموع الدقيق.$mw$,$mw$Find a pair matching the target mass in a common unit.

$2\,\mathrm{kg}=2000\,\mathrm{g}$

1. The last object has mass 1150 g.

2. 850 plus 1150 equals 2000 g.

$850+1150=2000$

$C$

2000 g equals exactly 2 kg.

Rounding masses instead of checking the exact total.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الهدف 2 kg إلى غرامات.","En":"Convert the target 2 kg to grams."},{"Ar":"اجمع كتل كل زوج وقارن مع 2000.","En":"Add each pair and compare with 2000."}],"Solution":{"Idea":{"Ar":"نبحث عن زوج يحقق الكتلة المطلوبة بعد توحيد الوحدات.","En":"Find a pair matching the target mass in a common unit."},"FormulaLatex":"2\\,\\mathrm{kg}=2000\\,\\mathrm{g}","Steps":[{"Ar":"القطعة الأخيرة كتلتها 1150 g.","En":"The last object has mass 1150 g."},{"Ar":"850 مع 1150 يساوي 2000 g.","En":"850 plus 1150 equals 2000 g."}],"Substitution":{"Ar":"$850+1150=2000$","En":"$850+1150=2000$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"2000 g تساوي 2 kg بالضبط.","En":"2000 g equals exactly 2 kg."},"CommonError":{"Ar":"تقريب الكتل بدلاً من التحقق من المجموع الدقيق.","En":"Rounding masses instead of checking the exact total."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"650 مع 850 يساوي 1500 g.","En":"650 plus 850 is 1500 g."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"650 مع 1150 يساوي 1800 g.","En":"650 plus 1150 is 1800 g."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"1000 مع 1150 يساوي 2150 g.","En":"1000 plus 1150 is 2150 g."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-mass-equal-packets-mixed-unit-total-1$mw$,$mw$mass-equal-packets-mixed-unit-total$mw$,$mw$mass$mw$,$mw$grade-4$mw$,4,1,82,322,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":322,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"توزيع كتلة متساوية","En":"Sharing a mass equally"},"Question":{"Ar":"لدى مخبز 2 kg و400 g من الدقيق، يريد توزيعه بالتساوي في ستة أكياس دون بقايا. ما كتلة الدقيق في كل كيس بالغرام؟","En":"A bakery has 2 kg 400 g of flour and shares it equally among six bags with none left. How many grams are in each bag?"},"Options":[{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يقلل خارج القسمة الصحيح بعامل عشرة.","En":"This is ten times too small."}},{"LatexCode":"240","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسمة 2400 على 6 لا تعطي 240.","En":"2400 divided by six is not 240."}},{"LatexCode":"400","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"600","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستة أكياس من 600 g تحتاج 3600 g.","En":"Six 600 g bags would require 3600 g."}}],"Hints":[{"Ar":"حوّل الكتلة الكلية إلى غرامات.","En":"Convert the total mass to grams."},{"Ar":"اقسمها على ستة.","En":"Divide by six."}],"Solution":{"Idea":{"Ar":"نوحد وحدة الكتلة ثم نوزعها بالتساوي.","En":"Use one mass unit and share equally."},"FormulaLatex":"2000+400=2400","Steps":[{"Ar":"الكتلة الكلية 2400 g.","En":"The total mass is 2400 g."},{"Ar":"نقسمها على ستة أكياس.","En":"Divide it among six bags."}],"Substitution":{"Ar":"$2400\\div6=400$","En":"$2400\\div6=400$"},"Result":{"Ar":"$400$","En":"$400$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ستة أمثال 400 g تساوي 2400 g.","En":"Six times 400 g is 2400 g."},"CommonError":{"Ar":"قسمة الجزء المكتوب بالغرام وحده وإهمال الكيلوغرامات.","En":"Dividing only the gram component and ignoring kilograms."}}}$mw$::jsonb,$mw$نوحد وحدة الكتلة ثم نوزعها بالتساوي.

$2000+400=2400$

1. الكتلة الكلية 2400 g.

2. نقسمها على ستة أكياس.

$2400\div6=400$

$400$

ستة أمثال 400 g تساوي 2400 g.

قسمة الجزء المكتوب بالغرام وحده وإهمال الكيلوغرامات.$mw$,$mw$Use one mass unit and share equally.

$2000+400=2400$

1. The total mass is 2400 g.

2. Divide it among six bags.

$2400\div6=400$

$400$

Six times 400 g is 2400 g.

Dividing only the gram component and ignoring kilograms.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الكتلة الكلية إلى غرامات.","En":"Convert the total mass to grams."},{"Ar":"اقسمها على ستة.","En":"Divide by six."}],"Solution":{"Idea":{"Ar":"نوحد وحدة الكتلة ثم نوزعها بالتساوي.","En":"Use one mass unit and share equally."},"FormulaLatex":"2000+400=2400","Steps":[{"Ar":"الكتلة الكلية 2400 g.","En":"The total mass is 2400 g."},{"Ar":"نقسمها على ستة أكياس.","En":"Divide it among six bags."}],"Substitution":{"Ar":"$2400\\div6=400$","En":"$2400\\div6=400$"},"Result":{"Ar":"$400$","En":"$400$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ستة أمثال 400 g تساوي 2400 g.","En":"Six times 400 g is 2400 g."},"CommonError":{"Ar":"قسمة الجزء المكتوب بالغرام وحده وإهمال الكيلوغرامات.","En":"Dividing only the gram component and ignoring kilograms."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يقلل خارج القسمة الصحيح بعامل عشرة.","En":"This is ten times too small."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسمة 2400 على 6 لا تعطي 240.","En":"2400 divided by six is not 240."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ستة أكياس من 600 g تحتاج 3600 g.","En":"Six 600 g bags would require 3600 g."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-time-overlap-two-activities-1$mw$,$mw$time-overlap-two-activities$mw$,$mw$time$mw$,$mw$grade-4$mw$,4,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الوقت المشترك","En":"Overlapping time"},"Question":{"Ar":"بدأ نشاط الرسم عند 09:10 وانتهى عند 09:50، وبدأ نشاط القراءة عند 09:35 وانتهى عند 10:05. كم دقيقة كان النشاطان جاريين في الوقت نفسه؟","En":"Drawing runs from 09:10 to 09:50, and reading from 09:35 to 10:05. For how many minutes are both activities running at the same time?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفترة المشتركة تبدأ عند 09:35 لا 09:40.","En":"The overlap starts at 09:35, not 09:40."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"25 دقيقة هي الفترة بين بدايتي النشاطين.","En":"25 minutes is the gap between the start times."}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"30 دقيقة مدة القراءة كاملة لا الجزء المشترك.","En":"30 minutes is the entire reading session, not the overlap."}}],"Hints":[{"Ar":"حدد وقت بدء النشاط الأخير.","En":"Find the later start time."},{"Ar":"حدد وقت انتهاء النشاط الأول الذي ينتهي.","En":"Find the earlier end time."}],"Solution":{"Idea":{"Ar":"الفترة المشتركة تبدأ عند البداية المتأخرة وتنتهي عند النهاية المبكرة.","En":"The overlap runs from the later start to the earlier finish."},"FormulaLatex":"50-35=15","Steps":[{"Ar":"يبدأ التزامن عند 09:35.","En":"Both are running from 09:35."},{"Ar":"ينتهي التزامن عند 09:50.","En":"The overlap ends at 09:50."}],"Substitution":{"Ar":"$50-35=15$","En":"$50-35=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"قبل 09:35 الرسم وحده جارٍ وبعد 09:50 القراءة وحدها جارية.","En":"Before 09:35 only drawing runs; after 09:50 only reading runs."},"CommonError":{"Ar":"جمع المدتين بدلاً من حساب تقاطعهما.","En":"Adding durations instead of finding the overlap."}}}$mw$::jsonb,$mw$الفترة المشتركة تبدأ عند البداية المتأخرة وتنتهي عند النهاية المبكرة.

$50-35=15$

1. يبدأ التزامن عند 09:35.

2. ينتهي التزامن عند 09:50.

$50-35=15$

$15$

قبل 09:35 الرسم وحده جارٍ وبعد 09:50 القراءة وحدها جارية.

جمع المدتين بدلاً من حساب تقاطعهما.$mw$,$mw$The overlap runs from the later start to the earlier finish.

$50-35=15$

1. Both are running from 09:35.

2. The overlap ends at 09:50.

$50-35=15$

$15$

Before 09:35 only drawing runs; after 09:50 only reading runs.

Adding durations instead of finding the overlap.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد وقت بدء النشاط الأخير.","En":"Find the later start time."},{"Ar":"حدد وقت انتهاء النشاط الأول الذي ينتهي.","En":"Find the earlier end time."}],"Solution":{"Idea":{"Ar":"الفترة المشتركة تبدأ عند البداية المتأخرة وتنتهي عند النهاية المبكرة.","En":"The overlap runs from the later start to the earlier finish."},"FormulaLatex":"50-35=15","Steps":[{"Ar":"يبدأ التزامن عند 09:35.","En":"Both are running from 09:35."},{"Ar":"ينتهي التزامن عند 09:50.","En":"The overlap ends at 09:50."}],"Substitution":{"Ar":"$50-35=15$","En":"$50-35=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"قبل 09:35 الرسم وحده جارٍ وبعد 09:50 القراءة وحدها جارية.","En":"Before 09:35 only drawing runs; after 09:50 only reading runs."},"CommonError":{"Ar":"جمع المدتين بدلاً من حساب تقاطعهما.","En":"Adding durations instead of finding the overlap."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الفترة المشتركة تبدأ عند 09:35 لا 09:40.","En":"The overlap starts at 09:35, not 09:40."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"25 دقيقة هي الفترة بين بدايتي النشاطين.","En":"25 minutes is the gap between the start times."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"30 دقيقة مدة القراءة كاملة لا الجزء المشترك.","En":"30 minutes is the entire reading session, not the overlap."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-time-repeating-minute-hand-full-revolutions-1$mw$,$mw$time-repeating-minute-hand-full-revolutions$mw$,$mw$time$mw$,$mw$grade-4$mw$,4,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"دورات عقرب الدقائق","En":"Minute-hand revolutions"},"Question":{"Ar":"بدأ نشاط عند 08:20 وانتهى عند 10:50. ما عدد الدورات الكاملة التي قطعها عقرب الدقائق خلال النشاط، دون احتساب الجزء غير المكتمل؟","En":"An activity begins at 08:20 and ends at 10:50. How many complete revolutions does the minute hand make during the activity, excluding any incomplete revolution?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مر أكثر من 120 دقيقة.","En":"More than 120 minutes elapsed."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاث دورات كاملة تتطلب 180 دقيقة.","En":"Three complete revolutions require 180 minutes."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمس دورات تتطلب 300 دقيقة.","En":"Five revolutions require 300 minutes."}}],"Hints":[{"Ar":"احسب المدة بالدقائق.","En":"Find the elapsed time in minutes."},{"Ar":"كل دورة كاملة لعقرب الدقائق تستغرق 60 دقيقة.","En":"Each complete minute-hand revolution takes 60 minutes."}],"Solution":{"Idea":{"Ar":"نقسم المدة على 60 ونحسب الدورات الكاملة فقط.","En":"Divide elapsed minutes by 60 and count only complete revolutions."},"FormulaLatex":"2\\times60+30=150","Steps":[{"Ar":"المدة ساعتان و30 دقيقة، أي 150 دقيقة.","En":"The duration is two hours and 30 minutes, or 150 minutes."},{"Ar":"فيها دورتان كاملتان ونصف دورة إضافية.","En":"It contains two full revolutions and an extra half revolution."}],"Substitution":{"Ar":"$150=2\\times60+30$","En":"$150=2\\times60+30$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"دورتان تستغرقان 120 دقيقة، والباقي 30 دقيقة غير كاف لدورة ثالثة.","En":"Two revolutions take 120 minutes; the remaining 30 cannot complete a third."},"CommonError":{"Ar":"تقريب الجزء غير المكتمل إلى دورة كاملة.","En":"Rounding the incomplete revolution up."}}}$mw$::jsonb,$mw$نقسم المدة على 60 ونحسب الدورات الكاملة فقط.

$2\times60+30=150$

1. المدة ساعتان و30 دقيقة، أي 150 دقيقة.

2. فيها دورتان كاملتان ونصف دورة إضافية.

$150=2\times60+30$

$2$

دورتان تستغرقان 120 دقيقة، والباقي 30 دقيقة غير كاف لدورة ثالثة.

تقريب الجزء غير المكتمل إلى دورة كاملة.$mw$,$mw$Divide elapsed minutes by 60 and count only complete revolutions.

$2\times60+30=150$

1. The duration is two hours and 30 minutes, or 150 minutes.

2. It contains two full revolutions and an extra half revolution.

$150=2\times60+30$

$2$

Two revolutions take 120 minutes; the remaining 30 cannot complete a third.

Rounding the incomplete revolution up.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب المدة بالدقائق.","En":"Find the elapsed time in minutes."},{"Ar":"كل دورة كاملة لعقرب الدقائق تستغرق 60 دقيقة.","En":"Each complete minute-hand revolution takes 60 minutes."}],"Solution":{"Idea":{"Ar":"نقسم المدة على 60 ونحسب الدورات الكاملة فقط.","En":"Divide elapsed minutes by 60 and count only complete revolutions."},"FormulaLatex":"2\\times60+30=150","Steps":[{"Ar":"المدة ساعتان و30 دقيقة، أي 150 دقيقة.","En":"The duration is two hours and 30 minutes, or 150 minutes."},{"Ar":"فيها دورتان كاملتان ونصف دورة إضافية.","En":"It contains two full revolutions and an extra half revolution."}],"Substitution":{"Ar":"$150=2\\times60+30$","En":"$150=2\\times60+30$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"دورتان تستغرقان 120 دقيقة، والباقي 30 دقيقة غير كاف لدورة ثالثة.","En":"Two revolutions take 120 minutes; the remaining 30 cannot complete a third."},"CommonError":{"Ar":"تقريب الجزء غير المكتمل إلى دورة كاملة.","En":"Rounding the incomplete revolution up."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مر أكثر من 120 دقيقة.","En":"More than 120 minutes elapsed."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاث دورات كاملة تتطلب 180 دقيقة.","En":"Three complete revolutions require 180 minutes."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خمس دورات تتطلب 300 دقيقة.","En":"Five revolutions require 300 minutes."},"Order":4}]}$mw$),
($mw$growth-v87-grade-4-time-periodic-bus-schedule-wait-1$mw$,$mw$time-periodic-bus-schedule-wait$mw$,$mw$time$mw$,$mw$grade-4$mw$,4,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الانتظار حتى الموعد التالي","En":"Waiting for the next departure"},"Question":{"Ar":"تنطلق حافلة كل 20 دقيقة ابتداءً من 08:00، ولا تنطلق في أوقات أخرى. وصل طفل إلى المحطة عند 08:47. كم دقيقة ينتظر حتى موعد الانطلاق التالي؟","En":"A bus departs every 20 minutes starting at 08:00, with no departures in between. A child arrives at 08:47. How many minutes until the next departure?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"سبع دقائق مضت منذ انطلاق 08:40، وهي ليست مدة الانتظار المقبلة.","En":"Seven minutes have passed since 08:40; that is not the remaining wait."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 هي الفترة بين الحافلات وليست الانتظار من 08:47.","En":"20 is the departure interval, not the wait from 08:47."}},{"LatexCode":"33","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ينتظر إلى 09:20 ويتجاوز رحلة 09:00.","En":"This waits until 09:20, missing the 09:00 departure."}}],"Hints":[{"Ar":"اكتب أوقات الانطلاق ابتداءً من 08:00.","En":"List departures starting at 08:00."},{"Ar":"اختر أول موعد بعد 08:47.","En":"Choose the first departure after 08:47."}],"Solution":{"Idea":{"Ar":"نحدد الموعد التالي في النمط الزمني ثم نحسب الفرق.","En":"Find the next scheduled time and calculate the difference."},"FormulaLatex":"60-47=13","Steps":[{"Ar":"الأوقات هي 08:00 و08:20 و08:40 و09:00.","En":"Departures are 08:00, 08:20, 08:40 and 09:00."},{"Ar":"أول موعد بعد الوصول هو 09:00، بعد 13 دقيقة.","En":"The first after arrival is 09:00, thirteen minutes later."}],"Substitution":{"Ar":"$60-47=13$","En":"$60-47=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"08:47 مع 13 دقيقة تساوي 09:00.","En":"08:47 plus 13 minutes is 09:00."},"CommonError":{"Ar":"حساب الوقت منذ الحافلة السابقة بدلاً من الانتظار للمقبلة.","En":"Finding time since the previous bus instead of time until the next."}}}$mw$::jsonb,$mw$نحدد الموعد التالي في النمط الزمني ثم نحسب الفرق.

$60-47=13$

1. الأوقات هي 08:00 و08:20 و08:40 و09:00.

2. أول موعد بعد الوصول هو 09:00، بعد 13 دقيقة.

$60-47=13$

$13$

08:47 مع 13 دقيقة تساوي 09:00.

حساب الوقت منذ الحافلة السابقة بدلاً من الانتظار للمقبلة.$mw$,$mw$Find the next scheduled time and calculate the difference.

$60-47=13$

1. Departures are 08:00, 08:20, 08:40 and 09:00.

2. The first after arrival is 09:00, thirteen minutes later.

$60-47=13$

$13$

08:47 plus 13 minutes is 09:00.

Finding time since the previous bus instead of time until the next.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب أوقات الانطلاق ابتداءً من 08:00.","En":"List departures starting at 08:00."},{"Ar":"اختر أول موعد بعد 08:47.","En":"Choose the first departure after 08:47."}],"Solution":{"Idea":{"Ar":"نحدد الموعد التالي في النمط الزمني ثم نحسب الفرق.","En":"Find the next scheduled time and calculate the difference."},"FormulaLatex":"60-47=13","Steps":[{"Ar":"الأوقات هي 08:00 و08:20 و08:40 و09:00.","En":"Departures are 08:00, 08:20, 08:40 and 09:00."},{"Ar":"أول موعد بعد الوصول هو 09:00، بعد 13 دقيقة.","En":"The first after arrival is 09:00, thirteen minutes later."}],"Substitution":{"Ar":"$60-47=13$","En":"$60-47=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"08:47 مع 13 دقيقة تساوي 09:00.","En":"08:47 plus 13 minutes is 09:00."},"CommonError":{"Ar":"حساب الوقت منذ الحافلة السابقة بدلاً من الانتظار للمقبلة.","En":"Finding time since the previous bus instead of time until the next."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"سبع دقائق مضت منذ انطلاق 08:40، وهي ليست مدة الانتظار المقبلة.","En":"Seven minutes have passed since 08:40; that is not the remaining wait."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"20 هي الفترة بين الحافلات وليست الانتظار من 08:47.","En":"20 is the departure interval, not the wait from 08:47."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا ينتظر إلى 09:20 ويتجاوز رحلة 09:00.","En":"This waits until 09:20, missing the 09:00 departure."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v87 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
