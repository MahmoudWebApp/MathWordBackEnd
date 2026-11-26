-- One-time owner-authorized v72 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v72-grade-9-similarity-angle-correspondence-from-order-1$mw$,$mw$similarity-angle-correspondence-from-order$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زاوية متناظرة في مثلثين","En":"Corresponding angle in similar triangles"},"Question":{"Ar":"المثلثان $ABC$ و$PQR$ متشابهان، بالترتيب المذكور. إذا كانت زاويتا $A$ و$C$ تساويان 48° و72°، فما قياس الزاوية $Q$ بالدرجات؟","En":"Triangles $ABC$ and $PQR$ are similar in the stated order. Angles $A$ and $C$ are 48° and 72°. What is angle $Q$ in degrees?"},"Options":[{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية P.","En":"This is angle P."}},{"LatexCode":"72","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية R.","En":"This is angle R."}},{"LatexCode":"60","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"120","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الزاويتين المعطاتين.","En":"Adds the given angles."}}],"Hints":[{"Ar":"حدد الرأس المناظر للرأس Q.","En":"Identify the vertex corresponding to Q."},{"Ar":"احسب الزاوية الثالثة من مجموع الزوايا.","En":"Find the third angle using the angle sum."}],"Solution":{"Idea":{"Ar":"زاوية Q تناظر B، ومجموع زوايا المثلث 180 درجة.","En":"Q corresponds to B; triangle angles sum to 180 degrees."},"FormulaLatex":"\\angle B=180^\\circ-48^\\circ-72^\\circ","Steps":[{"Ar":"$\\angle B=60^\\circ$","En":"$\\angle B=60^\\circ$"},{"Ar":"$\\angle Q=\\angle B=60^\\circ$","En":"$\\angle Q=\\angle B=60^\\circ$"}],"Substitution":{"Ar":"$180-120=60$","En":"$180-120=60$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"درجة","En":"degrees"},"Verification":{"Ar":"$48+60+72=180$.","En":"$48+60+72=180$."},"CommonError":{"Ar":"هذه زاوية P.","En":"This is angle P."}}}$mw$::jsonb,$mw$زاوية Q تناظر B، ومجموع زوايا المثلث 180 درجة.

$\angle B=180^\circ-48^\circ-72^\circ$

1. $\angle B=60^\circ$

2. $\angle Q=\angle B=60^\circ$

$180-120=60$

$60$

درجة

$48+60+72=180$.

هذه زاوية P.$mw$,$mw$Q corresponds to B; triangle angles sum to 180 degrees.

$\angle B=180^\circ-48^\circ-72^\circ$

1. $\angle B=60^\circ$

2. $\angle Q=\angle B=60^\circ$

$180-120=60$

$60$

degrees

$48+60+72=180$.

This is angle P.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد الرأس المناظر للرأس Q.","En":"Identify the vertex corresponding to Q."},{"Ar":"احسب الزاوية الثالثة من مجموع الزوايا.","En":"Find the third angle using the angle sum."}],"Solution":{"Idea":{"Ar":"زاوية Q تناظر B، ومجموع زوايا المثلث 180 درجة.","En":"Q corresponds to B; triangle angles sum to 180 degrees."},"FormulaLatex":"\\angle B=180^\\circ-48^\\circ-72^\\circ","Steps":[{"Ar":"$\\angle B=60^\\circ$","En":"$\\angle B=60^\\circ$"},{"Ar":"$\\angle Q=\\angle B=60^\\circ$","En":"$\\angle Q=\\angle B=60^\\circ$"}],"Substitution":{"Ar":"$180-120=60$","En":"$180-120=60$"},"Result":{"Ar":"$60$","En":"$60$"},"Unit":{"Ar":"درجة","En":"degrees"},"Verification":{"Ar":"$48+60+72=180$.","En":"$48+60+72=180$."},"CommonError":{"Ar":"هذه زاوية P.","En":"This is angle P."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية P.","En":"This is angle P."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه زاوية R.","En":"This is angle R."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع الزاويتين المعطاتين.","En":"Adds the given angles."},"Order":4}]}$mw$),
($mw$growth-v72-grade-11-locus-equidistant-two-points-and-horizontal-line-1$mw$,$mw$locus-equidistant-two-points-and-horizontal-line$mw$,$mw$loci$mw$,$mw$grade-11$mw$,11,3,88,330,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":330,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقاطع محل هندسي مع مستقيم","En":"Intersection of a locus and a line"},"Question":{"Ar":"تقع النقطة $P$ على المستقيم $y=3$، وتبعد المسافة نفسها عن $A=(1,0)$ و$B=(5,0)$. ما إحداثيا $P$؟","En":"Point $P$ lies on $y=3$ and is equally distant from $A=(1,0)$ and $B=(5,0)$. Find its coordinates."},"Options":[{"LatexCode":"(3,3)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(3,0)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا تقع على المستقيم المعطى.","En":"Not on the specified line."}},{"LatexCode":"(1,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بعدها عن A أصغر.","En":"Closer to A."}},{"LatexCode":"(5,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بعدها عن B أصغر.","En":"Closer to B."}}],"Hints":[{"Ar":"اكتب مساواة مربعي المسافتين.","En":"Equate the squared distances."},{"Ar":"استعمل قيمة y المعطاة.","En":"Use the given y-coordinate."}],"Solution":{"Idea":{"Ar":"المحل الهندسي للنقاط المتساوية البعد هو المنصف العمودي، ونأخذ تقاطعه مع المستقيم المعطى.","En":"The equidistant locus is the perpendicular bisector; intersect it with the given line."},"FormulaLatex":"(x-1)^2+9=(x-5)^2+9","Steps":[{"Ar":"$8x=24$","En":"$8x=24$"},{"Ar":"$x=3,\\quad y=3$","En":"$x=3,\\quad y=3$"}],"Substitution":{"Ar":"$(x-1)^2+9=(x-5)^2+9$","En":"$(x-1)^2+9=(x-5)^2+9$"},"Result":{"Ar":"$(3,3)$","En":"$(3,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مربع كل من المسافتين عند $(3,3)$ يساوي 13.","En":"Both squared distances at $(3,3)$ equal 13."},"CommonError":{"Ar":"لا تقع على المستقيم المعطى.","En":"Not on the specified line."}}}$mw$::jsonb,$mw$المحل الهندسي للنقاط المتساوية البعد هو المنصف العمودي، ونأخذ تقاطعه مع المستقيم المعطى.

$(x-1)^2+9=(x-5)^2+9$

1. $8x=24$

2. $x=3,\quad y=3$

$(x-1)^2+9=(x-5)^2+9$

$(3,3)$

مربع كل من المسافتين عند $(3,3)$ يساوي 13.

لا تقع على المستقيم المعطى.$mw$,$mw$The equidistant locus is the perpendicular bisector; intersect it with the given line.

$(x-1)^2+9=(x-5)^2+9$

1. $8x=24$

2. $x=3,\quad y=3$

$(x-1)^2+9=(x-5)^2+9$

$(3,3)$

Both squared distances at $(3,3)$ equal 13.

Not on the specified line.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب مساواة مربعي المسافتين.","En":"Equate the squared distances."},{"Ar":"استعمل قيمة y المعطاة.","En":"Use the given y-coordinate."}],"Solution":{"Idea":{"Ar":"المحل الهندسي للنقاط المتساوية البعد هو المنصف العمودي، ونأخذ تقاطعه مع المستقيم المعطى.","En":"The equidistant locus is the perpendicular bisector; intersect it with the given line."},"FormulaLatex":"(x-1)^2+9=(x-5)^2+9","Steps":[{"Ar":"$8x=24$","En":"$8x=24$"},{"Ar":"$x=3,\\quad y=3$","En":"$x=3,\\quad y=3$"}],"Substitution":{"Ar":"$(x-1)^2+9=(x-5)^2+9$","En":"$(x-1)^2+9=(x-5)^2+9$"},"Result":{"Ar":"$(3,3)$","En":"$(3,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مربع كل من المسافتين عند $(3,3)$ يساوي 13.","En":"Both squared distances at $(3,3)$ equal 13."},"CommonError":{"Ar":"لا تقع على المستقيم المعطى.","En":"Not on the specified line."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا تقع على المستقيم المعطى.","En":"Not on the specified line."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"بعدها عن A أصغر.","En":"Closer to A."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"بعدها عن B أصغر.","En":"Closer to B."},"Order":4}]}$mw$),
($mw$growth-v72-grade-2-rectangle-cut-one-corner-new-boundary-1$mw$,$mw$rectangle-cut-one-corner-new-boundary$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قص زاوية من مستطيل","En":"Clipping a rectangle corner"},"Question":{"Ar":"نقص زاوية واحدة من مستطيل بقطعة مستقيمة تصل نقطتين داخل ضلعين متجاورين، ثم نزيل الجزء المثلث الصغير. كم ضلعاً للشكل المتبقي؟","En":"Clip one corner off a rectangle with a straight cut joining interior points of adjacent sides, then remove the small triangle. How many sides remain on the new shape?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد أضلاع القطعة المزالة.","En":"Counts the removed triangle."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يحسب ضلع القص الجديد.","En":"Misses the new cut side."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب ضلع قص إضافياً غير موجود.","En":"Counts an extra cut side."}}],"Hints":[{"Ar":"تخيل المستطيل بعد إزالة ركنه.","En":"Imagine the rectangle without one corner."},{"Ar":"عد الأضلاع القديمة وضلع القص الجديد.","En":"Count the old sides and the new cut side."}],"Solution":{"Idea":{"Ar":"تبقى الأضلاع الأصلية الأربعة، اثنان منها أقصر، ويضاف ضلع القص.","En":"All four original sides remain, two shortened, and the cut adds one side."},"FormulaLatex":"4+1=5","Steps":[{"Ar":"تبقى أربعة أجزاء من الأضلاع القديمة، ويظهر ضلع خامس عند موضع القص.","En":"Four parts of the old sides remain, and a fifth side appears along the cut."}],"Substitution":{"Ar":"$4+1=5$","En":"$4+1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ضلعان كاملان وضلعان أقصر وضلع مائل: خمسة.","En":"Two full sides, two shortened sides and one slanted side: five."},"CommonError":{"Ar":"هذا عدد أضلاع القطعة المزالة.","En":"Counts the removed triangle."}}}$mw$::jsonb,$mw$تبقى الأضلاع الأصلية الأربعة، اثنان منها أقصر، ويضاف ضلع القص.

$4+1=5$

1. تبقى أربعة أجزاء من الأضلاع القديمة، ويظهر ضلع خامس عند موضع القص.

$4+1=5$

$5$

ضلعان كاملان وضلعان أقصر وضلع مائل: خمسة.

هذا عدد أضلاع القطعة المزالة.$mw$,$mw$All four original sides remain, two shortened, and the cut adds one side.

$4+1=5$

1. Four parts of the old sides remain, and a fifth side appears along the cut.

$4+1=5$

$5$

Two full sides, two shortened sides and one slanted side: five.

Counts the removed triangle.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل المستطيل بعد إزالة ركنه.","En":"Imagine the rectangle without one corner."},{"Ar":"عد الأضلاع القديمة وضلع القص الجديد.","En":"Count the old sides and the new cut side."}],"Solution":{"Idea":{"Ar":"تبقى الأضلاع الأصلية الأربعة، اثنان منها أقصر، ويضاف ضلع القص.","En":"All four original sides remain, two shortened, and the cut adds one side."},"FormulaLatex":"4+1=5","Steps":[{"Ar":"تبقى أربعة أجزاء من الأضلاع القديمة، ويظهر ضلع خامس عند موضع القص.","En":"Four parts of the old sides remain, and a fifth side appears along the cut."}],"Substitution":{"Ar":"$4+1=5$","En":"$4+1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ضلعان كاملان وضلعان أقصر وضلع مائل: خمسة.","En":"Two full sides, two shortened sides and one slanted side: five."},"CommonError":{"Ar":"هذا عدد أضلاع القطعة المزالة.","En":"Counts the removed triangle."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد أضلاع القطعة المزالة.","En":"Counts the removed triangle."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لم يحسب ضلع القص الجديد.","En":"Misses the new cut side."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب ضلع قص إضافياً غير موجود.","En":"Counts an extra cut side."},"Order":4}]}$mw$),
($mw$growth-v72-grade-2-cube-corner-three-incident-faces-1$mw$,$mw$cube-corner-three-incident-faces$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الأوجه عند رأس المكعب","En":"Faces meeting at a cube corner"},"Question":{"Ar":"نضع نقطة على رأس واحد من مكعب. كم وجهاً من أوجه المكعب يحتوي على هذا الرأس؟","En":"Mark one vertex of a cube. How many faces of the cube contain this vertex?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد الأوجه الملتقية عند الرأس.","En":"Misses one of the meeting faces."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين حواف الوجه والأوجه عند الرأس.","En":"Confuses face edges with faces at a vertex."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب كل الأوجه، حتى البعيدة عن الرأس.","En":"Counts all faces including those away from the vertex."}}],"Hints":[{"Ar":"تخيل ركناً علوياً أمامياً لمكعب.","En":"Imagine a top front corner of a cube."},{"Ar":"عد الوجه العلوي والأمامي والجانبي عنده.","En":"Count top, front and side faces at that corner."}],"Solution":{"Idea":{"Ar":"عند كل رأس للمكعب يلتقي وجه من كل اتجاه من الاتجاهات الثلاثة.","En":"At each cube vertex one face from each of three directions meets."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"نعد الوجه العلوي والأمامي وأحد الوجهين الجانبيين عند الرأس.","En":"Count the top, front and one side face meeting at the corner."}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"لا يمر أي من الأوجه المقابلة الثلاثة بالرأس المختار.","En":"None of the three opposite faces contains the selected vertex."},"CommonError":{"Ar":"أهمل أحد الأوجه الملتقية عند الرأس.","En":"Misses one of the meeting faces."}}}$mw$::jsonb,$mw$عند كل رأس للمكعب يلتقي وجه من كل اتجاه من الاتجاهات الثلاثة.

$1+1+1=3$

1. نعد الوجه العلوي والأمامي وأحد الوجهين الجانبيين عند الرأس.

$1+1+1=3$

$3$

لا يمر أي من الأوجه المقابلة الثلاثة بالرأس المختار.

أهمل أحد الأوجه الملتقية عند الرأس.$mw$,$mw$At each cube vertex one face from each of three directions meets.

$1+1+1=3$

1. Count the top, front and one side face meeting at the corner.

$1+1+1=3$

$3$

None of the three opposite faces contains the selected vertex.

Misses one of the meeting faces.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل ركناً علوياً أمامياً لمكعب.","En":"Imagine a top front corner of a cube."},{"Ar":"عد الوجه العلوي والأمامي والجانبي عنده.","En":"Count top, front and side faces at that corner."}],"Solution":{"Idea":{"Ar":"عند كل رأس للمكعب يلتقي وجه من كل اتجاه من الاتجاهات الثلاثة.","En":"At each cube vertex one face from each of three directions meets."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"نعد الوجه العلوي والأمامي وأحد الوجهين الجانبيين عند الرأس.","En":"Count the top, front and one side face meeting at the corner."}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"لا يمر أي من الأوجه المقابلة الثلاثة بالرأس المختار.","En":"None of the three opposite faces contains the selected vertex."},"CommonError":{"Ar":"أهمل أحد الأوجه الملتقية عند الرأس.","En":"Misses one of the meeting faces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد الأوجه الملتقية عند الرأس.","En":"Misses one of the meeting faces."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خلط بين حواف الوجه والأوجه عند الرأس.","En":"Confuses face edges with faces at a vertex."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب كل الأوجه، حتى البعيدة عن الرأس.","En":"Counts all faces including those away from the vertex."},"Order":4}]}$mw$),
($mw$growth-v72-grade-1-subtraction-missing-start-from-remainder-1$mw$,$mw$subtraction-missing-start-from-remainder$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"العدد قبل الأخذ","En":"Original count before removal"},"Question":{"Ar":"أخذت ليلى 4 مكعبات من علبة فبقي فيها 8 مكعبات. كم مكعباً كان في العلبة قبل الأخذ؟","En":"Layla took four cubes from a box, leaving eight. How many cubes were in the box before she took any?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح المأخوذ من المتبقي.","En":"Subtracts removed cubes from those remaining."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل المتبقي وحده.","En":"Uses only the remaining count."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف المتبقي بدلاً من إرجاع المأخوذ.","En":"Doubles the remainder instead of restoring what was taken."}}],"Hints":[{"Ar":"ابدأ بعدد المكعبات الباقية.","En":"Start with the remaining cubes."},{"Ar":"أضف المكعبات التي أُخذت.","En":"Add the removed cubes."}],"Solution":{"Idea":{"Ar":"نرجع المكعبات المأخوذة إلى المتبقي لمعرفة العدد الأصلي.","En":"Restore the removed cubes to the remainder to find the original count."},"FormulaLatex":"8+4=12","Steps":[{"Ar":"$12-4=8$","En":"$12-4=8$"}],"Substitution":{"Ar":"$8+4=12$","En":"$8+4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند طرح 4 من 12 يبقى 8 كما في السؤال.","En":"Subtracting four from twelve leaves eight as required."},"CommonError":{"Ar":"طرح المأخوذ من المتبقي.","En":"Subtracts removed cubes from those remaining."}}}$mw$::jsonb,$mw$نرجع المكعبات المأخوذة إلى المتبقي لمعرفة العدد الأصلي.

$8+4=12$

1. $12-4=8$

$8+4=12$

$12$

عند طرح 4 من 12 يبقى 8 كما في السؤال.

طرح المأخوذ من المتبقي.$mw$,$mw$Restore the removed cubes to the remainder to find the original count.

$8+4=12$

1. $12-4=8$

$8+4=12$

$12$

Subtracting four from twelve leaves eight as required.

Subtracts removed cubes from those remaining.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بعدد المكعبات الباقية.","En":"Start with the remaining cubes."},{"Ar":"أضف المكعبات التي أُخذت.","En":"Add the removed cubes."}],"Solution":{"Idea":{"Ar":"نرجع المكعبات المأخوذة إلى المتبقي لمعرفة العدد الأصلي.","En":"Restore the removed cubes to the remainder to find the original count."},"FormulaLatex":"8+4=12","Steps":[{"Ar":"$12-4=8$","En":"$12-4=8$"}],"Substitution":{"Ar":"$8+4=12$","En":"$8+4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند طرح 4 من 12 يبقى 8 كما في السؤال.","En":"Subtracting four from twelve leaves eight as required."},"CommonError":{"Ar":"طرح المأخوذ من المتبقي.","En":"Subtracts removed cubes from those remaining."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح المأخوذ من المتبقي.","En":"Subtracts removed cubes from those remaining."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل المتبقي وحده.","En":"Uses only the remaining count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف المتبقي بدلاً من إرجاع المأخوذ.","En":"Doubles the remainder instead of restoring what was taken."},"Order":4}]}$mw$),
($mw$growth-v72-grade-1-subtraction-same-decrease-preserves-gap-1$mw$,$mw$subtraction-same-decrease-preserves-gap$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق بعد نقصان متساوٍ","En":"Difference after equal removals"},"Question":{"Ar":"مع سارة 15 خرزة ومع نور 9 خرزات. أعطت كل واحدة منهما 3 خرزات لطفل آخر. كم خرزة تزيد سارة على نور الآن؟","En":"Sara has 15 beads and Nour has nine. Each gives three beads to another child. How many more beads does Sara now have than Nour?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح ثلاثة من الفرق رغم نقص المجموعتين بالتساوي.","En":"Subtracts three from the gap despite equal removals."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الفرق بإزالة ثلاث من مجموعة واحدة فقط.","En":"Removes three from only one group."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب عدد خرزات سارة المتبقية وحده.","En":"Uses Sara's remaining count alone."}}],"Hints":[{"Ar":"احسب المتبقي مع كل واحدة.","En":"Find each remaining count."},{"Ar":"اطرح العدد الأصغر من الأكبر.","En":"Subtract the smaller count from the larger."}],"Solution":{"Idea":{"Ar":"عندما تنقص المجموعتان بالمقدار نفسه يبقى الفرق ثابتاً.","En":"When both groups decrease by the same amount, their gap stays unchanged."},"FormulaLatex":"(15-3)-(9-3)","Steps":[{"Ar":"$12-6=6$","En":"$12-6=6$"}],"Substitution":{"Ar":"$(15-3)-(9-3)$","En":"$(15-3)-(9-3)$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كان الفرق $15-9=6$ وبقي 6.","En":"The original difference was six and remains six."},"CommonError":{"Ar":"طرح ثلاثة من الفرق رغم نقص المجموعتين بالتساوي.","En":"Subtracts three from the gap despite equal removals."}}}$mw$::jsonb,$mw$عندما تنقص المجموعتان بالمقدار نفسه يبقى الفرق ثابتاً.

$(15-3)-(9-3)$

1. $12-6=6$

$(15-3)-(9-3)$

$6$

كان الفرق $15-9=6$ وبقي 6.

طرح ثلاثة من الفرق رغم نقص المجموعتين بالتساوي.$mw$,$mw$When both groups decrease by the same amount, their gap stays unchanged.

$(15-3)-(9-3)$

1. $12-6=6$

$(15-3)-(9-3)$

$6$

The original difference was six and remains six.

Subtracts three from the gap despite equal removals.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب المتبقي مع كل واحدة.","En":"Find each remaining count."},{"Ar":"اطرح العدد الأصغر من الأكبر.","En":"Subtract the smaller count from the larger."}],"Solution":{"Idea":{"Ar":"عندما تنقص المجموعتان بالمقدار نفسه يبقى الفرق ثابتاً.","En":"When both groups decrease by the same amount, their gap stays unchanged."},"FormulaLatex":"(15-3)-(9-3)","Steps":[{"Ar":"$12-6=6$","En":"$12-6=6$"}],"Substitution":{"Ar":"$(15-3)-(9-3)$","En":"$(15-3)-(9-3)$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كان الفرق $15-9=6$ وبقي 6.","En":"The original difference was six and remains six."},"CommonError":{"Ar":"طرح ثلاثة من الفرق رغم نقص المجموعتين بالتساوي.","En":"Subtracts three from the gap despite equal removals."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح ثلاثة من الفرق رغم نقص المجموعتين بالتساوي.","En":"Subtracts three from the gap despite equal removals."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الفرق بإزالة ثلاث من مجموعة واحدة فقط.","En":"Removes three from only one group."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب عدد خرزات سارة المتبقية وحده.","En":"Uses Sara's remaining count alone."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v72 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
