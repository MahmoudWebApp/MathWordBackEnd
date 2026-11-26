-- One-time owner-authorized v59 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v59-grade-8-exponent-law-nested-negative-reciprocal-1$mw$,$mw$exponent-law-nested-negative-reciprocal$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قوة مقلوب","En":"Power of a reciprocal"},"Question":{"Ar":"بسّط $\\left(\\frac{2}{3}\\right)^{-2}$.","En":"Simplify $\\left(\\frac{2}{3}\\right)^{-2}$."},"Options":[{"LatexCode":"\\frac94","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac49","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يقلب الكسر.","En":"Does not invert the fraction."}},{"LatexCode":"-\\frac49","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل الأس السالب كإشارة سالبة للناتج.","En":"Treats a negative exponent as a negative sign."}},{"LatexCode":"\\frac32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قلب الكسر دون تربيعه.","En":"Inverts without squaring."}}],"Hints":[{"Ar":"اقلب الكسر.","En":"Invert the fraction."},{"Ar":"ربع البسط والمقام.","En":"Square numerator and denominator."}],"Solution":{"Idea":{"Ar":"الأس السالب يعني مقلوب القوة الموجبة.","En":"A negative exponent gives the reciprocal of the positive power."},"FormulaLatex":"(a/b)^{-n}=(b/a)^n","Steps":[{"Ar":"$(3/2)^2=9/4$","En":"$(3/2)^2=9/4$"}],"Substitution":{"Ar":"$(3/2)^2$","En":"$(3/2)^2$"},"Result":{"Ar":"$\\frac94$","En":"$\\frac94$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(9/4)(4/9)=1$","En":"$(9/4)(4/9)=1$"},"CommonError":{"Ar":"لم يقلب الكسر.","En":"Does not invert the fraction."}}}$mw$::jsonb,$mw$الأس السالب يعني مقلوب القوة الموجبة.

$(a/b)^{-n}=(b/a)^n$

1. $(3/2)^2=9/4$

$(3/2)^2$

$\frac94$

$(9/4)(4/9)=1$

لم يقلب الكسر.$mw$,$mw$A negative exponent gives the reciprocal of the positive power.

$(a/b)^{-n}=(b/a)^n$

1. $(3/2)^2=9/4$

$(3/2)^2$

$\frac94$

$(9/4)(4/9)=1$

Does not invert the fraction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقلب الكسر.","En":"Invert the fraction."},{"Ar":"ربع البسط والمقام.","En":"Square numerator and denominator."}],"Solution":{"Idea":{"Ar":"الأس السالب يعني مقلوب القوة الموجبة.","En":"A negative exponent gives the reciprocal of the positive power."},"FormulaLatex":"(a/b)^{-n}=(b/a)^n","Steps":[{"Ar":"$(3/2)^2=9/4$","En":"$(3/2)^2=9/4$"}],"Substitution":{"Ar":"$(3/2)^2$","En":"$(3/2)^2$"},"Result":{"Ar":"$\\frac94$","En":"$\\frac94$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(9/4)(4/9)=1$","En":"$(9/4)(4/9)=1$"},"CommonError":{"Ar":"لم يقلب الكسر.","En":"Does not invert the fraction."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لم يقلب الكسر.","En":"Does not invert the fraction."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عامل الأس السالب كإشارة سالبة للناتج.","En":"Treats a negative exponent as a negative sign."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قلب الكسر دون تربيعه.","En":"Inverts without squaring."},"Order":4}]}$mw$),
($mw$growth-v59-grade-11-derivative-slope-sign-interval-1$mw$,$mw$derivative-slope-sign-interval$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إشارة ميل المماس","En":"Sign of tangent slope"},"Question":{"Ar":"لدالة $f(x)=x^2-6x+2$، أي مجال يكون فيه ميل المماس سالباً؟","En":"For $f(x)=x^2-6x+2$, on which interval is the tangent slope negative?"},"Options":[{"LatexCode":"x>3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المشتقة موجبة هناك.","En":"The derivative is positive there."}},{"LatexCode":"x\\le3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يتضمن موضع الميل الصفري.","En":"Includes the zero-slope point."}},{"LatexCode":"x<6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يقسم الحد الثابت على معامل x.","En":"Does not divide the constant by the coefficient of x."}},{"LatexCode":"x<3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اشتق كثيرة الحدود.","En":"Differentiate the polynomial."},{"Ar":"حل متراجحة المشتقة.","En":"Solve the derivative inequality."}],"Solution":{"Idea":{"Ar":"نشتق ونحدد متى تكون المشتقة أصغر من صفر.","En":"Differentiate and determine where the derivative is strictly negative."},"FormulaLatex":"f'(x)=2x-6","Steps":[{"Ar":"$2x<6$","En":"$2x<6$"},{"Ar":"$x<3$","En":"$x<3$"}],"Substitution":{"Ar":"$2x-6<0$","En":"$2x-6<0$"},"Result":{"Ar":"$x<3$","En":"$x<3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(2)=-2,\\quad f'(4)=2$","En":"$f'(2)=-2,\\quad f'(4)=2$"},"CommonError":{"Ar":"المشتقة موجبة هناك.","En":"The derivative is positive there."}}}$mw$::jsonb,$mw$نشتق ونحدد متى تكون المشتقة أصغر من صفر.

$f'(x)=2x-6$

1. $2x<6$

2. $x<3$

$2x-6<0$

$x<3$

$f'(2)=-2,\quad f'(4)=2$

المشتقة موجبة هناك.$mw$,$mw$Differentiate and determine where the derivative is strictly negative.

$f'(x)=2x-6$

1. $2x<6$

2. $x<3$

$2x-6<0$

$x<3$

$f'(2)=-2,\quad f'(4)=2$

The derivative is positive there.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشتق كثيرة الحدود.","En":"Differentiate the polynomial."},{"Ar":"حل متراجحة المشتقة.","En":"Solve the derivative inequality."}],"Solution":{"Idea":{"Ar":"نشتق ونحدد متى تكون المشتقة أصغر من صفر.","En":"Differentiate and determine where the derivative is strictly negative."},"FormulaLatex":"f'(x)=2x-6","Steps":[{"Ar":"$2x<6$","En":"$2x<6$"},{"Ar":"$x<3$","En":"$x<3$"}],"Substitution":{"Ar":"$2x-6<0$","En":"$2x-6<0$"},"Result":{"Ar":"$x<3$","En":"$x<3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$f'(2)=-2,\\quad f'(4)=2$","En":"$f'(2)=-2,\\quad f'(4)=2$"},"CommonError":{"Ar":"المشتقة موجبة هناك.","En":"The derivative is positive there."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المشتقة موجبة هناك.","En":"The derivative is positive there."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يتضمن موضع الميل الصفري.","En":"Includes the zero-slope point."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لم يقسم الحد الثابت على معامل x.","En":"Does not divide the constant by the coefficient of x."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v59-grade-7-triangle-angle-largest-smallest-difference-isosceles-1$mw$,$mw$triangle-angle-largest-smallest-difference-isosceles$mw$,$mw$middle-triangle-angles$mw$,$mw$grade-7$mw$,7,2,8,35,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":35,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق زاويتين في مثلث متساوي الساقين","En":"Angle difference in an isosceles triangle"},"Question":{"Ar":"في مثلث متساوي الساقين قياس كل زاوية عند القاعدة 72°. بكم تزيد زاوية القاعدة على زاوية الرأس؟","En":"In an isosceles triangle each base angle measures 72°. By how many degrees does a base angle exceed the apex angle?"},"Options":[{"LatexCode":"144","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع زاويتي القاعدة.","En":"This is the sum of base angles."}},{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"72","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا قياس زاوية القاعدة.","En":"This is a base angle."}},{"LatexCode":"108","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح زاوية قاعدة واحدة من 180.","En":"Subtracts just one base angle from 180."}}],"Hints":[{"Ar":"اجمع زاويتي القاعدة.","En":"Add the base angles."},{"Ar":"احسب زاوية الرأس ثم الفرق.","En":"Find the apex angle, then the difference."}],"Solution":{"Idea":{"Ar":"نطرح مجموع زاويتي القاعدة من 180 ثم نحسب الفرق.","En":"Subtract both base angles from 180, then find the difference."},"FormulaLatex":"C=180-2\\cdot72","Steps":[{"Ar":"$C=36$","En":"$C=36$"},{"Ar":"$72-36=36$","En":"$72-36=36$"}],"Substitution":{"Ar":"$72-(180-144)$","En":"$72-(180-144)$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$72+72+36=180$","En":"$72+72+36=180$"},"CommonError":{"Ar":"هذا قياس زاوية القاعدة.","En":"This is a base angle."}}}$mw$::jsonb,$mw$نطرح مجموع زاويتي القاعدة من 180 ثم نحسب الفرق.

$C=180-2\cdot72$

1. $C=36$

2. $72-36=36$

$72-(180-144)$

$36$ °

$72+72+36=180$

هذا قياس زاوية القاعدة.$mw$,$mw$Subtract both base angles from 180, then find the difference.

$C=180-2\cdot72$

1. $C=36$

2. $72-36=36$

$72-(180-144)$

$36$ °

$72+72+36=180$

This is a base angle.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع زاويتي القاعدة.","En":"Add the base angles."},{"Ar":"احسب زاوية الرأس ثم الفرق.","En":"Find the apex angle, then the difference."}],"Solution":{"Idea":{"Ar":"نطرح مجموع زاويتي القاعدة من 180 ثم نحسب الفرق.","En":"Subtract both base angles from 180, then find the difference."},"FormulaLatex":"C=180-2\\cdot72","Steps":[{"Ar":"$C=36$","En":"$C=36$"},{"Ar":"$72-36=36$","En":"$72-36=36$"}],"Substitution":{"Ar":"$72-(180-144)$","En":"$72-(180-144)$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$72+72+36=180$","En":"$72+72+36=180$"},"CommonError":{"Ar":"هذا قياس زاوية القاعدة.","En":"This is a base angle."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع زاويتي القاعدة.","En":"This is the sum of base angles."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا قياس زاوية القاعدة.","En":"This is a base angle."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح زاوية قاعدة واحدة من 180.","En":"Subtracts just one base angle from 180."},"Order":4}]}$mw$),
($mw$growth-v59-grade-3-multiplication-distributive-missing-rectangle-piece-1$mw$,$mw$multiplication-distributive-missing-rectangle-piece$mw$,$mw$primary-multiplication$mw$,$mw$grade-3$mw$,3,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تفكيك حاصل ضرب","En":"Splitting a product"},"Question":{"Ar":"نعلم أن $8\\times7=56$. ما حاصل $8\\times9$ باستعمال النتيجة المعطاة؟","En":"Given $8\\times7=56$, find $8\\times9$ using that result."},"Options":[{"LatexCode":"72","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"58","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 2 بدلاً من مجموعتين من 8.","En":"Adds two rather than two groups of eight."}},{"LatexCode":"64","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف مجموعة واحدة فقط.","En":"Adds only one group."}},{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف ثلاث مجموعات.","En":"Adds three groups."}}],"Hints":[{"Ar":"كم مجموعة إضافية من 8؟","En":"How many extra groups of eight?"},{"Ar":"أضف قيمة المجموعتين.","En":"Add the value of both extra groups."}],"Solution":{"Idea":{"Ar":"تسع مجموعات تساوي سبع مجموعات ومجموعتين إضافيتين.","En":"Nine groups equal seven groups plus two extra groups."},"FormulaLatex":"8\\cdot9=8\\cdot7+8\\cdot2","Steps":[{"Ar":"$8\\cdot2=16$","En":"$8\\cdot2=16$"},{"Ar":"$56+16=72$","En":"$56+16=72$"}],"Substitution":{"Ar":"$56+16$","En":"$56+16$"},"Result":{"Ar":"$72$","En":"$72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$72-56=16$","En":"$72-56=16$"},"CommonError":{"Ar":"أضاف 2 بدلاً من مجموعتين من 8.","En":"Adds two rather than two groups of eight."}}}$mw$::jsonb,$mw$تسع مجموعات تساوي سبع مجموعات ومجموعتين إضافيتين.

$8\cdot9=8\cdot7+8\cdot2$

1. $8\cdot2=16$

2. $56+16=72$

$56+16$

$72$

$72-56=16$

أضاف 2 بدلاً من مجموعتين من 8.$mw$,$mw$Nine groups equal seven groups plus two extra groups.

$8\cdot9=8\cdot7+8\cdot2$

1. $8\cdot2=16$

2. $56+16=72$

$56+16$

$72$

$72-56=16$

Adds two rather than two groups of eight.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم مجموعة إضافية من 8؟","En":"How many extra groups of eight?"},{"Ar":"أضف قيمة المجموعتين.","En":"Add the value of both extra groups."}],"Solution":{"Idea":{"Ar":"تسع مجموعات تساوي سبع مجموعات ومجموعتين إضافيتين.","En":"Nine groups equal seven groups plus two extra groups."},"FormulaLatex":"8\\cdot9=8\\cdot7+8\\cdot2","Steps":[{"Ar":"$8\\cdot2=16$","En":"$8\\cdot2=16$"},{"Ar":"$56+16=72$","En":"$56+16=72$"}],"Substitution":{"Ar":"$56+16$","En":"$56+16$"},"Result":{"Ar":"$72$","En":"$72$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$72-56=16$","En":"$72-56=16$"},"CommonError":{"Ar":"أضاف 2 بدلاً من مجموعتين من 8.","En":"Adds two rather than two groups of eight."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 2 بدلاً من مجموعتين من 8.","En":"Adds two rather than two groups of eight."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف مجموعة واحدة فقط.","En":"Adds only one group."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف ثلاث مجموعات.","En":"Adds three groups."},"Order":4}]}$mw$),
($mw$growth-v59-grade-3-division-check-quotient-remainder-bound-1$mw$,$mw$division-check-quotient-remainder-bound$mw$,$mw$primary-division$mw$,$mw$grade-3$mw$,3,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"اختبار باقي القسمة","En":"Checking a remainder"},"Question":{"Ar":"أي كتابة تمثل قسمة 29 على 4 مع خارج قسمة صحيح وباقٍ غير سالب وأصغر من 4؟","En":"Which expression represents division of 29 by 4 with an integer quotient and a nonnegative remainder less than four?"},"Options":[{"LatexCode":"4\\cdot6+5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الباقي 5 ليس أصغر من 4.","En":"Remainder five is not smaller than four."}},{"LatexCode":"4\\cdot8-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الباقي لا يكون سالباً هنا.","En":"The remainder cannot be negative here."}},{"LatexCode":"4\\cdot5+9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الباقي 9 أكبر من 4.","En":"Remainder nine exceeds four."}},{"LatexCode":"4\\cdot7+1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"أوجد أكبر مضاعف لـ4 لا يتجاوز 29.","En":"Find the greatest multiple of four not above 29."},{"Ar":"تأكد أن الباقي أصغر من 4.","En":"Check that the remainder is below four."}],"Solution":{"Idea":{"Ar":"نختار حاصل القسمة الصحيح بحيث يكون الباقي من صفر إلى ثلاثة.","En":"Choose the quotient so the remainder is from zero through three."},"FormulaLatex":"29=4q+r,\\quad0\\le r<4","Steps":[{"Ar":"$29-28=1$","En":"$29-28=1$"}],"Substitution":{"Ar":"$29-4\\cdot7$","En":"$29-4\\cdot7$"},"Result":{"Ar":"$4\\cdot7+1$","En":"$4\\cdot7+1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot7+1=29$","En":"$4\\cdot7+1=29$"},"CommonError":{"Ar":"الباقي 5 ليس أصغر من 4.","En":"Remainder five is not smaller than four."}}}$mw$::jsonb,$mw$نختار حاصل القسمة الصحيح بحيث يكون الباقي من صفر إلى ثلاثة.

$29=4q+r,\quad0\le r<4$

1. $29-28=1$

$29-4\cdot7$

$4\cdot7+1$

$4\cdot7+1=29$

الباقي 5 ليس أصغر من 4.$mw$,$mw$Choose the quotient so the remainder is from zero through three.

$29=4q+r,\quad0\le r<4$

1. $29-28=1$

$29-4\cdot7$

$4\cdot7+1$

$4\cdot7+1=29$

Remainder five is not smaller than four.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"أوجد أكبر مضاعف لـ4 لا يتجاوز 29.","En":"Find the greatest multiple of four not above 29."},{"Ar":"تأكد أن الباقي أصغر من 4.","En":"Check that the remainder is below four."}],"Solution":{"Idea":{"Ar":"نختار حاصل القسمة الصحيح بحيث يكون الباقي من صفر إلى ثلاثة.","En":"Choose the quotient so the remainder is from zero through three."},"FormulaLatex":"29=4q+r,\\quad0\\le r<4","Steps":[{"Ar":"$29-28=1$","En":"$29-28=1$"}],"Substitution":{"Ar":"$29-4\\cdot7$","En":"$29-4\\cdot7$"},"Result":{"Ar":"$4\\cdot7+1$","En":"$4\\cdot7+1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot7+1=29$","En":"$4\\cdot7+1=29$"},"CommonError":{"Ar":"الباقي 5 ليس أصغر من 4.","En":"Remainder five is not smaller than four."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الباقي 5 ليس أصغر من 4.","En":"Remainder five is not smaller than four."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الباقي لا يكون سالباً هنا.","En":"The remainder cannot be negative here."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الباقي 9 أكبر من 4.","En":"Remainder nine exceeds four."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
