-- One-time owner-authorized v66 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v66-grade-7-probability-complement-infer-colour-count-from-probability-1$mw$,$mw$probability-complement-infer-colour-count-from-probability$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد عناصر من احتمال متمم","En":"Count from a complement probability"},"Question":{"Ar":"في كيس 20 كرة متساوية فرص السحب، بعضها أزرق والباقي أحمر. احتمال عدم سحب كرة زرقاء يساوي 0.35. كم كرة زرقاء فيه؟","En":"A bag contains twenty equally likely balls, some blue and the rest red. The probability of not drawing blue is 0.35. How many balls are blue?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكرات الحمراء.","En":"This is the red count."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا العدد الكلي.","En":"This is the total count."}},{"LatexCode":"0.65","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال الأزرق لا عدد كراته.","En":"This is the blue probability, not its count."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ما احتمال الأزرق؟","En":"What is the blue probability?"},{"Ar":"اضربه في 20.","En":"Multiply by twenty."}],"Solution":{"Idea":{"Ar":"نحسب احتمال الأزرق بالمتمم ثم نضرب في العدد الكلي.","En":"Find the blue probability using its complement, then multiply by the total."},"FormulaLatex":"n_B=20(1-0.35)","Steps":[{"Ar":"$1-0.35=0.65$","En":"$1-0.35=0.65$"},{"Ar":"$20\\cdot0.65=13$","En":"$20\\cdot0.65=13$"}],"Substitution":{"Ar":"$20\\cdot0.65$","En":"$20\\cdot0.65$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(20-13)/20=0.35$","En":"$(20-13)/20=0.35$"},"CommonError":{"Ar":"هذا عدد الكرات الحمراء.","En":"This is the red count."}}}$mw$::jsonb,$mw$نحسب احتمال الأزرق بالمتمم ثم نضرب في العدد الكلي.

$n_B=20(1-0.35)$

1. $1-0.35=0.65$

2. $20\cdot0.65=13$

$20\cdot0.65$

$13$

$(20-13)/20=0.35$

هذا عدد الكرات الحمراء.$mw$,$mw$Find the blue probability using its complement, then multiply by the total.

$n_B=20(1-0.35)$

1. $1-0.35=0.65$

2. $20\cdot0.65=13$

$20\cdot0.65$

$13$

$(20-13)/20=0.35$

This is the red count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما احتمال الأزرق؟","En":"What is the blue probability?"},{"Ar":"اضربه في 20.","En":"Multiply by twenty."}],"Solution":{"Idea":{"Ar":"نحسب احتمال الأزرق بالمتمم ثم نضرب في العدد الكلي.","En":"Find the blue probability using its complement, then multiply by the total."},"FormulaLatex":"n_B=20(1-0.35)","Steps":[{"Ar":"$1-0.35=0.65$","En":"$1-0.35=0.65$"},{"Ar":"$20\\cdot0.65=13$","En":"$20\\cdot0.65=13$"}],"Substitution":{"Ar":"$20\\cdot0.65$","En":"$20\\cdot0.65$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(20-13)/20=0.35$","En":"$(20-13)/20=0.35$"},"CommonError":{"Ar":"هذا عدد الكرات الحمراء.","En":"This is the red count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكرات الحمراء.","En":"This is the red count."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا العدد الكلي.","En":"This is the total count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال الأزرق لا عدد كراته.","En":"This is the blue probability, not its count."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v66-grade-8-polygon-interior-sum-side-addition-difference-1$mw$,$mw$polygon-interior-sum-side-addition-difference$mw$,$mw$middle-polygon-angles$mw$,$mw$grade-8$mw$,8,2,8,39,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":39,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر إضافة ضلعين إلى المضلع","En":"Effect of two more polygon sides"},"Question":{"Ar":"مضلع بسيط له n من الأضلاع حيث n لا يقل عن 3. بكم درجة يزيد مجموع الزوايا الداخلية لمضلع بسيط له n+2 ضلعاً؟","En":"A simple polygon has n sides, where n is at least three. By how many degrees does the interior angle sum of a simple polygon with n+2 sides exceed it?"},"Options":[{"LatexCode":"720","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زيادة أربعة أضلاع.","En":"This is the increase for four extra sides."}},{"LatexCode":"360","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زيادة ضلع واحد فقط.","En":"This is the increase for one extra side."}},{"LatexCode":"540","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زيادة ثلاثة أضلاع.","En":"This is the increase for three extra sides."}}],"Hints":[{"Ar":"اكتب قانون مجموع الزوايا لكل مضلع.","En":"Write the interior sum formula for each polygon."},{"Ar":"اطرح التعبيرين.","En":"Subtract the expressions."}],"Solution":{"Idea":{"Ar":"يزداد مجموع الزوايا بمقدار 180 درجة لكل ضلع إضافي.","En":"The angle sum grows by 180 degrees for each additional side."},"FormulaLatex":"180((n+2)-2)-180(n-2)","Steps":[{"Ar":"$180n-180n+360=360$","En":"$180n-180n+360=360$"}],"Substitution":{"Ar":"$180n-180(n-2)$","En":"$180n-180(n-2)$"},"Result":{"Ar":"$360$","En":"$360$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$n=3:\\ 540-180=360$","En":"$n=3:\\ 540-180=360$"},"CommonError":{"Ar":"هذه زيادة ضلع واحد فقط.","En":"This is the increase for one extra side."}}}$mw$::jsonb,$mw$يزداد مجموع الزوايا بمقدار 180 درجة لكل ضلع إضافي.

$180((n+2)-2)-180(n-2)$

1. $180n-180n+360=360$

$180n-180(n-2)$

$360$ °

$n=3:\ 540-180=360$

هذه زيادة ضلع واحد فقط.$mw$,$mw$The angle sum grows by 180 degrees for each additional side.

$180((n+2)-2)-180(n-2)$

1. $180n-180n+360=360$

$180n-180(n-2)$

$360$ °

$n=3:\ 540-180=360$

This is the increase for one extra side.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب قانون مجموع الزوايا لكل مضلع.","En":"Write the interior sum formula for each polygon."},{"Ar":"اطرح التعبيرين.","En":"Subtract the expressions."}],"Solution":{"Idea":{"Ar":"يزداد مجموع الزوايا بمقدار 180 درجة لكل ضلع إضافي.","En":"The angle sum grows by 180 degrees for each additional side."},"FormulaLatex":"180((n+2)-2)-180(n-2)","Steps":[{"Ar":"$180n-180n+360=360$","En":"$180n-180n+360=360$"}],"Substitution":{"Ar":"$180n-180(n-2)$","En":"$180n-180(n-2)$"},"Result":{"Ar":"$360$","En":"$360$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$n=3:\\ 540-180=360$","En":"$n=3:\\ 540-180=360$"},"CommonError":{"Ar":"هذه زيادة ضلع واحد فقط.","En":"This is the increase for one extra side."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه زيادة أربعة أضلاع.","En":"This is the increase for four extra sides."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه زيادة ضلع واحد فقط.","En":"This is the increase for one extra side."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه زيادة ثلاثة أضلاع.","En":"This is the increase for three extra sides."},"Order":4}]}$mw$),
($mw$growth-v66-grade-8-triangle-angles-one-angle-equals-other-two-sum-1$mw$,$mw$triangle-angles-one-angle-equals-other-two-sum$mw$,$mw$middle-triangle-angles$mw$,$mw$grade-8$mw$,8,2,8,35,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":35,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زاوية تساوي مجموع الأخريين","En":"Angle equal to the sum of the others"},"Question":{"Ar":"في مثلث، قياس الزاوية A يساوي مجموع قياسي الزاويتين B وC. ما قياس A؟","En":"In a triangle, angle A equals the sum of angles B and C. Find angle A in degrees."},"Options":[{"LatexCode":"90","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع الزوايا على أربعة.","En":"Divides the total by four."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض تساوي الزوايا الثلاث.","En":"Assumes all three angles are equal."}},{"LatexCode":"120","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يحقق الشرط لأن مجموع الأخريين 60.","En":"Fails the condition because the others sum to sixty."}}],"Hints":[{"Ar":"استبدل مجموع B وC بالزاوية A.","En":"Replace the sum of B and C with A."},{"Ar":"اقسم 180 على اثنين.","En":"Divide 180 by two."}],"Solution":{"Idea":{"Ar":"بما أن A تساوي مجموع الأخريين، فإن ضعفها يساوي 180 درجة.","En":"Since A equals the sum of the others, twice A equals 180 degrees."},"FormulaLatex":"A+(B+C)=180","Steps":[{"Ar":"$A=90$","En":"$A=90$"}],"Substitution":{"Ar":"$2A=180$","En":"$2A=180$"},"Result":{"Ar":"$90$","En":"$90$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"مثلاً الزوايا $90^\\circ,40^\\circ,50^\\circ$ تحقق الشرط والمجموع.","En":"For example, angles $90^\\circ,40^\\circ,50^\\circ$ satisfy both the condition and the total."},"CommonError":{"Ar":"قسم مجموع الزوايا على أربعة.","En":"Divides the total by four."}}}$mw$::jsonb,$mw$بما أن A تساوي مجموع الأخريين، فإن ضعفها يساوي 180 درجة.

$A+(B+C)=180$

1. $A=90$

$2A=180$

$90$ °

مثلاً الزوايا $90^\circ,40^\circ,50^\circ$ تحقق الشرط والمجموع.

قسم مجموع الزوايا على أربعة.$mw$,$mw$Since A equals the sum of the others, twice A equals 180 degrees.

$A+(B+C)=180$

1. $A=90$

$2A=180$

$90$ °

For example, angles $90^\circ,40^\circ,50^\circ$ satisfy both the condition and the total.

Divides the total by four.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبدل مجموع B وC بالزاوية A.","En":"Replace the sum of B and C with A."},{"Ar":"اقسم 180 على اثنين.","En":"Divide 180 by two."}],"Solution":{"Idea":{"Ar":"بما أن A تساوي مجموع الأخريين، فإن ضعفها يساوي 180 درجة.","En":"Since A equals the sum of the others, twice A equals 180 degrees."},"FormulaLatex":"A+(B+C)=180","Steps":[{"Ar":"$A=90$","En":"$A=90$"}],"Substitution":{"Ar":"$2A=180$","En":"$2A=180$"},"Result":{"Ar":"$90$","En":"$90$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"مثلاً الزوايا $90^\\circ,40^\\circ,50^\\circ$ تحقق الشرط والمجموع.","En":"For example, angles $90^\\circ,40^\\circ,50^\\circ$ satisfy both the condition and the total."},"CommonError":{"Ar":"قسم مجموع الزوايا على أربعة.","En":"Divides the total by four."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع الزوايا على أربعة.","En":"Divides the total by four."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"افترض تساوي الزوايا الثلاث.","En":"Assumes all three angles are equal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يحقق الشرط لأن مجموع الأخريين 60.","En":"Fails the condition because the others sum to sixty."},"Order":4}]}$mw$),
($mw$growth-v66-grade-9-grouped-data-frequency-missing-class-total-1$mw$,$mw$grouped-data-frequency-missing-class-total$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تكرار فئة مجهولة","En":"Missing grouped frequency"},"Question":{"Ar":"سجلت 25 درجة صحيحة. منها 7 بين 10 و19، و9 بين 20 و29، والباقي بين 30 و39، مع شمول الطرفين. ما تكرار الفئة الثالثة؟","En":"Twenty-five integer scores are recorded: seven from 10 to 19, nine from 20 to 29, and the rest from 30 to 39, with endpoints included. What is the frequency of the third class?"},"Options":[{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع تكراري الفئتين الأوليين.","En":"This is the sum of the first two frequencies."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الدرجات كلها.","En":"This is the total count."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا تكرار الفئة الأولى.","En":"This is the first-class frequency."}}],"Hints":[{"Ar":"اجمع التكرارين المعلومين.","En":"Add the known frequencies."},{"Ar":"اطرح الناتج من 25.","En":"Subtract the result from twenty-five."}],"Solution":{"Idea":{"Ar":"مجموع تكرارات الفئات يساوي العدد الكلي.","En":"The class frequencies sum to the total count."},"FormulaLatex":"f_3=25-(7+9)","Steps":[{"Ar":"$7+9=16$","En":"$7+9=16$"},{"Ar":"$25-16=9$","En":"$25-16=9$"}],"Substitution":{"Ar":"$25-16$","En":"$25-16$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+9+9=25$","En":"$7+9+9=25$"},"CommonError":{"Ar":"هذا تكرار الفئة الأولى.","En":"This is the first-class frequency."}}}$mw$::jsonb,$mw$مجموع تكرارات الفئات يساوي العدد الكلي.

$f_3=25-(7+9)$

1. $7+9=16$

2. $25-16=9$

$25-16$

$9$

$7+9+9=25$

هذا تكرار الفئة الأولى.$mw$,$mw$The class frequencies sum to the total count.

$f_3=25-(7+9)$

1. $7+9=16$

2. $25-16=9$

$25-16$

$9$

$7+9+9=25$

This is the first-class frequency.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع التكرارين المعلومين.","En":"Add the known frequencies."},{"Ar":"اطرح الناتج من 25.","En":"Subtract the result from twenty-five."}],"Solution":{"Idea":{"Ar":"مجموع تكرارات الفئات يساوي العدد الكلي.","En":"The class frequencies sum to the total count."},"FormulaLatex":"f_3=25-(7+9)","Steps":[{"Ar":"$7+9=16$","En":"$7+9=16$"},{"Ar":"$25-16=9$","En":"$25-16=9$"}],"Substitution":{"Ar":"$25-16$","En":"$25-16$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+9+9=25$","En":"$7+9+9=25$"},"CommonError":{"Ar":"هذا تكرار الفئة الأولى.","En":"This is the first-class frequency."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع تكراري الفئتين الأوليين.","En":"This is the sum of the first two frequencies."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الدرجات كلها.","En":"This is the total count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا تكرار الفئة الأولى.","En":"This is the first-class frequency."},"Order":4}]}$mw$);
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
