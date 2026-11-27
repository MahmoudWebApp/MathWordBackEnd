-- One-time owner-authorized v74 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v74-grade-1-number-line-count-moves-1$mw$,$mw$number-line-count-moves$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قفزات للخلف","En":"Backward hops"},"Question":{"Ar":"يقف أرنب عند العدد 9 ويرجع حتى العدد 5 على خط الأعداد. كل قفزة تنقله إلى العدد السابق. كم قفزة قام بها؟","En":"A rabbit starts on 9 and hops back to 5 on a number line. Each hop lands on the previous number. How many hops does it make?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الأعداد الواقعة بين الطرفين فقط.","En":"This counts only the numbers between the endpoints."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ نقطة البداية كأنها قفزة.","En":"This counts the starting point as a hop."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا موضع البداية.","En":"This is the starting position."}}],"Hints":[{"Ar":"ارسم خطاً قصيراً وضع إصبعك عند البداية.","En":"Draw a short line and put your finger at the start."},{"Ar":"عدّ القفزات عند الهبوط على كل عدد جديد.","En":"Count a hop each time you land on a new number."}],"Solution":{"Idea":{"Ar":"نعد الحركات بين الأعداد.","En":"Count the moves between numbers."},"FormulaLatex":"9-5=4","Steps":[{"Ar":"أول قفزة من 9 إلى 8.","En":"The first hop goes from 9 to 8."},{"Ar":"بعد 8 يهبط الأرنب على 7 ثم 6 ثم 5.","En":"After 8 the rabbit lands on 7, then 6, then 5."}],"Substitution":{"Ar":"$9-5=4$","En":"$9-5=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربع قفزات للأمام من 5 تعيدنا إلى 9.","En":"Four forward hops from 5 return us to 9."},"CommonError":{"Ar":"حسب الأعداد الواقعة بين الطرفين فقط.","En":"This counts only the numbers between the endpoints."}}}$mw$::jsonb,$mw$نعد الحركات بين الأعداد.

$9-5=4$

1. أول قفزة من 9 إلى 8.

2. بعد 8 يهبط الأرنب على 7 ثم 6 ثم 5.

$4$

أربع قفزات للأمام من 5 تعيدنا إلى 9.

حسب الأعداد الواقعة بين الطرفين فقط.$mw$,$mw$Count the moves between numbers.

$9-5=4$

1. The first hop goes from 9 to 8.

2. After 8 the rabbit lands on 7, then 6, then 5.

$4$

Four forward hops from 5 return us to 9.

This counts only the numbers between the endpoints.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ارسم خطاً قصيراً وضع إصبعك عند البداية.","En":"Draw a short line and put your finger at the start."},{"Ar":"عدّ القفزات عند الهبوط على كل عدد جديد.","En":"Count a hop each time you land on a new number."}],"Solution":{"Idea":{"Ar":"نعد الحركات بين الأعداد.","En":"Count the moves between numbers."},"FormulaLatex":"9-5=4","Steps":[{"Ar":"أول قفزة من 9 إلى 8.","En":"The first hop goes from 9 to 8."},{"Ar":"بعد 8 يهبط الأرنب على 7 ثم 6 ثم 5.","En":"After 8 the rabbit lands on 7, then 6, then 5."}],"Substitution":{"Ar":"$9-5=4$","En":"$9-5=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربع قفزات للأمام من 5 تعيدنا إلى 9.","En":"Four forward hops from 5 return us to 9."},"CommonError":{"Ar":"حسب الأعداد الواقعة بين الطرفين فقط.","En":"This counts only the numbers between the endpoints."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب الأعداد الواقعة بين الطرفين فقط.","En":"This counts only the numbers between the endpoints."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدّ نقطة البداية كأنها قفزة.","En":"This counts the starting point as a hop."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا موضع البداية.","En":"This is the starting position."},"Order":4}]}$mw$),
($mw$growth-v74-grade-1-compare-removals-same-start-1$mw$,$mw$compare-removals-same-start$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أكبر عدد باقٍ","En":"Largest amount left"},"Question":{"Ar":"في كل كيس 10 خرزات. أخذت ليلى خرزة من الأول و3 من الثاني و4 من الثالث و5 من الرابع. كم خرزة في الكيس الذي بقي فيه أكبر عدد؟","En":"Each bag starts with 10 beads. Layla takes one from the first bag, 3 from the second, 4 from the third and 5 from the fourth. How many beads are in the fullest bag now?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي عند أخذ أكبر عدد.","En":"This is what remains after the largest removal."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي في الكيس الثالث.","En":"This is what remains in the third bag."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي في الكيس الثاني.","En":"This is what remains in the second bag."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تأمل عدد الخرزات في الأكياس قبل الأخذ.","En":"Look at how many beads each bag starts with."},{"Ar":"أي كيس فقد أقل عدد من الخرزات؟","En":"Which bag lost the fewest beads?"}],"Solution":{"Idea":{"Ar":"إذا تساوت البدايات يبقى أكثر حيث نأخذ أقل.","En":"With equal starts, taking the least leaves the most."},"FormulaLatex":"10-1=9","Steps":[{"Ar":"أقل عدد مأخوذ هو خرزة واحدة.","En":"The smallest removal is one bead."},{"Ar":"نطرح خرزة من عشر خرزات.","En":"Subtract one bead from ten."}],"Substitution":{"Ar":"$10-1=9$","En":"$10-1=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بقي في الأكياس الأخرى 7 و6 و5 خرزات، وكل منها أقل من 9.","En":"The other bags have 7, 6 and 5 beads, each fewer than 9."},"CommonError":{"Ar":"هذا الباقي عند أخذ أكبر عدد.","En":"This is what remains after the largest removal."}}}$mw$::jsonb,$mw$إذا تساوت البدايات يبقى أكثر حيث نأخذ أقل.

$10-1=9$

1. أقل عدد مأخوذ هو خرزة واحدة.

2. نطرح خرزة من عشر خرزات.

$9$

بقي في الأكياس الأخرى 7 و6 و5 خرزات، وكل منها أقل من 9.

هذا الباقي عند أخذ أكبر عدد.$mw$,$mw$With equal starts, taking the least leaves the most.

$10-1=9$

1. The smallest removal is one bead.

2. Subtract one bead from ten.

$9$

The other bags have 7, 6 and 5 beads, each fewer than 9.

This is what remains after the largest removal.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تأمل عدد الخرزات في الأكياس قبل الأخذ.","En":"Look at how many beads each bag starts with."},{"Ar":"أي كيس فقد أقل عدد من الخرزات؟","En":"Which bag lost the fewest beads?"}],"Solution":{"Idea":{"Ar":"إذا تساوت البدايات يبقى أكثر حيث نأخذ أقل.","En":"With equal starts, taking the least leaves the most."},"FormulaLatex":"10-1=9","Steps":[{"Ar":"أقل عدد مأخوذ هو خرزة واحدة.","En":"The smallest removal is one bead."},{"Ar":"نطرح خرزة من عشر خرزات.","En":"Subtract one bead from ten."}],"Substitution":{"Ar":"$10-1=9$","En":"$10-1=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بقي في الأكياس الأخرى 7 و6 و5 خرزات، وكل منها أقل من 9.","En":"The other bags have 7, 6 and 5 beads, each fewer than 9."},"CommonError":{"Ar":"هذا الباقي عند أخذ أكبر عدد.","En":"This is what remains after the largest removal."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي عند أخذ أكبر عدد.","En":"This is what remains after the largest removal."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي في الكيس الثالث.","En":"This is what remains in the third bag."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا الباقي في الكيس الثاني.","En":"This is what remains in the second bag."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v74-grade-1-minimum-remove-to-fit-1$mw$,$mw$minimum-remove-to-fit$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أماكن في الصندوق","En":"Places in a box"},"Question":{"Ar":"على صينية 12 كوباً. يتسع الصندوق لتسعة أكواب فقط. ما أقل عدد من الأكواب نتركه على الصينية حتى تتسع أماكن الصندوق للباقي؟","En":"There are 12 cups on a tray. A box holds only nine cups. What is the fewest cups to leave on the tray so the rest fit in the box?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبقى عشرة أكواب للصندوق وهو يتسع لتسعة.","En":"Ten cups would need to fit in nine places."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن وضع كوب آخر في الصندوق.","En":"One more cup could still fit in the box."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأماكن داخل الصندوق.","En":"This counts the places inside the box."}}],"Hints":[{"Ar":"متى نترك أقل عدد خارج الصندوق؟","En":"When do we leave the fewest cups outside?"},{"Ar":"املأ أماكن الصندوق ثم عدّ ما بقي.","En":"Fill the places in the box and count what remains."}],"Solution":{"Idea":{"Ar":"نملأ كل مكان حتى نترك أقل عدد ممكن.","En":"Fill every place to leave the fewest cups outside."},"FormulaLatex":"12-9=3","Steps":[{"Ar":"نضع تسعة أكواب في الصندوق.","En":"Put nine cups in the box."},{"Ar":"نطرح الأكواب الموضوعة من العدد الكلي.","En":"Subtract the packed cups from the total."}],"Substitution":{"Ar":"$12-9=3$","En":"$12-9=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا تركنا كوبين فقط فسنحتاج إلى عشرة أماكن.","En":"Leaving only two would require ten places."},"CommonError":{"Ar":"يبقى عشرة أكواب للصندوق وهو يتسع لتسعة.","En":"Ten cups would need to fit in nine places."}}}$mw$::jsonb,$mw$نملأ كل مكان حتى نترك أقل عدد ممكن.

$12-9=3$

1. نضع تسعة أكواب في الصندوق.

2. نطرح الأكواب الموضوعة من العدد الكلي.

$3$

إذا تركنا كوبين فقط فسنحتاج إلى عشرة أماكن.

يبقى عشرة أكواب للصندوق وهو يتسع لتسعة.$mw$,$mw$Fill every place to leave the fewest cups outside.

$12-9=3$

1. Put nine cups in the box.

2. Subtract the packed cups from the total.

$3$

Leaving only two would require ten places.

Ten cups would need to fit in nine places.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"متى نترك أقل عدد خارج الصندوق؟","En":"When do we leave the fewest cups outside?"},{"Ar":"املأ أماكن الصندوق ثم عدّ ما بقي.","En":"Fill the places in the box and count what remains."}],"Solution":{"Idea":{"Ar":"نملأ كل مكان حتى نترك أقل عدد ممكن.","En":"Fill every place to leave the fewest cups outside."},"FormulaLatex":"12-9=3","Steps":[{"Ar":"نضع تسعة أكواب في الصندوق.","En":"Put nine cups in the box."},{"Ar":"نطرح الأكواب الموضوعة من العدد الكلي.","En":"Subtract the packed cups from the total."}],"Substitution":{"Ar":"$12-9=3$","En":"$12-9=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا تركنا كوبين فقط فسنحتاج إلى عشرة أماكن.","En":"Leaving only two would require ten places."},"CommonError":{"Ar":"يبقى عشرة أكواب للصندوق وهو يتسع لتسعة.","En":"Ten cups would need to fit in nine places."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يبقى عشرة أكواب للصندوق وهو يتسع لتسعة.","En":"Ten cups would need to fit in nine places."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يمكن وضع كوب آخر في الصندوق.","En":"One more cup could still fit in the box."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأماكن داخل الصندوق.","En":"This counts the places inside the box."},"Order":4}]}$mw$),
($mw$growth-v74-grade-1-remove-equal-sets-empty-1$mw$,$mw$remove-equal-sets-empty$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طرح مجموعتين متساويتين","En":"Removing equal groups"},"Question":{"Ar":"مع ريم 8 بطاقات. وضعتها كلها في ظرفين بالتساوي. بعد أن أعطت الظرفين لصديقتها، أي تعبير يصف عدد البطاقات التي بقيت مع ريم؟","En":"Reem puts all 8 of her cards equally into two envelopes. She gives both envelopes to a friend. Which expression describes how many cards Reem has left?"},"Options":[{"LatexCode":"8-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح عدد الأظرف بدلاً من عدد البطاقات.","En":"This subtracts envelopes instead of cards."}},{"LatexCode":"8-4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يصف إعطاء ظرف واحد.","En":"This describes giving away one envelope."}},{"LatexCode":"8-4-4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8+4+4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع يزيد العدد عند إعطاء البطاقات.","En":"Addition increases the count when cards are given away."}}],"Hints":[{"Ar":"مثل البطاقات بثماني نقاط وقسمها بالتساوي.","En":"Draw eight dots and split them equally."},{"Ar":"اشطب مجموعة عند إعطاء كل ظرف.","En":"Cross out a group for each envelope given away."}],"Solution":{"Idea":{"Ar":"نطرح محتوى كل ظرف عند إعطائه.","En":"Subtract the contents of each envelope as it leaves."},"FormulaLatex":"8-4-4=0","Steps":[{"Ar":"في كل ظرف أربع بطاقات لأن أربعاً وأربعاً تساوي ثمانياً.","En":"Each envelope holds four because four and four make eight."},{"Ar":"نطرح أربعاً للظرف الأول وأربعاً للثاني.","En":"Subtract four for the first envelope and four for the second."}],"Substitution":{"Ar":"$8-4-4=0$","En":"$8-4-4=0$"},"Result":{"Ar":"$8-4-4$","En":"$8-4-4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أعطت ريم كل البطاقات، وقيمة التعبير صفر.","En":"Reem gave away every card and the expression equals zero."},"CommonError":{"Ar":"طرح عدد الأظرف بدلاً من عدد البطاقات.","En":"This subtracts envelopes instead of cards."}}}$mw$::jsonb,$mw$نطرح محتوى كل ظرف عند إعطائه.

$8-4-4=0$

1. في كل ظرف أربع بطاقات لأن أربعاً وأربعاً تساوي ثمانياً.

2. نطرح أربعاً للظرف الأول وأربعاً للثاني.

$8-4-4$

أعطت ريم كل البطاقات، وقيمة التعبير صفر.

طرح عدد الأظرف بدلاً من عدد البطاقات.$mw$,$mw$Subtract the contents of each envelope as it leaves.

$8-4-4=0$

1. Each envelope holds four because four and four make eight.

2. Subtract four for the first envelope and four for the second.

$8-4-4$

Reem gave away every card and the expression equals zero.

This subtracts envelopes instead of cards.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"مثل البطاقات بثماني نقاط وقسمها بالتساوي.","En":"Draw eight dots and split them equally."},{"Ar":"اشطب مجموعة عند إعطاء كل ظرف.","En":"Cross out a group for each envelope given away."}],"Solution":{"Idea":{"Ar":"نطرح محتوى كل ظرف عند إعطائه.","En":"Subtract the contents of each envelope as it leaves."},"FormulaLatex":"8-4-4=0","Steps":[{"Ar":"في كل ظرف أربع بطاقات لأن أربعاً وأربعاً تساوي ثمانياً.","En":"Each envelope holds four because four and four make eight."},{"Ar":"نطرح أربعاً للظرف الأول وأربعاً للثاني.","En":"Subtract four for the first envelope and four for the second."}],"Substitution":{"Ar":"$8-4-4=0$","En":"$8-4-4=0$"},"Result":{"Ar":"$8-4-4$","En":"$8-4-4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أعطت ريم كل البطاقات، وقيمة التعبير صفر.","En":"Reem gave away every card and the expression equals zero."},"CommonError":{"Ar":"طرح عدد الأظرف بدلاً من عدد البطاقات.","En":"This subtracts envelopes instead of cards."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح عدد الأظرف بدلاً من عدد البطاقات.","En":"This subtracts envelopes instead of cards."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يصف إعطاء ظرف واحد.","En":"This describes giving away one envelope."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الجمع يزيد العدد عند إعطاء البطاقات.","En":"Addition increases the count when cards are given away."},"Order":4}]}$mw$),
($mw$growth-v74-grade-2-two-rows-share-corner-1$mw$,$mw$two-rows-share-corner$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مكعب الزاوية","En":"The corner cube"},"Question":{"Ar":"رتبت هدى مكعبات على شكل حرف L. عدّت 6 مكعبات في الصف الأفقي و4 في العمودي. مكعب الزاوية مشترك بين الصفين. كم مكعباً استعملت؟","En":"Huda makes an L with cubes. She counts 6 cubes along the horizontal row and 4 along the vertical row. The rows share the corner cube. How many cubes did she use?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عُدّ مكعب الزاوية مرتين.","En":"This counts the corner twice."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حُذف مكعب الزاوية من الصفين كليهما.","En":"This leaves the corner out of both rows."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب يحسب مستطيلاً كاملاً من المكعبات.","En":"Multiplication counts a full rectangle of cubes."}}],"Hints":[{"Ar":"ارسم الصفين بحيث يلتقيان في مكعب واحد.","En":"Sketch the two rows meeting at one cube."},{"Ar":"لو جمعت العددين، فكم مرة حسبت الزاوية؟","En":"If you add the two counts, how often have you counted the corner?"}],"Solution":{"Idea":{"Ar":"نعد كل مكعب مرة واحدة.","En":"Count each cube exactly once."},"FormulaLatex":"6+4-1=9","Steps":[{"Ar":"نعد المكعبات الأفقية الستة بما فيها الزاوية.","En":"Count all six horizontal cubes including the corner."},{"Ar":"تبقى ثلاثة مكعبات رأسية لم نعدها.","En":"Three vertical cubes have yet to be counted."}],"Substitution":{"Ar":"$6+4-1=9$","En":"$6+4-1=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بدءاً بالعمودي نجد أربعة مكعبات ثم خمسة جديدة في الأفقي.","En":"Starting vertically gives four cubes and then five new horizontal ones."},"CommonError":{"Ar":"عُدّ مكعب الزاوية مرتين.","En":"This counts the corner twice."}}}$mw$::jsonb,$mw$نعد كل مكعب مرة واحدة.

$6+4-1=9$

1. نعد المكعبات الأفقية الستة بما فيها الزاوية.

2. تبقى ثلاثة مكعبات رأسية لم نعدها.

$9$

بدءاً بالعمودي نجد أربعة مكعبات ثم خمسة جديدة في الأفقي.

عُدّ مكعب الزاوية مرتين.$mw$,$mw$Count each cube exactly once.

$6+4-1=9$

1. Count all six horizontal cubes including the corner.

2. Three vertical cubes have yet to be counted.

$9$

Starting vertically gives four cubes and then five new horizontal ones.

This counts the corner twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ارسم الصفين بحيث يلتقيان في مكعب واحد.","En":"Sketch the two rows meeting at one cube."},{"Ar":"لو جمعت العددين، فكم مرة حسبت الزاوية؟","En":"If you add the two counts, how often have you counted the corner?"}],"Solution":{"Idea":{"Ar":"نعد كل مكعب مرة واحدة.","En":"Count each cube exactly once."},"FormulaLatex":"6+4-1=9","Steps":[{"Ar":"نعد المكعبات الأفقية الستة بما فيها الزاوية.","En":"Count all six horizontal cubes including the corner."},{"Ar":"تبقى ثلاثة مكعبات رأسية لم نعدها.","En":"Three vertical cubes have yet to be counted."}],"Substitution":{"Ar":"$6+4-1=9$","En":"$6+4-1=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بدءاً بالعمودي نجد أربعة مكعبات ثم خمسة جديدة في الأفقي.","En":"Starting vertically gives four cubes and then five new horizontal ones."},"CommonError":{"Ar":"عُدّ مكعب الزاوية مرتين.","En":"This counts the corner twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عُدّ مكعب الزاوية مرتين.","En":"This counts the corner twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حُذف مكعب الزاوية من الصفين كليهما.","En":"This leaves the corner out of both rows."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الضرب يحسب مستطيلاً كاملاً من المكعبات.","En":"Multiplication counts a full rectangle of cubes."},"Order":4}]}$mw$),
($mw$growth-v74-grade-2-count-gaps-in-line-1$mw$,$mw$count-gaps-in-line$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"شرائط بين الأعلام","En":"Ribbons between flags"},"Question":{"Ar":"في صف مستقيم 7 أعلام. نربط كل علم بالعلم التالي بشريط واحد. كم شريطاً نحتاج؟","En":"Seven flags stand in a straight row. One ribbon joins each flag to the next. How many ribbons are needed?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العلم الأخير ليس بعده علم آخر.","En":"The last flag has no next flag."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إضافة واحد تحسب فراغات خارج الصف.","En":"Adding one includes gaps outside the row."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ طرفي كل وصلة لا يعطينا عدد الشرائط.","En":"Counting two ends per flag does not give the number of ribbons."}}],"Hints":[{"Ar":"مثّل الأعلام بنقاط على خط.","En":"Draw the flags as dots in a row."},{"Ar":"صل كل نقطتين متجاورتين مرة واحدة.","En":"Join each neighboring pair of dots once."}],"Solution":{"Idea":{"Ar":"نعد المسافات بين الأعلام المتجاورة.","En":"Count the gaps between neighboring flags."},"FormulaLatex":"7-1=6","Steps":[{"Ar":"العلم الأول وحده لا يحتاج إلى شريط.","En":"The first flag by itself needs no ribbon."},{"Ar":"كل علم من الأعلام الستة التالية يضيف شريطاً واحداً.","En":"Each of the next six flags adds one ribbon."}],"Substitution":{"Ar":"$7-1=6$","En":"$7-1=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الشرائط تصل الأعلام من الأول إلى الثاني حتى السادس إلى السابع.","En":"The ribbons run from flags one and two through flags six and seven."},"CommonError":{"Ar":"العلم الأخير ليس بعده علم آخر.","En":"The last flag has no next flag."}}}$mw$::jsonb,$mw$نعد المسافات بين الأعلام المتجاورة.

$7-1=6$

1. العلم الأول وحده لا يحتاج إلى شريط.

2. كل علم من الأعلام الستة التالية يضيف شريطاً واحداً.

$6$

الشرائط تصل الأعلام من الأول إلى الثاني حتى السادس إلى السابع.

العلم الأخير ليس بعده علم آخر.$mw$,$mw$Count the gaps between neighboring flags.

$7-1=6$

1. The first flag by itself needs no ribbon.

2. Each of the next six flags adds one ribbon.

$6$

The ribbons run from flags one and two through flags six and seven.

The last flag has no next flag.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"مثّل الأعلام بنقاط على خط.","En":"Draw the flags as dots in a row."},{"Ar":"صل كل نقطتين متجاورتين مرة واحدة.","En":"Join each neighboring pair of dots once."}],"Solution":{"Idea":{"Ar":"نعد المسافات بين الأعلام المتجاورة.","En":"Count the gaps between neighboring flags."},"FormulaLatex":"7-1=6","Steps":[{"Ar":"العلم الأول وحده لا يحتاج إلى شريط.","En":"The first flag by itself needs no ribbon."},{"Ar":"كل علم من الأعلام الستة التالية يضيف شريطاً واحداً.","En":"Each of the next six flags adds one ribbon."}],"Substitution":{"Ar":"$7-1=6$","En":"$7-1=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الشرائط تصل الأعلام من الأول إلى الثاني حتى السادس إلى السابع.","En":"The ribbons run from flags one and two through flags six and seven."},"CommonError":{"Ar":"العلم الأخير ليس بعده علم آخر.","En":"The last flag has no next flag."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"العلم الأخير ليس بعده علم آخر.","En":"The last flag has no next flag."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"إضافة واحد تحسب فراغات خارج الصف.","En":"Adding one includes gaps outside the row."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ طرفي كل وصلة لا يعطينا عدد الشرائط.","En":"Counting two ends per flag does not give the number of ribbons."},"Order":4}]}$mw$),
($mw$growth-v74-grade-2-count-around-ring-stop-at-start-1$mw$,$mw$count-around-ring-stop-at-start$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"العد حول حلقة","En":"Counting around a ring"},"Question":{"Ar":"في حلقة خرز خرزة حمراء واحدة. بدأت سلمى منها فعدّتها 1، ثم عدّت كل خرزة بالترتيب. عند وصولها إلى الحمراء مرة أخرى قالت 13. كم خرزة في الحلقة؟","En":"A bead ring has one red bead. Salma starts there, calling it 1, and counts each bead in order. When she next reaches the red bead she says 13. How many beads are on the ring?"},"Options":[{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف ظهورَي الخرزة الحمراء معاً.","En":"This removes both counts of the red bead."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب خرزة البداية مرتين.","En":"This counts the starting bead twice."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف خرزة رغم تكرار عد خرزة البداية.","En":"This adds a bead even though the starting bead was counted again."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تخيل وضع علامة على أول خرزة تعدها.","En":"Imagine marking the first bead you count."},{"Ar":"هل تمثل آخر كلمة عددية خرزة جديدة؟","En":"Does the last number spoken refer to a new bead?"}],"Solution":{"Idea":{"Ar":"نتوقف قبل عد خرزة البداية مرة ثانية.","En":"Stop before counting the first bead a second time."},"FormulaLatex":"13-1=12","Steps":[{"Ar":"الأعداد من 1 حتى 12 تشير إلى خرزات مختلفة.","En":"Counts 1 through 12 refer to different beads."},{"Ar":"العد 13 يعود إلى خرزة سبق عدها.","En":"Count 13 revisits a bead already counted."}],"Substitution":{"Ar":"$13-1=12$","En":"$13-1=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"في حلقة من 12 خرزة نعود بعد الخرزة الثانية عشرة إلى الأولى.","En":"On a ring of 12 beads, the twelfth bead is followed by the first again."},"CommonError":{"Ar":"حذف ظهورَي الخرزة الحمراء معاً.","En":"This removes both counts of the red bead."}}}$mw$::jsonb,$mw$نتوقف قبل عد خرزة البداية مرة ثانية.

$13-1=12$

1. الأعداد من 1 حتى 12 تشير إلى خرزات مختلفة.

2. العد 13 يعود إلى خرزة سبق عدها.

$12$

في حلقة من 12 خرزة نعود بعد الخرزة الثانية عشرة إلى الأولى.

حذف ظهورَي الخرزة الحمراء معاً.$mw$,$mw$Stop before counting the first bead a second time.

$13-1=12$

1. Counts 1 through 12 refer to different beads.

2. Count 13 revisits a bead already counted.

$12$

On a ring of 12 beads, the twelfth bead is followed by the first again.

This removes both counts of the red bead.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل وضع علامة على أول خرزة تعدها.","En":"Imagine marking the first bead you count."},{"Ar":"هل تمثل آخر كلمة عددية خرزة جديدة؟","En":"Does the last number spoken refer to a new bead?"}],"Solution":{"Idea":{"Ar":"نتوقف قبل عد خرزة البداية مرة ثانية.","En":"Stop before counting the first bead a second time."},"FormulaLatex":"13-1=12","Steps":[{"Ar":"الأعداد من 1 حتى 12 تشير إلى خرزات مختلفة.","En":"Counts 1 through 12 refer to different beads."},{"Ar":"العد 13 يعود إلى خرزة سبق عدها.","En":"Count 13 revisits a bead already counted."}],"Substitution":{"Ar":"$13-1=12$","En":"$13-1=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"في حلقة من 12 خرزة نعود بعد الخرزة الثانية عشرة إلى الأولى.","En":"On a ring of 12 beads, the twelfth bead is followed by the first again."},"CommonError":{"Ar":"حذف ظهورَي الخرزة الحمراء معاً.","En":"This removes both counts of the red bead."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حذف ظهورَي الخرزة الحمراء معاً.","En":"This removes both counts of the red bead."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب خرزة البداية مرتين.","En":"This counts the starting bead twice."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف خرزة رغم تكرار عد خرزة البداية.","En":"This adds a bead even though the starting bead was counted again."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v74-grade-2-count-by-group-with-hidden-bundle-1$mw$,$mw$count-by-group-with-hidden-bundle$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"رزم أعواد العد","En":"Bundles of counting sticks"},"Question":{"Ar":"كل ربطة فيها عشرة أعواد. مع ندى 34 عوداً، منها أربعة أعواد مفردة والباقي في ربطات. ترى ندى ربطتين على الطاولة والبقية في حقيبة. كم ربطة في الحقيبة؟","En":"Each bundle holds ten sticks. Nada has 34 sticks, four loose and the rest bundled. She sees two bundles on the table. The other bundles are in a bag. How many bundles are in the bag?"},"Options":[{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الربطات الظاهرة.","En":"This counts the visible bundles."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الربطات كلها.","En":"This counts all the bundles."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأعواد المفردة.","En":"This counts the loose sticks."}}],"Hints":[{"Ar":"ضع الأعواد المفردة جانباً في ذهنك.","En":"Set the loose sticks aside in your mind."},{"Ar":"بعد العد بالعشرات، أي الربطات حسبتها بالفعل على الطاولة؟","En":"After counting by tens, which bundles can you already see on the table?"}],"Solution":{"Idea":{"Ar":"نعد بالعشرات ثم نميز الربطات الظاهرة من المخفية.","En":"Count by tens and separate visible bundles from hidden ones."},"FormulaLatex":"34=10+10+10+4","Steps":[{"Ar":"بعد ترك الأعواد المفردة نعد 10، 20، 30 أي ثلاث ربطات.","En":"Set the loose sticks aside and count 10, 20, 30: three bundles."},{"Ar":"ربطتان من الثلاث على الطاولة.","En":"Two of the three bundles are on the table."}],"Substitution":{"Ar":"$34=10+10+10+4$","En":"$34=10+10+10+4$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ربطة مخفية وربطتان ظاهرتان وأربعة أعواد مفردة تعطي 34 عوداً.","En":"One hidden bundle, two visible bundles and four loose sticks give 34 sticks."},"CommonError":{"Ar":"هذا عدد الربطات الظاهرة.","En":"This counts the visible bundles."}}}$mw$::jsonb,$mw$نعد بالعشرات ثم نميز الربطات الظاهرة من المخفية.

$34=10+10+10+4$

1. بعد ترك الأعواد المفردة نعد 10، 20، 30 أي ثلاث ربطات.

2. ربطتان من الثلاث على الطاولة.

$1$

ربطة مخفية وربطتان ظاهرتان وأربعة أعواد مفردة تعطي 34 عوداً.

هذا عدد الربطات الظاهرة.$mw$,$mw$Count by tens and separate visible bundles from hidden ones.

$34=10+10+10+4$

1. Set the loose sticks aside and count 10, 20, 30: three bundles.

2. Two of the three bundles are on the table.

$1$

One hidden bundle, two visible bundles and four loose sticks give 34 sticks.

This counts the visible bundles.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع الأعواد المفردة جانباً في ذهنك.","En":"Set the loose sticks aside in your mind."},{"Ar":"بعد العد بالعشرات، أي الربطات حسبتها بالفعل على الطاولة؟","En":"After counting by tens, which bundles can you already see on the table?"}],"Solution":{"Idea":{"Ar":"نعد بالعشرات ثم نميز الربطات الظاهرة من المخفية.","En":"Count by tens and separate visible bundles from hidden ones."},"FormulaLatex":"34=10+10+10+4","Steps":[{"Ar":"بعد ترك الأعواد المفردة نعد 10، 20، 30 أي ثلاث ربطات.","En":"Set the loose sticks aside and count 10, 20, 30: three bundles."},{"Ar":"ربطتان من الثلاث على الطاولة.","En":"Two of the three bundles are on the table."}],"Substitution":{"Ar":"$34=10+10+10+4$","En":"$34=10+10+10+4$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ربطة مخفية وربطتان ظاهرتان وأربعة أعواد مفردة تعطي 34 عوداً.","En":"One hidden bundle, two visible bundles and four loose sticks give 34 sticks."},"CommonError":{"Ar":"هذا عدد الربطات الظاهرة.","En":"This counts the visible bundles."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الربطات الظاهرة.","En":"This counts the visible bundles."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الربطات كلها.","En":"This counts all the bundles."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأعواد المفردة.","En":"This counts the loose sticks."},"Order":4}]}$mw$),
($mw$growth-v74-grade-1-choose-subtrahend-for-bounded-result-1$mw$,$mw$choose-subtrahend-for-bounded-result$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الباقي بين عددين","En":"A remainder between two numbers"},"Question":{"Ar":"مع سارة 10 ملصقات. تريد أن يبقى معها أكثر من 5 وأقل من 7 بعد أن تعطي بعض الملصقات لأخيها. كم ملصقاً تعطيه؟","En":"Sara has 10 stickers. After giving some to her brother she wants more than 5 but fewer than 7 left. How many stickers should she give him?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبقى سبعة، والمطلوب أقل من سبعة.","En":"Seven would remain, but she wants fewer than seven."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبقى خمسة، والمطلوب أكثر من خمسة.","En":"Five would remain, but she wants more than five."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستة هو العدد الذي تريد الاحتفاظ به.","En":"Six is the number she wants to keep."}}],"Hints":[{"Ar":"ضع 5 و7 على خط الأعداد.","En":"Mark 5 and 7 on a number line."},{"Ar":"أي عدد تريد سارة أن تحتفظ به؟","En":"How many does Sara want to keep?"}],"Solution":{"Idea":{"Ar":"نحدد الباقي من الشرطين ثم نحسب ما تعطيه.","En":"Find the remainder from both clues, then find how many to give."},"FormulaLatex":"10-6=4","Steps":[{"Ar":"العدد الوحيد بين خمسة وسبعة هو ستة.","En":"The only whole number between five and seven is six."},{"Ar":"نحتفظ بستة من العشرة ونعطي الباقي.","En":"Keep six of the ten and give away the rest."}],"Substitution":{"Ar":"$10-6=4$","En":"$10-6=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد إعطاء أربعة يبقى ستة، وهو أكبر من خمسة وأصغر من سبعة.","En":"Giving four leaves six, which is greater than five and less than seven."},"CommonError":{"Ar":"يبقى سبعة، والمطلوب أقل من سبعة.","En":"Seven would remain, but she wants fewer than seven."}}}$mw$::jsonb,$mw$نحدد الباقي من الشرطين ثم نحسب ما تعطيه.

$10-6=4$

1. العدد الوحيد بين خمسة وسبعة هو ستة.

2. نحتفظ بستة من العشرة ونعطي الباقي.

$4$

بعد إعطاء أربعة يبقى ستة، وهو أكبر من خمسة وأصغر من سبعة.

يبقى سبعة، والمطلوب أقل من سبعة.$mw$,$mw$Find the remainder from both clues, then find how many to give.

$10-6=4$

1. The only whole number between five and seven is six.

2. Keep six of the ten and give away the rest.

$4$

Giving four leaves six, which is greater than five and less than seven.

Seven would remain, but she wants fewer than seven.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع 5 و7 على خط الأعداد.","En":"Mark 5 and 7 on a number line."},{"Ar":"أي عدد تريد سارة أن تحتفظ به؟","En":"How many does Sara want to keep?"}],"Solution":{"Idea":{"Ar":"نحدد الباقي من الشرطين ثم نحسب ما تعطيه.","En":"Find the remainder from both clues, then find how many to give."},"FormulaLatex":"10-6=4","Steps":[{"Ar":"العدد الوحيد بين خمسة وسبعة هو ستة.","En":"The only whole number between five and seven is six."},{"Ar":"نحتفظ بستة من العشرة ونعطي الباقي.","En":"Keep six of the ten and give away the rest."}],"Substitution":{"Ar":"$10-6=4$","En":"$10-6=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد إعطاء أربعة يبقى ستة، وهو أكبر من خمسة وأصغر من سبعة.","En":"Giving four leaves six, which is greater than five and less than seven."},"CommonError":{"Ar":"يبقى سبعة، والمطلوب أقل من سبعة.","En":"Seven would remain, but she wants fewer than seven."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يبقى سبعة، والمطلوب أقل من سبعة.","En":"Seven would remain, but she wants fewer than seven."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يبقى خمسة، والمطلوب أكثر من خمسة.","En":"Five would remain, but she wants more than five."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ستة هو العدد الذي تريد الاحتفاظ به.","En":"Six is the number she wants to keep."},"Order":4}]}$mw$),
($mw$growth-v74-grade-2-same-collection-different-counting-units-1$mw$,$mw$same-collection-different-counting-units$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدّ الصواني وعدّ الأكواب","En":"Counting trays and cups"},"Question":{"Ar":"على كل صينية خمسة أكواب. تعدّ هالة الصواني فتقول 1، 2، 3، وتعدّ هند الأكواب بالخمسات فتقول 5، 10، 15. إذا تابعتا بالترتيب نفسه، فما العدد الذي تقوله هند عندما تقول هالة 6؟","En":"Each tray holds five cups. Hala counts trays, saying 1, 2, 3. Hind counts cups in fives, saying 5, 10, 15. If both continue in the same way, what does Hind say when Hala says 6?"},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأكواب عند الصينية الرابعة.","En":"This is the cup count at the fourth tray."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأكواب عند الصينية الخامسة.","En":"This is the cup count at the fifth tray."}},{"LatexCode":"30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأكواب عند الصينية السابعة.","En":"This is the cup count at the seventh tray."}}],"Hints":[{"Ar":"هل تعدّ الطفلتان الشيء نفسه؟","En":"Are both children counting the same thing?"},{"Ar":"اكتب عدد الأكواب أسفل رقم كل صينية.","En":"Write the running cup count below each tray number."}],"Solution":{"Idea":{"Ar":"نقرن كل صينية بعدد الأكواب حتى تلك الصينية.","En":"Match each tray with the running total of cups."},"FormulaLatex":"15+5+5+5=30","Steps":[{"Ar":"عند الصينية الثالثة عُدّ خمسة عشر كوباً.","En":"At tray three, fifteen cups have been counted."},{"Ar":"نزيد خمسة عند كل صينية تالية: عشرون ثم خمسة وعشرون ثم ثلاثون.","En":"Add five for each next tray: twenty, twenty-five, thirty."}],"Substitution":{"Ar":"$15+5+5+5=30$","En":"$15+5+5+5=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا رتبنا ثلاثين كوباً في مجموعات من خمسة نحصل على ست صوانٍ.","En":"Thirty cups form six groups of five."},"CommonError":{"Ar":"هذا عدد الأكواب عند الصينية الرابعة.","En":"This is the cup count at the fourth tray."}}}$mw$::jsonb,$mw$نقرن كل صينية بعدد الأكواب حتى تلك الصينية.

$15+5+5+5=30$

1. عند الصينية الثالثة عُدّ خمسة عشر كوباً.

2. نزيد خمسة عند كل صينية تالية: عشرون ثم خمسة وعشرون ثم ثلاثون.

$30$

إذا رتبنا ثلاثين كوباً في مجموعات من خمسة نحصل على ست صوانٍ.

هذا عدد الأكواب عند الصينية الرابعة.$mw$,$mw$Match each tray with the running total of cups.

$15+5+5+5=30$

1. At tray three, fifteen cups have been counted.

2. Add five for each next tray: twenty, twenty-five, thirty.

$30$

Thirty cups form six groups of five.

This is the cup count at the fourth tray.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل تعدّ الطفلتان الشيء نفسه؟","En":"Are both children counting the same thing?"},{"Ar":"اكتب عدد الأكواب أسفل رقم كل صينية.","En":"Write the running cup count below each tray number."}],"Solution":{"Idea":{"Ar":"نقرن كل صينية بعدد الأكواب حتى تلك الصينية.","En":"Match each tray with the running total of cups."},"FormulaLatex":"15+5+5+5=30","Steps":[{"Ar":"عند الصينية الثالثة عُدّ خمسة عشر كوباً.","En":"At tray three, fifteen cups have been counted."},{"Ar":"نزيد خمسة عند كل صينية تالية: عشرون ثم خمسة وعشرون ثم ثلاثون.","En":"Add five for each next tray: twenty, twenty-five, thirty."}],"Substitution":{"Ar":"$15+5+5+5=30$","En":"$15+5+5+5=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا رتبنا ثلاثين كوباً في مجموعات من خمسة نحصل على ست صوانٍ.","En":"Thirty cups form six groups of five."},"CommonError":{"Ar":"هذا عدد الأكواب عند الصينية الرابعة.","En":"This is the cup count at the fourth tray."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأكواب عند الصينية الرابعة.","En":"This is the cup count at the fourth tray."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأكواب عند الصينية الخامسة.","En":"This is the cup count at the fifth tray."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأكواب عند الصينية السابعة.","En":"This is the cup count at the seventh tray."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v74 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
