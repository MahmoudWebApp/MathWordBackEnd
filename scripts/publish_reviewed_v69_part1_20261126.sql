-- One-time owner-authorized v69 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v69-grade-3-carry-chain-changed-digit-count-1$mw$,$mw$carry-chain-changed-digit-count$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير الأرقام عند الحمل","En":"Digits changed by carrying"},"Question":{"Ar":"عند إضافة 1 إلى العدد 299، كم منزلة يتغير رقمها؟","En":"When adding one to 299, how many digit positions change?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تغيرت الآحاد والعشرات والمئات.","En":"Ones, tens and hundreds all change."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الحمل إلى المئات.","En":"Misses the carry into hundreds."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العدد الجديد مختلف عن القديم.","En":"The new number differs from the old."}}],"Hints":[{"Ar":"ابدأ بجمع الآحاد.","En":"Start with the ones digit."},{"Ar":"قارن كل منزلة قبل الجمع وبعده.","En":"Compare every digit position before and after."}],"Solution":{"Idea":{"Ar":"الحمل من الآحاد ينتقل عبر العشرات إلى المئات.","En":"A carry passes from ones through tens into hundreds."},"FormulaLatex":"299+1=300","Steps":[{"Ar":"$299\\to300$","En":"$299\\to300$"},{"Ar":"$2\\to3,\\quad9\\to0,\\quad9\\to0$","En":"$2\\to3,\\quad9\\to0,\\quad9\\to0$"}],"Substitution":{"Ar":"$299+1=300$","En":"$299+1=300$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الفرق بين 300 و299 يساوي 1، وجميع المنازل الثلاث مختلفة.","En":"The difference is one, and all three positions differ."},"CommonError":{"Ar":"تغيرت الآحاد والعشرات والمئات.","En":"Ones, tens and hundreds all change."}}}$mw$::jsonb,$mw$الحمل من الآحاد ينتقل عبر العشرات إلى المئات.

$299+1=300$

1. $299\to300$

2. $2\to3,\quad9\to0,\quad9\to0$

$299+1=300$

$3$

الفرق بين 300 و299 يساوي 1، وجميع المنازل الثلاث مختلفة.

تغيرت الآحاد والعشرات والمئات.$mw$,$mw$A carry passes from ones through tens into hundreds.

$299+1=300$

1. $299\to300$

2. $2\to3,\quad9\to0,\quad9\to0$

$299+1=300$

$3$

The difference is one, and all three positions differ.

Ones, tens and hundreds all change.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بجمع الآحاد.","En":"Start with the ones digit."},{"Ar":"قارن كل منزلة قبل الجمع وبعده.","En":"Compare every digit position before and after."}],"Solution":{"Idea":{"Ar":"الحمل من الآحاد ينتقل عبر العشرات إلى المئات.","En":"A carry passes from ones through tens into hundreds."},"FormulaLatex":"299+1=300","Steps":[{"Ar":"$299\\to300$","En":"$299\\to300$"},{"Ar":"$2\\to3,\\quad9\\to0,\\quad9\\to0$","En":"$2\\to3,\\quad9\\to0,\\quad9\\to0$"}],"Substitution":{"Ar":"$299+1=300$","En":"$299+1=300$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الفرق بين 300 و299 يساوي 1، وجميع المنازل الثلاث مختلفة.","En":"The difference is one, and all three positions differ."},"CommonError":{"Ar":"تغيرت الآحاد والعشرات والمئات.","En":"Ones, tens and hundreds all change."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تغيرت الآحاد والعشرات والمئات.","En":"Ones, tens and hundreds all change."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الحمل إلى المئات.","En":"Misses the carry into hundreds."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"العدد الجديد مختلف عن القديم.","En":"The new number differs from the old."},"Order":4}]}$mw$),
($mw$growth-v69-university-level-2-strict-row-diagonal-dominance-permutation-1$mw$,$mw$strict-row-diagonal-dominance-permutation$mw$,$mw$linear-systems$mw$,$mw$university-level-2$mw$,21,4,90,332,$mw${"StageId":4,"CategoryId":90,"PrimarySkillId":332,"SecondarySkillIds":[],"TrackIds":[21],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب الصفوف للسيادة القطرية","En":"Row ordering for diagonal dominance"},"Question":{"Ar":"للنظام $x+5y=11$ و$4x+2y=8$، أي إجراء يجعل مصفوفة المعاملات سائدة قطرياً بصرامة؟ A تبديل المعادلتين، B ضرب الأولى في 2، C ضرب الثانية في 2، D إبقاء الترتيب.","En":"For $x+5y=11$ and $4x+2y=8$, which operation makes the coefficient matrix strictly row diagonally dominant? A: swap equations; B: double first equation; C: double second equation; D: keep order."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب يحافظ على نسبة المعاملات في الصف.","En":"Scaling preserves the ratio within the row."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يغير الضرب موضع المعامل الأكبر.","En":"Scaling does not move the larger coefficient."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المعاملان القطريان الحاليان أصغر من غير القطريين.","En":"The original diagonal entries are smaller than off-diagonal entries."}}],"Hints":[{"Ar":"افحص المعامل الأكبر في كل معادلة.","En":"Inspect the larger coefficient in each equation."},{"Ar":"ضع معامل كل متغير الأكبر في موضعه القطري.","En":"Place the larger coefficient of each variable on its diagonal."}],"Solution":{"Idea":{"Ar":"نحتاج أن تتجاوز القيمة المطلقة للمعامل القطري مجموع القيم المطلقة لباقي معاملات صفه.","En":"Each diagonal magnitude must exceed the sum of off-diagonal magnitudes in its row."},"FormulaLatex":"|a_{ii}|>\\sum_{j\\ne i}|a_{ij}|","Steps":[{"Ar":"$4>2$","En":"$4>2$"},{"Ar":"$5>1$","En":"$5>1$"}],"Substitution":{"Ar":"$\\begin{pmatrix}4&2\\\\1&5\\end{pmatrix}$","En":"$\\begin{pmatrix}4&2\\\\1&5\\end{pmatrix}$"},"Result":{"Ar":"A — تبديل المعادلتين.","En":"A — swap the equations."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد التبديل تتحقق المتباينتان في الصفين.","En":"Both strict inequalities hold after swapping."},"CommonError":{"Ar":"الضرب يحافظ على نسبة المعاملات في الصف.","En":"Scaling preserves the ratio within the row."}}}$mw$::jsonb,$mw$نحتاج أن تتجاوز القيمة المطلقة للمعامل القطري مجموع القيم المطلقة لباقي معاملات صفه.

$|a_{ii}|>\sum_{j\ne i}|a_{ij}|$

1. $4>2$

2. $5>1$

$\begin{pmatrix}4&2\\1&5\end{pmatrix}$

A — تبديل المعادلتين.

بعد التبديل تتحقق المتباينتان في الصفين.

الضرب يحافظ على نسبة المعاملات في الصف.$mw$,$mw$Each diagonal magnitude must exceed the sum of off-diagonal magnitudes in its row.

$|a_{ii}|>\sum_{j\ne i}|a_{ij}|$

1. $4>2$

2. $5>1$

$\begin{pmatrix}4&2\\1&5\end{pmatrix}$

A — swap the equations.

Both strict inequalities hold after swapping.

Scaling preserves the ratio within the row.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"افحص المعامل الأكبر في كل معادلة.","En":"Inspect the larger coefficient in each equation."},{"Ar":"ضع معامل كل متغير الأكبر في موضعه القطري.","En":"Place the larger coefficient of each variable on its diagonal."}],"Solution":{"Idea":{"Ar":"نحتاج أن تتجاوز القيمة المطلقة للمعامل القطري مجموع القيم المطلقة لباقي معاملات صفه.","En":"Each diagonal magnitude must exceed the sum of off-diagonal magnitudes in its row."},"FormulaLatex":"|a_{ii}|>\\sum_{j\\ne i}|a_{ij}|","Steps":[{"Ar":"$4>2$","En":"$4>2$"},{"Ar":"$5>1$","En":"$5>1$"}],"Substitution":{"Ar":"$\\begin{pmatrix}4&2\\\\1&5\\end{pmatrix}$","En":"$\\begin{pmatrix}4&2\\\\1&5\\end{pmatrix}$"},"Result":{"Ar":"A — تبديل المعادلتين.","En":"A — swap the equations."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد التبديل تتحقق المتباينتان في الصفين.","En":"Both strict inequalities hold after swapping."},"CommonError":{"Ar":"الضرب يحافظ على نسبة المعاملات في الصف.","En":"Scaling preserves the ratio within the row."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الضرب يحافظ على نسبة المعاملات في الصف.","En":"Scaling preserves the ratio within the row."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يغير الضرب موضع المعامل الأكبر.","En":"Scaling does not move the larger coefficient."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المعاملان القطريان الحاليان أصغر من غير القطريين.","En":"The original diagonal entries are smaller than off-diagonal entries."},"Order":4}]}$mw$),
($mw$growth-v69-grade-8-stacked-bar-segment-from-top-and-base-1$mw$,$mw$stacked-bar-segment-from-top-and-base$mw$,$mw$m-statistics-charts$mw$,$mw$grade-8$mw$,8,2,22,100,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":100,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قراءة جزء من عمود تراكمي","En":"Reading a stacked bar segment"},"Question":{"Ar":"في عمود تراكمي يبدأ عند الصفر، ينتهي الجزء الأول عند 18 وينتهي الثاني عند 30 والثالث عند 40. ما قيمة الجزء الثاني؟","En":"A stacked bar starts at zero. The first segment ends at 18, the second at 30, and the third at 40. What count does the second segment represent?"},"Options":[{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه النهاية التراكمية للجزء الثاني.","En":"Uses its cumulative endpoint."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الجزء الأول.","En":"Uses the first segment."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الجزء الثالث.","En":"Uses the third segment."}}],"Hints":[{"Ar":"حدد بداية الجزء الثاني.","En":"Identify the base of the second segment."},{"Ar":"اطرحها من نهايته.","En":"Subtract it from its top."}],"Solution":{"Idea":{"Ar":"قيمة الجزء هي الفرق بين نهايته وبدايته.","En":"A segment's count is its top minus its base."},"FormulaLatex":"30-18","Steps":[{"Ar":"$30-18=12$","En":"$30-18=12$"}],"Substitution":{"Ar":"$30-18$","En":"$30-18$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$18+12+10=40$ وهو إجمالي العمود.","En":"$18+12+10=40$, the total bar height."},"CommonError":{"Ar":"هذه النهاية التراكمية للجزء الثاني.","En":"Uses its cumulative endpoint."}}}$mw$::jsonb,$mw$قيمة الجزء هي الفرق بين نهايته وبدايته.

$30-18$

1. $30-18=12$

$30-18$

$12$

$18+12+10=40$ وهو إجمالي العمود.

هذه النهاية التراكمية للجزء الثاني.$mw$,$mw$A segment's count is its top minus its base.

$30-18$

1. $30-18=12$

$30-18$

$12$

$18+12+10=40$, the total bar height.

Uses its cumulative endpoint.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد بداية الجزء الثاني.","En":"Identify the base of the second segment."},{"Ar":"اطرحها من نهايته.","En":"Subtract it from its top."}],"Solution":{"Idea":{"Ar":"قيمة الجزء هي الفرق بين نهايته وبدايته.","En":"A segment's count is its top minus its base."},"FormulaLatex":"30-18","Steps":[{"Ar":"$30-18=12$","En":"$30-18=12$"}],"Substitution":{"Ar":"$30-18$","En":"$30-18$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$18+12+10=40$ وهو إجمالي العمود.","En":"$18+12+10=40$, the total bar height."},"CommonError":{"Ar":"هذه النهاية التراكمية للجزء الثاني.","En":"Uses its cumulative endpoint."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه النهاية التراكمية للجزء الثاني.","En":"Uses its cumulative endpoint."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الجزء الأول.","En":"Uses the first segment."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الجزء الثالث.","En":"Uses the third segment."},"Order":4}]}$mw$),
($mw$growth-v69-grade-10-arithmetic-stride-subsequence-difference-1$mw$,$mw$arithmetic-stride-subsequence-difference$mw$,$mw$s-sequences-series-arithmetic-sequences$mw$,$mw$grade-10$mw$,10,3,23,104,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":104,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق متتالية مأخوذة بخطوات","En":"Arithmetic subsequence stride"},"Question":{"Ar":"متتالية حسابية فرقها المشترك -3. نأخذ الحدود $a_2,a_6,a_{10},\\ldots$ بهذا الترتيب. ما فرق المتتالية الجديدة؟","En":"An arithmetic sequence has common difference -3. Select $a_2,a_6,a_{10},\\ldots$ in order. What is the new common difference?"},"Options":[{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تجاهل تخطي الحدود.","En":"Ignores the skipped indices."}},{"LatexCode":"-6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب خطوتين لا أربعاً.","En":"Counts two steps instead of four."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فقد إشارة الفرق.","En":"Loses the negative sign."}},{"LatexCode":"-12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اطرح فهرسين متتاليين من الاختيار.","En":"Subtract two consecutive selected indices."},{"Ar":"اضرب عدد الخطوات بالفرق الأصلي.","En":"Multiply the stride by the original difference."}],"Solution":{"Idea":{"Ar":"فرق الفهرسين المتتاليين في المتتالية المختارة يساوي 4.","En":"Adjacent selected indices differ by four."},"FormulaLatex":"a_{n+4}-a_n=4d","Steps":[{"Ar":"$4\\cdot(-3)=-12$","En":"$4\\cdot(-3)=-12$"}],"Substitution":{"Ar":"$a_{n+4}-a_n=4d$","En":"$a_{n+4}-a_n=4d$"},"Result":{"Ar":"$-12$","En":"$-12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا كان $a_2=20$ فإن $a_6=8$ و$a_{10}=-4$، والفرقان -12.","En":"If $a_2=20$, then $a_6=8$ and $a_{10}=-4$, both gaps -12."},"CommonError":{"Ar":"تجاهل تخطي الحدود.","En":"Ignores the skipped indices."}}}$mw$::jsonb,$mw$فرق الفهرسين المتتاليين في المتتالية المختارة يساوي 4.

$a_{n+4}-a_n=4d$

1. $4\cdot(-3)=-12$

$a_{n+4}-a_n=4d$

$-12$

إذا كان $a_2=20$ فإن $a_6=8$ و$a_{10}=-4$، والفرقان -12.

تجاهل تخطي الحدود.$mw$,$mw$Adjacent selected indices differ by four.

$a_{n+4}-a_n=4d$

1. $4\cdot(-3)=-12$

$a_{n+4}-a_n=4d$

$-12$

If $a_2=20$, then $a_6=8$ and $a_{10}=-4$, both gaps -12.

Ignores the skipped indices.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح فهرسين متتاليين من الاختيار.","En":"Subtract two consecutive selected indices."},{"Ar":"اضرب عدد الخطوات بالفرق الأصلي.","En":"Multiply the stride by the original difference."}],"Solution":{"Idea":{"Ar":"فرق الفهرسين المتتاليين في المتتالية المختارة يساوي 4.","En":"Adjacent selected indices differ by four."},"FormulaLatex":"a_{n+4}-a_n=4d","Steps":[{"Ar":"$4\\cdot(-3)=-12$","En":"$4\\cdot(-3)=-12$"}],"Substitution":{"Ar":"$a_{n+4}-a_n=4d$","En":"$a_{n+4}-a_n=4d$"},"Result":{"Ar":"$-12$","En":"$-12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا كان $a_2=20$ فإن $a_6=8$ و$a_{10}=-4$، والفرقان -12.","En":"If $a_2=20$, then $a_6=8$ and $a_{10}=-4$, both gaps -12."},"CommonError":{"Ar":"تجاهل تخطي الحدود.","En":"Ignores the skipped indices."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تجاهل تخطي الحدود.","En":"Ignores the skipped indices."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب خطوتين لا أربعاً.","En":"Counts two steps instead of four."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"فقد إشارة الفرق.","En":"Loses the negative sign."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v69-grade-10-geometric-ratio-of-consecutive-differences-1$mw$,$mw$geometric-ratio-of-consecutive-differences$mw$,$mw$s-sequences-series-geometric-sequences$mw$,$mw$grade-10$mw$,10,3,23,103,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":103,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة الفروق في متتالية هندسية","En":"Ratio of successive differences"},"Question":{"Ar":"متتالية هندسية أساسها 3 وحدها الأول غير صفري. ما قيمة $(a_4-a_3)/(a_3-a_2)$؟","En":"A geometric sequence has ratio three and nonzero first term. Find $(a_4-a_3)/(a_3-a_2)$."},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن الفروق ثابتة.","En":"Assumes constant differences."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل مربع الأساس.","En":"Uses the squared ratio."}},{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب القسمة.","En":"Reverses the quotient."}}],"Hints":[{"Ar":"عبر عن الحدين الرابع والثالث بواسطة السابقين.","En":"Express the fourth and third terms using their predecessors."},{"Ar":"استخرج العامل المشترك من البسط.","En":"Factor out the common factor in the numerator."}],"Solution":{"Idea":{"Ar":"ضرب حدين متتاليين في الأساس يضرب الفرق بينهما في الأساس نفسه.","En":"Multiplying both successive terms by the ratio multiplies their difference by that ratio."},"FormulaLatex":"a_4-a_3=3(a_3-a_2)","Steps":[{"Ar":"$a_4=3a_3,\\quad a_3=3a_2$","En":"$a_4=3a_3,\\quad a_3=3a_2$"},{"Ar":"$\\frac{a_4-a_3}{a_3-a_2}=3$","En":"$\\frac{a_4-a_3}{a_3-a_2}=3$"}],"Substitution":{"Ar":"$a_4-a_3=3(a_3-a_2)$","En":"$a_4-a_3=3(a_3-a_2)$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"للحدود 1،3،9،27 يكون $18/6=3$.","En":"For terms 1,3,9,27 the quotient is $18/6=3$."},"CommonError":{"Ar":"افترض أن الفروق ثابتة.","En":"Assumes constant differences."}}}$mw$::jsonb,$mw$ضرب حدين متتاليين في الأساس يضرب الفرق بينهما في الأساس نفسه.

$a_4-a_3=3(a_3-a_2)$

1. $a_4=3a_3,\quad a_3=3a_2$

2. $\frac{a_4-a_3}{a_3-a_2}=3$

$a_4-a_3=3(a_3-a_2)$

$3$

للحدود 1،3،9،27 يكون $18/6=3$.

افترض أن الفروق ثابتة.$mw$,$mw$Multiplying both successive terms by the ratio multiplies their difference by that ratio.

$a_4-a_3=3(a_3-a_2)$

1. $a_4=3a_3,\quad a_3=3a_2$

2. $\frac{a_4-a_3}{a_3-a_2}=3$

$a_4-a_3=3(a_3-a_2)$

$3$

For terms 1,3,9,27 the quotient is $18/6=3$.

Assumes constant differences.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عبر عن الحدين الرابع والثالث بواسطة السابقين.","En":"Express the fourth and third terms using their predecessors."},{"Ar":"استخرج العامل المشترك من البسط.","En":"Factor out the common factor in the numerator."}],"Solution":{"Idea":{"Ar":"ضرب حدين متتاليين في الأساس يضرب الفرق بينهما في الأساس نفسه.","En":"Multiplying both successive terms by the ratio multiplies their difference by that ratio."},"FormulaLatex":"a_4-a_3=3(a_3-a_2)","Steps":[{"Ar":"$a_4=3a_3,\\quad a_3=3a_2$","En":"$a_4=3a_3,\\quad a_3=3a_2$"},{"Ar":"$\\frac{a_4-a_3}{a_3-a_2}=3$","En":"$\\frac{a_4-a_3}{a_3-a_2}=3$"}],"Substitution":{"Ar":"$a_4-a_3=3(a_3-a_2)$","En":"$a_4-a_3=3(a_3-a_2)$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"للحدود 1،3،9،27 يكون $18/6=3$.","En":"For terms 1,3,9,27 the quotient is $18/6=3$."},"CommonError":{"Ar":"افترض أن الفروق ثابتة.","En":"Assumes constant differences."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"افترض أن الفروق ثابتة.","En":"Assumes constant differences."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل مربع الأساس.","En":"Uses the squared ratio."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب القسمة.","En":"Reverses the quotient."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v69 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
