-- One-time owner-authorized v83 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v83-grade-1-two-oblong-pieces-square-join-1$mw$,$mw$two-oblong-pieces-square-join$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"وصل مستطيلين","En":"Joining rectangles"},"Question":{"Ar":"لدينا مستطيلان ورقيان متطابقان، طول كل منهما ضعف عرضه. أي طريقة لوصلهما دون تداخل أو فراغ تكوّن مربعاً؟ A: وصل الضلعين القصيرين؛ B: وصل الضلعين الطويلين بالكامل؛ C: ملامسة زاوية فقط؛ D: ترك فراغ بينهما.","En":"Two identical paper rectangles each have a long side twice their short side. Which way of joining them without gaps or overlaps makes a square? A: join the short sides; B: join the entire long sides; C: touch at a corner only; D: leave a gap."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينتج مستطيل أطول وأضيق.","En":"This makes a longer, narrower rectangle."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا تتكون مساحة مربعة متصلة من التقاء زاويتين فقط.","En":"Corner-only contact does not form a filled square."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفراغ يمنع تكوين مربع ممتلئ.","En":"A gap prevents a filled square."}}],"Hints":[{"Ar":"تخيّل أن كل مستطيل مكوّن من مربعين صغيرين.","En":"Imagine each rectangle as two small squares."},{"Ar":"ضع أحد المستطيلين فوق الآخر بمحاذاة الحافتين الطويلتين.","En":"Place one above the other with the long edges aligned."}],"Solution":{"Idea":{"Ar":"عند وصل الضلعين الطويلين يصبح العرض الكلي مساوياً للطول.","En":"Joining long sides doubles the width to match the length."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"يمثل كل مستطيل صفاً طوله مربعان وعرضه مربع واحد.","En":"Each rectangle is a row two squares long and one wide."},{"Ar":"نضع صفين متراصين لتكوين مربع.","En":"Place the two rows together to make a square."}],"Substitution":{"Ar":"$2=2$","En":"$2=2$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الشكل الناتج صفان وفي كل صف مربعان.","En":"The resulting shape has two rows of two squares."},"CommonError":{"Ar":"وصل الضلعين القصيرين بدلاً من الطويلين.","En":"Joining the short edges instead of the long edges."}}}$mw$::jsonb,$mw$عند وصل الضلعين الطويلين يصبح العرض الكلي مساوياً للطول.

$1+1=2$

1. يمثل كل مستطيل صفاً طوله مربعان وعرضه مربع واحد.

2. نضع صفين متراصين لتكوين مربع.

$2=2$

$B$

الشكل الناتج صفان وفي كل صف مربعان.

وصل الضلعين القصيرين بدلاً من الطويلين.$mw$,$mw$Joining long sides doubles the width to match the length.

$1+1=2$

1. Each rectangle is a row two squares long and one wide.

2. Place the two rows together to make a square.

$2=2$

$B$

The resulting shape has two rows of two squares.

Joining the short edges instead of the long edges.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"تخيّل أن كل مستطيل مكوّن من مربعين صغيرين.","En":"Imagine each rectangle as two small squares."},{"Ar":"ضع أحد المستطيلين فوق الآخر بمحاذاة الحافتين الطويلتين.","En":"Place one above the other with the long edges aligned."}],"Solution":{"Idea":{"Ar":"عند وصل الضلعين الطويلين يصبح العرض الكلي مساوياً للطول.","En":"Joining long sides doubles the width to match the length."},"FormulaLatex":"1+1=2","Steps":[{"Ar":"يمثل كل مستطيل صفاً طوله مربعان وعرضه مربع واحد.","En":"Each rectangle is a row two squares long and one wide."},{"Ar":"نضع صفين متراصين لتكوين مربع.","En":"Place the two rows together to make a square."}],"Substitution":{"Ar":"$2=2$","En":"$2=2$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الشكل الناتج صفان وفي كل صف مربعان.","En":"The resulting shape has two rows of two squares."},"CommonError":{"Ar":"وصل الضلعين القصيرين بدلاً من الطويلين.","En":"Joining the short edges instead of the long edges."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ينتج مستطيل أطول وأضيق.","En":"This makes a longer, narrower rectangle."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا تتكون مساحة مربعة متصلة من التقاء زاويتين فقط.","En":"Corner-only contact does not form a filled square."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الفراغ يمنع تكوين مربع ممتلئ.","En":"A gap prevents a filled square."},"Order":4}]}$mw$),
($mw$growth-v83-grade-1-fold-square-corner-correspondence-1$mw$,$mw$fold-square-corner-correspondence$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"زاويتان تتطابقان","En":"Matching corners"},"Question":{"Ar":"وُضعت ورقة مربعة مسطحة. نطوي نصفها الأيسر فوق نصفها الأيمن على خط من منتصف الضلع العلوي إلى منتصف الضلع السفلي. أي زاوية تقع فوق الزاوية العلوية اليمنى؟ A: السفلية اليسرى؛ B: السفلية اليمنى؛ C: العلوية اليسرى؛ D: لا زاوية.","En":"A square sheet lies flat. Fold its left half onto its right half along the line from the top midpoint to the bottom midpoint. Which corner lands on the top-right corner? A: bottom-left; B: bottom-right; C: top-left; D: none."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الطي لا ينقل الأسفل إلى الأعلى.","En":"The fold does not move bottom to top."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه الزاوية تبقى في النصف الأيمن.","En":"This corner stays on the right half."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الزاوية العلوية اليسرى تنطبق عليها.","En":"The top-left corner matches it."}}],"Hints":[{"Ar":"الطي ينقل النصف الأيسر إلى الأيمن فقط.","En":"The fold moves the left half onto the right."},{"Ar":"تبقى النقاط العلوية في الأعلى.","En":"Top points stay at the top."}],"Solution":{"Idea":{"Ar":"نطابق الزوايا الواقعة على جانبي خط الطي عند الارتفاع نفسه.","En":"Match corners on opposite sides of the fold at the same height."},"FormulaLatex":"\\text{left}\\to\\text{right}","Steps":[{"Ar":"الزاويتان العلويتان تبعدان المسافة نفسها عن خط الطي.","En":"The two top corners are equally far from the fold."},{"Ar":"عند الطي تنطبق العلوية اليسرى على العلوية اليمنى.","En":"Folding brings the top-left corner onto the top-right corner."}],"Substitution":{"Ar":"$\\text{top-left}\\to\\text{top-right}$","En":"$\\text{top-left}\\to\\text{top-right}$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالمثل تنطبق الزاوية السفلية اليسرى على السفلية اليمنى.","En":"Similarly the bottom-left matches the bottom-right."},"CommonError":{"Ar":"الخلط بين طي اليمين واليسار وطي الأعلى والأسفل.","En":"Confusing a left-right fold with a top-bottom fold."}}}$mw$::jsonb,$mw$نطابق الزوايا الواقعة على جانبي خط الطي عند الارتفاع نفسه.

$\text{left}\to\text{right}$

1. الزاويتان العلويتان تبعدان المسافة نفسها عن خط الطي.

2. عند الطي تنطبق العلوية اليسرى على العلوية اليمنى.

$\text{top-left}\to\text{top-right}$

$C$

بالمثل تنطبق الزاوية السفلية اليسرى على السفلية اليمنى.

الخلط بين طي اليمين واليسار وطي الأعلى والأسفل.$mw$,$mw$Match corners on opposite sides of the fold at the same height.

$\text{left}\to\text{right}$

1. The two top corners are equally far from the fold.

2. Folding brings the top-left corner onto the top-right corner.

$\text{top-left}\to\text{top-right}$

$C$

Similarly the bottom-left matches the bottom-right.

Confusing a left-right fold with a top-bottom fold.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"الطي ينقل النصف الأيسر إلى الأيمن فقط.","En":"The fold moves the left half onto the right."},{"Ar":"تبقى النقاط العلوية في الأعلى.","En":"Top points stay at the top."}],"Solution":{"Idea":{"Ar":"نطابق الزوايا الواقعة على جانبي خط الطي عند الارتفاع نفسه.","En":"Match corners on opposite sides of the fold at the same height."},"FormulaLatex":"\\text{left}\\to\\text{right}","Steps":[{"Ar":"الزاويتان العلويتان تبعدان المسافة نفسها عن خط الطي.","En":"The two top corners are equally far from the fold."},{"Ar":"عند الطي تنطبق العلوية اليسرى على العلوية اليمنى.","En":"Folding brings the top-left corner onto the top-right corner."}],"Substitution":{"Ar":"$\\text{top-left}\\to\\text{top-right}$","En":"$\\text{top-left}\\to\\text{top-right}$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالمثل تنطبق الزاوية السفلية اليسرى على السفلية اليمنى.","En":"Similarly the bottom-left matches the bottom-right."},"CommonError":{"Ar":"الخلط بين طي اليمين واليسار وطي الأعلى والأسفل.","En":"Confusing a left-right fold with a top-bottom fold."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الطي لا ينقل الأسفل إلى الأعلى.","En":"The fold does not move bottom to top."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه الزاوية تبقى في النصف الأيمن.","En":"This corner stays on the right half."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الزاوية العلوية اليسرى تنطبق عليها.","En":"The top-left corner matches it."},"Order":4}]}$mw$),
($mw$growth-v83-grade-2-pictograph-tied-second-place-1$mw$,$mw$pictograph-tied-second-place$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تساوٍ في المركز الثاني","En":"Tied for second"},"Question":{"Ar":"كل ● يمثل صوتاً واحداً. A: ●●●●●؛ B: ●●●؛ C: ●●●؛ D: ●. أي فئتين تتساويان في العدد وتأتيان مباشرة بعد الفئة الأعلى؟ A: A وB؛ B: B وC؛ C: A وD؛ D: C وD.","En":"Each ● represents one vote. A: ●●●●●; B: ●●●; C: ●●●; D: ●. Which two categories tie immediately below the highest count? A: A and B; B: B and C; C: A and D; D: C and D."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"A لها خمسة أصوات وB ثلاثة.","En":"A has five votes and B three."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة وواحد غير متساويين.","En":"Five and one are unequal."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة وواحد غير متساويين.","En":"Three and one are unequal."}}],"Hints":[{"Ar":"ابحث عن العدد الأكبر أولاً.","En":"Find the highest count first."},{"Ar":"ثم ابحث عن الصفين المتساويين في العدد التالي.","En":"Find the two rows tied at the next count."}],"Solution":{"Idea":{"Ar":"نرتب الأعداد تنازلياً ونحدد التعادل بعد الأكبر.","En":"Order the counts and identify the tie below the largest."},"FormulaLatex":"5>3=3>1","Steps":[{"Ar":"A هي الأعلى بخمسة أصوات.","En":"A is highest with five votes."},{"Ar":"B وC لكل منهما ثلاثة أصوات، وهما التاليان.","En":"B and C each have three votes and are next."}],"Substitution":{"Ar":"$3=3$","En":"$3=3$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"D لديها صوت واحد فقط، فلا تشاركهما المركز الثاني.","En":"D has only one vote, so it does not share second place."},"CommonError":{"Ar":"اعتبار الفئة الأعلى جزءاً من التعادل رغم اختلاف العدد.","En":"Including the highest category in the tie despite unequal counts."}}}$mw$::jsonb,$mw$نرتب الأعداد تنازلياً ونحدد التعادل بعد الأكبر.

$5>3=3>1$

1. A هي الأعلى بخمسة أصوات.

2. B وC لكل منهما ثلاثة أصوات، وهما التاليان.

$3=3$

$B$

D لديها صوت واحد فقط، فلا تشاركهما المركز الثاني.

اعتبار الفئة الأعلى جزءاً من التعادل رغم اختلاف العدد.$mw$,$mw$Order the counts and identify the tie below the largest.

$5>3=3>1$

1. A is highest with five votes.

2. B and C each have three votes and are next.

$3=3$

$B$

D has only one vote, so it does not share second place.

Including the highest category in the tie despite unequal counts.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابحث عن العدد الأكبر أولاً.","En":"Find the highest count first."},{"Ar":"ثم ابحث عن الصفين المتساويين في العدد التالي.","En":"Find the two rows tied at the next count."}],"Solution":{"Idea":{"Ar":"نرتب الأعداد تنازلياً ونحدد التعادل بعد الأكبر.","En":"Order the counts and identify the tie below the largest."},"FormulaLatex":"5>3=3>1","Steps":[{"Ar":"A هي الأعلى بخمسة أصوات.","En":"A is highest with five votes."},{"Ar":"B وC لكل منهما ثلاثة أصوات، وهما التاليان.","En":"B and C each have three votes and are next."}],"Substitution":{"Ar":"$3=3$","En":"$3=3$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"D لديها صوت واحد فقط، فلا تشاركهما المركز الثاني.","En":"D has only one vote, so it does not share second place."},"CommonError":{"Ar":"اعتبار الفئة الأعلى جزءاً من التعادل رغم اختلاف العدد.","En":"Including the highest category in the tie despite unequal counts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"A لها خمسة أصوات وB ثلاثة.","En":"A has five votes and B three."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خمسة وواحد غير متساويين.","En":"Five and one are unequal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة وواحد غير متساويين.","En":"Three and one are unequal."},"Order":4}]}$mw$),
($mw$growth-v83-grade-2-pictograph-exclude-category-two-conditions-1$mw$,$mw$pictograph-exclude-category-two-conditions$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار الصف المستبعد","En":"Choosing a row to exclude"},"Question":{"Ar":"كل ● يمثل بطاقة. A: ●●●●؛ B: ●●●؛ C: ●●. نريد اختيار فئتين مجموع بطاقاتهما ست، والفرق بين عدديهما اثنتان. أي فئة لا نختارها؟ A: الفئة A؛ B: الفئة B؛ C: الفئة C؛ D: لا يوجد حل.","En":"Each ● represents a card. A: ●●●●; B: ●●●; C: ●●. Select two categories whose total is six and whose counts differ by two. Which category is not selected? A: category A; B: category B; C: category C; D: impossible."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختيار B وC يعطي خمس بطاقات وفرقاً واحداً.","En":"B and C total five and differ by one."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختيار A وB يعطي سبع بطاقات وفرقاً واحداً.","En":"A and B total seven and differ by one."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن اختيار A وC لتحقيق الشرطين.","En":"A and C meet both conditions."}}],"Hints":[{"Ar":"جرّب جمع كل زوج من الأعداد 4 و3 و2.","En":"Try adding each pair of 4, 3 and 2."},{"Ar":"تحقق من الفرق للزوج الذي مجموعه ستة.","En":"Check the difference for the pair totaling six."}],"Solution":{"Idea":{"Ar":"نختبر شرطي المجموع والفرق معاً.","En":"Test both the total and the difference."},"FormulaLatex":"4+2=6,\\quad4-2=2","Steps":[{"Ar":"A وC مجموعهما ست بطاقات.","En":"A and C total six cards."},{"Ar":"الفرق بينهما اثنتان، لذا نستبعد B.","En":"Their difference is two, so exclude B."}],"Substitution":{"Ar":"$4-2=2$","En":"$4-2=2$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الزوجان الآخران مجموعاهما سبعة وخمسة، فلا يحققان الشرط الأول.","En":"The other pairs total seven and five, so neither meets the first condition."},"CommonError":{"Ar":"التحقق من شرط واحد فقط أو إعطاء الفئة المختارة.","En":"Checking only one condition or naming a selected category."}}}$mw$::jsonb,$mw$نختبر شرطي المجموع والفرق معاً.

$4+2=6,\quad4-2=2$

1. A وC مجموعهما ست بطاقات.

2. الفرق بينهما اثنتان، لذا نستبعد B.

$4-2=2$

$B$

الزوجان الآخران مجموعاهما سبعة وخمسة، فلا يحققان الشرط الأول.

التحقق من شرط واحد فقط أو إعطاء الفئة المختارة.$mw$,$mw$Test both the total and the difference.

$4+2=6,\quad4-2=2$

1. A and C total six cards.

2. Their difference is two, so exclude B.

$4-2=2$

$B$

The other pairs total seven and five, so neither meets the first condition.

Checking only one condition or naming a selected category.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"جرّب جمع كل زوج من الأعداد 4 و3 و2.","En":"Try adding each pair of 4, 3 and 2."},{"Ar":"تحقق من الفرق للزوج الذي مجموعه ستة.","En":"Check the difference for the pair totaling six."}],"Solution":{"Idea":{"Ar":"نختبر شرطي المجموع والفرق معاً.","En":"Test both the total and the difference."},"FormulaLatex":"4+2=6,\\quad4-2=2","Steps":[{"Ar":"A وC مجموعهما ست بطاقات.","En":"A and C total six cards."},{"Ar":"الفرق بينهما اثنتان، لذا نستبعد B.","En":"Their difference is two, so exclude B."}],"Substitution":{"Ar":"$4-2=2$","En":"$4-2=2$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الزوجان الآخران مجموعاهما سبعة وخمسة، فلا يحققان الشرط الأول.","En":"The other pairs total seven and five, so neither meets the first condition."},"CommonError":{"Ar":"التحقق من شرط واحد فقط أو إعطاء الفئة المختارة.","En":"Checking only one condition or naming a selected category."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اختيار B وC يعطي خمس بطاقات وفرقاً واحداً.","En":"B and C total five and differ by one."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اختيار A وB يعطي سبع بطاقات وفرقاً واحداً.","En":"A and B total seven and differ by one."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يمكن اختيار A وC لتحقيق الشرطين.","En":"A and C meet both conditions."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-mode-from-frequency-record-1$mw$,$mw$mode-from-frequency-record$mw$,$mw$primary-mode$mw$,$mw$grade-4$mw$,4,1,4,20,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":20,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المنوال من جدول التكرار","En":"Mode from frequencies"},"Question":{"Ar":"سجل عدد الكتب التي قرأها الطلاب: العدد 2 قرأه خمسة طلاب، والعدد 3 قرأه طالبان، والعدد 4 قرأه أربعة طلاب. ما منوال عدد الكتب؟","En":"The number of books read was recorded: five pupils read 2 books, two pupils read 3, and four pupils read 4. What is the mode of the book counts?"},"Options":[{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العدد 3 تكرر مرتين فقط.","En":"The value 3 occurs only twice."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العدد 4 تكرر أربع مرات، أقل من خمس.","En":"The value 4 occurs four times, fewer than five."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة هو التكرار الأعلى وليس قيمة عدد الكتب.","En":"Five is the highest frequency, not the book-count value."}}],"Hints":[{"Ar":"قارن عدد الطلاب لكل قيمة.","En":"Compare the number of pupils for each value."},{"Ar":"اختر قيمة الكتب التي لها أكبر تكرار.","En":"Choose the book count with the highest frequency."}],"Solution":{"Idea":{"Ar":"المنوال هو القيمة ذات أكبر تكرار، لا التكرار نفسه.","En":"The mode is the value with the highest frequency, not the frequency itself."},"FormulaLatex":"5>4>2","Steps":[{"Ar":"تكرار 2 يساوي خمسة، وتكرار 3 اثنان، وتكرار 4 أربعة.","En":"The frequencies of 2, 3 and 4 are five, two and four."},{"Ar":"أكبر تكرار خمسة ويقابل القيمة 2.","En":"The largest frequency is five, belonging to value 2."}],"Substitution":{"Ar":"$5>4$","En":"$5>4$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كتابة البيانات كاملة تعطي خمس نسخ من 2 وأربعاً من 4 ونسختين من 3.","En":"Expanding the record gives five copies of 2, four of 4 and two of 3."},"CommonError":{"Ar":"الإجابة بأكبر تكرار بدلاً من القيمة.","En":"Giving the largest frequency instead of the value."}}}$mw$::jsonb,$mw$المنوال هو القيمة ذات أكبر تكرار، لا التكرار نفسه.

$5>4>2$

1. تكرار 2 يساوي خمسة، وتكرار 3 اثنان، وتكرار 4 أربعة.

2. أكبر تكرار خمسة ويقابل القيمة 2.

$5>4$

$2$

كتابة البيانات كاملة تعطي خمس نسخ من 2 وأربعاً من 4 ونسختين من 3.

الإجابة بأكبر تكرار بدلاً من القيمة.$mw$,$mw$The mode is the value with the highest frequency, not the frequency itself.

$5>4>2$

1. The frequencies of 2, 3 and 4 are five, two and four.

2. The largest frequency is five, belonging to value 2.

$5>4$

$2$

Expanding the record gives five copies of 2, four of 4 and two of 3.

Giving the largest frequency instead of the value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قارن عدد الطلاب لكل قيمة.","En":"Compare the number of pupils for each value."},{"Ar":"اختر قيمة الكتب التي لها أكبر تكرار.","En":"Choose the book count with the highest frequency."}],"Solution":{"Idea":{"Ar":"المنوال هو القيمة ذات أكبر تكرار، لا التكرار نفسه.","En":"The mode is the value with the highest frequency, not the frequency itself."},"FormulaLatex":"5>4>2","Steps":[{"Ar":"تكرار 2 يساوي خمسة، وتكرار 3 اثنان، وتكرار 4 أربعة.","En":"The frequencies of 2, 3 and 4 are five, two and four."},{"Ar":"أكبر تكرار خمسة ويقابل القيمة 2.","En":"The largest frequency is five, belonging to value 2."}],"Substitution":{"Ar":"$5>4$","En":"$5>4$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"كتابة البيانات كاملة تعطي خمس نسخ من 2 وأربعاً من 4 ونسختين من 3.","En":"Expanding the record gives five copies of 2, four of 4 and two of 3."},"CommonError":{"Ar":"الإجابة بأكبر تكرار بدلاً من القيمة.","En":"Giving the largest frequency instead of the value."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"العدد 3 تكرر مرتين فقط.","En":"The value 3 occurs only twice."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"العدد 4 تكرر أربع مرات، أقل من خمس.","En":"The value 4 occurs four times, fewer than five."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خمسة هو التكرار الأعلى وليس قيمة عدد الكتب.","En":"Five is the highest frequency, not the book-count value."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-two-modes-complete-pair-1$mw$,$mw$two-modes-complete-pair$mw$,$mw$primary-mode$mw$,$mw$grade-4$mw$,4,1,4,20,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":20,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"منوالان","En":"Two modes"},"Question":{"Ar":"في البيانات 6، 2، 9، 6، 2، 8، 6، 2، ما جميع قيم المنوال؟ اختر الزوج الذي يحتوي القيمتين دون غيرهما.","En":"In the data 6, 2, 9, 6, 2, 8, 6, 2, what are all the modes? Choose the pair containing exactly the two modal values."},"Options":[{"LatexCode":"(2,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 ظهر مرة واحدة فقط.","En":"8 occurs only once."}},{"LatexCode":"(6,9)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 ظهر مرة واحدة فقط.","En":"9 occurs only once."}},{"LatexCode":"(2,6)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(8,9)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 و9 لكل منهما تكرار واحد، وليس الأعلى.","En":"8 and 9 each occur once, not the highest frequency."}}],"Hints":[{"Ar":"عد مرات ظهور كل قيمة.","En":"Count the occurrences of each value."},{"Ar":"إذا تعادلت قيمتان في أكبر تكرار فكلتاهما منوال.","En":"If two values tie at the highest frequency, both are modes."}],"Solution":{"Idea":{"Ar":"قد توجد أكثر من قيمة منوال عند التعادل في أكبر تكرار.","En":"More than one value can be modal when tied at the highest frequency."},"FormulaLatex":"f(2)=f(6)=3","Steps":[{"Ar":"القيمتان 2 و6 تظهر كل منهما ثلاث مرات.","En":"Both 2 and 6 occur three times."},{"Ar":"8 و9 تظهر كل منهما مرة واحدة.","En":"8 and 9 occur once each."}],"Substitution":{"Ar":"$3>1$","En":"$3>1$"},"Result":{"Ar":"$(2,6)$","En":"$(2,6)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"لا توجد قيمة أخرى تكررت ثلاث مرات.","En":"No other value occurs three times."},"CommonError":{"Ar":"اختيار منوال واحد فقط رغم التعادل.","En":"Choosing only one mode despite a tie."}}}$mw$::jsonb,$mw$قد توجد أكثر من قيمة منوال عند التعادل في أكبر تكرار.

$f(2)=f(6)=3$

1. القيمتان 2 و6 تظهر كل منهما ثلاث مرات.

2. 8 و9 تظهر كل منهما مرة واحدة.

$3>1$

$(2,6)$

لا توجد قيمة أخرى تكررت ثلاث مرات.

اختيار منوال واحد فقط رغم التعادل.$mw$,$mw$More than one value can be modal when tied at the highest frequency.

$f(2)=f(6)=3$

1. Both 2 and 6 occur three times.

2. 8 and 9 occur once each.

$3>1$

$(2,6)$

No other value occurs three times.

Choosing only one mode despite a tie.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد مرات ظهور كل قيمة.","En":"Count the occurrences of each value."},{"Ar":"إذا تعادلت قيمتان في أكبر تكرار فكلتاهما منوال.","En":"If two values tie at the highest frequency, both are modes."}],"Solution":{"Idea":{"Ar":"قد توجد أكثر من قيمة منوال عند التعادل في أكبر تكرار.","En":"More than one value can be modal when tied at the highest frequency."},"FormulaLatex":"f(2)=f(6)=3","Steps":[{"Ar":"القيمتان 2 و6 تظهر كل منهما ثلاث مرات.","En":"Both 2 and 6 occur three times."},{"Ar":"8 و9 تظهر كل منهما مرة واحدة.","En":"8 and 9 occur once each."}],"Substitution":{"Ar":"$3>1$","En":"$3>1$"},"Result":{"Ar":"$(2,6)$","En":"$(2,6)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"لا توجد قيمة أخرى تكررت ثلاث مرات.","En":"No other value occurs three times."},"CommonError":{"Ar":"اختيار منوال واحد فقط رغم التعادل.","En":"Choosing only one mode despite a tie."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"8 ظهر مرة واحدة فقط.","En":"8 occurs only once."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"9 ظهر مرة واحدة فقط.","En":"9 occurs only once."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 و9 لكل منهما تكرار واحد، وليس الأعلى.","En":"8 and 9 each occur once, not the highest frequency."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-mode-unique-after-removal-1$mw$,$mw$mode-unique-after-removal$mw$,$mw$primary-mode$mw$,$mw$grade-4$mw$,4,1,4,20,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":20,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المنوال بعد الحذف","En":"Mode after removal"},"Question":{"Ar":"البيانات هي 3، 3، 3، 5، 5، 5، 7، 7. إذا حُذفت نسخة واحدة من القيمة 3 فقط، فما المنوال الوحيد للبيانات الباقية؟","En":"The data are 3, 3, 3, 5, 5, 5, 7, 7. If one occurrence of 3 is removed, what is the unique mode of the remaining data?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تكرار 3 انخفض إلى اثنين.","En":"The frequency of 3 drops to two."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 تكررت مرتين فقط.","En":"7 occurs only twice."}},{"LatexCode":"(3,5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"انتهى التعادل بعد حذف إحدى الثلاثات.","En":"The tie ends after removing one 3."}}],"Hints":[{"Ar":"احسب التكرارات قبل الحذف.","En":"Find the frequencies before removal."},{"Ar":"أنقص تكرار 3 بمقدار واحد فقط.","En":"Decrease the frequency of 3 by exactly one."}],"Solution":{"Idea":{"Ar":"نحدّث تكرار القيمة المحذوفة ثم نبحث عن الأعلى.","En":"Update the removed value's frequency and find the highest."},"FormulaLatex":"3-1=2","Steps":[{"Ar":"تكرار 3 أصبح اثنين، وتكرار 7 اثنان.","En":"3 now occurs twice, as does 7."},{"Ar":"تكرار 5 بقي ثلاثة وهو الأكبر.","En":"5 still occurs three times, the highest."}],"Substitution":{"Ar":"$3>2$","En":"$3>2$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القائمة الباقية فيها ثلاث خمسات ونسختان من كل قيمة أخرى.","En":"The remaining list has three 5s and two of each other value."},"CommonError":{"Ar":"حذف جميع نسخ 3 أو تجاهل تغير التكرار.","En":"Removing every 3 or ignoring the frequency change."}}}$mw$::jsonb,$mw$نحدّث تكرار القيمة المحذوفة ثم نبحث عن الأعلى.

$3-1=2$

1. تكرار 3 أصبح اثنين، وتكرار 7 اثنان.

2. تكرار 5 بقي ثلاثة وهو الأكبر.

$3>2$

$5$

القائمة الباقية فيها ثلاث خمسات ونسختان من كل قيمة أخرى.

حذف جميع نسخ 3 أو تجاهل تغير التكرار.$mw$,$mw$Update the removed value's frequency and find the highest.

$3-1=2$

1. 3 now occurs twice, as does 7.

2. 5 still occurs three times, the highest.

$3>2$

$5$

The remaining list has three 5s and two of each other value.

Removing every 3 or ignoring the frequency change.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب التكرارات قبل الحذف.","En":"Find the frequencies before removal."},{"Ar":"أنقص تكرار 3 بمقدار واحد فقط.","En":"Decrease the frequency of 3 by exactly one."}],"Solution":{"Idea":{"Ar":"نحدّث تكرار القيمة المحذوفة ثم نبحث عن الأعلى.","En":"Update the removed value's frequency and find the highest."},"FormulaLatex":"3-1=2","Steps":[{"Ar":"تكرار 3 أصبح اثنين، وتكرار 7 اثنان.","En":"3 now occurs twice, as does 7."},{"Ar":"تكرار 5 بقي ثلاثة وهو الأكبر.","En":"5 still occurs three times, the highest."}],"Substitution":{"Ar":"$3>2$","En":"$3>2$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"القائمة الباقية فيها ثلاث خمسات ونسختان من كل قيمة أخرى.","En":"The remaining list has three 5s and two of each other value."},"CommonError":{"Ar":"حذف جميع نسخ 3 أو تجاهل تغير التكرار.","En":"Removing every 3 or ignoring the frequency change."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تكرار 3 انخفض إلى اثنين.","En":"The frequency of 3 drops to two."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"7 تكررت مرتين فقط.","En":"7 occurs only twice."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"انتهى التعادل بعد حذف إحدى الثلاثات.","En":"The tie ends after removing one 3."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-mode-combine-two-samples-1$mw$,$mw$mode-combine-two-samples$mw$,$mw$primary-mode$mw$,$mw$grade-4$mw$,4,1,4,20,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":20,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"منوال البيانات المجمعة","En":"Mode of combined data"},"Question":{"Ar":"سجل فريق A القيم 2، 2، 2، 5، 5، وسجل فريق B القيم 5، 5، 8، 8، 8. عند جمع القائمتين دون حذف أي قيمة، ما المنوال الوحيد؟","En":"Team A recorded 2, 2, 2, 5, 5, and team B recorded 5, 5, 8, 8, 8. When both lists are combined without deleting any value, what is the unique mode?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 تكررت ثلاث مرات فقط.","En":"2 occurs only three times."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 تكررت ثلاث مرات فقط.","En":"8 occurs only three times."}},{"LatexCode":"(2,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"منوالا القائمتين منفردتين لا يلزم أن يكونا منوال المجموع.","En":"The separate modes need not be the combined mode."}}],"Hints":[{"Ar":"عد كل قيمة في القائمتين معاً.","En":"Count each value across both lists."},{"Ar":"انتبه إلى القيمة التي تظهر في الفريقين.","En":"Notice the value appearing in both teams."}],"Solution":{"Idea":{"Ar":"نجمع تكرارات كل قيمة عبر القائمتين قبل تحديد المنوال.","En":"Combine each value's frequencies across the lists before finding the mode."},"FormulaLatex":"2+2=4","Steps":[{"Ar":"2 و8 تكرر كل منهما ثلاث مرات.","En":"2 and 8 each occur three times."},{"Ar":"5 ظهرت مرتين في كل فريق، أي أربع مرات.","En":"5 appears twice in each team, four times overall."}],"Substitution":{"Ar":"$4>3$","En":"$4>3$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربع خمسات وثلاث ثنائيات وثلاث ثمانيات تعطي عشر قيم.","En":"Four 5s, three 2s and three 8s total ten values."},"CommonError":{"Ar":"اختيار منوال أحد الفريقين دون جمع التكرارات.","En":"Choosing one team's mode without combining frequencies."}}}$mw$::jsonb,$mw$نجمع تكرارات كل قيمة عبر القائمتين قبل تحديد المنوال.

$2+2=4$

1. 2 و8 تكرر كل منهما ثلاث مرات.

2. 5 ظهرت مرتين في كل فريق، أي أربع مرات.

$4>3$

$5$

أربع خمسات وثلاث ثنائيات وثلاث ثمانيات تعطي عشر قيم.

اختيار منوال أحد الفريقين دون جمع التكرارات.$mw$,$mw$Combine each value's frequencies across the lists before finding the mode.

$2+2=4$

1. 2 and 8 each occur three times.

2. 5 appears twice in each team, four times overall.

$4>3$

$5$

Four 5s, three 2s and three 8s total ten values.

Choosing one team's mode without combining frequencies.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد كل قيمة في القائمتين معاً.","En":"Count each value across both lists."},{"Ar":"انتبه إلى القيمة التي تظهر في الفريقين.","En":"Notice the value appearing in both teams."}],"Solution":{"Idea":{"Ar":"نجمع تكرارات كل قيمة عبر القائمتين قبل تحديد المنوال.","En":"Combine each value's frequencies across the lists before finding the mode."},"FormulaLatex":"2+2=4","Steps":[{"Ar":"2 و8 تكرر كل منهما ثلاث مرات.","En":"2 and 8 each occur three times."},{"Ar":"5 ظهرت مرتين في كل فريق، أي أربع مرات.","En":"5 appears twice in each team, four times overall."}],"Substitution":{"Ar":"$4>3$","En":"$4>3$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"أربع خمسات وثلاث ثنائيات وثلاث ثمانيات تعطي عشر قيم.","En":"Four 5s, three 2s and three 8s total ten values."},"CommonError":{"Ar":"اختيار منوال أحد الفريقين دون جمع التكرارات.","En":"Choosing one team's mode without combining frequencies."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 تكررت ثلاث مرات فقط.","En":"2 occurs only three times."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 تكررت ثلاث مرات فقط.","En":"8 occurs only three times."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"منوالا القائمتين منفردتين لا يلزم أن يكونا منوال المجموع.","En":"The separate modes need not be the combined mode."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-mode-permutation-of-list-1$mw$,$mw$mode-permutation-of-list$mw$,$mw$primary-mode$mw$,$mw$grade-4$mw$,4,1,4,20,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":20,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب البيانات والمنوال","En":"Order and mode"},"Question":{"Ar":"البيانات 8، 3، 8، 5، 3، 8. رتّب طالب القيم تصاعدياً دون إضافة أو حذف. أي عبارة تصف المنوال بعد الترتيب؟ A: يتغير إلى 3؛ B: يتغير إلى 5؛ C: يبقى 8؛ D: لا يعود له منوال وحيد.","En":"The data are 8, 3, 8, 5, 3, 8. A pupil sorts them in increasing order without adding or removing anything. What happens to the mode? A: changes to 3; B: changes to 5; C: remains 8; D: no longer has a unique mode."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 تكررت مرتين فقط حتى بعد ترتيبها.","En":"3 still occurs only twice after sorting."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 تظهر مرة واحدة فقط.","En":"5 occurs only once."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 تبقى صاحبة أكبر تكرار بمفردها.","En":"8 still has the unique highest frequency."}}],"Hints":[{"Ar":"هل يغير الترتيب عدد مرات ظهور أي قيمة؟","En":"Does sorting change the occurrence count of any value?"},{"Ar":"عد مرات ظهور 8 قبل الترتيب وبعده.","En":"Count the 8s before and after sorting."}],"Solution":{"Idea":{"Ar":"المنوال يعتمد على التكرار لا على موضع القيم.","En":"Mode depends on frequency, not the positions of the values."},"FormulaLatex":"f(8)=3","Steps":[{"Ar":"تصبح القائمة 3، 3، 5، 8، 8، 8.","En":"The sorted list is 3, 3, 5, 8, 8, 8."},{"Ar":"تكرار 8 بقي ثلاثة، وهو الأكبر.","En":"8 still occurs three times, the highest."}],"Substitution":{"Ar":"$3>2$","En":"$3>2$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"التكرارات لم تتغير لأي قيمة عند الترتيب.","En":"No value's frequency changed during sorting."},"CommonError":{"Ar":"الخلط بين المنوال والقيمة الأولى أو الوسطى.","En":"Confusing the mode with the first or middle value."}}}$mw$::jsonb,$mw$المنوال يعتمد على التكرار لا على موضع القيم.

$f(8)=3$

1. تصبح القائمة 3، 3، 5، 8، 8، 8.

2. تكرار 8 بقي ثلاثة، وهو الأكبر.

$3>2$

$C$

التكرارات لم تتغير لأي قيمة عند الترتيب.

الخلط بين المنوال والقيمة الأولى أو الوسطى.$mw$,$mw$Mode depends on frequency, not the positions of the values.

$f(8)=3$

1. The sorted list is 3, 3, 5, 8, 8, 8.

2. 8 still occurs three times, the highest.

$3>2$

$C$

No value's frequency changed during sorting.

Confusing the mode with the first or middle value.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل يغير الترتيب عدد مرات ظهور أي قيمة؟","En":"Does sorting change the occurrence count of any value?"},{"Ar":"عد مرات ظهور 8 قبل الترتيب وبعده.","En":"Count the 8s before and after sorting."}],"Solution":{"Idea":{"Ar":"المنوال يعتمد على التكرار لا على موضع القيم.","En":"Mode depends on frequency, not the positions of the values."},"FormulaLatex":"f(8)=3","Steps":[{"Ar":"تصبح القائمة 3، 3، 5، 8، 8، 8.","En":"The sorted list is 3, 3, 5, 8, 8, 8."},{"Ar":"تكرار 8 بقي ثلاثة، وهو الأكبر.","En":"8 still occurs three times, the highest."}],"Substitution":{"Ar":"$3>2$","En":"$3>2$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"التكرارات لم تتغير لأي قيمة عند الترتيب.","En":"No value's frequency changed during sorting."},"CommonError":{"Ar":"الخلط بين المنوال والقيمة الأولى أو الوسطى.","En":"Confusing the mode with the first or middle value."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 تكررت مرتين فقط حتى بعد ترتيبها.","En":"3 still occurs only twice after sorting."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"5 تظهر مرة واحدة فقط.","En":"5 occurs only once."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 تبقى صاحبة أكبر تكرار بمفردها.","En":"8 still has the unique highest frequency."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-mode-frequency-transfer-correction-1$mw$,$mw$mode-frequency-transfer-correction$mw$,$mw$primary-mode$mw$,$mw$grade-4$mw$,4,1,4,20,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":20,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح قيمة والمنوال","En":"Correcting a value"},"Question":{"Ar":"في سجل الدرجات 4، 4، 4، 6، 6، 9، اكتشف المعلم أن إحدى قيم 4 كانت في الحقيقة 6. بعد استبدال تلك القيمة فقط، ما المنوال الوحيد؟","En":"In the scores 4, 4, 4, 6, 6, 9, the teacher finds that one recorded 4 should actually be 6. After replacing only that value, what is the unique mode?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"انخفض تكرار 4 إلى مرتين.","En":"4 falls to two occurrences."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 لم تتغير وتكررت مرة واحدة.","En":"9 is unchanged and occurs once."}},{"LatexCode":"(4,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 أصبحت ثلاث مرات و4 مرتين فلا تعادل.","En":"6 now occurs three times and 4 twice, so there is no tie."}}],"Hints":[{"Ar":"التصحيح ينقص تكرار 4 ويزيد تكرار 6.","En":"The correction decreases the frequency of 4 and increases that of 6."},{"Ar":"احسب التكرارين بعد النقل.","En":"Calculate both frequencies after the transfer."}],"Solution":{"Idea":{"Ar":"استبدال قيمة يحدّث تكرارين في آن واحد.","En":"Replacing a value changes two frequencies at once."},"FormulaLatex":"3-1=2,\\quad2+1=3","Steps":[{"Ar":"يصبح تكرار 4 اثنين.","En":"The frequency of 4 becomes two."},{"Ar":"يصبح تكرار 6 ثلاثة، وهو الأكبر.","En":"The frequency of 6 becomes three, the highest."}],"Substitution":{"Ar":"$3>2$","En":"$3>2$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عدد الدرجات بقي ستاً: اثنتان من 4 وثلاث من 6 وواحدة من 9.","En":"The total stays six: two 4s, three 6s and one 9."},"CommonError":{"Ar":"زيادة تكرار 6 دون إنقاص تكرار 4.","En":"Increasing the count of 6 without decreasing the count of 4."}}}$mw$::jsonb,$mw$استبدال قيمة يحدّث تكرارين في آن واحد.

$3-1=2,\quad2+1=3$

1. يصبح تكرار 4 اثنين.

2. يصبح تكرار 6 ثلاثة، وهو الأكبر.

$3>2$

$6$

عدد الدرجات بقي ستاً: اثنتان من 4 وثلاث من 6 وواحدة من 9.

زيادة تكرار 6 دون إنقاص تكرار 4.$mw$,$mw$Replacing a value changes two frequencies at once.

$3-1=2,\quad2+1=3$

1. The frequency of 4 becomes two.

2. The frequency of 6 becomes three, the highest.

$3>2$

$6$

The total stays six: two 4s, three 6s and one 9.

Increasing the count of 6 without decreasing the count of 4.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"التصحيح ينقص تكرار 4 ويزيد تكرار 6.","En":"The correction decreases the frequency of 4 and increases that of 6."},{"Ar":"احسب التكرارين بعد النقل.","En":"Calculate both frequencies after the transfer."}],"Solution":{"Idea":{"Ar":"استبدال قيمة يحدّث تكرارين في آن واحد.","En":"Replacing a value changes two frequencies at once."},"FormulaLatex":"3-1=2,\\quad2+1=3","Steps":[{"Ar":"يصبح تكرار 4 اثنين.","En":"The frequency of 4 becomes two."},{"Ar":"يصبح تكرار 6 ثلاثة، وهو الأكبر.","En":"The frequency of 6 becomes three, the highest."}],"Substitution":{"Ar":"$3>2$","En":"$3>2$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عدد الدرجات بقي ستاً: اثنتان من 4 وثلاث من 6 وواحدة من 9.","En":"The total stays six: two 4s, three 6s and one 9."},"CommonError":{"Ar":"زيادة تكرار 6 دون إنقاص تكرار 4.","En":"Increasing the count of 6 without decreasing the count of 4."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"انخفض تكرار 4 إلى مرتين.","En":"4 falls to two occurrences."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"9 لم تتغير وتكررت مرة واحدة.","En":"9 is unchanged and occurs once."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"6 أصبحت ثلاث مرات و4 مرتين فلا تعادل.","En":"6 now occurs three times and 4 twice, so there is no tie."},"Order":4}]}$mw$),
($mw$growth-v83-grade-4-metric-combined-length-mixed-units-1$mw$,$mw$metric-combined-length-mixed-units$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جمع طولين بوحدتين","En":"Adding mixed-unit lengths"},"Question":{"Ar":"طول شريط 3 m و8 cm، وطول شريط آخر 92 cm. إذا وضعناهما طرفاً إلى طرف، فكم متراً يساوي طولهما الكلي؟","En":"One strip is 3 m 8 cm long, and another is 92 cm long. Placed end to end, what is their total length in metres?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل مجموع السنتيمترات.","En":"This ignores the combined centimetres."}},{"LatexCode":"3.1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"100 cm يساوي متراً كاملاً، لا عُشر متر.","En":"100 cm is one full metre, not a tenth."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يعامل السنتيمترات المئة كعشرة أمتار.","En":"This treats one hundred centimetres as ten metres."}}],"Hints":[{"Ar":"اجمع 8 و92 بالسنتيمترات.","En":"Add 8 and 92 in centimetres."},{"Ar":"كل 100 cm تساوي 1 m.","En":"Every 100 cm equals 1 m."}],"Solution":{"Idea":{"Ar":"نجمع الوحدات الصغيرة ثم نعيد تجميع مئة سنتيمتر في متر.","En":"Combine the smaller units, then regroup one hundred centimetres into a metre."},"FormulaLatex":"100\\,\\mathrm{cm}=1\\,\\mathrm{m}","Steps":[{"Ar":"مجموع السنتيمترات 100.","En":"The centimetre total is 100."},{"Ar":"نضيف متراً واحداً إلى الأمتار الثلاثة.","En":"Add one metre to the three metres."}],"Substitution":{"Ar":"$3+1=4$","En":"$3+1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"308 cm مع 92 cm تساوي 400 cm أي 4 m.","En":"308 cm plus 92 cm equals 400 cm, or 4 m."},"CommonError":{"Ar":"إضافة أعداد بوحدات مختلفة دون تحويل.","En":"Adding quantities in different units without converting."}}}$mw$::jsonb,$mw$نجمع الوحدات الصغيرة ثم نعيد تجميع مئة سنتيمتر في متر.

$100\,\mathrm{cm}=1\,\mathrm{m}$

1. مجموع السنتيمترات 100.

2. نضيف متراً واحداً إلى الأمتار الثلاثة.

$3+1=4$

$4$

308 cm مع 92 cm تساوي 400 cm أي 4 m.

إضافة أعداد بوحدات مختلفة دون تحويل.$mw$,$mw$Combine the smaller units, then regroup one hundred centimetres into a metre.

$100\,\mathrm{cm}=1\,\mathrm{m}$

1. The centimetre total is 100.

2. Add one metre to the three metres.

$3+1=4$

$4$

308 cm plus 92 cm equals 400 cm, or 4 m.

Adding quantities in different units without converting.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع 8 و92 بالسنتيمترات.","En":"Add 8 and 92 in centimetres."},{"Ar":"كل 100 cm تساوي 1 m.","En":"Every 100 cm equals 1 m."}],"Solution":{"Idea":{"Ar":"نجمع الوحدات الصغيرة ثم نعيد تجميع مئة سنتيمتر في متر.","En":"Combine the smaller units, then regroup one hundred centimetres into a metre."},"FormulaLatex":"100\\,\\mathrm{cm}=1\\,\\mathrm{m}","Steps":[{"Ar":"مجموع السنتيمترات 100.","En":"The centimetre total is 100."},{"Ar":"نضيف متراً واحداً إلى الأمتار الثلاثة.","En":"Add one metre to the three metres."}],"Substitution":{"Ar":"$3+1=4$","En":"$3+1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"308 cm مع 92 cm تساوي 400 cm أي 4 m.","En":"308 cm plus 92 cm equals 400 cm, or 4 m."},"CommonError":{"Ar":"إضافة أعداد بوحدات مختلفة دون تحويل.","En":"Adding quantities in different units without converting."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يهمل مجموع السنتيمترات.","En":"This ignores the combined centimetres."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"100 cm يساوي متراً كاملاً، لا عُشر متر.","En":"100 cm is one full metre, not a tenth."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يعامل السنتيمترات المئة كعشرة أمتار.","En":"This treats one hundred centimetres as ten metres."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v83 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
