-- One-time owner-authorized v60 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v60-grade-9-inverse-input-compare-two-output-targets-1$mw$,$mw$inverse-input-compare-two-output-targets$mw$,$mw$middle-inverse-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,28,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":28,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق مدخلين من قيمتي دالة","En":"Input difference from two outputs"},"Question":{"Ar":"لدينا $f(x)=4x-9$. إذا كان $f(a)=7$ و$f(b)=27$، فما قيمة $b-a$؟","En":"Let $f(x)=4x-9$. If $f(a)=7$ and $f(b)=27$, find $b-a$."},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة a.","En":"This is the value of a."}},{"LatexCode":"-5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الطرح.","En":"Reverses the subtraction."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق المخرجين.","En":"This is the output difference."}}],"Hints":[{"Ar":"اكتب معادلة لكل مدخل.","En":"Write an equation for each input."},{"Ar":"اطرح المعادلتين أو حلّهما.","En":"Subtract the equations or solve them."}],"Solution":{"Idea":{"Ar":"نسترجع المدخلين أو نقسم فرق المخرجين على معامل x.","En":"Recover both inputs or divide the output difference by the coefficient."},"FormulaLatex":"4(b-a)=27-7","Steps":[{"Ar":"$a=(7+9)/4=4$","En":"$a=(7+9)/4=4$"},{"Ar":"$b=(27+9)/4=9$","En":"$b=(27+9)/4=9$"},{"Ar":"$b-a=5$","En":"$b-a=5$"}],"Substitution":{"Ar":"$(27-7)/4$","En":"$(27-7)/4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(9)-f(4)=27-7=20$","En":"$f(9)-f(4)=27-7=20$"},"CommonError":{"Ar":"هذا فرق المخرجين.","En":"This is the output difference."}}}$mw$::jsonb,$mw$نسترجع المدخلين أو نقسم فرق المخرجين على معامل x.

$4(b-a)=27-7$

1. $a=(7+9)/4=4$

2. $b=(27+9)/4=9$

3. $b-a=5$

$(27-7)/4$

$5$

$f(9)-f(4)=27-7=20$

هذا فرق المخرجين.$mw$,$mw$Recover both inputs or divide the output difference by the coefficient.

$4(b-a)=27-7$

1. $a=(7+9)/4=4$

2. $b=(27+9)/4=9$

3. $b-a=5$

$(27-7)/4$

$5$

$f(9)-f(4)=27-7=20$

This is the output difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب معادلة لكل مدخل.","En":"Write an equation for each input."},{"Ar":"اطرح المعادلتين أو حلّهما.","En":"Subtract the equations or solve them."}],"Solution":{"Idea":{"Ar":"نسترجع المدخلين أو نقسم فرق المخرجين على معامل x.","En":"Recover both inputs or divide the output difference by the coefficient."},"FormulaLatex":"4(b-a)=27-7","Steps":[{"Ar":"$a=(7+9)/4=4$","En":"$a=(7+9)/4=4$"},{"Ar":"$b=(27+9)/4=9$","En":"$b=(27+9)/4=9$"},{"Ar":"$b-a=5$","En":"$b-a=5$"}],"Substitution":{"Ar":"$(27-7)/4$","En":"$(27-7)/4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(9)-f(4)=27-7=20$","En":"$f(9)-f(4)=27-7=20$"},"CommonError":{"Ar":"هذا فرق المخرجين.","En":"This is the output difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة a.","En":"This is the value of a."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الطرح.","En":"Reverses the subtraction."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق المخرجين.","En":"This is the output difference."},"Order":4}]}$mw$),
($mw$growth-v60-grade-4-fraction-operation-addition-over-one-unit-1$mw$,$mw$fraction-operation-addition-over-one-unit$mw$,$mw$fraction-operations$mw$,$mw$grade-4$mw$,4,1,21,298,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":298,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جمع كسور تتجاوز الواحد","En":"Adding fractions beyond one"},"Question":{"Ar":"شربت مجموعة من إبريق مقدار $\\frac34$ لتر، ثم من إبريق آخر مقدار $\\frac12$ لتر. كم لتراً شربت بالمجموع؟","En":"A group drinks three quarters of a litre from one jug and half a litre from another. How many litres are consumed in total?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الربع الزائد على الواحد.","En":"Omits the quarter above one."}},{"LatexCode":"\\frac54","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac46","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع البسطين والمقامين مباشرة.","En":"Adds numerators and denominators directly."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الكسرين.","En":"Subtracts the fractions."}}],"Hints":[{"Ar":"حول النصف إلى أرباع.","En":"Convert one half into quarters."},{"Ar":"اجمع الأرباع.","En":"Add the quarters."}],"Solution":{"Idea":{"Ar":"نوحد المقام إلى أربعة ثم نجمع البسطين.","En":"Use a common denominator of four and add numerators."},"FormulaLatex":"3/4+1/2=3/4+2/4","Steps":[{"Ar":"$3/4+2/4=5/4$","En":"$3/4+2/4=5/4$"}],"Substitution":{"Ar":"$(3+2)/4$","En":"$(3+2)/4$"},"Result":{"Ar":"$\\frac54$","En":"$\\frac54$"},"Unit":{"Ar":"لتر","En":"L"},"Verification":{"Ar":"$5/4-3/4=1/2$","En":"$5/4-3/4=1/2$"},"CommonError":{"Ar":"جمع البسطين والمقامين مباشرة.","En":"Adds numerators and denominators directly."}}}$mw$::jsonb,$mw$نوحد المقام إلى أربعة ثم نجمع البسطين.

$3/4+1/2=3/4+2/4$

1. $3/4+2/4=5/4$

$(3+2)/4$

$\frac54$ لتر

$5/4-3/4=1/2$

جمع البسطين والمقامين مباشرة.$mw$,$mw$Use a common denominator of four and add numerators.

$3/4+1/2=3/4+2/4$

1. $3/4+2/4=5/4$

$(3+2)/4$

$\frac54$ L

$5/4-3/4=1/2$

Adds numerators and denominators directly.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حول النصف إلى أرباع.","En":"Convert one half into quarters."},{"Ar":"اجمع الأرباع.","En":"Add the quarters."}],"Solution":{"Idea":{"Ar":"نوحد المقام إلى أربعة ثم نجمع البسطين.","En":"Use a common denominator of four and add numerators."},"FormulaLatex":"3/4+1/2=3/4+2/4","Steps":[{"Ar":"$3/4+2/4=5/4$","En":"$3/4+2/4=5/4$"}],"Substitution":{"Ar":"$(3+2)/4$","En":"$(3+2)/4$"},"Result":{"Ar":"$\\frac54$","En":"$\\frac54$"},"Unit":{"Ar":"لتر","En":"L"},"Verification":{"Ar":"$5/4-3/4=1/2$","En":"$5/4-3/4=1/2$"},"CommonError":{"Ar":"جمع البسطين والمقامين مباشرة.","En":"Adds numerators and denominators directly."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الربع الزائد على الواحد.","En":"Omits the quarter above one."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع البسطين والمقامين مباشرة.","En":"Adds numerators and denominators directly."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح الكسرين.","En":"Subtracts the fractions."},"Order":4}]}$mw$),
($mw$growth-v60-grade-7-rational-arithmetic-division-negative-fractions-1$mw$,$mw$rational-arithmetic-division-negative-fractions$mw$,$mw$rational-arithmetic$mw$,$mw$grade-7$mw$,7,2,83,308,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":308,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قسمة كسرين بإشارتين مختلفتين","En":"Dividing fractions of opposite signs"},"Question":{"Ar":"احسب $(-\\frac35)\\div\\frac9{10}$.","En":"Evaluate $(-\\frac35)\\div\\frac9{10}$."},"Options":[{"LatexCode":"\\frac23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الإشارة السالبة.","En":"Drops the negative sign."}},{"LatexCode":"-\\frac{27}{50}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب في المقسوم عليه بدلاً من مقلوبه.","En":"Multiplies by the divisor instead of its reciprocal."}},{"LatexCode":"-\\frac32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قلب الكسر الخطأ.","En":"Inverts the wrong fraction."}},{"LatexCode":"-\\frac23","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اقلب الكسر الثاني.","En":"Invert the second fraction."},{"Ar":"اختصر مع الاحتفاظ بالسالب.","En":"Cancel while retaining the negative sign."}],"Solution":{"Idea":{"Ar":"نضرب المقسوم في مقلوب المقسوم عليه.","En":"Multiply the dividend by the reciprocal of the divisor."},"FormulaLatex":"-3/5\\cdot10/9","Steps":[{"Ar":"$-30/45=-2/3$","En":"$-30/45=-2/3$"}],"Substitution":{"Ar":"$-30/45$","En":"$-30/45$"},"Result":{"Ar":"$-\\frac23$","En":"$-\\frac23$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-2/3)(9/10)=-3/5$","En":"$(-2/3)(9/10)=-3/5$"},"CommonError":{"Ar":"أهمل الإشارة السالبة.","En":"Drops the negative sign."}}}$mw$::jsonb,$mw$نضرب المقسوم في مقلوب المقسوم عليه.

$-3/5\cdot10/9$

1. $-30/45=-2/3$

$-30/45$

$-\frac23$

$(-2/3)(9/10)=-3/5$

أهمل الإشارة السالبة.$mw$,$mw$Multiply the dividend by the reciprocal of the divisor.

$-3/5\cdot10/9$

1. $-30/45=-2/3$

$-30/45$

$-\frac23$

$(-2/3)(9/10)=-3/5$

Drops the negative sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقلب الكسر الثاني.","En":"Invert the second fraction."},{"Ar":"اختصر مع الاحتفاظ بالسالب.","En":"Cancel while retaining the negative sign."}],"Solution":{"Idea":{"Ar":"نضرب المقسوم في مقلوب المقسوم عليه.","En":"Multiply the dividend by the reciprocal of the divisor."},"FormulaLatex":"-3/5\\cdot10/9","Steps":[{"Ar":"$-30/45=-2/3$","En":"$-30/45=-2/3$"}],"Substitution":{"Ar":"$-30/45$","En":"$-30/45$"},"Result":{"Ar":"$-\\frac23$","En":"$-\\frac23$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-2/3)(9/10)=-3/5$","En":"$(-2/3)(9/10)=-3/5$"},"CommonError":{"Ar":"أهمل الإشارة السالبة.","En":"Drops the negative sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الإشارة السالبة.","En":"Drops the negative sign."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضرب في المقسوم عليه بدلاً من مقلوبه.","En":"Multiplies by the divisor instead of its reciprocal."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قلب الكسر الخطأ.","En":"Inverts the wrong fraction."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v60-grade-7-signed-operations-product-sign-unknown-factor-1$mw$,$mw$signed-operations-product-sign-unknown-factor$mw$,$mw$signed-operations$mw$,$mw$grade-7$mw$,7,2,83,309,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":309,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إشارة عامل مجهول","En":"Sign of an unknown factor"},"Question":{"Ar":"حاصل ضرب ثلاثة أعداد غير صفرية سالب، وعُلم أن العددين الأول والثاني سالبان. ما إشارة العدد الثالث؟ A: موجبة، B: سالبة، C: صفر، D: لا يمكن تحديدها.","En":"The product of three nonzero numbers is negative. Two of them are negative. What is the sign of the third? A: positive; B: negative; C: zero; D: cannot be determined."},"Options":[{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العدد غير صفري بحسب المعطيات.","En":"The number is nonzero by assumption."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الإشارة محددة من إشارة حاصل الضرب.","En":"The product sign determines it."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب سالبين في موجب يعطي موجباً.","En":"Two negatives and a positive give a positive product."}}],"Hints":[{"Ar":"ما إشارة حاصل ضرب السالبين؟","En":"What is the sign of the product of two negatives?"},{"Ar":"ما إشارة عامل يضرب موجباً ليعطي سالباً؟","En":"What sign times a positive gives a negative?"}],"Solution":{"Idea":{"Ar":"ضرب العددين السالبين يعطي موجباً، ويجب ضربه في سالب للحصول على سالب.","En":"Two negative factors give a positive product; the third must be negative to give a negative result."},"FormulaLatex":"(-1)(-1)(-1)=-1","Steps":[{"Ar":"$1\\cdot(-1)=-1$","En":"$1\\cdot(-1)=-1$"}],"Substitution":{"Ar":"$(-1)(-1)=1$","En":"$(-1)(-1)=1$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-2)(-3)(-4)=-24$","En":"$(-2)(-3)(-4)=-24$"},"CommonError":{"Ar":"ضرب سالبين في موجب يعطي موجباً.","En":"Two negatives and a positive give a positive product."}}}$mw$::jsonb,$mw$ضرب العددين السالبين يعطي موجباً، ويجب ضربه في سالب للحصول على سالب.

$(-1)(-1)(-1)=-1$

1. $1\cdot(-1)=-1$

$(-1)(-1)=1$

$B$

$(-2)(-3)(-4)=-24$

ضرب سالبين في موجب يعطي موجباً.$mw$,$mw$Two negative factors give a positive product; the third must be negative to give a negative result.

$(-1)(-1)(-1)=-1$

1. $1\cdot(-1)=-1$

$(-1)(-1)=1$

$B$

$(-2)(-3)(-4)=-24$

Two negatives and a positive give a positive product.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما إشارة حاصل ضرب السالبين؟","En":"What is the sign of the product of two negatives?"},{"Ar":"ما إشارة عامل يضرب موجباً ليعطي سالباً؟","En":"What sign times a positive gives a negative?"}],"Solution":{"Idea":{"Ar":"ضرب العددين السالبين يعطي موجباً، ويجب ضربه في سالب للحصول على سالب.","En":"Two negative factors give a positive product; the third must be negative to give a negative result."},"FormulaLatex":"(-1)(-1)(-1)=-1","Steps":[{"Ar":"$1\\cdot(-1)=-1$","En":"$1\\cdot(-1)=-1$"}],"Substitution":{"Ar":"$(-1)(-1)=1$","En":"$(-1)(-1)=1$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(-2)(-3)(-4)=-24$","En":"$(-2)(-3)(-4)=-24$"},"CommonError":{"Ar":"ضرب سالبين في موجب يعطي موجباً.","En":"Two negatives and a positive give a positive product."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"العدد غير صفري بحسب المعطيات.","En":"The number is nonzero by assumption."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الإشارة محددة من إشارة حاصل الضرب.","En":"The product sign determines it."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضرب سالبين في موجب يعطي موجباً.","En":"Two negatives and a positive give a positive product."},"Order":4}]}$mw$),
($mw$growth-v60-grade-7-mode-two-equal-frequencies-break-tie-1$mw$,$mw$mode-two-equal-frequencies-break-tie$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-7$mw$,7,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"منوال بعد كسر التعادل","En":"Mode after breaking a tie"},"Question":{"Ar":"البيانات 2،2،5،5،7. أضيفت القيمة 5 مرة أخرى. ما المنوال الجديد؟","En":"Data are 2,2,5,5,7. One more observation of 5 is added. What is the new mode?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا تكرار 5 وليس قيمتها.","En":"This is the frequency of five, not the value."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تكراره اثنان فقط.","En":"Occurs only twice."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تكراره واحد.","En":"Occurs once."}}],"Hints":[{"Ar":"احسب التكرار بعد الإضافة.","En":"Count frequencies after the addition."},{"Ar":"اختر القيمة التي تكررت أكثر.","En":"Choose the most frequent value."}],"Solution":{"Idea":{"Ar":"المنوال هو القيمة ذات أكبر تكرار.","En":"The mode is the value with highest frequency."},"FormulaLatex":"f(2)=2,\\ f(5)=3,\\ f(7)=1","Steps":[{"Ar":"$3>2>1$","En":"$3>2>1$"}],"Substitution":{"Ar":"$2,2,5,5,5,7$","En":"$2,2,5,5,5,7$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+3+1=6$","En":"$2+3+1=6$"},"CommonError":{"Ar":"تكراره اثنان فقط.","En":"Occurs only twice."}}}$mw$::jsonb,$mw$المنوال هو القيمة ذات أكبر تكرار.

$f(2)=2,\ f(5)=3,\ f(7)=1$

1. $3>2>1$

$2,2,5,5,5,7$

$5$

$2+3+1=6$

تكراره اثنان فقط.$mw$,$mw$The mode is the value with highest frequency.

$f(2)=2,\ f(5)=3,\ f(7)=1$

1. $3>2>1$

$2,2,5,5,5,7$

$5$

$2+3+1=6$

Occurs only twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب التكرار بعد الإضافة.","En":"Count frequencies after the addition."},{"Ar":"اختر القيمة التي تكررت أكثر.","En":"Choose the most frequent value."}],"Solution":{"Idea":{"Ar":"المنوال هو القيمة ذات أكبر تكرار.","En":"The mode is the value with highest frequency."},"FormulaLatex":"f(2)=2,\\ f(5)=3,\\ f(7)=1","Steps":[{"Ar":"$3>2>1$","En":"$3>2>1$"}],"Substitution":{"Ar":"$2,2,5,5,5,7$","En":"$2,2,5,5,5,7$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+3+1=6$","En":"$2+3+1=6$"},"CommonError":{"Ar":"تكراره اثنان فقط.","En":"Occurs only twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا تكرار 5 وليس قيمتها.","En":"This is the frequency of five, not the value."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تكراره اثنان فقط.","En":"Occurs only twice."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تكراره واحد.","En":"Occurs once."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v60 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
