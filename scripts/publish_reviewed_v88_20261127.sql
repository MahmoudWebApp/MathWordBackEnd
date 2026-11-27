-- One-time owner-authorized v88 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v88-grade-4-equation-repeated-subtraction-interpretation-1$mw$,$mw$equation-repeated-subtraction-interpretation$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تفسير الطرح المتكرر","En":"Interpreting repeated subtraction"},"Question":{"Ar":"لحل $6x=48$ يبدأ طالب من 48 ويطرح 6 في كل خطوة حتى يصل إلى صفر. ماذا يمثل عدد خطوات الطرح؟ A: قيمة x؛ B: معامل x؛ C: حاصل الضرب 48؛ D: باقي القسمة.","En":"To solve $6x=48$, a pupil starts at 48 and subtracts 6 in each step until reaching zero. What does the number of subtraction steps represent? A: the value of x; B: the coefficient of x; C: the product 48; D: the remainder."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المعامل 6 هو مقدار الطرح في كل خطوة، وليس عدد الخطوات.","En":"The coefficient 6 is the amount subtracted per step, not the step count."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"48 هو المجموع الابتدائي لا عدد الخطوات.","En":"48 is the starting total, not the step count."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الباقي صفر؛ عدد الخطوات يمثل خارج القسمة.","En":"The remainder is zero; the step count is the quotient."}}],"Hints":[{"Ar":"كل خطوة تزيل مجموعة من ستة.","En":"Each step removes one group of six."},{"Ar":"عدد المجموعات هو العامل المجهول.","En":"The number of groups is the unknown factor."}],"Solution":{"Idea":{"Ar":"الطرح المتكرر لمجموعات متساوية يمثل القسمة.","En":"Repeated subtraction of equal groups represents division."},"FormulaLatex":"x=48\\div6","Steps":[{"Ar":"نزيل مجموعة من ستة في كل خطوة.","En":"Remove a group of six each step."},{"Ar":"بعد ثماني خطوات نصل إلى صفر، فيمثل عدد الخطوات قيمة x.","En":"After eight steps we reach zero, so the count represents x."}],"Substitution":{"Ar":"$48\\div6=8$","En":"$48\\div6=8$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثماني مجموعات من ستة تعطي 48.","En":"Eight groups of six make 48."},"CommonError":{"Ar":"الخلط بين خارج القسمة وباقيها.","En":"Confusing the quotient with the remainder."}}}$mw$::jsonb,$mw$الطرح المتكرر لمجموعات متساوية يمثل القسمة.

$x=48\div6$

1. نزيل مجموعة من ستة في كل خطوة.

2. بعد ثماني خطوات نصل إلى صفر، فيمثل عدد الخطوات قيمة x.

$48\div6=8$

$A$

ثماني مجموعات من ستة تعطي 48.

الخلط بين خارج القسمة وباقيها.$mw$,$mw$Repeated subtraction of equal groups represents division.

$x=48\div6$

1. Remove a group of six each step.

2. After eight steps we reach zero, so the count represents x.

$48\div6=8$

$A$

Eight groups of six make 48.

Confusing the quotient with the remainder.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كل خطوة تزيل مجموعة من ستة.","En":"Each step removes one group of six."},{"Ar":"عدد المجموعات هو العامل المجهول.","En":"The number of groups is the unknown factor."}],"Solution":{"Idea":{"Ar":"الطرح المتكرر لمجموعات متساوية يمثل القسمة.","En":"Repeated subtraction of equal groups represents division."},"FormulaLatex":"x=48\\div6","Steps":[{"Ar":"نزيل مجموعة من ستة في كل خطوة.","En":"Remove a group of six each step."},{"Ar":"بعد ثماني خطوات نصل إلى صفر، فيمثل عدد الخطوات قيمة x.","En":"After eight steps we reach zero, so the count represents x."}],"Substitution":{"Ar":"$48\\div6=8$","En":"$48\\div6=8$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثماني مجموعات من ستة تعطي 48.","En":"Eight groups of six make 48."},"CommonError":{"Ar":"الخلط بين خارج القسمة وباقيها.","En":"Confusing the quotient with the remainder."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المعامل 6 هو مقدار الطرح في كل خطوة، وليس عدد الخطوات.","En":"The coefficient 6 is the amount subtracted per step, not the step count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"48 هو المجموع الابتدائي لا عدد الخطوات.","En":"48 is the starting total, not the step count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الباقي صفر؛ عدد الخطوات يمثل خارج القسمة.","En":"The remainder is zero; the step count is the quotient."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-parentheses-before-multiply-1$mw$,$mw$substitution-parentheses-before-multiply$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التعويض داخل الأقواس","En":"Substituting inside parentheses"},"Question":{"Ar":"إذا كان $x=6$، فما قيمة $4(x+3)$؟","En":"If $x=6$, what is the value of $4(x+3)$?"},"Options":[{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"27 ينتج من ضرب x وحده ثم إضافة 3.","En":"27 multiplies x alone before adding 3."}},{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"24 يهمل العدد 3 داخل القوس.","En":"24 ignores the 3 inside the parentheses."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"13 يجمع الأعداد دون الضرب.","En":"13 adds the numbers instead of multiplying."}}],"Hints":[{"Ar":"استبدل x بالعدد 6.","En":"Replace x with 6."},{"Ar":"احسب ما داخل القوس أولاً.","En":"Evaluate the parentheses first."}],"Solution":{"Idea":{"Ar":"الأقواس لها الأولوية بعد التعويض.","En":"Parentheses take priority after substitution."},"FormulaLatex":"4(x+3)","Steps":[{"Ar":"نعوض فنحصل على 4 مضروبة في مجموع 6 و3.","En":"Substitute to get four times the sum of six and three."},{"Ar":"داخل القوس 9، فنضربه في 4.","En":"The parentheses give 9, multiplied by 4."}],"Substitution":{"Ar":"$4(6+3)=4\\times9$","En":"$4(6+3)=4\\times9$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالتوزيع 24 مع 12 يساوي 36.","En":"Distribution gives 24 plus 12, or 36."},"CommonError":{"Ar":"ضرب الحد الأول فقط داخل القوس.","En":"Multiplying only the first term inside parentheses."}}}$mw$::jsonb,$mw$الأقواس لها الأولوية بعد التعويض.

$4(x+3)$

1. نعوض فنحصل على 4 مضروبة في مجموع 6 و3.

2. داخل القوس 9، فنضربه في 4.

$4(6+3)=4\times9$

$36$

بالتوزيع 24 مع 12 يساوي 36.

ضرب الحد الأول فقط داخل القوس.$mw$,$mw$Parentheses take priority after substitution.

$4(x+3)$

1. Substitute to get four times the sum of six and three.

2. The parentheses give 9, multiplied by 4.

$4(6+3)=4\times9$

$36$

Distribution gives 24 plus 12, or 36.

Multiplying only the first term inside parentheses.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبدل x بالعدد 6.","En":"Replace x with 6."},{"Ar":"احسب ما داخل القوس أولاً.","En":"Evaluate the parentheses first."}],"Solution":{"Idea":{"Ar":"الأقواس لها الأولوية بعد التعويض.","En":"Parentheses take priority after substitution."},"FormulaLatex":"4(x+3)","Steps":[{"Ar":"نعوض فنحصل على 4 مضروبة في مجموع 6 و3.","En":"Substitute to get four times the sum of six and three."},{"Ar":"داخل القوس 9، فنضربه في 4.","En":"The parentheses give 9, multiplied by 4."}],"Substitution":{"Ar":"$4(6+3)=4\\times9$","En":"$4(6+3)=4\\times9$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالتوزيع 24 مع 12 يساوي 36.","En":"Distribution gives 24 plus 12, or 36."},"CommonError":{"Ar":"ضرب الحد الأول فقط داخل القوس.","En":"Multiplying only the first term inside parentheses."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"27 ينتج من ضرب x وحده ثم إضافة 3.","En":"27 multiplies x alone before adding 3."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"24 يهمل العدد 3 داخل القوس.","En":"24 ignores the 3 inside the parentheses."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"13 يجمع الأعداد دون الضرب.","En":"13 adds the numbers instead of multiplying."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-two-variables-product-1$mw$,$mw$substitution-two-variables-product$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التعويض بمتغيرين","En":"Substitution with two variables"},"Question":{"Ar":"إذا كان $a=4$ و$b=7$، فما قيمة $ab+2a$؟","En":"If $a=4$ and $b=7$, what is the value of $ab+2a$?"},"Options":[{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"30 تضيف 2 فقط بدلاً من 2a.","En":"30 adds only 2 instead of 2a."}},{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"22 ينتج من مضاعفة مجموع a وb بدلاً من حساب حاصل الضرب ab ثم إضافة 2a.","En":"22 doubles the sum of a and b instead of computing ab and adding 2a."}},{"LatexCode":"42","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"42 ينتج من إضافة 2b بدلاً من 2a.","En":"42 adds 2b instead of 2a."}}],"Hints":[{"Ar":"عوّض كل ظهور لـ a بالعدد 4.","En":"Replace every a with 4."},{"Ar":"احسب حاصلَي الضرب قبل الجمع.","En":"Compute both products before adding."}],"Solution":{"Idea":{"Ar":"نستبدل كل متغير بقيمته أينما ظهر.","En":"Replace each variable with its value wherever it occurs."},"FormulaLatex":"ab+2a","Steps":[{"Ar":"حاصل ضرب a وb يساوي 28.","En":"The product ab is 28."},{"Ar":"حاصل ضرب 2 وa يساوي 8، فنجمعهما.","En":"The product 2a is 8; add both."}],"Substitution":{"Ar":"$4\\times7+2\\times4=28+8$","En":"$4\\times7+2\\times4=28+8$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بإخراج a عاملاً مشتركاً نحصل على 4 في 9 أي 36.","En":"Factoring a gives four times nine, or 36."},"CommonError":{"Ar":"استبدال المتغير الأول بقيمة الثاني في الحد المتكرر.","En":"Using the second variable's value for the repeated first variable."}}}$mw$::jsonb,$mw$نستبدل كل متغير بقيمته أينما ظهر.

$ab+2a$

1. حاصل ضرب a وb يساوي 28.

2. حاصل ضرب 2 وa يساوي 8، فنجمعهما.

$4\times7+2\times4=28+8$

$36$

بإخراج a عاملاً مشتركاً نحصل على 4 في 9 أي 36.

استبدال المتغير الأول بقيمة الثاني في الحد المتكرر.$mw$,$mw$Replace each variable with its value wherever it occurs.

$ab+2a$

1. The product ab is 28.

2. The product 2a is 8; add both.

$4\times7+2\times4=28+8$

$36$

Factoring a gives four times nine, or 36.

Using the second variable's value for the repeated first variable.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض كل ظهور لـ a بالعدد 4.","En":"Replace every a with 4."},{"Ar":"احسب حاصلَي الضرب قبل الجمع.","En":"Compute both products before adding."}],"Solution":{"Idea":{"Ar":"نستبدل كل متغير بقيمته أينما ظهر.","En":"Replace each variable with its value wherever it occurs."},"FormulaLatex":"ab+2a","Steps":[{"Ar":"حاصل ضرب a وb يساوي 28.","En":"The product ab is 28."},{"Ar":"حاصل ضرب 2 وa يساوي 8، فنجمعهما.","En":"The product 2a is 8; add both."}],"Substitution":{"Ar":"$4\\times7+2\\times4=28+8$","En":"$4\\times7+2\\times4=28+8$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بإخراج a عاملاً مشتركاً نحصل على 4 في 9 أي 36.","En":"Factoring a gives four times nine, or 36."},"CommonError":{"Ar":"استبدال المتغير الأول بقيمة الثاني في الحد المتكرر.","En":"Using the second variable's value for the repeated first variable."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"30 تضيف 2 فقط بدلاً من 2a.","En":"30 adds only 2 instead of 2a."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"22 ينتج من مضاعفة مجموع a وb بدلاً من حساب حاصل الضرب ab ثم إضافة 2a.","En":"22 doubles the sum of a and b instead of computing ab and adding 2a."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"42 ينتج من إضافة 2b بدلاً من 2a.","En":"42 adds 2b instead of 2a."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-square-vs-double-1$mw$,$mw$substitution-square-vs-double$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التربيع والمضاعفة","En":"Squaring versus doubling"},"Question":{"Ar":"إذا كان $n=5$، فما قيمة $n^2+2n$؟","En":"If $n=5$, what is the value of $n^2+2n$?"},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 يعامل التربيع على أنه مضاعفة.","En":"20 treats squaring as doubling."}},{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"27 يضيف 2 فقط إلى مربع العدد.","En":"27 adds only 2 to the square."}},{"LatexCode":"35","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"50 يضاعف مربع العدد بدلاً من إضافة ضعفه.","En":"50 doubles the square rather than adding twice the number."}}],"Hints":[{"Ar":"التربيع يعني ضرب العدد في نفسه.","En":"Squaring means multiplying the number by itself."},{"Ar":"احسب مربع 5 ثم ضعف 5 واجمعهما.","En":"Find the square and twice five, then add."}],"Solution":{"Idea":{"Ar":"نحسب الأس ثم الضرب ثم الجمع.","En":"Evaluate powers, then multiplication, then addition."},"FormulaLatex":"n^2+2n","Steps":[{"Ar":"مربع 5 يساوي 25.","En":"Five squared equals 25."},{"Ar":"ضعف 5 يساوي 10، فنضيفه إلى 25.","En":"Twice five is 10; add it to 25."}],"Substitution":{"Ar":"$5^2+2\\times5=25+10$","En":"$5^2+2\\times5=25+10$"},"Result":{"Ar":"$35$","En":"$35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"5 في 7 يساوي 35، وهو حاصل تحليل التعبير إلى n(n+2).","En":"Five times seven is 35, matching n(n+2)."},"CommonError":{"Ar":"قراءة الأس 2 على أنه ضرب في 2.","En":"Reading exponent 2 as multiplication by 2."}}}$mw$::jsonb,$mw$نحسب الأس ثم الضرب ثم الجمع.

$n^2+2n$

1. مربع 5 يساوي 25.

2. ضعف 5 يساوي 10، فنضيفه إلى 25.

$5^2+2\times5=25+10$

$35$

5 في 7 يساوي 35، وهو حاصل تحليل التعبير إلى n(n+2).

قراءة الأس 2 على أنه ضرب في 2.$mw$,$mw$Evaluate powers, then multiplication, then addition.

$n^2+2n$

1. Five squared equals 25.

2. Twice five is 10; add it to 25.

$5^2+2\times5=25+10$

$35$

Five times seven is 35, matching n(n+2).

Reading exponent 2 as multiplication by 2.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"التربيع يعني ضرب العدد في نفسه.","En":"Squaring means multiplying the number by itself."},{"Ar":"احسب مربع 5 ثم ضعف 5 واجمعهما.","En":"Find the square and twice five, then add."}],"Solution":{"Idea":{"Ar":"نحسب الأس ثم الضرب ثم الجمع.","En":"Evaluate powers, then multiplication, then addition."},"FormulaLatex":"n^2+2n","Steps":[{"Ar":"مربع 5 يساوي 25.","En":"Five squared equals 25."},{"Ar":"ضعف 5 يساوي 10، فنضيفه إلى 25.","En":"Twice five is 10; add it to 25."}],"Substitution":{"Ar":"$5^2+2\\times5=25+10$","En":"$5^2+2\\times5=25+10$"},"Result":{"Ar":"$35$","En":"$35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"5 في 7 يساوي 35، وهو حاصل تحليل التعبير إلى n(n+2).","En":"Five times seven is 35, matching n(n+2)."},"CommonError":{"Ar":"قراءة الأس 2 على أنه ضرب في 2.","En":"Reading exponent 2 as multiplication by 2."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"20 يعامل التربيع على أنه مضاعفة.","En":"20 treats squaring as doubling."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"27 يضيف 2 فقط إلى مربع العدد.","En":"27 adds only 2 to the square."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"50 يضاعف مربع العدد بدلاً من إضافة ضعفه.","En":"50 doubles the square rather than adding twice the number."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-division-whole-numerator-1$mw$,$mw$substitution-division-whole-numerator$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التعويض في البسط","En":"Substitution in a numerator"},"Question":{"Ar":"إذا كان $m=10$، فما قيمة $\\frac{m+8}{3}$؟","En":"If $m=10$, what is the value of $\\frac{m+8}{3}$?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"البسط يساوي 18 وليس 12.","En":"The numerator is 18, not 12."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 هي قيمة m وحدها.","En":"10 is only the value of m."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18 هو البسط قبل القسمة على 3.","En":"18 is the numerator before dividing by three."}}],"Hints":[{"Ar":"احسب البسط كاملاً بعد التعويض.","En":"Evaluate the whole numerator after substitution."},{"Ar":"اقسم البسط على المقام 3.","En":"Divide the numerator by denominator 3."}],"Solution":{"Idea":{"Ar":"خط الكسر يجمع البسط كوحدة واحدة قبل القسمة.","En":"The fraction bar groups the entire numerator before division."},"FormulaLatex":"\\frac{m+8}{3}","Steps":[{"Ar":"البسط 10 مع 8 يساوي 18.","En":"The numerator is 10 plus 8, or 18."},{"Ar":"نقسم 18 على 3.","En":"Divide 18 by 3."}],"Substitution":{"Ar":"$\\frac{10+8}{3}=\\frac{18}{3}$","En":"$\\frac{10+8}{3}=\\frac{18}{3}$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"6 مضروبة في 3 تعيد البسط 18.","En":"Six times three returns the numerator 18."},"CommonError":{"Ar":"إهمال المقام أو قسمة جزء واحد من البسط.","En":"Ignoring the denominator or dividing only part of the numerator."}}}$mw$::jsonb,$mw$خط الكسر يجمع البسط كوحدة واحدة قبل القسمة.

$\frac{m+8}{3}$

1. البسط 10 مع 8 يساوي 18.

2. نقسم 18 على 3.

$\frac{10+8}{3}=\frac{18}{3}$

$6$

6 مضروبة في 3 تعيد البسط 18.

إهمال المقام أو قسمة جزء واحد من البسط.$mw$,$mw$The fraction bar groups the entire numerator before division.

$\frac{m+8}{3}$

1. The numerator is 10 plus 8, or 18.

2. Divide 18 by 3.

$\frac{10+8}{3}=\frac{18}{3}$

$6$

Six times three returns the numerator 18.

Ignoring the denominator or dividing only part of the numerator.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب البسط كاملاً بعد التعويض.","En":"Evaluate the whole numerator after substitution."},{"Ar":"اقسم البسط على المقام 3.","En":"Divide the numerator by denominator 3."}],"Solution":{"Idea":{"Ar":"خط الكسر يجمع البسط كوحدة واحدة قبل القسمة.","En":"The fraction bar groups the entire numerator before division."},"FormulaLatex":"\\frac{m+8}{3}","Steps":[{"Ar":"البسط 10 مع 8 يساوي 18.","En":"The numerator is 10 plus 8, or 18."},{"Ar":"نقسم 18 على 3.","En":"Divide 18 by 3."}],"Substitution":{"Ar":"$\\frac{10+8}{3}=\\frac{18}{3}$","En":"$\\frac{10+8}{3}=\\frac{18}{3}$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"6 مضروبة في 3 تعيد البسط 18.","En":"Six times three returns the numerator 18."},"CommonError":{"Ar":"إهمال المقام أو قسمة جزء واحد من البسط.","En":"Ignoring the denominator or dividing only part of the numerator."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"البسط يساوي 18 وليس 12.","En":"The numerator is 18, not 12."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"10 هي قيمة m وحدها.","En":"10 is only the value of m."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"18 هو البسط قبل القسمة على 3.","En":"18 is the numerator before dividing by three."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-noncommutative-swap-1$mw$,$mw$substitution-noncommutative-swap$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبديل قيم المتغيرين","En":"Swapping variable values"},"Question":{"Ar":"للتعبير $3a+b$، نعوض أولاً $a=2$ و$b=5$، ثم نبدل القيم فتصبح $a=5$ و$b=2$. بكم تزيد القيمة الثانية على الأولى؟","En":"For $3a+b$, first substitute $a=2$ and $b=5$, then swap them to $a=5$ and $b=2$. By how much does the second value exceed the first?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المعامل 3 يجعل تبديل القيم يغير الناتج.","En":"The coefficient 3 makes swapping values change the result."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 هو الفرق بين المدخلين فقط.","En":"3 is only the difference between inputs."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 يحسب تغير 3a دون تغير b.","En":"9 counts the change in 3a without the change in b."}}],"Hints":[{"Ar":"احسب قيمة التعبير للتعويض الأول.","En":"Evaluate the first substitution."},{"Ar":"احسب القيمة بعد التبديل ثم اطرح.","En":"Evaluate after swapping, then subtract."}],"Solution":{"Idea":{"Ar":"ترتيب القيم مهم عندما لا يعامل التعبير المتغيرين بالطريقة نفسها.","En":"Input assignment matters when the expression treats variables differently."},"FormulaLatex":"3a+b","Steps":[{"Ar":"القيمة الأولى 6 مع 5 تساوي 11.","En":"The first value is 6 plus 5, or 11."},{"Ar":"القيمة الثانية 15 مع 2 تساوي 17.","En":"The second value is 15 plus 2, or 17."}],"Substitution":{"Ar":"$17-11=6$","En":"$17-11=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"17 تزيد على 11 بمقدار 6.","En":"17 exceeds 11 by 6."},"CommonError":{"Ar":"الاعتقاد أن تبديل المتغيرين لا يغير أي تعبير.","En":"Assuming swapping variables never changes an expression."}}}$mw$::jsonb,$mw$ترتيب القيم مهم عندما لا يعامل التعبير المتغيرين بالطريقة نفسها.

$3a+b$

1. القيمة الأولى 6 مع 5 تساوي 11.

2. القيمة الثانية 15 مع 2 تساوي 17.

$17-11=6$

$6$

17 تزيد على 11 بمقدار 6.

الاعتقاد أن تبديل المتغيرين لا يغير أي تعبير.$mw$,$mw$Input assignment matters when the expression treats variables differently.

$3a+b$

1. The first value is 6 plus 5, or 11.

2. The second value is 15 plus 2, or 17.

$17-11=6$

$6$

17 exceeds 11 by 6.

Assuming swapping variables never changes an expression.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب قيمة التعبير للتعويض الأول.","En":"Evaluate the first substitution."},{"Ar":"احسب القيمة بعد التبديل ثم اطرح.","En":"Evaluate after swapping, then subtract."}],"Solution":{"Idea":{"Ar":"ترتيب القيم مهم عندما لا يعامل التعبير المتغيرين بالطريقة نفسها.","En":"Input assignment matters when the expression treats variables differently."},"FormulaLatex":"3a+b","Steps":[{"Ar":"القيمة الأولى 6 مع 5 تساوي 11.","En":"The first value is 6 plus 5, or 11."},{"Ar":"القيمة الثانية 15 مع 2 تساوي 17.","En":"The second value is 15 plus 2, or 17."}],"Substitution":{"Ar":"$17-11=6$","En":"$17-11=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"17 تزيد على 11 بمقدار 6.","En":"17 exceeds 11 by 6."},"CommonError":{"Ar":"الاعتقاد أن تبديل المتغيرين لا يغير أي تعبير.","En":"Assuming swapping variables never changes an expression."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المعامل 3 يجعل تبديل القيم يغير الناتج.","En":"The coefficient 3 makes swapping values change the result."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3 هو الفرق بين المدخلين فقط.","En":"3 is only the difference between inputs."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"9 يحسب تغير 3a دون تغير b.","En":"9 counts the change in 3a without the change in b."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-zero-term-1$mw$,$mw$substitution-zero-term$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التعويض بالصفر","En":"Substituting zero"},"Question":{"Ar":"إذا كان $p=0$ و$q=9$، فما قيمة $5p+2q+4$؟","En":"If $p=0$ and $q=9$, what is the value of $5p+2q+4$?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صفر يلغي حد 5p فقط لا التعبير كله.","En":"Zero eliminates only the term 5p, not the entire expression."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18 يهمل الحد الثابت 4.","En":"18 omits the constant 4."}},{"LatexCode":"22","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"27 يعامل 5p على أنه 5 رغم أن p صفر.","En":"27 treats 5p as 5 even though p is zero."}}],"Hints":[{"Ar":"اضرب 5 في صفر.","En":"Multiply five by zero."},{"Ar":"احسب الحد 2q وأضف الثابت.","En":"Evaluate 2q and add the constant."}],"Solution":{"Idea":{"Ar":"عند التعويض بالصفر يصبح الحد المضروب فيه صفراً، وتبقى الحدود الأخرى.","En":"A term multiplied by zero vanishes, while other terms remain."},"FormulaLatex":"5p+2q+4","Steps":[{"Ar":"5 في صفر يساوي صفر.","En":"Five times zero is zero."},{"Ar":"2 في 9 يساوي 18، ومع 4 يصبح 22.","En":"Two times nine is 18, plus four gives 22."}],"Substitution":{"Ar":"$5\\times0+2\\times9+4=0+18+4$","En":"$5\\times0+2\\times9+4=0+18+4$"},"Result":{"Ar":"$22$","En":"$22$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان غير الصفريين مجموعهما 22.","En":"The nonzero terms sum to 22."},"CommonError":{"Ar":"حذف التعبير كله بسبب وجود متغير صفري.","En":"Discarding the whole expression because one variable is zero."}}}$mw$::jsonb,$mw$عند التعويض بالصفر يصبح الحد المضروب فيه صفراً، وتبقى الحدود الأخرى.

$5p+2q+4$

1. 5 في صفر يساوي صفر.

2. 2 في 9 يساوي 18، ومع 4 يصبح 22.

$5\times0+2\times9+4=0+18+4$

$22$

الحدان غير الصفريين مجموعهما 22.

حذف التعبير كله بسبب وجود متغير صفري.$mw$,$mw$A term multiplied by zero vanishes, while other terms remain.

$5p+2q+4$

1. Five times zero is zero.

2. Two times nine is 18, plus four gives 22.

$5\times0+2\times9+4=0+18+4$

$22$

The nonzero terms sum to 22.

Discarding the whole expression because one variable is zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اضرب 5 في صفر.","En":"Multiply five by zero."},{"Ar":"احسب الحد 2q وأضف الثابت.","En":"Evaluate 2q and add the constant."}],"Solution":{"Idea":{"Ar":"عند التعويض بالصفر يصبح الحد المضروب فيه صفراً، وتبقى الحدود الأخرى.","En":"A term multiplied by zero vanishes, while other terms remain."},"FormulaLatex":"5p+2q+4","Steps":[{"Ar":"5 في صفر يساوي صفر.","En":"Five times zero is zero."},{"Ar":"2 في 9 يساوي 18، ومع 4 يصبح 22.","En":"Two times nine is 18, plus four gives 22."}],"Substitution":{"Ar":"$5\\times0+2\\times9+4=0+18+4$","En":"$5\\times0+2\\times9+4=0+18+4$"},"Result":{"Ar":"$22$","En":"$22$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان غير الصفريين مجموعهما 22.","En":"The nonzero terms sum to 22."},"CommonError":{"Ar":"حذف التعبير كله بسبب وجود متغير صفري.","En":"Discarding the whole expression because one variable is zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"صفر يلغي حد 5p فقط لا التعبير كله.","En":"Zero eliminates only the term 5p, not the entire expression."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"18 يهمل الحد الثابت 4.","En":"18 omits the constant 4."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"27 يعامل 5p على أنه 5 رغم أن p صفر.","En":"27 treats 5p as 5 even though p is zero."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-decimal-cost-expression-1$mw$,$mw$substitution-decimal-cost-expression$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قيمة تعبير بسعر عشري","En":"Evaluating a decimal cost expression"},"Question":{"Ar":"تعطى تكلفة شراء $n$ دفاتر بالصيغة $2.5n$ وحدة نقدية. إذا كان $n=6$، فما التكلفة؟","En":"The cost of buying $n$ notebooks is $2.5n$ currency units. If $n=6$, what is the cost?"},"Options":[{"LatexCode":"8.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8.5 تجمع السعر والعدد بدلاً من ضربهما.","En":"8.5 adds price and quantity instead of multiplying."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 يهمل نصف الوحدة في سعر كل دفتر.","En":"12 ignores the half unit in each notebook's price."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"150","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"150 يخطئ في موضع الفاصلة العشرية.","En":"150 misplaces the decimal point."}}],"Hints":[{"Ar":"استبدل n بالعدد 6.","En":"Replace n with 6."},{"Ar":"يمكن تقسيم 2.5 إلى 2 و0.5.","En":"Split 2.5 into 2 and 0.5."}],"Solution":{"Idea":{"Ar":"التعويض يحول الصيغة إلى عملية ضرب عددية.","En":"Substitution turns the formula into numerical multiplication."},"FormulaLatex":"2.5n","Steps":[{"Ar":"ستة أمثال 2 تساوي 12.","En":"Six times two is 12."},{"Ar":"ستة أمثال 0.5 تساوي 3، فنجمع 12 و3.","En":"Six times 0.5 is three; add 12 and three."}],"Substitution":{"Ar":"$2.5\\times6=12+3$","En":"$2.5\\times6=12+3$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"15 مقسومة على 6 تعطي السعر 2.5.","En":"15 divided by six gives the price 2.5."},"CommonError":{"Ar":"جمع المعامل العشري مع قيمة المتغير.","En":"Adding the decimal coefficient to the variable value."}}}$mw$::jsonb,$mw$التعويض يحول الصيغة إلى عملية ضرب عددية.

$2.5n$

1. ستة أمثال 2 تساوي 12.

2. ستة أمثال 0.5 تساوي 3، فنجمع 12 و3.

$2.5\times6=12+3$

$15$

15 مقسومة على 6 تعطي السعر 2.5.

جمع المعامل العشري مع قيمة المتغير.$mw$,$mw$Substitution turns the formula into numerical multiplication.

$2.5n$

1. Six times two is 12.

2. Six times 0.5 is three; add 12 and three.

$2.5\times6=12+3$

$15$

15 divided by six gives the price 2.5.

Adding the decimal coefficient to the variable value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبدل n بالعدد 6.","En":"Replace n with 6."},{"Ar":"يمكن تقسيم 2.5 إلى 2 و0.5.","En":"Split 2.5 into 2 and 0.5."}],"Solution":{"Idea":{"Ar":"التعويض يحول الصيغة إلى عملية ضرب عددية.","En":"Substitution turns the formula into numerical multiplication."},"FormulaLatex":"2.5n","Steps":[{"Ar":"ستة أمثال 2 تساوي 12.","En":"Six times two is 12."},{"Ar":"ستة أمثال 0.5 تساوي 3، فنجمع 12 و3.","En":"Six times 0.5 is three; add 12 and three."}],"Substitution":{"Ar":"$2.5\\times6=12+3$","En":"$2.5\\times6=12+3$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"15 مقسومة على 6 تعطي السعر 2.5.","En":"15 divided by six gives the price 2.5."},"CommonError":{"Ar":"جمع المعامل العشري مع قيمة المتغير.","En":"Adding the decimal coefficient to the variable value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"8.5 تجمع السعر والعدد بدلاً من ضربهما.","En":"8.5 adds price and quantity instead of multiplying."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"12 يهمل نصف الوحدة في سعر كل دفتر.","En":"12 ignores the half unit in each notebook's price."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"150 يخطئ في موضع الفاصلة العشرية.","En":"150 misplaces the decimal point."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-input-output-match-1$mw$,$mw$substitution-input-output-match$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مطابقة المدخل والمخرج","En":"Matching input and output"},"Question":{"Ar":"تستخدم آلة الأعداد القاعدة $3n+2$. أي زوج مرتب يحقق القاعدة، حيث يأتي المدخل أولاً والمخرج ثانياً؟","En":"A number machine uses the rule $3n+2$. Which ordered pair follows the rule, with input first and output second?"},"Options":[{"LatexCode":"(2,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند المدخل 2 يكون المخرج 8 لا 6.","En":"Input 2 produces 8, not 6."}},{"LatexCode":"(3,11)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(4,12)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند المدخل 4 يكون المخرج 14 لا 12.","En":"Input 4 produces 14, not 12."}},{"LatexCode":"(5,21)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند المدخل 5 يكون المخرج 17 لا 21.","En":"Input 5 produces 17, not 21."}}],"Hints":[{"Ar":"عوّض بالعدد الأول في كل زوج.","En":"Substitute the first number of each pair."},{"Ar":"قارن الناتج بالعدد الثاني من الزوج نفسه.","En":"Compare the result with the second number in that pair."}],"Solution":{"Idea":{"Ar":"يتحقق الزوج عندما يساوي مخرجه قيمة التعبير عند مدخله.","En":"A pair matches when its output equals the evaluated expression at its input."},"FormulaLatex":"3n+2","Steps":[{"Ar":"عند n يساوي 3 يكون ثلاثة أمثال المدخل 9.","En":"For n equal to 3, three times the input is 9."},{"Ar":"بإضافة 2 نحصل على 11.","En":"Adding 2 gives 11."}],"Substitution":{"Ar":"$3\\times3+2=11$","En":"$3\\times3+2=11$"},"Result":{"Ar":"$(3,11)$","En":"$(3,11)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأزواج الأخرى تعطي مخرجات 8 و14 و17 بدلاً من القيم المقترحة.","En":"The other inputs give outputs 8, 14 and 17 instead of their listed outputs."},"CommonError":{"Ar":"التحقق من المدخل دون حساب المخرج.","En":"Checking the input without evaluating the output."}}}$mw$::jsonb,$mw$يتحقق الزوج عندما يساوي مخرجه قيمة التعبير عند مدخله.

$3n+2$

1. عند n يساوي 3 يكون ثلاثة أمثال المدخل 9.

2. بإضافة 2 نحصل على 11.

$3\times3+2=11$

$(3,11)$

الأزواج الأخرى تعطي مخرجات 8 و14 و17 بدلاً من القيم المقترحة.

التحقق من المدخل دون حساب المخرج.$mw$,$mw$A pair matches when its output equals the evaluated expression at its input.

$3n+2$

1. For n equal to 3, three times the input is 9.

2. Adding 2 gives 11.

$3\times3+2=11$

$(3,11)$

The other inputs give outputs 8, 14 and 17 instead of their listed outputs.

Checking the input without evaluating the output.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض بالعدد الأول في كل زوج.","En":"Substitute the first number of each pair."},{"Ar":"قارن الناتج بالعدد الثاني من الزوج نفسه.","En":"Compare the result with the second number in that pair."}],"Solution":{"Idea":{"Ar":"يتحقق الزوج عندما يساوي مخرجه قيمة التعبير عند مدخله.","En":"A pair matches when its output equals the evaluated expression at its input."},"FormulaLatex":"3n+2","Steps":[{"Ar":"عند n يساوي 3 يكون ثلاثة أمثال المدخل 9.","En":"For n equal to 3, three times the input is 9."},{"Ar":"بإضافة 2 نحصل على 11.","En":"Adding 2 gives 11."}],"Substitution":{"Ar":"$3\\times3+2=11$","En":"$3\\times3+2=11$"},"Result":{"Ar":"$(3,11)$","En":"$(3,11)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأزواج الأخرى تعطي مخرجات 8 و14 و17 بدلاً من القيم المقترحة.","En":"The other inputs give outputs 8, 14 and 17 instead of their listed outputs."},"CommonError":{"Ar":"التحقق من المدخل دون حساب المخرج.","En":"Checking the input without evaluating the output."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عند المدخل 2 يكون المخرج 8 لا 6.","En":"Input 2 produces 8, not 6."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عند المدخل 4 يكون المخرج 14 لا 12.","En":"Input 4 produces 14, not 12."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عند المدخل 5 يكون المخرج 17 لا 21.","En":"Input 5 produces 17, not 21."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-substitution-equal-expressions-at-input-1$mw$,$mw$substitution-equal-expressions-at-input$mw$,$mw$primary-substitution$mw$,$mw$grade-5$mw$,5,1,2,11,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":11,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة قيم التعبيرات","En":"Comparing expression values"},"Question":{"Ar":"إذا كان $x=4$، فأي تعبير له القيمة نفسها التي يعطيها $3x+2$؟","En":"If $x=4$, which expression has the same value as $3x+2$?"},"Options":[{"LatexCode":"2x+4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمته 12 لا 14.","En":"Its value is 12, not 14."}},{"LatexCode":"4x-2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x+6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمته 10 لا 14.","En":"Its value is 10, not 14."}},{"LatexCode":"5x","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمته 20 لا 14.","En":"Its value is 20, not 14."}}],"Hints":[{"Ar":"احسب قيمة التعبير المرجعي أولاً.","En":"Evaluate the reference expression first."},{"Ar":"عوّض 4 في كل خيار وقارن.","En":"Substitute four in each option and compare."}],"Solution":{"Idea":{"Ar":"قد يتساوى تعبيران عند قيمة معينة دون أن يكونا متطابقين دائماً.","En":"Expressions may agree at a particular input without being identical for all inputs."},"FormulaLatex":"3\\times4+2=14","Steps":[{"Ar":"التعبير المرجعي قيمته 14.","En":"The reference expression equals 14."},{"Ar":"التعبير 4x ناقص 2 يعطي 16 ناقص 2 أي 14.","En":"The expression 4x minus 2 gives 16 minus 2, or 14."}],"Substitution":{"Ar":"$4\\times4-2=14$","En":"$4\\times4-2=14$"},"Result":{"Ar":"$4x-2$","En":"$4x-2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القيم الأخرى 12 و10 و20، فلا تتساوى مع 14.","En":"The other values are 12, 10 and 20, not 14."},"CommonError":{"Ar":"مقارنة المعاملات وحدها دون التعويض.","En":"Comparing coefficients alone instead of substituting."}}}$mw$::jsonb,$mw$قد يتساوى تعبيران عند قيمة معينة دون أن يكونا متطابقين دائماً.

$3\times4+2=14$

1. التعبير المرجعي قيمته 14.

2. التعبير 4x ناقص 2 يعطي 16 ناقص 2 أي 14.

$4\times4-2=14$

$4x-2$

القيم الأخرى 12 و10 و20، فلا تتساوى مع 14.

مقارنة المعاملات وحدها دون التعويض.$mw$,$mw$Expressions may agree at a particular input without being identical for all inputs.

$3\times4+2=14$

1. The reference expression equals 14.

2. The expression 4x minus 2 gives 16 minus 2, or 14.

$4\times4-2=14$

$4x-2$

The other values are 12, 10 and 20, not 14.

Comparing coefficients alone instead of substituting.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب قيمة التعبير المرجعي أولاً.","En":"Evaluate the reference expression first."},{"Ar":"عوّض 4 في كل خيار وقارن.","En":"Substitute four in each option and compare."}],"Solution":{"Idea":{"Ar":"قد يتساوى تعبيران عند قيمة معينة دون أن يكونا متطابقين دائماً.","En":"Expressions may agree at a particular input without being identical for all inputs."},"FormulaLatex":"3\\times4+2=14","Steps":[{"Ar":"التعبير المرجعي قيمته 14.","En":"The reference expression equals 14."},{"Ar":"التعبير 4x ناقص 2 يعطي 16 ناقص 2 أي 14.","En":"The expression 4x minus 2 gives 16 minus 2, or 14."}],"Substitution":{"Ar":"$4\\times4-2=14$","En":"$4\\times4-2=14$"},"Result":{"Ar":"$4x-2$","En":"$4x-2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القيم الأخرى 12 و10 و20، فلا تتساوى مع 14.","En":"The other values are 12, 10 and 20, not 14."},"CommonError":{"Ar":"مقارنة المعاملات وحدها دون التعويض.","En":"Comparing coefficients alone instead of substituting."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قيمته 12 لا 14.","En":"Its value is 12, not 14."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قيمته 10 لا 14.","En":"Its value is 10, not 14."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قيمته 20 لا 14.","En":"Its value is 20, not 14."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-triangle-area-unit-height-conversion-1$mw$,$mw$triangle-area-unit-height-conversion$mw$,$mw$primary-triangle-area$mw$,$mw$grade-5$mw$,5,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة بوحدتين مختلفتين","En":"Triangle area with mixed units"},"Question":{"Ar":"مثلث قاعدته 20 cm وارتفاعه العمودي 1 dm. إذا كان 1 dm يساوي 10 cm، فما مساحته بالسنتيمتر المربع؟","En":"A triangle has base 20 cm and perpendicular height 1 dm. Given that 1 dm equals 10 cm, what is its area in square centimetres?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 ينتج من استعمال 1 كما لو كان بالسنتيمتر.","En":"10 treats the height of 1 dm as 1 cm."}},{"LatexCode":"100","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"200","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"200 هو حاصل ضرب القاعدة والارتفاع قبل القسمة على اثنين.","En":"200 is the base-height product before halving."}},{"LatexCode":"400","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"400 يضاعف حاصل الضرب بدلاً من تنصيفه.","En":"400 doubles rather than halves the product."}}],"Hints":[{"Ar":"حوّل الارتفاع إلى سنتيمترات أولاً.","En":"Convert the height to centimetres first."},{"Ar":"اضرب القاعدة بالارتفاع ثم اقسم على اثنين.","En":"Multiply the base by height and divide by two."}],"Solution":{"Idea":{"Ar":"يجب توحيد وحدتي الطول قبل تطبيق قانون المساحة.","En":"Use consistent length units before applying the area formula."},"FormulaLatex":"A=\\frac{bh}{2}","Steps":[{"Ar":"الارتفاع 10 cm.","En":"The height is 10 cm."},{"Ar":"نصف حاصل ضرب 20 في 10 هو 100.","En":"Half the product of 20 and 10 is 100."}],"Substitution":{"Ar":"$A=\\frac{20\\times10}{2}$","En":"$A=\\frac{20\\times10}{2}$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المستطيل الموافق مساحته 200 cm² والمثلث نصفها.","En":"The corresponding rectangle has area 200 cm²; the triangle has half."},"CommonError":{"Ar":"خلط وحدات القاعدة والارتفاع.","En":"Mixing base and height units."}}}$mw$::jsonb,$mw$يجب توحيد وحدتي الطول قبل تطبيق قانون المساحة.

$A=\frac{bh}{2}$

1. الارتفاع 10 cm.

2. نصف حاصل ضرب 20 في 10 هو 100.

$A=\frac{20\times10}{2}$

$100$

المستطيل الموافق مساحته 200 cm² والمثلث نصفها.

خلط وحدات القاعدة والارتفاع.$mw$,$mw$Use consistent length units before applying the area formula.

$A=\frac{bh}{2}$

1. The height is 10 cm.

2. Half the product of 20 and 10 is 100.

$A=\frac{20\times10}{2}$

$100$

The corresponding rectangle has area 200 cm²; the triangle has half.

Mixing base and height units.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الارتفاع إلى سنتيمترات أولاً.","En":"Convert the height to centimetres first."},{"Ar":"اضرب القاعدة بالارتفاع ثم اقسم على اثنين.","En":"Multiply the base by height and divide by two."}],"Solution":{"Idea":{"Ar":"يجب توحيد وحدتي الطول قبل تطبيق قانون المساحة.","En":"Use consistent length units before applying the area formula."},"FormulaLatex":"A=\\frac{bh}{2}","Steps":[{"Ar":"الارتفاع 10 cm.","En":"The height is 10 cm."},{"Ar":"نصف حاصل ضرب 20 في 10 هو 100.","En":"Half the product of 20 and 10 is 100."}],"Substitution":{"Ar":"$A=\\frac{20\\times10}{2}$","En":"$A=\\frac{20\\times10}{2}$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المستطيل الموافق مساحته 200 cm² والمثلث نصفها.","En":"The corresponding rectangle has area 200 cm²; the triangle has half."},"CommonError":{"Ar":"خلط وحدات القاعدة والارتفاع.","En":"Mixing base and height units."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"10 ينتج من استعمال 1 كما لو كان بالسنتيمتر.","En":"10 treats the height of 1 dm as 1 cm."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"200 هو حاصل ضرب القاعدة والارتفاع قبل القسمة على اثنين.","En":"200 is the base-height product before halving."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"400 يضاعف حاصل الضرب بدلاً من تنصيفه.","En":"400 doubles rather than halves the product."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-triangle-angles-equal-pair-known-third-1$mw$,$mw$triangle-angles-equal-pair-known-third$mw$,$mw$primary-triangle-angle-sum$mw$,$mw$grade-5$mw$,5,1,3,15,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":15,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زاويتان متساويتان","En":"Two equal angles"},"Question":{"Ar":"في مثلث زاويتان متساويتان، والزاوية الثالثة قياسها 40 درجة. ما قياس كل واحدة من الزاويتين المتساويتين بالدرجات؟","En":"A triangle has two equal angles and a third angle of 40 degrees. What is the measure of each equal angle in degrees?"},"Options":[{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاث زوايا من 40 لا تكمل 180.","En":"Three angles of 40 do not total 180."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاويتان من 60 مع 40 مجموعها 160.","En":"Two angles of 60 plus 40 total 160."}},{"LatexCode":"70","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"140","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"140 هو مجموع الزاويتين لا قياس إحداهما.","En":"140 is the sum of both angles, not one."}}],"Hints":[{"Ar":"اطرح 40 من مجموع زوايا المثلث.","En":"Subtract 40 from the triangle angle sum."},{"Ar":"قسّم المتبقي بالتساوي على زاويتين.","En":"Divide the remainder equally between the two angles."}],"Solution":{"Idea":{"Ar":"مجموع الزوايا الداخلية للمثلث 180 درجة.","En":"Triangle interior angles sum to 180 degrees."},"FormulaLatex":"2x+40=180","Steps":[{"Ar":"يبقى للزاويتين 140 درجة.","En":"The two angles total 140 degrees."},{"Ar":"بما أنهما متساويتان نقسم 140 على اثنين.","En":"Since they are equal, divide 140 by two."}],"Substitution":{"Ar":"$x=\\frac{180-40}{2}=70$","En":"$x=\\frac{180-40}{2}=70$"},"Result":{"Ar":"$70$","En":"$70$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"70 مع 70 مع 40 يساوي 180.","En":"70 plus 70 plus 40 equals 180."},"CommonError":{"Ar":"إعطاء مجموع الزاويتين دون قسمته.","En":"Giving the sum of both angles without halving."}}}$mw$::jsonb,$mw$مجموع الزوايا الداخلية للمثلث 180 درجة.

$2x+40=180$

1. يبقى للزاويتين 140 درجة.

2. بما أنهما متساويتان نقسم 140 على اثنين.

$x=\frac{180-40}{2}=70$

$70$

70 مع 70 مع 40 يساوي 180.

إعطاء مجموع الزاويتين دون قسمته.$mw$,$mw$Triangle interior angles sum to 180 degrees.

$2x+40=180$

1. The two angles total 140 degrees.

2. Since they are equal, divide 140 by two.

$x=\frac{180-40}{2}=70$

$70$

70 plus 70 plus 40 equals 180.

Giving the sum of both angles without halving.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح 40 من مجموع زوايا المثلث.","En":"Subtract 40 from the triangle angle sum."},{"Ar":"قسّم المتبقي بالتساوي على زاويتين.","En":"Divide the remainder equally between the two angles."}],"Solution":{"Idea":{"Ar":"مجموع الزوايا الداخلية للمثلث 180 درجة.","En":"Triangle interior angles sum to 180 degrees."},"FormulaLatex":"2x+40=180","Steps":[{"Ar":"يبقى للزاويتين 140 درجة.","En":"The two angles total 140 degrees."},{"Ar":"بما أنهما متساويتان نقسم 140 على اثنين.","En":"Since they are equal, divide 140 by two."}],"Substitution":{"Ar":"$x=\\frac{180-40}{2}=70$","En":"$x=\\frac{180-40}{2}=70$"},"Result":{"Ar":"$70$","En":"$70$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"70 مع 70 مع 40 يساوي 180.","En":"70 plus 70 plus 40 equals 180."},"CommonError":{"Ar":"إعطاء مجموع الزاويتين دون قسمته.","En":"Giving the sum of both angles without halving."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ثلاث زوايا من 40 لا تكمل 180.","En":"Three angles of 40 do not total 180."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"زاويتان من 60 مع 40 مجموعها 160.","En":"Two angles of 60 plus 40 total 160."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"140 هو مجموع الزاويتين لا قياس إحداهما.","En":"140 is the sum of both angles, not one."},"Order":4}]}$mw$),
($mw$growth-v88-grade-5-triangle-angle-validity-positive-1$mw$,$mw$triangle-angle-validity-positive$mw$,$mw$primary-triangle-angle-sum$mw$,$mw$grade-5$mw$,5,1,3,15,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":15,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"هل يمكن تكوين مثلث؟","En":"Can these angles form a triangle?"},"Question":{"Ar":"يقترح طالب أن زاويتين داخليتين لمثلث قياسهما 110 و75 درجة. لماذا لا يمكن أن يوجد هذا المثلث؟ A: مجموعهما أقل من 90؛ B: مجموعهما يتجاوز 180؛ C: يجب أن تكون الزاويتان متساويتين؛ D: لا يجوز وجود زاوية منفرجة.","En":"A pupil proposes two interior triangle angles of 110 and 75 degrees. Why is such a triangle impossible? A: their sum is below 90; B: their sum exceeds 180; C: the angles must be equal; D: an obtuse angle is forbidden."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 185، وهو أكبر من 90.","En":"Their sum is 185, above 90."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زوايا المثلث لا يلزم أن تكون متساوية.","En":"Triangle angles need not be equal."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن للمثلث أن يحتوي زاوية منفرجة واحدة.","En":"A triangle may have one obtuse angle."}}],"Hints":[{"Ar":"اجمع القياسين المعطيين.","En":"Add the two given measures."},{"Ar":"قارن الناتج بمجموع الزوايا الداخلية 180.","En":"Compare with the interior angle sum of 180."}],"Solution":{"Idea":{"Ar":"يجب أن يبقى قياس موجب للزاوية الثالثة.","En":"A positive measure must remain for the third angle."},"FormulaLatex":"110+75=185","Steps":[{"Ar":"مجموع الزاويتين 185 درجة.","En":"The two angles total 185 degrees."},{"Ar":"هذا يتجاوز مجموع زوايا المثلث قبل إضافة الثالثة.","En":"This exceeds the triangle total even before adding the third."}],"Substitution":{"Ar":"$185>180$","En":"$185>180$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"طرح 185 من 180 يعطي قياساً سالباً غير ممكن لزاوية داخلية.","En":"Subtracting 185 from 180 gives a negative measure, impossible for an interior angle."},"CommonError":{"Ar":"قبول أي قياسين دون فحص مجموعهما.","En":"Accepting any two measures without checking their sum."}}}$mw$::jsonb,$mw$يجب أن يبقى قياس موجب للزاوية الثالثة.

$110+75=185$

1. مجموع الزاويتين 185 درجة.

2. هذا يتجاوز مجموع زوايا المثلث قبل إضافة الثالثة.

$185>180$

$B$

طرح 185 من 180 يعطي قياساً سالباً غير ممكن لزاوية داخلية.

قبول أي قياسين دون فحص مجموعهما.$mw$,$mw$A positive measure must remain for the third angle.

$110+75=185$

1. The two angles total 185 degrees.

2. This exceeds the triangle total even before adding the third.

$185>180$

$B$

Subtracting 185 from 180 gives a negative measure, impossible for an interior angle.

Accepting any two measures without checking their sum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع القياسين المعطيين.","En":"Add the two given measures."},{"Ar":"قارن الناتج بمجموع الزوايا الداخلية 180.","En":"Compare with the interior angle sum of 180."}],"Solution":{"Idea":{"Ar":"يجب أن يبقى قياس موجب للزاوية الثالثة.","En":"A positive measure must remain for the third angle."},"FormulaLatex":"110+75=185","Steps":[{"Ar":"مجموع الزاويتين 185 درجة.","En":"The two angles total 185 degrees."},{"Ar":"هذا يتجاوز مجموع زوايا المثلث قبل إضافة الثالثة.","En":"This exceeds the triangle total even before adding the third."}],"Substitution":{"Ar":"$185>180$","En":"$185>180$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"طرح 185 من 180 يعطي قياساً سالباً غير ممكن لزاوية داخلية.","En":"Subtracting 185 from 180 gives a negative measure, impossible for an interior angle."},"CommonError":{"Ar":"قبول أي قياسين دون فحص مجموعهما.","En":"Accepting any two measures without checking their sum."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مجموعهما 185، وهو أكبر من 90.","En":"Their sum is 185, above 90."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"زوايا المثلث لا يلزم أن تكون متساوية.","En":"Triangle angles need not be equal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يمكن للمثلث أن يحتوي زاوية منفرجة واحدة.","En":"A triangle may have one obtuse angle."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v88 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
