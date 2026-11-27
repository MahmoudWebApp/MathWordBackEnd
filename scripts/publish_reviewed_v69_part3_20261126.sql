-- One-time owner-authorized v69 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v69-grade-9-similar-triangle-midsegment-trapezoid-area-1$mw$,$mw$similar-triangle-midsegment-trapezoid-area$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة بعد قطع موازٍ","En":"Area after a parallel cut"},"Question":{"Ar":"في مثلث مساحته 80 سم²، تصل قطعة مستقيمة بين منتصفي ضلعين. ما مساحة شبه المنحرف بين هذه القطعة والضلع الثالث بالسنتيمتر المربع؟","En":"A triangle has area 80 square cm. A segment joins the midpoints of two sides. Find the area of the trapezoid between this segment and the third side, in square cm."},"Options":[{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم نسبة الأطوال بدلاً من مربعها.","En":"Uses the length scale instead of its square."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة المثلث الصغير.","En":"This is the small triangle's area."}},{"LatexCode":"60","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل نسبة مساحة غير صحيحة.","En":"Uses an incorrect area scale."}}],"Hints":[{"Ar":"حدد نسبة التشابه باستخدام منتصفي الضلعين.","En":"Find the similarity ratio from the midpoints."},{"Ar":"اطرح مساحة المثلث الصغير من المساحة الكلية.","En":"Subtract the small triangle's area from the whole."}],"Solution":{"Idea":{"Ar":"المثلث الصغير مشابه للأصلي بنسبة طول نصف، فتكون مساحته ربع الأصل.","En":"The small triangle is similar with length scale one half, giving one quarter of the original area."},"FormulaLatex":"A_{trap}=80(1-(1/2)^2)","Steps":[{"Ar":"$A_{small}=80/4=20$","En":"$A_{small}=80/4=20$"},{"Ar":"$A_{trap}=80-20=60$","En":"$A_{trap}=80-20=60$"}],"Substitution":{"Ar":"$A_{trap}=80(1-(1/2)^2)$","En":"$A_{trap}=80(1-(1/2)^2)$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$60+20=80$.","En":"$60+20=80$."},"CommonError":{"Ar":"استخدم نسبة الأطوال بدلاً من مربعها.","En":"Uses the length scale instead of its square."}}}$mw$::jsonb,$mw$المثلث الصغير مشابه للأصلي بنسبة طول نصف، فتكون مساحته ربع الأصل.

$A_{trap}=80(1-(1/2)^2)$

1. $A_{small}=80/4=20$

2. $A_{trap}=80-20=60$

$A_{trap}=80(1-(1/2)^2)$

$60$

سم²

$60+20=80$.

استخدم نسبة الأطوال بدلاً من مربعها.$mw$,$mw$The small triangle is similar with length scale one half, giving one quarter of the original area.

$A_{trap}=80(1-(1/2)^2)$

1. $A_{small}=80/4=20$

2. $A_{trap}=80-20=60$

$A_{trap}=80(1-(1/2)^2)$

$60$

cm²

$60+20=80$.

Uses the length scale instead of its square.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد نسبة التشابه باستخدام منتصفي الضلعين.","En":"Find the similarity ratio from the midpoints."},{"Ar":"اطرح مساحة المثلث الصغير من المساحة الكلية.","En":"Subtract the small triangle's area from the whole."}],"Solution":{"Idea":{"Ar":"المثلث الصغير مشابه للأصلي بنسبة طول نصف، فتكون مساحته ربع الأصل.","En":"The small triangle is similar with length scale one half, giving one quarter of the original area."},"FormulaLatex":"A_{trap}=80(1-(1/2)^2)","Steps":[{"Ar":"$A_{small}=80/4=20$","En":"$A_{small}=80/4=20$"},{"Ar":"$A_{trap}=80-20=60$","En":"$A_{trap}=80-20=60$"}],"Substitution":{"Ar":"$A_{trap}=80(1-(1/2)^2)$","En":"$A_{trap}=80(1-(1/2)^2)$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$60+20=80$.","En":"$60+20=80$."},"CommonError":{"Ar":"استخدم نسبة الأطوال بدلاً من مربعها.","En":"Uses the length scale instead of its square."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استخدم نسبة الأطوال بدلاً من مربعها.","En":"Uses the length scale instead of its square."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه مساحة المثلث الصغير.","En":"This is the small triangle's area."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل نسبة مساحة غير صحيحة.","En":"Uses an incorrect area scale."},"Order":4}]}$mw$),
($mw$growth-v69-grade-11-recurrence-two-cycle-from-reflection-1$mw$,$mw$recurrence-two-cycle-from-reflection$mw$,$mw$s-sequences-series-recurrence-relations$mw$,$mw$grade-11$mw$,11,3,23,102,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":102,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"دورة من حدين","En":"Two-cycle recurrence"},"Question":{"Ar":"إذا كان $a_1=2$ و$a_{n+1}=10-a_n$ لكل $n\\ge1$، فما قيمة $a_{100}$؟","En":"If $a_1=2$ and $a_{n+1}=10-a_n$ for $n\\ge1$, find $a_{100}$."},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل قيمة الفهارس الفردية.","En":"Uses the odd-index value."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل النقطة الثابتة بدلاً من الدورة الفعلية.","En":"Uses the fixed point rather than the actual cycle."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل ثابت العلاقة وحده.","En":"Uses only the recurrence constant."}}],"Hints":[{"Ar":"احسب الحدين الثاني والثالث.","En":"Compute the second and third terms."},{"Ar":"لاحظ تكرار الحدود وفق زوجية الفهرس.","En":"Notice the repeating pattern by index parity."}],"Solution":{"Idea":{"Ar":"تطبيق العلاقة مرتين يعيد الحد الأصلي، فتتكرر دورة من حدين.","En":"Applying the recurrence twice recovers the original term, creating a two-cycle."},"FormulaLatex":"a_{n+2}=10-(10-a_n)=a_n","Steps":[{"Ar":"$a_2=8$","En":"$a_2=8$"},{"Ar":"$100=2\\cdot50$","En":"$100=2\\cdot50$"},{"Ar":"$a_{100}=a_2=8$","En":"$a_{100}=a_2=8$"}],"Substitution":{"Ar":"$a_{n+2}=10-(10-a_n)=a_n$","En":"$a_{n+2}=10-(10-a_n)=a_n$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$a_{99}=2$ ومن ثم $a_{100}=10-2=8$.","En":"$a_{99}=2$, so $a_{100}=10-2=8$."},"CommonError":{"Ar":"استعمل قيمة الفهارس الفردية.","En":"Uses the odd-index value."}}}$mw$::jsonb,$mw$تطبيق العلاقة مرتين يعيد الحد الأصلي، فتتكرر دورة من حدين.

$a_{n+2}=10-(10-a_n)=a_n$

1. $a_2=8$

2. $100=2\cdot50$

3. $a_{100}=a_2=8$

$a_{n+2}=10-(10-a_n)=a_n$

$8$

$a_{99}=2$ ومن ثم $a_{100}=10-2=8$.

استعمل قيمة الفهارس الفردية.$mw$,$mw$Applying the recurrence twice recovers the original term, creating a two-cycle.

$a_{n+2}=10-(10-a_n)=a_n$

1. $a_2=8$

2. $100=2\cdot50$

3. $a_{100}=a_2=8$

$a_{n+2}=10-(10-a_n)=a_n$

$8$

$a_{99}=2$, so $a_{100}=10-2=8$.

Uses the odd-index value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الحدين الثاني والثالث.","En":"Compute the second and third terms."},{"Ar":"لاحظ تكرار الحدود وفق زوجية الفهرس.","En":"Notice the repeating pattern by index parity."}],"Solution":{"Idea":{"Ar":"تطبيق العلاقة مرتين يعيد الحد الأصلي، فتتكرر دورة من حدين.","En":"Applying the recurrence twice recovers the original term, creating a two-cycle."},"FormulaLatex":"a_{n+2}=10-(10-a_n)=a_n","Steps":[{"Ar":"$a_2=8$","En":"$a_2=8$"},{"Ar":"$100=2\\cdot50$","En":"$100=2\\cdot50$"},{"Ar":"$a_{100}=a_2=8$","En":"$a_{100}=a_2=8$"}],"Substitution":{"Ar":"$a_{n+2}=10-(10-a_n)=a_n$","En":"$a_{n+2}=10-(10-a_n)=a_n$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$a_{99}=2$ ومن ثم $a_{100}=10-2=8$.","En":"$a_{99}=2$, so $a_{100}=10-2=8$."},"CommonError":{"Ar":"استعمل قيمة الفهارس الفردية.","En":"Uses the odd-index value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل قيمة الفهارس الفردية.","En":"Uses the odd-index value."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل النقطة الثابتة بدلاً من الدورة الفعلية.","En":"Uses the fixed point rather than the actual cycle."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل ثابت العلاقة وحده.","En":"Uses only the recurrence constant."},"Order":4}]}$mw$),
($mw$growth-v69-grade-11-telescoping-reciprocal-differences-finite-1$mw$,$mw$telescoping-reciprocal-differences-finite$mw$,$mw$s-sequences-series-series-sums$mw$,$mw$grade-11$mw$,11,3,23,101,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":101,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع متلاشٍ محدود","En":"Finite telescoping sum"},"Question":{"Ar":"احسب $\\sum_{k=1}^{4}(1/k-1/(k+1))$.","En":"Evaluate $\\sum_{k=1}^{4}(1/k-1/(k+1))$."},"Options":[{"LatexCode":"\\frac45","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الحد الطرفي الأخير.","En":"Omits the final endpoint term."}},{"LatexCode":"\\frac15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتفظ بالحد الطرفي الأخير فقط.","En":"Keeps only the last endpoint term."}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف عند الفهرس 3.","En":"Stops at index three."}}],"Hints":[{"Ar":"اكتب الحدود الأربعة منفصلة.","En":"Expand all four summands."},{"Ar":"اشطب الأزواج المتساوية متعاكسة الإشارة.","En":"Cancel equal terms of opposite signs."}],"Solution":{"Idea":{"Ar":"تتلاشى الحدود الوسطى عند كتابة المجموع، ويبقى الطرفان فقط.","En":"Interior terms cancel on expansion, leaving only the endpoints."},"FormulaLatex":"\\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5","Steps":[{"Ar":"$(1-1/2)+(1/2-1/3)+(1/3-1/4)+(1/4-1/5)$","En":"$(1-1/2)+(1/2-1/3)+(1/3-1/4)+(1/4-1/5)$"},{"Ar":"$1-1/5=4/5$","En":"$1-1/5=4/5$"}],"Substitution":{"Ar":"$\\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$","En":"$\\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$"},"Result":{"Ar":"$\\frac45$","En":"$\\frac45$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2+1/6+1/12+1/20=4/5$.","En":"$1/2+1/6+1/12+1/20=4/5$."},"CommonError":{"Ar":"أهمل الحد الطرفي الأخير.","En":"Omits the final endpoint term."}}}$mw$::jsonb,$mw$تتلاشى الحدود الوسطى عند كتابة المجموع، ويبقى الطرفان فقط.

$\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$

1. $(1-1/2)+(1/2-1/3)+(1/3-1/4)+(1/4-1/5)$

2. $1-1/5=4/5$

$\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$

$\frac45$

$1/2+1/6+1/12+1/20=4/5$.

أهمل الحد الطرفي الأخير.$mw$,$mw$Interior terms cancel on expansion, leaving only the endpoints.

$\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$

1. $(1-1/2)+(1/2-1/3)+(1/3-1/4)+(1/4-1/5)$

2. $1-1/5=4/5$

$\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$

$\frac45$

$1/2+1/6+1/12+1/20=4/5$.

Omits the final endpoint term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الحدود الأربعة منفصلة.","En":"Expand all four summands."},{"Ar":"اشطب الأزواج المتساوية متعاكسة الإشارة.","En":"Cancel equal terms of opposite signs."}],"Solution":{"Idea":{"Ar":"تتلاشى الحدود الوسطى عند كتابة المجموع، ويبقى الطرفان فقط.","En":"Interior terms cancel on expansion, leaving only the endpoints."},"FormulaLatex":"\\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5","Steps":[{"Ar":"$(1-1/2)+(1/2-1/3)+(1/3-1/4)+(1/4-1/5)$","En":"$(1-1/2)+(1/2-1/3)+(1/3-1/4)+(1/4-1/5)$"},{"Ar":"$1-1/5=4/5$","En":"$1-1/5=4/5$"}],"Substitution":{"Ar":"$\\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$","En":"$\\sum_{k=1}^{4}(1/k-1/(k+1))=1-1/5$"},"Result":{"Ar":"$\\frac45$","En":"$\\frac45$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2+1/6+1/12+1/20=4/5$.","En":"$1/2+1/6+1/12+1/20=4/5$."},"CommonError":{"Ar":"أهمل الحد الطرفي الأخير.","En":"Omits the final endpoint term."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الحد الطرفي الأخير.","En":"Omits the final endpoint term."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"احتفظ بالحد الطرفي الأخير فقط.","En":"Keeps only the last endpoint term."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"توقف عند الفهرس 3.","En":"Stops at index three."},"Order":4}]}$mw$),
($mw$growth-v69-grade-11-circle-chord-length-from-center-distance-1$mw$,$mw$circle-chord-length-from-center-distance$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طول وتر من بعده عن المركز","En":"Chord length from center distance"},"Question":{"Ar":"في دائرة نصف قطرها 13، يبعد مستقيم حامل لوتر مسافة عمودية 5 عن المركز. ما طول الوتر؟","En":"In a circle of radius 13, the line containing a chord is at perpendicular distance 5 from the center. Find the chord length."},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب نصف الوتر فقط.","En":"Finds only half the chord."}},{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع نصف القطر والبعد عن المركز.","En":"Adds radius and center distance."}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اعتبر الوتر قطراً.","En":"Treats the chord as a diameter."}}],"Hints":[{"Ar":"ارسم نصف قطر يصل إلى طرف الوتر.","En":"Draw a radius to one endpoint of the chord."},{"Ar":"احسب نصف الوتر ثم ضاعفه.","En":"Find half the chord, then double it."}],"Solution":{"Idea":{"Ar":"العمود من المركز ينصف الوتر، ونستخدم فيثاغورس في المثلث القائم.","En":"The perpendicular from the center bisects the chord; apply Pythagoras to the right triangle."},"FormulaLatex":"L=2\\sqrt{13^2-5^2}","Steps":[{"Ar":"$L/2=\\sqrt{169-25}=12$","En":"$L/2=\\sqrt{169-25}=12$"},{"Ar":"$L=24$","En":"$L=24$"}],"Substitution":{"Ar":"$L=2\\sqrt{13^2-5^2}$","En":"$L=2\\sqrt{13^2-5^2}$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5^2+12^2=169=13^2$.","En":"$5^2+12^2=169=13^2$."},"CommonError":{"Ar":"حسب نصف الوتر فقط.","En":"Finds only half the chord."}}}$mw$::jsonb,$mw$العمود من المركز ينصف الوتر، ونستخدم فيثاغورس في المثلث القائم.

$L=2\sqrt{13^2-5^2}$

1. $L/2=\sqrt{169-25}=12$

2. $L=24$

$L=2\sqrt{13^2-5^2}$

$24$

$5^2+12^2=169=13^2$.

حسب نصف الوتر فقط.$mw$,$mw$The perpendicular from the center bisects the chord; apply Pythagoras to the right triangle.

$L=2\sqrt{13^2-5^2}$

1. $L/2=\sqrt{169-25}=12$

2. $L=24$

$L=2\sqrt{13^2-5^2}$

$24$

$5^2+12^2=169=13^2$.

Finds only half the chord.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ارسم نصف قطر يصل إلى طرف الوتر.","En":"Draw a radius to one endpoint of the chord."},{"Ar":"احسب نصف الوتر ثم ضاعفه.","En":"Find half the chord, then double it."}],"Solution":{"Idea":{"Ar":"العمود من المركز ينصف الوتر، ونستخدم فيثاغورس في المثلث القائم.","En":"The perpendicular from the center bisects the chord; apply Pythagoras to the right triangle."},"FormulaLatex":"L=2\\sqrt{13^2-5^2}","Steps":[{"Ar":"$L/2=\\sqrt{169-25}=12$","En":"$L/2=\\sqrt{169-25}=12$"},{"Ar":"$L=24$","En":"$L=24$"}],"Substitution":{"Ar":"$L=2\\sqrt{13^2-5^2}$","En":"$L=2\\sqrt{13^2-5^2}$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5^2+12^2=169=13^2$.","En":"$5^2+12^2=169=13^2$."},"CommonError":{"Ar":"حسب نصف الوتر فقط.","En":"Finds only half the chord."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب نصف الوتر فقط.","En":"Finds only half the chord."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع نصف القطر والبعد عن المركز.","En":"Adds radius and center distance."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"اعتبر الوتر قطراً.","En":"Treats the chord as a diameter."},"Order":4}]}$mw$);
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
