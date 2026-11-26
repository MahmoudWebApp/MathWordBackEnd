-- One-time owner-authorized v65 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v65-grade-8-polygon-interior-sum-missing-angle-irregular-1$mw$,$mw$polygon-interior-sum-missing-angle-irregular$mw$,$mw$middle-polygon-angles$mw$,$mw$grade-8$mw$,8,2,8,39,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":39,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زاوية مجهولة في مضلع خماسي","En":"Missing angle of a pentagon"},"Question":{"Ar":"في مضلع خماسي، قياسات أربع زوايا داخلية هي 90° و110° و120° و100°. ما قياس الزاوية الخامسة؟","En":"Four interior angles of a pentagon are 90°, 110°, 120° and 100°. Find the fifth angle in degrees."},"Options":[{"LatexCode":"108","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن المضلع منتظم.","En":"Assumes the pentagon is regular."}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط الزاوية المطلوبة بمجموع زوايا مثلث.","En":"Confuses the missing angle with a triangle's total."}},{"LatexCode":"120","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل مجموع زوايا أقل من المطلوب.","En":"Uses too small an angle sum."}}],"Hints":[{"Ar":"احسب مجموع زوايا الخماسي.","En":"Find the pentagon angle sum."},{"Ar":"اطرح الزوايا الأربع.","En":"Subtract the four known angles."}],"Solution":{"Idea":{"Ar":"مجموع زوايا المضلع الخماسي 540°، ونطرح مجموع الزوايا المعطاة.","En":"A pentagon's interior angles total 540°; subtract the four known angles."},"FormulaLatex":"(5-2)180-(90+110+120+100)","Steps":[{"Ar":"$90+110+120+100=420$","En":"$90+110+120+100=420$"},{"Ar":"$540-420=120$","En":"$540-420=120$"}],"Substitution":{"Ar":"$540-420$","En":"$540-420$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$420+120=540$","En":"$420+120=540$"},"CommonError":{"Ar":"استعمل مجموع زوايا أقل من المطلوب.","En":"Uses too small an angle sum."}}}$mw$::jsonb,$mw$مجموع زوايا المضلع الخماسي 540°، ونطرح مجموع الزوايا المعطاة.

$(5-2)180-(90+110+120+100)$

1. $90+110+120+100=420$

2. $540-420=120$

$540-420$

$120$ °

$420+120=540$

استعمل مجموع زوايا أقل من المطلوب.$mw$,$mw$A pentagon's interior angles total 540°; subtract the four known angles.

$(5-2)180-(90+110+120+100)$

1. $90+110+120+100=420$

2. $540-420=120$

$540-420$

$120$ °

$420+120=540$

Uses too small an angle sum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مجموع زوايا الخماسي.","En":"Find the pentagon angle sum."},{"Ar":"اطرح الزوايا الأربع.","En":"Subtract the four known angles."}],"Solution":{"Idea":{"Ar":"مجموع زوايا المضلع الخماسي 540°، ونطرح مجموع الزوايا المعطاة.","En":"A pentagon's interior angles total 540°; subtract the four known angles."},"FormulaLatex":"(5-2)180-(90+110+120+100)","Steps":[{"Ar":"$90+110+120+100=420$","En":"$90+110+120+100=420$"},{"Ar":"$540-420=120$","En":"$540-420=120$"}],"Substitution":{"Ar":"$540-420$","En":"$540-420$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$420+120=540$","En":"$420+120=540$"},"CommonError":{"Ar":"استعمل مجموع زوايا أقل من المطلوب.","En":"Uses too small an angle sum."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"افترض أن المضلع منتظم.","En":"Assumes the pentagon is regular."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"خلط الزاوية المطلوبة بمجموع زوايا مثلث.","En":"Confuses the missing angle with a triangle's total."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل مجموع زوايا أقل من المطلوب.","En":"Uses too small an angle sum."},"Order":4}]}$mw$),
($mw$growth-v65-grade-8-circle-area-square-radius-compare-difference-1$mw$,$mw$circle-area-square-radius-compare-difference$mw$,$mw$middle-circle-area$mw$,$mw$grade-8$mw$,8,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق مساحتي قرصين","En":"Difference between disk areas"},"Question":{"Ar":"لدينا قرصان نصفا قطريهما 7 سم و5 سم. بكم تزيد مساحة الأكبر على الأصغر بدلالة π؟","En":"Two disks have radii seven and five centimetres. By how much does the larger area exceed the smaller, in terms of pi?"},"Options":[{"LatexCode":"74\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المساحتين.","En":"Adds the two areas."}},{"LatexCode":"24\\pi","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح نصفي القطر فقط.","En":"Subtracts radii only."}},{"LatexCode":"4\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربع فرق نصفي القطر.","En":"Squares the difference of the radii."}}],"Hints":[{"Ar":"احسب مربع كل نصف قطر.","En":"Square each radius."},{"Ar":"اطرح المساحتين.","En":"Subtract the two areas."}],"Solution":{"Idea":{"Ar":"نطرح مربعي نصفي القطر ثم نضرب في π.","En":"Subtract the squared radii and multiply by pi."},"FormulaLatex":"\\pi(7^2-5^2)","Steps":[{"Ar":"$49-25=24$","En":"$49-25=24$"}],"Substitution":{"Ar":"$\\pi(49-25)$","En":"$\\pi(49-25)$"},"Result":{"Ar":"$24\\pi$","En":"$24\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$25\\pi+24\\pi=49\\pi$","En":"$25\\pi+24\\pi=49\\pi$"},"CommonError":{"Ar":"طرح نصفي القطر فقط.","En":"Subtracts radii only."}}}$mw$::jsonb,$mw$نطرح مربعي نصفي القطر ثم نضرب في π.

$\pi(7^2-5^2)$

1. $49-25=24$

$\pi(49-25)$

$24\pi$ سم²

$25\pi+24\pi=49\pi$

طرح نصفي القطر فقط.$mw$,$mw$Subtract the squared radii and multiply by pi.

$\pi(7^2-5^2)$

1. $49-25=24$

$\pi(49-25)$

$24\pi$ cm²

$25\pi+24\pi=49\pi$

Subtracts radii only.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مربع كل نصف قطر.","En":"Square each radius."},{"Ar":"اطرح المساحتين.","En":"Subtract the two areas."}],"Solution":{"Idea":{"Ar":"نطرح مربعي نصفي القطر ثم نضرب في π.","En":"Subtract the squared radii and multiply by pi."},"FormulaLatex":"\\pi(7^2-5^2)","Steps":[{"Ar":"$49-25=24$","En":"$49-25=24$"}],"Substitution":{"Ar":"$\\pi(49-25)$","En":"$\\pi(49-25)$"},"Result":{"Ar":"$24\\pi$","En":"$24\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$25\\pi+24\\pi=49\\pi$","En":"$25\\pi+24\\pi=49\\pi$"},"CommonError":{"Ar":"طرح نصفي القطر فقط.","En":"Subtracts radii only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع المساحتين.","En":"Adds the two areas."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح نصفي القطر فقط.","En":"Subtracts radii only."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ربع فرق نصفي القطر.","En":"Squares the difference of the radii."},"Order":4}]}$mw$),
($mw$growth-v65-grade-9-iqr-recover-quartile-from-width-and-center-1$mw$,$mw$iqr-recover-quartile-from-width-and-center$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ربيع مجهول من المدى الربعي","En":"Quartile from interquartile range"},"Question":{"Ar":"الربيع الثالث لمجموعة بيانات هو 29، والمدى الربعي 12. ما الربيع الأول؟","En":"A data set has third quartile 29 and interquartile range 12. Find the first quartile."},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المدى الربعي.","En":"This is the IQR."}},{"LatexCode":"29","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الربيع الثالث.","En":"This is the third quartile."}},{"LatexCode":"41","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المدى الربعي مع الربيع الثالث.","En":"Adds the IQR to the third quartile."}},{"LatexCode":"17","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب تعريف المدى الربعي.","En":"Recall the IQR definition."},{"Ar":"اعزل الربيع الأول.","En":"Isolate the first quartile."}],"Solution":{"Idea":{"Ar":"المدى الربعي هو الربيع الثالث ناقص الربيع الأول.","En":"The IQR equals the third quartile minus the first."},"FormulaLatex":"Q_1=Q_3-IQR","Steps":[{"Ar":"$Q_1=17$","En":"$Q_1=17$"}],"Substitution":{"Ar":"$29-12$","En":"$29-12$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$29-17=12$","En":"$29-17=12$"},"CommonError":{"Ar":"هذا المدى الربعي.","En":"This is the IQR."}}}$mw$::jsonb,$mw$المدى الربعي هو الربيع الثالث ناقص الربيع الأول.

$Q_1=Q_3-IQR$

1. $Q_1=17$

$29-12$

$17$

$29-17=12$

هذا المدى الربعي.$mw$,$mw$The IQR equals the third quartile minus the first.

$Q_1=Q_3-IQR$

1. $Q_1=17$

$29-12$

$17$

$29-17=12$

This is the IQR.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب تعريف المدى الربعي.","En":"Recall the IQR definition."},{"Ar":"اعزل الربيع الأول.","En":"Isolate the first quartile."}],"Solution":{"Idea":{"Ar":"المدى الربعي هو الربيع الثالث ناقص الربيع الأول.","En":"The IQR equals the third quartile minus the first."},"FormulaLatex":"Q_1=Q_3-IQR","Steps":[{"Ar":"$Q_1=17$","En":"$Q_1=17$"}],"Substitution":{"Ar":"$29-12$","En":"$29-12$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$29-17=12$","En":"$29-17=12$"},"CommonError":{"Ar":"هذا المدى الربعي.","En":"This is the IQR."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا المدى الربعي.","En":"This is the IQR."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا الربيع الثالث.","En":"This is the third quartile."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع المدى الربعي مع الربيع الثالث.","En":"Adds the IQR to the third quartile."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v65-grade-9-mad-two-value-frequency-balanced-deviations-1$mw$,$mw$mad-two-value-frequency-balanced-deviations$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"انحرافات مطلقة بتكرارات غير متساوية","En":"Absolute deviations with unequal frequencies"},"Question":{"Ar":"في مجموعة بيانات تظهر القيمة 2 مرة واحدة، والقيمة 6 ثلاث مرات. المتوسط 5. ما متوسط الانحرافات المطلقة عن المتوسط؟","En":"In a data set, 2 occurs once and 6 occurs three times. The mean is 5. Find the mean absolute deviation from the mean."},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب متوسط انحرافي القيمتين المختلفتين دون مراعاة التكرار.","En":"Averages the two distinct deviations without weighting frequencies."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الانحرافات المطلقة.","En":"This is the sum of absolute deviations."}},{"LatexCode":"1.5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الانحرافات الموقعة.","En":"Adds signed deviations."}}],"Hints":[{"Ar":"احسب انحراف 2 عن 5.","En":"Find the distance from two to five."},{"Ar":"احسب انحراف 6 ثلاث مرات.","En":"Count the distance from six three times."}],"Solution":{"Idea":{"Ar":"نحسب انحراف كل قراءة عن المتوسط ونكرر الانحراف حسب التكرار.","En":"Count each absolute deviation according to its frequency."},"FormulaLatex":"MAD=(|2-5|+3|6-5|)/4","Steps":[{"Ar":"$|2-5|=3$","En":"$|2-5|=3$"},{"Ar":"$|6-5|=1$","En":"$|6-5|=1$"},{"Ar":"$6/4=1.5$","En":"$6/4=1.5$"}],"Substitution":{"Ar":"$(3+3)/4$","En":"$(3+3)/4$"},"Result":{"Ar":"$1.5$","En":"$1.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot1.5=6$","En":"$4\\cdot1.5=6$"},"CommonError":{"Ar":"جمع الانحرافات الموقعة.","En":"Adds signed deviations."}}}$mw$::jsonb,$mw$نحسب انحراف كل قراءة عن المتوسط ونكرر الانحراف حسب التكرار.

$MAD=(|2-5|+3|6-5|)/4$

1. $|2-5|=3$

2. $|6-5|=1$

3. $6/4=1.5$

$(3+3)/4$

$1.5$

$4\cdot1.5=6$

جمع الانحرافات الموقعة.$mw$,$mw$Count each absolute deviation according to its frequency.

$MAD=(|2-5|+3|6-5|)/4$

1. $|2-5|=3$

2. $|6-5|=1$

3. $6/4=1.5$

$(3+3)/4$

$1.5$

$4\cdot1.5=6$

Adds signed deviations.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب انحراف 2 عن 5.","En":"Find the distance from two to five."},{"Ar":"احسب انحراف 6 ثلاث مرات.","En":"Count the distance from six three times."}],"Solution":{"Idea":{"Ar":"نحسب انحراف كل قراءة عن المتوسط ونكرر الانحراف حسب التكرار.","En":"Count each absolute deviation according to its frequency."},"FormulaLatex":"MAD=(|2-5|+3|6-5|)/4","Steps":[{"Ar":"$|2-5|=3$","En":"$|2-5|=3$"},{"Ar":"$|6-5|=1$","En":"$|6-5|=1$"},{"Ar":"$6/4=1.5$","En":"$6/4=1.5$"}],"Substitution":{"Ar":"$(3+3)/4$","En":"$(3+3)/4$"},"Result":{"Ar":"$1.5$","En":"$1.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot1.5=6$","En":"$4\\cdot1.5=6$"},"CommonError":{"Ar":"جمع الانحرافات الموقعة.","En":"Adds signed deviations."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب متوسط انحرافي القيمتين المختلفتين دون مراعاة التكرار.","En":"Averages the two distinct deviations without weighting frequencies."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الانحرافات المطلقة.","En":"This is the sum of absolute deviations."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع الانحرافات الموقعة.","En":"Adds signed deviations."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v65 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
