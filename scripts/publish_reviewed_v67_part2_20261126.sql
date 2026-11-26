-- One-time owner-authorized v67 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v67-grade-8-circle-area-fraction-three-quarter-disk-1$mw$,$mw$circle-area-fraction-three-quarter-disk$mw$,$mw$middle-circle-area$mw$,$mw$grade-8$mw$,8,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة ثلاثة أرباع قرص","En":"Area of three quarters of a disk"},"Question":{"Ar":"قُسم قرص نصف قطره 6 سم إلى أربعة أجزاء متساوية المساحة وأزيل جزء واحد. ما مساحة الباقي بدلالة π؟","En":"A disk of radius six centimetres is divided into four equal-area parts and one part is removed. Find the remaining area in terms of pi."},"Options":[{"LatexCode":"18\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نصف مساحة القرص.","En":"This is half the disk area."}},{"LatexCode":"36\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المساحة قبل الحذف.","En":"This is the original area."}},{"LatexCode":"27\\pi","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة الجزء المحذوف.","En":"This is the removed area."}}],"Hints":[{"Ar":"احسب مساحة القرص كاملاً.","En":"Find the full disk area."},{"Ar":"خذ ثلاثة أرباعها.","En":"Take three quarters of it."}],"Solution":{"Idea":{"Ar":"تبقى ثلاثة أرباع المساحة الكاملة.","En":"Three quarters of the full disk remain."},"FormulaLatex":"A=3\\pi r^2/4","Steps":[{"Ar":"$36\\pi/4=9\\pi$","En":"$36\\pi/4=9\\pi$"},{"Ar":"$3\\cdot9\\pi=27\\pi$","En":"$3\\cdot9\\pi=27\\pi$"}],"Substitution":{"Ar":"$3\\cdot36\\pi/4$","En":"$3\\cdot36\\pi/4$"},"Result":{"Ar":"$27\\pi$","En":"$27\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$27\\pi+9\\pi=36\\pi$","En":"$27\\pi+9\\pi=36\\pi$"},"CommonError":{"Ar":"هذه مساحة الجزء المحذوف.","En":"This is the removed area."}}}$mw$::jsonb,$mw$تبقى ثلاثة أرباع المساحة الكاملة.

$A=3\pi r^2/4$

1. $36\pi/4=9\pi$

2. $3\cdot9\pi=27\pi$

$3\cdot36\pi/4$

$27\pi$ سم²

$27\pi+9\pi=36\pi$

هذه مساحة الجزء المحذوف.$mw$,$mw$Three quarters of the full disk remain.

$A=3\pi r^2/4$

1. $36\pi/4=9\pi$

2. $3\cdot9\pi=27\pi$

$3\cdot36\pi/4$

$27\pi$ cm²

$27\pi+9\pi=36\pi$

This is the removed area.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مساحة القرص كاملاً.","En":"Find the full disk area."},{"Ar":"خذ ثلاثة أرباعها.","En":"Take three quarters of it."}],"Solution":{"Idea":{"Ar":"تبقى ثلاثة أرباع المساحة الكاملة.","En":"Three quarters of the full disk remain."},"FormulaLatex":"A=3\\pi r^2/4","Steps":[{"Ar":"$36\\pi/4=9\\pi$","En":"$36\\pi/4=9\\pi$"},{"Ar":"$3\\cdot9\\pi=27\\pi$","En":"$3\\cdot9\\pi=27\\pi$"}],"Substitution":{"Ar":"$3\\cdot36\\pi/4$","En":"$3\\cdot36\\pi/4$"},"Result":{"Ar":"$27\\pi$","En":"$27\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$27\\pi+9\\pi=36\\pi$","En":"$27\\pi+9\\pi=36\\pi$"},"CommonError":{"Ar":"هذه مساحة الجزء المحذوف.","En":"This is the removed area."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه نصف مساحة القرص.","En":"This is half the disk area."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه المساحة قبل الحذف.","En":"This is the original area."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة الجزء المحذوف.","En":"This is the removed area."},"Order":4}]}$mw$),
($mw$growth-v67-grade-7-probability-spinner-infer-sector-angle-from-probability-1$mw$,$mw$probability-spinner-infer-sector-angle-from-probability$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زاوية قطاع من احتمال","En":"Sector angle from probability"},"Question":{"Ar":"مؤشر دوار اتجاه توقفه عشوائي منتظم. احتمال توقفه في القطاع الأخضر 1/5. ما قياس زاوية هذا القطاع؟","En":"A spinner has a uniformly random stopping direction. The green sector has probability one fifth. What is its angle in degrees?"},"Options":[{"LatexCode":"288","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية بقية الدائرة.","En":"This is the angle outside the green sector."}},{"LatexCode":"72","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم 180 بدلاً من 360 على خمسة.","En":"Divides 180 instead of 360 by five."}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف الدائرة.","En":"Uses a semicircle."}}],"Hints":[{"Ar":"كم درجة في الدائرة كاملة؟","En":"How many degrees in a full circle?"},{"Ar":"خذ خمسها.","En":"Take one fifth."}],"Solution":{"Idea":{"Ar":"الاحتمال يساوي نسبة زاوية القطاع إلى 360 درجة.","En":"Probability equals the sector angle divided by 360 degrees."},"FormulaLatex":"\\theta=360/5","Steps":[{"Ar":"$\\theta=72$","En":"$\\theta=72$"}],"Substitution":{"Ar":"$360/5$","En":"$360/5$"},"Result":{"Ar":"$72$","En":"$72$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$72/360=1/5$","En":"$72/360=1/5$"},"CommonError":{"Ar":"قسم 180 بدلاً من 360 على خمسة.","En":"Divides 180 instead of 360 by five."}}}$mw$::jsonb,$mw$الاحتمال يساوي نسبة زاوية القطاع إلى 360 درجة.

$\theta=360/5$

1. $\theta=72$

$360/5$

$72$ °

$72/360=1/5$

قسم 180 بدلاً من 360 على خمسة.$mw$,$mw$Probability equals the sector angle divided by 360 degrees.

$\theta=360/5$

1. $\theta=72$

$360/5$

$72$ °

$72/360=1/5$

Divides 180 instead of 360 by five.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم درجة في الدائرة كاملة؟","En":"How many degrees in a full circle?"},{"Ar":"خذ خمسها.","En":"Take one fifth."}],"Solution":{"Idea":{"Ar":"الاحتمال يساوي نسبة زاوية القطاع إلى 360 درجة.","En":"Probability equals the sector angle divided by 360 degrees."},"FormulaLatex":"\\theta=360/5","Steps":[{"Ar":"$\\theta=72$","En":"$\\theta=72$"}],"Substitution":{"Ar":"$360/5$","En":"$360/5$"},"Result":{"Ar":"$72$","En":"$72$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$72/360=1/5$","En":"$72/360=1/5$"},"CommonError":{"Ar":"قسم 180 بدلاً من 360 على خمسة.","En":"Divides 180 instead of 360 by five."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية بقية الدائرة.","En":"This is the angle outside the green sector."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم 180 بدلاً من 360 على خمسة.","En":"Divides 180 instead of 360 by five."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف الدائرة.","En":"Uses a semicircle."},"Order":4}]}$mw$),
($mw$growth-v67-grade-7-sample-space-three-distinguishable-coins-exact-two-heads-1$mw$,$mw$sample-space-three-distinguishable-coins-exact-two-heads$mw$,$mw$sample-spaces$mw$,$mw$grade-7$mw$,7,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نواتج ثلاث قطع نقدية","En":"Outcomes of three coins"},"Question":{"Ar":"رُميت ثلاث قطع نقدية مميزة مرة واحدة لكل منها. كم ناتجاً مرتباً يحتوي على صورتين وكتابة واحدة؟","En":"Three distinguishable coins are tossed once each. How many ordered outcomes contain exactly two heads and one tail?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد مرات ظهور الصورة المطلوبة.","En":"Counts the required heads."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد ترتيب كل قطعة رغم تكرار الصورة.","En":"Counts permutations as though both heads differ."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد النواتج الكلية.","En":"Counts all outcomes."}}],"Hints":[{"Ar":"حدد موضع الكتابة.","En":"Choose the tail position."},{"Ar":"كرر لكل موضع من الثلاثة.","En":"Repeat for all three positions."}],"Solution":{"Idea":{"Ar":"نحدد موضع الكتابة الوحيدة من ثلاثة مواضع.","En":"Choose the position of the single tail among three positions."},"FormulaLatex":"\\{HHT,HTH,THH\\}","Steps":[{"Ar":"$3\\cdot1=3$","En":"$3\\cdot1=3$"}],"Substitution":{"Ar":"$3\\cdot1$","En":"$3\\cdot1$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$HHT,HTH,THH$","En":"$HHT,HTH,THH$"},"CommonError":{"Ar":"هذا عدد مرات ظهور الصورة المطلوبة.","En":"Counts the required heads."}}}$mw$::jsonb,$mw$نحدد موضع الكتابة الوحيدة من ثلاثة مواضع.

$\{HHT,HTH,THH\}$

1. $3\cdot1=3$

$3\cdot1$

$3$

$HHT,HTH,THH$

هذا عدد مرات ظهور الصورة المطلوبة.$mw$,$mw$Choose the position of the single tail among three positions.

$\{HHT,HTH,THH\}$

1. $3\cdot1=3$

$3\cdot1$

$3$

$HHT,HTH,THH$

Counts the required heads.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد موضع الكتابة.","En":"Choose the tail position."},{"Ar":"كرر لكل موضع من الثلاثة.","En":"Repeat for all three positions."}],"Solution":{"Idea":{"Ar":"نحدد موضع الكتابة الوحيدة من ثلاثة مواضع.","En":"Choose the position of the single tail among three positions."},"FormulaLatex":"\\{HHT,HTH,THH\\}","Steps":[{"Ar":"$3\\cdot1=3$","En":"$3\\cdot1=3$"}],"Substitution":{"Ar":"$3\\cdot1$","En":"$3\\cdot1$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$HHT,HTH,THH$","En":"$HHT,HTH,THH$"},"CommonError":{"Ar":"هذا عدد مرات ظهور الصورة المطلوبة.","En":"Counts the required heads."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد مرات ظهور الصورة المطلوبة.","En":"Counts the required heads."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عد ترتيب كل قطعة رغم تكرار الصورة.","En":"Counts permutations as though both heads differ."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد النواتج الكلية.","En":"Counts all outcomes."},"Order":4}]}$mw$),
($mw$growth-v67-grade-7-experimental-frequency-compare-absolute-count-vs-rate-1$mw$,$mw$experimental-frequency-compare-absolute-count-vs-rate$mw$,$mw$frequency$mw$,$mw$grade-7$mw$,7,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة نجاح تجربتين","En":"Comparing observed success rates"},"Question":{"Ar":"نجح الجهاز A في 12 من 15 تجربة، والجهاز B في 18 من 30 تجربة. بكم تزيد نسبة نجاح A التجريبية على B بالنقاط المئوية؟","En":"Device A succeeds in 12 of 15 trials; device B succeeds in 18 of 30. By how many percentage points does A's observed success rate exceed B's?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن عدد النجاحات فقط.","En":"Compares success counts only."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليست نتيجة طرح النسبتين.","En":"Not the difference of the rates."}},{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة نجاح A وحدها.","En":"This is A's rate alone."}},{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"قسم النجاحات على عدد التجارب لكل جهاز.","En":"Divide successes by trials for each device."},{"Ar":"حول إلى نسب مئوية وقارن.","En":"Convert to percentages and compare."}],"Solution":{"Idea":{"Ar":"نحسب التكرار النسبي لكل جهاز ونطرح النسبتين.","En":"Compute each relative frequency and subtract the percentages."},"FormulaLatex":"100(12/15-18/30)","Steps":[{"Ar":"$12/15=0.8$","En":"$12/15=0.8$"},{"Ar":"$18/30=0.6$","En":"$18/30=0.6$"},{"Ar":"$80-60=20$","En":"$80-60=20$"}],"Substitution":{"Ar":"$80-60$","En":"$80-60$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"نقطة مئوية","En":"percentage points"},"Verification":{"Ar":"$60+20=80$","En":"$60+20=80$"},"CommonError":{"Ar":"قارن عدد النجاحات فقط.","En":"Compares success counts only."}}}$mw$::jsonb,$mw$نحسب التكرار النسبي لكل جهاز ونطرح النسبتين.

$100(12/15-18/30)$

1. $12/15=0.8$

2. $18/30=0.6$

3. $80-60=20$

$80-60$

$20$ نقطة مئوية

$60+20=80$

قارن عدد النجاحات فقط.$mw$,$mw$Compute each relative frequency and subtract the percentages.

$100(12/15-18/30)$

1. $12/15=0.8$

2. $18/30=0.6$

3. $80-60=20$

$80-60$

$20$ percentage points

$60+20=80$

Compares success counts only.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قسم النجاحات على عدد التجارب لكل جهاز.","En":"Divide successes by trials for each device."},{"Ar":"حول إلى نسب مئوية وقارن.","En":"Convert to percentages and compare."}],"Solution":{"Idea":{"Ar":"نحسب التكرار النسبي لكل جهاز ونطرح النسبتين.","En":"Compute each relative frequency and subtract the percentages."},"FormulaLatex":"100(12/15-18/30)","Steps":[{"Ar":"$12/15=0.8$","En":"$12/15=0.8$"},{"Ar":"$18/30=0.6$","En":"$18/30=0.6$"},{"Ar":"$80-60=20$","En":"$80-60=20$"}],"Substitution":{"Ar":"$80-60$","En":"$80-60$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"نقطة مئوية","En":"percentage points"},"Verification":{"Ar":"$60+20=80$","En":"$60+20=80$"},"CommonError":{"Ar":"قارن عدد النجاحات فقط.","En":"Compares success counts only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قارن عدد النجاحات فقط.","En":"Compares success counts only."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ليست نتيجة طرح النسبتين.","En":"Not the difference of the rates."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة نجاح A وحدها.","En":"This is A's rate alone."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v67-grade-7-probability-card-event-inclusion-conditional-count-1$mw$,$mw$probability-card-event-inclusion-conditional-count$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال حدث يحتوي حدثاً آخر","En":"Probability of nested events"},"Question":{"Ar":"تُسحب بطاقة عشوائياً من 12 بطاقة مرقمة من 1 إلى 12. الحدث A هو رقم من مضاعفات 4، والحدث B رقم زوجي. ما احتمال حدوث B دون A؟","En":"A card is drawn uniformly from cards numbered 1 to 12. Event A is a multiple of four and B is an even number. What is the probability of B but not A?"},"Options":[{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الحدثين رغم التداخل.","En":"Adds the overlapping events."}},{"LatexCode":"\\frac16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد نتيجتين فقط بدلاً من ثلاث.","En":"Counts only two outcomes rather than three."}},{"LatexCode":"\\frac14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال B كاملاً.","En":"This is the whole probability of B."}}],"Hints":[{"Ar":"اكتب الأعداد الزوجية الستة.","En":"List the six even numbers."},{"Ar":"اشطب 4 و8 و12.","En":"Cross out four, eight and twelve."}],"Solution":{"Idea":{"Ar":"نحذف مضاعفات 4 من الأعداد الزوجية.","En":"Remove multiples of four from the even numbers."},"FormulaLatex":"B\\setminus A=\\{2,6,10\\}","Steps":[{"Ar":"$3/12=1/4$","En":"$3/12=1/4$"}],"Substitution":{"Ar":"$3/12$","En":"$3/12$"},"Result":{"Ar":"$\\frac14$","En":"$\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+3=6$","En":"$3+3=6$"},"CommonError":{"Ar":"هذا احتمال B كاملاً.","En":"This is the whole probability of B."}}}$mw$::jsonb,$mw$نحذف مضاعفات 4 من الأعداد الزوجية.

$B\setminus A=\{2,6,10\}$

1. $3/12=1/4$

$3/12$

$\frac14$

$3+3=6$

هذا احتمال B كاملاً.$mw$,$mw$Remove multiples of four from the even numbers.

$B\setminus A=\{2,6,10\}$

1. $3/12=1/4$

$3/12$

$\frac14$

$3+3=6$

This is the whole probability of B.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الأعداد الزوجية الستة.","En":"List the six even numbers."},{"Ar":"اشطب 4 و8 و12.","En":"Cross out four, eight and twelve."}],"Solution":{"Idea":{"Ar":"نحذف مضاعفات 4 من الأعداد الزوجية.","En":"Remove multiples of four from the even numbers."},"FormulaLatex":"B\\setminus A=\\{2,6,10\\}","Steps":[{"Ar":"$3/12=1/4$","En":"$3/12=1/4$"}],"Substitution":{"Ar":"$3/12$","En":"$3/12$"},"Result":{"Ar":"$\\frac14$","En":"$\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+3=6$","En":"$3+3=6$"},"CommonError":{"Ar":"هذا احتمال B كاملاً.","En":"This is the whole probability of B."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع الحدثين رغم التداخل.","En":"Adds the overlapping events."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عد نتيجتين فقط بدلاً من ثلاث.","En":"Counts only two outcomes rather than three."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال B كاملاً.","En":"This is the whole probability of B."},"Order":4}]}$mw$);
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
