-- One-time owner-authorized v65 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v65-grade-3-number-comparison-nearest-target-three-options-1$mw$,$mw$number-comparison-nearest-target-three-options$mw$,$mw$number-comparison$mw$,$mw$grade-3$mw$,3,1,81,304,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":304,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أقرب عدد إلى هدف","En":"Nearest number to a target"},"Question":{"Ar":"أي عدد من الخيارات أقرب إلى 500؟","En":"Which listed number is closest to 500?"},"Options":[{"LatexCode":"497","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"490","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبعد 10 عن 500.","En":"Ten away from 500."}},{"LatexCode":"506","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبعد 6 عن 500.","En":"Six away from 500."}},{"LatexCode":"510","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبعد 10 عن 500.","En":"Ten away from 500."}}],"Hints":[{"Ar":"احسب الفرق عن 500 لكل خيار.","En":"Find each distance from 500."},{"Ar":"اختر أصغر فرق.","En":"Choose the smallest difference."}],"Solution":{"Idea":{"Ar":"نحسب الفرق بين كل عدد والهدف دون اعتبار اتجاه الفرق.","En":"Compare how far each number is from the target, regardless of direction."},"FormulaLatex":"500-497=3","Steps":[{"Ar":"$500-490=10$","En":"$500-490=10$"},{"Ar":"$506-500=6$","En":"$506-500=6$"},{"Ar":"$500-497=3$","En":"$500-497=3$"},{"Ar":"$510-500=10$","En":"$510-500=10$"}],"Substitution":{"Ar":"$3<6<10$","En":"$3<6<10$"},"Result":{"Ar":"$497$","En":"$497$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$497+3=500$","En":"$497+3=500$"},"CommonError":{"Ar":"يبعد 10 عن 500.","En":"Ten away from 500."}}}$mw$::jsonb,$mw$نحسب الفرق بين كل عدد والهدف دون اعتبار اتجاه الفرق.

$500-497=3$

1. $500-490=10$

2. $506-500=6$

3. $500-497=3$

4. $510-500=10$

$3<6<10$

$497$

$497+3=500$

يبعد 10 عن 500.$mw$,$mw$Compare how far each number is from the target, regardless of direction.

$500-497=3$

1. $500-490=10$

2. $506-500=6$

3. $500-497=3$

4. $510-500=10$

$3<6<10$

$497$

$497+3=500$

Ten away from 500.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"احسب الفرق عن 500 لكل خيار.","En":"Find each distance from 500."},{"Ar":"اختر أصغر فرق.","En":"Choose the smallest difference."}],"Solution":{"Idea":{"Ar":"نحسب الفرق بين كل عدد والهدف دون اعتبار اتجاه الفرق.","En":"Compare how far each number is from the target, regardless of direction."},"FormulaLatex":"500-497=3","Steps":[{"Ar":"$500-490=10$","En":"$500-490=10$"},{"Ar":"$506-500=6$","En":"$506-500=6$"},{"Ar":"$500-497=3$","En":"$500-497=3$"},{"Ar":"$510-500=10$","En":"$510-500=10$"}],"Substitution":{"Ar":"$3<6<10$","En":"$3<6<10$"},"Result":{"Ar":"$497$","En":"$497$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$497+3=500$","En":"$497+3=500$"},"CommonError":{"Ar":"يبعد 10 عن 500.","En":"Ten away from 500."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يبعد 10 عن 500.","En":"Ten away from 500."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يبعد 6 عن 500.","En":"Six away from 500."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يبعد 10 عن 500.","En":"Ten away from 500."},"Order":4}]}$mw$),
($mw$growth-v65-grade-7-experimental-frequency-infer-total-from-occurrences-1$mw$,$mw$experimental-frequency-infer-total-from-occurrences$mw$,$mw$frequency$mw$,$mw$grade-7$mw$,7,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد التجارب من التكرار النسبي","En":"Trial count from relative frequency"},"Question":{"Ar":"حدثت نتيجة معينة 18 مرة وكان تكرارها النسبي التجريبي $\\frac{3}{10}$. كم تجربة أُجريت؟","En":"An outcome occurred eighteen times with experimental relative frequency $\\frac{3}{10}$. How many trials were conducted?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على البسط فقط.","En":"Divides by the numerator alone."}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب في المقام دون القسمة على البسط.","En":"Multiplies by the denominator without dividing by the numerator."}},{"LatexCode":"60","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"54","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب عدد الحدوث في البسط فقط.","En":"Multiplies occurrences by the numerator only."}}],"Hints":[{"Ar":"اكتب التكرار النسبي على شكل كسر.","En":"Write relative frequency as a fraction."},{"Ar":"استرجع العدد الكلي بالقسمة.","En":"Recover the total by division."}],"Solution":{"Idea":{"Ar":"نقسم عدد مرات الحدوث على التكرار النسبي.","En":"Divide the occurrence count by the relative frequency."},"FormulaLatex":"n=18/(3/10)","Steps":[{"Ar":"$18/3=6$","En":"$18/3=6$"},{"Ar":"$6\\cdot10=60$","En":"$6\\cdot10=60$"}],"Substitution":{"Ar":"$18\\cdot10/3$","En":"$18\\cdot10/3$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$18/60=3/10$","En":"$18/60=3/10$"},"CommonError":{"Ar":"ضرب عدد الحدوث في البسط فقط.","En":"Multiplies occurrences by the numerator only."}}}$mw$::jsonb,$mw$نقسم عدد مرات الحدوث على التكرار النسبي.

$n=18/(3/10)$

1. $18/3=6$

2. $6\cdot10=60$

$18\cdot10/3$

$60$

$18/60=3/10$

ضرب عدد الحدوث في البسط فقط.$mw$,$mw$Divide the occurrence count by the relative frequency.

$n=18/(3/10)$

1. $18/3=6$

2. $6\cdot10=60$

$18\cdot10/3$

$60$

$18/60=3/10$

Multiplies occurrences by the numerator only.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب التكرار النسبي على شكل كسر.","En":"Write relative frequency as a fraction."},{"Ar":"استرجع العدد الكلي بالقسمة.","En":"Recover the total by division."}],"Solution":{"Idea":{"Ar":"نقسم عدد مرات الحدوث على التكرار النسبي.","En":"Divide the occurrence count by the relative frequency."},"FormulaLatex":"n=18/(3/10)","Steps":[{"Ar":"$18/3=6$","En":"$18/3=6$"},{"Ar":"$6\\cdot10=60$","En":"$6\\cdot10=60$"}],"Substitution":{"Ar":"$18\\cdot10/3$","En":"$18\\cdot10/3$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$18/60=3/10$","En":"$18/60=3/10$"},"CommonError":{"Ar":"ضرب عدد الحدوث في البسط فقط.","En":"Multiplies occurrences by the numerator only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم على البسط فقط.","En":"Divides by the numerator alone."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضرب في المقام دون القسمة على البسط.","En":"Multiplies by the denominator without dividing by the numerator."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضرب عدد الحدوث في البسط فقط.","En":"Multiplies occurrences by the numerator only."},"Order":4}]}$mw$),
($mw$growth-v65-grade-8-map-scale-two-segments-route-length-1$mw$,$mw$map-scale-two-segments-route-length$mw$,$mw$middle-map-scale$mw$,$mw$grade-8$mw$,8,2,7,33,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":33,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مسافة طريق على خريطة","En":"Route distance on a map"},"Question":{"Ar":"على خريطة بمقياس 1:50000، يتألف طريق من مقطعين طولهما على الخريطة 2.4 سم و3.6 سم. ما طول الطريق الحقيقي بالكيلومترات؟","En":"On a 1:50000 map, a route has two segments of map lengths 2.4 cm and 3.6 cm. What is the actual route length in kilometres?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ بعامل عشرة في تحويل الوحدات.","En":"Makes a factor-of-ten conversion error."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا طول الطريق على الخريطة بالسنتيمتر.","En":"This is the map route length in centimetres."}},{"LatexCode":"300","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حوّل 300000 سم إلى 3000 م ثم أخطأ عند تحويلها إلى كيلومترات.","En":"Incorrectly converts the actual centimetre distance to kilometres."}}],"Hints":[{"Ar":"اجمع الطولين على الخريطة.","En":"Add the map lengths."},{"Ar":"حول السنتيمترات الحقيقية إلى كيلومترات.","En":"Convert actual centimetres to kilometres."}],"Solution":{"Idea":{"Ar":"نجمع طولي المقطعين ثم نطبق مقياس الرسم ونحول الوحدة.","En":"Add segment lengths, apply the scale, then convert units."},"FormulaLatex":"L=(2.4+3.6)50000/100000","Steps":[{"Ar":"$2.4+3.6=6$","En":"$2.4+3.6=6$"},{"Ar":"$300000/100000=3$","En":"$300000/100000=3$"}],"Substitution":{"Ar":"$6\\cdot50000/100000$","En":"$6\\cdot50000/100000$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"كم","En":"km"},"Verification":{"Ar":"$3\\times100000=300000$ سم، وعلى الخريطة $300000/50000=6$ سم.","En":"$3\\times100000=300000$ cm; on the map, $300000/50000=6$ cm."},"CommonError":{"Ar":"أخطأ بعامل عشرة في تحويل الوحدات.","En":"Makes a factor-of-ten conversion error."}}}$mw$::jsonb,$mw$نجمع طولي المقطعين ثم نطبق مقياس الرسم ونحول الوحدة.

$L=(2.4+3.6)50000/100000$

1. $2.4+3.6=6$

2. $300000/100000=3$

$6\cdot50000/100000$

$3$ كم

$3\times100000=300000$ سم، وعلى الخريطة $300000/50000=6$ سم.

أخطأ بعامل عشرة في تحويل الوحدات.$mw$,$mw$Add segment lengths, apply the scale, then convert units.

$L=(2.4+3.6)50000/100000$

1. $2.4+3.6=6$

2. $300000/100000=3$

$6\cdot50000/100000$

$3$ km

$3\times100000=300000$ cm; on the map, $300000/50000=6$ cm.

Makes a factor-of-ten conversion error.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع الطولين على الخريطة.","En":"Add the map lengths."},{"Ar":"حول السنتيمترات الحقيقية إلى كيلومترات.","En":"Convert actual centimetres to kilometres."}],"Solution":{"Idea":{"Ar":"نجمع طولي المقطعين ثم نطبق مقياس الرسم ونحول الوحدة.","En":"Add segment lengths, apply the scale, then convert units."},"FormulaLatex":"L=(2.4+3.6)50000/100000","Steps":[{"Ar":"$2.4+3.6=6$","En":"$2.4+3.6=6$"},{"Ar":"$300000/100000=3$","En":"$300000/100000=3$"}],"Substitution":{"Ar":"$6\\cdot50000/100000$","En":"$6\\cdot50000/100000$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"كم","En":"km"},"Verification":{"Ar":"$3\\times100000=300000$ سم، وعلى الخريطة $300000/50000=6$ سم.","En":"$3\\times100000=300000$ cm; on the map, $300000/50000=6$ cm."},"CommonError":{"Ar":"أخطأ بعامل عشرة في تحويل الوحدات.","En":"Makes a factor-of-ten conversion error."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أخطأ بعامل عشرة في تحويل الوحدات.","En":"Makes a factor-of-ten conversion error."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا طول الطريق على الخريطة بالسنتيمتر.","En":"This is the map route length in centimetres."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حوّل 300000 سم إلى 3000 م ثم أخطأ عند تحويلها إلى كيلومترات.","En":"Incorrectly converts the actual centimetre distance to kilometres."},"Order":4}]}$mw$),
($mw$growth-v65-grade-8-percent-increase-reverse-new-price-known-rate-1$mw$,$mw$percent-increase-reverse-new-price-known-rate$mw$,$mw$middle-percent-increase$mw$,$mw$grade-8$mw$,8,2,7,34,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":34,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع السعر قبل الزيادة","En":"Recovering a price before increase"},"Question":{"Ar":"أصبح سعر سلعة 138 وحدة نقدية بعد زيادة نسبتها 15%. ما السعر قبل الزيادة؟","En":"An item costs 138 currency units after a 15% increase. What was its original price?"},"Options":[{"LatexCode":"117.3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 15% من السعر الجديد.","En":"Subtracts 15% of the new price."}},{"LatexCode":"123","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 15 وحدة نقدية بدلاً من نسبة.","En":"Subtracts fifteen currency units instead of a percentage."}},{"LatexCode":"158.7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاد السعر الجديد مرة أخرى بنسبة 15%.","En":"Increases the new price by another 15%."}},{"LatexCode":"120","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"حوّل 115% إلى عدد عشري.","En":"Convert 115% to a decimal."},{"Ar":"اقسم السعر الجديد على عامل الزيادة.","En":"Divide the new price by the increase factor."}],"Solution":{"Idea":{"Ar":"السعر الجديد يساوي 115% من السعر الأصلي.","En":"The new price equals 115% of the original."},"FormulaLatex":"1.15x=138","Steps":[{"Ar":"$x=120$","En":"$x=120$"}],"Substitution":{"Ar":"$138/1.15$","En":"$138/1.15$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"وحدة نقدية","En":"currency units"},"Verification":{"Ar":"$120\\cdot1.15=138$","En":"$120\\cdot1.15=138$"},"CommonError":{"Ar":"طرح 15% من السعر الجديد.","En":"Subtracts 15% of the new price."}}}$mw$::jsonb,$mw$السعر الجديد يساوي 115% من السعر الأصلي.

$1.15x=138$

1. $x=120$

$138/1.15$

$120$ وحدة نقدية

$120\cdot1.15=138$

طرح 15% من السعر الجديد.$mw$,$mw$The new price equals 115% of the original.

$1.15x=138$

1. $x=120$

$138/1.15$

$120$ currency units

$120\cdot1.15=138$

Subtracts 15% of the new price.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل 115% إلى عدد عشري.","En":"Convert 115% to a decimal."},{"Ar":"اقسم السعر الجديد على عامل الزيادة.","En":"Divide the new price by the increase factor."}],"Solution":{"Idea":{"Ar":"السعر الجديد يساوي 115% من السعر الأصلي.","En":"The new price equals 115% of the original."},"FormulaLatex":"1.15x=138","Steps":[{"Ar":"$x=120$","En":"$x=120$"}],"Substitution":{"Ar":"$138/1.15$","En":"$138/1.15$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"وحدة نقدية","En":"currency units"},"Verification":{"Ar":"$120\\cdot1.15=138$","En":"$120\\cdot1.15=138$"},"CommonError":{"Ar":"طرح 15% من السعر الجديد.","En":"Subtracts 15% of the new price."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 15% من السعر الجديد.","En":"Subtracts 15% of the new price."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 15 وحدة نقدية بدلاً من نسبة.","En":"Subtracts fifteen currency units instead of a percentage."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"زاد السعر الجديد مرة أخرى بنسبة 15%.","En":"Increases the new price by another 15%."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
