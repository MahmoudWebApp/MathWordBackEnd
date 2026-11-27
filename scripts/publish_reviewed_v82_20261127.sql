-- One-time owner-authorized v82 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v82-grade-1-half-circle-boundary-types-1$mw$,$mw$half-circle-boundary-types$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"حدود نصف الدائرة","En":"Boundary of a half circle"},"Question":{"Ar":"قصّ طفل دائرة ورقية إلى نصفين متساويين بخط مستقيم يمر بمركزها. في إحدى القطعتين، كم جزءاً مستقيماً وكم جزءاً منحنياً يشكّلان الحد الخارجي؟ اختر الزوج بالترتيب: مستقيم، منحني.","En":"A child cuts a paper circle into two equal halves along a straight line through its center. For one piece, how many straight and curved portions form the boundary? Choose the pair in the order: straight, curved."},"Options":[{"LatexCode":"(0,1)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خط القص يشكّل جزءاً مستقيماً أيضاً.","En":"The cut also forms a straight portion."}},{"LatexCode":"(1,0)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جزء من الحد الأصلي للدائرة ما زال منحنياً.","En":"Part of the original circle boundary remains curved."}},{"LatexCode":"(1,1)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(2,1)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هناك خط قص مستقيم واحد فقط.","En":"There is only one straight cut edge."}}],"Hints":[{"Ar":"تتبّع الحافة التي كانت جزءاً من الدائرة.","En":"Trace the edge that was part of the circle."},{"Ar":"ثم تتبّع الحافة التي صنعها القص.","En":"Then trace the edge made by the cut."}],"Solution":{"Idea":{"Ar":"نميّز الحافة المستقيمة الناتجة عن القص من الحافة المنحنية الأصلية.","En":"Distinguish the straight cut edge from the original curved edge."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"القص أعطى حافة مستقيمة واحدة.","En":"The cut creates one straight edge."},{"Ar":"يبقى نصف المحيط حافة منحنية واحدة.","En":"Half the original circumference remains one curved edge."}],"Substitution":{"Ar":"$(1,1)$","En":"$(1,1)$"},"Result":{"Ar":"$(1,1)$","En":"$(1,1)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا جمعنا النصفين تختفي حافتا القص داخل الدائرة وتعود حدودها منحنية.","En":"Rejoining the halves hides the cut edges inside the circle and restores its curved outline."},"CommonError":{"Ar":"اعتبار حدود نصف الدائرة كلها منحنية.","En":"Thinking a half circle has only a curved boundary."}}}$mw$::jsonb,$mw$نميّز الحافة المستقيمة الناتجة عن القص من الحافة المنحنية الأصلية.

$1+1=2$

1. القص أعطى حافة مستقيمة واحدة.

2. يبقى نصف المحيط حافة منحنية واحدة.

$(1,1)$

$(1,1)$

إذا جمعنا النصفين تختفي حافتا القص داخل الدائرة وتعود حدودها منحنية.

اعتبار حدود نصف الدائرة كلها منحنية.$mw$,$mw$Distinguish the straight cut edge from the original curved edge.

$1+1=2$

1. The cut creates one straight edge.

2. Half the original circumference remains one curved edge.

$(1,1)$

$(1,1)$

Rejoining the halves hides the cut edges inside the circle and restores its curved outline.

Thinking a half circle has only a curved boundary.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"تتبّع الحافة التي كانت جزءاً من الدائرة.","En":"Trace the edge that was part of the circle."},{"Ar":"ثم تتبّع الحافة التي صنعها القص.","En":"Then trace the edge made by the cut."}],"Solution":{"Idea":{"Ar":"نميّز الحافة المستقيمة الناتجة عن القص من الحافة المنحنية الأصلية.","En":"Distinguish the straight cut edge from the original curved edge."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"القص أعطى حافة مستقيمة واحدة.","En":"The cut creates one straight edge."},{"Ar":"يبقى نصف المحيط حافة منحنية واحدة.","En":"Half the original circumference remains one curved edge."}],"Substitution":{"Ar":"$(1,1)$","En":"$(1,1)$"},"Result":{"Ar":"$(1,1)$","En":"$(1,1)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا جمعنا النصفين تختفي حافتا القص داخل الدائرة وتعود حدودها منحنية.","En":"Rejoining the halves hides the cut edges inside the circle and restores its curved outline."},"CommonError":{"Ar":"اعتبار حدود نصف الدائرة كلها منحنية.","En":"Thinking a half circle has only a curved boundary."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خط القص يشكّل جزءاً مستقيماً أيضاً.","En":"The cut also forms a straight portion."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جزء من الحد الأصلي للدائرة ما زال منحنياً.","En":"Part of the original circle boundary remains curved."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هناك خط قص مستقيم واحد فقط.","En":"There is only one straight cut edge."},"Order":4}]}$mw$),
($mw$growth-v82-grade-1-three-tiles-rectangle-arrangement-1$mw$,$mw$three-tiles-rectangle-arrangement$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ترتيب ثلاث قطع","En":"Arranging three tiles"},"Question":{"Ar":"لدينا ثلاثة مربعات صغيرة متطابقة. نريد تركيب مستطيل دون تداخل أو فراغ. أي ترتيب يحقق ذلك؟ A: مربعان متجاوران في الأعلى وواحد تحت الأيسر؛ B: ثلاثة مربعات في صف مستقيم متجاور؛ C: ثلاثة مربعات لا تتلامس؛ D: ثلاثة مربعات تتلامس عند الزوايا فقط.","En":"Three identical small square tiles must form a rectangle with no overlap or gap. Which arrangement works? A: two adjacent tiles on top and one below the left tile; B: three in one straight adjacent row; C: three separate tiles; D: three tiles touching only at corners."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الصفان غير مكتملين ولا يعطيان مستطيلاً.","En":"The two unequal rows do not form a rectangle."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القطع المنفصلة لا تشكل مستطيلاً واحداً.","En":"Separate tiles do not make one rectangle."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"التقاء الزوايا فقط لا يملأ مستطيلاً.","En":"Corner-only contact does not fill a rectangle."}}],"Hints":[{"Ar":"يجب أن تكون الحدود الخارجية مستطيلة.","En":"The outside boundary must be rectangular."},{"Ar":"تخيّل وضع القطع جنباً إلى جنب على خط واحد.","En":"Imagine the tiles side by side in one line."}],"Solution":{"Idea":{"Ar":"نبحث عن ترتيب يملأ صفاً كاملاً متصلاً.","En":"Find an arrangement that fills one continuous row."},"FormulaLatex":"3=1+1+1","Steps":[{"Ar":"عند وضع القطع الثلاث في صف متجاور تتطابق حوافها.","En":"A row of three adjacent tiles has matching shared edges."},{"Ar":"تصبح الحدود الخارجية مستطيلاً طويلاً.","En":"The outer outline becomes a long rectangle."}],"Substitution":{"Ar":"$3$","En":"$3$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يتكون الشكل من صف واحد وثلاثة أعمدة متساوية دون فراغ.","En":"The shape is one row of three equal columns with no gaps."},"CommonError":{"Ar":"اعتبار أي اتصال بين القطع كافياً لتكوين مستطيل.","En":"Thinking any contact between tiles makes a rectangle."}}}$mw$::jsonb,$mw$نبحث عن ترتيب يملأ صفاً كاملاً متصلاً.

$3=1+1+1$

1. عند وضع القطع الثلاث في صف متجاور تتطابق حوافها.

2. تصبح الحدود الخارجية مستطيلاً طويلاً.

$3$

$B$

يتكون الشكل من صف واحد وثلاثة أعمدة متساوية دون فراغ.

اعتبار أي اتصال بين القطع كافياً لتكوين مستطيل.$mw$,$mw$Find an arrangement that fills one continuous row.

$3=1+1+1$

1. A row of three adjacent tiles has matching shared edges.

2. The outer outline becomes a long rectangle.

$3$

$B$

The shape is one row of three equal columns with no gaps.

Thinking any contact between tiles makes a rectangle.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"يجب أن تكون الحدود الخارجية مستطيلة.","En":"The outside boundary must be rectangular."},{"Ar":"تخيّل وضع القطع جنباً إلى جنب على خط واحد.","En":"Imagine the tiles side by side in one line."}],"Solution":{"Idea":{"Ar":"نبحث عن ترتيب يملأ صفاً كاملاً متصلاً.","En":"Find an arrangement that fills one continuous row."},"FormulaLatex":"3=1+1+1","Steps":[{"Ar":"عند وضع القطع الثلاث في صف متجاور تتطابق حوافها.","En":"A row of three adjacent tiles has matching shared edges."},{"Ar":"تصبح الحدود الخارجية مستطيلاً طويلاً.","En":"The outer outline becomes a long rectangle."}],"Substitution":{"Ar":"$3$","En":"$3$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يتكون الشكل من صف واحد وثلاثة أعمدة متساوية دون فراغ.","En":"The shape is one row of three equal columns with no gaps."},"CommonError":{"Ar":"اعتبار أي اتصال بين القطع كافياً لتكوين مستطيل.","En":"Thinking any contact between tiles makes a rectangle."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الصفان غير مكتملين ولا يعطيان مستطيلاً.","En":"The two unequal rows do not form a rectangle."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"القطع المنفصلة لا تشكل مستطيلاً واحداً.","En":"Separate tiles do not make one rectangle."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"التقاء الزوايا فقط لا يملأ مستطيلاً.","En":"Corner-only contact does not fill a rectangle."},"Order":4}]}$mw$),
($mw$growth-v82-grade-1-diagonal-cut-square-piece-attributes-1$mw$,$mw$diagonal-cut-square-piece-attributes$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قطعتا مربع","En":"Two pieces of a square"},"Question":{"Ar":"قصّت طفلة مربعاً ورقياً بخط مستقيم يصل بين زاويتين متقابلتين. أي وصف ينطبق على كل قطعة بعد القص؟ A: لها ضلعان؛ B: لها أربعة أضلاع؛ C: لها ضلع منحني؛ D: لها ثلاثة أضلاع مستقيمة.","En":"A child cuts a paper square along a straight line joining two opposite corners. Which description fits each resulting piece? A: two sides; B: four sides; C: a curved side; D: three straight sides."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل حافة القص الجديدة.","En":"This omits the new cut edge."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القطعة لا تحتفظ بالأضلاع الأربعة للمربع.","En":"A piece does not retain all four square sides."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القص مستقيم ولا ينتج حافة منحنية.","En":"The straight cut makes no curved edge."}},{"LatexCode":"D","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تتبّع ضلعين متجاورين من المربع.","En":"Trace two adjacent sides of the square."},{"Ar":"أضف الحافة الجديدة التي صنعها القص.","En":"Include the new edge made by cutting."}],"Solution":{"Idea":{"Ar":"كل قطعة تتكوّن حدودها من ضلعين أصليين وحافة القص.","En":"Each piece has two original sides plus the cut edge."},"FormulaLatex":"2+1=3","Steps":[{"Ar":"تحتفظ كل قطعة بضلعين من المربع.","En":"Each piece keeps two sides of the square."},{"Ar":"تضيف حافة القص ضلعاً ثالثاً مستقيماً.","En":"The cut adds a third straight side."}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$D$","En":"$D$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند تتبّع حدود القطعة نمر بثلاث زوايا وثلاثة أضلاع.","En":"Tracing a piece reveals three corners and three sides."},"CommonError":{"Ar":"عد الأضلاع قبل القص بدلاً من أضلاع كل قطعة.","En":"Counting the original square sides instead of the piece's sides."}}}$mw$::jsonb,$mw$كل قطعة تتكوّن حدودها من ضلعين أصليين وحافة القص.

$2+1=3$

1. تحتفظ كل قطعة بضلعين من المربع.

2. تضيف حافة القص ضلعاً ثالثاً مستقيماً.

$2+1=3$

$D$

عند تتبّع حدود القطعة نمر بثلاث زوايا وثلاثة أضلاع.

عد الأضلاع قبل القص بدلاً من أضلاع كل قطعة.$mw$,$mw$Each piece has two original sides plus the cut edge.

$2+1=3$

1. Each piece keeps two sides of the square.

2. The cut adds a third straight side.

$2+1=3$

$D$

Tracing a piece reveals three corners and three sides.

Counting the original square sides instead of the piece's sides.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"تتبّع ضلعين متجاورين من المربع.","En":"Trace two adjacent sides of the square."},{"Ar":"أضف الحافة الجديدة التي صنعها القص.","En":"Include the new edge made by cutting."}],"Solution":{"Idea":{"Ar":"كل قطعة تتكوّن حدودها من ضلعين أصليين وحافة القص.","En":"Each piece has two original sides plus the cut edge."},"FormulaLatex":"2+1=3","Steps":[{"Ar":"تحتفظ كل قطعة بضلعين من المربع.","En":"Each piece keeps two sides of the square."},{"Ar":"تضيف حافة القص ضلعاً ثالثاً مستقيماً.","En":"The cut adds a third straight side."}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$D$","En":"$D$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند تتبّع حدود القطعة نمر بثلاث زوايا وثلاثة أضلاع.","En":"Tracing a piece reveals three corners and three sides."},"CommonError":{"Ar":"عد الأضلاع قبل القص بدلاً من أضلاع كل قطعة.","En":"Counting the original square sides instead of the piece's sides."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل حافة القص الجديدة.","En":"This omits the new cut edge."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"القطعة لا تحتفظ بالأضلاع الأربعة للمربع.","En":"A piece does not retain all four square sides."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"القص مستقيم ولا ينتج حافة منحنية.","En":"The straight cut makes no curved edge."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v82-grade-1-four-equal-sticks-square-corners-1$mw$,$mw$four-equal-sticks-square-corners$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"زوايا المربع","En":"Square corners"},"Question":{"Ar":"رتّب طفل أربعة عيدان متساوية الطول في شكل مغلق، لكن إحدى الزوايا ليست كزاوية ورقة مستطيلة. ماذا يحتاج ليصبح الشكل مربعاً؟ A: تغيير طول عود؛ B: فتح الشكل؛ C: ضبط الزوايا الأربع لتكون كزوايا الورقة؛ D: إضافة عود خامس.","En":"A child joins four equal-length sticks into a closed shape, but one corner does not match a corner of a rectangular sheet of paper. What must change to make a square? A: change a stick length; B: open the shape; C: make all four corners match the paper's corners; D: add a fifth stick."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أطوال العيدان متساوية بالفعل.","En":"The stick lengths are already equal."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المربع شكل مغلق.","En":"A square is closed."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"للمربع أربعة أضلاع فقط.","En":"A square has only four sides."}}],"Hints":[{"Ar":"أطوال الأضلاع صحيحة بالفعل.","En":"The side lengths are already correct."},{"Ar":"قارن زوايا الشكل بزوايا ورقة مستطيلة.","En":"Compare the corners with those of a rectangular sheet."}],"Solution":{"Idea":{"Ar":"المربع يحتاج أربعة أضلاع متساوية وأربع زوايا قائمة.","En":"A square needs four equal sides and four right-angle corners."},"FormulaLatex":"4","Steps":[{"Ar":"الأضلاع الأربعة متساوية بالفعل.","En":"The four sides are already equal."},{"Ar":"نعدّل الزوايا لتطابق زوايا الورقة المستطيلة.","En":"Adjust the corners to match the rectangular sheet."}],"Substitution":{"Ar":"$4$","En":"$4$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد ضبط الزوايا يكون الشكل مغلقاً وله أربعة أضلاع متساوية وأربع زوايا قائمة.","En":"After adjustment, the closed shape has four equal sides and four right angles."},"CommonError":{"Ar":"الاعتقاد أن تساوي الأضلاع وحده يكفي دائماً.","En":"Thinking equal sides alone are always enough."}}}$mw$::jsonb,$mw$المربع يحتاج أربعة أضلاع متساوية وأربع زوايا قائمة.

$4$

1. الأضلاع الأربعة متساوية بالفعل.

2. نعدّل الزوايا لتطابق زوايا الورقة المستطيلة.

$4$

$C$

بعد ضبط الزوايا يكون الشكل مغلقاً وله أربعة أضلاع متساوية وأربع زوايا قائمة.

الاعتقاد أن تساوي الأضلاع وحده يكفي دائماً.$mw$,$mw$A square needs four equal sides and four right-angle corners.

$4$

1. The four sides are already equal.

2. Adjust the corners to match the rectangular sheet.

$4$

$C$

After adjustment, the closed shape has four equal sides and four right angles.

Thinking equal sides alone are always enough.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"أطوال الأضلاع صحيحة بالفعل.","En":"The side lengths are already correct."},{"Ar":"قارن زوايا الشكل بزوايا ورقة مستطيلة.","En":"Compare the corners with those of a rectangular sheet."}],"Solution":{"Idea":{"Ar":"المربع يحتاج أربعة أضلاع متساوية وأربع زوايا قائمة.","En":"A square needs four equal sides and four right-angle corners."},"FormulaLatex":"4","Steps":[{"Ar":"الأضلاع الأربعة متساوية بالفعل.","En":"The four sides are already equal."},{"Ar":"نعدّل الزوايا لتطابق زوايا الورقة المستطيلة.","En":"Adjust the corners to match the rectangular sheet."}],"Substitution":{"Ar":"$4$","En":"$4$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد ضبط الزوايا يكون الشكل مغلقاً وله أربعة أضلاع متساوية وأربع زوايا قائمة.","En":"After adjustment, the closed shape has four equal sides and four right angles."},"CommonError":{"Ar":"الاعتقاد أن تساوي الأضلاع وحده يكفي دائماً.","En":"Thinking equal sides alone are always enough."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أطوال العيدان متساوية بالفعل.","En":"The stick lengths are already equal."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المربع شكل مغلق.","En":"A square is closed."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"للمربع أربعة أضلاع فقط.","En":"A square has only four sides."},"Order":4}]}$mw$),
($mw$growth-v82-grade-2-pictograph-match-missing-label-1$mw$,$mw$pictograph-match-missing-label$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"العنوان الناقص","En":"Missing category label"},"Question":{"Ar":"كل ● يمثل صوتاً واحداً. في سجل الأصوات: الرسم 2، القراءة 5، اللعب 3. في الرسم المصور توجد ثلاثة صفوف: الرسم ●●؛ صف بلا اسم ●●●؛ القراءة ●●●●●. ما اسم الصف الذي بلا اسم؟ A: الرسم؛ B: القراءة؛ C: اللعب؛ D: لا يمكن معرفة الاسم.","En":"Each ● represents one vote. The record says drawing 2, reading 5, playing 3. The pictograph shows drawing ●●; an unlabeled row ●●●; reading ●●●●●. What label is missing? A: drawing; B: reading; C: playing; D: cannot tell."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"للرسم صف مسمّى فيه رمزان.","En":"Drawing already has a labeled row with two symbols."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"للقراءة صف فيه خمسة رموز.","En":"Reading has a row with five symbols."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"السجل يعطي فئة واحدة لها ثلاثة أصوات.","En":"The record identifies the one category with three votes."}}],"Hints":[{"Ar":"عد رموز الصف الذي بلا اسم.","En":"Count symbols in the unlabeled row."},{"Ar":"ابحث في السجل عن الفئة التي لها ذلك العدد.","En":"Find the category with that count in the record."}],"Solution":{"Idea":{"Ar":"نربط عدد الرموز بالفئة المطابقة في السجل.","En":"Match the symbol count to its category in the record."},"FormulaLatex":"3","Steps":[{"Ar":"الصف المجهول فيه ثلاثة رموز.","En":"The unknown row has three symbols."},{"Ar":"سجل اللعب هو الذي يحتوي ثلاثة أصوات.","En":"Playing has three votes in the record."}],"Substitution":{"Ar":"$3$","En":"$3$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تصبح أسماء الفئات الثلاث متوافقة مع الأعداد 2 و3 و5.","En":"All three labels then match counts of 2, 3 and 5."},"CommonError":{"Ar":"اختيار اسم صف آخر دون مطابقة العدد.","En":"Choosing another label without matching the count."}}}$mw$::jsonb,$mw$نربط عدد الرموز بالفئة المطابقة في السجل.

$3$

1. الصف المجهول فيه ثلاثة رموز.

2. سجل اللعب هو الذي يحتوي ثلاثة أصوات.

$3$

$C$

تصبح أسماء الفئات الثلاث متوافقة مع الأعداد 2 و3 و5.

اختيار اسم صف آخر دون مطابقة العدد.$mw$,$mw$Match the symbol count to its category in the record.

$3$

1. The unknown row has three symbols.

2. Playing has three votes in the record.

$3$

$C$

All three labels then match counts of 2, 3 and 5.

Choosing another label without matching the count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد رموز الصف الذي بلا اسم.","En":"Count symbols in the unlabeled row."},{"Ar":"ابحث في السجل عن الفئة التي لها ذلك العدد.","En":"Find the category with that count in the record."}],"Solution":{"Idea":{"Ar":"نربط عدد الرموز بالفئة المطابقة في السجل.","En":"Match the symbol count to its category in the record."},"FormulaLatex":"3","Steps":[{"Ar":"الصف المجهول فيه ثلاثة رموز.","En":"The unknown row has three symbols."},{"Ar":"سجل اللعب هو الذي يحتوي ثلاثة أصوات.","En":"Playing has three votes in the record."}],"Substitution":{"Ar":"$3$","En":"$3$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تصبح أسماء الفئات الثلاث متوافقة مع الأعداد 2 و3 و5.","En":"All three labels then match counts of 2, 3 and 5."},"CommonError":{"Ar":"اختيار اسم صف آخر دون مطابقة العدد.","En":"Choosing another label without matching the count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"للرسم صف مسمّى فيه رمزان.","En":"Drawing already has a labeled row with two symbols."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"للقراءة صف فيه خمسة رموز.","En":"Reading has a row with five symbols."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"السجل يعطي فئة واحدة لها ثلاثة أصوات.","En":"The record identifies the one category with three votes."},"Order":4}]}$mw$),
($mw$growth-v82-grade-2-pictograph-find-inconsistent-row-1$mw$,$mw$pictograph-find-inconsistent-row$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كشف خطأ الرسم","En":"Finding a chart error"},"Question":{"Ar":"كل ● يمثل كتاباً واحداً. سجل المكتبة: القصص 4، العلوم 3، الفن 2. الرسم المصور: القصص ●●●●، العلوم ●●، الفن ●●. أي صف يختلف عن السجل؟ A: القصص؛ B: العلوم؛ C: الفن؛ D: لا يوجد اختلاف.","En":"Each ● represents one book. The library record is stories 4, science 3, art 2. The pictograph shows stories ●●●●, science ●●, art ●●. Which row differs from the record? A: stories; B: science; C: art; D: none."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القصص لها أربعة رموز وأربعة كتب في السجل.","En":"Stories has four symbols and four books in the record."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفن له رمزان وكتابان في السجل.","En":"Art has two symbols and two books in the record."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هناك صف فيه رمزان بينما السجل يعطي ثلاثة كتب.","En":"One row has two symbols but the record gives three books."}}],"Hints":[{"Ar":"قارن كل صف بالعدد المسجل له.","En":"Compare each row with its recorded count."},{"Ar":"ابحث عن الصف الذي لا يتطابق عدده.","En":"Find the row whose count does not match."}],"Solution":{"Idea":{"Ar":"نتحقق من كل فئة على حدة لا من مظهر الرسم فقط.","En":"Check each category separately instead of judging the chart by appearance."},"FormulaLatex":"3-2=1","Steps":[{"Ar":"صفا القصص والفن متطابقان مع السجل.","En":"Stories and art match the record."},{"Ar":"العلوم لها رمزان فقط بدلاً من ثلاثة.","En":"Science has two symbols instead of three."}],"Substitution":{"Ar":"$3-2=1$","En":"$3-2=1$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إضافة رمز للعلوم تجعل الرسم يطابق السجل في الصفوف الثلاثة.","En":"Adding one science symbol makes all three rows match."},"CommonError":{"Ar":"افتراض أن صفين متساويين في الرسم يجب أن يتساويا في السجل.","En":"Assuming equal-looking rows must have equal recorded counts."}}}$mw$::jsonb,$mw$نتحقق من كل فئة على حدة لا من مظهر الرسم فقط.

$3-2=1$

1. صفا القصص والفن متطابقان مع السجل.

2. العلوم لها رمزان فقط بدلاً من ثلاثة.

$3-2=1$

$B$

إضافة رمز للعلوم تجعل الرسم يطابق السجل في الصفوف الثلاثة.

افتراض أن صفين متساويين في الرسم يجب أن يتساويا في السجل.$mw$,$mw$Check each category separately instead of judging the chart by appearance.

$3-2=1$

1. Stories and art match the record.

2. Science has two symbols instead of three.

$3-2=1$

$B$

Adding one science symbol makes all three rows match.

Assuming equal-looking rows must have equal recorded counts.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قارن كل صف بالعدد المسجل له.","En":"Compare each row with its recorded count."},{"Ar":"ابحث عن الصف الذي لا يتطابق عدده.","En":"Find the row whose count does not match."}],"Solution":{"Idea":{"Ar":"نتحقق من كل فئة على حدة لا من مظهر الرسم فقط.","En":"Check each category separately instead of judging the chart by appearance."},"FormulaLatex":"3-2=1","Steps":[{"Ar":"صفا القصص والفن متطابقان مع السجل.","En":"Stories and art match the record."},{"Ar":"العلوم لها رمزان فقط بدلاً من ثلاثة.","En":"Science has two symbols instead of three."}],"Substitution":{"Ar":"$3-2=1$","En":"$3-2=1$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إضافة رمز للعلوم تجعل الرسم يطابق السجل في الصفوف الثلاثة.","En":"Adding one science symbol makes all three rows match."},"CommonError":{"Ar":"افتراض أن صفين متساويين في الرسم يجب أن يتساويا في السجل.","En":"Assuming equal-looking rows must have equal recorded counts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"القصص لها أربعة رموز وأربعة كتب في السجل.","En":"Stories has four symbols and four books in the record."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الفن له رمزان وكتابان في السجل.","En":"Art has two symbols and two books in the record."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هناك صف فيه رمزان بينما السجل يعطي ثلاثة كتب.","En":"One row has two symbols but the record gives three books."},"Order":4}]}$mw$),
($mw$growth-v82-grade-2-pictograph-same-total-different-distribution-1$mw$,$mw$pictograph-same-total-different-distribution$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المجموع والتوزيع","En":"Total and distribution"},"Question":{"Ar":"كل ● يمثل طفلاً اختار نشاطاً واحداً. المجموعة الأولى: رسم ●●●●، قراءة ●●. المجموعة الثانية: رسم ●●●، قراءة ●●●. أي عبارة صحيحة؟ A: المجموعان متساويان وتوزيع الاختيارات مختلف؛ B: المجموع الأول أكبر؛ C: المجموع الثاني أكبر؛ D: عدد كل نشاط متساوٍ بين المجموعتين.","En":"Each ● represents a child choosing one activity. Group 1: drawing ●●●●, reading ●●. Group 2: drawing ●●●, reading ●●●. Which statement is true? A: equal totals but different distributions; B: group 1 has more children; C: group 2 has more children; D: each activity has equal counts across groups."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع المجموعة الأولى ستة وكذلك الثانية.","En":"Both groups total six."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموعة الثانية لا تزيد على الأولى.","En":"The second group does not exceed the first."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الرسم أربعة في الأولى وثلاثة في الثانية.","En":"Drawing has four in group 1 and three in group 2."}}],"Hints":[{"Ar":"اجمع رموز كل مجموعة على حدة.","En":"Add the symbols in each group separately."},{"Ar":"قارن عدد الرسم وعدد القراءة أيضاً.","En":"Also compare the drawing and reading counts."}],"Solution":{"Idea":{"Ar":"قد يتساوى مجموع مجموعتين مع اختلاف أعداد الفئات داخلهما.","En":"Two groups can have equal totals but different category counts."},"FormulaLatex":"4+2=3+3","Steps":[{"Ar":"كل مجموعة فيها ستة أطفال.","En":"Each group has six children."},{"Ar":"أعداد الرسم والقراءة مختلفة بين المجموعتين.","En":"The drawing and reading counts differ across groups."}],"Substitution":{"Ar":"$6=6$","En":"$6=6$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يمكن نقل اختيار واحد من الرسم إلى القراءة في الأولى فتصبح مثل الثانية دون تغيير المجموع.","En":"Moving one drawing choice to reading in group 1 would match group 2 without changing the total."},"CommonError":{"Ar":"الخلط بين تساوي المجموع وتساوي كل فئة.","En":"Confusing equal totals with equal category counts."}}}$mw$::jsonb,$mw$قد يتساوى مجموع مجموعتين مع اختلاف أعداد الفئات داخلهما.

$4+2=3+3$

1. كل مجموعة فيها ستة أطفال.

2. أعداد الرسم والقراءة مختلفة بين المجموعتين.

$6=6$

$A$

يمكن نقل اختيار واحد من الرسم إلى القراءة في الأولى فتصبح مثل الثانية دون تغيير المجموع.

الخلط بين تساوي المجموع وتساوي كل فئة.$mw$,$mw$Two groups can have equal totals but different category counts.

$4+2=3+3$

1. Each group has six children.

2. The drawing and reading counts differ across groups.

$6=6$

$A$

Moving one drawing choice to reading in group 1 would match group 2 without changing the total.

Confusing equal totals with equal category counts.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع رموز كل مجموعة على حدة.","En":"Add the symbols in each group separately."},{"Ar":"قارن عدد الرسم وعدد القراءة أيضاً.","En":"Also compare the drawing and reading counts."}],"Solution":{"Idea":{"Ar":"قد يتساوى مجموع مجموعتين مع اختلاف أعداد الفئات داخلهما.","En":"Two groups can have equal totals but different category counts."},"FormulaLatex":"4+2=3+3","Steps":[{"Ar":"كل مجموعة فيها ستة أطفال.","En":"Each group has six children."},{"Ar":"أعداد الرسم والقراءة مختلفة بين المجموعتين.","En":"The drawing and reading counts differ across groups."}],"Substitution":{"Ar":"$6=6$","En":"$6=6$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يمكن نقل اختيار واحد من الرسم إلى القراءة في الأولى فتصبح مثل الثانية دون تغيير المجموع.","En":"Moving one drawing choice to reading in group 1 would match group 2 without changing the total."},"CommonError":{"Ar":"الخلط بين تساوي المجموع وتساوي كل فئة.","En":"Confusing equal totals with equal category counts."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مجموع المجموعة الأولى ستة وكذلك الثانية.","En":"Both groups total six."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"المجموعة الثانية لا تزيد على الأولى.","En":"The second group does not exceed the first."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"اختار الرسم أربعة في الأولى وثلاثة في الثانية.","En":"Drawing has four in group 1 and three in group 2."},"Order":4}]}$mw$),
($mw$growth-v82-grade-2-pictograph-count-categories-at-least-threshold-1$mw$,$mw$pictograph-count-categories-at-least-threshold$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار الفئات المستوفية للشرط","En":"Categories meeting a condition"},"Question":{"Ar":"كل ● يمثل طالباً واحداً ينتمي إلى فئة واحدة فقط. A: ●●●●؛ B: ●●؛ C: ●●●؛ D: ●. نريد اختيار الفئات التي فيها ثلاثة طلاب على الأقل. كم طالباً في الفئات المختارة مجتمعة؟","En":"Each ● represents one pupil belonging to exactly one category. A: ●●●●; B: ●●; C: ●●●; D: ●. Select the categories with at least three pupils. How many pupils are in the selected categories altogether?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الفئات المختارة وليس عدد طلابها.","En":"This is the number of selected categories, not pupils."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب الفئة A وحدها ويستبعد الفئة C التي تحقق الشرط.","En":"This counts only A and excludes C, which also meets the condition."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع جميع الفئات بما فيها غير المستوفية للشرط.","En":"This totals every category, including those below the threshold."}}],"Hints":[{"Ar":"ثلاثة على الأقل تعني ثلاثة أو أكثر.","En":"At least three means three or more."},{"Ar":"حدّد الصفوف المناسبة ثم اجمع رموزها.","En":"Choose the matching rows and add their symbols."}],"Solution":{"Idea":{"Ar":"نختار الفئات وفق الشرط أولاً ثم نجمع أعدادها.","En":"First select categories satisfying the condition, then sum their counts."},"FormulaLatex":"4+3=7","Steps":[{"Ar":"الفئتان A وC تحققان الشرط.","En":"Categories A and C meet the condition."},{"Ar":"نجمع أربعة طلاب وثلاثة طلاب.","En":"Add four pupils and three pupils."}],"Substitution":{"Ar":"$4+3=7$","En":"$4+3=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عدد الفئات المختارة اثنتان لكن مجموع طلابهما سبعة.","En":"There are two selected categories, containing seven pupils in total."},"CommonError":{"Ar":"عد الفئات فقط أو استبعاد العدد المساوي للحد.","En":"Counting only categories or excluding counts equal to the threshold."}}}$mw$::jsonb,$mw$نختار الفئات وفق الشرط أولاً ثم نجمع أعدادها.

$4+3=7$

1. الفئتان A وC تحققان الشرط.

2. نجمع أربعة طلاب وثلاثة طلاب.

$4+3=7$

$7$

عدد الفئات المختارة اثنتان لكن مجموع طلابهما سبعة.

عد الفئات فقط أو استبعاد العدد المساوي للحد.$mw$,$mw$First select categories satisfying the condition, then sum their counts.

$4+3=7$

1. Categories A and C meet the condition.

2. Add four pupils and three pupils.

$4+3=7$

$7$

There are two selected categories, containing seven pupils in total.

Counting only categories or excluding counts equal to the threshold.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ثلاثة على الأقل تعني ثلاثة أو أكثر.","En":"At least three means three or more."},{"Ar":"حدّد الصفوف المناسبة ثم اجمع رموزها.","En":"Choose the matching rows and add their symbols."}],"Solution":{"Idea":{"Ar":"نختار الفئات وفق الشرط أولاً ثم نجمع أعدادها.","En":"First select categories satisfying the condition, then sum their counts."},"FormulaLatex":"4+3=7","Steps":[{"Ar":"الفئتان A وC تحققان الشرط.","En":"Categories A and C meet the condition."},{"Ar":"نجمع أربعة طلاب وثلاثة طلاب.","En":"Add four pupils and three pupils."}],"Substitution":{"Ar":"$4+3=7$","En":"$4+3=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عدد الفئات المختارة اثنتان لكن مجموع طلابهما سبعة.","En":"There are two selected categories, containing seven pupils in total."},"CommonError":{"Ar":"عد الفئات فقط أو استبعاد العدد المساوي للحد.","En":"Counting only categories or excluding counts equal to the threshold."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الفئات المختارة وليس عدد طلابها.","En":"This is the number of selected categories, not pupils."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب الفئة A وحدها ويستبعد الفئة C التي تحقق الشرط.","En":"This counts only A and excludes C, which also meets the condition."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع جميع الفئات بما فيها غير المستوفية للشرط.","En":"This totals every category, including those below the threshold."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v82 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
