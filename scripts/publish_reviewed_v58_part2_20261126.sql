-- One-time owner-authorized v58 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v58-grade-11-derivative-polynomial-identify-original-up-to-constant-1$mw$,$mw$derivative-polynomial-identify-original-up-to-constant$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز كثيرة حدود من مشتقتها","En":"Identifying a polynomial from its derivative"},"Question":{"Ar":"أي دالة من الخيارات مشتقتها $6x^2-4$؟","En":"Which of the following functions has derivative $6x^2-4$?"},"Options":[{"LatexCode":"2x^3-4+7x","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x²+7.","En":"Its derivative is 6x²+7."}},{"LatexCode":"3x^2-4x+7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x−4.","En":"Its derivative is 6x−4."}},{"LatexCode":"2x^3-4x+7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6x^3-4x+7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."}}],"Hints":[{"Ar":"اشتق الحد التكعيبي.","En":"Differentiate the cubic term."},{"Ar":"الثابت وحده مشتقته صفر.","En":"A constant alone has zero derivative."}],"Solution":{"Idea":{"Ar":"نشتق كل خيار ونقارن بالمشتقة المطلوبة.","En":"Differentiate the choices and compare with the required derivative."},"FormulaLatex":"\\frac{d}{dx}x^n=nx^{n-1}","Steps":[{"Ar":"$6x^2-4+0=6x^2-4$","En":"$6x^2-4+0=6x^2-4$"}],"Substitution":{"Ar":"$\\frac{d}{dx}(2x^3-4x+7)$","En":"$\\frac{d}{dx}(2x^3-4x+7)$"},"Result":{"Ar":"$2x^3-4x+7$","En":"$2x^3-4x+7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(1)=2$","En":"$f'(1)=2$"},"CommonError":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."}}}$mw$::jsonb,$mw$نشتق كل خيار ونقارن بالمشتقة المطلوبة.

$\frac{d}{dx}x^n=nx^{n-1}$

1. $6x^2-4+0=6x^2-4$

$\frac{d}{dx}(2x^3-4x+7)$

$2x^3-4x+7$

$f'(1)=2$

مشتقتها 18x²−4.$mw$,$mw$Differentiate the choices and compare with the required derivative.

$\frac{d}{dx}x^n=nx^{n-1}$

1. $6x^2-4+0=6x^2-4$

$\frac{d}{dx}(2x^3-4x+7)$

$2x^3-4x+7$

$f'(1)=2$

Its derivative is 18x²−4.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشتق الحد التكعيبي.","En":"Differentiate the cubic term."},{"Ar":"الثابت وحده مشتقته صفر.","En":"A constant alone has zero derivative."}],"Solution":{"Idea":{"Ar":"نشتق كل خيار ونقارن بالمشتقة المطلوبة.","En":"Differentiate the choices and compare with the required derivative."},"FormulaLatex":"\\frac{d}{dx}x^n=nx^{n-1}","Steps":[{"Ar":"$6x^2-4+0=6x^2-4$","En":"$6x^2-4+0=6x^2-4$"}],"Substitution":{"Ar":"$\\frac{d}{dx}(2x^3-4x+7)$","En":"$\\frac{d}{dx}(2x^3-4x+7)$"},"Result":{"Ar":"$2x^3-4x+7$","En":"$2x^3-4x+7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(1)=2$","En":"$f'(1)=2$"},"CommonError":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x²+7.","En":"Its derivative is 6x²+7."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 6x−4.","En":"Its derivative is 6x−4."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مشتقتها 18x²−4.","En":"Its derivative is 18x²−4."},"Order":4}]}$mw$),
($mw$growth-v58-grade-7-circle-area-diameter-scale-inverse-1$mw$,$mw$circle-area-diameter-scale-inverse$mw$,$mw$middle-circle-area$mw$,$mw$grade-7$mw$,7,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير مساحة دائرة بتغير قطرها","En":"Circle area after diameter changes"},"Question":{"Ar":"إذا أصبح قطر دائرة ثلاثة أمثال قطرها الأصلي، فكم مرة تصبح مساحتها مقارنة بمساحتها الأصلية؟","En":"If a circle's diameter is tripled, how many times its original area is its new area?"},"Options":[{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"رفع معامل الطول للقوة الثالثة.","En":"Cubes the length scale."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف معامل الطول فقط.","En":"Only doubles the length scale."}}],"Hints":[{"Ar":"كيف يتغير نصف القطر؟","En":"How does the radius change?"},{"Ar":"ربع معامل تغير الطول.","En":"Square the length scale."}],"Solution":{"Idea":{"Ar":"نصف القطر يتغير بالمعامل نفسه، والمساحة تتناسب مع مربعه.","En":"The radius scales by the same factor, and area scales with its square."},"FormulaLatex":"A'=\\pi(3r)^2","Steps":[{"Ar":"$A'=9A$","En":"$A'=9A$"}],"Substitution":{"Ar":"$A'/A=9\\pi r^2/(\\pi r^2)$","En":"$A'/A=9\\pi r^2/(\\pi r^2)$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$r=1:\\ 9\\pi/\\pi=9$","En":"$r=1:\\ 9\\pi/\\pi=9$"},"CommonError":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."}}}$mw$::jsonb,$mw$نصف القطر يتغير بالمعامل نفسه، والمساحة تتناسب مع مربعه.

$A'=\pi(3r)^2$

1. $A'=9A$

$A'/A=9\pi r^2/(\pi r^2)$

$9$

$r=1:\ 9\pi/\pi=9$

عامل المساحة كأنه طول.$mw$,$mw$The radius scales by the same factor, and area scales with its square.

$A'=\pi(3r)^2$

1. $A'=9A$

$A'/A=9\pi r^2/(\pi r^2)$

$9$

$r=1:\ 9\pi/\pi=9$

Treats area as a length.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كيف يتغير نصف القطر؟","En":"How does the radius change?"},{"Ar":"ربع معامل تغير الطول.","En":"Square the length scale."}],"Solution":{"Idea":{"Ar":"نصف القطر يتغير بالمعامل نفسه، والمساحة تتناسب مع مربعه.","En":"The radius scales by the same factor, and area scales with its square."},"FormulaLatex":"A'=\\pi(3r)^2","Steps":[{"Ar":"$A'=9A$","En":"$A'=9A$"}],"Substitution":{"Ar":"$A'/A=9\\pi r^2/(\\pi r^2)$","En":"$A'/A=9\\pi r^2/(\\pi r^2)$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$r=1:\\ 9\\pi/\\pi=9$","En":"$r=1:\\ 9\\pi/\\pi=9$"},"CommonError":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"رفع معامل الطول للقوة الثالثة.","En":"Cubes the length scale."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عامل المساحة كأنه طول.","En":"Treats area as a length."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف معامل الطول فقط.","En":"Only doubles the length scale."},"Order":4}]}$mw$),
($mw$growth-v58-grade-12-trig-identity-squared-ratio-reconstruct-cotangent-1$mw$,$mw$trig-identity-squared-ratio-reconstruct-cotangent$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج مربع ظل التمام","En":"Recovering cotangent squared"},"Question":{"Ar":"إذا كان $\\sin^2\\theta=\\frac29$، فما قيمة $\\cot^2\\theta$؟","En":"If $\\sin^2\\theta=\\frac29$, find $\\cot^2\\theta$."},"Options":[{"LatexCode":"\\frac92","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع قاطع التمام.","En":"This is cosecant squared."}},{"LatexCode":"\\frac72","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."}},{"LatexCode":"\\frac79","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع جيب التمام وحده.","En":"This is cosine squared alone."}}],"Hints":[{"Ar":"استعمل مجموع المربعين.","En":"Use the sum-of-squares identity."},{"Ar":"ظل التمام هو جيب التمام على الجيب.","En":"Cotangent is cosine over sine."}],"Solution":{"Idea":{"Ar":"نوجد مربع جيب التمام ثم نقسمه على مربع الجيب.","En":"Find cosine squared, then divide by sine squared."},"FormulaLatex":"\\cot^2\\theta=(1-\\sin^2\\theta)/\\sin^2\\theta","Steps":[{"Ar":"$\\cos^2\\theta=7/9$","En":"$\\cos^2\\theta=7/9$"},{"Ar":"$(7/9)/(2/9)=7/2$","En":"$(7/9)/(2/9)=7/2$"}],"Substitution":{"Ar":"$(1-2/9)/(2/9)$","En":"$(1-2/9)/(2/9)$"},"Result":{"Ar":"$\\frac72$","En":"$\\frac72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1+7/2=9/2$","En":"$1+7/2=9/2$"},"CommonError":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."}}}$mw$::jsonb,$mw$نوجد مربع جيب التمام ثم نقسمه على مربع الجيب.

$\cot^2\theta=(1-\sin^2\theta)/\sin^2\theta$

1. $\cos^2\theta=7/9$

2. $(7/9)/(2/9)=7/2$

$(1-2/9)/(2/9)$

$\frac72$

$1+7/2=9/2$

عكس نسبة جيب التمام إلى الجيب.$mw$,$mw$Find cosine squared, then divide by sine squared.

$\cot^2\theta=(1-\sin^2\theta)/\sin^2\theta$

1. $\cos^2\theta=7/9$

2. $(7/9)/(2/9)=7/2$

$(1-2/9)/(2/9)$

$\frac72$

$1+7/2=9/2$

Inverts the cosine-to-sine ratio.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل مجموع المربعين.","En":"Use the sum-of-squares identity."},{"Ar":"ظل التمام هو جيب التمام على الجيب.","En":"Cotangent is cosine over sine."}],"Solution":{"Idea":{"Ar":"نوجد مربع جيب التمام ثم نقسمه على مربع الجيب.","En":"Find cosine squared, then divide by sine squared."},"FormulaLatex":"\\cot^2\\theta=(1-\\sin^2\\theta)/\\sin^2\\theta","Steps":[{"Ar":"$\\cos^2\\theta=7/9$","En":"$\\cos^2\\theta=7/9$"},{"Ar":"$(7/9)/(2/9)=7/2$","En":"$(7/9)/(2/9)=7/2$"}],"Substitution":{"Ar":"$(1-2/9)/(2/9)$","En":"$(1-2/9)/(2/9)$"},"Result":{"Ar":"$\\frac72$","En":"$\\frac72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1+7/2=9/2$","En":"$1+7/2=9/2$"},"CommonError":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع قاطع التمام.","En":"This is cosecant squared."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس نسبة جيب التمام إلى الجيب.","En":"Inverts the cosine-to-sine ratio."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع جيب التمام وحده.","En":"This is cosine squared alone."},"Order":4}]}$mw$),
($mw$growth-v58-grade-2-solid-pyramid-base-face-count-1$mw$,$mw$solid-pyramid-base-face-count$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أوجه هرم مربع القاعدة","En":"Faces of a square pyramid"},"Question":{"Ar":"هرم قاعدته مربع وله وجه مثلث عند كل ضلع من أضلاع القاعدة. كم وجهاً مستوياً له إجمالاً؟","En":"A square-based pyramid has one triangular face along each base edge. How many flat faces does it have altogether?"},"Options":[{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف وجهاً غير موجود.","En":"Adds a nonexistent face."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين الأوجه والحواف.","En":"Confuses faces with edges."}}],"Hints":[{"Ar":"عد الأوجه المثلثة.","En":"Count triangular faces."},{"Ar":"لا تنس القاعدة المربعة.","En":"Include the square base."}],"Solution":{"Idea":{"Ar":"للقاعدة أربعة أضلاع، ولكل ضلع وجه مثلث، ونضيف القاعدة.","En":"Four base edges give four triangular faces, plus the base."},"FormulaLatex":"4+1","Steps":[{"Ar":"$4+1=5$","En":"$4+1=5$"}],"Substitution":{"Ar":"$4+1$","En":"$4+1$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5-1=4$","En":"$5-1=4$"},"CommonError":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."}}}$mw$::jsonb,$mw$للقاعدة أربعة أضلاع، ولكل ضلع وجه مثلث، ونضيف القاعدة.

$4+1$

1. $4+1=5$

$4+1$

$5$

$5-1=4$

عد الأوجه المثلثة فقط.$mw$,$mw$Four base edges give four triangular faces, plus the base.

$4+1$

1. $4+1=5$

$4+1$

$5$

$5-1=4$

Counts triangular faces only.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد الأوجه المثلثة.","En":"Count triangular faces."},{"Ar":"لا تنس القاعدة المربعة.","En":"Include the square base."}],"Solution":{"Idea":{"Ar":"للقاعدة أربعة أضلاع، ولكل ضلع وجه مثلث، ونضيف القاعدة.","En":"Four base edges give four triangular faces, plus the base."},"FormulaLatex":"4+1","Steps":[{"Ar":"$4+1=5$","En":"$4+1=5$"}],"Substitution":{"Ar":"$4+1$","En":"$4+1$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5-1=4$","En":"$5-1=4$"},"CommonError":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عد الأوجه المثلثة فقط.","En":"Counts triangular faces only."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف وجهاً غير موجود.","En":"Adds a nonexistent face."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خلط بين الأوجه والحواف.","En":"Confuses faces with edges."},"Order":4}]}$mw$),
($mw$growth-v58-grade-2-shape-partition-quarter-recombine-count-1$mw$,$mw$shape-partition-quarter-recombine-count$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إعادة تركيب أنصاف من أرباع","En":"Recombining quarters into halves"},"Question":{"Ar":"قُسم مربع إلى أربعة أجزاء متساوية المساحة. نريد تجميع الأجزاء على هيئة مجموعات، كل مجموعة مساحتها نصف مساحة المربع. كم مجموعة يمكن تكوينها باستعمال جميع الأجزاء دون تداخل؟","En":"A square is divided into four equal-area parts. Group the parts so each group has half the square's area. How many groups use all parts without overlap?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يتطلب ستة أرباع.","En":"Would require six quarters."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد الأرباع منفردة لا الأنصاف.","En":"Counts separate quarters rather than halves."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"كم ربعاً يشكل نصفاً؟","En":"How many quarters make one half?"},{"Ar":"قسّم الأرباع الأربعة إلى أزواج.","En":"Group four quarters into pairs."}],"Solution":{"Idea":{"Ar":"كل نصف يتألف من ربعين.","En":"Each half consists of two quarters."},"FormulaLatex":"4/2","Steps":[{"Ar":"$4/2=2$","En":"$4/2=2$"}],"Substitution":{"Ar":"$4/2$","En":"$4/2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot(1/2)=1$","En":"$2\\cdot(1/2)=1$"},"CommonError":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."}}}$mw$::jsonb,$mw$كل نصف يتألف من ربعين.

$4/2$

1. $4/2=2$

$4/2$

$2$

$2\cdot(1/2)=1$

لا يستعمل كل الأجزاء.$mw$,$mw$Each half consists of two quarters.

$4/2$

1. $4/2=2$

$4/2$

$2$

$2\cdot(1/2)=1$

Does not use all parts.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم ربعاً يشكل نصفاً؟","En":"How many quarters make one half?"},{"Ar":"قسّم الأرباع الأربعة إلى أزواج.","En":"Group four quarters into pairs."}],"Solution":{"Idea":{"Ar":"كل نصف يتألف من ربعين.","En":"Each half consists of two quarters."},"FormulaLatex":"4/2","Steps":[{"Ar":"$4/2=2$","En":"$4/2=2$"}],"Substitution":{"Ar":"$4/2$","En":"$4/2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot(1/2)=1$","En":"$2\\cdot(1/2)=1$"},"CommonError":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يستعمل كل الأجزاء.","En":"Does not use all parts."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يتطلب ستة أرباع.","En":"Would require six quarters."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعد الأرباع منفردة لا الأنصاف.","En":"Counts separate quarters rather than halves."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);

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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v58 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
