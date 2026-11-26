-- One-time owner-authorized v47 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v47-grade-1-clock-order-daily-events-1$mw$,$mw$clock-order-daily-events$mw$,$mw$time$mw$,$mw$grade-1$mw$,1,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ترتيب أحداث الصباح","En":"Ordering morning events"},"Question":{"Ar":"بدأ الفطور عند 7:00 صباحاً، والدرس عند 9:00 صباحاً، واللعب عند 8:00 صباحاً. أي حدث بدأ أخيراً؟ A: الفطور؛ B: الدرس؛ C: اللعب؛ D: بدأت معاً.","En":"Breakfast began at 7:00 a.m., class at 9:00 a.m., and play at 8:00 a.m. Which began last? A: breakfast; B: class; C: play; D: all together."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفطور بدأ أولاً.","En":"Breakfast began first."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اللعب بدأ قبل الدرس.","En":"Play began before class."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأوقات مختلفة.","En":"The times differ."}}],"Hints":[{"Ar":"كل الأوقات صباحية.","En":"All times are in the morning."},{"Ar":"ابحث عن أكبر رقم للساعة.","En":"Find the greatest hour number."}],"Solution":{"Idea":{"Ar":"نرتب الساعات في الصباح من الأصغر إلى الأكبر.","En":"Order the morning hours from smallest to largest."},"FormulaLatex":"7<8<9","Steps":[{"Ar":"الفطور أولاً ثم اللعب ثم الدرس.","En":"Breakfast comes first, then play, then class."}],"Substitution":{"Ar":"الفطور أولاً ثم اللعب ثم الدرس.","En":"Breakfast comes first, then play, then class."},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الساعة 9 بعد الساعة 8 وبعد الساعة 7.","En":"Nine comes after eight and seven."},"CommonError":{"Ar":"الفطور بدأ أولاً.","En":"Breakfast began first."}}}$mw$::jsonb,$mw$نرتب الساعات في الصباح من الأصغر إلى الأكبر.

$7<8<9$

1. الفطور أولاً ثم اللعب ثم الدرس.

الفطور أولاً ثم اللعب ثم الدرس.

$B$

الساعة 9 بعد الساعة 8 وبعد الساعة 7.

الفطور بدأ أولاً.$mw$,$mw$Order the morning hours from smallest to largest.

$7<8<9$

1. Breakfast comes first, then play, then class.

Breakfast comes first, then play, then class.

$B$

Nine comes after eight and seven.

Breakfast began first.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كل الأوقات صباحية.","En":"All times are in the morning."},{"Ar":"ابحث عن أكبر رقم للساعة.","En":"Find the greatest hour number."}],"Solution":{"Idea":{"Ar":"نرتب الساعات في الصباح من الأصغر إلى الأكبر.","En":"Order the morning hours from smallest to largest."},"FormulaLatex":"7<8<9","Steps":[{"Ar":"الفطور أولاً ثم اللعب ثم الدرس.","En":"Breakfast comes first, then play, then class."}],"Substitution":{"Ar":"الفطور أولاً ثم اللعب ثم الدرس.","En":"Breakfast comes first, then play, then class."},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الساعة 9 بعد الساعة 8 وبعد الساعة 7.","En":"Nine comes after eight and seven."},"CommonError":{"Ar":"الفطور بدأ أولاً.","En":"Breakfast began first."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الفطور بدأ أولاً.","En":"Breakfast began first."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اللعب بدأ قبل الدرس.","En":"Play began before class."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الأوقات مختلفة.","En":"The times differ."},"Order":4}]}$mw$),
($mw$growth-v47-grade-1-shape-identify-curved-boundary-1$mw$,$mw$shape-identify-curved-boundary$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تمييز الحدود المنحنية","En":"Recognising curved boundaries"},"Question":{"Ar":"أي شكل من الآتي ليس له أضلاع مستقيمة؟ A: مربع؛ B: مثلث؛ C: دائرة؛ D: مستطيل.","En":"Which shape has no straight sides? A: square; B: triangle; C: circle; D: rectangle."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المربع له أربعة أضلاع.","En":"A square has four sides."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المثلث له ثلاثة أضلاع.","En":"A triangle has three sides."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المستطيل له أربعة أضلاع.","En":"A rectangle has four sides."}}],"Hints":[{"Ar":"تخيل حدود كل شكل.","En":"Imagine each shape's boundary."},{"Ar":"ابحث عن شكل حدوده منحنية كلها.","En":"Find the entirely curved boundary."}],"Solution":{"Idea":{"Ar":"حد الدائرة منحني بالكامل.","En":"The boundary of a circle is entirely curved."},"FormulaLatex":"4>0,\\quad3>0","Steps":[{"Ar":"للمربع والمستطيل أربعة أضلاع مستقيمة، وللمثلث ثلاثة.","En":"Squares and rectangles have four straight sides, and triangles have three."},{"Ar":"الدائرة ليس لها ضلع مستقيم.","En":"A circle has no straight side."}],"Substitution":{"Ar":"الدائرة ليس لها ضلع مستقيم.","En":"A circle has no straight side."},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عدد الأضلاع المستقيمة للدائرة صفر.","En":"The number of straight sides of a circle is zero."},"CommonError":{"Ar":"المربع له أربعة أضلاع.","En":"A square has four sides."}}}$mw$::jsonb,$mw$حد الدائرة منحني بالكامل.

$4>0,\quad3>0$

1. للمربع والمستطيل أربعة أضلاع مستقيمة، وللمثلث ثلاثة.

2. الدائرة ليس لها ضلع مستقيم.

الدائرة ليس لها ضلع مستقيم.

$C$

عدد الأضلاع المستقيمة للدائرة صفر.

المربع له أربعة أضلاع.$mw$,$mw$The boundary of a circle is entirely curved.

$4>0,\quad3>0$

1. Squares and rectangles have four straight sides, and triangles have three.

2. A circle has no straight side.

A circle has no straight side.

$C$

The number of straight sides of a circle is zero.

A square has four sides.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"تخيل حدود كل شكل.","En":"Imagine each shape's boundary."},{"Ar":"ابحث عن شكل حدوده منحنية كلها.","En":"Find the entirely curved boundary."}],"Solution":{"Idea":{"Ar":"حد الدائرة منحني بالكامل.","En":"The boundary of a circle is entirely curved."},"FormulaLatex":"4>0,\\quad3>0","Steps":[{"Ar":"للمربع والمستطيل أربعة أضلاع مستقيمة، وللمثلث ثلاثة.","En":"Squares and rectangles have four straight sides, and triangles have three."},{"Ar":"الدائرة ليس لها ضلع مستقيم.","En":"A circle has no straight side."}],"Substitution":{"Ar":"الدائرة ليس لها ضلع مستقيم.","En":"A circle has no straight side."},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عدد الأضلاع المستقيمة للدائرة صفر.","En":"The number of straight sides of a circle is zero."},"CommonError":{"Ar":"المربع له أربعة أضلاع.","En":"A square has four sides."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المربع له أربعة أضلاع.","En":"A square has four sides."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المثلث له ثلاثة أضلاع.","En":"A triangle has three sides."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المستطيل له أربعة أضلاع.","En":"A rectangle has four sides."},"Order":4}]}$mw$),
($mw$growth-v47-grade-2-counting-odd-even-successive-pairs-1$mw$,$mw$counting-odd-even-successive-pairs$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"نمط أعداد زوجية وفردية","En":"Odd and even counting pattern"},"Question":{"Ar":"في العد التصاعدي من 21 إلى 29، شاملين الطرفين، كم عدداً فردياً يزيد على 24؟","En":"Counting upward from 21 to 29 inclusive, how many odd numbers are greater than 24?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل عدداً فردياً.","En":"Misses one odd number."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضم عدداً خارج الشرط.","En":"Includes a number outside the condition."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الفرديات في المجال الكامل.","En":"This counts the odds in the full interval."}}],"Hints":[{"Ar":"ابدأ بعد 24.","En":"Start after 24."},{"Ar":"عد كل عدد فردي حتى 29.","En":"Count each odd number up to 29."}],"Solution":{"Idea":{"Ar":"نحدد الأعداد الفردية بعد 24 ضمن المجال.","En":"List odd numbers after 24 within the interval."},"FormulaLatex":"25,27,29","Steps":[{"Ar":"الأعداد المطلوبة هي 25 و27 و29.","En":"The required numbers are 25, 27 and 29."},{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"العدد 23 أصغر من 24 والعدد 31 خارج المجال.","En":"23 is below 24 and 31 is outside the interval."},"CommonError":{"Ar":"يهمل عدداً فردياً.","En":"Misses one odd number."}}}$mw$::jsonb,$mw$نحدد الأعداد الفردية بعد 24 ضمن المجال.

$25,27,29$

1. الأعداد المطلوبة هي 25 و27 و29.

2. $1+1+1=3$

$1+1+1=3$

$3$

العدد 23 أصغر من 24 والعدد 31 خارج المجال.

يهمل عدداً فردياً.$mw$,$mw$List odd numbers after 24 within the interval.

$25,27,29$

1. The required numbers are 25, 27 and 29.

2. $1+1+1=3$

$1+1+1=3$

$3$

23 is below 24 and 31 is outside the interval.

Misses one odd number.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابدأ بعد 24.","En":"Start after 24."},{"Ar":"عد كل عدد فردي حتى 29.","En":"Count each odd number up to 29."}],"Solution":{"Idea":{"Ar":"نحدد الأعداد الفردية بعد 24 ضمن المجال.","En":"List odd numbers after 24 within the interval."},"FormulaLatex":"25,27,29","Steps":[{"Ar":"الأعداد المطلوبة هي 25 و27 و29.","En":"The required numbers are 25, 27 and 29."},{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"العدد 23 أصغر من 24 والعدد 31 خارج المجال.","En":"23 is below 24 and 31 is outside the interval."},"CommonError":{"Ar":"يهمل عدداً فردياً.","En":"Misses one odd number."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يهمل عدداً فردياً.","En":"Misses one odd number."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يضم عدداً خارج الشرط.","En":"Includes a number outside the condition."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الفرديات في المجال الكامل.","En":"This counts the odds in the full interval."},"Order":4}]}$mw$),
($mw$growth-v47-grade-2-solid-cone-cylinder-flat-face-comparison-1$mw$,$mw$solid-cone-cylinder-flat-face-comparison$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مقارنة أسطح المجسمات","En":"Comparing solid surfaces"},"Question":{"Ar":"لدينا أسطوانة مغلقة ومخروط ذو قاعدة مستوية. كم وجهاً دائرياً مستوياً لهما معاً؟","En":"A closed cylinder and a cone with a flat base are given. How many flat circular faces do they have altogether?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد قاعدة المخروط فقط.","En":"Counts only the cone base."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد قاعدتي الأسطوانة فقط.","En":"Counts only the cylinder bases."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد سطحاً إضافياً ليس مستوياً.","En":"Counts an extra surface that is not flat."}}],"Hints":[{"Ar":"انظر إلى أعلى الأسطوانة وأسفلها.","En":"Consider the top and bottom of the cylinder."},{"Ar":"أضف قاعدة المخروط.","En":"Add the cone's base."}],"Solution":{"Idea":{"Ar":"للأسطوانة قاعدتان دائريتان وللمخروط قاعدة دائرية واحدة.","En":"A cylinder has two circular bases and a cone has one."},"FormulaLatex":"2+1=3","Steps":[{"Ar":"نعد القواعد المستوية فقط ولا نعد الأسطح المنحنية.","En":"Count only the flat bases, not curved surfaces."},{"Ar":"$2+1=3$","En":"$2+1=3$"}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثلاث قواعد دائرية موزعة بين المجسمين.","En":"Three circular bases are shared across the two solids."},"CommonError":{"Ar":"يعد قاعدة المخروط فقط.","En":"Counts only the cone base."}}}$mw$::jsonb,$mw$للأسطوانة قاعدتان دائريتان وللمخروط قاعدة دائرية واحدة.

$2+1=3$

1. نعد القواعد المستوية فقط ولا نعد الأسطح المنحنية.

2. $2+1=3$

$2+1=3$

$3$

ثلاث قواعد دائرية موزعة بين المجسمين.

يعد قاعدة المخروط فقط.$mw$,$mw$A cylinder has two circular bases and a cone has one.

$2+1=3$

1. Count only the flat bases, not curved surfaces.

2. $2+1=3$

$2+1=3$

$3$

Three circular bases are shared across the two solids.

Counts only the cone base.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"انظر إلى أعلى الأسطوانة وأسفلها.","En":"Consider the top and bottom of the cylinder."},{"Ar":"أضف قاعدة المخروط.","En":"Add the cone's base."}],"Solution":{"Idea":{"Ar":"للأسطوانة قاعدتان دائريتان وللمخروط قاعدة دائرية واحدة.","En":"A cylinder has two circular bases and a cone has one."},"FormulaLatex":"2+1=3","Steps":[{"Ar":"نعد القواعد المستوية فقط ولا نعد الأسطح المنحنية.","En":"Count only the flat bases, not curved surfaces."},{"Ar":"$2+1=3$","En":"$2+1=3$"}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثلاث قواعد دائرية موزعة بين المجسمين.","En":"Three circular bases are shared across the two solids."},"CommonError":{"Ar":"يعد قاعدة المخروط فقط.","En":"Counts only the cone base."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعد قاعدة المخروط فقط.","En":"Counts only the cone base."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعد قاعدتي الأسطوانة فقط.","En":"Counts only the cylinder bases."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعد سطحاً إضافياً ليس مستوياً.","En":"Counts an extra surface that is not flat."},"Order":4}]}$mw$),
($mw$growth-v47-grade-3-place-value-zero-placeholder-1$mw$,$mw$place-value-zero-placeholder$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"الصفر في منزلة العشرات","En":"Zero in the tens place"},"Question":{"Ar":"يتكون عدد من 8 مئات و0 عشرات و4 آحاد. ما العدد الذي يزيد عليه بمقدار عشرة واحدة؟","En":"A number has 8 hundreds, 0 tens and 4 ones. What number is exactly one ten greater?"},"Options":[{"LatexCode":"805","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يزيد بمقدار واحد فقط.","En":"Increases by one only."}},{"LatexCode":"814","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"840","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يغير منزلة الآحاد أيضاً.","En":"Also changes the ones place."}},{"LatexCode":"904","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يزيد بمقدار مئة.","En":"Increases by one hundred."}}],"Hints":[{"Ar":"اكتب العدد الأصلي مع الصفر في العشرات.","En":"Write the original number with zero tens."},{"Ar":"أضف 10 لا 1.","En":"Add ten, not one."}],"Solution":{"Idea":{"Ar":"نضيف عشرة إلى العدد مع الحفاظ على المئات والآحاد.","En":"Add ten while preserving hundreds and ones."},"FormulaLatex":"800+4+10=814","Steps":[{"Ar":"$800+0+4=804$","En":"$800+0+4=804$"},{"Ar":"$804+10=814$","En":"$804+10=814$"}],"Substitution":{"Ar":"$804+10=814$","En":"$804+10=814$"},"Result":{"Ar":"$814$","En":"$814$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$814-804=10$","En":"$814-804=10$"},"CommonError":{"Ar":"يزيد بمقدار واحد فقط.","En":"Increases by one only."}}}$mw$::jsonb,$mw$نضيف عشرة إلى العدد مع الحفاظ على المئات والآحاد.

$800+4+10=814$

1. $800+0+4=804$

2. $804+10=814$

$804+10=814$

$814$

$814-804=10$

يزيد بمقدار واحد فقط.$mw$,$mw$Add ten while preserving hundreds and ones.

$800+4+10=814$

1. $800+0+4=804$

2. $804+10=814$

$804+10=814$

$814$

$814-804=10$

Increases by one only.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اكتب العدد الأصلي مع الصفر في العشرات.","En":"Write the original number with zero tens."},{"Ar":"أضف 10 لا 1.","En":"Add ten, not one."}],"Solution":{"Idea":{"Ar":"نضيف عشرة إلى العدد مع الحفاظ على المئات والآحاد.","En":"Add ten while preserving hundreds and ones."},"FormulaLatex":"800+4+10=814","Steps":[{"Ar":"$800+0+4=804$","En":"$800+0+4=804$"},{"Ar":"$804+10=814$","En":"$804+10=814$"}],"Substitution":{"Ar":"$804+10=814$","En":"$804+10=814$"},"Result":{"Ar":"$814$","En":"$814$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$814-804=10$","En":"$814-804=10$"},"CommonError":{"Ar":"يزيد بمقدار واحد فقط.","En":"Increases by one only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يزيد بمقدار واحد فقط.","En":"Increases by one only."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يغير منزلة الآحاد أيضاً.","En":"Also changes the ones place."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يزيد بمقدار مئة.","En":"Increases by one hundred."},"Order":4}]}$mw$),
($mw$growth-v47-grade-4-capacity-compare-full-containers-mixed-unit-1$mw$,$mw$capacity-compare-full-containers-mixed-unit$mw$,$mw$capacity$mw$,$mw$grade-4$mw$,4,1,82,320,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":320,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة سعات أوعية","En":"Comparing container capacities"},"Question":{"Ar":"لدينا ثلاثة أوعية سعة كل منها 400 مل، ووعاء سعته لتر واحد. بكم مل تزيد السعة الكلية للأوعية الثلاثة على سعة الوعاء الواحد؟","En":"Three containers each hold 400 mL, and one container holds 1 litre. How many millilitres greater is the combined capacity of the three than that of the single container?"},"Options":[{"LatexCode":"100","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفرق ليس 100.","En":"The difference is not one hundred."}},{"LatexCode":"200","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"400","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حجم وعاء صغير واحد.","En":"This is one small container's capacity."}},{"LatexCode":"1200","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع قبل الطرح.","En":"This is the total before subtraction."}}],"Hints":[{"Ar":"اللتر يساوي 1000 مل.","En":"One litre is 1000 mL."},{"Ar":"اجمع سعات الأوعية الثلاثة.","En":"Combine the three capacities."}],"Solution":{"Idea":{"Ar":"نحسب السعة الإجمالية ونطرح السعة الأخرى بعد توحيد الوحدة.","En":"Find the combined capacity and subtract the other capacity in the same unit."},"FormulaLatex":"3\\cdot400-1000","Steps":[{"Ar":"$3\\cdot400=1200$","En":"$3\\cdot400=1200$"},{"Ar":"$1200-1000=200$","En":"$1200-1000=200$"}],"Substitution":{"Ar":"$1200-1000=200$","En":"$1200-1000=200$"},"Result":{"Ar":"$200$","En":"$200$"},"Unit":{"Ar":"مل","En":"mL"},"Verification":{"Ar":"$1000+200=1200$","En":"$1000+200=1200$"},"CommonError":{"Ar":"الفرق ليس 100.","En":"The difference is not one hundred."}}}$mw$::jsonb,$mw$نحسب السعة الإجمالية ونطرح السعة الأخرى بعد توحيد الوحدة.

$3\cdot400-1000$

1. $3\cdot400=1200$

2. $1200-1000=200$

$1200-1000=200$

$200$ مل

$1000+200=1200$

الفرق ليس 100.$mw$,$mw$Find the combined capacity and subtract the other capacity in the same unit.

$3\cdot400-1000$

1. $3\cdot400=1200$

2. $1200-1000=200$

$1200-1000=200$

$200$ mL

$1000+200=1200$

The difference is not one hundred.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اللتر يساوي 1000 مل.","En":"One litre is 1000 mL."},{"Ar":"اجمع سعات الأوعية الثلاثة.","En":"Combine the three capacities."}],"Solution":{"Idea":{"Ar":"نحسب السعة الإجمالية ونطرح السعة الأخرى بعد توحيد الوحدة.","En":"Find the combined capacity and subtract the other capacity in the same unit."},"FormulaLatex":"3\\cdot400-1000","Steps":[{"Ar":"$3\\cdot400=1200$","En":"$3\\cdot400=1200$"},{"Ar":"$1200-1000=200$","En":"$1200-1000=200$"}],"Substitution":{"Ar":"$1200-1000=200$","En":"$1200-1000=200$"},"Result":{"Ar":"$200$","En":"$200$"},"Unit":{"Ar":"مل","En":"mL"},"Verification":{"Ar":"$1000+200=1200$","En":"$1000+200=1200$"},"CommonError":{"Ar":"الفرق ليس 100.","En":"The difference is not one hundred."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الفرق ليس 100.","En":"The difference is not one hundred."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا حجم وعاء صغير واحد.","En":"This is one small container's capacity."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع قبل الطرح.","En":"This is the total before subtraction."},"Order":4}]}$mw$),
($mw$growth-v47-grade-6-triangle-area-fixed-area-base-height-pair-1$mw$,$mw$triangle-area-fixed-area-base-height-pair$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قاعدة وارتفاع لمساحة ثابتة","En":"Base and height for a fixed area"},"Question":{"Ar":"مساحة مثلث 30 سم². أي زوج مرتب يمثل قاعدة وارتفاعاً عمودياً يمكن أن يحققا هذه المساحة، بالسنتيمتر؟","En":"A triangle has area 30 cm². Which ordered pair of base and perpendicular height, in centimetres, can give that area?"},"Options":[{"LatexCode":"(5,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مساحته 15.","En":"Its area is fifteen."}},{"LatexCode":"(10,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مساحته 15.","En":"Its area is fifteen."}},{"LatexCode":"(12,5)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(8,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مساحته 32.","En":"Its area is thirty-two."}}],"Hints":[{"Ar":"ضاعف المساحة المطلوبة.","En":"Double the desired area."},{"Ar":"ابحث عن زوج حاصل ضربه 60.","En":"Find the pair whose product is sixty."}],"Solution":{"Idea":{"Ar":"حاصل ضرب القاعدة والارتفاع يساوي ضعف المساحة.","En":"Base times height equals twice the area."},"FormulaLatex":"bh=2A=60","Steps":[{"Ar":"$2\\cdot30=60$","En":"$2\\cdot30=60$"},{"Ar":"$12\\cdot5=60$","En":"$12\\cdot5=60$"}],"Substitution":{"Ar":"$12\\cdot5=60$","En":"$12\\cdot5=60$"},"Result":{"Ar":"$(12,5)$","En":"$(12,5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot5/2=30$","En":"$12\\cdot5/2=30$"},"CommonError":{"Ar":"مساحته 15.","En":"Its area is fifteen."}}}$mw$::jsonb,$mw$حاصل ضرب القاعدة والارتفاع يساوي ضعف المساحة.

$bh=2A=60$

1. $2\cdot30=60$

2. $12\cdot5=60$

$12\cdot5=60$

$(12,5)$

$12\cdot5/2=30$

مساحته 15.$mw$,$mw$Base times height equals twice the area.

$bh=2A=60$

1. $2\cdot30=60$

2. $12\cdot5=60$

$12\cdot5=60$

$(12,5)$

$12\cdot5/2=30$

Its area is fifteen.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضاعف المساحة المطلوبة.","En":"Double the desired area."},{"Ar":"ابحث عن زوج حاصل ضربه 60.","En":"Find the pair whose product is sixty."}],"Solution":{"Idea":{"Ar":"حاصل ضرب القاعدة والارتفاع يساوي ضعف المساحة.","En":"Base times height equals twice the area."},"FormulaLatex":"bh=2A=60","Steps":[{"Ar":"$2\\cdot30=60$","En":"$2\\cdot30=60$"},{"Ar":"$12\\cdot5=60$","En":"$12\\cdot5=60$"}],"Substitution":{"Ar":"$12\\cdot5=60$","En":"$12\\cdot5=60$"},"Result":{"Ar":"$(12,5)$","En":"$(12,5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot5/2=30$","En":"$12\\cdot5/2=30$"},"CommonError":{"Ar":"مساحته 15.","En":"Its area is fifteen."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مساحته 15.","En":"Its area is fifteen."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مساحته 15.","En":"Its area is fifteen."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مساحته 32.","En":"Its area is thirty-two."},"Order":4}]}$mw$),
($mw$growth-v47-grade-6-median-missing-value-bound-middle-1$mw$,$mw$median-missing-value-bound-middle$mw$,$mw$primary-median$mw$,$mw$grade-6$mw$,6,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج قيمة من الوسيط","En":"Inferring an observation from a median"},"Question":{"Ar":"أربع قيم مرتبة تصاعدياً: 2، 4، x، 12. وسيطها 6. ما قيمة x؟","En":"Four values in increasing order are 2, 4, x, 12. Their median is 6. What is x?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي وسيطاً 5.","En":"Gives median five."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي وسيطاً 7.","En":"Gives median seven."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي وسيطاً 8.","En":"Gives median eight."}}],"Hints":[{"Ar":"حدد القيمتين الوسطيتين.","En":"Identify the two middle observations."},{"Ar":"ضاعف الوسيط ثم اطرح 4.","En":"Double the median and subtract four."}],"Solution":{"Idea":{"Ar":"الوسيط لقائمة زوجية هو متوسط القيمتين الوسطيتين.","En":"The median of an even list is the average of the two middle values."},"FormulaLatex":"(4+x)/2=6","Steps":[{"Ar":"$4+x=12$","En":"$4+x=12$"},{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=8$","En":"$x=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(4+8)/2=6$","En":"$(4+8)/2=6$"},"CommonError":{"Ar":"يعطي وسيطاً 5.","En":"Gives median five."}}}$mw$::jsonb,$mw$الوسيط لقائمة زوجية هو متوسط القيمتين الوسطيتين.

$(4+x)/2=6$

1. $4+x=12$

2. $x=8$

$x=8$

$8$

$(4+8)/2=6$

يعطي وسيطاً 5.$mw$,$mw$The median of an even list is the average of the two middle values.

$(4+x)/2=6$

1. $4+x=12$

2. $x=8$

$x=8$

$8$

$(4+8)/2=6$

Gives median five.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد القيمتين الوسطيتين.","En":"Identify the two middle observations."},{"Ar":"ضاعف الوسيط ثم اطرح 4.","En":"Double the median and subtract four."}],"Solution":{"Idea":{"Ar":"الوسيط لقائمة زوجية هو متوسط القيمتين الوسطيتين.","En":"The median of an even list is the average of the two middle values."},"FormulaLatex":"(4+x)/2=6","Steps":[{"Ar":"$4+x=12$","En":"$4+x=12$"},{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=8$","En":"$x=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(4+8)/2=6$","En":"$(4+8)/2=6$"},"CommonError":{"Ar":"يعطي وسيطاً 5.","En":"Gives median five."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعطي وسيطاً 5.","En":"Gives median five."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعطي وسيطاً 7.","En":"Gives median seven."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعطي وسيطاً 8.","En":"Gives median eight."},"Order":4}]}$mw$),
($mw$growth-v47-grade-6-signed-number-opposite-inequality-reversal-1$mw$,$mw$signed-number-opposite-inequality-reversal$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,345,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":345,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب الأعداد المتقابلة","En":"Ordering opposite numbers"},"Question":{"Ar":"إذا كان a=−4 وb=2، فأي مقارنة صحيحة بين العددين المقابلين −a و−b؟","En":"If a=−4 and b=2, which comparison between their opposites −a and −b is true?"},"Options":[{"LatexCode":"-a<-b","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 أكبر من −2 لا أصغر.","En":"Four is greater than −2, not smaller."}},{"LatexCode":"-a=-b","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القيمتان مختلفتان.","En":"The values differ."}},{"LatexCode":"-a>-b","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-a=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مقابل −4 هو 4 وليس صفراً.","En":"The opposite of −4 is four, not zero."}}],"Hints":[{"Ar":"غيّر إشارة كل قيمة.","En":"Reverse the sign of each value."},{"Ar":"الموجب أكبر من السالب.","En":"A positive number is greater than a negative number."}],"Solution":{"Idea":{"Ar":"نحدد العدد المقابل لكل قيمة ثم نقارن على خط الأعداد.","En":"Find each opposite, then compare on the number line."},"FormulaLatex":"-a=4,\\quad -b=-2","Steps":[{"Ar":"$-(-4)=4$","En":"$-(-4)=4$"},{"Ar":"$-(2)=-2$","En":"$-(2)=-2$"},{"Ar":"$4>-2$","En":"$4>-2$"}],"Substitution":{"Ar":"$4>-2$","En":"$4>-2$"},"Result":{"Ar":"$-a>-b$","En":"$-a>-b$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+(-4)=0,\\quad-2+2=0$","En":"$4+(-4)=0,\\quad-2+2=0$"},"CommonError":{"Ar":"4 أكبر من −2 لا أصغر.","En":"Four is greater than −2, not smaller."}}}$mw$::jsonb,$mw$نحدد العدد المقابل لكل قيمة ثم نقارن على خط الأعداد.

$-a=4,\quad -b=-2$

1. $-(-4)=4$

2. $-(2)=-2$

3. $4>-2$

$4>-2$

$-a>-b$

$4+(-4)=0,\quad-2+2=0$

4 أكبر من −2 لا أصغر.$mw$,$mw$Find each opposite, then compare on the number line.

$-a=4,\quad -b=-2$

1. $-(-4)=4$

2. $-(2)=-2$

3. $4>-2$

$4>-2$

$-a>-b$

$4+(-4)=0,\quad-2+2=0$

Four is greater than −2, not smaller.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"غيّر إشارة كل قيمة.","En":"Reverse the sign of each value."},{"Ar":"الموجب أكبر من السالب.","En":"A positive number is greater than a negative number."}],"Solution":{"Idea":{"Ar":"نحدد العدد المقابل لكل قيمة ثم نقارن على خط الأعداد.","En":"Find each opposite, then compare on the number line."},"FormulaLatex":"-a=4,\\quad -b=-2","Steps":[{"Ar":"$-(-4)=4$","En":"$-(-4)=4$"},{"Ar":"$-(2)=-2$","En":"$-(2)=-2$"},{"Ar":"$4>-2$","En":"$4>-2$"}],"Substitution":{"Ar":"$4>-2$","En":"$4>-2$"},"Result":{"Ar":"$-a>-b$","En":"$-a>-b$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+(-4)=0,\\quad-2+2=0$","En":"$4+(-4)=0,\\quad-2+2=0$"},"CommonError":{"Ar":"4 أكبر من −2 لا أصغر.","En":"Four is greater than −2, not smaller."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"4 أكبر من −2 لا أصغر.","En":"Four is greater than −2, not smaller."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"القيمتان مختلفتان.","En":"The values differ."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مقابل −4 هو 4 وليس صفراً.","En":"The opposite of −4 is four, not zero."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v47 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
