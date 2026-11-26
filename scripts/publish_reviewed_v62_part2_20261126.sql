-- One-time owner-authorized v62 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v62-grade-7-median-two-middle-observations-sum-known-1$mw$,$mw$median-two-middle-observations-sum-known$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-7$mw$,7,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"وسيط من مجموع القيمتين الوسطيتين","En":"Median from the middle pair sum"},"Question":{"Ar":"ست قيم مرتبة ترتيباً غير تناقصي. مجموع القيمتين الثالثة والرابعة يساوي 19. ما الوسيط؟","En":"Six observations are sorted in nondecreasing order. The third and fourth sum to 19. What is the median?"},"Options":[{"LatexCode":"9.5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع لا متوسط القيمتين.","En":"This is the sum, not their average."}},{"LatexCode":"19/6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على جميع القيم بدلاً من اثنتين.","En":"Divides by all six values rather than two."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قرّب دون طلب التقريب.","En":"Rounds without being asked."}}],"Hints":[{"Ar":"حدد موضعي الوسط في ست قيم.","En":"Locate the middle pair among six."},{"Ar":"اقسم مجموعهما على اثنين.","En":"Divide their sum by two."}],"Solution":{"Idea":{"Ar":"عندما يكون عدد القيم زوجياً، الوسيط متوسط القيمتين الوسطيتين.","En":"For an even count, the median is the average of the middle pair."},"FormulaLatex":"M=(x_3+x_4)/2","Steps":[{"Ar":"$19/2=9.5$","En":"$19/2=9.5$"}],"Substitution":{"Ar":"$19/2$","En":"$19/2$"},"Result":{"Ar":"$9.5$","En":"$9.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot9.5=19$","En":"$2\\cdot9.5=19$"},"CommonError":{"Ar":"هذا المجموع لا متوسط القيمتين.","En":"This is the sum, not their average."}}}$mw$::jsonb,$mw$عندما يكون عدد القيم زوجياً، الوسيط متوسط القيمتين الوسطيتين.

$M=(x_3+x_4)/2$

1. $19/2=9.5$

$19/2$

$9.5$

$2\cdot9.5=19$

هذا المجموع لا متوسط القيمتين.$mw$,$mw$For an even count, the median is the average of the middle pair.

$M=(x_3+x_4)/2$

1. $19/2=9.5$

$19/2$

$9.5$

$2\cdot9.5=19$

This is the sum, not their average.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد موضعي الوسط في ست قيم.","En":"Locate the middle pair among six."},{"Ar":"اقسم مجموعهما على اثنين.","En":"Divide their sum by two."}],"Solution":{"Idea":{"Ar":"عندما يكون عدد القيم زوجياً، الوسيط متوسط القيمتين الوسطيتين.","En":"For an even count, the median is the average of the middle pair."},"FormulaLatex":"M=(x_3+x_4)/2","Steps":[{"Ar":"$19/2=9.5$","En":"$19/2=9.5$"}],"Substitution":{"Ar":"$19/2$","En":"$19/2$"},"Result":{"Ar":"$9.5$","En":"$9.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot9.5=19$","En":"$2\\cdot9.5=19$"},"CommonError":{"Ar":"هذا المجموع لا متوسط القيمتين.","En":"This is the sum, not their average."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع لا متوسط القيمتين.","En":"This is the sum, not their average."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم على جميع القيم بدلاً من اثنتين.","En":"Divides by all six values rather than two."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قرّب دون طلب التقريب.","En":"Rounds without being asked."},"Order":4}]}$mw$),
($mw$growth-v62-grade-4-multiplication-recover-missing-digit-partial-product-1$mw$,$mw$multiplication-recover-missing-digit-partial-product$mw$,$mw$primary-multiplication$mw$,$mw$grade-4$mw$,4,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"رقم مفقود في عملية ضرب","En":"Missing digit in multiplication"},"Question":{"Ar":"عدد من رقمين، رقم عشراته 2. حاصل ضربه في 3 يساوي 84. ما رقم آحاده؟","En":"A two-digit number has tens digit 2. Its product with three is 84. What is its ones digit?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"24×3=72.","En":"24×3=72."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"22×3=66.","En":"22×3=66."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"26×3=78.","En":"26×3=78."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اقسم 84 على 3.","En":"Divide eighty-four by three."},{"Ar":"حدد رقم الآحاد في الناتج.","En":"Find the ones digit of the result."}],"Solution":{"Idea":{"Ar":"نسترجع العدد بقسمة 84 على 3 ثم نقرأ رقم الآحاد.","En":"Recover the number by dividing 84 by three, then read its ones digit."},"FormulaLatex":"84/3=28","Steps":[{"Ar":"$28=20+8$","En":"$28=20+8$"}],"Substitution":{"Ar":"$84/3$","En":"$84/3$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$28\\cdot3=84$","En":"$28\\cdot3=84$"},"CommonError":{"Ar":"24×3=72.","En":"24×3=72."}}}$mw$::jsonb,$mw$نسترجع العدد بقسمة 84 على 3 ثم نقرأ رقم الآحاد.

$84/3=28$

1. $28=20+8$

$84/3$

$8$

$28\cdot3=84$

24×3=72.$mw$,$mw$Recover the number by dividing 84 by three, then read its ones digit.

$84/3=28$

1. $28=20+8$

$84/3$

$8$

$28\cdot3=84$

24×3=72.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم 84 على 3.","En":"Divide eighty-four by three."},{"Ar":"حدد رقم الآحاد في الناتج.","En":"Find the ones digit of the result."}],"Solution":{"Idea":{"Ar":"نسترجع العدد بقسمة 84 على 3 ثم نقرأ رقم الآحاد.","En":"Recover the number by dividing 84 by three, then read its ones digit."},"FormulaLatex":"84/3=28","Steps":[{"Ar":"$28=20+8$","En":"$28=20+8$"}],"Substitution":{"Ar":"$84/3$","En":"$84/3$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$28\\cdot3=84$","En":"$28\\cdot3=84$"},"CommonError":{"Ar":"24×3=72.","En":"24×3=72."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"24×3=72.","En":"24×3=72."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"22×3=66.","En":"22×3=66."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"26×3=78.","En":"26×3=78."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v62-grade-4-multiplication-reverse-repeated-delivery-missing-days-1$mw$,$mw$multiplication-reverse-repeated-delivery-missing-days$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-4$mw$,4,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد أيام من مجموع توريدات","En":"Days from repeated deliveries"},"Question":{"Ar":"يصل إلى مكتبة 3 صناديق يومياً، في كل صندوق 8 كتب. بعد عدة أيام وصل 120 كتاباً. كم يوماً استمرت التوريدات؟","En":"A library receives three boxes daily, each containing eight books. After several days it has received 120 books. How many days did deliveries continue?"},"Options":[{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على عدد الصناديق اليومي فقط.","En":"Divides by daily box count only."}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكتب في اليوم الواحد.","En":"This is the daily book count."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على كتب الصندوق فقط.","En":"Divides by books per box only."}}],"Hints":[{"Ar":"كم كتاباً يصل في يوم واحد؟","En":"How many books arrive per day?"},{"Ar":"اقسم 120 على هذا العدد.","En":"Divide 120 by that count."}],"Solution":{"Idea":{"Ar":"نحسب الكتب في اليوم ثم نقسم المجموع عليها.","En":"Calculate books per day and divide the total by that amount."},"FormulaLatex":"d=120/(3\\cdot8)","Steps":[{"Ar":"$3\\cdot8=24$","En":"$3\\cdot8=24$"},{"Ar":"$120/24=5$","En":"$120/24=5$"}],"Substitution":{"Ar":"$120/24$","En":"$120/24$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot3\\cdot8=120$","En":"$5\\cdot3\\cdot8=120$"},"CommonError":{"Ar":"قسم على كتب الصندوق فقط.","En":"Divides by books per box only."}}}$mw$::jsonb,$mw$نحسب الكتب في اليوم ثم نقسم المجموع عليها.

$d=120/(3\cdot8)$

1. $3\cdot8=24$

2. $120/24=5$

$120/24$

$5$

$5\cdot3\cdot8=120$

قسم على كتب الصندوق فقط.$mw$,$mw$Calculate books per day and divide the total by that amount.

$d=120/(3\cdot8)$

1. $3\cdot8=24$

2. $120/24=5$

$120/24$

$5$

$5\cdot3\cdot8=120$

Divides by books per box only.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم كتاباً يصل في يوم واحد؟","En":"How many books arrive per day?"},{"Ar":"اقسم 120 على هذا العدد.","En":"Divide 120 by that count."}],"Solution":{"Idea":{"Ar":"نحسب الكتب في اليوم ثم نقسم المجموع عليها.","En":"Calculate books per day and divide the total by that amount."},"FormulaLatex":"d=120/(3\\cdot8)","Steps":[{"Ar":"$3\\cdot8=24$","En":"$3\\cdot8=24$"},{"Ar":"$120/24=5$","En":"$120/24=5$"}],"Substitution":{"Ar":"$120/24$","En":"$120/24$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot3\\cdot8=120$","En":"$5\\cdot3\\cdot8=120$"},"CommonError":{"Ar":"قسم على كتب الصندوق فقط.","En":"Divides by books per box only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم على عدد الصناديق اليومي فقط.","En":"Divides by daily box count only."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الكتب في اليوم الواحد.","En":"This is the daily book count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم على كتب الصندوق فقط.","En":"Divides by books per box only."},"Order":4}]}$mw$),
($mw$growth-v62-grade-4-fraction-subtraction-cross-whole-borrow-1$mw$,$mw$fraction-subtraction-cross-whole-borrow$mw$,$mw$fraction-operations$mw$,$mw$grade-4$mw$,4,1,21,298,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":298,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طرح كسر عبر الواحد","En":"Subtracting across a whole"},"Question":{"Ar":"لدى ليلى لتران من العصير. سكبت منهما $\\frac58$ لتر. كم لتراً بقي؟","En":"Layla has two litres of juice. She pours out five eighths of a litre. How many litres remain?"},"Options":[{"LatexCode":"\\frac38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح من لتر واحد فقط.","En":"Subtracts from just one litre."}},{"LatexCode":"\\frac{11}8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{13}8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح ثلاثة أثمان بدلاً من خمسة.","En":"Subtracts three eighths instead of five."}},{"LatexCode":"\\frac{21}8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المقدارين بدلاً من طرحهما.","En":"Adds the quantities instead of subtracting."}}],"Hints":[{"Ar":"كم ثمناً في لترين؟","En":"How many eighths are in two litres?"},{"Ar":"اطرح خمسة أثمان من ستة عشر ثمناً.","En":"Subtract five eighths from sixteen eighths."}],"Solution":{"Idea":{"Ar":"نكتب اللترين على صورة ستة عشر ثمناً ونطرح خمسة أثمان.","En":"Express two litres as sixteen eighths and subtract five eighths."},"FormulaLatex":"2-5/8=16/8-5/8","Steps":[{"Ar":"$2=16/8$","En":"$2=16/8$"},{"Ar":"$(16-5)/8=11/8$","En":"$(16-5)/8=11/8$"}],"Substitution":{"Ar":"$16/8-5/8$","En":"$16/8-5/8$"},"Result":{"Ar":"$\\frac{11}8$","En":"$\\frac{11}8$"},"Unit":{"Ar":"لتر","En":"L"},"Verification":{"Ar":"$11/8+5/8=2$","En":"$11/8+5/8=2$"},"CommonError":{"Ar":"لا تطرح الكسر من لتر واحد وتنسى اللتر الآخر.","En":"Do not subtract from one litre and forget the other."}}}$mw$::jsonb,$mw$نكتب اللترين على صورة ستة عشر ثمناً ونطرح خمسة أثمان.

$2-5/8=16/8-5/8$

1. $2=16/8$

2. $(16-5)/8=11/8$

$16/8-5/8$

$\frac{11}8$ لتر

$11/8+5/8=2$

لا تطرح الكسر من لتر واحد وتنسى اللتر الآخر.$mw$,$mw$Express two litres as sixteen eighths and subtract five eighths.

$2-5/8=16/8-5/8$

1. $2=16/8$

2. $(16-5)/8=11/8$

$16/8-5/8$

$\frac{11}8$ L

$11/8+5/8=2$

Do not subtract from one litre and forget the other.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم ثمناً في لترين؟","En":"How many eighths are in two litres?"},{"Ar":"اطرح خمسة أثمان من ستة عشر ثمناً.","En":"Subtract five eighths from sixteen eighths."}],"Solution":{"Idea":{"Ar":"نكتب اللترين على صورة ستة عشر ثمناً ونطرح خمسة أثمان.","En":"Express two litres as sixteen eighths and subtract five eighths."},"FormulaLatex":"2-5/8=16/8-5/8","Steps":[{"Ar":"$2=16/8$","En":"$2=16/8$"},{"Ar":"$(16-5)/8=11/8$","En":"$(16-5)/8=11/8$"}],"Substitution":{"Ar":"$16/8-5/8$","En":"$16/8-5/8$"},"Result":{"Ar":"$\\frac{11}8$","En":"$\\frac{11}8$"},"Unit":{"Ar":"لتر","En":"L"},"Verification":{"Ar":"$11/8+5/8=2$","En":"$11/8+5/8=2$"},"CommonError":{"Ar":"لا تطرح الكسر من لتر واحد وتنسى اللتر الآخر.","En":"Do not subtract from one litre and forget the other."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح من لتر واحد فقط.","En":"Subtracts from just one litre."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح ثلاثة أثمان بدلاً من خمسة.","En":"Subtracts three eighths instead of five."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع المقدارين بدلاً من طرحهما.","En":"Adds the quantities instead of subtracting."},"Order":4}]}$mw$),
($mw$growth-v62-grade-4-fraction-comparison-same-whole-complement-order-1$mw$,$mw$fraction-comparison-same-whole-complement-order$mw$,$mw$p-fractions-decimals-fraction-comparisons$mw$,$mw$grade-4$mw$,4,1,21,112,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":112,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب الأجزاء المتبقية","En":"Ordering remaining fractions"},"Question":{"Ar":"قرأ ثلاثة طلاب نسخاً متطابقة من كتاب. قرأ A مقدار $\\frac23$، وB مقدار $\\frac56$، وC مقدار $\\frac12$. من بقي له أكبر جزء غير مقروء؟ A: الطالب A؛ B: الطالب B؛ C: الطالب C؛ D: متساوون.","En":"Three pupils read identical copies of a book. A reads $\\frac23$, B reads $\\frac56$, and C reads $\\frac12$. Who has the greatest unread fraction? A: pupil A; B: pupil B; C: pupil C; D: all equal."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الباقي ثلث، وهو أصغر من نصف.","En":"One third remains, less than one half."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الباقي سدس، وهو الأصغر.","En":"One sixth remains, the smallest."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الكسور المقروءة مختلفة ولذلك البواقي مختلفة.","En":"The read fractions differ, so the remaining fractions differ."}}],"Hints":[{"Ar":"اطرح كل كسر مقروء من الواحد.","En":"Subtract each read fraction from one."},{"Ar":"قارن الكسور المتبقية.","En":"Compare remaining fractions."}],"Solution":{"Idea":{"Ar":"أصغر جزء مقروء يترك أكبر جزء غير مقروء من الكتاب نفسه.","En":"The smallest read fraction leaves the largest unread fraction of the same book."},"FormulaLatex":"R=1-F","Steps":[{"Ar":"$R_A=1/3$","En":"$R_A=1/3$"},{"Ar":"$R_B=1/6$","En":"$R_B=1/6$"},{"Ar":"$R_C=1/2$","En":"$R_C=1/2$"},{"Ar":"$1/2>1/3>1/6$","En":"$1/2>1/3>1/6$"}],"Substitution":{"Ar":"$R_A=1-2/3,\\quad R_B=1-5/6,\\quad R_C=1-1/2$","En":"$R_A=1-2/3,\\quad R_B=1-5/6,\\quad R_C=1-1/2$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2+1/2=1$","En":"$1/2+1/2=1$"},"CommonError":{"Ar":"المطلوب الجزء غير المقروء وليس الجزء المقروء.","En":"Compare unread, not read, portions."}}}$mw$::jsonb,$mw$أصغر جزء مقروء يترك أكبر جزء غير مقروء من الكتاب نفسه.

$R=1-F$

1. $R_A=1/3$

2. $R_B=1/6$

3. $R_C=1/2$

4. $1/2>1/3>1/6$

$R_A=1-2/3,\quad R_B=1-5/6,\quad R_C=1-1/2$

$C$

$1/2+1/2=1$

المطلوب الجزء غير المقروء وليس الجزء المقروء.$mw$,$mw$The smallest read fraction leaves the largest unread fraction of the same book.

$R=1-F$

1. $R_A=1/3$

2. $R_B=1/6$

3. $R_C=1/2$

4. $1/2>1/3>1/6$

$R_A=1-2/3,\quad R_B=1-5/6,\quad R_C=1-1/2$

$C$

$1/2+1/2=1$

Compare unread, not read, portions.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح كل كسر مقروء من الواحد.","En":"Subtract each read fraction from one."},{"Ar":"قارن الكسور المتبقية.","En":"Compare remaining fractions."}],"Solution":{"Idea":{"Ar":"أصغر جزء مقروء يترك أكبر جزء غير مقروء من الكتاب نفسه.","En":"The smallest read fraction leaves the largest unread fraction of the same book."},"FormulaLatex":"R=1-F","Steps":[{"Ar":"$R_A=1/3$","En":"$R_A=1/3$"},{"Ar":"$R_B=1/6$","En":"$R_B=1/6$"},{"Ar":"$R_C=1/2$","En":"$R_C=1/2$"},{"Ar":"$1/2>1/3>1/6$","En":"$1/2>1/3>1/6$"}],"Substitution":{"Ar":"$R_A=1-2/3,\\quad R_B=1-5/6,\\quad R_C=1-1/2$","En":"$R_A=1-2/3,\\quad R_B=1-5/6,\\quad R_C=1-1/2$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/2+1/2=1$","En":"$1/2+1/2=1$"},"CommonError":{"Ar":"المطلوب الجزء غير المقروء وليس الجزء المقروء.","En":"Compare unread, not read, portions."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الباقي ثلث، وهو أصغر من نصف.","En":"One third remains, less than one half."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الباقي سدس، وهو الأصغر.","En":"One sixth remains, the smallest."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الكسور المقروءة مختلفة ولذلك البواقي مختلفة.","En":"The read fractions differ, so the remaining fractions differ."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v62 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
