-- One-time owner-authorized v36 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v36-grade-1-hour-hand-one-hour-later-1$mw$,$mw$hour-hand-one-hour-later$mw$,$mw$time$mw$,$mw$grade-1$mw$,1,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"حركة عقرب الساعات","En":"Movement of the hour hand"},"Question":{"Ar":"عند الساعة 10:00 صباحاً يشير عقرب الساعات إلى 10. بعد مرور ساعة كاملة، إلى أي عدد يشير عقرب الساعات؟","En":"At 10:00 a.m. the hour hand points to 10. After one full hour, which number does the hour hand point to?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 قبل العاشرة بساعة.","En":"9 is one hour before ten."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 موضع العقرب في البداية.","En":"10 is the starting position."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 بعد ساعتين من العاشرة.","En":"12 is two hours after ten."}}],"Hints":[{"Ar":"ابدأ عند العاشرة تماماً.","En":"Start at ten o'clock."},{"Ar":"انتقل إلى العدد التالي على الساعة.","En":"Move to the next number on the clock."}],"Solution":{"Idea":{"Ar":"يتقدم عقرب الساعات من عدد إلى العدد التالي خلال ساعة كاملة.","En":"The hour hand advances to the next number in one full hour."},"FormulaLatex":"10+1=11","Steps":[{"Ar":"نبدأ من العدد 10.","En":"Start at number 10."},{"Ar":"نتقدم موضعاً واحداً في اتجاه حركة العقارب.","En":"Move one position clockwise."}],"Substitution":{"Ar":"$10+1=11$","En":"$10+1=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11-10=1$","En":"$11-10=1$"},"CommonError":{"Ar":"لا تخلط بين عقربي الساعات والدقائق.","En":"Do not confuse the hour and minute hands."}}}$mw$::jsonb,$mw$يتقدم عقرب الساعات من عدد إلى العدد التالي خلال ساعة كاملة.

$10+1=11$

1. نبدأ من العدد 10.

2. نتقدم موضعاً واحداً في اتجاه حركة العقارب.

$10+1=11$

$11$

$11-10=1$

لا تخلط بين عقربي الساعات والدقائق.$mw$,$mw$The hour hand advances to the next number in one full hour.

$10+1=11$

1. Start at number 10.

2. Move one position clockwise.

$10+1=11$

$11$

$11-10=1$

Do not confuse the hour and minute hands.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابدأ عند العاشرة تماماً.","En":"Start at ten o'clock."},{"Ar":"انتقل إلى العدد التالي على الساعة.","En":"Move to the next number on the clock."}],"Solution":{"Idea":{"Ar":"يتقدم عقرب الساعات من عدد إلى العدد التالي خلال ساعة كاملة.","En":"The hour hand advances to the next number in one full hour."},"FormulaLatex":"10+1=11","Steps":[{"Ar":"نبدأ من العدد 10.","En":"Start at number 10."},{"Ar":"نتقدم موضعاً واحداً في اتجاه حركة العقارب.","En":"Move one position clockwise."}],"Substitution":{"Ar":"$10+1=11$","En":"$10+1=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11-10=1$","En":"$11-10=1$"},"CommonError":{"Ar":"لا تخلط بين عقربي الساعات والدقائق.","En":"Do not confuse the hour and minute hands."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"9 قبل العاشرة بساعة.","En":"9 is one hour before ten."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"10 موضع العقرب في البداية.","En":"10 is the starting position."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 بعد ساعتين من العاشرة.","En":"12 is two hours after ten."},"Order":4}]}$mw$),
($mw$growth-v36-grade-1-two-triangles-shared-side-outline-1$mw$,$mw$two-triangles-shared-side-outline$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"محيط شكل مركب","En":"Outline of a combined shape"},"Question":{"Ar":"وُضع مثلثان ورقيان بحيث يتطابق ضلع كامل من الأول مع ضلع كامل من الثاني، دون تداخل في المساحة. كم ضلعاً من المثلثين يبقى مكشوفاً على الحدود الخارجية؟ عدّ كل ضلع مكشوف منفرداً.","En":"Two paper triangles share one entire side without overlapping in area. How many of their original sides remain exposed on the outer boundary? Count each exposed original side separately."},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 عدد الضلعين المختفيين عند الالتقاء.","En":"2 counts the two hidden sides at the join."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 عدد أضلاع مثلث واحد.","En":"3 counts one triangle."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يعد الضلعين المشتركين أيضاً.","En":"6 includes both shared sides."}}],"Hints":[{"Ar":"عد أضلاع المثلثين قبل ضمهما.","En":"Count the sides before joining the triangles."},{"Ar":"استبعد ضلع الالتقاء من كل مثلث.","En":"Exclude the joining side from each triangle."}],"Solution":{"Idea":{"Ar":"الضلع الذي يشترك فيه المثلثان لا يظهر على الحد الخارجي لأي منهما.","En":"The shared side is not exposed on either triangle's outer boundary."},"FormulaLatex":"3+3-2=4","Steps":[{"Ar":"لكل مثلث ثلاثة أضلاع.","En":"Each triangle has three sides."},{"Ar":"يختفي ضلع من كل مثلث عند موضع الالتقاء.","En":"One side of each triangle is hidden at the join."}],"Substitution":{"Ar":"$6-2=4$","En":"$6-2=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+2=4$","En":"$2+2=4$"},"CommonError":{"Ar":"لا تحسب الضلع المشترك مرتين ضمن الحد الخارجي.","En":"Do not count the shared side twice on the outer boundary."}}}$mw$::jsonb,$mw$الضلع الذي يشترك فيه المثلثان لا يظهر على الحد الخارجي لأي منهما.

$3+3-2=4$

1. لكل مثلث ثلاثة أضلاع.

2. يختفي ضلع من كل مثلث عند موضع الالتقاء.

$6-2=4$

$4$

$2+2=4$

لا تحسب الضلع المشترك مرتين ضمن الحد الخارجي.$mw$,$mw$The shared side is not exposed on either triangle's outer boundary.

$3+3-2=4$

1. Each triangle has three sides.

2. One side of each triangle is hidden at the join.

$6-2=4$

$4$

$2+2=4$

Do not count the shared side twice on the outer boundary.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد أضلاع المثلثين قبل ضمهما.","En":"Count the sides before joining the triangles."},{"Ar":"استبعد ضلع الالتقاء من كل مثلث.","En":"Exclude the joining side from each triangle."}],"Solution":{"Idea":{"Ar":"الضلع الذي يشترك فيه المثلثان لا يظهر على الحد الخارجي لأي منهما.","En":"The shared side is not exposed on either triangle's outer boundary."},"FormulaLatex":"3+3-2=4","Steps":[{"Ar":"لكل مثلث ثلاثة أضلاع.","En":"Each triangle has three sides."},{"Ar":"يختفي ضلع من كل مثلث عند موضع الالتقاء.","En":"One side of each triangle is hidden at the join."}],"Substitution":{"Ar":"$6-2=4$","En":"$6-2=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+2=4$","En":"$2+2=4$"},"CommonError":{"Ar":"لا تحسب الضلع المشترك مرتين ضمن الحد الخارجي.","En":"Do not count the shared side twice on the outer boundary."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 عدد الضلعين المختفيين عند الالتقاء.","En":"2 counts the two hidden sides at the join."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3 عدد أضلاع مثلث واحد.","En":"3 counts one triangle."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"6 يعد الضلعين المشتركين أيضاً.","En":"6 includes both shared sides."},"Order":4}]}$mw$),
($mw$growth-v36-grade-1-category-count-equal-after-removal-1$mw$,$mw$category-count-equal-after-removal$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تساوي عددين بعد تغيير","En":"Equal category counts after a change"},"Question":{"Ar":"في سجل الألعاب المفضلة اختار 6 أطفال الكرة و4 أطفال الرسم وطفلان القراءة. حذف المعلم اختيار طفلين للكرة فقط لأنهما مكرران. كم فئة أصبح عدد اختياراتها 4؟","En":"In a favourite-activity record, 6 children chose ball games, 4 drawing and 2 reading. The teacher removes two duplicate entries for ball games only. How many categories now have a count of 4?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 يهمل إحدى الفئتين المتساويتين.","En":"1 misses one of the two equal categories."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يشمل القراءة التي بقي عددها 2.","En":"3 includes reading, whose count remains 2."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 عدد الاختيارات في كل فئة مطلوبة لا عدد الفئات.","En":"4 is the target count per category, not the number of categories."}}],"Hints":[{"Ar":"غيّر عدد اختيارات الكرة فقط.","En":"Change only the ball-games count."},{"Ar":"عد الفئات التي يساوي عددها أربعة.","En":"Count categories with exactly four choices."}],"Solution":{"Idea":{"Ar":"نحدّث الفئة التي تغيرت ثم نقرأ عدد الفئات المطابقة.","En":"Update the changed category, then count the matching categories."},"FormulaLatex":"6-2=4","Steps":[{"Ar":"أصبح عدد اختيارات الكرة 4.","En":"Ball games now has a count of 4."},{"Ar":"بقي الرسم 4 والقراءة 2.","En":"Drawing remains 4 and reading remains 2."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4=4$","En":"$4=4$"},"CommonError":{"Ar":"لا تحذف اختيارين من كل فئة.","En":"Do not remove two entries from every category."}}}$mw$::jsonb,$mw$نحدّث الفئة التي تغيرت ثم نقرأ عدد الفئات المطابقة.

$6-2=4$

1. أصبح عدد اختيارات الكرة 4.

2. بقي الرسم 4 والقراءة 2.

$1+1=2$

$2$

$4=4$

لا تحذف اختيارين من كل فئة.$mw$,$mw$Update the changed category, then count the matching categories.

$6-2=4$

1. Ball games now has a count of 4.

2. Drawing remains 4 and reading remains 2.

$1+1=2$

$2$

$4=4$

Do not remove two entries from every category.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"غيّر عدد اختيارات الكرة فقط.","En":"Change only the ball-games count."},{"Ar":"عد الفئات التي يساوي عددها أربعة.","En":"Count categories with exactly four choices."}],"Solution":{"Idea":{"Ar":"نحدّث الفئة التي تغيرت ثم نقرأ عدد الفئات المطابقة.","En":"Update the changed category, then count the matching categories."},"FormulaLatex":"6-2=4","Steps":[{"Ar":"أصبح عدد اختيارات الكرة 4.","En":"Ball games now has a count of 4."},{"Ar":"بقي الرسم 4 والقراءة 2.","En":"Drawing remains 4 and reading remains 2."}],"Substitution":{"Ar":"$1+1=2$","En":"$1+1=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4=4$","En":"$4=4$"},"CommonError":{"Ar":"لا تحذف اختيارين من كل فئة.","En":"Do not remove two entries from every category."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1 يهمل إحدى الفئتين المتساويتين.","En":"1 misses one of the two equal categories."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"3 يشمل القراءة التي بقي عددها 2.","En":"3 includes reading, whose count remains 2."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"4 عدد الاختيارات في كل فئة مطلوبة لا عدد الفئات.","En":"4 is the target count per category, not the number of categories."},"Order":4}]}$mw$),
($mw$growth-v36-grade-2-pictograph-pair-equal-total-1$mw$,$mw$pictograph-pair-equal-total$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مقارنة مجموع صفين","En":"Comparing combined pictograph rows"},"Question":{"Ar":"كل ● يمثل كتاباً واحداً. سجل الرفوف A: ●●؛ B: ●●●؛ C: ●●●●●؛ D: ●. أي زوج من الرفوف يحتوي معاً العدد نفسه الموجود في C؟","En":"Each ● represents one book. Shelf record A: ●●; B: ●●●; C: ●●●●●; D: ●. Which pair of shelves together contains the same number as C?"},"Options":[{"LatexCode":"A+D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع 3.","En":"The total is 3."}},{"LatexCode":"B+D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع 4.","En":"The total is 4."}},{"LatexCode":"A+B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C+D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع 6.","En":"The total is 6."}}],"Hints":[{"Ar":"عد رموز C أولاً.","En":"Count C's symbols first."},{"Ar":"ابحث عن صفين مجموعهما خمسة.","En":"Find two rows whose combined count is five."}],"Solution":{"Idea":{"Ar":"نجمع رموز كل زوج ونقارن المجموع بعدد رموز C.","En":"Add the symbols in each pair and compare with C's count."},"FormulaLatex":"2+3=5","Steps":[{"Ar":"في C خمسة رموز.","En":"C has five symbols."},{"Ar":"في A رمزان وفي B ثلاثة، ومجموعهما خمسة.","En":"A has two and B has three, totaling five."}],"Substitution":{"Ar":"$2+3=5$","En":"$2+3=5$"},"Result":{"Ar":"$A+B$","En":"$A+B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5=5$","En":"$5=5$"},"CommonError":{"Ar":"لا تبحث عن صف واحد فقط.","En":"Do not look for only one row."}}}$mw$::jsonb,$mw$نجمع رموز كل زوج ونقارن المجموع بعدد رموز C.

$2+3=5$

1. في C خمسة رموز.

2. في A رمزان وفي B ثلاثة، ومجموعهما خمسة.

$2+3=5$

$A+B$

$5=5$

لا تبحث عن صف واحد فقط.$mw$,$mw$Add the symbols in each pair and compare with C's count.

$2+3=5$

1. C has five symbols.

2. A has two and B has three, totaling five.

$2+3=5$

$A+B$

$5=5$

Do not look for only one row.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد رموز C أولاً.","En":"Count C's symbols first."},{"Ar":"ابحث عن صفين مجموعهما خمسة.","En":"Find two rows whose combined count is five."}],"Solution":{"Idea":{"Ar":"نجمع رموز كل زوج ونقارن المجموع بعدد رموز C.","En":"Add the symbols in each pair and compare with C's count."},"FormulaLatex":"2+3=5","Steps":[{"Ar":"في C خمسة رموز.","En":"C has five symbols."},{"Ar":"في A رمزان وفي B ثلاثة، ومجموعهما خمسة.","En":"A has two and B has three, totaling five."}],"Substitution":{"Ar":"$2+3=5$","En":"$2+3=5$"},"Result":{"Ar":"$A+B$","En":"$A+B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5=5$","En":"$5=5$"},"CommonError":{"Ar":"لا تبحث عن صف واحد فقط.","En":"Do not look for only one row."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المجموع 3.","En":"The total is 3."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المجموع 4.","En":"The total is 4."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المجموع 6.","En":"The total is 6."},"Order":4}]}$mw$),
($mw$growth-v36-grade-4-addition-missing-tens-digit-1$mw$,$mw$addition-missing-tens-digit$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"رقم مفقود في جمع عمودي","En":"Missing digit in column addition"},"Question":{"Ar":"في الجمع 3□7+248=615، تمثل □ رقماً واحداً في منزلة العشرات. ما الرقم المفقود؟","En":"In the addition 3□7+248=615, □ represents one tens digit. What is the missing digit?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"357+248=605.","En":"357+248=605."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"377+248=625.","En":"377+248=625."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"387+248=635.","En":"387+248=635."}}],"Hints":[{"Ar":"ابدأ بجمع الآحاد وانتبه للحمل.","En":"Start with the ones and note the carry."},{"Ar":"ما الرقم الذي إذا أضفت إليه 4 ثم 1 أعطى 11؟","En":"Which digit plus 4 plus 1 gives 11?"}],"Solution":{"Idea":{"Ar":"نحسب الآحاد مع الحمل ثم نجد رقم العشرات الذي يعطي الرقم المطلوب.","En":"Add the ones with regrouping, then find the tens digit that produces the required result."},"FormulaLatex":"615-248=367","Steps":[{"Ar":"7+8=15، نكتب 5 ونحمل عشرة واحدة.","En":"7+8=15; write 5 and carry one ten."},{"Ar":"رقم العشرات المفقود مع 4 والعشرة المحمولة يعطي 11 عشرات، لذلك الرقم 6.","En":"The missing tens digit plus 4 plus the carried ten must give eleven tens, so it is 6."}],"Substitution":{"Ar":"$6+4+1=11$","En":"$6+4+1=11$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$367+248=615$","En":"$367+248=615$"},"CommonError":{"Ar":"لا تنس العشرة المحمولة من الآحاد.","En":"Do not forget the ten carried from the ones."}}}$mw$::jsonb,$mw$نحسب الآحاد مع الحمل ثم نجد رقم العشرات الذي يعطي الرقم المطلوب.

$615-248=367$

1. 7+8=15، نكتب 5 ونحمل عشرة واحدة.

2. رقم العشرات المفقود مع 4 والعشرة المحمولة يعطي 11 عشرات، لذلك الرقم 6.

$6+4+1=11$

$6$

$367+248=615$

لا تنس العشرة المحمولة من الآحاد.$mw$,$mw$Add the ones with regrouping, then find the tens digit that produces the required result.

$615-248=367$

1. 7+8=15; write 5 and carry one ten.

2. The missing tens digit plus 4 plus the carried ten must give eleven tens, so it is 6.

$6+4+1=11$

$6$

$367+248=615$

Do not forget the ten carried from the ones.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بجمع الآحاد وانتبه للحمل.","En":"Start with the ones and note the carry."},{"Ar":"ما الرقم الذي إذا أضفت إليه 4 ثم 1 أعطى 11؟","En":"Which digit plus 4 plus 1 gives 11?"}],"Solution":{"Idea":{"Ar":"نحسب الآحاد مع الحمل ثم نجد رقم العشرات الذي يعطي الرقم المطلوب.","En":"Add the ones with regrouping, then find the tens digit that produces the required result."},"FormulaLatex":"615-248=367","Steps":[{"Ar":"7+8=15، نكتب 5 ونحمل عشرة واحدة.","En":"7+8=15; write 5 and carry one ten."},{"Ar":"رقم العشرات المفقود مع 4 والعشرة المحمولة يعطي 11 عشرات، لذلك الرقم 6.","En":"The missing tens digit plus 4 plus the carried ten must give eleven tens, so it is 6."}],"Substitution":{"Ar":"$6+4+1=11$","En":"$6+4+1=11$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$367+248=615$","En":"$367+248=615$"},"CommonError":{"Ar":"لا تنس العشرة المحمولة من الآحاد.","En":"Do not forget the ten carried from the ones."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"357+248=605.","En":"357+248=605."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"377+248=625.","En":"377+248=625."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"387+248=635.","En":"387+248=635."},"Order":4}]}$mw$),
($mw$growth-v36-grade-4-length-centimeters-decompose-meters-remainder-1$mw$,$mw$length-centimeters-decompose-meters-remainder$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تفكيك الطول إلى أمتار وسنتيمترات","En":"Expressing centimetres in metres and centimetres"},"Question":{"Ar":"طول شريط 407 سم. ما الزوج المرتب الذي يمثل عدد الأمتار الكاملة ثم السنتيمترات المتبقية؟","En":"A strip is 407 cm long. Which ordered pair gives the number of whole metres followed by the remaining centimetres?"},"Options":[{"LatexCode":"(4,7)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(4,70)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 أمتار و70 سم تساوي 470 سم.","En":"4 m and 70 cm equals 470 cm."}},{"LatexCode":"(40,7)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"40 متراً أكبر بكثير من 407 سم.","En":"40 m is far greater than 407 cm."}},{"LatexCode":"(7,4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعكس العددين، فيعطي 704 سم.","En":"Reversing the numbers gives 704 cm."}}],"Hints":[{"Ar":"كم مجموعة كاملة من 100 في 407؟","En":"How many complete hundreds are in 407?"},{"Ar":"احسب الباقي بعد استبعاد 400.","En":"Find the remainder after removing 400."}],"Solution":{"Idea":{"Ar":"كل متر يساوي 100 سم؛ نقسم الطول إلى مجموعات من مئة والباقي.","En":"Each metre is 100 cm; separate the length into hundreds and a remainder."},"FormulaLatex":"407=4\\cdot100+7","Steps":[{"Ar":"400 سم تساوي أربعة أمتار كاملة.","En":"400 cm equals four whole metres."},{"Ar":"تبقى سبعة سنتيمترات.","En":"Seven centimetres remain."}],"Substitution":{"Ar":"$407-400=7$","En":"$407-400=7$"},"Result":{"Ar":"$(4,7)$","En":"$(4,7)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"4 أمتار تساوي 400 سم؛ مع 7 سم يصبح الطول 407 سم.","En":"4 m is 400 cm; with 7 cm the total is 407 cm."},"CommonError":{"Ar":"لا تعتبر السبعة في منزلة العشرات.","En":"Do not treat the seven as a tens digit."}}}$mw$::jsonb,$mw$كل متر يساوي 100 سم؛ نقسم الطول إلى مجموعات من مئة والباقي.

$407=4\cdot100+7$

1. 400 سم تساوي أربعة أمتار كاملة.

2. تبقى سبعة سنتيمترات.

$407-400=7$

$(4,7)$

4 أمتار تساوي 400 سم؛ مع 7 سم يصبح الطول 407 سم.

لا تعتبر السبعة في منزلة العشرات.$mw$,$mw$Each metre is 100 cm; separate the length into hundreds and a remainder.

$407=4\cdot100+7$

1. 400 cm equals four whole metres.

2. Seven centimetres remain.

$407-400=7$

$(4,7)$

4 m is 400 cm; with 7 cm the total is 407 cm.

Do not treat the seven as a tens digit.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم مجموعة كاملة من 100 في 407؟","En":"How many complete hundreds are in 407?"},{"Ar":"احسب الباقي بعد استبعاد 400.","En":"Find the remainder after removing 400."}],"Solution":{"Idea":{"Ar":"كل متر يساوي 100 سم؛ نقسم الطول إلى مجموعات من مئة والباقي.","En":"Each metre is 100 cm; separate the length into hundreds and a remainder."},"FormulaLatex":"407=4\\cdot100+7","Steps":[{"Ar":"400 سم تساوي أربعة أمتار كاملة.","En":"400 cm equals four whole metres."},{"Ar":"تبقى سبعة سنتيمترات.","En":"Seven centimetres remain."}],"Substitution":{"Ar":"$407-400=7$","En":"$407-400=7$"},"Result":{"Ar":"$(4,7)$","En":"$(4,7)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"4 أمتار تساوي 400 سم؛ مع 7 سم يصبح الطول 407 سم.","En":"4 m is 400 cm; with 7 cm the total is 407 cm."},"CommonError":{"Ar":"لا تعتبر السبعة في منزلة العشرات.","En":"Do not treat the seven as a tens digit."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 أمتار و70 سم تساوي 470 سم.","En":"4 m and 70 cm equals 470 cm."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"40 متراً أكبر بكثير من 407 سم.","En":"40 m is far greater than 407 cm."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعكس العددين، فيعطي 704 سم.","En":"Reversing the numbers gives 704 cm."},"Order":4}]}$mw$),
($mw$growth-v36-grade-5-product-scale-place-value-1$mw$,$mw$product-scale-place-value$mw$,$mw$primary-multiplication$mw$,$mw$grade-5$mw$,5,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغير حاصل الضرب بتغير المنازل","En":"Scaling a product by place value"},"Question":{"Ar":"إذا كان 37×24=888، فما حاصل 370×240؟","En":"If 37×24=888, what is 370×240?"},"Options":[{"LatexCode":"888","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"888 حاصل الضرب الأصلي.","En":"888 is the original product."}},{"LatexCode":"8880","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8880 يضاعف عاملاً واحداً بعشرة فقط.","En":"8880 scales only one factor by ten."}},{"LatexCode":"88800","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"888000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"888000 يضرب الناتج في ألف لا مئة.","En":"888000 scales the product by one thousand instead of one hundred."}}],"Hints":[{"Ar":"بكم تضاعف كل عامل؟","En":"By what factor did each factor increase?"},{"Ar":"اضرب معاملي التغير معاً.","En":"Multiply the two scaling factors."}],"Solution":{"Idea":{"Ar":"ضرب كل عامل في عشرة يجعل حاصل الضرب مئة ضعف.","En":"Multiplying each factor by ten multiplies the product by one hundred."},"FormulaLatex":" (10a)(10b)=100ab","Steps":[{"Ar":"$370=10\\cdot37,\\quad240=10\\cdot24$","En":"$370=10\\cdot37,\\quad240=10\\cdot24$"},{"Ar":"$370\\cdot240=100\\cdot888$","En":"$370\\cdot240=100\\cdot888$"}],"Substitution":{"Ar":"$888\\cdot100=88800$","En":"$888\\cdot100=88800$"},"Result":{"Ar":"$88800$","En":"$88800$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$370\\cdot(200+40)=74000+14800=88800$","En":"$370\\cdot(200+40)=74000+14800=88800$"},"CommonError":{"Ar":"لا تضف صفراً واحداً عندما يتغير العاملان بعشرة.","En":"Do not append only one zero when both factors scale by ten."}}}$mw$::jsonb,$mw$ضرب كل عامل في عشرة يجعل حاصل الضرب مئة ضعف.

$ (10a)(10b)=100ab$

1. $370=10\cdot37,\quad240=10\cdot24$

2. $370\cdot240=100\cdot888$

$888\cdot100=88800$

$88800$

$370\cdot(200+40)=74000+14800=88800$

لا تضف صفراً واحداً عندما يتغير العاملان بعشرة.$mw$,$mw$Multiplying each factor by ten multiplies the product by one hundred.

$ (10a)(10b)=100ab$

1. $370=10\cdot37,\quad240=10\cdot24$

2. $370\cdot240=100\cdot888$

$888\cdot100=88800$

$88800$

$370\cdot(200+40)=74000+14800=88800$

Do not append only one zero when both factors scale by ten.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"بكم تضاعف كل عامل؟","En":"By what factor did each factor increase?"},{"Ar":"اضرب معاملي التغير معاً.","En":"Multiply the two scaling factors."}],"Solution":{"Idea":{"Ar":"ضرب كل عامل في عشرة يجعل حاصل الضرب مئة ضعف.","En":"Multiplying each factor by ten multiplies the product by one hundred."},"FormulaLatex":" (10a)(10b)=100ab","Steps":[{"Ar":"$370=10\\cdot37,\\quad240=10\\cdot24$","En":"$370=10\\cdot37,\\quad240=10\\cdot24$"},{"Ar":"$370\\cdot240=100\\cdot888$","En":"$370\\cdot240=100\\cdot888$"}],"Substitution":{"Ar":"$888\\cdot100=88800$","En":"$888\\cdot100=88800$"},"Result":{"Ar":"$88800$","En":"$88800$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$370\\cdot(200+40)=74000+14800=88800$","En":"$370\\cdot(200+40)=74000+14800=88800$"},"CommonError":{"Ar":"لا تضف صفراً واحداً عندما يتغير العاملان بعشرة.","En":"Do not append only one zero when both factors scale by ten."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"888 حاصل الضرب الأصلي.","En":"888 is the original product."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"8880 يضاعف عاملاً واحداً بعشرة فقط.","En":"8880 scales only one factor by ten."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"888000 يضرب الناتج في ألف لا مئة.","En":"888000 scales the product by one thousand instead of one hundred."},"Order":4}]}$mw$),
($mw$growth-v36-grade-6-median-insert-two-opposite-ends-1$mw$,$mw$median-insert-two-opposite-ends$mw$,$mw$primary-median$mw$,$mw$grade-6$mw$,6,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إضافة قيمتين إلى طرفي البيانات","En":"Adding observations at both ends"},"Question":{"Ar":"القيم المرتبة هي 4، 6، 9، 12، 15. أضيفت القيمة 1 في بداية القائمة و20 في نهايتها. ما وسيط القائمة الجديدة؟","En":"The ordered values are 4, 6, 9, 12, 15. The value 1 is added at the beginning and 20 at the end. What is the new median?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 القيمة الثالثة في القائمة الجديدة لا الرابعة.","En":"6 is the third value in the new list, not the fourth."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10.5 متوسط 9 و12، لكن العدد فردي.","En":"10.5 averages 9 and 12, but the count is odd."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 القيمة الخامسة لا الوسطى.","En":"12 is the fifth value, not the middle one."}}],"Hints":[{"Ar":"رتب القيم بعد الإضافة.","En":"Order the values after adding the two observations."},{"Ar":"حدد القيمة الرابعة من سبع.","En":"Find the fourth of seven values."}],"Solution":{"Idea":{"Ar":"إضافة قيمة أصغر من الجميع وأخرى أكبر من الجميع تحافظ على موضع القيمة الوسطى النسبي.","En":"Adding one value below all others and one above all others preserves the middle observation."},"FormulaLatex":"k=(7+1)/2=4","Steps":[{"Ar":"القائمة الجديدة 1،4،6،9،12،15،20.","En":"The new list is 1,4,6,9,12,15,20."},{"Ar":"لدينا سبع قيم؛ الوسطى هي الرابعة.","En":"There are seven values; the middle is the fourth."}],"Substitution":{"Ar":"$x_4=9$","En":"$x_4=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+1+3=7$","En":"$3+1+3=7$"},"CommonError":{"Ar":"لا تستخدم متوسط قيمتين وسطيتين لقائمة فردية العدد.","En":"Do not average two middle values for an odd-sized list."}}}$mw$::jsonb,$mw$إضافة قيمة أصغر من الجميع وأخرى أكبر من الجميع تحافظ على موضع القيمة الوسطى النسبي.

$k=(7+1)/2=4$

1. القائمة الجديدة 1،4،6،9،12،15،20.

2. لدينا سبع قيم؛ الوسطى هي الرابعة.

$x_4=9$

$9$

$3+1+3=7$

لا تستخدم متوسط قيمتين وسطيتين لقائمة فردية العدد.$mw$,$mw$Adding one value below all others and one above all others preserves the middle observation.

$k=(7+1)/2=4$

1. The new list is 1,4,6,9,12,15,20.

2. There are seven values; the middle is the fourth.

$x_4=9$

$9$

$3+1+3=7$

Do not average two middle values for an odd-sized list.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"رتب القيم بعد الإضافة.","En":"Order the values after adding the two observations."},{"Ar":"حدد القيمة الرابعة من سبع.","En":"Find the fourth of seven values."}],"Solution":{"Idea":{"Ar":"إضافة قيمة أصغر من الجميع وأخرى أكبر من الجميع تحافظ على موضع القيمة الوسطى النسبي.","En":"Adding one value below all others and one above all others preserves the middle observation."},"FormulaLatex":"k=(7+1)/2=4","Steps":[{"Ar":"القائمة الجديدة 1،4،6،9،12،15،20.","En":"The new list is 1,4,6,9,12,15,20."},{"Ar":"لدينا سبع قيم؛ الوسطى هي الرابعة.","En":"There are seven values; the middle is the fourth."}],"Substitution":{"Ar":"$x_4=9$","En":"$x_4=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+1+3=7$","En":"$3+1+3=7$"},"CommonError":{"Ar":"لا تستخدم متوسط قيمتين وسطيتين لقائمة فردية العدد.","En":"Do not average two middle values for an odd-sized list."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"6 القيمة الثالثة في القائمة الجديدة لا الرابعة.","En":"6 is the third value in the new list, not the fourth."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"10.5 متوسط 9 و12، لكن العدد فردي.","En":"10.5 averages 9 and 12, but the count is odd."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 القيمة الخامسة لا الوسطى.","En":"12 is the fifth value, not the middle one."},"Order":4}]}$mw$),
($mw$growth-v36-grade-12-norm-of-sum-from-dot-product-1$mw$,$mw$norm-of-sum-from-dot-product$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معيار مجموع متجهين من الضرب القياسي","En":"Norm of a sum from the dot product"},"Question":{"Ar":"إذا كان $\\|u\\|=3$ و$\\|v\\|=4$ و$u\\cdot v=12$، فما معيار $u+v$؟","En":"If $\\|u\\|=3$, $\\|v\\|=4$ and $u\\cdot v=12$, what is $\\|u+v\\|$?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 يهمل حد الضرب القياسي ويفترض التعامد.","En":"5 omits the dot-product term and assumes orthogonality."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"25 مجموع مربعي المعيارين فقط.","En":"25 is only the sum of squared norms."}},{"LatexCode":"49","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"49 مربع المعيار المطلوب لا المعيار.","En":"49 is the squared norm, not the norm."}}],"Hints":[{"Ar":"وسع الضرب القياسي للمجموع مع نفسه.","En":"Expand the dot product of the sum with itself."},{"Ar":"لا تنس الحد المتقاطع ثم خذ الجذر.","En":"Include the cross term, then take the square root."}],"Solution":{"Idea":{"Ar":"مربع معيار المجموع يتضمن مربعي المعيارين وضعف الضرب القياسي.","En":"The squared norm of a sum includes both squared norms and twice the dot product."},"FormulaLatex":"\\|u+v\\|^2=\\|u\\|^2+2u\\cdot v+\\|v\\|^2","Steps":[{"Ar":"$\\|u+v\\|^2=9+24+16=49$","En":"$\\|u+v\\|^2=9+24+16=49$"},{"Ar":"المعيار غير سالب، فنأخذ الجذر الموجب.","En":"A norm is nonnegative, so take the positive square root."}],"Substitution":{"Ar":"$\\sqrt{49}=7$","En":"$\\sqrt{49}=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$u\\cdot v=3\\cdot4\\Rightarrow\\cos\\theta=1$","En":"$u\\cdot v=3\\cdot4\\Rightarrow\\cos\\theta=1$"},"CommonError":{"Ar":"لا تهمل ضعف الضرب القياسي إلا إذا كان صفراً.","En":"Do not omit twice the dot product unless it is zero."}}}$mw$::jsonb,$mw$مربع معيار المجموع يتضمن مربعي المعيارين وضعف الضرب القياسي.

$\|u+v\|^2=\|u\|^2+2u\cdot v+\|v\|^2$

1. $\|u+v\|^2=9+24+16=49$

2. المعيار غير سالب، فنأخذ الجذر الموجب.

$\sqrt{49}=7$

$7$

$u\cdot v=3\cdot4\Rightarrow\cos\theta=1$

لا تهمل ضعف الضرب القياسي إلا إذا كان صفراً.$mw$,$mw$The squared norm of a sum includes both squared norms and twice the dot product.

$\|u+v\|^2=\|u\|^2+2u\cdot v+\|v\|^2$

1. $\|u+v\|^2=9+24+16=49$

2. A norm is nonnegative, so take the positive square root.

$\sqrt{49}=7$

$7$

$u\cdot v=3\cdot4\Rightarrow\cos\theta=1$

Do not omit twice the dot product unless it is zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وسع الضرب القياسي للمجموع مع نفسه.","En":"Expand the dot product of the sum with itself."},{"Ar":"لا تنس الحد المتقاطع ثم خذ الجذر.","En":"Include the cross term, then take the square root."}],"Solution":{"Idea":{"Ar":"مربع معيار المجموع يتضمن مربعي المعيارين وضعف الضرب القياسي.","En":"The squared norm of a sum includes both squared norms and twice the dot product."},"FormulaLatex":"\\|u+v\\|^2=\\|u\\|^2+2u\\cdot v+\\|v\\|^2","Steps":[{"Ar":"$\\|u+v\\|^2=9+24+16=49$","En":"$\\|u+v\\|^2=9+24+16=49$"},{"Ar":"المعيار غير سالب، فنأخذ الجذر الموجب.","En":"A norm is nonnegative, so take the positive square root."}],"Substitution":{"Ar":"$\\sqrt{49}=7$","En":"$\\sqrt{49}=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$u\\cdot v=3\\cdot4\\Rightarrow\\cos\\theta=1$","En":"$u\\cdot v=3\\cdot4\\Rightarrow\\cos\\theta=1$"},"CommonError":{"Ar":"لا تهمل ضعف الضرب القياسي إلا إذا كان صفراً.","En":"Do not omit twice the dot product unless it is zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 يهمل حد الضرب القياسي ويفترض التعامد.","En":"5 omits the dot-product term and assumes orthogonality."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"25 مجموع مربعي المعيارين فقط.","En":"25 is only the sum of squared norms."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"49 مربع المعيار المطلوب لا المعيار.","En":"49 is the squared norm, not the norm."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v36 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
