-- One-time owner-authorized v64 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v64-grade-8-percent-increase-compare-same-absolute-change-different-bases-1$mw$,$mw$percent-increase-compare-same-absolute-change-different-bases$mw$,$mw$middle-percent-increase$mw$,$mw$grade-8$mw$,8,2,7,34,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":34,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة نسبتي زيادة","En":"Comparing percentage increases"},"Question":{"Ar":"زاد سعر سلعة A من 40 إلى 50، وزاد سعر سلعة B من 80 إلى 90. بكم نقطة مئوية تزيد نسبة زيادة A على نسبة زيادة B؟","En":"Item A increases in price from 40 to 50, and B from 80 to 90. By how many percentage points does A's percentage increase exceed B's?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تساوي الزيادة المطلقة لا يعني تساوي النسبتين.","En":"Equal absolute increases do not imply equal rates."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الزيادة النقدية لكل سلعة.","En":"This is each absolute price increase."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة زيادة A وحدها.","En":"This is A's rate alone."}},{"LatexCode":"12.5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب الزيادة النقدية لكل سلعة.","En":"Find each absolute increase."},{"Ar":"استعمل السعر الأصلي في المقام.","En":"Use the original price as denominator."}],"Solution":{"Idea":{"Ar":"نقسم الزيادة على السعر الأصلي لكل سلعة ونقارن النسبتين.","En":"Divide each increase by its original price and compare the rates."},"FormulaLatex":"100(10/40-10/80)","Steps":[{"Ar":"$100\\cdot10/40=25$","En":"$100\\cdot10/40=25$"},{"Ar":"$100\\cdot10/80=12.5$","En":"$100\\cdot10/80=12.5$"},{"Ar":"$25-12.5=12.5$","En":"$25-12.5=12.5$"}],"Substitution":{"Ar":"$25-12.5$","En":"$25-12.5$"},"Result":{"Ar":"$12.5$","En":"$12.5$"},"Unit":{"Ar":"نقطة مئوية","En":"percentage points"},"Verification":{"Ar":"$12.5+12.5=25$","En":"$12.5+12.5=25$"},"CommonError":{"Ar":"تساوي الزيادة المطلقة لا يعني تساوي النسبتين.","En":"Equal absolute increases do not imply equal rates."}}}$mw$::jsonb,$mw$نقسم الزيادة على السعر الأصلي لكل سلعة ونقارن النسبتين.

$100(10/40-10/80)$

1. $100\cdot10/40=25$

2. $100\cdot10/80=12.5$

3. $25-12.5=12.5$

$25-12.5$

$12.5$ نقطة مئوية

$12.5+12.5=25$

تساوي الزيادة المطلقة لا يعني تساوي النسبتين.$mw$,$mw$Divide each increase by its original price and compare the rates.

$100(10/40-10/80)$

1. $100\cdot10/40=25$

2. $100\cdot10/80=12.5$

3. $25-12.5=12.5$

$25-12.5$

$12.5$ percentage points

$12.5+12.5=25$

Equal absolute increases do not imply equal rates.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الزيادة النقدية لكل سلعة.","En":"Find each absolute increase."},{"Ar":"استعمل السعر الأصلي في المقام.","En":"Use the original price as denominator."}],"Solution":{"Idea":{"Ar":"نقسم الزيادة على السعر الأصلي لكل سلعة ونقارن النسبتين.","En":"Divide each increase by its original price and compare the rates."},"FormulaLatex":"100(10/40-10/80)","Steps":[{"Ar":"$100\\cdot10/40=25$","En":"$100\\cdot10/40=25$"},{"Ar":"$100\\cdot10/80=12.5$","En":"$100\\cdot10/80=12.5$"},{"Ar":"$25-12.5=12.5$","En":"$25-12.5=12.5$"}],"Substitution":{"Ar":"$25-12.5$","En":"$25-12.5$"},"Result":{"Ar":"$12.5$","En":"$12.5$"},"Unit":{"Ar":"نقطة مئوية","En":"percentage points"},"Verification":{"Ar":"$12.5+12.5=25$","En":"$12.5+12.5=25$"},"CommonError":{"Ar":"تساوي الزيادة المطلقة لا يعني تساوي النسبتين.","En":"Equal absolute increases do not imply equal rates."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تساوي الزيادة المطلقة لا يعني تساوي النسبتين.","En":"Equal absolute increases do not imply equal rates."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الزيادة النقدية لكل سلعة.","En":"This is each absolute price increase."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه نسبة زيادة A وحدها.","En":"This is A's rate alone."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v64-grade-8-circle-area-two-equal-disks-combined-area-1$mw$,$mw$circle-area-two-equal-disks-combined-area$mw$,$mw$middle-circle-area$mw$,$mw$grade-8$mw$,8,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة قرصين متساويين","En":"Combined area of equal disks"},"Question":{"Ar":"قرصان دائريان غير متداخلين، نصف قطر كل منهما 4 سم. ما مجموع مساحتيهما بدلالة π؟","En":"Two nonoverlapping disks each have radius four centimetres. What is their combined area in terms of pi?"},"Options":[{"LatexCode":"64\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب مساحة قرص نصف قطره 8.","En":"Computes the area of a disk of radius eight."}},{"LatexCode":"32\\pi","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع نصفي القطر دون تربيع.","En":"Adds radii without squaring."}},{"LatexCode":"16\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة قرص واحد.","En":"This is the area of one disk."}}],"Hints":[{"Ar":"ربع نصف القطر.","En":"Square the radius."},{"Ar":"اضرب مساحة القرص الواحد في اثنين.","En":"Multiply one disk area by two."}],"Solution":{"Idea":{"Ar":"نحسب مساحة القرص الواحد ثم نضاعفها.","En":"Find the area of one disk and double it."},"FormulaLatex":"A=2\\pi r^2","Steps":[{"Ar":"$2\\cdot16\\pi=32\\pi$","En":"$2\\cdot16\\pi=32\\pi$"}],"Substitution":{"Ar":"$2\\pi\\cdot4^2$","En":"$2\\pi\\cdot4^2$"},"Result":{"Ar":"$32\\pi$","En":"$32\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$32\\pi/2=16\\pi$","En":"$32\\pi/2=16\\pi$"},"CommonError":{"Ar":"جمع نصفي القطر دون تربيع.","En":"Adds radii without squaring."}}}$mw$::jsonb,$mw$نحسب مساحة القرص الواحد ثم نضاعفها.

$A=2\pi r^2$

1. $2\cdot16\pi=32\pi$

$2\pi\cdot4^2$

$32\pi$ سم²

$32\pi/2=16\pi$

جمع نصفي القطر دون تربيع.$mw$,$mw$Find the area of one disk and double it.

$A=2\pi r^2$

1. $2\cdot16\pi=32\pi$

$2\pi\cdot4^2$

$32\pi$ cm²

$32\pi/2=16\pi$

Adds radii without squaring.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ربع نصف القطر.","En":"Square the radius."},{"Ar":"اضرب مساحة القرص الواحد في اثنين.","En":"Multiply one disk area by two."}],"Solution":{"Idea":{"Ar":"نحسب مساحة القرص الواحد ثم نضاعفها.","En":"Find the area of one disk and double it."},"FormulaLatex":"A=2\\pi r^2","Steps":[{"Ar":"$2\\cdot16\\pi=32\\pi$","En":"$2\\cdot16\\pi=32\\pi$"}],"Substitution":{"Ar":"$2\\pi\\cdot4^2$","En":"$2\\pi\\cdot4^2$"},"Result":{"Ar":"$32\\pi$","En":"$32\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$32\\pi/2=16\\pi$","En":"$32\\pi/2=16\\pi$"},"CommonError":{"Ar":"جمع نصفي القطر دون تربيع.","En":"Adds radii without squaring."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب مساحة قرص نصف قطره 8.","En":"Computes the area of a disk of radius eight."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع نصفي القطر دون تربيع.","En":"Adds radii without squaring."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة قرص واحد.","En":"This is the area of one disk."},"Order":4}]}$mw$),
($mw$growth-v64-grade-8-iqr-compare-range-outer-extreme-change-quartiles-fixed-1$mw$,$mw$iqr-compare-range-outer-extreme-change-quartiles-fixed$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-8$mw$,8,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مدى ومدى ربعي عند تغيير الطرف","En":"Range and IQR after an extreme changes"},"Question":{"Ar":"البيانات المرتبة هي 1،3،5،7،9،11،13. استُبدلت 13 بالعدد 30. ما المدى الربعي الجديد باستبعاد الوسيط عند حساب الربيعين؟","En":"The sorted data are 1,3,5,7,9,11,13. Replace 13 with 30. What is the new IQR, using medians of the halves excluding the overall median?"},"Options":[{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"29","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المدى الكلي الجديد.","En":"This is the new full range."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار تغير القيمة الكبرى.","En":"This is the maximum's change."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق بين الوسيط والربيع الأول.","En":"This is the difference between the median and lower quartile."}}],"Hints":[{"Ar":"افصل النصفين حول 7.","En":"Separate the halves around seven."},{"Ar":"اختر القيمة الوسطى من كل نصف.","En":"Select the middle value in each half."}],"Solution":{"Idea":{"Ar":"نحسب وسيط كل نصف بعد استبعاد الوسيط الكلي؛ لا تتغير القيمتان الوسطيتان للنصفين.","En":"Take the median of each half, excluding the overall median; the middle values of the halves stay unchanged."},"FormulaLatex":"IQR=Q_3-Q_1","Steps":[{"Ar":"$Q_1=3$","En":"$Q_1=3$"},{"Ar":"$Q_3=11$","En":"$Q_3=11$"},{"Ar":"$IQR=8$","En":"$IQR=8$"}],"Substitution":{"Ar":"$11-3$","En":"$11-3$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3<7<11$","En":"$3<7<11$"},"CommonError":{"Ar":"هذا المدى الكلي الجديد.","En":"This is the new full range."}}}$mw$::jsonb,$mw$نحسب وسيط كل نصف بعد استبعاد الوسيط الكلي؛ لا تتغير القيمتان الوسطيتان للنصفين.

$IQR=Q_3-Q_1$

1. $Q_1=3$

2. $Q_3=11$

3. $IQR=8$

$11-3$

$8$

$3<7<11$

هذا المدى الكلي الجديد.$mw$,$mw$Take the median of each half, excluding the overall median; the middle values of the halves stay unchanged.

$IQR=Q_3-Q_1$

1. $Q_1=3$

2. $Q_3=11$

3. $IQR=8$

$11-3$

$8$

$3<7<11$

This is the new full range.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"افصل النصفين حول 7.","En":"Separate the halves around seven."},{"Ar":"اختر القيمة الوسطى من كل نصف.","En":"Select the middle value in each half."}],"Solution":{"Idea":{"Ar":"نحسب وسيط كل نصف بعد استبعاد الوسيط الكلي؛ لا تتغير القيمتان الوسطيتان للنصفين.","En":"Take the median of each half, excluding the overall median; the middle values of the halves stay unchanged."},"FormulaLatex":"IQR=Q_3-Q_1","Steps":[{"Ar":"$Q_1=3$","En":"$Q_1=3$"},{"Ar":"$Q_3=11$","En":"$Q_3=11$"},{"Ar":"$IQR=8$","En":"$IQR=8$"}],"Substitution":{"Ar":"$11-3$","En":"$11-3$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3<7<11$","En":"$3<7<11$"},"CommonError":{"Ar":"هذا المدى الكلي الجديد.","En":"This is the new full range."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا المدى الكلي الجديد.","En":"This is the new full range."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار تغير القيمة الكبرى.","En":"This is the maximum's change."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق بين الوسيط والربيع الأول.","En":"This is the difference between the median and lower quartile."},"Order":4}]}$mw$),
($mw$growth-v64-grade-9-mad-known-three-deviations-one-zero-1$mw$,$mw$mad-known-three-deviations-one-zero$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"انحراف مطلق متوسط مع قيمة مساوية للمتوسط","En":"Mean absolute deviation with a zero deviation"},"Question":{"Ar":"البيانات هي 4،6،8،10،12 ومتوسطها 8. ما متوسط الانحرافات المطلقة عن المتوسط؟","En":"The data are 4,6,8,10,12 with mean eight. Find the mean absolute deviation from the mean."},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الانحرافات الموقعة بدلاً من المطلقة.","En":"Adds signed rather than absolute deviations."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على القيم غير الصفرية فقط.","En":"Divides by only the nonzero deviations."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الانحرافات المطلقة.","En":"This is the sum of absolute deviations."}},{"LatexCode":"2.4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب بعد كل قيمة عن 8.","En":"Find each distance from eight."},{"Ar":"اقسم مجموع المسافات على خمسة.","En":"Divide the total distance by five."}],"Solution":{"Idea":{"Ar":"نحسب المسافات عن المتوسط بما فيها الصفر ونقسم على عدد القيم كله.","En":"Compute distances from the mean, including zero, then divide by the full count."},"FormulaLatex":"MAD=\\frac{4+2+0+2+4}{5}","Steps":[{"Ar":"$4+2+0+2+4=12$","En":"$4+2+0+2+4=12$"},{"Ar":"$12/5=2.4$","En":"$12/5=2.4$"}],"Substitution":{"Ar":"$12/5$","En":"$12/5$"},"Result":{"Ar":"$2.4$","En":"$2.4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2.4\\cdot5=12$","En":"$2.4\\cdot5=12$"},"CommonError":{"Ar":"جمع الانحرافات الموقعة بدلاً من المطلقة.","En":"Adds signed rather than absolute deviations."}}}$mw$::jsonb,$mw$نحسب المسافات عن المتوسط بما فيها الصفر ونقسم على عدد القيم كله.

$MAD=\frac{4+2+0+2+4}{5}$

1. $4+2+0+2+4=12$

2. $12/5=2.4$

$12/5$

$2.4$

$2.4\cdot5=12$

جمع الانحرافات الموقعة بدلاً من المطلقة.$mw$,$mw$Compute distances from the mean, including zero, then divide by the full count.

$MAD=\frac{4+2+0+2+4}{5}$

1. $4+2+0+2+4=12$

2. $12/5=2.4$

$12/5$

$2.4$

$2.4\cdot5=12$

Adds signed rather than absolute deviations.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب بعد كل قيمة عن 8.","En":"Find each distance from eight."},{"Ar":"اقسم مجموع المسافات على خمسة.","En":"Divide the total distance by five."}],"Solution":{"Idea":{"Ar":"نحسب المسافات عن المتوسط بما فيها الصفر ونقسم على عدد القيم كله.","En":"Compute distances from the mean, including zero, then divide by the full count."},"FormulaLatex":"MAD=\\frac{4+2+0+2+4}{5}","Steps":[{"Ar":"$4+2+0+2+4=12$","En":"$4+2+0+2+4=12$"},{"Ar":"$12/5=2.4$","En":"$12/5=2.4$"}],"Substitution":{"Ar":"$12/5$","En":"$12/5$"},"Result":{"Ar":"$2.4$","En":"$2.4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2.4\\cdot5=12$","En":"$2.4\\cdot5=12$"},"CommonError":{"Ar":"جمع الانحرافات الموقعة بدلاً من المطلقة.","En":"Adds signed rather than absolute deviations."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع الانحرافات الموقعة بدلاً من المطلقة.","En":"Adds signed rather than absolute deviations."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم على القيم غير الصفرية فقط.","En":"Divides by only the nonzero deviations."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الانحرافات المطلقة.","En":"This is the sum of absolute deviations."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v64 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
