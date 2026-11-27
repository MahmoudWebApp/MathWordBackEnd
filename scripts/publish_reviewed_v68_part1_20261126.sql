-- One-time owner-authorized v68 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v68-university-level-1-absolute-value-opposite-one-sided-limits-1$mw$,$mw$absolute-value-opposite-one-sided-limits$mw$,$mw$university-function-limits$mw$,$mw$university-level-1$mw$,20,4,16,70,$mw${"StageId":4,"CategoryId":16,"PrimarySkillId":70,"SecondarySkillIds":[],"TrackIds":[20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نهايتان أحاديتان مختلفتان","En":"Opposite one-sided limits"},"Question":{"Ar":"ما قيمة النهاية $\\lim_{x\\to0}|x|/x$ على الأعداد الحقيقية؟ الرمز DNE يعني أن النهاية غير موجودة.","En":"What is the real two-sided limit $\\lim_{x\\to0}|x|/x$? DNE means the limit does not exist."},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عوض بالصفر رغم عدم تعريف الكسر.","En":"Substitutes zero into an undefined quotient."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم النهاية اليمنى فقط.","En":"Uses only the right-hand limit."}},{"LatexCode":"-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم النهاية اليسرى فقط.","En":"Uses only the left-hand limit."}},{"LatexCode":"\\text{DNE}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"افصل حالتي الإشارة.","En":"Separate the two signs."},{"Ar":"قارن النهايتين الأحاديتين.","En":"Compare the one-sided limits."}],"Solution":{"Idea":{"Ar":"النهاية الثنائية موجودة فقط إذا تساوت النهايتان الأحاديتان.","En":"A two-sided limit exists only when both one-sided limits agree."},"FormulaLatex":"|x|/x=\\begin{cases}1&x>0\\\\-1&x<0\\end{cases}","Steps":[{"Ar":"$\\lim_{x\\to0^+}|x|/x=1$","En":"$\\lim_{x\\to0^+}|x|/x=1$"},{"Ar":"$\\lim_{x\\to0^-}|x|/x=-1$","En":"$\\lim_{x\\to0^-}|x|/x=-1$"}],"Substitution":{"Ar":"$1\\ne-1$","En":"$1\\ne-1$"},"Result":{"Ar":"النهاية غير موجودة.","En":"The limit does not exist."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1\\ne-1$؛ النهاية غير موجودة.","En":"$1\\ne-1$; the limit does not exist."},"CommonError":{"Ar":"عوض بالصفر رغم عدم تعريف الكسر.","En":"Substitutes zero into an undefined quotient."}}}$mw$::jsonb,$mw$النهاية الثنائية موجودة فقط إذا تساوت النهايتان الأحاديتان.

$|x|/x=\begin{cases}1&x>0\\-1&x<0\end{cases}$

1. $\lim_{x\to0^+}|x|/x=1$

2. $\lim_{x\to0^-}|x|/x=-1$

$1\ne-1$

النهاية غير موجودة.

$1\ne-1$؛ النهاية غير موجودة.

عوض بالصفر رغم عدم تعريف الكسر.$mw$,$mw$A two-sided limit exists only when both one-sided limits agree.

$|x|/x=\begin{cases}1&x>0\\-1&x<0\end{cases}$

1. $\lim_{x\to0^+}|x|/x=1$

2. $\lim_{x\to0^-}|x|/x=-1$

$1\ne-1$

The limit does not exist.

$1\ne-1$; the limit does not exist.

Substitutes zero into an undefined quotient.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"افصل حالتي الإشارة.","En":"Separate the two signs."},{"Ar":"قارن النهايتين الأحاديتين.","En":"Compare the one-sided limits."}],"Solution":{"Idea":{"Ar":"النهاية الثنائية موجودة فقط إذا تساوت النهايتان الأحاديتان.","En":"A two-sided limit exists only when both one-sided limits agree."},"FormulaLatex":"|x|/x=\\begin{cases}1&x>0\\\\-1&x<0\\end{cases}","Steps":[{"Ar":"$\\lim_{x\\to0^+}|x|/x=1$","En":"$\\lim_{x\\to0^+}|x|/x=1$"},{"Ar":"$\\lim_{x\\to0^-}|x|/x=-1$","En":"$\\lim_{x\\to0^-}|x|/x=-1$"}],"Substitution":{"Ar":"$1\\ne-1$","En":"$1\\ne-1$"},"Result":{"Ar":"النهاية غير موجودة.","En":"The limit does not exist."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1\\ne-1$؛ النهاية غير موجودة.","En":"$1\\ne-1$; the limit does not exist."},"CommonError":{"Ar":"عوض بالصفر رغم عدم تعريف الكسر.","En":"Substitutes zero into an undefined quotient."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عوض بالصفر رغم عدم تعريف الكسر.","En":"Substitutes zero into an undefined quotient."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استخدم النهاية اليمنى فقط.","En":"Uses only the right-hand limit."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استخدم النهاية اليسرى فقط.","En":"Uses only the left-hand limit."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v68-university-level-1-radical-rationalized-increment-1$mw$,$mw$radical-rationalized-increment$mw$,$mw$university-function-limits$mw$,$mw$university-level-1$mw$,20,4,16,70,$mw${"StageId":4,"CategoryId":16,"PrimarySkillId":70,"SecondarySkillIds":[],"TrackIds":[20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نهاية فرق جذري","En":"Limit of a radical increment"},"Question":{"Ar":"احسب $\\lim_{h\\to0}(\\sqrt{9+h}-3)/h$.","En":"Evaluate $\\lim_{h\\to0}(\\sqrt{9+h}-3)/h$."},"Options":[{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الحد الثاني في المرافق.","En":"Omits the second conjugate term."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عوض مباشرة في البسط فقط.","En":"Substitutes in the numerator only."}},{"LatexCode":"\\frac16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس الكسر الناتج.","En":"Inverts the resulting quotient."}}],"Hints":[{"Ar":"اكتب مرافق البسط.","En":"Write the conjugate of the numerator."},{"Ar":"اختزل العامل المشترك قبل التعويض.","En":"Cancel the common factor before substituting."}],"Solution":{"Idea":{"Ar":"نضرب البسط والمقام بالمرافق ونختزل قبل أخذ النهاية.","En":"Multiply by the conjugate and cancel before taking the limit."},"FormulaLatex":"\\frac{\\sqrt{9+h}-3}{h}=\\frac1{\\sqrt{9+h}+3}","Steps":[{"Ar":"$\\frac{(9+h)-9}{h(\\sqrt{9+h}+3)}=\\frac1{\\sqrt{9+h}+3}$","En":"$\\frac{(9+h)-9}{h(\\sqrt{9+h}+3)}=\\frac1{\\sqrt{9+h}+3}$"},{"Ar":"$\\lim_{h\\to0}\\frac1{\\sqrt{9+h}+3}=\\frac16$","En":"$\\lim_{h\\to0}\\frac1{\\sqrt{9+h}+3}=\\frac16$"}],"Substitution":{"Ar":"$1/(3+3)$","En":"$1/(3+3)$"},"Result":{"Ar":"$\\frac16$","En":"$\\frac16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac1{3+3}=\\frac16$","En":"$\\frac1{3+3}=\\frac16$"},"CommonError":{"Ar":"أهمل الحد الثاني في المرافق.","En":"Omits the second conjugate term."}}}$mw$::jsonb,$mw$نضرب البسط والمقام بالمرافق ونختزل قبل أخذ النهاية.

$\frac{\sqrt{9+h}-3}{h}=\frac1{\sqrt{9+h}+3}$

1. $\frac{(9+h)-9}{h(\sqrt{9+h}+3)}=\frac1{\sqrt{9+h}+3}$

2. $\lim_{h\to0}\frac1{\sqrt{9+h}+3}=\frac16$

$1/(3+3)$

$\frac16$

$\frac1{3+3}=\frac16$

أهمل الحد الثاني في المرافق.$mw$,$mw$Multiply by the conjugate and cancel before taking the limit.

$\frac{\sqrt{9+h}-3}{h}=\frac1{\sqrt{9+h}+3}$

1. $\frac{(9+h)-9}{h(\sqrt{9+h}+3)}=\frac1{\sqrt{9+h}+3}$

2. $\lim_{h\to0}\frac1{\sqrt{9+h}+3}=\frac16$

$1/(3+3)$

$\frac16$

$\frac1{3+3}=\frac16$

Omits the second conjugate term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب مرافق البسط.","En":"Write the conjugate of the numerator."},{"Ar":"اختزل العامل المشترك قبل التعويض.","En":"Cancel the common factor before substituting."}],"Solution":{"Idea":{"Ar":"نضرب البسط والمقام بالمرافق ونختزل قبل أخذ النهاية.","En":"Multiply by the conjugate and cancel before taking the limit."},"FormulaLatex":"\\frac{\\sqrt{9+h}-3}{h}=\\frac1{\\sqrt{9+h}+3}","Steps":[{"Ar":"$\\frac{(9+h)-9}{h(\\sqrt{9+h}+3)}=\\frac1{\\sqrt{9+h}+3}$","En":"$\\frac{(9+h)-9}{h(\\sqrt{9+h}+3)}=\\frac1{\\sqrt{9+h}+3}$"},{"Ar":"$\\lim_{h\\to0}\\frac1{\\sqrt{9+h}+3}=\\frac16$","En":"$\\lim_{h\\to0}\\frac1{\\sqrt{9+h}+3}=\\frac16$"}],"Substitution":{"Ar":"$1/(3+3)$","En":"$1/(3+3)$"},"Result":{"Ar":"$\\frac16$","En":"$\\frac16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac1{3+3}=\\frac16$","En":"$\\frac1{3+3}=\\frac16$"},"CommonError":{"Ar":"أهمل الحد الثاني في المرافق.","En":"Omits the second conjugate term."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الحد الثاني في المرافق.","En":"Omits the second conjugate term."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عوض مباشرة في البسط فقط.","En":"Substitutes in the numerator only."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس الكسر الناتج.","En":"Inverts the resulting quotient."},"Order":4}]}$mw$),
($mw$growth-v68-university-level-2-parallel-objective-entire-edge-optimal-1$mw$,$mw$parallel-objective-entire-edge-optimal$mw$,$mw$constrained-optimization$mw$,$mw$university-level-2$mw$,21,4,91,341,$mw${"StageId":4,"CategoryId":91,"PrimarySkillId":341,"SecondarySkillIds":[],"TrackIds":[21],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموعة الحلول المثلى","En":"Optimal edge of feasible region"},"Question":{"Ar":"عظّم $2x+2y$ تحت القيود $x\\ge0,y\\ge0,x+y\\le6$. كم نقطة تحقق القيمة العظمى؟ المتغيران حقيقيان.","En":"Maximize $2x+2y$ subject to $x\\ge0,y\\ge0,x+y\\le6$. How many points attain the maximum? Both variables are real."},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن الحل الأمثل فريد.","En":"Assumes a unique optimum."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد رأسي الضلع فقط.","En":"Counts only the endpoints."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيد المتغيرات بالأعداد الصحيحة دون مبرر.","En":"Restricts variables to integers without justification."}},{"LatexCode":"\\infty","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اربط دالة الهدف بالقيد.","En":"Relate the objective to the constraint."},{"Ar":"افحص الضلع كله لا رأسيه فقط.","En":"Consider the entire edge, not just its vertices."}],"Solution":{"Idea":{"Ar":"الهدف ثابت على الضلع الذي يحقق المساواة في قيد المجموع.","En":"The objective is constant along the edge where the sum constraint is tight."},"FormulaLatex":"2x+2y=2(x+y)\\le12","Steps":[{"Ar":"$2(x+y)\\le12$","En":"$2(x+y)\\le12$"},{"Ar":"$x+y=6,\\quad0\\le x\\le6$","En":"$x+y=6,\\quad0\\le x\\le6$"}],"Substitution":{"Ar":"$2x+2y=2(x+y)\\le12$","En":"$2x+2y=2(x+y)\\le12$"},"Result":{"Ar":"عدد لا نهائي من النقاط.","En":"Infinitely many points."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2t+2(6-t)=12,\\quad0\\le t\\le6$","En":"$2t+2(6-t)=12,\\quad0\\le t\\le6$"},"CommonError":{"Ar":"افترض أن الحل الأمثل فريد.","En":"Assumes a unique optimum."}}}$mw$::jsonb,$mw$الهدف ثابت على الضلع الذي يحقق المساواة في قيد المجموع.

$2x+2y=2(x+y)\le12$

1. $2(x+y)\le12$

2. $x+y=6,\quad0\le x\le6$

$2x+2y=2(x+y)\le12$

عدد لا نهائي من النقاط.

$2t+2(6-t)=12,\quad0\le t\le6$

افترض أن الحل الأمثل فريد.$mw$,$mw$The objective is constant along the edge where the sum constraint is tight.

$2x+2y=2(x+y)\le12$

1. $2(x+y)\le12$

2. $x+y=6,\quad0\le x\le6$

$2x+2y=2(x+y)\le12$

Infinitely many points.

$2t+2(6-t)=12,\quad0\le t\le6$

Assumes a unique optimum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اربط دالة الهدف بالقيد.","En":"Relate the objective to the constraint."},{"Ar":"افحص الضلع كله لا رأسيه فقط.","En":"Consider the entire edge, not just its vertices."}],"Solution":{"Idea":{"Ar":"الهدف ثابت على الضلع الذي يحقق المساواة في قيد المجموع.","En":"The objective is constant along the edge where the sum constraint is tight."},"FormulaLatex":"2x+2y=2(x+y)\\le12","Steps":[{"Ar":"$2(x+y)\\le12$","En":"$2(x+y)\\le12$"},{"Ar":"$x+y=6,\\quad0\\le x\\le6$","En":"$x+y=6,\\quad0\\le x\\le6$"}],"Substitution":{"Ar":"$2x+2y=2(x+y)\\le12$","En":"$2x+2y=2(x+y)\\le12$"},"Result":{"Ar":"عدد لا نهائي من النقاط.","En":"Infinitely many points."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2t+2(6-t)=12,\\quad0\\le t\\le6$","En":"$2t+2(6-t)=12,\\quad0\\le t\\le6$"},"CommonError":{"Ar":"افترض أن الحل الأمثل فريد.","En":"Assumes a unique optimum."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"افترض أن الحل الأمثل فريد.","En":"Assumes a unique optimum."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عد رأسي الضلع فقط.","En":"Counts only the endpoints."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قيد المتغيرات بالأعداد الصحيحة دون مبرر.","En":"Restricts variables to integers without justification."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v68-university-level-2-absolute-affine-convexity-via-maximum-1$mw$,$mw$absolute-affine-convexity-via-maximum$mw$,$mw$convexity$mw$,$mw$university-level-2$mw$,21,4,91,342,$mw${"StageId":4,"CategoryId":91,"PrimarySkillId":342,"SecondarySkillIds":[],"TrackIds":[21],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحدب القيمة المطلقة","En":"Convexity of absolute value"},"Question":{"Ar":"لتكن $f(x)=|2x-4|$ على الأعداد الحقيقية. أي وصف صحيح؟ الخيارات: A محدبة، B مقعرة، C خطية على المجال كله، D غير محدبة.","En":"Let $f(x)=|2x-4|$ on the real line. Which description is correct? A: convex; B: concave; C: affine on the entire domain; D: not convex."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ميلها يزداد ولا ينقص.","En":"Its slope increases rather than decreases."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يتغير الميل عند 2.","En":"The slope changes at two."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدم قابلية الاشتقاق في نقطة لا ينفي التحدب.","En":"Nondifferentiability at one point does not disprove convexity."}}],"Hints":[{"Ar":"اكتب القيمة المطلقة كقيمة عظمى.","En":"Express absolute value as a maximum."},{"Ar":"قارن الميلين على جانبي نقطة الانكسار.","En":"Compare slopes on either side of the corner."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة تساوي القيمة العظمى لدالتين تآلفيتين؛ وهذه دالة محدبة.","En":"The absolute value is the maximum of two affine functions, hence convex."},"FormulaLatex":"f(x)=\\max(2x-4,4-2x)","Steps":[{"Ar":"$x<2:\\ m=-2;\\quad x>2:\\ m=2$","En":"$x<2:\\ m=-2;\\quad x>2:\\ m=2$"}],"Substitution":{"Ar":"$f(x)=\\max(2x-4,4-2x)$","En":"$f(x)=\\max(2x-4,4-2x)$"},"Result":{"Ar":"A — محدبة.","En":"A — convex."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"لكل $0\\le t\\le1$، تعطي متباينة المثلث $|t(2x-4)+(1-t)(2y-4)|\\le t|2x-4|+(1-t)|2y-4|$.","En":"For every $0\\le t\\le1$, the triangle inequality gives $|t(2x-4)+(1-t)(2y-4)|\\le t|2x-4|+(1-t)|2y-4|$."},"CommonError":{"Ar":"ميلها يزداد ولا ينقص.","En":"Its slope increases rather than decreases."}}}$mw$::jsonb,$mw$القيمة المطلقة تساوي القيمة العظمى لدالتين تآلفيتين؛ وهذه دالة محدبة.

$f(x)=\max(2x-4,4-2x)$

1. $x<2:\ m=-2;\quad x>2:\ m=2$

$f(x)=\max(2x-4,4-2x)$

A — محدبة.

لكل $0\le t\le1$، تعطي متباينة المثلث $|t(2x-4)+(1-t)(2y-4)|\le t|2x-4|+(1-t)|2y-4|$.

ميلها يزداد ولا ينقص.$mw$,$mw$The absolute value is the maximum of two affine functions, hence convex.

$f(x)=\max(2x-4,4-2x)$

1. $x<2:\ m=-2;\quad x>2:\ m=2$

$f(x)=\max(2x-4,4-2x)$

A — convex.

For every $0\le t\le1$, the triangle inequality gives $|t(2x-4)+(1-t)(2y-4)|\le t|2x-4|+(1-t)|2y-4|$.

Its slope increases rather than decreases.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب القيمة المطلقة كقيمة عظمى.","En":"Express absolute value as a maximum."},{"Ar":"قارن الميلين على جانبي نقطة الانكسار.","En":"Compare slopes on either side of the corner."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة تساوي القيمة العظمى لدالتين تآلفيتين؛ وهذه دالة محدبة.","En":"The absolute value is the maximum of two affine functions, hence convex."},"FormulaLatex":"f(x)=\\max(2x-4,4-2x)","Steps":[{"Ar":"$x<2:\\ m=-2;\\quad x>2:\\ m=2$","En":"$x<2:\\ m=-2;\\quad x>2:\\ m=2$"}],"Substitution":{"Ar":"$f(x)=\\max(2x-4,4-2x)$","En":"$f(x)=\\max(2x-4,4-2x)$"},"Result":{"Ar":"A — محدبة.","En":"A — convex."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"لكل $0\\le t\\le1$، تعطي متباينة المثلث $|t(2x-4)+(1-t)(2y-4)|\\le t|2x-4|+(1-t)|2y-4|$.","En":"For every $0\\le t\\le1$, the triangle inequality gives $|t(2x-4)+(1-t)(2y-4)|\\le t|2x-4|+(1-t)|2y-4|$."},"CommonError":{"Ar":"ميلها يزداد ولا ينقص.","En":"Its slope increases rather than decreases."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ميلها يزداد ولا ينقص.","En":"Its slope increases rather than decreases."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يتغير الميل عند 2.","En":"The slope changes at two."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدم قابلية الاشتقاق في نقطة لا ينفي التحدب.","En":"Nondifferentiability at one point does not disprove convexity."},"Order":4}]}$mw$),
($mw$growth-v68-university-level-2-newton-zero-derivative-nonroot-1$mw$,$mw$newton-zero-derivative-nonroot$mw$,$mw$root-finding$mw$,$mw$university-level-2$mw$,21,4,90,334,$mw${"StageId":4,"CategoryId":90,"PrimarySkillId":334,"SecondarySkillIds":[],"TrackIds":[21],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تعذر خطوة نيوتن","En":"Undefined Newton update"},"Question":{"Ar":"لطريقة نيوتن على $f(x)=x^3-1$، لماذا لا يمكن حساب $x_1$ من $x_0=0$؟ A المشتقة صفر، B الدالة صفر، C الخطوة تساوي 1 دائماً، D يلزم أن تكون الدالة خطية.","En":"For Newton's method on $f(x)=x^3-1$, why is $x_1$ undefined from $x_0=0$? A: derivative is zero; B: function value is zero; C: the step always equals one; D: the function must be linear."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قيمة الدالة عند الصفر تساوي -1.","En":"The function at zero equals minus one."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا توجد خطوة معرفة أصلاً.","En":"No defined update exists."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طريقة نيوتن تستخدم الدوال غير الخطية أيضاً.","En":"Newton's method also applies to nonlinear functions."}}],"Hints":[{"Ar":"احسب المشتقة عند نقطة البداية.","En":"Compute the derivative at the starting point."},{"Ar":"تحقق من مقام صيغة نيوتن.","En":"Check the denominator of Newton's formula."}],"Solution":{"Idea":{"Ar":"خطوة نيوتن تتطلب القسمة على مشتقة غير صفرية.","En":"Newton's update requires division by a nonzero derivative."},"FormulaLatex":"x_1=x_0-f(x_0)/f'(x_0)","Steps":[{"Ar":"$f(0)=-1,\\quad f'(0)=0$","En":"$f(0)=-1,\\quad f'(0)=0$"}],"Substitution":{"Ar":"$x_1=x_0-f(x_0)/f'(x_0)$","En":"$x_1=x_0-f(x_0)/f'(x_0)$"},"Result":{"Ar":"A — المشتقة صفر.","En":"A — derivative is zero."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$0-(-1)/0$ غير معرف.","En":"$0-(-1)/0$ is undefined."},"CommonError":{"Ar":"قيمة الدالة عند الصفر تساوي -1.","En":"The function at zero equals minus one."}}}$mw$::jsonb,$mw$خطوة نيوتن تتطلب القسمة على مشتقة غير صفرية.

$x_1=x_0-f(x_0)/f'(x_0)$

1. $f(0)=-1,\quad f'(0)=0$

$x_1=x_0-f(x_0)/f'(x_0)$

A — المشتقة صفر.

$0-(-1)/0$ غير معرف.

قيمة الدالة عند الصفر تساوي -1.$mw$,$mw$Newton's update requires division by a nonzero derivative.

$x_1=x_0-f(x_0)/f'(x_0)$

1. $f(0)=-1,\quad f'(0)=0$

$x_1=x_0-f(x_0)/f'(x_0)$

A — derivative is zero.

$0-(-1)/0$ is undefined.

The function at zero equals minus one.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب المشتقة عند نقطة البداية.","En":"Compute the derivative at the starting point."},{"Ar":"تحقق من مقام صيغة نيوتن.","En":"Check the denominator of Newton's formula."}],"Solution":{"Idea":{"Ar":"خطوة نيوتن تتطلب القسمة على مشتقة غير صفرية.","En":"Newton's update requires division by a nonzero derivative."},"FormulaLatex":"x_1=x_0-f(x_0)/f'(x_0)","Steps":[{"Ar":"$f(0)=-1,\\quad f'(0)=0$","En":"$f(0)=-1,\\quad f'(0)=0$"}],"Substitution":{"Ar":"$x_1=x_0-f(x_0)/f'(x_0)$","En":"$x_1=x_0-f(x_0)/f'(x_0)$"},"Result":{"Ar":"A — المشتقة صفر.","En":"A — derivative is zero."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$0-(-1)/0$ غير معرف.","En":"$0-(-1)/0$ is undefined."},"CommonError":{"Ar":"قيمة الدالة عند الصفر تساوي -1.","En":"The function at zero equals minus one."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قيمة الدالة عند الصفر تساوي -1.","En":"The function at zero equals minus one."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا توجد خطوة معرفة أصلاً.","En":"No defined update exists."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طريقة نيوتن تستخدم الدوال غير الخطية أيضاً.","En":"Newton's method also applies to nonlinear functions."},"Order":4}]}$mw$),
($mw$growth-v68-university-level-2-bisection-width-after-iterations-1$mw$,$mw$bisection-width-after-iterations$mw$,$mw$root-finding$mw$,$mw$university-level-2$mw$,21,4,90,334,$mw${"StageId":4,"CategoryId":90,"PrimarySkillId":334,"SecondarySkillIds":[],"TrackIds":[21],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عرض مجال التنصيف","En":"Bisection interval width"},"Question":{"Ar":"بدأ التنصيف بمجال حاصر لجذر عرضه 12. إذا لم يُعثر على جذر دقيق، فما عرض المجال بعد أربع خطوات تنصيف كاملة؟","En":"Bisection starts with a root bracket of width twelve. If no exact root is found, what is the bracket width after four complete bisections?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم مرتين فقط.","En":"Halves only twice."}},{"LatexCode":"\\frac32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم ثلاث مرات.","En":"Halves three times."}},{"LatexCode":"\\frac34","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم خمس مرات.","En":"Halves five times."}}],"Hints":[{"Ar":"حدد عامل تغير العرض.","En":"Identify the width change factor."},{"Ar":"طبّق العامل أربع مرات.","En":"Apply the factor four times."}],"Solution":{"Idea":{"Ar":"يتناقص عرض المجال إلى النصف في كل خطوة.","En":"The bracket width halves at each step."},"FormulaLatex":"w_4=12/2^4","Steps":[{"Ar":"$12\\to6\\to3\\to1.5\\to0.75$","En":"$12\\to6\\to3\\to1.5\\to0.75$"}],"Substitution":{"Ar":"$w_4=12/2^4$","En":"$w_4=12/2^4$"},"Result":{"Ar":"$\\frac34$","En":"$\\frac34$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$16\\cdot0.75=12$","En":"$16\\cdot0.75=12$"},"CommonError":{"Ar":"قسم مرتين فقط.","En":"Halves only twice."}}}$mw$::jsonb,$mw$يتناقص عرض المجال إلى النصف في كل خطوة.

$w_4=12/2^4$

1. $12\to6\to3\to1.5\to0.75$

$w_4=12/2^4$

$\frac34$

$16\cdot0.75=12$

قسم مرتين فقط.$mw$,$mw$The bracket width halves at each step.

$w_4=12/2^4$

1. $12\to6\to3\to1.5\to0.75$

$w_4=12/2^4$

$\frac34$

$16\cdot0.75=12$

Halves only twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد عامل تغير العرض.","En":"Identify the width change factor."},{"Ar":"طبّق العامل أربع مرات.","En":"Apply the factor four times."}],"Solution":{"Idea":{"Ar":"يتناقص عرض المجال إلى النصف في كل خطوة.","En":"The bracket width halves at each step."},"FormulaLatex":"w_4=12/2^4","Steps":[{"Ar":"$12\\to6\\to3\\to1.5\\to0.75$","En":"$12\\to6\\to3\\to1.5\\to0.75$"}],"Substitution":{"Ar":"$w_4=12/2^4$","En":"$w_4=12/2^4$"},"Result":{"Ar":"$\\frac34$","En":"$\\frac34$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$16\\cdot0.75=12$","En":"$16\\cdot0.75=12$"},"CommonError":{"Ar":"قسم مرتين فقط.","En":"Halves only twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم مرتين فقط.","En":"Halves only twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم ثلاث مرات.","En":"Halves three times."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم خمس مرات.","En":"Halves five times."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v68 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
