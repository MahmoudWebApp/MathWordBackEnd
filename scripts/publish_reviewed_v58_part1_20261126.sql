-- One-time owner-authorized v58 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v58-grade-1-counting-ordinal-two-equal-lines-1$mw$,$mw$counting-ordinal-two-equal-lines$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ترتيب الصف بعد دمج صفين","En":"Position after joining two lines"},"Question":{"Ar":"يقف 5 أطفال في صف، ويقف 4 أطفال في صف ثانٍ. إذا وقف الصف الثاني كله بعد الأول دون تغيير ترتيبه، فما ترتيب أول طفل من الصف الثاني في الصف الجديد؟","En":"Five children stand in one line and four in another. The second line joins behind the first without changing its order. What is the new position of the first child in the second line?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد أطفال الصف الثاني.","En":"This counts the second line."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ترتيب آخر طفل من الصف الأول.","En":"This is the last position in the first line."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأطفال جميعاً.","En":"This counts all children."}}],"Hints":[{"Ar":"عد الأطفال الذين يسبقونه.","En":"Count the children ahead of this child."},{"Ar":"أضف واحداً لمعرفة ترتيبه.","En":"Add one to find the position."}],"Solution":{"Idea":{"Ar":"يسبق الطفل خمسة أطفال من الصف الأول.","En":"Five children from the first line stand ahead of the child."},"FormulaLatex":"5+1","Steps":[{"Ar":"$5+1=6$","En":"$5+1=6$"}],"Substitution":{"Ar":"$5+1$","En":"$5+1$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6-1=5$","En":"$6-1=5$"},"CommonError":{"Ar":"هذا عدد أطفال الصف الثاني.","En":"This counts the second line."}}}$mw$::jsonb,$mw$يسبق الطفل خمسة أطفال من الصف الأول.

$5+1$

1. $5+1=6$

$5+1$

$6$

$6-1=5$

هذا عدد أطفال الصف الثاني.$mw$,$mw$Five children from the first line stand ahead of the child.

$5+1$

1. $5+1=6$

$5+1$

$6$

$6-1=5$

This counts the second line.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد الأطفال الذين يسبقونه.","En":"Count the children ahead of this child."},{"Ar":"أضف واحداً لمعرفة ترتيبه.","En":"Add one to find the position."}],"Solution":{"Idea":{"Ar":"يسبق الطفل خمسة أطفال من الصف الأول.","En":"Five children from the first line stand ahead of the child."},"FormulaLatex":"5+1","Steps":[{"Ar":"$5+1=6$","En":"$5+1=6$"}],"Substitution":{"Ar":"$5+1$","En":"$5+1$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6-1=5$","En":"$6-1=5$"},"CommonError":{"Ar":"هذا عدد أطفال الصف الثاني.","En":"This counts the second line."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد أطفال الصف الثاني.","En":"This counts the second line."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا ترتيب آخر طفل من الصف الأول.","En":"This is the last position in the first line."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأطفال جميعاً.","En":"This counts all children."},"Order":4}]}$mw$),
($mw$growth-v58-grade-8-slope-missing-coordinate-signed-run-1$mw$,$mw$slope-missing-coordinate-signed-run$mw$,$mw$middle-slope$mw$,$mw$grade-8$mw$,8,2,6,29,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":29,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إحداثي من ميل معلوم","En":"Coordinate from a known slope"},"Question":{"Ar":"يمر مستقيم ميله 2 بالنقطتين $(1,3)$ و$(5,y)$. ما قيمة y؟","En":"A line of slope two passes through $(1,3)$ and $(5,y)$. Find y."},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار التغير الرأسي وحده.","En":"This is just the vertical change."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الميل إلى الإحداثي الرأسي فقط.","En":"Adds only the slope to the initial ordinate."}},{"LatexCode":"-5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح التغير الرأسي بدلاً من جمعه.","En":"Subtracts the rise rather than adding it."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب فرق الإحداثيين الأفقيين.","En":"Find the horizontal coordinate difference."},{"Ar":"اضرب الفرق في الميل ثم أضف 3.","En":"Multiply the difference by the slope, then add three."}],"Solution":{"Idea":{"Ar":"نحسب التغير الرأسي من الميل ثم نضيفه إلى الإحداثي الأول.","En":"Find the vertical change from the slope, then add it to the initial ordinate."},"FormulaLatex":"(y-3)/(5-1)=2","Steps":[{"Ar":"$y-3=8$","En":"$y-3=8$"},{"Ar":"$y=11$","En":"$y=11$"}],"Substitution":{"Ar":"$y-3=2\\cdot4$","En":"$y-3=2\\cdot4$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(11-3)/(5-1)=2$","En":"$(11-3)/(5-1)=2$"},"CommonError":{"Ar":"هذا مقدار التغير الرأسي وحده.","En":"This is just the vertical change."}}}$mw$::jsonb,$mw$نحسب التغير الرأسي من الميل ثم نضيفه إلى الإحداثي الأول.

$(y-3)/(5-1)=2$

1. $y-3=8$

2. $y=11$

$y-3=2\cdot4$

$11$

$(11-3)/(5-1)=2$

هذا مقدار التغير الرأسي وحده.$mw$,$mw$Find the vertical change from the slope, then add it to the initial ordinate.

$(y-3)/(5-1)=2$

1. $y-3=8$

2. $y=11$

$y-3=2\cdot4$

$11$

$(11-3)/(5-1)=2$

This is just the vertical change.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب فرق الإحداثيين الأفقيين.","En":"Find the horizontal coordinate difference."},{"Ar":"اضرب الفرق في الميل ثم أضف 3.","En":"Multiply the difference by the slope, then add three."}],"Solution":{"Idea":{"Ar":"نحسب التغير الرأسي من الميل ثم نضيفه إلى الإحداثي الأول.","En":"Find the vertical change from the slope, then add it to the initial ordinate."},"FormulaLatex":"(y-3)/(5-1)=2","Steps":[{"Ar":"$y-3=8$","En":"$y-3=8$"},{"Ar":"$y=11$","En":"$y=11$"}],"Substitution":{"Ar":"$y-3=2\\cdot4$","En":"$y-3=2\\cdot4$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(11-3)/(5-1)=2$","En":"$(11-3)/(5-1)=2$"},"CommonError":{"Ar":"هذا مقدار التغير الرأسي وحده.","En":"This is just the vertical change."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار التغير الرأسي وحده.","En":"This is just the vertical change."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الميل إلى الإحداثي الرأسي فقط.","En":"Adds only the slope to the initial ordinate."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح التغير الرأسي بدلاً من جمعه.","En":"Subtracts the rise rather than adding it."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v58-grade-8-exponents-equal-bases-via-prime-factor-1$mw$,$mw$exponents-equal-bases-via-prime-factor$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ضرب قوتين بأساسين مختلفين","En":"Multiplying powers with different bases"},"Question":{"Ar":"اكتب $4^3\\cdot8^2$ على صورة قوة للعدد 2.","En":"Express $4^3\\cdot8^2$ as a single power of two."},"Options":[{"LatexCode":"2^6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب أحد العاملين فقط.","En":"Computes only one factor."}},{"LatexCode":"2^{10}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع معاملات الأسس بطريقة خاطئة.","En":"Combines exponent factors incorrectly."}},{"LatexCode":"2^{12}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2^5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأسين دون توحيد الأساس.","En":"Adds exponents without matching bases."}}],"Hints":[{"Ar":"اكتب 4 و8 بدلالة العدد 2.","En":"Write four and eight using base two."},{"Ar":"اضرب الأسس داخل كل قوس ثم اجمع.","En":"Multiply exponents within each power, then add."}],"Solution":{"Idea":{"Ar":"نكتب 4 و8 على صورة قوتين للعدد 2.","En":"Express four and eight as powers of two."},"FormulaLatex":"(2^2)^3(2^3)^2","Steps":[{"Ar":"$2^6\\cdot2^6=2^{12}$","En":"$2^6\\cdot2^6=2^{12}$"}],"Substitution":{"Ar":"$2^{2\\cdot3}2^{3\\cdot2}$","En":"$2^{2\\cdot3}2^{3\\cdot2}$"},"Result":{"Ar":"$2^{12}$","En":"$2^{12}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$64\\cdot64=4096=2^{12}$","En":"$64\\cdot64=4096=2^{12}$"},"CommonError":{"Ar":"جمع الأسين دون توحيد الأساس.","En":"Adds exponents without matching bases."}}}$mw$::jsonb,$mw$نكتب 4 و8 على صورة قوتين للعدد 2.

$(2^2)^3(2^3)^2$

1. $2^6\cdot2^6=2^{12}$

$2^{2\cdot3}2^{3\cdot2}$

$2^{12}$

$64\cdot64=4096=2^{12}$

جمع الأسين دون توحيد الأساس.$mw$,$mw$Express four and eight as powers of two.

$(2^2)^3(2^3)^2$

1. $2^6\cdot2^6=2^{12}$

$2^{2\cdot3}2^{3\cdot2}$

$2^{12}$

$64\cdot64=4096=2^{12}$

Adds exponents without matching bases.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب 4 و8 بدلالة العدد 2.","En":"Write four and eight using base two."},{"Ar":"اضرب الأسس داخل كل قوس ثم اجمع.","En":"Multiply exponents within each power, then add."}],"Solution":{"Idea":{"Ar":"نكتب 4 و8 على صورة قوتين للعدد 2.","En":"Express four and eight as powers of two."},"FormulaLatex":"(2^2)^3(2^3)^2","Steps":[{"Ar":"$2^6\\cdot2^6=2^{12}$","En":"$2^6\\cdot2^6=2^{12}$"}],"Substitution":{"Ar":"$2^{2\\cdot3}2^{3\\cdot2}$","En":"$2^{2\\cdot3}2^{3\\cdot2}$"},"Result":{"Ar":"$2^{12}$","En":"$2^{12}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$64\\cdot64=4096=2^{12}$","En":"$64\\cdot64=4096=2^{12}$"},"CommonError":{"Ar":"جمع الأسين دون توحيد الأساس.","En":"Adds exponents without matching bases."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب أحد العاملين فقط.","En":"Computes only one factor."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع معاملات الأسس بطريقة خاطئة.","En":"Combines exponent factors incorrectly."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع الأسين دون توحيد الأساس.","En":"Adds exponents without matching bases."},"Order":4}]}$mw$),
($mw$growth-v58-grade-8-exponents-identify-non-equivalent-forms-1$mw$,$mw$exponents-identify-non-equivalent-forms$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز تعبير غير مكافئ","En":"Identifying a non-equivalent expression"},"Question":{"Ar":"أي تعبير لا يساوي $a^6$ حيث $a>1$؟","En":"Which expression is not equal to $a^6$ for $a>1$?"},"Options":[{"LatexCode":"a^9/a^3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فرق الأسين 6.","En":"The exponents differ by six."}},{"LatexCode":"(a^3)^3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"a^2a^4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع الأسين 6.","En":"The exponents sum to six."}},{"LatexCode":"(a^2)^3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حاصل ضرب الأسين 6.","En":"The exponents multiply to six."}}],"Hints":[{"Ar":"بسّط أس كل خيار.","En":"Simplify the exponent of each choice."},{"Ar":"ابحث عن الأس المختلف عن 6.","En":"Find the exponent that differs from six."}],"Solution":{"Idea":{"Ar":"أس القوة المرفوعة لقوة أخرى يساوي حاصل ضرب الأسين.","En":"For a power raised to a power, multiply the exponents."},"FormulaLatex":"(a^3)^3=a^9","Steps":[{"Ar":"$a^9\\ne a^6\\quad(a>1)$","En":"$a^9\\ne a^6\\quad(a>1)$"}],"Substitution":{"Ar":"$3\\cdot3=9$","En":"$3\\cdot3=9$"},"Result":{"Ar":"$(a^3)^3$","En":"$(a^3)^3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$a=2:\\ 2^9=512,\\ 2^6=64$","En":"$a=2:\\ 2^9=512,\\ 2^6=64$"},"CommonError":{"Ar":"مجموع الأسين 6.","En":"The exponents sum to six."}}}$mw$::jsonb,$mw$أس القوة المرفوعة لقوة أخرى يساوي حاصل ضرب الأسين.

$(a^3)^3=a^9$

1. $a^9\ne a^6\quad(a>1)$

$3\cdot3=9$

$(a^3)^3$

$a=2:\ 2^9=512,\ 2^6=64$

مجموع الأسين 6.$mw$,$mw$For a power raised to a power, multiply the exponents.

$(a^3)^3=a^9$

1. $a^9\ne a^6\quad(a>1)$

$3\cdot3=9$

$(a^3)^3$

$a=2:\ 2^9=512,\ 2^6=64$

The exponents sum to six.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"بسّط أس كل خيار.","En":"Simplify the exponent of each choice."},{"Ar":"ابحث عن الأس المختلف عن 6.","En":"Find the exponent that differs from six."}],"Solution":{"Idea":{"Ar":"أس القوة المرفوعة لقوة أخرى يساوي حاصل ضرب الأسين.","En":"For a power raised to a power, multiply the exponents."},"FormulaLatex":"(a^3)^3=a^9","Steps":[{"Ar":"$a^9\\ne a^6\\quad(a>1)$","En":"$a^9\\ne a^6\\quad(a>1)$"}],"Substitution":{"Ar":"$3\\cdot3=9$","En":"$3\\cdot3=9$"},"Result":{"Ar":"$(a^3)^3$","En":"$(a^3)^3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$a=2:\\ 2^9=512,\\ 2^6=64$","En":"$a=2:\\ 2^9=512,\\ 2^6=64$"},"CommonError":{"Ar":"مجموع الأسين 6.","En":"The exponents sum to six."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"فرق الأسين 6.","En":"The exponents differ by six."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"مجموع الأسين 6.","En":"The exponents sum to six."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حاصل ضرب الأسين 6.","En":"The exponents multiply to six."},"Order":4}]}$mw$),
($mw$growth-v58-grade-8-powers-negative-base-order-comparison-1$mw$,$mw$powers-negative-base-order-comparison$mw$,$mw$middle-evaluate-powers$mw$,$mw$grade-8$mw$,8,2,5,23,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":23,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة قوتين بإشارة سالبة","En":"Comparing negative-base powers"},"Question":{"Ar":"أي قيمة هي الأكبر: $(-2)^5$ أم $(-3)^3$ أم $(-4)^2$ أم $-5^2$؟","En":"Which value is greatest: $(-2)^5$, $(-3)^3$, $(-4)^2$, or $-5^2$?"},"Options":[{"LatexCode":"(-4)^2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(-2)^5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمته −32.","En":"Its value is −32."}},{"LatexCode":"(-3)^3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمته −27.","En":"Its value is −27."}},{"LatexCode":"-5^2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمته −25 لأن السالب خارج القوة.","En":"Its value is −25 because the minus is outside the power."}}],"Hints":[{"Ar":"الأس الفردي لأساس سالب يعطي قيمة سالبة.","En":"An odd exponent of a negative base gives a negative value."},{"Ar":"انتبه للسالب خارج القوس.","En":"Notice the minus outside the power."}],"Solution":{"Idea":{"Ar":"نحسب قيمة كل قوة مع الانتباه إلى الأقواس وزوجية الأس.","En":"Evaluate each power, checking parentheses and exponent parity."},"FormulaLatex":"(-4)^2=16","Steps":[{"Ar":"$(-4)^2=16$","En":"$(-4)^2=16$"},{"Ar":"$-5^2=-25$","En":"$-5^2=-25$"},{"Ar":"$16>-25>-27>-32$","En":"$16>-25>-27>-32$"}],"Substitution":{"Ar":"$(-2)^5=-32,\\ (-3)^3=-27$","En":"$(-2)^5=-32,\\ (-3)^3=-27$"},"Result":{"Ar":"$(-4)^2$","En":"$(-4)^2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$16>0$","En":"$16>0$"},"CommonError":{"Ar":"قيمته −32.","En":"Its value is −32."}}}$mw$::jsonb,$mw$نحسب قيمة كل قوة مع الانتباه إلى الأقواس وزوجية الأس.

$(-4)^2=16$

1. $(-4)^2=16$

2. $-5^2=-25$

3. $16>-25>-27>-32$

$(-2)^5=-32,\ (-3)^3=-27$

$(-4)^2$

$16>0$

قيمته −32.$mw$,$mw$Evaluate each power, checking parentheses and exponent parity.

$(-4)^2=16$

1. $(-4)^2=16$

2. $-5^2=-25$

3. $16>-25>-27>-32$

$(-2)^5=-32,\ (-3)^3=-27$

$(-4)^2$

$16>0$

Its value is −32.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الأس الفردي لأساس سالب يعطي قيمة سالبة.","En":"An odd exponent of a negative base gives a negative value."},{"Ar":"انتبه للسالب خارج القوس.","En":"Notice the minus outside the power."}],"Solution":{"Idea":{"Ar":"نحسب قيمة كل قوة مع الانتباه إلى الأقواس وزوجية الأس.","En":"Evaluate each power, checking parentheses and exponent parity."},"FormulaLatex":"(-4)^2=16","Steps":[{"Ar":"$(-4)^2=16$","En":"$(-4)^2=16$"},{"Ar":"$-5^2=-25$","En":"$-5^2=-25$"},{"Ar":"$16>-25>-27>-32$","En":"$16>-25>-27>-32$"}],"Substitution":{"Ar":"$(-2)^5=-32,\\ (-3)^3=-27$","En":"$(-2)^5=-32,\\ (-3)^3=-27$"},"Result":{"Ar":"$(-4)^2$","En":"$(-4)^2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$16>0$","En":"$16>0$"},"CommonError":{"Ar":"قيمته −32.","En":"Its value is −32."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قيمته −32.","En":"Its value is −32."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قيمته −27.","En":"Its value is −27."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قيمته −25 لأن السالب خارج القوة.","En":"Its value is −25 because the minus is outside the power."},"Order":4}]}$mw$),
($mw$growth-v58-grade-11-derivative-linear-combination-polynomials-1$mw$,$mw$derivative-linear-combination-polynomials$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مشتقة تركيب خطي لدالتين","En":"Derivative of a linear combination"},"Question":{"Ar":"إذا كان $f'(2)=5$ و$g'(2)=-3$ لدالتين كثيرتي حدود، وكان $h(x)=2f(x)-4g(x)$، فما $h'(2)$؟","En":"For polynomials f and g, $f'(2)=5$ and $g'(2)=-3$. If $h(x)=2f(x)-4g(x)$, find $h'(2)$."},"Options":[{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 12 بدلاً من جمعها.","En":"Subtracts twelve instead of adding it."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل المعاملين.","En":"Ignores the coefficients."}},{"LatexCode":"-22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result's sign."}},{"LatexCode":"22","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"وزّع الاشتقاق على الحدين.","En":"Distribute differentiation across the terms."},{"Ar":"انتبه إلى طرح عدد سالب.","En":"Remember that subtracting a negative adds."}],"Solution":{"Idea":{"Ar":"الاشتقاق يحافظ على التركيب الخطي.","En":"Differentiation is linear."},"FormulaLatex":"h'=2f'-4g'","Steps":[{"Ar":"$10+12=22$","En":"$10+12=22$"}],"Substitution":{"Ar":"$2\\cdot5-4(-3)$","En":"$2\\cdot5-4(-3)$"},"Result":{"Ar":"$22$","En":"$22$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$22-10=12$","En":"$22-10=12$"},"CommonError":{"Ar":"طرح 12 بدلاً من جمعها.","En":"Subtracts twelve instead of adding it."}}}$mw$::jsonb,$mw$الاشتقاق يحافظ على التركيب الخطي.

$h'=2f'-4g'$

1. $10+12=22$

$2\cdot5-4(-3)$

$22$

$22-10=12$

طرح 12 بدلاً من جمعها.$mw$,$mw$Differentiation is linear.

$h'=2f'-4g'$

1. $10+12=22$

$2\cdot5-4(-3)$

$22$

$22-10=12$

Subtracts twelve instead of adding it.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزّع الاشتقاق على الحدين.","En":"Distribute differentiation across the terms."},{"Ar":"انتبه إلى طرح عدد سالب.","En":"Remember that subtracting a negative adds."}],"Solution":{"Idea":{"Ar":"الاشتقاق يحافظ على التركيب الخطي.","En":"Differentiation is linear."},"FormulaLatex":"h'=2f'-4g'","Steps":[{"Ar":"$10+12=22$","En":"$10+12=22$"}],"Substitution":{"Ar":"$2\\cdot5-4(-3)$","En":"$2\\cdot5-4(-3)$"},"Result":{"Ar":"$22$","En":"$22$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$22-10=12$","En":"$22-10=12$"},"CommonError":{"Ar":"طرح 12 بدلاً من جمعها.","En":"Subtracts twelve instead of adding it."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 12 بدلاً من جمعها.","En":"Subtracts twelve instead of adding it."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل المعاملين.","En":"Ignores the coefficients."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result's sign."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);

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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v58 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
