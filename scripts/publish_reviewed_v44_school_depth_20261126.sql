-- One-time owner-authorized v44 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v44-grade-12-trig-sum-of-reciprocal-squares-1$mw$,$mw$trig-sum-of-reciprocal-squares$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع مربعين مقلوبين","En":"Sum of reciprocal squares"},"Question":{"Ar":"إذا كان $\\sin\\theta\\cos\\theta\\ne0$، فأي تعبير يكافئ $\\frac1{\\sin^2\\theta}+\\frac1{\\cos^2\\theta}$؟","En":"If $\\sin\\theta\\cos\\theta\\ne0$, which expression equals $\\frac1{\\sin^2\\theta}+\\frac1{\\cos^2\\theta}$?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع المقلوبين لا يساوي مجموع المربعين.","En":"The sum of reciprocals is not the sum of squares."}},{"LatexCode":"\\frac1{\\sin^2\\theta\\cos^2\\theta}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\sin^2\\theta\\cos^2\\theta","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب المربعين، وليس مقلوبه الناتج عن توحيد المقام.","En":"This is the product of the squares, not its reciprocal obtained using a common denominator."}},{"LatexCode":"\\tan^2\\theta","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع الظل نسبة مختلفة.","En":"Tangent squared is a different ratio."}}],"Hints":[{"Ar":"وحّد المقامين قبل الجمع.","En":"Find a common denominator before adding."},{"Ar":"بسّط البسط فقط بالمتطابقة.","En":"Simplify the numerator using the identity."}],"Solution":{"Idea":{"Ar":"نوحد المقامين ثم نستعمل مجموع المربعين.","En":"Use a common denominator and the sum-of-squares identity."},"FormulaLatex":"\\frac{\\cos^2\\theta+\\sin^2\\theta}{\\sin^2\\theta\\cos^2\\theta}","Steps":[{"Ar":"$\\cos^2\\theta+\\sin^2\\theta=1$","En":"$\\cos^2\\theta+\\sin^2\\theta=1$"},{"Ar":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$","En":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$"}],"Substitution":{"Ar":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$","En":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$"},"Result":{"Ar":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$","En":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=45^\\circ:\\ 2+2=4=1/(1/4)$","En":"$\\theta=45^\\circ:\\ 2+2=4=1/(1/4)$"},"CommonError":{"Ar":"مجموع المقلوبين لا يساوي مجموع المربعين.","En":"The sum of reciprocals is not the sum of squares."}}}$mw$::jsonb,$mw$نوحد المقامين ثم نستعمل مجموع المربعين.

$\frac{\cos^2\theta+\sin^2\theta}{\sin^2\theta\cos^2\theta}$

1. $\cos^2\theta+\sin^2\theta=1$

2. $\frac1{\sin^2\theta\cos^2\theta}$

$\frac1{\sin^2\theta\cos^2\theta}$

$\frac1{\sin^2\theta\cos^2\theta}$

$\theta=45^\circ:\ 2+2=4=1/(1/4)$

مجموع المقلوبين لا يساوي مجموع المربعين.$mw$,$mw$Use a common denominator and the sum-of-squares identity.

$\frac{\cos^2\theta+\sin^2\theta}{\sin^2\theta\cos^2\theta}$

1. $\cos^2\theta+\sin^2\theta=1$

2. $\frac1{\sin^2\theta\cos^2\theta}$

$\frac1{\sin^2\theta\cos^2\theta}$

$\frac1{\sin^2\theta\cos^2\theta}$

$\theta=45^\circ:\ 2+2=4=1/(1/4)$

The sum of reciprocals is not the sum of squares.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وحّد المقامين قبل الجمع.","En":"Find a common denominator before adding."},{"Ar":"بسّط البسط فقط بالمتطابقة.","En":"Simplify the numerator using the identity."}],"Solution":{"Idea":{"Ar":"نوحد المقامين ثم نستعمل مجموع المربعين.","En":"Use a common denominator and the sum-of-squares identity."},"FormulaLatex":"\\frac{\\cos^2\\theta+\\sin^2\\theta}{\\sin^2\\theta\\cos^2\\theta}","Steps":[{"Ar":"$\\cos^2\\theta+\\sin^2\\theta=1$","En":"$\\cos^2\\theta+\\sin^2\\theta=1$"},{"Ar":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$","En":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$"}],"Substitution":{"Ar":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$","En":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$"},"Result":{"Ar":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$","En":"$\\frac1{\\sin^2\\theta\\cos^2\\theta}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=45^\\circ:\\ 2+2=4=1/(1/4)$","En":"$\\theta=45^\\circ:\\ 2+2=4=1/(1/4)$"},"CommonError":{"Ar":"مجموع المقلوبين لا يساوي مجموع المربعين.","En":"The sum of reciprocals is not the sum of squares."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مجموع المقلوبين لا يساوي مجموع المربعين.","En":"The sum of reciprocals is not the sum of squares."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب المربعين، وليس مقلوبه الناتج عن توحيد المقام.","En":"This is the product of the squares, not its reciprocal obtained using a common denominator."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مربع الظل نسبة مختلفة.","En":"Tangent squared is a different ratio."},"Order":4}]}$mw$),
($mw$growth-v44-grade-7-probability-unequal-sector-count-complement-1$mw$,$mw$probability-unequal-sector-count-complement$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال من قطاعات غير متساوية","En":"Probability with unequal sectors"},"Question":{"Ar":"قرص دائري عادل في اتجاه توقف مؤشره، مقسم إلى قطاع أحمر زاويته 180° وقطاع أزرق زاويته 90° وقطاع أخضر زاويته 90°. ما احتمال توقف المؤشر في القطاع الأحمر؟","En":"A spinner has a uniformly random stopping direction. Its red sector is 180°, blue sector 90° and green sector 90°. What is the probability of landing on red?"},"Options":[{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض تساوي القطاعات الثلاثة.","En":"Assumes three equal sectors."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربع يمثل قطاعاً بزاوية 90°.","En":"One quarter represents a 90° sector."}},{"LatexCode":"\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أرباع تمثل 270°.","En":"Three quarters represents 270°."}}],"Hints":[{"Ar":"القطاعات ليست متساوية المساحة.","En":"The sectors do not have equal areas."},{"Ar":"اقسم زاوية الأحمر على 360.","En":"Divide the red angle by 360."}],"Solution":{"Idea":{"Ar":"الاحتمال يتناسب مع زاوية القطاع عند تساوي فرص جميع الاتجاهات.","En":"With uniformly random directions, probability is proportional to sector angle."},"FormulaLatex":"P(R)=180/360","Steps":[{"Ar":"$180+90+90=360$","En":"$180+90+90=360$"},{"Ar":"$180/360=1/2$","En":"$180/360=1/2$"}],"Substitution":{"Ar":"$180/360=1/2$","En":"$180/360=1/2$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2+1/4+1/4=1$","En":"$1/2+1/4+1/4=1$"},"CommonError":{"Ar":"يفترض تساوي القطاعات الثلاثة.","En":"Assumes three equal sectors."}}}$mw$::jsonb,$mw$الاحتمال يتناسب مع زاوية القطاع عند تساوي فرص جميع الاتجاهات.

$P(R)=180/360$

1. $180+90+90=360$

2. $180/360=1/2$

$180/360=1/2$

$\frac12$

$1/2+1/4+1/4=1$

يفترض تساوي القطاعات الثلاثة.$mw$,$mw$With uniformly random directions, probability is proportional to sector angle.

$P(R)=180/360$

1. $180+90+90=360$

2. $180/360=1/2$

$180/360=1/2$

$\frac12$

$1/2+1/4+1/4=1$

Assumes three equal sectors.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"القطاعات ليست متساوية المساحة.","En":"The sectors do not have equal areas."},{"Ar":"اقسم زاوية الأحمر على 360.","En":"Divide the red angle by 360."}],"Solution":{"Idea":{"Ar":"الاحتمال يتناسب مع زاوية القطاع عند تساوي فرص جميع الاتجاهات.","En":"With uniformly random directions, probability is proportional to sector angle."},"FormulaLatex":"P(R)=180/360","Steps":[{"Ar":"$180+90+90=360$","En":"$180+90+90=360$"},{"Ar":"$180/360=1/2$","En":"$180/360=1/2$"}],"Substitution":{"Ar":"$180/360=1/2$","En":"$180/360=1/2$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2+1/4+1/4=1$","En":"$1/2+1/4+1/4=1$"},"CommonError":{"Ar":"يفترض تساوي القطاعات الثلاثة.","En":"Assumes three equal sectors."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يفترض تساوي القطاعات الثلاثة.","En":"Assumes three equal sectors."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ربع يمثل قطاعاً بزاوية 90°.","En":"One quarter represents a 90° sector."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أرباع تمثل 270°.","En":"Three quarters represents 270°."},"Order":4}]}$mw$),
($mw$growth-v44-grade-8-mean-median-two-sets-different-center-1$mw$,$mw$mean-median-two-sets-different-center$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المقارنة بين المتوسط والوسيط","En":"Comparing mean and median"},"Question":{"Ar":"للقيم 1، 2، 3، 4، 20، بكم يزيد المتوسط الحسابي على الوسيط؟","En":"For the values 1, 2, 3, 4, 20, by how much does the arithmetic mean exceed the median?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفرق بين 6 و3 ليس 2.","En":"The difference between six and three is not two."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 المتوسط وحده.","En":"6 is the mean alone."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 لا يمثل فرق المقياسين.","En":"10 is not the difference between the measures."}}],"Hints":[{"Ar":"الوسيط هو القيمة الثالثة.","En":"The median is the third value."},{"Ar":"اجمع القيم الخمس واقسم على خمسة.","En":"Add the five values and divide by five."}],"Solution":{"Idea":{"Ar":"نحسب مقياسي المركز على حدة ثم نطرح.","En":"Calculate the two centre measures separately and subtract."},"FormulaLatex":"\\bar x-M=30/5-3","Steps":[{"Ar":"$1+2+3+4+20=30$","En":"$1+2+3+4+20=30$"},{"Ar":"$\\bar x=6,\\quad M=3$","En":"$\\bar x=6,\\quad M=3$"},{"Ar":"$6-3=3$","En":"$6-3=3$"}],"Substitution":{"Ar":"$6-3=3$","En":"$6-3=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+3=6$","En":"$3+3=6$"},"CommonError":{"Ar":"الفرق بين 6 و3 ليس 2.","En":"The difference between six and three is not two."}}}$mw$::jsonb,$mw$نحسب مقياسي المركز على حدة ثم نطرح.

$\bar x-M=30/5-3$

1. $1+2+3+4+20=30$

2. $\bar x=6,\quad M=3$

3. $6-3=3$

$6-3=3$

$3$

$3+3=6$

الفرق بين 6 و3 ليس 2.$mw$,$mw$Calculate the two centre measures separately and subtract.

$\bar x-M=30/5-3$

1. $1+2+3+4+20=30$

2. $\bar x=6,\quad M=3$

3. $6-3=3$

$6-3=3$

$3$

$3+3=6$

The difference between six and three is not two.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الوسيط هو القيمة الثالثة.","En":"The median is the third value."},{"Ar":"اجمع القيم الخمس واقسم على خمسة.","En":"Add the five values and divide by five."}],"Solution":{"Idea":{"Ar":"نحسب مقياسي المركز على حدة ثم نطرح.","En":"Calculate the two centre measures separately and subtract."},"FormulaLatex":"\\bar x-M=30/5-3","Steps":[{"Ar":"$1+2+3+4+20=30$","En":"$1+2+3+4+20=30$"},{"Ar":"$\\bar x=6,\\quad M=3$","En":"$\\bar x=6,\\quad M=3$"},{"Ar":"$6-3=3$","En":"$6-3=3$"}],"Substitution":{"Ar":"$6-3=3$","En":"$6-3=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+3=6$","En":"$3+3=6$"},"CommonError":{"Ar":"الفرق بين 6 و3 ليس 2.","En":"The difference between six and three is not two."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الفرق بين 6 و3 ليس 2.","En":"The difference between six and three is not two."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 المتوسط وحده.","En":"6 is the mean alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"10 لا يمثل فرق المقياسين.","En":"10 is not the difference between the measures."},"Order":4}]}$mw$),
($mw$growth-v44-grade-9-inequality-rational-coefficients-both-sides-1$mw$,$mw$inequality-rational-coefficients-both-sides$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متراجحة بحدين كسريين","En":"Inequality with fractional coefficients"},"Question":{"Ar":"حل المتراجحة $\\frac{x}{2}+1>\\frac{x}{4}+3$ في الأعداد الحقيقية.","En":"Solve $\\frac{x}{2}+1>\\frac{x}{4}+3$ over the reals."},"Options":[{"LatexCode":"x>2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 فرق الثابتين قبل إزالة المقامات.","En":"Two is the difference of constants before clearing denominators."}},{"LatexCode":"x>4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 لا يحقق المتراجحة.","En":"Four does not satisfy the inequality."}},{"LatexCode":"x>8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x<8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب في موجب لا يعكس الإشارة.","En":"Multiplying by a positive number does not reverse the inequality."}}],"Hints":[{"Ar":"أزل المقامات بضرب الطرفين في أربعة.","En":"Clear denominators by multiplying both sides by four."},{"Ar":"انقل حدود x إلى طرف والثوابت إلى الآخر.","En":"Collect variable terms on one side and constants on the other."}],"Solution":{"Idea":{"Ar":"نضرب الطرفين في أربعة ثم نجمع الحدود المتشابهة.","En":"Multiply both sides by four, then collect like terms."},"FormulaLatex":"2x+4>x+12","Steps":[{"Ar":"$x>12-4$","En":"$x>12-4$"},{"Ar":"$x>8$","En":"$x>8$"}],"Substitution":{"Ar":"$x>8$","En":"$x>8$"},"Result":{"Ar":"$x>8$","En":"$x>8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x=9:\\ 5.5>5.25$","En":"$x=9:\\ 5.5>5.25$"},"CommonError":{"Ar":"2 فرق الثابتين قبل إزالة المقامات.","En":"Two is the difference of constants before clearing denominators."}}}$mw$::jsonb,$mw$نضرب الطرفين في أربعة ثم نجمع الحدود المتشابهة.

$2x+4>x+12$

1. $x>12-4$

2. $x>8$

$x>8$

$x>8$

$x=9:\ 5.5>5.25$

2 فرق الثابتين قبل إزالة المقامات.$mw$,$mw$Multiply both sides by four, then collect like terms.

$2x+4>x+12$

1. $x>12-4$

2. $x>8$

$x>8$

$x>8$

$x=9:\ 5.5>5.25$

Two is the difference of constants before clearing denominators.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أزل المقامات بضرب الطرفين في أربعة.","En":"Clear denominators by multiplying both sides by four."},{"Ar":"انقل حدود x إلى طرف والثوابت إلى الآخر.","En":"Collect variable terms on one side and constants on the other."}],"Solution":{"Idea":{"Ar":"نضرب الطرفين في أربعة ثم نجمع الحدود المتشابهة.","En":"Multiply both sides by four, then collect like terms."},"FormulaLatex":"2x+4>x+12","Steps":[{"Ar":"$x>12-4$","En":"$x>12-4$"},{"Ar":"$x>8$","En":"$x>8$"}],"Substitution":{"Ar":"$x>8$","En":"$x>8$"},"Result":{"Ar":"$x>8$","En":"$x>8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x=9:\\ 5.5>5.25$","En":"$x=9:\\ 5.5>5.25$"},"CommonError":{"Ar":"2 فرق الثابتين قبل إزالة المقامات.","En":"Two is the difference of constants before clearing denominators."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 فرق الثابتين قبل إزالة المقامات.","En":"Two is the difference of constants before clearing denominators."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 لا يحقق المتراجحة.","En":"Four does not satisfy the inequality."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الضرب في موجب لا يعكس الإشارة.","En":"Multiplying by a positive number does not reverse the inequality."},"Order":4}]}$mw$),
($mw$growth-v44-grade-10-mean-deviation-sum-missing-deviation-1$mw$,$mw$mean-deviation-sum-missing-deviation$mw$,$mw$secondary-arithmetic-mean$mw$,$mw$grade-10$mw$,10,3,35,53,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":53,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع الانحرافات عن المتوسط","En":"Sum of deviations from the mean"},"Question":{"Ar":"أربع قيم متوسطها الحسابي 15. انحرافات ثلاث قيم عن المتوسط هي −4 و2 و5. ما انحراف القيمة الرابعة عن المتوسط؟","En":"Four observations have arithmetic mean 15. Three signed deviations from the mean are −4, 2 and 5. What is the fourth deviation?"},"Options":[{"LatexCode":"-7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−7 لا يجعل المجموع صفراً.","En":"−7 does not make the sum zero."}},{"LatexCode":"-3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 هو مجموع الانحرافات الثلاثة.","En":"3 is the sum of the three deviations."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 يهمل إشارة أحد الانحرافات.","En":"7 ignores one deviation's sign."}}],"Hints":[{"Ar":"استعمل خاصية مجموع الانحرافات.","En":"Use the zero-sum property of deviations."},{"Ar":"اعكس إشارة مجموع الانحرافات الثلاثة.","En":"Take the opposite of their sum."}],"Solution":{"Idea":{"Ar":"مجموع الانحرافات الموقعة عن المتوسط الحسابي يساوي صفراً.","En":"Signed deviations from the arithmetic mean sum to zero."},"FormulaLatex":" -4+2+5+d=0","Steps":[{"Ar":"$-4+2+5=3$","En":"$-4+2+5=3$"},{"Ar":"$d=-3$","En":"$d=-3$"}],"Substitution":{"Ar":"$d=-3$","En":"$d=-3$"},"Result":{"Ar":"$-3$","En":"$-3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11+17+20+12=60=4\\cdot15$","En":"$11+17+20+12=60=4\\cdot15$"},"CommonError":{"Ar":"−7 لا يجعل المجموع صفراً.","En":"−7 does not make the sum zero."}}}$mw$::jsonb,$mw$مجموع الانحرافات الموقعة عن المتوسط الحسابي يساوي صفراً.

$ -4+2+5+d=0$

1. $-4+2+5=3$

2. $d=-3$

$d=-3$

$-3$

$11+17+20+12=60=4\cdot15$

−7 لا يجعل المجموع صفراً.$mw$,$mw$Signed deviations from the arithmetic mean sum to zero.

$ -4+2+5+d=0$

1. $-4+2+5=3$

2. $d=-3$

$d=-3$

$-3$

$11+17+20+12=60=4\cdot15$

−7 does not make the sum zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل خاصية مجموع الانحرافات.","En":"Use the zero-sum property of deviations."},{"Ar":"اعكس إشارة مجموع الانحرافات الثلاثة.","En":"Take the opposite of their sum."}],"Solution":{"Idea":{"Ar":"مجموع الانحرافات الموقعة عن المتوسط الحسابي يساوي صفراً.","En":"Signed deviations from the arithmetic mean sum to zero."},"FormulaLatex":" -4+2+5+d=0","Steps":[{"Ar":"$-4+2+5=3$","En":"$-4+2+5=3$"},{"Ar":"$d=-3$","En":"$d=-3$"}],"Substitution":{"Ar":"$d=-3$","En":"$d=-3$"},"Result":{"Ar":"$-3$","En":"$-3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11+17+20+12=60=4\\cdot15$","En":"$11+17+20+12=60=4\\cdot15$"},"CommonError":{"Ar":"−7 لا يجعل المجموع صفراً.","En":"−7 does not make the sum zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−7 لا يجعل المجموع صفراً.","En":"−7 does not make the sum zero."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"3 هو مجموع الانحرافات الثلاثة.","En":"3 is the sum of the three deviations."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"7 يهمل إشارة أحد الانحرافات.","En":"7 ignores one deviation's sign."},"Order":4}]}$mw$),
($mw$growth-v44-grade-11-dot-product-cauchy-impossible-value-1$mw$,$mw$dot-product-cauchy-impossible-value$mw$,$mw$dot-product$mw$,$mw$grade-11$mw$,11,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار إمكانية الضرب القياسي","En":"Checking a possible dot product"},"Question":{"Ar":"متجهان معياراهما 2 و5. أي قيمة مما يلي يستحيل أن تكون ضربهما القياسي؟","En":"Two vectors have norms 2 and 5. Which of the following values cannot be their dot product?"},"Options":[{"LatexCode":"-10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−10 ممكن عند تعاكس الاتجاهين.","En":"−10 is possible for opposite directions."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صفر ممكن عند التعامد.","En":"Zero is possible for perpendicular vectors."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يقع ضمن المجال المسموح.","En":"Six lies within the allowed range."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب حاصل ضرب المعيارين.","En":"Multiply the norms."},{"Ar":"تذكر أن القيمة المطلقة لجيب التمام لا تتجاوز واحداً.","En":"Recall that the absolute cosine is at most one."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة للضرب القياسي لا تتجاوز حاصل ضرب المعيارين.","En":"The absolute dot product cannot exceed the product of the norms."},"FormulaLatex":"|u\\cdot v|\\le\\|u\\|\\|v\\|=10","Steps":[{"Ar":"$-10\\le u\\cdot v\\le10$","En":"$-10\\le u\\cdot v\\le10$"},{"Ar":"$12>10$","En":"$12>10$"}],"Substitution":{"Ar":"$12>10$","En":"$12>10$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12/10=1.2>1$","En":"$12/10=1.2>1$"},"CommonError":{"Ar":"−10 ممكن عند تعاكس الاتجاهين.","En":"−10 is possible for opposite directions."}}}$mw$::jsonb,$mw$القيمة المطلقة للضرب القياسي لا تتجاوز حاصل ضرب المعيارين.

$|u\cdot v|\le\|u\|\|v\|=10$

1. $-10\le u\cdot v\le10$

2. $12>10$

$12>10$

$12$

$12/10=1.2>1$

−10 ممكن عند تعاكس الاتجاهين.$mw$,$mw$The absolute dot product cannot exceed the product of the norms.

$|u\cdot v|\le\|u\|\|v\|=10$

1. $-10\le u\cdot v\le10$

2. $12>10$

$12>10$

$12$

$12/10=1.2>1$

−10 is possible for opposite directions.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب حاصل ضرب المعيارين.","En":"Multiply the norms."},{"Ar":"تذكر أن القيمة المطلقة لجيب التمام لا تتجاوز واحداً.","En":"Recall that the absolute cosine is at most one."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة للضرب القياسي لا تتجاوز حاصل ضرب المعيارين.","En":"The absolute dot product cannot exceed the product of the norms."},"FormulaLatex":"|u\\cdot v|\\le\\|u\\|\\|v\\|=10","Steps":[{"Ar":"$-10\\le u\\cdot v\\le10$","En":"$-10\\le u\\cdot v\\le10$"},{"Ar":"$12>10$","En":"$12>10$"}],"Substitution":{"Ar":"$12>10$","En":"$12>10$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12/10=1.2>1$","En":"$12/10=1.2>1$"},"CommonError":{"Ar":"−10 ممكن عند تعاكس الاتجاهين.","En":"−10 is possible for opposite directions."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−10 ممكن عند تعاكس الاتجاهين.","En":"−10 is possible for opposite directions."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"صفر ممكن عند التعامد.","En":"Zero is possible for perpendicular vectors."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 يقع ضمن المجال المسموح.","En":"Six lies within the allowed range."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v44-grade-12-dot-product-orthogonal-decomposition-length-1$mw$,$mw$dot-product-orthogonal-decomposition-length$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مركبة عمودية من معيار المتجه","En":"Perpendicular component from a norm"},"Question":{"Ar":"متجه معياره 13. طول إسقاطه العمودي على مستقيم يساوي 5. ما معيار المركبة العمودية على المستقيم؟","En":"A vector has norm 13 and the length of its orthogonal projection onto a line is 5. What is the norm of its component perpendicular to the line?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 طول المركبة الموازية.","En":"Five is the parallel component length."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يطرح المعايير مباشرة.","En":"Eight subtracts the norms directly."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18 يجمع المعايير مباشرة.","En":"Eighteen adds the norms directly."}}],"Hints":[{"Ar":"المركبتان متعامدتان.","En":"The components are perpendicular."},{"Ar":"اطرح مربعي المعيارين ثم خذ الجذر.","En":"Subtract the squared norms and take the square root."}],"Solution":{"Idea":{"Ar":"المركبتان المتعامدتان تحققان متطابقة فيثاغورس للمعايير.","En":"Orthogonal components satisfy the Pythagorean norm identity."},"FormulaLatex":"13^2=5^2+h^2","Steps":[{"Ar":"$h^2=169-25=144$","En":"$h^2=169-25=144$"},{"Ar":"$h=12$","En":"$h=12$"}],"Substitution":{"Ar":"$h=12$","En":"$h=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$25+144=169$","En":"$25+144=169$"},"CommonError":{"Ar":"5 طول المركبة الموازية.","En":"Five is the parallel component length."}}}$mw$::jsonb,$mw$المركبتان المتعامدتان تحققان متطابقة فيثاغورس للمعايير.

$13^2=5^2+h^2$

1. $h^2=169-25=144$

2. $h=12$

$h=12$

$12$

$25+144=169$

5 طول المركبة الموازية.$mw$,$mw$Orthogonal components satisfy the Pythagorean norm identity.

$13^2=5^2+h^2$

1. $h^2=169-25=144$

2. $h=12$

$h=12$

$12$

$25+144=169$

Five is the parallel component length.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المركبتان متعامدتان.","En":"The components are perpendicular."},{"Ar":"اطرح مربعي المعيارين ثم خذ الجذر.","En":"Subtract the squared norms and take the square root."}],"Solution":{"Idea":{"Ar":"المركبتان المتعامدتان تحققان متطابقة فيثاغورس للمعايير.","En":"Orthogonal components satisfy the Pythagorean norm identity."},"FormulaLatex":"13^2=5^2+h^2","Steps":[{"Ar":"$h^2=169-25=144$","En":"$h^2=169-25=144$"},{"Ar":"$h=12$","En":"$h=12$"}],"Substitution":{"Ar":"$h=12$","En":"$h=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$25+144=169$","En":"$25+144=169$"},"CommonError":{"Ar":"5 طول المركبة الموازية.","En":"Five is the parallel component length."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 طول المركبة الموازية.","En":"Five is the parallel component length."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8 يطرح المعايير مباشرة.","En":"Eight subtracts the norms directly."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"18 يجمع المعايير مباشرة.","En":"Eighteen adds the norms directly."},"Order":4}]}$mw$),
($mw$growth-v44-grade-9-similar-triangles-missing-scale-from-side-difference-1$mw$,$mw$similar-triangles-missing-scale-from-side-difference$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معامل التشابه من الفرق","En":"Similarity scale from a difference"},"Question":{"Ar":"مثلثان متشابهان ومعامل الانتقال من الأصغر إلى الأكبر 3/2. يزيد طول ضلع في الأكبر على نظيره في الأصغر بمقدار 4 سم. ما طول الضلع في الأصغر؟","En":"Two triangles are similar with scale factor 3/2 from the smaller to the larger. A side of the larger is 4 cm longer than its corresponding smaller side. What is the smaller side length?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يعطي فرقاً مقداره 3.","En":"Six gives a difference of three."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 يعطي فرقاً مقداره 5.","En":"Ten gives a difference of five."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 هو طول الضلع الكبير.","En":"Twelve is the larger side."}}],"Hints":[{"Ar":"إذا كان الصغير x فالكبير 3x/2.","En":"If the smaller side is x, the larger is 3x/2."},{"Ar":"اطرح الصغير من الكبير وساوِ الناتج بأربعة.","En":"Subtract the smaller from the larger and set the result to four."}],"Solution":{"Idea":{"Ar":"نكتب طول الضلع الكبير بدلالة الصغير ثم نستخدم الفرق.","En":"Express the larger side in terms of the smaller and use the difference."},"FormulaLatex":"\\frac32x-x=4","Steps":[{"Ar":"$\\frac12x=4$","En":"$\\frac12x=4$"},{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=8$","En":"$x=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$12-8=4,\\quad12/8=3/2$","En":"$12-8=4,\\quad12/8=3/2$"},"CommonError":{"Ar":"6 يعطي فرقاً مقداره 3.","En":"Six gives a difference of three."}}}$mw$::jsonb,$mw$نكتب طول الضلع الكبير بدلالة الصغير ثم نستخدم الفرق.

$\frac32x-x=4$

1. $\frac12x=4$

2. $x=8$

$x=8$

$8$ سم

$12-8=4,\quad12/8=3/2$

6 يعطي فرقاً مقداره 3.$mw$,$mw$Express the larger side in terms of the smaller and use the difference.

$\frac32x-x=4$

1. $\frac12x=4$

2. $x=8$

$x=8$

$8$ cm

$12-8=4,\quad12/8=3/2$

Six gives a difference of three.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"إذا كان الصغير x فالكبير 3x/2.","En":"If the smaller side is x, the larger is 3x/2."},{"Ar":"اطرح الصغير من الكبير وساوِ الناتج بأربعة.","En":"Subtract the smaller from the larger and set the result to four."}],"Solution":{"Idea":{"Ar":"نكتب طول الضلع الكبير بدلالة الصغير ثم نستخدم الفرق.","En":"Express the larger side in terms of the smaller and use the difference."},"FormulaLatex":"\\frac32x-x=4","Steps":[{"Ar":"$\\frac12x=4$","En":"$\\frac12x=4$"},{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=8$","En":"$x=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$12-8=4,\\quad12/8=3/2$","En":"$12-8=4,\\quad12/8=3/2$"},"CommonError":{"Ar":"6 يعطي فرقاً مقداره 3.","En":"Six gives a difference of three."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"6 يعطي فرقاً مقداره 3.","En":"Six gives a difference of three."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"10 يعطي فرقاً مقداره 5.","En":"Ten gives a difference of five."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 هو طول الضلع الكبير.","En":"Twelve is the larger side."},"Order":4}]}$mw$),
($mw$growth-v44-grade-9-conditional-probability-from-count-table-1$mw$,$mw$conditional-probability-from-count-table$mw$,$mw$simple-compound-events$mw$,$mw$grade-9$mw$,9,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال مشروط من جدول أعداد","En":"Conditional probability from counts"},"Question":{"Ar":"في مجموعة من 30 طالباً، 12 يرتدون نظارات، ومن هؤلاء 8 يشاركون في نادٍ علمي. إذا اختير طالب عشوائياً من مرتدي النظارات فقط، فما احتمال مشاركته في النادي العلمي؟","En":"Among 30 pupils, 12 wear glasses, and 8 of those pupils participate in a science club. If a pupil is selected uniformly from only those wearing glasses, what is the probability of science club participation?"},"Options":[{"LatexCode":"\\frac4{15}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4/15 يقسم على جميع الطلاب.","En":"4/15 divides by all pupils."}},{"LatexCode":"\\frac25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2/5 نسبة مرتدي النظارات من الجميع.","En":"2/5 is the overall glasses-wearing proportion."}},{"LatexCode":"\\frac23","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3/4 لا يساوي 8/12.","En":"3/4 is not equal to 8/12."}}],"Hints":[{"Ar":"ما المجموعة التي يجري الاختيار منها؟","En":"Which group is being sampled?"},{"Ar":"اقسم المشاركين داخل هذه المجموعة على عددها.","En":"Divide the participating pupils in that group by its size."}],"Solution":{"Idea":{"Ar":"بعد تقييد الاختيار بمرتدي النظارات يصبح عدد الحالات الممكنة 12.","En":"Restricting the selection to pupils with glasses gives 12 possible cases."},"FormulaLatex":"P(C\\mid G)=8/12","Steps":[{"Ar":"$8/12=2/3$","En":"$8/12=2/3$"},{"Ar":"عدد الحالات الملائمة ثمانية من اثني عشر.","En":"Eight of twelve eligible pupils are favourable."}],"Substitution":{"Ar":"عدد الحالات الملائمة ثمانية من اثني عشر.","En":"Eight of twelve eligible pupils are favourable."},"Result":{"Ar":"$\\frac23$","En":"$\\frac23$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot2/3=8$","En":"$12\\cdot2/3=8$"},"CommonError":{"Ar":"4/15 يقسم على جميع الطلاب.","En":"4/15 divides by all pupils."}}}$mw$::jsonb,$mw$بعد تقييد الاختيار بمرتدي النظارات يصبح عدد الحالات الممكنة 12.

$P(C\mid G)=8/12$

1. $8/12=2/3$

2. عدد الحالات الملائمة ثمانية من اثني عشر.

عدد الحالات الملائمة ثمانية من اثني عشر.

$\frac23$

$12\cdot2/3=8$

4/15 يقسم على جميع الطلاب.$mw$,$mw$Restricting the selection to pupils with glasses gives 12 possible cases.

$P(C\mid G)=8/12$

1. $8/12=2/3$

2. Eight of twelve eligible pupils are favourable.

Eight of twelve eligible pupils are favourable.

$\frac23$

$12\cdot2/3=8$

4/15 divides by all pupils.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما المجموعة التي يجري الاختيار منها؟","En":"Which group is being sampled?"},{"Ar":"اقسم المشاركين داخل هذه المجموعة على عددها.","En":"Divide the participating pupils in that group by its size."}],"Solution":{"Idea":{"Ar":"بعد تقييد الاختيار بمرتدي النظارات يصبح عدد الحالات الممكنة 12.","En":"Restricting the selection to pupils with glasses gives 12 possible cases."},"FormulaLatex":"P(C\\mid G)=8/12","Steps":[{"Ar":"$8/12=2/3$","En":"$8/12=2/3$"},{"Ar":"عدد الحالات الملائمة ثمانية من اثني عشر.","En":"Eight of twelve eligible pupils are favourable."}],"Substitution":{"Ar":"عدد الحالات الملائمة ثمانية من اثني عشر.","En":"Eight of twelve eligible pupils are favourable."},"Result":{"Ar":"$\\frac23$","En":"$\\frac23$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot2/3=8$","En":"$12\\cdot2/3=8$"},"CommonError":{"Ar":"4/15 يقسم على جميع الطلاب.","En":"4/15 divides by all pupils."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"4/15 يقسم على جميع الطلاب.","En":"4/15 divides by all pupils."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"2/5 نسبة مرتدي النظارات من الجميع.","En":"2/5 is the overall glasses-wearing proportion."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"3/4 لا يساوي 8/12.","En":"3/4 is not equal to 8/12."},"Order":4}]}$mw$),
($mw$growth-v44-grade-10-coordinate-line-intercept-triangle-area-1$mw$,$mw$coordinate-line-intercept-triangle-area$mw$,$mw$coordinate-lines$mw$,$mw$grade-10$mw$,10,3,88,329,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":329,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة مثلث محصور بالمحورين","En":"Area of an intercept triangle"},"Question":{"Ar":"يقطع المستقيم $2x+3y=12$ المحورين الإحداثيين. ما مساحة المثلث المحصور بينه وبين المحورين؟","En":"The line $2x+3y=12$ intersects both coordinate axes. What is the area of the triangle bounded by the line and the axes?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 يجمع طولي الضلعين.","En":"Ten adds the two side lengths."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"24 يهمل النصف.","En":"Twenty-four omits the half."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"36 يربع طول القاعدة دون استخدام الارتفاع.","En":"Thirty-six squares the base without using the height."}}],"Hints":[{"Ar":"ضع y=0 ثم x=0 لإيجاد التقاطعين.","En":"Set y=0 and then x=0 to find intercepts."},{"Ar":"استعمل قانون مساحة المثلث القائم.","En":"Use the right-triangle area formula."}],"Solution":{"Idea":{"Ar":"نوجد نقطتي التقاطع؛ طولَا الضلعين القائمين هما إحداثيا التقاطعين الموجبان.","En":"Find both intercepts; their positive coordinates give the perpendicular side lengths."},"FormulaLatex":"A=\\frac12\\cdot6\\cdot4","Steps":[{"Ar":"$y=0\\Rightarrow x=6$","En":"$y=0\\Rightarrow x=6$"},{"Ar":"$x=0\\Rightarrow y=4$","En":"$x=0\\Rightarrow y=4$"},{"Ar":"$A=12$","En":"$A=12$"}],"Substitution":{"Ar":"$A=12$","En":"$A=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot12=6\\cdot4$","En":"$2\\cdot12=6\\cdot4$"},"CommonError":{"Ar":"10 يجمع طولي الضلعين.","En":"Ten adds the two side lengths."}}}$mw$::jsonb,$mw$نوجد نقطتي التقاطع؛ طولَا الضلعين القائمين هما إحداثيا التقاطعين الموجبان.

$A=\frac12\cdot6\cdot4$

1. $y=0\Rightarrow x=6$

2. $x=0\Rightarrow y=4$

3. $A=12$

$A=12$

$12$

$2\cdot12=6\cdot4$

10 يجمع طولي الضلعين.$mw$,$mw$Find both intercepts; their positive coordinates give the perpendicular side lengths.

$A=\frac12\cdot6\cdot4$

1. $y=0\Rightarrow x=6$

2. $x=0\Rightarrow y=4$

3. $A=12$

$A=12$

$12$

$2\cdot12=6\cdot4$

Ten adds the two side lengths.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع y=0 ثم x=0 لإيجاد التقاطعين.","En":"Set y=0 and then x=0 to find intercepts."},{"Ar":"استعمل قانون مساحة المثلث القائم.","En":"Use the right-triangle area formula."}],"Solution":{"Idea":{"Ar":"نوجد نقطتي التقاطع؛ طولَا الضلعين القائمين هما إحداثيا التقاطعين الموجبان.","En":"Find both intercepts; their positive coordinates give the perpendicular side lengths."},"FormulaLatex":"A=\\frac12\\cdot6\\cdot4","Steps":[{"Ar":"$y=0\\Rightarrow x=6$","En":"$y=0\\Rightarrow x=6$"},{"Ar":"$x=0\\Rightarrow y=4$","En":"$x=0\\Rightarrow y=4$"},{"Ar":"$A=12$","En":"$A=12$"}],"Substitution":{"Ar":"$A=12$","En":"$A=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot12=6\\cdot4$","En":"$2\\cdot12=6\\cdot4$"},"CommonError":{"Ar":"10 يجمع طولي الضلعين.","En":"Ten adds the two side lengths."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"10 يجمع طولي الضلعين.","En":"Ten adds the two side lengths."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"24 يهمل النصف.","En":"Twenty-four omits the half."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"36 يربع طول القاعدة دون استخدام الارتفاع.","En":"Thirty-six squares the base without using the height."},"Order":4}]}$mw$),
($mw$growth-v44-grade-11-locus-fixed-distance-horizontal-line-two-lines-1$mw$,$mw$locus-fixed-distance-horizontal-line-two-lines$mw$,$mw$loci$mw$,$mw$grade-11$mw$,11,3,88,330,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":330,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محل نقاط تبعد مسافة ثابتة عن مستقيم","En":"Locus at a fixed distance from a line"},"Question":{"Ar":"ما مجموعة النقاط التي تبعد مسافة عمودية مقدارها 3 عن المستقيم y=2؟","En":"What is the locus of points at perpendicular distance 3 from the line y=2?"},"Options":[{"LatexCode":"y=5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضم المستقيم العلوي فقط.","En":"Includes only the upper line."}},{"LatexCode":"y=-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضم المستقيم السفلي فقط.","En":"Includes only the lower line."}},{"LatexCode":"y=5\\ \\text{or}\\ y=-1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x=5\\ \\text{or}\\ x=-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المحل يتكون من مستقيمين أفقيين لا رأسيين.","En":"The locus consists of horizontal, not vertical, lines."}}],"Hints":[{"Ar":"النقاط قد تكون فوق المستقيم أو تحته.","En":"Points may lie above or below the line."},{"Ar":"حل معادلة القيمة المطلقة في الحالتين.","En":"Solve both cases of the absolute-value equation."}],"Solution":{"Idea":{"Ar":"المسافة العمودية عن مستقيم أفقي هي القيمة المطلقة لفرق الإحداثي الرأسي.","En":"Perpendicular distance from a horizontal line is the absolute difference of vertical coordinates."},"FormulaLatex":"|y-2|=3","Steps":[{"Ar":"$y-2=3\\Rightarrow y=5$","En":"$y-2=3\\Rightarrow y=5$"},{"Ar":"$y-2=-3\\Rightarrow y=-1$","En":"$y-2=-3\\Rightarrow y=-1$"}],"Substitution":{"Ar":"$y-2=-3\\Rightarrow y=-1$","En":"$y-2=-3\\Rightarrow y=-1$"},"Result":{"Ar":"$y=5\\ \\text{or}\\ y=-1$","En":"$y=5\\ \\text{or}\\ y=-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|5-2|=|-1-2|=3$","En":"$|5-2|=|-1-2|=3$"},"CommonError":{"Ar":"يضم المستقيم العلوي فقط.","En":"Includes only the upper line."}}}$mw$::jsonb,$mw$المسافة العمودية عن مستقيم أفقي هي القيمة المطلقة لفرق الإحداثي الرأسي.

$|y-2|=3$

1. $y-2=3\Rightarrow y=5$

2. $y-2=-3\Rightarrow y=-1$

$y-2=-3\Rightarrow y=-1$

$y=5\ \text{or}\ y=-1$

$|5-2|=|-1-2|=3$

يضم المستقيم العلوي فقط.$mw$,$mw$Perpendicular distance from a horizontal line is the absolute difference of vertical coordinates.

$|y-2|=3$

1. $y-2=3\Rightarrow y=5$

2. $y-2=-3\Rightarrow y=-1$

$y-2=-3\Rightarrow y=-1$

$y=5\ \text{or}\ y=-1$

$|5-2|=|-1-2|=3$

Includes only the upper line.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"النقاط قد تكون فوق المستقيم أو تحته.","En":"Points may lie above or below the line."},{"Ar":"حل معادلة القيمة المطلقة في الحالتين.","En":"Solve both cases of the absolute-value equation."}],"Solution":{"Idea":{"Ar":"المسافة العمودية عن مستقيم أفقي هي القيمة المطلقة لفرق الإحداثي الرأسي.","En":"Perpendicular distance from a horizontal line is the absolute difference of vertical coordinates."},"FormulaLatex":"|y-2|=3","Steps":[{"Ar":"$y-2=3\\Rightarrow y=5$","En":"$y-2=3\\Rightarrow y=5$"},{"Ar":"$y-2=-3\\Rightarrow y=-1$","En":"$y-2=-3\\Rightarrow y=-1$"}],"Substitution":{"Ar":"$y-2=-3\\Rightarrow y=-1$","En":"$y-2=-3\\Rightarrow y=-1$"},"Result":{"Ar":"$y=5\\ \\text{or}\\ y=-1$","En":"$y=5\\ \\text{or}\\ y=-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|5-2|=|-1-2|=3$","En":"$|5-2|=|-1-2|=3$"},"CommonError":{"Ar":"يضم المستقيم العلوي فقط.","En":"Includes only the upper line."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يضم المستقيم العلوي فقط.","En":"Includes only the upper line."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يضم المستقيم السفلي فقط.","En":"Includes only the lower line."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المحل يتكون من مستقيمين أفقيين لا رأسيين.","En":"The locus consists of horizontal, not vertical, lines."},"Order":4}]}$mw$),
($mw$growth-v44-grade-12-circle-two-centers-external-tangency-1$mw$,$mw$circle-two-centers-external-tangency$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تماس دائرتين خارجياً","En":"External tangency of two circles"},"Question":{"Ar":"دائرة مركزها (0,0) ونصف قطرها 3، وأخرى مركزها (8,0). ما نصف قطر الثانية إذا كانتا متماستين خارجياً؟","En":"One circle is centred at (0,0) with radius 3. Another has centre (8,0). What is the second radius if they are externally tangent?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يجعل مجموع النصفين 6.","En":"Three gives a radius sum of six."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 هو المسافة بين المركزين.","En":"Eight is the centre distance."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"11 يوافق فرق نصفي القطرين في تماس داخلي، لا مجموعهما.","En":"Eleven corresponds to an internal tangency difference, not the external sum."}}],"Hints":[{"Ar":"احسب المسافة بين المركزين.","En":"Find the centre distance."},{"Ar":"اطرح نصف قطر الدائرة الأولى.","En":"Subtract the first radius."}],"Solution":{"Idea":{"Ar":"في التماس الخارجي تساوي المسافة بين المركزين مجموع نصفي القطرين.","En":"For external tangency the centre distance equals the sum of radii."},"FormulaLatex":"d=r_1+r_2","Steps":[{"Ar":"$d=8$","En":"$d=8$"},{"Ar":"$r_2=8-3=5$","En":"$r_2=8-3=5$"}],"Substitution":{"Ar":"$r_2=8-3=5$","En":"$r_2=8-3=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+5=8$","En":"$3+5=8$"},"CommonError":{"Ar":"3 يجعل مجموع النصفين 6.","En":"Three gives a radius sum of six."}}}$mw$::jsonb,$mw$في التماس الخارجي تساوي المسافة بين المركزين مجموع نصفي القطرين.

$d=r_1+r_2$

1. $d=8$

2. $r_2=8-3=5$

$r_2=8-3=5$

$5$

$3+5=8$

3 يجعل مجموع النصفين 6.$mw$,$mw$For external tangency the centre distance equals the sum of radii.

$d=r_1+r_2$

1. $d=8$

2. $r_2=8-3=5$

$r_2=8-3=5$

$5$

$3+5=8$

Three gives a radius sum of six.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب المسافة بين المركزين.","En":"Find the centre distance."},{"Ar":"اطرح نصف قطر الدائرة الأولى.","En":"Subtract the first radius."}],"Solution":{"Idea":{"Ar":"في التماس الخارجي تساوي المسافة بين المركزين مجموع نصفي القطرين.","En":"For external tangency the centre distance equals the sum of radii."},"FormulaLatex":"d=r_1+r_2","Steps":[{"Ar":"$d=8$","En":"$d=8$"},{"Ar":"$r_2=8-3=5$","En":"$r_2=8-3=5$"}],"Substitution":{"Ar":"$r_2=8-3=5$","En":"$r_2=8-3=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+5=8$","En":"$3+5=8$"},"CommonError":{"Ar":"3 يجعل مجموع النصفين 6.","En":"Three gives a radius sum of six."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 يجعل مجموع النصفين 6.","En":"Three gives a radius sum of six."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 هو المسافة بين المركزين.","En":"Eight is the centre distance."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"11 يوافق فرق نصفي القطرين في تماس داخلي، لا مجموعهما.","En":"Eleven corresponds to an internal tangency difference, not the external sum."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v44 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
