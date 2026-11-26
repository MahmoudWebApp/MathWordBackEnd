-- One-time owner-authorized v45 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v45-grade-1-shape-closed-polygon-side-count-match-1$mw$,$mw$shape-closed-polygon-side-count-match$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مطابقة الأضلاع والرؤوس","En":"Matching sides and corners"},"Question":{"Ar":"شكل مغلق مكوّن من خمسة أضلاع مستقيمة، تلتقي الأضلاع عند زواياه فقط. كم رأساً له؟","En":"A closed simple shape has five straight sides meeting only at its corners. How many vertices does it have?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة رؤوس لمثلث.","En":"Three vertices belong to a triangle."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعة لا تكفي لخمسة أضلاع.","En":"Four is too few for five sides."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستة يكرر رأس البداية.","En":"Six counts the starting vertex twice."}}],"Hints":[{"Ar":"ابدأ عند أحد الرؤوس.","En":"Start at one corner."},{"Ar":"لا تعد رأس البداية مرتين.","En":"Do not count the starting corner twice."}],"Solution":{"Idea":{"Ar":"لكل ضلع في المضلع المغلق رأس عند نهايته التالية.","En":"Each side of a simple polygon ends at the next vertex."},"FormulaLatex":"1+1+1+1+1=5","Steps":[{"Ar":"نتتبع حدود الشكل مرة واحدة ونعد كل رأس مرة واحدة.","En":"Follow the boundary once, counting each vertex once."},{"Ar":"$5=5$","En":"$5=5$"}],"Substitution":{"Ar":"$5=5$","En":"$5=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"خمسة أضلاع متتابعة تعطي خمسة رؤوس.","En":"Five successive sides give five vertices."},"CommonError":{"Ar":"ثلاثة رؤوس لمثلث.","En":"Three vertices belong to a triangle."}}}$mw$::jsonb,$mw$لكل ضلع في المضلع المغلق رأس عند نهايته التالية.

$1+1+1+1+1=5$

1. نتتبع حدود الشكل مرة واحدة ونعد كل رأس مرة واحدة.

2. $5=5$

$5=5$

$5$

خمسة أضلاع متتابعة تعطي خمسة رؤوس.

ثلاثة رؤوس لمثلث.$mw$,$mw$Each side of a simple polygon ends at the next vertex.

$1+1+1+1+1=5$

1. Follow the boundary once, counting each vertex once.

2. $5=5$

$5=5$

$5$

Five successive sides give five vertices.

Three vertices belong to a triangle.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابدأ عند أحد الرؤوس.","En":"Start at one corner."},{"Ar":"لا تعد رأس البداية مرتين.","En":"Do not count the starting corner twice."}],"Solution":{"Idea":{"Ar":"لكل ضلع في المضلع المغلق رأس عند نهايته التالية.","En":"Each side of a simple polygon ends at the next vertex."},"FormulaLatex":"1+1+1+1+1=5","Steps":[{"Ar":"نتتبع حدود الشكل مرة واحدة ونعد كل رأس مرة واحدة.","En":"Follow the boundary once, counting each vertex once."},{"Ar":"$5=5$","En":"$5=5$"}],"Substitution":{"Ar":"$5=5$","En":"$5=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"خمسة أضلاع متتابعة تعطي خمسة رؤوس.","En":"Five successive sides give five vertices."},"CommonError":{"Ar":"ثلاثة رؤوس لمثلث.","En":"Three vertices belong to a triangle."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة رؤوس لمثلث.","En":"Three vertices belong to a triangle."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أربعة لا تكفي لخمسة أضلاع.","En":"Four is too few for five sides."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ستة يكرر رأس البداية.","En":"Six counts the starting vertex twice."},"Order":4}]}$mw$),
($mw$growth-v45-grade-1-category-count-compare-with-fixed-target-1$mw$,$mw$category-count-compare-with-fixed-target$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قراءة الأعداد وفق شرط","En":"Reading counts with a condition"},"Question":{"Ar":"اختار 2 من الأطفال الرسم و6 القراءة و4 اللعب و5 الغناء. كم نشاطاً اختاره أكثر من ثلاثة أطفال؟","En":"Two children chose drawing, six reading, four playing and five singing. How many activities were chosen by more than three children?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل نشاطين مؤهلين.","En":"Misses two qualifying activities."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل نشاطاً مؤهلاً.","En":"Misses one qualifying activity."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضم الرسم رغم أن عدده اثنان.","En":"Includes drawing although its count is two."}}],"Hints":[{"Ar":"قارن عدد كل نشاط بثلاثة.","En":"Compare each count with three."},{"Ar":"عد الأنشطة التي تحقق الشرط.","En":"Count qualifying activities."}],"Solution":{"Idea":{"Ar":"نعد الفئات التي يزيد عددها على ثلاثة، وليس الأطفال أنفسهم.","En":"Count categories whose counts exceed three, not individual children."},"FormulaLatex":"6>3,\\quad4>3,\\quad5>3","Steps":[{"Ar":"القراءة واللعب والغناء تحقق الشرط.","En":"Reading, playing and singing meet the condition."},{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الرسم وحده لا يحقق الشرط.","En":"Only drawing fails the condition."},"CommonError":{"Ar":"يهمل نشاطين مؤهلين.","En":"Misses two qualifying activities."}}}$mw$::jsonb,$mw$نعد الفئات التي يزيد عددها على ثلاثة، وليس الأطفال أنفسهم.

$6>3,\quad4>3,\quad5>3$

1. القراءة واللعب والغناء تحقق الشرط.

2. $1+1+1=3$

$1+1+1=3$

$3$

الرسم وحده لا يحقق الشرط.

يهمل نشاطين مؤهلين.$mw$,$mw$Count categories whose counts exceed three, not individual children.

$6>3,\quad4>3,\quad5>3$

1. Reading, playing and singing meet the condition.

2. $1+1+1=3$

$1+1+1=3$

$3$

Only drawing fails the condition.

Misses two qualifying activities.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قارن عدد كل نشاط بثلاثة.","En":"Compare each count with three."},{"Ar":"عد الأنشطة التي تحقق الشرط.","En":"Count qualifying activities."}],"Solution":{"Idea":{"Ar":"نعد الفئات التي يزيد عددها على ثلاثة، وليس الأطفال أنفسهم.","En":"Count categories whose counts exceed three, not individual children."},"FormulaLatex":"6>3,\\quad4>3,\\quad5>3","Steps":[{"Ar":"القراءة واللعب والغناء تحقق الشرط.","En":"Reading, playing and singing meet the condition."},{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الرسم وحده لا يحقق الشرط.","En":"Only drawing fails the condition."},"CommonError":{"Ar":"يهمل نشاطين مؤهلين.","En":"Misses two qualifying activities."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يهمل نشاطين مؤهلين.","En":"Misses two qualifying activities."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يهمل نشاطاً مؤهلاً.","En":"Misses one qualifying activity."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يضم الرسم رغم أن عدده اثنان.","En":"Includes drawing although its count is two."},"Order":4}]}$mw$),
($mw$growth-v45-grade-2-rectangular-box-face-opposite-pairs-1$mw$,$mw$rectangular-box-face-opposite-pairs$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أزواج أوجه صندوق","En":"Pairs of box faces"},"Question":{"Ar":"لصندوق مستطيل ستة أوجه مستوية، كل وجه له وجه مقابل واحد. كم زوجاً مختلفاً من الأوجه المتقابلة يوجد؟","En":"A rectangular box has six flat faces, and each face has exactly one opposite face. How many distinct pairs of opposite faces are there?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زوجان يغطيان أربعة أوجه.","En":"Two pairs cover four faces."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستة عدد الأوجه لا الأزواج.","En":"Six counts faces, not pairs."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اثنا عشر عدد أحرف الصندوق.","En":"Twelve counts the box's edges."}}],"Hints":[{"Ar":"كم وجه في كل زوج؟","En":"How many faces are in each pair?"},{"Ar":"قسّم الأوجه الستة إلى أزواج.","En":"Split six faces into pairs."}],"Solution":{"Idea":{"Ar":"كل زوج يضم وجهين، وكل وجه يدخل في زوج واحد.","En":"Each pair contains two faces and each face belongs to one pair."},"FormulaLatex":"6/2=3","Steps":[{"Ar":"نضم كل وجه إلى مقابله دون تكرار.","En":"Pair each face with its opposite without repetition."},{"Ar":"$6/2=3$","En":"$6/2=3$"}],"Substitution":{"Ar":"$6/2=3$","En":"$6/2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot2=6$","En":"$3\\cdot2=6$"},"CommonError":{"Ar":"زوجان يغطيان أربعة أوجه.","En":"Two pairs cover four faces."}}}$mw$::jsonb,$mw$كل زوج يضم وجهين، وكل وجه يدخل في زوج واحد.

$6/2=3$

1. نضم كل وجه إلى مقابله دون تكرار.

2. $6/2=3$

$6/2=3$

$3$

$3\cdot2=6$

زوجان يغطيان أربعة أوجه.$mw$,$mw$Each pair contains two faces and each face belongs to one pair.

$6/2=3$

1. Pair each face with its opposite without repetition.

2. $6/2=3$

$6/2=3$

$3$

$3\cdot2=6$

Two pairs cover four faces.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم وجه في كل زوج؟","En":"How many faces are in each pair?"},{"Ar":"قسّم الأوجه الستة إلى أزواج.","En":"Split six faces into pairs."}],"Solution":{"Idea":{"Ar":"كل زوج يضم وجهين، وكل وجه يدخل في زوج واحد.","En":"Each pair contains two faces and each face belongs to one pair."},"FormulaLatex":"6/2=3","Steps":[{"Ar":"نضم كل وجه إلى مقابله دون تكرار.","En":"Pair each face with its opposite without repetition."},{"Ar":"$6/2=3$","En":"$6/2=3$"}],"Substitution":{"Ar":"$6/2=3$","En":"$6/2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot2=6$","En":"$3\\cdot2=6$"},"CommonError":{"Ar":"زوجان يغطيان أربعة أوجه.","En":"Two pairs cover four faces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"زوجان يغطيان أربعة أوجه.","En":"Two pairs cover four faces."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ستة عدد الأوجه لا الأزواج.","En":"Six counts faces, not pairs."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"اثنا عشر عدد أحرف الصندوق.","En":"Twelve counts the box's edges."},"Order":4}]}$mw$),
($mw$growth-v45-grade-2-pictograph-compare-two-days-one-category-1$mw$,$mw$pictograph-compare-two-days-one-category$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مقارنة سجلين مصورين","En":"Comparing two pictographs"},"Question":{"Ar":"كل ● يمثل كتاباً واحداً. يوم الاثنين: A: ●●●، B: ●●●●. يوم الثلاثاء: A: ●●●●●، B: ●●. أي رف زاد عدد كتبه، وبكم؟ A: الرف A، كتابان؛ B: الرف B، كتابان؛ C: الرف A، خمسة كتب؛ D: الرف B، أربعة كتب.","En":"Each ● represents one book. Monday: A: ●●●, B: ●●●●. Tuesday: A: ●●●●●, B: ●●. Which shelf gained books, and how many? A: shelf A, 2; B: shelf B, 2; C: shelf A, 5; D: shelf B, 4."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"B نقص بمقدار اثنين.","En":"B lost two books."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة العدد النهائي لا الزيادة.","En":"Five is the final count, not the increase."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعة عدد B في اليوم الأول.","En":"Four is B's first-day count."}}],"Hints":[{"Ar":"قارن الرف نفسه في اليومين.","En":"Compare the same shelf on both days."},{"Ar":"احسب الزيادة لا العدد النهائي.","En":"Find the increase, not the final count."}],"Solution":{"Idea":{"Ar":"نقارن عدد كل رف في اليومين.","En":"Compare each shelf's count across the two days."},"FormulaLatex":"5-3=2","Steps":[{"Ar":"زاد A من ثلاثة إلى خمسة، بينما نقص B من أربعة إلى اثنين.","En":"A rose from three to five while B fell from four to two."},{"Ar":"$5-3=2$","En":"$5-3=2$"}],"Substitution":{"Ar":"$5-3=2$","En":"$5-3=2$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+2=5$","En":"$3+2=5$"},"CommonError":{"Ar":"B نقص بمقدار اثنين.","En":"B lost two books."}}}$mw$::jsonb,$mw$نقارن عدد كل رف في اليومين.

$5-3=2$

1. زاد A من ثلاثة إلى خمسة، بينما نقص B من أربعة إلى اثنين.

2. $5-3=2$

$5-3=2$

$A$

$3+2=5$

B نقص بمقدار اثنين.$mw$,$mw$Compare each shelf's count across the two days.

$5-3=2$

1. A rose from three to five while B fell from four to two.

2. $5-3=2$

$5-3=2$

$A$

$3+2=5$

B lost two books.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قارن الرف نفسه في اليومين.","En":"Compare the same shelf on both days."},{"Ar":"احسب الزيادة لا العدد النهائي.","En":"Find the increase, not the final count."}],"Solution":{"Idea":{"Ar":"نقارن عدد كل رف في اليومين.","En":"Compare each shelf's count across the two days."},"FormulaLatex":"5-3=2","Steps":[{"Ar":"زاد A من ثلاثة إلى خمسة، بينما نقص B من أربعة إلى اثنين.","En":"A rose from three to five while B fell from four to two."},{"Ar":"$5-3=2$","En":"$5-3=2$"}],"Substitution":{"Ar":"$5-3=2$","En":"$5-3=2$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+2=5$","En":"$3+2=5$"},"CommonError":{"Ar":"B نقص بمقدار اثنين.","En":"B lost two books."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"B نقص بمقدار اثنين.","En":"B lost two books."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خمسة العدد النهائي لا الزيادة.","En":"Five is the final count, not the increase."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أربعة عدد B في اليوم الأول.","En":"Four is B's first-day count."},"Order":4}]}$mw$),
($mw$growth-v45-grade-4-one-step-equation-zero-product-nonzero-factor-1$mw$,$mw$one-step-equation-zero-product-nonzero-factor$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة حاصلها صفر","En":"Equation with zero product"},"Question":{"Ar":"ما العدد n الذي يحقق 8n=0؟","En":"Which number n satisfies 8n=0?"},"Options":[{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8×1=8.","En":"8×1=8."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8×8=64.","En":"8×8=64."}},{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8×80=640.","En":"8×80=640."}}],"Hints":[{"Ar":"اقسم الطرفين على ثمانية.","En":"Divide both sides by eight."},{"Ar":"ما حاصل قسمة الصفر على عدد غير صفري؟","En":"What is zero divided by a nonzero number?"}],"Solution":{"Idea":{"Ar":"حاصل ضرب عدد غير صفري في عدد آخر يساوي صفراً فقط إذا كان العدد الآخر صفراً.","En":"A nonzero factor times another number is zero only if the other number is zero."},"FormulaLatex":"n=0/8","Steps":[{"Ar":"$n=0$","En":"$n=0$"},{"Ar":"ثمانية غير صفري، لذا القسمة عليه ممكنة.","En":"Eight is nonzero, so dividing by it is valid."}],"Substitution":{"Ar":"ثمانية غير صفري، لذا القسمة عليه ممكنة.","En":"Eight is nonzero, so dividing by it is valid."},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot0=0$","En":"$8\\cdot0=0$"},"CommonError":{"Ar":"8×1=8.","En":"8×1=8."}}}$mw$::jsonb,$mw$حاصل ضرب عدد غير صفري في عدد آخر يساوي صفراً فقط إذا كان العدد الآخر صفراً.

$n=0/8$

1. $n=0$

2. ثمانية غير صفري، لذا القسمة عليه ممكنة.

ثمانية غير صفري، لذا القسمة عليه ممكنة.

$0$

$8\cdot0=0$

8×1=8.$mw$,$mw$A nonzero factor times another number is zero only if the other number is zero.

$n=0/8$

1. $n=0$

2. Eight is nonzero, so dividing by it is valid.

Eight is nonzero, so dividing by it is valid.

$0$

$8\cdot0=0$

8×1=8.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم الطرفين على ثمانية.","En":"Divide both sides by eight."},{"Ar":"ما حاصل قسمة الصفر على عدد غير صفري؟","En":"What is zero divided by a nonzero number?"}],"Solution":{"Idea":{"Ar":"حاصل ضرب عدد غير صفري في عدد آخر يساوي صفراً فقط إذا كان العدد الآخر صفراً.","En":"A nonzero factor times another number is zero only if the other number is zero."},"FormulaLatex":"n=0/8","Steps":[{"Ar":"$n=0$","En":"$n=0$"},{"Ar":"ثمانية غير صفري، لذا القسمة عليه ممكنة.","En":"Eight is nonzero, so dividing by it is valid."}],"Substitution":{"Ar":"ثمانية غير صفري، لذا القسمة عليه ممكنة.","En":"Eight is nonzero, so dividing by it is valid."},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot0=0$","En":"$8\\cdot0=0$"},"CommonError":{"Ar":"8×1=8.","En":"8×1=8."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8×1=8.","En":"8×1=8."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8×8=64.","En":"8×8=64."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8×80=640.","En":"8×80=640."},"Order":4}]}$mw$),
($mw$growth-v45-grade-5-estimate-rounding-sum-max-error-two-terms-1$mw$,$mw$estimate-rounding-sum-max-error-two-terms$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حد خطأ التقريب","En":"Bounding rounding error"},"Question":{"Ar":"قُرّب عددان صحيحان إلى أقرب عشرة مع تقريب المنتصف للأعلى. ما أكبر مقدار ممكن لخطأ مجموع العددين المقربين مقارنة بالمجموع الحقيقي؟","En":"Two integers are rounded to the nearest ten, with halfway cases rounded up. What is the largest possible absolute error of their rounded sum compared with the exact sum?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أصغر من خطأ عدد واحد عند المنتصف.","En":"Less than a single halfway rounding error."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حد الخطأ لعدد واحد فقط.","En":"Bounds only one rounding error."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يشمل حالة عددين ينتهيان بخمسة.","En":"Misses the case where both numbers end in five."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ما أكبر خطأ لتقريب عدد واحد؟","En":"What is the greatest error for one rounded integer?"},{"Ar":"يمكن أن يقع الخطآن في الاتجاه نفسه.","En":"Both errors can point in the same direction."}],"Solution":{"Idea":{"Ar":"خطأ كل تقريب لا يتجاوز خمسة، ويمكن أن يكون الخطآن موجبين بمقدار خمسة لكل منهما.","En":"Each rounding error is at most five in magnitude; both can be positive five."},"FormulaLatex":"|e_1+e_2|\\le5+5=10","Steps":[{"Ar":"مثلاً 15 و25 يُقربان إلى 20 و30.","En":"For example, 15 and 25 round to 20 and 30."},{"Ar":"$(20+30)-(15+25)=10$","En":"$(20+30)-(15+25)=10$"}],"Substitution":{"Ar":"$(20+30)-(15+25)=10$","En":"$(20+30)-(15+25)=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50-40=10$","En":"$50-40=10$"},"CommonError":{"Ar":"أصغر من خطأ عدد واحد عند المنتصف.","En":"Less than a single halfway rounding error."}}}$mw$::jsonb,$mw$خطأ كل تقريب لا يتجاوز خمسة، ويمكن أن يكون الخطآن موجبين بمقدار خمسة لكل منهما.

$|e_1+e_2|\le5+5=10$

1. مثلاً 15 و25 يُقربان إلى 20 و30.

2. $(20+30)-(15+25)=10$

$(20+30)-(15+25)=10$

$10$

$50-40=10$

أصغر من خطأ عدد واحد عند المنتصف.$mw$,$mw$Each rounding error is at most five in magnitude; both can be positive five.

$|e_1+e_2|\le5+5=10$

1. For example, 15 and 25 round to 20 and 30.

2. $(20+30)-(15+25)=10$

$(20+30)-(15+25)=10$

$10$

$50-40=10$

Less than a single halfway rounding error.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما أكبر خطأ لتقريب عدد واحد؟","En":"What is the greatest error for one rounded integer?"},{"Ar":"يمكن أن يقع الخطآن في الاتجاه نفسه.","En":"Both errors can point in the same direction."}],"Solution":{"Idea":{"Ar":"خطأ كل تقريب لا يتجاوز خمسة، ويمكن أن يكون الخطآن موجبين بمقدار خمسة لكل منهما.","En":"Each rounding error is at most five in magnitude; both can be positive five."},"FormulaLatex":"|e_1+e_2|\\le5+5=10","Steps":[{"Ar":"مثلاً 15 و25 يُقربان إلى 20 و30.","En":"For example, 15 and 25 round to 20 and 30."},{"Ar":"$(20+30)-(15+25)=10$","En":"$(20+30)-(15+25)=10$"}],"Substitution":{"Ar":"$(20+30)-(15+25)=10$","En":"$(20+30)-(15+25)=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50-40=10$","En":"$50-40=10$"},"CommonError":{"Ar":"أصغر من خطأ عدد واحد عند المنتصف.","En":"Less than a single halfway rounding error."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أصغر من خطأ عدد واحد عند المنتصف.","En":"Less than a single halfway rounding error."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حد الخطأ لعدد واحد فقط.","En":"Bounds only one rounding error."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يشمل حالة عددين ينتهيان بخمسة.","En":"Misses the case where both numbers end in five."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v45-grade-6-median-even-list-two-middle-average-1$mw$,$mw$median-even-list-two-middle-average$mw$,$mw$primary-median$mw$,$mw$grade-6$mw$,6,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"وسيط قائمة زوجية","En":"Median of an even-sized list"},"Question":{"Ar":"أربع قراءات غير مرتبة: 14، 3، 8، 5. ما وسيطها؟","En":"Four unordered readings are 14, 3, 8, 5. What is their median?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 إحدى القيمتين الوسطيتين فقط.","En":"Five is only one middle value."}},{"LatexCode":"6.5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7.5 ليس متوسط 5 و8.","En":"7.5 is not the average of five and eight."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 القيمة الوسطى الأخرى فقط.","En":"Eight is only the other middle value."}}],"Hints":[{"Ar":"رتب القيم تصاعدياً.","En":"Sort the values in increasing order."},{"Ar":"اجمع القيمتين الثانية والثالثة واقسم على اثنين.","En":"Average the second and third observations."}],"Solution":{"Idea":{"Ar":"نرتب القيم ونحسب متوسط القيمتين الوسطيتين لأن العدد زوجي.","En":"Sort the values and average the middle two because the count is even."},"FormulaLatex":"M=(5+8)/2","Steps":[{"Ar":"الترتيب هو 3،5،8،14.","En":"The order is 3,5,8,14."},{"Ar":"$13/2=6.5$","En":"$13/2=6.5$"}],"Substitution":{"Ar":"$13/2=6.5$","En":"$13/2=6.5$"},"Result":{"Ar":"$6.5$","En":"$6.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6.5-5=8-6.5=1.5$","En":"$6.5-5=8-6.5=1.5$"},"CommonError":{"Ar":"5 إحدى القيمتين الوسطيتين فقط.","En":"Five is only one middle value."}}}$mw$::jsonb,$mw$نرتب القيم ونحسب متوسط القيمتين الوسطيتين لأن العدد زوجي.

$M=(5+8)/2$

1. الترتيب هو 3،5،8،14.

2. $13/2=6.5$

$13/2=6.5$

$6.5$

$6.5-5=8-6.5=1.5$

5 إحدى القيمتين الوسطيتين فقط.$mw$,$mw$Sort the values and average the middle two because the count is even.

$M=(5+8)/2$

1. The order is 3,5,8,14.

2. $13/2=6.5$

$13/2=6.5$

$6.5$

$6.5-5=8-6.5=1.5$

Five is only one middle value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"رتب القيم تصاعدياً.","En":"Sort the values in increasing order."},{"Ar":"اجمع القيمتين الثانية والثالثة واقسم على اثنين.","En":"Average the second and third observations."}],"Solution":{"Idea":{"Ar":"نرتب القيم ونحسب متوسط القيمتين الوسطيتين لأن العدد زوجي.","En":"Sort the values and average the middle two because the count is even."},"FormulaLatex":"M=(5+8)/2","Steps":[{"Ar":"الترتيب هو 3،5،8،14.","En":"The order is 3,5,8,14."},{"Ar":"$13/2=6.5$","En":"$13/2=6.5$"}],"Substitution":{"Ar":"$13/2=6.5$","En":"$13/2=6.5$"},"Result":{"Ar":"$6.5$","En":"$6.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6.5-5=8-6.5=1.5$","En":"$6.5-5=8-6.5=1.5$"},"CommonError":{"Ar":"5 إحدى القيمتين الوسطيتين فقط.","En":"Five is only one middle value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 إحدى القيمتين الوسطيتين فقط.","En":"Five is only one middle value."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"7.5 ليس متوسط 5 و8.","En":"7.5 is not the average of five and eight."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 القيمة الوسطى الأخرى فقط.","En":"Eight is only the other middle value."},"Order":4}]}$mw$),
($mw$growth-v45-grade-8-inequality-negative-distribution-sign-balance-1$mw$,$mw$inequality-negative-distribution-sign-balance$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-8$mw$,8,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار تكافؤ متراجحتين","En":"Testing inequality equivalence"},"Question":{"Ar":"أي متراجحة تنتج عند ضرب طرفي $2x-3\\le7$ في −2 مباشرة؟","En":"Which inequality follows immediately from multiplying both sides of $2x-3\\le7$ by −2?"},"Options":[{"LatexCode":"-4x+6\\le-14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يعكس اتجاه المتراجحة.","En":"Fails to reverse the inequality."}},{"LatexCode":"-4x-6\\ge-14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حاصل ضرب سالبين موجب.","En":"The product of two negatives is positive."}},{"LatexCode":"-4x+6\\ge-14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4x-6\\ge14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يطبق العامل السالب على الحدود.","En":"Fails to apply the negative factor."}}],"Hints":[{"Ar":"اضرب كل حد في −2.","En":"Multiply every term by −2."},{"Ar":"اعكس اتجاه المقارنة بسبب الضرب بسالب.","En":"Reverse the comparison when multiplying by a negative."}],"Solution":{"Idea":{"Ar":"نوزع العامل السالب على كل حد ونعكس اتجاه المتراجحة.","En":"Distribute the negative factor over every term and reverse the inequality."},"FormulaLatex":"-2(2x-3)\\ge-2(7)","Steps":[{"Ar":"$-2(2x)=-4x$","En":"$-2(2x)=-4x$"},{"Ar":"$(-2)(-3)=6$","En":"$(-2)(-3)=6$"},{"Ar":"$-4x+6\\ge-14$","En":"$-4x+6\\ge-14$"}],"Substitution":{"Ar":"$-4x+6\\ge-14$","En":"$-4x+6\\ge-14$"},"Result":{"Ar":"$-4x+6\\ge-14$","En":"$-4x+6\\ge-14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x=5:\\ -20+6=-14$","En":"$x=5:\\ -20+6=-14$"},"CommonError":{"Ar":"لم يعكس اتجاه المتراجحة.","En":"Fails to reverse the inequality."}}}$mw$::jsonb,$mw$نوزع العامل السالب على كل حد ونعكس اتجاه المتراجحة.

$-2(2x-3)\ge-2(7)$

1. $-2(2x)=-4x$

2. $(-2)(-3)=6$

3. $-4x+6\ge-14$

$-4x+6\ge-14$

$-4x+6\ge-14$

$x=5:\ -20+6=-14$

لم يعكس اتجاه المتراجحة.$mw$,$mw$Distribute the negative factor over every term and reverse the inequality.

$-2(2x-3)\ge-2(7)$

1. $-2(2x)=-4x$

2. $(-2)(-3)=6$

3. $-4x+6\ge-14$

$-4x+6\ge-14$

$-4x+6\ge-14$

$x=5:\ -20+6=-14$

Fails to reverse the inequality.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اضرب كل حد في −2.","En":"Multiply every term by −2."},{"Ar":"اعكس اتجاه المقارنة بسبب الضرب بسالب.","En":"Reverse the comparison when multiplying by a negative."}],"Solution":{"Idea":{"Ar":"نوزع العامل السالب على كل حد ونعكس اتجاه المتراجحة.","En":"Distribute the negative factor over every term and reverse the inequality."},"FormulaLatex":"-2(2x-3)\\ge-2(7)","Steps":[{"Ar":"$-2(2x)=-4x$","En":"$-2(2x)=-4x$"},{"Ar":"$(-2)(-3)=6$","En":"$(-2)(-3)=6$"},{"Ar":"$-4x+6\\ge-14$","En":"$-4x+6\\ge-14$"}],"Substitution":{"Ar":"$-4x+6\\ge-14$","En":"$-4x+6\\ge-14$"},"Result":{"Ar":"$-4x+6\\ge-14$","En":"$-4x+6\\ge-14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x=5:\\ -20+6=-14$","En":"$x=5:\\ -20+6=-14$"},"CommonError":{"Ar":"لم يعكس اتجاه المتراجحة.","En":"Fails to reverse the inequality."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يعكس اتجاه المتراجحة.","En":"Fails to reverse the inequality."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حاصل ضرب سالبين موجب.","En":"The product of two negatives is positive."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لم يطبق العامل السالب على الحدود.","En":"Fails to apply the negative factor."},"Order":4}]}$mw$),
($mw$growth-v45-grade-8-experimental-frequency-zero-observed-not-impossible-1$mw$,$mw$experimental-frequency-zero-observed-not-impossible$mw$,$mw$frequency$mw$,$mw$grade-8$mw$,8,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تفسير غياب نتيجة في التجربة","En":"Interpreting an unobserved outcome"},"Question":{"Ar":"أُجريت 20 تجربة ولم يظهر الحدث A في أي منها. ما التكرار النسبي المشاهد له؟","En":"In 20 trials, event A never occurred. What is its observed relative frequency?"},"Options":[{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac1{20}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض حدوثاً واحداً.","En":"Assumes one occurrence."}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض عشرة حدوثات.","En":"Assumes ten occurrences."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض حدوثه في جميع التجارب.","En":"Assumes occurrence in all trials."}}],"Hints":[{"Ar":"كم مرة ظهر الحدث؟","En":"How often did the event occur?"},{"Ar":"اقسم ذلك العدد على 20.","En":"Divide that count by twenty."}],"Solution":{"Idea":{"Ar":"التكرار النسبي المشاهد هو عدد مرات الحدوث مقسوماً على عدد التجارب؛ الصفر المشاهد لا يثبت الاستحالة.","En":"Observed relative frequency is the observed count divided by trials; an observed zero does not prove impossibility."},"FormulaLatex":"f=0/20","Steps":[{"Ar":"عدد مرات الحدوث صفر وعدد التجارب 20.","En":"The occurrence count is zero and trial count is 20."},{"Ar":"$0/20=0$","En":"$0/20=0$"}],"Substitution":{"Ar":"$0/20=0$","En":"$0/20=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$20\\cdot0=0$","En":"$20\\cdot0=0$"},"CommonError":{"Ar":"يفترض حدوثاً واحداً.","En":"Assumes one occurrence."}}}$mw$::jsonb,$mw$التكرار النسبي المشاهد هو عدد مرات الحدوث مقسوماً على عدد التجارب؛ الصفر المشاهد لا يثبت الاستحالة.

$f=0/20$

1. عدد مرات الحدوث صفر وعدد التجارب 20.

2. $0/20=0$

$0/20=0$

$0$

$20\cdot0=0$

يفترض حدوثاً واحداً.$mw$,$mw$Observed relative frequency is the observed count divided by trials; an observed zero does not prove impossibility.

$f=0/20$

1. The occurrence count is zero and trial count is 20.

2. $0/20=0$

$0/20=0$

$0$

$20\cdot0=0$

Assumes one occurrence.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم مرة ظهر الحدث؟","En":"How often did the event occur?"},{"Ar":"اقسم ذلك العدد على 20.","En":"Divide that count by twenty."}],"Solution":{"Idea":{"Ar":"التكرار النسبي المشاهد هو عدد مرات الحدوث مقسوماً على عدد التجارب؛ الصفر المشاهد لا يثبت الاستحالة.","En":"Observed relative frequency is the observed count divided by trials; an observed zero does not prove impossibility."},"FormulaLatex":"f=0/20","Steps":[{"Ar":"عدد مرات الحدوث صفر وعدد التجارب 20.","En":"The occurrence count is zero and trial count is 20."},{"Ar":"$0/20=0$","En":"$0/20=0$"}],"Substitution":{"Ar":"$0/20=0$","En":"$0/20=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$20\\cdot0=0$","En":"$20\\cdot0=0$"},"CommonError":{"Ar":"يفترض حدوثاً واحداً.","En":"Assumes one occurrence."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يفترض حدوثاً واحداً.","En":"Assumes one occurrence."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يفترض عشرة حدوثات.","En":"Assumes ten occurrences."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يفترض حدوثه في جميع التجارب.","En":"Assumes occurrence in all trials."},"Order":4}]}$mw$),
($mw$growth-v45-grade-11-trig-square-identity-domain-range-bound-1$mw$,$mw$trig-square-identity-domain-range-bound$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-11$mw$,11,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حدود تعبير مثلثي","En":"Bounds of a trigonometric expression"},"Question":{"Ar":"ما أكبر قيمة ممكنة للتعبير $3\\sin^2\\theta+3\\cos^2\\theta+\\sin^2\\theta$ عندما تكون θ زاوية حقيقية؟","En":"What is the greatest possible value of $3\\sin^2\\theta+3\\cos^2\\theta+\\sin^2\\theta$ for real θ?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل الثابت 3.","En":"Omits the constant three."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة الصغرى.","En":"This is the minimum."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمكن أن يبلغ المربعان واحداً معاً.","En":"Both squares cannot equal one simultaneously."}}],"Hints":[{"Ar":"استعمل أن مجموع مربعي الجيب وجيب التمام واحد.","En":"Use that sine squared plus cosine squared is one."},{"Ar":"ما أكبر قيمة لمربع الجيب؟","En":"What is the maximum of sine squared?"}],"Solution":{"Idea":{"Ar":"نجمع الحدين ذوي المعامل المشترك ثم نستخدم مجال مربع الجيب.","En":"Combine the terms with a common coefficient, then use the range of sine squared."},"FormulaLatex":"3(\\sin^2\\theta+\\cos^2\\theta)+\\sin^2\\theta=3+\\sin^2\\theta","Steps":[{"Ar":"$0\\le\\sin^2\\theta\\le1$","En":"$0\\le\\sin^2\\theta\\le1$"},{"Ar":"$3+1=4$","En":"$3+1=4$"}],"Substitution":{"Ar":"$3+1=4$","En":"$3+1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=90^\\circ:\\ 3+1=4$","En":"$\\theta=90^\\circ:\\ 3+1=4$"},"CommonError":{"Ar":"يهمل الثابت 3.","En":"Omits the constant three."}}}$mw$::jsonb,$mw$نجمع الحدين ذوي المعامل المشترك ثم نستخدم مجال مربع الجيب.

$3(\sin^2\theta+\cos^2\theta)+\sin^2\theta=3+\sin^2\theta$

1. $0\le\sin^2\theta\le1$

2. $3+1=4$

$3+1=4$

$4$

$\theta=90^\circ:\ 3+1=4$

يهمل الثابت 3.$mw$,$mw$Combine the terms with a common coefficient, then use the range of sine squared.

$3(\sin^2\theta+\cos^2\theta)+\sin^2\theta=3+\sin^2\theta$

1. $0\le\sin^2\theta\le1$

2. $3+1=4$

$3+1=4$

$4$

$\theta=90^\circ:\ 3+1=4$

Omits the constant three.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل أن مجموع مربعي الجيب وجيب التمام واحد.","En":"Use that sine squared plus cosine squared is one."},{"Ar":"ما أكبر قيمة لمربع الجيب؟","En":"What is the maximum of sine squared?"}],"Solution":{"Idea":{"Ar":"نجمع الحدين ذوي المعامل المشترك ثم نستخدم مجال مربع الجيب.","En":"Combine the terms with a common coefficient, then use the range of sine squared."},"FormulaLatex":"3(\\sin^2\\theta+\\cos^2\\theta)+\\sin^2\\theta=3+\\sin^2\\theta","Steps":[{"Ar":"$0\\le\\sin^2\\theta\\le1$","En":"$0\\le\\sin^2\\theta\\le1$"},{"Ar":"$3+1=4$","En":"$3+1=4$"}],"Substitution":{"Ar":"$3+1=4$","En":"$3+1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=90^\\circ:\\ 3+1=4$","En":"$\\theta=90^\\circ:\\ 3+1=4$"},"CommonError":{"Ar":"يهمل الثابت 3.","En":"Omits the constant three."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يهمل الثابت 3.","En":"Omits the constant three."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة الصغرى.","En":"This is the minimum."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يمكن أن يبلغ المربعان واحداً معاً.","En":"Both squares cannot equal one simultaneously."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v45 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
