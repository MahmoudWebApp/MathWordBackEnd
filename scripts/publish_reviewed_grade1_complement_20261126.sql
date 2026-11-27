-- Owner-authorized one-time expansion; static part-whole complement rather than removal.
-- No taxonomy creation, exact revision/digest guard and duplicate screening.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='25s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
DO $publish$
DECLARE d public."CurriculumDraftItems"%ROWTYPE; w jsonb:=$mw${"Hints":[{"Ar":"المقاعد المشغولة والشاغرة تكوّن معاً العدد الكلي.","En":"Occupied and empty seats together make up the total."},{"Ar":"ابدأ بعدد كل المقاعد واستبعد المقاعد الشاغرة.","En":"Start with all seats and exclude the empty seats."}],"Title":{"Ar":"عدد المقاعد المشغولة","En":"Number of occupied seats"},"Points":10,"Options":[{"Reason":{"Ar":"هذا عدد المقاعد الشاغرة.","En":"This is the number of empty seats."},"ErrorType":"part-given","IsCorrect":false,"LatexCode":"4"},{"Reason":{"Ar":"قد ينتج من طرح مقعد زائد مع المقاعد الشاغرة.","En":"This can happen if one extra seat is removed with the empty seats."},"ErrorType":"removed-extra","IsCorrect":false,"LatexCode":"13"},{"Reason":{"Ar":"هذا ناتج إضافة المقاعد الشاغرة إلى العدد الكلي.","En":"This adds the empty seats to the total."},"ErrorType":"inverse","IsCorrect":false,"LatexCode":"22"},{"Reason":{"Ar":"","En":""},"ErrorType":"","IsCorrect":true,"LatexCode":"14"}],"StageId":1,"Question":{"Ar":"في الحافلة 18 مقعداً. جميعها مشغولة إلا 4 مقاعد. كم مقعداً مشغولاً؟","En":"A bus has 18 seats. All but 4 are occupied. How many seats are occupied?"},"Solution":{"Idea":{"Ar":"المجموع يتألف من جزأين لا يتداخلان: المقاعد المشغولة والمقاعد الشاغرة.","En":"The total consists of two disjoint parts: occupied and empty seats."},"Unit":{"Ar":"مقعداً مشغولاً","En":"occupied seats"},"Steps":[{"Ar":"حدد العدد الكلي $T=18$ وعدد المقاعد الشاغرة $E=4$.","En":"Identify the total $T=18$ and the empty seats $E=4$."},{"Ar":"اطرح أربعة آحاد من ثمانية آحاد، مع الإبقاء على العشرة الواحدة.","En":"Subtract four ones from eight ones, keeping the one ten."}],"Result":{"Ar":"$14$","En":"$14$"},"CommonError":{"Ar":"لا تضف المقاعد الشاغرة إلى العدد الكلي، فهي محسوبة فيه بالفعل.","En":"Do not add the empty seats to the total; they are already included."},"FormulaLatex":"T=O+E\\Rightarrow O=T-E","Substitution":{"Ar":"$O=18-4=14$","En":"$O=18-4=14$"},"Verification":{"Ar":"$14+4=18$، وهو عدد مقاعد الحافلة.","En":"$14+4=18$, the total number of seats."}},"TrackIds":[1],"CategoryId":1,"PrimarySkillId":2,"DifficultyLevel":1,"SecondarySkillIds":[]}$mw$::jsonb; pid int; actor int;
BEGIN
 SELECT * INTO STRICT d FROM public."CurriculumDraftItems" WHERE "Id"=1086 FOR UPDATE;
 actor:=d."OwnerUserId";
 IF d."Revision"<>0 OR d."EditorialStatus"<>'Draft' OR d."SourceProblemId" IS NOT NULL OR d."PublishedProblemId" IS NOT NULL OR md5(d."WizardJson")<>'1f05c2a889fc2273f72d9d31a2b5fd1d' OR NOT EXISTS(SELECT 1 FROM public."Users" WHERE "Id"=actor AND "Role"='Admin' AND "IsActive" AND NOT "StaffSetupPending") THEN RAISE EXCEPTION 'Draft changed'; END IF;
 PERFORM 1 FROM public."LearningTracks" WHERE "Id"=1 FOR UPDATE;
 IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=1 AND "StageId"=1 AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=1 AND "StageId"=1) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=2 AND s."StageId"=1 AND s."CategoryId"=1 AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=1 AND "CategoryId"=1) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=1 AND "SkillId"=2) THEN RAISE EXCEPTION 'Scope changed'; END IF;
 IF EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."Id"<>1086 AND q."EditorialStatus" NOT IN ('Published','Withdrawn') AND q."SourceProblemId" IS NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate'; END IF;
 INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(w#>>'{Title,Ar}',w#>>'{Title,En}',w#>>'{Question,Ar}',w#>>'{Question,En}',$mw$المجموع يتألف من جزأين لا يتداخلان: المقاعد المشغولة والمقاعد الشاغرة.

$T=O+E\Rightarrow O=T-E$

1. حدد العدد الكلي $T=18$ وعدد المقاعد الشاغرة $E=4$.

2. اطرح أربعة آحاد من ثمانية آحاد، مع الإبقاء على العشرة الواحدة.

$O=18-4=14$

$14$ مقعداً مشغولاً

$14+4=18$، وهو عدد مقاعد الحافلة.

لا تضف المقاعد الشاغرة إلى العدد الكلي، فهي محسوبة فيه بالفعل.$mw$,$mw$The total consists of two disjoint parts: occupied and empty seats.

$T=O+E\Rightarrow O=T-E$

1. Identify the total $T=18$ and the empty seats $E=4$.

2. Subtract four ones from eight ones, keeping the one ten.

$O=18-4=14$

$14$ occupied seats

$14+4=18$, the total number of seats.

Do not add the empty seats to the total; they are already included.$mw$,1,1,10,0,0,now(),$mw${"DifficultyLevel":1,"Hints":[{"Ar":"المقاعد المشغولة والشاغرة تكوّن معاً العدد الكلي.","En":"Occupied and empty seats together make up the total."},{"Ar":"ابدأ بعدد كل المقاعد واستبعد المقاعد الشاغرة.","En":"Start with all seats and exclude the empty seats."}],"Solution":{"Idea":{"Ar":"المجموع يتألف من جزأين لا يتداخلان: المقاعد المشغولة والمقاعد الشاغرة.","En":"The total consists of two disjoint parts: occupied and empty seats."},"Unit":{"Ar":"مقعداً مشغولاً","En":"occupied seats"},"Steps":[{"Ar":"حدد العدد الكلي $T=18$ وعدد المقاعد الشاغرة $E=4$.","En":"Identify the total $T=18$ and the empty seats $E=4$."},{"Ar":"اطرح أربعة آحاد من ثمانية آحاد، مع الإبقاء على العشرة الواحدة.","En":"Subtract four ones from eight ones, keeping the one ten."}],"Result":{"Ar":"$14$","En":"$14$"},"CommonError":{"Ar":"لا تضف المقاعد الشاغرة إلى العدد الكلي، فهي محسوبة فيه بالفعل.","En":"Do not add the empty seats to the total; they are already included."},"FormulaLatex":"T=O+E\\Rightarrow O=T-E","Substitution":{"Ar":"$O=18-4=14$","En":"$O=18-4=14$"},"Verification":{"Ar":"$14+4=18$، وهو عدد مقاعد الحافلة.","En":"$14+4=18$, the total number of seats."}},"Distractors":[{"ErrorType":"part-given","Reason":{"Ar":"هذا عدد المقاعد الشاغرة.","En":"This is the number of empty seats."},"Order":1},{"ErrorType":"removed-extra","Reason":{"Ar":"قد ينتج من طرح مقعد زائد مع المقاعد الشاغرة.","En":"This can happen if one extra seat is removed with the empty seats."},"Order":2},{"ErrorType":"inverse","Reason":{"Ar":"هذا ناتج إضافة المقاعد الشاغرة إلى العدد الكلي.","En":"This adds the empty seats to the total."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$) RETURNING "Id" INTO pid;
 INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(w->'Options') WITH ORDINALITY AS x(o,ord);
 INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,2,true);
 INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(1,pid);
 UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=1;
 UPDATE public."CurriculumDraftItems" SET "WizardJson"=w::text,"EditorialStatus"='Published',"Revision"=4,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review; exact draft lock. Existing draft owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=1086;
 INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem','1086','owner_sql',now() FROM unnest(ARRAY['EditorialDraftEdited','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
END $publish$;
COMMIT;
