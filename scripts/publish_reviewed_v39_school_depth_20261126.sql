-- One-time owner-authorized v39 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v39-grade-1-length-transitive-comparison-1$mw$,$mw$length-transitive-comparison$mw$,$mw$length$mw$,$mw$grade-1$mw$,1,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مقارنة أطوال غير مباشرة","En":"Indirect length comparison"},"Question":{"Ar":"الشريط A أطول من B، والشريط B أطول من C. أي شريط هو الأقصر؟ الخيارات D تعني أنها متساوية.","En":"Strip A is longer than B, and strip B is longer than C. Which strip is shortest? Option D means they are equal."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"A هو الأطول.","En":"A is longest."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"B أطول من C.","En":"B is longer than C."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأطوال غير متساوية حسب المعطيات.","En":"The given comparisons rule out equality."}}],"Hints":[{"Ar":"أي شريط أقصر من B؟","En":"Which strip is shorter than B?"},{"Ar":"قارن هذا الشريط مع A أيضاً.","En":"Compare that strip with A as well."}],"Solution":{"Idea":{"Ar":"نرتب الأطوال من الأطول إلى الأقصر باستعمال المقارنتين.","En":"Use both comparisons to order the lengths from longest to shortest."},"FormulaLatex":"A>B>C","Steps":[{"Ar":"الشريط A أطول من B.","En":"A is longer than B."},{"Ar":"الشريط C أقصر من B، وبالتالي من A أيضاً.","En":"C is shorter than B and therefore shorter than A."}],"Substitution":{"Ar":"$A>B>C$","En":"$A>B>C$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$C<B<A$","En":"$C<B<A$"},"CommonError":{"Ar":"A هو الأطول.","En":"A is longest."}}}$mw$::jsonb,$mw$نرتب الأطوال من الأطول إلى الأقصر باستعمال المقارنتين.

$A>B>C$

1. الشريط A أطول من B.

2. الشريط C أقصر من B، وبالتالي من A أيضاً.

$A>B>C$

$C$

$C<B<A$

A هو الأطول.$mw$,$mw$Use both comparisons to order the lengths from longest to shortest.

$A>B>C$

1. A is longer than B.

2. C is shorter than B and therefore shorter than A.

$A>B>C$

$C$

$C<B<A$

A is longest.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"أي شريط أقصر من B؟","En":"Which strip is shorter than B?"},{"Ar":"قارن هذا الشريط مع A أيضاً.","En":"Compare that strip with A as well."}],"Solution":{"Idea":{"Ar":"نرتب الأطوال من الأطول إلى الأقصر باستعمال المقارنتين.","En":"Use both comparisons to order the lengths from longest to shortest."},"FormulaLatex":"A>B>C","Steps":[{"Ar":"الشريط A أطول من B.","En":"A is longer than B."},{"Ar":"الشريط C أقصر من B، وبالتالي من A أيضاً.","En":"C is shorter than B and therefore shorter than A."}],"Substitution":{"Ar":"$A>B>C$","En":"$A>B>C$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$C<B<A$","En":"$C<B<A$"},"CommonError":{"Ar":"A هو الأطول.","En":"A is longest."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"A هو الأطول.","En":"A is longest."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"B أطول من C.","En":"B is longer than C."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الأطوال غير متساوية حسب المعطيات.","En":"The given comparisons rule out equality."},"Order":4}]}$mw$),
($mw$growth-v39-grade-1-square-versus-rectangle-equal-side-attribute-1$mw$,$mw$square-versus-rectangle-equal-side-attribute$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تمييز المربع من المستطيل","En":"Distinguishing a square from a rectangle"},"Question":{"Ar":"الشكل A له أربعة أضلاع مستقيمة متساوية وأربع زوايا قائمة. الشكل B مستطيل له ضلعان طويلان وضلعان قصيران. كم شكلاً من الشكلين مربع؟","En":"Shape A has four equal straight sides and four right angles. Shape B is a rectangle with two long and two short sides. How many of these shapes are squares?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"A يحقق شروط المربع.","En":"A meets the square conditions."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"B ليس مربعاً.","En":"B is not a square."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 عدد الأضلاع وليس عدد الأشكال.","En":"4 counts sides, not shapes."}}],"Hints":[{"Ar":"قارن أطوال الأضلاع في الشكلين.","En":"Compare the side lengths in each shape."},{"Ar":"يجب أن تتساوى أضلاع المربع الأربعة.","En":"All four sides of a square must be equal."}],"Solution":{"Idea":{"Ar":"المربع له أربعة أضلاع متساوية وأربع زوايا قائمة.","En":"A square has four equal sides and four right angles."},"FormulaLatex":"1+0=1","Steps":[{"Ar":"يحقق A صفة تساوي الأضلاع والزوايا القائمة.","En":"A has equal sides and right angles."},{"Ar":"أضلاع B ليست كلها متساوية.","En":"B does not have four equal sides."}],"Substitution":{"Ar":"$1+0=1$","En":"$1+0=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الشكل A فقط مربع.","En":"Only A is a square."},"CommonError":{"Ar":"A يحقق شروط المربع.","En":"A meets the square conditions."}}}$mw$::jsonb,$mw$المربع له أربعة أضلاع متساوية وأربع زوايا قائمة.

$1+0=1$

1. يحقق A صفة تساوي الأضلاع والزوايا القائمة.

2. أضلاع B ليست كلها متساوية.

$1+0=1$

$1$

الشكل A فقط مربع.

A يحقق شروط المربع.$mw$,$mw$A square has four equal sides and four right angles.

$1+0=1$

1. A has equal sides and right angles.

2. B does not have four equal sides.

$1+0=1$

$1$

Only A is a square.

A meets the square conditions.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قارن أطوال الأضلاع في الشكلين.","En":"Compare the side lengths in each shape."},{"Ar":"يجب أن تتساوى أضلاع المربع الأربعة.","En":"All four sides of a square must be equal."}],"Solution":{"Idea":{"Ar":"المربع له أربعة أضلاع متساوية وأربع زوايا قائمة.","En":"A square has four equal sides and four right angles."},"FormulaLatex":"1+0=1","Steps":[{"Ar":"يحقق A صفة تساوي الأضلاع والزوايا القائمة.","En":"A has equal sides and right angles."},{"Ar":"أضلاع B ليست كلها متساوية.","En":"B does not have four equal sides."}],"Substitution":{"Ar":"$1+0=1$","En":"$1+0=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الشكل A فقط مربع.","En":"Only A is a square."},"CommonError":{"Ar":"A يحقق شروط المربع.","En":"A meets the square conditions."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"A يحقق شروط المربع.","En":"A meets the square conditions."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"B ليس مربعاً.","En":"B is not a square."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"4 عدد الأضلاع وليس عدد الأشكال.","En":"4 counts sides, not shapes."},"Order":4}]}$mw$),
($mw$growth-v39-grade-1-category-count-combine-two-lists-1$mw$,$mw$category-count-combine-two-lists$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"دمج سجلين حسب الفئة","En":"Combining category records"},"Question":{"Ar":"في الصباح اختار 3 أطفال التفاح وطفلان الموز. بعد الظهر اختار طفل واحد التفاح و4 أطفال آخرون الموز. كل طفل اختار مرة واحدة. كم طفلاً اختار الموز خلال اليوم؟","En":"In the morning 3 children choose apples and 2 choose bananas. In the afternoon 1 child chooses apples and 4 other children choose bananas. Each child chooses once. How many chose bananas during the day?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يحسب بعد الظهر فقط.","En":"4 counts only the afternoon."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 هو مجموع اختيارات الصباح.","En":"5 is the total morning count."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 يجمع جميع اختيارات الفاكهة.","En":"10 counts all fruit choices."}}],"Hints":[{"Ar":"ابحث عن الموز في السجلين.","En":"Find bananas in both records."},{"Ar":"اجمع عددي الموز وحدهما.","En":"Add only the two banana counts."}],"Solution":{"Idea":{"Ar":"نجمع عدد الاختيارات للفئة المطلوبة من السجلين فقط.","En":"Combine the counts for the requested category across the two records."},"FormulaLatex":"2+4=6","Steps":[{"Ar":"اختيارات الموز صباحاً عددها 2.","En":"There are two morning banana choices."},{"Ar":"اختيارات الموز بعد الظهر عددها 4.","En":"There are four afternoon banana choices."}],"Substitution":{"Ar":"$2+4=6$","En":"$2+4=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6-4=2$","En":"$6-4=2$"},"CommonError":{"Ar":"4 يحسب بعد الظهر فقط.","En":"4 counts only the afternoon."}}}$mw$::jsonb,$mw$نجمع عدد الاختيارات للفئة المطلوبة من السجلين فقط.

$2+4=6$

1. اختيارات الموز صباحاً عددها 2.

2. اختيارات الموز بعد الظهر عددها 4.

$2+4=6$

$6$

$6-4=2$

4 يحسب بعد الظهر فقط.$mw$,$mw$Combine the counts for the requested category across the two records.

$2+4=6$

1. There are two morning banana choices.

2. There are four afternoon banana choices.

$2+4=6$

$6$

$6-4=2$

4 counts only the afternoon.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابحث عن الموز في السجلين.","En":"Find bananas in both records."},{"Ar":"اجمع عددي الموز وحدهما.","En":"Add only the two banana counts."}],"Solution":{"Idea":{"Ar":"نجمع عدد الاختيارات للفئة المطلوبة من السجلين فقط.","En":"Combine the counts for the requested category across the two records."},"FormulaLatex":"2+4=6","Steps":[{"Ar":"اختيارات الموز صباحاً عددها 2.","En":"There are two morning banana choices."},{"Ar":"اختيارات الموز بعد الظهر عددها 4.","En":"There are four afternoon banana choices."}],"Substitution":{"Ar":"$2+4=6$","En":"$2+4=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6-4=2$","En":"$6-4=2$"},"CommonError":{"Ar":"4 يحسب بعد الظهر فقط.","En":"4 counts only the afternoon."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"4 يحسب بعد الظهر فقط.","En":"4 counts only the afternoon."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"5 هو مجموع اختيارات الصباح.","En":"5 is the total morning count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"10 يجمع جميع اختيارات الفاكهة.","En":"10 counts all fruit choices."},"Order":4}]}$mw$),
($mw$growth-v39-grade-2-cube-adjacent-faces-common-vertices-1$mw$,$mw$cube-adjacent-faces-common-vertices$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"رؤوس وجهين متجاورين","En":"Vertices of adjacent cube faces"},"Question":{"Ar":"اختير وجهان متجاوران من مكعب يشتركان في حرف كامل. نضع نقطة عند كل رأس للوجهين، دون تكرار النقطة المشتركة. كم نقطة مختلفة نضع؟","En":"Two adjacent faces of a cube share an entire edge. Mark every vertex of both faces, without marking a shared vertex twice. How many distinct points are marked?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يعد وجهاً واحداً.","En":"4 counts one face."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يكرر الرأسين المشتركين.","En":"8 counts the shared vertices twice."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 عدد أحرف المكعب.","En":"12 is the number of cube edges."}}],"Hints":[{"Ar":"كم رأساً لكل وجه؟","En":"How many vertices does each face have?"},{"Ar":"كم رأساً على الحرف المشترك؟","En":"How many vertices lie on the shared edge?"}],"Solution":{"Idea":{"Ar":"يشترك الوجهان المتجاوران في رأسي الحرف المشترك.","En":"Adjacent faces share the two vertices of their common edge."},"FormulaLatex":"4+4-2=6","Steps":[{"Ar":"لكل وجه أربعة رؤوس.","En":"Each face has four vertices."},{"Ar":"نطرح الرأسين المشتركين لأنهما عُدّا مرتين.","En":"Subtract the two shared vertices because they were counted twice."}],"Substitution":{"Ar":"$4+4-2=6$","En":"$4+4-2=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+2=6$","En":"$4+2=6$"},"CommonError":{"Ar":"4 يعد وجهاً واحداً.","En":"4 counts one face."}}}$mw$::jsonb,$mw$يشترك الوجهان المتجاوران في رأسي الحرف المشترك.

$4+4-2=6$

1. لكل وجه أربعة رؤوس.

2. نطرح الرأسين المشتركين لأنهما عُدّا مرتين.

$4+4-2=6$

$6$

$4+2=6$

4 يعد وجهاً واحداً.$mw$,$mw$Adjacent faces share the two vertices of their common edge.

$4+4-2=6$

1. Each face has four vertices.

2. Subtract the two shared vertices because they were counted twice.

$4+4-2=6$

$6$

$4+2=6$

4 counts one face.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم رأساً لكل وجه؟","En":"How many vertices does each face have?"},{"Ar":"كم رأساً على الحرف المشترك؟","En":"How many vertices lie on the shared edge?"}],"Solution":{"Idea":{"Ar":"يشترك الوجهان المتجاوران في رأسي الحرف المشترك.","En":"Adjacent faces share the two vertices of their common edge."},"FormulaLatex":"4+4-2=6","Steps":[{"Ar":"لكل وجه أربعة رؤوس.","En":"Each face has four vertices."},{"Ar":"نطرح الرأسين المشتركين لأنهما عُدّا مرتين.","En":"Subtract the two shared vertices because they were counted twice."}],"Substitution":{"Ar":"$4+4-2=6$","En":"$4+4-2=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+2=6$","En":"$4+2=6$"},"CommonError":{"Ar":"4 يعد وجهاً واحداً.","En":"4 counts one face."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"4 يعد وجهاً واحداً.","En":"4 counts one face."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 يكرر الرأسين المشتركين.","En":"8 counts the shared vertices twice."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 عدد أحرف المكعب.","En":"12 is the number of cube edges."},"Order":4}]}$mw$),
($mw$growth-v39-grade-2-pictograph-remove-one-row-threshold-1$mw$,$mw$pictograph-remove-one-row-threshold$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تعديل صف في تمثيل مصور","En":"Editing a pictograph row"},"Question":{"Ar":"كل ● يمثل قطعة واحدة. A: ●●●●●؛ B: ●●●؛ C: ●●. حُذفت قطعتان من A وحده. ما مجموع القطع في A وC بعد الحذف؟","En":"Each ● represents one item. A: ●●●●●; B: ●●●; C: ●●. Two items are removed from A only. What is the total in A and C after removal?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 عدد A الجديد وحده.","En":"3 is the new A count alone."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 مجموعهما قبل الحذف.","En":"7 is their total before removal."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يشمل الصف B أيضاً.","En":"8 includes row B."}}],"Hints":[{"Ar":"احذف اثنين من صف A فقط.","En":"Remove two from row A only."},{"Ar":"اجمع A وC دون B.","En":"Add A and C, not B."}],"Solution":{"Idea":{"Ar":"نحدّث عدد الصف المتغير ثم نجمع الصفين المطلوبين.","En":"Update the changed row, then add the requested rows."},"FormulaLatex":"(5-2)+2=5","Steps":[{"Ar":"$5-2=3$","En":"$5-2=3$"},{"Ar":"$3+2=5$","En":"$3+2=5$"}],"Substitution":{"Ar":"$(5-2)+2=5$","En":"$(5-2)+2=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+2-2=5$","En":"$5+2-2=5$"},"CommonError":{"Ar":"3 عدد A الجديد وحده.","En":"3 is the new A count alone."}}}$mw$::jsonb,$mw$نحدّث عدد الصف المتغير ثم نجمع الصفين المطلوبين.

$(5-2)+2=5$

1. $5-2=3$

2. $3+2=5$

$(5-2)+2=5$

$5$

$5+2-2=5$

3 عدد A الجديد وحده.$mw$,$mw$Update the changed row, then add the requested rows.

$(5-2)+2=5$

1. $5-2=3$

2. $3+2=5$

$(5-2)+2=5$

$5$

$5+2-2=5$

3 is the new A count alone.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"احذف اثنين من صف A فقط.","En":"Remove two from row A only."},{"Ar":"اجمع A وC دون B.","En":"Add A and C, not B."}],"Solution":{"Idea":{"Ar":"نحدّث عدد الصف المتغير ثم نجمع الصفين المطلوبين.","En":"Update the changed row, then add the requested rows."},"FormulaLatex":"(5-2)+2=5","Steps":[{"Ar":"$5-2=3$","En":"$5-2=3$"},{"Ar":"$3+2=5$","En":"$3+2=5$"}],"Substitution":{"Ar":"$(5-2)+2=5$","En":"$(5-2)+2=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+2-2=5$","En":"$5+2-2=5$"},"CommonError":{"Ar":"3 عدد A الجديد وحده.","En":"3 is the new A count alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 عدد A الجديد وحده.","En":"3 is the new A count alone."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"7 مجموعهما قبل الحذف.","En":"7 is their total before removal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 يشمل الصف B أيضاً.","En":"8 includes row B."},"Order":4}]}$mw$),
($mw$growth-v39-grade-3-fraction-number-line-beyond-one-1$mw$,$mw$fraction-number-line-beyond-one$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"كسور أكبر من الواحد","En":"Fractions beyond one"},"Question":{"Ar":"على خط أعداد، كل وحدة مقسمة إلى أربعة أجزاء متساوية. ما الكسر الذي يمثل أول علامة بعد العدد 1؟","En":"On a number line each unit is divided into four equal parts. What fraction represents the first tick after 1?"},"Options":[{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1/4 قبل الواحد.","En":"1/4 is before one."}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3/4 قبل الواحد.","En":"3/4 is before one."}},{"LatexCode":"\\frac44","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4/4 يساوي الواحد نفسه.","En":"4/4 is exactly one."}},{"LatexCode":"\\frac54","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"كم ربعاً في الوحدة؟","En":"How many quarters are in one unit?"},{"Ar":"تحرك ربعاً بعد الواحد.","En":"Move one quarter beyond one."}],"Solution":{"Idea":{"Ar":"الواحد يساوي أربعة أرباع، ونضيف ربعاً واحداً.","En":"One equals four quarters; add one more quarter."},"FormulaLatex":"1+\\frac14=\\frac54","Steps":[{"Ar":"$1=4/4$","En":"$1=4/4$"},{"Ar":"$4/4+1/4=5/4$","En":"$4/4+1/4=5/4$"}],"Substitution":{"Ar":"$1+\\frac14=\\frac54$","En":"$1+\\frac14=\\frac54$"},"Result":{"Ar":"$\\frac54$","En":"$\\frac54$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5/4-4/4=1/4$","En":"$5/4-4/4=1/4$"},"CommonError":{"Ar":"1/4 قبل الواحد.","En":"1/4 is before one."}}}$mw$::jsonb,$mw$الواحد يساوي أربعة أرباع، ونضيف ربعاً واحداً.

$1+\frac14=\frac54$

1. $1=4/4$

2. $4/4+1/4=5/4$

$1+\frac14=\frac54$

$\frac54$

$5/4-4/4=1/4$

1/4 قبل الواحد.$mw$,$mw$One equals four quarters; add one more quarter.

$1+\frac14=\frac54$

1. $1=4/4$

2. $4/4+1/4=5/4$

$1+\frac14=\frac54$

$\frac54$

$5/4-4/4=1/4$

1/4 is before one.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم ربعاً في الوحدة؟","En":"How many quarters are in one unit?"},{"Ar":"تحرك ربعاً بعد الواحد.","En":"Move one quarter beyond one."}],"Solution":{"Idea":{"Ar":"الواحد يساوي أربعة أرباع، ونضيف ربعاً واحداً.","En":"One equals four quarters; add one more quarter."},"FormulaLatex":"1+\\frac14=\\frac54","Steps":[{"Ar":"$1=4/4$","En":"$1=4/4$"},{"Ar":"$4/4+1/4=5/4$","En":"$4/4+1/4=5/4$"}],"Substitution":{"Ar":"$1+\\frac14=\\frac54$","En":"$1+\\frac14=\\frac54$"},"Result":{"Ar":"$\\frac54$","En":"$\\frac54$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5/4-4/4=1/4$","En":"$5/4-4/4=1/4$"},"CommonError":{"Ar":"1/4 قبل الواحد.","En":"1/4 is before one."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1/4 قبل الواحد.","En":"1/4 is before one."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3/4 قبل الواحد.","En":"3/4 is before one."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"4/4 يساوي الواحد نفسه.","En":"4/4 is exactly one."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v39-grade-3-fraction-unit-model-reconstruct-whole-1$mw$,$mw$fraction-unit-model-reconstruct-whole$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال نموذج الوحدة","En":"Completing a unit model"},"Question":{"Ar":"ثلاث قطع متطابقة تمثل معاً ثلاثة أثمان شريط كامل. كم قطعة أخرى من النوع نفسه نحتاج لإكمال الشريط؟","En":"Three identical pieces together represent three eighths of a full strip. How many more identical pieces are needed to complete the strip?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 عدد القطع الموجودة.","En":"3 counts the available pieces."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 عدد القطع الكلي وليس الإضافة.","En":"8 is the total, not the additional count."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"11 يجمع الكلي والموجود.","En":"11 adds the total and available counts."}}],"Hints":[{"Ar":"كم قطعة متساوية في الشريط الكامل؟","En":"How many equal pieces make the whole strip?"},{"Ar":"استبعد القطع الثلاث الموجودة.","En":"Subtract the three available pieces."}],"Solution":{"Idea":{"Ar":"كل قطعة تمثل ثمناً؛ الوحدة الكاملة تحتاج ثمانية أثمان.","En":"Each piece represents one eighth; the whole needs eight eighths."},"FormulaLatex":"8-3=5","Steps":[{"Ar":"$3/8=1/8+1/8+1/8$","En":"$3/8=1/8+1/8+1/8$"},{"Ar":"نحتاج ثماني قطع إجمالاً، ولدينا ثلاث.","En":"Eight pieces are needed altogether and three are available."}],"Substitution":{"Ar":"$8-3=5$","En":"$8-3=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3/8+5/8=1$","En":"$3/8+5/8=1$"},"CommonError":{"Ar":"3 عدد القطع الموجودة.","En":"3 counts the available pieces."}}}$mw$::jsonb,$mw$كل قطعة تمثل ثمناً؛ الوحدة الكاملة تحتاج ثمانية أثمان.

$8-3=5$

1. $3/8=1/8+1/8+1/8$

2. نحتاج ثماني قطع إجمالاً، ولدينا ثلاث.

$8-3=5$

$5$

$3/8+5/8=1$

3 عدد القطع الموجودة.$mw$,$mw$Each piece represents one eighth; the whole needs eight eighths.

$8-3=5$

1. $3/8=1/8+1/8+1/8$

2. Eight pieces are needed altogether and three are available.

$8-3=5$

$5$

$3/8+5/8=1$

3 counts the available pieces.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم قطعة متساوية في الشريط الكامل؟","En":"How many equal pieces make the whole strip?"},{"Ar":"استبعد القطع الثلاث الموجودة.","En":"Subtract the three available pieces."}],"Solution":{"Idea":{"Ar":"كل قطعة تمثل ثمناً؛ الوحدة الكاملة تحتاج ثمانية أثمان.","En":"Each piece represents one eighth; the whole needs eight eighths."},"FormulaLatex":"8-3=5","Steps":[{"Ar":"$3/8=1/8+1/8+1/8$","En":"$3/8=1/8+1/8+1/8$"},{"Ar":"نحتاج ثماني قطع إجمالاً، ولدينا ثلاث.","En":"Eight pieces are needed altogether and three are available."}],"Substitution":{"Ar":"$8-3=5$","En":"$8-3=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3/8+5/8=1$","En":"$3/8+5/8=1$"},"CommonError":{"Ar":"3 عدد القطع الموجودة.","En":"3 counts the available pieces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 عدد القطع الموجودة.","En":"3 counts the available pieces."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 عدد القطع الكلي وليس الإضافة.","En":"8 is the total, not the additional count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"11 يجمع الكلي والموجود.","En":"11 adds the total and available counts."},"Order":4}]}$mw$),
($mw$growth-v39-grade-3-time-duration-conversion-comparison-1$mw$,$mw$time-duration-conversion-comparison$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مقارنة مدد بوحدات مختلفة","En":"Comparing durations in different units"},"Question":{"Ar":"استغرقت الرحلة الأولى ساعة و10 دقائق. واستغرقت الثانية 65 دقيقة. بكم دقيقة تزيد مدة الرحلة الأولى؟","En":"The first trip lasted one hour and 10 minutes. The second lasted 65 minutes. How many minutes longer was the first trip?"},"Options":[{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 الدقائق الإضافية في المدة الأولى فقط.","En":"10 is only the extra minutes in the first duration."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 ليس الفرق بين 70 و65.","En":"15 is not the difference between 70 and 65."}},{"LatexCode":"70","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"70 المدة الأولى كاملة.","En":"70 is the entire first duration."}}],"Hints":[{"Ar":"ساعة واحدة تساوي كم دقيقة؟","En":"How many minutes are in one hour?"},{"Ar":"اطرح 65 من المدة الأولى بالدقائق.","En":"Subtract 65 from the first duration in minutes."}],"Solution":{"Idea":{"Ar":"نحوّل الساعة إلى 60 دقيقة ثم نقارن المدتين.","En":"Convert the hour into 60 minutes, then compare the durations."},"FormulaLatex":"60+10-65=5","Steps":[{"Ar":"$60+10=70$","En":"$60+10=70$"},{"Ar":"$70-65=5$","En":"$70-65=5$"}],"Substitution":{"Ar":"$60+10-65=5$","En":"$60+10-65=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"دقائق","En":"minutes"},"Verification":{"Ar":"$65+5=70$","En":"$65+5=70$"},"CommonError":{"Ar":"10 الدقائق الإضافية في المدة الأولى فقط.","En":"10 is only the extra minutes in the first duration."}}}$mw$::jsonb,$mw$نحوّل الساعة إلى 60 دقيقة ثم نقارن المدتين.

$60+10-65=5$

1. $60+10=70$

2. $70-65=5$

$60+10-65=5$

$5$ دقائق

$65+5=70$

10 الدقائق الإضافية في المدة الأولى فقط.$mw$,$mw$Convert the hour into 60 minutes, then compare the durations.

$60+10-65=5$

1. $60+10=70$

2. $70-65=5$

$60+10-65=5$

$5$ minutes

$65+5=70$

10 is only the extra minutes in the first duration.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ساعة واحدة تساوي كم دقيقة؟","En":"How many minutes are in one hour?"},{"Ar":"اطرح 65 من المدة الأولى بالدقائق.","En":"Subtract 65 from the first duration in minutes."}],"Solution":{"Idea":{"Ar":"نحوّل الساعة إلى 60 دقيقة ثم نقارن المدتين.","En":"Convert the hour into 60 minutes, then compare the durations."},"FormulaLatex":"60+10-65=5","Steps":[{"Ar":"$60+10=70$","En":"$60+10=70$"},{"Ar":"$70-65=5$","En":"$70-65=5$"}],"Substitution":{"Ar":"$60+10-65=5$","En":"$60+10-65=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"دقائق","En":"minutes"},"Verification":{"Ar":"$65+5=70$","En":"$65+5=70$"},"CommonError":{"Ar":"10 الدقائق الإضافية في المدة الأولى فقط.","En":"10 is only the extra minutes in the first duration."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"10 الدقائق الإضافية في المدة الأولى فقط.","En":"10 is only the extra minutes in the first duration."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"15 ليس الفرق بين 70 و65.","En":"15 is not the difference between 70 and 65."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"70 المدة الأولى كاملة.","En":"70 is the entire first duration."},"Order":4}]}$mw$),
($mw$growth-v39-grade-4-addition-shared-addend-comparison-1$mw$,$mw$addition-shared-addend-comparison$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة مجموعين بحد مشترك","En":"Comparing sums with a shared addend"},"Question":{"Ar":"حسب طالب 562+187 وحسب آخر 562+219. بكم يزيد المجموع الثاني على الأول؟","En":"One pupil calculates 562+187 and another calculates 562+219. By how much does the second sum exceed the first?"},"Options":[{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"22 ليس الفرق بين 219 و187.","En":"22 is not the difference between 219 and 187."}},{"LatexCode":"32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"406","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"406 مجموع الحدين المختلفين.","En":"406 adds the different addends."}},{"LatexCode":"562","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"562 الحد المشترك.","En":"562 is the shared addend."}}],"Hints":[{"Ar":"حدد الحد المشترك.","En":"Identify the shared addend."},{"Ar":"قارن الحدين المختلفين.","En":"Compare the two different addends."}],"Solution":{"Idea":{"Ar":"الحد المشترك لا يؤثر في الفرق بين المجموعين.","En":"The shared addend does not affect the difference between the sums."},"FormulaLatex":"(562+219)-(562+187)=219-187","Steps":[{"Ar":"يتكرر العدد 562 في المجموعين.","En":"562 is common to both sums."},{"Ar":"$219-187=32$","En":"$219-187=32$"}],"Substitution":{"Ar":"$(562+219)-(562+187)=219-187$","En":"$(562+219)-(562+187)=219-187$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$781-749=32$","En":"$781-749=32$"},"CommonError":{"Ar":"22 ليس الفرق بين 219 و187.","En":"22 is not the difference between 219 and 187."}}}$mw$::jsonb,$mw$الحد المشترك لا يؤثر في الفرق بين المجموعين.

$(562+219)-(562+187)=219-187$

1. يتكرر العدد 562 في المجموعين.

2. $219-187=32$

$(562+219)-(562+187)=219-187$

$32$

$781-749=32$

22 ليس الفرق بين 219 و187.$mw$,$mw$The shared addend does not affect the difference between the sums.

$(562+219)-(562+187)=219-187$

1. 562 is common to both sums.

2. $219-187=32$

$(562+219)-(562+187)=219-187$

$32$

$781-749=32$

22 is not the difference between 219 and 187.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد الحد المشترك.","En":"Identify the shared addend."},{"Ar":"قارن الحدين المختلفين.","En":"Compare the two different addends."}],"Solution":{"Idea":{"Ar":"الحد المشترك لا يؤثر في الفرق بين المجموعين.","En":"The shared addend does not affect the difference between the sums."},"FormulaLatex":"(562+219)-(562+187)=219-187","Steps":[{"Ar":"يتكرر العدد 562 في المجموعين.","En":"562 is common to both sums."},{"Ar":"$219-187=32$","En":"$219-187=32$"}],"Substitution":{"Ar":"$(562+219)-(562+187)=219-187$","En":"$(562+219)-(562+187)=219-187$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$781-749=32$","En":"$781-749=32$"},"CommonError":{"Ar":"22 ليس الفرق بين 219 و187.","En":"22 is not the difference between 219 and 187."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"22 ليس الفرق بين 219 و187.","En":"22 is not the difference between 219 and 187."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"406 مجموع الحدين المختلفين.","En":"406 adds the different addends."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"562 الحد المشترك.","En":"562 is the shared addend."},"Order":4}]}$mw$),
($mw$growth-v39-grade-4-length-kilometer-mixed-units-total-1$mw$,$mw$length-kilometer-mixed-units-total$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التحويل من كيلومتر ومتر","En":"Converting kilometres and metres"},"Question":{"Ar":"سار شخص 2 كيلومتر و350 متراً. كم متراً سار إجمالاً؟","En":"A person walks 2 kilometres and 350 metres. How many metres is that in total?"},"Options":[{"LatexCode":"352","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"352 يجمع عدد الكيلومترات والأمتار دون تحويل.","En":"352 adds unlike units."}},{"LatexCode":"550","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"550 يستخدم 100 بدلاً من 1000.","En":"550 uses 100 instead of 1000."}},{"LatexCode":"2350","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"23500","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"23500 أكبر بعشرة أمثال.","En":"23500 is ten times too large."}}],"Hints":[{"Ar":"كم متر في الكيلومتر؟","En":"How many metres are in a kilometre?"},{"Ar":"حوّل الكيلومترين ثم أضف 350.","En":"Convert the two kilometres and add 350."}],"Solution":{"Idea":{"Ar":"الكيلومتر يساوي ألف متر، ثم نضيف الأمتار المتبقية.","En":"A kilometre equals one thousand metres; add the remaining metres."},"FormulaLatex":"2\\cdot1000+350=2350","Steps":[{"Ar":"$2\\cdot1000=2000$","En":"$2\\cdot1000=2000$"},{"Ar":"$2000+350=2350$","En":"$2000+350=2350$"}],"Substitution":{"Ar":"$2\\cdot1000+350=2350$","En":"$2\\cdot1000+350=2350$"},"Result":{"Ar":"$2350$","En":"$2350$"},"Unit":{"Ar":"متر","En":"metres"},"Verification":{"Ar":"$2350-350=2000$","En":"$2350-350=2000$"},"CommonError":{"Ar":"352 يجمع عدد الكيلومترات والأمتار دون تحويل.","En":"352 adds unlike units."}}}$mw$::jsonb,$mw$الكيلومتر يساوي ألف متر، ثم نضيف الأمتار المتبقية.

$2\cdot1000+350=2350$

1. $2\cdot1000=2000$

2. $2000+350=2350$

$2\cdot1000+350=2350$

$2350$ متر

$2350-350=2000$

352 يجمع عدد الكيلومترات والأمتار دون تحويل.$mw$,$mw$A kilometre equals one thousand metres; add the remaining metres.

$2\cdot1000+350=2350$

1. $2\cdot1000=2000$

2. $2000+350=2350$

$2\cdot1000+350=2350$

$2350$ metres

$2350-350=2000$

352 adds unlike units.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم متر في الكيلومتر؟","En":"How many metres are in a kilometre?"},{"Ar":"حوّل الكيلومترين ثم أضف 350.","En":"Convert the two kilometres and add 350."}],"Solution":{"Idea":{"Ar":"الكيلومتر يساوي ألف متر، ثم نضيف الأمتار المتبقية.","En":"A kilometre equals one thousand metres; add the remaining metres."},"FormulaLatex":"2\\cdot1000+350=2350","Steps":[{"Ar":"$2\\cdot1000=2000$","En":"$2\\cdot1000=2000$"},{"Ar":"$2000+350=2350$","En":"$2000+350=2350$"}],"Substitution":{"Ar":"$2\\cdot1000+350=2350$","En":"$2\\cdot1000+350=2350$"},"Result":{"Ar":"$2350$","En":"$2350$"},"Unit":{"Ar":"متر","En":"metres"},"Verification":{"Ar":"$2350-350=2000$","En":"$2350-350=2000$"},"CommonError":{"Ar":"352 يجمع عدد الكيلومترات والأمتار دون تحويل.","En":"352 adds unlike units."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"352 يجمع عدد الكيلومترات والأمتار دون تحويل.","En":"352 adds unlike units."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"550 يستخدم 100 بدلاً من 1000.","En":"550 uses 100 instead of 1000."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"23500 أكبر بعشرة أمثال.","En":"23500 is ten times too large."},"Order":4}]}$mw$),
($mw$growth-v39-grade-5-multiplication-compare-products-common-factor-1$mw$,$mw$multiplication-compare-products-common-factor$mw$,$mw$primary-multiplication$mw$,$mw$grade-5$mw$,5,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة حاصلَي ضرب بعامل مشترك","En":"Comparing products with a common factor"},"Question":{"Ar":"بكم يزيد حاصل 24×31 على حاصل 24×29؟","En":"By how much does 24×31 exceed 24×29?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 فرق العاملين لا فرق الناتجين.","En":"2 is the factor difference, not product difference."}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"24 يمثل زيادة وحدة واحدة فقط.","En":"24 corresponds to a one-unit increase."}},{"LatexCode":"48","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60 ليس حاصل 24×2.","En":"60 is not 24×2."}}],"Hints":[{"Ar":"لاحظ العامل المشترك 24.","En":"Notice the common factor 24."},{"Ar":"اضرب 24 في فرق العاملين الآخرين.","En":"Multiply 24 by the difference of the other factors."}],"Solution":{"Idea":{"Ar":"نستعمل خاصية التوزيع لإيجاد فرق حاصلَي الضرب.","En":"Use the distributive property to find the difference of products."},"FormulaLatex":"24(31-29)=48","Steps":[{"Ar":"$31-29=2$","En":"$31-29=2$"},{"Ar":"$24\\cdot2=48$","En":"$24\\cdot2=48$"}],"Substitution":{"Ar":"$24(31-29)=48$","En":"$24(31-29)=48$"},"Result":{"Ar":"$48$","En":"$48$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$744-696=48$","En":"$744-696=48$"},"CommonError":{"Ar":"2 فرق العاملين لا فرق الناتجين.","En":"2 is the factor difference, not product difference."}}}$mw$::jsonb,$mw$نستعمل خاصية التوزيع لإيجاد فرق حاصلَي الضرب.

$24(31-29)=48$

1. $31-29=2$

2. $24\cdot2=48$

$24(31-29)=48$

$48$

$744-696=48$

2 فرق العاملين لا فرق الناتجين.$mw$,$mw$Use the distributive property to find the difference of products.

$24(31-29)=48$

1. $31-29=2$

2. $24\cdot2=48$

$24(31-29)=48$

$48$

$744-696=48$

2 is the factor difference, not product difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لاحظ العامل المشترك 24.","En":"Notice the common factor 24."},{"Ar":"اضرب 24 في فرق العاملين الآخرين.","En":"Multiply 24 by the difference of the other factors."}],"Solution":{"Idea":{"Ar":"نستعمل خاصية التوزيع لإيجاد فرق حاصلَي الضرب.","En":"Use the distributive property to find the difference of products."},"FormulaLatex":"24(31-29)=48","Steps":[{"Ar":"$31-29=2$","En":"$31-29=2$"},{"Ar":"$24\\cdot2=48$","En":"$24\\cdot2=48$"}],"Substitution":{"Ar":"$24(31-29)=48$","En":"$24(31-29)=48$"},"Result":{"Ar":"$48$","En":"$48$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$744-696=48$","En":"$744-696=48$"},"CommonError":{"Ar":"2 فرق العاملين لا فرق الناتجين.","En":"2 is the factor difference, not product difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 فرق العاملين لا فرق الناتجين.","En":"2 is the factor difference, not product difference."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"24 يمثل زيادة وحدة واحدة فقط.","En":"24 corresponds to a one-unit increase."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"60 ليس حاصل 24×2.","En":"60 is not 24×2."},"Order":4}]}$mw$),
($mw$growth-v39-grade-6-two-step-equation-reverse-operation-choice-1$mw$,$mw$two-step-equation-reverse-operation-choice$mw$,$mw$primary-two-step-equations$mw$,$mw$grade-6$mw$,6,1,2,10,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":10,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عكس عمليتين بالترتيب","En":"Reversing two operations in order"},"Question":{"Ar":"لحل 6x+5=47، أي تعبير عددي يعطي قيمة x؟","En":"To solve 6x+5=47, which numerical expression gives x?"},"Options":[{"LatexCode":"(47+5)/6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يجمع 5 بدلاً من طرحه.","En":"Adds five instead of subtracting."}},{"LatexCode":"47/6-5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعكس ترتيب العمليات.","En":"Reverses the operations in the wrong order."}},{"LatexCode":"(47-5)/6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(47-6)/5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبدل الثابت والمعامل.","En":"Swaps the constant and coefficient."}}],"Hints":[{"Ar":"اطرح 5 قبل القسمة.","En":"Subtract five before dividing."},{"Ar":"اقسم الناتج على 6.","En":"Divide the result by six."}],"Solution":{"Idea":{"Ar":"نعكس الجمع أولاً بالطرح، ثم نعكس الضرب بالقسمة.","En":"Undo addition by subtraction first, then undo multiplication by division."},"FormulaLatex":"x=(47-5)/6","Steps":[{"Ar":"$6x=47-5=42$","En":"$6x=47-5=42$"},{"Ar":"$x=42/6=7$","En":"$x=42/6=7$"}],"Substitution":{"Ar":"$x=(47-5)/6$","En":"$x=(47-5)/6$"},"Result":{"Ar":"$(47-5)/6$","En":"$(47-5)/6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot7+5=47$","En":"$6\\cdot7+5=47$"},"CommonError":{"Ar":"يجمع 5 بدلاً من طرحه.","En":"Adds five instead of subtracting."}}}$mw$::jsonb,$mw$نعكس الجمع أولاً بالطرح، ثم نعكس الضرب بالقسمة.

$x=(47-5)/6$

1. $6x=47-5=42$

2. $x=42/6=7$

$x=(47-5)/6$

$(47-5)/6$

$6\cdot7+5=47$

يجمع 5 بدلاً من طرحه.$mw$,$mw$Undo addition by subtraction first, then undo multiplication by division.

$x=(47-5)/6$

1. $6x=47-5=42$

2. $x=42/6=7$

$x=(47-5)/6$

$(47-5)/6$

$6\cdot7+5=47$

Adds five instead of subtracting.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح 5 قبل القسمة.","En":"Subtract five before dividing."},{"Ar":"اقسم الناتج على 6.","En":"Divide the result by six."}],"Solution":{"Idea":{"Ar":"نعكس الجمع أولاً بالطرح، ثم نعكس الضرب بالقسمة.","En":"Undo addition by subtraction first, then undo multiplication by division."},"FormulaLatex":"x=(47-5)/6","Steps":[{"Ar":"$6x=47-5=42$","En":"$6x=47-5=42$"},{"Ar":"$x=42/6=7$","En":"$x=42/6=7$"}],"Substitution":{"Ar":"$x=(47-5)/6$","En":"$x=(47-5)/6$"},"Result":{"Ar":"$(47-5)/6$","En":"$(47-5)/6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot7+5=47$","En":"$6\\cdot7+5=47$"},"CommonError":{"Ar":"يجمع 5 بدلاً من طرحه.","En":"Adds five instead of subtracting."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يجمع 5 بدلاً من طرحه.","En":"Adds five instead of subtracting."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعكس ترتيب العمليات.","En":"Reverses the operations in the wrong order."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يبدل الثابت والمعامل.","En":"Swaps the constant and coefficient."},"Order":4}]}$mw$),
($mw$growth-v39-grade-8-range-remove-both-extremes-1$mw$,$mw$range-remove-both-extremes$mw$,$mw$summary-measures$mw$,$mw$grade-8$mw$,8,2,22,299,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":299,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المدى بعد حذف الطرفين","En":"Range after removing extremes"},"Question":{"Ar":"البيانات المرتبة 2، 5، 8، 12، 19. حُذفت أصغر قيمة وأكبر قيمة. ما المدى الجديد؟","En":"Sorted observations are 2, 5, 8, 12, 19. The smallest and largest values are removed. What is the new range?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 أصغر قيمة متبقية.","En":"5 is the new minimum."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 ليس فرق 12 و5.","En":"10 is not 12 minus 5."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"17 المدى قبل الحذف.","En":"17 is the original range."}}],"Hints":[{"Ar":"احذف 2 و19 فقط.","En":"Remove only 2 and 19."},{"Ar":"حدد أصغر وأكبر قيمة بعد الحذف.","En":"Find the new minimum and maximum."}],"Solution":{"Idea":{"Ar":"المدى هو أكبر قيمة متبقية ناقص أصغر قيمة متبقية.","En":"Range is the remaining maximum minus the remaining minimum."},"FormulaLatex":"12-5=7","Steps":[{"Ar":"تبقى القيم 5 و8 و12.","En":"The remaining values are 5, 8 and 12."},{"Ar":"$12-5=7$","En":"$12-5=7$"}],"Substitution":{"Ar":"$12-5=7$","En":"$12-5=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+7=12$","En":"$5+7=12$"},"CommonError":{"Ar":"5 أصغر قيمة متبقية.","En":"5 is the new minimum."}}}$mw$::jsonb,$mw$المدى هو أكبر قيمة متبقية ناقص أصغر قيمة متبقية.

$12-5=7$

1. تبقى القيم 5 و8 و12.

2. $12-5=7$

$12-5=7$

$7$

$5+7=12$

5 أصغر قيمة متبقية.$mw$,$mw$Range is the remaining maximum minus the remaining minimum.

$12-5=7$

1. The remaining values are 5, 8 and 12.

2. $12-5=7$

$12-5=7$

$7$

$5+7=12$

5 is the new minimum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احذف 2 و19 فقط.","En":"Remove only 2 and 19."},{"Ar":"حدد أصغر وأكبر قيمة بعد الحذف.","En":"Find the new minimum and maximum."}],"Solution":{"Idea":{"Ar":"المدى هو أكبر قيمة متبقية ناقص أصغر قيمة متبقية.","En":"Range is the remaining maximum minus the remaining minimum."},"FormulaLatex":"12-5=7","Steps":[{"Ar":"تبقى القيم 5 و8 و12.","En":"The remaining values are 5, 8 and 12."},{"Ar":"$12-5=7$","En":"$12-5=7$"}],"Substitution":{"Ar":"$12-5=7$","En":"$12-5=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+7=12$","En":"$5+7=12$"},"CommonError":{"Ar":"5 أصغر قيمة متبقية.","En":"5 is the new minimum."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 أصغر قيمة متبقية.","En":"5 is the new minimum."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"10 ليس فرق 12 و5.","En":"10 is not 12 minus 5."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"17 المدى قبل الحذف.","En":"17 is the original range."},"Order":4}]}$mw$),
($mw$growth-v39-grade-11-vector-norm-negative-scalar-1$mw$,$mw$vector-norm-negative-scalar$mw$,$mw$magnitude$mw$,$mw$grade-11$mw$,11,3,87,339,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":339,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معيار متجه بعد ضربه بثابت","En":"Norm after scalar multiplication"},"Question":{"Ar":"إذا كان معيار المتجه u يساوي 6، فما معيار المتجه −3u؟","En":"If the Euclidean norm of vector u is 6, what is the norm of −3u?"},"Options":[{"LatexCode":"-18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المعيار غير سالب.","En":"A norm cannot be negative."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 يقسم على 3 بدلاً من الضرب.","En":"2 divides instead of multiplying."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 مربع المعامل وليس المعيار.","En":"9 is the scalar squared, not the norm."}},{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"هل يمكن للمعيار أن يكون سالباً؟","En":"Can a norm be negative?"},{"Ar":"استعمل القيمة المطلقة للمعامل.","En":"Use the absolute value of the scalar."}],"Solution":{"Idea":{"Ar":"معيار حاصل ضرب متجه في ثابت يساوي القيمة المطلقة للثابت مضروبة في معيار المتجه.","En":"The norm of a scalar multiple equals the absolute scalar times the original norm."},"FormulaLatex":"\\|-3u\\|=|-3|\\|u\\|","Steps":[{"Ar":"$|-3|=3$","En":"$|-3|=3$"},{"Ar":"$3\\cdot6=18$","En":"$3\\cdot6=18$"}],"Substitution":{"Ar":"$\\|-3u\\|=|-3|\\|u\\|$","En":"$\\|-3u\\|=|-3|\\|u\\|$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\|-3u\\|^2=9\\cdot36=324$","En":"$\\|-3u\\|^2=9\\cdot36=324$"},"CommonError":{"Ar":"المعيار غير سالب.","En":"A norm cannot be negative."}}}$mw$::jsonb,$mw$معيار حاصل ضرب متجه في ثابت يساوي القيمة المطلقة للثابت مضروبة في معيار المتجه.

$\|-3u\|=|-3|\|u\|$

1. $|-3|=3$

2. $3\cdot6=18$

$\|-3u\|=|-3|\|u\|$

$18$

$\|-3u\|^2=9\cdot36=324$

المعيار غير سالب.$mw$,$mw$The norm of a scalar multiple equals the absolute scalar times the original norm.

$\|-3u\|=|-3|\|u\|$

1. $|-3|=3$

2. $3\cdot6=18$

$\|-3u\|=|-3|\|u\|$

$18$

$\|-3u\|^2=9\cdot36=324$

A norm cannot be negative.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل يمكن للمعيار أن يكون سالباً؟","En":"Can a norm be negative?"},{"Ar":"استعمل القيمة المطلقة للمعامل.","En":"Use the absolute value of the scalar."}],"Solution":{"Idea":{"Ar":"معيار حاصل ضرب متجه في ثابت يساوي القيمة المطلقة للثابت مضروبة في معيار المتجه.","En":"The norm of a scalar multiple equals the absolute scalar times the original norm."},"FormulaLatex":"\\|-3u\\|=|-3|\\|u\\|","Steps":[{"Ar":"$|-3|=3$","En":"$|-3|=3$"},{"Ar":"$3\\cdot6=18$","En":"$3\\cdot6=18$"}],"Substitution":{"Ar":"$\\|-3u\\|=|-3|\\|u\\|$","En":"$\\|-3u\\|=|-3|\\|u\\|$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\|-3u\\|^2=9\\cdot36=324$","En":"$\\|-3u\\|^2=9\\cdot36=324$"},"CommonError":{"Ar":"المعيار غير سالب.","En":"A norm cannot be negative."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المعيار غير سالب.","En":"A norm cannot be negative."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"2 يقسم على 3 بدلاً من الضرب.","En":"2 divides instead of multiplying."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"9 مربع المعامل وليس المعيار.","En":"9 is the scalar squared, not the norm."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v39-grade-12-dot-product-cosine-negative-angle-1$mw$,$mw$dot-product-cosine-negative-angle$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جيب تمام زاوية بين متجهين","En":"Cosine of the angle between vectors"},"Question":{"Ar":"إذا كان $u\\cdot v=-6$ و$\\|u\\|=3$ و$\\|v\\|=4$، فما جيب تمام الزاوية بينهما؟","En":"If $u\\cdot v=-6$, $\\|u\\|=3$ and $\\|v\\|=4$, what is the cosine of the angle between them?"},"Options":[{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2 خارج مجال جيب التمام.","En":"−2 is outside the cosine range."}},{"LatexCode":"-\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1/2 يهمل الإشارة السالبة.","En":"1/2 drops the negative sign."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 خارج مجال جيب التمام.","En":"2 is outside the cosine range."}}],"Hints":[{"Ar":"احسب حاصل ضرب المعيارين.","En":"Multiply the norms."},{"Ar":"احتفظ بإشارة الضرب القياسي.","En":"Preserve the sign of the dot product."}],"Solution":{"Idea":{"Ar":"نقسم الضرب القياسي على حاصل ضرب معياري المتجهين غير الصفريين.","En":"Divide the dot product by the product of the two nonzero norms."},"FormulaLatex":"\\cos\\theta=\\frac{u\\cdot v}{\\|u\\|\\|v\\|}","Steps":[{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"},{"Ar":"$-6/12=-1/2$","En":"$-6/12=-1/2$"}],"Substitution":{"Ar":"$\\cos\\theta=\\frac{u\\cdot v}{\\|u\\|\\|v\\|}$","En":"$\\cos\\theta=\\frac{u\\cdot v}{\\|u\\|\\|v\\|}$"},"Result":{"Ar":"$-\\frac12$","En":"$-\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12(-1/2)=-6$","En":"$12(-1/2)=-6$"},"CommonError":{"Ar":"−2 خارج مجال جيب التمام.","En":"−2 is outside the cosine range."}}}$mw$::jsonb,$mw$نقسم الضرب القياسي على حاصل ضرب معياري المتجهين غير الصفريين.

$\cos\theta=\frac{u\cdot v}{\|u\|\|v\|}$

1. $3\cdot4=12$

2. $-6/12=-1/2$

$\cos\theta=\frac{u\cdot v}{\|u\|\|v\|}$

$-\frac12$

$12(-1/2)=-6$

−2 خارج مجال جيب التمام.$mw$,$mw$Divide the dot product by the product of the two nonzero norms.

$\cos\theta=\frac{u\cdot v}{\|u\|\|v\|}$

1. $3\cdot4=12$

2. $-6/12=-1/2$

$\cos\theta=\frac{u\cdot v}{\|u\|\|v\|}$

$-\frac12$

$12(-1/2)=-6$

−2 is outside the cosine range.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب حاصل ضرب المعيارين.","En":"Multiply the norms."},{"Ar":"احتفظ بإشارة الضرب القياسي.","En":"Preserve the sign of the dot product."}],"Solution":{"Idea":{"Ar":"نقسم الضرب القياسي على حاصل ضرب معياري المتجهين غير الصفريين.","En":"Divide the dot product by the product of the two nonzero norms."},"FormulaLatex":"\\cos\\theta=\\frac{u\\cdot v}{\\|u\\|\\|v\\|}","Steps":[{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"},{"Ar":"$-6/12=-1/2$","En":"$-6/12=-1/2$"}],"Substitution":{"Ar":"$\\cos\\theta=\\frac{u\\cdot v}{\\|u\\|\\|v\\|}$","En":"$\\cos\\theta=\\frac{u\\cdot v}{\\|u\\|\\|v\\|}$"},"Result":{"Ar":"$-\\frac12$","En":"$-\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12(-1/2)=-6$","En":"$12(-1/2)=-6$"},"CommonError":{"Ar":"−2 خارج مجال جيب التمام.","En":"−2 is outside the cosine range."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−2 خارج مجال جيب التمام.","En":"−2 is outside the cosine range."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"1/2 يهمل الإشارة السالبة.","En":"1/2 drops the negative sign."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"2 خارج مجال جيب التمام.","En":"2 is outside the cosine range."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v39 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
