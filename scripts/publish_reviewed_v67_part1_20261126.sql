-- One-time owner-authorized v67 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v67-grade-8-map-scale-infer-denominator-from-measured-distance-1$mw$,$mw$map-scale-infer-denominator-from-measured-distance$mw$,$mw$middle-map-scale$mw$,$mw$grade-8$mw$,8,2,7,33,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":33,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج مقام مقياس الرسم","En":"Recovering a scale denominator"},"Question":{"Ar":"يمثل خط طوله 8 سم على خريطة مسافة حقيقية 2 كم. إذا كان مقياسها 1:n، فما n؟","En":"An 8 cm map line represents a real distance of 2 km. If its scale is 1:n, find n."},"Options":[{"LatexCode":"25000","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"250","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الأمتار بدلاً من السنتيمترات.","En":"Uses metres instead of centimetres."}},{"LatexCode":"1600000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب المسافة الحقيقية في طول الخط.","En":"Multiplies the real distance by the map length."}},{"LatexCode":"40000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يعطي المسافة الحقيقية المعطاة.","En":"Does not reproduce the stated real distance."}}],"Hints":[{"Ar":"حوّل 2 كم إلى سم.","En":"Convert two kilometres to centimetres."},{"Ar":"اقسم على طول الخط.","En":"Divide by the map length."}],"Solution":{"Idea":{"Ar":"نوحد الوحدات ونقسم الطول الحقيقي على طول الخط.","En":"Convert to the same units and divide real length by map length."},"FormulaLatex":"n=200000/8","Steps":[{"Ar":"$2\\cdot100000=200000$","En":"$2\\cdot100000=200000$"},{"Ar":"$n=25000$","En":"$n=25000$"}],"Substitution":{"Ar":"$200000/8$","En":"$200000/8$"},"Result":{"Ar":"$25000$","En":"$25000$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot25000=200000$","En":"$8\\cdot25000=200000$"},"CommonError":{"Ar":"استعمل الأمتار بدلاً من السنتيمترات.","En":"Uses metres instead of centimetres."}}}$mw$::jsonb,$mw$نوحد الوحدات ونقسم الطول الحقيقي على طول الخط.

$n=200000/8$

1. $2\cdot100000=200000$

2. $n=25000$

$200000/8$

$25000$

$8\cdot25000=200000$

استعمل الأمتار بدلاً من السنتيمترات.$mw$,$mw$Convert to the same units and divide real length by map length.

$n=200000/8$

1. $2\cdot100000=200000$

2. $n=25000$

$200000/8$

$25000$

$8\cdot25000=200000$

Uses metres instead of centimetres.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل 2 كم إلى سم.","En":"Convert two kilometres to centimetres."},{"Ar":"اقسم على طول الخط.","En":"Divide by the map length."}],"Solution":{"Idea":{"Ar":"نوحد الوحدات ونقسم الطول الحقيقي على طول الخط.","En":"Convert to the same units and divide real length by map length."},"FormulaLatex":"n=200000/8","Steps":[{"Ar":"$2\\cdot100000=200000$","En":"$2\\cdot100000=200000$"},{"Ar":"$n=25000$","En":"$n=25000$"}],"Substitution":{"Ar":"$200000/8$","En":"$200000/8$"},"Result":{"Ar":"$25000$","En":"$25000$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot25000=200000$","En":"$8\\cdot25000=200000$"},"CommonError":{"Ar":"استعمل الأمتار بدلاً من السنتيمترات.","En":"Uses metres instead of centimetres."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الأمتار بدلاً من السنتيمترات.","En":"Uses metres instead of centimetres."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ضرب المسافة الحقيقية في طول الخط.","En":"Multiplies the real distance by the map length."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يعطي المسافة الحقيقية المعطاة.","En":"Does not reproduce the stated real distance."},"Order":4}]}$mw$),
($mw$growth-v67-grade-3-place-value-digit-change-with-other-digits-fixed-1$mw$,$mw$place-value-digit-change-with-other-digits-fixed$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تغيير رقم واحد","En":"Changing one digit"},"Question":{"Ar":"في العدد 583 استُبدل رقم العشرات 8 بالرقم 2 دون تغيير بقية الأرقام. بكم نقص العدد؟","En":"In 583, the tens digit eight is replaced by two, leaving the other digits unchanged. How much does the number decrease?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق الرقمين دون قيمة المنزلة.","En":"This is the digit difference without place value."}},{"LatexCode":"600","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل العشرات كمئات.","En":"Treats tens as hundreds."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة العشرات الجديدة فقط.","En":"This is just the new tens value."}},{"LatexCode":"60","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب العدد بعد التغيير.","En":"Write the changed number."},{"Ar":"احسب الفرق بين العددين.","En":"Find the difference."}],"Solution":{"Idea":{"Ar":"نقصت العشرات من ثماني عشرات إلى عشرتين.","En":"The tens decrease from eight tens to two."},"FormulaLatex":"(8-2)\\cdot10","Steps":[{"Ar":"$583\\to523$","En":"$583\\to523$"},{"Ar":"$583-523=60$","En":"$583-523=60$"}],"Substitution":{"Ar":"$6\\cdot10$","En":"$6\\cdot10$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$523+60=583$","En":"$523+60=583$"},"CommonError":{"Ar":"هذا فرق الرقمين دون قيمة المنزلة.","En":"This is the digit difference without place value."}}}$mw$::jsonb,$mw$نقصت العشرات من ثماني عشرات إلى عشرتين.

$(8-2)\cdot10$

1. $583\to523$

2. $583-523=60$

$6\cdot10$

$60$

$523+60=583$

هذا فرق الرقمين دون قيمة المنزلة.$mw$,$mw$The tens decrease from eight tens to two.

$(8-2)\cdot10$

1. $583\to523$

2. $583-523=60$

$6\cdot10$

$60$

$523+60=583$

This is the digit difference without place value.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اكتب العدد بعد التغيير.","En":"Write the changed number."},{"Ar":"احسب الفرق بين العددين.","En":"Find the difference."}],"Solution":{"Idea":{"Ar":"نقصت العشرات من ثماني عشرات إلى عشرتين.","En":"The tens decrease from eight tens to two."},"FormulaLatex":"(8-2)\\cdot10","Steps":[{"Ar":"$583\\to523$","En":"$583\\to523$"},{"Ar":"$583-523=60$","En":"$583-523=60$"}],"Substitution":{"Ar":"$6\\cdot10$","En":"$6\\cdot10$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$523+60=583$","En":"$523+60=583$"},"CommonError":{"Ar":"هذا فرق الرقمين دون قيمة المنزلة.","En":"This is the digit difference without place value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق الرقمين دون قيمة المنزلة.","En":"This is the digit difference without place value."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل العشرات كمئات.","En":"Treats tens as hundreds."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة العشرات الجديدة فقط.","En":"This is just the new tens value."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v67-grade-3-rounding-estimate-difference-same-hundred-1$mw$,$mw$rounding-estimate-difference-same-hundred$mw$,$mw$rounding$mw$,$mw$grade-3$mw$,3,1,81,306,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":306,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"فرق تقديري يساوي صفراً","En":"An estimated difference of zero"},"Question":{"Ar":"عند تقريب العددين 462 و518 إلى أقرب مئة قبل طرح الأصغر من الأكبر، ما الفرق التقديري؟","En":"Round 462 and 518 to the nearest hundred before subtracting the smaller from the larger. What is the estimated difference?"},"Options":[{"LatexCode":"500","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة كل عدد بعد التقريب.","En":"The rounded value of either number."}},{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"56","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق الدقيق قبل التقريب.","En":"The exact difference before rounding."}},{"LatexCode":"100","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قرب أحد العددين إلى مئة غير صحيحة.","En":"Rounds one number to the wrong hundred."}}],"Hints":[{"Ar":"قرّب كل عدد وحده.","En":"Round each number separately."},{"Ar":"اطرح الناتجين.","En":"Subtract the two results."}],"Solution":{"Idea":{"Ar":"العددان يقربان إلى المئة نفسها.","En":"Both numbers round to the same hundred."},"FormulaLatex":"518\\to500,\\quad462\\to500","Steps":[{"Ar":"$500-500=0$","En":"$500-500=0$"}],"Substitution":{"Ar":"$500-500$","En":"$500-500$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$450\\le462<550,\\quad450\\le518<550$","En":"$450\\le462<550,\\quad450\\le518<550$"},"CommonError":{"Ar":"هذا الفرق الدقيق قبل التقريب.","En":"The exact difference before rounding."}}}$mw$::jsonb,$mw$العددان يقربان إلى المئة نفسها.

$518\to500,\quad462\to500$

1. $500-500=0$

$500-500$

$0$

$450\le462<550,\quad450\le518<550$

هذا الفرق الدقيق قبل التقريب.$mw$,$mw$Both numbers round to the same hundred.

$518\to500,\quad462\to500$

1. $500-500=0$

$500-500$

$0$

$450\le462<550,\quad450\le518<550$

The exact difference before rounding.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قرّب كل عدد وحده.","En":"Round each number separately."},{"Ar":"اطرح الناتجين.","En":"Subtract the two results."}],"Solution":{"Idea":{"Ar":"العددان يقربان إلى المئة نفسها.","En":"Both numbers round to the same hundred."},"FormulaLatex":"518\\to500,\\quad462\\to500","Steps":[{"Ar":"$500-500=0$","En":"$500-500=0$"}],"Substitution":{"Ar":"$500-500$","En":"$500-500$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$450\\le462<550,\\quad450\\le518<550$","En":"$450\\le462<550,\\quad450\\le518<550$"},"CommonError":{"Ar":"هذا الفرق الدقيق قبل التقريب.","En":"The exact difference before rounding."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة كل عدد بعد التقريب.","En":"The rounded value of either number."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق الدقيق قبل التقريب.","En":"The exact difference before rounding."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قرب أحد العددين إلى مئة غير صحيحة.","En":"Rounds one number to the wrong hundred."},"Order":4}]}$mw$),
($mw$growth-v67-grade-8-polygon-angle-sum-test-possible-multiple-1$mw$,$mw$polygon-angle-sum-test-possible-multiple$mw$,$mw$middle-polygon-angles$mw$,$mw$grade-8$mw$,8,2,8,39,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":39,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار مجموع زوايا مضلع","En":"Testing a polygon angle sum"},"Question":{"Ar":"أي مجموع لا يمكن أن يكون مجموع الزوايا الداخلية لمضلع بسيط؟","En":"Which sum cannot be the interior angle sum of a simple polygon?"},"Options":[{"LatexCode":"1000","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"540","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع مضلع خماسي.","En":"This is a pentagon's sum."}},{"LatexCode":"900","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع مضلع سباعي.","En":"This is a heptagon's sum."}},{"LatexCode":"1260","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع مضلع تساعي.","En":"This is a nonagon's sum."}}],"Hints":[{"Ar":"اقسم كل خيار على 180.","En":"Divide each choice by 180."},{"Ar":"ابحث عن ناتج قسمة ليس عدداً صحيحاً.","En":"Look for a noninteger quotient."}],"Solution":{"Idea":{"Ar":"مجموع الزوايا الداخلية مضاعف صحيح للعدد 180.","En":"The interior angle sum is an integer multiple of 180."},"FormulaLatex":"S=180(n-2)","Steps":[{"Ar":"$1000=5\\cdot180+100$","En":"$1000=5\\cdot180+100$"},{"Ar":"$100\\ne0$","En":"$100\\ne0$"}],"Substitution":{"Ar":"$1000/180$","En":"$1000/180$"},"Result":{"Ar":"$1000$","En":"$1000$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$900<1000<1080$","En":"$900<1000<1080$"},"CommonError":{"Ar":"هذا مجموع مضلع خماسي.","En":"This is a pentagon's sum."}}}$mw$::jsonb,$mw$مجموع الزوايا الداخلية مضاعف صحيح للعدد 180.

$S=180(n-2)$

1. $1000=5\cdot180+100$

2. $100\ne0$

$1000/180$

$1000$ °

$900<1000<1080$

هذا مجموع مضلع خماسي.$mw$,$mw$The interior angle sum is an integer multiple of 180.

$S=180(n-2)$

1. $1000=5\cdot180+100$

2. $100\ne0$

$1000/180$

$1000$ °

$900<1000<1080$

This is a pentagon's sum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم كل خيار على 180.","En":"Divide each choice by 180."},{"Ar":"ابحث عن ناتج قسمة ليس عدداً صحيحاً.","En":"Look for a noninteger quotient."}],"Solution":{"Idea":{"Ar":"مجموع الزوايا الداخلية مضاعف صحيح للعدد 180.","En":"The interior angle sum is an integer multiple of 180."},"FormulaLatex":"S=180(n-2)","Steps":[{"Ar":"$1000=5\\cdot180+100$","En":"$1000=5\\cdot180+100$"},{"Ar":"$100\\ne0$","En":"$100\\ne0$"}],"Substitution":{"Ar":"$1000/180$","En":"$1000/180$"},"Result":{"Ar":"$1000$","En":"$1000$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$900<1000<1080$","En":"$900<1000<1080$"},"CommonError":{"Ar":"هذا مجموع مضلع خماسي.","En":"This is a pentagon's sum."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع مضلع خماسي.","En":"This is a pentagon's sum."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع مضلع سباعي.","En":"This is a heptagon's sum."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع مضلع تساعي.","En":"This is a nonagon's sum."},"Order":4}]}$mw$),
($mw$growth-v67-grade-8-triangle-angle-difference-two-known-relations-1$mw$,$mw$triangle-angle-difference-two-known-relations$mw$,$mw$middle-triangle-angles$mw$,$mw$grade-8$mw$,8,2,8,35,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":35,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زوايا من فرق ومجموع","En":"Angles from two relations"},"Question":{"Ar":"في مثلث قياس زاوية A يساوي 40°، وقياس B يزيد على C بمقدار 20°. ما قياس B؟","En":"In a triangle, angle A is 40° and angle B exceeds C by 20°. Find B in degrees."},"Options":[{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية C.","En":"This is angle C."}},{"LatexCode":"70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع B وC بالتساوي.","En":"Splits the remaining sum equally."}},{"LatexCode":"100","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الفرق الكامل إلى نصف غير صحيح.","En":"Does not satisfy both constraints."}},{"LatexCode":"80","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اطرح A من 180.","En":"Subtract A from 180."},{"Ar":"اجمع معادلتي المجموع والفرق.","En":"Add the sum and difference equations."}],"Solution":{"Idea":{"Ar":"مجموع B وC يساوي 140 وفرقُهما 20.","En":"B and C total 140 and differ by twenty."},"FormulaLatex":"B+C=140,\\quad B-C=20","Steps":[{"Ar":"$B=80$","En":"$B=80$"},{"Ar":"$C=60$","En":"$C=60$"}],"Substitution":{"Ar":"$2B=160$","En":"$2B=160$"},"Result":{"Ar":"$80$","En":"$80$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$40+80+60=180,\\quad80-60=20$","En":"$40+80+60=180,\\quad80-60=20$"},"CommonError":{"Ar":"هذه زاوية C.","En":"This is angle C."}}}$mw$::jsonb,$mw$مجموع B وC يساوي 140 وفرقُهما 20.

$B+C=140,\quad B-C=20$

1. $B=80$

2. $C=60$

$2B=160$

$80$ °

$40+80+60=180,\quad80-60=20$

هذه زاوية C.$mw$,$mw$B and C total 140 and differ by twenty.

$B+C=140,\quad B-C=20$

1. $B=80$

2. $C=60$

$2B=160$

$80$ °

$40+80+60=180,\quad80-60=20$

This is angle C.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح A من 180.","En":"Subtract A from 180."},{"Ar":"اجمع معادلتي المجموع والفرق.","En":"Add the sum and difference equations."}],"Solution":{"Idea":{"Ar":"مجموع B وC يساوي 140 وفرقُهما 20.","En":"B and C total 140 and differ by twenty."},"FormulaLatex":"B+C=140,\\quad B-C=20","Steps":[{"Ar":"$B=80$","En":"$B=80$"},{"Ar":"$C=60$","En":"$C=60$"}],"Substitution":{"Ar":"$2B=160$","En":"$2B=160$"},"Result":{"Ar":"$80$","En":"$80$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$40+80+60=180,\\quad80-60=20$","En":"$40+80+60=180,\\quad80-60=20$"},"CommonError":{"Ar":"هذه زاوية C.","En":"This is angle C."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية C.","En":"This is angle C."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع B وC بالتساوي.","En":"Splits the remaining sum equally."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الفرق الكامل إلى نصف غير صحيح.","En":"Does not satisfy both constraints."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v67 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
