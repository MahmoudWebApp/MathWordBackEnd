-- One-time owner-authorized v59 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v59-grade-4-equivalent-fraction-common-scale-both-unknown-1$mw$,$mw$equivalent-fraction-common-scale-both-unknown$mw$,$mw$p-fractions-decimals-equivalence$mw$,$mw$grade-4$mw$,4,1,21,96,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":96,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كسر مكافئ بمجموع معلوم","En":"Equivalent fraction with a known total"},"Question":{"Ar":"أي كسر يساوي $\\frac23$ ومجموع بسطه ومقامه 25؟","En":"Which fraction equals $\\frac23$ and has numerator plus denominator equal to 25?"},"Options":[{"LatexCode":"\\frac{15}{10}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مقلوب الكسر المطلوب.","En":"The reciprocal of the required fraction."}},{"LatexCode":"\\frac{10}{15}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac8{12}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"كسر مكافئ لكن مجموع العددين 20.","En":"Equivalent but the sum is twenty."}},{"LatexCode":"\\frac{12}{13}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموعه 25 لكن النسبة مختلفة.","En":"The sum is twenty-five but the ratio differs."}}],"Hints":[{"Ar":"كم مجموع 2 و3؟","En":"What is two plus three?"},{"Ar":"أوجد عامل التكبير المشترك.","En":"Find the common scaling factor."}],"Solution":{"Idea":{"Ar":"نضرب البسط والمقام في العدد نفسه حتى يصبح مجموعهما 25.","En":"Multiply both terms by the same number until their sum is twenty-five."},"FormulaLatex":"(2+3)k=25","Steps":[{"Ar":"$k=5$","En":"$k=5$"},{"Ar":"$2\\cdot5=10,\\quad3\\cdot5=15$","En":"$2\\cdot5=10,\\quad3\\cdot5=15$"}],"Substitution":{"Ar":"$k=25/5$","En":"$k=25/5$"},"Result":{"Ar":"$\\frac{10}{15}$","En":"$\\frac{10}{15}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10+15=25,\\quad10/15=2/3$","En":"$10+15=25,\\quad10/15=2/3$"},"CommonError":{"Ar":"كسر مكافئ لكن مجموع العددين 20.","En":"Equivalent but the sum is twenty."}}}$mw$::jsonb,$mw$نضرب البسط والمقام في العدد نفسه حتى يصبح مجموعهما 25.

$(2+3)k=25$

1. $k=5$

2. $2\cdot5=10,\quad3\cdot5=15$

$k=25/5$

$\frac{10}{15}$

$10+15=25,\quad10/15=2/3$

كسر مكافئ لكن مجموع العددين 20.$mw$,$mw$Multiply both terms by the same number until their sum is twenty-five.

$(2+3)k=25$

1. $k=5$

2. $2\cdot5=10,\quad3\cdot5=15$

$k=25/5$

$\frac{10}{15}$

$10+15=25,\quad10/15=2/3$

Equivalent but the sum is twenty.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم مجموع 2 و3؟","En":"What is two plus three?"},{"Ar":"أوجد عامل التكبير المشترك.","En":"Find the common scaling factor."}],"Solution":{"Idea":{"Ar":"نضرب البسط والمقام في العدد نفسه حتى يصبح مجموعهما 25.","En":"Multiply both terms by the same number until their sum is twenty-five."},"FormulaLatex":"(2+3)k=25","Steps":[{"Ar":"$k=5$","En":"$k=5$"},{"Ar":"$2\\cdot5=10,\\quad3\\cdot5=15$","En":"$2\\cdot5=10,\\quad3\\cdot5=15$"}],"Substitution":{"Ar":"$k=25/5$","En":"$k=25/5$"},"Result":{"Ar":"$\\frac{10}{15}$","En":"$\\frac{10}{15}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10+15=25,\\quad10/15=2/3$","En":"$10+15=25,\\quad10/15=2/3$"},"CommonError":{"Ar":"كسر مكافئ لكن مجموع العددين 20.","En":"Equivalent but the sum is twenty."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مقلوب الكسر المطلوب.","En":"The reciprocal of the required fraction."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"كسر مكافئ لكن مجموع العددين 20.","En":"Equivalent but the sum is twenty."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مجموعه 25 لكن النسبة مختلفة.","En":"The sum is twenty-five but the ratio differs."},"Order":4}]}$mw$),
($mw$growth-v59-grade-9-quadratic-function-output-difference-shift-1$mw$,$mw$quadratic-function-output-difference-shift$mw$,$mw$middle-quadratic-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,27,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":27,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق قيم دالة تربيعية","En":"Difference of quadratic values"},"Question":{"Ar":"إذا كانت $g(x)=x^2+4$، فما قيمة $g(6)-g(5)$؟","En":"If $g(x)=x^2+4$, find $g(6)-g(5)$."},"Options":[{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق المدخلين.","En":"This is the input difference."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الثابت بعد حساب الفرق.","En":"Adds the constant after taking the difference."}},{"LatexCode":"61","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المربعين بدلاً من طرحهما.","En":"Adds squares rather than subtracting."}}],"Hints":[{"Ar":"احسب مربع كل مدخل.","En":"Square each input."},{"Ar":"اطرح القيمتين لا المدخلين.","En":"Subtract the outputs, not the inputs."}],"Solution":{"Idea":{"Ar":"نحسب قيمتي الدالة ثم نطرح، فيلغى الثابت.","En":"Evaluate both function values and subtract; the constant cancels."},"FormulaLatex":"g(6)-g(5)=(36+4)-(25+4)","Steps":[{"Ar":"$40-29=11$","En":"$40-29=11$"}],"Substitution":{"Ar":"$40-29$","En":"$40-29$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6^2-5^2=(6-5)(6+5)=11$","En":"$6^2-5^2=(6-5)(6+5)=11$"},"CommonError":{"Ar":"هذا فرق المدخلين.","En":"This is the input difference."}}}$mw$::jsonb,$mw$نحسب قيمتي الدالة ثم نطرح، فيلغى الثابت.

$g(6)-g(5)=(36+4)-(25+4)$

1. $40-29=11$

$40-29$

$11$

$6^2-5^2=(6-5)(6+5)=11$

هذا فرق المدخلين.$mw$,$mw$Evaluate both function values and subtract; the constant cancels.

$g(6)-g(5)=(36+4)-(25+4)$

1. $40-29=11$

$40-29$

$11$

$6^2-5^2=(6-5)(6+5)=11$

This is the input difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مربع كل مدخل.","En":"Square each input."},{"Ar":"اطرح القيمتين لا المدخلين.","En":"Subtract the outputs, not the inputs."}],"Solution":{"Idea":{"Ar":"نحسب قيمتي الدالة ثم نطرح، فيلغى الثابت.","En":"Evaluate both function values and subtract; the constant cancels."},"FormulaLatex":"g(6)-g(5)=(36+4)-(25+4)","Steps":[{"Ar":"$40-29=11$","En":"$40-29=11$"}],"Substitution":{"Ar":"$40-29$","En":"$40-29$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6^2-5^2=(6-5)(6+5)=11$","En":"$6^2-5^2=(6-5)(6+5)=11$"},"CommonError":{"Ar":"هذا فرق المدخلين.","En":"This is the input difference."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق المدخلين.","En":"This is the input difference."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الثابت بعد حساب الفرق.","En":"Adds the constant after taking the difference."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع المربعين بدلاً من طرحهما.","En":"Adds squares rather than subtracting."},"Order":4}]}$mw$),
($mw$growth-v59-grade-9-quadratic-input-two-symmetric-solutions-1$mw$,$mw$quadratic-input-two-symmetric-solutions$mw$,$mw$middle-inverse-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,28,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":28,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مدخلان لقيمة واحدة","En":"Two inputs for one output"},"Question":{"Ar":"إذا كانت $f(x)=x^2-7$، فأي مجموعة تضم جميع المدخلات الحقيقية التي تحقق $f(x)=18$؟","En":"If $f(x)=x^2-7$, which set contains all real inputs satisfying $f(x)=18$?"},"Options":[{"LatexCode":"\\{5\\}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الجذر السالب.","En":"Omits the negative root."}},{"LatexCode":"\\{-5\\}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الجذر الموجب.","En":"Omits the positive root."}},{"LatexCode":"\\{-25,25\\}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يأخذ الجذر التربيعي.","En":"Does not take the square root."}},{"LatexCode":"\\{-5,5\\}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"أضف 7 إلى الطرفين.","En":"Add seven to both sides."},{"Ar":"تذكر إشارتي الجذر.","En":"Remember both square-root signs."}],"Solution":{"Idea":{"Ar":"نحول شرط قيمة الدالة إلى معادلة تربيعية.","En":"Turn the given output into a quadratic equation."},"FormulaLatex":"x^2-7=18","Steps":[{"Ar":"$x=\\pm5$","En":"$x=\\pm5$"}],"Substitution":{"Ar":"$x^2=25$","En":"$x^2=25$"},"Result":{"Ar":"$\\{-5,5\\}$","En":"$\\{-5,5\\}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(5)=f(-5)=25-7=18$","En":"$f(5)=f(-5)=25-7=18$"},"CommonError":{"Ar":"أهمل الجذر السالب.","En":"Omits the negative root."}}}$mw$::jsonb,$mw$نحول شرط قيمة الدالة إلى معادلة تربيعية.

$x^2-7=18$

1. $x=\pm5$

$x^2=25$

$\{-5,5\}$

$f(5)=f(-5)=25-7=18$

أهمل الجذر السالب.$mw$,$mw$Turn the given output into a quadratic equation.

$x^2-7=18$

1. $x=\pm5$

$x^2=25$

$\{-5,5\}$

$f(5)=f(-5)=25-7=18$

Omits the negative root.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أضف 7 إلى الطرفين.","En":"Add seven to both sides."},{"Ar":"تذكر إشارتي الجذر.","En":"Remember both square-root signs."}],"Solution":{"Idea":{"Ar":"نحول شرط قيمة الدالة إلى معادلة تربيعية.","En":"Turn the given output into a quadratic equation."},"FormulaLatex":"x^2-7=18","Steps":[{"Ar":"$x=\\pm5$","En":"$x=\\pm5$"}],"Substitution":{"Ar":"$x^2=25$","En":"$x^2=25$"},"Result":{"Ar":"$\\{-5,5\\}$","En":"$\\{-5,5\\}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(5)=f(-5)=25-7=18$","En":"$f(5)=f(-5)=25-7=18$"},"CommonError":{"Ar":"أهمل الجذر السالب.","En":"Omits the negative root."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الجذر السالب.","En":"Omits the negative root."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الجذر الموجب.","En":"Omits the positive root."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لم يأخذ الجذر التربيعي.","En":"Does not take the square root."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v59-grade-4-multiplicative-two-pack-sizes-compare-total-1$mw$,$mw$multiplicative-two-pack-sizes-compare-total$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-4$mw$,4,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة مجموعتي عبوات","En":"Comparing two sets of packs"},"Question":{"Ar":"لدى متجر 6 صناديق تحوي 14 كرة في كل منها، ولدى متجر آخر 8 صناديق تحوي 12 كرة في كل منها. بكم تزيد كرات المتجر الثاني؟","En":"One shop has six boxes of fourteen balls each. Another has eight boxes of twelve balls each. How many more balls does the second shop have?"},"Options":[{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع العددين الكليين.","En":"Adds the two totals."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن عدد الصناديق فقط.","En":"Compares box counts only."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكرات في صندوق من المتجر الأول.","En":"This is one first-shop box's ball count."}}],"Hints":[{"Ar":"احسب عدد كرات كل متجر.","En":"Calculate each shop's total."},{"Ar":"اطرح الأصغر من الأكبر.","En":"Subtract the smaller from the larger."}],"Solution":{"Idea":{"Ar":"نحسب حاصل ضرب عدد الصناديق في محتوى الصندوق لكل متجر ثم نطرح.","En":"Multiply box count by box contents for each shop, then subtract."},"FormulaLatex":"8\\cdot12-6\\cdot14","Steps":[{"Ar":"$8\\cdot12=96$","En":"$8\\cdot12=96$"},{"Ar":"$6\\cdot14=84$","En":"$6\\cdot14=84$"},{"Ar":"$96-84=12$","En":"$96-84=12$"}],"Substitution":{"Ar":"$96-84$","En":"$96-84$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$84+12=96$","En":"$84+12=96$"},"CommonError":{"Ar":"قارن عدد الصناديق فقط.","En":"Compares box counts only."}}}$mw$::jsonb,$mw$نحسب حاصل ضرب عدد الصناديق في محتوى الصندوق لكل متجر ثم نطرح.

$8\cdot12-6\cdot14$

1. $8\cdot12=96$

2. $6\cdot14=84$

3. $96-84=12$

$96-84$

$12$

$84+12=96$

قارن عدد الصناديق فقط.$mw$,$mw$Multiply box count by box contents for each shop, then subtract.

$8\cdot12-6\cdot14$

1. $8\cdot12=96$

2. $6\cdot14=84$

3. $96-84=12$

$96-84$

$12$

$84+12=96$

Compares box counts only.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد كرات كل متجر.","En":"Calculate each shop's total."},{"Ar":"اطرح الأصغر من الأكبر.","En":"Subtract the smaller from the larger."}],"Solution":{"Idea":{"Ar":"نحسب حاصل ضرب عدد الصناديق في محتوى الصندوق لكل متجر ثم نطرح.","En":"Multiply box count by box contents for each shop, then subtract."},"FormulaLatex":"8\\cdot12-6\\cdot14","Steps":[{"Ar":"$8\\cdot12=96$","En":"$8\\cdot12=96$"},{"Ar":"$6\\cdot14=84$","En":"$6\\cdot14=84$"},{"Ar":"$96-84=12$","En":"$96-84=12$"}],"Substitution":{"Ar":"$96-84$","En":"$96-84$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$84+12=96$","En":"$84+12=96$"},"CommonError":{"Ar":"قارن عدد الصناديق فقط.","En":"Compares box counts only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع العددين الكليين.","En":"Adds the two totals."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قارن عدد الصناديق فقط.","En":"Compares box counts only."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكرات في صندوق من المتجر الأول.","En":"This is one first-shop box's ball count."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v59 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
