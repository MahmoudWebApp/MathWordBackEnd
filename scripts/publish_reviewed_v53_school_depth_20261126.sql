-- One-time owner-authorized v53 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v53-grade-7-recover-subtrahend-before-multiplication-1$mw$,$mw$recover-subtrahend-before-multiplication$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع المطروح","En":"Recovering a subtrahend"},"Question":{"Ar":"طُرح عدد x من 17 ثم ضُرب الفرق في 3 فكان الناتج 24. ما x؟","En":"A number x is subtracted from 17, then the difference is multiplied by 3 to give 24. Find x."},"Options":[{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق قبل الضرب.","En":"The difference before multiplication."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الفرق مع 17.","En":"Adds the difference to 17."}},{"LatexCode":"-9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الطرح.","En":"Reverses the subtraction."}}],"Hints":[{"Ar":"اقسم 24 على 3.","En":"Divide 24 by three."},{"Ar":"ما العدد الذي نطرحه من 17 ليبقى 8؟","En":"What must be subtracted from 17 to leave eight?"}],"Solution":{"Idea":{"Ar":"نعكس الضرب ثم نوجد المطروح.","En":"Undo multiplication, then find the subtrahend."},"FormulaLatex":"3(17-x)=24","Steps":[{"Ar":"$17-x=8$","En":"$17-x=8$"},{"Ar":"$x=17-8=9$","En":"$x=17-8=9$"}],"Substitution":{"Ar":"$17-x=24/3$","En":"$17-x=24/3$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3(17-9)=24$","En":"$3(17-9)=24$"},"CommonError":{"Ar":"هذا الفرق قبل الضرب.","En":"The difference before multiplication."}}}$mw$::jsonb,$mw$نعكس الضرب ثم نوجد المطروح.

$3(17-x)=24$

1. $17-x=8$

2. $x=17-8=9$

$17-x=24/3$

$9$

$3(17-9)=24$

هذا الفرق قبل الضرب.$mw$,$mw$Undo multiplication, then find the subtrahend.

$3(17-x)=24$

1. $17-x=8$

2. $x=17-8=9$

$17-x=24/3$

$9$

$3(17-9)=24$

The difference before multiplication.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم 24 على 3.","En":"Divide 24 by three."},{"Ar":"ما العدد الذي نطرحه من 17 ليبقى 8؟","En":"What must be subtracted from 17 to leave eight?"}],"Solution":{"Idea":{"Ar":"نعكس الضرب ثم نوجد المطروح.","En":"Undo multiplication, then find the subtrahend."},"FormulaLatex":"3(17-x)=24","Steps":[{"Ar":"$17-x=8$","En":"$17-x=8$"},{"Ar":"$x=17-8=9$","En":"$x=17-8=9$"}],"Substitution":{"Ar":"$17-x=24/3$","En":"$17-x=24/3$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3(17-9)=24$","En":"$3(17-9)=24$"},"CommonError":{"Ar":"هذا الفرق قبل الضرب.","En":"The difference before multiplication."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق قبل الضرب.","En":"The difference before multiplication."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع الفرق مع 17.","En":"Adds the difference to 17."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الطرح.","En":"Reverses the subtraction."},"Order":4}]}$mw$),
($mw$growth-v53-grade-7-frequency-complement-observed-count-ratio-1$mw$,$mw$frequency-complement-observed-count-ratio$mw$,$mw$frequency$mw$,$mw$grade-7$mw$,7,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة الإخفاق إلى النجاح","En":"Failure-to-success ratio"},"Question":{"Ar":"في 50 تجربة ظهر الحدث 35 مرة. ما نسبة عدد مرات عدم ظهوره إلى عدد مرات ظهوره في أبسط صورة؟","En":"In 50 trials an event occurred 35 times. What is the ratio of non-occurrences to occurrences in simplest form?"},"Options":[{"LatexCode":"3:10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نسبة عدم الظهور إلى جميع التجارب.","En":"Non-occurrences to all trials."}},{"LatexCode":"7:3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب النسبة.","En":"Reverses the ratio."}},{"LatexCode":"7:10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نسبة الظهور إلى جميع التجارب.","En":"Occurrences to all trials."}},{"LatexCode":"3:7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اطرح مرات الظهور من 50.","En":"Subtract occurrences from fifty."},{"Ar":"بسّط بقسمة الطرفين على 5.","En":"Simplify both terms by five."}],"Solution":{"Idea":{"Ar":"نحسب الإخفاقات ثم نقارنها بالنجاحات.","En":"Find failures, then compare with successes."},"FormulaLatex":"(n-s):s","Steps":[{"Ar":"$15:35$","En":"$15:35$"},{"Ar":"$3:7$","En":"$3:7$"}],"Substitution":{"Ar":"$(50-35):35$","En":"$(50-35):35$"},"Result":{"Ar":"$3:7$","En":"$3:7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15+35=50$","En":"$15+35=50$"},"CommonError":{"Ar":"نسبة عدم الظهور إلى جميع التجارب.","En":"Non-occurrences to all trials."}}}$mw$::jsonb,$mw$نحسب الإخفاقات ثم نقارنها بالنجاحات.

$(n-s):s$

1. $15:35$

2. $3:7$

$(50-35):35$

$3:7$

$15+35=50$

نسبة عدم الظهور إلى جميع التجارب.$mw$,$mw$Find failures, then compare with successes.

$(n-s):s$

1. $15:35$

2. $3:7$

$(50-35):35$

$3:7$

$15+35=50$

Non-occurrences to all trials.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح مرات الظهور من 50.","En":"Subtract occurrences from fifty."},{"Ar":"بسّط بقسمة الطرفين على 5.","En":"Simplify both terms by five."}],"Solution":{"Idea":{"Ar":"نحسب الإخفاقات ثم نقارنها بالنجاحات.","En":"Find failures, then compare with successes."},"FormulaLatex":"(n-s):s","Steps":[{"Ar":"$15:35$","En":"$15:35$"},{"Ar":"$3:7$","En":"$3:7$"}],"Substitution":{"Ar":"$(50-35):35$","En":"$(50-35):35$"},"Result":{"Ar":"$3:7$","En":"$3:7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15+35=50$","En":"$15+35=50$"},"CommonError":{"Ar":"نسبة عدم الظهور إلى جميع التجارب.","En":"Non-occurrences to all trials."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"نسبة عدم الظهور إلى جميع التجارب.","En":"Non-occurrences to all trials."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب النسبة.","En":"Reverses the ratio."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"نسبة الظهور إلى جميع التجارب.","En":"Occurrences to all trials."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v53-grade-7-probability-uniform-label-event-empty-intersection-1$mw$,$mw$probability-uniform-label-event-empty-intersection$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال حدث مستحيل","En":"Probability of an impossible event"},"Question":{"Ar":"تُختار بطاقة عشوائياً من بطاقات مرقمة من 1 إلى 8. ما احتمال أن يكون الرقم زوجياً وفردياً في الوقت نفسه؟","En":"A card is selected uniformly from cards numbered 1 to 8. What is the probability that its number is both even and odd?"},"Options":[{"LatexCode":"1/2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتمال الزوجية وحدها.","En":"Probability of even alone."}},{"LatexCode":"1/8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض وجود حالة ملائمة واحدة.","En":"Assumes one favourable outcome."}},{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يخلط التقاطع بالاتحاد.","En":"Confuses intersection with union."}}],"Hints":[{"Ar":"المطلوب تحقق الشرطين معاً.","En":"Both conditions must hold."},{"Ar":"عد الأرقام التي تحقق الشرطين.","En":"Count numbers satisfying both."}],"Solution":{"Idea":{"Ar":"لا يوجد عدد صحيح زوجي وفردي معاً.","En":"No integer is both even and odd."},"FormulaLatex":"P(E\\cap O)=0/8","Steps":[{"Ar":"$P(E\\cap O)=0$","En":"$P(E\\cap O)=0$"}],"Substitution":{"Ar":"$0/8$","En":"$0/8$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+4=8$","En":"$4+4=8$"},"CommonError":{"Ar":"يخلط التقاطع بالاتحاد.","En":"Confuses intersection with union."}}}$mw$::jsonb,$mw$لا يوجد عدد صحيح زوجي وفردي معاً.

$P(E\cap O)=0/8$

1. $P(E\cap O)=0$

$0/8$

$0$

$4+4=8$

يخلط التقاطع بالاتحاد.$mw$,$mw$No integer is both even and odd.

$P(E\cap O)=0/8$

1. $P(E\cap O)=0$

$0/8$

$0$

$4+4=8$

Confuses intersection with union.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المطلوب تحقق الشرطين معاً.","En":"Both conditions must hold."},{"Ar":"عد الأرقام التي تحقق الشرطين.","En":"Count numbers satisfying both."}],"Solution":{"Idea":{"Ar":"لا يوجد عدد صحيح زوجي وفردي معاً.","En":"No integer is both even and odd."},"FormulaLatex":"P(E\\cap O)=0/8","Steps":[{"Ar":"$P(E\\cap O)=0$","En":"$P(E\\cap O)=0$"}],"Substitution":{"Ar":"$0/8$","En":"$0/8$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+4=8$","En":"$4+4=8$"},"CommonError":{"Ar":"يخلط التقاطع بالاتحاد.","En":"Confuses intersection with union."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"احتمال الزوجية وحدها.","En":"Probability of even alone."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يفترض وجود حالة ملائمة واحدة.","En":"Assumes one favourable outcome."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يخلط التقاطع بالاتحاد.","En":"Confuses intersection with union."},"Order":4}]}$mw$),
($mw$growth-v53-grade-9-range-expansion-both-extremes-1$mw$,$mw$range-expansion-both-extremes$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير المدى عند توسيع الطرفين","En":"Range after extending both extremes"},"Question":{"Ar":"مدى مجموعة بيانات 18. أُضيفت قيمة أقل من أصغر قيمة قديمة بمقدار 4 وقيمة أكبر من أكبر قيمة قديمة بمقدار 6. ما المدى الجديد؟","En":"A data set has range 18. A value four below the old minimum and a value six above the old maximum are added. Find the new range."},"Options":[{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل تغير الطرفين.","En":"Ignores both extensions."}},{"LatexCode":"28","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح إحدى الزيادتين.","En":"Subtracts one extension."}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف زيادة الحد الأعلى فقط.","En":"Includes only the upper extension."}}],"Hints":[{"Ar":"الحد الأدنى ينخفض أربع وحدات.","En":"The minimum drops by four."},{"Ar":"الحد الأعلى يرتفع ست وحدات.","En":"The maximum rises by six."}],"Solution":{"Idea":{"Ar":"كلتا الإضافتين توسعان المجال.","En":"Both additions extend the range."},"FormulaLatex":"R'=(M+6)-(m-4)=R+10","Steps":[{"Ar":"$18+10=28$","En":"$18+10=28$"}],"Substitution":{"Ar":"$18+6+4$","En":"$18+6+4$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$28-18=10$","En":"$28-18=10$"},"CommonError":{"Ar":"طرح إحدى الزيادتين.","En":"Subtracts one extension."}}}$mw$::jsonb,$mw$كلتا الإضافتين توسعان المجال.

$R'=(M+6)-(m-4)=R+10$

1. $18+10=28$

$18+6+4$

$28$

$28-18=10$

طرح إحدى الزيادتين.$mw$,$mw$Both additions extend the range.

$R'=(M+6)-(m-4)=R+10$

1. $18+10=28$

$18+6+4$

$28$

$28-18=10$

Subtracts one extension.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الحد الأدنى ينخفض أربع وحدات.","En":"The minimum drops by four."},{"Ar":"الحد الأعلى يرتفع ست وحدات.","En":"The maximum rises by six."}],"Solution":{"Idea":{"Ar":"كلتا الإضافتين توسعان المجال.","En":"Both additions extend the range."},"FormulaLatex":"R'=(M+6)-(m-4)=R+10","Steps":[{"Ar":"$18+10=28$","En":"$18+10=28$"}],"Substitution":{"Ar":"$18+6+4$","En":"$18+6+4$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$28-18=10$","En":"$28-18=10$"},"CommonError":{"Ar":"طرح إحدى الزيادتين.","En":"Subtracts one extension."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل تغير الطرفين.","En":"Ignores both extensions."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح إحدى الزيادتين.","En":"Subtracts one extension."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف زيادة الحد الأعلى فقط.","En":"Includes only the upper extension."},"Order":4}]}$mw$),
($mw$growth-v53-grade-9-mad-zero-characterization-1$mw$,$mw$mad-zero-characterization$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تفسير انحراف مطلق صفري","En":"Interpreting zero absolute deviation"},"Question":{"Ar":"متوسط الانحرافات المطلقة عن المتوسط الحسابي لمجموعة غير فارغة يساوي صفراً. ما مدى المجموعة؟","En":"A nonempty data set has mean absolute deviation from its mean equal to zero. What is its range?"},"Options":[{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمكن وجود اختلاف بين القيم.","En":"No observations can differ."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وجود اختلاف يجعل انحرافاً موجباً.","En":"Different observations produce positive deviations."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يتوافق مع انحراف مطلق صفري.","En":"Inconsistent with zero absolute deviation."}}],"Hints":[{"Ar":"هل يمكن لانحراف مطلق أن يكون سالباً؟","En":"Can an absolute deviation be negative?"},{"Ar":"استنتج أن القيم كلها تساوي المتوسط.","En":"Infer that every value equals the mean."}],"Solution":{"Idea":{"Ar":"الانحرافات المطلقة غير سالبة؛ مجموعها صفر فقط إذا كانت كلها صفراً.","En":"Absolute deviations are nonnegative; their sum vanishes only if all are zero."},"FormulaLatex":"\\frac1n\\sum|x_i-\\bar x|=0","Steps":[{"Ar":"$|x_i-\\bar x|=0$","En":"$|x_i-\\bar x|=0$"},{"Ar":"$x_i=\\bar x$","En":"$x_i=\\bar x$"},{"Ar":"$R=\\bar x-\\bar x=0$","En":"$R=\\bar x-\\bar x=0$"}],"Substitution":{"Ar":"$\\sum|x_i-\\bar x|=0$","En":"$\\sum|x_i-\\bar x|=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$R=0$","En":"$R=0$"},"CommonError":{"Ar":"لا يمكن وجود اختلاف بين القيم.","En":"No observations can differ."}}}$mw$::jsonb,$mw$الانحرافات المطلقة غير سالبة؛ مجموعها صفر فقط إذا كانت كلها صفراً.

$\frac1n\sum|x_i-\bar x|=0$

1. $|x_i-\bar x|=0$

2. $x_i=\bar x$

3. $R=\bar x-\bar x=0$

$\sum|x_i-\bar x|=0$

$0$

$R=0$

لا يمكن وجود اختلاف بين القيم.$mw$,$mw$Absolute deviations are nonnegative; their sum vanishes only if all are zero.

$\frac1n\sum|x_i-\bar x|=0$

1. $|x_i-\bar x|=0$

2. $x_i=\bar x$

3. $R=\bar x-\bar x=0$

$\sum|x_i-\bar x|=0$

$0$

$R=0$

No observations can differ.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل يمكن لانحراف مطلق أن يكون سالباً؟","En":"Can an absolute deviation be negative?"},{"Ar":"استنتج أن القيم كلها تساوي المتوسط.","En":"Infer that every value equals the mean."}],"Solution":{"Idea":{"Ar":"الانحرافات المطلقة غير سالبة؛ مجموعها صفر فقط إذا كانت كلها صفراً.","En":"Absolute deviations are nonnegative; their sum vanishes only if all are zero."},"FormulaLatex":"\\frac1n\\sum|x_i-\\bar x|=0","Steps":[{"Ar":"$|x_i-\\bar x|=0$","En":"$|x_i-\\bar x|=0$"},{"Ar":"$x_i=\\bar x$","En":"$x_i=\\bar x$"},{"Ar":"$R=\\bar x-\\bar x=0$","En":"$R=\\bar x-\\bar x=0$"}],"Substitution":{"Ar":"$\\sum|x_i-\\bar x|=0$","En":"$\\sum|x_i-\\bar x|=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$R=0$","En":"$R=0$"},"CommonError":{"Ar":"لا يمكن وجود اختلاف بين القيم.","En":"No observations can differ."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا يمكن وجود اختلاف بين القيم.","En":"No observations can differ."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"وجود اختلاف يجعل انحرافاً موجباً.","En":"Different observations produce positive deviations."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يتوافق مع انحراف مطلق صفري.","En":"Inconsistent with zero absolute deviation."},"Order":4}]}$mw$),
($mw$growth-v53-grade-10-mean-weighted-group-unknown-subgroup-1$mw$,$mw$mean-weighted-group-unknown-subgroup$mw$,$mw$secondary-arithmetic-mean$mw$,$mw$grade-10$mw$,10,3,35,53,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":53,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متوسط مجموعة مجهول","En":"Unknown subgroup mean"},"Question":{"Ar":"متوسط 12 قراءة هو 14. متوسط أول 8 قراءات هو 11. ما متوسط القراءات الأربع الباقية؟","En":"Twelve readings have mean 14. The first eight have mean 11. Find the mean of the remaining four."},"Options":[{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يراعي حجم كل مجموعة.","En":"Ignores group sizes."}},{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع القراءات الأربع.","En":"This is the remaining sum."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فرق المتوسطين لا متوسط الباقي.","En":"The difference of means, not the remaining mean."}},{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب مجموع القراءات الاثنتي عشرة.","En":"Find the total of twelve readings."},{"Ar":"اطرح مجموع الثماني ثم اقسم على أربعة.","En":"Subtract the sum of eight, then divide by four."}],"Solution":{"Idea":{"Ar":"نطرح مجموع المجموعة المعروفة من المجموع الكلي ثم نقسم.","En":"Subtract the known subgroup sum from the total, then divide."},"FormulaLatex":"\\bar x_2=(12\\cdot14-8\\cdot11)/4","Steps":[{"Ar":"$168-88=80$","En":"$168-88=80$"},{"Ar":"$80/4=20$","En":"$80/4=20$"}],"Substitution":{"Ar":"$(168-88)/4$","En":"$(168-88)/4$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(8\\cdot11+4\\cdot20)/12=14$","En":"$(8\\cdot11+4\\cdot20)/12=14$"},"CommonError":{"Ar":"لا يراعي حجم كل مجموعة.","En":"Ignores group sizes."}}}$mw$::jsonb,$mw$نطرح مجموع المجموعة المعروفة من المجموع الكلي ثم نقسم.

$\bar x_2=(12\cdot14-8\cdot11)/4$

1. $168-88=80$

2. $80/4=20$

$(168-88)/4$

$20$

$(8\cdot11+4\cdot20)/12=14$

لا يراعي حجم كل مجموعة.$mw$,$mw$Subtract the known subgroup sum from the total, then divide.

$\bar x_2=(12\cdot14-8\cdot11)/4$

1. $168-88=80$

2. $80/4=20$

$(168-88)/4$

$20$

$(8\cdot11+4\cdot20)/12=14$

Ignores group sizes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مجموع القراءات الاثنتي عشرة.","En":"Find the total of twelve readings."},{"Ar":"اطرح مجموع الثماني ثم اقسم على أربعة.","En":"Subtract the sum of eight, then divide by four."}],"Solution":{"Idea":{"Ar":"نطرح مجموع المجموعة المعروفة من المجموع الكلي ثم نقسم.","En":"Subtract the known subgroup sum from the total, then divide."},"FormulaLatex":"\\bar x_2=(12\\cdot14-8\\cdot11)/4","Steps":[{"Ar":"$168-88=80$","En":"$168-88=80$"},{"Ar":"$80/4=20$","En":"$80/4=20$"}],"Substitution":{"Ar":"$(168-88)/4$","En":"$(168-88)/4$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(8\\cdot11+4\\cdot20)/12=14$","En":"$(8\\cdot11+4\\cdot20)/12=14$"},"CommonError":{"Ar":"لا يراعي حجم كل مجموعة.","En":"Ignores group sizes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يراعي حجم كل مجموعة.","En":"Ignores group sizes."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع القراءات الأربع.","En":"This is the remaining sum."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"فرق المتوسطين لا متوسط الباقي.","En":"The difference of means, not the remaining mean."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v53-grade-11-circle-axis-intercepts-symmetric-ordinate-1$mw$,$mw$circle-axis-intercepts-symmetric-ordinate$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقاطع دائرة مع محور y","En":"Circle intercepts on y-axis"},"Question":{"Ar":"تقطع الدائرة $(x-3)^2+(y-1)^2=25$ محور y عند نقطتين. ما مجموع إحداثيي y لهما؟","En":"The circle $(x-3)^2+(y-1)^2=25$ meets the y-axis at two points. Find the sum of their y-coordinates."},"Options":[{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة إحداثي المركز.","En":"Reverses the centre ordinate."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض تماثل التقاطعين حول الأصل.","En":"Assumes symmetry about the origin."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المسافة بين التقاطعين.","En":"This is the distance between the intercepts."}}],"Hints":[{"Ar":"ضع x=0.","En":"Set x to zero."},{"Ar":"خذ الجذر بإشارتيه.","En":"Take both signs of the square root."}],"Solution":{"Idea":{"Ar":"نضع x=0 ثم نحل المعادلة في y.","En":"Set x to zero and solve for y."},"FormulaLatex":"(y-1)^2=25-9","Steps":[{"Ar":"$(y-1)^2=16$","En":"$(y-1)^2=16$"},{"Ar":"$y=1\\pm4$","En":"$y=1\\pm4$"},{"Ar":"$5+(-3)=2$","En":"$5+(-3)=2$"}],"Substitution":{"Ar":"$(0-3)^2+(y-1)^2=25$","En":"$(0-3)^2+(y-1)^2=25$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9+(5-1)^2=9+(-3-1)^2=25$","En":"$9+(5-1)^2=9+(-3-1)^2=25$"},"CommonError":{"Ar":"يفترض تماثل التقاطعين حول الأصل.","En":"Assumes symmetry about the origin."}}}$mw$::jsonb,$mw$نضع x=0 ثم نحل المعادلة في y.

$(y-1)^2=25-9$

1. $(y-1)^2=16$

2. $y=1\pm4$

3. $5+(-3)=2$

$(0-3)^2+(y-1)^2=25$

$2$

$9+(5-1)^2=9+(-3-1)^2=25$

يفترض تماثل التقاطعين حول الأصل.$mw$,$mw$Set x to zero and solve for y.

$(y-1)^2=25-9$

1. $(y-1)^2=16$

2. $y=1\pm4$

3. $5+(-3)=2$

$(0-3)^2+(y-1)^2=25$

$2$

$9+(5-1)^2=9+(-3-1)^2=25$

Assumes symmetry about the origin.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع x=0.","En":"Set x to zero."},{"Ar":"خذ الجذر بإشارتيه.","En":"Take both signs of the square root."}],"Solution":{"Idea":{"Ar":"نضع x=0 ثم نحل المعادلة في y.","En":"Set x to zero and solve for y."},"FormulaLatex":"(y-1)^2=25-9","Steps":[{"Ar":"$(y-1)^2=16$","En":"$(y-1)^2=16$"},{"Ar":"$y=1\\pm4$","En":"$y=1\\pm4$"},{"Ar":"$5+(-3)=2$","En":"$5+(-3)=2$"}],"Substitution":{"Ar":"$(0-3)^2+(y-1)^2=25$","En":"$(0-3)^2+(y-1)^2=25$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9+(5-1)^2=9+(-3-1)^2=25$","En":"$9+(5-1)^2=9+(-3-1)^2=25$"},"CommonError":{"Ar":"يفترض تماثل التقاطعين حول الأصل.","En":"Assumes symmetry about the origin."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارة إحداثي المركز.","En":"Reverses the centre ordinate."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يفترض تماثل التقاطعين حول الأصل.","En":"Assumes symmetry about the origin."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه المسافة بين التقاطعين.","En":"This is the distance between the intercepts."},"Order":4}]}$mw$),
($mw$growth-v53-grade-11-locus-point-distance-axis-constraint-1$mw$,$mw$locus-point-distance-axis-constraint$mw$,$mw$loci$mw$,$mw$grade-11$mw$,11,3,88,330,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":330,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محل مقيد بمحور","En":"Locus restricted to an axis"},"Question":{"Ar":"النقطة P تقع على محور x وتبعد 5 وحدات عن (0,3). ما عدد المواضع الممكنة لها؟","En":"Point P lies on the x-axis and is five units from (0,3). How many positions are possible?"},"Options":[{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الدائرة تصل إلى المحور لأن 5 أكبر من 3.","En":"The circle reaches the axis because five exceeds three."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس تماساً؛ توجد نقطتان.","En":"This is not tangency; there are two points."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المسافة ليست عدد المواضع.","En":"The distance is not the number of positions."}}],"Hints":[{"Ar":"إحداثي y يساوي صفراً.","En":"The y-coordinate is zero."},{"Ar":"حل x²=16 في الأعداد الحقيقية.","En":"Solve x²=16 over the reals."}],"Solution":{"Idea":{"Ar":"نكتب P=(x,0) ونستعمل قانون المسافة.","En":"Write P=(x,0) and use the distance formula."},"FormulaLatex":"x^2+3^2=5^2","Steps":[{"Ar":"$x^2=16$","En":"$x^2=16$"},{"Ar":"$x=\\pm4$","En":"$x=\\pm4$"}],"Substitution":{"Ar":"$x^2+9=25$","En":"$x^2+9=25$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4^2+3^2=25$","En":"$4^2+3^2=25$"},"CommonError":{"Ar":"الدائرة تصل إلى المحور لأن 5 أكبر من 3.","En":"The circle reaches the axis because five exceeds three."}}}$mw$::jsonb,$mw$نكتب P=(x,0) ونستعمل قانون المسافة.

$x^2+3^2=5^2$

1. $x^2=16$

2. $x=\pm4$

$x^2+9=25$

$2$

$4^2+3^2=25$

الدائرة تصل إلى المحور لأن 5 أكبر من 3.$mw$,$mw$Write P=(x,0) and use the distance formula.

$x^2+3^2=5^2$

1. $x^2=16$

2. $x=\pm4$

$x^2+9=25$

$2$

$4^2+3^2=25$

The circle reaches the axis because five exceeds three.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"إحداثي y يساوي صفراً.","En":"The y-coordinate is zero."},{"Ar":"حل x²=16 في الأعداد الحقيقية.","En":"Solve x²=16 over the reals."}],"Solution":{"Idea":{"Ar":"نكتب P=(x,0) ونستعمل قانون المسافة.","En":"Write P=(x,0) and use the distance formula."},"FormulaLatex":"x^2+3^2=5^2","Steps":[{"Ar":"$x^2=16$","En":"$x^2=16$"},{"Ar":"$x=\\pm4$","En":"$x=\\pm4$"}],"Substitution":{"Ar":"$x^2+9=25$","En":"$x^2+9=25$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4^2+3^2=25$","En":"$4^2+3^2=25$"},"CommonError":{"Ar":"الدائرة تصل إلى المحور لأن 5 أكبر من 3.","En":"The circle reaches the axis because five exceeds three."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الدائرة تصل إلى المحور لأن 5 أكبر من 3.","En":"The circle reaches the axis because five exceeds three."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ليس تماساً؛ توجد نقطتان.","En":"This is not tangency; there are two points."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المسافة ليست عدد المواضع.","En":"The distance is not the number of positions."},"Order":4}]}$mw$),
($mw$growth-v53-grade-12-dot-product-norm-difference-perpendicular-1$mw$,$mw$dot-product-norm-difference-perpendicular$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق متجهين متعامدين","En":"Difference of perpendicular vectors"},"Question":{"Ar":"متجهان متعامدان معياراهما 9 و12. ما معيار الفرق بينهما؟","En":"Two perpendicular vectors have norms nine and twelve. Find the norm of their difference."},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح المعيارين مباشرة.","En":"Subtracts the norms directly."}},{"LatexCode":"21","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المعيارين مباشرة.","En":"Adds the norms directly."}},{"LatexCode":"225","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع المعيار.","En":"This is the squared norm."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"استعمل أن الضرب القياسي صفر.","En":"Use the zero dot product."},{"Ar":"خذ الجذر بعد جمع المربعين.","En":"Take the square root of their squared sum."}],"Solution":{"Idea":{"Ar":"الضرب القياسي صفر بسبب التعامد.","En":"The dot product vanishes by perpendicularity."},"FormulaLatex":"\\|u-v\\|^2=\\|u\\|^2+\\|v\\|^2-2u\\cdot v","Steps":[{"Ar":"$81+144=225$","En":"$81+144=225$"},{"Ar":"$\\|u-v\\|=15$","En":"$\\|u-v\\|=15$"}],"Substitution":{"Ar":"$9^2+12^2-0$","En":"$9^2+12^2-0$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15^2=225$","En":"$15^2=225$"},"CommonError":{"Ar":"طرح المعيارين مباشرة.","En":"Subtracts the norms directly."}}}$mw$::jsonb,$mw$الضرب القياسي صفر بسبب التعامد.

$\|u-v\|^2=\|u\|^2+\|v\|^2-2u\cdot v$

1. $81+144=225$

2. $\|u-v\|=15$

$9^2+12^2-0$

$15$

$15^2=225$

طرح المعيارين مباشرة.$mw$,$mw$The dot product vanishes by perpendicularity.

$\|u-v\|^2=\|u\|^2+\|v\|^2-2u\cdot v$

1. $81+144=225$

2. $\|u-v\|=15$

$9^2+12^2-0$

$15$

$15^2=225$

Subtracts the norms directly.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل أن الضرب القياسي صفر.","En":"Use the zero dot product."},{"Ar":"خذ الجذر بعد جمع المربعين.","En":"Take the square root of their squared sum."}],"Solution":{"Idea":{"Ar":"الضرب القياسي صفر بسبب التعامد.","En":"The dot product vanishes by perpendicularity."},"FormulaLatex":"\\|u-v\\|^2=\\|u\\|^2+\\|v\\|^2-2u\\cdot v","Steps":[{"Ar":"$81+144=225$","En":"$81+144=225$"},{"Ar":"$\\|u-v\\|=15$","En":"$\\|u-v\\|=15$"}],"Substitution":{"Ar":"$9^2+12^2-0$","En":"$9^2+12^2-0$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15^2=225$","En":"$15^2=225$"},"CommonError":{"Ar":"طرح المعيارين مباشرة.","En":"Subtracts the norms directly."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح المعيارين مباشرة.","En":"Subtracts the norms directly."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع المعيارين مباشرة.","En":"Adds the norms directly."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع المعيار.","En":"This is the squared norm."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v53-grade-12-circle-translation-center-radius-invariance-1$mw$,$mw$circle-translation-center-radius-invariance$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"انسحاب دائرة","En":"Translating a circle"},"Question":{"Ar":"نُقلت الدائرة $(x-2)^2+(y+3)^2=16$ خمس وحدات إلى اليمين ووحدتين إلى الأعلى. ما معادلتها الجديدة؟","En":"The circle $(x-2)^2+(y+3)^2=16$ is translated five units right and two units up. What is its new equation?"},"Options":[{"LatexCode":"(x-7)^2+(y-1)^2=16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ في إشارة الإحداثي الرأسي للمركز الجديد.","En":"Uses the wrong sign for the new centre ordinate."}},{"LatexCode":"(x-7)^2+(y+1)^2=23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"غيّر مربع نصف القطر رغم ثباته.","En":"Changes the squared radius despite translation."}},{"LatexCode":"(x-7)^2+(y+1)^2=16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(x+3)^2+(y+5)^2=16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نقل المركز في الاتجاه المعاكس.","En":"Moves the centre in the opposite direction."}}],"Hints":[{"Ar":"استخرج المركز من المعادلة الأصلية.","En":"Read the original centre."},{"Ar":"أضف متجه الانسحاب إلى المركز.","En":"Add the translation vector to the centre."}],"Solution":{"Idea":{"Ar":"الانسحاب يغير المركز ويحافظ على نصف القطر.","En":"Translation changes the centre but preserves the radius."},"FormulaLatex":"(h',k')=(h+5,k+2)","Steps":[{"Ar":"$(h',k')=(7,-1)$","En":"$(h',k')=(7,-1)$"},{"Ar":"$r^2=16$","En":"$r^2=16$"}],"Substitution":{"Ar":"$(2+5,-3+2)$","En":"$(2+5,-3+2)$"},"Result":{"Ar":"$(x-7)^2+(y+1)^2=16$","En":"$(x-7)^2+(y+1)^2=16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(11-7)^2+(-1+1)^2=16$","En":"$(11-7)^2+(-1+1)^2=16$"},"CommonError":{"Ar":"نقل المركز في الاتجاه المعاكس.","En":"Moves the centre in the opposite direction."}}}$mw$::jsonb,$mw$الانسحاب يغير المركز ويحافظ على نصف القطر.

$(h',k')=(h+5,k+2)$

1. $(h',k')=(7,-1)$

2. $r^2=16$

$(2+5,-3+2)$

$(x-7)^2+(y+1)^2=16$

$(11-7)^2+(-1+1)^2=16$

نقل المركز في الاتجاه المعاكس.$mw$,$mw$Translation changes the centre but preserves the radius.

$(h',k')=(h+5,k+2)$

1. $(h',k')=(7,-1)$

2. $r^2=16$

$(2+5,-3+2)$

$(x-7)^2+(y+1)^2=16$

$(11-7)^2+(-1+1)^2=16$

Moves the centre in the opposite direction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استخرج المركز من المعادلة الأصلية.","En":"Read the original centre."},{"Ar":"أضف متجه الانسحاب إلى المركز.","En":"Add the translation vector to the centre."}],"Solution":{"Idea":{"Ar":"الانسحاب يغير المركز ويحافظ على نصف القطر.","En":"Translation changes the centre but preserves the radius."},"FormulaLatex":"(h',k')=(h+5,k+2)","Steps":[{"Ar":"$(h',k')=(7,-1)$","En":"$(h',k')=(7,-1)$"},{"Ar":"$r^2=16$","En":"$r^2=16$"}],"Substitution":{"Ar":"$(2+5,-3+2)$","En":"$(2+5,-3+2)$"},"Result":{"Ar":"$(x-7)^2+(y+1)^2=16$","En":"$(x-7)^2+(y+1)^2=16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(11-7)^2+(-1+1)^2=16$","En":"$(11-7)^2+(-1+1)^2=16$"},"CommonError":{"Ar":"نقل المركز في الاتجاه المعاكس.","En":"Moves the centre in the opposite direction."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أخطأ في إشارة الإحداثي الرأسي للمركز الجديد.","En":"Uses the wrong sign for the new centre ordinate."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"غيّر مربع نصف القطر رغم ثباته.","En":"Changes the squared radius despite translation."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"نقل المركز في الاتجاه المعاكس.","En":"Moves the centre in the opposite direction."},"Order":4}]}$mw$),
($mw$growth-v53-grade-8-polygon-interior-sum-infer-sides-1$mw$,$mw$polygon-interior-sum-infer-sides$mw$,$mw$middle-polygon-angles$mw$,$mw$grade-8$mw$,8,2,8,39,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":39,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد الأضلاع من مجموع الزوايا","En":"Number of sides from angle sum"},"Question":{"Ar":"مجموع الزوايا الداخلية لمضلع بسيط يساوي 1440°. كم ضلعاً له؟","En":"A simple polygon has interior angle sum 1440°. How many sides does it have?"},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف أربعة بدلاً من اثنين.","En":"Adds four rather than two."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد المثلثات الناتجة من التقسيم لا عدد الأضلاع.","En":"The triangulation count, not the side count."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف واحداً بدلاً من اثنين.","En":"Adds one rather than two."}}],"Hints":[{"Ar":"اقسم المجموع على 180.","En":"Divide the sum by 180."},{"Ar":"أضف 2 للناتج.","En":"Add two to the result."}],"Solution":{"Idea":{"Ar":"مجموع زوايا المضلع يساوي 180 مضروبة في عدد الأضلاع ناقص اثنين.","En":"The interior angle sum is 180 times the number of sides minus two."},"FormulaLatex":"180(n-2)=1440","Steps":[{"Ar":"$n-2=8$","En":"$n-2=8$"},{"Ar":"$n=10$","En":"$n=10$"}],"Substitution":{"Ar":"$n-2=1440/180$","En":"$n-2=1440/180$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$180(10-2)=1440$","En":"$180(10-2)=1440$"},"CommonError":{"Ar":"عدد المثلثات الناتجة من التقسيم لا عدد الأضلاع.","En":"The triangulation count, not the side count."}}}$mw$::jsonb,$mw$مجموع زوايا المضلع يساوي 180 مضروبة في عدد الأضلاع ناقص اثنين.

$180(n-2)=1440$

1. $n-2=8$

2. $n=10$

$n-2=1440/180$

$10$

$180(10-2)=1440$

عدد المثلثات الناتجة من التقسيم لا عدد الأضلاع.$mw$,$mw$The interior angle sum is 180 times the number of sides minus two.

$180(n-2)=1440$

1. $n-2=8$

2. $n=10$

$n-2=1440/180$

$10$

$180(10-2)=1440$

The triangulation count, not the side count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم المجموع على 180.","En":"Divide the sum by 180."},{"Ar":"أضف 2 للناتج.","En":"Add two to the result."}],"Solution":{"Idea":{"Ar":"مجموع زوايا المضلع يساوي 180 مضروبة في عدد الأضلاع ناقص اثنين.","En":"The interior angle sum is 180 times the number of sides minus two."},"FormulaLatex":"180(n-2)=1440","Steps":[{"Ar":"$n-2=8$","En":"$n-2=8$"},{"Ar":"$n=10$","En":"$n=10$"}],"Substitution":{"Ar":"$n-2=1440/180$","En":"$n-2=1440/180$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$180(10-2)=1440$","En":"$180(10-2)=1440$"},"CommonError":{"Ar":"عدد المثلثات الناتجة من التقسيم لا عدد الأضلاع.","En":"The triangulation count, not the side count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أضاف أربعة بدلاً من اثنين.","En":"Adds four rather than two."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدد المثلثات الناتجة من التقسيم لا عدد الأضلاع.","En":"The triangulation count, not the side count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف واحداً بدلاً من اثنين.","En":"Adds one rather than two."},"Order":4}]}$mw$),
($mw$growth-v53-grade-8-median-unknown-middle-position-feasible-bound-1$mw$,$mw$median-unknown-middle-position-feasible-bound$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قيمة وسطى من شرط الترتيب","En":"Middle observation from order"},"Question":{"Ar":"خمس قيم مرتبة ترتيباً غير تناقصي هي 2،4،x،9،13. أي عدد من الخيارات لا يمكن أن يكون وسيطاً لها؟","En":"Five values in nondecreasing order are 2,4,x,9,13. Which listed number cannot be their median?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مسموح بتكرار 4 في الوسط.","En":"Four may be repeated in the middle."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يقع بين 4 و9.","En":"Lies between four and nine."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مسموح بتكرار 9 في الوسط.","En":"Nine may be repeated in the middle."}}],"Hints":[{"Ar":"حدد موضع الوسيط في قائمة من خمس قيم.","En":"Locate the median among five values."},{"Ar":"استعمل شرط الترتيب غير التناقصي.","En":"Use the nondecreasing order constraint."}],"Solution":{"Idea":{"Ar":"الوسيط هو القيمة الثالثة ولا بد أن تقع بين الثانية والرابعة.","En":"The median is the third value and must lie between the second and fourth."},"FormulaLatex":"4\\le x\\le9","Steps":[{"Ar":"$4\\le M\\le9$","En":"$4\\le M\\le9$"},{"Ar":"$10\\notin[4,9]$","En":"$10\\notin[4,9]$"}],"Substitution":{"Ar":"$x=10>9$","En":"$x=10>9$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\le4\\le9\\le9\\le13$","En":"$2\\le4\\le9\\le9\\le13$"},"CommonError":{"Ar":"مسموح بتكرار 4 في الوسط.","En":"Four may be repeated in the middle."}}}$mw$::jsonb,$mw$الوسيط هو القيمة الثالثة ولا بد أن تقع بين الثانية والرابعة.

$4\le x\le9$

1. $4\le M\le9$

2. $10\notin[4,9]$

$x=10>9$

$10$

$2\le4\le9\le9\le13$

مسموح بتكرار 4 في الوسط.$mw$,$mw$The median is the third value and must lie between the second and fourth.

$4\le x\le9$

1. $4\le M\le9$

2. $10\notin[4,9]$

$x=10>9$

$10$

$2\le4\le9\le9\le13$

Four may be repeated in the middle.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد موضع الوسيط في قائمة من خمس قيم.","En":"Locate the median among five values."},{"Ar":"استعمل شرط الترتيب غير التناقصي.","En":"Use the nondecreasing order constraint."}],"Solution":{"Idea":{"Ar":"الوسيط هو القيمة الثالثة ولا بد أن تقع بين الثانية والرابعة.","En":"The median is the third value and must lie between the second and fourth."},"FormulaLatex":"4\\le x\\le9","Steps":[{"Ar":"$4\\le M\\le9$","En":"$4\\le M\\le9$"},{"Ar":"$10\\notin[4,9]$","En":"$10\\notin[4,9]$"}],"Substitution":{"Ar":"$x=10>9$","En":"$x=10>9$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\le4\\le9\\le9\\le13$","En":"$2\\le4\\le9\\le9\\le13$"},"CommonError":{"Ar":"مسموح بتكرار 4 في الوسط.","En":"Four may be repeated in the middle."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مسموح بتكرار 4 في الوسط.","En":"Four may be repeated in the middle."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يقع بين 4 و9.","En":"Lies between four and nine."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مسموح بتكرار 9 في الوسط.","En":"Nine may be repeated in the middle."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v53 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
