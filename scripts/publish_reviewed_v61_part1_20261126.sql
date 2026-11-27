-- One-time owner-authorized v61 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v61-grade-3-division-minimum-extra-to-complete-group-1$mw$,$mw$division-minimum-extra-to-complete-group$mw$,$mw$primary-division$mw$,$mw$grade-3$mw$,3,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال مجموعة أخيرة","En":"Completing a final group"},"Question":{"Ar":"لدينا 34 ملصقاً. نريد تقسيمها إلى مجموعات من 6 ملصقات دون باقٍ. ما أقل عدد من الملصقات يجب إضافته؟","En":"There are 34 stickers. They must be divided into groups of six with none left over. What is the fewest stickers to add?"},"Options":[{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي قبل الإضافة.","En":"This is the original remainder."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إضافة مجموعة كاملة لا تزيل الباقي.","En":"Adding a full group leaves the remainder unchanged."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس أقل عدد ممكن.","En":"Not the minimum possible addition."}}],"Hints":[{"Ar":"كم يتبقى عند تقسيم 34 على 6؟","En":"What remains when 34 is divided by six?"},{"Ar":"كم ينقص الباقي ليصبح ستة؟","En":"How many more make the remainder six?"}],"Solution":{"Idea":{"Ar":"نبحث عن المضاعف التالي للعدد 6.","En":"Find the next multiple of six."},"FormulaLatex":"6\\cdot6=36","Steps":[{"Ar":"$34=5\\cdot6+4$","En":"$34=5\\cdot6+4$"},{"Ar":"$36-34=2$","En":"$36-34=2$"}],"Substitution":{"Ar":"$36-34$","En":"$36-34$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(34+2)/6=6$","En":"$(34+2)/6=6$"},"CommonError":{"Ar":"هذا الباقي قبل الإضافة.","En":"This is the original remainder."}}}$mw$::jsonb,$mw$نبحث عن المضاعف التالي للعدد 6.

$6\cdot6=36$

1. $34=5\cdot6+4$

2. $36-34=2$

$36-34$

$2$

$(34+2)/6=6$

هذا الباقي قبل الإضافة.$mw$,$mw$Find the next multiple of six.

$6\cdot6=36$

1. $34=5\cdot6+4$

2. $36-34=2$

$36-34$

$2$

$(34+2)/6=6$

This is the original remainder.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم يتبقى عند تقسيم 34 على 6؟","En":"What remains when 34 is divided by six?"},{"Ar":"كم ينقص الباقي ليصبح ستة؟","En":"How many more make the remainder six?"}],"Solution":{"Idea":{"Ar":"نبحث عن المضاعف التالي للعدد 6.","En":"Find the next multiple of six."},"FormulaLatex":"6\\cdot6=36","Steps":[{"Ar":"$34=5\\cdot6+4$","En":"$34=5\\cdot6+4$"},{"Ar":"$36-34=2$","En":"$36-34=2$"}],"Substitution":{"Ar":"$36-34$","En":"$36-34$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(34+2)/6=6$","En":"$(34+2)/6=6$"},"CommonError":{"Ar":"هذا الباقي قبل الإضافة.","En":"This is the original remainder."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي قبل الإضافة.","En":"This is the original remainder."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"إضافة مجموعة كاملة لا تزيل الباقي.","En":"Adding a full group leaves the remainder unchanged."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ليس أقل عدد ممكن.","En":"Not the minimum possible addition."},"Order":4}]}$mw$),
($mw$growth-v61-grade-3-multiplication-factor-order-three-equal-products-1$mw$,$mw$multiplication-factor-order-three-equal-products$mw$,$mw$primary-multiplication$mw$,$mw$grade-3$mw$,3,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ضرب بعوامل مختلفة","En":"Different factors with equal products"},"Question":{"Ar":"أي حاصل ضرب يساوي $6\\times8$ ويستخدم العدد 4 عاملاً؟","En":"Which product equals $6\\times8$ and uses four as a factor?"},"Options":[{"LatexCode":"4\\times6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يساوي 24.","En":"Equals 24."}},{"LatexCode":"4\\times8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يساوي 32.","En":"Equals 32."}},{"LatexCode":"4\\times10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يساوي 40.","En":"Equals 40."}},{"LatexCode":"4\\times12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب حاصل الضرب الأول.","En":"Calculate the first product."},{"Ar":"ابحث عن العدد الذي يعطي 48 عند ضربه في 4.","En":"Find the number that gives 48 when multiplied by four."}],"Solution":{"Idea":{"Ar":"نحسب الناتج المطلوب ثم نقسمه على 4 لإيجاد العامل الآخر.","En":"Find the target product then divide by four to find the other factor."},"FormulaLatex":"6\\cdot8=4\\cdot n","Steps":[{"Ar":"$6\\cdot8=48$","En":"$6\\cdot8=48$"},{"Ar":"$n=12$","En":"$n=12$"}],"Substitution":{"Ar":"$48/4$","En":"$48/4$"},"Result":{"Ar":"$4\\times12$","En":"$4\\times12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot12=48$","En":"$4\\cdot12=48$"},"CommonError":{"Ar":"يساوي 24.","En":"Equals 24."}}}$mw$::jsonb,$mw$نحسب الناتج المطلوب ثم نقسمه على 4 لإيجاد العامل الآخر.

$6\cdot8=4\cdot n$

1. $6\cdot8=48$

2. $n=12$

$48/4$

$4\times12$

$4\cdot12=48$

يساوي 24.$mw$,$mw$Find the target product then divide by four to find the other factor.

$6\cdot8=4\cdot n$

1. $6\cdot8=48$

2. $n=12$

$48/4$

$4\times12$

$4\cdot12=48$

Equals 24.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"احسب حاصل الضرب الأول.","En":"Calculate the first product."},{"Ar":"ابحث عن العدد الذي يعطي 48 عند ضربه في 4.","En":"Find the number that gives 48 when multiplied by four."}],"Solution":{"Idea":{"Ar":"نحسب الناتج المطلوب ثم نقسمه على 4 لإيجاد العامل الآخر.","En":"Find the target product then divide by four to find the other factor."},"FormulaLatex":"6\\cdot8=4\\cdot n","Steps":[{"Ar":"$6\\cdot8=48$","En":"$6\\cdot8=48$"},{"Ar":"$n=12$","En":"$n=12$"}],"Substitution":{"Ar":"$48/4$","En":"$48/4$"},"Result":{"Ar":"$4\\times12$","En":"$4\\times12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot12=48$","En":"$4\\cdot12=48$"},"CommonError":{"Ar":"يساوي 24.","En":"Equals 24."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يساوي 24.","En":"Equals 24."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يساوي 32.","En":"Equals 32."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يساوي 40.","En":"Equals 40."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v61-grade-3-multiplication-two-choices-number-combinations-1$mw$,$mw$multiplication-two-choices-number-combinations$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-3$mw$,3,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عدد التوليفات من اختيارين","En":"Counting combinations of two choices"},"Question":{"Ar":"يوجد 3 أنواع من الخبز و4 أنواع من الجبن. يمكن اختيار أي نوع خبز مع أي نوع جبن، ونستخدم نوعاً واحداً من كل منهما لكل شطيرة. كم اختياراً مختلفاً يمكن تكوينه؟","En":"There are three bread types and four cheese types. Any bread can be paired with any cheese, using one type of each per sandwich. How many distinct choices are possible?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الخبز فقط.","En":"Chooses bread only."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الجبن فقط.","En":"Chooses cheese only."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع عددَي الاختيارات بدلاً من ضربهما.","En":"Adds the choice counts instead of multiplying."}}],"Hints":[{"Ar":"اختر نوع خبز واحداً وعدّ خيارات الجبن.","En":"Choose one bread type and count cheese choices."},{"Ar":"كرر ذلك لكل أنواع الخبز.","En":"Repeat for all bread types."}],"Solution":{"Idea":{"Ar":"لكل نوع خبز أربعة اختيارات من الجبن.","En":"Each bread type has four cheese choices."},"FormulaLatex":"3\\cdot4","Steps":[{"Ar":"$4+4+4=12$","En":"$4+4+4=12$"}],"Substitution":{"Ar":"$4+4+4$","En":"$4+4+4$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12/3=4$","En":"$12/3=4$"},"CommonError":{"Ar":"جمع عددَي الاختيارات بدلاً من ضربهما.","En":"Adds the choice counts instead of multiplying."}}}$mw$::jsonb,$mw$لكل نوع خبز أربعة اختيارات من الجبن.

$3\cdot4$

1. $4+4+4=12$

$4+4+4$

$12$

$12/3=4$

جمع عددَي الاختيارات بدلاً من ضربهما.$mw$,$mw$Each bread type has four cheese choices.

$3\cdot4$

1. $4+4+4=12$

$4+4+4$

$12$

$12/3=4$

Adds the choice counts instead of multiplying.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اختر نوع خبز واحداً وعدّ خيارات الجبن.","En":"Choose one bread type and count cheese choices."},{"Ar":"كرر ذلك لكل أنواع الخبز.","En":"Repeat for all bread types."}],"Solution":{"Idea":{"Ar":"لكل نوع خبز أربعة اختيارات من الجبن.","En":"Each bread type has four cheese choices."},"FormulaLatex":"3\\cdot4","Steps":[{"Ar":"$4+4+4=12$","En":"$4+4+4=12$"}],"Substitution":{"Ar":"$4+4+4$","En":"$4+4+4$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12/3=4$","En":"$12/3=4$"},"CommonError":{"Ar":"جمع عددَي الاختيارات بدلاً من ضربهما.","En":"Adds the choice counts instead of multiplying."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اختار الخبز فقط.","En":"Chooses bread only."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"اختار الجبن فقط.","En":"Chooses cheese only."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع عددَي الاختيارات بدلاً من ضربهما.","En":"Adds the choice counts instead of multiplying."},"Order":4}]}$mw$),
($mw$growth-v61-grade-9-quadratic-evaluation-identify-equal-output-pair-shifted-1$mw$,$mw$quadratic-evaluation-identify-equal-output-pair-shifted$mw$,$mw$middle-quadratic-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,27,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":27,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مدخلان متساويا المخرج","En":"Inputs with equal outputs"},"Question":{"Ar":"لدالة $f(x)=(x-3)^2+1$، أي زوج من المدخلات يعطي قيمتين متساويتين للدالة؟","En":"For $f(x)=(x-3)^2+1$, which pair of inputs gives equal function values?"},"Options":[{"LatexCode":"(3,5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتجان 1 و5.","En":"The outputs are one and five."}},{"LatexCode":"(1,5)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(1,4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتجان 5 و2.","En":"The outputs are five and two."}},{"LatexCode":"(0,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتجان 10 و1.","En":"The outputs are ten and one."}}],"Hints":[{"Ar":"احسب الفرق بين كل مدخل و3.","En":"Find each input's difference from three."},{"Ar":"قارن مربعي الفرقين.","En":"Compare the squared differences."}],"Solution":{"Idea":{"Ar":"القيمتان المتساويتان في البعد عن 3 تعطيان المربع نفسه.","En":"Inputs equally distant from three give the same square."},"FormulaLatex":"(1-3)^2=(5-3)^2","Steps":[{"Ar":"$f(1)=4+1=5$","En":"$f(1)=4+1=5$"},{"Ar":"$f(5)=4+1=5$","En":"$f(5)=4+1=5$"}],"Substitution":{"Ar":"$(-2)^2=2^2$","En":"$(-2)^2=2^2$"},"Result":{"Ar":"$(1,5)$","En":"$(1,5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(1)-f(5)=0$","En":"$f(1)-f(5)=0$"},"CommonError":{"Ar":"الناتجان 5 و2.","En":"The outputs are five and two."}}}$mw$::jsonb,$mw$القيمتان المتساويتان في البعد عن 3 تعطيان المربع نفسه.

$(1-3)^2=(5-3)^2$

1. $f(1)=4+1=5$

2. $f(5)=4+1=5$

$(-2)^2=2^2$

$(1,5)$

$f(1)-f(5)=0$

الناتجان 5 و2.$mw$,$mw$Inputs equally distant from three give the same square.

$(1-3)^2=(5-3)^2$

1. $f(1)=4+1=5$

2. $f(5)=4+1=5$

$(-2)^2=2^2$

$(1,5)$

$f(1)-f(5)=0$

The outputs are five and two.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الفرق بين كل مدخل و3.","En":"Find each input's difference from three."},{"Ar":"قارن مربعي الفرقين.","En":"Compare the squared differences."}],"Solution":{"Idea":{"Ar":"القيمتان المتساويتان في البعد عن 3 تعطيان المربع نفسه.","En":"Inputs equally distant from three give the same square."},"FormulaLatex":"(1-3)^2=(5-3)^2","Steps":[{"Ar":"$f(1)=4+1=5$","En":"$f(1)=4+1=5$"},{"Ar":"$f(5)=4+1=5$","En":"$f(5)=4+1=5$"}],"Substitution":{"Ar":"$(-2)^2=2^2$","En":"$(-2)^2=2^2$"},"Result":{"Ar":"$(1,5)$","En":"$(1,5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f(1)-f(5)=0$","En":"$f(1)-f(5)=0$"},"CommonError":{"Ar":"الناتجان 5 و2.","En":"The outputs are five and two."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الناتجان 1 و5.","En":"The outputs are one and five."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الناتجان 5 و2.","En":"The outputs are five and two."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الناتجان 10 و1.","En":"The outputs are ten and one."},"Order":4}]}$mw$),
($mw$growth-v61-grade-9-quadratic-output-order-negative-inputs-1$mw$,$mw$quadratic-output-order-negative-inputs$mw$,$mw$middle-quadratic-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,27,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":27,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب مخرجات دالة","En":"Ordering function outputs"},"Question":{"Ar":"لدالة $f(x)=7-x^2$، أي مدخل من الخيارات يعطي أكبر قيمة للدالة؟","En":"For $f(x)=7-x^2$, which listed input gives the greatest output?"},"Options":[{"LatexCode":"-4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي −9.","En":"Gives negative nine."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 3.","En":"Gives three."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي −2.","En":"Gives negative two."}},{"LatexCode":"-1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ربع المدخلات الأربعة.","En":"Square all four inputs."},{"Ar":"اختر أصغر مربع.","En":"Choose the smallest square."}],"Solution":{"Idea":{"Ar":"كلما صغر مربع المدخل زادت قيمة الدالة.","En":"A smaller squared input gives a larger output."},"FormulaLatex":"f(x)=7-x^2","Steps":[{"Ar":"$f(-4)=-9$","En":"$f(-4)=-9$"},{"Ar":"$f(2)=3$","En":"$f(2)=3$"},{"Ar":"$f(3)=-2$","En":"$f(3)=-2$"},{"Ar":"$f(-1)=6$","En":"$f(-1)=6$"}],"Substitution":{"Ar":"$f(-1)=7-1$","En":"$f(-1)=7-1$"},"Result":{"Ar":"$-1$","En":"$-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6>3>-2>-9$","En":"$6>3>-2>-9$"},"CommonError":{"Ar":"يعطي −9.","En":"Gives negative nine."}}}$mw$::jsonb,$mw$كلما صغر مربع المدخل زادت قيمة الدالة.

$f(x)=7-x^2$

1. $f(-4)=-9$

2. $f(2)=3$

3. $f(3)=-2$

4. $f(-1)=6$

$f(-1)=7-1$

$-1$

$6>3>-2>-9$

يعطي −9.$mw$,$mw$A smaller squared input gives a larger output.

$f(x)=7-x^2$

1. $f(-4)=-9$

2. $f(2)=3$

3. $f(3)=-2$

4. $f(-1)=6$

$f(-1)=7-1$

$-1$

$6>3>-2>-9$

Gives negative nine.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ربع المدخلات الأربعة.","En":"Square all four inputs."},{"Ar":"اختر أصغر مربع.","En":"Choose the smallest square."}],"Solution":{"Idea":{"Ar":"كلما صغر مربع المدخل زادت قيمة الدالة.","En":"A smaller squared input gives a larger output."},"FormulaLatex":"f(x)=7-x^2","Steps":[{"Ar":"$f(-4)=-9$","En":"$f(-4)=-9$"},{"Ar":"$f(2)=3$","En":"$f(2)=3$"},{"Ar":"$f(3)=-2$","En":"$f(3)=-2$"},{"Ar":"$f(-1)=6$","En":"$f(-1)=6$"}],"Substitution":{"Ar":"$f(-1)=7-1$","En":"$f(-1)=7-1$"},"Result":{"Ar":"$-1$","En":"$-1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6>3>-2>-9$","En":"$6>3>-2>-9$"},"CommonError":{"Ar":"يعطي −9.","En":"Gives negative nine."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعطي −9.","En":"Gives negative nine."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 3.","En":"Gives three."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعطي −2.","En":"Gives negative two."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
