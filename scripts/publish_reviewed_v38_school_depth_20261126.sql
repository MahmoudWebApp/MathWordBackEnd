-- One-time owner-authorized v38 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v38-grade-2-skip-count-reverse-find-missing-1$mw$,$mw$skip-count-reverse-find-missing$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عد تنازلي بخطوات ثابتة","En":"Backward skip counting"},"Question":{"Ar":"تبدأ سلسلة الأعداد عند 46 وتنقص 5 في كل خطوة: 46، 41، □، 31. ما العدد المفقود؟","En":"A sequence begins at 46 and decreases by 5 each step: 46, 41, □, 31. What is the missing number?"},"Options":[{"LatexCode":"35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"35 لا يبعد 5 عن 41.","En":"35 is not five below 41."}},{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"37","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"37 يبعد 4.","En":"37 is four below."}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"40 يبعد 1.","En":"40 is one below."}}],"Hints":[{"Ar":"لاحظ مقدار النقص.","En":"Notice the decrease."},{"Ar":"اطرح 5 من 41.","En":"Subtract 5 from 41."}],"Solution":{"Idea":{"Ar":"نطرح مقدار الخطوة الثابت من العدد السابق.","En":"Subtract the fixed step from the preceding number."},"FormulaLatex":"41-5=36","Steps":[{"Ar":"$46-5=41$","En":"$46-5=41$"},{"Ar":"$41-5=36$","En":"$41-5=36$"}],"Substitution":{"Ar":"$41-5=36$","En":"$41-5=36$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36-5=31$","En":"$36-5=31$"},"CommonError":{"Ar":"35 لا يبعد 5 عن 41.","En":"35 is not five below 41."}}}$mw$::jsonb,$mw$نطرح مقدار الخطوة الثابت من العدد السابق.

$41-5=36$

1. $46-5=41$

2. $41-5=36$

$41-5=36$

$36$

$36-5=31$

35 لا يبعد 5 عن 41.$mw$,$mw$Subtract the fixed step from the preceding number.

$41-5=36$

1. $46-5=41$

2. $41-5=36$

$41-5=36$

$36$

$36-5=31$

35 is not five below 41.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"لاحظ مقدار النقص.","En":"Notice the decrease."},{"Ar":"اطرح 5 من 41.","En":"Subtract 5 from 41."}],"Solution":{"Idea":{"Ar":"نطرح مقدار الخطوة الثابت من العدد السابق.","En":"Subtract the fixed step from the preceding number."},"FormulaLatex":"41-5=36","Steps":[{"Ar":"$46-5=41$","En":"$46-5=41$"},{"Ar":"$41-5=36$","En":"$41-5=36$"}],"Substitution":{"Ar":"$41-5=36$","En":"$41-5=36$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$36-5=31$","En":"$36-5=31$"},"CommonError":{"Ar":"35 لا يبعد 5 عن 41.","En":"35 is not five below 41."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"35 لا يبعد 5 عن 41.","En":"35 is not five below 41."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"37 يبعد 4.","En":"37 is four below."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"40 يبعد 1.","En":"40 is one below."},"Order":4}]}$mw$),
($mw$growth-v38-grade-3-place-value-nonstandard-bundles-1$mw$,$mw$place-value-nonstandard-bundles$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تمثيل غير اعتيادي للمنازل","En":"Nonstandard place-value bundles"},"Question":{"Ar":"يتكون عدد من 5 مئات و13 عشرة و7 آحاد. ما العدد؟","En":"A number consists of 5 hundreds, 13 tens and 7 ones. What is the number?"},"Options":[{"LatexCode":"537","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"537 يحسب ثلاث عشرات فقط.","En":"537 counts only three tens."}},{"LatexCode":"567","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"567 لا يمثل 13 عشرة.","En":"567 does not represent 13 tens."}},{"LatexCode":"637","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5137","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5137 يضع الأعداد متجاورة دون جمع قيمها.","En":"5137 concatenates the counts instead of adding their values."}}],"Hints":[{"Ar":"العشرة قيمتها 10.","En":"Each ten is worth 10."},{"Ar":"حوّل 13 عشرة إلى مئة وثلاث عشرات.","En":"Regroup 13 tens as one hundred and three tens."}],"Solution":{"Idea":{"Ar":"نحول كل مجموعة إلى قيمتها ثم نجمع، حتى لو تجاوز عدد العشرات تسعة.","En":"Convert each group to its value and add, even when there are more than nine tens."},"FormulaLatex":"500+130+7=637","Steps":[{"Ar":"$13\\cdot10=130$","En":"$13\\cdot10=130$"},{"Ar":"$500+130+7=637$","En":"$500+130+7=637$"}],"Substitution":{"Ar":"$500+130+7=637$","En":"$500+130+7=637$"},"Result":{"Ar":"$637$","En":"$637$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$637=600+30+7$","En":"$637=600+30+7$"},"CommonError":{"Ar":"537 يحسب ثلاث عشرات فقط.","En":"537 counts only three tens."}}}$mw$::jsonb,$mw$نحول كل مجموعة إلى قيمتها ثم نجمع، حتى لو تجاوز عدد العشرات تسعة.

$500+130+7=637$

1. $13\cdot10=130$

2. $500+130+7=637$

$500+130+7=637$

$637$

$637=600+30+7$

537 يحسب ثلاث عشرات فقط.$mw$,$mw$Convert each group to its value and add, even when there are more than nine tens.

$500+130+7=637$

1. $13\cdot10=130$

2. $500+130+7=637$

$500+130+7=637$

$637$

$637=600+30+7$

537 counts only three tens.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"العشرة قيمتها 10.","En":"Each ten is worth 10."},{"Ar":"حوّل 13 عشرة إلى مئة وثلاث عشرات.","En":"Regroup 13 tens as one hundred and three tens."}],"Solution":{"Idea":{"Ar":"نحول كل مجموعة إلى قيمتها ثم نجمع، حتى لو تجاوز عدد العشرات تسعة.","En":"Convert each group to its value and add, even when there are more than nine tens."},"FormulaLatex":"500+130+7=637","Steps":[{"Ar":"$13\\cdot10=130$","En":"$13\\cdot10=130$"},{"Ar":"$500+130+7=637$","En":"$500+130+7=637$"}],"Substitution":{"Ar":"$500+130+7=637$","En":"$500+130+7=637$"},"Result":{"Ar":"$637$","En":"$637$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$637=600+30+7$","En":"$637=600+30+7$"},"CommonError":{"Ar":"537 يحسب ثلاث عشرات فقط.","En":"537 counts only three tens."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"537 يحسب ثلاث عشرات فقط.","En":"537 counts only three tens."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"567 لا يمثل 13 عشرة.","En":"567 does not represent 13 tens."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"5137 يضع الأعداد متجاورة دون جمع قيمها.","En":"5137 concatenates the counts instead of adding their values."},"Order":4}]}$mw$),
($mw$growth-v38-grade-3-number-comparison-digit-constraint-1$mw$,$mw$number-comparison-digit-constraint$mw$,$mw$number-comparison$mw$,$mw$grade-3$mw$,3,1,81,304,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":304,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أصغر رقم يحقق مقارنة","En":"Smallest digit meeting a comparison"},"Question":{"Ar":"يمثل □ رقماً من 0 إلى 9. ما أصغر رقم يجعل 4□2 أكبر من 462؟","En":"□ represents a digit from 0 through 9. What is the smallest digit making 4□2 greater than 462?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"452 أصغر من 462.","En":"452 is less than 462."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"462 يساوي العدد المطلوب تجاوزه.","En":"462 equals the comparison number."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 يحقق الشرط لكنه ليس الأصغر.","En":"9 works but is not the smallest."}}],"Hints":[{"Ar":"قارن المئات ثم العشرات.","En":"Compare hundreds, then tens."},{"Ar":"التساوي لا يحقق أكبر من.","En":"Equality does not satisfy greater than."}],"Solution":{"Idea":{"Ar":"عند تساوي المئات والآحاد نحتاج إلى رقم عشرات أكبر.","En":"When hundreds and ones match, the tens digit must be greater."},"FormulaLatex":"472>462","Steps":[{"Ar":"الرقم 6 يجعل العددين متساويين.","En":"Digit 6 makes the numbers equal."},{"Ar":"أصغر رقم أكبر من 6 هو 7.","En":"The smallest digit greater than six is seven."}],"Substitution":{"Ar":"$472>462$","En":"$472>462$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$462=462<472$","En":"$462=462<472$"},"CommonError":{"Ar":"452 أصغر من 462.","En":"452 is less than 462."}}}$mw$::jsonb,$mw$عند تساوي المئات والآحاد نحتاج إلى رقم عشرات أكبر.

$472>462$

1. الرقم 6 يجعل العددين متساويين.

2. أصغر رقم أكبر من 6 هو 7.

$472>462$

$7$

$462=462<472$

452 أصغر من 462.$mw$,$mw$When hundreds and ones match, the tens digit must be greater.

$472>462$

1. Digit 6 makes the numbers equal.

2. The smallest digit greater than six is seven.

$472>462$

$7$

$462=462<472$

452 is less than 462.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قارن المئات ثم العشرات.","En":"Compare hundreds, then tens."},{"Ar":"التساوي لا يحقق أكبر من.","En":"Equality does not satisfy greater than."}],"Solution":{"Idea":{"Ar":"عند تساوي المئات والآحاد نحتاج إلى رقم عشرات أكبر.","En":"When hundreds and ones match, the tens digit must be greater."},"FormulaLatex":"472>462","Steps":[{"Ar":"الرقم 6 يجعل العددين متساويين.","En":"Digit 6 makes the numbers equal."},{"Ar":"أصغر رقم أكبر من 6 هو 7.","En":"The smallest digit greater than six is seven."}],"Substitution":{"Ar":"$472>462$","En":"$472>462$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$462=462<472$","En":"$462=462<472$"},"CommonError":{"Ar":"452 أصغر من 462.","En":"452 is less than 462."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"452 أصغر من 462.","En":"452 is less than 462."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"462 يساوي العدد المطلوب تجاوزه.","En":"462 equals the comparison number."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"9 يحقق الشرط لكنه ليس الأصغر.","En":"9 works but is not the smallest."},"Order":4}]}$mw$),
($mw$growth-v38-grade-3-rounding-largest-number-in-bin-1$mw$,$mw$rounding-largest-number-in-bin$mw$,$mw$rounding$mw$,$mw$grade-3$mw$,3,1,81,306,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":306,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أكبر عدد له تقريب معين","En":"Largest number with a given rounding"},"Question":{"Ar":"ما أكبر عدد صحيح غير سالب يُقرّب إلى 700 عند التقريب لأقرب مئة، مع تقريب المنتصف للأعلى؟","En":"What is the greatest nonnegative integer that rounds to 700 to the nearest hundred, with halfway cases rounded up?"},"Options":[{"LatexCode":"699","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"699 صالح لكنه ليس الأكبر.","En":"699 works but is not greatest."}},{"LatexCode":"700","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"700 صالح لكنه ليس الأكبر.","En":"700 works but is not greatest."}},{"LatexCode":"749","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"750","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"750 يُقرّب إلى 800.","En":"750 rounds to 800."}}],"Hints":[{"Ar":"حدد منتصف المسافة بين 700 و800.","En":"Find the midpoint between 700 and 800."},{"Ar":"استبعد المنتصف لأنه يُقرّب للأعلى.","En":"Exclude the midpoint because it rounds up."}],"Solution":{"Idea":{"Ar":"الأعداد من 650 حتى 749 تُقرّب إلى 700؛ عند 750 يبدأ التقريب إلى 800.","En":"Integers from 650 through 749 round to 700; at 750 rounding goes to 800."},"FormulaLatex":"750-1=749","Steps":[{"Ar":"الحد الفاصل الأعلى هو 750.","En":"The upper rounding boundary is 750."},{"Ar":"نأخذ العدد الصحيح السابق له مباشرة.","En":"Take the integer immediately below it."}],"Substitution":{"Ar":"$750-1=749$","En":"$750-1=749$"},"Result":{"Ar":"$749$","En":"$749$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$749-700=49<51=800-749$","En":"$749-700=49<51=800-749$"},"CommonError":{"Ar":"699 صالح لكنه ليس الأكبر.","En":"699 works but is not greatest."}}}$mw$::jsonb,$mw$الأعداد من 650 حتى 749 تُقرّب إلى 700؛ عند 750 يبدأ التقريب إلى 800.

$750-1=749$

1. الحد الفاصل الأعلى هو 750.

2. نأخذ العدد الصحيح السابق له مباشرة.

$750-1=749$

$749$

$749-700=49<51=800-749$

699 صالح لكنه ليس الأكبر.$mw$,$mw$Integers from 650 through 749 round to 700; at 750 rounding goes to 800.

$750-1=749$

1. The upper rounding boundary is 750.

2. Take the integer immediately below it.

$750-1=749$

$749$

$749-700=49<51=800-749$

699 works but is not greatest.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"حدد منتصف المسافة بين 700 و800.","En":"Find the midpoint between 700 and 800."},{"Ar":"استبعد المنتصف لأنه يُقرّب للأعلى.","En":"Exclude the midpoint because it rounds up."}],"Solution":{"Idea":{"Ar":"الأعداد من 650 حتى 749 تُقرّب إلى 700؛ عند 750 يبدأ التقريب إلى 800.","En":"Integers from 650 through 749 round to 700; at 750 rounding goes to 800."},"FormulaLatex":"750-1=749","Steps":[{"Ar":"الحد الفاصل الأعلى هو 750.","En":"The upper rounding boundary is 750."},{"Ar":"نأخذ العدد الصحيح السابق له مباشرة.","En":"Take the integer immediately below it."}],"Substitution":{"Ar":"$750-1=749$","En":"$750-1=749$"},"Result":{"Ar":"$749$","En":"$749$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$749-700=49<51=800-749$","En":"$749-700=49<51=800-749$"},"CommonError":{"Ar":"699 صالح لكنه ليس الأكبر.","En":"699 works but is not greatest."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"699 صالح لكنه ليس الأكبر.","En":"699 works but is not greatest."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"700 صالح لكنه ليس الأكبر.","En":"700 works but is not greatest."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"750 يُقرّب إلى 800.","En":"750 rounds to 800."},"Order":4}]}$mw$),
($mw$growth-v38-grade-5-estimate-quotient-compatible-1$mw$,$mw$estimate-quotient-compatible$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقدير خارج القسمة","En":"Estimating a quotient"},"Question":{"Ar":"يوجد 397 كتاباً لتوزيعها على 8 رفوف بالتساوي تقريباً. استبدل 397 بأقرب مئة ثم اقسم. كم كتاباً تقريباً لكل رف؟","En":"There are 397 books to distribute approximately equally among 8 shelves. Replace 397 by its nearest hundred, then divide. About how many books per shelf?"},"Options":[{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"40×8=320.","En":"40×8=320."}},{"LatexCode":"49","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"49 ليس خارج قسمة 400 على 8.","En":"49 is not 400 divided by 8."}},{"LatexCode":"50","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"80×8=640.","En":"80×8=640."}}],"Hints":[{"Ar":"قرّب 397 إلى أقرب مئة.","En":"Round 397 to the nearest hundred."},{"Ar":"اقسم العدد المقرب على 8.","En":"Divide the rounded number by eight."}],"Solution":{"Idea":{"Ar":"نستعمل عدداً قريباً يسهل قسمته على عدد الرفوف.","En":"Use a nearby number that is easy to divide by the shelf count."},"FormulaLatex":"400\\div8=50","Steps":[{"Ar":"$397\\to400$","En":"$397\\to400$"},{"Ar":"$400/8=50$","En":"$400/8=50$"}],"Substitution":{"Ar":"$400\\div8=50$","En":"$400\\div8=50$"},"Result":{"Ar":"$50$","En":"$50$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50\\cdot8=400$","En":"$50\\cdot8=400$"},"CommonError":{"Ar":"40×8=320.","En":"40×8=320."}}}$mw$::jsonb,$mw$نستعمل عدداً قريباً يسهل قسمته على عدد الرفوف.

$400\div8=50$

1. $397\to400$

2. $400/8=50$

$400\div8=50$

$50$

$50\cdot8=400$

40×8=320.$mw$,$mw$Use a nearby number that is easy to divide by the shelf count.

$400\div8=50$

1. $397\to400$

2. $400/8=50$

$400\div8=50$

$50$

$50\cdot8=400$

40×8=320.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قرّب 397 إلى أقرب مئة.","En":"Round 397 to the nearest hundred."},{"Ar":"اقسم العدد المقرب على 8.","En":"Divide the rounded number by eight."}],"Solution":{"Idea":{"Ar":"نستعمل عدداً قريباً يسهل قسمته على عدد الرفوف.","En":"Use a nearby number that is easy to divide by the shelf count."},"FormulaLatex":"400\\div8=50","Steps":[{"Ar":"$397\\to400$","En":"$397\\to400$"},{"Ar":"$400/8=50$","En":"$400/8=50$"}],"Substitution":{"Ar":"$400\\div8=50$","En":"$400\\div8=50$"},"Result":{"Ar":"$50$","En":"$50$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50\\cdot8=400$","En":"$50\\cdot8=400$"},"CommonError":{"Ar":"40×8=320.","En":"40×8=320."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"40×8=320.","En":"40×8=320."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"49 ليس خارج قسمة 400 على 8.","En":"49 is not 400 divided by 8."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"80×8=640.","En":"80×8=640."},"Order":4}]}$mw$),
($mw$growth-v38-grade-6-mean-combined-unequal-groups-1$mw$,$mw$mean-combined-unequal-groups$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-6$mw$,6,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متوسط مجموعتين مختلفتي العدد","En":"Mean of unequal-sized groups"},"Question":{"Ar":"ثلاث قراءات متوسطها 4، وقراءتان أخريان متوسطهما 9. ما متوسط القراءات الخمس كلها؟","En":"Three readings have mean 4 and two other readings have mean 9. What is the mean of all five readings?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 عدد القراءات.","En":"5 is the count."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6.5 متوسط المتوسطين دون أوزانهما.","En":"6.5 averages the two means without weights."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"13 مجموع المتوسطين.","En":"13 adds the means."}}],"Hints":[{"Ar":"لا تتساوى أعداد القراءات في المجموعتين.","En":"The groups have different sizes."},{"Ar":"احسب مجموع كل مجموعة قبل الدمج.","En":"Find each total before combining."}],"Solution":{"Idea":{"Ar":"نسترجع مجموع كل مجموعة ثم نقسم المجموع الكلي على عدد القراءات الكلي.","En":"Recover each group total, then divide the combined total by the combined count."},"FormulaLatex":"\\frac{3\\cdot4+2\\cdot9}{5}=6","Steps":[{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"},{"Ar":"$2\\cdot9=18$","En":"$2\\cdot9=18$"},{"Ar":"$(12+18)/5=6$","En":"$(12+18)/5=6$"}],"Substitution":{"Ar":"$\\frac{3\\cdot4+2\\cdot9}{5}=6$","En":"$\\frac{3\\cdot4+2\\cdot9}{5}=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot6=30$","En":"$5\\cdot6=30$"},"CommonError":{"Ar":"5 عدد القراءات.","En":"5 is the count."}}}$mw$::jsonb,$mw$نسترجع مجموع كل مجموعة ثم نقسم المجموع الكلي على عدد القراءات الكلي.

$\frac{3\cdot4+2\cdot9}{5}=6$

1. $3\cdot4=12$

2. $2\cdot9=18$

3. $(12+18)/5=6$

$\frac{3\cdot4+2\cdot9}{5}=6$

$6$

$5\cdot6=30$

5 عدد القراءات.$mw$,$mw$Recover each group total, then divide the combined total by the combined count.

$\frac{3\cdot4+2\cdot9}{5}=6$

1. $3\cdot4=12$

2. $2\cdot9=18$

3. $(12+18)/5=6$

$\frac{3\cdot4+2\cdot9}{5}=6$

$6$

$5\cdot6=30$

5 is the count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لا تتساوى أعداد القراءات في المجموعتين.","En":"The groups have different sizes."},{"Ar":"احسب مجموع كل مجموعة قبل الدمج.","En":"Find each total before combining."}],"Solution":{"Idea":{"Ar":"نسترجع مجموع كل مجموعة ثم نقسم المجموع الكلي على عدد القراءات الكلي.","En":"Recover each group total, then divide the combined total by the combined count."},"FormulaLatex":"\\frac{3\\cdot4+2\\cdot9}{5}=6","Steps":[{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"},{"Ar":"$2\\cdot9=18$","En":"$2\\cdot9=18$"},{"Ar":"$(12+18)/5=6$","En":"$(12+18)/5=6$"}],"Substitution":{"Ar":"$\\frac{3\\cdot4+2\\cdot9}{5}=6$","En":"$\\frac{3\\cdot4+2\\cdot9}{5}=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot6=30$","En":"$5\\cdot6=30$"},"CommonError":{"Ar":"5 عدد القراءات.","En":"5 is the count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 عدد القراءات.","En":"5 is the count."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6.5 متوسط المتوسطين دون أوزانهما.","En":"6.5 averages the two means without weights."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"13 مجموع المتوسطين.","En":"13 adds the means."},"Order":4}]}$mw$),
($mw$growth-v38-grade-7-minimum-budget-with-reserve-1$mw$,$mw$minimum-budget-with-reserve$mw$,$mw$inequality-contexts$mw$,$mw$grade-7$mw$,7,2,84,325,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":325,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ميزانية مع احتياطي","En":"Budget with a reserve"},"Question":{"Ar":"مع طالب 50 وحدة نقدية، ويريد أن يبقي 8 وحدات على الأقل بعد شراء دفاتر ثمن الواحد 6. ما أكبر عدد دفاتر يمكن شراؤه؟","En":"A student has 50 currency units and wants at least 8 left after buying notebooks costing 6 each. What is the greatest number of notebooks that can be bought?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 ممكن لكنه ليس الأكبر.","En":"6 works but is not greatest."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يترك وحدتين فقط.","En":"8 leaves only two units."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 يتجاوز الميزانية.","En":"9 exceeds the budget."}}],"Hints":[{"Ar":"احجز 8 وحدات قبل الشراء.","En":"Reserve eight units before buying."},{"Ar":"اقسم الباقي على سعر الدفتر.","En":"Divide the remainder by the notebook price."}],"Solution":{"Idea":{"Ar":"نطرح الاحتياطي أولاً ثم نقسم المتاح على سعر الدفتر.","En":"Subtract the reserve before dividing by the price per notebook."},"FormulaLatex":"6n+8\\le50","Steps":[{"Ar":"$6n\\le42$","En":"$6n\\le42$"},{"Ar":"$n\\le7$","En":"$n\\le7$"}],"Substitution":{"Ar":"$6n+8\\le50$","En":"$6n+8\\le50$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50-6\\cdot7=8$","En":"$50-6\\cdot7=8$"},"CommonError":{"Ar":"6 ممكن لكنه ليس الأكبر.","En":"6 works but is not greatest."}}}$mw$::jsonb,$mw$نطرح الاحتياطي أولاً ثم نقسم المتاح على سعر الدفتر.

$6n+8\le50$

1. $6n\le42$

2. $n\le7$

$6n+8\le50$

$7$

$50-6\cdot7=8$

6 ممكن لكنه ليس الأكبر.$mw$,$mw$Subtract the reserve before dividing by the price per notebook.

$6n+8\le50$

1. $6n\le42$

2. $n\le7$

$6n+8\le50$

$7$

$50-6\cdot7=8$

6 works but is not greatest.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احجز 8 وحدات قبل الشراء.","En":"Reserve eight units before buying."},{"Ar":"اقسم الباقي على سعر الدفتر.","En":"Divide the remainder by the notebook price."}],"Solution":{"Idea":{"Ar":"نطرح الاحتياطي أولاً ثم نقسم المتاح على سعر الدفتر.","En":"Subtract the reserve before dividing by the price per notebook."},"FormulaLatex":"6n+8\\le50","Steps":[{"Ar":"$6n\\le42$","En":"$6n\\le42$"},{"Ar":"$n\\le7$","En":"$n\\le7$"}],"Substitution":{"Ar":"$6n+8\\le50$","En":"$6n+8\\le50$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50-6\\cdot7=8$","En":"$50-6\\cdot7=8$"},"CommonError":{"Ar":"6 ممكن لكنه ليس الأكبر.","En":"6 works but is not greatest."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"6 ممكن لكنه ليس الأكبر.","En":"6 works but is not greatest."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 يترك وحدتين فقط.","En":"8 leaves only two units."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"9 يتجاوز الميزانية.","En":"9 exceeds the budget."},"Order":4}]}$mw$),
($mw$growth-v38-grade-7-inequality-endpoint-membership-1$mw$,$mw$inequality-endpoint-membership$mw$,$mw$number-line-solutions$mw$,$mw$grade-7$mw$,7,2,84,326,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":326,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار طرف مجموعة الحل","En":"Testing a solution-set endpoint"},"Question":{"Ar":"مجموعة الحل على خط الأعداد تبدأ عند −2 بدائرة غير مملوءة وتمتد يميناً. أي عدد لا ينتمي إليها؟","En":"A solution set starts at −2 with an open circle on the number line and extends right. Which number is not in the set?"},"Options":[{"LatexCode":"-2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-1.9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−1.9 أكبر من −2.","En":"−1.9 is greater than −2."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0 أكبر من −2.","En":"0 is greater than −2."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 أكبر من −2.","En":"3 is greater than −2."}}],"Hints":[{"Ar":"هل الطرف نفسه مشمول؟","En":"Is the endpoint included?"},{"Ar":"قارن كل عدد مع −2.","En":"Compare each value with −2."}],"Solution":{"Idea":{"Ar":"الدائرة غير المملوءة تستبعد الطرف، والامتداد يميناً يعني أكبر منه.","En":"An open circle excludes the endpoint, and rightward shading means greater than it."},"FormulaLatex":"x>-2","Steps":[{"Ar":"−2 غير مشمول بسبب الدائرة المفتوحة.","En":"−2 is excluded by the open circle."},{"Ar":"باقي الخيارات جميعها أكبر من −2.","En":"All other options are greater than −2."}],"Substitution":{"Ar":"$x>-2$","En":"$x>-2$"},"Result":{"Ar":"$-2$","En":"$-2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-1.9>-2$","En":"$-1.9>-2$"},"CommonError":{"Ar":"−1.9 أكبر من −2.","En":"−1.9 is greater than −2."}}}$mw$::jsonb,$mw$الدائرة غير المملوءة تستبعد الطرف، والامتداد يميناً يعني أكبر منه.

$x>-2$

1. −2 غير مشمول بسبب الدائرة المفتوحة.

2. باقي الخيارات جميعها أكبر من −2.

$x>-2$

$-2$

$-1.9>-2$

−1.9 أكبر من −2.$mw$,$mw$An open circle excludes the endpoint, and rightward shading means greater than it.

$x>-2$

1. −2 is excluded by the open circle.

2. All other options are greater than −2.

$x>-2$

$-2$

$-1.9>-2$

−1.9 is greater than −2.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل الطرف نفسه مشمول؟","En":"Is the endpoint included?"},{"Ar":"قارن كل عدد مع −2.","En":"Compare each value with −2."}],"Solution":{"Idea":{"Ar":"الدائرة غير المملوءة تستبعد الطرف، والامتداد يميناً يعني أكبر منه.","En":"An open circle excludes the endpoint, and rightward shading means greater than it."},"FormulaLatex":"x>-2","Steps":[{"Ar":"−2 غير مشمول بسبب الدائرة المفتوحة.","En":"−2 is excluded by the open circle."},{"Ar":"باقي الخيارات جميعها أكبر من −2.","En":"All other options are greater than −2."}],"Substitution":{"Ar":"$x>-2$","En":"$x>-2$"},"Result":{"Ar":"$-2$","En":"$-2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-1.9>-2$","En":"$-1.9>-2$"},"CommonError":{"Ar":"−1.9 أكبر من −2.","En":"−1.9 is greater than −2."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"−1.9 أكبر من −2.","En":"−1.9 is greater than −2."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"0 أكبر من −2.","En":"0 is greater than −2."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"3 أكبر من −2.","En":"3 is greater than −2."},"Order":4}]}$mw$),
($mw$growth-v38-grade-7-sample-space-distinct-outcomes-ordered-1$mw$,$mw$sample-space-distinct-outcomes-ordered$mw$,$mw$sample-spaces$mw$,$mw$grade-7$mw$,7,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد النتائج المرتبة","En":"Counting ordered outcomes"},"Question":{"Ar":"تُرمى قطعة نقدية مرة واحدة ويُدار قرص مرقم 1 و2 و3 مرة واحدة. كم نتيجة مختلفة تحتوي العدد 2 أو 3 بغض النظر عن وجه القطعة؟","En":"A coin is tossed once and a spinner numbered 1, 2, 3 is spun once. How many distinct outcomes contain number 2 or 3 regardless of the coin face?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 يعد أرقام القرص فقط.","En":"2 counts only spinner labels."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 عدد أرقام القرص كلها.","En":"3 counts all spinner labels."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يشمل العدد 1.","En":"6 includes number one."}}],"Hints":[{"Ar":"استبعد النتائج التي تحتوي 1.","En":"Exclude outcomes containing one."},{"Ar":"عد وجهَي القطعة لكل عدد متبقٍ.","En":"Count both coin faces for each remaining number."}],"Solution":{"Idea":{"Ar":"لكل عدد من العددين المطلوبين وجهان ممكنان للقطعة.","En":"Each of the two requested spinner numbers pairs with two coin faces."},"FormulaLatex":"2\\cdot2=4","Steps":[{"Ar":"العددان المقبولان 2 و3.","En":"The accepted numbers are 2 and 3."},{"Ar":"لكل منهما نتيجتان للقطعة.","En":"Each has two coin outcomes."}],"Substitution":{"Ar":"$2\\cdot2=4$","En":"$2\\cdot2=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6-2=4$","En":"$6-2=4$"},"CommonError":{"Ar":"2 يعد أرقام القرص فقط.","En":"2 counts only spinner labels."}}}$mw$::jsonb,$mw$لكل عدد من العددين المطلوبين وجهان ممكنان للقطعة.

$2\cdot2=4$

1. العددان المقبولان 2 و3.

2. لكل منهما نتيجتان للقطعة.

$2\cdot2=4$

$4$

$6-2=4$

2 يعد أرقام القرص فقط.$mw$,$mw$Each of the two requested spinner numbers pairs with two coin faces.

$2\cdot2=4$

1. The accepted numbers are 2 and 3.

2. Each has two coin outcomes.

$2\cdot2=4$

$4$

$6-2=4$

2 counts only spinner labels.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استبعد النتائج التي تحتوي 1.","En":"Exclude outcomes containing one."},{"Ar":"عد وجهَي القطعة لكل عدد متبقٍ.","En":"Count both coin faces for each remaining number."}],"Solution":{"Idea":{"Ar":"لكل عدد من العددين المطلوبين وجهان ممكنان للقطعة.","En":"Each of the two requested spinner numbers pairs with two coin faces."},"FormulaLatex":"2\\cdot2=4","Steps":[{"Ar":"العددان المقبولان 2 و3.","En":"The accepted numbers are 2 and 3."},{"Ar":"لكل منهما نتيجتان للقطعة.","En":"Each has two coin outcomes."}],"Substitution":{"Ar":"$2\\cdot2=4$","En":"$2\\cdot2=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6-2=4$","En":"$6-2=4$"},"CommonError":{"Ar":"2 يعد أرقام القرص فقط.","En":"2 counts only spinner labels."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 يعد أرقام القرص فقط.","En":"2 counts only spinner labels."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3 عدد أرقام القرص كلها.","En":"3 counts all spinner labels."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"6 يشمل العدد 1.","En":"6 includes number one."},"Order":4}]}$mw$),
($mw$growth-v38-grade-8-inequality-fractional-coefficient-positive-1$mw$,$mw$inequality-fractional-coefficient-positive$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-8$mw$,8,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متراجحة بمعامل كسري","En":"Inequality with a fractional coefficient"},"Question":{"Ar":"ما مجموعة حلول $\\frac{x}{4}+2\\ge5$ في الأعداد الحقيقية؟","En":"What is the real solution set of $\\frac{x}{4}+2\\ge5$?"},"Options":[{"LatexCode":"x\\ge3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 حد للعدد x/4 لا x.","En":"3 bounds x/4, not x."}},{"LatexCode":"x\\ge12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x\\le12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا نعكس الاتجاه عند الضرب بموجب.","En":"Positive multiplication does not reverse the sign."}},{"LatexCode":"x\\ge28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"28 ينتج من جمع 2 بدلاً من طرحها.","En":"28 results from adding two instead of subtracting."}}],"Hints":[{"Ar":"اطرح 2 من الطرفين.","En":"Subtract two from both sides."},{"Ar":"اضرب في 4 دون تغيير الاتجاه.","En":"Multiply by four without reversing the sign."}],"Solution":{"Idea":{"Ar":"نعزل الحد الكسري ونضرب في عدد موجب، فلا يتغير اتجاه المتراجحة.","En":"Isolate the fractional term and multiply by a positive number, preserving the inequality direction."},"FormulaLatex":"x/4+2\\ge5","Steps":[{"Ar":"$x/4\\ge3$","En":"$x/4\\ge3$"},{"Ar":"$x\\ge12$","En":"$x\\ge12$"}],"Substitution":{"Ar":"$x/4+2\\ge5$","En":"$x/4+2\\ge5$"},"Result":{"Ar":"$x\\ge12$","En":"$x\\ge12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12/4+2=5$","En":"$12/4+2=5$"},"CommonError":{"Ar":"3 حد للعدد x/4 لا x.","En":"3 bounds x/4, not x."}}}$mw$::jsonb,$mw$نعزل الحد الكسري ونضرب في عدد موجب، فلا يتغير اتجاه المتراجحة.

$x/4+2\ge5$

1. $x/4\ge3$

2. $x\ge12$

$x/4+2\ge5$

$x\ge12$

$12/4+2=5$

3 حد للعدد x/4 لا x.$mw$,$mw$Isolate the fractional term and multiply by a positive number, preserving the inequality direction.

$x/4+2\ge5$

1. $x/4\ge3$

2. $x\ge12$

$x/4+2\ge5$

$x\ge12$

$12/4+2=5$

3 bounds x/4, not x.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح 2 من الطرفين.","En":"Subtract two from both sides."},{"Ar":"اضرب في 4 دون تغيير الاتجاه.","En":"Multiply by four without reversing the sign."}],"Solution":{"Idea":{"Ar":"نعزل الحد الكسري ونضرب في عدد موجب، فلا يتغير اتجاه المتراجحة.","En":"Isolate the fractional term and multiply by a positive number, preserving the inequality direction."},"FormulaLatex":"x/4+2\\ge5","Steps":[{"Ar":"$x/4\\ge3$","En":"$x/4\\ge3$"},{"Ar":"$x\\ge12$","En":"$x\\ge12$"}],"Substitution":{"Ar":"$x/4+2\\ge5$","En":"$x/4+2\\ge5$"},"Result":{"Ar":"$x\\ge12$","En":"$x\\ge12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12/4+2=5$","En":"$12/4+2=5$"},"CommonError":{"Ar":"3 حد للعدد x/4 لا x.","En":"3 bounds x/4, not x."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 حد للعدد x/4 لا x.","En":"3 bounds x/4, not x."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا نعكس الاتجاه عند الضرب بموجب.","En":"Positive multiplication does not reverse the sign."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"28 ينتج من جمع 2 بدلاً من طرحها.","En":"28 results from adding two instead of subtracting."},"Order":4}]}$mw$),
($mw$growth-v38-grade-8-frequency-predicted-count-proportional-1$mw$,$mw$frequency-predicted-count-proportional$mw$,$mw$frequency$mw$,$mw$grade-8$mw$,8,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"توقع عدد النتائج من تجربة","En":"Predicting counts from observed frequency"},"Question":{"Ar":"في 120 تجربة حدثت نتيجة معينة 45 مرة. باستخدام التكرار النسبي نفسه للتقدير فقط، كم مرة نتوقع حدوثها في 200 تجربة جديدة؟","En":"An outcome occurred 45 times in 120 trials. Using the same relative frequency only as an estimate, how many occurrences would be expected in 200 new trials?"},"Options":[{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"45 التكرار القديم.","En":"45 is the old count."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60/200 لا يساوي 45/120.","En":"60/200 differs from 45/120."}},{"LatexCode":"75","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"90","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"90 يفترض تضاعف عدد التجارب.","En":"90 assumes the trial count doubles."}}],"Hints":[{"Ar":"احسب التكرار النسبي أولاً.","En":"Find relative frequency first."},{"Ar":"اضربه في عدد التجارب الجديدة.","En":"Multiply it by the new trial count."}],"Solution":{"Idea":{"Ar":"نضرب التكرار النسبي التجريبي في عدد التجارب الجديدة؛ الناتج تقدير وليس ضماناً.","En":"Multiply observed relative frequency by the new trial count; this is an estimate, not a guarantee."},"FormulaLatex":"200\\cdot45/120=75","Steps":[{"Ar":"$45/120=3/8$","En":"$45/120=3/8$"},{"Ar":"$200\\cdot3/8=75$","En":"$200\\cdot3/8=75$"}],"Substitution":{"Ar":"$200\\cdot45/120=75$","En":"$200\\cdot45/120=75$"},"Result":{"Ar":"$75$","En":"$75$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$75/200=45/120$","En":"$75/200=45/120$"},"CommonError":{"Ar":"45 التكرار القديم.","En":"45 is the old count."}}}$mw$::jsonb,$mw$نضرب التكرار النسبي التجريبي في عدد التجارب الجديدة؛ الناتج تقدير وليس ضماناً.

$200\cdot45/120=75$

1. $45/120=3/8$

2. $200\cdot3/8=75$

$200\cdot45/120=75$

$75$

$75/200=45/120$

45 التكرار القديم.$mw$,$mw$Multiply observed relative frequency by the new trial count; this is an estimate, not a guarantee.

$200\cdot45/120=75$

1. $45/120=3/8$

2. $200\cdot3/8=75$

$200\cdot45/120=75$

$75$

$75/200=45/120$

45 is the old count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب التكرار النسبي أولاً.","En":"Find relative frequency first."},{"Ar":"اضربه في عدد التجارب الجديدة.","En":"Multiply it by the new trial count."}],"Solution":{"Idea":{"Ar":"نضرب التكرار النسبي التجريبي في عدد التجارب الجديدة؛ الناتج تقدير وليس ضماناً.","En":"Multiply observed relative frequency by the new trial count; this is an estimate, not a guarantee."},"FormulaLatex":"200\\cdot45/120=75","Steps":[{"Ar":"$45/120=3/8$","En":"$45/120=3/8$"},{"Ar":"$200\\cdot3/8=75$","En":"$200\\cdot3/8=75$"}],"Substitution":{"Ar":"$200\\cdot45/120=75$","En":"$200\\cdot45/120=75$"},"Result":{"Ar":"$75$","En":"$75$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$75/200=45/120$","En":"$75/200=45/120$"},"CommonError":{"Ar":"45 التكرار القديم.","En":"45 is the old count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"45 التكرار القديم.","En":"45 is the old count."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"60/200 لا يساوي 45/120.","En":"60/200 differs from 45/120."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"90 يفترض تضاعف عدد التجارب.","En":"90 assumes the trial count doubles."},"Order":4}]}$mw$),
($mw$growth-v38-grade-9-inequality-negative-bracket-division-1$mw$,$mw$inequality-negative-bracket-division$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متراجحة بعامل سالب خارج قوس","En":"Inequality with negative factor outside parentheses"},"Question":{"Ar":"حل المتراجحة $-4(x+1)\\ge12$ في الأعداد الحقيقية.","En":"Solve $-4(x+1)\\ge12$ over the reals."},"Options":[{"LatexCode":"x\\ge-4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يُعكس الاتجاه.","En":"The sign was not reversed."}},{"LatexCode":"x\\le-4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x\\le-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 1 بدلاً من طرحه.","En":"Adds one instead of subtracting it."}},{"LatexCode":"x\\ge2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"النتيجة لا تحقق الحد الأصلي.","En":"This does not satisfy the original bound."}}],"Hints":[{"Ar":"اقسم على −4 واعكس الاتجاه.","En":"Divide by −4 and reverse the sign."},{"Ar":"اطرح 1 من الطرفين.","En":"Subtract one from both sides."}],"Solution":{"Idea":{"Ar":"عند القسمة على عدد سالب نعكس اتجاه المتراجحة.","En":"Division by a negative number reverses the inequality."},"FormulaLatex":" -4(x+1)\\ge12","Steps":[{"Ar":"$x+1\\le-3$","En":"$x+1\\le-3$"},{"Ar":"$x\\le-4$","En":"$x\\le-4$"}],"Substitution":{"Ar":"$ -4(x+1)\\ge12$","En":"$ -4(x+1)\\ge12$"},"Result":{"Ar":"$x\\le-4$","En":"$x\\le-4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-4(-4+1)=12$","En":"$-4(-4+1)=12$"},"CommonError":{"Ar":"لم يُعكس الاتجاه.","En":"The sign was not reversed."}}}$mw$::jsonb,$mw$عند القسمة على عدد سالب نعكس اتجاه المتراجحة.

$ -4(x+1)\ge12$

1. $x+1\le-3$

2. $x\le-4$

$ -4(x+1)\ge12$

$x\le-4$

$-4(-4+1)=12$

لم يُعكس الاتجاه.$mw$,$mw$Division by a negative number reverses the inequality.

$ -4(x+1)\ge12$

1. $x+1\le-3$

2. $x\le-4$

$ -4(x+1)\ge12$

$x\le-4$

$-4(-4+1)=12$

The sign was not reversed.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم على −4 واعكس الاتجاه.","En":"Divide by −4 and reverse the sign."},{"Ar":"اطرح 1 من الطرفين.","En":"Subtract one from both sides."}],"Solution":{"Idea":{"Ar":"عند القسمة على عدد سالب نعكس اتجاه المتراجحة.","En":"Division by a negative number reverses the inequality."},"FormulaLatex":" -4(x+1)\\ge12","Steps":[{"Ar":"$x+1\\le-3$","En":"$x+1\\le-3$"},{"Ar":"$x\\le-4$","En":"$x\\le-4$"}],"Substitution":{"Ar":"$ -4(x+1)\\ge12$","En":"$ -4(x+1)\\ge12$"},"Result":{"Ar":"$x\\le-4$","En":"$x\\le-4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-4(-4+1)=12$","En":"$-4(-4+1)=12$"},"CommonError":{"Ar":"لم يُعكس الاتجاه.","En":"The sign was not reversed."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يُعكس الاتجاه.","En":"The sign was not reversed."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 1 بدلاً من طرحه.","En":"Adds one instead of subtracting it."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"النتيجة لا تحقق الحد الأصلي.","En":"This does not satisfy the original bound."},"Order":4}]}$mw$),
($mw$growth-v38-grade-10-coordinate-line-parallel-through-point-1$mw$,$mw$coordinate-line-parallel-through-point$mw$,$mw$coordinate-lines$mw$,$mw$grade-10$mw$,10,3,88,329,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":329,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة مستقيم موازٍ","En":"Equation of a parallel line"},"Question":{"Ar":"مستقيم يوازي $y=3x-2$ ويمر بالنقطة (2,7). ما معادلته؟","En":"A line is parallel to $y=3x-2$ and passes through (2,7). What is its equation?"},"Options":[{"LatexCode":"y=3x+1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"y=3x-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المستقيم لا يمر بالنقطة.","En":"This line misses the point."}},{"LatexCode":"y=-3x+13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الميل −3 لا يساوي 3.","En":"Slope −3 is not 3."}},{"LatexCode":"y=x+5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الميل 1 لا يساوي 3.","En":"Slope 1 is not 3."}}],"Hints":[{"Ar":"استخرج الميل من المعادلة المعطاة.","En":"Read the given slope."},{"Ar":"عوّض بالنقطة لإيجاد b.","En":"Substitute the point to find b."}],"Solution":{"Idea":{"Ar":"المستقيمان المتوازيان لهما الميل نفسه. نحدد التقاطع بالتعويض عن النقطة.","En":"Parallel lines have the same slope. Determine the intercept using the point."},"FormulaLatex":"y=3x+b","Steps":[{"Ar":"$7=3\\cdot2+b$","En":"$7=3\\cdot2+b$"},{"Ar":"$b=1$","En":"$b=1$"}],"Substitution":{"Ar":"$y=3x+b$","En":"$y=3x+b$"},"Result":{"Ar":"$y=3x+1$","En":"$y=3x+1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot2+1=7$","En":"$3\\cdot2+1=7$"},"CommonError":{"Ar":"هذا المستقيم لا يمر بالنقطة.","En":"This line misses the point."}}}$mw$::jsonb,$mw$المستقيمان المتوازيان لهما الميل نفسه. نحدد التقاطع بالتعويض عن النقطة.

$y=3x+b$

1. $7=3\cdot2+b$

2. $b=1$

$y=3x+b$

$y=3x+1$

$3\cdot2+1=7$

هذا المستقيم لا يمر بالنقطة.$mw$,$mw$Parallel lines have the same slope. Determine the intercept using the point.

$y=3x+b$

1. $7=3\cdot2+b$

2. $b=1$

$y=3x+b$

$y=3x+1$

$3\cdot2+1=7$

This line misses the point.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استخرج الميل من المعادلة المعطاة.","En":"Read the given slope."},{"Ar":"عوّض بالنقطة لإيجاد b.","En":"Substitute the point to find b."}],"Solution":{"Idea":{"Ar":"المستقيمان المتوازيان لهما الميل نفسه. نحدد التقاطع بالتعويض عن النقطة.","En":"Parallel lines have the same slope. Determine the intercept using the point."},"FormulaLatex":"y=3x+b","Steps":[{"Ar":"$7=3\\cdot2+b$","En":"$7=3\\cdot2+b$"},{"Ar":"$b=1$","En":"$b=1$"}],"Substitution":{"Ar":"$y=3x+b$","En":"$y=3x+b$"},"Result":{"Ar":"$y=3x+1$","En":"$y=3x+1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot2+1=7$","En":"$3\\cdot2+1=7$"},"CommonError":{"Ar":"هذا المستقيم لا يمر بالنقطة.","En":"This line misses the point."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا المستقيم لا يمر بالنقطة.","En":"This line misses the point."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الميل −3 لا يساوي 3.","En":"Slope −3 is not 3."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الميل 1 لا يساوي 3.","En":"Slope 1 is not 3."},"Order":4}]}$mw$),
($mw$growth-v38-grade-10-coordinate-line-axis-intercept-1$mw$,$mw$coordinate-line-axis-intercept$mw$,$mw$coordinate-lines$mw$,$mw$grade-10$mw$,10,3,88,329,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":329,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقاطع مستقيم مع محور x","En":"Line's x-intercept"},"Question":{"Ar":"يقطع المستقيم $2x+3y=18$ محور x عند أي نقطة؟","En":"At which point does the line $2x+3y=18$ cross the x-axis?"},"Options":[{"LatexCode":"(0,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه نقطة تقاطع محور y.","En":"This is the y-intercept."}},{"LatexCode":"(6,0)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2×6=12 لا 18.","En":"2×6=12, not 18."}},{"LatexCode":"(9,0)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(0,9)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا تقع على محور x.","En":"It is not on the x-axis."}}],"Hints":[{"Ar":"ضع y=0.","En":"Set y=0."},{"Ar":"حل المعادلة المتبقية.","En":"Solve the remaining equation."}],"Solution":{"Idea":{"Ar":"كل نقطة على محور x يكون إحداثي y فيها صفراً.","En":"Every point on the x-axis has y-coordinate zero."},"FormulaLatex":"2x+3(0)=18","Steps":[{"Ar":"$2x=18$","En":"$2x=18$"},{"Ar":"$x=9$","En":"$x=9$"}],"Substitution":{"Ar":"$2x+3(0)=18$","En":"$2x+3(0)=18$"},"Result":{"Ar":"$(9,0)$","En":"$(9,0)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot9+3\\cdot0=18$","En":"$2\\cdot9+3\\cdot0=18$"},"CommonError":{"Ar":"هذه نقطة تقاطع محور y.","En":"This is the y-intercept."}}}$mw$::jsonb,$mw$كل نقطة على محور x يكون إحداثي y فيها صفراً.

$2x+3(0)=18$

1. $2x=18$

2. $x=9$

$2x+3(0)=18$

$(9,0)$

$2\cdot9+3\cdot0=18$

هذه نقطة تقاطع محور y.$mw$,$mw$Every point on the x-axis has y-coordinate zero.

$2x+3(0)=18$

1. $2x=18$

2. $x=9$

$2x+3(0)=18$

$(9,0)$

$2\cdot9+3\cdot0=18$

This is the y-intercept.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع y=0.","En":"Set y=0."},{"Ar":"حل المعادلة المتبقية.","En":"Solve the remaining equation."}],"Solution":{"Idea":{"Ar":"كل نقطة على محور x يكون إحداثي y فيها صفراً.","En":"Every point on the x-axis has y-coordinate zero."},"FormulaLatex":"2x+3(0)=18","Steps":[{"Ar":"$2x=18$","En":"$2x=18$"},{"Ar":"$x=9$","En":"$x=9$"}],"Substitution":{"Ar":"$2x+3(0)=18$","En":"$2x+3(0)=18$"},"Result":{"Ar":"$(9,0)$","En":"$(9,0)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2\\cdot9+3\\cdot0=18$","En":"$2\\cdot9+3\\cdot0=18$"},"CommonError":{"Ar":"هذه نقطة تقاطع محور y.","En":"This is the y-intercept."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه نقطة تقاطع محور y.","En":"This is the y-intercept."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"2×6=12 لا 18.","En":"2×6=12, not 18."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا تقع على محور x.","En":"It is not on the x-axis."},"Order":4}]}$mw$),
($mw$growth-v38-grade-11-variance-two-symmetric-points-inverse-1$mw$,$mw$variance-two-symmetric-points-inverse$mw$,$mw$secondary-population-variance$mw$,$mw$grade-11$mw$,11,3,35,54,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":54,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع المسافة من التباين","En":"Recovering distance from variance"},"Question":{"Ar":"مجتمع بيانات مكوّن من قيمتين متساويتَي البعد عن المتوسط 10، وتباينه السكاني 16. ما القيمة الكبرى؟","En":"A population contains two values equally distant from its mean of 10, and its population variance is 16. What is the larger value?"},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 تبعد 2 وتعطي تبايناً 4.","En":"12 is distance 2 and gives variance 4."}},{"LatexCode":"14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"16 تباين لا قيمة كبرى.","En":"16 is the variance, not the larger observation."}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"26 يضيف التباين بدلاً من الجذر.","En":"26 adds variance rather than its square root."}}],"Hints":[{"Ar":"عبّر عن القيمتين بـ10−d و10+d.","En":"Express the values as 10−d and 10+d."},{"Ar":"خذ الجذر التربيعي للتباين.","En":"Take the square root of the variance."}],"Solution":{"Idea":{"Ar":"إذا كانت القيمتان تبعدان d عن المتوسط فإن التباين السكاني يساوي d².","En":"If both values are distance d from the mean, the population variance equals d squared."},"FormulaLatex":"\\sigma^2=(d^2+d^2)/2=d^2","Steps":[{"Ar":"$d=\\sqrt{16}=4$","En":"$d=\\sqrt{16}=4$"},{"Ar":"$10+4=14$","En":"$10+4=14$"}],"Substitution":{"Ar":"$\\sigma^2=(d^2+d^2)/2=d^2$","En":"$\\sigma^2=(d^2+d^2)/2=d^2$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$((6-10)^2+(14-10)^2)/2=16$","En":"$((6-10)^2+(14-10)^2)/2=16$"},"CommonError":{"Ar":"12 تبعد 2 وتعطي تبايناً 4.","En":"12 is distance 2 and gives variance 4."}}}$mw$::jsonb,$mw$إذا كانت القيمتان تبعدان d عن المتوسط فإن التباين السكاني يساوي d².

$\sigma^2=(d^2+d^2)/2=d^2$

1. $d=\sqrt{16}=4$

2. $10+4=14$

$\sigma^2=(d^2+d^2)/2=d^2$

$14$

$((6-10)^2+(14-10)^2)/2=16$

12 تبعد 2 وتعطي تبايناً 4.$mw$,$mw$If both values are distance d from the mean, the population variance equals d squared.

$\sigma^2=(d^2+d^2)/2=d^2$

1. $d=\sqrt{16}=4$

2. $10+4=14$

$\sigma^2=(d^2+d^2)/2=d^2$

$14$

$((6-10)^2+(14-10)^2)/2=16$

12 is distance 2 and gives variance 4.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عبّر عن القيمتين بـ10−d و10+d.","En":"Express the values as 10−d and 10+d."},{"Ar":"خذ الجذر التربيعي للتباين.","En":"Take the square root of the variance."}],"Solution":{"Idea":{"Ar":"إذا كانت القيمتان تبعدان d عن المتوسط فإن التباين السكاني يساوي d².","En":"If both values are distance d from the mean, the population variance equals d squared."},"FormulaLatex":"\\sigma^2=(d^2+d^2)/2=d^2","Steps":[{"Ar":"$d=\\sqrt{16}=4$","En":"$d=\\sqrt{16}=4$"},{"Ar":"$10+4=14$","En":"$10+4=14$"}],"Substitution":{"Ar":"$\\sigma^2=(d^2+d^2)/2=d^2$","En":"$\\sigma^2=(d^2+d^2)/2=d^2$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$((6-10)^2+(14-10)^2)/2=16$","En":"$((6-10)^2+(14-10)^2)/2=16$"},"CommonError":{"Ar":"12 تبعد 2 وتعطي تبايناً 4.","En":"12 is distance 2 and gives variance 4."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"12 تبعد 2 وتعطي تبايناً 4.","En":"12 is distance 2 and gives variance 4."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"16 تباين لا قيمة كبرى.","En":"16 is the variance, not the larger observation."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"26 يضيف التباين بدلاً من الجذر.","En":"26 adds variance rather than its square root."},"Order":4}]}$mw$),
($mw$growth-v38-grade-11-variance-translation-invariance-1$mw$,$mw$variance-translation-invariance$mw$,$mw$secondary-population-variance$mw$,$mw$grade-11$mw$,11,3,35,54,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":54,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التباين عند إزاحة البيانات","En":"Variance under translation"},"Question":{"Ar":"التباين السكاني لمجموعة بيانات هو 7.5. أضيف العدد 20 إلى كل قيمة في المجموعة. ما التباين السكاني الجديد؟","En":"A data set has population variance 7.5. The number 20 is added to every observation. What is the new population variance?"},"Options":[{"LatexCode":"7.5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"27.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"27.5 يضيف الثابت إلى التباين دون مبرر.","En":"27.5 unjustifiably adds the constant to variance."}},{"LatexCode":"150","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"150 يضرب التباين في ثابت الإزاحة.","En":"150 multiplies variance by the shift."}},{"LatexCode":"400","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"400 مربع ثابت الإزاحة لا التباين.","En":"400 is the squared shift, not the variance."}}],"Hints":[{"Ar":"كيف يتغير المتوسط؟","En":"How does the mean change?"},{"Ar":"قارن الفرق بين كل قيمة ومتوسطها قبل الإضافة وبعدها.","En":"Compare each deviation before and after adding."}],"Solution":{"Idea":{"Ar":"عند إضافة ثابت إلى كل قيمة ينتقل المتوسط بالمقدار نفسه وتبقى الانحرافات عنه ثابتة.","En":"Adding a constant shifts the mean equally and preserves deviations from it."},"FormulaLatex":"(x_i+20)-(\\bar x+20)=x_i-\\bar x","Steps":[{"Ar":"يتغير المتوسط إلى متوسطه القديم زائد 20.","En":"The mean increases by 20."},{"Ar":"لا يتغير أي مربع انحراف، لذلك لا يتغير متوسط المربعات.","En":"No squared deviation changes, so their mean is unchanged."}],"Substitution":{"Ar":"$(x_i+20)-(\\bar x+20)=x_i-\\bar x$","En":"$(x_i+20)-(\\bar x+20)=x_i-\\bar x$"},"Result":{"Ar":"$7.5$","En":"$7.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\sigma_{\\mathrm{new}}^2=7.5$","En":"$\\sigma_{\\mathrm{new}}^2=7.5$"},"CommonError":{"Ar":"27.5 يضيف الثابت إلى التباين دون مبرر.","En":"27.5 unjustifiably adds the constant to variance."}}}$mw$::jsonb,$mw$عند إضافة ثابت إلى كل قيمة ينتقل المتوسط بالمقدار نفسه وتبقى الانحرافات عنه ثابتة.

$(x_i+20)-(\bar x+20)=x_i-\bar x$

1. يتغير المتوسط إلى متوسطه القديم زائد 20.

2. لا يتغير أي مربع انحراف، لذلك لا يتغير متوسط المربعات.

$(x_i+20)-(\bar x+20)=x_i-\bar x$

$7.5$

$\sigma_{\mathrm{new}}^2=7.5$

27.5 يضيف الثابت إلى التباين دون مبرر.$mw$,$mw$Adding a constant shifts the mean equally and preserves deviations from it.

$(x_i+20)-(\bar x+20)=x_i-\bar x$

1. The mean increases by 20.

2. No squared deviation changes, so their mean is unchanged.

$(x_i+20)-(\bar x+20)=x_i-\bar x$

$7.5$

$\sigma_{\mathrm{new}}^2=7.5$

27.5 unjustifiably adds the constant to variance.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كيف يتغير المتوسط؟","En":"How does the mean change?"},{"Ar":"قارن الفرق بين كل قيمة ومتوسطها قبل الإضافة وبعدها.","En":"Compare each deviation before and after adding."}],"Solution":{"Idea":{"Ar":"عند إضافة ثابت إلى كل قيمة ينتقل المتوسط بالمقدار نفسه وتبقى الانحرافات عنه ثابتة.","En":"Adding a constant shifts the mean equally and preserves deviations from it."},"FormulaLatex":"(x_i+20)-(\\bar x+20)=x_i-\\bar x","Steps":[{"Ar":"يتغير المتوسط إلى متوسطه القديم زائد 20.","En":"The mean increases by 20."},{"Ar":"لا يتغير أي مربع انحراف، لذلك لا يتغير متوسط المربعات.","En":"No squared deviation changes, so their mean is unchanged."}],"Substitution":{"Ar":"$(x_i+20)-(\\bar x+20)=x_i-\\bar x$","En":"$(x_i+20)-(\\bar x+20)=x_i-\\bar x$"},"Result":{"Ar":"$7.5$","En":"$7.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\sigma_{\\mathrm{new}}^2=7.5$","En":"$\\sigma_{\\mathrm{new}}^2=7.5$"},"CommonError":{"Ar":"27.5 يضيف الثابت إلى التباين دون مبرر.","En":"27.5 unjustifiably adds the constant to variance."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"27.5 يضيف الثابت إلى التباين دون مبرر.","En":"27.5 unjustifiably adds the constant to variance."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"150 يضرب التباين في ثابت الإزاحة.","En":"150 multiplies variance by the shift."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"400 مربع ثابت الإزاحة لا التباين.","En":"400 is the squared shift, not the variance."},"Order":4}]}$mw$),
($mw$growth-v38-grade-12-circle-radius-from-point-and-center-1$mw$,$mw$circle-radius-from-point-and-center$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة دائرة من مركز ونقطة","En":"Circle equation from centre and point"},"Question":{"Ar":"دائرة مركزها (−1,2) وتمر بالنقطة (2,6). أي معادلة تمثلها؟","En":"A circle is centred at (−1,2) and passes through (2,6). Which equation represents it?"},"Options":[{"LatexCode":"(x+1)^2+(y-2)^2=5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 نصف القطر لا مربعه.","En":"5 is the radius, not its square."}},{"LatexCode":"(x-1)^2+(y+2)^2=25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إشارتا المركز معكوستان.","En":"The centre signs are reversed."}},{"LatexCode":"(x+1)^2+(y-2)^2=25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(x+1)^2+(y-2)^2=7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 مجموع الفرقين دون تربيع.","En":"7 adds differences without squaring."}}],"Hints":[{"Ar":"استعمل فرق الإحداثيات.","En":"Use coordinate differences."},{"Ar":"ضع مربع نصف القطر في الطرف الأيمن.","En":"Use the squared radius on the right."}],"Solution":{"Idea":{"Ar":"مربع نصف القطر يساوي مربع المسافة بين المركز والنقطة.","En":"The squared radius equals the squared distance from the centre to the point."},"FormulaLatex":"r^2=3^2+4^2=25","Steps":[{"Ar":"$2-(-1)=3,\\quad6-2=4$","En":"$2-(-1)=3,\\quad6-2=4$"},{"Ar":"$r^2=9+16=25$","En":"$r^2=9+16=25$"}],"Substitution":{"Ar":"$r^2=3^2+4^2=25$","En":"$r^2=3^2+4^2=25$"},"Result":{"Ar":"$(x+1)^2+(y-2)^2=25$","En":"$(x+1)^2+(y-2)^2=25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(2+1)^2+(6-2)^2=25$","En":"$(2+1)^2+(6-2)^2=25$"},"CommonError":{"Ar":"5 نصف القطر لا مربعه.","En":"5 is the radius, not its square."}}}$mw$::jsonb,$mw$مربع نصف القطر يساوي مربع المسافة بين المركز والنقطة.

$r^2=3^2+4^2=25$

1. $2-(-1)=3,\quad6-2=4$

2. $r^2=9+16=25$

$r^2=3^2+4^2=25$

$(x+1)^2+(y-2)^2=25$

$(2+1)^2+(6-2)^2=25$

5 نصف القطر لا مربعه.$mw$,$mw$The squared radius equals the squared distance from the centre to the point.

$r^2=3^2+4^2=25$

1. $2-(-1)=3,\quad6-2=4$

2. $r^2=9+16=25$

$r^2=3^2+4^2=25$

$(x+1)^2+(y-2)^2=25$

$(2+1)^2+(6-2)^2=25$

5 is the radius, not its square.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل فرق الإحداثيات.","En":"Use coordinate differences."},{"Ar":"ضع مربع نصف القطر في الطرف الأيمن.","En":"Use the squared radius on the right."}],"Solution":{"Idea":{"Ar":"مربع نصف القطر يساوي مربع المسافة بين المركز والنقطة.","En":"The squared radius equals the squared distance from the centre to the point."},"FormulaLatex":"r^2=3^2+4^2=25","Steps":[{"Ar":"$2-(-1)=3,\\quad6-2=4$","En":"$2-(-1)=3,\\quad6-2=4$"},{"Ar":"$r^2=9+16=25$","En":"$r^2=9+16=25$"}],"Substitution":{"Ar":"$r^2=3^2+4^2=25$","En":"$r^2=3^2+4^2=25$"},"Result":{"Ar":"$(x+1)^2+(y-2)^2=25$","En":"$(x+1)^2+(y-2)^2=25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(2+1)^2+(6-2)^2=25$","En":"$(2+1)^2+(6-2)^2=25$"},"CommonError":{"Ar":"5 نصف القطر لا مربعه.","En":"5 is the radius, not its square."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 نصف القطر لا مربعه.","En":"5 is the radius, not its square."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"إشارتا المركز معكوستان.","En":"The centre signs are reversed."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"7 مجموع الفرقين دون تربيع.","En":"7 adds differences without squaring."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v38 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
