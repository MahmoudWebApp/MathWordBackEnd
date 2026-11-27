-- One-time owner-authorized v75 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v75-grade-1-choose-question-supported-by-data-1$mw$,$mw$choose-question-supported-by-data$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ما الذي يخبرنا به السجل؟","En":"What can the record tell us?"},"Question":{"Ar":"عدّ سامر الحقائب حسب اللون فقط: 4 زرقاء و3 خضراء. أي سؤال يستطيع الإجابة عنه من سجله؟ A كم حقيبة فيها كتاب؟ B كم حقيبة خضراء؟ C كم حقيبة لها عجلتان؟ D كم حقيبة ثقيلة؟","En":"Samer records bags by color only: 4 blue and 3 green. Which question can he answer from his record? A: How many bags hold a book? B: How many bags are green? C: How many bags have two wheels? D: How many bags are heavy?"},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يسجل محتويات الحقائب.","En":"The record gives no bag contents."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يعد العجلات.","En":"He did not count wheels."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يزن الحقائب.","En":"He did not weigh the bags."}}],"Hints":[{"Ar":"انظر إلى الشيء الذي لاحظه سامر في كل حقيبة.","En":"Look at the feature Samer observed for each bag."},{"Ar":"ابحث عن سؤال يستخدم واحدة من فئتي السجل.","En":"Find a question that uses one of the two recorded categories."}],"Solution":{"Idea":{"Ar":"نختار السؤال الذي تتحدث عنه أسماء الفئات.","En":"Choose the question that the category labels describe."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"الفئتان هما الزرقاء والخضراء.","En":"The two labels are blue and green."},{"Ar":"نستطيع قراءة عدد الحقائب الخضراء مباشرة.","En":"We can read the green bag count directly."}],"Substitution":{"Ar":"ثلاث علامات للحقائب الخضراء: $1+1+1=3$.","En":"Three marks for green bags give $1+1+1=3$."},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"نجد العدد 3 بجانب اللون الأخضر في السجل.","En":"The record lists 3 next to green."},"CommonError":{"Ar":"لم يسجل محتويات الحقائب.","En":"The record gives no bag contents."}}}$mw$::jsonb,$mw$نختار السؤال الذي تتحدث عنه أسماء الفئات.

$1+1+1=3$

1. الفئتان هما الزرقاء والخضراء.

2. نستطيع قراءة عدد الحقائب الخضراء مباشرة.

$B$

نجد العدد 3 بجانب اللون الأخضر في السجل.

لم يسجل محتويات الحقائب.$mw$,$mw$Choose the question that the category labels describe.

$1+1+1=3$

1. The two labels are blue and green.

2. We can read the green bag count directly.

$B$

The record lists 3 next to green.

The record gives no bag contents.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"انظر إلى الشيء الذي لاحظه سامر في كل حقيبة.","En":"Look at the feature Samer observed for each bag."},{"Ar":"ابحث عن سؤال يستخدم واحدة من فئتي السجل.","En":"Find a question that uses one of the two recorded categories."}],"Solution":{"Idea":{"Ar":"نختار السؤال الذي تتحدث عنه أسماء الفئات.","En":"Choose the question that the category labels describe."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"الفئتان هما الزرقاء والخضراء.","En":"The two labels are blue and green."},{"Ar":"نستطيع قراءة عدد الحقائب الخضراء مباشرة.","En":"We can read the green bag count directly."}],"Substitution":{"Ar":"ثلاث علامات للحقائب الخضراء: $1+1+1=3$.","En":"Three marks for green bags give $1+1+1=3$."},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"نجد العدد 3 بجانب اللون الأخضر في السجل.","En":"The record lists 3 next to green."},"CommonError":{"Ar":"لم يسجل محتويات الحقائب.","En":"The record gives no bag contents."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يسجل محتويات الحقائب.","En":"The record gives no bag contents."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لم يعد العجلات.","En":"He did not count wheels."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لم يزن الحقائب.","En":"He did not weigh the bags."},"Order":4}]}$mw$),
($mw$growth-v75-grade-1-record-zero-versus-unobserved-1$mw$,$mw$record-zero-versus-unobserved$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"يوم بلا مشاهدات","En":"A day without observations"},"Question":{"Ar":"سجّلت ريم عدد الفراشات: الأحد 2، الاثنين 0، الثلاثاء 3. يوم الأربعاء لم تخرج للعد. في كم يوم من هذه الأيام الأربعة سجلت ريم عدداً، حتى لو كان صفراً؟","En":"Reem recorded butterfly counts: Sunday 2, Monday 0, Tuesday 3. On Wednesday she did not go out to count. On how many of these four days did she record a count, including zero?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل يوم الاثنين لأن العدد فيه صفر.","En":"This skips Monday because its count is zero."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الفراشات وليس عدد الأيام المسجلة.","En":"This adds butterflies instead of counting recorded days."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الأربعاء ولهذا اليوم لا يوجد تسجيل.","En":"This includes Wednesday, which has no entry."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ابحث عن الأيام التي خرجت فيها ريم للعد.","En":"Find the days when Reem went out to count."},{"Ar":"فكّر في الفرق بين عدم رؤية أي فراشة وعدم الخروج للعد.","En":"Think about seeing no butterflies versus never going out to count."}],"Solution":{"Idea":{"Ar":"الصفر عدد مسجل عندما نعدّ ولا نجد شيئاً.","En":"Zero is a recorded count when we look and find none."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"للأحد والاثنين والثلاثاء أعداد مكتوبة.","En":"Sunday, Monday and Tuesday each have a written count."},{"Ar":"نعد هذه الأيام ونترك الأربعاء بلا تسجيل.","En":"Count these days and leave Wednesday unrecorded."}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثلاثة أيام مسجلة ويوم بلا تسجيل تكوّن الأيام الأربعة.","En":"Three recorded days and one unrecorded day make four days."},"CommonError":{"Ar":"أهمل يوم الاثنين لأن العدد فيه صفر.","En":"This skips Monday because its count is zero."}}}$mw$::jsonb,$mw$الصفر عدد مسجل عندما نعدّ ولا نجد شيئاً.

$1+1+1=3$

1. للأحد والاثنين والثلاثاء أعداد مكتوبة.

2. نعد هذه الأيام ونترك الأربعاء بلا تسجيل.

$3$

ثلاثة أيام مسجلة ويوم بلا تسجيل تكوّن الأيام الأربعة.

أهمل يوم الاثنين لأن العدد فيه صفر.$mw$,$mw$Zero is a recorded count when we look and find none.

$1+1+1=3$

1. Sunday, Monday and Tuesday each have a written count.

2. Count these days and leave Wednesday unrecorded.

$3$

Three recorded days and one unrecorded day make four days.

This skips Monday because its count is zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابحث عن الأيام التي خرجت فيها ريم للعد.","En":"Find the days when Reem went out to count."},{"Ar":"فكّر في الفرق بين عدم رؤية أي فراشة وعدم الخروج للعد.","En":"Think about seeing no butterflies versus never going out to count."}],"Solution":{"Idea":{"Ar":"الصفر عدد مسجل عندما نعدّ ولا نجد شيئاً.","En":"Zero is a recorded count when we look and find none."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"للأحد والاثنين والثلاثاء أعداد مكتوبة.","En":"Sunday, Monday and Tuesday each have a written count."},{"Ar":"نعد هذه الأيام ونترك الأربعاء بلا تسجيل.","En":"Count these days and leave Wednesday unrecorded."}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثلاثة أيام مسجلة ويوم بلا تسجيل تكوّن الأيام الأربعة.","En":"Three recorded days and one unrecorded day make four days."},"CommonError":{"Ar":"أهمل يوم الاثنين لأن العدد فيه صفر.","En":"This skips Monday because its count is zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل يوم الاثنين لأن العدد فيه صفر.","En":"This skips Monday because its count is zero."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الفراشات وليس عدد الأيام المسجلة.","En":"This adds butterflies instead of counting recorded days."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الأربعاء ولهذا اليوم لا يوجد تسجيل.","En":"This includes Wednesday, which has no entry."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v75-grade-2-tool-length-resolution-1$mw$,$mw$tool-length-resolution$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار مسطرة","En":"Choosing a ruler"},"Question":{"Ar":"تريد نور قياس شريط طوله بين 10 و20 سم، وطوله عدد صحيح من السنتيمترات. تريد قراءة طوله من علامة موجودة مباشرة، من دون تقدير أو تحريك المسطرة. أي مسطرة تصلح لكل طول ممكن لهذا الشريط؟ A طولها 30 سم وعليها علامة كل 5 سم فقط. B طولها 8 سم وعليها علامة كل سم. C طولها 30 سم وعليها علامة كل سم. D طولها 10 سم وعليها علامة عند الطرفين فقط.","En":"Nour wants to measure a strip between 10 and 20 cm long whose length is a whole number of centimeters. She wants to read it at a marked tick without estimating or moving the ruler. Which ruler works for every possible length of this strip? A: 30 cm long, marked only every 5 cm. B: 8 cm long, marked every cm. C: 30 cm long, marked every cm. D: 10 cm long, marked only at its ends."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المسطرة طويلة بما يكفي لكن العلامات متباعدة.","En":"This ruler is long enough but its marks are too far apart."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المسطرة أقصر من الشريط.","En":"This ruler is shorter than the strip."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه المسطرة قصيرة وتفتقر إلى تدريج السنتيمترات.","En":"This ruler is short and has no centimeter divisions."}}],"Hints":[{"Ar":"هل تصل كل مسطرة إلى الطرف الآخر؟","En":"Does each ruler reach the other end?"},{"Ar":"أي تدريج يسمح بقراءة السنتيمترات المفردة؟","En":"Which scale shows individual centimeters?"}],"Solution":{"Idea":{"Ar":"نفحص طول المسطرة والمسافة بين علاماتها.","En":"Check both the length of the ruler and the spacing of its marks."},"FormulaLatex":"10<L<20","Steps":[{"Ar":"نحتاج إلى مسطرة تصل إلى نهاية الشريط.","En":"The ruler must reach the far end of the strip."},{"Ar":"نختار من المساطر الطويلة مسطرة تظهر كل سنتيمتر.","En":"Among long enough rulers choose one that marks every centimeter."}],"Substitution":{"Ar":"$10<L<20$","En":"$10<L<20$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"على المسطرة C نستطيع مثلاً قراءة 17 سم مباشرة من دون نقلها.","En":"On ruler C, for instance, 17 cm can be read directly without moving it."},"CommonError":{"Ar":"المسطرة طويلة بما يكفي لكن العلامات متباعدة.","En":"This ruler is long enough but its marks are too far apart."}}}$mw$::jsonb,$mw$نفحص طول المسطرة والمسافة بين علاماتها.

$10<L<20$

1. نحتاج إلى مسطرة تصل إلى نهاية الشريط.

2. نختار من المساطر الطويلة مسطرة تظهر كل سنتيمتر.

$C$

على المسطرة C نستطيع مثلاً قراءة 17 سم مباشرة من دون نقلها.

المسطرة طويلة بما يكفي لكن العلامات متباعدة.$mw$,$mw$Check both the length of the ruler and the spacing of its marks.

$10<L<20$

1. The ruler must reach the far end of the strip.

2. Among long enough rulers choose one that marks every centimeter.

$C$

On ruler C, for instance, 17 cm can be read directly without moving it.

This ruler is long enough but its marks are too far apart.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل تصل كل مسطرة إلى الطرف الآخر؟","En":"Does each ruler reach the other end?"},{"Ar":"أي تدريج يسمح بقراءة السنتيمترات المفردة؟","En":"Which scale shows individual centimeters?"}],"Solution":{"Idea":{"Ar":"نفحص طول المسطرة والمسافة بين علاماتها.","En":"Check both the length of the ruler and the spacing of its marks."},"FormulaLatex":"10<L<20","Steps":[{"Ar":"نحتاج إلى مسطرة تصل إلى نهاية الشريط.","En":"The ruler must reach the far end of the strip."},{"Ar":"نختار من المساطر الطويلة مسطرة تظهر كل سنتيمتر.","En":"Among long enough rulers choose one that marks every centimeter."}],"Substitution":{"Ar":"$10<L<20$","En":"$10<L<20$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"على المسطرة C نستطيع مثلاً قراءة 17 سم مباشرة من دون نقلها.","En":"On ruler C, for instance, 17 cm can be read directly without moving it."},"CommonError":{"Ar":"المسطرة طويلة بما يكفي لكن العلامات متباعدة.","En":"This ruler is long enough but its marks are too far apart."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المسطرة طويلة بما يكفي لكن العلامات متباعدة.","En":"This ruler is long enough but its marks are too far apart."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المسطرة أقصر من الشريط.","En":"This ruler is shorter than the strip."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه المسطرة قصيرة وتفتقر إلى تدريج السنتيمترات.","En":"This ruler is short and has no centimeter divisions."},"Order":4}]}$mw$);
DO $$ BEGIN IF EXISTS (SELECT 1 FROM (SELECT track, category, count(*) n FROM growth_batch GROUP BY 1,2) b WHERE b.n+(SELECT count(*) FROM "LearningTrackProblems" tp JOIN "Problems" p ON p."Id"=tp."ProblemId" WHERE tp."TrackId"=b.track AND p."CategoryId"=b.category)>20) THEN RAISE EXCEPTION 'Target already filled'; END IF; END $$;
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v75 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
