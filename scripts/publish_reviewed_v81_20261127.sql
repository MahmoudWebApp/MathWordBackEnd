-- One-time owner-authorized v81 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v81-grade-3-whole-number-product-solution-1$mw$,$mw$whole-number-product-solution$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-3$mw$,3,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجهول عدد صحيح","En":"Whole-number unknown"},"Question":{"Ar":"يريد طفل اختيار عدد صحيح غير سالب من القطع في كل مجموعة. أي معادلة يمكن أن تكون صحيحة إذا كان $x$ عدد القطع في كل مجموعة من أربع مجموعات؟","En":"A child wants a nonnegative whole number of pieces in each of four equal groups. Which equation can be true if $x$ is the number of pieces per group?"},"Options":[{"LatexCode":"4x=18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18 بين حاصلَي ضرب 4 في 4 و4 في 5.","En":"18 lies between 4 times 4 and 4 times 5."}},{"LatexCode":"4x=22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"22 بين 20 و24 ولا يقبل القسمة على 4 دون باقٍ.","En":"22 is between 20 and 24 and leaves a remainder when divided by 4."}},{"LatexCode":"4x=20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4x=26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"26 بين 24 و28 ولا يقبل القسمة على 4 دون باقٍ.","En":"26 is between 24 and 28 and leaves a remainder when divided by 4."}}],"Hints":[{"Ar":"اكتب بعض نواتج جدول ضرب 4.","En":"List some products in the four times table."},{"Ar":"ابحث عن المجموع الذي يمكن توزيعه على أربع مجموعات دون باقٍ.","En":"Find the total that can be shared among four groups with nothing left over."}],"Solution":{"Idea":{"Ar":"عدد القطع في كل مجموعة يجب أن يكون عدداً صحيحاً؛ لذا نبحث عن مضاعف للعدد 4.","En":"The group size must be a whole number, so look for a multiple of 4."},"FormulaLatex":"4x=20","Steps":[{"Ar":"نجد أن 18 و22 و26 ليست من نواتج جدول ضرب 4.","En":"18, 22 and 26 are not multiples of 4."},{"Ar":"نقسم 20 على 4 فنجد 5 قطع في كل مجموعة.","En":"Divide 20 by 4 to get 5 pieces in each group."}],"Substitution":{"Ar":"$20\\div4=5$","En":"$20\\div4=5$"},"Result":{"Ar":"$4x=20$","En":"$4x=20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربع مجموعات من خمس قطع تعطي 20 قطعة.","En":"Four groups of five give 20 pieces."},"CommonError":{"Ar":"قبول عدد قطع غير صحيح في المجموعة.","En":"Accepting a fractional count of pieces."}}}$mw$::jsonb,$mw$عدد القطع في كل مجموعة يجب أن يكون عدداً صحيحاً؛ لذا نبحث عن مضاعف للعدد 4.

$4x=20$

1. نجد أن 18 و22 و26 ليست من نواتج جدول ضرب 4.

2. نقسم 20 على 4 فنجد 5 قطع في كل مجموعة.

$20\div4=5$

$4x=20$

أربع مجموعات من خمس قطع تعطي 20 قطعة.

قبول عدد قطع غير صحيح في المجموعة.$mw$,$mw$The group size must be a whole number, so look for a multiple of 4.

$4x=20$

1. 18, 22 and 26 are not multiples of 4.

2. Divide 20 by 4 to get 5 pieces in each group.

$20\div4=5$

$4x=20$

Four groups of five give 20 pieces.

Accepting a fractional count of pieces.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب بعض نواتج جدول ضرب 4.","En":"List some products in the four times table."},{"Ar":"ابحث عن المجموع الذي يمكن توزيعه على أربع مجموعات دون باقٍ.","En":"Find the total that can be shared among four groups with nothing left over."}],"Solution":{"Idea":{"Ar":"عدد القطع في كل مجموعة يجب أن يكون عدداً صحيحاً؛ لذا نبحث عن مضاعف للعدد 4.","En":"The group size must be a whole number, so look for a multiple of 4."},"FormulaLatex":"4x=20","Steps":[{"Ar":"نجد أن 18 و22 و26 ليست من نواتج جدول ضرب 4.","En":"18, 22 and 26 are not multiples of 4."},{"Ar":"نقسم 20 على 4 فنجد 5 قطع في كل مجموعة.","En":"Divide 20 by 4 to get 5 pieces in each group."}],"Substitution":{"Ar":"$20\\div4=5$","En":"$20\\div4=5$"},"Result":{"Ar":"$4x=20$","En":"$4x=20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربع مجموعات من خمس قطع تعطي 20 قطعة.","En":"Four groups of five give 20 pieces."},"CommonError":{"Ar":"قبول عدد قطع غير صحيح في المجموعة.","En":"Accepting a fractional count of pieces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"18 بين حاصلَي ضرب 4 في 4 و4 في 5.","En":"18 lies between 4 times 4 and 4 times 5."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"22 بين 20 و24 ولا يقبل القسمة على 4 دون باقٍ.","En":"22 is between 20 and 24 and leaves a remainder when divided by 4."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"26 بين 24 و28 ولا يقبل القسمة على 4 دون باقٍ.","En":"26 is between 24 and 28 and leaves a remainder when divided by 4."},"Order":4}]}$mw$),
($mw$growth-v81-grade-3-combine-third-and-sixth-pieces-1$mw$,$mw$combine-third-and-sixth-pieces$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التركيب من أسداس","En":"Building from sixths"},"Question":{"Ar":"لدينا ثلاث قطع مأخوذة من أشرطة متساوية الطول: قطعة طولها ثلث شريط، وقطعتان طول كل منهما سدس شريط. كم قطعة بطول السدس نحتاج لتكوين طول القطع الثلاث مجتمعة؟","En":"Three pieces come from equal-length strips: one piece is a third of a strip and two pieces are each a sixth of a strip. How many sixth-length pieces match the combined length of all three?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعد القطع دون مراعاة اختلاف أطوالها.","En":"This counts the pieces without considering their lengths."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قطعة الثلث تساوي قطعتين من السدس، لا ثلاثاً.","En":"The third equals two sixth pieces, not three."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ست قطع من السدس تملأ شريطاً كاملاً، وهو أطول من القطع الثلاث.","En":"Six sixth pieces fill an entire strip, longer than the three pieces."}}],"Hints":[{"Ar":"تخيّل تقسيم كل ثلث إلى قطعتين متساويتين.","En":"Imagine cutting each third into two equal pieces."},{"Ar":"استبدل قطعة الثلث بقطع من السدس ثم عدّ الجميع.","En":"Replace the third with sixth pieces, then count them all."}],"Solution":{"Idea":{"Ar":"نستخدم قطعاً متساوية الطول للمقارنة.","En":"Use equal-length pieces to compare the total."},"FormulaLatex":"\\frac{1}{3}=\\frac{2}{6}","Steps":[{"Ar":"قطعة الثلث تكافئ قطعتين من السدس.","En":"The third matches two sixth pieces."},{"Ar":"نضيف إليهما القطعتين الموجودتين أصلاً.","En":"Add the two sixth pieces already present."}],"Substitution":{"Ar":"$2+2=4$","En":"$2+2=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربعة أسداس تغطي طول ثلثين من شريط كامل، وهو طول القطع المعطاة.","En":"Four sixths cover two thirds of a strip, matching the given pieces."},"CommonError":{"Ar":"عد القطع الكبيرة والصغيرة وكأن أطوالها متساوية.","En":"Counting large and small pieces as if they have equal lengths."}}}$mw$::jsonb,$mw$نستخدم قطعاً متساوية الطول للمقارنة.

$\frac{1}{3}=\frac{2}{6}$

1. قطعة الثلث تكافئ قطعتين من السدس.

2. نضيف إليهما القطعتين الموجودتين أصلاً.

$2+2=4$

$4$

أربعة أسداس تغطي طول ثلثين من شريط كامل، وهو طول القطع المعطاة.

عد القطع الكبيرة والصغيرة وكأن أطوالها متساوية.$mw$,$mw$Use equal-length pieces to compare the total.

$\frac{1}{3}=\frac{2}{6}$

1. The third matches two sixth pieces.

2. Add the two sixth pieces already present.

$2+2=4$

$4$

Four sixths cover two thirds of a strip, matching the given pieces.

Counting large and small pieces as if they have equal lengths.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيّل تقسيم كل ثلث إلى قطعتين متساويتين.","En":"Imagine cutting each third into two equal pieces."},{"Ar":"استبدل قطعة الثلث بقطع من السدس ثم عدّ الجميع.","En":"Replace the third with sixth pieces, then count them all."}],"Solution":{"Idea":{"Ar":"نستخدم قطعاً متساوية الطول للمقارنة.","En":"Use equal-length pieces to compare the total."},"FormulaLatex":"\\frac{1}{3}=\\frac{2}{6}","Steps":[{"Ar":"قطعة الثلث تكافئ قطعتين من السدس.","En":"The third matches two sixth pieces."},{"Ar":"نضيف إليهما القطعتين الموجودتين أصلاً.","En":"Add the two sixth pieces already present."}],"Substitution":{"Ar":"$2+2=4$","En":"$2+2=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربعة أسداس تغطي طول ثلثين من شريط كامل، وهو طول القطع المعطاة.","En":"Four sixths cover two thirds of a strip, matching the given pieces."},"CommonError":{"Ar":"عد القطع الكبيرة والصغيرة وكأن أطوالها متساوية.","En":"Counting large and small pieces as if they have equal lengths."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يعد القطع دون مراعاة اختلاف أطوالها.","En":"This counts the pieces without considering their lengths."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قطعة الثلث تساوي قطعتين من السدس، لا ثلاثاً.","En":"The third equals two sixth pieces, not three."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ست قطع من السدس تملأ شريطاً كاملاً، وهو أطول من القطع الثلاث.","En":"Six sixth pieces fill an entire strip, longer than the three pieces."},"Order":4}]}$mw$),
($mw$growth-v81-grade-1-complete-square-missing-tile-1$mw$,$mw$complete-square-missing-tile$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال شكل مربع","En":"Completing a square"},"Question":{"Ar":"وضع طفل مربعين صغيرين متطابقين في الصف العلوي ومربعاً واحداً تحت المربع العلوي الأيسر مباشرة. أين يضع المربع الرابع ليكوّن مربعاً كبيراً دون فراغ؟ A: فوق العلوي الأيسر، B: تحت العلوي الأيمن، C: يسار الصف السفلي، D: فوق العلوي الأيمن.","En":"A child places two identical small squares in the top row and one directly below the top-left square. Where should the fourth square go to form a larger square with no gap? A: above top-left; B: below top-right; C: left of the bottom row; D: above top-right."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف صفاً ثالثاً ولا يملأ الفراغ السفلي.","En":"This adds a third row without filling the bottom gap."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يمد الصف السفلي إلى اليسار بدلاً من محاذاته مع الصف العلوي.","En":"This extends the bottom row left instead of aligning it with the top row."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف مربعاً فوق الصف العلوي ويترك المكان الناقص فارغاً.","En":"This adds a square above the top row and leaves the missing space empty."}}],"Hints":[{"Ar":"قارن مواضع المربعات في الصفين.","En":"Compare the positions of the squares in the two rows."},{"Ar":"يجب أن يكون لكل مربع في الأعلى مربع تحته مباشرة.","En":"Each top square should have a square directly below it."}],"Solution":{"Idea":{"Ar":"نحاذي صفين متساويين لتكوين مربع كبير.","En":"Align two equal rows to form a larger square."},"FormulaLatex":"2+2=4","Steps":[{"Ar":"المربع العلوي الأيسر له مربع تحته بالفعل.","En":"The top-left square already has a square below it."},{"Ar":"نضع المربع الرابع تحت العلوي الأيمن لتكتمل المحاذاة.","En":"Place the fourth square below the top-right square to complete the alignment."}],"Substitution":{"Ar":"$2+2=4$","En":"$2+2=4$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يصبح لدينا صفان متراصان، مربعان في كل صف دون فراغ.","En":"There are now two aligned rows with two squares each and no gap."},"CommonError":{"Ar":"إضافة مربع خارج الصفين بدلاً من ملء الفراغ.","En":"Adding a square outside the two rows instead of filling the gap."}}}$mw$::jsonb,$mw$نحاذي صفين متساويين لتكوين مربع كبير.

$2+2=4$

1. المربع العلوي الأيسر له مربع تحته بالفعل.

2. نضع المربع الرابع تحت العلوي الأيمن لتكتمل المحاذاة.

$2+2=4$

$B$

يصبح لدينا صفان متراصان، مربعان في كل صف دون فراغ.

إضافة مربع خارج الصفين بدلاً من ملء الفراغ.$mw$,$mw$Align two equal rows to form a larger square.

$2+2=4$

1. The top-left square already has a square below it.

2. Place the fourth square below the top-right square to complete the alignment.

$2+2=4$

$B$

There are now two aligned rows with two squares each and no gap.

Adding a square outside the two rows instead of filling the gap.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قارن مواضع المربعات في الصفين.","En":"Compare the positions of the squares in the two rows."},{"Ar":"يجب أن يكون لكل مربع في الأعلى مربع تحته مباشرة.","En":"Each top square should have a square directly below it."}],"Solution":{"Idea":{"Ar":"نحاذي صفين متساويين لتكوين مربع كبير.","En":"Align two equal rows to form a larger square."},"FormulaLatex":"2+2=4","Steps":[{"Ar":"المربع العلوي الأيسر له مربع تحته بالفعل.","En":"The top-left square already has a square below it."},{"Ar":"نضع المربع الرابع تحت العلوي الأيمن لتكتمل المحاذاة.","En":"Place the fourth square below the top-right square to complete the alignment."}],"Substitution":{"Ar":"$2+2=4$","En":"$2+2=4$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يصبح لدينا صفان متراصان، مربعان في كل صف دون فراغ.","En":"There are now two aligned rows with two squares each and no gap."},"CommonError":{"Ar":"إضافة مربع خارج الصفين بدلاً من ملء الفراغ.","En":"Adding a square outside the two rows instead of filling the gap."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف صفاً ثالثاً ولا يملأ الفراغ السفلي.","En":"This adds a third row without filling the bottom gap."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يمد الصف السفلي إلى اليسار بدلاً من محاذاته مع الصف العلوي.","En":"This extends the bottom row left instead of aligning it with the top row."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف مربعاً فوق الصف العلوي ويترك المكان الناقص فارغاً.","En":"This adds a square above the top row and leaves the missing space empty."},"Order":4}]}$mw$),
($mw$growth-v81-grade-1-rectangle-side-length-match-1$mw$,$mw$rectangle-side-length-match$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"الأضلاع المتقابلة","En":"Opposite sides"},"Question":{"Ar":"رُسم مستطيل ليس مربعاً. الضلع العلوي أطول من الضلع الأيسر. أي ضلع يساوي الضلع العلوي في الطول؟ A: الأيسر، B: الأيمن، C: السفلي، D: لا يوجد.","En":"A non-square rectangle is drawn. Its top side is longer than its left side. Which side has the same length as the top side? A: left; B: right; C: bottom; D: none."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضلع الأيسر أقصر بحسب السؤال.","En":"The left side is shorter, as stated."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضلع الأيمن يساوي الأيسر الأقصر.","En":"The right side matches the shorter left side."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"للمستطيل ضلع مقابل للعلوي يساويه في الطول.","En":"A rectangle has an opposite side matching the top in length."}}],"Hints":[{"Ar":"انظر إلى الضلع المواجه للعلوي.","En":"Look for the side opposite the top."},{"Ar":"في المستطيل يتساوى كل ضلعين متقابلين.","En":"Opposite sides of a rectangle are equal in length."}],"Solution":{"Idea":{"Ar":"نحدد الضلع المقابل، لا المجاور.","En":"Identify the opposite side, not an adjacent one."},"FormulaLatex":"\\text{C}","Steps":[{"Ar":"الضلع العلوي يقابل الضلع السفلي.","En":"The top side is opposite the bottom side."},{"Ar":"يتساويان في الطول.","En":"They have equal lengths."}],"Substitution":{"Ar":"$\\text{C}$","En":"$\\text{C}$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يمكن وضع ضلع علوي مماثل فوق السفلي فيتطابقان.","En":"An identical copy of the top side fits the bottom side."},"CommonError":{"Ar":"اختيار ضلع مجاور بدلاً من المقابل.","En":"Choosing an adjacent side instead of the opposite side."}}}$mw$::jsonb,$mw$نحدد الضلع المقابل، لا المجاور.

$\text{C}$

1. الضلع العلوي يقابل الضلع السفلي.

2. يتساويان في الطول.

$\text{C}$

$C$

يمكن وضع ضلع علوي مماثل فوق السفلي فيتطابقان.

اختيار ضلع مجاور بدلاً من المقابل.$mw$,$mw$Identify the opposite side, not an adjacent one.

$\text{C}$

1. The top side is opposite the bottom side.

2. They have equal lengths.

$\text{C}$

$C$

An identical copy of the top side fits the bottom side.

Choosing an adjacent side instead of the opposite side.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"انظر إلى الضلع المواجه للعلوي.","En":"Look for the side opposite the top."},{"Ar":"في المستطيل يتساوى كل ضلعين متقابلين.","En":"Opposite sides of a rectangle are equal in length."}],"Solution":{"Idea":{"Ar":"نحدد الضلع المقابل، لا المجاور.","En":"Identify the opposite side, not an adjacent one."},"FormulaLatex":"\\text{C}","Steps":[{"Ar":"الضلع العلوي يقابل الضلع السفلي.","En":"The top side is opposite the bottom side."},{"Ar":"يتساويان في الطول.","En":"They have equal lengths."}],"Substitution":{"Ar":"$\\text{C}$","En":"$\\text{C}$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يمكن وضع ضلع علوي مماثل فوق السفلي فيتطابقان.","En":"An identical copy of the top side fits the bottom side."},"CommonError":{"Ar":"اختيار ضلع مجاور بدلاً من المقابل.","En":"Choosing an adjacent side instead of the opposite side."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الضلع الأيسر أقصر بحسب السؤال.","En":"The left side is shorter, as stated."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الضلع الأيمن يساوي الأيسر الأقصر.","En":"The right side matches the shorter left side."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"للمستطيل ضلع مقابل للعلوي يساويه في الطول.","En":"A rectangle has an opposite side matching the top in length."},"Order":4}]}$mw$),
($mw$growth-v81-grade-1-shape-sort-by-exactly-four-sides-1$mw$,$mw$shape-sort-by-exactly-four-sides$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"التصنيف بعدد الأضلاع","En":"Sorting by side count"},"Question":{"Ar":"لدينا مثلثان ومربع ومستطيل ليس مربعاً ودائرة. كم شكلاً من هذه الأشكال له أربعة أضلاع مستقيمة؟","En":"There are two triangles, one square, one non-square rectangle and one circle. How many of these shapes have four straight sides?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب المربع أو المستطيل فقط.","En":"This counts only the square or only the rectangle."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المثلثات لها ثلاثة أضلاع والدائرة ليس لها أضلاع مستقيمة.","En":"Triangles have three sides, and a circle has no straight sides."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس لكل الأشكال أربعة أضلاع.","En":"Not all shapes have four sides."}}],"Hints":[{"Ar":"كم ضلعاً للمربع؟","En":"How many sides does a square have?"},{"Ar":"هل المستطيل الذي ليس مربعاً له العدد نفسه؟","En":"Does a non-square rectangle have the same side count?"}],"Solution":{"Idea":{"Ar":"نصنف الأشكال حسب عدد أضلاعها لا اسمها.","En":"Sort shapes by their side count, not by name."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"المربع والمستطيل لهما أربعة أضلاع مستقيمة لكل منهما.","En":"The square and rectangle each have four straight sides."},{"Ar":"المثلثان والدائرة لا يحققان الشرط.","En":"The triangles and circle do not meet the condition."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القائمة المطلوبة تتكون من المربع والمستطيل فقط.","En":"The matching list contains only the square and rectangle."},"CommonError":{"Ar":"اعتبار المربع وحده شكلاً رباعي الأضلاع.","En":"Thinking only squares have four sides."}}}$mw$::jsonb,$mw$نصنف الأشكال حسب عدد أضلاعها لا اسمها.

$1+1=2$

1. المربع والمستطيل لهما أربعة أضلاع مستقيمة لكل منهما.

2. المثلثان والدائرة لا يحققان الشرط.

$1+1=2$

$2$

القائمة المطلوبة تتكون من المربع والمستطيل فقط.

اعتبار المربع وحده شكلاً رباعي الأضلاع.$mw$,$mw$Sort shapes by their side count, not by name.

$1+1=2$

1. The square and rectangle each have four straight sides.

2. The triangles and circle do not meet the condition.

$1+1=2$

$2$

The matching list contains only the square and rectangle.

Thinking only squares have four sides.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم ضلعاً للمربع؟","En":"How many sides does a square have?"},{"Ar":"هل المستطيل الذي ليس مربعاً له العدد نفسه؟","En":"Does a non-square rectangle have the same side count?"}],"Solution":{"Idea":{"Ar":"نصنف الأشكال حسب عدد أضلاعها لا اسمها.","En":"Sort shapes by their side count, not by name."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"المربع والمستطيل لهما أربعة أضلاع مستقيمة لكل منهما.","En":"The square and rectangle each have four straight sides."},{"Ar":"المثلثان والدائرة لا يحققان الشرط.","En":"The triangles and circle do not meet the condition."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القائمة المطلوبة تتكون من المربع والمستطيل فقط.","En":"The matching list contains only the square and rectangle."},"CommonError":{"Ar":"اعتبار المربع وحده شكلاً رباعي الأضلاع.","En":"Thinking only squares have four sides."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يحسب المربع أو المستطيل فقط.","En":"This counts only the square or only the rectangle."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"المثلثات لها ثلاثة أضلاع والدائرة ليس لها أضلاع مستقيمة.","En":"Triangles have three sides, and a circle has no straight sides."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ليس لكل الأشكال أربعة أضلاع.","En":"Not all shapes have four sides."},"Order":4}]}$mw$),
($mw$growth-v81-grade-2-pictograph-difference-in-differences-1$mw$,$mw$pictograph-difference-in-differences$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة الفرقين","En":"Comparing two gaps"},"Question":{"Ar":"كل ● يمثل كتاباً. الرفوف A: ●●●●●●؛ B: ●●●؛ C: ●●●●؛ D: ●●. بكم يزيد الفرق بين عددي A وB على الفرق بين عددي C وD؟","En":"Each ● represents one book. Shelves A: ●●●●●●; B: ●●●; C: ●●●●; D: ●●. By how many books is the A–B gap larger than the C–D gap?"},"Options":[{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا هو الفرق بين C وD.","En":"This is the C–D gap."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا هو الفرق بين A وB.","En":"This is the A–B gap."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الفرقين وليس الفرق بينهما.","En":"This adds the two gaps instead of comparing them."}}],"Hints":[{"Ar":"احسب فرق A وB أولاً.","En":"Find the A–B gap first."},{"Ar":"احسب فرق C وD ثم قارن الناتجين.","En":"Find the C–D gap and compare the results."}],"Solution":{"Idea":{"Ar":"نحسب فرق كل زوج ثم نطرح الفرق الأصغر من الأكبر.","En":"Find each gap, then subtract the smaller from the larger."},"FormulaLatex":"6-3=3,\\quad4-2=2","Steps":[{"Ar":"الفرق الأول 3 كتب والثاني كتابان.","En":"The first gap is 3 books and the second is 2."},{"Ar":"نطرح 2 من 3.","En":"Subtract 2 from 3."}],"Substitution":{"Ar":"$3-2=1$","En":"$3-2=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الفرق الأول أكبر بكتاب واحد؛ 2 مع 1 يساوي 3.","En":"The first gap is one larger; 2 plus 1 equals 3."},"CommonError":{"Ar":"إعطاء أحد الفرقين بدلاً من المقارنة بينهما.","En":"Giving one gap instead of comparing both."}}}$mw$::jsonb,$mw$نحسب فرق كل زوج ثم نطرح الفرق الأصغر من الأكبر.

$6-3=3,\quad4-2=2$

1. الفرق الأول 3 كتب والثاني كتابان.

2. نطرح 2 من 3.

$3-2=1$

$1$

الفرق الأول أكبر بكتاب واحد؛ 2 مع 1 يساوي 3.

إعطاء أحد الفرقين بدلاً من المقارنة بينهما.$mw$,$mw$Find each gap, then subtract the smaller from the larger.

$6-3=3,\quad4-2=2$

1. The first gap is 3 books and the second is 2.

2. Subtract 2 from 3.

$3-2=1$

$1$

The first gap is one larger; 2 plus 1 equals 3.

Giving one gap instead of comparing both.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب فرق A وB أولاً.","En":"Find the A–B gap first."},{"Ar":"احسب فرق C وD ثم قارن الناتجين.","En":"Find the C–D gap and compare the results."}],"Solution":{"Idea":{"Ar":"نحسب فرق كل زوج ثم نطرح الفرق الأصغر من الأكبر.","En":"Find each gap, then subtract the smaller from the larger."},"FormulaLatex":"6-3=3,\\quad4-2=2","Steps":[{"Ar":"الفرق الأول 3 كتب والثاني كتابان.","En":"The first gap is 3 books and the second is 2."},{"Ar":"نطرح 2 من 3.","En":"Subtract 2 from 3."}],"Substitution":{"Ar":"$3-2=1$","En":"$3-2=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الفرق الأول أكبر بكتاب واحد؛ 2 مع 1 يساوي 3.","En":"The first gap is one larger; 2 plus 1 equals 3."},"CommonError":{"Ar":"إعطاء أحد الفرقين بدلاً من المقارنة بينهما.","En":"Giving one gap instead of comparing both."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا هو الفرق بين C وD.","En":"This is the C–D gap."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا هو الفرق بين A وB.","En":"This is the A–B gap."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الفرقين وليس الفرق بينهما.","En":"This adds the two gaps instead of comparing them."},"Order":4}]}$mw$),
($mw$growth-v81-grade-2-pictograph-one-of-each-complete-sets-1$mw$,$mw$pictograph-one-of-each-complete-sets$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموعات من فئات مختلفة","En":"Sets from different categories"},"Question":{"Ar":"كل ● يمثل قلماً. الأحمر: ●●●●●؛ الأزرق: ●●●؛ الأخضر: ●●●●. نريد تجهيز مجموعات، في كل مجموعة قلم من كل لون. كم مجموعة كاملة يمكن تجهيزها دون استعمال أي قلم مرتين؟","En":"Each ● represents a pen. Red: ●●●●●; blue: ●●●; green: ●●●●. Each set must contain one pen of each color. How many complete sets can be made without using any pen twice?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن تجهيز مجموعة ثالثة لأن كل لون يتوفر منه ثلاثة أقلام على الأقل.","En":"A third set is possible because every color has at least three pens."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا توجد أربعة أقلام زرقاء.","En":"There are not four blue pens."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأزرق والأخضر لا يكفيان لخمس مجموعات.","En":"Blue and green counts cannot supply five sets."}}],"Hints":[{"Ar":"أي لون عدد أقلامه أقل؟","En":"Which color has the fewest pens?"},{"Ar":"كل مجموعة تحتاج قلماً من ذلك اللون أيضاً.","En":"Every set also needs one pen of that color."}],"Solution":{"Idea":{"Ar":"الفئة ذات العدد الأصغر تحدد عدد المجموعات الكاملة.","En":"The smallest category count limits the number of complete sets."},"FormulaLatex":"3<4<5","Steps":[{"Ar":"يمكن أخذ قلم من كل لون ثلاث مرات.","En":"One pen of each color can be taken three times."},{"Ar":"بعد ذلك لا يبقى قلم أزرق لمجموعة رابعة.","En":"After that no blue pen remains for a fourth set."}],"Substitution":{"Ar":"$3$","En":"$3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد ثلاث مجموعات يبقى قلمان أحمران وقلم أخضر ولا يبقى أزرق.","En":"After three sets, two red and one green remain, with no blue left."},"CommonError":{"Ar":"اختيار الفئة الأكبر بدلاً من الأصغر.","En":"Choosing the largest category instead of the smallest."}}}$mw$::jsonb,$mw$الفئة ذات العدد الأصغر تحدد عدد المجموعات الكاملة.

$3<4<5$

1. يمكن أخذ قلم من كل لون ثلاث مرات.

2. بعد ذلك لا يبقى قلم أزرق لمجموعة رابعة.

$3$

$3$

بعد ثلاث مجموعات يبقى قلمان أحمران وقلم أخضر ولا يبقى أزرق.

اختيار الفئة الأكبر بدلاً من الأصغر.$mw$,$mw$The smallest category count limits the number of complete sets.

$3<4<5$

1. One pen of each color can be taken three times.

2. After that no blue pen remains for a fourth set.

$3$

$3$

After three sets, two red and one green remain, with no blue left.

Choosing the largest category instead of the smallest.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أي لون عدد أقلامه أقل؟","En":"Which color has the fewest pens?"},{"Ar":"كل مجموعة تحتاج قلماً من ذلك اللون أيضاً.","En":"Every set also needs one pen of that color."}],"Solution":{"Idea":{"Ar":"الفئة ذات العدد الأصغر تحدد عدد المجموعات الكاملة.","En":"The smallest category count limits the number of complete sets."},"FormulaLatex":"3<4<5","Steps":[{"Ar":"يمكن أخذ قلم من كل لون ثلاث مرات.","En":"One pen of each color can be taken three times."},{"Ar":"بعد ذلك لا يبقى قلم أزرق لمجموعة رابعة.","En":"After that no blue pen remains for a fourth set."}],"Substitution":{"Ar":"$3$","En":"$3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد ثلاث مجموعات يبقى قلمان أحمران وقلم أخضر ولا يبقى أزرق.","En":"After three sets, two red and one green remain, with no blue left."},"CommonError":{"Ar":"اختيار الفئة الأكبر بدلاً من الأصغر.","En":"Choosing the largest category instead of the smallest."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يمكن تجهيز مجموعة ثالثة لأن كل لون يتوفر منه ثلاثة أقلام على الأقل.","En":"A third set is possible because every color has at least three pens."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا توجد أربعة أقلام زرقاء.","En":"There are not four blue pens."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الأزرق والأخضر لا يكفيان لخمس مجموعات.","En":"Blue and green counts cannot supply five sets."},"Order":4}]}$mw$),
($mw$growth-v81-grade-2-pictograph-missing-legend-unit-1$mw$,$mw$pictograph-missing-legend-unit$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"اختيار مفتاح الرسم","En":"Choosing the pictograph key"},"Question":{"Ar":"في رسم مصور للفواكه، صف التفاح ●●●● وصف الموز ●●. سجل المعلم أربع تفاحات وموزتين. كم ثمرة يمثل كل رمز ●؟","En":"A fruit pictograph shows apples ●●●● and bananas ●●. The teacher recorded four apples and two bananas. How many fruits does each ● represent?"},"Options":[{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لو كان الرمز يمثل ثمرتين لأصبح عدد التفاح ثمانية.","En":"If one symbol meant two fruits, apples would total eight."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لو كان الرمز يمثل ثلاث ثمرات لأصبح عدد الموز ستاً.","En":"If each symbol meant three fruits, bananas would total six."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لو كان الرمز يمثل أربع ثمرات لأصبح عدد التفاح ست عشرة.","En":"If each symbol meant four fruits, apples would total sixteen."}}],"Hints":[{"Ar":"قارن عدد رموز التفاح بعدد التفاحات المسجلة.","En":"Compare apple symbols with the recorded apple count."},{"Ar":"افعل الشيء نفسه مع الموز.","En":"Do the same for bananas."}],"Solution":{"Idea":{"Ar":"نحدد عدد الثمار التي يمثلها الرمز من تطابق الصفين مع السجل.","En":"Find the number of fruits per symbol by matching both rows to the record."},"FormulaLatex":"4\\div4=1","Steps":[{"Ar":"أربعة رموز تقابل أربع تفاحات.","En":"Four symbols match four apples."},{"Ar":"رمزان يقابلان موزتين، إذن الرمز الواحد يمثل ثمرة واحدة.","En":"Two symbols match two bananas, so each symbol means one fruit."}],"Substitution":{"Ar":"$2\\div2=1$","En":"$2\\div2=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"باستخدام ثمرة واحدة لكل رمز نحصل على أربعة واثنين كما في السجل.","En":"One fruit per symbol reproduces the recorded counts four and two."},"CommonError":{"Ar":"اختيار عدد رموز صف كامل باعتباره قيمة الرمز الواحد.","En":"Using an entire row count as the value of one symbol."}}}$mw$::jsonb,$mw$نحدد عدد الثمار التي يمثلها الرمز من تطابق الصفين مع السجل.

$4\div4=1$

1. أربعة رموز تقابل أربع تفاحات.

2. رمزان يقابلان موزتين، إذن الرمز الواحد يمثل ثمرة واحدة.

$2\div2=1$

$1$

باستخدام ثمرة واحدة لكل رمز نحصل على أربعة واثنين كما في السجل.

اختيار عدد رموز صف كامل باعتباره قيمة الرمز الواحد.$mw$,$mw$Find the number of fruits per symbol by matching both rows to the record.

$4\div4=1$

1. Four symbols match four apples.

2. Two symbols match two bananas, so each symbol means one fruit.

$2\div2=1$

$1$

One fruit per symbol reproduces the recorded counts four and two.

Using an entire row count as the value of one symbol.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قارن عدد رموز التفاح بعدد التفاحات المسجلة.","En":"Compare apple symbols with the recorded apple count."},{"Ar":"افعل الشيء نفسه مع الموز.","En":"Do the same for bananas."}],"Solution":{"Idea":{"Ar":"نحدد عدد الثمار التي يمثلها الرمز من تطابق الصفين مع السجل.","En":"Find the number of fruits per symbol by matching both rows to the record."},"FormulaLatex":"4\\div4=1","Steps":[{"Ar":"أربعة رموز تقابل أربع تفاحات.","En":"Four symbols match four apples."},{"Ar":"رمزان يقابلان موزتين، إذن الرمز الواحد يمثل ثمرة واحدة.","En":"Two symbols match two bananas, so each symbol means one fruit."}],"Substitution":{"Ar":"$2\\div2=1$","En":"$2\\div2=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"باستخدام ثمرة واحدة لكل رمز نحصل على أربعة واثنين كما في السجل.","En":"One fruit per symbol reproduces the recorded counts four and two."},"CommonError":{"Ar":"اختيار عدد رموز صف كامل باعتباره قيمة الرمز الواحد.","En":"Using an entire row count as the value of one symbol."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لو كان الرمز يمثل ثمرتين لأصبح عدد التفاح ثمانية.","En":"If one symbol meant two fruits, apples would total eight."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لو كان الرمز يمثل ثلاث ثمرات لأصبح عدد الموز ستاً.","En":"If each symbol meant three fruits, bananas would total six."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لو كان الرمز يمثل أربع ثمرات لأصبح عدد التفاح ست عشرة.","En":"If each symbol meant four fruits, apples would total sixteen."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v81 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
