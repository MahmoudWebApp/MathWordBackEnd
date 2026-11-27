-- One-time owner-authorized v55 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v55-grade-6-percent-original-quantity-from-percent-remaining-1$mw$,$mw$percent-original-quantity-from-percent-remaining$mw$,$mw$p-fractions-decimals-basic-percentages$mw$,$mw$grade-6$mw$,6,1,21,93,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":93,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع الكمية الأصلية","En":"Recovering original quantity"},"Question":{"Ar":"بعد بيع 30% من كمية التفاح بقي 56 كغ. ما الكمية الأصلية بالكيلوغرام؟","En":"After selling 30% of a quantity of apples, 56 kg remain. What was the original quantity in kilograms?"},"Options":[{"LatexCode":"80","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16.8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب 30% من الباقي.","En":"Calculates 30% of the remainder."}},{"LatexCode":"72.8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاد الباقي بنسبة 30% من الباقي نفسه.","En":"Increases the remainder by 30% of itself."}},{"LatexCode":"\\frac{560}{3}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على نسبة المبيع بدلاً من نسبة الباقي.","En":"Divides by the sold proportion instead of the remaining proportion."}}],"Hints":[{"Ar":"حدد نسبة الكمية المتبقية.","En":"Find the remaining percentage."},{"Ar":"اقسم الباقي على 0.7.","En":"Divide the remainder by 0.7."}],"Solution":{"Idea":{"Ar":"الباقي يمثل 70% من الأصل.","En":"The remainder represents 70% of the original."},"FormulaLatex":"0.7x=56","Steps":[{"Ar":"$100-30=70$","En":"$100-30=70$"},{"Ar":"$56/0.7=80$","En":"$56/0.7=80$"}],"Substitution":{"Ar":"$x=56/0.7$","En":"$x=56/0.7$"},"Result":{"Ar":"$80$","En":"$80$"},"Unit":{"Ar":"كغ","En":"kg"},"Verification":{"Ar":"$0.7\\cdot80=56$","En":"$0.7\\cdot80=56$"},"CommonError":{"Ar":"حسب 30% من الباقي.","En":"Calculates 30% of the remainder."}}}$mw$::jsonb,$mw$الباقي يمثل 70% من الأصل.

$0.7x=56$

1. $100-30=70$

2. $56/0.7=80$

$x=56/0.7$

$80$ كغ

$0.7\cdot80=56$

حسب 30% من الباقي.$mw$,$mw$The remainder represents 70% of the original.

$0.7x=56$

1. $100-30=70$

2. $56/0.7=80$

$x=56/0.7$

$80$ kg

$0.7\cdot80=56$

Calculates 30% of the remainder.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد نسبة الكمية المتبقية.","En":"Find the remaining percentage."},{"Ar":"اقسم الباقي على 0.7.","En":"Divide the remainder by 0.7."}],"Solution":{"Idea":{"Ar":"الباقي يمثل 70% من الأصل.","En":"The remainder represents 70% of the original."},"FormulaLatex":"0.7x=56","Steps":[{"Ar":"$100-30=70$","En":"$100-30=70$"},{"Ar":"$56/0.7=80$","En":"$56/0.7=80$"}],"Substitution":{"Ar":"$x=56/0.7$","En":"$x=56/0.7$"},"Result":{"Ar":"$80$","En":"$80$"},"Unit":{"Ar":"كغ","En":"kg"},"Verification":{"Ar":"$0.7\\cdot80=56$","En":"$0.7\\cdot80=56$"},"CommonError":{"Ar":"حسب 30% من الباقي.","En":"Calculates 30% of the remainder."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب 30% من الباقي.","En":"Calculates 30% of the remainder."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"زاد الباقي بنسبة 30% من الباقي نفسه.","En":"Increases the remainder by 30% of itself."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم على نسبة المبيع بدلاً من نسبة الباقي.","En":"Divides by the sold proportion instead of the remaining proportion."},"Order":4}]}$mw$),
($mw$growth-v55-grade-6-fraction-multiplication-cancellation-across-three-factors-1$mw$,$mw$fraction-multiplication-cancellation-across-three-factors$mw$,$mw$p-fractions-decimals-fraction-operations$mw$,$mw$grade-6$mw$,6,1,21,95,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":95,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختصار عوامل كسرية","En":"Cancelling fractional factors"},"Question":{"Ar":"احسب $\\frac{7}{12}\\times\\frac{9}{14}\\times\\frac{8}{3}$ في أبسط صورة.","En":"Calculate $\\frac{7}{12}\\times\\frac{9}{14}\\times\\frac{8}{3}$ in simplest form."},"Options":[{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أسقط عاملاً مقداره 2 أثناء الاختصار.","En":"Loses a factor of two during cancellation."}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختصار غير صحيح؛ الناتج الصحيح للبسط والمقام هو 504.","En":"Incorrect cancellation; numerator and denominator both equal 504."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف الناتج بسبب اختصار غير متوازن.","En":"Doubles the product through unbalanced cancellation."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اختصر 7 مع 14.","En":"Cancel seven against fourteen."},{"Ar":"اختصر 9 مع 3 و8 مع 12.","En":"Cancel nine against three and eight against twelve."}],"Solution":{"Idea":{"Ar":"نختصر العوامل المشتركة بين البسط والمقام قبل الضرب.","En":"Cancel common numerator and denominator factors before multiplying."},"FormulaLatex":"\\frac{7\\cdot9\\cdot8}{12\\cdot14\\cdot3}","Steps":[{"Ar":"$\\frac7{14}=\\frac12$","En":"$\\frac7{14}=\\frac12$"},{"Ar":"$\\frac93=3$","En":"$\\frac93=3$"},{"Ar":"$\\frac8{12}=\\frac23$","En":"$\\frac8{12}=\\frac23$"},{"Ar":"$\\frac12\\cdot3\\cdot\\frac23=1$","En":"$\\frac12\\cdot3\\cdot\\frac23=1$"}],"Substitution":{"Ar":"$\\frac{504}{504}$","En":"$\\frac{504}{504}$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$504=504$","En":"$504=504$"},"CommonError":{"Ar":"أسقط عاملاً مقداره 2 أثناء الاختصار.","En":"Loses a factor of two during cancellation."}}}$mw$::jsonb,$mw$نختصر العوامل المشتركة بين البسط والمقام قبل الضرب.

$\frac{7\cdot9\cdot8}{12\cdot14\cdot3}$

1. $\frac7{14}=\frac12$

2. $\frac93=3$

3. $\frac8{12}=\frac23$

4. $\frac12\cdot3\cdot\frac23=1$

$\frac{504}{504}$

$1$

$504=504$

أسقط عاملاً مقداره 2 أثناء الاختصار.$mw$,$mw$Cancel common numerator and denominator factors before multiplying.

$\frac{7\cdot9\cdot8}{12\cdot14\cdot3}$

1. $\frac7{14}=\frac12$

2. $\frac93=3$

3. $\frac8{12}=\frac23$

4. $\frac12\cdot3\cdot\frac23=1$

$\frac{504}{504}$

$1$

$504=504$

Loses a factor of two during cancellation.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اختصر 7 مع 14.","En":"Cancel seven against fourteen."},{"Ar":"اختصر 9 مع 3 و8 مع 12.","En":"Cancel nine against three and eight against twelve."}],"Solution":{"Idea":{"Ar":"نختصر العوامل المشتركة بين البسط والمقام قبل الضرب.","En":"Cancel common numerator and denominator factors before multiplying."},"FormulaLatex":"\\frac{7\\cdot9\\cdot8}{12\\cdot14\\cdot3}","Steps":[{"Ar":"$\\frac7{14}=\\frac12$","En":"$\\frac7{14}=\\frac12$"},{"Ar":"$\\frac93=3$","En":"$\\frac93=3$"},{"Ar":"$\\frac8{12}=\\frac23$","En":"$\\frac8{12}=\\frac23$"},{"Ar":"$\\frac12\\cdot3\\cdot\\frac23=1$","En":"$\\frac12\\cdot3\\cdot\\frac23=1$"}],"Substitution":{"Ar":"$\\frac{504}{504}$","En":"$\\frac{504}{504}$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$504=504$","En":"$504=504$"},"CommonError":{"Ar":"أسقط عاملاً مقداره 2 أثناء الاختصار.","En":"Loses a factor of two during cancellation."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أسقط عاملاً مقداره 2 أثناء الاختصار.","En":"Loses a factor of two during cancellation."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"اختصار غير صحيح؛ الناتج الصحيح للبسط والمقام هو 504.","En":"Incorrect cancellation; numerator and denominator both equal 504."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف الناتج بسبب اختصار غير متوازن.","En":"Doubles the product through unbalanced cancellation."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v55-grade-7-gcd-reduced-ratio-common-factor-1$mw$,$mw$gcd-reduced-ratio-common-factor$mw$,$mw$middle-gcd$mw$,$mw$grade-7$mw$,7,2,5,22,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":22,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبسيط نسبة بالقاسم المشترك","En":"Reducing a ratio using the GCD"},"Question":{"Ar":"نسبة عددَي كتابين في مجموعتين هي 84:126. ما أبسط صورة للنسبة؟","En":"The numbers of books in two groups are in the ratio 84:126. What is the ratio in simplest form?"},"Options":[{"LatexCode":"4:6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"النسبة مكافئة لكنها ليست في أبسط صورة.","En":"Equivalent, but not simplest."}},{"LatexCode":"1:2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليست نسبة مكافئة للأصل.","En":"Not equivalent to the original ratio."}},{"LatexCode":"2:3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3:2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب المجموعتين.","En":"Reverses the groups."}}],"Hints":[{"Ar":"أوجد أكبر عدد يقسم 84 و126.","En":"Find the greatest divisor common to both."},{"Ar":"اقسم العددين على 42.","En":"Divide both terms by forty-two."}],"Solution":{"Idea":{"Ar":"نقسم طرفَي النسبة على القاسم المشترك الأكبر.","En":"Divide both terms by their greatest common divisor."},"FormulaLatex":"\\gcd(84,126)=42","Steps":[{"Ar":"$126-84=42$","En":"$126-84=42$"},{"Ar":"$84=2\\cdot42$","En":"$84=2\\cdot42$"},{"Ar":"$126=3\\cdot42$","En":"$126=3\\cdot42$"}],"Substitution":{"Ar":"$(84/42):(126/42)$","En":"$(84/42):(126/42)$"},"Result":{"Ar":"$2:3$","En":"$2:3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot126=3\\cdot84$","En":"$2\\cdot126=3\\cdot84$"},"CommonError":{"Ar":"عكس ترتيب المجموعتين.","En":"Reverses the groups."}}}$mw$::jsonb,$mw$نقسم طرفَي النسبة على القاسم المشترك الأكبر.

$\gcd(84,126)=42$

1. $126-84=42$

2. $84=2\cdot42$

3. $126=3\cdot42$

$(84/42):(126/42)$

$2:3$

$2\cdot126=3\cdot84$

عكس ترتيب المجموعتين.$mw$,$mw$Divide both terms by their greatest common divisor.

$\gcd(84,126)=42$

1. $126-84=42$

2. $84=2\cdot42$

3. $126=3\cdot42$

$(84/42):(126/42)$

$2:3$

$2\cdot126=3\cdot84$

Reverses the groups.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أوجد أكبر عدد يقسم 84 و126.","En":"Find the greatest divisor common to both."},{"Ar":"اقسم العددين على 42.","En":"Divide both terms by forty-two."}],"Solution":{"Idea":{"Ar":"نقسم طرفَي النسبة على القاسم المشترك الأكبر.","En":"Divide both terms by their greatest common divisor."},"FormulaLatex":"\\gcd(84,126)=42","Steps":[{"Ar":"$126-84=42$","En":"$126-84=42$"},{"Ar":"$84=2\\cdot42$","En":"$84=2\\cdot42$"},{"Ar":"$126=3\\cdot42$","En":"$126=3\\cdot42$"}],"Substitution":{"Ar":"$(84/42):(126/42)$","En":"$(84/42):(126/42)$"},"Result":{"Ar":"$2:3$","En":"$2:3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot126=3\\cdot84$","En":"$2\\cdot126=3\\cdot84$"},"CommonError":{"Ar":"عكس ترتيب المجموعتين.","En":"Reverses the groups."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"النسبة مكافئة لكنها ليست في أبسط صورة.","En":"Equivalent, but not simplest."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ليست نسبة مكافئة للأصل.","En":"Not equivalent to the original ratio."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب المجموعتين.","En":"Reverses the groups."},"Order":4}]}$mw$),
($mw$growth-v55-grade-7-power-negative-base-versus-unary-minus-1$mw$,$mw$power-negative-base-versus-unary-minus$mw$,$mw$middle-evaluate-powers$mw$,$mw$grade-7$mw$,7,2,5,23,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":23,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز الأس عن إشارة السالب","En":"Powers and the unary minus"},"Question":{"Ar":"ما قيمة $(-3)^2-(-3^2)$؟","En":"Evaluate $(-3)^2-(-3^2)$."},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل التعبير الثاني.","En":"Omits the second expression."}},{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل التعبيرين على أنهما متساويان.","En":"Treats both expressions as equal."}},{"LatexCode":"-18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الطرح.","En":"Reverses the subtraction."}}],"Hints":[{"Ar":"احسب مربع −3 داخل القوس.","En":"Square negative three inside parentheses."},{"Ar":"احسب سالب مربع 3 ثم اطرح.","En":"Negate the square of three, then subtract."}],"Solution":{"Idea":{"Ar":"القوس يجعل السالب جزءاً من الأساس، أما الأس دون القوس فيطبق قبل إشارة السالب.","En":"Parentheses make the negative sign part of the base; otherwise exponentiation precedes unary minus."},"FormulaLatex":"(-3)^2=9,\\quad-3^2=-9","Steps":[{"Ar":"$9-(-9)=9+9$","En":"$9-(-9)=9+9$"},{"Ar":"$9+9=18$","En":"$9+9=18$"}],"Substitution":{"Ar":"$9-(-9)$","En":"$9-(-9)$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$18-9=9$","En":"$18-9=9$"},"CommonError":{"Ar":"عامل التعبيرين على أنهما متساويان.","En":"Treats both expressions as equal."}}}$mw$::jsonb,$mw$القوس يجعل السالب جزءاً من الأساس، أما الأس دون القوس فيطبق قبل إشارة السالب.

$(-3)^2=9,\quad-3^2=-9$

1. $9-(-9)=9+9$

2. $9+9=18$

$9-(-9)$

$18$

$18-9=9$

عامل التعبيرين على أنهما متساويان.$mw$,$mw$Parentheses make the negative sign part of the base; otherwise exponentiation precedes unary minus.

$(-3)^2=9,\quad-3^2=-9$

1. $9-(-9)=9+9$

2. $9+9=18$

$9-(-9)$

$18$

$18-9=9$

Treats both expressions as equal.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مربع −3 داخل القوس.","En":"Square negative three inside parentheses."},{"Ar":"احسب سالب مربع 3 ثم اطرح.","En":"Negate the square of three, then subtract."}],"Solution":{"Idea":{"Ar":"القوس يجعل السالب جزءاً من الأساس، أما الأس دون القوس فيطبق قبل إشارة السالب.","En":"Parentheses make the negative sign part of the base; otherwise exponentiation precedes unary minus."},"FormulaLatex":"(-3)^2=9,\\quad-3^2=-9","Steps":[{"Ar":"$9-(-9)=9+9$","En":"$9-(-9)=9+9$"},{"Ar":"$9+9=18$","En":"$9+9=18$"}],"Substitution":{"Ar":"$9-(-9)$","En":"$9-(-9)$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$18-9=9$","En":"$18-9=9$"},"CommonError":{"Ar":"عامل التعبيرين على أنهما متساويان.","En":"Treats both expressions as equal."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل التعبير الثاني.","En":"Omits the second expression."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عامل التعبيرين على أنهما متساويان.","En":"Treats both expressions as equal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الطرح.","En":"Reverses the subtraction."},"Order":4}]}$mw$),
($mw$growth-v55-grade-8-pythagorean-area-squares-difference-1$mw$,$mw$pythagorean-area-squares-difference$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-8$mw$,8,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحات مربعات على أضلاع مثلث قائم","En":"Areas of squares on right triangle sides"},"Question":{"Ar":"مساحة المربع على وتر مثلث قائم 169 سم²، ومساحة المربع على إحدى ساقيه 25 سم². ما مساحة المربع على الساق الأخرى؟","En":"The square on a right triangle's hypotenuse has area 169 cm². The square on one leg has area 25 cm². Find the area of the square on the other leg."},"Options":[{"LatexCode":"144","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا طول الساق وليس مساحة مربعها.","En":"This is the leg length, not its square's area."}},{"LatexCode":"194","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المساحتين بدلاً من طرحهما.","En":"Adds instead of subtracting the areas."}},{"LatexCode":"156","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح طول الوتر من مساحته.","En":"Subtracts the hypotenuse length from its square's area."}}],"Hints":[{"Ar":"المعطيات مساحات مربعات وليست أطوالاً.","En":"The given numbers are square areas, not lengths."},{"Ar":"اطرح مساحة مربع الساق المعروفة.","En":"Subtract the known leg square area."}],"Solution":{"Idea":{"Ar":"مربع الوتر يساوي مجموع مربعي الساقين.","En":"The hypotenuse square equals the sum of the leg squares."},"FormulaLatex":"c^2=a^2+b^2","Steps":[{"Ar":"$b^2=144$","En":"$b^2=144$"}],"Substitution":{"Ar":"$b^2=169-25$","En":"$b^2=169-25$"},"Result":{"Ar":"$144$","En":"$144$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$25+144=169$","En":"$25+144=169$"},"CommonError":{"Ar":"هذا طول الساق وليس مساحة مربعها.","En":"This is the leg length, not its square's area."}}}$mw$::jsonb,$mw$مربع الوتر يساوي مجموع مربعي الساقين.

$c^2=a^2+b^2$

1. $b^2=144$

$b^2=169-25$

$144$ سم²

$25+144=169$

هذا طول الساق وليس مساحة مربعها.$mw$,$mw$The hypotenuse square equals the sum of the leg squares.

$c^2=a^2+b^2$

1. $b^2=144$

$b^2=169-25$

$144$ cm²

$25+144=169$

This is the leg length, not its square's area.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المعطيات مساحات مربعات وليست أطوالاً.","En":"The given numbers are square areas, not lengths."},{"Ar":"اطرح مساحة مربع الساق المعروفة.","En":"Subtract the known leg square area."}],"Solution":{"Idea":{"Ar":"مربع الوتر يساوي مجموع مربعي الساقين.","En":"The hypotenuse square equals the sum of the leg squares."},"FormulaLatex":"c^2=a^2+b^2","Steps":[{"Ar":"$b^2=144$","En":"$b^2=144$"}],"Substitution":{"Ar":"$b^2=169-25$","En":"$b^2=169-25$"},"Result":{"Ar":"$144$","En":"$144$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$25+144=169$","En":"$25+144=169$"},"CommonError":{"Ar":"هذا طول الساق وليس مساحة مربعها.","En":"This is the leg length, not its square's area."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا طول الساق وليس مساحة مربعها.","En":"This is the leg length, not its square's area."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع المساحتين بدلاً من طرحهما.","En":"Adds instead of subtracting the areas."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح طول الوتر من مساحته.","En":"Subtracts the hypotenuse length from its square's area."},"Order":4}]}$mw$),
($mw$growth-v55-grade-12-derivative-polynomial-horizontal-tangent-solve-1$mw$,$mw$derivative-polynomial-horizontal-tangent-solve$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-12$mw$,12,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مماس أفقي لمنحنى","En":"Horizontal tangent of a curve"},"Question":{"Ar":"عند أي قيمة لـ x يكون مماس منحنى $f(x)=2x^2-12x+7$ أفقياً؟","En":"At which x-value is the tangent to $f(x)=2x^2-12x+7$ horizontal?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يشتق الحد التربيعي بشكل صحيح.","En":"Differentiates the quadratic term incorrectly."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض أن المماس أفقي عند الأصل.","En":"Assumes the tangent is horizontal at zero."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الحل.","En":"Reverses the solution sign."}}],"Hints":[{"Ar":"اشتق كثيرة الحدود.","En":"Differentiate the polynomial."},{"Ar":"ساوِ المشتقة بالصفر.","En":"Set the derivative to zero."}],"Solution":{"Idea":{"Ar":"ميل المماس الأفقي يساوي صفراً، فنحل معادلة المشتقة.","En":"A horizontal tangent has zero slope, so solve the derivative equation."},"FormulaLatex":"f'(x)=4x-12=0","Steps":[{"Ar":"$f'(x)=4x-12$","En":"$f'(x)=4x-12$"},{"Ar":"$x=12/4=3$","En":"$x=12/4=3$"}],"Substitution":{"Ar":"$4x=12$","En":"$4x=12$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(3)=12-12=0$","En":"$f'(3)=12-12=0$"},"CommonError":{"Ar":"عكس إشارة الحل.","En":"Reverses the solution sign."}}}$mw$::jsonb,$mw$ميل المماس الأفقي يساوي صفراً، فنحل معادلة المشتقة.

$f'(x)=4x-12=0$

1. $f'(x)=4x-12$

2. $x=12/4=3$

$4x=12$

$3$

$f'(3)=12-12=0$

عكس إشارة الحل.$mw$,$mw$A horizontal tangent has zero slope, so solve the derivative equation.

$f'(x)=4x-12=0$

1. $f'(x)=4x-12$

2. $x=12/4=3$

$4x=12$

$3$

$f'(3)=12-12=0$

Reverses the solution sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشتق كثيرة الحدود.","En":"Differentiate the polynomial."},{"Ar":"ساوِ المشتقة بالصفر.","En":"Set the derivative to zero."}],"Solution":{"Idea":{"Ar":"ميل المماس الأفقي يساوي صفراً، فنحل معادلة المشتقة.","En":"A horizontal tangent has zero slope, so solve the derivative equation."},"FormulaLatex":"f'(x)=4x-12=0","Steps":[{"Ar":"$f'(x)=4x-12$","En":"$f'(x)=4x-12$"},{"Ar":"$x=12/4=3$","En":"$x=12/4=3$"}],"Substitution":{"Ar":"$4x=12$","En":"$4x=12$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(3)=12-12=0$","En":"$f'(3)=12-12=0$"},"CommonError":{"Ar":"عكس إشارة الحل.","En":"Reverses the solution sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يشتق الحد التربيعي بشكل صحيح.","En":"Differentiates the quadratic term incorrectly."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يفترض أن المماس أفقي عند الأصل.","En":"Assumes the tangent is horizontal at zero."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الحل.","En":"Reverses the solution sign."},"Order":4}]}$mw$),
($mw$growth-v55-grade-12-antiderivative-initial-value-constant-1$mw$,$mw$antiderivative-initial-value-constant$mw$,$mw$secondary-indefinite-integrals$mw$,$mw$grade-12$mw$,12,3,11,50,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":50,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد ثابت التكامل","En":"Determining an integration constant"},"Question":{"Ar":"إذا كان $F'(x)=6x-4$ و$F(2)=7$، فما قيمة ثابت التكامل C في $F(x)=3x^2-4x+C$؟","En":"If $F'(x)=6x-4$ and $F(2)=7$, what is the integration constant C in $F(x)=3x^2-4x+C$?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الجزء المحسوب دون الثابت.","En":"This is the expression value without the constant."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط قيمة الدالة بثابت التكامل.","En":"Confuses the function value with the integration constant."}},{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الفرق.","En":"Reverses the difference sign."}}],"Hints":[{"Ar":"عوّض x بالعدد 2.","En":"Substitute two for x."},{"Ar":"حل المعادلة الناتجة في C.","En":"Solve the resulting equation for C."}],"Solution":{"Idea":{"Ar":"نستخدم الشرط المعطى بعد التكامل لإيجاد الثابت.","En":"Use the given condition after integrating to find the constant."},"FormulaLatex":"F(2)=3(2)^2-4(2)+C=7","Steps":[{"Ar":"$4+C=7$","En":"$4+C=7$"},{"Ar":"$C=3$","En":"$C=3$"}],"Substitution":{"Ar":"$12-8+C=7$","En":"$12-8+C=7$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3(2)^2-4(2)+3=7$","En":"$3(2)^2-4(2)+3=7$"},"CommonError":{"Ar":"خلط قيمة الدالة بثابت التكامل.","En":"Confuses the function value with the integration constant."}}}$mw$::jsonb,$mw$نستخدم الشرط المعطى بعد التكامل لإيجاد الثابت.

$F(2)=3(2)^2-4(2)+C=7$

1. $4+C=7$

2. $C=3$

$12-8+C=7$

$3$

$3(2)^2-4(2)+3=7$

خلط قيمة الدالة بثابت التكامل.$mw$,$mw$Use the given condition after integrating to find the constant.

$F(2)=3(2)^2-4(2)+C=7$

1. $4+C=7$

2. $C=3$

$12-8+C=7$

$3$

$3(2)^2-4(2)+3=7$

Confuses the function value with the integration constant.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض x بالعدد 2.","En":"Substitute two for x."},{"Ar":"حل المعادلة الناتجة في C.","En":"Solve the resulting equation for C."}],"Solution":{"Idea":{"Ar":"نستخدم الشرط المعطى بعد التكامل لإيجاد الثابت.","En":"Use the given condition after integrating to find the constant."},"FormulaLatex":"F(2)=3(2)^2-4(2)+C=7","Steps":[{"Ar":"$4+C=7$","En":"$4+C=7$"},{"Ar":"$C=3$","En":"$C=3$"}],"Substitution":{"Ar":"$12-8+C=7$","En":"$12-8+C=7$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3(2)^2-4(2)+3=7$","En":"$3(2)^2-4(2)+3=7$"},"CommonError":{"Ar":"خلط قيمة الدالة بثابت التكامل.","En":"Confuses the function value with the integration constant."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا الجزء المحسوب دون الثابت.","En":"This is the expression value without the constant."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خلط قيمة الدالة بثابت التكامل.","En":"Confuses the function value with the integration constant."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الفرق.","En":"Reverses the difference sign."},"Order":4}]}$mw$),
($mw$growth-v55-grade-2-arithmetic-two-boxes-transfer-and-remove-total-1$mw$,$mw$arithmetic-two-boxes-transfer-and-remove-total$mw$,$mw$primary-multistep-arithmetic$mw$,$mw$grade-2$mw$,2,1,1,3,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":3,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تغير المجموع بعد نقل وإزالة","En":"Total after transfer and removal"},"Question":{"Ar":"صندوق فيه 18 كرة وآخر فيه 12 كرة. نُقلت 4 كرات من الأول إلى الثاني، ثم أُزيلت 3 كرات من الثاني. كم كرة بقيت في الصندوقين معاً؟","En":"One box has 18 balls and another has 12. Four balls move from the first to the second, then three balls are removed from the second. How many remain in both boxes altogether?"},"Options":[{"LatexCode":"27","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الكرات المنقولة على أنها مفقودة.","En":"Treats transferred balls as lost."}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يطرح الكرات المزالة.","En":"Does not subtract the removed balls."}},{"LatexCode":"31","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الكرات المنقولة مرة أخرى.","En":"Adds transferred balls again."}}],"Hints":[{"Ar":"كم كرة كانت في الصندوقين أولاً؟","En":"How many balls were there initially?"},{"Ar":"هل نقل الكرات يخرجها من الصندوقين؟","En":"Does transferring balls remove them from both boxes?"}],"Solution":{"Idea":{"Ar":"النقل لا يغير المجموع؛ الإزالة وحدها تنقصه.","En":"Transfer preserves the total; only removal reduces it."},"FormulaLatex":"18+12-3","Steps":[{"Ar":"$18+12=30$","En":"$18+12=30$"},{"Ar":"$30-3=27$","En":"$30-3=27$"}],"Substitution":{"Ar":"$30-3$","En":"$30-3$"},"Result":{"Ar":"$27$","En":"$27$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(18-4)+(12+4-3)=27$","En":"$(18-4)+(12+4-3)=27$"},"CommonError":{"Ar":"حسب الكرات المنقولة على أنها مفقودة.","En":"Treats transferred balls as lost."}}}$mw$::jsonb,$mw$النقل لا يغير المجموع؛ الإزالة وحدها تنقصه.

$18+12-3$

1. $18+12=30$

2. $30-3=27$

$30-3$

$27$

$(18-4)+(12+4-3)=27$

حسب الكرات المنقولة على أنها مفقودة.$mw$,$mw$Transfer preserves the total; only removal reduces it.

$18+12-3$

1. $18+12=30$

2. $30-3=27$

$30-3$

$27$

$(18-4)+(12+4-3)=27$

Treats transferred balls as lost.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم كرة كانت في الصندوقين أولاً؟","En":"How many balls were there initially?"},{"Ar":"هل نقل الكرات يخرجها من الصندوقين؟","En":"Does transferring balls remove them from both boxes?"}],"Solution":{"Idea":{"Ar":"النقل لا يغير المجموع؛ الإزالة وحدها تنقصه.","En":"Transfer preserves the total; only removal reduces it."},"FormulaLatex":"18+12-3","Steps":[{"Ar":"$18+12=30$","En":"$18+12=30$"},{"Ar":"$30-3=27$","En":"$30-3=27$"}],"Substitution":{"Ar":"$30-3$","En":"$30-3$"},"Result":{"Ar":"$27$","En":"$27$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(18-4)+(12+4-3)=27$","En":"$(18-4)+(12+4-3)=27$"},"CommonError":{"Ar":"حسب الكرات المنقولة على أنها مفقودة.","En":"Treats transferred balls as lost."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب الكرات المنقولة على أنها مفقودة.","En":"Treats transferred balls as lost."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لم يطرح الكرات المزالة.","En":"Does not subtract the removed balls."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الكرات المنقولة مرة أخرى.","En":"Adds transferred balls again."},"Order":4}]}$mw$),
($mw$growth-v55-grade-2-addition-three-consecutive-tens-missing-total-1$mw$,$mw$addition-three-consecutive-tens-missing-total$mw$,$mw$primary-addition$mw$,$mw$grade-2$mw$,2,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"جمع أعداد متتالية من عشرات","En":"Adding consecutive tens"},"Question":{"Ar":"جمع طفل 30 و40 و50. ما المجموع؟","En":"A child adds 30, 40 and 50. What is the total?"},"Options":[{"LatexCode":"90","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل العدد 30.","En":"Omits thirty."}},{"LatexCode":"110","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ بعشرة عند الجمع.","En":"Makes a ten-unit addition error."}},{"LatexCode":"130","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاد عشرة على المجموع.","En":"Adds ten too many."}},{"LatexCode":"120","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اجمع 3 و4 و5.","En":"Add three, four and five."},{"Ar":"كل واحدة تمثل عشرة.","En":"Each represents ten."}],"Solution":{"Idea":{"Ar":"نجمع العشرات ثم نحولها إلى وحدات.","En":"Add the tens, then express the total in units."},"FormulaLatex":"(3+4+5)\\cdot10","Steps":[{"Ar":"$3+4=7$","En":"$3+4=7$"},{"Ar":"$7+5=12$","En":"$7+5=12$"},{"Ar":"$12\\cdot10=120$","En":"$12\\cdot10=120$"}],"Substitution":{"Ar":"$12\\cdot10$","En":"$12\\cdot10$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$120-50=70$","En":"$120-50=70$"},"CommonError":{"Ar":"أهمل العدد 30.","En":"Omits thirty."}}}$mw$::jsonb,$mw$نجمع العشرات ثم نحولها إلى وحدات.

$(3+4+5)\cdot10$

1. $3+4=7$

2. $7+5=12$

3. $12\cdot10=120$

$12\cdot10$

$120$

$120-50=70$

أهمل العدد 30.$mw$,$mw$Add the tens, then express the total in units.

$(3+4+5)\cdot10$

1. $3+4=7$

2. $7+5=12$

3. $12\cdot10=120$

$12\cdot10$

$120$

$120-50=70$

Omits thirty.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اجمع 3 و4 و5.","En":"Add three, four and five."},{"Ar":"كل واحدة تمثل عشرة.","En":"Each represents ten."}],"Solution":{"Idea":{"Ar":"نجمع العشرات ثم نحولها إلى وحدات.","En":"Add the tens, then express the total in units."},"FormulaLatex":"(3+4+5)\\cdot10","Steps":[{"Ar":"$3+4=7$","En":"$3+4=7$"},{"Ar":"$7+5=12$","En":"$7+5=12$"},{"Ar":"$12\\cdot10=120$","En":"$12\\cdot10=120$"}],"Substitution":{"Ar":"$12\\cdot10$","En":"$12\\cdot10$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$120-50=70$","En":"$120-50=70$"},"CommonError":{"Ar":"أهمل العدد 30.","En":"Omits thirty."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل العدد 30.","En":"Omits thirty."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أخطأ بعشرة عند الجمع.","En":"Makes a ten-unit addition error."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"زاد عشرة على المجموع.","En":"Adds ten too many."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v55-grade-2-subtraction-compensate-both-terms-same-difference-1$mw$,$mw$subtraction-compensate-both-terms-same-difference$mw$,$mw$primary-subtraction$mw$,$mw$grade-2$mw$,2,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"فرق ثابت بعد تعديل العددين","En":"Constant difference after adjusting both numbers"},"Question":{"Ar":"نعلم أن 63−28=35. ما قيمة 65−30؟","En":"Given that 63−28=35, what is 65−30?"},"Options":[{"LatexCode":"37","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاد الفرق بمقدار 2.","En":"Increases the difference by two."}},{"LatexCode":"95","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع العددين بدلاً من طرحهما.","En":"Adds rather than subtracts."}},{"LatexCode":"35","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"33","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أنقص الفرق بمقدار 2.","En":"Decreases the difference by two."}}],"Hints":[{"Ar":"لاحظ أن كلا العددين زاد بمقدار 2.","En":"Notice both numbers increase by two."},{"Ar":"احسب الفرق بعد الزيادة.","En":"Find the difference after the increases."}],"Solution":{"Idea":{"Ar":"إضافة العدد نفسه إلى المطروح والمطروح منه لا تغير الفرق.","En":"Adding the same amount to both terms preserves their difference."},"FormulaLatex":"(63+2)-(28+2)","Steps":[{"Ar":"$63-28+2-2=35$","En":"$63-28+2-2=35$"}],"Substitution":{"Ar":"$65-30$","En":"$65-30$"},"Result":{"Ar":"$35$","En":"$35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$35+30=65$","En":"$35+30=65$"},"CommonError":{"Ar":"أنقص الفرق بمقدار 2.","En":"Decreases the difference by two."}}}$mw$::jsonb,$mw$إضافة العدد نفسه إلى المطروح والمطروح منه لا تغير الفرق.

$(63+2)-(28+2)$

1. $63-28+2-2=35$

$65-30$

$35$

$35+30=65$

أنقص الفرق بمقدار 2.$mw$,$mw$Adding the same amount to both terms preserves their difference.

$(63+2)-(28+2)$

1. $63-28+2-2=35$

$65-30$

$35$

$35+30=65$

Decreases the difference by two.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لاحظ أن كلا العددين زاد بمقدار 2.","En":"Notice both numbers increase by two."},{"Ar":"احسب الفرق بعد الزيادة.","En":"Find the difference after the increases."}],"Solution":{"Idea":{"Ar":"إضافة العدد نفسه إلى المطروح والمطروح منه لا تغير الفرق.","En":"Adding the same amount to both terms preserves their difference."},"FormulaLatex":"(63+2)-(28+2)","Steps":[{"Ar":"$63-28+2-2=35$","En":"$63-28+2-2=35$"}],"Substitution":{"Ar":"$65-30$","En":"$65-30$"},"Result":{"Ar":"$35$","En":"$35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$35+30=65$","En":"$35+30=65$"},"CommonError":{"Ar":"أنقص الفرق بمقدار 2.","En":"Decreases the difference by two."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"زاد الفرق بمقدار 2.","En":"Increases the difference by two."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع العددين بدلاً من طرحهما.","En":"Adds rather than subtracts."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أنقص الفرق بمقدار 2.","En":"Decreases the difference by two."},"Order":4}]}$mw$),
($mw$growth-v55-grade-3-rectangle-perimeter-equal-square-side-1$mw$,$mw$rectangle-perimeter-equal-square-side$mw$,$mw$primary-perimeter$mw$,$mw$grade-3$mw$,3,1,3,12,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":12,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مربع ومستطيل متساويا المحيط","En":"Equal perimeters"},"Question":{"Ar":"محيط مستطيل طوله 9 سم وعرضه 5 سم يساوي محيط مربع. ما طول ضلع المربع؟","En":"A 9 cm by 5 cm rectangle has the same perimeter as a square. Find the square's side length."},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عرض المستطيل.","En":"This is the rectangle width."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا نصف المحيط.","En":"This is half the perimeter."}},{"LatexCode":"28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المحيط الكلي.","En":"This is the full perimeter."}}],"Hints":[{"Ar":"اجمع الطول والعرض واضرب في 2.","En":"Add length and width and double."},{"Ar":"للمربع أربعة أضلاع متساوية.","En":"A square has four equal sides."}],"Solution":{"Idea":{"Ar":"نحسب المحيط المشترك ثم نقسمه على أربعة.","En":"Find the common perimeter and divide by four."},"FormulaLatex":"s=2(l+w)/4","Steps":[{"Ar":"$2\\cdot14=28$","En":"$2\\cdot14=28$"},{"Ar":"$28/4=7$","En":"$28/4=7$"}],"Substitution":{"Ar":"$2(9+5)/4$","En":"$2(9+5)/4$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$4\\cdot7=2(9+5)$","En":"$4\\cdot7=2(9+5)$"},"CommonError":{"Ar":"هذا نصف المحيط.","En":"This is half the perimeter."}}}$mw$::jsonb,$mw$نحسب المحيط المشترك ثم نقسمه على أربعة.

$s=2(l+w)/4$

1. $2\cdot14=28$

2. $28/4=7$

$2(9+5)/4$

$7$ سم

$4\cdot7=2(9+5)$

هذا نصف المحيط.$mw$,$mw$Find the common perimeter and divide by four.

$s=2(l+w)/4$

1. $2\cdot14=28$

2. $28/4=7$

$2(9+5)/4$

$7$ cm

$4\cdot7=2(9+5)$

This is half the perimeter.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اجمع الطول والعرض واضرب في 2.","En":"Add length and width and double."},{"Ar":"للمربع أربعة أضلاع متساوية.","En":"A square has four equal sides."}],"Solution":{"Idea":{"Ar":"نحسب المحيط المشترك ثم نقسمه على أربعة.","En":"Find the common perimeter and divide by four."},"FormulaLatex":"s=2(l+w)/4","Steps":[{"Ar":"$2\\cdot14=28$","En":"$2\\cdot14=28$"},{"Ar":"$28/4=7$","En":"$28/4=7$"}],"Substitution":{"Ar":"$2(9+5)/4$","En":"$2(9+5)/4$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$4\\cdot7=2(9+5)$","En":"$4\\cdot7=2(9+5)$"},"CommonError":{"Ar":"هذا نصف المحيط.","En":"This is half the perimeter."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عرض المستطيل.","En":"This is the rectangle width."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا نصف المحيط.","En":"This is half the perimeter."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا المحيط الكلي.","En":"This is the full perimeter."},"Order":4}]}$mw$),
($mw$growth-v55-grade-3-rectangle-area-equal-rows-two-possible-layouts-1$mw$,$mw$rectangle-area-equal-rows-two-possible-layouts$mw$,$mw$primary-rectangle-area$mw$,$mw$grade-3$mw$,3,1,3,13,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":13,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مساحة واحدة لترتيبين","En":"Same area in two layouts"},"Question":{"Ar":"تغطي 24 بلاطة مربعة متساوية مستطيلاً من 4 صفوف. إذا رُتبت البلاطات نفسها في 3 صفوف دون فراغات أو تداخل، فكم بلاطة في الصف الواحد؟","En":"Twenty-four equal square tiles cover a rectangle in four rows. If the same tiles are rearranged into three rows without gaps or overlap, how many tiles are in each row?"},"Options":[{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد البلاطات في الصف القديم.","En":"This is the old row size."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يعطي 24 بلاطة في ثلاثة صفوف.","En":"Does not give twenty-four tiles in three rows."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 36 بلاطة في ثلاثة صفوف.","En":"Gives thirty-six tiles in three rows."}}],"Hints":[{"Ar":"عدد البلاطات لا يتغير.","En":"The tile count remains unchanged."},{"Ar":"اقسم 24 على 3.","En":"Divide twenty-four by three."}],"Solution":{"Idea":{"Ar":"المساحة بعدد البلاطات لا تتغير؛ نقسم العدد على الصفوف الجديدة.","En":"Area in tile units stays fixed; divide by the new row count."},"FormulaLatex":"24/3","Steps":[{"Ar":"$24/3=8$","En":"$24/3=8$"}],"Substitution":{"Ar":"$24/3$","En":"$24/3$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot8=24$","En":"$3\\cdot8=24$"},"CommonError":{"Ar":"هذا عدد البلاطات في الصف القديم.","En":"This is the old row size."}}}$mw$::jsonb,$mw$المساحة بعدد البلاطات لا تتغير؛ نقسم العدد على الصفوف الجديدة.

$24/3$

1. $24/3=8$

$24/3$

$8$

$3\cdot8=24$

هذا عدد البلاطات في الصف القديم.$mw$,$mw$Area in tile units stays fixed; divide by the new row count.

$24/3$

1. $24/3=8$

$24/3$

$8$

$3\cdot8=24$

This is the old row size.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عدد البلاطات لا يتغير.","En":"The tile count remains unchanged."},{"Ar":"اقسم 24 على 3.","En":"Divide twenty-four by three."}],"Solution":{"Idea":{"Ar":"المساحة بعدد البلاطات لا تتغير؛ نقسم العدد على الصفوف الجديدة.","En":"Area in tile units stays fixed; divide by the new row count."},"FormulaLatex":"24/3","Steps":[{"Ar":"$24/3=8$","En":"$24/3=8$"}],"Substitution":{"Ar":"$24/3$","En":"$24/3$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot8=24$","En":"$3\\cdot8=24$"},"CommonError":{"Ar":"هذا عدد البلاطات في الصف القديم.","En":"This is the old row size."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد البلاطات في الصف القديم.","En":"This is the old row size."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يعطي 24 بلاطة في ثلاثة صفوف.","En":"Does not give twenty-four tiles in three rows."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 36 بلاطة في ثلاثة صفوف.","En":"Gives thirty-six tiles in three rows."},"Order":4}]}$mw$),
($mw$growth-v55-grade-3-perimeter-missing-edge-rectangle-partial-fence-1$mw$,$mw$perimeter-missing-edge-rectangle-partial-fence$mw$,$mw$primary-perimeter$mw$,$mw$grade-3$mw$,3,1,3,12,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":12,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"طول سياج ناقص","En":"Missing fence length"},"Question":{"Ar":"حديقة مستطيلة محيطها 32 م. غُطي 11 م من حدودها بسياج، ثم 9 م أخرى دون تداخل. كم متراً من الحدود بقي بلا سياج؟","En":"A rectangular garden has perimeter 32 m. Eleven metres of its boundary are fenced, then nine further metres without overlap. How many metres of boundary remain unfenced?"},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الجزء المسيج.","En":"This is the fenced total."}},{"LatexCode":"21","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 11 فقط.","En":"Subtracts only eleven."}},{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 9 فقط.","En":"Subtracts only nine."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اجمع الجزأين المغطيين.","En":"Add the two covered lengths."},{"Ar":"اطرحهما من المحيط.","En":"Subtract from the perimeter."}],"Solution":{"Idea":{"Ar":"نطرح مجموع أطوال السياج من المحيط.","En":"Subtract total fenced length from the perimeter."},"FormulaLatex":"32-(11+9)","Steps":[{"Ar":"$11+9=20$","En":"$11+9=20$"},{"Ar":"$32-20=12$","En":"$32-20=12$"}],"Substitution":{"Ar":"$32-20$","En":"$32-20$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"$20+12=32$","En":"$20+12=32$"},"CommonError":{"Ar":"هذا مجموع الجزء المسيج.","En":"This is the fenced total."}}}$mw$::jsonb,$mw$نطرح مجموع أطوال السياج من المحيط.

$32-(11+9)$

1. $11+9=20$

2. $32-20=12$

$32-20$

$12$ م

$20+12=32$

هذا مجموع الجزء المسيج.$mw$,$mw$Subtract total fenced length from the perimeter.

$32-(11+9)$

1. $11+9=20$

2. $32-20=12$

$32-20$

$12$ m

$20+12=32$

This is the fenced total.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اجمع الجزأين المغطيين.","En":"Add the two covered lengths."},{"Ar":"اطرحهما من المحيط.","En":"Subtract from the perimeter."}],"Solution":{"Idea":{"Ar":"نطرح مجموع أطوال السياج من المحيط.","En":"Subtract total fenced length from the perimeter."},"FormulaLatex":"32-(11+9)","Steps":[{"Ar":"$11+9=20$","En":"$11+9=20$"},{"Ar":"$32-20=12$","En":"$32-20=12$"}],"Substitution":{"Ar":"$32-20$","En":"$32-20$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"$20+12=32$","En":"$20+12=32$"},"CommonError":{"Ar":"هذا مجموع الجزء المسيج.","En":"This is the fenced total."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الجزء المسيج.","En":"This is the fenced total."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 11 فقط.","En":"Subtracts only eleven."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح 9 فقط.","En":"Subtracts only nine."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v55-grade-11-log-equation-two-terms-positive-domain-1$mw$,$mw$log-equation-two-terms-positive-domain$mw$,$mw$logarithm-inverse-and-equations$mw$,$mw$grade-11$mw$,11,3,86,313,$mw${"StageId":3,"CategoryId":86,"PrimarySkillId":313,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة لوغاريتمية وشرط المجال","En":"Logarithmic equation and domain"},"Question":{"Ar":"حل $\\log_2(x)+\\log_2(x-2)=3$ في الأعداد الحقيقية.","En":"Solve $\\log_2(x)+\\log_2(x-2)=3$ over the reals."},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين حاصل الضرب وقيمة x.","En":"Confuses the product with x."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جذر للمعادلة الجبرية خارج مجال اللوغاريتم.","En":"Algebraic root outside the log domain."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يجعل حجة اللوغاريتم الثاني صفراً.","En":"Makes the second logarithm's argument zero."}}],"Hints":[{"Ar":"حدد مجال كل لوغاريتم أولاً.","En":"Find both logarithm domains first."},{"Ar":"حول مجموع اللوغاريتمات إلى لوغاريتم حاصل ضرب.","En":"Convert the sum to the log of a product."}],"Solution":{"Idea":{"Ar":"نجمع اللوغاريتمين بقانون الضرب ثم نستبعد الحل خارج المجال x>2.","En":"Combine logarithms using the product rule, then reject roots outside x>2."},"FormulaLatex":"x(x-2)=2^3","Steps":[{"Ar":"$(x-4)(x+2)=0$","En":"$(x-4)(x+2)=0$"},{"Ar":"$x=4\\ \\text{or}\\ x=-2$","En":"$x=4\\ \\text{or}\\ x=-2$"},{"Ar":"$x>2\\Rightarrow x=4$","En":"$x>2\\Rightarrow x=4$"}],"Substitution":{"Ar":"$x^2-2x-8=0$","En":"$x^2-2x-8=0$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\log_2 4+\\log_2 2=2+1=3$","En":"$\\log_2 4+\\log_2 2=2+1=3$"},"CommonError":{"Ar":"جذر للمعادلة الجبرية خارج مجال اللوغاريتم.","En":"Algebraic root outside the log domain."}}}$mw$::jsonb,$mw$نجمع اللوغاريتمين بقانون الضرب ثم نستبعد الحل خارج المجال x>2.

$x(x-2)=2^3$

1. $(x-4)(x+2)=0$

2. $x=4\ \text{or}\ x=-2$

3. $x>2\Rightarrow x=4$

$x^2-2x-8=0$

$4$

$\log_2 4+\log_2 2=2+1=3$

جذر للمعادلة الجبرية خارج مجال اللوغاريتم.$mw$,$mw$Combine logarithms using the product rule, then reject roots outside x>2.

$x(x-2)=2^3$

1. $(x-4)(x+2)=0$

2. $x=4\ \text{or}\ x=-2$

3. $x>2\Rightarrow x=4$

$x^2-2x-8=0$

$4$

$\log_2 4+\log_2 2=2+1=3$

Algebraic root outside the log domain.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد مجال كل لوغاريتم أولاً.","En":"Find both logarithm domains first."},{"Ar":"حول مجموع اللوغاريتمات إلى لوغاريتم حاصل ضرب.","En":"Convert the sum to the log of a product."}],"Solution":{"Idea":{"Ar":"نجمع اللوغاريتمين بقانون الضرب ثم نستبعد الحل خارج المجال x>2.","En":"Combine logarithms using the product rule, then reject roots outside x>2."},"FormulaLatex":"x(x-2)=2^3","Steps":[{"Ar":"$(x-4)(x+2)=0$","En":"$(x-4)(x+2)=0$"},{"Ar":"$x=4\\ \\text{or}\\ x=-2$","En":"$x=4\\ \\text{or}\\ x=-2$"},{"Ar":"$x>2\\Rightarrow x=4$","En":"$x>2\\Rightarrow x=4$"}],"Substitution":{"Ar":"$x^2-2x-8=0$","En":"$x^2-2x-8=0$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\log_2 4+\\log_2 2=2+1=3$","En":"$\\log_2 4+\\log_2 2=2+1=3$"},"CommonError":{"Ar":"جذر للمعادلة الجبرية خارج مجال اللوغاريتم.","En":"Algebraic root outside the log domain."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خلط بين حاصل الضرب وقيمة x.","En":"Confuses the product with x."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جذر للمعادلة الجبرية خارج مجال اللوغاريتم.","En":"Algebraic root outside the log domain."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يجعل حجة اللوغاريتم الثاني صفراً.","En":"Makes the second logarithm's argument zero."},"Order":4}]}$mw$),
($mw$growth-v55-grade-11-exponential-model-initial-value-and-two-period-factor-1$mw$,$mw$exponential-model-initial-value-and-two-period-factor$mw$,$mw$model-interpretation$mw$,$mw$grade-11$mw$,11,3,86,316,$mw${"StageId":3,"CategoryId":86,"PrimarySkillId":316,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تفسير عامل نمو مركب","En":"Interpreting a compound growth factor"},"Question":{"Ar":"في النموذج $N(t)=500(1.1)^{2t}$، حيث t بالسنوات، ما عامل النمو خلال سنة واحدة؟","En":"In $N(t)=500(1.1)^{2t}$, where t is in years, what is the growth factor over one year?"},"Options":[{"LatexCode":"1.21","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1.1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عامل نمو نصف سنة.","En":"This is the half-year growth factor."}},{"LatexCode":"1.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع زيادتين دون تركيب.","En":"Adds two growth increments without compounding."}},{"LatexCode":"2.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف عامل النمو بدلاً من تربيعه.","En":"Doubles the factor instead of squaring it."}}],"Hints":[{"Ar":"احسب فرق الأس بين t وt+1.","En":"Find the exponent change from t to t+1."},{"Ar":"ربع عامل النمو الأساسي.","En":"Square the base growth factor."}],"Solution":{"Idea":{"Ar":"في السنة الواحدة يزيد الأس بمقدار 2.","En":"The exponent increases by two over one year."},"FormulaLatex":"N(t+1)/N(t)=(1.1)^2","Steps":[{"Ar":"$1.1\\cdot1.1=1.21$","En":"$1.1\\cdot1.1=1.21$"}],"Substitution":{"Ar":"$1.1\\cdot1.1$","En":"$1.1\\cdot1.1$"},"Result":{"Ar":"$1.21$","En":"$1.21$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$N(1)/N(0)=605/500=1.21$","En":"$N(1)/N(0)=605/500=1.21$"},"CommonError":{"Ar":"هذا عامل نمو نصف سنة.","En":"This is the half-year growth factor."}}}$mw$::jsonb,$mw$في السنة الواحدة يزيد الأس بمقدار 2.

$N(t+1)/N(t)=(1.1)^2$

1. $1.1\cdot1.1=1.21$

$1.1\cdot1.1$

$1.21$

$N(1)/N(0)=605/500=1.21$

هذا عامل نمو نصف سنة.$mw$,$mw$The exponent increases by two over one year.

$N(t+1)/N(t)=(1.1)^2$

1. $1.1\cdot1.1=1.21$

$1.1\cdot1.1$

$1.21$

$N(1)/N(0)=605/500=1.21$

This is the half-year growth factor.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب فرق الأس بين t وt+1.","En":"Find the exponent change from t to t+1."},{"Ar":"ربع عامل النمو الأساسي.","En":"Square the base growth factor."}],"Solution":{"Idea":{"Ar":"في السنة الواحدة يزيد الأس بمقدار 2.","En":"The exponent increases by two over one year."},"FormulaLatex":"N(t+1)/N(t)=(1.1)^2","Steps":[{"Ar":"$1.1\\cdot1.1=1.21$","En":"$1.1\\cdot1.1=1.21$"}],"Substitution":{"Ar":"$1.1\\cdot1.1$","En":"$1.1\\cdot1.1$"},"Result":{"Ar":"$1.21$","En":"$1.21$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$N(1)/N(0)=605/500=1.21$","En":"$N(1)/N(0)=605/500=1.21$"},"CommonError":{"Ar":"هذا عامل نمو نصف سنة.","En":"This is the half-year growth factor."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عامل نمو نصف سنة.","En":"This is the half-year growth factor."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع زيادتين دون تركيب.","En":"Adds two growth increments without compounding."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف عامل النمو بدلاً من تربيعه.","En":"Doubles the factor instead of squaring it."},"Order":4}]}$mw$),
($mw$growth-v55-grade-12-finite-geometric-series-sum-three-terms-infer-first-1$mw$,$mw$finite-geometric-series-sum-three-terms-infer-first$mw$,$mw$s-sequences-series-series-sums$mw$,$mw$grade-12$mw$,12,3,23,101,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":101,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع الحد الأول من مجموع","En":"First term from a sum"},"Question":{"Ar":"متتالية هندسية نسبتها 2 ومجموع حدودها الثلاثة الأولى 35. ما حدها الأول؟","En":"A geometric sequence has ratio two and sum of its first three terms 35. Find its first term."},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على خمسة بدلاً من سبعة.","En":"Divides by five instead of seven."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الحد الثاني.","En":"This is the second term."}},{"LatexCode":"35/3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض تساوي الحدود الثلاثة.","En":"Assumes the three terms are equal."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب الحد الثاني والثالث بدلالة a.","En":"Express the next two terms in a."},{"Ar":"اجمع المعاملات واقسم 35 عليها.","En":"Add the coefficients and divide thirty-five by their sum."}],"Solution":{"Idea":{"Ar":"نعبر عن الحدود الثلاثة بدلالة الحد الأول.","En":"Express the three terms using the first term."},"FormulaLatex":"a+2a+4a=35","Steps":[{"Ar":"$a(1+2+4)=35$","En":"$a(1+2+4)=35$"},{"Ar":"$a=5$","En":"$a=5$"}],"Substitution":{"Ar":"$7a=35$","En":"$7a=35$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+10+20=35$","En":"$5+10+20=35$"},"CommonError":{"Ar":"قسم على خمسة بدلاً من سبعة.","En":"Divides by five instead of seven."}}}$mw$::jsonb,$mw$نعبر عن الحدود الثلاثة بدلالة الحد الأول.

$a+2a+4a=35$

1. $a(1+2+4)=35$

2. $a=5$

$7a=35$

$5$

$5+10+20=35$

قسم على خمسة بدلاً من سبعة.$mw$,$mw$Express the three terms using the first term.

$a+2a+4a=35$

1. $a(1+2+4)=35$

2. $a=5$

$7a=35$

$5$

$5+10+20=35$

Divides by five instead of seven.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الحد الثاني والثالث بدلالة a.","En":"Express the next two terms in a."},{"Ar":"اجمع المعاملات واقسم 35 عليها.","En":"Add the coefficients and divide thirty-five by their sum."}],"Solution":{"Idea":{"Ar":"نعبر عن الحدود الثلاثة بدلالة الحد الأول.","En":"Express the three terms using the first term."},"FormulaLatex":"a+2a+4a=35","Steps":[{"Ar":"$a(1+2+4)=35$","En":"$a(1+2+4)=35$"},{"Ar":"$a=5$","En":"$a=5$"}],"Substitution":{"Ar":"$7a=35$","En":"$7a=35$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+10+20=35$","En":"$5+10+20=35$"},"CommonError":{"Ar":"قسم على خمسة بدلاً من سبعة.","En":"Divides by five instead of seven."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم على خمسة بدلاً من سبعة.","En":"Divides by five instead of seven."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا الحد الثاني.","En":"This is the second term."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"افترض تساوي الحدود الثلاثة.","En":"Assumes the three terms are equal."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v55-grade-12-geometric-series-tail-after-removed-prefix-1$mw$,$mw$geometric-series-tail-after-removed-prefix$mw$,$mw$s-sequences-series-series-convergence$mw$,$mw$grade-12$mw$,12,3,23,113,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":113,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع ذيل سلسلة هندسية","En":"Geometric series tail sum"},"Question":{"Ar":"سلسلة هندسية لا نهائية حدها الأول 24 ونسبتها 1/3. ما مجموع الحدود ابتداءً من الحد الثالث؟","En":"An infinite geometric series has first term twenty-four and ratio one third. Find the sum starting at its third term."},"Options":[{"LatexCode":"8/3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الحد الثالث وحده.","En":"This is just the third term."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الذيل ابتداءً من الحد الثاني.","En":"This is the tail starting at term two."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع السلسلة كلها.","En":"This is the full series sum."}}],"Hints":[{"Ar":"احسب الحد الثالث.","En":"Calculate term three."},{"Ar":"اقسمه على واحد ناقص النسبة.","En":"Divide it by one minus the ratio."}],"Solution":{"Idea":{"Ar":"نحسب الحد الثالث ثم نطبق قانون مجموع السلسلة على الذيل.","En":"Find the third term and apply the geometric sum formula to the tail."},"FormulaLatex":"S=ar^2/(1-r)","Steps":[{"Ar":"$a_3=24/9=8/3$","En":"$a_3=24/9=8/3$"},{"Ar":"$S=(8/3)/(2/3)=4$","En":"$S=(8/3)/(2/3)=4$"}],"Substitution":{"Ar":"$24(1/3)^2/(1-1/3)$","En":"$24(1/3)^2/(1-1/3)$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24/(1-1/3)-24-8=4$","En":"$24/(1-1/3)-24-8=4$"},"CommonError":{"Ar":"هذا مجموع الذيل ابتداءً من الحد الثاني.","En":"This is the tail starting at term two."}}}$mw$::jsonb,$mw$نحسب الحد الثالث ثم نطبق قانون مجموع السلسلة على الذيل.

$S=ar^2/(1-r)$

1. $a_3=24/9=8/3$

2. $S=(8/3)/(2/3)=4$

$24(1/3)^2/(1-1/3)$

$4$

$24/(1-1/3)-24-8=4$

هذا مجموع الذيل ابتداءً من الحد الثاني.$mw$,$mw$Find the third term and apply the geometric sum formula to the tail.

$S=ar^2/(1-r)$

1. $a_3=24/9=8/3$

2. $S=(8/3)/(2/3)=4$

$24(1/3)^2/(1-1/3)$

$4$

$24/(1-1/3)-24-8=4$

This is the tail starting at term two.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الحد الثالث.","En":"Calculate term three."},{"Ar":"اقسمه على واحد ناقص النسبة.","En":"Divide it by one minus the ratio."}],"Solution":{"Idea":{"Ar":"نحسب الحد الثالث ثم نطبق قانون مجموع السلسلة على الذيل.","En":"Find the third term and apply the geometric sum formula to the tail."},"FormulaLatex":"S=ar^2/(1-r)","Steps":[{"Ar":"$a_3=24/9=8/3$","En":"$a_3=24/9=8/3$"},{"Ar":"$S=(8/3)/(2/3)=4$","En":"$S=(8/3)/(2/3)=4$"}],"Substitution":{"Ar":"$24(1/3)^2/(1-1/3)$","En":"$24(1/3)^2/(1-1/3)$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24/(1-1/3)-24-8=4$","En":"$24/(1-1/3)-24-8=4$"},"CommonError":{"Ar":"هذا مجموع الذيل ابتداءً من الحد الثاني.","En":"This is the tail starting at term two."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا الحد الثالث وحده.","En":"This is just the third term."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الذيل ابتداءً من الحد الثاني.","En":"This is the tail starting at term two."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع السلسلة كلها.","En":"This is the full series sum."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v55 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
