-- One-time owner-authorized v42 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v42-grade-7-linear-equation-perimeter-isosceles-1$mw$,$mw$linear-equation-perimeter-isosceles$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة محيط مثلث","En":"Triangle perimeter equation"},"Question":{"Ar":"مثلث متساوي الساقين، طول كل ساق x سم وطول القاعدة 9 سم ومحيطه 35 سم. ما طول الساق؟","En":"An isosceles triangle has two sides of length x cm, a base of 9 cm and perimeter 35 cm. What is the length of each equal side?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 طول القاعدة.","En":"9 is the base length."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"17.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"17.5 يقسم المحيط دون استبعاد القاعدة.","En":"17.5 divides the perimeter without removing the base."}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"26 مجموع الساقين.","En":"26 is the combined length of the equal sides."}}],"Hints":[{"Ar":"اكتب مجموع أطوال الأضلاع.","En":"Write the sum of side lengths."},{"Ar":"اطرح القاعدة ثم اقسم على 2.","En":"Subtract the base, then divide by two."}],"Solution":{"Idea":{"Ar":"المحيط مجموع الأطوال الثلاثة، والساقان متساويتان.","En":"Perimeter is the sum of all three lengths, with two equal sides."},"FormulaLatex":"2x+9=35","Steps":[{"Ar":"$2x=35-9=26$","En":"$2x=35-9=26$"},{"Ar":"$x=26/2=13$","En":"$x=26/2=13$"}],"Substitution":{"Ar":"$x=26/2=13$","En":"$x=26/2=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$13+13+9=35$","En":"$13+13+9=35$"},"CommonError":{"Ar":"9 طول القاعدة.","En":"9 is the base length."}}}$mw$::jsonb,$mw$المحيط مجموع الأطوال الثلاثة، والساقان متساويتان.

$2x+9=35$

1. $2x=35-9=26$

2. $x=26/2=13$

$x=26/2=13$

$13$ سم

$13+13+9=35$

9 طول القاعدة.$mw$,$mw$Perimeter is the sum of all three lengths, with two equal sides.

$2x+9=35$

1. $2x=35-9=26$

2. $x=26/2=13$

$x=26/2=13$

$13$ cm

$13+13+9=35$

9 is the base length.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب مجموع أطوال الأضلاع.","En":"Write the sum of side lengths."},{"Ar":"اطرح القاعدة ثم اقسم على 2.","En":"Subtract the base, then divide by two."}],"Solution":{"Idea":{"Ar":"المحيط مجموع الأطوال الثلاثة، والساقان متساويتان.","En":"Perimeter is the sum of all three lengths, with two equal sides."},"FormulaLatex":"2x+9=35","Steps":[{"Ar":"$2x=35-9=26$","En":"$2x=35-9=26$"},{"Ar":"$x=26/2=13$","En":"$x=26/2=13$"}],"Substitution":{"Ar":"$x=26/2=13$","En":"$x=26/2=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$13+13+9=35$","En":"$13+13+9=35$"},"CommonError":{"Ar":"9 طول القاعدة.","En":"9 is the base length."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"9 طول القاعدة.","En":"9 is the base length."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"17.5 يقسم المحيط دون استبعاد القاعدة.","En":"17.5 divides the perimeter without removing the base."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"26 مجموع الساقين.","En":"26 is the combined length of the equal sides."},"Order":4}]}$mw$),
($mw$growth-v42-grade-10-mean-correction-two-opposite-changes-1$mw$,$mw$mean-correction-two-opposite-changes$mw$,$mw$secondary-arithmetic-mean$mw$,$mw$grade-10$mw$,10,3,35,53,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":53,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح قراءتين في المتوسط","En":"Correcting two observations"},"Question":{"Ar":"متوسط 10 قراءات يساوي 18. اكتُشف أن قراءة سجلت أكبر من قيمتها الصحيحة بمقدار 7، وأخرى سجلت أصغر من قيمتها الصحيحة بمقدار 3. ما المتوسط الصحيح؟","En":"Ten readings have mean 18. One was recorded 7 above its true value, and another 3 below its true value. What is the corrected mean?"},"Options":[{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"17 يطرح التصحيحين بدلاً من جمع الثاني.","En":"17 subtracts both corrections rather than adding the second."}},{"LatexCode":"17.6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"18.4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18.4 يعكس صافي التصحيح.","En":"18.4 reverses the net correction."}},{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"22 يضيف فرق القراءتين للمتوسط مباشرة.","En":"22 adds the net difference directly to the mean."}}],"Hints":[{"Ar":"اطرح الزيادة الخاطئة.","En":"Subtract the overstatement."},{"Ar":"أضف النقص ثم اقسم على 10.","En":"Add the understatement, then divide by ten."}],"Solution":{"Idea":{"Ar":"نصحح المجموع بمقدار صافي التغير ثم نقسم على عدد القراءات.","En":"Correct the total by the net adjustment, then divide by the count."},"FormulaLatex":"\\bar x'=\\frac{180-7+3}{10}","Steps":[{"Ar":"$10\\cdot18=180$","En":"$10\\cdot18=180$"},{"Ar":"$180-7+3=176$","En":"$180-7+3=176$"},{"Ar":"$176/10=17.6$","En":"$176/10=17.6$"}],"Substitution":{"Ar":"$176/10=17.6$","En":"$176/10=17.6$"},"Result":{"Ar":"$17.6$","En":"$17.6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$176+7-3=180$","En":"$176+7-3=180$"},"CommonError":{"Ar":"17 يطرح التصحيحين بدلاً من جمع الثاني.","En":"17 subtracts both corrections rather than adding the second."}}}$mw$::jsonb,$mw$نصحح المجموع بمقدار صافي التغير ثم نقسم على عدد القراءات.

$\bar x'=\frac{180-7+3}{10}$

1. $10\cdot18=180$

2. $180-7+3=176$

3. $176/10=17.6$

$176/10=17.6$

$17.6$

$176+7-3=180$

17 يطرح التصحيحين بدلاً من جمع الثاني.$mw$,$mw$Correct the total by the net adjustment, then divide by the count.

$\bar x'=\frac{180-7+3}{10}$

1. $10\cdot18=180$

2. $180-7+3=176$

3. $176/10=17.6$

$176/10=17.6$

$17.6$

$176+7-3=180$

17 subtracts both corrections rather than adding the second.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح الزيادة الخاطئة.","En":"Subtract the overstatement."},{"Ar":"أضف النقص ثم اقسم على 10.","En":"Add the understatement, then divide by ten."}],"Solution":{"Idea":{"Ar":"نصحح المجموع بمقدار صافي التغير ثم نقسم على عدد القراءات.","En":"Correct the total by the net adjustment, then divide by the count."},"FormulaLatex":"\\bar x'=\\frac{180-7+3}{10}","Steps":[{"Ar":"$10\\cdot18=180$","En":"$10\\cdot18=180$"},{"Ar":"$180-7+3=176$","En":"$180-7+3=176$"},{"Ar":"$176/10=17.6$","En":"$176/10=17.6$"}],"Substitution":{"Ar":"$176/10=17.6$","En":"$176/10=17.6$"},"Result":{"Ar":"$17.6$","En":"$17.6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$176+7-3=180$","En":"$176+7-3=180$"},"CommonError":{"Ar":"17 يطرح التصحيحين بدلاً من جمع الثاني.","En":"17 subtracts both corrections rather than adding the second."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"17 يطرح التصحيحين بدلاً من جمع الثاني.","En":"17 subtracts both corrections rather than adding the second."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"18.4 يعكس صافي التصحيح.","En":"18.4 reverses the net correction."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"22 يضيف فرق القراءتين للمتوسط مباشرة.","En":"22 adds the net difference directly to the mean."},"Order":4}]}$mw$),
($mw$growth-v42-grade-11-trig-identical-square-expression-ratio-1$mw$,$mw$trig-identical-square-expression-ratio$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-11$mw$,11,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختزال نسبة مثلثية","En":"Simplifying a trigonometric ratio"},"Question":{"Ar":"عندما $\\cos\\theta\\ne0$، أي تعبير يكافئ $\\frac{1-\\sin^2\\theta}{\\cos\\theta}$؟","En":"When $\\cos\\theta\\ne0$, which expression is equivalent to $\\frac{1-\\sin^2\\theta}{\\cos\\theta}$?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"البسط ليس جيب التمام نفسه.","En":"The numerator is not cosine itself."}},{"LatexCode":"\\sin\\theta","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا ينتج الجيب من الاختزال.","En":"Cancellation does not yield sine."}},{"LatexCode":"\\cos\\theta","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\sec\\theta","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القاطع مقلوب جيب التمام لا ناتج الاختزال.","En":"Secant is the reciprocal of cosine, not the simplified result."}}],"Hints":[{"Ar":"استخدم متطابقة فيثاغورس للبسط.","En":"Use the Pythagorean identity in the numerator."},{"Ar":"اختزل عاملاً غير صفري من جيب التمام.","En":"Cancel one nonzero cosine factor."}],"Solution":{"Idea":{"Ar":"نستبدل البسط بمربع جيب التمام ثم نختزل.","En":"Replace the numerator by cosine squared and cancel."},"FormulaLatex":"1-\\sin^2\\theta=\\cos^2\\theta","Steps":[{"Ar":"$\\frac{\\cos^2\\theta}{\\cos\\theta}$","En":"$\\frac{\\cos^2\\theta}{\\cos\\theta}$"},{"Ar":"$=\\cos\\theta$","En":"$=\\cos\\theta$"}],"Substitution":{"Ar":"$=\\cos\\theta$","En":"$=\\cos\\theta$"},"Result":{"Ar":"$\\cos\\theta$","En":"$\\cos\\theta$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=0:\\ (1-0)/1=1$","En":"$\\theta=0:\\ (1-0)/1=1$"},"CommonError":{"Ar":"البسط ليس جيب التمام نفسه.","En":"The numerator is not cosine itself."}}}$mw$::jsonb,$mw$نستبدل البسط بمربع جيب التمام ثم نختزل.

$1-\sin^2\theta=\cos^2\theta$

1. $\frac{\cos^2\theta}{\cos\theta}$

2. $=\cos\theta$

$=\cos\theta$

$\cos\theta$

$\theta=0:\ (1-0)/1=1$

البسط ليس جيب التمام نفسه.$mw$,$mw$Replace the numerator by cosine squared and cancel.

$1-\sin^2\theta=\cos^2\theta$

1. $\frac{\cos^2\theta}{\cos\theta}$

2. $=\cos\theta$

$=\cos\theta$

$\cos\theta$

$\theta=0:\ (1-0)/1=1$

The numerator is not cosine itself.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استخدم متطابقة فيثاغورس للبسط.","En":"Use the Pythagorean identity in the numerator."},{"Ar":"اختزل عاملاً غير صفري من جيب التمام.","En":"Cancel one nonzero cosine factor."}],"Solution":{"Idea":{"Ar":"نستبدل البسط بمربع جيب التمام ثم نختزل.","En":"Replace the numerator by cosine squared and cancel."},"FormulaLatex":"1-\\sin^2\\theta=\\cos^2\\theta","Steps":[{"Ar":"$\\frac{\\cos^2\\theta}{\\cos\\theta}$","En":"$\\frac{\\cos^2\\theta}{\\cos\\theta}$"},{"Ar":"$=\\cos\\theta$","En":"$=\\cos\\theta$"}],"Substitution":{"Ar":"$=\\cos\\theta$","En":"$=\\cos\\theta$"},"Result":{"Ar":"$\\cos\\theta$","En":"$\\cos\\theta$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=0:\\ (1-0)/1=1$","En":"$\\theta=0:\\ (1-0)/1=1$"},"CommonError":{"Ar":"البسط ليس جيب التمام نفسه.","En":"The numerator is not cosine itself."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"البسط ليس جيب التمام نفسه.","En":"The numerator is not cosine itself."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا ينتج الجيب من الاختزال.","En":"Cancellation does not yield sine."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"القاطع مقلوب جيب التمام لا ناتج الاختزال.","En":"Secant is the reciprocal of cosine, not the simplified result."},"Order":4}]}$mw$),
($mw$growth-v42-grade-9-pythagorean-isosceles-altitude-area-1$mw$,$mw$pythagorean-isosceles-altitude-area$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ارتفاع مثلث متساوي الساقين","En":"Altitude of an isosceles triangle"},"Question":{"Ar":"مثلث متساوي الساقين طول كل ساق 13 سم وطول القاعدة 10 سم. ما ارتفاعه العمودي على القاعدة؟","En":"An isosceles triangle has equal sides of 13 cm and base 10 cm. What is its perpendicular height to the base?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 نصف القاعدة.","En":"5 is half the base."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يطرح نصف القاعدة من الساق دون تربيع.","En":"8 subtracts half the base without squaring."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"13 طول الساق لا الارتفاع.","En":"13 is the equal side, not the height."}}],"Hints":[{"Ar":"اقسم طول القاعدة على اثنين.","En":"Halve the base."},{"Ar":"استعمل فيثاغورس مع الوتر 13.","En":"Apply Pythagoras with hypotenuse 13."}],"Solution":{"Idea":{"Ar":"ينصف الارتفاع القاعدة ويكون مثلثاً قائماً مع إحدى الساقين.","En":"The altitude bisects the base, forming a right triangle with one equal side."},"FormulaLatex":"h^2+5^2=13^2","Steps":[{"Ar":"$h^2=169-25=144$","En":"$h^2=169-25=144$"},{"Ar":"$h=12$","En":"$h=12$"}],"Substitution":{"Ar":"$h=12$","En":"$h=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$12^2+5^2=13^2$","En":"$12^2+5^2=13^2$"},"CommonError":{"Ar":"5 نصف القاعدة.","En":"5 is half the base."}}}$mw$::jsonb,$mw$ينصف الارتفاع القاعدة ويكون مثلثاً قائماً مع إحدى الساقين.

$h^2+5^2=13^2$

1. $h^2=169-25=144$

2. $h=12$

$h=12$

$12$ سم

$12^2+5^2=13^2$

5 نصف القاعدة.$mw$,$mw$The altitude bisects the base, forming a right triangle with one equal side.

$h^2+5^2=13^2$

1. $h^2=169-25=144$

2. $h=12$

$h=12$

$12$ cm

$12^2+5^2=13^2$

5 is half the base.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم طول القاعدة على اثنين.","En":"Halve the base."},{"Ar":"استعمل فيثاغورس مع الوتر 13.","En":"Apply Pythagoras with hypotenuse 13."}],"Solution":{"Idea":{"Ar":"ينصف الارتفاع القاعدة ويكون مثلثاً قائماً مع إحدى الساقين.","En":"The altitude bisects the base, forming a right triangle with one equal side."},"FormulaLatex":"h^2+5^2=13^2","Steps":[{"Ar":"$h^2=169-25=144$","En":"$h^2=169-25=144$"},{"Ar":"$h=12$","En":"$h=12$"}],"Substitution":{"Ar":"$h=12$","En":"$h=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$12^2+5^2=13^2$","En":"$12^2+5^2=13^2$"},"CommonError":{"Ar":"5 نصف القاعدة.","En":"5 is half the base."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 نصف القاعدة.","En":"5 is half the base."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8 يطرح نصف القاعدة من الساق دون تربيع.","En":"8 subtracts half the base without squaring."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"13 طول الساق لا الارتفاع.","En":"13 is the equal side, not the height."},"Order":4}]}$mw$),
($mw$growth-v42-grade-9-probability-independence-check-product-1$mw$,$mw$probability-independence-check-product$mw$,$mw$simple-compound-events$mw$,$mw$grade-9$mw$,9,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار استقلال حدثين","En":"Testing event independence"},"Question":{"Ar":"في تجربة احتمالية P(A)=0.4 وP(B)=0.5 وP(A∩B)=0.2. أي عبارة صحيحة؟ A: مستقلان؛ B: متنافيان؛ C: الحدث A مستحيل؛ D: الحدث B مؤكد.","En":"In an experiment P(A)=0.4, P(B)=0.5 and P(A∩B)=0.2. Which statement is true? A: independent; B: disjoint; C: A is impossible; D: B is certain."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"التنافي يتطلب تقاطعاً احتماله صفر.","En":"Disjointness requires zero intersection probability."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتمال A ليس صفراً.","En":"A has nonzero probability."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتمال B ليس واحداً.","En":"B does not have probability one."}}],"Hints":[{"Ar":"احسب حاصل ضرب الاحتمالين.","En":"Multiply the two probabilities."},{"Ar":"قارنه باحتمال التقاطع.","En":"Compare it with the intersection."}],"Solution":{"Idea":{"Ar":"الاستقلال يعني أن احتمال التقاطع يساوي حاصل ضرب احتمالَي الحدثين.","En":"Independence means the intersection probability equals the product of event probabilities."},"FormulaLatex":"P(A)P(B)=0.4\\cdot0.5=0.2","Steps":[{"Ar":"$P(A\\cap B)=0.2$","En":"$P(A\\cap B)=0.2$"},{"Ar":"يتساوى التقاطع مع حاصل الضرب.","En":"The intersection equals the product."}],"Substitution":{"Ar":"يتساوى التقاطع مع حاصل الضرب.","En":"The intersection equals the product."},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$0.2=0.2$","En":"$0.2=0.2$"},"CommonError":{"Ar":"التنافي يتطلب تقاطعاً احتماله صفر.","En":"Disjointness requires zero intersection probability."}}}$mw$::jsonb,$mw$الاستقلال يعني أن احتمال التقاطع يساوي حاصل ضرب احتمالَي الحدثين.

$P(A)P(B)=0.4\cdot0.5=0.2$

1. $P(A\cap B)=0.2$

2. يتساوى التقاطع مع حاصل الضرب.

يتساوى التقاطع مع حاصل الضرب.

$A$

$0.2=0.2$

التنافي يتطلب تقاطعاً احتماله صفر.$mw$,$mw$Independence means the intersection probability equals the product of event probabilities.

$P(A)P(B)=0.4\cdot0.5=0.2$

1. $P(A\cap B)=0.2$

2. The intersection equals the product.

The intersection equals the product.

$A$

$0.2=0.2$

Disjointness requires zero intersection probability.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب حاصل ضرب الاحتمالين.","En":"Multiply the two probabilities."},{"Ar":"قارنه باحتمال التقاطع.","En":"Compare it with the intersection."}],"Solution":{"Idea":{"Ar":"الاستقلال يعني أن احتمال التقاطع يساوي حاصل ضرب احتمالَي الحدثين.","En":"Independence means the intersection probability equals the product of event probabilities."},"FormulaLatex":"P(A)P(B)=0.4\\cdot0.5=0.2","Steps":[{"Ar":"$P(A\\cap B)=0.2$","En":"$P(A\\cap B)=0.2$"},{"Ar":"يتساوى التقاطع مع حاصل الضرب.","En":"The intersection equals the product."}],"Substitution":{"Ar":"يتساوى التقاطع مع حاصل الضرب.","En":"The intersection equals the product."},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$0.2=0.2$","En":"$0.2=0.2$"},"CommonError":{"Ar":"التنافي يتطلب تقاطعاً احتماله صفر.","En":"Disjointness requires zero intersection probability."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"التنافي يتطلب تقاطعاً احتماله صفر.","En":"Disjointness requires zero intersection probability."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"احتمال A ليس صفراً.","En":"A has nonzero probability."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"احتمال B ليس واحداً.","En":"B does not have probability one."},"Order":4}]}$mw$),
($mw$growth-v42-grade-10-vector-midpoint-displacement-half-1$mw$,$mw$vector-midpoint-displacement-half$mw$,$mw$vector-components$mw$,$mw$grade-10$mw$,10,3,87,340,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":340,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متجه إلى نقطة منتصف","En":"Displacement to a midpoint"},"Question":{"Ar":"إذا كان متجه الإزاحة من A إلى B هو (−6,8)، وكانت M منتصف القطعة AB، فما مركبتا المتجه AM؟","En":"If displacement from A to B is (−6,8) and M is the midpoint of AB, what are the components of AM?"},"Options":[{"LatexCode":"(-3,4)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(3,-4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعكس الاتجاه.","En":"This reverses the direction."}},{"LatexCode":"(-6,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المتجه الكامل.","En":"This is the full vector."}},{"LatexCode":"(-12,16)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضاعف الإزاحة.","En":"This doubles the displacement."}}],"Hints":[{"Ar":"المنتصف يقسم الإزاحة بالتساوي.","En":"The midpoint halves the displacement."},{"Ar":"اقسم كل مركبة على اثنين.","En":"Divide each component by two."}],"Solution":{"Idea":{"Ar":"متجه الإزاحة إلى المنتصف نصف المتجه الكامل وفي اتجاهه نفسه.","En":"Displacement to the midpoint is half the full vector in the same direction."},"FormulaLatex":"\\overrightarrow{AM}=\\frac12\\overrightarrow{AB}","Steps":[{"Ar":"$-6/2=-3$","En":"$-6/2=-3$"},{"Ar":"$8/2=4$","En":"$8/2=4$"}],"Substitution":{"Ar":"$8/2=4$","En":"$8/2=4$"},"Result":{"Ar":"$(-3,4)$","En":"$(-3,4)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(-3,4)=(-6,8)$","En":"$2(-3,4)=(-6,8)$"},"CommonError":{"Ar":"هذا يعكس الاتجاه.","En":"This reverses the direction."}}}$mw$::jsonb,$mw$متجه الإزاحة إلى المنتصف نصف المتجه الكامل وفي اتجاهه نفسه.

$\overrightarrow{AM}=\frac12\overrightarrow{AB}$

1. $-6/2=-3$

2. $8/2=4$

$8/2=4$

$(-3,4)$

$2(-3,4)=(-6,8)$

هذا يعكس الاتجاه.$mw$,$mw$Displacement to the midpoint is half the full vector in the same direction.

$\overrightarrow{AM}=\frac12\overrightarrow{AB}$

1. $-6/2=-3$

2. $8/2=4$

$8/2=4$

$(-3,4)$

$2(-3,4)=(-6,8)$

This reverses the direction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المنتصف يقسم الإزاحة بالتساوي.","En":"The midpoint halves the displacement."},{"Ar":"اقسم كل مركبة على اثنين.","En":"Divide each component by two."}],"Solution":{"Idea":{"Ar":"متجه الإزاحة إلى المنتصف نصف المتجه الكامل وفي اتجاهه نفسه.","En":"Displacement to the midpoint is half the full vector in the same direction."},"FormulaLatex":"\\overrightarrow{AM}=\\frac12\\overrightarrow{AB}","Steps":[{"Ar":"$-6/2=-3$","En":"$-6/2=-3$"},{"Ar":"$8/2=4$","En":"$8/2=4$"}],"Substitution":{"Ar":"$8/2=4$","En":"$8/2=4$"},"Result":{"Ar":"$(-3,4)$","En":"$(-3,4)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(-3,4)=(-6,8)$","En":"$2(-3,4)=(-6,8)$"},"CommonError":{"Ar":"هذا يعكس الاتجاه.","En":"This reverses the direction."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يعكس الاتجاه.","En":"This reverses the direction."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا المتجه الكامل.","En":"This is the full vector."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يضاعف الإزاحة.","En":"This doubles the displacement."},"Order":4}]}$mw$),
($mw$growth-v42-grade-11-locus-equidistant-perpendicular-axes-positive-quadrant-1$mw$,$mw$locus-equidistant-perpendicular-axes-positive-quadrant$mw$,$mw$loci$mw$,$mw$grade-11$mw$,11,3,88,330,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":330,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محل هندسي في الربع الأول","En":"Locus in the first quadrant"},"Question":{"Ar":"النقطة P تقع في الربع الأول، وتبعد المسافة نفسها عن المحور x والمحور y. أي معادلة تصف مواضعها في هذا الربع؟","En":"Point P is in the first quadrant and has equal perpendicular distances from the x-axis and y-axis. Which equation describes its positions in this quadrant?"},"Options":[{"LatexCode":"y=x","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"y=-x","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"y=−x لا يمر داخل الربع الأول.","En":"y=−x does not pass through the first quadrant."}},{"LatexCode":"x=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"x=0 هو محور y وليس داخل الربع.","En":"x=0 is the y-axis, outside the quadrant interior."}},{"LatexCode":"y=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"y=0 هو محور x.","En":"y=0 is the x-axis."}}],"Hints":[{"Ar":"اكتب المسافة العمودية عن كل محور.","En":"Write the perpendicular distance from each axis."},{"Ar":"ساوِ المسافتين.","En":"Set the distances equal."}],"Solution":{"Idea":{"Ar":"في الربع الأول المسافة عن محور x هي y، وعن محور y هي x.","En":"In the first quadrant the distance from the x-axis is y and from the y-axis is x."},"FormulaLatex":"x=y","Steps":[{"Ar":"الإحداثيان موجبان في الربع الأول.","En":"Both coordinates are positive in the first quadrant."},{"Ar":"$d_x=y,\\quad d_y=x$","En":"$d_x=y,\\quad d_y=x$"}],"Substitution":{"Ar":"$d_x=y,\\quad d_y=x$","En":"$d_x=y,\\quad d_y=x$"},"Result":{"Ar":"$y=x$","En":"$y=x$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(3,3):\\ d_x=d_y=3$","En":"$(3,3):\\ d_x=d_y=3$"},"CommonError":{"Ar":"y=−x لا يمر داخل الربع الأول.","En":"y=−x does not pass through the first quadrant."}}}$mw$::jsonb,$mw$في الربع الأول المسافة عن محور x هي y، وعن محور y هي x.

$x=y$

1. الإحداثيان موجبان في الربع الأول.

2. $d_x=y,\quad d_y=x$

$d_x=y,\quad d_y=x$

$y=x$

$(3,3):\ d_x=d_y=3$

y=−x لا يمر داخل الربع الأول.$mw$,$mw$In the first quadrant the distance from the x-axis is y and from the y-axis is x.

$x=y$

1. Both coordinates are positive in the first quadrant.

2. $d_x=y,\quad d_y=x$

$d_x=y,\quad d_y=x$

$y=x$

$(3,3):\ d_x=d_y=3$

y=−x does not pass through the first quadrant.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب المسافة العمودية عن كل محور.","En":"Write the perpendicular distance from each axis."},{"Ar":"ساوِ المسافتين.","En":"Set the distances equal."}],"Solution":{"Idea":{"Ar":"في الربع الأول المسافة عن محور x هي y، وعن محور y هي x.","En":"In the first quadrant the distance from the x-axis is y and from the y-axis is x."},"FormulaLatex":"x=y","Steps":[{"Ar":"الإحداثيان موجبان في الربع الأول.","En":"Both coordinates are positive in the first quadrant."},{"Ar":"$d_x=y,\\quad d_y=x$","En":"$d_x=y,\\quad d_y=x$"}],"Substitution":{"Ar":"$d_x=y,\\quad d_y=x$","En":"$d_x=y,\\quad d_y=x$"},"Result":{"Ar":"$y=x$","En":"$y=x$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(3,3):\\ d_x=d_y=3$","En":"$(3,3):\\ d_x=d_y=3$"},"CommonError":{"Ar":"y=−x لا يمر داخل الربع الأول.","En":"y=−x does not pass through the first quadrant."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"y=−x لا يمر داخل الربع الأول.","En":"y=−x does not pass through the first quadrant."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"x=0 هو محور y وليس داخل الربع.","En":"x=0 is the y-axis, outside the quadrant interior."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"y=0 هو محور x.","En":"y=0 is the x-axis."},"Order":4}]}$mw$),
($mw$growth-v42-grade-12-circle-tangent-line-at-known-point-1$mw$,$mw$circle-tangent-line-at-known-point$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة مماس دائرة","En":"Equation of a circle tangent"},"Question":{"Ar":"أي مستقيم يمس الدائرة $x^2+y^2=25$ عند النقطة (3,4)؟","En":"Which line is tangent to the circle $x^2+y^2=25$ at (3,4)?"},"Options":[{"LatexCode":"3x+4y=25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4x-3y=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المستقيم يمر بالمركز وبنقطة التماس، فهو حامل نصف القطر.","En":"This line passes through the centre and contact point; it contains the radius."}},{"LatexCode":"3x+4y=5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمر بالنقطة (3,4).","En":"It does not pass through (3,4)."}},{"LatexCode":"x+y=7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمر بالنقطة لكنه ليس عمودياً على نصف القطر.","En":"It passes through the point but is not perpendicular to the radius."}}],"Hints":[{"Ar":"استعمل نصف القطر متجهاً عمودياً.","En":"Use the radius as a normal vector."},{"Ar":"عوّض إحداثيي نقطة التماس.","En":"Substitute the contact point."}],"Solution":{"Idea":{"Ar":"المماس عمودي على نصف القطر الواصل إلى نقطة التماس، فيكون المتجه (3,4) عمودياً على المماس.","En":"The tangent is perpendicular to the radius to the contact point, so (3,4) is its normal vector."},"FormulaLatex":"3(x-3)+4(y-4)=0","Steps":[{"Ar":"$3x-9+4y-16=0$","En":"$3x-9+4y-16=0$"},{"Ar":"$3x+4y=25$","En":"$3x+4y=25$"}],"Substitution":{"Ar":"$3x+4y=25$","En":"$3x+4y=25$"},"Result":{"Ar":"$3x+4y=25$","En":"$3x+4y=25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot3+4\\cdot4=25$","En":"$3\\cdot3+4\\cdot4=25$"},"CommonError":{"Ar":"هذا المستقيم يمر بالمركز وبنقطة التماس، فهو حامل نصف القطر.","En":"This line passes through the centre and contact point; it contains the radius."}}}$mw$::jsonb,$mw$المماس عمودي على نصف القطر الواصل إلى نقطة التماس، فيكون المتجه (3,4) عمودياً على المماس.

$3(x-3)+4(y-4)=0$

1. $3x-9+4y-16=0$

2. $3x+4y=25$

$3x+4y=25$

$3x+4y=25$

$3\cdot3+4\cdot4=25$

هذا المستقيم يمر بالمركز وبنقطة التماس، فهو حامل نصف القطر.$mw$,$mw$The tangent is perpendicular to the radius to the contact point, so (3,4) is its normal vector.

$3(x-3)+4(y-4)=0$

1. $3x-9+4y-16=0$

2. $3x+4y=25$

$3x+4y=25$

$3x+4y=25$

$3\cdot3+4\cdot4=25$

This line passes through the centre and contact point; it contains the radius.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل نصف القطر متجهاً عمودياً.","En":"Use the radius as a normal vector."},{"Ar":"عوّض إحداثيي نقطة التماس.","En":"Substitute the contact point."}],"Solution":{"Idea":{"Ar":"المماس عمودي على نصف القطر الواصل إلى نقطة التماس، فيكون المتجه (3,4) عمودياً على المماس.","En":"The tangent is perpendicular to the radius to the contact point, so (3,4) is its normal vector."},"FormulaLatex":"3(x-3)+4(y-4)=0","Steps":[{"Ar":"$3x-9+4y-16=0$","En":"$3x-9+4y-16=0$"},{"Ar":"$3x+4y=25$","En":"$3x+4y=25$"}],"Substitution":{"Ar":"$3x+4y=25$","En":"$3x+4y=25$"},"Result":{"Ar":"$3x+4y=25$","En":"$3x+4y=25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot3+4\\cdot4=25$","En":"$3\\cdot3+4\\cdot4=25$"},"CommonError":{"Ar":"هذا المستقيم يمر بالمركز وبنقطة التماس، فهو حامل نصف القطر.","En":"This line passes through the centre and contact point; it contains the radius."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا المستقيم يمر بالمركز وبنقطة التماس، فهو حامل نصف القطر.","En":"This line passes through the centre and contact point; it contains the radius."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يمر بالنقطة (3,4).","En":"It does not pass through (3,4)."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يمر بالنقطة لكنه ليس عمودياً على نصف القطر.","En":"It passes through the point but is not perpendicular to the radius."},"Order":4}]}$mw$),
($mw$growth-v42-grade-11-quadratic-root-sum-and-product-reconstruct-1$mw$,$mw$quadratic-root-sum-and-product-reconstruct$mw$,$mw$secondary-quadratic-roots$mw$,$mw$grade-11$mw$,11,3,9,41,$mw${"StageId":3,"CategoryId":9,"PrimarySkillId":41,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"بناء معادلة من جذريها","En":"Building a quadratic from its roots"},"Question":{"Ar":"أي معادلة تربيعية معامل حدها الرئيس 1 وجذراها −2 و5؟","En":"Which monic quadratic equation has roots −2 and 5?"},"Options":[{"LatexCode":"x^2-3x-10=0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x^2+3x-10=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إشارة معامل x معكوسة.","En":"The x coefficient has the wrong sign."}},{"LatexCode":"x^2-7x+10=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يوافق الجذرين 2 و5.","En":"This corresponds to roots 2 and 5."}},{"LatexCode":"x^2+3x+10=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حاصل ضرب الجذرين سالب لا موجب.","En":"The product of the roots is negative, not positive."}}],"Hints":[{"Ar":"اكتب عاملاً لكل جذر.","En":"Write a factor for each root."},{"Ar":"وسع العاملين واجمع الحدود المتشابهة.","En":"Expand and combine like terms."}],"Solution":{"Idea":{"Ar":"إذا كان الجذران r وs فالمعادلة هي حاصل ضرب العاملين (x−r)(x−s)=0.","En":"For roots r and s, the monic equation is (x−r)(x−s)=0."},"FormulaLatex":"(x+2)(x-5)=0","Steps":[{"Ar":"$x^2-5x+2x-10=0$","En":"$x^2-5x+2x-10=0$"},{"Ar":"$x^2-3x-10=0$","En":"$x^2-3x-10=0$"}],"Substitution":{"Ar":"$x^2-3x-10=0$","En":"$x^2-3x-10=0$"},"Result":{"Ar":"$x^2-3x-10=0$","En":"$x^2-3x-10=0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-2)^2-3(-2)-10=0,\\quad25-15-10=0$","En":"$(-2)^2-3(-2)-10=0,\\quad25-15-10=0$"},"CommonError":{"Ar":"إشارة معامل x معكوسة.","En":"The x coefficient has the wrong sign."}}}$mw$::jsonb,$mw$إذا كان الجذران r وs فالمعادلة هي حاصل ضرب العاملين (x−r)(x−s)=0.

$(x+2)(x-5)=0$

1. $x^2-5x+2x-10=0$

2. $x^2-3x-10=0$

$x^2-3x-10=0$

$x^2-3x-10=0$

$(-2)^2-3(-2)-10=0,\quad25-15-10=0$

إشارة معامل x معكوسة.$mw$,$mw$For roots r and s, the monic equation is (x−r)(x−s)=0.

$(x+2)(x-5)=0$

1. $x^2-5x+2x-10=0$

2. $x^2-3x-10=0$

$x^2-3x-10=0$

$x^2-3x-10=0$

$(-2)^2-3(-2)-10=0,\quad25-15-10=0$

The x coefficient has the wrong sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب عاملاً لكل جذر.","En":"Write a factor for each root."},{"Ar":"وسع العاملين واجمع الحدود المتشابهة.","En":"Expand and combine like terms."}],"Solution":{"Idea":{"Ar":"إذا كان الجذران r وs فالمعادلة هي حاصل ضرب العاملين (x−r)(x−s)=0.","En":"For roots r and s, the monic equation is (x−r)(x−s)=0."},"FormulaLatex":"(x+2)(x-5)=0","Steps":[{"Ar":"$x^2-5x+2x-10=0$","En":"$x^2-5x+2x-10=0$"},{"Ar":"$x^2-3x-10=0$","En":"$x^2-3x-10=0$"}],"Substitution":{"Ar":"$x^2-3x-10=0$","En":"$x^2-3x-10=0$"},"Result":{"Ar":"$x^2-3x-10=0$","En":"$x^2-3x-10=0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-2)^2-3(-2)-10=0,\\quad25-15-10=0$","En":"$(-2)^2-3(-2)-10=0,\\quad25-15-10=0$"},"CommonError":{"Ar":"إشارة معامل x معكوسة.","En":"The x coefficient has the wrong sign."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"إشارة معامل x معكوسة.","En":"The x coefficient has the wrong sign."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يوافق الجذرين 2 و5.","En":"This corresponds to roots 2 and 5."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حاصل ضرب الجذرين سالب لا موجب.","En":"The product of the roots is negative, not positive."},"Order":4}]}$mw$),
($mw$growth-v42-grade-11-logarithm-negative-fractional-exponent-1$mw$,$mw$logarithm-negative-fractional-exponent$mw$,$mw$secondary-logarithm-evaluation$mw$,$mw$grade-11$mw$,11,3,9,42,$mw${"StageId":3,"CategoryId":9,"PrimarySkillId":42,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"لوغاريتم بأس كسري سالب","En":"Logarithm with a negative fractional exponent"},"Question":{"Ar":"ما القيمة الدقيقة لـ $\\log_9(1/3)$؟","En":"What is the exact value of $\\log_9(1/3)$?"},"Options":[{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9^{-2}=1/81.","En":"9^{-2}=1/81."}},{"LatexCode":"-\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9^{1/2}=3.","En":"9^{1/2}=3."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9^2=81.","En":"9^2=81."}}],"Hints":[{"Ar":"اكتب 9 بدلالة قوة للعدد 3.","En":"Express nine as a power of three."},{"Ar":"ساوِ الأسين بعد توحيد الأساس.","En":"Equate exponents after matching bases."}],"Solution":{"Idea":{"Ar":"نكتب الأساس والمقدار على صورة قوتين للعدد 3.","En":"Write the base and argument as powers of three."},"FormulaLatex":"9^x=1/3","Steps":[{"Ar":"$(3^2)^x=3^{-1}$","En":"$(3^2)^x=3^{-1}$"},{"Ar":"$2x=-1\\Rightarrow x=-1/2$","En":"$2x=-1\\Rightarrow x=-1/2$"}],"Substitution":{"Ar":"$2x=-1\\Rightarrow x=-1/2$","En":"$2x=-1\\Rightarrow x=-1/2$"},"Result":{"Ar":"$-\\frac12$","En":"$-\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9^{-1/2}=1/3$","En":"$9^{-1/2}=1/3$"},"CommonError":{"Ar":"9^{-2}=1/81.","En":"9^{-2}=1/81."}}}$mw$::jsonb,$mw$نكتب الأساس والمقدار على صورة قوتين للعدد 3.

$9^x=1/3$

1. $(3^2)^x=3^{-1}$

2. $2x=-1\Rightarrow x=-1/2$

$2x=-1\Rightarrow x=-1/2$

$-\frac12$

$9^{-1/2}=1/3$

9^{-2}=1/81.$mw$,$mw$Write the base and argument as powers of three.

$9^x=1/3$

1. $(3^2)^x=3^{-1}$

2. $2x=-1\Rightarrow x=-1/2$

$2x=-1\Rightarrow x=-1/2$

$-\frac12$

$9^{-1/2}=1/3$

9^{-2}=1/81.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب 9 بدلالة قوة للعدد 3.","En":"Express nine as a power of three."},{"Ar":"ساوِ الأسين بعد توحيد الأساس.","En":"Equate exponents after matching bases."}],"Solution":{"Idea":{"Ar":"نكتب الأساس والمقدار على صورة قوتين للعدد 3.","En":"Write the base and argument as powers of three."},"FormulaLatex":"9^x=1/3","Steps":[{"Ar":"$(3^2)^x=3^{-1}$","En":"$(3^2)^x=3^{-1}$"},{"Ar":"$2x=-1\\Rightarrow x=-1/2$","En":"$2x=-1\\Rightarrow x=-1/2$"}],"Substitution":{"Ar":"$2x=-1\\Rightarrow x=-1/2$","En":"$2x=-1\\Rightarrow x=-1/2$"},"Result":{"Ar":"$-\\frac12$","En":"$-\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9^{-1/2}=1/3$","En":"$9^{-1/2}=1/3$"},"CommonError":{"Ar":"9^{-2}=1/81.","En":"9^{-2}=1/81."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"9^{-2}=1/81.","En":"9^{-2}=1/81."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"9^{1/2}=3.","En":"9^{1/2}=3."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"9^2=81.","En":"9^2=81."},"Order":4}]}$mw$),
($mw$growth-v42-grade-11-combinations-required-exact-group-count-1$mw$,$mw$combinations-required-exact-group-count$mw$,$mw$secondary-combinations$mw$,$mw$grade-11$mw$,11,3,12,56,$mw${"StageId":3,"CategoryId":12,"PrimarySkillId":56,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار لجنة بأعداد محددة","En":"Committee with prescribed counts"},"Question":{"Ar":"تضم مجموعة 5 معلمين و4 طلاب متميزين. كم لجنة غير مرتبة من أربعة أشخاص تتكون من معلمين اثنين وطالبين اثنين؟","En":"A group has 5 distinct teachers and 4 distinct students. How many unordered four-person committees contain exactly two teachers and two students?"},"Options":[{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"16 يجمع 10 و6 بدلاً من ضربهما.","En":"16 adds 10 and 6 rather than multiplying."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 يرتب المعلمين فقط.","En":"20 counts ordered teacher pairs only."}},{"LatexCode":"60","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"126","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"126 يختار أربعة من تسعة دون شرط.","En":"126 chooses four from nine without the constraint."}}],"Hints":[{"Ar":"احسب اختيار معلمين من خمسة.","En":"Count choices of two teachers from five."},{"Ar":"اضرب في عدد طرق اختيار طالبين من أربعة.","En":"Multiply by the choices of two students from four."}],"Solution":{"Idea":{"Ar":"نختار المعلمين والطلاب بتوافيق مستقلة ونضرب العددين.","En":"Choose teachers and students using separate combinations and multiply the counts."},"FormulaLatex":"\\binom52\\binom42","Steps":[{"Ar":"$\\binom52=10,\\quad\\binom42=6$","En":"$\\binom52=10,\\quad\\binom42=6$"},{"Ar":"$10\\cdot6=60$","En":"$10\\cdot6=60$"}],"Substitution":{"Ar":"$10\\cdot6=60$","En":"$10\\cdot6=60$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot4/2\\cdot(4\\cdot3/2)=60$","En":"$5\\cdot4/2\\cdot(4\\cdot3/2)=60$"},"CommonError":{"Ar":"16 يجمع 10 و6 بدلاً من ضربهما.","En":"16 adds 10 and 6 rather than multiplying."}}}$mw$::jsonb,$mw$نختار المعلمين والطلاب بتوافيق مستقلة ونضرب العددين.

$\binom52\binom42$

1. $\binom52=10,\quad\binom42=6$

2. $10\cdot6=60$

$10\cdot6=60$

$60$

$5\cdot4/2\cdot(4\cdot3/2)=60$

16 يجمع 10 و6 بدلاً من ضربهما.$mw$,$mw$Choose teachers and students using separate combinations and multiply the counts.

$\binom52\binom42$

1. $\binom52=10,\quad\binom42=6$

2. $10\cdot6=60$

$10\cdot6=60$

$60$

$5\cdot4/2\cdot(4\cdot3/2)=60$

16 adds 10 and 6 rather than multiplying.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب اختيار معلمين من خمسة.","En":"Count choices of two teachers from five."},{"Ar":"اضرب في عدد طرق اختيار طالبين من أربعة.","En":"Multiply by the choices of two students from four."}],"Solution":{"Idea":{"Ar":"نختار المعلمين والطلاب بتوافيق مستقلة ونضرب العددين.","En":"Choose teachers and students using separate combinations and multiply the counts."},"FormulaLatex":"\\binom52\\binom42","Steps":[{"Ar":"$\\binom52=10,\\quad\\binom42=6$","En":"$\\binom52=10,\\quad\\binom42=6$"},{"Ar":"$10\\cdot6=60$","En":"$10\\cdot6=60$"}],"Substitution":{"Ar":"$10\\cdot6=60$","En":"$10\\cdot6=60$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot4/2\\cdot(4\\cdot3/2)=60$","En":"$5\\cdot4/2\\cdot(4\\cdot3/2)=60$"},"CommonError":{"Ar":"16 يجمع 10 و6 بدلاً من ضربهما.","En":"16 adds 10 and 6 rather than multiplying."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"16 يجمع 10 و6 بدلاً من ضربهما.","En":"16 adds 10 and 6 rather than multiplying."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"20 يرتب المعلمين فقط.","En":"20 counts ordered teacher pairs only."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"126 يختار أربعة من تسعة دون شرط.","En":"126 chooses four from nine without the constraint."},"Order":4}]}$mw$),
($mw$growth-v42-grade-11-variance-compute-from-mean-square-1$mw$,$mw$variance-compute-from-mean-square$mw$,$mw$secondary-population-variance$mw$,$mw$grade-11$mw$,11,3,35,54,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":54,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التباين من متوسط المربعات","En":"Variance from the mean square"},"Question":{"Ar":"متوسط قيم مجتمع بيانات يساوي 6، ومتوسط مربعات قيمه يساوي 45. ما تباينه السكاني؟","En":"A population has mean 6 and mean of squared observations 45. What is its population variance?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 هو الانحراف المعياري.","En":"3 is the standard deviation."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"39","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"39 يطرح المتوسط دون تربيعه.","En":"39 subtracts the mean without squaring."}},{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"45 متوسط المربعات وليس التباين.","En":"45 is the mean square, not variance."}}],"Hints":[{"Ar":"ربع المتوسط أولاً.","En":"Square the mean first."},{"Ar":"اطرحه من متوسط المربعات.","En":"Subtract it from the mean square."}],"Solution":{"Idea":{"Ar":"التباين السكاني يساوي متوسط المربعات ناقص مربع المتوسط.","En":"Population variance equals mean square minus the square of the mean."},"FormulaLatex":"\\sigma^2=E[X^2]-(E[X])^2","Steps":[{"Ar":"$6^2=36$","En":"$6^2=36$"},{"Ar":"$45-36=9$","En":"$45-36=9$"}],"Substitution":{"Ar":"$45-36=9$","En":"$45-36=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36+9=45$","En":"$36+9=45$"},"CommonError":{"Ar":"3 هو الانحراف المعياري.","En":"3 is the standard deviation."}}}$mw$::jsonb,$mw$التباين السكاني يساوي متوسط المربعات ناقص مربع المتوسط.

$\sigma^2=E[X^2]-(E[X])^2$

1. $6^2=36$

2. $45-36=9$

$45-36=9$

$9$

$36+9=45$

3 هو الانحراف المعياري.$mw$,$mw$Population variance equals mean square minus the square of the mean.

$\sigma^2=E[X^2]-(E[X])^2$

1. $6^2=36$

2. $45-36=9$

$45-36=9$

$9$

$36+9=45$

3 is the standard deviation.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ربع المتوسط أولاً.","En":"Square the mean first."},{"Ar":"اطرحه من متوسط المربعات.","En":"Subtract it from the mean square."}],"Solution":{"Idea":{"Ar":"التباين السكاني يساوي متوسط المربعات ناقص مربع المتوسط.","En":"Population variance equals mean square minus the square of the mean."},"FormulaLatex":"\\sigma^2=E[X^2]-(E[X])^2","Steps":[{"Ar":"$6^2=36$","En":"$6^2=36$"},{"Ar":"$45-36=9$","En":"$45-36=9$"}],"Substitution":{"Ar":"$45-36=9$","En":"$45-36=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36+9=45$","En":"$36+9=45$"},"CommonError":{"Ar":"3 هو الانحراف المعياري.","En":"3 is the standard deviation."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 هو الانحراف المعياري.","En":"3 is the standard deviation."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"39 يطرح المتوسط دون تربيعه.","En":"39 subtracts the mean without squaring."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"45 متوسط المربعات وليس التباين.","En":"45 is the mean square, not variance."},"Order":4}]}$mw$),
($mw$growth-v42-grade-12-half-life-initial-mass-recovery-1$mw$,$mw$half-life-initial-mass-recovery$mw$,$mw$decay-half-life$mw$,$mw$grade-12$mw$,12,3,86,310,$mw${"StageId":3,"CategoryId":86,"PrimarySkillId":310,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استعادة الكتلة الابتدائية","En":"Recovering initial mass"},"Question":{"Ar":"عمر النصف لمادة يساوي 3 ساعات. بعد 9 ساعات بقي 15 غراماً. ما الكتلة الابتدائية؟","En":"A substance has a half-life of 3 hours. After 9 hours, 15 grams remain. What was the initial mass?"},"Options":[{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"45 يضرب في عدد الفترات مباشرة.","En":"45 multiplies by the interval count directly."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60 يعكس فترتين فقط.","En":"60 reverses only two halvings."}},{"LatexCode":"120","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"135","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"135 يضرب في عدد الساعات.","En":"135 multiplies by the hours."}}],"Hints":[{"Ar":"احسب عدد فترات عمر النصف.","En":"Count the half-life intervals."},{"Ar":"اضرب الكتلة الباقية في 2 لكل فترة.","En":"Multiply the remaining mass by two per interval."}],"Solution":{"Idea":{"Ar":"تحدث ثلاث عمليات تنصيف خلال تسع ساعات؛ نعكسها بالضرب في ثمانية.","En":"Three halvings occur in nine hours; reverse them by multiplying by eight."},"FormulaLatex":"M_0=M(t)2^{t/T}","Steps":[{"Ar":"$9/3=3$","En":"$9/3=3$"},{"Ar":"$15\\cdot2^3=120$","En":"$15\\cdot2^3=120$"}],"Substitution":{"Ar":"$15\\cdot2^3=120$","En":"$15\\cdot2^3=120$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$120/2^3=15$","En":"$120/2^3=15$"},"CommonError":{"Ar":"45 يضرب في عدد الفترات مباشرة.","En":"45 multiplies by the interval count directly."}}}$mw$::jsonb,$mw$تحدث ثلاث عمليات تنصيف خلال تسع ساعات؛ نعكسها بالضرب في ثمانية.

$M_0=M(t)2^{t/T}$

1. $9/3=3$

2. $15\cdot2^3=120$

$15\cdot2^3=120$

$120$ غ

$120/2^3=15$

45 يضرب في عدد الفترات مباشرة.$mw$,$mw$Three halvings occur in nine hours; reverse them by multiplying by eight.

$M_0=M(t)2^{t/T}$

1. $9/3=3$

2. $15\cdot2^3=120$

$15\cdot2^3=120$

$120$ g

$120/2^3=15$

45 multiplies by the interval count directly.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد فترات عمر النصف.","En":"Count the half-life intervals."},{"Ar":"اضرب الكتلة الباقية في 2 لكل فترة.","En":"Multiply the remaining mass by two per interval."}],"Solution":{"Idea":{"Ar":"تحدث ثلاث عمليات تنصيف خلال تسع ساعات؛ نعكسها بالضرب في ثمانية.","En":"Three halvings occur in nine hours; reverse them by multiplying by eight."},"FormulaLatex":"M_0=M(t)2^{t/T}","Steps":[{"Ar":"$9/3=3$","En":"$9/3=3$"},{"Ar":"$15\\cdot2^3=120$","En":"$15\\cdot2^3=120$"}],"Substitution":{"Ar":"$15\\cdot2^3=120$","En":"$15\\cdot2^3=120$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$120/2^3=15$","En":"$120/2^3=15$"},"CommonError":{"Ar":"45 يضرب في عدد الفترات مباشرة.","En":"45 multiplies by the interval count directly."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"45 يضرب في عدد الفترات مباشرة.","En":"45 multiplies by the interval count directly."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"60 يعكس فترتين فقط.","En":"60 reverses only two halvings."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"135 يضرب في عدد الساعات.","En":"135 multiplies by the hours."},"Order":4}]}$mw$),
($mw$growth-v42-grade-12-log-properties-quotient-known-values-1$mw$,$mw$log-properties-quotient-known-values$mw$,$mw$logarithm-properties$mw$,$mw$grade-12$mw$,12,3,86,315,$mw${"StageId":3,"CategoryId":86,"PrimarySkillId":315,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق لوغاريتمين","En":"Difference of logarithms"},"Question":{"Ar":"إذا كان $\\log_5 2=a$ و$\\log_5 3=b$، فأي تعبير يساوي $\\log_5(18/4)$؟","En":"If $\\log_5 2=a$ and $\\log_5 3=b$, which expression equals $\\log_5(18/4)$?"},"Options":[{"LatexCode":"2b-a","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2a-b","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعكس أدوار a وb.","En":"Swaps a and b."}},{"LatexCode":"a+2b","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستخدم الجمع للقسمة.","En":"Uses addition for division."}},{"LatexCode":"2b-2a","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يطرح ضعف a بعد الاختزال.","En":"Subtracts twice a after reduction."}}],"Hints":[{"Ar":"اختزل 18/4 أولاً.","En":"Reduce 18/4 first."},{"Ar":"حوّل القسمة إلى طرح والقوة إلى معامل.","En":"Turn division into subtraction and powers into coefficients."}],"Solution":{"Idea":{"Ar":"نبسط المقدار إلى 9/2 ثم نطبق قاعدتي القوة والقسمة.","En":"Simplify the argument to 9/2, then apply the power and quotient laws."},"FormulaLatex":"\\log_5(3^2/2)=2\\log_5 3-\\log_5 2","Steps":[{"Ar":"$18/4=9/2=3^2/2$","En":"$18/4=9/2=3^2/2$"},{"Ar":"$2b-a$","En":"$2b-a$"}],"Substitution":{"Ar":"$2b-a$","En":"$2b-a$"},"Result":{"Ar":"$2b-a$","En":"$2b-a$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5^{2b-a}=9/2$","En":"$5^{2b-a}=9/2$"},"CommonError":{"Ar":"يعكس أدوار a وb.","En":"Swaps a and b."}}}$mw$::jsonb,$mw$نبسط المقدار إلى 9/2 ثم نطبق قاعدتي القوة والقسمة.

$\log_5(3^2/2)=2\log_5 3-\log_5 2$

1. $18/4=9/2=3^2/2$

2. $2b-a$

$2b-a$

$2b-a$

$5^{2b-a}=9/2$

يعكس أدوار a وb.$mw$,$mw$Simplify the argument to 9/2, then apply the power and quotient laws.

$\log_5(3^2/2)=2\log_5 3-\log_5 2$

1. $18/4=9/2=3^2/2$

2. $2b-a$

$2b-a$

$2b-a$

$5^{2b-a}=9/2$

Swaps a and b.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اختزل 18/4 أولاً.","En":"Reduce 18/4 first."},{"Ar":"حوّل القسمة إلى طرح والقوة إلى معامل.","En":"Turn division into subtraction and powers into coefficients."}],"Solution":{"Idea":{"Ar":"نبسط المقدار إلى 9/2 ثم نطبق قاعدتي القوة والقسمة.","En":"Simplify the argument to 9/2, then apply the power and quotient laws."},"FormulaLatex":"\\log_5(3^2/2)=2\\log_5 3-\\log_5 2","Steps":[{"Ar":"$18/4=9/2=3^2/2$","En":"$18/4=9/2=3^2/2$"},{"Ar":"$2b-a$","En":"$2b-a$"}],"Substitution":{"Ar":"$2b-a$","En":"$2b-a$"},"Result":{"Ar":"$2b-a$","En":"$2b-a$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5^{2b-a}=9/2$","En":"$5^{2b-a}=9/2$"},"CommonError":{"Ar":"يعكس أدوار a وb.","En":"Swaps a and b."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعكس أدوار a وb.","En":"Swaps a and b."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يستخدم الجمع للقسمة.","En":"Uses addition for division."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يطرح ضعف a بعد الاختزال.","En":"Subtracts twice a after reduction."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v42 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
