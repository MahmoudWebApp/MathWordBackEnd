-- One-time owner-authorized import AND publication from reviewed v15/v16/v18 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v16-grade-3-recover-number-from-two-roundings-1$mw$,$mw$recover-number-from-two-roundings$mw$,$mw$rounding$mw$,$mw$grade-3$mw$,3,1,81,306,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":306,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"تقريبان لعدد واحد","En":"Two roundings of one number"},"Question":{"Ar":"عدد صحيح يُقرّب إلى 250 إلى أقرب عشرة، وإلى 300 إلى أقرب مئة، مع التقريب إلى الأعلى عند منتصف المسافة. ما أصغر عدد يمكن أن يكونه؟","En":"A whole number rounds to 250 to the nearest ten and to 300 to the nearest hundred, with halfway cases rounded up. What is the smallest possible number?"},"Options":[{"LatexCode":"250","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"245","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طبّق شرط أقرب عشرة فقط.","En":"Uses only the nearest-ten condition."}},{"LatexCode":"254","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار أكبر عدد يحقق الشرطين.","En":"Chooses the largest number satisfying both conditions."}},{"LatexCode":"300","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين العدد الأصلي وناتج التقريب إلى المئة.","En":"Confuses the original number with the rounded hundred."}}],"Hints":[{"Ar":"أوجد الأعداد الصحيحة التي تُقرّب إلى 250 لأقرب عشرة.","En":"List the whole numbers that round to 250 to the nearest ten."},{"Ar":"أين تقع عتبة التقريب إلى 300 لأقرب مئة؟","En":"Where does rounding to 300 to the nearest hundred start?"}],"Solution":{"Idea":{"Ar":"نجد مجال الأعداد التي تحقق كل تقريب، ثم نختار أصغر عدد في تقاطع المجالين.","En":"Find the ranges satisfying both rounding conditions, then choose the smallest integer in their intersection."},"FormulaLatex":"n=\\max(245,250)","Steps":[{"Ar":"الأعداد من 245 إلى 254 تُقرّب إلى 250 لأقرب عشرة.","En":"The numbers from 245 through 254 round to 250 to the nearest ten."},{"Ar":"أصغر عدد يُقرّب إلى 300 لأقرب مئة هو 250، وهو موجود في النطاق الأول.","En":"The smallest number that rounds to 300 to the nearest hundred is 250, which is in the first range."}],"Substitution":{"Ar":"$\\max(245,250)=250$","En":"$\\max(245,250)=250$"},"Result":{"Ar":"$250$","En":"$250$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"عند 250 يتحقق التقريبان، أما 249 فيُقرّب إلى 200 لأقرب مئة.","En":"Both roundings work at 250, while 249 rounds to 200 to the nearest hundred."},"CommonError":{"Ar":"طبّق شرط أقرب عشرة فقط.","En":"Uses only the nearest-ten condition."}}}$mw$::jsonb,$mw$نجد مجال الأعداد التي تحقق كل تقريب، ثم نختار أصغر عدد في تقاطع المجالين.

$n=\max(245,250)$

1. الأعداد من 245 إلى 254 تُقرّب إلى 250 لأقرب عشرة.

2. أصغر عدد يُقرّب إلى 300 لأقرب مئة هو 250، وهو موجود في النطاق الأول.

$\max(245,250)=250$

$250$ بلا وحدة

عند 250 يتحقق التقريبان، أما 249 فيُقرّب إلى 200 لأقرب مئة.

طبّق شرط أقرب عشرة فقط.$mw$,$mw$Find the ranges satisfying both rounding conditions, then choose the smallest integer in their intersection.

$n=\max(245,250)$

1. The numbers from 245 through 254 round to 250 to the nearest ten.

2. The smallest number that rounds to 300 to the nearest hundred is 250, which is in the first range.

$\max(245,250)=250$

$250$ unitless

Both roundings work at 250, while 249 rounds to 200 to the nearest hundred.

Uses only the nearest-ten condition.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"أوجد الأعداد الصحيحة التي تُقرّب إلى 250 لأقرب عشرة.","En":"List the whole numbers that round to 250 to the nearest ten."},{"Ar":"أين تقع عتبة التقريب إلى 300 لأقرب مئة؟","En":"Where does rounding to 300 to the nearest hundred start?"}],"Solution":{"Idea":{"Ar":"نجد مجال الأعداد التي تحقق كل تقريب، ثم نختار أصغر عدد في تقاطع المجالين.","En":"Find the ranges satisfying both rounding conditions, then choose the smallest integer in their intersection."},"FormulaLatex":"n=\\max(245,250)","Steps":[{"Ar":"الأعداد من 245 إلى 254 تُقرّب إلى 250 لأقرب عشرة.","En":"The numbers from 245 through 254 round to 250 to the nearest ten."},{"Ar":"أصغر عدد يُقرّب إلى 300 لأقرب مئة هو 250، وهو موجود في النطاق الأول.","En":"The smallest number that rounds to 300 to the nearest hundred is 250, which is in the first range."}],"Substitution":{"Ar":"$\\max(245,250)=250$","En":"$\\max(245,250)=250$"},"Result":{"Ar":"$250$","En":"$250$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"عند 250 يتحقق التقريبان، أما 249 فيُقرّب إلى 200 لأقرب مئة.","En":"Both roundings work at 250, while 249 rounds to 200 to the nearest hundred."},"CommonError":{"Ar":"طبّق شرط أقرب عشرة فقط.","En":"Uses only the nearest-ten condition."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طبّق شرط أقرب عشرة فقط.","En":"Uses only the nearest-ten condition."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اختار أكبر عدد يحقق الشرطين.","En":"Chooses the largest number satisfying both conditions."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خلط بين العدد الأصلي وناتج التقريب إلى المئة.","En":"Confuses the original number with the rounded hundred."},"Order":4}]}$mw$),
($mw$growth-v16-grade-4-detect-missing-ones-carry-1$mw$,$mw$detect-missing-ones-carry$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"عشرة انتقلت إلى الخانة التالية","En":"The ten that moves to the next place"},"Question":{"Ar":"جمع عمر 268 و157. كتب 5 في الآحاد، لكنه أغفل نقل العشرة من خانة الآحاد إلى خانة العشرات. وأكمل بقية الجمع بالنقل الصحيح. بكم كان ناتجه أقل من المجموع الصحيح؟","En":"Omar adds 268 and 157. He writes 5 in the ones place but forgets to carry the ten from the ones to the tens place. He completes the rest of the addition, including any further carries, correctly. How much smaller is his result than the correct total?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد العشرات المفقودة بدل قيمتها بالآحاد.","En":"Gives the number of missing tens instead of their value in ones."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى رقم الآحاد الذي كُتب.","En":"Reports the written ones digit."}},{"LatexCode":"100","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل النقل من الآحاد على أنه مئة.","En":"Treats the carry from the ones place as one hundred."}}],"Hints":[{"Ar":"فكّر في العدد الذي يُمثِّلُه مجموع 8 و7.","En":"Think about what the sum of 8 and 7 represents."},{"Ar":"ما قيمة العشرة التي لم تدخل في الخانة التالية؟","En":"What is the value of the ten omitted from the next place?"}],"Solution":{"Idea":{"Ar":"قيمة العشرة المنقولة هي عشر وحدات؛ فقدها يغير المجموع بهذا المقدار وحده.","En":"The carried ten represents ten units; omitting it changes the sum by exactly that amount."},"FormulaLatex":"D=(8+7)-5","Steps":[{"Ar":"مجموع الآحاد 15، وفيه آحاد عددها خمسة وعشرة واحدة.","En":"The ones sum to 15, made up of five ones and one ten."},{"Ar":"كتب عمر الآحاد الخمسة ولم يحسب العشرة.","En":"Omar writes the five ones and omits the ten."}],"Substitution":{"Ar":"$15-5=10$","En":"$15-5=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"وحدات","En":"units"},"Verification":{"Ar":"الناتج الصحيح 425، وبترك العشرة يصير 415.","En":"The correct result is 425 and omitting the ten gives 415."},"CommonError":{"Ar":"أعطى عدد العشرات المفقودة بدل قيمتها بالآحاد.","En":"Gives the number of missing tens instead of their value in ones."}}}$mw$::jsonb,$mw$قيمة العشرة المنقولة هي عشر وحدات؛ فقدها يغير المجموع بهذا المقدار وحده.

$D=(8+7)-5$

1. مجموع الآحاد 15، وفيه آحاد عددها خمسة وعشرة واحدة.

2. كتب عمر الآحاد الخمسة ولم يحسب العشرة.

$15-5=10$

$10$ وحدات

الناتج الصحيح 425، وبترك العشرة يصير 415.

أعطى عدد العشرات المفقودة بدل قيمتها بالآحاد.$mw$,$mw$The carried ten represents ten units; omitting it changes the sum by exactly that amount.

$D=(8+7)-5$

1. The ones sum to 15, made up of five ones and one ten.

2. Omar writes the five ones and omits the ten.

$15-5=10$

$10$ units

The correct result is 425 and omitting the ten gives 415.

Gives the number of missing tens instead of their value in ones.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"فكّر في العدد الذي يُمثِّلُه مجموع 8 و7.","En":"Think about what the sum of 8 and 7 represents."},{"Ar":"ما قيمة العشرة التي لم تدخل في الخانة التالية؟","En":"What is the value of the ten omitted from the next place?"}],"Solution":{"Idea":{"Ar":"قيمة العشرة المنقولة هي عشر وحدات؛ فقدها يغير المجموع بهذا المقدار وحده.","En":"The carried ten represents ten units; omitting it changes the sum by exactly that amount."},"FormulaLatex":"D=(8+7)-5","Steps":[{"Ar":"مجموع الآحاد 15، وفيه آحاد عددها خمسة وعشرة واحدة.","En":"The ones sum to 15, made up of five ones and one ten."},{"Ar":"كتب عمر الآحاد الخمسة ولم يحسب العشرة.","En":"Omar writes the five ones and omits the ten."}],"Substitution":{"Ar":"$15-5=10$","En":"$15-5=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"وحدات","En":"units"},"Verification":{"Ar":"الناتج الصحيح 425، وبترك العشرة يصير 415.","En":"The correct result is 425 and omitting the ten gives 415."},"CommonError":{"Ar":"أعطى عدد العشرات المفقودة بدل قيمتها بالآحاد.","En":"Gives the number of missing tens instead of their value in ones."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد العشرات المفقودة بدل قيمتها بالآحاد.","En":"Gives the number of missing tens instead of their value in ones."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى رقم الآحاد الذي كُتب.","En":"Reports the written ones digit."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامل النقل من الآحاد على أنه مئة.","En":"Treats the carry from the ones place as one hundred."},"Order":4}]}$mw$),
($mw$growth-v16-grade-4-equal-fraction-shares-different-wholes-1$mw$,$mw$equal-fraction-shares-different-wholes$mw$,$mw$p-fractions-decimals-fraction-comparisons$mw$,$mw$grade-4$mw$,4,1,21,112,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":112,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"نصيبان من شريطين","En":"Shares of two strips"},"Question":{"Ar":"أخذت هند ثلث شريط طوله 12 سم، وأخذت رنا ربع شريط آخر طوله 20 سم. بكم يزيد طول الجزء الذي أخذته رنا على طول الجزء الذي أخذته هند؟","En":"Hind takes one third of a 12 cm strip, and Rana takes one quarter of a different strip measuring 20 cm. How much longer is Rana’s piece than Hind’s?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أوجد الفرق بين طولي الشريطين الكاملين.","En":"Finds the difference between the full strips."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى طول قطعة رنا بلا طرح.","En":"Reports Rana’s piece without subtracting."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع طولي القطعتين.","En":"Adds the lengths of the two pieces."}}],"Hints":[{"Ar":"للشريطين طولان مختلفان، فاحسب طول كل جزء وحده.","En":"The strips have different lengths. Work out each piece length separately."},{"Ar":"اقسم طول كل شريط على مقام الكسر الخاص به قبل حساب الفرق.","En":"Divide each strip length by its own denominator before taking the difference."}],"Solution":{"Idea":{"Ar":"نحسب كل جزء من الشريط الخاص به قبل المقارنة، لأن الكلين مختلفان.","En":"Calculate each fraction of its own whole before comparing the two lengths."},"FormulaLatex":"D=\\frac{20}{4}-\\frac{12}{3}","Steps":[{"Ar":"ثلث 12 سم يساوي 4 سم.","En":"One third of 12 cm is 4 cm."},{"Ar":"ربع 20 سم يساوي 5 سم، فاحسب الفرق بين الطولين.","En":"One quarter of 20 cm is 5 cm. Find the difference between the lengths."},{"Ar":"اطرح طول الجزء الأقصر من الأطول: $5-4=1$.","En":"Subtract the shorter piece from the longer one: $5-4=1$."}],"Substitution":{"Ar":"$5-4=1$","En":"$5-4=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"ثلاث قطع طولها 4 سم تملأ الشريط الأول، وأربع قطع طولها 5 سم تملأ الثاني.","En":"Three pieces of 4 cm fill the first strip and four pieces of 5 cm fill the second."},"CommonError":{"Ar":"أوجد الفرق بين طولي الشريطين الكاملين.","En":"Finds the difference between the full strips."}}}$mw$::jsonb,$mw$نحسب كل جزء من الشريط الخاص به قبل المقارنة، لأن الكلين مختلفان.

$D=\frac{20}{4}-\frac{12}{3}$

1. ثلث 12 سم يساوي 4 سم.

2. ربع 20 سم يساوي 5 سم، فاحسب الفرق بين الطولين.

3. اطرح طول الجزء الأقصر من الأطول: $5-4=1$.

$5-4=1$

$1$ سم

ثلاث قطع طولها 4 سم تملأ الشريط الأول، وأربع قطع طولها 5 سم تملأ الثاني.

أوجد الفرق بين طولي الشريطين الكاملين.$mw$,$mw$Calculate each fraction of its own whole before comparing the two lengths.

$D=\frac{20}{4}-\frac{12}{3}$

1. One third of 12 cm is 4 cm.

2. One quarter of 20 cm is 5 cm. Find the difference between the lengths.

3. Subtract the shorter piece from the longer one: $5-4=1$.

$5-4=1$

$1$ cm

Three pieces of 4 cm fill the first strip and four pieces of 5 cm fill the second.

Finds the difference between the full strips.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"للشريطين طولان مختلفان، فاحسب طول كل جزء وحده.","En":"The strips have different lengths. Work out each piece length separately."},{"Ar":"اقسم طول كل شريط على مقام الكسر الخاص به قبل حساب الفرق.","En":"Divide each strip length by its own denominator before taking the difference."}],"Solution":{"Idea":{"Ar":"نحسب كل جزء من الشريط الخاص به قبل المقارنة، لأن الكلين مختلفان.","En":"Calculate each fraction of its own whole before comparing the two lengths."},"FormulaLatex":"D=\\frac{20}{4}-\\frac{12}{3}","Steps":[{"Ar":"ثلث 12 سم يساوي 4 سم.","En":"One third of 12 cm is 4 cm."},{"Ar":"ربع 20 سم يساوي 5 سم، فاحسب الفرق بين الطولين.","En":"One quarter of 20 cm is 5 cm. Find the difference between the lengths."},{"Ar":"اطرح طول الجزء الأقصر من الأطول: $5-4=1$.","En":"Subtract the shorter piece from the longer one: $5-4=1$."}],"Substitution":{"Ar":"$5-4=1$","En":"$5-4=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"ثلاث قطع طولها 4 سم تملأ الشريط الأول، وأربع قطع طولها 5 سم تملأ الثاني.","En":"Three pieces of 4 cm fill the first strip and four pieces of 5 cm fill the second."},"CommonError":{"Ar":"أوجد الفرق بين طولي الشريطين الكاملين.","En":"Finds the difference between the full strips."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أوجد الفرق بين طولي الشريطين الكاملين.","En":"Finds the difference between the full strips."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى طول قطعة رنا بلا طرح.","En":"Reports Rana’s piece without subtracting."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع طولي القطعتين.","En":"Adds the lengths of the two pieces."},"Order":4}]}$mw$),
($mw$growth-v16-grade-4-stacks-with-aisle-in-each-layer-1$mw$,$mw$stacks-with-aisle-in-each-layer$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-4$mw$,4,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"رفوف ذات فراغ ثابت","En":"Shelves with a fixed gap"},"Question":{"Ar":"على كل واحد من أربعة رفوف ستة مواضع للعلب في صف واحد. يُترك الموضعان الأوسطان شاغرين في كل رف ليمر سلك. توضع علبة واحدة في كل موضع آخر. كم علبة توضع؟","En":"Each of four shelves has six positions for cans in one row. The middle two positions on every shelf are left empty for a cable. One can is placed in each other position. How many cans are placed?"},"Options":[{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب المواضع كلها.","En":"Counts every position."}},{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ترك موضعين فارغين مرة واحدة فقط.","En":"Leaves two positions empty just once."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ المواضع الفارغة.","En":"Counts the empty positions."}},{"LatexCode":"16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب عدد المواضع التي تستقبل العلب في رف واحد.","En":"Find how many positions accept cans on one shelf."},{"Ar":"اضرب عدد العلب في الرف الواحد بعدد الرفوف.","En":"Multiply the cans on one shelf by the number of shelves."}],"Solution":{"Idea":{"Ar":"نطرح الفراغات من كل رف، ثم نضرب عدد المواضع المشغولة في عدد الرفوف.","En":"Subtract empty spaces from each shelf, then multiply the occupied positions by the number of shelves."},"FormulaLatex":"N=r(p-g)","Steps":[{"Ar":"يُترك موضعان من الستة في كل رف، فتشغَل العلب أربعة مواضع.","En":"Two of six positions on each shelf are left empty, so cans fill four."},{"Ar":"لكل رف العدد نفسه من العلب، وفي المجموع أربعة رفوف.","En":"All four shelves have the same count of cans."}],"Substitution":{"Ar":"$4(6-2)=16$","En":"$4(6-2)=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"علبة","En":"cans"},"Verification":{"Ar":"المواضع 24 في كل الرفوف، منها ثمانية فارغة؛ فيبقى 16.","En":"There are 24 positions overall, eight of them empty, leaving 16."},"CommonError":{"Ar":"حسب المواضع كلها.","En":"Counts every position."}}}$mw$::jsonb,$mw$نطرح الفراغات من كل رف، ثم نضرب عدد المواضع المشغولة في عدد الرفوف.

$N=r(p-g)$

1. يُترك موضعان من الستة في كل رف، فتشغَل العلب أربعة مواضع.

2. لكل رف العدد نفسه من العلب، وفي المجموع أربعة رفوف.

$4(6-2)=16$

$16$ علبة

المواضع 24 في كل الرفوف، منها ثمانية فارغة؛ فيبقى 16.

حسب المواضع كلها.$mw$,$mw$Subtract empty spaces from each shelf, then multiply the occupied positions by the number of shelves.

$N=r(p-g)$

1. Two of six positions on each shelf are left empty, so cans fill four.

2. All four shelves have the same count of cans.

$4(6-2)=16$

$16$ cans

There are 24 positions overall, eight of them empty, leaving 16.

Counts every position.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"احسب عدد المواضع التي تستقبل العلب في رف واحد.","En":"Find how many positions accept cans on one shelf."},{"Ar":"اضرب عدد العلب في الرف الواحد بعدد الرفوف.","En":"Multiply the cans on one shelf by the number of shelves."}],"Solution":{"Idea":{"Ar":"نطرح الفراغات من كل رف، ثم نضرب عدد المواضع المشغولة في عدد الرفوف.","En":"Subtract empty spaces from each shelf, then multiply the occupied positions by the number of shelves."},"FormulaLatex":"N=r(p-g)","Steps":[{"Ar":"يُترك موضعان من الستة في كل رف، فتشغَل العلب أربعة مواضع.","En":"Two of six positions on each shelf are left empty, so cans fill four."},{"Ar":"لكل رف العدد نفسه من العلب، وفي المجموع أربعة رفوف.","En":"All four shelves have the same count of cans."}],"Substitution":{"Ar":"$4(6-2)=16$","En":"$4(6-2)=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"علبة","En":"cans"},"Verification":{"Ar":"المواضع 24 في كل الرفوف، منها ثمانية فارغة؛ فيبقى 16.","En":"There are 24 positions overall, eight of them empty, leaving 16."},"CommonError":{"Ar":"حسب المواضع كلها.","En":"Counts every position."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب المواضع كلها.","En":"Counts every position."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ترك موضعين فارغين مرة واحدة فقط.","En":"Leaves two positions empty just once."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدّ المواضع الفارغة.","En":"Counts the empty positions."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v16-grade-5-adjacent-hundredths-on-opposite-sides-1$mw$,$mw$adjacent-hundredths-on-opposite-sides$mw$,$mw$p-fractions-decimals-decimal-place-value$mw$,$mw$grade-5$mw$,5,1,21,94,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":94,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أقرب تدريجين بالمئة","En":"The adjacent hundredth marks"},"Question":{"Ar":"تقع علامتان متتاليتان من أجزاء المئة على جانبي العدد 2.078. ما مجموع العددين عند العلامتين؟","En":"Two consecutive hundredth marks straddle 2.078 on a number line. What is the sum of the two marks?"},"Options":[{"LatexCode":"4.15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4.16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل التقريب إلى 2.08 مرتين.","En":"Uses the rounded value 2.08 twice."}},{"LatexCode":"4.14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل العلامة اليسرى مرتين.","En":"Uses the lower mark twice."}},{"LatexCode":"5.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب 0.07 و0.08 كأنهما 0.7 و0.8.","En":"Reads 0.07 and 0.08 as 0.7 and 0.8."}}],"Hints":[{"Ar":"جد آخر علامة لجزء من مئة قبل العدد.","En":"Find the last hundredth mark before the number."},{"Ar":"تحرّك جزءاً من مئة إلى اليمين من تلك العلامة، ثم اجمع العلامتين.","En":"Move one hundredth right from that mark, then add the two marks."}],"Solution":{"Idea":{"Ar":"نحصر العدد بين علامتي جزأين متتاليين من مئة، ثم نجمع قيمتيهما.","En":"Bracket the number between adjacent hundredth marks, then add the two values."},"FormulaLatex":"a<2.078<a+0.01","Steps":[{"Ar":"يقع العدد بين 2.070 و2.080.","En":"The number lies between 2.070 and 2.080."},{"Ar":"العلامتان هما 2.07 و2.08. نجمع الآحاد وأجزاء المئة.","En":"The marks are 2.07 and 2.08. Add the ones and hundredths."}],"Substitution":{"Ar":"$2.07+2.08=4.15$","En":"$2.07+2.08=4.15$"},"Result":{"Ar":"$4.15$","En":"$4.15$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"الفاصل 0.01، والعدد يبعد 0.008 عن العلامة الأولى و0.002 عن الثانية.","En":"The marks are 0.01 apart. The number is 0.008 above the first mark and 0.002 below the second."},"CommonError":{"Ar":"استعمل التقريب إلى 2.08 مرتين.","En":"Uses the rounded value 2.08 twice."}}}$mw$::jsonb,$mw$نحصر العدد بين علامتي جزأين متتاليين من مئة، ثم نجمع قيمتيهما.

$a<2.078<a+0.01$

1. يقع العدد بين 2.070 و2.080.

2. العلامتان هما 2.07 و2.08. نجمع الآحاد وأجزاء المئة.

$2.07+2.08=4.15$

$4.15$ دون وحدة

الفاصل 0.01، والعدد يبعد 0.008 عن العلامة الأولى و0.002 عن الثانية.

استعمل التقريب إلى 2.08 مرتين.$mw$,$mw$Bracket the number between adjacent hundredth marks, then add the two values.

$a<2.078<a+0.01$

1. The number lies between 2.070 and 2.080.

2. The marks are 2.07 and 2.08. Add the ones and hundredths.

$2.07+2.08=4.15$

$4.15$ unitless

The marks are 0.01 apart. The number is 0.008 above the first mark and 0.002 below the second.

Uses the rounded value 2.08 twice.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"جد آخر علامة لجزء من مئة قبل العدد.","En":"Find the last hundredth mark before the number."},{"Ar":"تحرّك جزءاً من مئة إلى اليمين من تلك العلامة، ثم اجمع العلامتين.","En":"Move one hundredth right from that mark, then add the two marks."}],"Solution":{"Idea":{"Ar":"نحصر العدد بين علامتي جزأين متتاليين من مئة، ثم نجمع قيمتيهما.","En":"Bracket the number between adjacent hundredth marks, then add the two values."},"FormulaLatex":"a<2.078<a+0.01","Steps":[{"Ar":"يقع العدد بين 2.070 و2.080.","En":"The number lies between 2.070 and 2.080."},{"Ar":"العلامتان هما 2.07 و2.08. نجمع الآحاد وأجزاء المئة.","En":"The marks are 2.07 and 2.08. Add the ones and hundredths."}],"Substitution":{"Ar":"$2.07+2.08=4.15$","En":"$2.07+2.08=4.15$"},"Result":{"Ar":"$4.15$","En":"$4.15$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"الفاصل 0.01، والعدد يبعد 0.008 عن العلامة الأولى و0.002 عن الثانية.","En":"The marks are 0.01 apart. The number is 0.008 above the first mark and 0.002 below the second."},"CommonError":{"Ar":"استعمل التقريب إلى 2.08 مرتين.","En":"Uses the rounded value 2.08 twice."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل التقريب إلى 2.08 مرتين.","En":"Uses the rounded value 2.08 twice."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل العلامة اليسرى مرتين.","En":"Uses the lower mark twice."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب 0.07 و0.08 كأنهما 0.7 و0.8.","En":"Reads 0.07 and 0.08 as 0.7 and 0.8."},"Order":4}]}$mw$),
($mw$growth-v16-grade-6-percentage-of-original-after-rejects-recovered-1$mw$,$mw$percentage-of-original-after-rejects-recovered$mw$,$mw$p-fractions-decimals-basic-percentages$mw$,$mw$grade-6$mw$,6,1,21,93,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":93,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"قطع نجحت بعد الإصلاح","En":"Pieces passing after repair"},"Question":{"Ar":"اجتاز 80% من قطع دفعة اختباراً أولياً. بعد الإصلاح، اجتاز نصف القطع التي رسبت في المرة الأولى. ما النسبة المئوية لكل القطع التي اجتازت الاختبار في إحدى المرتين؟","En":"Eighty percent of a batch of pieces passes an initial test. After repair, half the pieces that originally failed pass the test. What percentage of all pieces passed on either attempt?"},"Options":[{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الناجحة في البداية فقط.","En":"Counts only initial passes."}},{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل نسبة نجاح الإصلاح كنسبة من كامل الدفعة.","En":"Treats the repair pass rate as a share of the whole batch."}},{"LatexCode":"90","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"85","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ ربع الراسبة بدلاً من نصفها.","En":"Recovers a quarter of the initial failures instead of half."}}],"Hints":[{"Ar":"تخيّل أن الدفعة تضم مئة قطعة.","En":"Imagine there are 100 pieces in the batch."},{"Ar":"احسب عدد القطع التي رسبت أولاً، ثم خذ نصف هذا العدد.","En":"Find how many initially failed, then take half of that count."}],"Solution":{"Idea":{"Ar":"نسبة الإصلاح تخص القطع الراسبة وحدها؛ نحولها إلى نسبة من الدفعة الأصلية قبل الجمع.","En":"The repair proportion refers only to initially failed pieces; convert it to a proportion of the original batch before adding."},"FormulaLatex":"p_{\\mathrm{pass}}=p+\\frac{1-p}{2},\\quad 0\\le p\\le1","Steps":[{"Ar":"رسبت 20 قطعة من كل مئة أولاً.","En":"Initially 20 pieces out of every 100 fail."},{"Ar":"نجحت 10 منها بعد الإصلاح، فأضيفت إلى القطع الثمانين التي نجحت أولاً.","En":"Ten of those pass after repair, joining the 80 that passed first."}],"Substitution":{"Ar":"$0.80+\\frac{0.20}{2}=0.90=90\\%$","En":"$0.80+\\frac{0.20}{2}=0.90=90\\%$"},"Result":{"Ar":"$90$","En":"$90$"},"Unit":{"Ar":"بالمئة","En":"percent"},"Verification":{"Ar":"بقيت 10 قطع راسبة من كل مئة، فتكون النسبة المكملة 90%.","En":"Ten pieces per hundred still fail, leaving 90 percent passing."},"CommonError":{"Ar":"حسب الناجحة في البداية فقط.","En":"Counts only initial passes."}}}$mw$::jsonb,$mw$نسبة الإصلاح تخص القطع الراسبة وحدها؛ نحولها إلى نسبة من الدفعة الأصلية قبل الجمع.

$p_{\mathrm{pass}}=p+\frac{1-p}{2},\quad 0\le p\le1$

1. رسبت 20 قطعة من كل مئة أولاً.

2. نجحت 10 منها بعد الإصلاح، فأضيفت إلى القطع الثمانين التي نجحت أولاً.

$0.80+\frac{0.20}{2}=0.90=90\%$

$90$ بالمئة

بقيت 10 قطع راسبة من كل مئة، فتكون النسبة المكملة 90%.

حسب الناجحة في البداية فقط.$mw$,$mw$The repair proportion refers only to initially failed pieces; convert it to a proportion of the original batch before adding.

$p_{\mathrm{pass}}=p+\frac{1-p}{2},\quad 0\le p\le1$

1. Initially 20 pieces out of every 100 fail.

2. Ten of those pass after repair, joining the 80 that passed first.

$0.80+\frac{0.20}{2}=0.90=90\%$

$90$ percent

Ten pieces per hundred still fail, leaving 90 percent passing.

Counts only initial passes.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"تخيّل أن الدفعة تضم مئة قطعة.","En":"Imagine there are 100 pieces in the batch."},{"Ar":"احسب عدد القطع التي رسبت أولاً، ثم خذ نصف هذا العدد.","En":"Find how many initially failed, then take half of that count."}],"Solution":{"Idea":{"Ar":"نسبة الإصلاح تخص القطع الراسبة وحدها؛ نحولها إلى نسبة من الدفعة الأصلية قبل الجمع.","En":"The repair proportion refers only to initially failed pieces; convert it to a proportion of the original batch before adding."},"FormulaLatex":"p_{\\mathrm{pass}}=p+\\frac{1-p}{2},\\quad 0\\le p\\le1","Steps":[{"Ar":"رسبت 20 قطعة من كل مئة أولاً.","En":"Initially 20 pieces out of every 100 fail."},{"Ar":"نجحت 10 منها بعد الإصلاح، فأضيفت إلى القطع الثمانين التي نجحت أولاً.","En":"Ten of those pass after repair, joining the 80 that passed first."}],"Substitution":{"Ar":"$0.80+\\frac{0.20}{2}=0.90=90\\%$","En":"$0.80+\\frac{0.20}{2}=0.90=90\\%$"},"Result":{"Ar":"$90$","En":"$90$"},"Unit":{"Ar":"بالمئة","En":"percent"},"Verification":{"Ar":"بقيت 10 قطع راسبة من كل مئة، فتكون النسبة المكملة 90%.","En":"Ten pieces per hundred still fail, leaving 90 percent passing."},"CommonError":{"Ar":"حسب الناجحة في البداية فقط.","En":"Counts only initial passes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب الناجحة في البداية فقط.","En":"Counts only initial passes."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل نسبة نجاح الإصلاح كنسبة من كامل الدفعة.","En":"Treats the repair pass rate as a share of the whole batch."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أخذ ربع الراسبة بدلاً من نصفها.","En":"Recovers a quarter of the initial failures instead of half."},"Order":4}]}$mw$),
($mw$growth-v16-grade-7-recover-rate-from-equal-time-mixed-work-1$mw$,$mw$recover-rate-from-equal-time-mixed-work$mw$,$mw$middle-unit-rates$mw$,$mw$grade-7$mw$,7,2,7,31,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":31,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"سرعة آلة في مناوبتين متساويتين","En":"Machine rate in equal work periods"},"Question":{"Ar":"عبّأت آلتان 84 صندوقاً. عملت الأولى وحدها مدة 6 دقائق ثم عملت الثانية وحدها مدة 6 دقائق. تعبّئ الأولى 5 صناديق في الدقيقة. كم صندوقاً تعبّئ الثانية في الدقيقة؟","En":"Two machines pack 84 boxes altogether. The first works alone for 6 minutes, then the second works alone for 6 minutes. The first packs 5 boxes per minute. How many boxes per minute does the second pack?"},"Options":[{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع معدلي الآلتين.","En":"Gives the sum of the two rates."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المعدل المتوسط على 12 دقيقة.","En":"Gives the average rate across 12 minutes."}},{"LatexCode":"54","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع ما عبأته الثانية.","En":"Gives the second machine’s total output."}}],"Hints":[{"Ar":"أوجد عدد الصناديق التي عبأتها الآلة الأولى.","En":"Find the number of boxes packed by the first machine."},{"Ar":"اطرح ذلك العدد من الإجمالي، ثم اقسم الباقي على دقائق عمل الآلة الثانية.","En":"Subtract that count from the total, then divide the remainder by the second machine’s work time."}],"Solution":{"Idea":{"Ar":"نستخرج إنتاج الآلة الثانية من الإجمالي بعد طرح إنتاج الأولى، ثم نقسم على زمنها.","En":"Find the second machine's output by subtracting the first machine's output, then divide by its working time."},"FormulaLatex":"N=t(r_1+r_2)","Steps":[{"Ar":"عبأت الأولى 30 صندوقاً.","En":"The first machine packs 30 boxes."},{"Ar":"تبقّى 54 صندوقاً عبأتها الثانية في 6 دقائق.","En":"The second machine packs the remaining 54 boxes in 6 minutes."}],"Substitution":{"Ar":"$(84-30)/6=9$","En":"$(84-30)/6=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"صناديق في الدقيقة","En":"boxes per minute"},"Verification":{"Ar":"في كل دقيقة عمل من الدقائق الست يُقابل 5 صناديق من الأولى و9 من الثانية، أي 84 صندوقاً في المجموع.","En":"Each minute of the two equal work periods contributes 5 and 9 boxes respectively, totaling 84."},"CommonError":{"Ar":"أعطى مجموع معدلي الآلتين.","En":"Gives the sum of the two rates."}}}$mw$::jsonb,$mw$نستخرج إنتاج الآلة الثانية من الإجمالي بعد طرح إنتاج الأولى، ثم نقسم على زمنها.

$N=t(r_1+r_2)$

1. عبأت الأولى 30 صندوقاً.

2. تبقّى 54 صندوقاً عبأتها الثانية في 6 دقائق.

$(84-30)/6=9$

$9$ صناديق في الدقيقة

في كل دقيقة عمل من الدقائق الست يُقابل 5 صناديق من الأولى و9 من الثانية، أي 84 صندوقاً في المجموع.

أعطى مجموع معدلي الآلتين.$mw$,$mw$Find the second machine's output by subtracting the first machine's output, then divide by its working time.

$N=t(r_1+r_2)$

1. The first machine packs 30 boxes.

2. The second machine packs the remaining 54 boxes in 6 minutes.

$(84-30)/6=9$

$9$ boxes per minute

Each minute of the two equal work periods contributes 5 and 9 boxes respectively, totaling 84.

Gives the sum of the two rates.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"أوجد عدد الصناديق التي عبأتها الآلة الأولى.","En":"Find the number of boxes packed by the first machine."},{"Ar":"اطرح ذلك العدد من الإجمالي، ثم اقسم الباقي على دقائق عمل الآلة الثانية.","En":"Subtract that count from the total, then divide the remainder by the second machine’s work time."}],"Solution":{"Idea":{"Ar":"نستخرج إنتاج الآلة الثانية من الإجمالي بعد طرح إنتاج الأولى، ثم نقسم على زمنها.","En":"Find the second machine's output by subtracting the first machine's output, then divide by its working time."},"FormulaLatex":"N=t(r_1+r_2)","Steps":[{"Ar":"عبأت الأولى 30 صندوقاً.","En":"The first machine packs 30 boxes."},{"Ar":"تبقّى 54 صندوقاً عبأتها الثانية في 6 دقائق.","En":"The second machine packs the remaining 54 boxes in 6 minutes."}],"Substitution":{"Ar":"$(84-30)/6=9$","En":"$(84-30)/6=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"صناديق في الدقيقة","En":"boxes per minute"},"Verification":{"Ar":"في كل دقيقة عمل من الدقائق الست يُقابل 5 صناديق من الأولى و9 من الثانية، أي 84 صندوقاً في المجموع.","En":"Each minute of the two equal work periods contributes 5 and 9 boxes respectively, totaling 84."},"CommonError":{"Ar":"أعطى مجموع معدلي الآلتين.","En":"Gives the sum of the two rates."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع معدلي الآلتين.","En":"Gives the sum of the two rates."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى المعدل المتوسط على 12 دقيقة.","En":"Gives the average rate across 12 minutes."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع ما عبأته الثانية.","En":"Gives the second machine’s total output."},"Order":4}]}$mw$),
($mw$growth-v16-grade-8-missing-factor-in-difference-of-same-base-powers-1$mw$,$mw$missing-factor-in-difference-of-same-base-powers$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"استخراج قوة مشتركة","En":"Factoring out a common power"},"Question":{"Ar":"إذا كان $3^8-3^6=k\\times3^6$، فما قيمة $k$؟","En":"If $3^8-3^6=k\\times3^6$, what is $k$?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بسّط الحد الأول وأهمل طرح 1.","En":"Simplifies the first term and omits subtracting 1."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى فرق الأسّين.","En":"Reports the difference of the exponents."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قرأ 3² على أنها 3 × 2.","En":"Reads 3² as 3 × 2."}}],"Hints":[{"Ar":"اقسم الطرفين على 3⁶.","En":"Divide both sides by 3⁶."},{"Ar":"طبّق قاعدة قسمة قوتين بالأساس نفسه على الحد الأول فقط، ثم بسّط الحد الآخر.","En":"Apply the same-base quotient rule to the first term, then simplify the other term separately."}],"Solution":{"Idea":{"Ar":"نستخرج القوة المشتركة عاملاً من الحدين، ثم نوجد المعامل المتبقي.","En":"Factor out the common power from both terms, then find the remaining coefficient."},"FormulaLatex":"a^m-a^n=a^n(a^{m-n}-1),\\quad a\\ne0","Steps":[{"Ar":"يساوي خارج قسمة 3⁸ على 3⁶ القوة 3².","En":"The quotient of 3⁸ and 3⁶ is 3²."},{"Ar":"خارج قسمة 3⁶ على نفسه يساوي 1، فنطرح 1 من 9.","En":"Dividing 3⁶ by itself gives 1, so subtract 1 from 9."}],"Substitution":{"Ar":"$3^2-1=8$","En":"$3^2-1=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"ضرب 8 في 729 يعطي 5832، وهو فرق 6561 و729.","En":"Multiplying 8 by 729 gives 5832, which equals 6561 minus 729."},"CommonError":{"Ar":"بسّط الحد الأول وأهمل طرح 1.","En":"Simplifies the first term and omits subtracting 1."}}}$mw$::jsonb,$mw$نستخرج القوة المشتركة عاملاً من الحدين، ثم نوجد المعامل المتبقي.

$a^m-a^n=a^n(a^{m-n}-1),\quad a\ne0$

1. يساوي خارج قسمة 3⁸ على 3⁶ القوة 3².

2. خارج قسمة 3⁶ على نفسه يساوي 1، فنطرح 1 من 9.

$3^2-1=8$

$8$ دون وحدة

ضرب 8 في 729 يعطي 5832، وهو فرق 6561 و729.

بسّط الحد الأول وأهمل طرح 1.$mw$,$mw$Factor out the common power from both terms, then find the remaining coefficient.

$a^m-a^n=a^n(a^{m-n}-1),\quad a\ne0$

1. The quotient of 3⁸ and 3⁶ is 3².

2. Dividing 3⁶ by itself gives 1, so subtract 1 from 9.

$3^2-1=8$

$8$ unitless

Multiplying 8 by 729 gives 5832, which equals 6561 minus 729.

Simplifies the first term and omits subtracting 1.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"اقسم الطرفين على 3⁶.","En":"Divide both sides by 3⁶."},{"Ar":"طبّق قاعدة قسمة قوتين بالأساس نفسه على الحد الأول فقط، ثم بسّط الحد الآخر.","En":"Apply the same-base quotient rule to the first term, then simplify the other term separately."}],"Solution":{"Idea":{"Ar":"نستخرج القوة المشتركة عاملاً من الحدين، ثم نوجد المعامل المتبقي.","En":"Factor out the common power from both terms, then find the remaining coefficient."},"FormulaLatex":"a^m-a^n=a^n(a^{m-n}-1),\\quad a\\ne0","Steps":[{"Ar":"يساوي خارج قسمة 3⁸ على 3⁶ القوة 3².","En":"The quotient of 3⁸ and 3⁶ is 3²."},{"Ar":"خارج قسمة 3⁶ على نفسه يساوي 1، فنطرح 1 من 9.","En":"Dividing 3⁶ by itself gives 1, so subtract 1 from 9."}],"Substitution":{"Ar":"$3^2-1=8$","En":"$3^2-1=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"ضرب 8 في 729 يعطي 5832، وهو فرق 6561 و729.","En":"Multiplying 8 by 729 gives 5832, which equals 6561 minus 729."},"CommonError":{"Ar":"بسّط الحد الأول وأهمل طرح 1.","En":"Simplifies the first term and omits subtracting 1."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"بسّط الحد الأول وأهمل طرح 1.","En":"Simplifies the first term and omits subtracting 1."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى فرق الأسّين.","En":"Reports the difference of the exponents."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قرأ 3² على أنها 3 × 2.","En":"Reads 3² as 3 × 2."},"Order":4}]}$mw$),
($mw$growth-v16-grade-9-box-corner-two-pythagorean-steps-1$mw$,$mw$box-corner-two-pythagorean-steps$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"بين ركنين في صندوق","En":"Between opposite corners of a box"},"Question":{"Ar":"أبعاد صندوق مستطيل 3 سم و4 سم و12 سم. ما طول القطعة المستقيمة التي تصل بين ركنين متقابلين عبر داخل الصندوق؟","En":"A rectangular box measures 3 cm by 4 cm by 12 cm. What is the length of the straight segment joining opposite corners through its interior?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى قطر الوجه الصغير فقط.","En":"Reports only the small face diagonal."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى أطول حرف للصندوق.","En":"Reports the longest edge of the box."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع ضلعَي المثلث الثاني دون تطبيق فيثاغورس.","En":"Adds the legs of the second triangle directly."}}],"Hints":[{"Ar":"ارسم أولاً القطر على الوجه ذي البعدين 3 و4.","En":"First draw the diagonal of the 3-by-4 face."},{"Ar":"قطر الوجه والارتفاع يشكلان ضلعي مثلث قائم داخل الصندوق.","En":"The face diagonal and the height form the legs of a right triangle inside the box."}],"Solution":{"Idea":{"Ar":"نستعمل فيثاغورس مرتين: على وجه الصندوق ثم على المثلث القائم داخل الصندوق.","En":"Apply Pythagoras twice: on the box face and then on the right triangle inside the box."},"FormulaLatex":"d^2=(a^2+b^2)+c^2","Steps":[{"Ar":"قطر الوجه الأول يساوي جذر مجموع 9 و16، أي 5 سم.","En":"The first face diagonal is the square root of 9+16, or 5 cm."},{"Ar":"قطر الصندوق هو الوتر للمثلث الذي ضلعاه 5 و12 سم.","En":"The box diagonal is the hypotenuse with legs 5 cm and 12 cm."}],"Substitution":{"Ar":"$\\sqrt{25+144}=13$","En":"$\\sqrt{25+144}=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"مربع 13 هو 169 ويساوي 9+16+144.","En":"Squaring 13 gives 169, equal to 9+16+144."},"CommonError":{"Ar":"أعطى قطر الوجه الصغير فقط.","En":"Reports only the small face diagonal."}}}$mw$::jsonb,$mw$نستعمل فيثاغورس مرتين: على وجه الصندوق ثم على المثلث القائم داخل الصندوق.

$d^2=(a^2+b^2)+c^2$

1. قطر الوجه الأول يساوي جذر مجموع 9 و16، أي 5 سم.

2. قطر الصندوق هو الوتر للمثلث الذي ضلعاه 5 و12 سم.

$\sqrt{25+144}=13$

$13$ سم

مربع 13 هو 169 ويساوي 9+16+144.

أعطى قطر الوجه الصغير فقط.$mw$,$mw$Apply Pythagoras twice: on the box face and then on the right triangle inside the box.

$d^2=(a^2+b^2)+c^2$

1. The first face diagonal is the square root of 9+16, or 5 cm.

2. The box diagonal is the hypotenuse with legs 5 cm and 12 cm.

$\sqrt{25+144}=13$

$13$ cm

Squaring 13 gives 169, equal to 9+16+144.

Reports only the small face diagonal.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"ارسم أولاً القطر على الوجه ذي البعدين 3 و4.","En":"First draw the diagonal of the 3-by-4 face."},{"Ar":"قطر الوجه والارتفاع يشكلان ضلعي مثلث قائم داخل الصندوق.","En":"The face diagonal and the height form the legs of a right triangle inside the box."}],"Solution":{"Idea":{"Ar":"نستعمل فيثاغورس مرتين: على وجه الصندوق ثم على المثلث القائم داخل الصندوق.","En":"Apply Pythagoras twice: on the box face and then on the right triangle inside the box."},"FormulaLatex":"d^2=(a^2+b^2)+c^2","Steps":[{"Ar":"قطر الوجه الأول يساوي جذر مجموع 9 و16، أي 5 سم.","En":"The first face diagonal is the square root of 9+16, or 5 cm."},{"Ar":"قطر الصندوق هو الوتر للمثلث الذي ضلعاه 5 و12 سم.","En":"The box diagonal is the hypotenuse with legs 5 cm and 12 cm."}],"Substitution":{"Ar":"$\\sqrt{25+144}=13$","En":"$\\sqrt{25+144}=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"مربع 13 هو 169 ويساوي 9+16+144.","En":"Squaring 13 gives 169, equal to 9+16+144."},"CommonError":{"Ar":"أعطى قطر الوجه الصغير فقط.","En":"Reports only the small face diagonal."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى قطر الوجه الصغير فقط.","En":"Reports only the small face diagonal."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى أطول حرف للصندوق.","En":"Reports the longest edge of the box."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع ضلعَي المثلث الثاني دون تطبيق فيثاغورس.","En":"Adds the legs of the second triangle directly."},"Order":4}]}$mw$),
($mw$growth-v16-grade-11-equal-slopes-at-two-points-1$mw$,$mw$equal-slopes-at-two-points$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"مماسان متساويا الميل","En":"Two tangents with matching slopes"},"Question":{"Ar":"لتكن $f(x)=x^3+ax^2$. للمماسين عند $x=1$ و$x=3$ الميل نفسه. ما قيمة $a$؟","En":"Let $f(x)=x^3+ax^2$. The tangents at $x=1$ and $x=3$ have the same slope. What is $a$?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"فقد الإشارة عند القسمة على −4.","En":"Loses the sign when dividing by −4."}},{"LatexCode":"-6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اشتق ax² دون عامل 2.","En":"Differentiates ax² without the factor 2."}},{"LatexCode":"-1.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ساوى ميل المماس الأول بالصفر بدلاً من مساواته بميل المماس الثاني.","En":"Sets the first tangent slope to zero instead of equating it to the second slope."}}],"Hints":[{"Ar":"عبّر عن ميل المماس باستعمال المشتقة.","En":"Write the tangent slope using the derivative."},{"Ar":"أوجد قيم المشتقة عند 1 و3 ثم ساوِ بينهما.","En":"Evaluate the derivative at 1 and 3, then equate them."}],"Solution":{"Idea":{"Ar":"ميل المماس يساوي قيمة المشتقة؛ نساوي قيمتيها عند النقطتين ونحل للمعامل.","En":"The tangent slope equals the derivative value; equate the two values and solve for the coefficient."},"FormulaLatex":"f'(x)=3x^2+2ax","Steps":[{"Ar":"الميل عند 1 هو 3+2a وعند 3 هو 27+6a.","En":"The slope at 1 is 3+2a, and the slope at 3 is 27+6a."},{"Ar":"بمساواة الميلين نحصل على −4a=24.","En":"Equating the slopes gives −4a=24."}],"Substitution":{"Ar":"$3+2a=27+6a\\Rightarrow -4a=24\\Rightarrow a=-6$","En":"$3+2a=27+6a\\Rightarrow -4a=24\\Rightarrow a=-6$"},"Result":{"Ar":"$-6$","En":"$-6$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"عند a=−6 يكون الميل عند 1 وعند 3 هو −9.","En":"At a=−6 the slope is −9 at both 1 and 3."},"CommonError":{"Ar":"فقد الإشارة عند القسمة على −4.","En":"Loses the sign when dividing by −4."}}}$mw$::jsonb,$mw$ميل المماس يساوي قيمة المشتقة؛ نساوي قيمتيها عند النقطتين ونحل للمعامل.

$f'(x)=3x^2+2ax$

1. الميل عند 1 هو 3+2a وعند 3 هو 27+6a.

2. بمساواة الميلين نحصل على −4a=24.

$3+2a=27+6a\Rightarrow -4a=24\Rightarrow a=-6$

$-6$ دون وحدة

عند a=−6 يكون الميل عند 1 وعند 3 هو −9.

فقد الإشارة عند القسمة على −4.$mw$,$mw$The tangent slope equals the derivative value; equate the two values and solve for the coefficient.

$f'(x)=3x^2+2ax$

1. The slope at 1 is 3+2a, and the slope at 3 is 27+6a.

2. Equating the slopes gives −4a=24.

$3+2a=27+6a\Rightarrow -4a=24\Rightarrow a=-6$

$-6$ unitless

At a=−6 the slope is −9 at both 1 and 3.

Loses the sign when dividing by −4.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"عبّر عن ميل المماس باستعمال المشتقة.","En":"Write the tangent slope using the derivative."},{"Ar":"أوجد قيم المشتقة عند 1 و3 ثم ساوِ بينهما.","En":"Evaluate the derivative at 1 and 3, then equate them."}],"Solution":{"Idea":{"Ar":"ميل المماس يساوي قيمة المشتقة؛ نساوي قيمتيها عند النقطتين ونحل للمعامل.","En":"The tangent slope equals the derivative value; equate the two values and solve for the coefficient."},"FormulaLatex":"f'(x)=3x^2+2ax","Steps":[{"Ar":"الميل عند 1 هو 3+2a وعند 3 هو 27+6a.","En":"The slope at 1 is 3+2a, and the slope at 3 is 27+6a."},{"Ar":"بمساواة الميلين نحصل على −4a=24.","En":"Equating the slopes gives −4a=24."}],"Substitution":{"Ar":"$3+2a=27+6a\\Rightarrow -4a=24\\Rightarrow a=-6$","En":"$3+2a=27+6a\\Rightarrow -4a=24\\Rightarrow a=-6$"},"Result":{"Ar":"$-6$","En":"$-6$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"عند a=−6 يكون الميل عند 1 وعند 3 هو −9.","En":"At a=−6 the slope is −9 at both 1 and 3."},"CommonError":{"Ar":"فقد الإشارة عند القسمة على −4.","En":"Loses the sign when dividing by −4."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"فقد الإشارة عند القسمة على −4.","En":"Loses the sign when dividing by −4."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اشتق ax² دون عامل 2.","En":"Differentiates ax² without the factor 2."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ساوى ميل المماس الأول بالصفر بدلاً من مساواته بميل المماس الثاني.","En":"Sets the first tangent slope to zero instead of equating it to the second slope."},"Order":4}]}$mw$);
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND q."WizardJson" IS NOT NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v15/v16/v18 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
