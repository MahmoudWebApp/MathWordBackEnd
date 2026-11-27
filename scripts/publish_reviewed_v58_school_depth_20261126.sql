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

Subtracts twelve instead of adding it.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزّع الاشتقاق على الحدين.","En":"Distribute differentiation across the terms."},{"Ar":"انتبه إلى طرح عدد سالب.","En":"Remember that subtracting a negative adds."}],"Solution":{"Idea":{"Ar":"الاشتقاق يحافظ على التركيب الخطي.","En":"Differentiation is linear."},"FormulaLatex":"h'=2f'-4g'","Steps":[{"Ar":"$10+12=22$","En":"$10+12=22$"}],"Substitution":{"Ar":"$2\\cdot5-4(-3)$","En":"$2\\cdot5-4(-3)$"},"Result":{"Ar":"$22$","En":"$22$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$22-10=12$","En":"$22-10=12$"},"CommonError":{"Ar":"طرح 12 بدلاً من جمعها.","En":"Subtracts twelve instead of adding it."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 12 بدلاً من جمعها.","En":"Subtracts twelve instead of adding it."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل المعاملين.","En":"Ignores the coefficients."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة الناتج.","En":"Reverses the result's sign."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v58-grade-11-derivative-polynomial-identify-original-up-to-constant-1$mw$,$mw$derivative-polynomial-identify-original-up-to-constant$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز كثيرة حدود من مشتقتها","En":"Identifying a polynomial from its derivative"},"Question":{"Ar":"أي دالة من الخيارات مشتقتها $6x^2-4$؟","En":"Which of the following functions has derivative $6x^2-4$?"},"Options":[{"LatexCode":"2x^3-4+7x","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x²+7.","En":"Its derivative is 6x²+7."}},{"LatexCode":"3x^2-4x+7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x−4.","En":"Its derivative is 6x−4."}},{"LatexCode":"2x^3-4x+7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6x^3-4x+7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."}}],"Hints":[{"Ar":"اشتق الحد التكعيبي.","En":"Differentiate the cubic term."},{"Ar":"الثابت وحده مشتقته صفر.","En":"A constant alone has zero derivative."}],"Solution":{"Idea":{"Ar":"نشتق كل خيار ونقارن بالمشتقة المطلوبة.","En":"Differentiate the choices and compare with the required derivative."},"FormulaLatex":"\\frac{d}{dx}x^n=nx^{n-1}","Steps":[{"Ar":"$6x^2-4+0=6x^2-4$","En":"$6x^2-4+0=6x^2-4$"}],"Substitution":{"Ar":"$\\frac{d}{dx}(2x^3-4x+7)$","En":"$\\frac{d}{dx}(2x^3-4x+7)$"},"Result":{"Ar":"$2x^3-4x+7$","En":"$2x^3-4x+7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(1)=2$","En":"$f'(1)=2$"},"CommonError":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."}}}$mw$::jsonb,$mw$نشتق كل خيار ونقارن بالمشتقة المطلوبة.

$\frac{d}{dx}x^n=nx^{n-1}$

1. $6x^2-4+0=6x^2-4$

$\frac{d}{dx}(2x^3-4x+7)$

$2x^3-4x+7$

$f'(1)=2$

مشتقتها 18x²−4.$mw$,$mw$Differentiate the choices and compare with the required derivative.

$\frac{d}{dx}x^n=nx^{n-1}$

1. $6x^2-4+0=6x^2-4$

$\frac{d}{dx}(2x^3-4x+7)$

$2x^3-4x+7$

$f'(1)=2$

Its derivative is 18x²−4.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشتق الحد التكعيبي.","En":"Differentiate the cubic term."},{"Ar":"الثابت وحده مشتقته صفر.","En":"A constant alone has zero derivative."}],"Solution":{"Idea":{"Ar":"نشتق كل خيار ونقارن بالمشتقة المطلوبة.","En":"Differentiate the choices and compare with the required derivative."},"FormulaLatex":"\\frac{d}{dx}x^n=nx^{n-1}","Steps":[{"Ar":"$6x^2-4+0=6x^2-4$","En":"$6x^2-4+0=6x^2-4$"}],"Substitution":{"Ar":"$\\frac{d}{dx}(2x^3-4x+7)$","En":"$\\frac{d}{dx}(2x^3-4x+7)$"},"Result":{"Ar":"$2x^3-4x+7$","En":"$2x^3-4x+7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(1)=2$","En":"$f'(1)=2$"},"CommonError":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x²+7.","En":"Its derivative is 6x²+7."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x−4.","En":"Its derivative is 6x−4."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."},"Order":4}]}$mw$),
($mw$growth-v58-grade-7-circle-area-diameter-scale-inverse-1$mw$,$mw$circle-area-diameter-scale-inverse$mw$,$mw$middle-circle-area$mw$,$mw$grade-7$mw$,7,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير مساحة دائرة بتغير قطرها","En":"Circle area after diameter changes"},"Question":{"Ar":"إذا أصبح قطر دائرة ثلاثة أمثال قطرها الأصلي، فكم مرة تصبح مساحتها مقارنة بمساحتها الأصلية؟","En":"If a circle's diameter is tripled, how many times its original area is its new area?"},"Options":[{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"رفع معامل الطول للقوة الثالثة.","En":"Cubes the length scale."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف معامل الطول فقط.","En":"Only doubles the length scale."}}],"Hints":[{"Ar":"كيف يتغير نصف القطر؟","En":"How does the radius change?"},{"Ar":"ربع معامل تغير الطول.","En":"Square the length scale."}],"Solution":{"Idea":{"Ar":"نصف القطر يتغير بالمعامل نفسه، والمساحة تتناسب مع مربعه.","En":"The radius scales by the same factor, and area scales with its square."},"FormulaLatex":"A'=\\pi(3r)^2","Steps":[{"Ar":"$A'=9A$","En":"$A'=9A$"}],"Substitution":{"Ar":"$A'/A=9\\pi r^2/(\\pi r^2)$","En":"$A'/A=9\\pi r^2/(\\pi r^2)$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$r=1:\\ 9\\pi/\\pi=9$","En":"$r=1:\\ 9\\pi/\\pi=9$"},"CommonError":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."}}}$mw$::jsonb,$mw$نصف القطر يتغير بالمعامل نفسه، والمساحة تتناسب مع مربعه.

$A'=\pi(3r)^2$

1. $A'=9A$

$A'/A=9\pi r^2/(\pi r^2)$

$9$

$r=1:\ 9\pi/\pi=9$

عامل المساحة كأنه طول.$mw$,$mw$The radius scales by the same factor, and area scales with its square.

$A'=\pi(3r)^2$

1. $A'=9A$

$A'/A=9\pi r^2/(\pi r^2)$

$9$

$r=1:\ 9\pi/\pi=9$

Treats area as a length.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كيف يتغير نصف القطر؟","En":"How does the radius change?"},{"Ar":"ربع معامل تغير الطول.","En":"Square the length scale."}],"Solution":{"Idea":{"Ar":"نصف القطر يتغير بالمعامل نفسه، والمساحة تتناسب مع مربعه.","En":"The radius scales by the same factor, and area scales with its square."},"FormulaLatex":"A'=\\pi(3r)^2","Steps":[{"Ar":"$A'=9A$","En":"$A'=9A$"}],"Substitution":{"Ar":"$A'/A=9\\pi r^2/(\\pi r^2)$","En":"$A'/A=9\\pi r^2/(\\pi r^2)$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$r=1:\\ 9\\pi/\\pi=9$","En":"$r=1:\\ 9\\pi/\\pi=9$"},"CommonError":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"رفع معامل الطول للقوة الثالثة.","En":"Cubes the length scale."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف معامل الطول فقط.","En":"Only doubles the length scale."},"Order":4}]}$mw$),
($mw$growth-v58-grade-12-trig-identity-squared-ratio-reconstruct-cotangent-1$mw$,$mw$trig-identity-squared-ratio-reconstruct-cotangent$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج مربع ظل التمام","En":"Recovering cotangent squared"},"Question":{"Ar":"إذا كان $\\sin^2\\theta=\\frac29$، فما قيمة $\\cot^2\\theta$؟","En":"If $\\sin^2\\theta=\\frac29$, find $\\cot^2\\theta$."},"Options":[{"LatexCode":"\\frac92","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع قاطع التمام.","En":"This is cosecant squared."}},{"LatexCode":"\\frac72","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."}},{"LatexCode":"\\frac79","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع جيب التمام وحده.","En":"This is cosine squared alone."}}],"Hints":[{"Ar":"استعمل مجموع المربعين.","En":"Use the sum-of-squares identity."},{"Ar":"ظل التمام هو جيب التمام على الجيب.","En":"Cotangent is cosine over sine."}],"Solution":{"Idea":{"Ar":"نوجد مربع جيب التمام ثم نقسمه على مربع الجيب.","En":"Find cosine squared, then divide by sine squared."},"FormulaLatex":"\\cot^2\\theta=(1-\\sin^2\\theta)/\\sin^2\\theta","Steps":[{"Ar":"$\\cos^2\\theta=7/9$","En":"$\\cos^2\\theta=7/9$"},{"Ar":"$(7/9)/(2/9)=7/2$","En":"$(7/9)/(2/9)=7/2$"}],"Substitution":{"Ar":"$(1-2/9)/(2/9)$","En":"$(1-2/9)/(2/9)$"},"Result":{"Ar":"$\\frac72$","En":"$\\frac72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1+7/2=9/2$","En":"$1+7/2=9/2$"},"CommonError":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."}}}$mw$::jsonb,$mw$نوجد مربع جيب التمام ثم نقسمه على مربع الجيب.

$\cot^2\theta=(1-\sin^2\theta)/\sin^2\theta$

1. $\cos^2\theta=7/9$

2. $(7/9)/(2/9)=7/2$

$(1-2/9)/(2/9)$

$\frac72$

$1+7/2=9/2$

عكس نسبة جيب التمام إلى الجيب.$mw$,$mw$Find cosine squared, then divide by sine squared.

$\cot^2\theta=(1-\sin^2\theta)/\sin^2\theta$

1. $\cos^2\theta=7/9$

2. $(7/9)/(2/9)=7/2$

$(1-2/9)/(2/9)$

$\frac72$

$1+7/2=9/2$

Inverts the cosine-to-sine ratio.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل مجموع المربعين.","En":"Use the sum-of-squares identity."},{"Ar":"ظل التمام هو جيب التمام على الجيب.","En":"Cotangent is cosine over sine."}],"Solution":{"Idea":{"Ar":"نوجد مربع جيب التمام ثم نقسمه على مربع الجيب.","En":"Find cosine squared, then divide by sine squared."},"FormulaLatex":"\\cot^2\\theta=(1-\\sin^2\\theta)/\\sin^2\\theta","Steps":[{"Ar":"$\\cos^2\\theta=7/9$","En":"$\\cos^2\\theta=7/9$"},{"Ar":"$(7/9)/(2/9)=7/2$","En":"$(7/9)/(2/9)=7/2$"}],"Substitution":{"Ar":"$(1-2/9)/(2/9)$","En":"$(1-2/9)/(2/9)$"},"Result":{"Ar":"$\\frac72$","En":"$\\frac72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1+7/2=9/2$","En":"$1+7/2=9/2$"},"CommonError":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع قاطع التمام.","En":"This is cosecant squared."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع جيب التمام وحده.","En":"This is cosine squared alone."},"Order":4}]}$mw$),
($mw$growth-v58-grade-2-solid-pyramid-base-face-count-1$mw$,$mw$solid-pyramid-base-face-count$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أوجه هرم مربع القاعدة","En":"Faces of a square pyramid"},"Question":{"Ar":"هرم قاعدته مربع وله وجه مثلث عند كل ضلع من أضلاع القاعدة. كم وجهاً مستوياً له إجمالاً؟","En":"A square-based pyramid has one triangular face along each base edge. How many flat faces does it have altogether?"},"Options":[{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف وجهاً غير موجود.","En":"Adds a nonexistent face."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين الأوجه والحواف.","En":"Confuses faces with edges."}}],"Hints":[{"Ar":"عد الأوجه المثلثة.","En":"Count triangular faces."},{"Ar":"لا تنس القاعدة المربعة.","En":"Include the square base."}],"Solution":{"Idea":{"Ar":"للقاعدة أربعة أضلاع، ولكل ضلع وجه مثلث، ونضيف القاعدة.","En":"Four base edges give four triangular faces, plus the base."},"FormulaLatex":"4+1","Steps":[{"Ar":"$4+1=5$","En":"$4+1=5$"}],"Substitution":{"Ar":"$4+1$","En":"$4+1$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5-1=4$","En":"$5-1=4$"},"CommonError":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."}}}$mw$::jsonb,$mw$للقاعدة أربعة أضلاع، ولكل ضلع وجه مثلث، ونضيف القاعدة.

$4+1$

1. $4+1=5$

$4+1$

$5$

$5-1=4$

عد الأوجه المثلثة فقط.$mw$,$mw$Four base edges give four triangular faces, plus the base.

$4+1$

1. $4+1=5$

$4+1$

$5$

$5-1=4$

Counts triangular faces only.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد الأوجه المثلثة.","En":"Count triangular faces."},{"Ar":"لا تنس القاعدة المربعة.","En":"Include the square base."}],"Solution":{"Idea":{"Ar":"للقاعدة أربعة أضلاع، ولكل ضلع وجه مثلث، ونضيف القاعدة.","En":"Four base edges give four triangular faces, plus the base."},"FormulaLatex":"4+1","Steps":[{"Ar":"$4+1=5$","En":"$4+1=5$"}],"Substitution":{"Ar":"$4+1$","En":"$4+1$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5-1=4$","En":"$5-1=4$"},"CommonError":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف وجهاً غير موجود.","En":"Adds a nonexistent face."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خلط بين الأوجه والحواف.","En":"Confuses faces with edges."},"Order":4}]}$mw$),
($mw$growth-v58-grade-2-shape-partition-quarter-recombine-count-1$mw$,$mw$shape-partition-quarter-recombine-count$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إعادة تركيب أنصاف من أرباع","En":"Recombining quarters into halves"},"Question":{"Ar":"قُسم مربع إلى أربعة أجزاء متساوية المساحة. نريد تجميع الأجزاء على هيئة مجموعات، كل مجموعة مساحتها نصف مساحة المربع. كم مجموعة يمكن تكوينها باستعمال جميع الأجزاء دون تداخل؟","En":"A square is divided into four equal-area parts. Group the parts so each group has half the square's area. How many groups use all parts without overlap?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يتطلب ستة أرباع.","En":"Would require six quarters."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد الأرباع منفردة لا الأنصاف.","En":"Counts separate quarters rather than halves."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"كم ربعاً يشكل نصفاً؟","En":"How many quarters make one half?"},{"Ar":"قسّم الأرباع الأربعة إلى أزواج.","En":"Group four quarters into pairs."}],"Solution":{"Idea":{"Ar":"كل نصف يتألف من ربعين.","En":"Each half consists of two quarters."},"FormulaLatex":"4/2","Steps":[{"Ar":"$4/2=2$","En":"$4/2=2$"}],"Substitution":{"Ar":"$4/2$","En":"$4/2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot(1/2)=1$","En":"$2\\cdot(1/2)=1$"},"CommonError":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."}}}$mw$::jsonb,$mw$كل نصف يتألف من ربعين.

$4/2$

1. $4/2=2$

$4/2$

$2$

$2\cdot(1/2)=1$

لا يستعمل كل الأجزاء.$mw$,$mw$Each half consists of two quarters.

$4/2$

1. $4/2=2$

$4/2$

$2$

$2\cdot(1/2)=1$

Does not use all parts.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم ربعاً يشكل نصفاً؟","En":"How many quarters make one half?"},{"Ar":"قسّم الأرباع الأربعة إلى أزواج.","En":"Group four quarters into pairs."}],"Solution":{"Idea":{"Ar":"كل نصف يتألف من ربعين.","En":"Each half consists of two quarters."},"FormulaLatex":"4/2","Steps":[{"Ar":"$4/2=2$","En":"$4/2=2$"}],"Substitution":{"Ar":"$4/2$","En":"$4/2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot(1/2)=1$","En":"$2\\cdot(1/2)=1$"},"CommonError":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يتطلب ستة أرباع.","En":"Would require six quarters."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعد الأرباع منفردة لا الأنصاف.","En":"Counts separate quarters rather than halves."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
