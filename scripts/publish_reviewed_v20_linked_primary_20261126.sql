-- One-time owner-authorized import AND publication from reviewed launch-primary-v20.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v20-grade-1-count-events-by-tapping-once-per-picture-1$mw$,$mw$count-events-by-tapping-once-per-picture$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عدّ النقرات","En":"Counting taps"},"Question":{"Ar":"أمام نور أربعة رسوم لطيور وثلاثة رسوم لأشجار. نقرت مرة واحدة على كل طائر، ومرتين على كل شجرة. كم نقرة نفّذت؟","En":"Nour sees four bird pictures and three tree pictures. She taps each bird once and each tree twice. How many taps does she make?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الرسوم فقط.","En":"Counts pictures only."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ نقرات الأشجار فقط.","En":"Counts only tree taps."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب نقرة زائدة.","En":"Counts one extra tap."}}],"Hints":[{"Ar":"لكل طائر نقرة واحدة ولكل شجرة نقرتان.","En":"Each bird gets one tap and each tree gets two."},{"Ar":"عدّ نقرة لكل طائر، ثم قفزتين في العد لكل شجرة، واجمع المجموعتين.","En":"Count once per bird, then count two taps per tree, and combine the groups."}],"Solution":{"Idea":{"Ar":"عدد النقرات يختلف عن عدد الصور لأن لكل نوع عدد نقرات مختلفاً.","En":"The tap count differs from the picture count because the two kinds receive different numbers of taps."},"FormulaLatex":"4\\times1+3\\times2","Steps":[{"Ar":"الطيور الأربعة تحصل على أربع نقرات.","En":"The four birds receive four taps."},{"Ar":"الأشجار الثلاث تحصل على $2+2+2=6$ نقرات.","En":"The three trees receive $2+2+2=6$ taps."},{"Ar":"اجمع نقرات الطيور والأشجار.","En":"Combine bird and tree taps."}],"Substitution":{"Ar":"$4+6=10$","En":"$4+6=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"نقرات","En":"taps"},"Verification":{"Ar":"عدّ النقرات بالترتيب: أربع للطيور ثم ست للأشجار.","En":"Count the taps in order: four for birds, then six for trees."},"CommonError":{"Ar":"لا تعدّ الصور فقط؛ فلكل شجرة نقرتان لا نقرة واحدة.","En":"Do not count pictures alone; each tree receives two taps, not one."}}}$mw$::jsonb,$mw$عدد النقرات يختلف عن عدد الصور لأن لكل نوع عدد نقرات مختلفاً.

$4\times1+3\times2$

1. الطيور الأربعة تحصل على أربع نقرات.

2. الأشجار الثلاث تحصل على $2+2+2=6$ نقرات.

3. اجمع نقرات الطيور والأشجار.

$4+6=10$

$10$ نقرات

عدّ النقرات بالترتيب: أربع للطيور ثم ست للأشجار.

لا تعدّ الصور فقط؛ فلكل شجرة نقرتان لا نقرة واحدة.$mw$,$mw$The tap count differs from the picture count because the two kinds receive different numbers of taps.

$4\times1+3\times2$

1. The four birds receive four taps.

2. The three trees receive $2+2+2=6$ taps.

3. Combine bird and tree taps.

$4+6=10$

$10$ taps

Count the taps in order: four for birds, then six for trees.

Do not count pictures alone; each tree receives two taps, not one.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لكل طائر نقرة واحدة ولكل شجرة نقرتان.","En":"Each bird gets one tap and each tree gets two."},{"Ar":"عدّ نقرة لكل طائر، ثم قفزتين في العد لكل شجرة، واجمع المجموعتين.","En":"Count once per bird, then count two taps per tree, and combine the groups."}],"Solution":{"Idea":{"Ar":"عدد النقرات يختلف عن عدد الصور لأن لكل نوع عدد نقرات مختلفاً.","En":"The tap count differs from the picture count because the two kinds receive different numbers of taps."},"FormulaLatex":"4\\times1+3\\times2","Steps":[{"Ar":"الطيور الأربعة تحصل على أربع نقرات.","En":"The four birds receive four taps."},{"Ar":"الأشجار الثلاث تحصل على $2+2+2=6$ نقرات.","En":"The three trees receive $2+2+2=6$ taps."},{"Ar":"اجمع نقرات الطيور والأشجار.","En":"Combine bird and tree taps."}],"Substitution":{"Ar":"$4+6=10$","En":"$4+6=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"نقرات","En":"taps"},"Verification":{"Ar":"عدّ النقرات بالترتيب: أربع للطيور ثم ست للأشجار.","En":"Count the taps in order: four for birds, then six for trees."},"CommonError":{"Ar":"لا تعدّ الصور فقط؛ فلكل شجرة نقرتان لا نقرة واحدة.","En":"Do not count pictures alone; each tree receives two taps, not one."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الرسوم فقط.","En":"Counts pictures only."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدّ نقرات الأشجار فقط.","En":"Counts only tree taps."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب نقرة زائدة.","En":"Counts one extra tap."},"Order":4}]}$mw$),
($mw$growth-v20-grade-2-compare-lengths-after-shifted-ruler-origin-1$mw$,$mw$compare-lengths-after-shifted-ruler-origin$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"القياس من بداية غير الصفر","En":"Measuring from a shifted ruler origin"},"Question":{"Ar":"وُضع طرف قلم عند علامة ٣ سم على مسطرة، وطرفه الآخر عند علامة ١١ سم. ووُضع طرف قلم آخر عند علامة ١ سم وطرفه الآخر عند علامة ٧ سم. بكم يزيد طول القلم الأول على الثاني؟","En":"One pencil starts at the 3 cm mark of a ruler and ends at 11 cm. Another starts at 1 cm and ends at 7 cm. By how much is the first pencil longer?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن علامتي النهاية فقط.","En":"Compares only the end marks."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى طول الأول وحده.","En":"Reports only the first length."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الطولين.","En":"Adds the two lengths."}}],"Hints":[{"Ar":"لا تبدأ القراءة من الصفر هنا.","En":"Neither measurement starts at zero."},{"Ar":"احسب طول كل قلم بطرح علامتي نهايته وبدايته، ثم قارن.","En":"Find each length by subtracting its start mark from its end mark, then compare."}],"Solution":{"Idea":{"Ar":"طول جسم على المسطرة يساوي قراءة النهاية ناقص قراءة البداية، حتى لو لم يبدأ عند الصفر.","En":"A ruler length is its end reading minus its start reading, even when it does not start at zero."},"FormulaLatex":"L_1-L_2=(11-3)-(7-1)","Steps":[{"Ar":"طول القلم الأول: $11-3=8$ سم.","En":"First pencil length: $11-3=8$ cm."},{"Ar":"طول الثاني: $7-1=6$ سم.","En":"Second pencil length: $7-1=6$ cm."},{"Ar":"قارن الطولين بطرح الأصغر من الأكبر.","En":"Compare the lengths by subtracting the smaller from the larger."}],"Substitution":{"Ar":"$8-6=2$","En":"$8-6=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"الطولان يعيدان قراءتي النهاية: $3+8=11$ و$1+6=7$، و$6+2=8$.","En":"The lengths recover both end marks: $3+8=11$ and $1+6=7$, and $6+2=8$."},"CommonError":{"Ar":"لا تقارن علامتي النهاية مباشرة؛ علامتا البداية مختلفتان.","En":"Do not compare end marks directly because the start marks differ."}}}$mw$::jsonb,$mw$طول جسم على المسطرة يساوي قراءة النهاية ناقص قراءة البداية، حتى لو لم يبدأ عند الصفر.

$L_1-L_2=(11-3)-(7-1)$

1. طول القلم الأول: $11-3=8$ سم.

2. طول الثاني: $7-1=6$ سم.

3. قارن الطولين بطرح الأصغر من الأكبر.

$8-6=2$

$2$ سم

الطولان يعيدان قراءتي النهاية: $3+8=11$ و$1+6=7$، و$6+2=8$.

لا تقارن علامتي النهاية مباشرة؛ علامتا البداية مختلفتان.$mw$,$mw$A ruler length is its end reading minus its start reading, even when it does not start at zero.

$L_1-L_2=(11-3)-(7-1)$

1. First pencil length: $11-3=8$ cm.

2. Second pencil length: $7-1=6$ cm.

3. Compare the lengths by subtracting the smaller from the larger.

$8-6=2$

$2$ cm

The lengths recover both end marks: $3+8=11$ and $1+6=7$, and $6+2=8$.

Do not compare end marks directly because the start marks differ.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لا تبدأ القراءة من الصفر هنا.","En":"Neither measurement starts at zero."},{"Ar":"احسب طول كل قلم بطرح علامتي نهايته وبدايته، ثم قارن.","En":"Find each length by subtracting its start mark from its end mark, then compare."}],"Solution":{"Idea":{"Ar":"طول جسم على المسطرة يساوي قراءة النهاية ناقص قراءة البداية، حتى لو لم يبدأ عند الصفر.","En":"A ruler length is its end reading minus its start reading, even when it does not start at zero."},"FormulaLatex":"L_1-L_2=(11-3)-(7-1)","Steps":[{"Ar":"طول القلم الأول: $11-3=8$ سم.","En":"First pencil length: $11-3=8$ cm."},{"Ar":"طول الثاني: $7-1=6$ سم.","En":"Second pencil length: $7-1=6$ cm."},{"Ar":"قارن الطولين بطرح الأصغر من الأكبر.","En":"Compare the lengths by subtracting the smaller from the larger."}],"Substitution":{"Ar":"$8-6=2$","En":"$8-6=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"الطولان يعيدان قراءتي النهاية: $3+8=11$ و$1+6=7$، و$6+2=8$.","En":"The lengths recover both end marks: $3+8=11$ and $1+6=7$, and $6+2=8$."},"CommonError":{"Ar":"لا تقارن علامتي النهاية مباشرة؛ علامتا البداية مختلفتان.","En":"Do not compare end marks directly because the start marks differ."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قارن علامتي النهاية فقط.","En":"Compares only the end marks."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى طول الأول وحده.","En":"Reports only the first length."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع الطولين.","En":"Adds the two lengths."},"Order":4}]}$mw$),
($mw$growth-v20-grade-6-remaining-fraction-after-split-of-two-original-reservations-1$mw$,$mw$remaining-fraction-after-split-of-two-original-reservations$mw$,$mw$p-fractions-decimals-fraction-operations$mw$,$mw$grade-6$mw$,6,1,21,95,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":95,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"جزء الوقت غير المخصص","En":"Unallocated time"},"Question":{"Ar":"خُصص $\\frac25$ من مدة لقاء للشرح و$\\frac14$ من المدة الأصلية للتدريب، دون تداخل. أُلغي نصف وقت التدريب المخصص وبقي الشرح كما هو. ما كسر المدة الكلية غير المخصص لأي منهما الآن؟","En":"Two fifths of a session is allocated to explanation and one quarter of the original duration to practice. The two allocations do not overlap. Half of the allocated practice time is cancelled, while explanation stays unchanged. What fraction of the whole session is now allocated to neither?"},"Options":[{"LatexCode":"\\frac{19}{40}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{7}{20}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح مدة التدريب الأصلية كاملة.","En":"Subtracts the full original practice allocation."}},{"LatexCode":"\\frac{21}{40}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى الجزء المخصص.","En":"Reports the allocated portion."}},{"LatexCode":"\\frac{3}{5}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل وقت التدريب المتبقي.","En":"Ignores the remaining practice time."}}],"Hints":[{"Ar":"احسب الكسر الذي يبقى من وقت التدريب بعد إلغاء نصفه.","En":"Find the fraction of practice time that remains after half is cancelled."},{"Ar":"اجمع الجزأين المخصصين بعد توحيد المقامات، ثم اطرحهما من الواحد.","En":"Add the remaining allocations using a common denominator, then subtract from one."}],"Solution":{"Idea":{"Ar":"جميع الكسور من المدة الأصلية نفسها، ونصف الربع يبقى مخصصاً للتدريب.","En":"All fractions refer to the same original duration; half of the original quarter remains allocated to practice."},"FormulaLatex":"1-\\left(\\frac25+\\frac12\\times\\frac14\\right)","Steps":[{"Ar":"وقت التدريب المتبقي: $\\frac12\\times\\frac14=\\frac18$.","En":"Remaining practice: $\\frac12\\times\\frac14=\\frac18$."},{"Ar":"مجموع الوقت المخصص: $\\frac25+\\frac18=\\frac{16}{40}+\\frac5{40}=\\frac{21}{40}$.","En":"Total allocated time: $\\frac25+\\frac18=\\frac{16}{40}+\\frac5{40}=\\frac{21}{40}$."},{"Ar":"اطرح الوقت المخصص من المدة الكلية.","En":"Subtract allocated time from the whole duration."}],"Substitution":{"Ar":"$1-\\frac{21}{40}=\\frac{19}{40}$","En":"$1-\\frac{21}{40}=\\frac{19}{40}$"},"Result":{"Ar":"$\\frac{19}{40}$","En":"$\\frac{19}{40}$"},"Unit":{"Ar":"من المدة الكلية","En":"of the total duration"},"Verification":{"Ar":"$\\frac{19}{40}+\\frac{16}{40}+\\frac5{40}=1$، أي كل الوقت.","En":"$\\frac{19}{40}+\\frac{16}{40}+\\frac5{40}=1$, accounting for the entire duration."},"CommonError":{"Ar":"لا تطرح وقت التدريب الأصلي كله؛ ما زال نصفه مخصصاً للتدريب.","En":"Do not subtract all original practice time; half remains allocated."}}}$mw$::jsonb,$mw$جميع الكسور من المدة الأصلية نفسها، ونصف الربع يبقى مخصصاً للتدريب.

$1-\left(\frac25+\frac12\times\frac14\right)$

1. وقت التدريب المتبقي: $\frac12\times\frac14=\frac18$.

2. مجموع الوقت المخصص: $\frac25+\frac18=\frac{16}{40}+\frac5{40}=\frac{21}{40}$.

3. اطرح الوقت المخصص من المدة الكلية.

$1-\frac{21}{40}=\frac{19}{40}$

$\frac{19}{40}$ من المدة الكلية

$\frac{19}{40}+\frac{16}{40}+\frac5{40}=1$، أي كل الوقت.

لا تطرح وقت التدريب الأصلي كله؛ ما زال نصفه مخصصاً للتدريب.$mw$,$mw$All fractions refer to the same original duration; half of the original quarter remains allocated to practice.

$1-\left(\frac25+\frac12\times\frac14\right)$

1. Remaining practice: $\frac12\times\frac14=\frac18$.

2. Total allocated time: $\frac25+\frac18=\frac{16}{40}+\frac5{40}=\frac{21}{40}$.

3. Subtract allocated time from the whole duration.

$1-\frac{21}{40}=\frac{19}{40}$

$\frac{19}{40}$ of the total duration

$\frac{19}{40}+\frac{16}{40}+\frac5{40}=1$, accounting for the entire duration.

Do not subtract all original practice time; half remains allocated.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"احسب الكسر الذي يبقى من وقت التدريب بعد إلغاء نصفه.","En":"Find the fraction of practice time that remains after half is cancelled."},{"Ar":"اجمع الجزأين المخصصين بعد توحيد المقامات، ثم اطرحهما من الواحد.","En":"Add the remaining allocations using a common denominator, then subtract from one."}],"Solution":{"Idea":{"Ar":"جميع الكسور من المدة الأصلية نفسها، ونصف الربع يبقى مخصصاً للتدريب.","En":"All fractions refer to the same original duration; half of the original quarter remains allocated to practice."},"FormulaLatex":"1-\\left(\\frac25+\\frac12\\times\\frac14\\right)","Steps":[{"Ar":"وقت التدريب المتبقي: $\\frac12\\times\\frac14=\\frac18$.","En":"Remaining practice: $\\frac12\\times\\frac14=\\frac18$."},{"Ar":"مجموع الوقت المخصص: $\\frac25+\\frac18=\\frac{16}{40}+\\frac5{40}=\\frac{21}{40}$.","En":"Total allocated time: $\\frac25+\\frac18=\\frac{16}{40}+\\frac5{40}=\\frac{21}{40}$."},{"Ar":"اطرح الوقت المخصص من المدة الكلية.","En":"Subtract allocated time from the whole duration."}],"Substitution":{"Ar":"$1-\\frac{21}{40}=\\frac{19}{40}$","En":"$1-\\frac{21}{40}=\\frac{19}{40}$"},"Result":{"Ar":"$\\frac{19}{40}$","En":"$\\frac{19}{40}$"},"Unit":{"Ar":"من المدة الكلية","En":"of the total duration"},"Verification":{"Ar":"$\\frac{19}{40}+\\frac{16}{40}+\\frac5{40}=1$، أي كل الوقت.","En":"$\\frac{19}{40}+\\frac{16}{40}+\\frac5{40}=1$, accounting for the entire duration."},"CommonError":{"Ar":"لا تطرح وقت التدريب الأصلي كله؛ ما زال نصفه مخصصاً للتدريب.","En":"Do not subtract all original practice time; half remains allocated."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح مدة التدريب الأصلية كاملة.","En":"Subtracts the full original practice allocation."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى الجزء المخصص.","En":"Reports the allocated portion."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل وقت التدريب المتبقي.","En":"Ignores the remaining practice time."},"Order":4}]}$mw$);
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND q."WizardJson" IS NOT NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v20 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
