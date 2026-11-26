-- One-time owner-authorized v72 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v72-grade-2-counting-two-overlapping-lists-common-values-1$mw$,$mw$counting-two-overlapping-lists-common-values$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قيم مشتركة في نمطي عد","En":"Common values in counting patterns"},"Question":{"Ar":"تعد ريم بالقفز 3: 3،6،9،12،15،18. ويعد سامر بالقفز 6: 6،12،18. كم عدداً من قائمة ريم يظهر أيضاً في قائمة سامر؟","En":"Reem skip-counts by three: 3,6,9,12,15,18. Samer skip-counts by six: 6,12,18. How many of Reem's numbers also appear in Samer's list?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل إحدى القيم المشتركة.","En":"Misses one common value."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب كل قائمة ريم.","En":"Counts all of Reem's list."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع عدد عناصر القائمتين.","En":"Adds both list lengths."}}],"Hints":[{"Ar":"ضع إصبعك على العدد 6 في القائمتين.","En":"Find six in both lists."},{"Ar":"كرر ذلك لبقية أعداد سامر.","En":"Repeat for Samer's remaining numbers."}],"Solution":{"Idea":{"Ar":"نقارن كل عدد في القائمة القصيرة بالأعداد الموجودة في القائمة الطويلة.","En":"Check each number in the shorter list against the longer list."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"6، 12، 18","En":"6, 12, 18"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأعداد المشتركة هي 6 و12 و18 فقط.","En":"The common numbers are six, twelve and eighteen only."},"CommonError":{"Ar":"أهمل إحدى القيم المشتركة.","En":"Misses one common value."}}}$mw$::jsonb,$mw$نقارن كل عدد في القائمة القصيرة بالأعداد الموجودة في القائمة الطويلة.

$1+1+1=3$

1. $1+1+1=3$

6، 12، 18

$3$

الأعداد المشتركة هي 6 و12 و18 فقط.

أهمل إحدى القيم المشتركة.$mw$,$mw$Check each number in the shorter list against the longer list.

$1+1+1=3$

1. $1+1+1=3$

6, 12, 18

$3$

The common numbers are six, twelve and eighteen only.

Misses one common value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع إصبعك على العدد 6 في القائمتين.","En":"Find six in both lists."},{"Ar":"كرر ذلك لبقية أعداد سامر.","En":"Repeat for Samer's remaining numbers."}],"Solution":{"Idea":{"Ar":"نقارن كل عدد في القائمة القصيرة بالأعداد الموجودة في القائمة الطويلة.","En":"Check each number in the shorter list against the longer list."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"6، 12، 18","En":"6, 12, 18"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأعداد المشتركة هي 6 و12 و18 فقط.","En":"The common numbers are six, twelve and eighteen only."},"CommonError":{"Ar":"أهمل إحدى القيم المشتركة.","En":"Misses one common value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل إحدى القيم المشتركة.","En":"Misses one common value."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب كل قائمة ريم.","En":"Counts all of Reem's list."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع عدد عناصر القائمتين.","En":"Adds both list lengths."},"Order":4}]}$mw$),
($mw$growth-v72-grade-3-additive-equation-unknown-subtrahend-1$mw$,$mw$additive-equation-unknown-subtrahend$mw$,$mw$primary-one-step-additive-equations$mw$,$mw$grade-3$mw$,3,1,2,7,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":7,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجهول في الطرح","En":"Unknown subtrahend"},"Question":{"Ar":"ما قيمة $x$ التي تجعل $25-x=17$؟","En":"What value of $x$ makes $25-x=17$ true?"},"Options":[{"LatexCode":"42","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع العددين بدلاً من إيجاد الفرق.","En":"Adds the two numbers instead of finding the gap."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل ناتج الطرح نفسه.","En":"Uses the subtraction result itself."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ في طرح الآحاد.","En":"Miscalculates the subtraction."}}],"Hints":[{"Ar":"اسأل: كم نطرح من 25 لنصل إلى 17؟","En":"Ask how much must be taken from 25 to reach 17."},{"Ar":"اطرح 17 من 25.","En":"Subtract seventeen from twenty-five."}],"Solution":{"Idea":{"Ar":"المقدار المطروح يساوي الفرق بين العدد الأول والناتج.","En":"The subtrahend is the difference between the starting number and the result."},"FormulaLatex":"x=25-17","Steps":[{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=25-17$","En":"$x=25-17$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$25-8=17$.","En":"$25-8=17$."},"CommonError":{"Ar":"جمع العددين بدلاً من إيجاد الفرق.","En":"Adds the two numbers instead of finding the gap."}}}$mw$::jsonb,$mw$المقدار المطروح يساوي الفرق بين العدد الأول والناتج.

$x=25-17$

1. $x=8$

$x=25-17$

$8$

$25-8=17$.

جمع العددين بدلاً من إيجاد الفرق.$mw$,$mw$The subtrahend is the difference between the starting number and the result.

$x=25-17$

1. $x=8$

$x=25-17$

$8$

$25-8=17$.

Adds the two numbers instead of finding the gap.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اسأل: كم نطرح من 25 لنصل إلى 17؟","En":"Ask how much must be taken from 25 to reach 17."},{"Ar":"اطرح 17 من 25.","En":"Subtract seventeen from twenty-five."}],"Solution":{"Idea":{"Ar":"المقدار المطروح يساوي الفرق بين العدد الأول والناتج.","En":"The subtrahend is the difference between the starting number and the result."},"FormulaLatex":"x=25-17","Steps":[{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=25-17$","En":"$x=25-17$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$25-8=17$.","En":"$25-8=17$."},"CommonError":{"Ar":"جمع العددين بدلاً من إيجاد الفرق.","En":"Adds the two numbers instead of finding the gap."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع العددين بدلاً من إيجاد الفرق.","En":"Adds the two numbers instead of finding the gap."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل ناتج الطرح نفسه.","En":"Uses the subtraction result itself."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أخطأ في طرح الآحاد.","En":"Miscalculates the subtraction."},"Order":4}]}$mw$);
CREATE TEMP TABLE growth_seen ON COMMIT DROP AS SELECT upper(regexp_replace(btrim(ar),'[[:space:]]+',' ','g')) ar,upper(regexp_replace(btrim(en),'[[:space:]]+',' ','g')) en FROM (SELECT "QuestionTextAr" ar,"QuestionTextEn" en FROM public."Problems" UNION ALL SELECT "QuestionTextAr","QuestionTextEn" FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn' AND "WizardJson" IS NOT NULL UNION ALL SELECT "WizardJson"::jsonb#>>'{Question,Ar}',"WizardJson"::jsonb#>>'{Question,En}' FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn') q;
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM growth_seen q WHERE q.ar=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR q.en=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO growth_seen VALUES (upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')),upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')));
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v72 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
