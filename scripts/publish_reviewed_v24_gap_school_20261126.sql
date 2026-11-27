-- One-time owner-authorized v24 original linked school growth, eight independently checked items.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v24-grade-1-count-paired-objects-with-unpaired-1$mw$,$mw$count-paired-objects-with-unpaired$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد الأشياء في أزواج","En":"Counting paired and unpaired objects"},"Question":{"Ar":"على الطاولة ثلاثة أزواج من القفازات وقفاز واحد لا ينتمي إلى أي زوج. كم قفازاً على الطاولة؟","En":"On a table are three pairs of gloves and one glove not belonging to any pair. How many gloves are on the table?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعد الأزواج كأن كل زوج قفاز واحد.","En":"Counts each pair as one glove."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل القفاز المنفرد.","En":"Omits the single glove."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد القفاز المنفرد كأنه زوج كامل.","En":"Counts the single glove as another full pair."}}],"Hints":[{"Ar":"كم قفازاً في الزوج الواحد؟","En":"How many gloves are in one pair?"},{"Ar":"عد اثنين لكل زوج ثم أضف القفاز المنفرد.","En":"Count two for each pair, then add the single glove."}],"Solution":{"Idea":{"Ar":"كل زوج يحوي شيئين منفصلين، ونعد كل قفاز مرة واحدة.","En":"Each pair contains two separate objects; count each glove once."},"FormulaLatex":"2+2+2+1","Steps":[{"Ar":"الأزواج الثلاثة تعطي 2+2+2=6 قفازات.","En":"Three pairs give 2+2+2=6 gloves."},{"Ar":"نضيف القفاز المنفرد إلى الستة.","En":"Add the single glove to the six."}],"Substitution":{"Ar":"$6+1=7$","En":"$6+1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"قفازات","En":"Gloves"},"Verification":{"Ar":"سبعة ناقص القفاز المنفرد يترك ستة، أي ثلاثة أزواج.","En":"Seven minus the single glove leaves six, or three pairs."},"CommonError":{"Ar":"لا تعد الأزواج بدلاً من الأشياء المفردة.","En":"Do not count pairs instead of individual objects."}}}$mw$::jsonb,$mw$كل زوج يحوي شيئين منفصلين، ونعد كل قفاز مرة واحدة.

$2+2+2+1$

1. الأزواج الثلاثة تعطي 2+2+2=6 قفازات.

2. نضيف القفاز المنفرد إلى الستة.

$6+1=7$

$7$ قفازات

سبعة ناقص القفاز المنفرد يترك ستة، أي ثلاثة أزواج.

لا تعد الأزواج بدلاً من الأشياء المفردة.$mw$,$mw$Each pair contains two separate objects; count each glove once.

$2+2+2+1$

1. Three pairs give 2+2+2=6 gloves.

2. Add the single glove to the six.

$6+1=7$

$7$ Gloves

Seven minus the single glove leaves six, or three pairs.

Do not count pairs instead of individual objects.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم قفازاً في الزوج الواحد؟","En":"How many gloves are in one pair?"},{"Ar":"عد اثنين لكل زوج ثم أضف القفاز المنفرد.","En":"Count two for each pair, then add the single glove."}],"Solution":{"Idea":{"Ar":"كل زوج يحوي شيئين منفصلين، ونعد كل قفاز مرة واحدة.","En":"Each pair contains two separate objects; count each glove once."},"FormulaLatex":"2+2+2+1","Steps":[{"Ar":"الأزواج الثلاثة تعطي 2+2+2=6 قفازات.","En":"Three pairs give 2+2+2=6 gloves."},{"Ar":"نضيف القفاز المنفرد إلى الستة.","En":"Add the single glove to the six."}],"Substitution":{"Ar":"$6+1=7$","En":"$6+1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"قفازات","En":"Gloves"},"Verification":{"Ar":"سبعة ناقص القفاز المنفرد يترك ستة، أي ثلاثة أزواج.","En":"Seven minus the single glove leaves six, or three pairs."},"CommonError":{"Ar":"لا تعد الأزواج بدلاً من الأشياء المفردة.","En":"Do not count pairs instead of individual objects."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يعد الأزواج كأن كل زوج قفاز واحد.","En":"Counts each pair as one glove."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يهمل القفاز المنفرد.","En":"Omits the single glove."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعد القفاز المنفرد كأنه زوج كامل.","En":"Counts the single glove as another full pair."},"Order":4}]}$mw$),
($mw$growth-v24-grade-1-subtract-explain-incorrect-remaining-1$mw$,$mw$subtract-explain-incorrect-remaining$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اكتشاف خطأ في الباقي","En":"Checking a subtraction claim"},"Question":{"Ar":"كان في الصندوق 10 كرات. أُخرجت 3 كرات. قال طفل إن الباقي 8 كرات. بكم يزيد جوابه على العدد الصحيح؟","En":"A box contained 10 balls. Three were removed. A child says 8 balls remain. By how many is the child's answer too high?"},"Options":[{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يزيد على 7 بواحد فقط.","En":"8 exceeds 7 by only one."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 هو الباقي الصحيح وليس مقدار الخطأ.","En":"7 is the correct remainder, not the error."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 هو الجواب الذي نتحقق منه، لا مقدار زيادته.","En":"8 is the claim being checked, not its excess."}}],"Hints":[{"Ar":"احسب الباقي الحقيقي أولاً.","En":"Find the actual remainder first."},{"Ar":"اطرح الباقي الحقيقي من جواب الطفل.","En":"Subtract the actual remainder from the child's answer."}],"Solution":{"Idea":{"Ar":"نجد الباقي بالطرح، ثم نقارن الجواب المقترح بالباقي الصحيح.","En":"Find the remainder by subtraction, then compare the proposed answer with it."},"FormulaLatex":"8-(10-3)","Steps":[{"Ar":"الباقي الحقيقي 10−3=7.","En":"The actual remainder is 10−3=7."},{"Ar":"نقارن 8 مع 7: الفرق واحد.","En":"Compare 8 with 7: the difference is one."}],"Substitution":{"Ar":"$8-7=1$","En":"$8-7=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"كرة","En":"Ball"},"Verification":{"Ar":"إنقاص جواب الطفل بواحد يعطي 7، ومع الثلاث التي أخرجت نحصل على 10.","En":"Reducing the claim by one gives 7; together with the three removed this restores 10."},"CommonError":{"Ar":"لا تخلط بين الباقي ومقدار الخطأ.","En":"Do not confuse the remainder with the error size."}}}$mw$::jsonb,$mw$نجد الباقي بالطرح، ثم نقارن الجواب المقترح بالباقي الصحيح.

$8-(10-3)$

1. الباقي الحقيقي 10−3=7.

2. نقارن 8 مع 7: الفرق واحد.

$8-7=1$

$1$ كرة

إنقاص جواب الطفل بواحد يعطي 7، ومع الثلاث التي أخرجت نحصل على 10.

لا تخلط بين الباقي ومقدار الخطأ.$mw$,$mw$Find the remainder by subtraction, then compare the proposed answer with it.

$8-(10-3)$

1. The actual remainder is 10−3=7.

2. Compare 8 with 7: the difference is one.

$8-7=1$

$1$ Ball

Reducing the claim by one gives 7; together with the three removed this restores 10.

Do not confuse the remainder with the error size.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الباقي الحقيقي أولاً.","En":"Find the actual remainder first."},{"Ar":"اطرح الباقي الحقيقي من جواب الطفل.","En":"Subtract the actual remainder from the child's answer."}],"Solution":{"Idea":{"Ar":"نجد الباقي بالطرح، ثم نقارن الجواب المقترح بالباقي الصحيح.","En":"Find the remainder by subtraction, then compare the proposed answer with it."},"FormulaLatex":"8-(10-3)","Steps":[{"Ar":"الباقي الحقيقي 10−3=7.","En":"The actual remainder is 10−3=7."},{"Ar":"نقارن 8 مع 7: الفرق واحد.","En":"Compare 8 with 7: the difference is one."}],"Substitution":{"Ar":"$8-7=1$","En":"$8-7=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"كرة","En":"Ball"},"Verification":{"Ar":"إنقاص جواب الطفل بواحد يعطي 7، ومع الثلاث التي أخرجت نحصل على 10.","En":"Reducing the claim by one gives 7; together with the three removed this restores 10."},"CommonError":{"Ar":"لا تخلط بين الباقي ومقدار الخطأ.","En":"Do not confuse the remainder with the error size."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8 يزيد على 7 بواحد فقط.","En":"8 exceeds 7 by only one."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"7 هو الباقي الصحيح وليس مقدار الخطأ.","En":"7 is the correct remainder, not the error."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 هو الجواب الذي نتحقق منه، لا مقدار زيادته.","En":"8 is the claim being checked, not its excess."},"Order":4}]}$mw$),
($mw$growth-v24-grade-2-undo-equal-add-remove-1$mw$,$mw$undo-equal-add-remove$mw$,$mw$primary-multistep-arithmetic$mw$,$mw$grade-2$mw$,2,1,1,3,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":3,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر عمليتين متعاكستين","En":"Effect of opposite operations"},"Question":{"Ar":"في صندوق 47 مكعباً. أضاف طفل إليه 16 مكعباً ثم أخرج 16 مكعباً منه. كم مكعباً في الصندوق الآن؟","En":"A box holds 47 cubes. A child adds 16 cubes to it and then removes 16 cubes. How many cubes are in the box now?"},"Options":[{"LatexCode":"31","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 16 من العدد الأصلي وأهمل الإضافة.","En":"Subtracts 16 from the original count but ignores the addition."}},{"LatexCode":"47","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"63","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب العدد بعد الإضافة فقط.","En":"Counts the cubes after the addition only."}},{"LatexCode":"79","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 16 مرتين بدلاً من طرحها في المرة الثانية.","En":"Adds 16 twice instead of subtracting it the second time."}}],"Hints":[{"Ar":"هل العمليتان تغيران العدد بالمقدار نفسه؟","En":"Do both operations change the count by the same amount?"},{"Ar":"احسب أثر إضافة 16 ثم طرح 16.","En":"Find the effect of adding and then subtracting 16."}],"Solution":{"Idea":{"Ar":"إضافة كمية ثم طرح الكمية نفسها لا يغير العدد الابتدائي.","En":"Adding and then subtracting the same quantity leaves the initial number unchanged."},"FormulaLatex":"47+16-16","Steps":[{"Ar":"بعد الإضافة يوجد 63 مكعباً.","En":"After adding, there are 63 cubes."},{"Ar":"بعد إخراج 16 نعود إلى 47.","En":"Removing 16 returns the count to 47."}],"Substitution":{"Ar":"$63-16=47$","En":"$63-16=47$"},"Result":{"Ar":"$47$","En":"$47$"},"Unit":{"Ar":"مكعباً","En":"Cubes"},"Verification":{"Ar":"التغير الصافي 16−16=0؛ لذلك لم يتغير العدد.","En":"The net change is 16−16=0, so the count did not change."},"CommonError":{"Ar":"لا تتجاهل إحدى العمليتين.","En":"Do not ignore either operation."}}}$mw$::jsonb,$mw$إضافة كمية ثم طرح الكمية نفسها لا يغير العدد الابتدائي.

$47+16-16$

1. بعد الإضافة يوجد 63 مكعباً.

2. بعد إخراج 16 نعود إلى 47.

$63-16=47$

$47$ مكعباً

التغير الصافي 16−16=0؛ لذلك لم يتغير العدد.

لا تتجاهل إحدى العمليتين.$mw$,$mw$Adding and then subtracting the same quantity leaves the initial number unchanged.

$47+16-16$

1. After adding, there are 63 cubes.

2. Removing 16 returns the count to 47.

$63-16=47$

$47$ Cubes

The net change is 16−16=0, so the count did not change.

Do not ignore either operation.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل العمليتان تغيران العدد بالمقدار نفسه؟","En":"Do both operations change the count by the same amount?"},{"Ar":"احسب أثر إضافة 16 ثم طرح 16.","En":"Find the effect of adding and then subtracting 16."}],"Solution":{"Idea":{"Ar":"إضافة كمية ثم طرح الكمية نفسها لا يغير العدد الابتدائي.","En":"Adding and then subtracting the same quantity leaves the initial number unchanged."},"FormulaLatex":"47+16-16","Steps":[{"Ar":"بعد الإضافة يوجد 63 مكعباً.","En":"After adding, there are 63 cubes."},{"Ar":"بعد إخراج 16 نعود إلى 47.","En":"Removing 16 returns the count to 47."}],"Substitution":{"Ar":"$63-16=47$","En":"$63-16=47$"},"Result":{"Ar":"$47$","En":"$47$"},"Unit":{"Ar":"مكعباً","En":"Cubes"},"Verification":{"Ar":"التغير الصافي 16−16=0؛ لذلك لم يتغير العدد.","En":"The net change is 16−16=0, so the count did not change."},"CommonError":{"Ar":"لا تتجاهل إحدى العمليتين.","En":"Do not ignore either operation."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 16 من العدد الأصلي وأهمل الإضافة.","En":"Subtracts 16 from the original count but ignores the addition."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب العدد بعد الإضافة فقط.","En":"Counts the cubes after the addition only."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 16 مرتين بدلاً من طرحها في المرة الثانية.","En":"Adds 16 twice instead of subtracting it the second time."},"Order":4}]}$mw$),
($mw$growth-v24-grade-2-length-cut-equal-pieces-unused-end-1$mw$,$mw$length-cut-equal-pieces-unused-end$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طول الجزء غير المستخدم","En":"Length of an unused end"},"Question":{"Ar":"شريط طوله 23 سم. قُصّت منه قطعتان طول كل منهما 8 سم دون فقد أي طول عند القص. كم سنتيمتراً بقي من الشريط؟","En":"A strip is 23 cm long. Two pieces, each 8 cm long, are cut from it without any length lost in cutting. How many centimetres remain?"},"Options":[{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 هو طول القطعة الواحدة المقصوصة.","En":"8 is the length of one cut piece."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح طول قطعة واحدة فقط.","En":"Subtracts the length of just one piece."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"16 هو مجموع الطولين المقطوعين وليس الباقي.","En":"16 is the total removed length, not the remainder."}}],"Hints":[{"Ar":"كم طول القطعتين معاً؟","En":"What is the combined length of the two pieces?"},{"Ar":"اطرح مجموع طولي القطعتين من طول الشريط الأصلي.","En":"Subtract the combined piece length from the original strip length."}],"Solution":{"Idea":{"Ar":"عند عدم فقد طول في القص، يتجزأ طول الشريط إلى مجموع المقطوع والباقي.","En":"With no cutting loss, the original length is the sum of removed and remaining lengths."},"FormulaLatex":"23-(8+8)","Steps":[{"Ar":"مجموع المقطوع 8+8=16 سم.","En":"The removed lengths total 8+8=16 cm."},{"Ar":"نطرح 16 من 23.","En":"Subtract 16 from 23."}],"Substitution":{"Ar":"$23-16=7$","En":"$23-16=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"8+8+7=23 سم، وهو طول الشريط الأصلي.","En":"8+8+7=23 cm, the original length."},"CommonError":{"Ar":"لا تطرح طول قطعة واحدة وتنسى الثانية.","En":"Do not subtract only one of the two pieces."}}}$mw$::jsonb,$mw$عند عدم فقد طول في القص، يتجزأ طول الشريط إلى مجموع المقطوع والباقي.

$23-(8+8)$

1. مجموع المقطوع 8+8=16 سم.

2. نطرح 16 من 23.

$23-16=7$

$7$ سم

8+8+7=23 سم، وهو طول الشريط الأصلي.

لا تطرح طول قطعة واحدة وتنسى الثانية.$mw$,$mw$With no cutting loss, the original length is the sum of removed and remaining lengths.

$23-(8+8)$

1. The removed lengths total 8+8=16 cm.

2. Subtract 16 from 23.

$23-16=7$

$7$ cm

8+8+7=23 cm, the original length.

Do not subtract only one of the two pieces.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم طول القطعتين معاً؟","En":"What is the combined length of the two pieces?"},{"Ar":"اطرح مجموع طولي القطعتين من طول الشريط الأصلي.","En":"Subtract the combined piece length from the original strip length."}],"Solution":{"Idea":{"Ar":"عند عدم فقد طول في القص، يتجزأ طول الشريط إلى مجموع المقطوع والباقي.","En":"With no cutting loss, the original length is the sum of removed and remaining lengths."},"FormulaLatex":"23-(8+8)","Steps":[{"Ar":"مجموع المقطوع 8+8=16 سم.","En":"The removed lengths total 8+8=16 cm."},{"Ar":"نطرح 16 من 23.","En":"Subtract 16 from 23."}],"Substitution":{"Ar":"$23-16=7$","En":"$23-16=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"8+8+7=23 سم، وهو طول الشريط الأصلي.","En":"8+8+7=23 cm, the original length."},"CommonError":{"Ar":"لا تطرح طول قطعة واحدة وتنسى الثانية.","En":"Do not subtract only one of the two pieces."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8 هو طول القطعة الواحدة المقصوصة.","En":"8 is the length of one cut piece."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح طول قطعة واحدة فقط.","En":"Subtracts the length of just one piece."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"16 هو مجموع الطولين المقطوعين وليس الباقي.","En":"16 is the total removed length, not the remainder."},"Order":4}]}$mw$),
($mw$growth-v24-grade-6-fraction-division-unit-remainder-1$mw$,$mw$fraction-division-unit-remainder$mw$,$mw$p-fractions-decimals-fraction-operations$mw$,$mw$grade-6$mw$,6,1,21,95,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":95,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"توزيع كمية على حصص كاملة","En":"Dividing into full portions"},"Question":{"Ar":"معك $\\frac78$ لتر من العصير. كل كوب ممتلئ يحتاج إلى $\\frac14$ لتر. بعد ملء أكبر عدد ممكن من الأكواب كاملة، كم لتراً يتبقى؟","En":"You have $\\frac78$ litre of juice. Each full cup requires $\\frac14$ litre. After filling as many whole cups as possible, how many litres remain?"},"Options":[{"LatexCode":"\\frac18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربع لتر يكفي لكوب كامل آخر؛ الباقي يجب أن يكون أقل منه.","En":"One quarter would fill another cup; the remainder must be smaller."}},{"LatexCode":"\\frac38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أثمان تكفي لكوب إضافي، فلا تمثل الباقي بعد الملء الأقصى.","En":"Three eighths would fill an additional cup, so this is not the final remainder."}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أرباع هي الكمية المستعملة في الأكواب الثلاثة.","En":"Three quarters is the amount used in the three full cups."}}],"Hints":[{"Ar":"حوّل حجم الكوب إلى أثمان اللتر.","En":"Express the cup volume in eighths of a litre."},{"Ar":"استخدم مجموعات من ثمنين ما دامت الكمية تكفي.","En":"Use groups of two eighths while enough juice remains."}],"Solution":{"Idea":{"Ar":"نقسم الكمية إلى حصص كاملة متساوية ثم نطرح الكمية المستخدمة. الباقي أصغر من حصة كاملة.","En":"Divide into complete equal portions and subtract the amount used. The remainder is smaller than a full portion."},"FormulaLatex":"R=V-nv,\\quad 0\\le R<v","Steps":[{"Ar":"حجم الكوب $\\frac14=\\frac28$ لتر.","En":"A cup holds $\\frac14=\\frac28$ litre."},{"Ar":"سبعة أثمان تكفي لثلاثة أكواب، وتستهلك $\\frac68$ لتر.","En":"Seven eighths fill three cups, using $\\frac68$ litre."},{"Ar":"نطرح الكمية المستعملة من الكمية الأصلية.","En":"Subtract the used amount from the original volume."}],"Substitution":{"Ar":"$\\frac78-\\frac68=\\frac18$","En":"$\\frac78-\\frac68=\\frac18$"},"Result":{"Ar":"$\\frac18$","En":"$\\frac18$"},"Unit":{"Ar":"لتر","En":"Litre"},"Verification":{"Ar":"$\\frac68+\\frac18=\\frac78$ والباقي أقل من حجم كوب.","En":"$\\frac68+\\frac18=\\frac78$ and the remainder is below a cup's volume."},"CommonError":{"Ar":"لا تحسب عدد الأكواب الجزئية ضمن الأكواب الممتلئة.","En":"Do not count a partially filled cup as a full cup."}}}$mw$::jsonb,$mw$نقسم الكمية إلى حصص كاملة متساوية ثم نطرح الكمية المستخدمة. الباقي أصغر من حصة كاملة.

$R=V-nv,\quad 0\le R<v$

1. حجم الكوب $\frac14=\frac28$ لتر.

2. سبعة أثمان تكفي لثلاثة أكواب، وتستهلك $\frac68$ لتر.

3. نطرح الكمية المستعملة من الكمية الأصلية.

$\frac78-\frac68=\frac18$

$\frac18$ لتر

$\frac68+\frac18=\frac78$ والباقي أقل من حجم كوب.

لا تحسب عدد الأكواب الجزئية ضمن الأكواب الممتلئة.$mw$,$mw$Divide into complete equal portions and subtract the amount used. The remainder is smaller than a full portion.

$R=V-nv,\quad 0\le R<v$

1. A cup holds $\frac14=\frac28$ litre.

2. Seven eighths fill three cups, using $\frac68$ litre.

3. Subtract the used amount from the original volume.

$\frac78-\frac68=\frac18$

$\frac18$ Litre

$\frac68+\frac18=\frac78$ and the remainder is below a cup's volume.

Do not count a partially filled cup as a full cup.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل حجم الكوب إلى أثمان اللتر.","En":"Express the cup volume in eighths of a litre."},{"Ar":"استخدم مجموعات من ثمنين ما دامت الكمية تكفي.","En":"Use groups of two eighths while enough juice remains."}],"Solution":{"Idea":{"Ar":"نقسم الكمية إلى حصص كاملة متساوية ثم نطرح الكمية المستخدمة. الباقي أصغر من حصة كاملة.","En":"Divide into complete equal portions and subtract the amount used. The remainder is smaller than a full portion."},"FormulaLatex":"R=V-nv,\\quad 0\\le R<v","Steps":[{"Ar":"حجم الكوب $\\frac14=\\frac28$ لتر.","En":"A cup holds $\\frac14=\\frac28$ litre."},{"Ar":"سبعة أثمان تكفي لثلاثة أكواب، وتستهلك $\\frac68$ لتر.","En":"Seven eighths fill three cups, using $\\frac68$ litre."},{"Ar":"نطرح الكمية المستعملة من الكمية الأصلية.","En":"Subtract the used amount from the original volume."}],"Substitution":{"Ar":"$\\frac78-\\frac68=\\frac18$","En":"$\\frac78-\\frac68=\\frac18$"},"Result":{"Ar":"$\\frac18$","En":"$\\frac18$"},"Unit":{"Ar":"لتر","En":"Litre"},"Verification":{"Ar":"$\\frac68+\\frac18=\\frac78$ والباقي أقل من حجم كوب.","En":"$\\frac68+\\frac18=\\frac78$ and the remainder is below a cup's volume."},"CommonError":{"Ar":"لا تحسب عدد الأكواب الجزئية ضمن الأكواب الممتلئة.","En":"Do not count a partially filled cup as a full cup."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ربع لتر يكفي لكوب كامل آخر؛ الباقي يجب أن يكون أقل منه.","En":"One quarter would fill another cup; the remainder must be smaller."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أثمان تكفي لكوب إضافي، فلا تمثل الباقي بعد الملء الأقصى.","En":"Three eighths would fill an additional cup, so this is not the final remainder."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أرباع هي الكمية المستعملة في الأكواب الثلاثة.","En":"Three quarters is the amount used in the three full cups."},"Order":4}]}$mw$),
($mw$growth-v24-grade-6-triangle-area-base-height-change-1$mw$,$mw$triangle-area-base-height-change$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تأثير تغيير القاعدة والارتفاع","En":"Effect of changing base and height"},"Question":{"Ar":"تضاعف طول قاعدة مثلث، بينما انخفض ارتفاعه العمودي المقابل إلى النصف. إذا كانت مساحته قبل التغيير 24 سم²، فما مساحته بعد التغيير؟","En":"A triangle's base doubles while its corresponding perpendicular height is halved. If its original area is 24 cm², what is its new area?"},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طبق تنصيف الارتفاع وأهمل مضاعفة القاعدة.","En":"Halves the height but ignores the doubled base."}},{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"36 أكبر من المساحة الأصلية بمقدار 12، لكن حاصل ضرب القاعدة والارتفاع لم يتغير.","En":"36 is 12 greater than the original area, but the base-height product is unchanged."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف المساحة بسبب القاعدة وأهمل تغير الارتفاع.","En":"Doubles area for the base but ignores the height change."}}],"Hints":[{"Ar":"تعتمد المساحة على حاصل ضرب القاعدة والارتفاع.","En":"Area depends on the product of the base and height."},{"Ar":"عوّض بضعف القاعدة ونصف الارتفاع في قانون المساحة.","En":"Substitute twice the base and half the height in the area formula."}],"Solution":{"Idea":{"Ar":"مساحة المثلث نصف حاصل ضرب قاعدة موجبة وارتفاعها العمودي المقابل؛ تتضاعف القاعدة وتنصف الارتفاع فيبقى حاصل الضرب ثابتاً.","En":"Triangle area is half the product of a positive base and its perpendicular height; doubling one and halving the other preserves the product."},"FormulaLatex":"A'=\\frac12(2b)\\left(\\frac h2\\right)=\\frac12 bh","Steps":[{"Ar":"المساحة الأصلية $\\frac12 bh=24$.","En":"The original area is $\\frac12 bh=24$."},{"Ar":"بعد التغيير نستخدم $2b$ و$\\frac h2$.","En":"After the change use $2b$ and $\\frac h2$."},{"Ar":"عامل التغيير الكلي 2×1/2=1، فلا تتغير المساحة.","En":"The combined multiplier is 2×1/2=1, so the area is unchanged."}],"Substitution":{"Ar":"$24\\times1=24$","En":"$24\\times1=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"مثلاً قاعدة 8 وارتفاع 6 يعطيان 24؛ قاعدة 16 وارتفاع 3 يعطيان 24 أيضاً.","En":"For example base 8 and height 6 yield 24; base 16 and height 3 also yield 24."},"CommonError":{"Ar":"لا تجمع عوامل التغيير في قانون يعتمد على حاصل الضرب.","En":"Do not add scale factors in a formula based on a product."}}}$mw$::jsonb,$mw$مساحة المثلث نصف حاصل ضرب قاعدة موجبة وارتفاعها العمودي المقابل؛ تتضاعف القاعدة وتنصف الارتفاع فيبقى حاصل الضرب ثابتاً.

$A'=\frac12(2b)\left(\frac h2\right)=\frac12 bh$

1. المساحة الأصلية $\frac12 bh=24$.

2. بعد التغيير نستخدم $2b$ و$\frac h2$.

3. عامل التغيير الكلي 2×1/2=1، فلا تتغير المساحة.

$24\times1=24$

$24$ سم²

مثلاً قاعدة 8 وارتفاع 6 يعطيان 24؛ قاعدة 16 وارتفاع 3 يعطيان 24 أيضاً.

لا تجمع عوامل التغيير في قانون يعتمد على حاصل الضرب.$mw$,$mw$Triangle area is half the product of a positive base and its perpendicular height; doubling one and halving the other preserves the product.

$A'=\frac12(2b)\left(\frac h2\right)=\frac12 bh$

1. The original area is $\frac12 bh=24$.

2. After the change use $2b$ and $\frac h2$.

3. The combined multiplier is 2×1/2=1, so the area is unchanged.

$24\times1=24$

$24$ cm²

For example base 8 and height 6 yield 24; base 16 and height 3 also yield 24.

Do not add scale factors in a formula based on a product.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تعتمد المساحة على حاصل ضرب القاعدة والارتفاع.","En":"Area depends on the product of the base and height."},{"Ar":"عوّض بضعف القاعدة ونصف الارتفاع في قانون المساحة.","En":"Substitute twice the base and half the height in the area formula."}],"Solution":{"Idea":{"Ar":"مساحة المثلث نصف حاصل ضرب قاعدة موجبة وارتفاعها العمودي المقابل؛ تتضاعف القاعدة وتنصف الارتفاع فيبقى حاصل الضرب ثابتاً.","En":"Triangle area is half the product of a positive base and its perpendicular height; doubling one and halving the other preserves the product."},"FormulaLatex":"A'=\\frac12(2b)\\left(\\frac h2\\right)=\\frac12 bh","Steps":[{"Ar":"المساحة الأصلية $\\frac12 bh=24$.","En":"The original area is $\\frac12 bh=24$."},{"Ar":"بعد التغيير نستخدم $2b$ و$\\frac h2$.","En":"After the change use $2b$ and $\\frac h2$."},{"Ar":"عامل التغيير الكلي 2×1/2=1، فلا تتغير المساحة.","En":"The combined multiplier is 2×1/2=1, so the area is unchanged."}],"Substitution":{"Ar":"$24\\times1=24$","En":"$24\\times1=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"مثلاً قاعدة 8 وارتفاع 6 يعطيان 24؛ قاعدة 16 وارتفاع 3 يعطيان 24 أيضاً.","En":"For example base 8 and height 6 yield 24; base 16 and height 3 also yield 24."},"CommonError":{"Ar":"لا تجمع عوامل التغيير في قانون يعتمد على حاصل الضرب.","En":"Do not add scale factors in a formula based on a product."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طبق تنصيف الارتفاع وأهمل مضاعفة القاعدة.","En":"Halves the height but ignores the doubled base."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"36 أكبر من المساحة الأصلية بمقدار 12، لكن حاصل ضرب القاعدة والارتفاع لم يتغير.","En":"36 is 12 greater than the original area, but the base-height product is unchanged."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف المساحة بسبب القاعدة وأهمل تغير الارتفاع.","En":"Doubles area for the base but ignores the height change."},"Order":4}]}$mw$),
($mw$growth-v24-grade-9-mad-unknown-symmetric-extreme-1$mw$,$mw$mad-unknown-symmetric-extreme$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج قيمة من متوسط الانحراف المطلق","En":"Recovering a value from mean absolute deviation"},"Question":{"Ar":"مجموعة البيانات هي $(5-a,5,5,5+a)$ حيث $a\\ge0$. إذا كان متوسط الانحراف المطلق عن المتوسط الحسابي يساوي 3، فما قيمة $a$؟","En":"The data set is $(5-a,5,5,5+a)$ with $a\\ge0$. If its mean absolute deviation from the mean is 3, what is $a$?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ساوى متوسط الانحراف المطلق بالانحراف الأقصى.","En":"Equates the mean absolute deviation with the maximum deviation."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة تعطي متوسط انحراف 4.5 لا 3.","En":"This value yields mean absolute deviation 4.5, not 3."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الانحرافات المطلق المطلوب وليس قيمة الطرف الواحد.","En":"This is the required total absolute deviation, not one extreme deviation."}}],"Hints":[{"Ar":"أوجد المتوسط باستعمال تناظر القيم حول 5.","En":"Use the symmetry about 5 to find the mean."},{"Ar":"اكتب الانحرافات المطلقة بدلالة a واجمعها ثم اقسمها على أربعة.","En":"Express the absolute deviations in terms of a, sum them and divide by four."}],"Solution":{"Idea":{"Ar":"متوسط الانحراف المطلق هو متوسط المسافات المطلقة بين كل قيمة والمتوسط الحسابي، لعدد موجب من القيم.","En":"Mean absolute deviation is the average of the absolute distances of each value from the arithmetic mean, for a nonempty data set."},"FormulaLatex":"D=\\frac1n\\sum_{i=1}^n|x_i-\\bar x|","Steps":[{"Ar":"$\\bar x=((5-a)+5+5+(5+a))/4=5$.","En":"$\\bar x=((5-a)+5+5+(5+a))/4=5$."},{"Ar":"الانحرافات المطلقة هي $a,0,0,a$ لأن $a\\ge0$.","En":"The absolute deviations are $a,0,0,a$ because $a\\ge0$."},{"Ar":"$D=\\frac{2a}{4}=3$؛ نضرب في 2 لنجد a.","En":"$D=\\frac{2a}{4}=3$; multiply by 2 to find a."}],"Substitution":{"Ar":"$a=2\\times3=6$","En":"$a=2\\times3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"عند a=6 تصبح القيم −1،5،5،11 والانحرافات 6،0،0،6؛ متوسطها 3.","En":"At a=6 the values are −1,5,5,11 and deviations 6,0,0,6; their mean is 3."},"CommonError":{"Ar":"لا تقسم على عدد الانحرافات غير الصفرية فقط.","En":"Do not divide only by the number of nonzero deviations."}}}$mw$::jsonb,$mw$متوسط الانحراف المطلق هو متوسط المسافات المطلقة بين كل قيمة والمتوسط الحسابي، لعدد موجب من القيم.

$D=\frac1n\sum_{i=1}^n|x_i-\bar x|$

1. $\bar x=((5-a)+5+5+(5+a))/4=5$.

2. الانحرافات المطلقة هي $a,0,0,a$ لأن $a\ge0$.

3. $D=\frac{2a}{4}=3$؛ نضرب في 2 لنجد a.

$a=2\times3=6$

$6$ بلا وحدة محددة

عند a=6 تصبح القيم −1،5،5،11 والانحرافات 6،0،0،6؛ متوسطها 3.

لا تقسم على عدد الانحرافات غير الصفرية فقط.$mw$,$mw$Mean absolute deviation is the average of the absolute distances of each value from the arithmetic mean, for a nonempty data set.

$D=\frac1n\sum_{i=1}^n|x_i-\bar x|$

1. $\bar x=((5-a)+5+5+(5+a))/4=5$.

2. The absolute deviations are $a,0,0,a$ because $a\ge0$.

3. $D=\frac{2a}{4}=3$; multiply by 2 to find a.

$a=2\times3=6$

$6$ No specified unit

At a=6 the values are −1,5,5,11 and deviations 6,0,0,6; their mean is 3.

Do not divide only by the number of nonzero deviations.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أوجد المتوسط باستعمال تناظر القيم حول 5.","En":"Use the symmetry about 5 to find the mean."},{"Ar":"اكتب الانحرافات المطلقة بدلالة a واجمعها ثم اقسمها على أربعة.","En":"Express the absolute deviations in terms of a, sum them and divide by four."}],"Solution":{"Idea":{"Ar":"متوسط الانحراف المطلق هو متوسط المسافات المطلقة بين كل قيمة والمتوسط الحسابي، لعدد موجب من القيم.","En":"Mean absolute deviation is the average of the absolute distances of each value from the arithmetic mean, for a nonempty data set."},"FormulaLatex":"D=\\frac1n\\sum_{i=1}^n|x_i-\\bar x|","Steps":[{"Ar":"$\\bar x=((5-a)+5+5+(5+a))/4=5$.","En":"$\\bar x=((5-a)+5+5+(5+a))/4=5$."},{"Ar":"الانحرافات المطلقة هي $a,0,0,a$ لأن $a\\ge0$.","En":"The absolute deviations are $a,0,0,a$ because $a\\ge0$."},{"Ar":"$D=\\frac{2a}{4}=3$؛ نضرب في 2 لنجد a.","En":"$D=\\frac{2a}{4}=3$; multiply by 2 to find a."}],"Substitution":{"Ar":"$a=2\\times3=6$","En":"$a=2\\times3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"عند a=6 تصبح القيم −1،5،5،11 والانحرافات 6،0،0،6؛ متوسطها 3.","En":"At a=6 the values are −1,5,5,11 and deviations 6,0,0,6; their mean is 3."},"CommonError":{"Ar":"لا تقسم على عدد الانحرافات غير الصفرية فقط.","En":"Do not divide only by the number of nonzero deviations."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ساوى متوسط الانحراف المطلق بالانحراف الأقصى.","En":"Equates the mean absolute deviation with the maximum deviation."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة تعطي متوسط انحراف 4.5 لا 3.","En":"This value yields mean absolute deviation 4.5, not 3."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الانحرافات المطلق المطلوب وليس قيمة الطرف الواحد.","En":"This is the required total absolute deviation, not one extreme deviation."},"Order":4}]}$mw$),
($mw$growth-v24-grade-9-pythagorean-alt-route-extra-distance-1$mw$,$mw$pythagorean-alt-route-extra-distance$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة مسار مباشر بمسار متعامد","En":"Comparing a direct route with a perpendicular route"},"Question":{"Ar":"في ساحة مستوية يتحرك طالب 9 أمتار شرقاً ثم 12 متراً شمالاً. لو سلك خطاً مستقيماً من نقطة البداية إلى النهاية، بكم متر يقصر مساره؟","En":"On a flat courtyard a student walks 9 metres east and then 12 metres north. If the student instead walks straight from start to finish, by how many metres is the route shorter?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 هو فرق طولي الضلعين المتعامدين وليس فرق المسارين.","En":"3 is the difference between the perpendicular legs, not the route lengths."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 طول الجزء الشمالي فقط.","En":"12 is the length of the northward segment alone."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 طول المسار المستقيم لا مقدار التوفير.","En":"15 is the straight-line distance, not the distance saved."}}],"Hints":[{"Ar":"ارسم المسارين ذهنياً باعتبار الشرق والشمال اتجاهين متعامدين.","En":"Picture the east and north segments as perpendicular legs."},{"Ar":"احسب الوتر بنظرية فيثاغورس ثم اطرحه من مجموع المسافتين.","En":"Find the hypotenuse using Pythagoras, then subtract it from the sum of the two distances."}],"Solution":{"Idea":{"Ar":"في مثلث قائم على سطح مستوٍ يساوي مربع الوتر مجموع مربعي الضلعين القائمين؛ التوفير هو فرق طولي المسارين.","En":"In a right triangle in the plane, the squared hypotenuse equals the sum of the squared legs; the saving is the route length difference."},"FormulaLatex":"d=a+b-\\sqrt{a^2+b^2}","Steps":[{"Ar":"المسار المتعامد طوله 9+12=21 متراً.","En":"The perpendicular route is 9+12=21 metres."},{"Ar":"المسار المباشر طوله $\\sqrt{9^2+12^2}=\\sqrt{225}=15$ متراً.","En":"The straight route has length $\\sqrt{9^2+12^2}=\\sqrt{225}=15$ metres."},{"Ar":"نطرح المسار المباشر من المسار الأصلي.","En":"Subtract the direct route from the original route."}],"Substitution":{"Ar":"$21-15=6$","En":"$21-15=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"أمتار","En":"Metres"},"Verification":{"Ar":"15+6=21؛ كما أن مربع 15 يساوي 81+144=225.","En":"15+6=21; also 15 squared equals 81+144=225."},"CommonError":{"Ar":"لا تجعل طول الوتر نفسه جواباً عن مقدار التوفير.","En":"Do not report the hypotenuse itself as the saving."}}}$mw$::jsonb,$mw$في مثلث قائم على سطح مستوٍ يساوي مربع الوتر مجموع مربعي الضلعين القائمين؛ التوفير هو فرق طولي المسارين.

$d=a+b-\sqrt{a^2+b^2}$

1. المسار المتعامد طوله 9+12=21 متراً.

2. المسار المباشر طوله $\sqrt{9^2+12^2}=\sqrt{225}=15$ متراً.

3. نطرح المسار المباشر من المسار الأصلي.

$21-15=6$

$6$ أمتار

15+6=21؛ كما أن مربع 15 يساوي 81+144=225.

لا تجعل طول الوتر نفسه جواباً عن مقدار التوفير.$mw$,$mw$In a right triangle in the plane, the squared hypotenuse equals the sum of the squared legs; the saving is the route length difference.

$d=a+b-\sqrt{a^2+b^2}$

1. The perpendicular route is 9+12=21 metres.

2. The straight route has length $\sqrt{9^2+12^2}=\sqrt{225}=15$ metres.

3. Subtract the direct route from the original route.

$21-15=6$

$6$ Metres

15+6=21; also 15 squared equals 81+144=225.

Do not report the hypotenuse itself as the saving.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ارسم المسارين ذهنياً باعتبار الشرق والشمال اتجاهين متعامدين.","En":"Picture the east and north segments as perpendicular legs."},{"Ar":"احسب الوتر بنظرية فيثاغورس ثم اطرحه من مجموع المسافتين.","En":"Find the hypotenuse using Pythagoras, then subtract it from the sum of the two distances."}],"Solution":{"Idea":{"Ar":"في مثلث قائم على سطح مستوٍ يساوي مربع الوتر مجموع مربعي الضلعين القائمين؛ التوفير هو فرق طولي المسارين.","En":"In a right triangle in the plane, the squared hypotenuse equals the sum of the squared legs; the saving is the route length difference."},"FormulaLatex":"d=a+b-\\sqrt{a^2+b^2}","Steps":[{"Ar":"المسار المتعامد طوله 9+12=21 متراً.","En":"The perpendicular route is 9+12=21 metres."},{"Ar":"المسار المباشر طوله $\\sqrt{9^2+12^2}=\\sqrt{225}=15$ متراً.","En":"The straight route has length $\\sqrt{9^2+12^2}=\\sqrt{225}=15$ metres."},{"Ar":"نطرح المسار المباشر من المسار الأصلي.","En":"Subtract the direct route from the original route."}],"Substitution":{"Ar":"$21-15=6$","En":"$21-15=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"أمتار","En":"Metres"},"Verification":{"Ar":"15+6=21؛ كما أن مربع 15 يساوي 81+144=225.","En":"15+6=21; also 15 squared equals 81+144=225."},"CommonError":{"Ar":"لا تجعل طول الوتر نفسه جواباً عن مقدار التوفير.","En":"Do not report the hypotenuse itself as the saving."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 هو فرق طولي الضلعين المتعامدين وليس فرق المسارين.","En":"3 is the difference between the perpendicular legs, not the route lengths."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"12 طول الجزء الشمالي فقط.","En":"12 is the length of the northward segment alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"15 طول المسار المستقيم لا مقدار التوفير.","En":"15 is the straight-line distance, not the distance saved."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v24 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
