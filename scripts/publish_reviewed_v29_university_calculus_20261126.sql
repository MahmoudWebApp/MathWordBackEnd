-- One-time university level1 single-variable calculus category, CUPM calculus course report and MSC2020 26A06. Retain prior course/level mappings and visibility.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v29-university-level-1-related-rates-circle-expansion-1$mw$,$mw$related-rates-circle-expansion$mw$,$mw$u-single-calculus-differentiation$mw$,$mw$calculus$mw$,13,4,0,0,$mw${"StageId":4,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[13,20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معدل تغير مساحة قرص","En":"Rate of change of a disk area"},"Question":{"Ar":"يتسع قرص دائري بحيث يزداد نصف قطره بمعدل $0.3$ سم/ثانية. ما معدل زيادة مساحته عندما يكون نصف القطر $5$ سم؟","En":"A circular disk expands with radius increasing at $0.3$ cm/s. At radius $5$ cm, what is the instantaneous rate of increase of its area?"},"Options":[{"LatexCode":"1.5\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أغفل العامل 2 عند اشتقاق مربع نصف القطر.","En":"Omits the factor 2 when differentiating the squared radius."}},{"LatexCode":"3\\pi","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مشتقة المساحة بالنسبة إلى نصف القطر، لا الزمن.","En":"This is the area derivative with respect to radius, not time."}},{"LatexCode":"25\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المساحة اللحظية، لا معدل تغيرها.","En":"This is the instantaneous area, not its rate of change."}}],"Hints":[{"Ar":"اكتب مساحة القرص بدلالة نصف القطر المتغير مع الزمن.","En":"Express the disk area in terms of its time-dependent radius."},{"Ar":"اشتق بالنسبة إلى الزمن باستخدام قاعدة السلسلة.","En":"Differentiate with respect to time using the chain rule."}],"Solution":{"Idea":{"Ar":"المساحة $A=\\pi r^2$ لدالة نصف قطر قابلة للاشتقاق؛ قاعدة السلسلة تربط معدل تغير المساحة بمعدل تغير نصف القطر.","En":"Area is $A=\\pi r^2$ for a differentiable radius function; the chain rule relates the area rate to the radius rate."},"FormulaLatex":"\\frac{dA}{dt}=2\\pi r\\frac{dr}{dt}","Steps":[{"Ar":"نعرف $A(t)=\\pi r(t)^2$.","En":"Define $A(t)=\\pi r(t)^2$."},{"Ar":"نشتق الدالة المركبة: $A'(t)=2\\pi r(t)r'(t)$.","En":"Differentiate the composite: $A'(t)=2\\pi r(t)r'(t)$."}],"Substitution":{"Ar":"$2\\pi(5)(0.3)=3\\pi$","En":"$2\\pi(5)(0.3)=3\\pi$"},"Result":{"Ar":"$3\\pi$","En":"$3\\pi$"},"Unit":{"Ar":"سم²/ثانية","En":"cm²/s"},"Verification":{"Ar":"إذا كان تغير الزمن $h$، فإن تغير نصف القطر $0.3h+o(h)$. وباستخدام فرق مربعين ثم قسمة فرق المساحة على $h$، تؤول النتيجة إلى $2\\pi(5)(0.3)=3\\pi$.","En":"For a time increment $h$, the radius increment is $0.3h+o(h)$. Factoring the difference of squares and dividing the area increment by $h$ gives a limit of $2\\pi(5)(0.3)=3\\pi$."},"CommonError":{"Ar":"لا تنس مشتقة نصف القطر بالنسبة إلى الزمن.","En":"Do not omit the time derivative of the radius."}}}$mw$::jsonb,$mw$المساحة $A=\pi r^2$ لدالة نصف قطر قابلة للاشتقاق؛ قاعدة السلسلة تربط معدل تغير المساحة بمعدل تغير نصف القطر.

$\frac{dA}{dt}=2\pi r\frac{dr}{dt}$

1. نعرف $A(t)=\pi r(t)^2$.

2. نشتق الدالة المركبة: $A'(t)=2\pi r(t)r'(t)$.

$2\pi(5)(0.3)=3\pi$

$3\pi$ سم²/ثانية

إذا كان تغير الزمن $h$، فإن تغير نصف القطر $0.3h+o(h)$. وباستخدام فرق مربعين ثم قسمة فرق المساحة على $h$، تؤول النتيجة إلى $2\pi(5)(0.3)=3\pi$.

لا تنس مشتقة نصف القطر بالنسبة إلى الزمن.$mw$,$mw$Area is $A=\pi r^2$ for a differentiable radius function; the chain rule relates the area rate to the radius rate.

$\frac{dA}{dt}=2\pi r\frac{dr}{dt}$

1. Define $A(t)=\pi r(t)^2$.

2. Differentiate the composite: $A'(t)=2\pi r(t)r'(t)$.

$2\pi(5)(0.3)=3\pi$

$3\pi$ cm²/s

For a time increment $h$, the radius increment is $0.3h+o(h)$. Factoring the difference of squares and dividing the area increment by $h$ gives a limit of $2\pi(5)(0.3)=3\pi$.

Do not omit the time derivative of the radius.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب مساحة القرص بدلالة نصف القطر المتغير مع الزمن.","En":"Express the disk area in terms of its time-dependent radius."},{"Ar":"اشتق بالنسبة إلى الزمن باستخدام قاعدة السلسلة.","En":"Differentiate with respect to time using the chain rule."}],"Solution":{"Idea":{"Ar":"المساحة $A=\\pi r^2$ لدالة نصف قطر قابلة للاشتقاق؛ قاعدة السلسلة تربط معدل تغير المساحة بمعدل تغير نصف القطر.","En":"Area is $A=\\pi r^2$ for a differentiable radius function; the chain rule relates the area rate to the radius rate."},"FormulaLatex":"\\frac{dA}{dt}=2\\pi r\\frac{dr}{dt}","Steps":[{"Ar":"نعرف $A(t)=\\pi r(t)^2$.","En":"Define $A(t)=\\pi r(t)^2$."},{"Ar":"نشتق الدالة المركبة: $A'(t)=2\\pi r(t)r'(t)$.","En":"Differentiate the composite: $A'(t)=2\\pi r(t)r'(t)$."}],"Substitution":{"Ar":"$2\\pi(5)(0.3)=3\\pi$","En":"$2\\pi(5)(0.3)=3\\pi$"},"Result":{"Ar":"$3\\pi$","En":"$3\\pi$"},"Unit":{"Ar":"سم²/ثانية","En":"cm²/s"},"Verification":{"Ar":"إذا كان تغير الزمن $h$، فإن تغير نصف القطر $0.3h+o(h)$. وباستخدام فرق مربعين ثم قسمة فرق المساحة على $h$، تؤول النتيجة إلى $2\\pi(5)(0.3)=3\\pi$.","En":"For a time increment $h$, the radius increment is $0.3h+o(h)$. Factoring the difference of squares and dividing the area increment by $h$ gives a limit of $2\\pi(5)(0.3)=3\\pi$."},"CommonError":{"Ar":"لا تنس مشتقة نصف القطر بالنسبة إلى الزمن.","En":"Do not omit the time derivative of the radius."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أغفل العامل 2 عند اشتقاق مربع نصف القطر.","En":"Omits the factor 2 when differentiating the squared radius."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه مشتقة المساحة بالنسبة إلى نصف القطر، لا الزمن.","En":"This is the area derivative with respect to radius, not time."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه المساحة اللحظية، لا معدل تغيرها.","En":"This is the instantaneous area, not its rate of change."},"Order":4}]}$mw$),
($mw$growth-v29-university-level-1-ftc-two-moving-limits-1$mw$,$mw$ftc-two-moving-limits$mw$,$mw$u-single-calculus-integration$mw$,$mw$calculus$mw$,13,4,0,0,$mw${"StageId":4,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[13,20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اشتقاق تكامل بحدين متغيرين","En":"Differentiating an integral with two moving bounds"},"Question":{"Ar":"لتكن $F(x)=\\int_x^{2x}(1+t^2)\\,dt$. أوجد $F'(1)$.","En":"Let $F(x)=\\int_x^{2x}(1+t^2)\\,dt$. Find $F'(1)$."},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق قيم الدالة عند الحدين دون عامل مشتقة الحد الأعلى.","En":"This subtracts endpoint values without the upper-bound derivative factor."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الدالة عند الحد الأعلى فقط.","En":"This is only the integrand at the upper bound."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع مساهمتي الحدين بدلاً من طرح مساهمة الحد الأدنى.","En":"Adds endpoint contributions instead of subtracting the lower-bound contribution."}}],"Hints":[{"Ar":"المكامل مستمر؛ يمكن تطبيق المبرهنة الأساسية للتكامل.","En":"The integrand is continuous, so the fundamental theorem applies."},{"Ar":"اضرب مساهمة كل حد في مشتقة ذلك الحد، ثم اطرح مساهمة الحد الأدنى.","En":"Multiply each boundary contribution by its derivative, and subtract the lower contribution."}],"Solution":{"Idea":{"Ar":"للدالة المستمرة $f$ وحدين قابلين للاشتقاق $a,b$، تطبق المبرهنة الأساسية وقاعدة السلسلة على دالة أصلية للمتكامل.","En":"For continuous $f$ and differentiable bounds $a,b$, apply the fundamental theorem and chain rule to an antiderivative."},"FormulaLatex":"\\frac{d}{dx}\\int_{a(x)}^{b(x)}f(t)\\,dt=f(b(x))b'(x)-f(a(x))a'(x)","Steps":[{"Ar":"الحد الأعلى $2x$ ومشتقته 2، والحد الأدنى $x$ ومشتقته 1.","En":"The upper bound is $2x$ with derivative 2; the lower bound is $x$ with derivative 1."},{"Ar":"$F'(x)=2(1+4x^2)-(1+x^2)=1+7x^2$.","En":"$F'(x)=2(1+4x^2)-(1+x^2)=1+7x^2$."}],"Substitution":{"Ar":"$F'(1)=1+7=8$","En":"$F'(1)=1+7=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"بالتكامل مباشرةً $F(x)=x+\\frac73x^3$، ومشتقته $1+7x^2$، فتتطابق النتيجة.","En":"Direct integration gives $F(x)=x+\\frac73x^3$, whose derivative is $1+7x^2$, confirming the result."},"CommonError":{"Ar":"لا تهمل مشتقة أي من الحدين المتغيرين.","En":"Do not omit the derivative of either moving bound."}}}$mw$::jsonb,$mw$للدالة المستمرة $f$ وحدين قابلين للاشتقاق $a,b$، تطبق المبرهنة الأساسية وقاعدة السلسلة على دالة أصلية للمتكامل.

$\frac{d}{dx}\int_{a(x)}^{b(x)}f(t)\,dt=f(b(x))b'(x)-f(a(x))a'(x)$

1. الحد الأعلى $2x$ ومشتقته 2، والحد الأدنى $x$ ومشتقته 1.

2. $F'(x)=2(1+4x^2)-(1+x^2)=1+7x^2$.

$F'(1)=1+7=8$

$8$ بلا وحدة محددة

بالتكامل مباشرةً $F(x)=x+\frac73x^3$، ومشتقته $1+7x^2$، فتتطابق النتيجة.

لا تهمل مشتقة أي من الحدين المتغيرين.$mw$,$mw$For continuous $f$ and differentiable bounds $a,b$, apply the fundamental theorem and chain rule to an antiderivative.

$\frac{d}{dx}\int_{a(x)}^{b(x)}f(t)\,dt=f(b(x))b'(x)-f(a(x))a'(x)$

1. The upper bound is $2x$ with derivative 2; the lower bound is $x$ with derivative 1.

2. $F'(x)=2(1+4x^2)-(1+x^2)=1+7x^2$.

$F'(1)=1+7=8$

$8$ No specified unit

Direct integration gives $F(x)=x+\frac73x^3$, whose derivative is $1+7x^2$, confirming the result.

Do not omit the derivative of either moving bound.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المكامل مستمر؛ يمكن تطبيق المبرهنة الأساسية للتكامل.","En":"The integrand is continuous, so the fundamental theorem applies."},{"Ar":"اضرب مساهمة كل حد في مشتقة ذلك الحد، ثم اطرح مساهمة الحد الأدنى.","En":"Multiply each boundary contribution by its derivative, and subtract the lower contribution."}],"Solution":{"Idea":{"Ar":"للدالة المستمرة $f$ وحدين قابلين للاشتقاق $a,b$، تطبق المبرهنة الأساسية وقاعدة السلسلة على دالة أصلية للمتكامل.","En":"For continuous $f$ and differentiable bounds $a,b$, apply the fundamental theorem and chain rule to an antiderivative."},"FormulaLatex":"\\frac{d}{dx}\\int_{a(x)}^{b(x)}f(t)\\,dt=f(b(x))b'(x)-f(a(x))a'(x)","Steps":[{"Ar":"الحد الأعلى $2x$ ومشتقته 2، والحد الأدنى $x$ ومشتقته 1.","En":"The upper bound is $2x$ with derivative 2; the lower bound is $x$ with derivative 1."},{"Ar":"$F'(x)=2(1+4x^2)-(1+x^2)=1+7x^2$.","En":"$F'(x)=2(1+4x^2)-(1+x^2)=1+7x^2$."}],"Substitution":{"Ar":"$F'(1)=1+7=8$","En":"$F'(1)=1+7=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"بالتكامل مباشرةً $F(x)=x+\\frac73x^3$، ومشتقته $1+7x^2$، فتتطابق النتيجة.","En":"Direct integration gives $F(x)=x+\\frac73x^3$, whose derivative is $1+7x^2$, confirming the result."},"CommonError":{"Ar":"لا تهمل مشتقة أي من الحدين المتغيرين.","En":"Do not omit the derivative of either moving bound."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق قيم الدالة عند الحدين دون عامل مشتقة الحد الأعلى.","En":"This subtracts endpoint values without the upper-bound derivative factor."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الدالة عند الحد الأعلى فقط.","En":"This is only the integrand at the upper bound."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع مساهمتي الحدين بدلاً من طرح مساهمة الحد الأدنى.","En":"Adds endpoint contributions instead of subtracting the lower-bound contribution."},"Order":4}]}$mw$),
($mw$growth-v29-university-level-1-linearization-square-root-near-point-1$mw$,$mw$linearization-square-root-near-point$mw$,$mw$u-single-calculus-differentiation$mw$,$mw$calculus$mw$,13,4,0,0,$mw${"StageId":4,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[13,20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التقريب الخطي وتقدير الخطأ","En":"Linear approximation near a known value"},"Question":{"Ar":"باستخدام التقريب الخطي للدالة $f(x)=\\sqrt{x}$ عند $x=25$، ما تقريب $\\sqrt{26}$ الناتج عن هذه الطريقة؟","En":"Using the linearization of $f(x)=\\sqrt{x}$ at $x=25$, what approximation to $\\sqrt{26}$ does this method give?"},"Options":[{"LatexCode":"5.02","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل 1/50 بدلاً من المشتقة 1/10.","En":"Uses 1/50 rather than derivative 1/10."}},{"LatexCode":"5.1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف مقدار التصحيح الخطي الصحيح.","En":"Doubles the correct linear correction."}},{"LatexCode":"5.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل زيادة العدد بواحد كزيادة مقدارها نصف في الجذر.","En":"Treats an increase of one in the input as an increase of one half in the root."}}],"Hints":[{"Ar":"ابدأ بالقيمة المعروفة للجذر التربيعي عند 25.","En":"Start with the known square root at 25."},{"Ar":"احسب مشتقة الجذر عند 25 واضربها في فرق المدخلات.","En":"Find the derivative at 25 and multiply by the input increment."}],"Solution":{"Idea":{"Ar":"الدالة قابلة للاشتقاق قرب $25>0$، لذلك تقريبها الخطي هو قيمة الدالة عند النقطة مضافاً إليها المشتقة مضروبة في فرق المدخل.","En":"The function is differentiable near $25>0$, so its linearization is the function value plus its derivative times the input increment."},"FormulaLatex":"L(x)=f(a)+f'(a)(x-a)","Steps":[{"Ar":"$f(25)=5$ و$f'(25)=1/(2\\sqrt{25})=1/10$.","En":"$f(25)=5$ and $f'(25)=1/(2\\sqrt{25})=1/10$."},{"Ar":"فرق المدخلات $26-25=1$؛ لذا $L(26)=5+0.1$.","En":"The input increment is $26-25=1$, so $L(26)=5+0.1$."}],"Substitution":{"Ar":"$L(26)=5.1$","En":"$L(26)=5.1$"},"Result":{"Ar":"$5.1$","En":"$5.1$"},"Unit":{"Ar":"قيمة تقريبية","En":"Approximate value"},"Verification":{"Ar":"$5.1^2=26.01$؛ القيمة قريبة من المطلوب وأكبر قليلاً منه، كما نتوقع لأن الجذر مقعر إلى الأسفل.","En":"$5.1^2=26.01$; the approximation is close and slightly high, as expected from the square root's concavity."},"CommonError":{"Ar":"لا تخلط التقريب الخطي بالقيمة الدقيقة للجذر.","En":"Do not confuse the linear approximation with the exact square root."}}}$mw$::jsonb,$mw$الدالة قابلة للاشتقاق قرب $25>0$، لذلك تقريبها الخطي هو قيمة الدالة عند النقطة مضافاً إليها المشتقة مضروبة في فرق المدخل.

$L(x)=f(a)+f'(a)(x-a)$

1. $f(25)=5$ و$f'(25)=1/(2\sqrt{25})=1/10$.

2. فرق المدخلات $26-25=1$؛ لذا $L(26)=5+0.1$.

$L(26)=5.1$

$5.1$ قيمة تقريبية

$5.1^2=26.01$؛ القيمة قريبة من المطلوب وأكبر قليلاً منه، كما نتوقع لأن الجذر مقعر إلى الأسفل.

لا تخلط التقريب الخطي بالقيمة الدقيقة للجذر.$mw$,$mw$The function is differentiable near $25>0$, so its linearization is the function value plus its derivative times the input increment.

$L(x)=f(a)+f'(a)(x-a)$

1. $f(25)=5$ and $f'(25)=1/(2\sqrt{25})=1/10$.

2. The input increment is $26-25=1$, so $L(26)=5+0.1$.

$L(26)=5.1$

$5.1$ Approximate value

$5.1^2=26.01$; the approximation is close and slightly high, as expected from the square root's concavity.

Do not confuse the linear approximation with the exact square root.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالقيمة المعروفة للجذر التربيعي عند 25.","En":"Start with the known square root at 25."},{"Ar":"احسب مشتقة الجذر عند 25 واضربها في فرق المدخلات.","En":"Find the derivative at 25 and multiply by the input increment."}],"Solution":{"Idea":{"Ar":"الدالة قابلة للاشتقاق قرب $25>0$، لذلك تقريبها الخطي هو قيمة الدالة عند النقطة مضافاً إليها المشتقة مضروبة في فرق المدخل.","En":"The function is differentiable near $25>0$, so its linearization is the function value plus its derivative times the input increment."},"FormulaLatex":"L(x)=f(a)+f'(a)(x-a)","Steps":[{"Ar":"$f(25)=5$ و$f'(25)=1/(2\\sqrt{25})=1/10$.","En":"$f(25)=5$ and $f'(25)=1/(2\\sqrt{25})=1/10$."},{"Ar":"فرق المدخلات $26-25=1$؛ لذا $L(26)=5+0.1$.","En":"The input increment is $26-25=1$, so $L(26)=5+0.1$."}],"Substitution":{"Ar":"$L(26)=5.1$","En":"$L(26)=5.1$"},"Result":{"Ar":"$5.1$","En":"$5.1$"},"Unit":{"Ar":"قيمة تقريبية","En":"Approximate value"},"Verification":{"Ar":"$5.1^2=26.01$؛ القيمة قريبة من المطلوب وأكبر قليلاً منه، كما نتوقع لأن الجذر مقعر إلى الأسفل.","En":"$5.1^2=26.01$; the approximation is close and slightly high, as expected from the square root's concavity."},"CommonError":{"Ar":"لا تخلط التقريب الخطي بالقيمة الدقيقة للجذر.","En":"Do not confuse the linear approximation with the exact square root."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل 1/50 بدلاً من المشتقة 1/10.","En":"Uses 1/50 rather than derivative 1/10."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف مقدار التصحيح الخطي الصحيح.","En":"Doubles the correct linear correction."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامل زيادة العدد بواحد كزيادة مقدارها نصف في الجذر.","En":"Treats an increase of one in the input as an increase of one half in the root."},"Order":4}]}$mw$),
($mw$growth-v29-university-level-1-substitution-definite-rational-1$mw$,$mw$substitution-definite-rational$mw$,$mw$u-single-calculus-integration$mw$,$mw$calculus$mw$,13,4,0,0,$mw${"StageId":4,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[13,20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تكامل محدد بالتعويض","En":"Definite integration by substitution"},"Question":{"Ar":"احسب $\\int_0^1\\frac{2x}{(1+x^2)^2}\\,dx$.","En":"Evaluate $\\int_0^1\\frac{2x}{(1+x^2)^2}\\,dx$."},"Options":[{"LatexCode":"-\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب طرح قيم الدالة الأصلية عند الحدين.","En":"Reverses the endpoint subtraction."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتج ربع لا نصف؛ قد ينتج من تنصيف التكامل الصحيح مرة ثانية رغم أن البسط هو مشتقة التعويض كاملة.","En":"One quarter rather than one half can result from halving the correct integral again, even though the numerator already equals the full derivative of the substitution."}},{"LatexCode":"\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\ln 2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نتيجة تكامل 1/u وليس 1/u².","En":"This integrates 1/u rather than 1/u²."}}],"Hints":[{"Ar":"لاحظ أن مشتقة ما داخل القوس هي البسط.","En":"Notice that the derivative of the inner expression is the numerator."},{"Ar":"غيّر حدود التكامل أيضاً بعد التعويض.","En":"Change the integration bounds after substitution."}],"Solution":{"Idea":{"Ar":"المقام موجب على الفترة، والتعويض $u=1+x^2$ يحول التكامل إلى تكامل قوة مع حدود جديدة.","En":"The denominator is positive on the interval; substituting $u=1+x^2$ turns the integral into a power integral with new bounds."},"FormulaLatex":"u=1+x^2,\\quad du=2x\\,dx","Steps":[{"Ar":"عند $x=0$ يكون $u=1$، وعند $x=1$ يكون $u=2$.","En":"At $x=0$, $u=1$; at $x=1$, $u=2$."},{"Ar":"يصبح التكامل $\\int_1^2u^{-2}\\,du=[-u^{-1}]_1^2$.","En":"The integral becomes $\\int_1^2u^{-2}\\,du=[-u^{-1}]_1^2$."}],"Substitution":{"Ar":"$-\\frac12-(-1)=\\frac12$","En":"$-\\frac12-(-1)=\\frac12$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"مشتقة $-1/(1+x^2)$ تساوي المتكامل الأصلي؛ وتقييمها بين 0 و1 يعطي النصف الموجب.","En":"The derivative of $-1/(1+x^2)$ is the original integrand; evaluating it from 0 to 1 gives the positive half."},"CommonError":{"Ar":"لا تستخدم حدود x مع متغير التكامل u.","En":"Do not use x bounds with the integration variable u."}}}$mw$::jsonb,$mw$المقام موجب على الفترة، والتعويض $u=1+x^2$ يحول التكامل إلى تكامل قوة مع حدود جديدة.

$u=1+x^2,\quad du=2x\,dx$

1. عند $x=0$ يكون $u=1$، وعند $x=1$ يكون $u=2$.

2. يصبح التكامل $\int_1^2u^{-2}\,du=[-u^{-1}]_1^2$.

$-\frac12-(-1)=\frac12$

$\frac12$ بلا وحدة محددة

مشتقة $-1/(1+x^2)$ تساوي المتكامل الأصلي؛ وتقييمها بين 0 و1 يعطي النصف الموجب.

لا تستخدم حدود x مع متغير التكامل u.$mw$,$mw$The denominator is positive on the interval; substituting $u=1+x^2$ turns the integral into a power integral with new bounds.

$u=1+x^2,\quad du=2x\,dx$

1. At $x=0$, $u=1$; at $x=1$, $u=2$.

2. The integral becomes $\int_1^2u^{-2}\,du=[-u^{-1}]_1^2$.

$-\frac12-(-1)=\frac12$

$\frac12$ No specified unit

The derivative of $-1/(1+x^2)$ is the original integrand; evaluating it from 0 to 1 gives the positive half.

Do not use x bounds with the integration variable u.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لاحظ أن مشتقة ما داخل القوس هي البسط.","En":"Notice that the derivative of the inner expression is the numerator."},{"Ar":"غيّر حدود التكامل أيضاً بعد التعويض.","En":"Change the integration bounds after substitution."}],"Solution":{"Idea":{"Ar":"المقام موجب على الفترة، والتعويض $u=1+x^2$ يحول التكامل إلى تكامل قوة مع حدود جديدة.","En":"The denominator is positive on the interval; substituting $u=1+x^2$ turns the integral into a power integral with new bounds."},"FormulaLatex":"u=1+x^2,\\quad du=2x\\,dx","Steps":[{"Ar":"عند $x=0$ يكون $u=1$، وعند $x=1$ يكون $u=2$.","En":"At $x=0$, $u=1$; at $x=1$, $u=2$."},{"Ar":"يصبح التكامل $\\int_1^2u^{-2}\\,du=[-u^{-1}]_1^2$.","En":"The integral becomes $\\int_1^2u^{-2}\\,du=[-u^{-1}]_1^2$."}],"Substitution":{"Ar":"$-\\frac12-(-1)=\\frac12$","En":"$-\\frac12-(-1)=\\frac12$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"مشتقة $-1/(1+x^2)$ تساوي المتكامل الأصلي؛ وتقييمها بين 0 و1 يعطي النصف الموجب.","En":"The derivative of $-1/(1+x^2)$ is the original integrand; evaluating it from 0 to 1 gives the positive half."},"CommonError":{"Ar":"لا تستخدم حدود x مع متغير التكامل u.","En":"Do not use x bounds with the integration variable u."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب طرح قيم الدالة الأصلية عند الحدين.","En":"Reverses the endpoint subtraction."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الناتج ربع لا نصف؛ قد ينتج من تنصيف التكامل الصحيح مرة ثانية رغم أن البسط هو مشتقة التعويض كاملة.","En":"One quarter rather than one half can result from halving the correct integral again, even though the numerator already equals the full derivative of the substitution."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه نتيجة تكامل 1/u وليس 1/u².","En":"This integrates 1/u rather than 1/u²."},"Order":4}]}$mw$),
($mw$growth-v29-university-level-1-accumulated-distance-versus-net-displacement-1$mw$,$mw$accumulated-distance-versus-net-displacement$mw$,$mw$u-single-calculus-integration$mw$,$mw$calculus$mw$,13,4,0,0,$mw${"StageId":4,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[13,20],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المسافة الكلية من سرعة متغيرة الإشارة","En":"Total distance from sign-changing velocity"},"Question":{"Ar":"يتحرك جسم على مستقيم بسرعة $v(t)=t-2$ متر/ثانية، خلال $0\\le t\\le5$. ما المسافة الكلية التي قطعها؟","En":"An object moves on a line with velocity $v(t)=t-2$ metres per second for $0\\le t\\le5$. What total distance does it travel?"},"Options":[{"LatexCode":"\\frac52","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه الإزاحة الصافية، لا مجموع المسافات.","En":"This is net displacement, not total distance."}},{"LatexCode":"\\frac92","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مسافة الجزء الموجب من الحركة فقط.","En":"This is only the distance in the positive-velocity portion."}},{"LatexCode":"\\frac{13}{2}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{25}{2}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل سرعة t بدلاً من القيمة المطلقة للسرعة المعطاة.","En":"Integrates t instead of the absolute value of the given velocity."}}],"Hints":[{"Ar":"ابحث عن الزمن الذي تتغير عنده إشارة السرعة.","En":"Find where velocity changes sign."},{"Ar":"المسافة الكلية تكامل القيمة المطلقة للسرعة، لا تكامل السرعة الموقعة.","En":"Total distance integrates absolute velocity, not signed velocity."}],"Solution":{"Idea":{"Ar":"عندما تكون السرعة مستمرة، المسافة الكلية هي تكامل مقدار السرعة؛ نقسم الفترة عند نقاط تغير الإشارة.","En":"For continuous velocity, total distance is the integral of speed; split at velocity sign changes."},"FormulaLatex":"D=\\int_0^2(2-t)\\,dt+\\int_2^5(t-2)\\,dt","Steps":[{"Ar":"تنعدم السرعة عند $t=2$؛ تكون سالبة قبله وموجبة بعده.","En":"Velocity vanishes at $t=2$; it is negative before and positive after."},{"Ar":"المسافة الأولى $[2t-t^2/2]_0^2=2$ متر.","En":"The first distance is $[2t-t^2/2]_0^2=2$ metres."},{"Ar":"المسافة الثانية $[(t-2)^2/2]_2^5=9/2$ متر.","En":"The second distance is $[(t-2)^2/2]_2^5=9/2$ metres."}],"Substitution":{"Ar":"$D=2+\\frac92=\\frac{13}{2}$","En":"$D=2+\\frac92=\\frac{13}{2}$"},"Result":{"Ar":"$\\frac{13}{2}$","En":"$\\frac{13}{2}$"},"Unit":{"Ar":"متر","En":"Metres"},"Verification":{"Ar":"مساحتا المثلثين تحت منحنى مقدار السرعة هما $2\\times2/2=2$ و$3\\times3/2=4.5$، فتؤكدان 6.5 متر.","En":"The two triangular areas under the speed curve are $2\\times2/2=2$ and $3\\times3/2=4.5$, confirming 6.5 metres."},"CommonError":{"Ar":"لا تسمح للمسافة في الاتجاه المعاكس بإلغاء جزء من المسافة الكلية.","En":"Do not let motion in the opposite direction cancel part of the total distance."}}}$mw$::jsonb,$mw$عندما تكون السرعة مستمرة، المسافة الكلية هي تكامل مقدار السرعة؛ نقسم الفترة عند نقاط تغير الإشارة.

$D=\int_0^2(2-t)\,dt+\int_2^5(t-2)\,dt$

1. تنعدم السرعة عند $t=2$؛ تكون سالبة قبله وموجبة بعده.

2. المسافة الأولى $[2t-t^2/2]_0^2=2$ متر.

3. المسافة الثانية $[(t-2)^2/2]_2^5=9/2$ متر.

$D=2+\frac92=\frac{13}{2}$

$\frac{13}{2}$ متر

مساحتا المثلثين تحت منحنى مقدار السرعة هما $2\times2/2=2$ و$3\times3/2=4.5$، فتؤكدان 6.5 متر.

لا تسمح للمسافة في الاتجاه المعاكس بإلغاء جزء من المسافة الكلية.$mw$,$mw$For continuous velocity, total distance is the integral of speed; split at velocity sign changes.

$D=\int_0^2(2-t)\,dt+\int_2^5(t-2)\,dt$

1. Velocity vanishes at $t=2$; it is negative before and positive after.

2. The first distance is $[2t-t^2/2]_0^2=2$ metres.

3. The second distance is $[(t-2)^2/2]_2^5=9/2$ metres.

$D=2+\frac92=\frac{13}{2}$

$\frac{13}{2}$ Metres

The two triangular areas under the speed curve are $2\times2/2=2$ and $3\times3/2=4.5$, confirming 6.5 metres.

Do not let motion in the opposite direction cancel part of the total distance.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابحث عن الزمن الذي تتغير عنده إشارة السرعة.","En":"Find where velocity changes sign."},{"Ar":"المسافة الكلية تكامل القيمة المطلقة للسرعة، لا تكامل السرعة الموقعة.","En":"Total distance integrates absolute velocity, not signed velocity."}],"Solution":{"Idea":{"Ar":"عندما تكون السرعة مستمرة، المسافة الكلية هي تكامل مقدار السرعة؛ نقسم الفترة عند نقاط تغير الإشارة.","En":"For continuous velocity, total distance is the integral of speed; split at velocity sign changes."},"FormulaLatex":"D=\\int_0^2(2-t)\\,dt+\\int_2^5(t-2)\\,dt","Steps":[{"Ar":"تنعدم السرعة عند $t=2$؛ تكون سالبة قبله وموجبة بعده.","En":"Velocity vanishes at $t=2$; it is negative before and positive after."},{"Ar":"المسافة الأولى $[2t-t^2/2]_0^2=2$ متر.","En":"The first distance is $[2t-t^2/2]_0^2=2$ metres."},{"Ar":"المسافة الثانية $[(t-2)^2/2]_2^5=9/2$ متر.","En":"The second distance is $[(t-2)^2/2]_2^5=9/2$ metres."}],"Substitution":{"Ar":"$D=2+\\frac92=\\frac{13}{2}$","En":"$D=2+\\frac92=\\frac{13}{2}$"},"Result":{"Ar":"$\\frac{13}{2}$","En":"$\\frac{13}{2}$"},"Unit":{"Ar":"متر","En":"Metres"},"Verification":{"Ar":"مساحتا المثلثين تحت منحنى مقدار السرعة هما $2\\times2/2=2$ و$3\\times3/2=4.5$، فتؤكدان 6.5 متر.","En":"The two triangular areas under the speed curve are $2\\times2/2=2$ and $3\\times3/2=4.5$, confirming 6.5 metres."},"CommonError":{"Ar":"لا تسمح للمسافة في الاتجاه المعاكس بإلغاء جزء من المسافة الكلية.","En":"Do not let motion in the opposite direction cancel part of the total distance."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه الإزاحة الصافية، لا مجموع المسافات.","En":"This is net displacement, not total distance."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه مسافة الجزء الموجب من الحركة فقط.","En":"This is only the distance in the positive-velocity portion."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل سرعة t بدلاً من القيمة المطلقة للسرعة المعطاة.","En":"Integrates t instead of the absolute value of the given velocity."},"Order":4}]}$mw$);
CREATE TEMP TABLE before_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE before_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $links$
DECLARE cid int; diffid int; intid int;
BEGIN
 PERFORM 1 FROM "LearningTracks" WHERE "Id" IN (13,20) ORDER BY "Id" FOR UPDATE;
 IF NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=13 AND "StageId"=4 AND "Code"='calculus' AND "IsPublished" AND "Revision"=46) OR NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=20 AND "StageId"=4 AND "Code"='university-level-1' AND NOT "IsPublished" AND "Revision"=43) THEN RAISE EXCEPTION 'Track revision changed'; END IF;
 IF (SELECT free_pair FROM before_track_free WHERE track=20) IS DISTINCT FROM ARRAY[14,16] OR (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=20)<>4 OR EXISTS(SELECT 1 FROM "Categories" WHERE "StageId"=4 AND ("NameEn" ILIKE '%single%variable%' OR "Order">=10)) THEN RAISE EXCEPTION 'Category scope changed'; END IF;
 IF NOT EXISTS(SELECT 1 FROM "CurriculumDomains" WHERE "Id"=5 AND "StableKey"='calculus-analysis' AND "IsPublished") OR EXISTS(SELECT 1 FROM "CurriculumSkills" WHERE "StableKey" IN('u-single-calculus-differentiation','u-single-calculus-integration')) THEN RAISE EXCEPTION 'Skill scope changed'; END IF;
 INSERT INTO "Categories"("NameAr","NameEn","Icon","Order","StageId","DescriptionAr","DescriptionEn") VALUES('التفاضل والتكامل لمتغير واحد','Single-Variable Calculus','https://math-world-frontend.vercel.app/category-icons/11.svg',10,4,'قواعد الاشتقاق ومعدلات التغير والتقريب الخطي والتكامل وتقنيات التكامل والتراكم، مع إبقاء النهايات والمتتاليات في فئاتها المستقلة.','Differentiation, rates of change, linear approximation, integration techniques and accumulation; limits and sequences remain in their separate categories.') RETURNING "Id" INTO cid;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('u-single-calculus-differentiation',5,4,cid,'الاشتقاق ومعدلات التغير','Differentiation and rates of change','تطبيق قواعد الاشتقاق وتفسير معدلات التغير والتقريب الخطي.','Apply derivative rules and interpret rates of change and linearization.',1,true) RETURNING "Id" INTO diffid;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('u-single-calculus-integration',5,4,cid,'التكامل والتراكم','Integration and accumulation','تطبيق تقنيات التكامل والمبرهنة الأساسية وتفسير التراكم والمسافة والإزاحة.','Apply integration techniques and the fundamental theorem; interpret accumulation, distance and displacement.',2,true) RETURNING "Id" INTO intid;
 INSERT INTO "LearningTrackCategories"("TrackId","CategoryId") VALUES(13,cid),(20,cid);
 INSERT INTO "LearningTrackSkills"("TrackId","SkillId") VALUES(13,diffid),(13,intid),(20,diffid),(20,intid);
 UPDATE growth_batch SET category=cid,skill=CASE WHEN skill_key='u-single-calculus-differentiation' THEN diffid ELSE intid END,wizard=jsonb_set(jsonb_set(wizard,'{CategoryId}',to_jsonb(cid)),'{PrimarySkillId}',to_jsonb(CASE WHEN skill_key='u-single-calculus-differentiation' THEN diffid ELSE intid END));
END $links$;
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
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid),(20,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id" IN (b.track,20);
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v29 university single-variable calculus candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;

CREATE TEMP TABLE after_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE after_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $check$
BEGIN
 IF EXISTS((SELECT * FROM before_track_free EXCEPT SELECT * FROM after_track_free) UNION ALL (SELECT * FROM after_track_free EXCEPT SELECT * FROM before_track_free)) OR EXISTS((SELECT * FROM before_stage_free EXCEPT SELECT * FROM after_stage_free) UNION ALL (SELECT * FROM after_stage_free EXCEPT SELECT * FROM before_stage_free)) THEN RAISE EXCEPTION 'Free entitlement pair changed'; END IF;
 IF (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=20)<>5 OR EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id" IN (20,21) AND "IsPublished") OR EXISTS(SELECT 1 FROM growth_batch b WHERE NOT EXISTS(SELECT 1 FROM "CurriculumDraftItems" d JOIN "LearningTrackProblems" l ON l."ProblemId"=d."PublishedProblemId" AND l."TrackId"=20 WHERE d."ContentKey"=b.key)) THEN RAISE EXCEPTION 'University mapping invalid'; END IF;
END $check$;
COMMIT;
