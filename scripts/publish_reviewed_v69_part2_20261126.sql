-- One-time owner-authorized v69 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v69-grade-10-arithmetic-reversal-common-difference-1$mw$,$mw$arithmetic-reversal-common-difference$mw$,$mw$s-sequences-series-arithmetic-sequences$mw$,$mw$grade-10$mw$,10,3,23,104,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":104,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عكس ترتيب الحدود","En":"Reversing an arithmetic sequence"},"Question":{"Ar":"ثمانية حدود متتالية من متتالية حسابية فرقها 5 كُتبت بترتيب عكسي. ما الفرق المشترك بعد العكس؟","En":"Eight consecutive terms of an arithmetic sequence with difference five are written in reverse order. What is the resulting common difference?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أبقى اتجاه الطرح الأصلي.","En":"Keeps the original subtraction direction."}},{"LatexCode":"-5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب فرق الطرفين بدلاً من فرق حدين متجاورين.","En":"Uses the endpoint gap rather than an adjacent gap."}},{"LatexCode":"\\frac15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ المقلوب بدلاً من تغيير الإشارة.","En":"Takes the reciprocal instead of reversing the sign."}}],"Hints":[{"Ar":"اكتب حدين متتاليين أصليين.","En":"Write two adjacent original terms."},{"Ar":"اعكس ترتيب طرحهما.","En":"Reverse the subtraction order."}],"Solution":{"Idea":{"Ar":"الحد السابق ناقص الحد اللاحق في الترتيب الأصلي يساوي سالب الفرق المشترك.","En":"The previous term minus the next in the original order is the negative common difference."},"FormulaLatex":"a_n-a_{n+1}=-d","Steps":[{"Ar":"$-d=-5$","En":"$-d=-5$"}],"Substitution":{"Ar":"$a_n-a_{n+1}=-d$","En":"$a_n-a_{n+1}=-d$"},"Result":{"Ar":"$-5$","En":"$-5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مثلاً 10،15 تصبح 15،10، والفرق $10-15=-5$.","En":"For example 10,15 becomes 15,10, giving $10-15=-5$."},"CommonError":{"Ar":"أبقى اتجاه الطرح الأصلي.","En":"Keeps the original subtraction direction."}}}$mw$::jsonb,$mw$الحد السابق ناقص الحد اللاحق في الترتيب الأصلي يساوي سالب الفرق المشترك.

$a_n-a_{n+1}=-d$

1. $-d=-5$

$a_n-a_{n+1}=-d$

$-5$

مثلاً 10،15 تصبح 15،10، والفرق $10-15=-5$.

أبقى اتجاه الطرح الأصلي.$mw$,$mw$The previous term minus the next in the original order is the negative common difference.

$a_n-a_{n+1}=-d$

1. $-d=-5$

$a_n-a_{n+1}=-d$

$-5$

For example 10,15 becomes 15,10, giving $10-15=-5$.

Keeps the original subtraction direction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب حدين متتاليين أصليين.","En":"Write two adjacent original terms."},{"Ar":"اعكس ترتيب طرحهما.","En":"Reverse the subtraction order."}],"Solution":{"Idea":{"Ar":"الحد السابق ناقص الحد اللاحق في الترتيب الأصلي يساوي سالب الفرق المشترك.","En":"The previous term minus the next in the original order is the negative common difference."},"FormulaLatex":"a_n-a_{n+1}=-d","Steps":[{"Ar":"$-d=-5$","En":"$-d=-5$"}],"Substitution":{"Ar":"$a_n-a_{n+1}=-d$","En":"$a_n-a_{n+1}=-d$"},"Result":{"Ar":"$-5$","En":"$-5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مثلاً 10،15 تصبح 15،10، والفرق $10-15=-5$.","En":"For example 10,15 becomes 15,10, giving $10-15=-5$."},"CommonError":{"Ar":"أبقى اتجاه الطرح الأصلي.","En":"Keeps the original subtraction direction."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أبقى اتجاه الطرح الأصلي.","En":"Keeps the original subtraction direction."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب فرق الطرفين بدلاً من فرق حدين متجاورين.","En":"Uses the endpoint gap rather than an adjacent gap."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أخذ المقلوب بدلاً من تغيير الإشارة.","En":"Takes the reciprocal instead of reversing the sign."},"Order":4}]}$mw$),
($mw$growth-v69-grade-10-geometric-reciprocal-transform-ratio-1$mw$,$mw$geometric-reciprocal-transform-ratio$mw$,$mw$s-sequences-series-geometric-sequences$mw$,$mw$grade-10$mw$,10,3,23,103,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":103,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقلوبات حدود متتالية هندسية","En":"Reciprocals of geometric terms"},"Question":{"Ar":"متتالية هندسية حدودها غير صفرية وأساسها -4. نأخذ مقلوب كل حد بنفس الترتيب. ما أساس المتتالية الناتجة؟","En":"A geometric sequence has nonzero terms and common ratio -4. Take the reciprocal of each term in the same order. What is the new ratio?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"غير الإشارة دون أخذ المقلوب.","En":"Changes sign without taking reciprocal."}},{"LatexCode":"-4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يغير الأساس.","En":"Keeps the original ratio."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فقد الإشارة السالبة.","En":"Loses the negative sign."}},{"LatexCode":"-\\frac14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اكتب نسبة حدين من المقلوبات.","En":"Write the ratio of two reciprocal terms."},{"Ar":"حوّل قسمة الكسور إلى ضرب.","En":"Convert division of fractions to multiplication."}],"Solution":{"Idea":{"Ar":"نسبة المقلوبين تساوي مقلوب نسبة الحدين الأصليين.","En":"The ratio of reciprocal terms is the reciprocal of the original ratio."},"FormulaLatex":"\\frac{1/a_{n+1}}{1/a_n}=\\frac{a_n}{a_{n+1}}","Steps":[{"Ar":"$r' =1/r$","En":"$r' =1/r$"},{"Ar":"$r'=-1/4$","En":"$r'=-1/4$"}],"Substitution":{"Ar":"$\\frac{1/a_{n+1}}{1/a_n}=\\frac{a_n}{a_{n+1}}$","En":"$\\frac{1/a_{n+1}}{1/a_n}=\\frac{a_n}{a_{n+1}}$"},"Result":{"Ar":"$-\\frac14$","En":"$-\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان 2 و-8 يعطيان المقلوبين $1/2,-1/8$، ونسبتهما $-1/4$.","En":"Terms 2 and -8 give reciprocals $1/2,-1/8$, with ratio $-1/4$."},"CommonError":{"Ar":"غير الإشارة دون أخذ المقلوب.","En":"Changes sign without taking reciprocal."}}}$mw$::jsonb,$mw$نسبة المقلوبين تساوي مقلوب نسبة الحدين الأصليين.

$\frac{1/a_{n+1}}{1/a_n}=\frac{a_n}{a_{n+1}}$

1. $r' =1/r$

2. $r'=-1/4$

$\frac{1/a_{n+1}}{1/a_n}=\frac{a_n}{a_{n+1}}$

$-\frac14$

الحدان 2 و-8 يعطيان المقلوبين $1/2,-1/8$، ونسبتهما $-1/4$.

غير الإشارة دون أخذ المقلوب.$mw$,$mw$The ratio of reciprocal terms is the reciprocal of the original ratio.

$\frac{1/a_{n+1}}{1/a_n}=\frac{a_n}{a_{n+1}}$

1. $r' =1/r$

2. $r'=-1/4$

$\frac{1/a_{n+1}}{1/a_n}=\frac{a_n}{a_{n+1}}$

$-\frac14$

Terms 2 and -8 give reciprocals $1/2,-1/8$, with ratio $-1/4$.

Changes sign without taking reciprocal.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب نسبة حدين من المقلوبات.","En":"Write the ratio of two reciprocal terms."},{"Ar":"حوّل قسمة الكسور إلى ضرب.","En":"Convert division of fractions to multiplication."}],"Solution":{"Idea":{"Ar":"نسبة المقلوبين تساوي مقلوب نسبة الحدين الأصليين.","En":"The ratio of reciprocal terms is the reciprocal of the original ratio."},"FormulaLatex":"\\frac{1/a_{n+1}}{1/a_n}=\\frac{a_n}{a_{n+1}}","Steps":[{"Ar":"$r' =1/r$","En":"$r' =1/r$"},{"Ar":"$r'=-1/4$","En":"$r'=-1/4$"}],"Substitution":{"Ar":"$\\frac{1/a_{n+1}}{1/a_n}=\\frac{a_n}{a_{n+1}}$","En":"$\\frac{1/a_{n+1}}{1/a_n}=\\frac{a_n}{a_{n+1}}$"},"Result":{"Ar":"$-\\frac14$","En":"$-\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان 2 و-8 يعطيان المقلوبين $1/2,-1/8$، ونسبتهما $-1/4$.","En":"Terms 2 and -8 give reciprocals $1/2,-1/8$, with ratio $-1/4$."},"CommonError":{"Ar":"غير الإشارة دون أخذ المقلوب.","En":"Changes sign without taking reciprocal."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"غير الإشارة دون أخذ المقلوب.","En":"Changes sign without taking reciprocal."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لم يغير الأساس.","En":"Keeps the original ratio."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"فقد الإشارة السالبة.","En":"Loses the negative sign."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v69-grade-10-geometric-interleaved-even-subsequence-ratio-1$mw$,$mw$geometric-interleaved-even-subsequence-ratio$mw$,$mw$s-sequences-series-geometric-sequences$mw$,$mw$grade-10$mw$,10,3,23,103,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":103,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أساس الحدود الزوجية","En":"Ratio of even-index terms"},"Question":{"Ar":"متتالية هندسية أساسها $-2$ وحدها الأول غير صفري. نختار $a_2,a_4,a_6,\\ldots$. ما أساس المتتالية المختارة؟","En":"A geometric sequence has ratio $-2$ and a nonzero first term. Select $a_2,a_4,a_6,\\ldots$. What is the ratio of the selected sequence?"},"Options":[{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل خطوة واحدة.","En":"Uses just one original step."}},{"LatexCode":"-4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربع الأساس دون تصحيح الإشارة.","En":"Squares the magnitude but retains a negative sign."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ القيمة المطلقة دون تربيع.","En":"Takes absolute value without squaring."}}],"Hints":[{"Ar":"احسب عدد الخطوات بين الحدين المختارين.","En":"Count original steps between selected terms."},{"Ar":"طبق عامل الضرب لكل خطوة.","En":"Apply the factor once per step."}],"Solution":{"Idea":{"Ar":"بين حدين مختارين خطوتان، لذا نضرب في الأساس مرتين.","En":"There are two original steps between selected terms, so multiply by the ratio twice."},"FormulaLatex":"a_{n+2}=r^2a_n","Steps":[{"Ar":"$r'=(-2)^2=4$","En":"$r'=(-2)^2=4$"}],"Substitution":{"Ar":"$a_{n+2}=r^2a_n$","En":"$a_{n+2}=r^2a_n$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا كان $a_2=3$ فإن $a_4=12$ و$a_6=48$.","En":"If $a_2=3$, then $a_4=12$ and $a_6=48$."},"CommonError":{"Ar":"استعمل خطوة واحدة.","En":"Uses just one original step."}}}$mw$::jsonb,$mw$بين حدين مختارين خطوتان، لذا نضرب في الأساس مرتين.

$a_{n+2}=r^2a_n$

1. $r'=(-2)^2=4$

$a_{n+2}=r^2a_n$

$4$

إذا كان $a_2=3$ فإن $a_4=12$ و$a_6=48$.

استعمل خطوة واحدة.$mw$,$mw$There are two original steps between selected terms, so multiply by the ratio twice.

$a_{n+2}=r^2a_n$

1. $r'=(-2)^2=4$

$a_{n+2}=r^2a_n$

$4$

If $a_2=3$, then $a_4=12$ and $a_6=48$.

Uses just one original step.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد الخطوات بين الحدين المختارين.","En":"Count original steps between selected terms."},{"Ar":"طبق عامل الضرب لكل خطوة.","En":"Apply the factor once per step."}],"Solution":{"Idea":{"Ar":"بين حدين مختارين خطوتان، لذا نضرب في الأساس مرتين.","En":"There are two original steps between selected terms, so multiply by the ratio twice."},"FormulaLatex":"a_{n+2}=r^2a_n","Steps":[{"Ar":"$r'=(-2)^2=4$","En":"$r'=(-2)^2=4$"}],"Substitution":{"Ar":"$a_{n+2}=r^2a_n$","En":"$a_{n+2}=r^2a_n$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا كان $a_2=3$ فإن $a_4=12$ و$a_6=48$.","En":"If $a_2=3$, then $a_4=12$ and $a_6=48$."},"CommonError":{"Ar":"استعمل خطوة واحدة.","En":"Uses just one original step."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل خطوة واحدة.","En":"Uses just one original step."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ربع الأساس دون تصحيح الإشارة.","En":"Squares the magnitude but retains a negative sign."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أخذ القيمة المطلقة دون تربيع.","En":"Takes absolute value without squaring."},"Order":4}]}$mw$),
($mw$growth-v69-grade-9-pythagorean-altitude-to-hypotenuse-area-1$mw$,$mw$pythagorean-altitude-to-hypotenuse-area$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ارتفاع على الوتر","En":"Altitude to the hypotenuse"},"Question":{"Ar":"مثلث قائم ضلعاه القائمان 6 و8 سم ووتره 10 سم. ما ارتفاعه العمودي على الوتر بالسنتيمتر؟","En":"A right triangle has legs 6 and 8 cm and hypotenuse 10 cm. Find its perpendicular altitude to the hypotenuse in centimetres."},"Options":[{"LatexCode":"4.8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2.4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم المساحة على الوتر دون مضاعفتها.","En":"Divides area by hypotenuse without doubling."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل أحد الضلعين القائمين مباشرة.","En":"Uses one leg directly."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الضلع القائم الآخر مباشرة.","En":"Uses the other leg directly."}}],"Hints":[{"Ar":"احسب مساحة المثلث من الضلعين القائمين.","En":"Compute the area from the legs."},{"Ar":"اعتبر الوتر قاعدة للمساحة نفسها.","En":"Use the hypotenuse as base for the same area."}],"Solution":{"Idea":{"Ar":"نحسب المساحة بطريقتين باستخدام الضلعين القائمين ثم الوتر والارتفاع.","En":"Express area using the legs and using the hypotenuse with its altitude."},"FormulaLatex":"\\frac12(6)(8)=\\frac12(10)h","Steps":[{"Ar":"$24=5h$","En":"$24=5h$"},{"Ar":"$h=4.8$","En":"$h=4.8$"}],"Substitution":{"Ar":"$\\frac12(6)(8)=\\frac12(10)h$","En":"$\\frac12(6)(8)=\\frac12(10)h$"},"Result":{"Ar":"$4.8$","En":"$4.8$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$10\\cdot4.8/2=24$.","En":"$10\\cdot4.8/2=24$."},"CommonError":{"Ar":"قسم المساحة على الوتر دون مضاعفتها.","En":"Divides area by hypotenuse without doubling."}}}$mw$::jsonb,$mw$نحسب المساحة بطريقتين باستخدام الضلعين القائمين ثم الوتر والارتفاع.

$\frac12(6)(8)=\frac12(10)h$

1. $24=5h$

2. $h=4.8$

$\frac12(6)(8)=\frac12(10)h$

$4.8$

سم

$10\cdot4.8/2=24$.

قسم المساحة على الوتر دون مضاعفتها.$mw$,$mw$Express area using the legs and using the hypotenuse with its altitude.

$\frac12(6)(8)=\frac12(10)h$

1. $24=5h$

2. $h=4.8$

$\frac12(6)(8)=\frac12(10)h$

$4.8$

cm

$10\cdot4.8/2=24$.

Divides area by hypotenuse without doubling.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مساحة المثلث من الضلعين القائمين.","En":"Compute the area from the legs."},{"Ar":"اعتبر الوتر قاعدة للمساحة نفسها.","En":"Use the hypotenuse as base for the same area."}],"Solution":{"Idea":{"Ar":"نحسب المساحة بطريقتين باستخدام الضلعين القائمين ثم الوتر والارتفاع.","En":"Express area using the legs and using the hypotenuse with its altitude."},"FormulaLatex":"\\frac12(6)(8)=\\frac12(10)h","Steps":[{"Ar":"$24=5h$","En":"$24=5h$"},{"Ar":"$h=4.8$","En":"$h=4.8$"}],"Substitution":{"Ar":"$\\frac12(6)(8)=\\frac12(10)h$","En":"$\\frac12(6)(8)=\\frac12(10)h$"},"Result":{"Ar":"$4.8$","En":"$4.8$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$10\\cdot4.8/2=24$.","En":"$10\\cdot4.8/2=24$."},"CommonError":{"Ar":"قسم المساحة على الوتر دون مضاعفتها.","En":"Divides area by hypotenuse without doubling."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم المساحة على الوتر دون مضاعفتها.","En":"Divides area by hypotenuse without doubling."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل أحد الضلعين القائمين مباشرة.","En":"Uses one leg directly."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الضلع القائم الآخر مباشرة.","En":"Uses the other leg directly."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v69 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
