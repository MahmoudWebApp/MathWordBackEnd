-- One-time owner-authorized v62 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v62-grade-9-quadratic-output-unattainable-real-input-1$mw$,$mw$quadratic-output-unattainable-real-input$mw$,$mw$middle-inverse-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,28,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":28,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قيمة غير ممكنة للدالة","En":"An unattainable function value"},"Question":{"Ar":"لدالة $f(x)=x^2+4$، أي قيمة من الخيارات لا يمكن أن تكون ناتجاً لأي مدخل حقيقي؟","En":"For $f(x)=x^2+4$, which listed value cannot be an output for any real input?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تتحقق عند x=0.","En":"Attained at x=0."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تتحقق عند x=1.","En":"Attained at x=1."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تتحقق عند x=3.","En":"Attained at x=3."}}],"Hints":[{"Ar":"ما أصغر قيمة لمربع عدد حقيقي؟","En":"What is the smallest real square?"},{"Ar":"قارن الخيارات بالحد الأدنى للناتج.","En":"Compare the choices with the minimum output."}],"Solution":{"Idea":{"Ar":"مربع العدد الحقيقي غير سالب، لذلك لا يقل الناتج عن 4.","En":"A real square is nonnegative, so the output cannot be below four."},"FormulaLatex":"x^2+4\\ge4","Steps":[{"Ar":"$x^2=-1$","En":"$x^2=-1$"},{"Ar":"$3<4$","En":"$3<4$"}],"Substitution":{"Ar":"$3-4=-1$","En":"$3-4=-1$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(0)=4$","En":"$f(0)=4$"},"CommonError":{"Ar":"تتحقق عند x=0.","En":"Attained at x=0."}}}$mw$::jsonb,$mw$مربع العدد الحقيقي غير سالب، لذلك لا يقل الناتج عن 4.

$x^2+4\ge4$

1. $x^2=-1$

2. $3<4$

$3-4=-1$

$3$

$f(0)=4$

تتحقق عند x=0.$mw$,$mw$A real square is nonnegative, so the output cannot be below four.

$x^2+4\ge4$

1. $x^2=-1$

2. $3<4$

$3-4=-1$

$3$

$f(0)=4$

Attained at x=0.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما أصغر قيمة لمربع عدد حقيقي؟","En":"What is the smallest real square?"},{"Ar":"قارن الخيارات بالحد الأدنى للناتج.","En":"Compare the choices with the minimum output."}],"Solution":{"Idea":{"Ar":"مربع العدد الحقيقي غير سالب، لذلك لا يقل الناتج عن 4.","En":"A real square is nonnegative, so the output cannot be below four."},"FormulaLatex":"x^2+4\\ge4","Steps":[{"Ar":"$x^2=-1$","En":"$x^2=-1$"},{"Ar":"$3<4$","En":"$3<4$"}],"Substitution":{"Ar":"$3-4=-1$","En":"$3-4=-1$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(0)=4$","En":"$f(0)=4$"},"CommonError":{"Ar":"تتحقق عند x=0.","En":"Attained at x=0."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تتحقق عند x=0.","En":"Attained at x=0."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تتحقق عند x=1.","En":"Attained at x=1."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تتحقق عند x=3.","En":"Attained at x=3."},"Order":4}]}$mw$),
($mw$growth-v62-grade-9-quadratic-evaluation-coefficient-sign-error-1$mw$,$mw$quadratic-evaluation-coefficient-sign-error$mw$,$mw$middle-quadratic-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,27,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":27,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح تعويض في دالة تربيعية","En":"Correcting a quadratic evaluation"},"Question":{"Ar":"عند حساب $f(-2)$ للدالة $f(x)=-3x^2+5$، حصل طالب على 17. ما القيمة الصحيحة؟","En":"A pupil obtains 17 when evaluating $f(-2)$ for $f(x)=-3x^2+5$. What is the correct value?"},"Options":[{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حوّل المعامل السالب إلى موجب.","En":"Changes the negative coefficient to positive."}},{"LatexCode":"-17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 5 بدلاً من جمعها.","En":"Subtracts five instead of adding it."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب −3 في −2 دون تربيع المدخل.","En":"Multiplies −3 by −2 without squaring the input."}},{"LatexCode":"-7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"السالب في المعامل خارج مربع المدخل.","En":"The negative coefficient is outside the input square."},{"Ar":"احسب مربع −2 قبل الضرب.","En":"Square negative two before multiplying."}],"Solution":{"Idea":{"Ar":"نربع المدخل أولاً ثم نضربه في المعامل السالب.","En":"Square the input first, then multiply by the negative coefficient."},"FormulaLatex":"f(-2)=-3(-2)^2+5","Steps":[{"Ar":"$-12+5=-7$","En":"$-12+5=-7$"}],"Substitution":{"Ar":"$-3\\cdot4+5$","En":"$-3\\cdot4+5$"},"Result":{"Ar":"$-7$","En":"$-7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(2)=-7$","En":"$f(2)=-7$"},"CommonError":{"Ar":"حوّل المعامل السالب إلى موجب.","En":"Changes the negative coefficient to positive."}}}$mw$::jsonb,$mw$نربع المدخل أولاً ثم نضربه في المعامل السالب.

$f(-2)=-3(-2)^2+5$

1. $-12+5=-7$

$-3\cdot4+5$

$-7$

$f(2)=-7$

حوّل المعامل السالب إلى موجب.$mw$,$mw$Square the input first, then multiply by the negative coefficient.

$f(-2)=-3(-2)^2+5$

1. $-12+5=-7$

$-3\cdot4+5$

$-7$

$f(2)=-7$

Changes the negative coefficient to positive.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"السالب في المعامل خارج مربع المدخل.","En":"The negative coefficient is outside the input square."},{"Ar":"احسب مربع −2 قبل الضرب.","En":"Square negative two before multiplying."}],"Solution":{"Idea":{"Ar":"نربع المدخل أولاً ثم نضربه في المعامل السالب.","En":"Square the input first, then multiply by the negative coefficient."},"FormulaLatex":"f(-2)=-3(-2)^2+5","Steps":[{"Ar":"$-12+5=-7$","En":"$-12+5=-7$"}],"Substitution":{"Ar":"$-3\\cdot4+5$","En":"$-3\\cdot4+5$"},"Result":{"Ar":"$-7$","En":"$-7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(2)=-7$","En":"$f(2)=-7$"},"CommonError":{"Ar":"حوّل المعامل السالب إلى موجب.","En":"Changes the negative coefficient to positive."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حوّل المعامل السالب إلى موجب.","En":"Changes the negative coefficient to positive."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 5 بدلاً من جمعها.","En":"Subtracts five instead of adding it."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ضرب −3 في −2 دون تربيع المدخل.","En":"Multiplies −3 by −2 without squaring the input."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v62-grade-4-fraction-model-shaded-parts-split-each-cell-1$mw$,$mw$fraction-model-shaded-parts-split-each-cell$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-4$mw$,4,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تجزئة أجزاء مظللة","En":"Subdividing shaded parts"},"Question":{"Ar":"شريط مقسم إلى 5 أجزاء متساوية، اثنان منها مظللان. إذا قُسم كل جزء إلى 3 أجزاء متساوية دون تغيير التظليل، فكم جزءاً صغيراً يصبح مظللاً؟","En":"A strip is divided into five equal parts, two shaded. Every part is subdivided into three equal pieces without changing the shading. How many small pieces are shaded?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأجزاء المظللة قبل التقسيم.","En":"The shaded count before subdivision."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع في جزء واحد فقط.","En":"The pieces in just one original part."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع جميعاً.","En":"The total number of pieces."}}],"Hints":[{"Ar":"كم جزءاً مظللاً قبل التقسيم؟","En":"How many parts are shaded initially?"},{"Ar":"كم قطعة صغيرة في كل جزء؟","En":"How many small pieces in each part?"}],"Solution":{"Idea":{"Ar":"كل جزء مظلل يصبح ثلاثة أجزاء مظللة.","En":"Each shaded part becomes three shaded pieces."},"FormulaLatex":"2\\cdot3","Steps":[{"Ar":"$2\\cdot3=6$","En":"$2\\cdot3=6$"},{"Ar":"$5\\cdot3=15$","En":"$5\\cdot3=15$"}],"Substitution":{"Ar":"$2\\cdot3$","En":"$2\\cdot3$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6/15=2/5$","En":"$6/15=2/5$"},"CommonError":{"Ar":"هذا عدد الأجزاء المظللة قبل التقسيم.","En":"The shaded count before subdivision."}}}$mw$::jsonb,$mw$كل جزء مظلل يصبح ثلاثة أجزاء مظللة.

$2\cdot3$

1. $2\cdot3=6$

2. $5\cdot3=15$

$2\cdot3$

$6$

$6/15=2/5$

هذا عدد الأجزاء المظللة قبل التقسيم.$mw$,$mw$Each shaded part becomes three shaded pieces.

$2\cdot3$

1. $2\cdot3=6$

2. $5\cdot3=15$

$2\cdot3$

$6$

$6/15=2/5$

The shaded count before subdivision.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم جزءاً مظللاً قبل التقسيم؟","En":"How many parts are shaded initially?"},{"Ar":"كم قطعة صغيرة في كل جزء؟","En":"How many small pieces in each part?"}],"Solution":{"Idea":{"Ar":"كل جزء مظلل يصبح ثلاثة أجزاء مظللة.","En":"Each shaded part becomes three shaded pieces."},"FormulaLatex":"2\\cdot3","Steps":[{"Ar":"$2\\cdot3=6$","En":"$2\\cdot3=6$"},{"Ar":"$5\\cdot3=15$","En":"$5\\cdot3=15$"}],"Substitution":{"Ar":"$2\\cdot3$","En":"$2\\cdot3$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6/15=2/5$","En":"$6/15=2/5$"},"CommonError":{"Ar":"هذا عدد الأجزاء المظللة قبل التقسيم.","En":"The shaded count before subdivision."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأجزاء المظللة قبل التقسيم.","En":"The shaded count before subdivision."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع في جزء واحد فقط.","En":"The pieces in just one original part."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القطع جميعاً.","En":"The total number of pieces."},"Order":4}]}$mw$),
($mw$growth-v62-grade-7-rational-mixed-sign-multiplication-repeated-factor-1$mw$,$mw$rational-mixed-sign-multiplication-repeated-factor$mw$,$mw$rational-arithmetic$mw$,$mw$grade-7$mw$,7,2,83,308,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":308,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ضرب عدد عشري في كسر سالب","En":"Multiplying a decimal by a negative fraction"},"Question":{"Ar":"احسب $1.2\\times(-\\frac56)$.","En":"Evaluate $1.2\\times(-\\frac56)$."},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل السالب.","En":"Drops the negative sign."}},{"LatexCode":"-0.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب سدس 1.2 فقط مع سالب.","En":"Computes only negative one sixth of 1.2."}},{"LatexCode":"-1.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يطبق العامل الكسري.","En":"Does not apply the fractional factor."}},{"LatexCode":"-1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب 1.2 على صورة كسر.","En":"Write 1.2 as a fraction."},{"Ar":"اختصر العوامل المشتركة.","En":"Cancel common factors."}],"Solution":{"Idea":{"Ar":"نحول العدد العشري إلى كسر ثم نختصر.","En":"Convert the decimal to a fraction and cancel."},"FormulaLatex":"1.2=6/5","Steps":[{"Ar":"$-30/30=-1$","En":"$-30/30=-1$"}],"Substitution":{"Ar":"$(6/5)(-5/6)$","En":"$(6/5)(-5/6)$"},"Result":{"Ar":"$-1$","En":"$-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-1)/(-5/6)=6/5$","En":"$(-1)/(-5/6)=6/5$"},"CommonError":{"Ar":"أهمل السالب.","En":"Drops the negative sign."}}}$mw$::jsonb,$mw$نحول العدد العشري إلى كسر ثم نختصر.

$1.2=6/5$

1. $-30/30=-1$

$(6/5)(-5/6)$

$-1$

$(-1)/(-5/6)=6/5$

أهمل السالب.$mw$,$mw$Convert the decimal to a fraction and cancel.

$1.2=6/5$

1. $-30/30=-1$

$(6/5)(-5/6)$

$-1$

$(-1)/(-5/6)=6/5$

Drops the negative sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب 1.2 على صورة كسر.","En":"Write 1.2 as a fraction."},{"Ar":"اختصر العوامل المشتركة.","En":"Cancel common factors."}],"Solution":{"Idea":{"Ar":"نحول العدد العشري إلى كسر ثم نختصر.","En":"Convert the decimal to a fraction and cancel."},"FormulaLatex":"1.2=6/5","Steps":[{"Ar":"$-30/30=-1$","En":"$-30/30=-1$"}],"Substitution":{"Ar":"$(6/5)(-5/6)$","En":"$(6/5)(-5/6)$"},"Result":{"Ar":"$-1$","En":"$-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-1)/(-5/6)=6/5$","En":"$(-1)/(-5/6)=6/5$"},"CommonError":{"Ar":"أهمل السالب.","En":"Drops the negative sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل السالب.","En":"Drops the negative sign."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب سدس 1.2 فقط مع سالب.","En":"Computes only negative one sixth of 1.2."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لم يطبق العامل الكسري.","En":"Does not apply the fractional factor."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v62-grade-7-signed-balance-two-withdrawals-and-deposit-1$mw$,$mw$signed-balance-two-withdrawals-and-deposit$mw$,$mw$signed-operations$mw$,$mw$grade-7$mw$,7,2,83,309,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":309,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"رصيد بعد معاملات متتابعة","En":"Balance after consecutive transactions"},"Question":{"Ar":"رصيد حساب يساوي −12 وحدة نقدية. أودع صاحبه 25 وحدة ثم سحب 18 وحدة. ما الرصيد الجديد؟","En":"An account balance is −12 currency units. Its owner deposits 25 units and then withdraws 18. What is the new balance?"},"Options":[{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف بعد الإيداع.","En":"Stops after the deposit."}},{"LatexCode":"-55","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل الإيداع على أنه سحب.","En":"Treats the deposit as a withdrawal."}},{"LatexCode":"-5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result sign."}}],"Hints":[{"Ar":"أضف مبلغ الإيداع.","En":"Add the deposit."},{"Ar":"اطرح مبلغ السحب.","En":"Subtract the withdrawal."}],"Solution":{"Idea":{"Ar":"الإيداع زيادة والسحب نقصان.","En":"A deposit increases the balance and a withdrawal decreases it."},"FormulaLatex":"-12+25-18","Steps":[{"Ar":"$-12+25=13$","En":"$-12+25=13$"},{"Ar":"$13-18=-5$","En":"$13-18=-5$"}],"Substitution":{"Ar":"$13-18$","En":"$13-18$"},"Result":{"Ar":"$-5$","En":"$-5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-5+18=13$","En":"$-5+18=13$"},"CommonError":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result sign."}}}$mw$::jsonb,$mw$الإيداع زيادة والسحب نقصان.

$-12+25-18$

1. $-12+25=13$

2. $13-18=-5$

$13-18$

$-5$

$-5+18=13$

عكس إشارة الناتج.$mw$,$mw$A deposit increases the balance and a withdrawal decreases it.

$-12+25-18$

1. $-12+25=13$

2. $13-18=-5$

$13-18$

$-5$

$-5+18=13$

Reverses the result sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أضف مبلغ الإيداع.","En":"Add the deposit."},{"Ar":"اطرح مبلغ السحب.","En":"Subtract the withdrawal."}],"Solution":{"Idea":{"Ar":"الإيداع زيادة والسحب نقصان.","En":"A deposit increases the balance and a withdrawal decreases it."},"FormulaLatex":"-12+25-18","Steps":[{"Ar":"$-12+25=13$","En":"$-12+25=13$"},{"Ar":"$13-18=-5$","En":"$13-18=-5$"}],"Substitution":{"Ar":"$13-18$","En":"$13-18$"},"Result":{"Ar":"$-5$","En":"$-5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-5+18=13$","En":"$-5+18=13$"},"CommonError":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"توقف بعد الإيداع.","En":"Stops after the deposit."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل الإيداع على أنه سحب.","En":"Treats the deposit as a withdrawal."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result sign."},"Order":4}]}$mw$),
($mw$growth-v62-grade-7-range-comparison-same-mean-different-spread-1$mw$,$mw$range-comparison-same-mean-different-spread$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-7$mw$,7,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة انتشار مجموعتين","En":"Comparing two data spreads"},"Question":{"Ar":"المجموعة A هي 3،6،9، والمجموعة B هي 5،6،7. بكم يزيد مدى A على مدى B؟","En":"Set A is 3,6,9 and set B is 5,6,7. By how much does the range of A exceed the range of B?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مدى A.","En":"This is the range of A."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تساوي المتوسطين لا يعني تساوي المديين.","En":"Equal means do not imply equal ranges."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مدى B.","En":"This is the range of B."}}],"Hints":[{"Ar":"حدد الأكبر والأصغر في A.","En":"Identify the maximum and minimum in A."},{"Ar":"كرر للمجموعة B ثم قارن.","En":"Repeat for B, then compare."}],"Solution":{"Idea":{"Ar":"نحسب مدى كل مجموعة من أكبر قيمة ناقص أصغر قيمة.","En":"Compute each range as maximum minus minimum."},"FormulaLatex":"(9-3)-(7-5)","Steps":[{"Ar":"$R_A=6$","En":"$R_A=6$"},{"Ar":"$R_B=2$","En":"$R_B=2$"},{"Ar":"$6-2=4$","En":"$6-2=4$"}],"Substitution":{"Ar":"$6-2$","En":"$6-2$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+2=6$","En":"$4+2=6$"},"CommonError":{"Ar":"تساوي المتوسطين لا يعني تساوي المديين.","En":"Equal means do not imply equal ranges."}}}$mw$::jsonb,$mw$نحسب مدى كل مجموعة من أكبر قيمة ناقص أصغر قيمة.

$(9-3)-(7-5)$

1. $R_A=6$

2. $R_B=2$

3. $6-2=4$

$6-2$

$4$

$4+2=6$

تساوي المتوسطين لا يعني تساوي المديين.$mw$,$mw$Compute each range as maximum minus minimum.

$(9-3)-(7-5)$

1. $R_A=6$

2. $R_B=2$

3. $6-2=4$

$6-2$

$4$

$4+2=6$

Equal means do not imply equal ranges.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد الأكبر والأصغر في A.","En":"Identify the maximum and minimum in A."},{"Ar":"كرر للمجموعة B ثم قارن.","En":"Repeat for B, then compare."}],"Solution":{"Idea":{"Ar":"نحسب مدى كل مجموعة من أكبر قيمة ناقص أصغر قيمة.","En":"Compute each range as maximum minus minimum."},"FormulaLatex":"(9-3)-(7-5)","Steps":[{"Ar":"$R_A=6$","En":"$R_A=6$"},{"Ar":"$R_B=2$","En":"$R_B=2$"},{"Ar":"$6-2=4$","En":"$6-2=4$"}],"Substitution":{"Ar":"$6-2$","En":"$6-2$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+2=6$","En":"$4+2=6$"},"CommonError":{"Ar":"تساوي المتوسطين لا يعني تساوي المديين.","En":"Equal means do not imply equal ranges."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مدى A.","En":"This is the range of A."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تساوي المتوسطين لا يعني تساوي المديين.","En":"Equal means do not imply equal ranges."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مدى B.","En":"This is the range of B."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v62 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
