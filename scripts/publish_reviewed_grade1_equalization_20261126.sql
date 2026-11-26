-- Owner-authorized grade-one unknown-change equalization; distinct from static complement and direct comparison.
-- No taxonomy creation, exact revision/digest guard and duplicate screening.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='25s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
DO $publish$
DECLARE d public."CurriculumDraftItems"%ROWTYPE; w jsonb:=$mw${"Hints":[{"Ar":"لجعل العدد الأكبر مساوياً للأصغر نزيل الفرق بينهما.","En":"To make the larger count match the smaller count, remove the difference."},{"Ar":"عدّ للأمام من 11 إلى 15، أو للخلف من 15 إلى 11.","En":"Count up from 11 to 15, or down from 15 to 11."}],"Title":{"Ar":"المجموعات المتساوية","En":"Matching two collections"},"Points":10,"Options":[{"Reason":{"Ar":"هذا العدد الذي ينبغي أن يبقى مع سلمى.","En":"This is how many beads Salma should have left."},"ErrorType":"target-count","IsCorrect":false,"LatexCode":"11"},{"Reason":{"Ar":"قد ينتج من إدخال 11 في عدّ الخطوات من 11 إلى 15.","En":"This can happen if 11 itself is counted as a step."},"ErrorType":"inclusive-count","IsCorrect":false,"LatexCode":"5"},{"Reason":{"Ar":"هذا مجموع خرزات نور وسلمى.","En":"This is the total of both collections."},"ErrorType":"sum-instead","IsCorrect":false,"LatexCode":"26"},{"Reason":{"Ar":"","En":""},"ErrorType":"","IsCorrect":true,"LatexCode":"4"}],"StageId":1,"Question":{"Ar":"مع نور 11 خرزة، ومع سلمى 15 خرزة. إذا أعطت سلمى بعض خرزاتها إلى طفل آخر، فكم خرزة تعطي حتى يصبح معها مثل نور؟","En":"Nour has 11 beads and Salma has 15. How many beads should Salma give to another child so that she has as many as Nour?"},"Solution":{"Idea":{"Ar":"نبحث عن عدد الخرزات التي تُزال من المجموعة الأكبر حتى تساوي المجموعة الأصغر.","En":"Find how many beads must be removed from the larger collection to match the smaller one."},"Unit":{"Ar":"خرزات","En":"beads"},"Steps":[{"Ar":"حدد العدد الأكبر $L=15$ والعدد المطلوب أن يبقى $S=11$.","En":"Identify the larger count $L=15$ and target remaining count $S=11$."},{"Ar":"العددان فيهما عشرة واحدة؛ اطرح آحاد العدد الأصغر من آحاد الأكبر: $5-1=4$.","En":"Both numbers contain one ten; subtract the smaller ones digit from the larger: $5-1=4$."}],"Result":{"Ar":"$4$","En":"$4$"},"CommonError":{"Ar":"المطلوب عدد الخرزات التي تعطيها سلمى، لا العدد الذي يبقى معها. نور لا تتلقى الخرزات.","En":"The question asks how many beads Salma gives away, not how many remain. Nour does not receive the beads."},"FormulaLatex":"L-k=S\\Rightarrow k=L-S","Substitution":{"Ar":"$k=15-11=4$","En":"$k=15-11=4$"},"Verification":{"Ar":"بعد إعطاء 4 خرزات يبقى مع سلمى $15-4=11$.","En":"After giving away 4 beads, Salma has $15-4=11$."}},"TrackIds":[1],"CategoryId":1,"PrimarySkillId":2,"DifficultyLevel":1,"SecondarySkillIds":[]}$mw$::jsonb; pid int; actor int;
BEGIN
 SELECT * INTO STRICT d FROM public."CurriculumDraftItems" WHERE "Id"=1088 FOR UPDATE;
 actor:=d."OwnerUserId";
 IF d."Revision"<>0 OR d."EditorialStatus"<>'Draft' OR d."SourceProblemId" IS NOT NULL OR d."PublishedProblemId" IS NOT NULL OR md5(d."WizardJson")<>'81555904902116b6d8aedca2629b12c2' OR NOT EXISTS(SELECT 1 FROM public."Users" WHERE "Id"=actor AND "Role"='Admin' AND "IsActive" AND NOT "StaffSetupPending") THEN RAISE EXCEPTION 'Draft changed'; END IF;
 PERFORM 1 FROM public."LearningTracks" WHERE "Id"=1 FOR UPDATE;
 IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=1 AND "StageId"=1 AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=1 AND "StageId"=1) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=2 AND s."StageId"=1 AND s."CategoryId"=1 AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=1 AND "CategoryId"=1) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=1 AND "SkillId"=2) THEN RAISE EXCEPTION 'Scope changed'; END IF;
 IF EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."Id"<>1088 AND q."EditorialStatus" NOT IN ('Published','Withdrawn') AND q."SourceProblemId" IS NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(w#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate'; END IF;
 INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(w#>>'{Title,Ar}',w#>>'{Title,En}',w#>>'{Question,Ar}',w#>>'{Question,En}',$mw$نبحث عن عدد الخرزات التي تُزال من المجموعة الأكبر حتى تساوي المجموعة الأصغر.

$L-k=S\Rightarrow k=L-S$

1. حدد العدد الأكبر $L=15$ والعدد المطلوب أن يبقى $S=11$.

2. العددان فيهما عشرة واحدة؛ اطرح آحاد العدد الأصغر من آحاد الأكبر: $5-1=4$.

$k=15-11=4$

$4$ خرزات

بعد إعطاء 4 خرزات يبقى مع سلمى $15-4=11$.

المطلوب عدد الخرزات التي تعطيها سلمى، لا العدد الذي يبقى معها. نور لا تتلقى الخرزات.$mw$,$mw$Find how many beads must be removed from the larger collection to match the smaller one.

$L-k=S\Rightarrow k=L-S$

1. Identify the larger count $L=15$ and target remaining count $S=11$.

2. Both numbers contain one ten; subtract the smaller ones digit from the larger: $5-1=4$.

$k=15-11=4$

$4$ beads

After giving away 4 beads, Salma has $15-4=11$.

The question asks how many beads Salma gives away, not how many remain. Nour does not receive the beads.$mw$,1,1,10,0,0,now(),$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لجعل العدد الأكبر مساوياً للأصغر نزيل الفرق بينهما.","En":"To make the larger count match the smaller count, remove the difference."},{"Ar":"عدّ للأمام من 11 إلى 15، أو للخلف من 15 إلى 11.","En":"Count up from 11 to 15, or down from 15 to 11."}],"Solution":{"Idea":{"Ar":"نبحث عن عدد الخرزات التي تُزال من المجموعة الأكبر حتى تساوي المجموعة الأصغر.","En":"Find how many beads must be removed from the larger collection to match the smaller one."},"Unit":{"Ar":"خرزات","En":"beads"},"Steps":[{"Ar":"حدد العدد الأكبر $L=15$ والعدد المطلوب أن يبقى $S=11$.","En":"Identify the larger count $L=15$ and target remaining count $S=11$."},{"Ar":"العددان فيهما عشرة واحدة؛ اطرح آحاد العدد الأصغر من آحاد الأكبر: $5-1=4$.","En":"Both numbers contain one ten; subtract the smaller ones digit from the larger: $5-1=4$."}],"Result":{"Ar":"$4$","En":"$4$"},"CommonError":{"Ar":"المطلوب عدد الخرزات التي تعطيها سلمى، لا العدد الذي يبقى معها. نور لا تتلقى الخرزات.","En":"The question asks how many beads Salma gives away, not how many remain. Nour does not receive the beads."},"FormulaLatex":"L-k=S\\Rightarrow k=L-S","Substitution":{"Ar":"$k=15-11=4$","En":"$k=15-11=4$"},"Verification":{"Ar":"بعد إعطاء 4 خرزات يبقى مع سلمى $15-4=11$.","En":"After giving away 4 beads, Salma has $15-4=11$."}},"Distractors":[{"ErrorType":"target-count","Reason":{"Ar":"هذا العدد الذي ينبغي أن يبقى مع سلمى.","En":"This is how many beads Salma should have left."},"Order":1},{"ErrorType":"inclusive-count","Reason":{"Ar":"قد ينتج من إدخال 11 في عدّ الخطوات من 11 إلى 15.","En":"This can happen if 11 itself is counted as a step."},"Order":2},{"ErrorType":"sum-instead","Reason":{"Ar":"هذا مجموع خرزات نور وسلمى.","En":"This is the total of both collections."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$) RETURNING "Id" INTO pid;
 INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(w->'Options') WITH ORDINALITY AS x(o,ord);
 INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,2,true);
 INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(1,pid);
 UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=1;
 UPDATE public."CurriculumDraftItems" SET "WizardJson"=w::text,"EditorialStatus"='Published',"Revision"=4,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review; exact draft lock. Existing draft owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=1088;
 INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem','1088','owner_sql',now() FROM unnest(ARRAY['EditorialDraftEdited','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
END $publish$;
COMMIT;
