-- One-time owner-authorized v60 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v60-grade-7-circle-inscribed-square-area-unused-1$mw$,$mw$circle-inscribed-square-area-unused$mw$,$mw$middle-circle-area$mw$,$mw$grade-7$mw$,7,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة الجزء خارج قرص","En":"Area outside a disk"},"Question":{"Ar":"قرص دائري قطره يساوي طول ضلع مربع طوله 10 سم، والقرص داخل المربع. ما مساحة الجزء من المربع خارج القرص؟","En":"A disk inside a square of side 10 cm has diameter equal to the side of the square. What is the area of the square outside the disk?"},"Options":[{"LatexCode":"100-25\\pi","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"100-100\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل القطر بدلاً من نصف القطر.","En":"Uses diameter as radius."}},{"LatexCode":"100-5\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يربع نصف القطر.","En":"Does not square the radius."}},{"LatexCode":"25\\pi","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة القرص وحده.","En":"This is the disk area alone."}}],"Hints":[{"Ar":"احسب نصف القطر من القطر.","En":"Find the radius from the diameter."},{"Ar":"اطرح مساحة القرص من مساحة المربع.","En":"Subtract the disk area from the square area."}],"Solution":{"Idea":{"Ar":"نطرح مساحة القرص من مساحة المربع.","En":"Subtract the disk area from the square area."},"FormulaLatex":"A=s^2-\\pi(s/2)^2","Steps":[{"Ar":"$r=10/2=5$","En":"$r=10/2=5$"},{"Ar":"$A=100-25\\pi$","En":"$A=100-25\\pi$"}],"Substitution":{"Ar":"$10^2-\\pi(10/2)^2$","En":"$10^2-\\pi(10/2)^2$"},"Result":{"Ar":"$100-25\\pi$","En":"$100-25\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$(100-25\\pi)+25\\pi=100$","En":"$(100-25\\pi)+25\\pi=100$"},"CommonError":{"Ar":"استعمل القطر بدلاً من نصف القطر.","En":"Uses diameter as radius."}}}$mw$::jsonb,$mw$نطرح مساحة القرص من مساحة المربع.

$A=s^2-\pi(s/2)^2$

1. $r=10/2=5$

2. $A=100-25\pi$

$10^2-\pi(10/2)^2$

$100-25\pi$ سم²

$(100-25\pi)+25\pi=100$

استعمل القطر بدلاً من نصف القطر.$mw$,$mw$Subtract the disk area from the square area.

$A=s^2-\pi(s/2)^2$

1. $r=10/2=5$

2. $A=100-25\pi$

$10^2-\pi(10/2)^2$

$100-25\pi$ cm²

$(100-25\pi)+25\pi=100$

Uses diameter as radius.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب نصف القطر من القطر.","En":"Find the radius from the diameter."},{"Ar":"اطرح مساحة القرص من مساحة المربع.","En":"Subtract the disk area from the square area."}],"Solution":{"Idea":{"Ar":"نطرح مساحة القرص من مساحة المربع.","En":"Subtract the disk area from the square area."},"FormulaLatex":"A=s^2-\\pi(s/2)^2","Steps":[{"Ar":"$r=10/2=5$","En":"$r=10/2=5$"},{"Ar":"$A=100-25\\pi$","En":"$A=100-25\\pi$"}],"Substitution":{"Ar":"$10^2-\\pi(10/2)^2$","En":"$10^2-\\pi(10/2)^2$"},"Result":{"Ar":"$100-25\\pi$","En":"$100-25\\pi$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$(100-25\\pi)+25\\pi=100$","En":"$(100-25\\pi)+25\\pi=100$"},"CommonError":{"Ar":"استعمل القطر بدلاً من نصف القطر.","En":"Uses diameter as radius."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل القطر بدلاً من نصف القطر.","En":"Uses diameter as radius."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لم يربع نصف القطر.","En":"Does not square the radius."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة القرص وحده.","En":"This is the disk area alone."},"Order":4}]}$mw$),
($mw$growth-v60-grade-7-triangle-angle-change-preserve-third-1$mw$,$mw$triangle-angle-change-preserve-third$mw$,$mw$middle-triangle-angles$mw$,$mw$grade-7$mw$,7,2,8,35,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":35,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر تغير زاويتين على الثالثة","En":"Effect of changing two angles"},"Question":{"Ar":"في مثلث تغيّر قياس الزاوية A بزيادة 12°، وتغيّر قياس B بنقصان 5°، وبقي الشكل مثلثاً. ما تغير قياس الزاوية C الموقّع؟","En":"In a triangle, angle A increases by 12° and angle B decreases by 5°, while the shape remains a triangle. What is the signed change in angle C?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاد الثالثة بدلاً من إنقاصها.","En":"Increases the third instead of decreasing it."}},{"LatexCode":"-17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع مقدارَي التغير دون مراعاة الإشارة.","En":"Adds change magnitudes without signs."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المقدارين وزاد الثالثة.","En":"Adds the magnitudes and increases the third."}},{"LatexCode":"-7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب صافي تغير الزاويتين الأوليين.","En":"Find the net change in the first two angles."},{"Ar":"اجعل مجموع التغيرات صفراً.","En":"Make the total change zero."}],"Solution":{"Idea":{"Ar":"مجموع تغيرات الزوايا يساوي صفراً لأن مجموعها ثابت.","En":"The angle changes sum to zero because the total is fixed."},"FormulaLatex":"\\Delta A+\\Delta B+\\Delta C=0","Steps":[{"Ar":"$7+\\Delta C=0$","En":"$7+\\Delta C=0$"},{"Ar":"$\\Delta C=-7$","En":"$\\Delta C=-7$"}],"Substitution":{"Ar":"$12-5+\\Delta C=0$","En":"$12-5+\\Delta C=0$"},"Result":{"Ar":"$-7$","En":"$-7$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$12-5-7=0$","En":"$12-5-7=0$"},"CommonError":{"Ar":"زاد الثالثة بدلاً من إنقاصها.","En":"Increases the third instead of decreasing it."}}}$mw$::jsonb,$mw$مجموع تغيرات الزوايا يساوي صفراً لأن مجموعها ثابت.

$\Delta A+\Delta B+\Delta C=0$

1. $7+\Delta C=0$

2. $\Delta C=-7$

$12-5+\Delta C=0$

$-7$ °

$12-5-7=0$

زاد الثالثة بدلاً من إنقاصها.$mw$,$mw$The angle changes sum to zero because the total is fixed.

$\Delta A+\Delta B+\Delta C=0$

1. $7+\Delta C=0$

2. $\Delta C=-7$

$12-5+\Delta C=0$

$-7$ °

$12-5-7=0$

Increases the third instead of decreasing it.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب صافي تغير الزاويتين الأوليين.","En":"Find the net change in the first two angles."},{"Ar":"اجعل مجموع التغيرات صفراً.","En":"Make the total change zero."}],"Solution":{"Idea":{"Ar":"مجموع تغيرات الزوايا يساوي صفراً لأن مجموعها ثابت.","En":"The angle changes sum to zero because the total is fixed."},"FormulaLatex":"\\Delta A+\\Delta B+\\Delta C=0","Steps":[{"Ar":"$7+\\Delta C=0$","En":"$7+\\Delta C=0$"},{"Ar":"$\\Delta C=-7$","En":"$\\Delta C=-7$"}],"Substitution":{"Ar":"$12-5+\\Delta C=0$","En":"$12-5+\\Delta C=0$"},"Result":{"Ar":"$-7$","En":"$-7$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$12-5-7=0$","En":"$12-5-7=0$"},"CommonError":{"Ar":"زاد الثالثة بدلاً من إنقاصها.","En":"Increases the third instead of decreasing it."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"زاد الثالثة بدلاً من إنقاصها.","En":"Increases the third instead of decreasing it."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع مقدارَي التغير دون مراعاة الإشارة.","En":"Adds change magnitudes without signs."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع المقدارين وزاد الثالثة.","En":"Adds the magnitudes and increases the third."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v60-grade-7-vertical-angles-acute-obtuse-difference-1$mw$,$mw$vertical-angles-acute-obtuse-difference$mw$,$mw$middle-vertical-angles$mw$,$mw$grade-7$mw$,7,2,8,38,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":38,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق الزاويتين عند تقاطع مستقيمين","En":"Angle difference at intersecting lines"},"Question":{"Ar":"يتقاطع مستقيمان غير متعامدين. الفرق بين قياس الزاوية المنفرجة والحادة هو 38°. ما قياس إحدى الزاويتين الحادتين؟","En":"Two nonperpendicular lines intersect. The obtuse angle exceeds the acute angle by 38°. Find the measure of either acute angle."},"Options":[{"LatexCode":"109","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا قياس الزاوية المنفرجة.","En":"This is the obtuse angle."}},{"LatexCode":"142","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الزاويتين الحادتين.","En":"This is the sum of the two acute angles."}},{"LatexCode":"71","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق المعطى.","En":"This is the given difference."}}],"Hints":[{"Ar":"سمّ الزاوية الحادة x.","En":"Call the acute angle x."},{"Ar":"عبّر عن المنفرجة بـ x+38.","En":"Express the obtuse angle as x+38."}],"Solution":{"Idea":{"Ar":"الزاويتان المتجاورتان مجموعهما 180° والمتقابلتان متساويتان.","En":"Adjacent angles total 180°, and opposite angles are equal."},"FormulaLatex":"x+(x+38)=180","Steps":[{"Ar":"$2x=142$","En":"$2x=142$"},{"Ar":"$x=71$","En":"$x=71$"}],"Substitution":{"Ar":"$2x=180-38$","En":"$2x=180-38$"},"Result":{"Ar":"$71$","En":"$71$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$71+109=180,\\quad109-71=38$","En":"$71+109=180,\\quad109-71=38$"},"CommonError":{"Ar":"هذا الفرق المعطى.","En":"This is the given difference."}}}$mw$::jsonb,$mw$الزاويتان المتجاورتان مجموعهما 180° والمتقابلتان متساويتان.

$x+(x+38)=180$

1. $2x=142$

2. $x=71$

$2x=180-38$

$71$ °

$71+109=180,\quad109-71=38$

هذا الفرق المعطى.$mw$,$mw$Adjacent angles total 180°, and opposite angles are equal.

$x+(x+38)=180$

1. $2x=142$

2. $x=71$

$2x=180-38$

$71$ °

$71+109=180,\quad109-71=38$

This is the given difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"سمّ الزاوية الحادة x.","En":"Call the acute angle x."},{"Ar":"عبّر عن المنفرجة بـ x+38.","En":"Express the obtuse angle as x+38."}],"Solution":{"Idea":{"Ar":"الزاويتان المتجاورتان مجموعهما 180° والمتقابلتان متساويتان.","En":"Adjacent angles total 180°, and opposite angles are equal."},"FormulaLatex":"x+(x+38)=180","Steps":[{"Ar":"$2x=142$","En":"$2x=142$"},{"Ar":"$x=71$","En":"$x=71$"}],"Substitution":{"Ar":"$2x=180-38$","En":"$2x=180-38$"},"Result":{"Ar":"$71$","En":"$71$"},"Unit":{"Ar":"°","En":"°"},"Verification":{"Ar":"$71+109=180,\\quad109-71=38$","En":"$71+109=180,\\quad109-71=38$"},"CommonError":{"Ar":"هذا الفرق المعطى.","En":"This is the given difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا قياس الزاوية المنفرجة.","En":"This is the obtuse angle."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الزاويتين الحادتين.","En":"This is the sum of the two acute angles."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق المعطى.","En":"This is the given difference."},"Order":4}]}$mw$),
($mw$growth-v60-grade-3-division-exact-missing-dividend-from-sharing-1$mw$,$mw$division-exact-missing-dividend-from-sharing$mw$,$mw$primary-division$mw$,$mw$grade-3$mw$,3,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"استنتاج عدد العناصر من توزيعها","En":"Recovering a total from sharing"},"Question":{"Ar":"وُزعت جميع الأقلام بالتساوي على سبعة أطفال، فأخذ كل طفل 6 أقلام. كم قلماً كان لدينا قبل التوزيع؟","En":"All pencils are shared equally among seven children, each receiving six pencils. How many pencils were there before sharing?"},"Options":[{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب حصة ستة أطفال فقط.","En":"Counts only six children."}},{"LatexCode":"42","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع عدد الأطفال وحصة الواحد.","En":"Adds child count and share."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح العددين.","En":"Subtracts the two numbers."}}],"Hints":[{"Ar":"كم حصة متساوية؟","En":"How many equal shares?"},{"Ar":"اضرب عدد الحصص في 6.","En":"Multiply the number of shares by six."}],"Solution":{"Idea":{"Ar":"نضرب عدد الحصص في حجم الحصة.","En":"Multiply the number of shares by the size of each share."},"FormulaLatex":"N=7\\cdot6","Steps":[{"Ar":"$N=42$","En":"$N=42$"}],"Substitution":{"Ar":"$7\\cdot6$","En":"$7\\cdot6$"},"Result":{"Ar":"$42$","En":"$42$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$42/7=6$","En":"$42/7=6$"},"CommonError":{"Ar":"جمع عدد الأطفال وحصة الواحد.","En":"Adds child count and share."}}}$mw$::jsonb,$mw$نضرب عدد الحصص في حجم الحصة.

$N=7\cdot6$

1. $N=42$

$7\cdot6$

$42$

$42/7=6$

جمع عدد الأطفال وحصة الواحد.$mw$,$mw$Multiply the number of shares by the size of each share.

$N=7\cdot6$

1. $N=42$

$7\cdot6$

$42$

$42/7=6$

Adds child count and share.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم حصة متساوية؟","En":"How many equal shares?"},{"Ar":"اضرب عدد الحصص في 6.","En":"Multiply the number of shares by six."}],"Solution":{"Idea":{"Ar":"نضرب عدد الحصص في حجم الحصة.","En":"Multiply the number of shares by the size of each share."},"FormulaLatex":"N=7\\cdot6","Steps":[{"Ar":"$N=42$","En":"$N=42$"}],"Substitution":{"Ar":"$7\\cdot6$","En":"$7\\cdot6$"},"Result":{"Ar":"$42$","En":"$42$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$42/7=6$","En":"$42/7=6$"},"CommonError":{"Ar":"جمع عدد الأطفال وحصة الواحد.","En":"Adds child count and share."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب حصة ستة أطفال فقط.","En":"Counts only six children."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع عدد الأطفال وحصة الواحد.","En":"Adds child count and share."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح العددين.","En":"Subtracts the two numbers."},"Order":4}]}$mw$),
($mw$growth-v60-grade-3-multiplicative-word-two-rows-per-table-1$mw$,$mw$multiplicative-word-two-rows-per-table$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-3$mw$,3,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عد العناصر عبر مجموعات متداخلة","En":"Counting items in nested groups"},"Question":{"Ar":"في قاعة 4 طاولات. على كل طاولة صينيّتان، وفي كل صينية 3 أكواب. كم كوباً في القاعة على الطاولات؟","En":"A room has four tables. Each table holds two trays, and each tray holds three cups. How many cups are on the tables?"},"Options":[{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الصواني.","En":"This is the tray count."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل عدد الصواني في كل طاولة.","En":"Omits the trays per table."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأعداد بدلاً من ضربها.","En":"Adds the numbers instead of multiplying."}}],"Hints":[{"Ar":"كم صينية على الطاولات كلها؟","En":"How many trays are on all tables?"},{"Ar":"كم كوباً في كل صينية؟","En":"How many cups per tray?"}],"Solution":{"Idea":{"Ar":"نحسب الصواني كلها ثم نضرب في عدد الأكواب في كل صينية.","En":"Count all trays, then multiply by cups per tray."},"FormulaLatex":"4\\cdot2\\cdot3","Steps":[{"Ar":"$4\\cdot2=8$","En":"$4\\cdot2=8$"},{"Ar":"$8\\cdot3=24$","En":"$8\\cdot3=24$"}],"Substitution":{"Ar":"$8\\cdot3$","En":"$8\\cdot3$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24/4=6=2\\cdot3$","En":"$24/4=6=2\\cdot3$"},"CommonError":{"Ar":"هذا عدد الصواني.","En":"This is the tray count."}}}$mw$::jsonb,$mw$نحسب الصواني كلها ثم نضرب في عدد الأكواب في كل صينية.

$4\cdot2\cdot3$

1. $4\cdot2=8$

2. $8\cdot3=24$

$8\cdot3$

$24$

$24/4=6=2\cdot3$

هذا عدد الصواني.$mw$,$mw$Count all trays, then multiply by cups per tray.

$4\cdot2\cdot3$

1. $4\cdot2=8$

2. $8\cdot3=24$

$8\cdot3$

$24$

$24/4=6=2\cdot3$

This is the tray count.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم صينية على الطاولات كلها؟","En":"How many trays are on all tables?"},{"Ar":"كم كوباً في كل صينية؟","En":"How many cups per tray?"}],"Solution":{"Idea":{"Ar":"نحسب الصواني كلها ثم نضرب في عدد الأكواب في كل صينية.","En":"Count all trays, then multiply by cups per tray."},"FormulaLatex":"4\\cdot2\\cdot3","Steps":[{"Ar":"$4\\cdot2=8$","En":"$4\\cdot2=8$"},{"Ar":"$8\\cdot3=24$","En":"$8\\cdot3=24$"}],"Substitution":{"Ar":"$8\\cdot3$","En":"$8\\cdot3$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24/4=6=2\\cdot3$","En":"$24/4=6=2\\cdot3$"},"CommonError":{"Ar":"هذا عدد الصواني.","En":"This is the tray count."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الصواني.","En":"This is the tray count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أهمل عدد الصواني في كل طاولة.","En":"Omits the trays per table."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع الأعداد بدلاً من ضربها.","En":"Adds the numbers instead of multiplying."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v60 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
