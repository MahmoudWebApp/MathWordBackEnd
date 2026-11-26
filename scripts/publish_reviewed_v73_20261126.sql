-- One-time owner-authorized v73 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v73-grade-2-solid-identify-two-triangle-three-rectangle-faces-1$mw$,$mw$solid-identify-two-triangle-three-rectangle-faces$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز مجسم من أوجهه","En":"Identifying a solid from its faces"},"Question":{"Ar":"مجسم له وجهان مثلثان متطابقان وثلاثة أوجه مستطيلة. أي مجسم هو؟ A مكعب، B منشور ثلاثي، C أسطوانة، D هرم قاعدته مربعة.","En":"A solid has two congruent triangular faces and three rectangular faces. Which solid is it? A: cube; B: triangular prism; C: cylinder; D: square-based pyramid."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أوجه المكعب مربعة.","En":"A cube has square faces."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"للأسطوانة قاعدتان دائريتان وسطح منحن.","En":"A cylinder has circular bases and a curved surface."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"للهرم المربع أربع أوجه مثلثة وقاعدة مربعة.","En":"A square-based pyramid has four triangular faces and a square base."}}],"Hints":[{"Ar":"ابدأ بالبحث عن المجسم ذي القاعدتين المثلثتين.","En":"Look for the solid with two triangular bases."},{"Ar":"تأكد من شكل الأوجه التي تصل القاعدتين.","En":"Check the shapes of the connecting faces."}],"Solution":{"Idea":{"Ar":"نميز المجسم من أشكال أوجهه، لا من عددها فقط.","En":"Identify the solid by the shapes of its faces, not just their number."},"FormulaLatex":"2+3=5","Steps":[{"Ar":"نحدد القاعدتين المثلثتين ثم الأوجه المستطيلة الثلاثة.","En":"Identify the two triangular bases and the three rectangular faces."},{"Ar":"هذه الأوجه الخمسة هي أوجه المنشور الثلاثي القائم.","En":"These five faces belong to a right triangular prism."}],"Substitution":{"Ar":"$2+3=5$","En":"$2+3=5$"},"Result":{"Ar":"B — منشور ثلاثي.","En":"B — triangular prism."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المنشور الثلاثي القائم يحقق الوصف: وجهان مثلثان وثلاثة مستطيلات.","En":"A right triangular prism fits: two triangular faces and three rectangular faces."},"CommonError":{"Ar":"أوجه المكعب مربعة.","En":"A cube has square faces."}}}$mw$::jsonb,$mw$نميز المجسم من أشكال أوجهه، لا من عددها فقط.

$2+3=5$

1. نحدد القاعدتين المثلثتين ثم الأوجه المستطيلة الثلاثة.

2. هذه الأوجه الخمسة هي أوجه المنشور الثلاثي القائم.

$2+3=5$

B — منشور ثلاثي.

المنشور الثلاثي القائم يحقق الوصف: وجهان مثلثان وثلاثة مستطيلات.

أوجه المكعب مربعة.$mw$,$mw$Identify the solid by the shapes of its faces, not just their number.

$2+3=5$

1. Identify the two triangular bases and the three rectangular faces.

2. These five faces belong to a right triangular prism.

$2+3=5$

B — triangular prism.

A right triangular prism fits: two triangular faces and three rectangular faces.

A cube has square faces.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالبحث عن المجسم ذي القاعدتين المثلثتين.","En":"Look for the solid with two triangular bases."},{"Ar":"تأكد من شكل الأوجه التي تصل القاعدتين.","En":"Check the shapes of the connecting faces."}],"Solution":{"Idea":{"Ar":"نميز المجسم من أشكال أوجهه، لا من عددها فقط.","En":"Identify the solid by the shapes of its faces, not just their number."},"FormulaLatex":"2+3=5","Steps":[{"Ar":"نحدد القاعدتين المثلثتين ثم الأوجه المستطيلة الثلاثة.","En":"Identify the two triangular bases and the three rectangular faces."},{"Ar":"هذه الأوجه الخمسة هي أوجه المنشور الثلاثي القائم.","En":"These five faces belong to a right triangular prism."}],"Substitution":{"Ar":"$2+3=5$","En":"$2+3=5$"},"Result":{"Ar":"B — منشور ثلاثي.","En":"B — triangular prism."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المنشور الثلاثي القائم يحقق الوصف: وجهان مثلثان وثلاثة مستطيلات.","En":"A right triangular prism fits: two triangular faces and three rectangular faces."},"CommonError":{"Ar":"أوجه المكعب مربعة.","En":"A cube has square faces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أوجه المكعب مربعة.","En":"A cube has square faces."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"للأسطوانة قاعدتان دائريتان وسطح منحن.","En":"A cylinder has circular bases and a curved surface."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"للهرم المربع أربع أوجه مثلثة وقاعدة مربعة.","En":"A square-based pyramid has four triangular faces and a square base."},"Order":4}]}$mw$),
($mw$growth-v73-grade-1-subtraction-make-ten-decomposition-select-1$mw$,$mw$subtraction-make-ten-decomposition-select$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الطرح بالمرور عبر العشرة","En":"Subtracting through ten"},"Question":{"Ar":"يريد طفل حساب $16-9$ بطرح 6 أولاً ليصل إلى 10. كم يجب أن يطرح بعد ذلك؟","En":"A child wants to calculate $16-9$ by subtracting six first to reach ten. How much must be subtracted next?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستكون الكمية المطروحة كلها 8 فقط.","En":"The total removed would be only eight."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستكون الكمية المطروحة كلها 12.","En":"The total removed would be twelve."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يطرح التسعة كاملة مرة أخرى.","En":"Subtracts the full nine again."}}],"Hints":[{"Ar":"كم يبقى من التسعة بعد طرح الستة؟","En":"How much of nine remains after removing six?"},{"Ar":"يجب أن يكون مجموع المقدارين المطروحين تسعة.","En":"The two subtractions together must remove nine."}],"Solution":{"Idea":{"Ar":"نفكك التسعة إلى جزأين أحدهما 6.","En":"Split nine into two parts, one of which is six."},"FormulaLatex":"9=6+3","Steps":[{"Ar":"$16-6=10$","En":"$16-6=10$"},{"Ar":"$10-3=7$","En":"$10-3=7$"}],"Substitution":{"Ar":"$9=6+3$","En":"$9=6+3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6+3=9$ و$16-9=7$.","En":"$6+3=9$ and $16-9=7$."},"CommonError":{"Ar":"ستكون الكمية المطروحة كلها 8 فقط.","En":"The total removed would be only eight."}}}$mw$::jsonb,$mw$نفكك التسعة إلى جزأين أحدهما 6.

$9=6+3$

1. $16-6=10$

2. $10-3=7$

$9=6+3$

$3$

$6+3=9$ و$16-9=7$.

ستكون الكمية المطروحة كلها 8 فقط.$mw$,$mw$Split nine into two parts, one of which is six.

$9=6+3$

1. $16-6=10$

2. $10-3=7$

$9=6+3$

$3$

$6+3=9$ and $16-9=7$.

The total removed would be only eight.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم يبقى من التسعة بعد طرح الستة؟","En":"How much of nine remains after removing six?"},{"Ar":"يجب أن يكون مجموع المقدارين المطروحين تسعة.","En":"The two subtractions together must remove nine."}],"Solution":{"Idea":{"Ar":"نفكك التسعة إلى جزأين أحدهما 6.","En":"Split nine into two parts, one of which is six."},"FormulaLatex":"9=6+3","Steps":[{"Ar":"$16-6=10$","En":"$16-6=10$"},{"Ar":"$10-3=7$","En":"$10-3=7$"}],"Substitution":{"Ar":"$9=6+3$","En":"$9=6+3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6+3=9$ و$16-9=7$.","En":"$6+3=9$ and $16-9=7$."},"CommonError":{"Ar":"ستكون الكمية المطروحة كلها 8 فقط.","En":"The total removed would be only eight."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ستكون الكمية المطروحة كلها 8 فقط.","En":"The total removed would be only eight."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ستكون الكمية المطروحة كلها 12.","En":"The total removed would be twelve."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يطرح التسعة كاملة مرة أخرى.","En":"Subtracts the full nine again."},"Order":4}]}$mw$),
($mw$growth-v73-grade-1-subtraction-transfer-equalizing-two-collections-1$mw$,$mw$subtraction-transfer-equalizing-two-collections$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نقل أشياء لتتساوى المجموعتان","En":"Transferring to equalize two collections"},"Question":{"Ar":"مع ريم 10 أقلام ومع هدى 6 أقلام. أعطت ريم بعض أقلامها لهدى حتى أصبح معهما العدد نفسه. كم قلماً أعطتها؟","En":"Reem has ten pencils and Huda has six. Reem gives some of her pencils to Huda so that both have equal counts. How many pencils did she give?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبقى مع ريم 9 ومع هدى 7.","En":"Leaves Reem with nine and Huda with seven."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نقل الفرق كله يعكس العددين ولا يساويهما.","En":"Moving the entire gap swaps the counts without equalizing them."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينقل أكثر مما يلزم بكثير.","En":"Transfers far too many."}}],"Hints":[{"Ar":"جرب نقل قلم واحد وقارن العددين.","En":"Try moving one pencil and compare the counts."},{"Ar":"جرب نقل قلم آخر إذا بقي فرق.","En":"Try one more pencil if a gap remains."}],"Solution":{"Idea":{"Ar":"كل قلم يُنقل ينقص المجموعة الكبيرة واحداً ويزيد الصغيرة واحداً.","En":"Each transferred pencil reduces the larger group by one and increases the smaller by one."},"FormulaLatex":"10-2=6+2","Steps":[{"Ar":"$10-6=4$","En":"$10-6=4$"},{"Ar":"$4=2+2$","En":"$4=2+2$"}],"Substitution":{"Ar":"$10-2=6+2$","En":"$10-2=6+2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد نقل قلمين يصبح مع كل منهما 8 أقلام.","En":"After transferring two, each has eight pencils."},"CommonError":{"Ar":"يبقى مع ريم 9 ومع هدى 7.","En":"Leaves Reem with nine and Huda with seven."}}}$mw$::jsonb,$mw$كل قلم يُنقل ينقص المجموعة الكبيرة واحداً ويزيد الصغيرة واحداً.

$10-2=6+2$

1. $10-6=4$

2. $4=2+2$

$10-2=6+2$

$2$

بعد نقل قلمين يصبح مع كل منهما 8 أقلام.

يبقى مع ريم 9 ومع هدى 7.$mw$,$mw$Each transferred pencil reduces the larger group by one and increases the smaller by one.

$10-2=6+2$

1. $10-6=4$

2. $4=2+2$

$10-2=6+2$

$2$

After transferring two, each has eight pencils.

Leaves Reem with nine and Huda with seven.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"جرب نقل قلم واحد وقارن العددين.","En":"Try moving one pencil and compare the counts."},{"Ar":"جرب نقل قلم آخر إذا بقي فرق.","En":"Try one more pencil if a gap remains."}],"Solution":{"Idea":{"Ar":"كل قلم يُنقل ينقص المجموعة الكبيرة واحداً ويزيد الصغيرة واحداً.","En":"Each transferred pencil reduces the larger group by one and increases the smaller by one."},"FormulaLatex":"10-2=6+2","Steps":[{"Ar":"$10-6=4$","En":"$10-6=4$"},{"Ar":"$4=2+2$","En":"$4=2+2$"}],"Substitution":{"Ar":"$10-2=6+2$","En":"$10-2=6+2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد نقل قلمين يصبح مع كل منهما 8 أقلام.","En":"After transferring two, each has eight pencils."},"CommonError":{"Ar":"يبقى مع ريم 9 ومع هدى 7.","En":"Leaves Reem with nine and Huda with seven."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يبقى مع ريم 9 ومع هدى 7.","En":"Leaves Reem with nine and Huda with seven."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"نقل الفرق كله يعكس العددين ولا يساويهما.","En":"Moving the entire gap swaps the counts without equalizing them."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ينقل أكثر مما يلزم بكثير.","En":"Transfers far too many."},"Order":4}]}$mw$),
($mw$growth-v73-grade-2-counting-cross-decade-tens-digit-change-1$mw$,$mw$counting-cross-decade-tens-digit-change$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبدل رقم العشرات أثناء العد","En":"Tens digit changes while counting"},"Question":{"Ar":"يعد طفل من 18 إلى 32، بزيادة 1 كل مرة. كم مرة يتغير رقم العشرات أثناء هذا العد؟","En":"A child counts from 18 through 32, adding one each time. How many times does the tens digit change during the count?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الانتقال إلى الثلاثينات.","En":"Misses the transition into the thirties."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب رقم العشرات الأول كتغير.","En":"Counts the initial tens digit as a change."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب كل خطوة بدلاً من تغير رقم العشرات فقط.","En":"Counts every step instead of tens digit changes."}}],"Hints":[{"Ar":"ابحث عن الانتقالات بين عشرات متتالية.","En":"Look for transitions between decades."},{"Ar":"لا تعد خطوات تغير الآحاد وحدها.","En":"Do not count steps where only the ones digit changes."}],"Solution":{"Idea":{"Ar":"يتغير رقم العشرات عند الانتقال من 19 إلى 20 ومن 29 إلى 30 فقط.","En":"The tens digit changes only at 19 to 20 and 29 to 30."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"يتغير رقم العشرات من 1 إلى 2 عند الانتقال من 19 إلى 20.","En":"The tens digit changes from one to two at 19 to 20."},{"Ar":"ويتغير من 2 إلى 3 عند الانتقال من 29 إلى 30.","En":"It changes from two to three at 29 to 30."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"رقم العشرات يبدأ 1 ثم يصبح 2 ثم 3، أي يتغير مرتين.","En":"The tens digit starts at one, then becomes two, then three: two changes."},"CommonError":{"Ar":"أهمل الانتقال إلى الثلاثينات.","En":"Misses the transition into the thirties."}}}$mw$::jsonb,$mw$يتغير رقم العشرات عند الانتقال من 19 إلى 20 ومن 29 إلى 30 فقط.

$1+1=2$

1. يتغير رقم العشرات من 1 إلى 2 عند الانتقال من 19 إلى 20.

2. ويتغير من 2 إلى 3 عند الانتقال من 29 إلى 30.

$1+1=2$

$2$

رقم العشرات يبدأ 1 ثم يصبح 2 ثم 3، أي يتغير مرتين.

أهمل الانتقال إلى الثلاثينات.$mw$,$mw$The tens digit changes only at 19 to 20 and 29 to 30.

$1+1=2$

1. The tens digit changes from one to two at 19 to 20.

2. It changes from two to three at 29 to 30.

$1+1=2$

$2$

The tens digit starts at one, then becomes two, then three: two changes.

Misses the transition into the thirties.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابحث عن الانتقالات بين عشرات متتالية.","En":"Look for transitions between decades."},{"Ar":"لا تعد خطوات تغير الآحاد وحدها.","En":"Do not count steps where only the ones digit changes."}],"Solution":{"Idea":{"Ar":"يتغير رقم العشرات عند الانتقال من 19 إلى 20 ومن 29 إلى 30 فقط.","En":"The tens digit changes only at 19 to 20 and 29 to 30."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"يتغير رقم العشرات من 1 إلى 2 عند الانتقال من 19 إلى 20.","En":"The tens digit changes from one to two at 19 to 20."},{"Ar":"ويتغير من 2 إلى 3 عند الانتقال من 29 إلى 30.","En":"It changes from two to three at 29 to 30."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"رقم العشرات يبدأ 1 ثم يصبح 2 ثم 3، أي يتغير مرتين.","En":"The tens digit starts at one, then becomes two, then three: two changes."},"CommonError":{"Ar":"أهمل الانتقال إلى الثلاثينات.","En":"Misses the transition into the thirties."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الانتقال إلى الثلاثينات.","En":"Misses the transition into the thirties."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب رقم العشرات الأول كتغير.","En":"Counts the initial tens digit as a change."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب كل خطوة بدلاً من تغير رقم العشرات فقط.","En":"Counts every step instead of tens digit changes."},"Order":4}]}$mw$),
($mw$growth-v73-grade-2-counting-distinct-values-two-copies-1$mw$,$mw$counting-distinct-values-two-copies$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد القيم المختلفة","En":"Counting distinct values"},"Question":{"Ar":"كتب طفل الأعداد 12، 15، 12، 18، 15، 21 على بطاقات منفصلة. كم قيمة مختلفة تظهر على البطاقات؟","En":"A child writes 12,15,12,18,15,21 on separate cards. How many distinct values appear on the cards?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب القيم المكررة وحدها.","En":"Counts only the repeated values."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف نسخة مكررة واحدة فقط.","En":"Removes just one repeated copy."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب جميع البطاقات رغم التكرار.","En":"Counts every card despite repetitions."}}],"Hints":[{"Ar":"اشطب النسخة الثانية من كل قيمة مكررة.","En":"Cross out the second copy of each repeated value."},{"Ar":"عد القيم الباقية.","En":"Count the remaining distinct values."}],"Solution":{"Idea":{"Ar":"نحسب كل قيمة مرة واحدة فقط مهما تكررت.","En":"Count each value once, however often it appears."},"FormulaLatex":"6-2=4","Steps":[{"Ar":"نستبعد التكرار الثاني للعددين 12 و15.","En":"Exclude the second occurrences of 12 and 15."},{"Ar":"$6-2=4$","En":"$6-2=4$"}],"Substitution":{"Ar":"12، 15، 18، 21","En":"12, 15, 18, 21"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القيم المختلفة أربع: 12 و15 و18 و21.","En":"There are four distinct values: 12,15,18,21."},"CommonError":{"Ar":"حسب القيم المكررة وحدها.","En":"Counts only the repeated values."}}}$mw$::jsonb,$mw$نحسب كل قيمة مرة واحدة فقط مهما تكررت.

$6-2=4$

1. نستبعد التكرار الثاني للعددين 12 و15.

2. $6-2=4$

12، 15، 18، 21

$4$

القيم المختلفة أربع: 12 و15 و18 و21.

حسب القيم المكررة وحدها.$mw$,$mw$Count each value once, however often it appears.

$6-2=4$

1. Exclude the second occurrences of 12 and 15.

2. $6-2=4$

12, 15, 18, 21

$4$

There are four distinct values: 12,15,18,21.

Counts only the repeated values.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشطب النسخة الثانية من كل قيمة مكررة.","En":"Cross out the second copy of each repeated value."},{"Ar":"عد القيم الباقية.","En":"Count the remaining distinct values."}],"Solution":{"Idea":{"Ar":"نحسب كل قيمة مرة واحدة فقط مهما تكررت.","En":"Count each value once, however often it appears."},"FormulaLatex":"6-2=4","Steps":[{"Ar":"نستبعد التكرار الثاني للعددين 12 و15.","En":"Exclude the second occurrences of 12 and 15."},{"Ar":"$6-2=4$","En":"$6-2=4$"}],"Substitution":{"Ar":"12، 15، 18، 21","En":"12, 15, 18, 21"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القيم المختلفة أربع: 12 و15 و18 و21.","En":"There are four distinct values: 12,15,18,21."},"CommonError":{"Ar":"حسب القيم المكررة وحدها.","En":"Counts only the repeated values."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب القيم المكررة وحدها.","En":"Counts only the repeated values."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حذف نسخة مكررة واحدة فقط.","En":"Removes just one repeated copy."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب جميع البطاقات رغم التكرار.","En":"Counts every card despite repetitions."},"Order":4}]}$mw$),
($mw$growth-v73-grade-1-category-record-wrong-label-transfer-change-largest-1$mw$,$mw$category-record-wrong-label-transfer-change-largest$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح فئة في سجل","En":"Correcting a category label"},"Question":{"Ar":"في سجل الألوان: 5 حمراء و4 زرقاء و2 خضراء. اكتشف المعلم أن واحدة من الحمراء زرقاء في الحقيقة، فنقل تسجيلها إلى فئة الأزرق. ما الفئة الأكبر بعد التصحيح؟ A الأحمر، B الأزرق، C الأخضر، D الأحمر والأزرق بالتساوي.","En":"A color record lists five red, four blue and two green items. One red entry is actually blue, so the teacher moves its record to blue. Which category is largest after correction? A: red; B: blue; C: green; D: red and blue tied."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينخفض الأحمر إلى أربعة.","En":"Red drops to four."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأخضر يبقى اثنين.","En":"Green remains two."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بعد النقل يصبح الأزرق خمسة والأحمر أربعة.","En":"After the move blue is five and red is four."}}],"Hints":[{"Ar":"غيّر عددي الفئتين اللتين حصل بينهما النقل.","En":"Update both categories involved in the move."},{"Ar":"قارن الأعداد الجديدة.","En":"Compare the corrected counts."}],"Solution":{"Idea":{"Ar":"تصحيح التسجيل ينقص فئة الأحمر واحداً ويزيد الأزرق واحداً.","En":"The correction subtracts one from red and adds one to blue."},"FormulaLatex":"5-1=4,\\quad4+1=5","Steps":[{"Ar":"$5>4>2$","En":"$5>4>2$"},{"Ar":"الأزرق خمسة، الأحمر أربعة، والأخضر اثنان.","En":"Blue has five, red four and green two."}],"Substitution":{"Ar":"$5-1=4,\\quad4+1=5$","En":"$5-1=4,\\quad4+1=5$"},"Result":{"Ar":"B — الأزرق.","En":"B — blue."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الإجمالي قبل التصحيح وبعده 11، والأزرق وحده له أكبر عدد.","En":"The total stays eleven, and blue alone has the largest count."},"CommonError":{"Ar":"ينخفض الأحمر إلى أربعة.","En":"Red drops to four."}}}$mw$::jsonb,$mw$تصحيح التسجيل ينقص فئة الأحمر واحداً ويزيد الأزرق واحداً.

$5-1=4,\quad4+1=5$

1. $5>4>2$

2. الأزرق خمسة، الأحمر أربعة، والأخضر اثنان.

$5-1=4,\quad4+1=5$

B — الأزرق.

الإجمالي قبل التصحيح وبعده 11، والأزرق وحده له أكبر عدد.

ينخفض الأحمر إلى أربعة.$mw$,$mw$The correction subtracts one from red and adds one to blue.

$5-1=4,\quad4+1=5$

1. $5>4>2$

2. Blue has five, red four and green two.

$5-1=4,\quad4+1=5$

B — blue.

The total stays eleven, and blue alone has the largest count.

Red drops to four.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"غيّر عددي الفئتين اللتين حصل بينهما النقل.","En":"Update both categories involved in the move."},{"Ar":"قارن الأعداد الجديدة.","En":"Compare the corrected counts."}],"Solution":{"Idea":{"Ar":"تصحيح التسجيل ينقص فئة الأحمر واحداً ويزيد الأزرق واحداً.","En":"The correction subtracts one from red and adds one to blue."},"FormulaLatex":"5-1=4,\\quad4+1=5","Steps":[{"Ar":"$5>4>2$","En":"$5>4>2$"},{"Ar":"الأزرق خمسة، الأحمر أربعة، والأخضر اثنان.","En":"Blue has five, red four and green two."}],"Substitution":{"Ar":"$5-1=4,\\quad4+1=5$","En":"$5-1=4,\\quad4+1=5$"},"Result":{"Ar":"B — الأزرق.","En":"B — blue."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الإجمالي قبل التصحيح وبعده 11، والأزرق وحده له أكبر عدد.","En":"The total stays eleven, and blue alone has the largest count."},"CommonError":{"Ar":"ينخفض الأحمر إلى أربعة.","En":"Red drops to four."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ينخفض الأحمر إلى أربعة.","En":"Red drops to four."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الأخضر يبقى اثنين.","En":"Green remains two."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"بعد النقل يصبح الأزرق خمسة والأحمر أربعة.","En":"After the move blue is five and red is four."},"Order":4}]}$mw$),
($mw$growth-v73-grade-2-length-folded-rope-recover-full-1$mw$,$mw$length-folded-rope-recover-full$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طول شريط مطوي","En":"Length of a folded strip"},"Question":{"Ar":"طُوي شريط مستقيم إلى نصفين متساويين فتطابق طرفاه. إذا كانت المسافة من موضع الطي إلى الطرفين المتطابقين 9 سم، فكم طول الشريط بعد فرده؟","En":"A straight strip is folded exactly in half so its ends meet. The distance from the fold to the aligned ends is 9 cm. How long is the strip when unfolded?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب طول نصف واحد فقط.","En":"Counts only one half."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف مقداراً لا يمثّل النصف الثاني.","En":"Adds an amount that is not the other half."}},{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب ثلاثة أنصاف.","En":"Counts three halves."}}],"Hints":[{"Ar":"كم نصفاً في الشريط المطوي؟","En":"How many halves are in the folded strip?"},{"Ar":"اجمع طول النصفين المتساويين.","En":"Add the lengths of both equal halves."}],"Solution":{"Idea":{"Ar":"الجزآن متساويان في الطول، وفرد الشريط يجمع طولهما.","En":"The two halves have equal length, and unfolding combines their lengths."},"FormulaLatex":"9+9=18","Steps":[{"Ar":"$9+9=18$","En":"$9+9=18$"}],"Substitution":{"Ar":"$9+9=18$","En":"$9+9=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"نصف 18 سم يساوي 9 سم.","En":"Half of eighteen centimetres is nine centimetres."},"CommonError":{"Ar":"حسب طول نصف واحد فقط.","En":"Counts only one half."}}}$mw$::jsonb,$mw$الجزآن متساويان في الطول، وفرد الشريط يجمع طولهما.

$9+9=18$

1. $9+9=18$

$9+9=18$

$18$

سم

نصف 18 سم يساوي 9 سم.

حسب طول نصف واحد فقط.$mw$,$mw$The two halves have equal length, and unfolding combines their lengths.

$9+9=18$

1. $9+9=18$

$9+9=18$

$18$

cm

Half of eighteen centimetres is nine centimetres.

Counts only one half.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم نصفاً في الشريط المطوي؟","En":"How many halves are in the folded strip?"},{"Ar":"اجمع طول النصفين المتساويين.","En":"Add the lengths of both equal halves."}],"Solution":{"Idea":{"Ar":"الجزآن متساويان في الطول، وفرد الشريط يجمع طولهما.","En":"The two halves have equal length, and unfolding combines their lengths."},"FormulaLatex":"9+9=18","Steps":[{"Ar":"$9+9=18$","En":"$9+9=18$"}],"Substitution":{"Ar":"$9+9=18$","En":"$9+9=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"نصف 18 سم يساوي 9 سم.","En":"Half of eighteen centimetres is nine centimetres."},"CommonError":{"Ar":"حسب طول نصف واحد فقط.","En":"Counts only one half."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب طول نصف واحد فقط.","En":"Counts only one half."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف مقداراً لا يمثّل النصف الثاني.","En":"Adds an amount that is not the other half."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب ثلاثة أنصاف.","En":"Counts three halves."},"Order":4}]}$mw$),
($mw$growth-v73-grade-3-additive-equation-balance-choose-expression-1$mw$,$mw$additive-equation-balance-choose-expression$mw$,$mw$primary-one-step-additive-equations$mw$,$mw$grade-3$mw$,3,1,2,7,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":7,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترجمة ميزان إلى معادلة","En":"Representing a balance as an equation"},"Question":{"Ar":"على كفة ميزان صندوق كتلته $x$ كغ وثقل كتلته 4 كغ. وعلى الكفة الأخرى ثقل كتلته 13 كغ. الميزان متعادل. أي معادلة تمثل ذلك؟","En":"One pan of a balanced scale holds a box of mass $x$ kg and a 4 kg weight. The other holds a 13 kg weight. Which equation represents the balance?"},"Options":[{"LatexCode":"x-4=13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الكتلتان في الكفة نفسها تجمعان ولا تطرحان.","En":"Masses on the same pan add, not subtract."}},{"LatexCode":"4x=13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا توجد أربع نسخ من الصندوق.","En":"There are not four copies of the box."}},{"LatexCode":"x+4=13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x+13=4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وضع الثقل 13 مع الصندوق في الكفة الخطأ.","En":"Places the thirteen-kilogram weight on the wrong pan."}}],"Hints":[{"Ar":"اكتب كتلة كل كفة على حدة.","En":"Write the mass on each pan separately."},{"Ar":"ضع علامة مساواة بين كتلتي الكفتين.","En":"Set the two pan masses equal."}],"Solution":{"Idea":{"Ar":"كتلة الكفة الأولى مجموع كتلة الصندوق والثقل، وتساوي كتلة الكفة الأخرى.","En":"The mass on the first pan is the sum of the box and weight, equal to the other pan."},"FormulaLatex":"x+4=13","Steps":[{"Ar":"$x=13-4=9$","En":"$x=13-4=9$"}],"Substitution":{"Ar":"$x+4=13$","En":"$x+4=13$"},"Result":{"Ar":"$x+4=13$","En":"$x+4=13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند $x=9$ تصبح الكفة الأولى $9+4=13$ كغ.","En":"At $x=9$, the first pan has $9+4=13$ kg."},"CommonError":{"Ar":"الكتلتان في الكفة نفسها تجمعان ولا تطرحان.","En":"Masses on the same pan add, not subtract."}}}$mw$::jsonb,$mw$كتلة الكفة الأولى مجموع كتلة الصندوق والثقل، وتساوي كتلة الكفة الأخرى.

$x+4=13$

1. $x=13-4=9$

$x+4=13$

$x+4=13$

عند $x=9$ تصبح الكفة الأولى $9+4=13$ كغ.

الكتلتان في الكفة نفسها تجمعان ولا تطرحان.$mw$,$mw$The mass on the first pan is the sum of the box and weight, equal to the other pan.

$x+4=13$

1. $x=13-4=9$

$x+4=13$

$x+4=13$

At $x=9$, the first pan has $9+4=13$ kg.

Masses on the same pan add, not subtract.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب كتلة كل كفة على حدة.","En":"Write the mass on each pan separately."},{"Ar":"ضع علامة مساواة بين كتلتي الكفتين.","En":"Set the two pan masses equal."}],"Solution":{"Idea":{"Ar":"كتلة الكفة الأولى مجموع كتلة الصندوق والثقل، وتساوي كتلة الكفة الأخرى.","En":"The mass on the first pan is the sum of the box and weight, equal to the other pan."},"FormulaLatex":"x+4=13","Steps":[{"Ar":"$x=13-4=9$","En":"$x=13-4=9$"}],"Substitution":{"Ar":"$x+4=13$","En":"$x+4=13$"},"Result":{"Ar":"$x+4=13$","En":"$x+4=13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند $x=9$ تصبح الكفة الأولى $9+4=13$ كغ.","En":"At $x=9$, the first pan has $9+4=13$ kg."},"CommonError":{"Ar":"الكتلتان في الكفة نفسها تجمعان ولا تطرحان.","En":"Masses on the same pan add, not subtract."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الكتلتان في الكفة نفسها تجمعان ولا تطرحان.","En":"Masses on the same pan add, not subtract."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا توجد أربع نسخ من الصندوق.","En":"There are not four copies of the box."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"وضع الثقل 13 مع الصندوق في الكفة الخطأ.","En":"Places the thirteen-kilogram weight on the wrong pan."},"Order":4}]}$mw$),
($mw$growth-v73-grade-3-fraction-equal-wholes-same-numerator-compare-1$mw$,$mw$fraction-equal-wholes-same-numerator-compare$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة حصتين من وحدتين متساويتين","En":"Comparing shares of equal wholes"},"Question":{"Ar":"لدينا كعكتان متساويتان في الحجم. قُسمت الأولى إلى 3 أجزاء متساوية والثانية إلى 5 أجزاء متساوية. أخذت ريم جزءين من الأولى وأخذ سامر جزءين من الثانية. من حصل على كمية أكبر؟ A ريم، B سامر، C متساويان، D لا يمكن التحديد.","En":"Two cakes have equal size. The first is divided into three equal pieces and the second into five equal pieces. Reem takes two pieces of the first and Samer takes two pieces of the second. Who gets more? A: Reem; B: Samer; C: equal; D: cannot determine."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأجزاء الخمسة أصغر من الأجزاء الثلاثة.","En":"Fifths are smaller than thirds."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد القطع متساوٍ لكن حجم كل قطعة مختلف.","En":"The piece counts match but piece sizes differ."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حجم الكعكتين متساوٍ وعدد الأجزاء معروف.","En":"Whole sizes and partition counts are known."}}],"Hints":[{"Ar":"تخيل تقسيم كعكتين متماثلتين.","En":"Imagine cutting identical cakes."},{"Ar":"قارن حجم القطعة الواحدة قبل عد القطعتين.","En":"Compare one piece's size before counting two."}],"Solution":{"Idea":{"Ar":"عند تساوي الكل، تقسيمه إلى أجزاء أقل يجعل كل جزء أكبر.","En":"With equal wholes, fewer equal pieces means each piece is larger."},"FormulaLatex":"\\frac23>\\frac25","Steps":[{"Ar":"ثلث الكعكة أكبر من خمسها، لأن الكعكتين متساويتان.","En":"One third is larger than one fifth because the cakes are equal in size."},{"Ar":"$\\frac23>\\frac25$","En":"$\\frac23>\\frac25$"}],"Substitution":{"Ar":"$\\frac23>\\frac25$","En":"$\\frac23>\\frac25$"},"Result":{"Ar":"A — ريم.","En":"A — Reem."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عشر وحدات من 15 أكبر من ست وحدات من 15.","En":"Ten fifteenths is greater than six fifteenths."},"CommonError":{"Ar":"الأجزاء الخمسة أصغر من الأجزاء الثلاثة.","En":"Fifths are smaller than thirds."}}}$mw$::jsonb,$mw$عند تساوي الكل، تقسيمه إلى أجزاء أقل يجعل كل جزء أكبر.

$\frac23>\frac25$

1. ثلث الكعكة أكبر من خمسها، لأن الكعكتين متساويتان.

2. $\frac23>\frac25$

$\frac23>\frac25$

A — ريم.

عشر وحدات من 15 أكبر من ست وحدات من 15.

الأجزاء الخمسة أصغر من الأجزاء الثلاثة.$mw$,$mw$With equal wholes, fewer equal pieces means each piece is larger.

$\frac23>\frac25$

1. One third is larger than one fifth because the cakes are equal in size.

2. $\frac23>\frac25$

$\frac23>\frac25$

A — Reem.

Ten fifteenths is greater than six fifteenths.

Fifths are smaller than thirds.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل تقسيم كعكتين متماثلتين.","En":"Imagine cutting identical cakes."},{"Ar":"قارن حجم القطعة الواحدة قبل عد القطعتين.","En":"Compare one piece's size before counting two."}],"Solution":{"Idea":{"Ar":"عند تساوي الكل، تقسيمه إلى أجزاء أقل يجعل كل جزء أكبر.","En":"With equal wholes, fewer equal pieces means each piece is larger."},"FormulaLatex":"\\frac23>\\frac25","Steps":[{"Ar":"ثلث الكعكة أكبر من خمسها، لأن الكعكتين متساويتان.","En":"One third is larger than one fifth because the cakes are equal in size."},{"Ar":"$\\frac23>\\frac25$","En":"$\\frac23>\\frac25$"}],"Substitution":{"Ar":"$\\frac23>\\frac25$","En":"$\\frac23>\\frac25$"},"Result":{"Ar":"A — ريم.","En":"A — Reem."},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عشر وحدات من 15 أكبر من ست وحدات من 15.","En":"Ten fifteenths is greater than six fifteenths."},"CommonError":{"Ar":"الأجزاء الخمسة أصغر من الأجزاء الثلاثة.","En":"Fifths are smaller than thirds."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الأجزاء الخمسة أصغر من الأجزاء الثلاثة.","En":"Fifths are smaller than thirds."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدد القطع متساوٍ لكن حجم كل قطعة مختلف.","En":"The piece counts match but piece sizes differ."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حجم الكعكتين متساوٍ وعدد الأجزاء معروف.","En":"Whole sizes and partition counts are known."},"Order":4}]}$mw$),
($mw$growth-v73-grade-3-time-countdown-simultaneous-timers-difference-1$mw$,$mw$time-countdown-simultaneous-timers-difference$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مؤقتان يعدان تنازلياً","En":"Two countdown timers"},"Question":{"Ar":"بدأ مؤقتان في اللحظة نفسها: الأول من 20 دقيقة والثاني من 35 دقيقة، وينقص كل منهما دقيقة كل دقيقة. عندما ينتهي الأول، كم دقيقة تبقى في الثاني؟","En":"Two countdown timers start together at 20 minutes and 35 minutes. Each counts down at one minute per minute. When the first finishes, how many minutes remain on the second?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يحسب فرق المدتين الصحيح.","En":"Uses the wrong difference."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل مدة المؤقت الأول وحدها.","En":"Uses the first timer's duration alone."}},{"LatexCode":"55","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المدتين رغم مرور الوقت عليهما معاً.","En":"Adds durations even though time passes simultaneously."}}],"Hints":[{"Ar":"كم دقيقة تمر قبل انتهاء المؤقت الأول؟","En":"How many minutes pass before the first timer ends?"},{"Ar":"اطرح تلك المدة من المؤقت الثاني.","En":"Subtract that duration from the second timer."}],"Solution":{"Idea":{"Ar":"يمر الوقت نفسه على المؤقتين، لذلك ننقص مدة الأول من قراءة الثاني.","En":"The same time passes on both timers, so subtract the first duration from the second reading."},"FormulaLatex":"35-20=15","Steps":[{"Ar":"عند انتهاء المؤقت الأول تكون قد مرت 20 دقيقة.","En":"Twenty minutes have passed when the first timer ends."},{"Ar":"$35-20=15$","En":"$35-20=15$"}],"Substitution":{"Ar":"$35-20=15$","En":"$35-20=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$20+15=35$، وهي مدة المؤقت الثاني.","En":"$20+15=35$, the second timer's initial duration."},"CommonError":{"Ar":"لم يحسب فرق المدتين الصحيح.","En":"Uses the wrong difference."}}}$mw$::jsonb,$mw$يمر الوقت نفسه على المؤقتين، لذلك ننقص مدة الأول من قراءة الثاني.

$35-20=15$

1. عند انتهاء المؤقت الأول تكون قد مرت 20 دقيقة.

2. $35-20=15$

$35-20=15$

$15$

دقيقة

$20+15=35$، وهي مدة المؤقت الثاني.

لم يحسب فرق المدتين الصحيح.$mw$,$mw$The same time passes on both timers, so subtract the first duration from the second reading.

$35-20=15$

1. Twenty minutes have passed when the first timer ends.

2. $35-20=15$

$35-20=15$

$15$

minutes

$20+15=35$, the second timer's initial duration.

Uses the wrong difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم دقيقة تمر قبل انتهاء المؤقت الأول؟","En":"How many minutes pass before the first timer ends?"},{"Ar":"اطرح تلك المدة من المؤقت الثاني.","En":"Subtract that duration from the second timer."}],"Solution":{"Idea":{"Ar":"يمر الوقت نفسه على المؤقتين، لذلك ننقص مدة الأول من قراءة الثاني.","En":"The same time passes on both timers, so subtract the first duration from the second reading."},"FormulaLatex":"35-20=15","Steps":[{"Ar":"عند انتهاء المؤقت الأول تكون قد مرت 20 دقيقة.","En":"Twenty minutes have passed when the first timer ends."},{"Ar":"$35-20=15$","En":"$35-20=15$"}],"Substitution":{"Ar":"$35-20=15$","En":"$35-20=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$20+15=35$، وهي مدة المؤقت الثاني.","En":"$20+15=35$, the second timer's initial duration."},"CommonError":{"Ar":"لم يحسب فرق المدتين الصحيح.","En":"Uses the wrong difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يحسب فرق المدتين الصحيح.","En":"Uses the wrong difference."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل مدة المؤقت الأول وحدها.","En":"Uses the first timer's duration alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع المدتين رغم مرور الوقت عليهما معاً.","En":"Adds durations even though time passes simultaneously."},"Order":4}]}$mw$),
($mw$growth-v73-grade-11-circle-center-on-axis-through-two-points-1$mw$,$mw$circle-center-on-axis-through-two-points$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مركز دائرة مقيد بمحور","En":"Circle center constrained to an axis"},"Question":{"Ar":"تمر دائرة بالنقطتين $(0,0)$ و$(6,8)$، ويقع مركزها على محور الإحداثيات الرأسي. ما الإحداثي الرأسي لمركزها؟","En":"A circle passes through $(0,0)$ and $(6,8)$, and its center lies on the vertical coordinate axis. Find the center's y-coordinate."},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ متوسط الإحداثيين الرأسيين رغم أن المركز ليس بالضرورة منتصف القطعة.","En":"Averages the y-coordinates even though the center need not be the midpoint."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نصف المسافة بين النقطتين ليس الإحداثي الرأسي للمركز في هذه الحالة.","En":"Half the distance between the points is not the center's y-coordinate here."}},{"LatexCode":"\\frac{25}{4}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم إحداثي إحدى النقطتين المعطاتين مباشرة.","En":"Uses the y-coordinate of a given point directly."}}],"Hints":[{"Ar":"بما أن المركز على المحور الرأسي، فإحداثيه الأفقي صفر.","En":"Since the center is on the vertical axis, its x-coordinate is zero."},{"Ar":"المسافتان من المركز إلى نقطتي المحيط متساويتان.","En":"Distances from the center to both circumference points are equal."}],"Solution":{"Idea":{"Ar":"نكتب المركز $(0,k)$ ثم نساوي مربعي بعده عن نقطتي الدائرة.","En":"Write the center as $(0,k)$ and equate its squared distances to the two points."},"FormulaLatex":"k^2=6^2+(8-k)^2","Steps":[{"Ar":"$k^2=36+64-16k+k^2$","En":"$k^2=36+64-16k+k^2$"},{"Ar":"$16k=100\\Rightarrow k=25/4$","En":"$16k=100\\Rightarrow k=25/4$"}],"Substitution":{"Ar":"$k^2=36+(8-k)^2$","En":"$k^2=36+(8-k)^2$"},"Result":{"Ar":"$\\frac{25}{4}$","En":"$\\frac{25}{4}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند $k=25/4$ يصبح مربع البعد عن الأصل $625/16$، وعن النقطة الثانية $36+(7/4)^2=625/16$.","En":"At $k=25/4$, the squared distance from the origin is $625/16$; from the other point it is $36+(7/4)^2=625/16$."},"CommonError":{"Ar":"افترض أن المركز هو منتصف أي وتر.","En":"Assumes the center is the midpoint of any chord."}}}$mw$::jsonb,$mw$نكتب المركز $(0,k)$ ثم نساوي مربعي بعده عن نقطتي الدائرة.

$k^2=6^2+(8-k)^2$

1. $k^2=36+64-16k+k^2$

2. $16k=100\Rightarrow k=25/4$

$k^2=36+(8-k)^2$

$\frac{25}{4}$

عند $k=25/4$ يصبح مربع البعد عن الأصل $625/16$، وعن النقطة الثانية $36+(7/4)^2=625/16$.

افترض أن المركز هو منتصف أي وتر.$mw$,$mw$Write the center as $(0,k)$ and equate its squared distances to the two points.

$k^2=6^2+(8-k)^2$

1. $k^2=36+64-16k+k^2$

2. $16k=100\Rightarrow k=25/4$

$k^2=36+(8-k)^2$

$\frac{25}{4}$

At $k=25/4$, the squared distance from the origin is $625/16$; from the other point it is $36+(7/4)^2=625/16$.

Assumes the center is the midpoint of any chord.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"بما أن المركز على المحور الرأسي، فإحداثيه الأفقي صفر.","En":"Since the center is on the vertical axis, its x-coordinate is zero."},{"Ar":"المسافتان من المركز إلى نقطتي المحيط متساويتان.","En":"Distances from the center to both circumference points are equal."}],"Solution":{"Idea":{"Ar":"نكتب المركز $(0,k)$ ثم نساوي مربعي بعده عن نقطتي الدائرة.","En":"Write the center as $(0,k)$ and equate its squared distances to the two points."},"FormulaLatex":"k^2=6^2+(8-k)^2","Steps":[{"Ar":"$k^2=36+64-16k+k^2$","En":"$k^2=36+64-16k+k^2$"},{"Ar":"$16k=100\\Rightarrow k=25/4$","En":"$16k=100\\Rightarrow k=25/4$"}],"Substitution":{"Ar":"$k^2=36+(8-k)^2$","En":"$k^2=36+(8-k)^2$"},"Result":{"Ar":"$\\frac{25}{4}$","En":"$\\frac{25}{4}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند $k=25/4$ يصبح مربع البعد عن الأصل $625/16$، وعن النقطة الثانية $36+(7/4)^2=625/16$.","En":"At $k=25/4$, the squared distance from the origin is $625/16$; from the other point it is $36+(7/4)^2=625/16$."},"CommonError":{"Ar":"افترض أن المركز هو منتصف أي وتر.","En":"Assumes the center is the midpoint of any chord."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أخذ متوسط الإحداثيين الرأسيين رغم أن المركز ليس بالضرورة منتصف القطعة.","En":"Averages the y-coordinates even though the center need not be the midpoint."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"نصف المسافة بين النقطتين ليس الإحداثي الرأسي للمركز في هذه الحالة.","En":"Half the distance between the points is not the center's y-coordinate here."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استخدم إحداثي إحدى النقطتين المعطاتين مباشرة.","En":"Uses the y-coordinate of a given point directly."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v73 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
