-- One-time owner-authorized v68 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v68-university-level-2-signed-error-cancellation-sum-1$mw$,$mw$signed-error-cancellation-sum$mw$,$mw$error-analysis$mw$,$mw$university-level-2$mw$,21,4,90,331,$mw${"StageId":4,"CategoryId":90,"PrimarySkillId":331,"SecondarySkillIds":[],"TrackIds":[21],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إلغاء أخطاء موقعة","En":"Cancellation of signed errors"},"Question":{"Ar":"تقديران لكمّيتين لهما خطآن موقعان +0.4 و-0.3، وفق تعريف الخطأ = التقدير ناقص القيمة الحقيقية. ما الخطأ المطلق في مجموع التقديرين؟","En":"Two estimates have signed errors +0.4 and -0.3, defined as estimate minus exact value. What is the absolute error of their sum?"},"Options":[{"LatexCode":"0.7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع القيم المطلقة بدلاً من الأخطاء الموقعة.","En":"Adds absolute errors rather than signed errors."}},{"LatexCode":"-0.1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الخطأ المطلق لا يكون سالباً.","En":"Absolute error cannot be negative."}},{"LatexCode":"0.1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الخطأ الثاني.","En":"Ignores the second error."}}],"Hints":[{"Ar":"احتفظ بإشارات الأخطاء عند الجمع.","En":"Keep signs when adding errors."},{"Ar":"خذ القيمة المطلقة بعد الجمع.","En":"Take the absolute value after adding."}],"Solution":{"Idea":{"Ar":"خطأ المجموع الموقع يساوي مجموع الخطأين الموقعين ثم نأخذ القيمة المطلقة.","En":"The signed error of a sum equals the sum of signed errors; take its absolute value."},"FormulaLatex":"|e_1+e_2|=|0.4-0.3|","Steps":[{"Ar":"$e=0.4+(-0.3)=0.1$","En":"$e=0.4+(-0.3)=0.1$"},{"Ar":"$|0.1|=0.1$","En":"$|0.1|=0.1$"}],"Substitution":{"Ar":"$|e_1+e_2|=|0.4-0.3|$","En":"$|e_1+e_2|=|0.4-0.3|$"},"Result":{"Ar":"$0.1$","En":"$0.1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|(10.4+19.7)-(10+20)|=0.1$","En":"$|(10.4+19.7)-(10+20)|=0.1$"},"CommonError":{"Ar":"جمع القيم المطلقة بدلاً من الأخطاء الموقعة.","En":"Adds absolute errors rather than signed errors."}}}$mw$::jsonb,$mw$خطأ المجموع الموقع يساوي مجموع الخطأين الموقعين ثم نأخذ القيمة المطلقة.

$|e_1+e_2|=|0.4-0.3|$

1. $e=0.4+(-0.3)=0.1$

2. $|0.1|=0.1$

$|e_1+e_2|=|0.4-0.3|$

$0.1$

$|(10.4+19.7)-(10+20)|=0.1$

جمع القيم المطلقة بدلاً من الأخطاء الموقعة.$mw$,$mw$The signed error of a sum equals the sum of signed errors; take its absolute value.

$|e_1+e_2|=|0.4-0.3|$

1. $e=0.4+(-0.3)=0.1$

2. $|0.1|=0.1$

$|e_1+e_2|=|0.4-0.3|$

$0.1$

$|(10.4+19.7)-(10+20)|=0.1$

Adds absolute errors rather than signed errors.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احتفظ بإشارات الأخطاء عند الجمع.","En":"Keep signs when adding errors."},{"Ar":"خذ القيمة المطلقة بعد الجمع.","En":"Take the absolute value after adding."}],"Solution":{"Idea":{"Ar":"خطأ المجموع الموقع يساوي مجموع الخطأين الموقعين ثم نأخذ القيمة المطلقة.","En":"The signed error of a sum equals the sum of signed errors; take its absolute value."},"FormulaLatex":"|e_1+e_2|=|0.4-0.3|","Steps":[{"Ar":"$e=0.4+(-0.3)=0.1$","En":"$e=0.4+(-0.3)=0.1$"},{"Ar":"$|0.1|=0.1$","En":"$|0.1|=0.1$"}],"Substitution":{"Ar":"$|e_1+e_2|=|0.4-0.3|$","En":"$|e_1+e_2|=|0.4-0.3|$"},"Result":{"Ar":"$0.1$","En":"$0.1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|(10.4+19.7)-(10+20)|=0.1$","En":"$|(10.4+19.7)-(10+20)|=0.1$"},"CommonError":{"Ar":"جمع القيم المطلقة بدلاً من الأخطاء الموقعة.","En":"Adds absolute errors rather than signed errors."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع القيم المطلقة بدلاً من الأخطاء الموقعة.","En":"Adds absolute errors rather than signed errors."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الخطأ المطلق لا يكون سالباً.","En":"Absolute error cannot be negative."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الخطأ الثاني.","En":"Ignores the second error."},"Order":4}]}$mw$),
($mw$growth-v68-grade-8-truncated-axis-bar-height-ratio-1$mw$,$mw$truncated-axis-bar-height-ratio$mw$,$mw$m-statistics-charts$mw$,$mw$grade-8$mw$,8,2,22,100,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":100,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محور مبتور في رسم الأعمدة","En":"Truncated bar-chart axis"},"Question":{"Ar":"في رسم أعمدة يبدأ محوره الرأسي عند 90، تمثل قمتا عمودين القيمتين 95 و100. كم مرة يساوي طول العمود الثاني المرئي طول الأول؟","En":"A bar chart starts its vertical axis at 90. Two bars end at 95 and 100. How many times as tall is the second visible bar as the first?"},"Options":[{"LatexCode":"\\frac{100}{95}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن القيم الأصلية لا الأطوال المرئية.","En":"Compares data values rather than visible lengths."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب فرق القمتين.","En":"Computes the difference between tops."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب طول العمود الثاني فقط.","En":"Computes only the second bar's height."}}],"Hints":[{"Ar":"اطرح بداية المحور من القمتين.","En":"Subtract the baseline from both tops."},{"Ar":"قارن الطولين الناتجين بالقسمة.","En":"Divide the resulting heights."}],"Solution":{"Idea":{"Ar":"الطول المرئي يقاس من بداية المحور المبتور.","En":"Visible height is measured from the truncated axis baseline."},"FormulaLatex":"(100-90)/(95-90)","Steps":[{"Ar":"$h_1=95-90=5,\\quad h_2=100-90=10$","En":"$h_1=95-90=5,\\quad h_2=100-90=10$"},{"Ar":"$10/5=2$","En":"$10/5=2$"}],"Substitution":{"Ar":"$(100-90)/(95-90)$","En":"$(100-90)/(95-90)$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot5=10$","En":"$2\\cdot5=10$"},"CommonError":{"Ar":"قارن القيم الأصلية لا الأطوال المرئية.","En":"Compares data values rather than visible lengths."}}}$mw$::jsonb,$mw$الطول المرئي يقاس من بداية المحور المبتور.

$(100-90)/(95-90)$

1. $h_1=95-90=5,\quad h_2=100-90=10$

2. $10/5=2$

$(100-90)/(95-90)$

$2$

$2\cdot5=10$

قارن القيم الأصلية لا الأطوال المرئية.$mw$,$mw$Visible height is measured from the truncated axis baseline.

$(100-90)/(95-90)$

1. $h_1=95-90=5,\quad h_2=100-90=10$

2. $10/5=2$

$(100-90)/(95-90)$

$2$

$2\cdot5=10$

Compares data values rather than visible lengths.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح بداية المحور من القمتين.","En":"Subtract the baseline from both tops."},{"Ar":"قارن الطولين الناتجين بالقسمة.","En":"Divide the resulting heights."}],"Solution":{"Idea":{"Ar":"الطول المرئي يقاس من بداية المحور المبتور.","En":"Visible height is measured from the truncated axis baseline."},"FormulaLatex":"(100-90)/(95-90)","Steps":[{"Ar":"$h_1=95-90=5,\\quad h_2=100-90=10$","En":"$h_1=95-90=5,\\quad h_2=100-90=10$"},{"Ar":"$10/5=2$","En":"$10/5=2$"}],"Substitution":{"Ar":"$(100-90)/(95-90)$","En":"$(100-90)/(95-90)$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot5=10$","En":"$2\\cdot5=10$"},"CommonError":{"Ar":"قارن القيم الأصلية لا الأطوال المرئية.","En":"Compares data values rather than visible lengths."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قارن القيم الأصلية لا الأطوال المرئية.","En":"Compares data values rather than visible lengths."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب فرق القمتين.","En":"Computes the difference between tops."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب طول العمود الثاني فقط.","En":"Computes only the second bar's height."},"Order":4}]}$mw$),
($mw$growth-v68-grade-8-pie-chart-angle-remaining-category-1$mw$,$mw$pie-chart-angle-remaining-category$mw$,$mw$m-statistics-charts$mw$,$mw$grade-8$mw$,8,2,22,100,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":100,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قطاع دائري متبقٍ","En":"Remaining pie-chart sector"},"Question":{"Ar":"في مخطط دائري لثلاث فئات، قياس قطاعين 90° و126°. ما النسبة المئوية للفئة الثالثة؟","En":"A pie chart has three categories. Two sectors measure 90° and 126°. What percentage belongs to the third category?"},"Options":[{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نسبة القطاعين معاً.","En":"Percentage of the first two sectors together."}},{"LatexCode":"40","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"144","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قياس الزاوية وليس النسبة المئوية.","En":"Angle rather than percentage."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نسبة القطاع الأول فقط.","En":"Percentage of the first sector only."}}],"Hints":[{"Ar":"احسب زاوية القطاع المتبقي.","En":"Find the remaining sector angle."},{"Ar":"اقسم على زاوية الدائرة كاملة.","En":"Divide by the full circle angle."}],"Solution":{"Idea":{"Ar":"نطرح زاويتي القطاعين من 360 ثم نحول الزاوية المتبقية إلى نسبة مئوية.","En":"Subtract both sector angles from 360, then convert the remaining angle to a percentage."},"FormulaLatex":"100(360-90-126)/360","Steps":[{"Ar":"$360-90-126=144$","En":"$360-90-126=144$"},{"Ar":"$144/360\\cdot100=40$","En":"$144/360\\cdot100=40$"}],"Substitution":{"Ar":"$100(360-90-126)/360$","En":"$100(360-90-126)/360$"},"Result":{"Ar":"$40$","En":"$40$"},"Unit":{"Ar":"%","En":"%"},"Verification":{"Ar":"$0.4\\cdot360=144$","En":"$0.4\\cdot360=144$"},"CommonError":{"Ar":"نسبة القطاعين معاً.","En":"Percentage of the first two sectors together."}}}$mw$::jsonb,$mw$نطرح زاويتي القطاعين من 360 ثم نحول الزاوية المتبقية إلى نسبة مئوية.

$100(360-90-126)/360$

1. $360-90-126=144$

2. $144/360\cdot100=40$

$100(360-90-126)/360$

$40$

%

$0.4\cdot360=144$

نسبة القطاعين معاً.$mw$,$mw$Subtract both sector angles from 360, then convert the remaining angle to a percentage.

$100(360-90-126)/360$

1. $360-90-126=144$

2. $144/360\cdot100=40$

$100(360-90-126)/360$

$40$

%

$0.4\cdot360=144$

Percentage of the first two sectors together.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب زاوية القطاع المتبقي.","En":"Find the remaining sector angle."},{"Ar":"اقسم على زاوية الدائرة كاملة.","En":"Divide by the full circle angle."}],"Solution":{"Idea":{"Ar":"نطرح زاويتي القطاعين من 360 ثم نحول الزاوية المتبقية إلى نسبة مئوية.","En":"Subtract both sector angles from 360, then convert the remaining angle to a percentage."},"FormulaLatex":"100(360-90-126)/360","Steps":[{"Ar":"$360-90-126=144$","En":"$360-90-126=144$"},{"Ar":"$144/360\\cdot100=40$","En":"$144/360\\cdot100=40$"}],"Substitution":{"Ar":"$100(360-90-126)/360$","En":"$100(360-90-126)/360$"},"Result":{"Ar":"$40$","En":"$40$"},"Unit":{"Ar":"%","En":"%"},"Verification":{"Ar":"$0.4\\cdot360=144$","En":"$0.4\\cdot360=144$"},"CommonError":{"Ar":"نسبة القطاعين معاً.","En":"Percentage of the first two sectors together."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"نسبة القطاعين معاً.","En":"Percentage of the first two sectors together."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قياس الزاوية وليس النسبة المئوية.","En":"Angle rather than percentage."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"نسبة القطاع الأول فقط.","En":"Percentage of the first sector only."},"Order":4}]}$mw$),
($mw$growth-v68-grade-8-median-reflection-decreasing-transform-1$mw$,$mw$median-reflection-decreasing-transform$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"وسيط بعد تحويل تناقصي","En":"Median under reflection"},"Question":{"Ar":"خمس قراءات وسيطها 7. استبدلت كل قراءة $x$ بالقيمة $20-x$. ما وسيط القراءات الجديدة؟","En":"Five readings have median 7. Each reading $x$ is replaced by $20-x$. What is the new median?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أبقى الوسيط القديم دون تحويل.","En":"Keeps the old median unchanged."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الثابت وحده.","En":"Uses the constant alone."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع بدلاً من الطرح.","En":"Adds rather than subtracting."}}],"Hints":[{"Ar":"تخيل ترتيب القيم بعد الطرح من 20.","En":"Imagine the ordering after subtracting from twenty."},{"Ar":"حدد موقع القيمة الوسطى بعد عكس الترتيب.","En":"Locate the middle observation after reversal."}],"Solution":{"Idea":{"Ar":"التحويل يعكس ترتيب القيم، وتبقى القيمة الوسطى وسطى بعد تحويلها.","En":"The transformation reverses the order; the transformed middle observation remains in the middle."},"FormulaLatex":"m'=20-m","Steps":[{"Ar":"$m'=20-7=13$","En":"$m'=20-7=13$"}],"Substitution":{"Ar":"$m'=20-m$","En":"$m'=20-m$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(1,5,7,9,12)\\to(8,11,13,15,19)$","En":"$(1,5,7,9,12)\\to(8,11,13,15,19)$"},"CommonError":{"Ar":"أبقى الوسيط القديم دون تحويل.","En":"Keeps the old median unchanged."}}}$mw$::jsonb,$mw$التحويل يعكس ترتيب القيم، وتبقى القيمة الوسطى وسطى بعد تحويلها.

$m'=20-m$

1. $m'=20-7=13$

$m'=20-m$

$13$

$(1,5,7,9,12)\to(8,11,13,15,19)$

أبقى الوسيط القديم دون تحويل.$mw$,$mw$The transformation reverses the order; the transformed middle observation remains in the middle.

$m'=20-m$

1. $m'=20-7=13$

$m'=20-m$

$13$

$(1,5,7,9,12)\to(8,11,13,15,19)$

Keeps the old median unchanged.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل ترتيب القيم بعد الطرح من 20.","En":"Imagine the ordering after subtracting from twenty."},{"Ar":"حدد موقع القيمة الوسطى بعد عكس الترتيب.","En":"Locate the middle observation after reversal."}],"Solution":{"Idea":{"Ar":"التحويل يعكس ترتيب القيم، وتبقى القيمة الوسطى وسطى بعد تحويلها.","En":"The transformation reverses the order; the transformed middle observation remains in the middle."},"FormulaLatex":"m'=20-m","Steps":[{"Ar":"$m'=20-7=13$","En":"$m'=20-7=13$"}],"Substitution":{"Ar":"$m'=20-m$","En":"$m'=20-m$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(1,5,7,9,12)\\to(8,11,13,15,19)$","En":"$(1,5,7,9,12)\\to(8,11,13,15,19)$"},"CommonError":{"Ar":"أبقى الوسيط القديم دون تحويل.","En":"Keeps the old median unchanged."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أبقى الوسيط القديم دون تحويل.","En":"Keeps the old median unchanged."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الثابت وحده.","En":"Uses the constant alone."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع بدلاً من الطرح.","En":"Adds rather than subtracting."},"Order":4}]}$mw$),
($mw$growth-v68-grade-8-grouped-frequency-cumulative-crossing-1$mw$,$mw$grouped-frequency-cumulative-crossing$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-8$mw$,8,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فئة الوسيط من تكرارات تراكمية","En":"Median class from cumulative counts"},"Question":{"Ar":"تضم الفئات المرتبة 0–9، 10–19، 20–29، 30–39 على الترتيب 4، 5، 8، 3 قيماً صحيحة. في أي فئة تقع القيمتان الوسطيتان؟ A الأولى، B الثانية، C الثالثة، D الرابعة.","En":"Ordered integer classes 0–9, 10–19, 20–29, 30–39 contain respectively 4, 5, 8, 3 observations. Which class contains both central observations? A: first; B: second; C: third; D: fourth."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تضم الرتب 1 إلى 4.","En":"Contains ranks one to four."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تضم الرتب 5 إلى 9.","En":"Contains ranks five to nine."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تضم الرتب 18 إلى 20.","En":"Contains ranks eighteen to twenty."}}],"Hints":[{"Ar":"احسب عدد المشاهدات.","En":"Count observations."},{"Ar":"حدد مجال الرتب لكل فئة.","En":"Find the rank interval of each class."}],"Solution":{"Idea":{"Ar":"نحدد الرتبتين الوسطيتين ثم نستخدم التكرار التراكمي لتعيين فئتهما.","En":"Find the two central ranks, then locate them using cumulative frequencies."},"FormulaLatex":"N=4+5+8+3=20","Steps":[{"Ar":"$N/2=10,\\quad N/2+1=11$؛ التكرارات التراكمية 4،9،17،20.","En":"$N/2=10,\\quad N/2+1=11$; cumulative counts are 4,9,17,20."}],"Substitution":{"Ar":"$N=4+5+8+3=20$","En":"$N=4+5+8+3=20$"},"Result":{"Ar":"C — الفئة الثالثة.","En":"C — third class."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9<10<11\\le17$","En":"$9<10<11\\le17$"},"CommonError":{"Ar":"تضم الرتب 1 إلى 4.","En":"Contains ranks one to four."}}}$mw$::jsonb,$mw$نحدد الرتبتين الوسطيتين ثم نستخدم التكرار التراكمي لتعيين فئتهما.

$N=4+5+8+3=20$

1. $N/2=10,\quad N/2+1=11$؛ التكرارات التراكمية 4،9،17،20.

$N=4+5+8+3=20$

C — الفئة الثالثة.

$9<10<11\le17$

تضم الرتب 1 إلى 4.$mw$,$mw$Find the two central ranks, then locate them using cumulative frequencies.

$N=4+5+8+3=20$

1. $N/2=10,\quad N/2+1=11$; cumulative counts are 4,9,17,20.

$N=4+5+8+3=20$

C — third class.

$9<10<11\le17$

Contains ranks one to four.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد المشاهدات.","En":"Count observations."},{"Ar":"حدد مجال الرتب لكل فئة.","En":"Find the rank interval of each class."}],"Solution":{"Idea":{"Ar":"نحدد الرتبتين الوسطيتين ثم نستخدم التكرار التراكمي لتعيين فئتهما.","En":"Find the two central ranks, then locate them using cumulative frequencies."},"FormulaLatex":"N=4+5+8+3=20","Steps":[{"Ar":"$N/2=10,\\quad N/2+1=11$؛ التكرارات التراكمية 4،9،17،20.","En":"$N/2=10,\\quad N/2+1=11$; cumulative counts are 4,9,17,20."}],"Substitution":{"Ar":"$N=4+5+8+3=20$","En":"$N=4+5+8+3=20$"},"Result":{"Ar":"C — الفئة الثالثة.","En":"C — third class."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9<10<11\\le17$","En":"$9<10<11\\le17$"},"CommonError":{"Ar":"تضم الرتب 1 إلى 4.","En":"Contains ranks one to four."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تضم الرتب 1 إلى 4.","En":"Contains ranks one to four."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تضم الرتب 5 إلى 9.","En":"Contains ranks five to nine."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تضم الرتب 18 إلى 20.","En":"Contains ranks eighteen to twenty."},"Order":4}]}$mw$),
($mw$growth-v68-grade-8-range-recover-scale-with-translation-1$mw$,$mw$range-recover-scale-with-translation$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مدى بعد تغيير مقياس","En":"Range after affine rescaling"},"Question":{"Ar":"مدى قراءات يساوي 9. إذا استبدلت كل قراءة $x$ بالقيمة $3x+4$، فما المدى الجديد؟","En":"A data set has range nine. If each observation $x$ is replaced by $3x+4$, what is the new range?"},"Options":[{"LatexCode":"31","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الثابت إلى المدى رغم إلغائه.","En":"Adds the constant to the range despite cancellation."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تجاهل عامل الضرب.","En":"Ignores scaling."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الثابت فقط.","En":"Adds only the constant."}},{"LatexCode":"27","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب القيمتين الطرفيتين بعد التحويل.","En":"Write the transformed extremes."},{"Ar":"اطرح الطرفين واختزل الثابت.","En":"Subtract the extremes and cancel the constant."}],"Solution":{"Idea":{"Ar":"الثابت يلغى عند طرح أصغر قيمة من أكبرها، ويبقى عامل الضرب.","En":"The constant cancels when subtracting the minimum from the maximum; the scale remains."},"FormulaLatex":"(3M+4)-(3m+4)=3(M-m)","Steps":[{"Ar":"$3\\cdot9=27$","En":"$3\\cdot9=27$"}],"Substitution":{"Ar":"$(3M+4)-(3m+4)=3(M-m)$","En":"$(3M+4)-(3m+4)=3(M-m)$"},"Result":{"Ar":"$27$","En":"$27$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$M=11,m=2:\\ 37-10=27$","En":"$M=11,m=2:\\ 37-10=27$"},"CommonError":{"Ar":"أضاف الثابت إلى المدى رغم إلغائه.","En":"Adds the constant to the range despite cancellation."}}}$mw$::jsonb,$mw$الثابت يلغى عند طرح أصغر قيمة من أكبرها، ويبقى عامل الضرب.

$(3M+4)-(3m+4)=3(M-m)$

1. $3\cdot9=27$

$(3M+4)-(3m+4)=3(M-m)$

$27$

$M=11,m=2:\ 37-10=27$

أضاف الثابت إلى المدى رغم إلغائه.$mw$,$mw$The constant cancels when subtracting the minimum from the maximum; the scale remains.

$(3M+4)-(3m+4)=3(M-m)$

1. $3\cdot9=27$

$(3M+4)-(3m+4)=3(M-m)$

$27$

$M=11,m=2:\ 37-10=27$

Adds the constant to the range despite cancellation.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب القيمتين الطرفيتين بعد التحويل.","En":"Write the transformed extremes."},{"Ar":"اطرح الطرفين واختزل الثابت.","En":"Subtract the extremes and cancel the constant."}],"Solution":{"Idea":{"Ar":"الثابت يلغى عند طرح أصغر قيمة من أكبرها، ويبقى عامل الضرب.","En":"The constant cancels when subtracting the minimum from the maximum; the scale remains."},"FormulaLatex":"(3M+4)-(3m+4)=3(M-m)","Steps":[{"Ar":"$3\\cdot9=27$","En":"$3\\cdot9=27$"}],"Substitution":{"Ar":"$(3M+4)-(3m+4)=3(M-m)$","En":"$(3M+4)-(3m+4)=3(M-m)$"},"Result":{"Ar":"$27$","En":"$27$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$M=11,m=2:\\ 37-10=27$","En":"$M=11,m=2:\\ 37-10=27$"},"CommonError":{"Ar":"أضاف الثابت إلى المدى رغم إلغائه.","En":"Adds the constant to the range despite cancellation."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أضاف الثابت إلى المدى رغم إلغائه.","En":"Adds the constant to the range despite cancellation."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تجاهل عامل الضرب.","En":"Ignores scaling."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الثابت فقط.","En":"Adds only the constant."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
