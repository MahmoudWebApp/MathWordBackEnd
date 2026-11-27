-- One-time owner-authorized v61 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v61-grade-4-fraction-addition-missing-addend-over-one-1$mw$,$mw$fraction-addition-missing-addend-over-one$mw$,$mw$fraction-operations$mw$,$mw$grade-4$mw$,4,1,21,298,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":298,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كسر مفقود في مجموع","En":"Missing fractional addend"},"Question":{"Ar":"ما الكسر الذي نضيفه إلى $\\frac58$ حتى نحصل على $\\frac98$؟","En":"What fraction must be added to $\\frac58$ to obtain $\\frac98$?"},"Options":[{"LatexCode":"\\frac78","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يعطي المجموع المطلوب.","En":"Does not give the required sum."}},{"LatexCode":"\\frac{14}8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الكسرين بدلاً من طرحهما.","En":"Adds the fractions instead of subtracting."}},{"LatexCode":"\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعادل 2/8 فقط.","En":"Equals only two eighths."}}],"Hints":[{"Ar":"اطرح البسطين لأن المقام مشترك.","En":"Subtract the numerators because denominators match."},{"Ar":"بسّط أربعة أثمان.","En":"Simplify four eighths."}],"Solution":{"Idea":{"Ar":"نطرح الكسر المعلوم من المجموع المطلوب.","En":"Subtract the known addend from the target sum."},"FormulaLatex":"9/8-5/8","Steps":[{"Ar":"$4/8=1/2$","En":"$4/8=1/2$"}],"Substitution":{"Ar":"$(9-5)/8$","En":"$(9-5)/8$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5/8+4/8=9/8$","En":"$5/8+4/8=9/8$"},"CommonError":{"Ar":"يعادل 2/8 فقط.","En":"Equals only two eighths."}}}$mw$::jsonb,$mw$نطرح الكسر المعلوم من المجموع المطلوب.

$9/8-5/8$

1. $4/8=1/2$

$(9-5)/8$

$\frac12$

$5/8+4/8=9/8$

يعادل 2/8 فقط.$mw$,$mw$Subtract the known addend from the target sum.

$9/8-5/8$

1. $4/8=1/2$

$(9-5)/8$

$\frac12$

$5/8+4/8=9/8$

Equals only two eighths.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح البسطين لأن المقام مشترك.","En":"Subtract the numerators because denominators match."},{"Ar":"بسّط أربعة أثمان.","En":"Simplify four eighths."}],"Solution":{"Idea":{"Ar":"نطرح الكسر المعلوم من المجموع المطلوب.","En":"Subtract the known addend from the target sum."},"FormulaLatex":"9/8-5/8","Steps":[{"Ar":"$4/8=1/2$","En":"$4/8=1/2$"}],"Substitution":{"Ar":"$(9-5)/8$","En":"$(9-5)/8$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5/8+4/8=9/8$","En":"$5/8+4/8=9/8$"},"CommonError":{"Ar":"يعادل 2/8 فقط.","En":"Equals only two eighths."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يعطي المجموع المطلوب.","En":"Does not give the required sum."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع الكسرين بدلاً من طرحهما.","En":"Adds the fractions instead of subtracting."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعادل 2/8 فقط.","En":"Equals only two eighths."},"Order":4}]}$mw$),
($mw$growth-v61-grade-4-fraction-comparison-between-half-and-one-1$mw$,$mw$fraction-comparison-between-half-and-one$mw$,$mw$p-fractions-decimals-fraction-comparisons$mw$,$mw$grade-4$mw$,4,1,21,112,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":112,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كسر بين حدين","En":"Fraction between two bounds"},"Question":{"Ar":"أي كسر أكبر من $\\frac12$ وأصغر من $\\frac34$؟","En":"Which fraction is greater than $\\frac12$ and less than $\\frac34$?"},"Options":[{"LatexCode":"\\frac78","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أكبر من ثلاثة أرباع.","En":"Above three quarters."}},{"LatexCode":"\\frac58","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أصغر من النصف.","En":"Below one half."}},{"LatexCode":"\\frac68","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يساوي الحد الأعلى ولا يصغره.","En":"Equals the upper bound rather than being below it."}}],"Hints":[{"Ar":"حول النصف إلى أثمان.","En":"Convert one half to eighths."},{"Ar":"حول ثلاثة أرباع إلى أثمان.","En":"Convert three quarters to eighths."}],"Solution":{"Idea":{"Ar":"نعبر عن الحدين بمقام ثمانية ونختار البسط الواقع بينهما.","En":"Express both bounds in eighths and choose a numerator between them."},"FormulaLatex":"4/8<n/8<6/8","Steps":[{"Ar":"$n=5$","En":"$n=5$"}],"Substitution":{"Ar":"$4<n<6$","En":"$4<n<6$"},"Result":{"Ar":"$\\frac58$","En":"$\\frac58$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4/8<5/8<6/8$","En":"$4/8<5/8<6/8$"},"CommonError":{"Ar":"أصغر من النصف.","En":"Below one half."}}}$mw$::jsonb,$mw$نعبر عن الحدين بمقام ثمانية ونختار البسط الواقع بينهما.

$4/8<n/8<6/8$

1. $n=5$

$4<n<6$

$\frac58$

$4/8<5/8<6/8$

أصغر من النصف.$mw$,$mw$Express both bounds in eighths and choose a numerator between them.

$4/8<n/8<6/8$

1. $n=5$

$4<n<6$

$\frac58$

$4/8<5/8<6/8$

Below one half.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حول النصف إلى أثمان.","En":"Convert one half to eighths."},{"Ar":"حول ثلاثة أرباع إلى أثمان.","En":"Convert three quarters to eighths."}],"Solution":{"Idea":{"Ar":"نعبر عن الحدين بمقام ثمانية ونختار البسط الواقع بينهما.","En":"Express both bounds in eighths and choose a numerator between them."},"FormulaLatex":"4/8<n/8<6/8","Steps":[{"Ar":"$n=5$","En":"$n=5$"}],"Substitution":{"Ar":"$4<n<6$","En":"$4<n<6$"},"Result":{"Ar":"$\\frac58$","En":"$\\frac58$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4/8<5/8<6/8$","En":"$4/8<5/8<6/8$"},"CommonError":{"Ar":"أصغر من النصف.","En":"Below one half."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أكبر من ثلاثة أرباع.","En":"Above three quarters."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أصغر من النصف.","En":"Below one half."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يساوي الحد الأعلى ولا يصغره.","En":"Equals the upper bound rather than being below it."},"Order":4}]}$mw$),
($mw$growth-v61-grade-7-absolute-value-sum-vs-absolute-sum-1$mw$,$mw$absolute-value-sum-vs-absolute-sum$mw$,$mw$absolute-value$mw$,$mw$grade-7$mw$,7,2,83,307,$mw${"StageId":2,"CategoryId":83,"PrimarySkillId":307,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة مجموع القيم المطلقة","En":"Comparing absolute sums"},"Question":{"Ar":"كم تزيد قيمة $|-8|+|3|$ على قيمة $|-8+3|$؟","En":"By how much does $|-8|+|3|$ exceed $|-8+3|$?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن القيمة المطلقة توزع على الجمع دائماً.","En":"Assumes absolute value always distributes over addition."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة المقدار الثاني.","En":"This is the second expression's value."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة المقدار الأول.","En":"This is the first expression's value."}}],"Hints":[{"Ar":"احسب القيمتين المطلقتين المنفصلتين.","En":"Evaluate the separate absolute values."},{"Ar":"اجمع داخل القيمة المطلقة الثانية أولاً.","En":"Add inside the second absolute value first."}],"Solution":{"Idea":{"Ar":"نحسب كل تعبير مستقلاً ثم نطرح.","En":"Evaluate each expression separately, then subtract."},"FormulaLatex":"(|-8|+|3|)-|-8+3|","Steps":[{"Ar":"$8+3=11$","En":"$8+3=11$"},{"Ar":"$|-5|=5$","En":"$|-5|=5$"},{"Ar":"$11-5=6$","En":"$11-5=6$"}],"Substitution":{"Ar":"$(8+3)-|-5|$","En":"$(8+3)-|-5|$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+6=11$","En":"$5+6=11$"},"CommonError":{"Ar":"افترض أن القيمة المطلقة توزع على الجمع دائماً.","En":"Assumes absolute value always distributes over addition."}}}$mw$::jsonb,$mw$نحسب كل تعبير مستقلاً ثم نطرح.

$(|-8|+|3|)-|-8+3|$

1. $8+3=11$

2. $|-5|=5$

3. $11-5=6$

$(8+3)-|-5|$

$6$

$5+6=11$

افترض أن القيمة المطلقة توزع على الجمع دائماً.$mw$,$mw$Evaluate each expression separately, then subtract.

$(|-8|+|3|)-|-8+3|$

1. $8+3=11$

2. $|-5|=5$

3. $11-5=6$

$(8+3)-|-5|$

$6$

$5+6=11$

Assumes absolute value always distributes over addition.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب القيمتين المطلقتين المنفصلتين.","En":"Evaluate the separate absolute values."},{"Ar":"اجمع داخل القيمة المطلقة الثانية أولاً.","En":"Add inside the second absolute value first."}],"Solution":{"Idea":{"Ar":"نحسب كل تعبير مستقلاً ثم نطرح.","En":"Evaluate each expression separately, then subtract."},"FormulaLatex":"(|-8|+|3|)-|-8+3|","Steps":[{"Ar":"$8+3=11$","En":"$8+3=11$"},{"Ar":"$|-5|=5$","En":"$|-5|=5$"},{"Ar":"$11-5=6$","En":"$11-5=6$"}],"Substitution":{"Ar":"$(8+3)-|-5|$","En":"$(8+3)-|-5|$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+6=11$","En":"$5+6=11$"},"CommonError":{"Ar":"افترض أن القيمة المطلقة توزع على الجمع دائماً.","En":"Assumes absolute value always distributes over addition."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن القيمة المطلقة توزع على الجمع دائماً.","En":"Assumes absolute value always distributes over addition."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة المقدار الثاني.","En":"This is the second expression's value."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة المقدار الأول.","En":"This is the first expression's value."},"Order":4}]}$mw$),
($mw$growth-v61-grade-7-mean-two-observations-symmetric-adjustment-1$mw$,$mw$mean-two-observations-symmetric-adjustment$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-7$mw$,7,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متوسط بعد نقل مقدار","En":"Mean after transferring a quantity"},"Question":{"Ar":"متوسط ست قراءات يساوي 15. زادت إحدى القراءات بمقدار 4 ونقصت قراءة أخرى بالمقدار نفسه. ما المتوسط الجديد؟","En":"Six readings have mean 15. One reading increases by four and another decreases by the same amount. Find the new mean."},"Options":[{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 4 من المتوسط.","En":"Subtracts four from the mean."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 4 إلى المتوسط.","En":"Adds four to the mean."}},{"LatexCode":"90","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع لا المتوسط.","En":"This is the total, not the mean."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب صافي تغير المجموع.","En":"Find the net change in total."},{"Ar":"هل تغير عدد القراءات؟","En":"Did the number of observations change?"}],"Solution":{"Idea":{"Ar":"مجموع القراءات وعددها لا يتغيران.","En":"Both total and count remain unchanged."},"FormulaLatex":"S'=6\\cdot15+4-4","Steps":[{"Ar":"$S'=90$","En":"$S'=90$"},{"Ar":"$90/6=15$","En":"$90/6=15$"}],"Substitution":{"Ar":"$90/6$","En":"$90/6$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot15=90$","En":"$6\\cdot15=90$"},"CommonError":{"Ar":"طرح 4 من المتوسط.","En":"Subtracts four from the mean."}}}$mw$::jsonb,$mw$مجموع القراءات وعددها لا يتغيران.

$S'=6\cdot15+4-4$

1. $S'=90$

2. $90/6=15$

$90/6$

$15$

$6\cdot15=90$

طرح 4 من المتوسط.$mw$,$mw$Both total and count remain unchanged.

$S'=6\cdot15+4-4$

1. $S'=90$

2. $90/6=15$

$90/6$

$15$

$6\cdot15=90$

Subtracts four from the mean.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب صافي تغير المجموع.","En":"Find the net change in total."},{"Ar":"هل تغير عدد القراءات؟","En":"Did the number of observations change?"}],"Solution":{"Idea":{"Ar":"مجموع القراءات وعددها لا يتغيران.","En":"Both total and count remain unchanged."},"FormulaLatex":"S'=6\\cdot15+4-4","Steps":[{"Ar":"$S'=90$","En":"$S'=90$"},{"Ar":"$90/6=15$","En":"$90/6=15$"}],"Substitution":{"Ar":"$90/6$","En":"$90/6$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot15=90$","En":"$6\\cdot15=90$"},"CommonError":{"Ar":"طرح 4 من المتوسط.","En":"Subtracts four from the mean."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 4 من المتوسط.","En":"Subtracts four from the mean."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 4 إلى المتوسط.","En":"Adds four to the mean."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع لا المتوسط.","En":"This is the total, not the mean."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v61-grade-4-division-quotient-with-dividend-increase-by-divisor-1$mw$,$mw$division-quotient-with-dividend-increase-by-divisor$mw$,$mw$primary-division$mw$,$mw$grade-4$mw$,4,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير خارج القسمة مع الباقي نفسه","En":"Quotient change with unchanged remainder"},"Question":{"Ar":"عند قسمة 53 على 8 يكون الخارج 6 والباقي 5. إذا زاد المقسوم بمقدار 16 وبقي المقسوم عليه 8، فما خارج القسمة الجديد؟","En":"Dividing 53 by eight gives quotient six and remainder five. If the dividend increases by sixteen while the divisor stays eight, what is the new quotient?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب مجموعة واحدة فقط.","En":"Counts only one new group."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب أربع مجموعات إضافية.","En":"Adds four extra groups."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يحسب المجموعتين الجديدتين.","En":"Ignores the two new groups."}}],"Hints":[{"Ar":"كم مجموعة كاملة في 16؟","En":"How many full groups fit in sixteen?"},{"Ar":"أضفها إلى الخارج القديم.","En":"Add them to the old quotient."}],"Solution":{"Idea":{"Ar":"إضافة مضاعف المقسوم عليه تغير الخارج دون تغيير الباقي.","En":"Adding a multiple of the divisor changes the quotient but preserves the remainder."},"FormulaLatex":"53+16=8(6+2)+5","Steps":[{"Ar":"$6+2=8$","En":"$6+2=8$"}],"Substitution":{"Ar":"$16/8=2$","En":"$16/8=2$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot8+5=69$","En":"$8\\cdot8+5=69$"},"CommonError":{"Ar":"لم يحسب المجموعتين الجديدتين.","En":"Ignores the two new groups."}}}$mw$::jsonb,$mw$إضافة مضاعف المقسوم عليه تغير الخارج دون تغيير الباقي.

$53+16=8(6+2)+5$

1. $6+2=8$

$16/8=2$

$8$

$8\cdot8+5=69$

لم يحسب المجموعتين الجديدتين.$mw$,$mw$Adding a multiple of the divisor changes the quotient but preserves the remainder.

$53+16=8(6+2)+5$

1. $6+2=8$

$16/8=2$

$8$

$8\cdot8+5=69$

Ignores the two new groups.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم مجموعة كاملة في 16؟","En":"How many full groups fit in sixteen?"},{"Ar":"أضفها إلى الخارج القديم.","En":"Add them to the old quotient."}],"Solution":{"Idea":{"Ar":"إضافة مضاعف المقسوم عليه تغير الخارج دون تغيير الباقي.","En":"Adding a multiple of the divisor changes the quotient but preserves the remainder."},"FormulaLatex":"53+16=8(6+2)+5","Steps":[{"Ar":"$6+2=8$","En":"$6+2=8$"}],"Substitution":{"Ar":"$16/8=2$","En":"$16/8=2$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot8+5=69$","En":"$8\\cdot8+5=69$"},"CommonError":{"Ar":"لم يحسب المجموعتين الجديدتين.","En":"Ignores the two new groups."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب مجموعة واحدة فقط.","En":"Counts only one new group."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب أربع مجموعات إضافية.","En":"Adds four extra groups."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لم يحسب المجموعتين الجديدتين.","En":"Ignores the two new groups."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v61 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
