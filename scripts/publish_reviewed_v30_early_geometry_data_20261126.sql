-- One-time early geometry/data breadth: distinct new skills, no legacy category changes or entitlement changes. CCSS 1.G.A.1-2,1.MD.C.4,2.G.A.1-3,2.MD.D.10; Cambridge primary strands.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v30-grade-1-shape-closed-three-straight-sides-1$mw$,$mw$shape-closed-three-straight-sides$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"خصائص المثلث","En":"Attributes of a triangle"},"Question":{"Ar":"أمامك أربعة أشكال: A له ثلاثة أضلاع مستقيمة ويُغلق تماماً؛ B له ثلاثة أضلاع لكن فيه فتحة؛ C له أربعة أضلاع مستقيمة ومغلق؛ D مغلق وله حافة منحنية فقط. أي شكل مثلث؟","En":"Four shapes are described: A has three straight sides and is closed; B has three sides but a gap; C has four straight sides and is closed; D is closed with only a curved edge. Which is a triangle?"},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المثلث مغلق، لذلك لا يصلح الشكل ذو الفتحة.","En":"A triangle must be closed, so the shape with a gap does not qualify."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"له أربعة أضلاع لا ثلاثة.","En":"It has four sides, not three."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا توجد له ثلاثة أضلاع مستقيمة.","En":"It does not have three straight sides."}}],"Hints":[{"Ar":"عد الأضلاع المستقيمة.","En":"Count the straight sides."},{"Ar":"تحقق أيضاً من أن الشكل مغلق.","En":"Also check that the shape is closed."}],"Solution":{"Idea":{"Ar":"المثلث شكل مغلق له ثلاثة أضلاع مستقيمة؛ لا يغيّر اللون أو الحجم أو الاتجاه اسمه.","En":"A triangle is closed with three straight sides; colour, size and orientation do not change its name."},"FormulaLatex":"3","Steps":[{"Ar":"A وB لهما ثلاثة أضلاع، لكن B فيه فتحة.","En":"A and B have three sides, but B has a gap."},{"Ar":"C له أربعة أضلاع وD حافته منحنية.","En":"C has four sides and D has a curved edge."},{"Ar":"إذن A وحده يحقق الخاصيتين.","En":"Only A meets both attributes."}],"Substitution":{"Ar":"$A$","En":"$A$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"شكل","En":"Shape"},"Verification":{"Ar":"عند تتبع أضلاع A الثلاثة نعود إلى نقطة البداية دون فتحة.","En":"Tracing A's three sides returns to the starting point without a gap."},"CommonError":{"Ar":"لا يكفي عد الأضلاع وحده إذا كان الشكل مفتوحاً.","En":"Counting sides alone is not enough if the shape is open."}}}$mw$::jsonb,$mw$المثلث شكل مغلق له ثلاثة أضلاع مستقيمة؛ لا يغيّر اللون أو الحجم أو الاتجاه اسمه.

$3$

1. A وB لهما ثلاثة أضلاع، لكن B فيه فتحة.

2. C له أربعة أضلاع وD حافته منحنية.

3. إذن A وحده يحقق الخاصيتين.

$A$

$A$ شكل

عند تتبع أضلاع A الثلاثة نعود إلى نقطة البداية دون فتحة.

لا يكفي عد الأضلاع وحده إذا كان الشكل مفتوحاً.$mw$,$mw$A triangle is closed with three straight sides; colour, size and orientation do not change its name.

$3$

1. A and B have three sides, but B has a gap.

2. C has four sides and D has a curved edge.

3. Only A meets both attributes.

$A$

$A$ Shape

Tracing A's three sides returns to the starting point without a gap.

Counting sides alone is not enough if the shape is open.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد الأضلاع المستقيمة.","En":"Count the straight sides."},{"Ar":"تحقق أيضاً من أن الشكل مغلق.","En":"Also check that the shape is closed."}],"Solution":{"Idea":{"Ar":"المثلث شكل مغلق له ثلاثة أضلاع مستقيمة؛ لا يغيّر اللون أو الحجم أو الاتجاه اسمه.","En":"A triangle is closed with three straight sides; colour, size and orientation do not change its name."},"FormulaLatex":"3","Steps":[{"Ar":"A وB لهما ثلاثة أضلاع، لكن B فيه فتحة.","En":"A and B have three sides, but B has a gap."},{"Ar":"C له أربعة أضلاع وD حافته منحنية.","En":"C has four sides and D has a curved edge."},{"Ar":"إذن A وحده يحقق الخاصيتين.","En":"Only A meets both attributes."}],"Substitution":{"Ar":"$A$","En":"$A$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"شكل","En":"Shape"},"Verification":{"Ar":"عند تتبع أضلاع A الثلاثة نعود إلى نقطة البداية دون فتحة.","En":"Tracing A's three sides returns to the starting point without a gap."},"CommonError":{"Ar":"لا يكفي عد الأضلاع وحده إذا كان الشكل مفتوحاً.","En":"Counting sides alone is not enough if the shape is open."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المثلث مغلق، لذلك لا يصلح الشكل ذو الفتحة.","En":"A triangle must be closed, so the shape with a gap does not qualify."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"له أربعة أضلاع لا ثلاثة.","En":"It has four sides, not three."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا توجد له ثلاثة أضلاع مستقيمة.","En":"It does not have three straight sides."},"Order":4}]}$mw$),
($mw$growth-v30-grade-1-shape-turn-does-not-change-1$mw$,$mw$shape-turn-does-not-change$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ثبات الشكل عند تدويره","En":"Shape identity under rotation"},"Question":{"Ar":"رسمت ليلى مربعاً على بطاقة، ثم أدارت البطاقة حتى صار أحد رؤوس المربع في الأعلى، دون قصها أو طيها. كم ضلعاً للمربع بعد الدوران؟","En":"Layla draws a square on a card and turns it until one corner of the square points upward, without cutting or folding it. How many sides does the square have after the turn?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الدوران لا يزيل ضلعين.","En":"A turn does not remove two sides."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أضلاع تخص المثلث لا المربع.","En":"Three sides belong to a triangle, not a square."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يضيف الدوران أضلاعاً جديدة.","En":"A turn adds no new sides."}}],"Hints":[{"Ar":"تذكر عدد أضلاع المربع قبل الدوران.","En":"Recall the square's side count before the turn."},{"Ar":"هل تغيّر اتجاه البطاقة أم تغير الشكل نفسه؟","En":"Did the card's orientation change, or the shape itself?"}],"Solution":{"Idea":{"Ar":"دوران شكل دون قص أو تشويه يحافظ على عدد أضلاعه وخصائصه.","En":"Turning a shape without cutting or deforming preserves its side count and attributes."},"FormulaLatex":"4","Steps":[{"Ar":"قبل الدوران للمربع أربعة أضلاع.","En":"Before turning, the square has four sides."},{"Ar":"الدوران يغير اتجاه الأضلاع فقط ولا يضيف أو يحذف ضلعاً.","En":"Turning changes orientation only; it adds or removes no sides."}],"Substitution":{"Ar":"$4=4$","En":"$4=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"أضلاع","En":"Sides"},"Verification":{"Ar":"يمكن تتبع الأضلاع الأربعة بعد الدوران كما قبل الدوران.","En":"The four sides can be traced after the turn just as before."},"CommonError":{"Ar":"لا تعتبر تغيير اتجاه الشكل تغييراً في عدد أضلاعه.","En":"Do not treat a change in orientation as a change in side count."}}}$mw$::jsonb,$mw$دوران شكل دون قص أو تشويه يحافظ على عدد أضلاعه وخصائصه.

$4$

1. قبل الدوران للمربع أربعة أضلاع.

2. الدوران يغير اتجاه الأضلاع فقط ولا يضيف أو يحذف ضلعاً.

$4=4$

$4$ أضلاع

يمكن تتبع الأضلاع الأربعة بعد الدوران كما قبل الدوران.

لا تعتبر تغيير اتجاه الشكل تغييراً في عدد أضلاعه.$mw$,$mw$Turning a shape without cutting or deforming preserves its side count and attributes.

$4$

1. Before turning, the square has four sides.

2. Turning changes orientation only; it adds or removes no sides.

$4=4$

$4$ Sides

The four sides can be traced after the turn just as before.

Do not treat a change in orientation as a change in side count.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"تذكر عدد أضلاع المربع قبل الدوران.","En":"Recall the square's side count before the turn."},{"Ar":"هل تغيّر اتجاه البطاقة أم تغير الشكل نفسه؟","En":"Did the card's orientation change, or the shape itself?"}],"Solution":{"Idea":{"Ar":"دوران شكل دون قص أو تشويه يحافظ على عدد أضلاعه وخصائصه.","En":"Turning a shape without cutting or deforming preserves its side count and attributes."},"FormulaLatex":"4","Steps":[{"Ar":"قبل الدوران للمربع أربعة أضلاع.","En":"Before turning, the square has four sides."},{"Ar":"الدوران يغير اتجاه الأضلاع فقط ولا يضيف أو يحذف ضلعاً.","En":"Turning changes orientation only; it adds or removes no sides."}],"Substitution":{"Ar":"$4=4$","En":"$4=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"أضلاع","En":"Sides"},"Verification":{"Ar":"يمكن تتبع الأضلاع الأربعة بعد الدوران كما قبل الدوران.","En":"The four sides can be traced after the turn just as before."},"CommonError":{"Ar":"لا تعتبر تغيير اتجاه الشكل تغييراً في عدد أضلاعه.","En":"Do not treat a change in orientation as a change in side count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الدوران لا يزيل ضلعين.","En":"A turn does not remove two sides."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أضلاع تخص المثلث لا المربع.","En":"Three sides belong to a triangle, not a square."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يضيف الدوران أضلاعاً جديدة.","En":"A turn adds no new sides."},"Order":4}]}$mw$),
($mw$growth-v30-grade-1-shape-compose-square-tiles-1$mw$,$mw$shape-compose-square-tiles$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تركيب شكل من مربعين","En":"Composing a shape from two squares"},"Question":{"Ar":"نضع بلاطتين مربعتين متطابقتين جنباً إلى جنب، بحيث يتلامس ضلع كامل من كل منهما دون تداخل. ما شكل الحد الخارجي الناتج؟ A: مثلث. B: مستطيل غير مربع. C: دائرة. D: مربع.","En":"Place two identical square tiles side by side, sharing one entire edge without overlap. What is the resulting outer shape? A: triangle. B: non-square rectangle. C: circle. D: square."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحد الخارجي له أربعة أضلاع مستقيمة لا ثلاثة.","En":"The outer boundary has four straight sides, not three."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأضلاع الخارجية مستقيمة وليست حافة منحنية.","En":"The outer edges are straight, not a curved boundary."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضلع الطويل يساوي طول ضلعين من البلاطة، فلا تتساوى أطوال الأضلاع الأربعة.","En":"The long side is twice a tile side, so the four sides are not equal."}}],"Hints":[{"Ar":"تخيل المربعين متجاورين وضلعاً كاملاً مشتركاً.","En":"Imagine the squares side by side with a full shared edge."},{"Ar":"تتبع الحد الخارجي فقط، ولا تعد الضلع المشترك جزءاً منه.","En":"Trace only the outer boundary, not the shared edge."}],"Solution":{"Idea":{"Ar":"يمكن تركيب مستطيل من مربعين متساويين يشتركان في ضلع كامل دون تداخل.","En":"Two equal squares sharing a full edge without overlap form a rectangle."},"FormulaLatex":"2+2=4","Steps":[{"Ar":"يتكون الحد الخارجي من ضلعين طويلين متساويين وضلعين قصيرين متساويين.","En":"The outer boundary has two equal long sides and two equal short sides."},{"Ar":"جميع الزوايا الأربع قائمة، والضلع الطويل ضعف القصير، إذن الشكل مستطيل وليس مربعاً.","En":"All four corners are right angles; a long side is twice a short side, so the shape is a non-square rectangle."}],"Substitution":{"Ar":"عدد الأضلاع الخارجية المستقيمة أربعة بعد اعتبار القطع الواقعة على مستقيم واحد ضلعاً واحداً.","En":"There are four straight outer sides after treating collinear segments as a single side."},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"شكل","En":"Shape"},"Verification":{"Ar":"يمكن فصل المستطيل على الضلع المشترك فيعود مربعين متطابقين.","En":"Splitting the rectangle along the shared edge recovers two identical squares."},"CommonError":{"Ar":"لا تعد الضلع المشترك من الحد الخارجي.","En":"Do not count the shared edge as part of the outer boundary."}}}$mw$::jsonb,$mw$يمكن تركيب مستطيل من مربعين متساويين يشتركان في ضلع كامل دون تداخل.

$2+2=4$

1. يتكون الحد الخارجي من ضلعين طويلين متساويين وضلعين قصيرين متساويين.

2. جميع الزوايا الأربع قائمة، والضلع الطويل ضعف القصير، إذن الشكل مستطيل وليس مربعاً.

عدد الأضلاع الخارجية المستقيمة أربعة بعد اعتبار القطع الواقعة على مستقيم واحد ضلعاً واحداً.

$B$ شكل

يمكن فصل المستطيل على الضلع المشترك فيعود مربعين متطابقين.

لا تعد الضلع المشترك من الحد الخارجي.$mw$,$mw$Two equal squares sharing a full edge without overlap form a rectangle.

$2+2=4$

1. The outer boundary has two equal long sides and two equal short sides.

2. All four corners are right angles; a long side is twice a short side, so the shape is a non-square rectangle.

There are four straight outer sides after treating collinear segments as a single side.

$B$ Shape

Splitting the rectangle along the shared edge recovers two identical squares.

Do not count the shared edge as part of the outer boundary.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"تخيل المربعين متجاورين وضلعاً كاملاً مشتركاً.","En":"Imagine the squares side by side with a full shared edge."},{"Ar":"تتبع الحد الخارجي فقط، ولا تعد الضلع المشترك جزءاً منه.","En":"Trace only the outer boundary, not the shared edge."}],"Solution":{"Idea":{"Ar":"يمكن تركيب مستطيل من مربعين متساويين يشتركان في ضلع كامل دون تداخل.","En":"Two equal squares sharing a full edge without overlap form a rectangle."},"FormulaLatex":"2+2=4","Steps":[{"Ar":"يتكون الحد الخارجي من ضلعين طويلين متساويين وضلعين قصيرين متساويين.","En":"The outer boundary has two equal long sides and two equal short sides."},{"Ar":"جميع الزوايا الأربع قائمة، والضلع الطويل ضعف القصير، إذن الشكل مستطيل وليس مربعاً.","En":"All four corners are right angles; a long side is twice a short side, so the shape is a non-square rectangle."}],"Substitution":{"Ar":"عدد الأضلاع الخارجية المستقيمة أربعة بعد اعتبار القطع الواقعة على مستقيم واحد ضلعاً واحداً.","En":"There are four straight outer sides after treating collinear segments as a single side."},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"شكل","En":"Shape"},"Verification":{"Ar":"يمكن فصل المستطيل على الضلع المشترك فيعود مربعين متطابقين.","En":"Splitting the rectangle along the shared edge recovers two identical squares."},"CommonError":{"Ar":"لا تعد الضلع المشترك من الحد الخارجي.","En":"Do not count the shared edge as part of the outer boundary."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الحد الخارجي له أربعة أضلاع مستقيمة لا ثلاثة.","En":"The outer boundary has four straight sides, not three."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الأضلاع الخارجية مستقيمة وليست حافة منحنية.","En":"The outer edges are straight, not a curved boundary."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الضلع الطويل يساوي طول ضلعين من البلاطة، فلا تتساوى أطوال الأضلاع الأربعة.","En":"The long side is twice a tile side, so the four sides are not equal."},"Order":4}]}$mw$),
($mw$growth-v30-grade-1-data-most-least-gap-1$mw$,$mw$data-most-least-gap$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قراءة بيانات ثلاث مجموعات","En":"Reading three data groups"},"Question":{"Ar":"سُئل أطفال عن الفاكهة المفضلة. اختار 5 أطفال التفاح، و3 الموز، و7 البرتقال. كم يزيد عدد من اختار البرتقال على عدد من اختار الموز؟","En":"Children chose a favourite fruit. Five chose apples, three bananas and seven oranges. How many more chose oranges than bananas?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق بين التفاح والموز.","En":"This compares apples with bananas."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد من اختار الموز وحده.","En":"This is the banana count alone."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع البرتقال والموز، لا الفرق.","En":"This adds orange and banana counts rather than comparing them."}}],"Hints":[{"Ar":"اختر فقط عددي البرتقال والموز.","En":"Use only the orange and banana counts."},{"Ar":"اطرح العدد الأصغر من الأكبر.","En":"Subtract the smaller count from the larger."}],"Solution":{"Idea":{"Ar":"عند المقارنة بين فئتين في البيانات نستخدم الفرق بين عدديهما.","En":"When comparing two data categories, use the difference between their counts."},"FormulaLatex":"7-3","Steps":[{"Ar":"اختار البرتقال 7 أطفال والموز 3 أطفال.","En":"Seven chose oranges and three chose bananas."},{"Ar":"نطرح 3 من 7 لمعرفة الزيادة.","En":"Subtract 3 from 7 to find how many more."}],"Substitution":{"Ar":"$7-3=4$","En":"$7-3=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"أطفال","En":"Children"},"Verification":{"Ar":"إذا أضفنا 4 إلى 3 نحصل على 7.","En":"Adding 4 to 3 gives 7."},"CommonError":{"Ar":"لا تستخدم عدد التفاح في هذه المقارنة.","En":"Do not use the apple count for this comparison."}}}$mw$::jsonb,$mw$عند المقارنة بين فئتين في البيانات نستخدم الفرق بين عدديهما.

$7-3$

1. اختار البرتقال 7 أطفال والموز 3 أطفال.

2. نطرح 3 من 7 لمعرفة الزيادة.

$7-3=4$

$4$ أطفال

إذا أضفنا 4 إلى 3 نحصل على 7.

لا تستخدم عدد التفاح في هذه المقارنة.$mw$,$mw$When comparing two data categories, use the difference between their counts.

$7-3$

1. Seven chose oranges and three chose bananas.

2. Subtract 3 from 7 to find how many more.

$7-3=4$

$4$ Children

Adding 4 to 3 gives 7.

Do not use the apple count for this comparison.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اختر فقط عددي البرتقال والموز.","En":"Use only the orange and banana counts."},{"Ar":"اطرح العدد الأصغر من الأكبر.","En":"Subtract the smaller count from the larger."}],"Solution":{"Idea":{"Ar":"عند المقارنة بين فئتين في البيانات نستخدم الفرق بين عدديهما.","En":"When comparing two data categories, use the difference between their counts."},"FormulaLatex":"7-3","Steps":[{"Ar":"اختار البرتقال 7 أطفال والموز 3 أطفال.","En":"Seven chose oranges and three chose bananas."},{"Ar":"نطرح 3 من 7 لمعرفة الزيادة.","En":"Subtract 3 from 7 to find how many more."}],"Substitution":{"Ar":"$7-3=4$","En":"$7-3=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"أطفال","En":"Children"},"Verification":{"Ar":"إذا أضفنا 4 إلى 3 نحصل على 7.","En":"Adding 4 to 3 gives 7."},"CommonError":{"Ar":"لا تستخدم عدد التفاح في هذه المقارنة.","En":"Do not use the apple count for this comparison."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق بين التفاح والموز.","En":"This compares apples with bananas."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد من اختار الموز وحده.","En":"This is the banana count alone."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع البرتقال والموز، لا الفرق.","En":"This adds orange and banana counts rather than comparing them."},"Order":4}]}$mw$),
($mw$growth-v30-grade-1-data-total-three-exclusive-groups-1$mw$,$mw$data-total-three-exclusive-groups$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إيجاد العدد الكلي من البيانات","En":"Finding the total from data"},"Question":{"Ar":"صنّف صفّ مكعباته حسب اللون فقط: 4 حمراء، و6 زرقاء، و2 خضراء. كل مكعب له لون واحد من هذه الألوان. كم مكعباً في الصف؟","En":"A class sorts its cubes by colour only: 4 red, 6 blue and 2 green. Each cube has exactly one of these colours. How many cubes are there in the class?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأزرق والأخضر فقط وأهمل الأحمر.","En":"Adds blue and green but omits red."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأحمر والأزرق وأهمل الأخضر.","En":"Adds red and blue but omits green."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف مكعبين زيادة عن مجموع المجموعات الثلاث.","En":"Adds two extra cubes beyond the three groups."}}],"Hints":[{"Ar":"استعمل الأعداد الثلاثة لأن كل مكعب ينتمي لمجموعة واحدة.","En":"Use all three counts because each cube belongs to one group."},{"Ar":"اجمع الأحمر والأزرق ثم أضف الأخضر.","En":"Add red and blue, then add green."}],"Solution":{"Idea":{"Ar":"عندما لا تتداخل مجموعات البيانات وتغطي كل العناصر، يساوي المجموع الكلي مجموع أعدادها.","En":"When data groups do not overlap and cover all items, the total equals the sum of their counts."},"FormulaLatex":"4+6+2","Steps":[{"Ar":"الأحمر والأزرق معاً: 4+6=10.","En":"Red and blue together: 4+6=10."},{"Ar":"نضيف الأخضر: 10+2=12.","En":"Add green: 10+2=12."}],"Substitution":{"Ar":"$4+6+2=12$","En":"$4+6+2=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"مكعبات","En":"Cubes"},"Verification":{"Ar":"عند طرح المجموعات الثلاث من 12 لا يبقى شيء.","En":"Removing all three group counts from 12 leaves nothing."},"CommonError":{"Ar":"لا تهمل المجموعة الأصغر.","En":"Do not omit the smallest group."}}}$mw$::jsonb,$mw$عندما لا تتداخل مجموعات البيانات وتغطي كل العناصر، يساوي المجموع الكلي مجموع أعدادها.

$4+6+2$

1. الأحمر والأزرق معاً: 4+6=10.

2. نضيف الأخضر: 10+2=12.

$4+6+2=12$

$12$ مكعبات

عند طرح المجموعات الثلاث من 12 لا يبقى شيء.

لا تهمل المجموعة الأصغر.$mw$,$mw$When data groups do not overlap and cover all items, the total equals the sum of their counts.

$4+6+2$

1. Red and blue together: 4+6=10.

2. Add green: 10+2=12.

$4+6+2=12$

$12$ Cubes

Removing all three group counts from 12 leaves nothing.

Do not omit the smallest group.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"استعمل الأعداد الثلاثة لأن كل مكعب ينتمي لمجموعة واحدة.","En":"Use all three counts because each cube belongs to one group."},{"Ar":"اجمع الأحمر والأزرق ثم أضف الأخضر.","En":"Add red and blue, then add green."}],"Solution":{"Idea":{"Ar":"عندما لا تتداخل مجموعات البيانات وتغطي كل العناصر، يساوي المجموع الكلي مجموع أعدادها.","En":"When data groups do not overlap and cover all items, the total equals the sum of their counts."},"FormulaLatex":"4+6+2","Steps":[{"Ar":"الأحمر والأزرق معاً: 4+6=10.","En":"Red and blue together: 4+6=10."},{"Ar":"نضيف الأخضر: 10+2=12.","En":"Add green: 10+2=12."}],"Substitution":{"Ar":"$4+6+2=12$","En":"$4+6+2=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"مكعبات","En":"Cubes"},"Verification":{"Ar":"عند طرح المجموعات الثلاث من 12 لا يبقى شيء.","En":"Removing all three group counts from 12 leaves nothing."},"CommonError":{"Ar":"لا تهمل المجموعة الأصغر.","En":"Do not omit the smallest group."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع الأزرق والأخضر فقط وأهمل الأحمر.","En":"Adds blue and green but omits red."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع الأحمر والأزرق وأهمل الأخضر.","En":"Adds red and blue but omits green."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف مكعبين زيادة عن مجموع المجموعات الثلاث.","En":"Adds two extra cubes beyond the three groups."},"Order":4}]}$mw$),
($mw$growth-v30-grade-1-data-count-missing-category-1$mw$,$mw$data-count-missing-category$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"استكمال سجل بسيط","En":"Completing a simple data record"},"Question":{"Ar":"اختار 10 أطفال نشاطاً واحداً لكل منهم. اختار 4 الرسم، و3 القراءة، واختار الباقون اللعب. كم طفلاً اختار اللعب؟","En":"Ten children each choose exactly one activity. Four choose drawing, three reading, and the rest play. How many choose play?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إذا اختار اثنان اللعب يصبح المجموع 9 فقط.","En":"If two choose play, the total is only nine."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إذا اختار أربعة اللعب يصبح المجموع 11.","En":"If four choose play, the total is eleven."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 هو مجموع الرسم والقراءة، لا الباقي.","En":"Seven is the drawing and reading total, not the remainder."}}],"Hints":[{"Ar":"اجمع من اختار الرسم ومن اختار القراءة.","En":"Add the drawing and reading counts."},{"Ar":"اطرح هذا المجموع من عشرة.","En":"Subtract that sum from ten."}],"Solution":{"Idea":{"Ar":"إذا كانت الفئات لا تتداخل، نحسب العدد المفقود بطرح مجموع الفئات المعروفة من الكل.","En":"For non-overlapping categories, find a missing count by subtracting the known counts from the total."},"FormulaLatex":"10-(4+3)","Steps":[{"Ar":"اختار الرسم أو القراءة 4+3=7 أطفال.","En":"Four plus three gives seven children choosing drawing or reading."},{"Ar":"بقي من العشرة 10−7=3 أطفال للعب.","En":"Of the ten, 10−7=3 remain for play."}],"Substitution":{"Ar":"$10-7=3$","En":"$10-7=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"أطفال","En":"Children"},"Verification":{"Ar":"4+3+3=10؛ جميع الأطفال محسوبون مرة واحدة.","En":"4+3+3=10; every child is counted once."},"CommonError":{"Ar":"لا تعتبر مجموع النشاطين هو عدد من اختار النشاط الثالث.","En":"Do not mistake the two known groups' total for the third group."}}}$mw$::jsonb,$mw$إذا كانت الفئات لا تتداخل، نحسب العدد المفقود بطرح مجموع الفئات المعروفة من الكل.

$10-(4+3)$

1. اختار الرسم أو القراءة 4+3=7 أطفال.

2. بقي من العشرة 10−7=3 أطفال للعب.

$10-7=3$

$3$ أطفال

4+3+3=10؛ جميع الأطفال محسوبون مرة واحدة.

لا تعتبر مجموع النشاطين هو عدد من اختار النشاط الثالث.$mw$,$mw$For non-overlapping categories, find a missing count by subtracting the known counts from the total.

$10-(4+3)$

1. Four plus three gives seven children choosing drawing or reading.

2. Of the ten, 10−7=3 remain for play.

$10-7=3$

$3$ Children

4+3+3=10; every child is counted once.

Do not mistake the two known groups' total for the third group.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اجمع من اختار الرسم ومن اختار القراءة.","En":"Add the drawing and reading counts."},{"Ar":"اطرح هذا المجموع من عشرة.","En":"Subtract that sum from ten."}],"Solution":{"Idea":{"Ar":"إذا كانت الفئات لا تتداخل، نحسب العدد المفقود بطرح مجموع الفئات المعروفة من الكل.","En":"For non-overlapping categories, find a missing count by subtracting the known counts from the total."},"FormulaLatex":"10-(4+3)","Steps":[{"Ar":"اختار الرسم أو القراءة 4+3=7 أطفال.","En":"Four plus three gives seven children choosing drawing or reading."},{"Ar":"بقي من العشرة 10−7=3 أطفال للعب.","En":"Of the ten, 10−7=3 remain for play."}],"Substitution":{"Ar":"$10-7=3$","En":"$10-7=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"أطفال","En":"Children"},"Verification":{"Ar":"4+3+3=10؛ جميع الأطفال محسوبون مرة واحدة.","En":"4+3+3=10; every child is counted once."},"CommonError":{"Ar":"لا تعتبر مجموع النشاطين هو عدد من اختار النشاط الثالث.","En":"Do not mistake the two known groups' total for the third group."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"إذا اختار اثنان اللعب يصبح المجموع 9 فقط.","En":"If two choose play, the total is only nine."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"إذا اختار أربعة اللعب يصبح المجموع 11.","En":"If four choose play, the total is eleven."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"7 هو مجموع الرسم والقراءة، لا الباقي.","En":"Seven is the drawing and reading total, not the remainder."},"Order":4}]}$mw$),
($mw$growth-v30-grade-2-shape-cube-face-edge-distinction-1$mw$,$mw$shape-cube-face-edge-distinction$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز أوجه المجسمات","En":"Distinguishing solid faces"},"Question":{"Ar":"لدى رنا مجسم مكعب. تريد وضع ملصق مربع يغطي كل وجه مسطح كاملاً، ملصق واحد لكل وجه دون تداخل. كم ملصقاً تحتاج؟","En":"Rana has a cube. She wants to cover each entire flat face with one square sticker, with no overlap. How many stickers does she need?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ بعض الأوجه فقط وأهمل وجهين.","En":"Counts only some faces and omits two."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 عدد رؤوس المكعب لا أوجهه.","En":"Eight counts vertices, not faces."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 عدد حواف المكعب لا أوجهه.","En":"Twelve counts edges, not faces."}}],"Hints":[{"Ar":"تخيل الوجه العلوي والسفلي.","En":"Imagine the top and bottom faces."},{"Ar":"أضف الأوجه الجانبية الأربعة.","En":"Add the four side faces."}],"Solution":{"Idea":{"Ar":"للمكعب ستة أوجه مربعة متطابقة، وتختلف الأوجه عن الرؤوس والحواف.","En":"A cube has six congruent square faces; faces differ from vertices and edges."},"FormulaLatex":"2+4","Steps":[{"Ar":"المكعب له وجه علوي ووجه سفلي.","En":"A cube has one top and one bottom face."},{"Ar":"وله أربعة أوجه جانبية، فيحتاج 2+4 ملصقات.","En":"It also has four side faces, so it needs 2+4 stickers."}],"Substitution":{"Ar":"$2+4=6$","En":"$2+4=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"ملصقات","En":"Stickers"},"Verification":{"Ar":"عند فك شبكة مكعب نحصل على ستة مربعات، ملصق لكل مربع.","En":"Unfolding a cube net gives six squares, one sticker for each."},"CommonError":{"Ar":"لا تعد الرؤوس أو الحواف بدلاً من الأوجه.","En":"Do not count vertices or edges instead of faces."}}}$mw$::jsonb,$mw$للمكعب ستة أوجه مربعة متطابقة، وتختلف الأوجه عن الرؤوس والحواف.

$2+4$

1. المكعب له وجه علوي ووجه سفلي.

2. وله أربعة أوجه جانبية، فيحتاج 2+4 ملصقات.

$2+4=6$

$6$ ملصقات

عند فك شبكة مكعب نحصل على ستة مربعات، ملصق لكل مربع.

لا تعد الرؤوس أو الحواف بدلاً من الأوجه.$mw$,$mw$A cube has six congruent square faces; faces differ from vertices and edges.

$2+4$

1. A cube has one top and one bottom face.

2. It also has four side faces, so it needs 2+4 stickers.

$2+4=6$

$6$ Stickers

Unfolding a cube net gives six squares, one sticker for each.

Do not count vertices or edges instead of faces.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل الوجه العلوي والسفلي.","En":"Imagine the top and bottom faces."},{"Ar":"أضف الأوجه الجانبية الأربعة.","En":"Add the four side faces."}],"Solution":{"Idea":{"Ar":"للمكعب ستة أوجه مربعة متطابقة، وتختلف الأوجه عن الرؤوس والحواف.","En":"A cube has six congruent square faces; faces differ from vertices and edges."},"FormulaLatex":"2+4","Steps":[{"Ar":"المكعب له وجه علوي ووجه سفلي.","En":"A cube has one top and one bottom face."},{"Ar":"وله أربعة أوجه جانبية، فيحتاج 2+4 ملصقات.","En":"It also has four side faces, so it needs 2+4 stickers."}],"Substitution":{"Ar":"$2+4=6$","En":"$2+4=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"ملصقات","En":"Stickers"},"Verification":{"Ar":"عند فك شبكة مكعب نحصل على ستة مربعات، ملصق لكل مربع.","En":"Unfolding a cube net gives six squares, one sticker for each."},"CommonError":{"Ar":"لا تعد الرؤوس أو الحواف بدلاً من الأوجه.","En":"Do not count vertices or edges instead of faces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عدّ بعض الأوجه فقط وأهمل وجهين.","En":"Counts only some faces and omits two."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 عدد رؤوس المكعب لا أوجهه.","En":"Eight counts vertices, not faces."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 عدد حواف المكعب لا أوجهه.","En":"Twelve counts edges, not faces."},"Order":4}]}$mw$),
($mw$growth-v30-grade-2-shape-equal-shares-partition-1$mw$,$mw$shape-equal-shares-partition$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز الأرباع المتساوية","En":"Recognizing equal quarters"},"Question":{"Ar":"تريد هند تقسيم مستطيل إلى أربعة أجزاء بحيث يكون كل جزء ربع المستطيل. أي تقسيم يحقق ذلك؟ A: أربعة أجزاء متساوية المساحة؛ B: ثلاثة أجزاء متساوية؛ C: أربعة أجزاء منها جزء أكبر من الباقي؛ D: نصفان متساويان.","En":"Hind wants to divide a rectangle into four pieces, each one quarter of the rectangle. Which partition works? A: four pieces with equal area; B: three equal pieces; C: four pieces with one larger than the others; D: two equal halves."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أجزاء متساوية تعطي أثلاثاً لا أرباعاً.","En":"Three equal parts give thirds, not quarters."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأجزاء غير متساوية، لذلك لا يمثل كل جزء ربعاً.","En":"The parts are unequal, so each is not a quarter."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جزآن متساويان يعطيان نصفين.","En":"Two equal parts give halves."}}],"Hints":[{"Ar":"كم جزءاً يجب أن يكون في الكل؟","En":"How many parts should the whole have?"},{"Ar":"لا يكفي عدد الأجزاء، بل يجب أن تتساوى مساحاتها.","En":"The number of parts is not enough; their areas must be equal."}],"Solution":{"Idea":{"Ar":"الأرباع الأربعة أجزاء متساوية المساحة من الكل؛ شكل الأجزاء أو اتجاهها لا يغير هذه الخاصية.","En":"Quarters are four equal-area shares of the whole; their shape or orientation does not change that condition."},"FormulaLatex":"\\frac14+\\frac14+\\frac14+\\frac14=1","Steps":[{"Ar":"B وD لا يعطيان أربعة أجزاء.","En":"B and D do not give four parts."},{"Ar":"C يعطي أربعة أجزاء غير متساوية.","En":"C gives four unequal parts."},{"Ar":"A يعطي أربعة أجزاء متساوية المساحة، إذن كل جزء ربع.","En":"A gives four equal-area parts, so each is a quarter."}],"Substitution":{"Ar":"$A$","En":"$A$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"تقسيم","En":"Partition"},"Verification":{"Ar":"جمع أربعة أرباع متساوية يعيد المستطيل كاملاً.","En":"Four equal quarters reassemble the whole rectangle."},"CommonError":{"Ar":"لا تسمِّ كل جزء ربعاً إذا كانت الأجزاء الأربعة غير متساوية.","En":"Do not call every part a quarter if four parts are unequal."}}}$mw$::jsonb,$mw$الأرباع الأربعة أجزاء متساوية المساحة من الكل؛ شكل الأجزاء أو اتجاهها لا يغير هذه الخاصية.

$\frac14+\frac14+\frac14+\frac14=1$

1. B وD لا يعطيان أربعة أجزاء.

2. C يعطي أربعة أجزاء غير متساوية.

3. A يعطي أربعة أجزاء متساوية المساحة، إذن كل جزء ربع.

$A$

$A$ تقسيم

جمع أربعة أرباع متساوية يعيد المستطيل كاملاً.

لا تسمِّ كل جزء ربعاً إذا كانت الأجزاء الأربعة غير متساوية.$mw$,$mw$Quarters are four equal-area shares of the whole; their shape or orientation does not change that condition.

$\frac14+\frac14+\frac14+\frac14=1$

1. B and D do not give four parts.

2. C gives four unequal parts.

3. A gives four equal-area parts, so each is a quarter.

$A$

$A$ Partition

Four equal quarters reassemble the whole rectangle.

Do not call every part a quarter if four parts are unequal.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم جزءاً يجب أن يكون في الكل؟","En":"How many parts should the whole have?"},{"Ar":"لا يكفي عدد الأجزاء، بل يجب أن تتساوى مساحاتها.","En":"The number of parts is not enough; their areas must be equal."}],"Solution":{"Idea":{"Ar":"الأرباع الأربعة أجزاء متساوية المساحة من الكل؛ شكل الأجزاء أو اتجاهها لا يغير هذه الخاصية.","En":"Quarters are four equal-area shares of the whole; their shape or orientation does not change that condition."},"FormulaLatex":"\\frac14+\\frac14+\\frac14+\\frac14=1","Steps":[{"Ar":"B وD لا يعطيان أربعة أجزاء.","En":"B and D do not give four parts."},{"Ar":"C يعطي أربعة أجزاء غير متساوية.","En":"C gives four unequal parts."},{"Ar":"A يعطي أربعة أجزاء متساوية المساحة، إذن كل جزء ربع.","En":"A gives four equal-area parts, so each is a quarter."}],"Substitution":{"Ar":"$A$","En":"$A$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"تقسيم","En":"Partition"},"Verification":{"Ar":"جمع أربعة أرباع متساوية يعيد المستطيل كاملاً.","En":"Four equal quarters reassemble the whole rectangle."},"CommonError":{"Ar":"لا تسمِّ كل جزء ربعاً إذا كانت الأجزاء الأربعة غير متساوية.","En":"Do not call every part a quarter if four parts are unequal."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أجزاء متساوية تعطي أثلاثاً لا أرباعاً.","En":"Three equal parts give thirds, not quarters."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الأجزاء غير متساوية، لذلك لا يمثل كل جزء ربعاً.","En":"The parts are unequal, so each is not a quarter."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جزآن متساويان يعطيان نصفين.","En":"Two equal parts give halves."},"Order":4}]}$mw$),
($mw$growth-v30-grade-2-shape-array-cover-missing-square-1$mw$,$mw$shape-array-cover-missing-square$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبليط مستطيل بمربعات متساوية","En":"Tiling a rectangle with equal squares"},"Question":{"Ar":"كان مستطيل مغطى بثلاثة صفوف من المربعات المتساوية، أربعة مربعات في كل صف دون فراغات. أزيل مربع واحد من الصف الثالث فقط. كم مربعاً بقي؟","En":"A rectangle was covered by three rows of equal squares, four per row with no gaps. One square is removed from the third row only. How many squares remain?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الصفين الكاملين فقط.","En":"Counts only the two complete rows."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف مربعين بدلاً من واحد.","En":"Removes two squares instead of one."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد المربعات قبل فقدان المربع.","En":"This is the count before a square was removed."}}],"Hints":[{"Ar":"عد المربعات في كل صف كامل.","En":"Count squares in each complete row."},{"Ar":"الصف الأخير فيه ثلاثة مربعات لا أربعة.","En":"The last row contains three squares, not four."}],"Solution":{"Idea":{"Ar":"يمكن تقسيم المستطيل إلى صفوف وأعمدة من مربعات متساوية وعدها صفاً صفاً.","En":"A rectangle can be partitioned into rows and columns of equal squares and counted row by row."},"FormulaLatex":"4+4+3","Steps":[{"Ar":"في الصفين الأولين 4+4=8 مربعات.","En":"The first two rows contain 4+4=8 squares."},{"Ar":"في الثالث 4−1=3 مربعات.","En":"The third contains 4−1=3 squares."},{"Ar":"نجمع 8+3=11 مربعاً.","En":"Add 8+3=11 squares."}],"Substitution":{"Ar":"$4+4+3=11$","En":"$4+4+3=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"مربعات","En":"Squares"},"Verification":{"Ar":"عند إعادة المربع المفقود تصبح المربعات 12، أي ثلاثة صفوف من أربعة.","En":"Replacing the missing square gives 12, three rows of four."},"CommonError":{"Ar":"لا تعد الفراغ مربعاً موجوداً.","En":"Do not count the gap as an existing square."}}}$mw$::jsonb,$mw$يمكن تقسيم المستطيل إلى صفوف وأعمدة من مربعات متساوية وعدها صفاً صفاً.

$4+4+3$

1. في الصفين الأولين 4+4=8 مربعات.

2. في الثالث 4−1=3 مربعات.

3. نجمع 8+3=11 مربعاً.

$4+4+3=11$

$11$ مربعات

عند إعادة المربع المفقود تصبح المربعات 12، أي ثلاثة صفوف من أربعة.

لا تعد الفراغ مربعاً موجوداً.$mw$,$mw$A rectangle can be partitioned into rows and columns of equal squares and counted row by row.

$4+4+3$

1. The first two rows contain 4+4=8 squares.

2. The third contains 4−1=3 squares.

3. Add 8+3=11 squares.

$4+4+3=11$

$11$ Squares

Replacing the missing square gives 12, three rows of four.

Do not count the gap as an existing square.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد المربعات في كل صف كامل.","En":"Count squares in each complete row."},{"Ar":"الصف الأخير فيه ثلاثة مربعات لا أربعة.","En":"The last row contains three squares, not four."}],"Solution":{"Idea":{"Ar":"يمكن تقسيم المستطيل إلى صفوف وأعمدة من مربعات متساوية وعدها صفاً صفاً.","En":"A rectangle can be partitioned into rows and columns of equal squares and counted row by row."},"FormulaLatex":"4+4+3","Steps":[{"Ar":"في الصفين الأولين 4+4=8 مربعات.","En":"The first two rows contain 4+4=8 squares."},{"Ar":"في الثالث 4−1=3 مربعات.","En":"The third contains 4−1=3 squares."},{"Ar":"نجمع 8+3=11 مربعاً.","En":"Add 8+3=11 squares."}],"Substitution":{"Ar":"$4+4+3=11$","En":"$4+4+3=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"مربعات","En":"Squares"},"Verification":{"Ar":"عند إعادة المربع المفقود تصبح المربعات 12، أي ثلاثة صفوف من أربعة.","En":"Replacing the missing square gives 12, three rows of four."},"CommonError":{"Ar":"لا تعد الفراغ مربعاً موجوداً.","En":"Do not count the gap as an existing square."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عد الصفين الكاملين فقط.","En":"Counts only the two complete rows."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حذف مربعين بدلاً من واحد.","En":"Removes two squares instead of one."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد المربعات قبل فقدان المربع.","En":"This is the count before a square was removed."},"Order":4}]}$mw$),
($mw$growth-v30-grade-2-picture-graph-update-one-row-1$mw$,$mw$picture-graph-update-one-row$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديث مخطط صوري","En":"Updating a picture graph"},"Question":{"Ar":"يمثل كل رمز ● صوتاً واحداً. في سجل التصويت A: ●●●؛ B: ●●●●؛ C: ●●. اكتشف المعلم صوتاً إضافياً لصالح C لم يُسجّل. ما ترتيب أعداد الأصوات بعد إضافة الصوت؟","En":"Each ● represents one vote. The vote record is A: ●●●; B: ●●●●; C: ●●. The teacher finds one additional vote for C that was not recorded. What is the order of the counts after adding it?"},"Options":[{"LatexCode":"A=B>C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"A ثلاثة وB أربعة، فلا يتساويان.","En":"A has three and B four, so they are not equal."}},{"LatexCode":"B>A=C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C>B>A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"C يصبح ثلاثة فقط، فلا يتجاوز B.","En":"C becomes only three, so it does not exceed B."}},{"LatexCode":"B>A>C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ترتيب السجل قبل إضافة الصوت.","En":"This is the order before adding the vote."}}],"Hints":[{"Ar":"حوّل الرموز إلى أعداد أولاً.","En":"Convert the symbols into counts first."},{"Ar":"زد عدد C وحده بمقدار واحد ثم قارن.","En":"Increase only C by one, then compare."}],"Solution":{"Idea":{"Ar":"تحديث مخطط صوري أحادي الوحدة يعني إضافة رمز للفئة المعنية فقط، ثم قراءة الترتيب الجديد.","En":"Updating a single-unit pictograph adds a symbol to the affected category only; then read the new order."},"FormulaLatex":"3,4,2+1","Steps":[{"Ar":"العد الأولي هو A=3 وB=4 وC=2.","En":"Initial counts are A=3, B=4 and C=2."},{"Ar":"بعد التصحيح يصبح C=3 بينما تبقى A وB كما هما.","En":"After correction C=3, while A and B stay unchanged."},{"Ar":"B أكبر من A وC المتساويين.","En":"B exceeds the tied A and C."}],"Substitution":{"Ar":"$B>A=C$","En":"$B>A=C$"},"Result":{"Ar":"$B>A=C$","En":"$B>A=C$"},"Unit":{"Ar":"ترتيب","En":"Order"},"Verification":{"Ar":"4 أكبر من 3، و3 يساوي 3؛ مجموع الأصوات زاد من 9 إلى 10.","En":"4 exceeds 3 and 3 equals 3; the total rises from 9 to 10."},"CommonError":{"Ar":"لا تضف الصوت إلى جميع الفئات.","En":"Do not add the vote to every category."}}}$mw$::jsonb,$mw$تحديث مخطط صوري أحادي الوحدة يعني إضافة رمز للفئة المعنية فقط، ثم قراءة الترتيب الجديد.

$3,4,2+1$

1. العد الأولي هو A=3 وB=4 وC=2.

2. بعد التصحيح يصبح C=3 بينما تبقى A وB كما هما.

3. B أكبر من A وC المتساويين.

$B>A=C$

$B>A=C$ ترتيب

4 أكبر من 3، و3 يساوي 3؛ مجموع الأصوات زاد من 9 إلى 10.

لا تضف الصوت إلى جميع الفئات.$mw$,$mw$Updating a single-unit pictograph adds a symbol to the affected category only; then read the new order.

$3,4,2+1$

1. Initial counts are A=3, B=4 and C=2.

2. After correction C=3, while A and B stay unchanged.

3. B exceeds the tied A and C.

$B>A=C$

$B>A=C$ Order

4 exceeds 3 and 3 equals 3; the total rises from 9 to 10.

Do not add the vote to every category.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الرموز إلى أعداد أولاً.","En":"Convert the symbols into counts first."},{"Ar":"زد عدد C وحده بمقدار واحد ثم قارن.","En":"Increase only C by one, then compare."}],"Solution":{"Idea":{"Ar":"تحديث مخطط صوري أحادي الوحدة يعني إضافة رمز للفئة المعنية فقط، ثم قراءة الترتيب الجديد.","En":"Updating a single-unit pictograph adds a symbol to the affected category only; then read the new order."},"FormulaLatex":"3,4,2+1","Steps":[{"Ar":"العد الأولي هو A=3 وB=4 وC=2.","En":"Initial counts are A=3, B=4 and C=2."},{"Ar":"بعد التصحيح يصبح C=3 بينما تبقى A وB كما هما.","En":"After correction C=3, while A and B stay unchanged."},{"Ar":"B أكبر من A وC المتساويين.","En":"B exceeds the tied A and C."}],"Substitution":{"Ar":"$B>A=C$","En":"$B>A=C$"},"Result":{"Ar":"$B>A=C$","En":"$B>A=C$"},"Unit":{"Ar":"ترتيب","En":"Order"},"Verification":{"Ar":"4 أكبر من 3، و3 يساوي 3؛ مجموع الأصوات زاد من 9 إلى 10.","En":"4 exceeds 3 and 3 equals 3; the total rises from 9 to 10."},"CommonError":{"Ar":"لا تضف الصوت إلى جميع الفئات.","En":"Do not add the vote to every category."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"A ثلاثة وB أربعة، فلا يتساويان.","En":"A has three and B four, so they are not equal."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"C يصبح ثلاثة فقط، فلا يتجاوز B.","En":"C becomes only three, so it does not exceed B."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا ترتيب السجل قبل إضافة الصوت.","En":"This is the order before adding the vote."},"Order":4}]}$mw$),
($mw$growth-v30-grade-2-picture-graph-find-inconsistent-statement-1$mw$,$mw$picture-graph-find-inconsistent-statement$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,0,0,$mw${"StageId":1,"CategoryId":0,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اكتشاف عبارة غير صحيحة من مخطط","En":"Identifying an incorrect graph statement"},"Question":{"Ar":"يمثل كل رمز ● طالباً واحداً في نادٍ واحد فقط. A: ●●●●؛ B: ●●●●●؛ C: ●●؛ D: ●●●. أي عبارة غير صحيحة؟ 1: B أكبر مجموعة. 2: C أصغر مجموعة. 3: A وD معاً سبعة طلاب. 4: المجموع 13 طالباً.","En":"Each ● represents one pupil in exactly one club. A: ●●●●; B: ●●●●●; C: ●●; D: ●●●. Which statement is incorrect? 1: B is largest. 2: C is smallest. 3: A and D together have seven pupils. 4: There are 13 pupils altogether."},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"B فيه 5 طلاب وهو الأكبر، فالعبارة صحيحة.","En":"B has five pupils and is largest, so the statement is true."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"C فيه طالبان وهو الأصغر، فالعبارة صحيحة.","En":"C has two pupils and is smallest, so the statement is true."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"A وD معاً 4+3=7؛ العبارة صحيحة.","En":"A and D total 4+3=7; the statement is true."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"عد رموز كل نادٍ على حدة.","En":"Count symbols for each club separately."},{"Ar":"اختبر العبارات الأربع، وتذكر أن المطلوب هو الخاطئة.","En":"Check all four statements; the question asks for the false one."}],"Solution":{"Idea":{"Ar":"قراءة مخطط أحادي الوحدة تعطي أعداد الفئات مباشرة، ثم نتحقق من المقارنات والمجاميع.","En":"A single-unit pictograph directly gives category counts; then verify comparisons and totals."},"FormulaLatex":"4+5+2+3","Steps":[{"Ar":"B=5 هو الأكبر وC=2 هو الأصغر؛ العبارتان 1 و2 صحيحتان.","En":"B=5 is largest and C=2 smallest; statements 1 and 2 are true."},{"Ar":"A+D=4+3=7؛ العبارة الثالثة صحيحة.","En":"A+D=4+3=7; statement 3 is true."},{"Ar":"المجموع 4+5+2+3=14 وليس 13، فالعبارة الرابعة خاطئة.","En":"The total is 4+5+2+3=14, not 13, so statement 4 is false."}],"Substitution":{"Ar":"$4+5+2+3=14$","En":"$4+5+2+3=14$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"رقم العبارة","En":"Statement number"},"Verification":{"Ar":"5+3=8 و4+2=6، ومن ثم 8+6=14؛ وهذا يؤكد المجموع.","En":"5+3=8 and 4+2=6, so 8+6=14, confirming the total."},"CommonError":{"Ar":"انتبه إلى كلمة غير صحيحة؛ لا تختَر عبارة صحيحة.","En":"Notice the word incorrect; do not choose a true statement."}}}$mw$::jsonb,$mw$قراءة مخطط أحادي الوحدة تعطي أعداد الفئات مباشرة، ثم نتحقق من المقارنات والمجاميع.

$4+5+2+3$

1. B=5 هو الأكبر وC=2 هو الأصغر؛ العبارتان 1 و2 صحيحتان.

2. A+D=4+3=7؛ العبارة الثالثة صحيحة.

3. المجموع 4+5+2+3=14 وليس 13، فالعبارة الرابعة خاطئة.

$4+5+2+3=14$

$4$ رقم العبارة

5+3=8 و4+2=6، ومن ثم 8+6=14؛ وهذا يؤكد المجموع.

انتبه إلى كلمة غير صحيحة؛ لا تختَر عبارة صحيحة.$mw$,$mw$A single-unit pictograph directly gives category counts; then verify comparisons and totals.

$4+5+2+3$

1. B=5 is largest and C=2 smallest; statements 1 and 2 are true.

2. A+D=4+3=7; statement 3 is true.

3. The total is 4+5+2+3=14, not 13, so statement 4 is false.

$4+5+2+3=14$

$4$ Statement number

5+3=8 and 4+2=6, so 8+6=14, confirming the total.

Notice the word incorrect; do not choose a true statement.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد رموز كل نادٍ على حدة.","En":"Count symbols for each club separately."},{"Ar":"اختبر العبارات الأربع، وتذكر أن المطلوب هو الخاطئة.","En":"Check all four statements; the question asks for the false one."}],"Solution":{"Idea":{"Ar":"قراءة مخطط أحادي الوحدة تعطي أعداد الفئات مباشرة، ثم نتحقق من المقارنات والمجاميع.","En":"A single-unit pictograph directly gives category counts; then verify comparisons and totals."},"FormulaLatex":"4+5+2+3","Steps":[{"Ar":"B=5 هو الأكبر وC=2 هو الأصغر؛ العبارتان 1 و2 صحيحتان.","En":"B=5 is largest and C=2 smallest; statements 1 and 2 are true."},{"Ar":"A+D=4+3=7؛ العبارة الثالثة صحيحة.","En":"A+D=4+3=7; statement 3 is true."},{"Ar":"المجموع 4+5+2+3=14 وليس 13، فالعبارة الرابعة خاطئة.","En":"The total is 4+5+2+3=14, not 13, so statement 4 is false."}],"Substitution":{"Ar":"$4+5+2+3=14$","En":"$4+5+2+3=14$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"رقم العبارة","En":"Statement number"},"Verification":{"Ar":"5+3=8 و4+2=6، ومن ثم 8+6=14؛ وهذا يؤكد المجموع.","En":"5+3=8 and 4+2=6, so 8+6=14, confirming the total."},"CommonError":{"Ar":"انتبه إلى كلمة غير صحيحة؛ لا تختَر عبارة صحيحة.","En":"Notice the word incorrect; do not choose a true statement."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"B فيه 5 طلاب وهو الأكبر، فالعبارة صحيحة.","En":"B has five pupils and is largest, so the statement is true."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"C فيه طالبان وهو الأصغر، فالعبارة صحيحة.","En":"C has two pupils and is smallest, so the statement is true."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"A وD معاً 4+3=7؛ العبارة صحيحة.","En":"A and D total 4+3=7; the statement is true."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
CREATE TEMP TABLE before_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE before_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $links$
DECLARE geo int; dat int; s1 int; s2 int; s3 int; s4 int;
BEGIN
 PERFORM 1 FROM "LearningTracks" WHERE "Id" IN(1,2) ORDER BY "Id" FOR UPDATE;
 IF NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=1 AND "StageId"=1 AND "Code"='grade-1' AND "IsPublished" AND "Revision"=29) OR NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=2 AND "StageId"=1 AND "Code"='grade-2' AND "IsPublished" AND "Revision"=30) THEN RAISE EXCEPTION 'Track revision changed'; END IF;
 IF (SELECT free_pair FROM before_track_free WHERE track=1) IS DISTINCT FROM ARRAY[1,81] OR (SELECT free_pair FROM before_track_free WHERE track=2) IS DISTINCT FROM ARRAY[1,81] OR (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=1)<>3 OR (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=2)<>3 THEN RAISE EXCEPTION 'Existing category scope changed'; END IF;
 IF (SELECT count(*) FROM "Categories" WHERE "StageId"=1)<>8 OR EXISTS(SELECT 1 FROM "Categories" WHERE "StageId"=1 AND ("Order">=9 OR "NameEn" IN('Shapes and Spatial Reasoning','Data Representation and Reading'))) OR EXISTS(SELECT 1 FROM "CurriculumSkills" WHERE "StableKey" IN('primary-shape-attributes-composition','primary-shape-attributes-partition','primary-category-count-data','primary-single-unit-picture-data')) THEN RAISE EXCEPTION 'Taxonomy changed'; END IF;
 IF (SELECT count(*) FROM "CurriculumDomains" WHERE ("Id","StableKey") IN ((3,'geometry-measurement'),(4,'statistics-probability')) AND "IsPublished")<>2 THEN RAISE EXCEPTION 'Domain scope changed'; END IF;
 INSERT INTO "Categories"("NameAr","NameEn","Icon","Order","StageId","DescriptionAr","DescriptionEn") VALUES('الأشكال والتفكير المكاني','Shapes and Spatial Reasoning','https://math-world-frontend.vercel.app/category-icons/3.svg',9,1,'خصائص الأشكال المسطحة والمجسمات وتركيبها وتقسيمها إلى أجزاء متساوية، دون حساب المحيط والمساحة أو الزوايا العددية.','Attributes, composition and equal partition of flat and solid shapes; excludes numerical perimeter, area and angle calculations.') RETURNING "Id" INTO geo;
 INSERT INTO "Categories"("NameAr","NameEn","Icon","Order","StageId","DescriptionAr","DescriptionEn") VALUES('تمثيل البيانات وقراءتها','Data Representation and Reading','https://math-world-frontend.vercel.app/category-icons/4.svg',10,1,'تصنيف البيانات البسيطة وقراءة أعداد الفئات والمخططات أحادية الوحدة وتفسيرها، دون المتوسط والوسيط والمنوال والاحتمال.','Classifying simple data and reading category counts and single-unit pictographs; excludes mean, median, mode and probability.') RETURNING "Id" INTO dat;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('primary-shape-attributes-composition',3,1,geo,'خصائص الأشكال وتركيبها','Shape attributes and composition','التعرف على خصائص الأشكال الأساسية وتركيب أشكال مسطحة من قطع متساوية.','Identify basic shape attributes and compose flat shapes from equal pieces.',1,true) RETURNING "Id" INTO s1;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('primary-shape-attributes-partition',3,1,geo,'خصائص المجسمات وتقسيم الأشكال','Solid attributes and shape partition','تمييز الأوجه والرؤوس والحواف وتقسيم المستطيلات إلى مربعات أو أجزاء متساوية.','Distinguish solid faces, vertices and edges; partition rectangles into equal squares or shares.',2,true) RETURNING "Id" INTO s2;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('primary-category-count-data',4,1,dat,'قراءة أعداد الفئات البسيطة','Reading simple category counts','تنظيم وقراءة أعداد حتى ثلاث فئات غير متداخلة والمقارنة بينها وإيجاد المجموع.','Read and organize counts in up to three disjoint categories; compare and total them.',1,true) RETURNING "Id" INTO s3;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('primary-single-unit-picture-data',4,1,dat,'قراءة المخططات الصورية أحادية الوحدة','Reading single-unit pictographs','قراءة وتحديث مخططات صورية أحادية الوحدة حتى أربع فئات وتفسير المقارنات والمجاميع.','Read and update single-unit pictographs with up to four categories; interpret comparisons and totals.',2,true) RETURNING "Id" INTO s4;
 INSERT INTO "LearningTrackCategories"("TrackId","CategoryId") VALUES(1,geo),(1,dat),(2,geo),(2,dat);
 INSERT INTO "LearningTrackSkills"("TrackId","SkillId") VALUES(1,s1),(2,s2),(1,s3),(2,s4);
 UPDATE growth_batch SET skill=CASE skill_key WHEN 'primary-shape-attributes-composition' THEN s1 WHEN 'primary-shape-attributes-partition' THEN s2 WHEN 'primary-category-count-data' THEN s3 WHEN 'primary-single-unit-picture-data' THEN s4 END,category=CASE WHEN skill_key IN('primary-shape-attributes-composition','primary-shape-attributes-partition') THEN geo ELSE dat END;
 UPDATE growth_batch SET wizard=jsonb_set(jsonb_set(wizard,'{CategoryId}',to_jsonb(category)),'{PrimarySkillId}',to_jsonb(skill));
END $links$;
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v30 early geometry/data candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;

CREATE TEMP TABLE after_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE after_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $check$
BEGIN
 IF EXISTS((SELECT * FROM before_track_free EXCEPT SELECT * FROM after_track_free) UNION ALL (SELECT * FROM after_track_free EXCEPT SELECT * FROM before_track_free)) OR EXISTS((SELECT * FROM before_stage_free EXCEPT SELECT * FROM after_stage_free) UNION ALL (SELECT * FROM after_stage_free EXCEPT SELECT * FROM before_stage_free)) THEN RAISE EXCEPTION 'Free entitlement pair changed'; END IF;
 IF (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=1)<>5 OR (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=2)<>5 OR (SELECT count(*) FROM "Categories" WHERE "StageId"=1)<>10 OR EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id" IN(20,21) AND "IsPublished") THEN RAISE EXCEPTION 'Category/visibility count mismatch'; END IF;
 IF EXISTS(SELECT 1 FROM (SELECT track,category,count(*) n FROM growth_batch GROUP BY track,category) b WHERE b.n<>(SELECT count(*) FROM "LearningTrackProblems" lp JOIN "Problems" p ON p."Id"=lp."ProblemId" JOIN "CurriculumProblemSkills" ps ON ps."ProblemId"=p."Id" AND ps."IsPrimary" JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId" JOIN "CurriculumDomains" d ON d."Id"=s."DomainId" WHERE lp."TrackId"=b.track AND p."CategoryId"=b.category AND p."StageId"=1 AND s."StageId"=1 AND s."CategoryId"=b.category AND s."IsPublished" AND d."IsPublished" AND EXISTS(SELECT 1 FROM "LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=s."Id"))) THEN RAISE EXCEPTION 'New category population invalid'; END IF;
END $check$;
COMMIT;
