-- One-time owner-authorized v72 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v72-grade-1-category-count-combine-two-labels-ranking-1$mw$,$mw$category-count-combine-two-labels-ranking$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"دمج فئتين في سجل","En":"Combining two categories"},"Question":{"Ar":"في سجل الحيوانات: 3 قطط و4 كلاب و5 عصافير. نضع القطط والكلاب في فئة واحدة اسمها الحيوانات ذات الأربع أرجل. كم يزيد عدد هذه الفئة على عدد العصافير؟","En":"An animal record has three cats, four dogs and five birds. Cats and dogs are combined into a four-legged animal category. How many more are in that category than in the bird category?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن الكلاب وحدها بالطيور.","En":"Compares dogs alone with birds."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الفئة المدمجة دون المقارنة.","En":"Finds only the combined count."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع كل الحيوانات.","En":"Counts all animals."}}],"Hints":[{"Ar":"اجمع عدد القطط والكلاب.","En":"Add the cat and dog counts."},{"Ar":"قارن الناتج بعدد العصافير.","En":"Compare the result with the bird count."}],"Solution":{"Idea":{"Ar":"نجمع الفئتين المدمجتين ثم نقارن العدد الناتج بالفئة الأخرى.","En":"Add the merged categories, then compare the resulting count with the other category."},"FormulaLatex":"(3+4)-5","Steps":[{"Ar":"$7-5=2$","En":"$7-5=2$"}],"Substitution":{"Ar":"$(3+4)-5$","En":"$(3+4)-5$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+2=7$، وهو عدد الحيوانات ذات الأربع أرجل.","En":"$5+2=7$, the four-legged count."},"CommonError":{"Ar":"قارن الكلاب وحدها بالطيور.","En":"Compares dogs alone with birds."}}}$mw$::jsonb,$mw$نجمع الفئتين المدمجتين ثم نقارن العدد الناتج بالفئة الأخرى.

$(3+4)-5$

1. $7-5=2$

$(3+4)-5$

$2$

$5+2=7$، وهو عدد الحيوانات ذات الأربع أرجل.

قارن الكلاب وحدها بالطيور.$mw$,$mw$Add the merged categories, then compare the resulting count with the other category.

$(3+4)-5$

1. $7-5=2$

$(3+4)-5$

$2$

$5+2=7$, the four-legged count.

Compares dogs alone with birds.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع عدد القطط والكلاب.","En":"Add the cat and dog counts."},{"Ar":"قارن الناتج بعدد العصافير.","En":"Compare the result with the bird count."}],"Solution":{"Idea":{"Ar":"نجمع الفئتين المدمجتين ثم نقارن العدد الناتج بالفئة الأخرى.","En":"Add the merged categories, then compare the resulting count with the other category."},"FormulaLatex":"(3+4)-5","Steps":[{"Ar":"$7-5=2$","En":"$7-5=2$"}],"Substitution":{"Ar":"$(3+4)-5$","En":"$(3+4)-5$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+2=7$، وهو عدد الحيوانات ذات الأربع أرجل.","En":"$5+2=7$, the four-legged count."},"CommonError":{"Ar":"قارن الكلاب وحدها بالطيور.","En":"Compares dogs alone with birds."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قارن الكلاب وحدها بالطيور.","En":"Compares dogs alone with birds."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الفئة المدمجة دون المقارنة.","En":"Finds only the combined count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع كل الحيوانات.","En":"Counts all animals."},"Order":4}]}$mw$),
($mw$growth-v72-grade-2-length-cut-longest-equal-two-with-leftover-1$mw$,$mw$length-cut-longest-equal-two-with-leftover$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقسيم شريط وباقٍ","En":"Splitting a strip with remainder"},"Question":{"Ar":"طول شريط 17 سم. نريد قص قطعتين متساويتين بأكبر طول ممكن بالسنتيمترات الصحيحة دون ضياع أي طول بسبب القص. كم سنتيمتراً يبقى من الشريط؟","En":"A strip is 17 cm long. Cut two equal pieces of the greatest possible whole-centimetre length, with no cutting loss. How many centimetres remain?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمكن تقسيم 17 بالتساوي إلى طولين صحيحين دون باقٍ.","En":"Seventeen cannot be divided into two equal whole lengths exactly."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طولان مقدارهما 8 يتركان واحداً فقط.","En":"Two lengths of eight leave only one."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا طول القطعة الواحدة لا الباقي.","En":"This is one piece length, not the remainder."}}],"Hints":[{"Ar":"جرب طولاً صحيحاً متساوياً للقطعتين.","En":"Try equal whole-number lengths."},{"Ar":"اطرح طول القطعتين من طول الشريط.","En":"Subtract both pieces from the strip length."}],"Solution":{"Idea":{"Ar":"أكبر طول صحيح للقطعتين هو 8 سم لكل واحدة، لأن 9 سم لكل واحدة يحتاج 18 سم.","En":"The largest whole length per piece is eight, since nine each would require eighteen."},"FormulaLatex":"17-2\\cdot8=1","Steps":[{"Ar":"$2\\cdot8=16\\le17<18=2\\cdot9$","En":"$2\\cdot8=16\\le17<18=2\\cdot9$"},{"Ar":"$17-16=1$","En":"$17-16=1$"}],"Substitution":{"Ar":"$17-2\\cdot8=1$","En":"$17-2\\cdot8=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$8+8+1=17$ و$9+9>17$.","En":"$8+8+1=17$ and $9+9>17$."},"CommonError":{"Ar":"لا يمكن تقسيم 17 بالتساوي إلى طولين صحيحين دون باقٍ.","En":"Seventeen cannot be divided into two equal whole lengths exactly."}}}$mw$::jsonb,$mw$أكبر طول صحيح للقطعتين هو 8 سم لكل واحدة، لأن 9 سم لكل واحدة يحتاج 18 سم.

$17-2\cdot8=1$

1. $2\cdot8=16\le17<18=2\cdot9$

2. $17-16=1$

$17-2\cdot8=1$

$1$

سم

$8+8+1=17$ و$9+9>17$.

لا يمكن تقسيم 17 بالتساوي إلى طولين صحيحين دون باقٍ.$mw$,$mw$The largest whole length per piece is eight, since nine each would require eighteen.

$17-2\cdot8=1$

1. $2\cdot8=16\le17<18=2\cdot9$

2. $17-16=1$

$17-2\cdot8=1$

$1$

cm

$8+8+1=17$ and $9+9>17$.

Seventeen cannot be divided into two equal whole lengths exactly.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"جرب طولاً صحيحاً متساوياً للقطعتين.","En":"Try equal whole-number lengths."},{"Ar":"اطرح طول القطعتين من طول الشريط.","En":"Subtract both pieces from the strip length."}],"Solution":{"Idea":{"Ar":"أكبر طول صحيح للقطعتين هو 8 سم لكل واحدة، لأن 9 سم لكل واحدة يحتاج 18 سم.","En":"The largest whole length per piece is eight, since nine each would require eighteen."},"FormulaLatex":"17-2\\cdot8=1","Steps":[{"Ar":"$2\\cdot8=16\\le17<18=2\\cdot9$","En":"$2\\cdot8=16\\le17<18=2\\cdot9$"},{"Ar":"$17-16=1$","En":"$17-16=1$"}],"Substitution":{"Ar":"$17-2\\cdot8=1$","En":"$17-2\\cdot8=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$8+8+1=17$ و$9+9>17$.","En":"$8+8+1=17$ and $9+9>17$."},"CommonError":{"Ar":"لا يمكن تقسيم 17 بالتساوي إلى طولين صحيحين دون باقٍ.","En":"Seventeen cannot be divided into two equal whole lengths exactly."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يمكن تقسيم 17 بالتساوي إلى طولين صحيحين دون باقٍ.","En":"Seventeen cannot be divided into two equal whole lengths exactly."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طولان مقدارهما 8 يتركان واحداً فقط.","En":"Two lengths of eight leave only one."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا طول القطعة الواحدة لا الباقي.","En":"This is one piece length, not the remainder."},"Order":4}]}$mw$),
($mw$growth-v72-grade-2-counting-forward-repeated-number-inclusive-cross-ten-1$mw$,$mw$counting-forward-repeated-number-inclusive-cross-ten$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"العد عند الانتقال للعشرة","En":"Counting across a decade"},"Question":{"Ar":"كتب طفل الأعداد من 8 إلى 12 بالترتيب، وكتب العدد 10 مرتين بدلاً من مرة واحدة. كم عدداً كتب بالمجموع مع حساب التكرار؟","En":"A child writes the numbers from eight through twelve in order, but writes ten twice instead of once. How many numbers are written, counting repetitions?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل طرفي العد أو التكرار.","En":"Omits endpoints or the repeated entry."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب كل عدد مرة واحدة فقط.","En":"Counts each number only once."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف تكراراً آخر غير موجود.","En":"Adds another repetition that did not occur."}}],"Hints":[{"Ar":"ابدأ من 8 وانته عند 12 مع حسابهما.","En":"Include both eight and twelve."},{"Ar":"لا تنس كتابة 10 مرتين.","En":"Remember ten occurs twice."}],"Solution":{"Idea":{"Ar":"نكتب الأعداد كاملة مع تكرار العدد 10 مرة إضافية.","En":"List all numbers, with one extra occurrence of ten."},"FormulaLatex":"5+1=6","Steps":[{"Ar":"$5+1=6$","En":"$5+1=6$"}],"Substitution":{"Ar":"8، 9، 10، 10، 11، 12","En":"8, 9, 10, 10, 11, 12"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القائمة تضم ستة مدخلات عند عدها واحدة واحدة.","En":"Counting entries one by one gives six."},"CommonError":{"Ar":"أهمل طرفي العد أو التكرار.","En":"Omits endpoints or the repeated entry."}}}$mw$::jsonb,$mw$نكتب الأعداد كاملة مع تكرار العدد 10 مرة إضافية.

$5+1=6$

1. $5+1=6$

8، 9، 10، 10، 11، 12

$6$

القائمة تضم ستة مدخلات عند عدها واحدة واحدة.

أهمل طرفي العد أو التكرار.$mw$,$mw$List all numbers, with one extra occurrence of ten.

$5+1=6$

1. $5+1=6$

8, 9, 10, 10, 11, 12

$6$

Counting entries one by one gives six.

Omits endpoints or the repeated entry.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ من 8 وانته عند 12 مع حسابهما.","En":"Include both eight and twelve."},{"Ar":"لا تنس كتابة 10 مرتين.","En":"Remember ten occurs twice."}],"Solution":{"Idea":{"Ar":"نكتب الأعداد كاملة مع تكرار العدد 10 مرة إضافية.","En":"List all numbers, with one extra occurrence of ten."},"FormulaLatex":"5+1=6","Steps":[{"Ar":"$5+1=6$","En":"$5+1=6$"}],"Substitution":{"Ar":"8، 9، 10، 10، 11، 12","En":"8, 9, 10, 10, 11, 12"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القائمة تضم ستة مدخلات عند عدها واحدة واحدة.","En":"Counting entries one by one gives six."},"CommonError":{"Ar":"أهمل طرفي العد أو التكرار.","En":"Omits endpoints or the repeated entry."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل طرفي العد أو التكرار.","En":"Omits endpoints or the repeated entry."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب كل عدد مرة واحدة فقط.","En":"Counts each number only once."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف تكراراً آخر غير موجود.","En":"Adds another repetition that did not occur."},"Order":4}]}$mw$);
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
