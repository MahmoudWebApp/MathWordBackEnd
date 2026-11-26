-- One-time owner-authorized v63 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v63-grade-7-rational-sum-three-terms-cancel-opposites-1$mw$,$mw$rational-sum-three-terms-cancel-opposites$mw$,$mw$rational-arithmetic$mw$,$mw$grade-7$mw$,7,2,83,308,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":308,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جمع أعداد نسبية متقابلة","En":"Adding opposite rational numbers"},"Question":{"Ar":"احسب $-\\frac{7}{12}+\\frac{5}{8}+\\frac{7}{12}$.","En":"Evaluate $-\\frac{7}{12}+\\frac{5}{8}+\\frac{7}{12}$."},"Options":[{"LatexCode":"\\frac58","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الكسر الذي لا مقابل له.","En":"Omits the unpaired fraction."}},{"LatexCode":"-\\frac58","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"غيّر إشارة الكسر المتبقي.","En":"Changes the remaining fraction's sign."}},{"LatexCode":"\\frac76","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع مقداري الكسرين المتقابلين.","En":"Adds the magnitudes of the opposite fractions."}}],"Hints":[{"Ar":"ابحث عن عددين متقابلين.","En":"Find the two opposite numbers."},{"Ar":"احتفظ بالحد الثالث.","En":"Keep the third term."}],"Solution":{"Idea":{"Ar":"نجمع العددين المتقابلين أولاً فيكون مجموعهما صفراً.","En":"Add the opposite numbers first; their sum is zero."},"FormulaLatex":"(-7/12+7/12)+5/8","Steps":[{"Ar":"$-7/12+7/12=0$","En":"$-7/12+7/12=0$"},{"Ar":"$0+5/8=5/8$","En":"$0+5/8=5/8$"}],"Substitution":{"Ar":"$0+5/8$","En":"$0+5/8$"},"Result":{"Ar":"$\\frac58$","En":"$\\frac58$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5/8-5/8=0$","En":"$5/8-5/8=0$"},"CommonError":{"Ar":"أهمل الكسر الذي لا مقابل له.","En":"Omits the unpaired fraction."}}}$mw$::jsonb,$mw$نجمع العددين المتقابلين أولاً فيكون مجموعهما صفراً.

$(-7/12+7/12)+5/8$

1. $-7/12+7/12=0$

2. $0+5/8=5/8$

$0+5/8$

$\frac58$

$5/8-5/8=0$

أهمل الكسر الذي لا مقابل له.$mw$,$mw$Add the opposite numbers first; their sum is zero.

$(-7/12+7/12)+5/8$

1. $-7/12+7/12=0$

2. $0+5/8=5/8$

$0+5/8$

$\frac58$

$5/8-5/8=0$

Omits the unpaired fraction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابحث عن عددين متقابلين.","En":"Find the two opposite numbers."},{"Ar":"احتفظ بالحد الثالث.","En":"Keep the third term."}],"Solution":{"Idea":{"Ar":"نجمع العددين المتقابلين أولاً فيكون مجموعهما صفراً.","En":"Add the opposite numbers first; their sum is zero."},"FormulaLatex":"(-7/12+7/12)+5/8","Steps":[{"Ar":"$-7/12+7/12=0$","En":"$-7/12+7/12=0$"},{"Ar":"$0+5/8=5/8$","En":"$0+5/8=5/8$"}],"Substitution":{"Ar":"$0+5/8$","En":"$0+5/8$"},"Result":{"Ar":"$\\frac58$","En":"$\\frac58$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5/8-5/8=0$","En":"$5/8-5/8=0$"},"CommonError":{"Ar":"أهمل الكسر الذي لا مقابل له.","En":"Omits the unpaired fraction."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الكسر الذي لا مقابل له.","En":"Omits the unpaired fraction."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"غيّر إشارة الكسر المتبقي.","En":"Changes the remaining fraction's sign."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع مقداري الكسرين المتقابلين.","En":"Adds the magnitudes of the opposite fractions."},"Order":4}]}$mw$),
($mw$growth-v63-grade-7-signed-division-missing-factor-negative-result-1$mw$,$mw$signed-division-missing-factor-negative-result$mw$,$mw$signed-operations$mw$,$mw$grade-7$mw$,7,2,83,309,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":309,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عامل مجهول في قسمة موقعة","En":"Missing factor in signed division"},"Question":{"Ar":"أي عدد يجعل $(-48)\\div n=6$؟","En":"Which number makes $(-48)\\div n=6$?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يجعل خارج القسمة سالباً.","En":"Produces a negative quotient."}},{"LatexCode":"-6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين الخارج والمقسوم عليه.","En":"Confuses quotient and divisor."}},{"LatexCode":"-288","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب المقسوم في الخارج بدلاً من قسمته عليه.","En":"Multiplies the dividend by the quotient instead of dividing."}},{"LatexCode":"-8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ما إشارة المقسوم عليه إذا كان الخارج موجباً والمقسوم سالباً؟","En":"What sign must the divisor have if the dividend is negative and quotient positive?"},{"Ar":"اقسم −48 على 6.","En":"Divide negative forty-eight by six."}],"Solution":{"Idea":{"Ar":"نستعمل العلاقة العكسية بين الضرب والقسمة.","En":"Use the inverse relationship between multiplication and division."},"FormulaLatex":"6n=-48","Steps":[{"Ar":"$n=-8$","En":"$n=-8$"}],"Substitution":{"Ar":"$n=-48/6$","En":"$n=-48/6$"},"Result":{"Ar":"$-8$","En":"$-8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-48)/(-8)=6$","En":"$(-48)/(-8)=6$"},"CommonError":{"Ar":"يجعل خارج القسمة سالباً.","En":"Produces a negative quotient."}}}$mw$::jsonb,$mw$نستعمل العلاقة العكسية بين الضرب والقسمة.

$6n=-48$

1. $n=-8$

$n=-48/6$

$-8$

$(-48)/(-8)=6$

يجعل خارج القسمة سالباً.$mw$,$mw$Use the inverse relationship between multiplication and division.

$6n=-48$

1. $n=-8$

$n=-48/6$

$-8$

$(-48)/(-8)=6$

Produces a negative quotient.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما إشارة المقسوم عليه إذا كان الخارج موجباً والمقسوم سالباً؟","En":"What sign must the divisor have if the dividend is negative and quotient positive?"},{"Ar":"اقسم −48 على 6.","En":"Divide negative forty-eight by six."}],"Solution":{"Idea":{"Ar":"نستعمل العلاقة العكسية بين الضرب والقسمة.","En":"Use the inverse relationship between multiplication and division."},"FormulaLatex":"6n=-48","Steps":[{"Ar":"$n=-8$","En":"$n=-8$"}],"Substitution":{"Ar":"$n=-48/6$","En":"$n=-48/6$"},"Result":{"Ar":"$-8$","En":"$-8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-48)/(-8)=6$","En":"$(-48)/(-8)=6$"},"CommonError":{"Ar":"يجعل خارج القسمة سالباً.","En":"Produces a negative quotient."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يجعل خارج القسمة سالباً.","En":"Produces a negative quotient."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"خلط بين الخارج والمقسوم عليه.","En":"Confuses quotient and divisor."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ضرب المقسوم في الخارج بدلاً من قسمته عليه.","En":"Multiplies the dividend by the quotient instead of dividing."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v63-grade-7-absolute-value-compare-product-to-product-magnitudes-1$mw$,$mw$absolute-value-compare-product-to-product-magnitudes$mw$,$mw$absolute-value$mw$,$mw$grade-7$mw$,7,2,83,307,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":307,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"القيمة المطلقة لحاصل ضرب","En":"Absolute value of a product"},"Question":{"Ar":"إذا كان $|a|=4$ و$|b|=7$، فما قيمة $|ab|$؟","En":"If $|a|=4$ and $|b|=7$, find $|ab|$."},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح المقدارين.","En":"Subtracts the magnitudes."}},{"LatexCode":"-28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القيمة المطلقة لا تكون سالبة.","En":"An absolute value cannot be negative."}},{"LatexCode":"28","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المقدارين بدلاً من ضربهما.","En":"Adds instead of multiplying."}}],"Hints":[{"Ar":"استعمل قاعدة القيمة المطلقة لحاصل الضرب.","En":"Use the absolute-product rule."},{"Ar":"اضرب المقدارين المعطيين.","En":"Multiply the given magnitudes."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة لحاصل الضرب تساوي حاصل ضرب القيمتين المطلقتين.","En":"The absolute value of a product equals the product of the absolute values."},"FormulaLatex":"|ab|=|a||b|","Steps":[{"Ar":"$|ab|=28$","En":"$|ab|=28$"}],"Substitution":{"Ar":"$4\\cdot7$","En":"$4\\cdot7$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|(-4)\\cdot7|=28$","En":"$|(-4)\\cdot7|=28$"},"CommonError":{"Ar":"جمع المقدارين بدلاً من ضربهما.","En":"Adds instead of multiplying."}}}$mw$::jsonb,$mw$القيمة المطلقة لحاصل الضرب تساوي حاصل ضرب القيمتين المطلقتين.

$|ab|=|a||b|$

1. $|ab|=28$

$4\cdot7$

$28$

$|(-4)\cdot7|=28$

جمع المقدارين بدلاً من ضربهما.$mw$,$mw$The absolute value of a product equals the product of the absolute values.

$|ab|=|a||b|$

1. $|ab|=28$

$4\cdot7$

$28$

$|(-4)\cdot7|=28$

Adds instead of multiplying.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل قاعدة القيمة المطلقة لحاصل الضرب.","En":"Use the absolute-product rule."},{"Ar":"اضرب المقدارين المعطيين.","En":"Multiply the given magnitudes."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة لحاصل الضرب تساوي حاصل ضرب القيمتين المطلقتين.","En":"The absolute value of a product equals the product of the absolute values."},"FormulaLatex":"|ab|=|a||b|","Steps":[{"Ar":"$|ab|=28$","En":"$|ab|=28$"}],"Substitution":{"Ar":"$4\\cdot7$","En":"$4\\cdot7$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|(-4)\\cdot7|=28$","En":"$|(-4)\\cdot7|=28$"},"CommonError":{"Ar":"جمع المقدارين بدلاً من ضربهما.","En":"Adds instead of multiplying."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح المقدارين.","En":"Subtracts the magnitudes."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"القيمة المطلقة لا تكون سالبة.","En":"An absolute value cannot be negative."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع المقدارين بدلاً من ضربهما.","En":"Adds instead of multiplying."},"Order":4}]}$mw$),
($mw$growth-v63-grade-7-mode-count-frequency-table-multiple-values-1$mw$,$mw$mode-count-frequency-table-multiple-values$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-7$mw$,7,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"منوال من جدول تكرارات","En":"Mode from frequency counts"},"Question":{"Ar":"في سجل درجات، الدرجة 4 تكررت 3 مرات، والدرجة 6 تكررت 7 مرات، والدرجة 8 تكررت 5 مرات، والدرجة 10 تكررت مرتين. ما المنوال؟","En":"In a score record, score 4 occurs three times, score 6 seven times, score 8 five times, and score 10 twice. What is the mode?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا أكبر تكرار وليس الدرجة المرتبطة به.","En":"This is the largest frequency, not its associated score."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تكرارها أقل من سبعة.","En":"Its frequency is below seven."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه أكبر درجة وليست الأكثر تكراراً.","En":"This is the largest score, not the most frequent."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"قارن التكرارات الأربعة.","En":"Compare the four frequencies."},{"Ar":"اختر الدرجة لا عدد مرات ظهورها.","En":"Select the score, not its frequency."}],"Solution":{"Idea":{"Ar":"نبحث عن أكبر تكرار ونختار الدرجة المرتبطة به.","En":"Find the largest frequency and select its associated score."},"FormulaLatex":"f(6)=7","Steps":[{"Ar":"$\\operatorname{mode}=6$","En":"$\\operatorname{mode}=6$"}],"Substitution":{"Ar":"$7>5>3>2$","En":"$7>5>3>2$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(6)>f(8),\\quad f(6)>f(4),\\quad f(6)>f(10)$","En":"$f(6)>f(8),\\quad f(6)>f(4),\\quad f(6)>f(10)$"},"CommonError":{"Ar":"هذا أكبر تكرار وليس الدرجة المرتبطة به.","En":"This is the largest frequency, not its associated score."}}}$mw$::jsonb,$mw$نبحث عن أكبر تكرار ونختار الدرجة المرتبطة به.

$f(6)=7$

1. $\operatorname{mode}=6$

$7>5>3>2$

$6$

$f(6)>f(8),\quad f(6)>f(4),\quad f(6)>f(10)$

هذا أكبر تكرار وليس الدرجة المرتبطة به.$mw$,$mw$Find the largest frequency and select its associated score.

$f(6)=7$

1. $\operatorname{mode}=6$

$7>5>3>2$

$6$

$f(6)>f(8),\quad f(6)>f(4),\quad f(6)>f(10)$

This is the largest frequency, not its associated score.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قارن التكرارات الأربعة.","En":"Compare the four frequencies."},{"Ar":"اختر الدرجة لا عدد مرات ظهورها.","En":"Select the score, not its frequency."}],"Solution":{"Idea":{"Ar":"نبحث عن أكبر تكرار ونختار الدرجة المرتبطة به.","En":"Find the largest frequency and select its associated score."},"FormulaLatex":"f(6)=7","Steps":[{"Ar":"$\\operatorname{mode}=6$","En":"$\\operatorname{mode}=6$"}],"Substitution":{"Ar":"$7>5>3>2$","En":"$7>5>3>2$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(6)>f(8),\\quad f(6)>f(4),\\quad f(6)>f(10)$","En":"$f(6)>f(8),\\quad f(6)>f(4),\\quad f(6)>f(10)$"},"CommonError":{"Ar":"هذا أكبر تكرار وليس الدرجة المرتبطة به.","En":"This is the largest frequency, not its associated score."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا أكبر تكرار وليس الدرجة المرتبطة به.","En":"This is the largest frequency, not its associated score."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تكرارها أقل من سبعة.","En":"Its frequency is below seven."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه أكبر درجة وليست الأكثر تكراراً.","En":"This is the largest score, not the most frequent."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v63-grade-4-division-two-successive-exact-groups-equivalent-1$mw$,$mw$division-two-successive-exact-groups-equivalent$mw$,$mw$primary-division$mw$,$mw$grade-4$mw$,4,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقسيم على مرحلتين","En":"Dividing in two stages"},"Question":{"Ar":"قُسم 144 كتاباً بالتساوي على 4 رفوف، ثم قُسمت كتب كل رف بالتساوي على 3 مجموعات. كم كتاباً في كل مجموعة؟","En":"144 books are divided equally among four shelves. The books on each shelf are then divided equally into three groups. How many books are in each group?"},"Options":[{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكتب في الرف الواحد.","En":"This is the number on one shelf."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على ثلاثة فقط.","En":"Divides by three only."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على تسعة بدلاً من اثني عشر.","En":"Divides by nine rather than twelve."}}],"Hints":[{"Ar":"احسب كتب الرف الواحد.","En":"Find books per shelf."},{"Ar":"قسمها إلى ثلاث مجموعات.","En":"Divide them into three groups."}],"Solution":{"Idea":{"Ar":"نقسم أولاً على عدد الرفوف ثم على عدد المجموعات في الرف.","En":"Divide by the shelf count and then by groups per shelf."},"FormulaLatex":"(144/4)/3","Steps":[{"Ar":"$144/4=36$","En":"$144/4=36$"},{"Ar":"$36/3=12$","En":"$36/3=12$"}],"Substitution":{"Ar":"$36/3$","En":"$36/3$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot3\\cdot4=144$","En":"$12\\cdot3\\cdot4=144$"},"CommonError":{"Ar":"هذا عدد الكتب في الرف الواحد.","En":"This is the number on one shelf."}}}$mw$::jsonb,$mw$نقسم أولاً على عدد الرفوف ثم على عدد المجموعات في الرف.

$(144/4)/3$

1. $144/4=36$

2. $36/3=12$

$36/3$

$12$

$12\cdot3\cdot4=144$

هذا عدد الكتب في الرف الواحد.$mw$,$mw$Divide by the shelf count and then by groups per shelf.

$(144/4)/3$

1. $144/4=36$

2. $36/3=12$

$36/3$

$12$

$12\cdot3\cdot4=144$

This is the number on one shelf.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب كتب الرف الواحد.","En":"Find books per shelf."},{"Ar":"قسمها إلى ثلاث مجموعات.","En":"Divide them into three groups."}],"Solution":{"Idea":{"Ar":"نقسم أولاً على عدد الرفوف ثم على عدد المجموعات في الرف.","En":"Divide by the shelf count and then by groups per shelf."},"FormulaLatex":"(144/4)/3","Steps":[{"Ar":"$144/4=36$","En":"$144/4=36$"},{"Ar":"$36/3=12$","En":"$36/3=12$"}],"Substitution":{"Ar":"$36/3$","En":"$36/3$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot3\\cdot4=144$","En":"$12\\cdot3\\cdot4=144$"},"CommonError":{"Ar":"هذا عدد الكتب في الرف الواحد.","En":"This is the number on one shelf."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكتب في الرف الواحد.","En":"This is the number on one shelf."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم على ثلاثة فقط.","En":"Divides by three only."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم على تسعة بدلاً من اثني عشر.","En":"Divides by nine rather than twelve."},"Order":4}]}$mw$),
($mw$growth-v63-grade-4-multiplicative-compare-unit-cost-exact-divisions-1$mw$,$mw$multiplicative-compare-unit-cost-exact-divisions$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-4$mw$,4,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة سعر القطعة","En":"Comparing unit costs"},"Question":{"Ar":"عبوة A تحوي 6 أقلام بسعر 30 وحدة نقدية، وعبوة B تحوي 8 أقلام بسعر 32 وحدة نقدية. بكم يقل سعر القلم في B عن سعره في A؟","En":"Pack A contains six pens for 30 currency units; pack B contains eight pens for 32 units. How much less does one pen cost in B than in A?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن سعري العبوتين بدلاً من سعر القطعة.","En":"Compares pack prices instead of unit prices."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا سعر القلم في B.","En":"This is B's unit price."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا سعر القلم في A.","En":"This is A's unit price."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اقسم سعر كل عبوة على عدد أقلامها.","En":"Divide each price by its pen count."},{"Ar":"قارن سعري القلم الواحد.","En":"Compare the unit prices."}],"Solution":{"Idea":{"Ar":"نحسب سعر القلم الواحد في كل عبوة ثم نطرح.","En":"Find each unit price, then subtract."},"FormulaLatex":"30/6-32/8","Steps":[{"Ar":"$30/6=5$","En":"$30/6=5$"},{"Ar":"$32/8=4$","En":"$32/8=4$"},{"Ar":"$5-4=1$","En":"$5-4=1$"}],"Substitution":{"Ar":"$5-4$","En":"$5-4$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot5=30,\\quad8\\cdot4=32$","En":"$6\\cdot5=30,\\quad8\\cdot4=32$"},"CommonError":{"Ar":"قارن سعري العبوتين بدلاً من سعر القطعة.","En":"Compares pack prices instead of unit prices."}}}$mw$::jsonb,$mw$نحسب سعر القلم الواحد في كل عبوة ثم نطرح.

$30/6-32/8$

1. $30/6=5$

2. $32/8=4$

3. $5-4=1$

$5-4$

$1$

$6\cdot5=30,\quad8\cdot4=32$

قارن سعري العبوتين بدلاً من سعر القطعة.$mw$,$mw$Find each unit price, then subtract.

$30/6-32/8$

1. $30/6=5$

2. $32/8=4$

3. $5-4=1$

$5-4$

$1$

$6\cdot5=30,\quad8\cdot4=32$

Compares pack prices instead of unit prices.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم سعر كل عبوة على عدد أقلامها.","En":"Divide each price by its pen count."},{"Ar":"قارن سعري القلم الواحد.","En":"Compare the unit prices."}],"Solution":{"Idea":{"Ar":"نحسب سعر القلم الواحد في كل عبوة ثم نطرح.","En":"Find each unit price, then subtract."},"FormulaLatex":"30/6-32/8","Steps":[{"Ar":"$30/6=5$","En":"$30/6=5$"},{"Ar":"$32/8=4$","En":"$32/8=4$"},{"Ar":"$5-4=1$","En":"$5-4=1$"}],"Substitution":{"Ar":"$5-4$","En":"$5-4$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot5=30,\\quad8\\cdot4=32$","En":"$6\\cdot5=30,\\quad8\\cdot4=32$"},"CommonError":{"Ar":"قارن سعري العبوتين بدلاً من سعر القطعة.","En":"Compares pack prices instead of unit prices."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قارن سعري العبوتين بدلاً من سعر القطعة.","En":"Compares pack prices instead of unit prices."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا سعر القلم في B.","En":"This is B's unit price."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا سعر القلم في A.","En":"This is A's unit price."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v63 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
