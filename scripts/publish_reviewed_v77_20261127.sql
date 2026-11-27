-- One-time owner-authorized v77 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v77-grade-2-center-short-picture-on-strip-1$mw$,$mw$center-short-picture-on-strip$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"صورة وسط شريط","En":"Centering a picture"},"Question":{"Ar":"طول شريط ورقي 18 سم. وُضعت عليه صورة طولها 10 سم بحيث بقي فراغ متساوٍ عند كل طرف على امتداد الشريط. كم سنتيمتراً يبلغ طول الفراغ عند طرف واحد؟","En":"A paper strip is 18 cm long. A 10 cm picture is centered along its length, leaving equal gaps at the ends. How many centimeters long is one gap?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثمانية هو مجموع الفراغين.","En":"Eight is the length of both gaps together."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة نصف طول الصورة.","En":"Five is half the picture length."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تسعة نصف طول الشريط كله.","En":"Nine is half the whole strip."}}],"Hints":[{"Ar":"ما الطول الذي تركته الصورة مكشوفاً؟","En":"How much length does the picture leave uncovered?"},{"Ar":"كم فراغاً يشترك في الطول المتبقي؟","En":"How many gaps share what is left?"}],"Solution":{"Idea":{"Ar":"نحسب الطول غير المغطى ثم نقسمه بين طرفين.","En":"Find the uncovered length and share it between two ends."},"FormulaLatex":"18-10=8","Steps":[{"Ar":"بعد وضع الصورة يبقى 8 سم للفراغين.","En":"After placing the picture, 8 cm remains for the two gaps."},{"Ar":"نقسم 8 سم بالتساوي فنحصل على 4 سم عند كل طرف.","En":"Share 8 cm equally to get 4 cm at each end."}],"Substitution":{"Ar":"$18-10=8$","En":"$18-10=8$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"مجموع 4 سم و10 سم و4 سم يساوي 18 سم.","En":"The lengths 4 cm, 10 cm and 4 cm add to 18 cm."},"CommonError":{"Ar":"ثمانية هو مجموع الفراغين.","En":"Eight is the length of both gaps together."}}}$mw$::jsonb,$mw$نحسب الطول غير المغطى ثم نقسمه بين طرفين.

$18-10=8$

1. بعد وضع الصورة يبقى 8 سم للفراغين.

2. نقسم 8 سم بالتساوي فنحصل على 4 سم عند كل طرف.

$4$

مجموع 4 سم و10 سم و4 سم يساوي 18 سم.

ثمانية هو مجموع الفراغين.$mw$,$mw$Find the uncovered length and share it between two ends.

$18-10=8$

1. After placing the picture, 8 cm remains for the two gaps.

2. Share 8 cm equally to get 4 cm at each end.

$4$

The lengths 4 cm, 10 cm and 4 cm add to 18 cm.

Eight is the length of both gaps together.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما الطول الذي تركته الصورة مكشوفاً؟","En":"How much length does the picture leave uncovered?"},{"Ar":"كم فراغاً يشترك في الطول المتبقي؟","En":"How many gaps share what is left?"}],"Solution":{"Idea":{"Ar":"نحسب الطول غير المغطى ثم نقسمه بين طرفين.","En":"Find the uncovered length and share it between two ends."},"FormulaLatex":"18-10=8","Steps":[{"Ar":"بعد وضع الصورة يبقى 8 سم للفراغين.","En":"After placing the picture, 8 cm remains for the two gaps."},{"Ar":"نقسم 8 سم بالتساوي فنحصل على 4 سم عند كل طرف.","En":"Share 8 cm equally to get 4 cm at each end."}],"Substitution":{"Ar":"$18-10=8$","En":"$18-10=8$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"مجموع 4 سم و10 سم و4 سم يساوي 18 سم.","En":"The lengths 4 cm, 10 cm and 4 cm add to 18 cm."},"CommonError":{"Ar":"ثمانية هو مجموع الفراغين.","En":"Eight is the length of both gaps together."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ثمانية هو مجموع الفراغين.","En":"Eight is the length of both gaps together."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"خمسة نصف طول الصورة.","En":"Five is half the picture length."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تسعة نصف طول الشريط كله.","En":"Nine is half the whole strip."},"Order":4}]}$mw$),
($mw$growth-v77-grade-2-measure-bent-route-versus-endpoint-1$mw$,$mw$measure-bent-route-versus-endpoint$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طريق حول زاوية","En":"A path around a corner"},"Question":{"Ar":"يسير روبوت على خط مرسوم: 8 سم إلى اليمين ثم 5 سم إلى الأعلى ثم 8 سم إلى اليسار. كم سنتيمتراً قطع على الخط كله؟","En":"A robot follows a drawn line: 8 cm right, 5 cm up and 8 cm left. How many centimeters does it travel along the entire line?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة هي المسافة العمودية بين البداية والنهاية فقط.","En":"Five is only the vertical distance between the start and finish."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع طول جزأين فقط.","En":"This adds only two of the segments."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا طول الجزأين الأفقيين فقط.","En":"This counts only the horizontal segments."}},{"LatexCode":"21","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تتبّع خط الروبوت بإصبعك.","En":"Trace the robot’s line with your finger."},{"Ar":"هل يختفي طول الجزء الأول عندما ينعطف الروبوت؟","En":"Does the first segment stop counting when the robot turns?"}],"Solution":{"Idea":{"Ar":"نقيس المسار بجمع أطوال كل أجزائه.","En":"Measure the route by adding every segment length."},"FormulaLatex":"8+5+8=21","Steps":[{"Ar":"قطع الروبوت 13 سم قبل أن ينعطف إلى اليسار.","En":"The robot travels 13 cm before turning left."},{"Ar":"الانعطاف لا يلغي ما قطعه؛ نضيف آخر 8 سم.","En":"Turning does not erase earlier travel. Add the last 8 cm."}],"Substitution":{"Ar":"$8+5+8=21$","En":"$8+5+8=21$"},"Result":{"Ar":"$21$","En":"$21$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"الجزآن الأفقيان 16 سم، ومع 5 سم إلى الأعلى نحصل على 21 سم.","En":"The horizontal parts total 16 cm. Adding 5 cm upward gives 21 cm."},"CommonError":{"Ar":"خمسة هي المسافة العمودية بين البداية والنهاية فقط.","En":"Five is only the vertical distance between the start and finish."}}}$mw$::jsonb,$mw$نقيس المسار بجمع أطوال كل أجزائه.

$8+5+8=21$

1. قطع الروبوت 13 سم قبل أن ينعطف إلى اليسار.

2. الانعطاف لا يلغي ما قطعه؛ نضيف آخر 8 سم.

$21$

الجزآن الأفقيان 16 سم، ومع 5 سم إلى الأعلى نحصل على 21 سم.

خمسة هي المسافة العمودية بين البداية والنهاية فقط.$mw$,$mw$Measure the route by adding every segment length.

$8+5+8=21$

1. The robot travels 13 cm before turning left.

2. Turning does not erase earlier travel. Add the last 8 cm.

$21$

The horizontal parts total 16 cm. Adding 5 cm upward gives 21 cm.

Five is only the vertical distance between the start and finish.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تتبّع خط الروبوت بإصبعك.","En":"Trace the robot’s line with your finger."},{"Ar":"هل يختفي طول الجزء الأول عندما ينعطف الروبوت؟","En":"Does the first segment stop counting when the robot turns?"}],"Solution":{"Idea":{"Ar":"نقيس المسار بجمع أطوال كل أجزائه.","En":"Measure the route by adding every segment length."},"FormulaLatex":"8+5+8=21","Steps":[{"Ar":"قطع الروبوت 13 سم قبل أن ينعطف إلى اليسار.","En":"The robot travels 13 cm before turning left."},{"Ar":"الانعطاف لا يلغي ما قطعه؛ نضيف آخر 8 سم.","En":"Turning does not erase earlier travel. Add the last 8 cm."}],"Substitution":{"Ar":"$8+5+8=21$","En":"$8+5+8=21$"},"Result":{"Ar":"$21$","En":"$21$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"الجزآن الأفقيان 16 سم، ومع 5 سم إلى الأعلى نحصل على 21 سم.","En":"The horizontal parts total 16 cm. Adding 5 cm upward gives 21 cm."},"CommonError":{"Ar":"خمسة هي المسافة العمودية بين البداية والنهاية فقط.","En":"Five is only the vertical distance between the start and finish."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خمسة هي المسافة العمودية بين البداية والنهاية فقط.","En":"Five is only the vertical distance between the start and finish."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع طول جزأين فقط.","En":"This adds only two of the segments."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا طول الجزأين الأفقيين فقط.","En":"This counts only the horizontal segments."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v77-grade-2-length-range-combine-1$mw$,$mw$length-range-combine$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أقل طول ممكن","En":"Shortest possible length"},"Question":{"Ar":"طول قلم إما 7 سم أو 9 سم، وطول ممحاة إما 3 سم أو 4 سم. وضعناهما على استقامة واحدة بحيث يتلامس طرفاهما. ما أقل طول ممكن لهما معاً بالسنتيمتر؟","En":"A pencil is either 7 or 9 cm long and an eraser is either 3 or 4 cm long. They touch end to end in a straight line. What is their shortest possible combined length in centimeters?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الممحاة الأطول مع القلم الأقصر.","En":"This uses the longer eraser with the shorter pencil."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار القلم الأطول مع الممحاة الأقصر.","En":"This uses the longer pencil with the shorter eraser."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم الطولين الأكبرين.","En":"This uses both longer lengths."}}],"Hints":[{"Ar":"أي طول للقلم يساعدك على الحصول على أقصر صف؟","En":"Which pencil length helps make the shortest row?"},{"Ar":"اختر طول الممحاة بالطريقة نفسها.","En":"Choose the eraser length the same way."}],"Solution":{"Idea":{"Ar":"نختار أقصر احتمال لكل جسم ثم نجمع الطولين.","En":"Choose the shorter possibility for each object and add the lengths."},"FormulaLatex":"7+3=10","Steps":[{"Ar":"أقصر قلم 7 سم وأقصر ممحاة 3 سم.","En":"The shortest pencil is 7 cm and the shortest eraser is 3 cm."},{"Ar":"يتلامس الطرفان فلا يوجد فراغ نضيفه.","En":"The ends touch, so there is no gap to add."}],"Substitution":{"Ar":"$7+3=10$","En":"$7+3=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"زيادة طول أي جسم ستجعل المجموع أكبر من 10 سم.","En":"Using a longer version of either object gives more than 10 cm."},"CommonError":{"Ar":"اختار الممحاة الأطول مع القلم الأقصر.","En":"This uses the longer eraser with the shorter pencil."}}}$mw$::jsonb,$mw$نختار أقصر احتمال لكل جسم ثم نجمع الطولين.

$7+3=10$

1. أقصر قلم 7 سم وأقصر ممحاة 3 سم.

2. يتلامس الطرفان فلا يوجد فراغ نضيفه.

$10$

زيادة طول أي جسم ستجعل المجموع أكبر من 10 سم.

اختار الممحاة الأطول مع القلم الأقصر.$mw$,$mw$Choose the shorter possibility for each object and add the lengths.

$7+3=10$

1. The shortest pencil is 7 cm and the shortest eraser is 3 cm.

2. The ends touch, so there is no gap to add.

$10$

Using a longer version of either object gives more than 10 cm.

This uses the longer eraser with the shorter pencil.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أي طول للقلم يساعدك على الحصول على أقصر صف؟","En":"Which pencil length helps make the shortest row?"},{"Ar":"اختر طول الممحاة بالطريقة نفسها.","En":"Choose the eraser length the same way."}],"Solution":{"Idea":{"Ar":"نختار أقصر احتمال لكل جسم ثم نجمع الطولين.","En":"Choose the shorter possibility for each object and add the lengths."},"FormulaLatex":"7+3=10","Steps":[{"Ar":"أقصر قلم 7 سم وأقصر ممحاة 3 سم.","En":"The shortest pencil is 7 cm and the shortest eraser is 3 cm."},{"Ar":"يتلامس الطرفان فلا يوجد فراغ نضيفه.","En":"The ends touch, so there is no gap to add."}],"Substitution":{"Ar":"$7+3=10$","En":"$7+3=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"زيادة طول أي جسم ستجعل المجموع أكبر من 10 سم.","En":"Using a longer version of either object gives more than 10 cm."},"CommonError":{"Ar":"اختار الممحاة الأطول مع القلم الأقصر.","En":"This uses the longer eraser with the shorter pencil."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"اختار الممحاة الأطول مع القلم الأقصر.","En":"This uses the longer eraser with the shorter pencil."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اختار القلم الأطول مع الممحاة الأقصر.","En":"This uses the longer pencil with the shorter eraser."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استخدم الطولين الأكبرين.","En":"This uses both longer lengths."},"Order":4}]}$mw$),
($mw$growth-v77-grade-2-estimate-with-two-known-lengths-1$mw$,$mw$estimate-with-two-known-lengths$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقدير طول القلم","En":"Estimating a pencil length"},"Question":{"Ar":"طول بطاقة 8 سم. قلم أطول من بطاقة واحدة لكنه أقصر من بطاقتين متلامستين طرفاً بطرف. أي طول من الخيارات يمكن أن يكون طول القلم بالسنتيمتر؟","En":"A card is 8 cm long. A pencil is longer than one card but shorter than two cards placed end to end. Which listed length in centimeters could be the pencil length?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي طول بطاقة واحدة.","En":"This equals one card length."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي طول بطاقتين.","En":"This equals two card lengths."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا أطول من البطاقتين معاً.","En":"This is longer than the two cards together."}}],"Hints":[{"Ar":"كم يقيس صف من بطاقتين؟","En":"How long is a row of two cards?"},{"Ar":"استبعد ما يساوي أحد الحدين أو يتجاوزه في الاتجاه الخطأ.","En":"Discard either endpoint and any length outside the two limits."}],"Solution":{"Idea":{"Ar":"نستخدم طول البطاقة مرجعاً لحدّي التقدير.","En":"Use the card length to find both limits of the estimate."},"FormulaLatex":"8<12<16","Steps":[{"Ar":"بطاقتان متلامستان طولهما 16 سم.","En":"Two cards end to end measure 16 cm."},{"Ar":"من الخيارات يقع 12 فقط بين 8 و16.","En":"Only 12 among the choices lies between 8 and 16."}],"Substitution":{"Ar":"$8<12<16$","En":"$8<12<16$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"قلم طوله 12 سم يتجاوز بطاقة واحدة بأربعة سم ويقصر عن بطاقتين بأربعة سم.","En":"A 12 cm pencil is 4 cm longer than one card and 4 cm shorter than two."},"CommonError":{"Ar":"هذا يساوي طول بطاقة واحدة.","En":"This equals one card length."}}}$mw$::jsonb,$mw$نستخدم طول البطاقة مرجعاً لحدّي التقدير.

$8<12<16$

1. بطاقتان متلامستان طولهما 16 سم.

2. من الخيارات يقع 12 فقط بين 8 و16.

$12$

قلم طوله 12 سم يتجاوز بطاقة واحدة بأربعة سم ويقصر عن بطاقتين بأربعة سم.

هذا يساوي طول بطاقة واحدة.$mw$,$mw$Use the card length to find both limits of the estimate.

$8<12<16$

1. Two cards end to end measure 16 cm.

2. Only 12 among the choices lies between 8 and 16.

$12$

A 12 cm pencil is 4 cm longer than one card and 4 cm shorter than two.

This equals one card length.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم يقيس صف من بطاقتين؟","En":"How long is a row of two cards?"},{"Ar":"استبعد ما يساوي أحد الحدين أو يتجاوزه في الاتجاه الخطأ.","En":"Discard either endpoint and any length outside the two limits."}],"Solution":{"Idea":{"Ar":"نستخدم طول البطاقة مرجعاً لحدّي التقدير.","En":"Use the card length to find both limits of the estimate."},"FormulaLatex":"8<12<16","Steps":[{"Ar":"بطاقتان متلامستان طولهما 16 سم.","En":"Two cards end to end measure 16 cm."},{"Ar":"من الخيارات يقع 12 فقط بين 8 و16.","En":"Only 12 among the choices lies between 8 and 16."}],"Substitution":{"Ar":"$8<12<16$","En":"$8<12<16$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"قلم طوله 12 سم يتجاوز بطاقة واحدة بأربعة سم ويقصر عن بطاقتين بأربعة سم.","En":"A 12 cm pencil is 4 cm longer than one card and 4 cm shorter than two."},"CommonError":{"Ar":"هذا يساوي طول بطاقة واحدة.","En":"This equals one card length."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي طول بطاقة واحدة.","En":"This equals one card length."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يساوي طول بطاقتين.","En":"This equals two card lengths."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا أطول من البطاقتين معاً.","En":"This is longer than the two cards together."},"Order":4}]}$mw$),
($mw$growth-v77-grade-2-string-measures-curved-edge-1$mw$,$mw$string-measures-curved-edge$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قياس خط منحنٍ","En":"Measuring a curved line"},"Question":{"Ar":"تريد سلمى قياس طول خط منحنٍ مرسوم. أي طريقة تستخدم؟ A تقيس المسافة المستقيمة بين طرفيه. B تضع خيطاً على الخط كله ثم تفرده على مسطرة دون شده. C تقيس عرض الخط. D تقيس طول الورقة.","En":"Salma wants the length of a curved line on paper. Which method should she use? A measure straight between its ends, B follow the whole line with string and straighten it along a ruler without stretching, C measure the line’s width, D measure the length of the paper."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الوصلة المستقيمة تختصر الانحناء.","En":"The straight connection skips the bend."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عرض الخط لا يقيس المسار على امتداده.","En":"The width does not measure distance along the line."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قد يتغير حجم الورقة مع بقاء الخط نفسه.","En":"The paper size can change while the line stays the same."}}],"Hints":[{"Ar":"هل تسير المسطرة المستقيمة حول المنعطف؟","En":"Can a straight ruler follow the bend?"},{"Ar":"فكر في شيء يتبع الخط ثم يستقيم دون أن يتغير طوله.","En":"Think of something that follows the line and then straightens without changing length."}],"Solution":{"Idea":{"Ar":"ننقل طول المسار إلى خيط مرن.","En":"Transfer the path length to a flexible string."},"FormulaLatex":"L_{curve}=L_{string}","Steps":[{"Ar":"نجعل الخيط يتبع الانحناء تماماً ونحدد موضعي الطرفين عليه.","En":"Make the string follow the bend and mark the endpoints on it."},{"Ar":"نفرد الجزء المعلّم من الخيط على المسطرة دون شده.","En":"Straighten the marked section along the ruler without stretching it."}],"Substitution":{"Ar":"$L_{curve}=L_{string}$","En":"$L_{curve}=L_{string}$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند إعادة الخيط إلى الخط المنحني تقع العلامتان على طرفيه.","En":"When the string is laid back on the curve, its marks meet the endpoints."},"CommonError":{"Ar":"الوصلة المستقيمة تختصر الانحناء.","En":"The straight connection skips the bend."}}}$mw$::jsonb,$mw$ننقل طول المسار إلى خيط مرن.

$L_{curve}=L_{string}$

1. نجعل الخيط يتبع الانحناء تماماً ونحدد موضعي الطرفين عليه.

2. نفرد الجزء المعلّم من الخيط على المسطرة دون شده.

$B$

عند إعادة الخيط إلى الخط المنحني تقع العلامتان على طرفيه.

الوصلة المستقيمة تختصر الانحناء.$mw$,$mw$Transfer the path length to a flexible string.

$L_{curve}=L_{string}$

1. Make the string follow the bend and mark the endpoints on it.

2. Straighten the marked section along the ruler without stretching it.

$B$

When the string is laid back on the curve, its marks meet the endpoints.

The straight connection skips the bend.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل تسير المسطرة المستقيمة حول المنعطف؟","En":"Can a straight ruler follow the bend?"},{"Ar":"فكر في شيء يتبع الخط ثم يستقيم دون أن يتغير طوله.","En":"Think of something that follows the line and then straightens without changing length."}],"Solution":{"Idea":{"Ar":"ننقل طول المسار إلى خيط مرن.","En":"Transfer the path length to a flexible string."},"FormulaLatex":"L_{curve}=L_{string}","Steps":[{"Ar":"نجعل الخيط يتبع الانحناء تماماً ونحدد موضعي الطرفين عليه.","En":"Make the string follow the bend and mark the endpoints on it."},{"Ar":"نفرد الجزء المعلّم من الخيط على المسطرة دون شده.","En":"Straighten the marked section along the ruler without stretching it."}],"Substitution":{"Ar":"$L_{curve}=L_{string}$","En":"$L_{curve}=L_{string}$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند إعادة الخيط إلى الخط المنحني تقع العلامتان على طرفيه.","En":"When the string is laid back on the curve, its marks meet the endpoints."},"CommonError":{"Ar":"الوصلة المستقيمة تختصر الانحناء.","En":"The straight connection skips the bend."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الوصلة المستقيمة تختصر الانحناء.","En":"The straight connection skips the bend."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عرض الخط لا يقيس المسار على امتداده.","En":"The width does not measure distance along the line."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قد يتغير حجم الورقة مع بقاء الخط نفسه.","En":"The paper size can change while the line stays the same."},"Order":4}]}$mw$),
($mw$growth-v77-grade-2-strip-flipped-read-mark-1$mw$,$mw$strip-flipped-read-mark$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قلب الشريط","En":"Turning a strip around"},"Question":{"Ar":"شريط طوله 15 سم وعليه نجمة على بعد 4 سم من طرفه الأيسر. قُلب الشريط على الطاولة حتى تبادل الطرفان مكانهما. كم سنتيمتراً تبعد النجمة الآن عن الطرف الأيسر الجديد؟","En":"A 15 cm strip has a star 4 cm from its left end. It is turned around on the table so the ends swap places. How many centimeters is the star from the new left end?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعة هي المسافة إلى الطرف الأيسر القديم.","En":"Four is the distance from the old left end."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة عشر هو طول الشريط كله.","En":"Fifteen is the whole strip length."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمكن أن تقع النجمة على بعد يتجاوز طول الشريط.","En":"A star on the strip cannot be farther away than the strip is long."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ضع علامة على الطرف الذي كان يميناً.","En":"Mark the end that was on the right."},{"Ar":"أي جزء يقع بين هذا الطرف والنجمة؟","En":"Which part lies between that end and the star?"}],"Solution":{"Idea":{"Ar":"الطرف الأيسر الجديد هو الطرف الأيمن القديم.","En":"The new left end is the old right end."},"FormulaLatex":"15-4=11","Steps":[{"Ar":"تقسم النجمة الشريط إلى جزأين طولاهما 4 سم و11 سم.","En":"The star divides the strip into lengths of 4 cm and 11 cm."},{"Ar":"عند تبادل الطرفين يصبح الجزء الأطول على اليسار.","En":"When the ends swap, the longer part is on the left."}],"Substitution":{"Ar":"$15-4=11$","En":"$15-4=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"المسافتان من النجمة إلى الطرفين مجموعهما 15 سم قبل القلب وبعده.","En":"The distances from the star to the two ends still sum to 15 cm after turning."},"CommonError":{"Ar":"أربعة هي المسافة إلى الطرف الأيسر القديم.","En":"Four is the distance from the old left end."}}}$mw$::jsonb,$mw$الطرف الأيسر الجديد هو الطرف الأيمن القديم.

$15-4=11$

1. تقسم النجمة الشريط إلى جزأين طولاهما 4 سم و11 سم.

2. عند تبادل الطرفين يصبح الجزء الأطول على اليسار.

$11$

المسافتان من النجمة إلى الطرفين مجموعهما 15 سم قبل القلب وبعده.

أربعة هي المسافة إلى الطرف الأيسر القديم.$mw$,$mw$The new left end is the old right end.

$15-4=11$

1. The star divides the strip into lengths of 4 cm and 11 cm.

2. When the ends swap, the longer part is on the left.

$11$

The distances from the star to the two ends still sum to 15 cm after turning.

Four is the distance from the old left end.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع علامة على الطرف الذي كان يميناً.","En":"Mark the end that was on the right."},{"Ar":"أي جزء يقع بين هذا الطرف والنجمة؟","En":"Which part lies between that end and the star?"}],"Solution":{"Idea":{"Ar":"الطرف الأيسر الجديد هو الطرف الأيمن القديم.","En":"The new left end is the old right end."},"FormulaLatex":"15-4=11","Steps":[{"Ar":"تقسم النجمة الشريط إلى جزأين طولاهما 4 سم و11 سم.","En":"The star divides the strip into lengths of 4 cm and 11 cm."},{"Ar":"عند تبادل الطرفين يصبح الجزء الأطول على اليسار.","En":"When the ends swap, the longer part is on the left."}],"Substitution":{"Ar":"$15-4=11$","En":"$15-4=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"المسافتان من النجمة إلى الطرفين مجموعهما 15 سم قبل القلب وبعده.","En":"The distances from the star to the two ends still sum to 15 cm after turning."},"CommonError":{"Ar":"أربعة هي المسافة إلى الطرف الأيسر القديم.","En":"Four is the distance from the old left end."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أربعة هي المسافة إلى الطرف الأيسر القديم.","En":"Four is the distance from the old left end."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"خمسة عشر هو طول الشريط كله.","En":"Fifteen is the whole strip length."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يمكن أن تقع النجمة على بعد يتجاوز طول الشريط.","En":"A star on the strip cannot be farther away than the strip is long."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
DO $$ BEGIN IF EXISTS (SELECT 1 FROM (SELECT track, category, count(*) n FROM growth_batch GROUP BY 1,2) b WHERE b.n+(SELECT count(*) FROM "LearningTrackProblems" tp JOIN "Problems" p ON p."Id"=tp."ProblemId" WHERE tp."TrackId"=b.track AND p."CategoryId"=b.category)>20) THEN RAISE EXCEPTION 'Target already filled'; END IF; END $$;
CREATE TEMP TABLE growth_seen ON COMMIT DROP AS SELECT upper(regexp_replace(btrim(ar),'[[:space:]]+',' ','g')) ar,upper(regexp_replace(btrim(en),'[[:space:]]+',' ','g')) en FROM (SELECT "QuestionTextAr" ar,"QuestionTextEn" en FROM public."Problems" UNION ALL SELECT "QuestionTextAr","QuestionTextEn" FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn' AND "WizardJson" IS NOT NULL UNION ALL SELECT "WizardJson"::jsonb#>>'{Question,Ar}',"WizardJson"::jsonb#>>'{Question,En}' FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn') q;
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM growth_seen q WHERE q.ar=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR q.en=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO growth_seen VALUES (upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')),upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')));
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v77 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
