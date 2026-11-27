-- One-time owner-authorized v26 original linked school growth. Circle point variant held.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v26-grade-1-equal-difference-compensation-1$mw$,$mw$equal-difference-compensation$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طرح عددين مع تغييرهما","En":"Compensating a subtraction"},"Question":{"Ar":"أي عملية طرح لها الناتج نفسه للعملية $15-6$؟","En":"Which subtraction gives the same result as $15-6$?"},"Options":[{"LatexCode":"14-6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتج 8 لا 9.","En":"The result is 8, not 9."}},{"LatexCode":"15-5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتج 10 لا 9.","En":"The result is 10, not 9."}},{"LatexCode":"14-5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16-6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الناتج 10 لا 9.","En":"The result is 10, not 9."}}],"Hints":[{"Ar":"احسب الفرق الأصلي أولاً.","En":"Find the original difference first."},{"Ar":"جرّب إنقاص العددين معاً بمقدار واحد.","En":"Try decreasing both numbers by one."}],"Solution":{"Idea":{"Ar":"إنقاص العددين بالمقدار نفسه يحافظ على الفرق.","En":"Decreasing both numbers by the same amount preserves the difference."},"FormulaLatex":"15-6=14-5","Steps":[{"Ar":"ناتج 15 ناقص 6 هو 9.","En":"15 minus 6 equals 9."},{"Ar":"ننقص العددين بواحد، فتصبح العملية 14 ناقص 5 وناتجها 9 أيضاً.","En":"Decrease both numbers by one: 14 minus 5 also equals 9."}],"Substitution":{"Ar":"$15-6=9=14-5$","En":"$15-6=9=14-5$"},"Result":{"Ar":"$14-5$","En":"$14-5$"},"Unit":{"Ar":"تعبير حسابي","En":"Arithmetic expression"},"Verification":{"Ar":"إضافة 5 إلى 9 تعطي 14، وإضافة 6 إلى 9 تعطي 15.","En":"Adding 5 to 9 gives 14, and adding 6 to 9 gives 15."},"CommonError":{"Ar":"لا تغيّر أحد العددين وحده وتفترض ثبات الفرق.","En":"Do not change just one number and assume the difference is preserved."}}}$mw$::jsonb,$mw$إنقاص العددين بالمقدار نفسه يحافظ على الفرق.

$15-6=14-5$

1. ناتج 15 ناقص 6 هو 9.

2. ننقص العددين بواحد، فتصبح العملية 14 ناقص 5 وناتجها 9 أيضاً.

$15-6=9=14-5$

$14-5$ تعبير حسابي

إضافة 5 إلى 9 تعطي 14، وإضافة 6 إلى 9 تعطي 15.

لا تغيّر أحد العددين وحده وتفترض ثبات الفرق.$mw$,$mw$Decreasing both numbers by the same amount preserves the difference.

$15-6=14-5$

1. 15 minus 6 equals 9.

2. Decrease both numbers by one: 14 minus 5 also equals 9.

$15-6=9=14-5$

$14-5$ Arithmetic expression

Adding 5 to 9 gives 14, and adding 6 to 9 gives 15.

Do not change just one number and assume the difference is preserved.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الفرق الأصلي أولاً.","En":"Find the original difference first."},{"Ar":"جرّب إنقاص العددين معاً بمقدار واحد.","En":"Try decreasing both numbers by one."}],"Solution":{"Idea":{"Ar":"إنقاص العددين بالمقدار نفسه يحافظ على الفرق.","En":"Decreasing both numbers by the same amount preserves the difference."},"FormulaLatex":"15-6=14-5","Steps":[{"Ar":"ناتج 15 ناقص 6 هو 9.","En":"15 minus 6 equals 9."},{"Ar":"ننقص العددين بواحد، فتصبح العملية 14 ناقص 5 وناتجها 9 أيضاً.","En":"Decrease both numbers by one: 14 minus 5 also equals 9."}],"Substitution":{"Ar":"$15-6=9=14-5$","En":"$15-6=9=14-5$"},"Result":{"Ar":"$14-5$","En":"$14-5$"},"Unit":{"Ar":"تعبير حسابي","En":"Arithmetic expression"},"Verification":{"Ar":"إضافة 5 إلى 9 تعطي 14، وإضافة 6 إلى 9 تعطي 15.","En":"Adding 5 to 9 gives 14, and adding 6 to 9 gives 15."},"CommonError":{"Ar":"لا تغيّر أحد العددين وحده وتفترض ثبات الفرق.","En":"Do not change just one number and assume the difference is preserved."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الناتج 8 لا 9.","En":"The result is 8, not 9."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الناتج 10 لا 9.","En":"The result is 10, not 9."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الناتج 10 لا 9.","En":"The result is 10, not 9."},"Order":4}]}$mw$),
($mw$growth-v26-grade-1-match-one-to-one-1$mw$,$mw$match-one-to-one$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المطابقة واحداً بواحد","En":"One-to-one matching"},"Question":{"Ar":"توجد 6 أطباق و8 ملاعق. نضع ملعقة واحدة على كل طبق. كم ملعقة تبقى بلا طبق؟","En":"There are 6 plates and 8 spoons. Put one spoon on every plate. How many spoons are left without a plate?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توجد ملاعق أكثر من الأطباق.","En":"There are more spoons than plates."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 عدد الملاعق المستعملة.","En":"6 counts the spoons used on plates."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 عدد الملاعق قبل المطابقة.","En":"8 is the initial number of spoons."}}],"Hints":[{"Ar":"تخيل ملعقة مقابل كل طبق.","En":"Imagine one spoon paired with each plate."},{"Ar":"بعد مطابقة ست ملاعق عد الملاعق المتبقية.","En":"After matching six spoons, count the unmatched ones."}],"Solution":{"Idea":{"Ar":"المطابقة واحداً بواحد تبين الفرق بين مجموعتين.","En":"One-to-one matching reveals the difference between two sets."},"FormulaLatex":"8-6","Steps":[{"Ar":"نحتاج ست ملاعق لستة أطباق.","En":"Six plates need six spoons."},{"Ar":"نعد الملاعق المتبقية بعد المطابقة: اثنتان.","En":"Count the spoons left after matching: two."}],"Substitution":{"Ar":"$8-6=2$","En":"$8-6=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"ملاعق","En":"Spoons"},"Verification":{"Ar":"ست ملاعق مستعملة واثنتان باقيتان تعطي ثماني ملاعق.","En":"Six used and two remaining make eight."},"CommonError":{"Ar":"لا تعد الملاعق المستعملة ضمن الباقي.","En":"Do not include used spoons in the remainder."}}}$mw$::jsonb,$mw$المطابقة واحداً بواحد تبين الفرق بين مجموعتين.

$8-6$

1. نحتاج ست ملاعق لستة أطباق.

2. نعد الملاعق المتبقية بعد المطابقة: اثنتان.

$8-6=2$

$2$ ملاعق

ست ملاعق مستعملة واثنتان باقيتان تعطي ثماني ملاعق.

لا تعد الملاعق المستعملة ضمن الباقي.$mw$,$mw$One-to-one matching reveals the difference between two sets.

$8-6$

1. Six plates need six spoons.

2. Count the spoons left after matching: two.

$8-6=2$

$2$ Spoons

Six used and two remaining make eight.

Do not include used spoons in the remainder.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل ملعقة مقابل كل طبق.","En":"Imagine one spoon paired with each plate."},{"Ar":"بعد مطابقة ست ملاعق عد الملاعق المتبقية.","En":"After matching six spoons, count the unmatched ones."}],"Solution":{"Idea":{"Ar":"المطابقة واحداً بواحد تبين الفرق بين مجموعتين.","En":"One-to-one matching reveals the difference between two sets."},"FormulaLatex":"8-6","Steps":[{"Ar":"نحتاج ست ملاعق لستة أطباق.","En":"Six plates need six spoons."},{"Ar":"نعد الملاعق المتبقية بعد المطابقة: اثنتان.","En":"Count the spoons left after matching: two."}],"Substitution":{"Ar":"$8-6=2$","En":"$8-6=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"ملاعق","En":"Spoons"},"Verification":{"Ar":"ست ملاعق مستعملة واثنتان باقيتان تعطي ثماني ملاعق.","En":"Six used and two remaining make eight."},"CommonError":{"Ar":"لا تعد الملاعق المستعملة ضمن الباقي.","En":"Do not include used spoons in the remainder."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"توجد ملاعق أكثر من الأطباق.","En":"There are more spoons than plates."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 عدد الملاعق المستعملة.","En":"6 counts the spoons used on plates."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 عدد الملاعق قبل المطابقة.","En":"8 is the initial number of spoons."},"Order":4}]}$mw$),
($mw$growth-v26-grade-2-count-even-repeated-cards-1$mw$,$mw$count-even-repeated-cards$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد بطاقات تحقق شرطاً","En":"Counting cards satisfying a rule"},"Question":{"Ar":"كتبت رنا الأعداد الآتية على خمس بطاقات منفصلة: 14،17،20،14،23. كم بطاقة تحمل عدداً زوجياً؟","En":"Rana writes 14, 17, 20, 14, 23 on five separate cards. How many cards show an even number?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد القيم الزوجية المختلفة فقط رغم تكرار 14 على بطاقتين.","En":"Counts distinct even values only, although 14 appears on two cards."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"17 و23 فرديان؛ فلا توجد أربع بطاقات زوجية.","En":"17 and 23 are odd; there are not four even cards."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يشمل البطاقات الفردية أيضاً.","En":"Includes the odd cards too."}}],"Hints":[{"Ar":"العدد الزوجي يمكن تقسيمه إلى أزواج دون باقٍ.","En":"An even number can be grouped in pairs without a remainder."},{"Ar":"افحص كل بطاقة على حدة حتى إذا تكرر العدد.","En":"Check every card separately even when a number repeats."}],"Solution":{"Idea":{"Ar":"الأعداد المنتهية بـ0 أو2 أو4 أو6 أو8 زوجية؛ نعد البطاقات لا القيم المختلفة.","En":"Numbers ending in 0,2,4,6,8 are even; count cards, not distinct values."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"14 زوجي و17 فردي و20 زوجي.","En":"14 is even, 17 odd, and 20 even."},{"Ar":"البطاقة الرابعة زوجية أيضاً، والأخيرة فردية.","En":"The fourth card is also even and the last is odd."}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"بطاقات","En":"Cards"},"Verification":{"Ar":"ثلاث بطاقات زوجية وبطاقتان فرديتان تساوي خمس بطاقات.","En":"Three even and two odd cards make five cards."},"CommonError":{"Ar":"لا تحذف بطاقة بسبب تكرار العدد المكتوب عليها.","En":"Do not discard a card because its number repeats."}}}$mw$::jsonb,$mw$الأعداد المنتهية بـ0 أو2 أو4 أو6 أو8 زوجية؛ نعد البطاقات لا القيم المختلفة.

$1+1+1=3$

1. 14 زوجي و17 فردي و20 زوجي.

2. البطاقة الرابعة زوجية أيضاً، والأخيرة فردية.

$1+1+1=3$

$3$ بطاقات

ثلاث بطاقات زوجية وبطاقتان فرديتان تساوي خمس بطاقات.

لا تحذف بطاقة بسبب تكرار العدد المكتوب عليها.$mw$,$mw$Numbers ending in 0,2,4,6,8 are even; count cards, not distinct values.

$1+1+1=3$

1. 14 is even, 17 odd, and 20 even.

2. The fourth card is also even and the last is odd.

$1+1+1=3$

$3$ Cards

Three even and two odd cards make five cards.

Do not discard a card because its number repeats.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"العدد الزوجي يمكن تقسيمه إلى أزواج دون باقٍ.","En":"An even number can be grouped in pairs without a remainder."},{"Ar":"افحص كل بطاقة على حدة حتى إذا تكرر العدد.","En":"Check every card separately even when a number repeats."}],"Solution":{"Idea":{"Ar":"الأعداد المنتهية بـ0 أو2 أو4 أو6 أو8 زوجية؛ نعد البطاقات لا القيم المختلفة.","En":"Numbers ending in 0,2,4,6,8 are even; count cards, not distinct values."},"FormulaLatex":"1+1+1=3","Steps":[{"Ar":"14 زوجي و17 فردي و20 زوجي.","En":"14 is even, 17 odd, and 20 even."},{"Ar":"البطاقة الرابعة زوجية أيضاً، والأخيرة فردية.","En":"The fourth card is also even and the last is odd."}],"Substitution":{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"بطاقات","En":"Cards"},"Verification":{"Ar":"ثلاث بطاقات زوجية وبطاقتان فرديتان تساوي خمس بطاقات.","En":"Three even and two odd cards make five cards."},"CommonError":{"Ar":"لا تحذف بطاقة بسبب تكرار العدد المكتوب عليها.","En":"Do not discard a card because its number repeats."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عد القيم الزوجية المختلفة فقط رغم تكرار 14 على بطاقتين.","En":"Counts distinct even values only, although 14 appears on two cards."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"17 و23 فرديان؛ فلا توجد أربع بطاقات زوجية.","En":"17 and 23 are odd; there are not four even cards."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يشمل البطاقات الفردية أيضاً.","En":"Includes the odd cards too."},"Order":4}]}$mw$),
($mw$growth-v26-grade-3-fraction-unequal-length-parts-1$mw$,$mw$fraction-unequal-length-parts$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"شروط نموذج الكسر","En":"Conditions for a fraction model"},"Question":{"Ar":"قُسّم شريط إلى أربعة أجزاء أطوالها 1 و1 و1 و5 سم. لُوّنت الأجزاء الثلاثة الأولى. ما الكسر الذي يمثل الطول الملون من طول الشريط كله؟","En":"A strip is divided into four pieces of lengths 1, 1, 1 and 5 cm. The first three are coloured. What fraction of the entire strip length is coloured?"},"Options":[{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد ثلاثة أجزاء من أربعة رغم اختلاف أطوالها.","En":"Counts three of four pieces despite unequal lengths."}},{"LatexCode":"\\frac38","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac58","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا كسر الطول غير الملون.","En":"This is the uncoloured fraction."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمثل ثلاثة سنتيمترات من ثمانية.","En":"Does not represent three centimetres out of eight."}}],"Hints":[{"Ar":"احسب طول الشريط كله لا عدد قطعه.","En":"Find the whole strip length, not its piece count."},{"Ar":"قارن مجموع أطوال الأجزاء الملونة بالطول الكلي.","En":"Compare the coloured length with the total length."}],"Solution":{"Idea":{"Ar":"كسر الطول هو طول الجزء على الطول الكلي الموجب، ولا نعد أجزاء غير متساوية كأنها متساوية.","En":"A fraction of length is part length divided by positive total length; unequal pieces cannot be counted as equal."},"FormulaLatex":"f=\\frac{3}{1+1+1+5}","Steps":[{"Ar":"الطول الملون 1+1+1=3 سم.","En":"The coloured length is 1+1+1=3 cm."},{"Ar":"الطول الكلي 3+5=8 سم أي ثماني وحدات طول متساوية.","En":"The total length is 3+5=8 cm, eight equal length units."}],"Substitution":{"Ar":"$\\frac38$","En":"$\\frac38$"},"Result":{"Ar":"$\\frac38$","En":"$\\frac38$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"$\\frac38+\\frac58=1$؛ الجزآن يكونان الشريط كاملاً.","En":"$\\frac38+\\frac58=1$; the portions form the whole strip."},"CommonError":{"Ar":"لا تستخدم عدد القطع مقاماً إذا اختلفت أطوالها.","En":"Do not use the piece count as denominator when lengths differ."}}}$mw$::jsonb,$mw$كسر الطول هو طول الجزء على الطول الكلي الموجب، ولا نعد أجزاء غير متساوية كأنها متساوية.

$f=\frac{3}{1+1+1+5}$

1. الطول الملون 1+1+1=3 سم.

2. الطول الكلي 3+5=8 سم أي ثماني وحدات طول متساوية.

$\frac38$

$\frac38$ بلا وحدة قياس

$\frac38+\frac58=1$؛ الجزآن يكونان الشريط كاملاً.

لا تستخدم عدد القطع مقاماً إذا اختلفت أطوالها.$mw$,$mw$A fraction of length is part length divided by positive total length; unequal pieces cannot be counted as equal.

$f=\frac{3}{1+1+1+5}$

1. The coloured length is 1+1+1=3 cm.

2. The total length is 3+5=8 cm, eight equal length units.

$\frac38$

$\frac38$ Dimensionless

$\frac38+\frac58=1$; the portions form the whole strip.

Do not use the piece count as denominator when lengths differ.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب طول الشريط كله لا عدد قطعه.","En":"Find the whole strip length, not its piece count."},{"Ar":"قارن مجموع أطوال الأجزاء الملونة بالطول الكلي.","En":"Compare the coloured length with the total length."}],"Solution":{"Idea":{"Ar":"كسر الطول هو طول الجزء على الطول الكلي الموجب، ولا نعد أجزاء غير متساوية كأنها متساوية.","En":"A fraction of length is part length divided by positive total length; unequal pieces cannot be counted as equal."},"FormulaLatex":"f=\\frac{3}{1+1+1+5}","Steps":[{"Ar":"الطول الملون 1+1+1=3 سم.","En":"The coloured length is 1+1+1=3 cm."},{"Ar":"الطول الكلي 3+5=8 سم أي ثماني وحدات طول متساوية.","En":"The total length is 3+5=8 cm, eight equal length units."}],"Substitution":{"Ar":"$\\frac38$","En":"$\\frac38$"},"Result":{"Ar":"$\\frac38$","En":"$\\frac38$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"$\\frac38+\\frac58=1$؛ الجزآن يكونان الشريط كاملاً.","En":"$\\frac38+\\frac58=1$; the portions form the whole strip."},"CommonError":{"Ar":"لا تستخدم عدد القطع مقاماً إذا اختلفت أطوالها.","En":"Do not use the piece count as denominator when lengths differ."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عد ثلاثة أجزاء من أربعة رغم اختلاف أطوالها.","En":"Counts three of four pieces despite unequal lengths."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا كسر الطول غير الملون.","En":"This is the uncoloured fraction."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يمثل ثلاثة سنتيمترات من ثمانية.","En":"Does not represent three centimetres out of eight."},"Order":4}]}$mw$),
($mw$growth-v26-grade-3-compare-finish-times-1$mw$,$mw$compare-finish-times$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة وقت انتهاء نشاطين","En":"Comparing finish times"},"Question":{"Ar":"بدأ نشاط A عند 9:40 واستمر 35 دقيقة. بدأ نشاط B عند 9:55 واستمر 15 دقيقة. أي نشاط انتهى أولاً وبكم دقيقة؟","En":"Activity A starts at 9:40 and lasts 35 minutes. Activity B starts at 9:55 and lasts 15 minutes. Which activity finishes first, and by how many minutes?"},"Options":[{"LatexCode":"(A,5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"A ينتهي 10:15 بعد B الذي ينتهي 10:10.","En":"A finishes at 10:15 after B, which finishes at 10:10."}},{"LatexCode":"(B,5)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(A,15)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 دقيقة فرق البداية لا النهاية.","En":"15 minutes is the start-time difference, not finish-time difference."}},{"LatexCode":"(B,20)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 دقيقة فرق المدتين لا وقتي النهاية.","En":"20 minutes is the duration difference, not finish-time difference."}}],"Hints":[{"Ar":"احسب وقت انتهاء كل نشاط منفرداً.","En":"Find each finish time separately."},{"Ar":"تذكر أن 60 دقيقة تساوي ساعة.","En":"Remember that 60 minutes make an hour."}],"Solution":{"Idea":{"Ar":"وقت النهاية يساوي وقت البداية مضافاً إليه الزمن المنقضي؛ بعد تحويل وقتي النهاية إلى دقائق منذ منتصف الليل، نطرح الأصغر من الأكبر.","En":"Finish time equals start time plus elapsed time; convert both finish times to minutes since midnight and subtract the smaller from the larger."},"FormulaLatex":"615-610=5","Steps":[{"Ar":"A يصل إلى 10:00 بعد 20 دقيقة ثم يستمر 15 دقيقة، فينتهي 10:15.","En":"A reaches 10:00 after 20 minutes and continues 15 more, finishing at 10:15."},{"Ar":"B يصل إلى 10:00 بعد 5 دقائق ثم يستمر 10 دقائق، فينتهي 10:10.","En":"B reaches 10:00 after 5 minutes and continues 10 more, finishing at 10:10."}],"Substitution":{"Ar":"$615-610=5$ دقيقة.","En":"$615-610=5$ minutes."},"Result":{"Ar":"$(B,5)$","En":"$(B,5)$"},"Unit":{"Ar":"النشاط والدقائق","En":"Activity and minutes"},"Verification":{"Ar":"10:10 يسبق 10:15 بخمس دقائق، إذن B انتهى أولاً.","En":"10:10 precedes 10:15 by five minutes, so B finishes first."},"CommonError":{"Ar":"لا تقارن المدتين وحدهما.","En":"Do not compare the durations alone."}}}$mw$::jsonb,$mw$وقت النهاية يساوي وقت البداية مضافاً إليه الزمن المنقضي؛ بعد تحويل وقتي النهاية إلى دقائق منذ منتصف الليل، نطرح الأصغر من الأكبر.

$615-610=5$

1. A يصل إلى 10:00 بعد 20 دقيقة ثم يستمر 15 دقيقة، فينتهي 10:15.

2. B يصل إلى 10:00 بعد 5 دقائق ثم يستمر 10 دقائق، فينتهي 10:10.

$615-610=5$ دقيقة.

$(B,5)$ النشاط والدقائق

10:10 يسبق 10:15 بخمس دقائق، إذن B انتهى أولاً.

لا تقارن المدتين وحدهما.$mw$,$mw$Finish time equals start time plus elapsed time; convert both finish times to minutes since midnight and subtract the smaller from the larger.

$615-610=5$

1. A reaches 10:00 after 20 minutes and continues 15 more, finishing at 10:15.

2. B reaches 10:00 after 5 minutes and continues 10 more, finishing at 10:10.

$615-610=5$ minutes.

$(B,5)$ Activity and minutes

10:10 precedes 10:15 by five minutes, so B finishes first.

Do not compare the durations alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب وقت انتهاء كل نشاط منفرداً.","En":"Find each finish time separately."},{"Ar":"تذكر أن 60 دقيقة تساوي ساعة.","En":"Remember that 60 minutes make an hour."}],"Solution":{"Idea":{"Ar":"وقت النهاية يساوي وقت البداية مضافاً إليه الزمن المنقضي؛ بعد تحويل وقتي النهاية إلى دقائق منذ منتصف الليل، نطرح الأصغر من الأكبر.","En":"Finish time equals start time plus elapsed time; convert both finish times to minutes since midnight and subtract the smaller from the larger."},"FormulaLatex":"615-610=5","Steps":[{"Ar":"A يصل إلى 10:00 بعد 20 دقيقة ثم يستمر 15 دقيقة، فينتهي 10:15.","En":"A reaches 10:00 after 20 minutes and continues 15 more, finishing at 10:15."},{"Ar":"B يصل إلى 10:00 بعد 5 دقائق ثم يستمر 10 دقائق، فينتهي 10:10.","En":"B reaches 10:00 after 5 minutes and continues 10 more, finishing at 10:10."}],"Substitution":{"Ar":"$615-610=5$ دقيقة.","En":"$615-610=5$ minutes."},"Result":{"Ar":"$(B,5)$","En":"$(B,5)$"},"Unit":{"Ar":"النشاط والدقائق","En":"Activity and minutes"},"Verification":{"Ar":"10:10 يسبق 10:15 بخمس دقائق، إذن B انتهى أولاً.","En":"10:10 precedes 10:15 by five minutes, so B finishes first."},"CommonError":{"Ar":"لا تقارن المدتين وحدهما.","En":"Do not compare the durations alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"A ينتهي 10:15 بعد B الذي ينتهي 10:10.","En":"A finishes at 10:15 after B, which finishes at 10:10."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"15 دقيقة فرق البداية لا النهاية.","En":"15 minutes is the start-time difference, not finish-time difference."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"20 دقيقة فرق المدتين لا وقتي النهاية.","En":"20 minutes is the duration difference, not finish-time difference."},"Order":4}]}$mw$),
($mw$growth-v26-grade-9-cancel-variable-contradiction-1$mw$,$mw$cancel-variable-contradiction$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متباينة بلا حلول","En":"An inequality with no solutions"},"Question":{"Ar":"ما مجموعة حلول المتباينة $3(x+2)<3x+5$ في الأعداد الحقيقية؟","En":"What is the real solution set of $3(x+2)<3x+5$?"},"Options":[{"LatexCode":"x<5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بعد حذف الحدود المتساوية لا يبقى متغير.","En":"After cancelling equal terms no variable remains."}},{"LatexCode":"x<-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 3x من الطرفين لا يعطي متباينة في x.","En":"Subtracting 3x from both sides leaves no inequality in x."}},{"LatexCode":"\\mathbb{R}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 أصغر من 5 عبارة خاطئة لكل x.","En":"6 less than 5 is false for every x."}},{"LatexCode":"\\varnothing","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"وزع العدد 3 على القوس.","En":"Distribute 3 over the parentheses."},{"Ar":"اطرح 3x من الطرفين وافحص العبارة المتبقية.","En":"Subtract 3x from both sides and inspect the remaining statement."}],"Solution":{"Idea":{"Ar":"إذا اختفت الحدود المتغيرة من متباينة مكافئة، فالحل جميع الأعداد الحقيقية عند صدق العبارة، وفارغ عند خطئها.","En":"If variable terms cancel in an equivalent inequality, the solution is all reals if the remaining statement is true and empty otherwise."},"FormulaLatex":"3(x+2)<3x+5\\iff 6<5","Steps":[{"Ar":"بتوزيع 3 يصبح الطرف الأيسر 3x+6.","En":"Distributing 3 gives 3x+6 on the left."},{"Ar":"نطرح 3x من الطرفين، فتبقى 6 أصغر من 5 وهي عبارة خاطئة دائماً.","En":"Subtract 3x from both sides; 6 less than 5 is always false."}],"Substitution":{"Ar":"بطرح $3x$ نحصل على العبارة الخاطئة $6<5$، وبالتالي $S=\\varnothing$.","En":"Subtracting $3x$ gives the false statement $6<5$, hence $S=\\varnothing$."},"Result":{"Ar":"$\\varnothing$","En":"$\\varnothing$"},"Unit":{"Ar":"مجموعة حلول","En":"Solution set"},"Verification":{"Ar":"الطرف الأيسر يزيد على الأيمن بواحد لكل x، فلا يمكن أن يكون أصغر منه.","En":"The left exceeds the right by one for every x, so it cannot be smaller."},"CommonError":{"Ar":"لا تفترض وجود حل عددي بعد اختفاء المتغير.","En":"Do not assume a numerical solution exists after the variable cancels."}}}$mw$::jsonb,$mw$إذا اختفت الحدود المتغيرة من متباينة مكافئة، فالحل جميع الأعداد الحقيقية عند صدق العبارة، وفارغ عند خطئها.

$3(x+2)<3x+5\iff 6<5$

1. بتوزيع 3 يصبح الطرف الأيسر 3x+6.

2. نطرح 3x من الطرفين، فتبقى 6 أصغر من 5 وهي عبارة خاطئة دائماً.

بطرح $3x$ نحصل على العبارة الخاطئة $6<5$، وبالتالي $S=\varnothing$.

$\varnothing$ مجموعة حلول

الطرف الأيسر يزيد على الأيمن بواحد لكل x، فلا يمكن أن يكون أصغر منه.

لا تفترض وجود حل عددي بعد اختفاء المتغير.$mw$,$mw$If variable terms cancel in an equivalent inequality, the solution is all reals if the remaining statement is true and empty otherwise.

$3(x+2)<3x+5\iff 6<5$

1. Distributing 3 gives 3x+6 on the left.

2. Subtract 3x from both sides; 6 less than 5 is always false.

Subtracting $3x$ gives the false statement $6<5$, hence $S=\varnothing$.

$\varnothing$ Solution set

The left exceeds the right by one for every x, so it cannot be smaller.

Do not assume a numerical solution exists after the variable cancels.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزع العدد 3 على القوس.","En":"Distribute 3 over the parentheses."},{"Ar":"اطرح 3x من الطرفين وافحص العبارة المتبقية.","En":"Subtract 3x from both sides and inspect the remaining statement."}],"Solution":{"Idea":{"Ar":"إذا اختفت الحدود المتغيرة من متباينة مكافئة، فالحل جميع الأعداد الحقيقية عند صدق العبارة، وفارغ عند خطئها.","En":"If variable terms cancel in an equivalent inequality, the solution is all reals if the remaining statement is true and empty otherwise."},"FormulaLatex":"3(x+2)<3x+5\\iff 6<5","Steps":[{"Ar":"بتوزيع 3 يصبح الطرف الأيسر 3x+6.","En":"Distributing 3 gives 3x+6 on the left."},{"Ar":"نطرح 3x من الطرفين، فتبقى 6 أصغر من 5 وهي عبارة خاطئة دائماً.","En":"Subtract 3x from both sides; 6 less than 5 is always false."}],"Substitution":{"Ar":"بطرح $3x$ نحصل على العبارة الخاطئة $6<5$، وبالتالي $S=\\varnothing$.","En":"Subtracting $3x$ gives the false statement $6<5$, hence $S=\\varnothing$."},"Result":{"Ar":"$\\varnothing$","En":"$\\varnothing$"},"Unit":{"Ar":"مجموعة حلول","En":"Solution set"},"Verification":{"Ar":"الطرف الأيسر يزيد على الأيمن بواحد لكل x، فلا يمكن أن يكون أصغر منه.","En":"The left exceeds the right by one for every x, so it cannot be smaller."},"CommonError":{"Ar":"لا تفترض وجود حل عددي بعد اختفاء المتغير.","En":"Do not assume a numerical solution exists after the variable cancels."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"بعد حذف الحدود المتساوية لا يبقى متغير.","En":"After cancelling equal terms no variable remains."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 3x من الطرفين لا يعطي متباينة في x.","En":"Subtracting 3x from both sides leaves no inequality in x."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 أصغر من 5 عبارة خاطئة لكل x.","En":"6 less than 5 is false for every x."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v26-grade-12-bilinear-sum-difference-1$mw$,$mw$bilinear-sum-difference$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الضرب النقطي للمجموع والفرق","En":"Dot product of sum and difference"},"Question":{"Ar":"إذا كان $u,v\\in\\mathbb R^2$ و$\\|u\\|=5$ و$\\|v\\|=3$، فما قيمة $(u+v)\\cdot(u-v)$؟","En":"If $u,v\\in\\mathbb R^2$, $\\|u\\|=5$ and $\\|v\\|=3$, what is $(u+v)\\cdot(u-v)$?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق الطولين لا فرق مربعيهما.","En":"This subtracts norms instead of their squares."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الطولين.","En":"This is the sum of the norms."}},{"LatexCode":"16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع المربعين لا الفرق.","En":"This adds the squared norms rather than subtracting."}}],"Hints":[{"Ar":"وزع الضرب النقطي على الجمع والطرح.","En":"Distribute the dot product over addition and subtraction."},{"Ar":"استعمل تماثل الضرب النقطي لإلغاء الحدين المختلطين.","En":"Use dot-product symmetry to cancel the mixed terms."}],"Solution":{"Idea":{"Ar":"الضرب النقطي الحقيقي ثنائي الخطية ومتماثل، وضرب المتجه في نفسه يساوي مربع طوله.","En":"The real dot product is bilinear and symmetric, and a vector dotted with itself equals its squared norm."},"FormulaLatex":"(u+v)\\cdot(u-v)=\\|u\\|^2-\\|v\\|^2","Steps":[{"Ar":"بالتوزيع نحصل على $u\\cdot u-u\\cdot v+v\\cdot u-v\\cdot v$.","En":"Distributing gives $u\\cdot u-u\\cdot v+v\\cdot u-v\\cdot v$."},{"Ar":"بما أن $u\\cdot v=v\\cdot u$ يختفي الحدان المختلطان.","En":"Since $u\\cdot v=v\\cdot u$, the mixed terms cancel."},{"Ar":"يتبقى $\\|u\\|^2-\\|v\\|^2=25-9$.","En":"This leaves $\\|u\\|^2-\\|v\\|^2=25-9$."}],"Substitution":{"Ar":"$25-9=16$","En":"$25-9=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"مثلاً $u=(5,0),v=(0,3)$ يعطي $(5,3)\\cdot(5,-3)=16$، متسقاً مع الهوية العامة.","En":"For example $u=(5,0),v=(0,3)$ gives $(5,3)\\cdot(5,-3)=16$, consistent with the general identity."},"CommonError":{"Ar":"لا تستبدل الضرب النقطي بجداء الطولين دون شرط الزاوية المناسب.","En":"Do not replace a dot product by a product of norms without the appropriate angle condition."}}}$mw$::jsonb,$mw$الضرب النقطي الحقيقي ثنائي الخطية ومتماثل، وضرب المتجه في نفسه يساوي مربع طوله.

$(u+v)\cdot(u-v)=\|u\|^2-\|v\|^2$

1. بالتوزيع نحصل على $u\cdot u-u\cdot v+v\cdot u-v\cdot v$.

2. بما أن $u\cdot v=v\cdot u$ يختفي الحدان المختلطان.

3. يتبقى $\|u\|^2-\|v\|^2=25-9$.

$25-9=16$

$16$ بلا وحدة محددة

مثلاً $u=(5,0),v=(0,3)$ يعطي $(5,3)\cdot(5,-3)=16$، متسقاً مع الهوية العامة.

لا تستبدل الضرب النقطي بجداء الطولين دون شرط الزاوية المناسب.$mw$,$mw$The real dot product is bilinear and symmetric, and a vector dotted with itself equals its squared norm.

$(u+v)\cdot(u-v)=\|u\|^2-\|v\|^2$

1. Distributing gives $u\cdot u-u\cdot v+v\cdot u-v\cdot v$.

2. Since $u\cdot v=v\cdot u$, the mixed terms cancel.

3. This leaves $\|u\|^2-\|v\|^2=25-9$.

$25-9=16$

$16$ No specified unit

For example $u=(5,0),v=(0,3)$ gives $(5,3)\cdot(5,-3)=16$, consistent with the general identity.

Do not replace a dot product by a product of norms without the appropriate angle condition.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزع الضرب النقطي على الجمع والطرح.","En":"Distribute the dot product over addition and subtraction."},{"Ar":"استعمل تماثل الضرب النقطي لإلغاء الحدين المختلطين.","En":"Use dot-product symmetry to cancel the mixed terms."}],"Solution":{"Idea":{"Ar":"الضرب النقطي الحقيقي ثنائي الخطية ومتماثل، وضرب المتجه في نفسه يساوي مربع طوله.","En":"The real dot product is bilinear and symmetric, and a vector dotted with itself equals its squared norm."},"FormulaLatex":"(u+v)\\cdot(u-v)=\\|u\\|^2-\\|v\\|^2","Steps":[{"Ar":"بالتوزيع نحصل على $u\\cdot u-u\\cdot v+v\\cdot u-v\\cdot v$.","En":"Distributing gives $u\\cdot u-u\\cdot v+v\\cdot u-v\\cdot v$."},{"Ar":"بما أن $u\\cdot v=v\\cdot u$ يختفي الحدان المختلطان.","En":"Since $u\\cdot v=v\\cdot u$, the mixed terms cancel."},{"Ar":"يتبقى $\\|u\\|^2-\\|v\\|^2=25-9$.","En":"This leaves $\\|u\\|^2-\\|v\\|^2=25-9$."}],"Substitution":{"Ar":"$25-9=16$","En":"$25-9=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"مثلاً $u=(5,0),v=(0,3)$ يعطي $(5,3)\\cdot(5,-3)=16$، متسقاً مع الهوية العامة.","En":"For example $u=(5,0),v=(0,3)$ gives $(5,3)\\cdot(5,-3)=16$, consistent with the general identity."},"CommonError":{"Ar":"لا تستبدل الضرب النقطي بجداء الطولين دون شرط الزاوية المناسب.","En":"Do not replace a dot product by a product of norms without the appropriate angle condition."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق الطولين لا فرق مربعيهما.","En":"This subtracts norms instead of their squares."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الطولين.","En":"This is the sum of the norms."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع المربعين لا الفرق.","En":"This adds the squared norms rather than subtracting."},"Order":4}]}$mw$),
($mw$growth-v26-grade-12-fourth-power-difference-1$mw$,$mw$fourth-power-difference$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق قوتين مثلثيتين","En":"Difference of trigonometric powers"},"Question":{"Ar":"إذا كان $\\cos^2\\theta=0.7$، فما قيمة $\\cos^4\\theta-\\sin^4\\theta$؟","En":"If $\\cos^2\\theta=0.7$, what is $\\cos^4\\theta-\\sin^4\\theta$?"},"Options":[{"LatexCode":"0.16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.16 مربع الفرق لا فرق المربعين.","En":"0.16 squares the difference instead of taking the difference of squares."}},{"LatexCode":"0.4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.49","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.49 قيمة الحد الأول وحده.","En":"0.49 is only the first term."}},{"LatexCode":"0.58","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.58 مجموع القوتين لا الفرق.","En":"0.58 adds the powers rather than subtracting."}}],"Hints":[{"Ar":"استعمل هوية مربعي الجيب وجيب التمام.","En":"Use the identity relating squared sine and cosine."},{"Ar":"حلل فرق المربعين إلى حاصل ضرب مجموع وفرق.","En":"Factor the difference of squares into a sum times a difference."}],"Solution":{"Idea":{"Ar":"هوية فيثاغورس تجعل مجموع مربعي الجيب وجيب التمام واحداً لأي زاوية حقيقية.","En":"The Pythagorean identity makes squared sine and cosine sum to one for every real angle."},"FormulaLatex":"\\cos^4\\theta-\\sin^4\\theta=(\\cos^2\\theta-\\sin^2\\theta)(\\cos^2\\theta+\\sin^2\\theta)","Steps":[{"Ar":"$\\sin^2\\theta=1-0.7=0.3$.","En":"$\\sin^2\\theta=1-0.7=0.3$."},{"Ar":"فرق المربعين يساوي حاصل ضرب (0.7−0.3) في (0.7+0.3).","En":"The factored difference is (0.7−0.3) times (0.7+0.3)."}],"Substitution":{"Ar":"$0.4(1)=0.4$","En":"$0.4(1)=0.4$"},"Result":{"Ar":"$0.4$","En":"$0.4$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"بالحساب المباشر 0.49−0.09=0.40.","En":"Direct calculation gives 0.49−0.09=0.40."},"CommonError":{"Ar":"لا تساو فرق مربعين بمربع الفرق.","En":"Do not equate a difference of squares with the square of a difference."}}}$mw$::jsonb,$mw$هوية فيثاغورس تجعل مجموع مربعي الجيب وجيب التمام واحداً لأي زاوية حقيقية.

$\cos^4\theta-\sin^4\theta=(\cos^2\theta-\sin^2\theta)(\cos^2\theta+\sin^2\theta)$

1. $\sin^2\theta=1-0.7=0.3$.

2. فرق المربعين يساوي حاصل ضرب (0.7−0.3) في (0.7+0.3).

$0.4(1)=0.4$

$0.4$ بلا وحدة قياس

بالحساب المباشر 0.49−0.09=0.40.

لا تساو فرق مربعين بمربع الفرق.$mw$,$mw$The Pythagorean identity makes squared sine and cosine sum to one for every real angle.

$\cos^4\theta-\sin^4\theta=(\cos^2\theta-\sin^2\theta)(\cos^2\theta+\sin^2\theta)$

1. $\sin^2\theta=1-0.7=0.3$.

2. The factored difference is (0.7−0.3) times (0.7+0.3).

$0.4(1)=0.4$

$0.4$ Dimensionless

Direct calculation gives 0.49−0.09=0.40.

Do not equate a difference of squares with the square of a difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل هوية مربعي الجيب وجيب التمام.","En":"Use the identity relating squared sine and cosine."},{"Ar":"حلل فرق المربعين إلى حاصل ضرب مجموع وفرق.","En":"Factor the difference of squares into a sum times a difference."}],"Solution":{"Idea":{"Ar":"هوية فيثاغورس تجعل مجموع مربعي الجيب وجيب التمام واحداً لأي زاوية حقيقية.","En":"The Pythagorean identity makes squared sine and cosine sum to one for every real angle."},"FormulaLatex":"\\cos^4\\theta-\\sin^4\\theta=(\\cos^2\\theta-\\sin^2\\theta)(\\cos^2\\theta+\\sin^2\\theta)","Steps":[{"Ar":"$\\sin^2\\theta=1-0.7=0.3$.","En":"$\\sin^2\\theta=1-0.7=0.3$."},{"Ar":"فرق المربعين يساوي حاصل ضرب (0.7−0.3) في (0.7+0.3).","En":"The factored difference is (0.7−0.3) times (0.7+0.3)."}],"Substitution":{"Ar":"$0.4(1)=0.4$","En":"$0.4(1)=0.4$"},"Result":{"Ar":"$0.4$","En":"$0.4$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"بالحساب المباشر 0.49−0.09=0.40.","En":"Direct calculation gives 0.49−0.09=0.40."},"CommonError":{"Ar":"لا تساو فرق مربعين بمربع الفرق.","En":"Do not equate a difference of squares with the square of a difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"0.16 مربع الفرق لا فرق المربعين.","En":"0.16 squares the difference instead of taking the difference of squares."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"0.49 قيمة الحد الأول وحده.","En":"0.49 is only the first term."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"0.58 مجموع القوتين لا الفرق.","En":"0.58 adds the powers rather than subtracting."},"Order":4}]}$mw$),
($mw$growth-v26-grade-12-compare-two-half-lives-1$mw$,$mw$compare-two-half-lives$mw$,$mw$decay-half-life$mw$,$mw$grade-12$mw$,12,3,86,310,$mw${"StageId":3,"CategoryId":86,"PrimarySkillId":310,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة كميتين بنصفي عمر مختلفين","En":"Comparing two half-lives"},"Question":{"Ar":"تبدأ عينتان A وB بكتلة 160 غ لكل منهما. نصف عمر A ساعتان ونصف عمر B أربع ساعات. ما فرق الكتلتين المتبقيتين بعد 8 ساعات؟","En":"Samples A and B each start at 160 g. A has half-life 2 hours and B has half-life 4 hours. What is the difference between their remaining masses after 8 hours?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 غ كتلة A المتبقية فقط.","En":"10 g is only A's remaining mass."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 غ لا يساوي الفرق بين 40 و10.","En":"20 g is not the difference between 40 and 10."}},{"LatexCode":"30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"40 غ كتلة B المتبقية لا الفرق.","En":"40 g is B's remaining mass, not the difference."}}],"Hints":[{"Ar":"احسب عدد أنصاف الأعمار المنقضية لكل عينة.","En":"Find the number of half-lives elapsed for each sample."},{"Ar":"احسب الكتلتين المتبقيتين ثم اطرح الأصغر من الأكبر.","En":"Find both remaining masses then subtract the smaller from the larger."}],"Solution":{"Idea":{"Ar":"في نموذج الاضمحلال الأسي بنصف عمر ثابت موجب تنخفض الكمية إلى نصفها بعد كل نصف عمر.","En":"In exponential decay with a fixed positive half-life, the quantity halves every half-life."},"FormulaLatex":"M(t)=M_0\\left(\\frac12\\right)^{t/h}","Steps":[{"Ar":"للعينة A تمر أربعة أنصاف أعمار، فتبقى 160/16=10 غ.","En":"A undergoes four half-lives, leaving 160/16=10 g."},{"Ar":"للعينة B يمر نصفا عمر، فتبقى 160/4=40 غ.","En":"B undergoes two half-lives, leaving 160/4=40 g."},{"Ar":"نطرح الكتلتين المتبقيتين.","En":"Subtract the two remaining masses."}],"Substitution":{"Ar":"$40-10=30$","En":"$40-10=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"غراماً","En":"Grams"},"Verification":{"Ar":"التنصيف المتكرر يعطي A:160،80،40،20،10 وB:160،80،40.","En":"Repeated halving gives A:160,80,40,20,10 and B:160,80,40."},"CommonError":{"Ar":"لا تطرح نصفي العمر مباشرة بدلاً من حساب الكتلتين.","En":"Do not subtract half-lives instead of calculating remaining masses."}}}$mw$::jsonb,$mw$في نموذج الاضمحلال الأسي بنصف عمر ثابت موجب تنخفض الكمية إلى نصفها بعد كل نصف عمر.

$M(t)=M_0\left(\frac12\right)^{t/h}$

1. للعينة A تمر أربعة أنصاف أعمار، فتبقى 160/16=10 غ.

2. للعينة B يمر نصفا عمر، فتبقى 160/4=40 غ.

3. نطرح الكتلتين المتبقيتين.

$40-10=30$

$30$ غراماً

التنصيف المتكرر يعطي A:160،80،40،20،10 وB:160،80،40.

لا تطرح نصفي العمر مباشرة بدلاً من حساب الكتلتين.$mw$,$mw$In exponential decay with a fixed positive half-life, the quantity halves every half-life.

$M(t)=M_0\left(\frac12\right)^{t/h}$

1. A undergoes four half-lives, leaving 160/16=10 g.

2. B undergoes two half-lives, leaving 160/4=40 g.

3. Subtract the two remaining masses.

$40-10=30$

$30$ Grams

Repeated halving gives A:160,80,40,20,10 and B:160,80,40.

Do not subtract half-lives instead of calculating remaining masses.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد أنصاف الأعمار المنقضية لكل عينة.","En":"Find the number of half-lives elapsed for each sample."},{"Ar":"احسب الكتلتين المتبقيتين ثم اطرح الأصغر من الأكبر.","En":"Find both remaining masses then subtract the smaller from the larger."}],"Solution":{"Idea":{"Ar":"في نموذج الاضمحلال الأسي بنصف عمر ثابت موجب تنخفض الكمية إلى نصفها بعد كل نصف عمر.","En":"In exponential decay with a fixed positive half-life, the quantity halves every half-life."},"FormulaLatex":"M(t)=M_0\\left(\\frac12\\right)^{t/h}","Steps":[{"Ar":"للعينة A تمر أربعة أنصاف أعمار، فتبقى 160/16=10 غ.","En":"A undergoes four half-lives, leaving 160/16=10 g."},{"Ar":"للعينة B يمر نصفا عمر، فتبقى 160/4=40 غ.","En":"B undergoes two half-lives, leaving 160/4=40 g."},{"Ar":"نطرح الكتلتين المتبقيتين.","En":"Subtract the two remaining masses."}],"Substitution":{"Ar":"$40-10=30$","En":"$40-10=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"غراماً","En":"Grams"},"Verification":{"Ar":"التنصيف المتكرر يعطي A:160،80،40،20،10 وB:160،80،40.","En":"Repeated halving gives A:160,80,40,20,10 and B:160,80,40."},"CommonError":{"Ar":"لا تطرح نصفي العمر مباشرة بدلاً من حساب الكتلتين.","En":"Do not subtract half-lives instead of calculating remaining masses."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"10 غ كتلة A المتبقية فقط.","En":"10 g is only A's remaining mass."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"20 غ لا يساوي الفرق بين 40 و10.","En":"20 g is not the difference between 40 and 10."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"40 غ كتلة B المتبقية لا الفرق.","En":"40 g is B's remaining mass, not the difference."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v26 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
