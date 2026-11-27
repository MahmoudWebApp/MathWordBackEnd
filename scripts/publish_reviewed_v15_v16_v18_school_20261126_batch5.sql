-- One-time owner-authorized import AND publication from reviewed v15/v16/v18 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v16-grade-12-signed-work-against-horizontal-motion-1$mw$,$mw$signed-work-against-horizontal-motion$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"شغل قوة مائلة","En":"Work from an angled force"},"Question":{"Ar":"متجه قوة ثابتة في مستوى هو $(-3,4)$ نيوتن، ومتجه إزاحة الجسم $(5,1)$ متر في الإحداثيات نفسها. ما قيمة الشغل الموقّع لهذه القوة؟","En":"A constant planar force is $(-3,4)$ N. The displacement vector is $(5,1)$ m in the same coordinates. What is the signed work done by the force?"},"Options":[{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع مقداري المساهمتين دون مراعاة الإشارة.","En":"Adds both magnitudes without their signs."}},{"LatexCode":"-15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الشغل الرأسي.","En":"Ignores the vertical contribution."}},{"LatexCode":"-11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ القيمة المطلقة للشغل.","En":"Takes the absolute value of the work."}}],"Hints":[{"Ar":"هل تساعد القوة الأفقية الحركة الأفقية أم تعاكسها؟","En":"Does the horizontal force aid or oppose the horizontal motion?"},{"Ar":"اضرب المركبتين المتناظرتين في كل محور ثم اجمع.","En":"Multiply corresponding components along each axis and add."}],"Solution":{"Idea":{"Ar":"الشغل الموقّع هو الجداء النقطي للقوة والإزاحة، مع الحفاظ على إشارات المركبات.","En":"Signed work is the dot product of force and displacement, retaining the signs of components."},"FormulaLatex":"W=\\vec F\\cdot\\vec d","Steps":[{"Ar":"الشغل الأفقي سالب ويساوي −15 جول.","En":"The horizontal contribution is −15 J."},{"Ar":"الشغل الرأسي 4 جول، فيكون المجموع سالباً.","En":"The vertical contribution is 4 J, so the sum stays negative."}],"Substitution":{"Ar":"$(-3)(5)+(4)(1)=-11$","En":"$(-3)(5)+(4)(1)=-11$"},"Result":{"Ar":"$-11$","En":"$-11$"},"Unit":{"Ar":"جول","En":"J"},"Verification":{"Ar":"المساهمة الرأسية تعوض 4 جول فقط من 15 جول سالباً، فيبقى −11 جول.","En":"The vertical contribution offsets only 4 J of the negative 15 J, leaving −11 J."},"CommonError":{"Ar":"جمع مقداري المساهمتين دون مراعاة الإشارة.","En":"Adds both magnitudes without their signs."}}}$mw$::jsonb,$mw$الشغل الموقّع هو الجداء النقطي للقوة والإزاحة، مع الحفاظ على إشارات المركبات.

$W=\vec F\cdot\vec d$

1. الشغل الأفقي سالب ويساوي −15 جول.

2. الشغل الرأسي 4 جول، فيكون المجموع سالباً.

$(-3)(5)+(4)(1)=-11$

$-11$ جول

المساهمة الرأسية تعوض 4 جول فقط من 15 جول سالباً، فيبقى −11 جول.

جمع مقداري المساهمتين دون مراعاة الإشارة.$mw$,$mw$Signed work is the dot product of force and displacement, retaining the signs of components.

$W=\vec F\cdot\vec d$

1. The horizontal contribution is −15 J.

2. The vertical contribution is 4 J, so the sum stays negative.

$(-3)(5)+(4)(1)=-11$

$-11$ J

The vertical contribution offsets only 4 J of the negative 15 J, leaving −11 J.

Adds both magnitudes without their signs.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"هل تساعد القوة الأفقية الحركة الأفقية أم تعاكسها؟","En":"Does the horizontal force aid or oppose the horizontal motion?"},{"Ar":"اضرب المركبتين المتناظرتين في كل محور ثم اجمع.","En":"Multiply corresponding components along each axis and add."}],"Solution":{"Idea":{"Ar":"الشغل الموقّع هو الجداء النقطي للقوة والإزاحة، مع الحفاظ على إشارات المركبات.","En":"Signed work is the dot product of force and displacement, retaining the signs of components."},"FormulaLatex":"W=\\vec F\\cdot\\vec d","Steps":[{"Ar":"الشغل الأفقي سالب ويساوي −15 جول.","En":"The horizontal contribution is −15 J."},{"Ar":"الشغل الرأسي 4 جول، فيكون المجموع سالباً.","En":"The vertical contribution is 4 J, so the sum stays negative."}],"Substitution":{"Ar":"$(-3)(5)+(4)(1)=-11$","En":"$(-3)(5)+(4)(1)=-11$"},"Result":{"Ar":"$-11$","En":"$-11$"},"Unit":{"Ar":"جول","En":"J"},"Verification":{"Ar":"المساهمة الرأسية تعوض 4 جول فقط من 15 جول سالباً، فيبقى −11 جول.","En":"The vertical contribution offsets only 4 J of the negative 15 J, leaving −11 J."},"CommonError":{"Ar":"جمع مقداري المساهمتين دون مراعاة الإشارة.","En":"Adds both magnitudes without their signs."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع مقداري المساهمتين دون مراعاة الإشارة.","En":"Adds both magnitudes without their signs."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الشغل الرأسي.","En":"Ignores the vertical contribution."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أخذ القيمة المطلقة للشغل.","En":"Takes the absolute value of the work."},"Order":4}]}$mw$),
($mw$growth-v16-grade-12-external-point-tangent-segment-1$mw$,$mw$external-point-tangent-segment$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"المماس من نقطة خارجية","En":"A tangent from an external point"},"Question":{"Ar":"لدائرة مركزها $O$ ونصف قطرها 7 سم، نقطة خارجية $P$ تبعد عن المركز 25 سم. يلامس مستقيم يمر بـ $P$ الدائرة عند $T$. كم طول $PT$؟","En":"A circle with centre $O$ has radius 7 cm and an external point $P$ is 25 cm from its centre. A line through $P$ touches the circle at $T$. How long is $PT$?"},"Options":[{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الطولين مباشرة بدل طرح مربعيهما.","En":"Subtracts the two lengths directly."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المسافة إلى المركز.","En":"Reports the distance to the centre."}},{"LatexCode":"32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع نصف القطر والمسافة إلى المركز.","En":"Adds the radius to the centre distance."}},{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ارسم نصف القطر من المركز إلى نقطة التماس.","En":"Draw the radius from the centre to the point of tangency."},{"Ar":"استعمل تعامد نصف القطر مع المماس لتحديد وتر المثلث.","En":"Use the perpendicular radius and tangent to identify the hypotenuse."}],"Solution":{"Idea":{"Ar":"نصف القطر عمودي على المماس عند نقطة التماس، فتتشكل علاقة فيثاغورس.","En":"The radius is perpendicular to the tangent at the contact point, forming a right triangle."},"FormulaLatex":"PT^2=OP^2-OT^2","Steps":[{"Ar":"المثلث OTP قائم عند T، ووتره OP.","En":"Triangle OTP is right at T, with hypotenuse OP."},{"Ar":"نطرح مربع نصف القطر من مربع المسافة إلى المركز ثم نأخذ الجذر الموجب.","En":"Subtract the squared radius from the squared centre distance and take the positive square root."}],"Substitution":{"Ar":"$\\sqrt{625-49}=24$","En":"$\\sqrt{625-49}=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"مربع 24 زائد مربع 7 يساوي 625، وهو مربع 25.","En":"The squares of 24 and 7 sum to 625, the square of 25."},"CommonError":{"Ar":"طرح الطولين مباشرة بدل طرح مربعيهما.","En":"Subtracts the two lengths directly."}}}$mw$::jsonb,$mw$نصف القطر عمودي على المماس عند نقطة التماس، فتتشكل علاقة فيثاغورس.

$PT^2=OP^2-OT^2$

1. المثلث OTP قائم عند T، ووتره OP.

2. نطرح مربع نصف القطر من مربع المسافة إلى المركز ثم نأخذ الجذر الموجب.

$\sqrt{625-49}=24$

$24$ سم

مربع 24 زائد مربع 7 يساوي 625، وهو مربع 25.

طرح الطولين مباشرة بدل طرح مربعيهما.$mw$,$mw$The radius is perpendicular to the tangent at the contact point, forming a right triangle.

$PT^2=OP^2-OT^2$

1. Triangle OTP is right at T, with hypotenuse OP.

2. Subtract the squared radius from the squared centre distance and take the positive square root.

$\sqrt{625-49}=24$

$24$ cm

The squares of 24 and 7 sum to 625, the square of 25.

Subtracts the two lengths directly.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"ارسم نصف القطر من المركز إلى نقطة التماس.","En":"Draw the radius from the centre to the point of tangency."},{"Ar":"استعمل تعامد نصف القطر مع المماس لتحديد وتر المثلث.","En":"Use the perpendicular radius and tangent to identify the hypotenuse."}],"Solution":{"Idea":{"Ar":"نصف القطر عمودي على المماس عند نقطة التماس، فتتشكل علاقة فيثاغورس.","En":"The radius is perpendicular to the tangent at the contact point, forming a right triangle."},"FormulaLatex":"PT^2=OP^2-OT^2","Steps":[{"Ar":"المثلث OTP قائم عند T، ووتره OP.","En":"Triangle OTP is right at T, with hypotenuse OP."},{"Ar":"نطرح مربع نصف القطر من مربع المسافة إلى المركز ثم نأخذ الجذر الموجب.","En":"Subtract the squared radius from the squared centre distance and take the positive square root."}],"Substitution":{"Ar":"$\\sqrt{625-49}=24$","En":"$\\sqrt{625-49}=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"مربع 24 زائد مربع 7 يساوي 625، وهو مربع 25.","En":"The squares of 24 and 7 sum to 625, the square of 25."},"CommonError":{"Ar":"طرح الطولين مباشرة بدل طرح مربعيهما.","En":"Subtracts the two lengths directly."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح الطولين مباشرة بدل طرح مربعيهما.","En":"Subtracts the two lengths directly."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى المسافة إلى المركز.","En":"Reports the distance to the centre."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع نصف القطر والمسافة إلى المركز.","En":"Adds the radius to the centre distance."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v18-grade-1-recount-after-rearrangement-1$mw$,$mw$recount-after-rearrangement$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"العد بعد تغيير الترتيب","En":"Counting after rearranging"},"Question":{"Ar":"عدّت سلمى ٦ أزرار في صف. نقلت ثلاثة منها إلى صف ثانٍ، من دون أن تضيف أزراراً أو تزيلها من الطاولة. كم زرّاً على الطاولة الآن؟","En":"Salma counts 6 buttons in a row. She moves three of them into a second row without adding or taking any buttons off the table. How many buttons are on the table now?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ صفاً واحداً فقط.","En":"Counts just one row."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الأزرار المنقولة على أنها جديدة.","En":"Counts the moved buttons as new buttons."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الصفوف بدلاً من الأزرار.","En":"Counts rows instead of buttons."}}],"Hints":[{"Ar":"هل غادر أي زر الطاولة؟","En":"Did any button leave the table?"},{"Ar":"هل تغيّر العدد أم تغيّر مكان الأزرار فقط؟","En":"Did the count change, or only the buttons' positions?"}],"Solution":{"Idea":{"Ar":"تغيير ترتيب العناصر لا يغير عددها ما دامت لم تُضف أو تُحذف.","En":"Rearranging objects preserves their count when none are added or removed."},"FormulaLatex":"(6-3)+3=6","Steps":[{"Ar":"يبقى ثلاثة أزرار في الصف الأول.","En":"Three buttons remain in the first row."},{"Ar":"الصف الثاني فيه الأزرار الثلاثة التي نُقلت، فنعدّها أيضاً.","En":"The second row has the three moved buttons, which we count too."}],"Substitution":{"Ar":"$3+3=6$","En":"$3+3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"أزرار","En":"buttons"},"Verification":{"Ar":"إذا أعدنا كل زر إلى مكانه الأول، نرى الأزرار الستة نفسها.","En":"Moving each button back reveals the original six buttons."},"CommonError":{"Ar":"عدّ صفاً واحداً فقط.","En":"Counts just one row."}}}$mw$::jsonb,$mw$تغيير ترتيب العناصر لا يغير عددها ما دامت لم تُضف أو تُحذف.

$(6-3)+3=6$

1. يبقى ثلاثة أزرار في الصف الأول.

2. الصف الثاني فيه الأزرار الثلاثة التي نُقلت، فنعدّها أيضاً.

$3+3=6$

$6$ أزرار

إذا أعدنا كل زر إلى مكانه الأول، نرى الأزرار الستة نفسها.

عدّ صفاً واحداً فقط.$mw$,$mw$Rearranging objects preserves their count when none are added or removed.

$(6-3)+3=6$

1. Three buttons remain in the first row.

2. The second row has the three moved buttons, which we count too.

$3+3=6$

$6$ buttons

Moving each button back reveals the original six buttons.

Counts just one row.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"هل غادر أي زر الطاولة؟","En":"Did any button leave the table?"},{"Ar":"هل تغيّر العدد أم تغيّر مكان الأزرار فقط؟","En":"Did the count change, or only the buttons' positions?"}],"Solution":{"Idea":{"Ar":"تغيير ترتيب العناصر لا يغير عددها ما دامت لم تُضف أو تُحذف.","En":"Rearranging objects preserves their count when none are added or removed."},"FormulaLatex":"(6-3)+3=6","Steps":[{"Ar":"يبقى ثلاثة أزرار في الصف الأول.","En":"Three buttons remain in the first row."},{"Ar":"الصف الثاني فيه الأزرار الثلاثة التي نُقلت، فنعدّها أيضاً.","En":"The second row has the three moved buttons, which we count too."}],"Substitution":{"Ar":"$3+3=6$","En":"$3+3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"أزرار","En":"buttons"},"Verification":{"Ar":"إذا أعدنا كل زر إلى مكانه الأول، نرى الأزرار الستة نفسها.","En":"Moving each button back reveals the original six buttons."},"CommonError":{"Ar":"عدّ صفاً واحداً فقط.","En":"Counts just one row."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدّ صفاً واحداً فقط.","En":"Counts just one row."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الأزرار المنقولة على أنها جديدة.","En":"Counts the moved buttons as new buttons."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الصفوف بدلاً من الأزرار.","En":"Counts rows instead of buttons."},"Order":4}]}$mw$),
($mw$growth-v18-grade-7-latest-whole-minute-before-strict-temperature-1$mw$,$mw$latest-whole-minute-before-strict-temperature$mw$,$mw$inequality-contexts$mw$,$mw$grade-7$mw$,7,2,84,325,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":325,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"آخر قراءة قبل عتبة التبريد","En":"Last reading above a cooling threshold"},"Question":{"Ar":"تبدأ درجة حرارة صندوق عند ٢٣°م وتنخفض درجتين مئويتين كل دقيقة بمعدل ثابت. تُسجل القراءة عند نهاية كل دقيقة. ما رقم الدقيقة الأخيرة التي تكون قراءتها أعلى من ١٥°م؟","En":"A container starts at 23°C and cools at a constant rate of 2°C per minute. Its temperature is recorded at the end of each minute. What is the last minute whose reading is above 15°C?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أدخل القراءة التي تساوي الحد.","En":"Includes the reading equal to the threshold."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار أول قراءة أقل من الحد.","En":"Chooses the first reading below the threshold."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى فرق درجات الحرارة كأنه عدد دقائق.","En":"Reports the temperature difference as elapsed minutes."}}],"Hints":[{"Ar":"اكتب قراءة الدقيقة n باستخدام مقدار الانخفاض التراكمي.","En":"Write the reading at minute n using the cumulative temperature drop."},{"Ar":"حدّد متى تبلغ القراءة ١٥، ثم استبعد تلك الدقيقة لأن الشرط «أعلى من».","En":"Find when the reading reaches 15, then exclude that minute because the condition says “above.”"}],"Solution":{"Idea":{"Ar":"نكتب درجة الحرارة بدلالة الزمن ونحل المتباينة الصارمة للأزمنة الصحيحة الموجبة.","En":"Express temperature as a function of time and solve the strict inequality for positive integer minutes."},"FormulaLatex":"23-2n>15\\iff n<4,\\quad n\\in\\mathbb{Z}_{>0}","Steps":[{"Ar":"قراءة الحرارة في نهاية الدقيقة $n$ هي $23-2n$.","En":"The temperature at the end of minute $n$ is $23-2n$."},{"Ar":"نحتاج أن يبقى الانخفاض أقل من ٨ درجات، أي n أصغر من ٤.","En":"The decrease must stay below 8 degrees, so n must be less than 4."}],"Substitution":{"Ar":"$\\max\\{n\\in\\mathbb{Z}_{>0}:n<4\\}=3$","En":"$\\max\\{n\\in\\mathbb{Z}_{>0}:n<4\\}=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"دقائق منذ البداية","En":"minutes from the start"},"Verification":{"Ar":"القراءة في الدقيقة الثالثة ١٧°م، وفي الرابعة ١٥°م، وتستمر في الانخفاض.","En":"The third reading is 17°C and the fourth is 15°C. Readings keep decreasing."},"CommonError":{"Ar":"أدخل القراءة التي تساوي الحد.","En":"Includes the reading equal to the threshold."}}}$mw$::jsonb,$mw$نكتب درجة الحرارة بدلالة الزمن ونحل المتباينة الصارمة للأزمنة الصحيحة الموجبة.

$23-2n>15\iff n<4,\quad n\in\mathbb{Z}_{>0}$

1. قراءة الحرارة في نهاية الدقيقة $n$ هي $23-2n$.

2. نحتاج أن يبقى الانخفاض أقل من ٨ درجات، أي n أصغر من ٤.

$\max\{n\in\mathbb{Z}_{>0}:n<4\}=3$

$3$ دقائق منذ البداية

القراءة في الدقيقة الثالثة ١٧°م، وفي الرابعة ١٥°م، وتستمر في الانخفاض.

أدخل القراءة التي تساوي الحد.$mw$,$mw$Express temperature as a function of time and solve the strict inequality for positive integer minutes.

$23-2n>15\iff n<4,\quad n\in\mathbb{Z}_{>0}$

1. The temperature at the end of minute $n$ is $23-2n$.

2. The decrease must stay below 8 degrees, so n must be less than 4.

$\max\{n\in\mathbb{Z}_{>0}:n<4\}=3$

$3$ minutes from the start

The third reading is 17°C and the fourth is 15°C. Readings keep decreasing.

Includes the reading equal to the threshold.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"اكتب قراءة الدقيقة n باستخدام مقدار الانخفاض التراكمي.","En":"Write the reading at minute n using the cumulative temperature drop."},{"Ar":"حدّد متى تبلغ القراءة ١٥، ثم استبعد تلك الدقيقة لأن الشرط «أعلى من».","En":"Find when the reading reaches 15, then exclude that minute because the condition says “above.”"}],"Solution":{"Idea":{"Ar":"نكتب درجة الحرارة بدلالة الزمن ونحل المتباينة الصارمة للأزمنة الصحيحة الموجبة.","En":"Express temperature as a function of time and solve the strict inequality for positive integer minutes."},"FormulaLatex":"23-2n>15\\iff n<4,\\quad n\\in\\mathbb{Z}_{>0}","Steps":[{"Ar":"قراءة الحرارة في نهاية الدقيقة $n$ هي $23-2n$.","En":"The temperature at the end of minute $n$ is $23-2n$."},{"Ar":"نحتاج أن يبقى الانخفاض أقل من ٨ درجات، أي n أصغر من ٤.","En":"The decrease must stay below 8 degrees, so n must be less than 4."}],"Substitution":{"Ar":"$\\max\\{n\\in\\mathbb{Z}_{>0}:n<4\\}=3$","En":"$\\max\\{n\\in\\mathbb{Z}_{>0}:n<4\\}=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"دقائق منذ البداية","En":"minutes from the start"},"Verification":{"Ar":"القراءة في الدقيقة الثالثة ١٧°م، وفي الرابعة ١٥°م، وتستمر في الانخفاض.","En":"The third reading is 17°C and the fourth is 15°C. Readings keep decreasing."},"CommonError":{"Ar":"أدخل القراءة التي تساوي الحد.","En":"Includes the reading equal to the threshold."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أدخل القراءة التي تساوي الحد.","En":"Includes the reading equal to the threshold."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"اختار أول قراءة أقل من الحد.","En":"Chooses the first reading below the threshold."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى فرق درجات الحرارة كأنه عدد دقائق.","En":"Reports the temperature difference as elapsed minutes."},"Order":4}]}$mw$),
($mw$growth-v18-grade-8-recover-exponent-from-common-base-quotient-1$mw$,$mw$recover-exponent-from-common-base-quotient$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أس مخفي في خارج قسمة قوتين","En":"A hidden exponent in a quotient"},"Question":{"Ar":"لدينا $16^n\\div8^2=4$، حيث $n$ عدد صحيح. ما قيمة $n$؟","En":"Suppose $16^n\\div8^2=4$, where $n$ is an integer. What is $n$?"},"Options":[{"LatexCode":"-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أبقى طرح الأس 6 عند نقله للطرف الآخر، فحصل على 4n=2−6.","En":"Keeps the minus sign on 6 when moving it to the other side, obtaining 4n=2−6."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى حاصل القسمة بدلاً من الأس الذي ينتجه.","En":"Reports the quotient in place of the exponent."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف عند 4n=8.","En":"Stops at 4n=8."}}],"Hints":[{"Ar":"اكتب ١٦ و٨ و٤ قوى للعدد نفسه.","En":"Write 16, 8 and 4 as powers of the same base."},{"Ar":"استخدم الأساس ٢، ثم اطرح أُس المقام من أُس البسط.","En":"Use base 2, then subtract the denominator exponent from the numerator exponent."}],"Solution":{"Idea":{"Ar":"نعيد كتابة القوى بأساس موحد أكبر من واحد، ثم نساوي الأسس بعد تطبيق قاعدة القسمة.","En":"Rewrite powers with a common base greater than one, then equate exponents after applying the quotient rule."},"FormulaLatex":"2^{4n}/2^6=2^{4n-6}=2^2","Steps":[{"Ar":"يساوي 16ⁿ العدد 2 مرفوعاً للأس 4n، ويساوي 8² العدد 2 مرفوعاً للأس 6.","En":"The numerator is 2 to the power 4n and the denominator is 2 to the power 6."},{"Ar":"تساوي القوتين بالأساس ٢ يقتضي 4n−6=2.","En":"Equality of powers of base 2 gives 4n−6=2."}],"Substitution":{"Ar":"$4n-6=2\\Rightarrow n=2$","En":"$4n-6=2\\Rightarrow n=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"عند n=2 يكون خارج القسمة 256÷64=4.","En":"At n=2 the quotient is 256÷64=4."},"CommonError":{"Ar":"أبقى طرح الأس 6 عند نقله للطرف الآخر، فحصل على 4n=2−6.","En":"Keeps the minus sign on 6 when moving it to the other side, obtaining 4n=2−6."}}}$mw$::jsonb,$mw$نعيد كتابة القوى بأساس موحد أكبر من واحد، ثم نساوي الأسس بعد تطبيق قاعدة القسمة.

$2^{4n}/2^6=2^{4n-6}=2^2$

1. يساوي 16ⁿ العدد 2 مرفوعاً للأس 4n، ويساوي 8² العدد 2 مرفوعاً للأس 6.

2. تساوي القوتين بالأساس ٢ يقتضي 4n−6=2.

$4n-6=2\Rightarrow n=2$

$2$ دون وحدة

عند n=2 يكون خارج القسمة 256÷64=4.

أبقى طرح الأس 6 عند نقله للطرف الآخر، فحصل على 4n=2−6.$mw$,$mw$Rewrite powers with a common base greater than one, then equate exponents after applying the quotient rule.

$2^{4n}/2^6=2^{4n-6}=2^2$

1. The numerator is 2 to the power 4n and the denominator is 2 to the power 6.

2. Equality of powers of base 2 gives 4n−6=2.

$4n-6=2\Rightarrow n=2$

$2$ unitless

At n=2 the quotient is 256÷64=4.

Keeps the minus sign on 6 when moving it to the other side, obtaining 4n=2−6.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"اكتب ١٦ و٨ و٤ قوى للعدد نفسه.","En":"Write 16, 8 and 4 as powers of the same base."},{"Ar":"استخدم الأساس ٢، ثم اطرح أُس المقام من أُس البسط.","En":"Use base 2, then subtract the denominator exponent from the numerator exponent."}],"Solution":{"Idea":{"Ar":"نعيد كتابة القوى بأساس موحد أكبر من واحد، ثم نساوي الأسس بعد تطبيق قاعدة القسمة.","En":"Rewrite powers with a common base greater than one, then equate exponents after applying the quotient rule."},"FormulaLatex":"2^{4n}/2^6=2^{4n-6}=2^2","Steps":[{"Ar":"يساوي 16ⁿ العدد 2 مرفوعاً للأس 4n، ويساوي 8² العدد 2 مرفوعاً للأس 6.","En":"The numerator is 2 to the power 4n and the denominator is 2 to the power 6."},{"Ar":"تساوي القوتين بالأساس ٢ يقتضي 4n−6=2.","En":"Equality of powers of base 2 gives 4n−6=2."}],"Substitution":{"Ar":"$4n-6=2\\Rightarrow n=2$","En":"$4n-6=2\\Rightarrow n=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"عند n=2 يكون خارج القسمة 256÷64=4.","En":"At n=2 the quotient is 256÷64=4."},"CommonError":{"Ar":"أبقى طرح الأس 6 عند نقله للطرف الآخر، فحصل على 4n=2−6.","En":"Keeps the minus sign on 6 when moving it to the other side, obtaining 4n=2−6."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أبقى طرح الأس 6 عند نقله للطرف الآخر، فحصل على 4n=2−6.","En":"Keeps the minus sign on 6 when moving it to the other side, obtaining 4n=2−6."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى حاصل القسمة بدلاً من الأس الذي ينتجه.","En":"Reports the quotient in place of the exponent."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"توقف عند 4n=8.","En":"Stops at 4n=8."},"Order":4}]}$mw$),
($mw$growth-v18-grade-10-unchanged-mean-replacing-different-sized-groups-1$mw$,$mw$unchanged-mean-replacing-different-sized-groups$mw$,$mw$secondary-arithmetic-mean$mw$,$mw$grade-10$mw$,10,3,35,53,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":53,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"استبدال مجموعة مع ثبات المتوسط","En":"Keeping the mean when group size changes"},"Question":{"Ar":"متوسط نتائج ستة اختبارات ١٢ نقطة. حُذفت نتيجتان متوسطهما ٨ نقاط، وأُضيفت نتيجة اختبار واحد. إذا بقي متوسط النتائج الخمس ١٢، فما النتيجة المضافة؟","En":"The mean of six quiz scores is 12 points. Two scores with mean 8 are removed and one score is added. If the mean of the resulting five scores is still 12, what score was added?"},"Options":[{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عوّض مجموع النتيجتين المحذوفتين وافترض ثبات العدد.","En":"Replaces the removed sum while assuming the count is unchanged."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وضع متوسط النتيجتين المحذوفتين مكانهما دون فحص العدد الجديد.","En":"Uses the removed scores’ mean without checking the new count."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن إضافة قيمة تساوي المتوسط تكفي بعد حذف نتيجتين أقل منه.","En":"Assumes adding the original mean suffices after two below-mean scores were removed."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"المتوسط يبقى نفسه، لكن العدد الكلي للنتائج يتغير.","En":"The mean stays the same, but the number of scores changes."},{"Ar":"احسب مجموع النتائج الأربع الباقية، ثم اطرحه من المجموع المطلوب لخمس نتائج.","En":"Find the sum of the four remaining scores, then subtract it from the required sum for five."}],"Solution":{"Idea":{"Ar":"نستعمل المتوسط مضروباً في عدد القيم لاسترجاع المجاميع قبل الحذف وبعد الإضافة.","En":"Use mean times count to recover totals before removal and after addition."},"FormulaLatex":"x=5(12)-[6(12)-2(8)]","Steps":[{"Ar":"كان المجموع ٧٢، وبعد الحذف صار ٧٢−١٦=٥٦.","En":"The original sum is 72 and removal leaves 72−16=56."},{"Ar":"يلزم أن يصبح مجموع النتائج الخمس ٦٠.","En":"The five scores must total 60."},{"Ar":"النتيجة المضافة هي الفرق بين 60 و56.","En":"The added score equals the difference between 60 and 56."}],"Substitution":{"Ar":"$x=60-56=4$","En":"$x=60-56=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"نقاط","En":"points"},"Verification":{"Ar":"متوسط ١٤ و١٤ و١٤ و١٤ و٤ هو ١٢، وكان متوسط النتائج الأربع مع ٨ و٨ أيضاً ١٢.","En":"The four 14s together with 4 average 12. The same four 14s together with 8 and 8 also average 12."},"CommonError":{"Ar":"عوّض مجموع النتيجتين المحذوفتين وافترض ثبات العدد.","En":"Replaces the removed sum while assuming the count is unchanged."}}}$mw$::jsonb,$mw$نستعمل المتوسط مضروباً في عدد القيم لاسترجاع المجاميع قبل الحذف وبعد الإضافة.

$x=5(12)-[6(12)-2(8)]$

1. كان المجموع ٧٢، وبعد الحذف صار ٧٢−١٦=٥٦.

2. يلزم أن يصبح مجموع النتائج الخمس ٦٠.

3. النتيجة المضافة هي الفرق بين 60 و56.

$x=60-56=4$

$4$ نقاط

متوسط ١٤ و١٤ و١٤ و١٤ و٤ هو ١٢، وكان متوسط النتائج الأربع مع ٨ و٨ أيضاً ١٢.

عوّض مجموع النتيجتين المحذوفتين وافترض ثبات العدد.$mw$,$mw$Use mean times count to recover totals before removal and after addition.

$x=5(12)-[6(12)-2(8)]$

1. The original sum is 72 and removal leaves 72−16=56.

2. The five scores must total 60.

3. The added score equals the difference between 60 and 56.

$x=60-56=4$

$4$ points

The four 14s together with 4 average 12. The same four 14s together with 8 and 8 also average 12.

Replaces the removed sum while assuming the count is unchanged.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"المتوسط يبقى نفسه، لكن العدد الكلي للنتائج يتغير.","En":"The mean stays the same, but the number of scores changes."},{"Ar":"احسب مجموع النتائج الأربع الباقية، ثم اطرحه من المجموع المطلوب لخمس نتائج.","En":"Find the sum of the four remaining scores, then subtract it from the required sum for five."}],"Solution":{"Idea":{"Ar":"نستعمل المتوسط مضروباً في عدد القيم لاسترجاع المجاميع قبل الحذف وبعد الإضافة.","En":"Use mean times count to recover totals before removal and after addition."},"FormulaLatex":"x=5(12)-[6(12)-2(8)]","Steps":[{"Ar":"كان المجموع ٧٢، وبعد الحذف صار ٧٢−١٦=٥٦.","En":"The original sum is 72 and removal leaves 72−16=56."},{"Ar":"يلزم أن يصبح مجموع النتائج الخمس ٦٠.","En":"The five scores must total 60."},{"Ar":"النتيجة المضافة هي الفرق بين 60 و56.","En":"The added score equals the difference between 60 and 56."}],"Substitution":{"Ar":"$x=60-56=4$","En":"$x=60-56=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"نقاط","En":"points"},"Verification":{"Ar":"متوسط ١٤ و١٤ و١٤ و١٤ و٤ هو ١٢، وكان متوسط النتائج الأربع مع ٨ و٨ أيضاً ١٢.","En":"The four 14s together with 4 average 12. The same four 14s together with 8 and 8 also average 12."},"CommonError":{"Ar":"عوّض مجموع النتيجتين المحذوفتين وافترض ثبات العدد.","En":"Replaces the removed sum while assuming the count is unchanged."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عوّض مجموع النتيجتين المحذوفتين وافترض ثبات العدد.","En":"Replaces the removed sum while assuming the count is unchanged."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"وضع متوسط النتيجتين المحذوفتين مكانهما دون فحص العدد الجديد.","En":"Uses the removed scores’ mean without checking the new count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن إضافة قيمة تساوي المتوسط تكفي بعد حذف نتيجتين أقل منه.","En":"Assumes adding the original mean suffices after two below-mean scores were removed."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v15/v16/v18 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
