-- One-time owner-authorized v71 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v71-grade-11-circle-internal-tangency-center-separation-1$mw$,$mw$circle-internal-tangency-center-separation$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تماس داخلي","En":"Internal circle tangency"},"Question":{"Ar":"دائرتان متماستان داخلياً، نصفا قطريهما 11 و4. ما المسافة بين مركزيهما؟","En":"Two circles are internally tangent with radii 11 and 4. Find the distance between their centers."},"Options":[{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل شرط التماس الخارجي.","En":"Uses external tangency."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف القطر الأصغر فقط.","En":"Uses only the smaller radius."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف القطر الأكبر فقط.","En":"Uses only the larger radius."}}],"Hints":[{"Ar":"تخيل الدائرة الصغيرة داخل الكبيرة.","En":"Imagine the smaller circle inside the larger."},{"Ar":"اربط المسافتين من نقطة التماس إلى المركزين.","En":"Relate distances from the contact point to the centers."}],"Solution":{"Idea":{"Ar":"في التماس الداخلي تساوي المسافة فرق نصفي القطرين.","En":"For internal tangency, center distance equals the difference of radii."},"FormulaLatex":"d=R-r","Steps":[{"Ar":"$d=11-4=7$","En":"$d=11-4=7$"}],"Substitution":{"Ar":"$d=R-r$","En":"$d=R-r$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+4=11$، فتصل الدائرة الصغيرة إلى حدود الكبيرة عند نقطة واحدة.","En":"$7+4=11$, giving a single internal contact point."},"CommonError":{"Ar":"استعمل شرط التماس الخارجي.","En":"Uses external tangency."}}}$mw$::jsonb,$mw$في التماس الداخلي تساوي المسافة فرق نصفي القطرين.

$d=R-r$

1. $d=11-4=7$

$d=R-r$

$7$

$7+4=11$، فتصل الدائرة الصغيرة إلى حدود الكبيرة عند نقطة واحدة.

استعمل شرط التماس الخارجي.$mw$,$mw$For internal tangency, center distance equals the difference of radii.

$d=R-r$

1. $d=11-4=7$

$d=R-r$

$7$

$7+4=11$, giving a single internal contact point.

Uses external tangency.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل الدائرة الصغيرة داخل الكبيرة.","En":"Imagine the smaller circle inside the larger."},{"Ar":"اربط المسافتين من نقطة التماس إلى المركزين.","En":"Relate distances from the contact point to the centers."}],"Solution":{"Idea":{"Ar":"في التماس الداخلي تساوي المسافة فرق نصفي القطرين.","En":"For internal tangency, center distance equals the difference of radii."},"FormulaLatex":"d=R-r","Steps":[{"Ar":"$d=11-4=7$","En":"$d=11-4=7$"}],"Substitution":{"Ar":"$d=R-r$","En":"$d=R-r$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+4=11$، فتصل الدائرة الصغيرة إلى حدود الكبيرة عند نقطة واحدة.","En":"$7+4=11$, giving a single internal contact point."},"CommonError":{"Ar":"استعمل شرط التماس الخارجي.","En":"Uses external tangency."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل شرط التماس الخارجي.","En":"Uses external tangency."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف القطر الأصغر فقط.","En":"Uses only the smaller radius."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف القطر الأكبر فقط.","En":"Uses only the larger radius."},"Order":4}]}$mw$),
($mw$growth-v71-grade-11-locus-fixed-sum-distances-on-segment-1$mw$,$mw$locus-fixed-sum-distances-on-segment$mw$,$mw$loci$mw$,$mw$grade-11$mw$,11,3,88,330,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":330,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مسار مجموع مسافتين ثابت","En":"Locus of a fixed distance sum"},"Question":{"Ar":"النقطتان $A=(0,0)$ و$B=(6,0)$. ما مجموعة النقاط $P$ التي تحقق $PA+PB=6$؟ A القطعة AB، B المستقيم AB كله، C دائرة مركزها A، D نقطة المنتصف فقط.","En":"For $A=(0,0)$ and $B=(6,0)$, what is the locus of $P$ satisfying $PA+PB=6$? A: segment AB; B: whole line AB; C: circle centered at A; D: midpoint only."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"النقاط خارج القطعة تجعل المجموع أكبر من 6.","En":"Points outside the segment give a larger sum."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المسافة إلى A ليست ثابتة منفردة.","En":"Distance to A alone is not fixed."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"كل نقطة على القطعة تحقق الشرط.","En":"Every point on the segment satisfies the condition."}}],"Hints":[{"Ar":"قارن مجموع المسافتين بالمسافة المباشرة بين A وB.","En":"Compare the distance sum with the direct distance AB."},{"Ar":"حدد متى يتحقق التساوي.","En":"Identify when equality holds."}],"Solution":{"Idea":{"Ar":"تتحقق المساواة في متباينة المثلث عندما تقع النقطة على القطعة بين الطرفين.","En":"Equality in the triangle inequality holds when the point lies on the segment between the endpoints."},"FormulaLatex":"PA+PB\\ge AB=6","Steps":[{"Ar":"$P=(x,0),\\quad 0\\le x\\le6$","En":"$P=(x,0),\\quad 0\\le x\\le6$"},{"Ar":"$x+(6-x)=6$","En":"$x+(6-x)=6$"}],"Substitution":{"Ar":"$PA+PB\\ge AB=6$","En":"$PA+PB\\ge AB=6$"},"Result":{"Ar":"A — القطعة المستقيمة $AB$.","En":"A — the line segment $AB$."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$P=(2,0)$ يعطي $2+4=6$، أما أي نقطة خارج القطعة فتعطي مساراً أطول.","En":"$P=(2,0)$ gives $2+4=6$; any point off the segment gives a longer path."},"CommonError":{"Ar":"النقاط خارج القطعة تجعل المجموع أكبر من 6.","En":"Points outside the segment give a larger sum."}}}$mw$::jsonb,$mw$تتحقق المساواة في متباينة المثلث عندما تقع النقطة على القطعة بين الطرفين.

$PA+PB\ge AB=6$

1. $P=(x,0),\quad 0\le x\le6$

2. $x+(6-x)=6$

$PA+PB\ge AB=6$

A — القطعة المستقيمة $AB$.

$P=(2,0)$ يعطي $2+4=6$، أما أي نقطة خارج القطعة فتعطي مساراً أطول.

النقاط خارج القطعة تجعل المجموع أكبر من 6.$mw$,$mw$Equality in the triangle inequality holds when the point lies on the segment between the endpoints.

$PA+PB\ge AB=6$

1. $P=(x,0),\quad 0\le x\le6$

2. $x+(6-x)=6$

$PA+PB\ge AB=6$

A — the line segment $AB$.

$P=(2,0)$ gives $2+4=6$; any point off the segment gives a longer path.

Points outside the segment give a larger sum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قارن مجموع المسافتين بالمسافة المباشرة بين A وB.","En":"Compare the distance sum with the direct distance AB."},{"Ar":"حدد متى يتحقق التساوي.","En":"Identify when equality holds."}],"Solution":{"Idea":{"Ar":"تتحقق المساواة في متباينة المثلث عندما تقع النقطة على القطعة بين الطرفين.","En":"Equality in the triangle inequality holds when the point lies on the segment between the endpoints."},"FormulaLatex":"PA+PB\\ge AB=6","Steps":[{"Ar":"$P=(x,0),\\quad 0\\le x\\le6$","En":"$P=(x,0),\\quad 0\\le x\\le6$"},{"Ar":"$x+(6-x)=6$","En":"$x+(6-x)=6$"}],"Substitution":{"Ar":"$PA+PB\\ge AB=6$","En":"$PA+PB\\ge AB=6$"},"Result":{"Ar":"A — القطعة المستقيمة $AB$.","En":"A — the line segment $AB$."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$P=(2,0)$ يعطي $2+4=6$، أما أي نقطة خارج القطعة فتعطي مساراً أطول.","En":"$P=(2,0)$ gives $2+4=6$; any point off the segment gives a longer path."},"CommonError":{"Ar":"النقاط خارج القطعة تجعل المجموع أكبر من 6.","En":"Points outside the segment give a larger sum."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"النقاط خارج القطعة تجعل المجموع أكبر من 6.","En":"Points outside the segment give a larger sum."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"المسافة إلى A ليست ثابتة منفردة.","En":"Distance to A alone is not fixed."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"كل نقطة على القطعة تحقق الشرط.","En":"Every point on the segment satisfies the condition."},"Order":4}]}$mw$),
($mw$growth-v71-grade-11-circle-line-intersection-by-distance-1$mw$,$mw$circle-line-intersection-by-distance$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد تقاطعات مستقيم ودائرة","En":"Circle-line intersection by distance"},"Question":{"Ar":"دائرة مركزها $(2,3)$ ونصف قطرها 4. أي مستقيم من الخيارات يقطعها في نقطتين؟","En":"A circle has center $(2,3)$ and radius 4. Which listed line intersects it at two points?"},"Options":[{"LatexCode":"y=7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المستقيم مماس فقط.","En":"This line is tangent."}},{"LatexCode":"y=8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بعده عن المركز أكبر من نصف القطر.","En":"Its center distance exceeds the radius."}},{"LatexCode":"y=5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"y=-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بعده عن المركز يساوي 5 وهو أكبر من 4.","En":"Its center distance is five, greater than four."}}],"Hints":[{"Ar":"احسب بعد كل مستقيم أفقي عن المركز.","En":"Find the distance from the center to each horizontal line."},{"Ar":"قارن المسافات بنصف القطر.","En":"Compare the distances with the radius."}],"Solution":{"Idea":{"Ar":"يقطع المستقيم الدائرة في نقطتين عندما يكون بعده العمودي عن المركز أقل من نصف القطر.","En":"A line intersects at two points when its perpendicular center distance is less than the radius."},"FormulaLatex":"d=|k-3|","Steps":[{"Ar":"$|7-3|=4,\\quad |8-3|=5$","En":"$|7-3|=4,\\quad |8-3|=5$"},{"Ar":"$|5-3|=2<4,\\quad |-2-3|=5$","En":"$|5-3|=2<4,\\quad |-2-3|=5$"}],"Substitution":{"Ar":"$d=|k-3|$","En":"$d=|k-3|$"},"Result":{"Ar":"$y=5$","En":"$y=5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند $y=5$ نحصل على $(x-2)^2=12$ وله حلان مختلفان.","En":"At $y=5$, $(x-2)^2=12$ has two distinct solutions."},"CommonError":{"Ar":"هذا المستقيم مماس فقط.","En":"This line is tangent."}}}$mw$::jsonb,$mw$يقطع المستقيم الدائرة في نقطتين عندما يكون بعده العمودي عن المركز أقل من نصف القطر.

$d=|k-3|$

1. $|7-3|=4,\quad |8-3|=5$

2. $|5-3|=2<4,\quad |-2-3|=5$

$d=|k-3|$

$y=5$

عند $y=5$ نحصل على $(x-2)^2=12$ وله حلان مختلفان.

هذا المستقيم مماس فقط.$mw$,$mw$A line intersects at two points when its perpendicular center distance is less than the radius.

$d=|k-3|$

1. $|7-3|=4,\quad |8-3|=5$

2. $|5-3|=2<4,\quad |-2-3|=5$

$d=|k-3|$

$y=5$

At $y=5$, $(x-2)^2=12$ has two distinct solutions.

This line is tangent.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب بعد كل مستقيم أفقي عن المركز.","En":"Find the distance from the center to each horizontal line."},{"Ar":"قارن المسافات بنصف القطر.","En":"Compare the distances with the radius."}],"Solution":{"Idea":{"Ar":"يقطع المستقيم الدائرة في نقطتين عندما يكون بعده العمودي عن المركز أقل من نصف القطر.","En":"A line intersects at two points when its perpendicular center distance is less than the radius."},"FormulaLatex":"d=|k-3|","Steps":[{"Ar":"$|7-3|=4,\\quad |8-3|=5$","En":"$|7-3|=4,\\quad |8-3|=5$"},{"Ar":"$|5-3|=2<4,\\quad |-2-3|=5$","En":"$|5-3|=2<4,\\quad |-2-3|=5$"}],"Substitution":{"Ar":"$d=|k-3|$","En":"$d=|k-3|$"},"Result":{"Ar":"$y=5$","En":"$y=5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند $y=5$ نحصل على $(x-2)^2=12$ وله حلان مختلفان.","En":"At $y=5$, $(x-2)^2=12$ has two distinct solutions."},"CommonError":{"Ar":"هذا المستقيم مماس فقط.","En":"This line is tangent."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا المستقيم مماس فقط.","En":"This line is tangent."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"بعده عن المركز أكبر من نصف القطر.","En":"Its center distance exceeds the radius."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"بعده عن المركز يساوي 5 وهو أكبر من 4.","En":"Its center distance is five, greater than four."},"Order":4}]}$mw$),
($mw$growth-v71-grade-2-rectangle-rotation-quarter-turn-side-swap-1$mw$,$mw$rectangle-rotation-quarter-turn-side-swap$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"دوران مستطيل","En":"Quarter-turn of a rectangle"},"Question":{"Ar":"مستطيل عرضه الأفقي أطول من ارتفاعه. نديره ربع دورة في مستوى الورقة. أي وصف صحيح؟ A يصبح ارتفاعه أكبر من عرضه، B يصبح مربعاً، C يبقى عرضه أكبر، D تتغير أطوال أضلاعه.","En":"A rectangle is wider than it is tall. Rotate it a quarter turn in the plane. Which is true? A: it becomes taller than wide; B: becomes a square; C: remains wider; D: its side lengths change."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الدوران لا يجعل ضلعين مختلفين متساويين.","En":"Rotation does not make unequal sides equal."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تبادل الاتجاهان الأفقي والعمودي.","En":"Horizontal and vertical directions swap."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الدوران يحافظ على الأطوال.","En":"Rotation preserves lengths."}}],"Hints":[{"Ar":"تخيل تدوير ورقة مستطيلة.","En":"Imagine turning a rectangular sheet."},{"Ar":"لاحظ موضع الضلع الطويل بعد الدوران.","En":"Notice the long side's new direction."}],"Solution":{"Idea":{"Ar":"ربع الدورة ينقل اتجاه الأضلاع الطويلة من الأفقي إلى العمودي.","En":"A quarter turn changes long sides from horizontal to vertical."},"FormulaLatex":"90^\\circ","Steps":[{"Ar":"ينتقل الضلع الطويل إلى الاتجاه العمودي والقصير إلى الأفقي.","En":"The long side becomes vertical and the short side horizontal."}],"Substitution":{"Ar":"$6>2$ قبل الدوران وبعده تتبادل الأبعاد.","En":"$6>2$ before rotation; the dimensions exchange places."},"Result":{"Ar":"A — يصبح الارتفاع أكبر من العرض.","En":"A — it becomes taller than wide."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مستطيل عرضه 6 وارتفاعه 2 يصبح عرضه 2 وارتفاعه 6.","En":"A rectangle six wide and two tall becomes two wide and six tall."},"CommonError":{"Ar":"الدوران لا يجعل ضلعين مختلفين متساويين.","En":"Rotation does not make unequal sides equal."}}}$mw$::jsonb,$mw$ربع الدورة ينقل اتجاه الأضلاع الطويلة من الأفقي إلى العمودي.

$90^\circ$

1. ينتقل الضلع الطويل إلى الاتجاه العمودي والقصير إلى الأفقي.

$6>2$ قبل الدوران وبعده تتبادل الأبعاد.

A — يصبح الارتفاع أكبر من العرض.

مستطيل عرضه 6 وارتفاعه 2 يصبح عرضه 2 وارتفاعه 6.

الدوران لا يجعل ضلعين مختلفين متساويين.$mw$,$mw$A quarter turn changes long sides from horizontal to vertical.

$90^\circ$

1. The long side becomes vertical and the short side horizontal.

$6>2$ before rotation; the dimensions exchange places.

A — it becomes taller than wide.

A rectangle six wide and two tall becomes two wide and six tall.

Rotation does not make unequal sides equal.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل تدوير ورقة مستطيلة.","En":"Imagine turning a rectangular sheet."},{"Ar":"لاحظ موضع الضلع الطويل بعد الدوران.","En":"Notice the long side's new direction."}],"Solution":{"Idea":{"Ar":"ربع الدورة ينقل اتجاه الأضلاع الطويلة من الأفقي إلى العمودي.","En":"A quarter turn changes long sides from horizontal to vertical."},"FormulaLatex":"90^\\circ","Steps":[{"Ar":"ينتقل الضلع الطويل إلى الاتجاه العمودي والقصير إلى الأفقي.","En":"The long side becomes vertical and the short side horizontal."}],"Substitution":{"Ar":"$6>2$ قبل الدوران وبعده تتبادل الأبعاد.","En":"$6>2$ before rotation; the dimensions exchange places."},"Result":{"Ar":"A — يصبح الارتفاع أكبر من العرض.","En":"A — it becomes taller than wide."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مستطيل عرضه 6 وارتفاعه 2 يصبح عرضه 2 وارتفاعه 6.","En":"A rectangle six wide and two tall becomes two wide and six tall."},"CommonError":{"Ar":"الدوران لا يجعل ضلعين مختلفين متساويين.","En":"Rotation does not make unequal sides equal."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الدوران لا يجعل ضلعين مختلفين متساويين.","En":"Rotation does not make unequal sides equal."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تبادل الاتجاهان الأفقي والعمودي.","En":"Horizontal and vertical directions swap."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الدوران يحافظ على الأطوال.","En":"Rotation preserves lengths."},"Order":4}]}$mw$),
($mw$growth-v71-grade-2-cube-face-adjacency-exclude-opposite-1$mw$,$mw$cube-face-adjacency-exclude-opposite$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أوجه تشترك في حافة","En":"Faces sharing an edge"},"Question":{"Ar":"اختر وجهاً واحداً لمكعب. كم وجهاً آخر يشترك معه في حافة كاملة؟","En":"Choose one face of a cube. How many other faces share a complete edge with it?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد جوانب الوجه المربع.","En":"Misses one side of the square face."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الوجه المقابل الذي لا يلامسه.","En":"Includes the opposite non-touching face."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الوجه المختار نفسه أيضاً.","En":"Includes the chosen face itself."}}],"Hints":[{"Ar":"تخيل الوجه العلوي للمكعب.","En":"Imagine the cube's top face."},{"Ar":"عد الأوجه الجانبية ولا تحسب الوجه السفلي.","En":"Count the side faces, excluding the bottom."}],"Solution":{"Idea":{"Ar":"لكل حافة من حواف الوجه المربع وجه مجاور واحد، والوجه المقابل لا يشترك معه بحافة.","En":"Each edge of the square face has one neighboring face; the opposite face shares none."},"FormulaLatex":"6-1-1=4","Steps":[{"Ar":"من الأوجه الستة نستبعد الوجه المختار والوجه المقابل له.","En":"Exclude the selected face and its opposite from the six faces."},{"Ar":"$6-2=4$","En":"$6-2=4$"}],"Substitution":{"Ar":"$6-1-1=4$","En":"$6-1-1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأمام والخلف واليمين واليسار أربعة أوجه.","En":"Front, back, left and right are four faces."},"CommonError":{"Ar":"أهمل أحد جوانب الوجه المربع.","En":"Misses one side of the square face."}}}$mw$::jsonb,$mw$لكل حافة من حواف الوجه المربع وجه مجاور واحد، والوجه المقابل لا يشترك معه بحافة.

$6-1-1=4$

1. من الأوجه الستة نستبعد الوجه المختار والوجه المقابل له.

2. $6-2=4$

$6-1-1=4$

$4$

الأمام والخلف واليمين واليسار أربعة أوجه.

أهمل أحد جوانب الوجه المربع.$mw$,$mw$Each edge of the square face has one neighboring face; the opposite face shares none.

$6-1-1=4$

1. Exclude the selected face and its opposite from the six faces.

2. $6-2=4$

$6-1-1=4$

$4$

Front, back, left and right are four faces.

Misses one side of the square face.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل الوجه العلوي للمكعب.","En":"Imagine the cube's top face."},{"Ar":"عد الأوجه الجانبية ولا تحسب الوجه السفلي.","En":"Count the side faces, excluding the bottom."}],"Solution":{"Idea":{"Ar":"لكل حافة من حواف الوجه المربع وجه مجاور واحد، والوجه المقابل لا يشترك معه بحافة.","En":"Each edge of the square face has one neighboring face; the opposite face shares none."},"FormulaLatex":"6-1-1=4","Steps":[{"Ar":"من الأوجه الستة نستبعد الوجه المختار والوجه المقابل له.","En":"Exclude the selected face and its opposite from the six faces."},{"Ar":"$6-2=4$","En":"$6-2=4$"}],"Substitution":{"Ar":"$6-1-1=4$","En":"$6-1-1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأمام والخلف واليمين واليسار أربعة أوجه.","En":"Front, back, left and right are four faces."},"CommonError":{"Ar":"أهمل أحد جوانب الوجه المربع.","En":"Misses one side of the square face."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد جوانب الوجه المربع.","En":"Misses one side of the square face."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الوجه المقابل الذي لا يلامسه.","En":"Includes the opposite non-touching face."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب الوجه المختار نفسه أيضاً.","En":"Includes the chosen face itself."},"Order":4}]}$mw$),
($mw$growth-v71-grade-2-triangular-prism-edge-types-1$mw$,$mw$triangular-prism-edge-types$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حواف منشور ثلاثي","En":"Edges of a triangular prism"},"Question":{"Ar":"لمنشور ثلاثي قاعدتان مثلثتان، وتصل ثلاث حواف بين القاعدتين. كم حافة له بالمجموع؟","En":"A triangular prism has two triangular bases and three edges connecting them. How many edges does it have in total?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب حواف القاعدتين فقط.","En":"Counts only the base edges."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الأوجه بدلاً من الحواف.","En":"Counts faces instead of edges."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامله كمكعب ذي قاعدتين مربعتين.","En":"Treats it as a cube with square bases."}}],"Hints":[{"Ar":"كم حافة في كل قاعدة مثلثة؟","En":"How many edges does each triangular base have?"},{"Ar":"أضف الحواف التي تصل القاعدتين.","En":"Add the edges joining the bases."}],"Solution":{"Idea":{"Ar":"نعد حواف كل قاعدة ثم الحواف الواصلة بينهما.","En":"Count the edges of each base and the connecting edges."},"FormulaLatex":"3+3+3=9","Steps":[{"Ar":"للقاعدتين ست حواف.","En":"The two bases contribute six edges."},{"Ar":"$6+3=9$","En":"$6+3=9$"}],"Substitution":{"Ar":"$3+3+3=9$","En":"$3+3+3=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ست حواف حول القاعدتين وثلاث حواف جانبية.","En":"Six base edges and three connecting edges."},"CommonError":{"Ar":"حسب حواف القاعدتين فقط.","En":"Counts only the base edges."}}}$mw$::jsonb,$mw$نعد حواف كل قاعدة ثم الحواف الواصلة بينهما.

$3+3+3=9$

1. للقاعدتين ست حواف.

2. $6+3=9$

$3+3+3=9$

$9$

ست حواف حول القاعدتين وثلاث حواف جانبية.

حسب حواف القاعدتين فقط.$mw$,$mw$Count the edges of each base and the connecting edges.

$3+3+3=9$

1. The two bases contribute six edges.

2. $6+3=9$

$3+3+3=9$

$9$

Six base edges and three connecting edges.

Counts only the base edges.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم حافة في كل قاعدة مثلثة؟","En":"How many edges does each triangular base have?"},{"Ar":"أضف الحواف التي تصل القاعدتين.","En":"Add the edges joining the bases."}],"Solution":{"Idea":{"Ar":"نعد حواف كل قاعدة ثم الحواف الواصلة بينهما.","En":"Count the edges of each base and the connecting edges."},"FormulaLatex":"3+3+3=9","Steps":[{"Ar":"للقاعدتين ست حواف.","En":"The two bases contribute six edges."},{"Ar":"$6+3=9$","En":"$6+3=9$"}],"Substitution":{"Ar":"$3+3+3=9$","En":"$3+3+3=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ست حواف حول القاعدتين وثلاث حواف جانبية.","En":"Six base edges and three connecting edges."},"CommonError":{"Ar":"حسب حواف القاعدتين فقط.","En":"Counts only the base edges."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب حواف القاعدتين فقط.","En":"Counts only the base edges."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الأوجه بدلاً من الحواف.","En":"Counts faces instead of edges."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامله كمكعب ذي قاعدتين مربعتين.","En":"Treats it as a cube with square bases."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v71 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
