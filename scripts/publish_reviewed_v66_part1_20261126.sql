-- One-time owner-authorized v66 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v66-grade-8-map-scale-compare-two-maps-same-ground-distance-1$mw$,$mw$map-scale-compare-two-maps-same-ground-distance$mw$,$mw$middle-map-scale$mw$,$mw$grade-8$mw$,8,2,7,33,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":33,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة خريطتين","En":"Comparing two maps"},"Question":{"Ar":"تمثل مسافة 4 سم على خريطة بمقياس 1:30000 المسافة الحقيقية نفسها التي يمثلها خط على خريطة بمقياس 1:60000. كم طول الخط الثاني بالسنتيمتر؟","En":"A 4 cm line on a 1:30000 map represents the same ground distance as a line on a 1:60000 map. How long is the second line in centimetres?"},"Options":[{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل اختلاف المقياس.","En":"Ignores the different scales."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس اتجاه النسبة.","En":"Reverses the scale ratio."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يحافظ على المسافة الحقيقية؛ 12 سم بالمقياس الثاني تمثل 720000 سم.","En":"Does not preserve ground distance: 12 cm on the second map represents 720000 cm."}}],"Hints":[{"Ar":"المسافة الحقيقية ثابتة.","En":"The ground distance is fixed."},{"Ar":"استعمل المقياسين بالترتيب الصحيح.","En":"Use the two scales in the correct order."}],"Solution":{"Idea":{"Ar":"نوجد المسافة الحقيقية ثم نقسمها على مقام المقياس الثاني.","En":"Find the ground distance then divide by the second scale denominator."},"FormulaLatex":"L_2=4\\cdot30000/60000","Steps":[{"Ar":"$4\\cdot30000=120000$","En":"$4\\cdot30000=120000$"},{"Ar":"$120000/60000=2$","En":"$120000/60000=2$"}],"Substitution":{"Ar":"$120000/60000$","En":"$120000/60000$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$2\\cdot60000=4\\cdot30000$","En":"$2\\cdot60000=4\\cdot30000$"},"CommonError":{"Ar":"أهمل اختلاف المقياس.","En":"Ignores the different scales."}}}$mw$::jsonb,$mw$نوجد المسافة الحقيقية ثم نقسمها على مقام المقياس الثاني.

$L_2=4\cdot30000/60000$

1. $4\cdot30000=120000$

2. $120000/60000=2$

$120000/60000$

$2$ سم

$2\cdot60000=4\cdot30000$

أهمل اختلاف المقياس.$mw$,$mw$Find the ground distance then divide by the second scale denominator.

$L_2=4\cdot30000/60000$

1. $4\cdot30000=120000$

2. $120000/60000=2$

$120000/60000$

$2$ cm

$2\cdot60000=4\cdot30000$

Ignores the different scales.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المسافة الحقيقية ثابتة.","En":"The ground distance is fixed."},{"Ar":"استعمل المقياسين بالترتيب الصحيح.","En":"Use the two scales in the correct order."}],"Solution":{"Idea":{"Ar":"نوجد المسافة الحقيقية ثم نقسمها على مقام المقياس الثاني.","En":"Find the ground distance then divide by the second scale denominator."},"FormulaLatex":"L_2=4\\cdot30000/60000","Steps":[{"Ar":"$4\\cdot30000=120000$","En":"$4\\cdot30000=120000$"},{"Ar":"$120000/60000=2$","En":"$120000/60000=2$"}],"Substitution":{"Ar":"$120000/60000$","En":"$120000/60000$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$2\\cdot60000=4\\cdot30000$","En":"$2\\cdot60000=4\\cdot30000$"},"CommonError":{"Ar":"أهمل اختلاف المقياس.","En":"Ignores the different scales."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل اختلاف المقياس.","En":"Ignores the different scales."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس اتجاه النسبة.","En":"Reverses the scale ratio."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يحافظ على المسافة الحقيقية؛ 12 سم بالمقياس الثاني تمثل 720000 سم.","En":"Does not preserve ground distance: 12 cm on the second map represents 720000 cm."},"Order":4}]}$mw$),
($mw$growth-v66-grade-8-percent-increase-double-quantity-rate-1$mw$,$mw$percent-increase-double-quantity-rate$mw$,$mw$middle-percent-increase$mw$,$mw$grade-8$mw$,8,2,7,34,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":34,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة زيادة إلى الضعف","En":"Percentage increase to double"},"Question":{"Ar":"ارتفع عدد المشاركين من 48 إلى 96. ما نسبة الزيادة المئوية؟","En":"Participation rises from 48 to 96. What is the percentage increase?"},"Options":[{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم الزيادة على العدد النهائي.","En":"Divides the increase by the final count."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الزيادة وليس نسبتها.","En":"This is the absolute increase."}},{"LatexCode":"200","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة العدد الجديد إلى الأصلي وليست الزيادة.","En":"This is the new count as a percentage of the original."}},{"LatexCode":"100","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب الفرق بين العددين.","En":"Find the difference between the counts."},{"Ar":"استعمل العدد الأصلي في المقام.","En":"Use the original count as denominator."}],"Solution":{"Idea":{"Ar":"نقسم الزيادة على العدد الأصلي ثم نضرب في مئة.","En":"Divide the increase by the original count and multiply by one hundred."},"FormulaLatex":"p=100(96-48)/48","Steps":[{"Ar":"$96-48=48$","En":"$96-48=48$"},{"Ar":"$p=100$","En":"$p=100$"}],"Substitution":{"Ar":"$100\\cdot48/48$","En":"$100\\cdot48/48$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"%","En":"%"},"Verification":{"Ar":"$48+48=96$","En":"$48+48=96$"},"CommonError":{"Ar":"قسم الزيادة على العدد النهائي.","En":"Divides the increase by the final count."}}}$mw$::jsonb,$mw$نقسم الزيادة على العدد الأصلي ثم نضرب في مئة.

$p=100(96-48)/48$

1. $96-48=48$

2. $p=100$

$100\cdot48/48$

$100$ %

$48+48=96$

قسم الزيادة على العدد النهائي.$mw$,$mw$Divide the increase by the original count and multiply by one hundred.

$p=100(96-48)/48$

1. $96-48=48$

2. $p=100$

$100\cdot48/48$

$100$ %

$48+48=96$

Divides the increase by the final count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الفرق بين العددين.","En":"Find the difference between the counts."},{"Ar":"استعمل العدد الأصلي في المقام.","En":"Use the original count as denominator."}],"Solution":{"Idea":{"Ar":"نقسم الزيادة على العدد الأصلي ثم نضرب في مئة.","En":"Divide the increase by the original count and multiply by one hundred."},"FormulaLatex":"p=100(96-48)/48","Steps":[{"Ar":"$96-48=48$","En":"$96-48=48$"},{"Ar":"$p=100$","En":"$p=100$"}],"Substitution":{"Ar":"$100\\cdot48/48$","En":"$100\\cdot48/48$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"%","En":"%"},"Verification":{"Ar":"$48+48=96$","En":"$48+48=96$"},"CommonError":{"Ar":"قسم الزيادة على العدد النهائي.","En":"Divides the increase by the final count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم الزيادة على العدد النهائي.","En":"Divides the increase by the final count."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الزيادة وليس نسبتها.","En":"This is the absolute increase."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة العدد الجديد إلى الأصلي وليست الزيادة.","En":"This is the new count as a percentage of the original."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v66-grade-8-percent-increase-successive-two-small-rates-1$mw$,$mw$percent-increase-successive-two-small-rates$mw$,$mw$middle-percent-increase$mw$,$mw$grade-8$mw$,8,2,7,34,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":34,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زيادتان متتاليتان","En":"Two successive increases"},"Question":{"Ar":"زاد سعر سلعة 10% ثم زاد السعر الناتج 20%. ما نسبة الزيادة الكلية عن السعر الأصلي؟","En":"An item's price increases by 10% and then the resulting price increases by 20%. What is the overall percentage increase from the original price?"},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الزيادة الأولى.","En":"Omits the first increase."}},{"LatexCode":"132","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة السعر النهائي إلى الأصلي.","En":"This is the final price as a percentage of the original."}},{"LatexCode":"32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع النسبتين دون مراعاة تغير الأساس.","En":"Adds rates without accounting for the changed base."}}],"Hints":[{"Ar":"ابدأ بسعر افتراضي مقداره 100.","En":"Start with a hypothetical price of 100."},{"Ar":"طبق الزيادة الثانية على السعر الجديد.","En":"Apply the second increase to the new price."}],"Solution":{"Idea":{"Ar":"نضرب عاملي الزيادة ثم نطرح الواحد.","En":"Multiply the two growth factors and subtract one."},"FormulaLatex":"p=100(1.10\\cdot1.20-1)","Steps":[{"Ar":"$1.10\\cdot1.20=1.32$","En":"$1.10\\cdot1.20=1.32$"},{"Ar":"$p=32$","En":"$p=32$"}],"Substitution":{"Ar":"$100(1.32-1)$","En":"$100(1.32-1)$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"%","En":"%"},"Verification":{"Ar":"$100\\to110\\to132$","En":"$100\\to110\\to132$"},"CommonError":{"Ar":"جمع النسبتين دون مراعاة تغير الأساس.","En":"Adds rates without accounting for the changed base."}}}$mw$::jsonb,$mw$نضرب عاملي الزيادة ثم نطرح الواحد.

$p=100(1.10\cdot1.20-1)$

1. $1.10\cdot1.20=1.32$

2. $p=32$

$100(1.32-1)$

$32$ %

$100\to110\to132$

جمع النسبتين دون مراعاة تغير الأساس.$mw$,$mw$Multiply the two growth factors and subtract one.

$p=100(1.10\cdot1.20-1)$

1. $1.10\cdot1.20=1.32$

2. $p=32$

$100(1.32-1)$

$32$ %

$100\to110\to132$

Adds rates without accounting for the changed base.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بسعر افتراضي مقداره 100.","En":"Start with a hypothetical price of 100."},{"Ar":"طبق الزيادة الثانية على السعر الجديد.","En":"Apply the second increase to the new price."}],"Solution":{"Idea":{"Ar":"نضرب عاملي الزيادة ثم نطرح الواحد.","En":"Multiply the two growth factors and subtract one."},"FormulaLatex":"p=100(1.10\\cdot1.20-1)","Steps":[{"Ar":"$1.10\\cdot1.20=1.32$","En":"$1.10\\cdot1.20=1.32$"},{"Ar":"$p=32$","En":"$p=32$"}],"Substitution":{"Ar":"$100(1.32-1)$","En":"$100(1.32-1)$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"%","En":"%"},"Verification":{"Ar":"$100\\to110\\to132$","En":"$100\\to110\\to132$"},"CommonError":{"Ar":"جمع النسبتين دون مراعاة تغير الأساس.","En":"Adds rates without accounting for the changed base."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الزيادة الأولى.","En":"Omits the first increase."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة السعر النهائي إلى الأصلي.","En":"This is the final price as a percentage of the original."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع النسبتين دون مراعاة تغير الأساس.","En":"Adds rates without accounting for the changed base."},"Order":4}]}$mw$),
($mw$growth-v66-grade-3-number-comparison-same-digits-order-middle-1$mw$,$mw$number-comparison-same-digits-order-middle$mw$,$mw$number-comparison$mw$,$mw$grade-3$mw$,3,1,81,304,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":304,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ترتيب أعداد من الأرقام نفسها","En":"Ordering numbers with the same digits"},"Question":{"Ar":"رتبت الأعداد 372 و327 و732 تصاعدياً. ما العدد الأوسط؟","En":"The numbers 372, 327 and 732 are ordered from smallest to largest. Which is the middle number?"},"Options":[{"LatexCode":"237","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس ضمن الأعداد المعطاة.","En":"Not among the given numbers."}},{"LatexCode":"372","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"327","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الأصغر.","En":"This is the smallest."}},{"LatexCode":"732","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الأكبر.","En":"This is the largest."}}],"Hints":[{"Ar":"أي عدد يبدأ بأكبر رقم للمئات؟","En":"Which number has the greatest hundreds digit?"},{"Ar":"قارن عشرات العددين الباقيين.","En":"Compare the tens of the other two numbers."}],"Solution":{"Idea":{"Ar":"نقارن المئات أولاً، ثم العشرات عندما تتساوى المئات.","En":"Compare hundreds first, then tens if the hundreds match."},"FormulaLatex":"327<372<732","Steps":[{"Ar":"$327<372<732$","En":"$327<372<732$"}],"Substitution":{"Ar":"$327<372$","En":"$327<372$"},"Result":{"Ar":"$372$","En":"$372$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$372-327=45,\\quad732-372=360$","En":"$372-327=45,\\quad732-372=360$"},"CommonError":{"Ar":"هذا الأصغر.","En":"This is the smallest."}}}$mw$::jsonb,$mw$نقارن المئات أولاً، ثم العشرات عندما تتساوى المئات.

$327<372<732$

1. $327<372<732$

$327<372$

$372$

$372-327=45,\quad732-372=360$

هذا الأصغر.$mw$,$mw$Compare hundreds first, then tens if the hundreds match.

$327<372<732$

1. $327<372<732$

$327<372$

$372$

$372-327=45,\quad732-372=360$

This is the smallest.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"أي عدد يبدأ بأكبر رقم للمئات؟","En":"Which number has the greatest hundreds digit?"},{"Ar":"قارن عشرات العددين الباقيين.","En":"Compare the tens of the other two numbers."}],"Solution":{"Idea":{"Ar":"نقارن المئات أولاً، ثم العشرات عندما تتساوى المئات.","En":"Compare hundreds first, then tens if the hundreds match."},"FormulaLatex":"327<372<732","Steps":[{"Ar":"$327<372<732$","En":"$327<372<732$"}],"Substitution":{"Ar":"$327<372$","En":"$327<372$"},"Result":{"Ar":"$372$","En":"$372$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$372-327=45,\\quad732-372=360$","En":"$372-327=45,\\quad732-372=360$"},"CommonError":{"Ar":"هذا الأصغر.","En":"This is the smallest."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ليس ضمن الأعداد المعطاة.","En":"Not among the given numbers."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا الأصغر.","En":"This is the smallest."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا الأكبر.","En":"This is the largest."},"Order":4}]}$mw$),
($mw$growth-v66-grade-3-rounding-nearest-ten-change-after-addition-1$mw$,$mw$rounding-nearest-ten-change-after-addition$mw$,$mw$rounding$mw$,$mw$grade-3$mw$,3,1,81,306,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":306,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تغير التقريب بعد إضافة","En":"Rounding after an addition"},"Question":{"Ar":"قُرّب العدد 264 إلى أقرب عشرة، ثم أضيف 3 إلى العدد الأصلي وقُرّب الناتج لأقرب عشرة. بكم زاد العدد المقرب؟","En":"264 is rounded to the nearest ten. Then three is added to the original number and the result is rounded to the nearest ten. How much does the rounded number increase?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يلاحظ تجاوز حد التقريب.","En":"Misses the crossing of the rounding boundary."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الزيادة قبل التقريب.","En":"This is the unrounded increase."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس الفرق بين العددين المقربين.","En":"Not the difference between the rounded numbers."}}],"Hints":[{"Ar":"قرّب 264 إلى أقرب عشرة.","En":"Round 264 to the nearest ten."},{"Ar":"أضف 3 للأصل ثم قرّب من جديد.","En":"Add three to the original and round again."}],"Solution":{"Idea":{"Ar":"نقرب العددين كلّاً على حدة ثم نطرح.","En":"Round both numbers separately and subtract."},"FormulaLatex":"264\\to260,\\quad267\\to270","Steps":[{"Ar":"$264+3=267$","En":"$264+3=267$"},{"Ar":"$270-260=10$","En":"$270-260=10$"}],"Substitution":{"Ar":"$270-260$","En":"$270-260$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$264<265<267$","En":"$264<265<267$"},"CommonError":{"Ar":"لم يلاحظ تجاوز حد التقريب.","En":"Misses the crossing of the rounding boundary."}}}$mw$::jsonb,$mw$نقرب العددين كلّاً على حدة ثم نطرح.

$264\to260,\quad267\to270$

1. $264+3=267$

2. $270-260=10$

$270-260$

$10$

$264<265<267$

لم يلاحظ تجاوز حد التقريب.$mw$,$mw$Round both numbers separately and subtract.

$264\to260,\quad267\to270$

1. $264+3=267$

2. $270-260=10$

$270-260$

$10$

$264<265<267$

Misses the crossing of the rounding boundary.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قرّب 264 إلى أقرب عشرة.","En":"Round 264 to the nearest ten."},{"Ar":"أضف 3 للأصل ثم قرّب من جديد.","En":"Add three to the original and round again."}],"Solution":{"Idea":{"Ar":"نقرب العددين كلّاً على حدة ثم نطرح.","En":"Round both numbers separately and subtract."},"FormulaLatex":"264\\to260,\\quad267\\to270","Steps":[{"Ar":"$264+3=267$","En":"$264+3=267$"},{"Ar":"$270-260=10$","En":"$270-260=10$"}],"Substitution":{"Ar":"$270-260$","En":"$270-260$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$264<265<267$","En":"$264<265<267$"},"CommonError":{"Ar":"لم يلاحظ تجاوز حد التقريب.","En":"Misses the crossing of the rounding boundary."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لم يلاحظ تجاوز حد التقريب.","En":"Misses the crossing of the rounding boundary."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الزيادة قبل التقريب.","En":"This is the unrounded increase."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ليس الفرق بين العددين المقربين.","En":"Not the difference between the rounded numbers."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v66 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
