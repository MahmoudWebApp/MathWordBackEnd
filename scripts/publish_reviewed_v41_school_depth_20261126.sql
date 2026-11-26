-- One-time owner-authorized v41 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v41-grade-1-length-same-unit-endpoint-gap-1$mw$,$mw$length-same-unit-endpoint-gap$mw$,$mw$length$mw$,$mw$grade-1$mw$,1,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قياس طول غير مكتمل","En":"Completing a length measurement"},"Question":{"Ar":"غطت 3 عيدان متساوية جزءاً من شريط، وبقي جزء طوله عودان من النوع نفسه. كم عوداً يغطي الشريط كاملاً دون فراغات؟","En":"Three equal sticks cover part of a strip, leaving a length of two more identical sticks. How many sticks cover the whole strip without gaps?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 طول الجزء الباقي فقط.","En":"2 counts only the remaining part."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 طول الجزء المغطى فقط.","En":"3 counts only the covered part."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 لا يساوي مجموع 3 و2.","En":"6 is not the sum of 3 and 2."}}],"Hints":[{"Ar":"كم عوداً يغطي الجزء الباقي؟","En":"How many sticks cover the remaining part?"},{"Ar":"اجمع الجزأين.","En":"Combine the two parts."}],"Solution":{"Idea":{"Ar":"نجمع عدد وحدات الطول المتساوية.","En":"Add the counts of equal length units."},"FormulaLatex":"3+2=5","Steps":[{"Ar":"الجزء المغطى طوله ثلاثة عيدان.","En":"The covered part is three sticks long."},{"Ar":"$3+2=5$","En":"$3+2=5$"}],"Substitution":{"Ar":"$3+2=5$","En":"$3+2=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5-3=2$","En":"$5-3=2$"},"CommonError":{"Ar":"2 طول الجزء الباقي فقط.","En":"2 counts only the remaining part."}}}$mw$::jsonb,$mw$نجمع عدد وحدات الطول المتساوية.

$3+2=5$

1. الجزء المغطى طوله ثلاثة عيدان.

2. $3+2=5$

$3+2=5$

$5$

$5-3=2$

2 طول الجزء الباقي فقط.$mw$,$mw$Add the counts of equal length units.

$3+2=5$

1. The covered part is three sticks long.

2. $3+2=5$

$3+2=5$

$5$

$5-3=2$

2 counts only the remaining part.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم عوداً يغطي الجزء الباقي؟","En":"How many sticks cover the remaining part?"},{"Ar":"اجمع الجزأين.","En":"Combine the two parts."}],"Solution":{"Idea":{"Ar":"نجمع عدد وحدات الطول المتساوية.","En":"Add the counts of equal length units."},"FormulaLatex":"3+2=5","Steps":[{"Ar":"الجزء المغطى طوله ثلاثة عيدان.","En":"The covered part is three sticks long."},{"Ar":"$3+2=5$","En":"$3+2=5$"}],"Substitution":{"Ar":"$3+2=5$","En":"$3+2=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5-3=2$","En":"$5-3=2$"},"CommonError":{"Ar":"2 طول الجزء الباقي فقط.","En":"2 counts only the remaining part."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 طول الجزء الباقي فقط.","En":"2 counts only the remaining part."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3 طول الجزء المغطى فقط.","En":"3 counts only the covered part."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"6 لا يساوي مجموع 3 و2.","En":"6 is not the sum of 3 and 2."},"Order":4}]}$mw$),
($mw$growth-v41-grade-1-category-count-choose-balanced-split-1$mw$,$mw$category-count-choose-balanced-split$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تقسيم سجل إلى مجموعتين","En":"Splitting categories into two groups"},"Question":{"Ar":"سجل الألوان: الأحمر 3، الأزرق 5، الأخضر 2، الأصفر 4. أي لونين معاً عدد اختياراتهما يساوي مجموع اختيارات اللونين الباقيين؟ اختر زوجاً يحتوي الأحمر. A: الأحمر والأزرق؛ B: الأحمر والأخضر؛ C: الأحمر والأصفر؛ D: الأحمر والأحمر.","En":"Colour record: red 3, blue 5, green 2, yellow 4. Which pair containing red has the same total as the two remaining colours? A: red and blue; B: red and green; C: red and yellow; D: red and red."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 لا يساوي 6.","En":"8 is not 6."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 لا يساوي 9.","En":"5 is not 9."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمكن اختيار اللون نفسه مرتين.","En":"The same colour cannot be selected twice."}}],"Hints":[{"Ar":"جرّب جمع الأحمر مع كل لون آخر.","En":"Try adding red to each other colour."},{"Ar":"ابحث عن مجموعين متساويين.","En":"Look for two equal totals."}],"Solution":{"Idea":{"Ar":"نقارن مجموع كل زوج يحتوي الأحمر مع مجموع اللونين الباقيين.","En":"Compare each pair containing red with the total of the remaining colours."},"FormulaLatex":"3+4=5+2=7","Steps":[{"Ar":"نجمع الأحمر والأصفر، فيكون المجموع 7.","En":"Red and yellow total 7."},{"Ar":"$5+2=7$","En":"$5+2=7$"}],"Substitution":{"Ar":"$5+2=7$","En":"$5+2=7$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+7=14$","En":"$7+7=14$"},"CommonError":{"Ar":"8 لا يساوي 6.","En":"8 is not 6."}}}$mw$::jsonb,$mw$نقارن مجموع كل زوج يحتوي الأحمر مع مجموع اللونين الباقيين.

$3+4=5+2=7$

1. نجمع الأحمر والأصفر، فيكون المجموع 7.

2. $5+2=7$

$5+2=7$

$C$

$7+7=14$

8 لا يساوي 6.$mw$,$mw$Compare each pair containing red with the total of the remaining colours.

$3+4=5+2=7$

1. Red and yellow total 7.

2. $5+2=7$

$5+2=7$

$C$

$7+7=14$

8 is not 6.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"جرّب جمع الأحمر مع كل لون آخر.","En":"Try adding red to each other colour."},{"Ar":"ابحث عن مجموعين متساويين.","En":"Look for two equal totals."}],"Solution":{"Idea":{"Ar":"نقارن مجموع كل زوج يحتوي الأحمر مع مجموع اللونين الباقيين.","En":"Compare each pair containing red with the total of the remaining colours."},"FormulaLatex":"3+4=5+2=7","Steps":[{"Ar":"نجمع الأحمر والأصفر، فيكون المجموع 7.","En":"Red and yellow total 7."},{"Ar":"$5+2=7$","En":"$5+2=7$"}],"Substitution":{"Ar":"$5+2=7$","En":"$5+2=7$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+7=14$","En":"$7+7=14$"},"CommonError":{"Ar":"8 لا يساوي 6.","En":"8 is not 6."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"8 لا يساوي 6.","En":"8 is not 6."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"5 لا يساوي 9.","En":"5 is not 9."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يمكن اختيار اللون نفسه مرتين.","En":"The same colour cannot be selected twice."},"Order":4}]}$mw$),
($mw$growth-v41-grade-2-solid-cube-edge-length-attribute-1$mw$,$mw$solid-cube-edge-length-attribute$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"أحرف المكعب","En":"Edges of a cube"},"Question":{"Ar":"اختير حرف واحد من مكعب. كم حرفاً آخر في المكعب له الطول نفسه؟","En":"One edge of a cube is selected. How many other edges of the cube have the same length?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 ليس عدد الأحرف الباقية.","En":"5 is not the remaining edge count."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 ينتج من عد الرؤوس بدلاً من الأحرف.","En":"7 results from counting vertices rather than edges."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 يشمل الحرف المختار.","En":"12 includes the selected edge."}}],"Hints":[{"Ar":"كم حرفاً للمكعب كله؟","En":"How many edges does a cube have?"},{"Ar":"استبعد الحرف المختار.","En":"Exclude the selected edge."}],"Solution":{"Idea":{"Ar":"للمكعب 12 حرفاً متساوية الطول.","En":"A cube has 12 edges of equal length."},"FormulaLatex":"12-1=11","Steps":[{"Ar":"جميع أحرف المكعب متساوية الطول.","En":"All cube edges have equal length."},{"Ar":"$12-1=11$","En":"$12-1=11$"}],"Substitution":{"Ar":"$12-1=11$","En":"$12-1=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11+1=12$","En":"$11+1=12$"},"CommonError":{"Ar":"5 ليس عدد الأحرف الباقية.","En":"5 is not the remaining edge count."}}}$mw$::jsonb,$mw$للمكعب 12 حرفاً متساوية الطول.

$12-1=11$

1. جميع أحرف المكعب متساوية الطول.

2. $12-1=11$

$12-1=11$

$11$

$11+1=12$

5 ليس عدد الأحرف الباقية.$mw$,$mw$A cube has 12 edges of equal length.

$12-1=11$

1. All cube edges have equal length.

2. $12-1=11$

$12-1=11$

$11$

$11+1=12$

5 is not the remaining edge count.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم حرفاً للمكعب كله؟","En":"How many edges does a cube have?"},{"Ar":"استبعد الحرف المختار.","En":"Exclude the selected edge."}],"Solution":{"Idea":{"Ar":"للمكعب 12 حرفاً متساوية الطول.","En":"A cube has 12 edges of equal length."},"FormulaLatex":"12-1=11","Steps":[{"Ar":"جميع أحرف المكعب متساوية الطول.","En":"All cube edges have equal length."},{"Ar":"$12-1=11$","En":"$12-1=11$"}],"Substitution":{"Ar":"$12-1=11$","En":"$12-1=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11+1=12$","En":"$11+1=12$"},"CommonError":{"Ar":"5 ليس عدد الأحرف الباقية.","En":"5 is not the remaining edge count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 ليس عدد الأحرف الباقية.","En":"5 is not the remaining edge count."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"7 ينتج من عد الرؤوس بدلاً من الأحرف.","En":"7 results from counting vertices rather than edges."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 يشمل الحرف المختار.","En":"12 includes the selected edge."},"Order":4}]}$mw$),
($mw$growth-v41-grade-2-pictograph-missing-row-from-total-1$mw$,$mw$pictograph-missing-row-from-total$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال صف مفقود في سجل مصور","En":"Completing a missing pictograph row"},"Question":{"Ar":"كل ● يمثل كتاباً. مجموع الكتب 12. A: ●●●●؛ B: ●●●؛ C: صف مخفي. كم رمزاً يجب أن يظهر في C؟","En":"Each ● represents one book. The total is 12 books. A: ●●●●; B: ●●●; C: hidden row. How many symbols belong in C?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 هو عدد رموز B.","En":"3 is B's count."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 هو عدد رموز A.","En":"4 is A's count."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 مجموع الصفين الظاهرين.","En":"7 is the total visible count."}}],"Hints":[{"Ar":"عد رموز A وB.","En":"Count the symbols in A and B."},{"Ar":"اطرح المجموع من 12.","En":"Subtract their total from 12."}],"Solution":{"Idea":{"Ar":"نطرح مجموع الصفوف الظاهرة من العدد الكلي.","En":"Subtract the visible row counts from the total."},"FormulaLatex":"12-(4+3)=5","Steps":[{"Ar":"$4+3=7$","En":"$4+3=7$"},{"Ar":"$12-7=5$","En":"$12-7=5$"}],"Substitution":{"Ar":"$12-7=5$","En":"$12-7=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+3+5=12$","En":"$4+3+5=12$"},"CommonError":{"Ar":"3 هو عدد رموز B.","En":"3 is B's count."}}}$mw$::jsonb,$mw$نطرح مجموع الصفوف الظاهرة من العدد الكلي.

$12-(4+3)=5$

1. $4+3=7$

2. $12-7=5$

$12-7=5$

$5$

$4+3+5=12$

3 هو عدد رموز B.$mw$,$mw$Subtract the visible row counts from the total.

$12-(4+3)=5$

1. $4+3=7$

2. $12-7=5$

$12-7=5$

$5$

$4+3+5=12$

3 is B's count.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد رموز A وB.","En":"Count the symbols in A and B."},{"Ar":"اطرح المجموع من 12.","En":"Subtract their total from 12."}],"Solution":{"Idea":{"Ar":"نطرح مجموع الصفوف الظاهرة من العدد الكلي.","En":"Subtract the visible row counts from the total."},"FormulaLatex":"12-(4+3)=5","Steps":[{"Ar":"$4+3=7$","En":"$4+3=7$"},{"Ar":"$12-7=5$","En":"$12-7=5$"}],"Substitution":{"Ar":"$12-7=5$","En":"$12-7=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+3+5=12$","En":"$4+3+5=12$"},"CommonError":{"Ar":"3 هو عدد رموز B.","En":"3 is B's count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 هو عدد رموز B.","En":"3 is B's count."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 هو عدد رموز A.","En":"4 is A's count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"7 مجموع الصفين الظاهرين.","En":"7 is the total visible count."},"Order":4}]}$mw$),
($mw$growth-v41-grade-4-addition-carry-across-zero-1$mw$,$mw$addition-carry-across-zero$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الجمع مع انتقال الحمل","En":"Addition with cascading carries"},"Question":{"Ar":"عند جمع 998 و7، ما رقم منزلة المئات في الناتج؟","En":"When adding 998 and 7, what is the hundreds digit of the result?"},"Options":[{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 رقم الآلاف.","En":"1 is the thousands digit."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 قبل الجمع وليس بعد الحمل.","En":"9 is the original digit before regrouping."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 رقم الآحاد.","En":"5 is the ones digit."}}],"Hints":[{"Ar":"ابدأ من الآحاد.","En":"Start with the ones."},{"Ar":"تابع الحمل في كل منزلة حتى الآلاف.","En":"Follow each carry through to thousands."}],"Solution":{"Idea":{"Ar":"ينتقل الحمل من الآحاد إلى العشرات ثم المئات ثم الآلاف.","En":"Regrouping carries from ones to tens, hundreds and thousands."},"FormulaLatex":"998+7=1005","Steps":[{"Ar":"$8+7=15$","En":"$8+7=15$"},{"Ar":"نكتب 5 ونحمل 1؛ في العشرات والمئات 9+1=10 في كل منهما.","En":"Write 5 and carry 1; tens and hundreds each give 9+1=10."},{"Ar":"$998+7=1005$","En":"$998+7=1005$"}],"Substitution":{"Ar":"$998+7=1005$","En":"$998+7=1005$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1005-7=998$","En":"$1005-7=998$"},"CommonError":{"Ar":"1 رقم الآلاف.","En":"1 is the thousands digit."}}}$mw$::jsonb,$mw$ينتقل الحمل من الآحاد إلى العشرات ثم المئات ثم الآلاف.

$998+7=1005$

1. $8+7=15$

2. نكتب 5 ونحمل 1؛ في العشرات والمئات 9+1=10 في كل منهما.

3. $998+7=1005$

$998+7=1005$

$0$

$1005-7=998$

1 رقم الآلاف.$mw$,$mw$Regrouping carries from ones to tens, hundreds and thousands.

$998+7=1005$

1. $8+7=15$

2. Write 5 and carry 1; tens and hundreds each give 9+1=10.

3. $998+7=1005$

$998+7=1005$

$0$

$1005-7=998$

1 is the thousands digit.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ من الآحاد.","En":"Start with the ones."},{"Ar":"تابع الحمل في كل منزلة حتى الآلاف.","En":"Follow each carry through to thousands."}],"Solution":{"Idea":{"Ar":"ينتقل الحمل من الآحاد إلى العشرات ثم المئات ثم الآلاف.","En":"Regrouping carries from ones to tens, hundreds and thousands."},"FormulaLatex":"998+7=1005","Steps":[{"Ar":"$8+7=15$","En":"$8+7=15$"},{"Ar":"نكتب 5 ونحمل 1؛ في العشرات والمئات 9+1=10 في كل منهما.","En":"Write 5 and carry 1; tens and hundreds each give 9+1=10."},{"Ar":"$998+7=1005$","En":"$998+7=1005$"}],"Substitution":{"Ar":"$998+7=1005$","En":"$998+7=1005$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1005-7=998$","En":"$1005-7=998$"},"CommonError":{"Ar":"1 رقم الآلاف.","En":"1 is the thousands digit."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"1 رقم الآلاف.","En":"1 is the thousands digit."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"9 قبل الجمع وليس بعد الحمل.","En":"9 is the original digit before regrouping."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"5 رقم الآحاد.","En":"5 is the ones digit."},"Order":4}]}$mw$),
($mw$growth-v41-grade-4-one-step-equation-identity-representation-1$mw$,$mw$one-step-equation-identity-representation$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمثيل معادلة قسمة","En":"Representing a division equation"},"Question":{"Ar":"أي معادلة ضرب تكافئ المعادلة $n/8=6$؟","En":"Which multiplication equation is equivalent to $n/8=6$?"},"Options":[{"LatexCode":"6n=8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يبدل دور 6 وn.","En":"Swaps the roles of six and n."}},{"LatexCode":"8n=6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضع 8 معاملاً لـ n بدلاً من مقسوم عليه.","En":"Makes eight a coefficient instead of a divisor."}},{"LatexCode":"n=8\\cdot6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"n=8+6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع ليس عكس القسمة.","En":"Addition does not undo division."}}],"Hints":[{"Ar":"ما العملية العكسية للقسمة؟","En":"What is the inverse of division?"},{"Ar":"اضرب الطرفين في 8.","En":"Multiply both sides by eight."}],"Solution":{"Idea":{"Ar":"نعكس القسمة على 8 بالضرب في 8.","En":"Undo division by eight by multiplying by eight."},"FormulaLatex":"n=8\\cdot6","Steps":[{"Ar":"$(n/8)\\cdot8=6\\cdot8$","En":"$(n/8)\\cdot8=6\\cdot8$"},{"Ar":"$n=48$","En":"$n=48$"}],"Substitution":{"Ar":"$n=48$","En":"$n=48$"},"Result":{"Ar":"$n=8\\cdot6$","En":"$n=8\\cdot6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$48/8=6$","En":"$48/8=6$"},"CommonError":{"Ar":"يبدل دور 6 وn.","En":"Swaps the roles of six and n."}}}$mw$::jsonb,$mw$نعكس القسمة على 8 بالضرب في 8.

$n=8\cdot6$

1. $(n/8)\cdot8=6\cdot8$

2. $n=48$

$n=48$

$n=8\cdot6$

$48/8=6$

يبدل دور 6 وn.$mw$,$mw$Undo division by eight by multiplying by eight.

$n=8\cdot6$

1. $(n/8)\cdot8=6\cdot8$

2. $n=48$

$n=48$

$n=8\cdot6$

$48/8=6$

Swaps the roles of six and n.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما العملية العكسية للقسمة؟","En":"What is the inverse of division?"},{"Ar":"اضرب الطرفين في 8.","En":"Multiply both sides by eight."}],"Solution":{"Idea":{"Ar":"نعكس القسمة على 8 بالضرب في 8.","En":"Undo division by eight by multiplying by eight."},"FormulaLatex":"n=8\\cdot6","Steps":[{"Ar":"$(n/8)\\cdot8=6\\cdot8$","En":"$(n/8)\\cdot8=6\\cdot8$"},{"Ar":"$n=48$","En":"$n=48$"}],"Substitution":{"Ar":"$n=48$","En":"$n=48$"},"Result":{"Ar":"$n=8\\cdot6$","En":"$n=8\\cdot6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$48/8=6$","En":"$48/8=6$"},"CommonError":{"Ar":"يبدل دور 6 وn.","En":"Swaps the roles of six and n."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يبدل دور 6 وn.","En":"Swaps the roles of six and n."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يضع 8 معاملاً لـ n بدلاً من مقسوم عليه.","En":"Makes eight a coefficient instead of a divisor."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الجمع ليس عكس القسمة.","En":"Addition does not undo division."},"Order":4}]}$mw$),
($mw$growth-v41-grade-5-multiplication-three-dimensional-packing-1$mw$,$mw$multiplication-three-dimensional-packing$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-5$mw$,5,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حساب عدد العناصر في طبقات","En":"Counting items in layers"},"Question":{"Ar":"صندوق فيه 4 طبقات متطابقة من العبوات. كل طبقة فيها 6 صفوف، وكل صف فيه 8 عبوات. كم عبوة في الصندوق؟","En":"A box contains 4 identical layers of containers. Each layer has 6 rows, and each row has 8 containers. How many containers are in the box?"},"Options":[{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"48 عدد عبوات طبقة واحدة.","En":"48 counts one layer."}},{"LatexCode":"96","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"96 عدد عبوات طبقتين.","En":"96 counts two layers."}},{"LatexCode":"192","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"224","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"224 لا يساوي حاصل ضرب الأعداد الثلاثة.","En":"224 is not the product of the three counts."}}],"Hints":[{"Ar":"احسب عدد العبوات في طبقة واحدة.","En":"Count the containers in one layer."},{"Ar":"اضرب في عدد الطبقات.","En":"Multiply by the number of layers."}],"Solution":{"Idea":{"Ar":"نضرب عدد العناصر في الصف في عدد الصفوف ثم في عدد الطبقات.","En":"Multiply items per row by rows per layer and then by layers."},"FormulaLatex":"4\\cdot6\\cdot8=192","Steps":[{"Ar":"$6\\cdot8=48$","En":"$6\\cdot8=48$"},{"Ar":"$4\\cdot48=192$","En":"$4\\cdot48=192$"}],"Substitution":{"Ar":"$4\\cdot48=192$","En":"$4\\cdot48=192$"},"Result":{"Ar":"$192$","En":"$192$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$192/4=48$","En":"$192/4=48$"},"CommonError":{"Ar":"48 عدد عبوات طبقة واحدة.","En":"48 counts one layer."}}}$mw$::jsonb,$mw$نضرب عدد العناصر في الصف في عدد الصفوف ثم في عدد الطبقات.

$4\cdot6\cdot8=192$

1. $6\cdot8=48$

2. $4\cdot48=192$

$4\cdot48=192$

$192$

$192/4=48$

48 عدد عبوات طبقة واحدة.$mw$,$mw$Multiply items per row by rows per layer and then by layers.

$4\cdot6\cdot8=192$

1. $6\cdot8=48$

2. $4\cdot48=192$

$4\cdot48=192$

$192$

$192/4=48$

48 counts one layer.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد العبوات في طبقة واحدة.","En":"Count the containers in one layer."},{"Ar":"اضرب في عدد الطبقات.","En":"Multiply by the number of layers."}],"Solution":{"Idea":{"Ar":"نضرب عدد العناصر في الصف في عدد الصفوف ثم في عدد الطبقات.","En":"Multiply items per row by rows per layer and then by layers."},"FormulaLatex":"4\\cdot6\\cdot8=192","Steps":[{"Ar":"$6\\cdot8=48$","En":"$6\\cdot8=48$"},{"Ar":"$4\\cdot48=192$","En":"$4\\cdot48=192$"}],"Substitution":{"Ar":"$4\\cdot48=192$","En":"$4\\cdot48=192$"},"Result":{"Ar":"$192$","En":"$192$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$192/4=48$","En":"$192/4=48$"},"CommonError":{"Ar":"48 عدد عبوات طبقة واحدة.","En":"48 counts one layer."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"48 عدد عبوات طبقة واحدة.","En":"48 counts one layer."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"96 عدد عبوات طبقتين.","En":"96 counts two layers."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"224 لا يساوي حاصل ضرب الأعداد الثلاثة.","En":"224 is not the product of the three counts."},"Order":4}]}$mw$),
($mw$growth-v41-grade-5-estimation-bound-two-neighbor-products-1$mw$,$mw$estimation-bound-two-neighbor-products$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حصر حاصل ضرب دون حسابه","En":"Bounding a product without evaluating it"},"Question":{"Ar":"أي مجال يحتوي حاصل الضرب 38×21؟ استخدم 30<38<40 و20<21<30.","En":"Which interval contains the product 38×21? Use 30<38<40 and 20<21<30."},"Options":[{"LatexCode":"0<P<500","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحاصل أكبر من 600.","En":"The product exceeds 600."}},{"LatexCode":"600<P<1200","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1200<P<1600","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحاصل أصغر من 1200.","En":"The product is below 1200."}},{"LatexCode":"P>1600","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحاصل أقل من 1600.","En":"The product is below 1600."}}],"Hints":[{"Ar":"اضرب الحدين الأدنى معاً.","En":"Multiply the two lower bounds."},{"Ar":"اضرب الحدين الأعلى معاً.","En":"Multiply the two upper bounds."}],"Solution":{"Idea":{"Ar":"عند ضرب حدود موجبة نحصل على حد أدنى وحد أعلى للحاصل.","En":"Multiplying positive lower and upper bounds gives bounds for the product."},"FormulaLatex":"30\\cdot20<P<40\\cdot30","Steps":[{"Ar":"$30\\cdot20=600$","En":"$30\\cdot20=600$"},{"Ar":"$40\\cdot30=1200$","En":"$40\\cdot30=1200$"}],"Substitution":{"Ar":"$40\\cdot30=1200$","En":"$40\\cdot30=1200$"},"Result":{"Ar":"$600<P<1200$","En":"$600<P<1200$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$38\\cdot21=798$","En":"$38\\cdot21=798$"},"CommonError":{"Ar":"الحاصل أكبر من 600.","En":"The product exceeds 600."}}}$mw$::jsonb,$mw$عند ضرب حدود موجبة نحصل على حد أدنى وحد أعلى للحاصل.

$30\cdot20<P<40\cdot30$

1. $30\cdot20=600$

2. $40\cdot30=1200$

$40\cdot30=1200$

$600<P<1200$

$38\cdot21=798$

الحاصل أكبر من 600.$mw$,$mw$Multiplying positive lower and upper bounds gives bounds for the product.

$30\cdot20<P<40\cdot30$

1. $30\cdot20=600$

2. $40\cdot30=1200$

$40\cdot30=1200$

$600<P<1200$

$38\cdot21=798$

The product exceeds 600.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اضرب الحدين الأدنى معاً.","En":"Multiply the two lower bounds."},{"Ar":"اضرب الحدين الأعلى معاً.","En":"Multiply the two upper bounds."}],"Solution":{"Idea":{"Ar":"عند ضرب حدود موجبة نحصل على حد أدنى وحد أعلى للحاصل.","En":"Multiplying positive lower and upper bounds gives bounds for the product."},"FormulaLatex":"30\\cdot20<P<40\\cdot30","Steps":[{"Ar":"$30\\cdot20=600$","En":"$30\\cdot20=600$"},{"Ar":"$40\\cdot30=1200$","En":"$40\\cdot30=1200$"}],"Substitution":{"Ar":"$40\\cdot30=1200$","En":"$40\\cdot30=1200$"},"Result":{"Ar":"$600<P<1200$","En":"$600<P<1200$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$38\\cdot21=798$","En":"$38\\cdot21=798$"},"CommonError":{"Ar":"الحاصل أكبر من 600.","En":"The product exceeds 600."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الحاصل أكبر من 600.","En":"The product exceeds 600."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الحاصل أصغر من 1200.","En":"The product is below 1200."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الحاصل أقل من 1600.","En":"The product is below 1600."},"Order":4}]}$mw$),
($mw$growth-v41-grade-6-two-step-equation-division-then-subtraction-1$mw$,$mw$two-step-equation-division-then-subtraction$mw$,$mw$primary-two-step-equations$mw$,$mw$grade-6$mw$,6,1,2,10,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":10,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة قسمة ثم طرح","En":"Division followed by subtraction"},"Question":{"Ar":"حل المعادلة $x/5-3=4$.","En":"Solve the equation $x/5-3=4$."},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 ناتج ضرب 5 في الفرق 4−3.","En":"5 multiplies five by the difference 4−3."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 يهمل إضافة 3.","En":"20 omits adding three."}},{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"23 يعكس العمليتين بترتيب خاطئ.","En":"23 reverses the operations in the wrong order."}},{"LatexCode":"35","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اعكس الطرح أولاً.","En":"Undo subtraction first."},{"Ar":"اعكس القسمة بعد ذلك.","En":"Then undo division."}],"Solution":{"Idea":{"Ar":"نضيف 3 إلى الطرفين ثم نضرب الطرفين في 5.","En":"Add three to both sides, then multiply both sides by five."},"FormulaLatex":"x=5(4+3)","Steps":[{"Ar":"$x/5=7$","En":"$x/5=7$"},{"Ar":"$x=35$","En":"$x=35$"}],"Substitution":{"Ar":"$x=35$","En":"$x=35$"},"Result":{"Ar":"$35$","En":"$35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$35/5-3=4$","En":"$35/5-3=4$"},"CommonError":{"Ar":"5 ناتج ضرب 5 في الفرق 4−3.","En":"5 multiplies five by the difference 4−3."}}}$mw$::jsonb,$mw$نضيف 3 إلى الطرفين ثم نضرب الطرفين في 5.

$x=5(4+3)$

1. $x/5=7$

2. $x=35$

$x=35$

$35$

$35/5-3=4$

5 ناتج ضرب 5 في الفرق 4−3.$mw$,$mw$Add three to both sides, then multiply both sides by five.

$x=5(4+3)$

1. $x/5=7$

2. $x=35$

$x=35$

$35$

$35/5-3=4$

5 multiplies five by the difference 4−3.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اعكس الطرح أولاً.","En":"Undo subtraction first."},{"Ar":"اعكس القسمة بعد ذلك.","En":"Then undo division."}],"Solution":{"Idea":{"Ar":"نضيف 3 إلى الطرفين ثم نضرب الطرفين في 5.","En":"Add three to both sides, then multiply both sides by five."},"FormulaLatex":"x=5(4+3)","Steps":[{"Ar":"$x/5=7$","En":"$x/5=7$"},{"Ar":"$x=35$","En":"$x=35$"}],"Substitution":{"Ar":"$x=35$","En":"$x=35$"},"Result":{"Ar":"$35$","En":"$35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$35/5-3=4$","En":"$35/5-3=4$"},"CommonError":{"Ar":"5 ناتج ضرب 5 في الفرق 4−3.","En":"5 multiplies five by the difference 4−3."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"5 ناتج ضرب 5 في الفرق 4−3.","En":"5 multiplies five by the difference 4−3."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"20 يهمل إضافة 3.","En":"20 omits adding three."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"23 يعكس العمليتين بترتيب خاطئ.","En":"23 reverses the operations in the wrong order."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v41-grade-6-median-replacement-inner-crossing-1$mw$,$mw$median-replacement-inner-crossing$mw$,$mw$primary-median$mw$,$mw$grade-6$mw$,6,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الوسيط بعد تعديل قيمة","En":"Median after replacing a value"},"Question":{"Ar":"القيم 2،4،7،9،13. استُبدلت 4 بالقيمة 11. ما الوسيط بعد إعادة الترتيب؟","En":"The values are 2,4,7,9,13. The value 4 is replaced by 11. What is the median after reordering?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 الوسيط القديم.","En":"7 is the old median."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا نأخذ متوسط قيمتين لقائمة فردية.","En":"An odd-sized list does not need two middle values averaged."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"11 القيمة الرابعة.","En":"11 is fourth."}}],"Hints":[{"Ar":"ضع 11 في مكانها الصحيح بعد الترتيب.","En":"Put eleven in its correct sorted position."},{"Ar":"اختر القيمة الثالثة.","En":"Choose the third value."}],"Solution":{"Idea":{"Ar":"نعيد ترتيب البيانات قبل تحديد القيمة الوسطى.","En":"Reorder the observations before identifying the middle value."},"FormulaLatex":"n=5,\\quad (n+1)/2=3","Steps":[{"Ar":"تصبح القائمة المرتبة 2،7،9،11،13.","En":"The sorted list becomes 2,7,9,11,13."},{"Ar":"$x_3=9$","En":"$x_3=9$"}],"Substitution":{"Ar":"$x_3=9$","En":"$x_3=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"هناك قيمتان أصغر من 9 وقيمتان أكبر منه.","En":"Two values are below nine and two above it."},"CommonError":{"Ar":"7 الوسيط القديم.","En":"7 is the old median."}}}$mw$::jsonb,$mw$نعيد ترتيب البيانات قبل تحديد القيمة الوسطى.

$n=5,\quad (n+1)/2=3$

1. تصبح القائمة المرتبة 2،7،9،11،13.

2. $x_3=9$

$x_3=9$

$9$

هناك قيمتان أصغر من 9 وقيمتان أكبر منه.

7 الوسيط القديم.$mw$,$mw$Reorder the observations before identifying the middle value.

$n=5,\quad (n+1)/2=3$

1. The sorted list becomes 2,7,9,11,13.

2. $x_3=9$

$x_3=9$

$9$

Two values are below nine and two above it.

7 is the old median.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع 11 في مكانها الصحيح بعد الترتيب.","En":"Put eleven in its correct sorted position."},{"Ar":"اختر القيمة الثالثة.","En":"Choose the third value."}],"Solution":{"Idea":{"Ar":"نعيد ترتيب البيانات قبل تحديد القيمة الوسطى.","En":"Reorder the observations before identifying the middle value."},"FormulaLatex":"n=5,\\quad (n+1)/2=3","Steps":[{"Ar":"تصبح القائمة المرتبة 2،7،9،11،13.","En":"The sorted list becomes 2,7,9,11,13."},{"Ar":"$x_3=9$","En":"$x_3=9$"}],"Substitution":{"Ar":"$x_3=9$","En":"$x_3=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"هناك قيمتان أصغر من 9 وقيمتان أكبر منه.","En":"Two values are below nine and two above it."},"CommonError":{"Ar":"7 الوسيط القديم.","En":"7 is the old median."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"7 الوسيط القديم.","En":"7 is the old median."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا نأخذ متوسط قيمتين لقائمة فردية.","En":"An odd-sized list does not need two middle values averaged."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"11 القيمة الرابعة.","En":"11 is fourth."},"Order":4}]}$mw$),
($mw$growth-v41-grade-7-linear-equation-distribute-then-negative-coefficient-1$mw$,$mw$linear-equation-distribute-then-negative-coefficient$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حل معادلة بإشارة سالبة","En":"Equation with a negative factor"},"Question":{"Ar":"ما قيمة x التي تحقق $-3(x-4)=18$؟","En":"What value of x satisfies $-3(x-4)=18$?"},"Options":[{"LatexCode":"-10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−10 ينتج من طرح 4 بدلاً من جمعها.","En":"−10 subtracts four instead of adding it."}},{"LatexCode":"-2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 يعكس إشارة الحل.","En":"2 reverses the sign of the solution."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 يهمل إشارة المعامل السالب.","En":"10 ignores the negative factor."}}],"Hints":[{"Ar":"اقسم الطرفين على −3.","En":"Divide both sides by −3."},{"Ar":"أضف 4 إلى الطرفين.","En":"Add four to both sides."}],"Solution":{"Idea":{"Ar":"نقسم أولاً على المعامل السالب ثم نعزل المتغير.","En":"Divide by the negative factor, then isolate the variable."},"FormulaLatex":"x-4=18/(-3)","Steps":[{"Ar":"$x-4=-6$","En":"$x-4=-6$"},{"Ar":"$x=-2$","En":"$x=-2$"}],"Substitution":{"Ar":"$x=-2$","En":"$x=-2$"},"Result":{"Ar":"$-2$","En":"$-2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-3(-2-4)=18$","En":"$-3(-2-4)=18$"},"CommonError":{"Ar":"−10 ينتج من طرح 4 بدلاً من جمعها.","En":"−10 subtracts four instead of adding it."}}}$mw$::jsonb,$mw$نقسم أولاً على المعامل السالب ثم نعزل المتغير.

$x-4=18/(-3)$

1. $x-4=-6$

2. $x=-2$

$x=-2$

$-2$

$-3(-2-4)=18$

−10 ينتج من طرح 4 بدلاً من جمعها.$mw$,$mw$Divide by the negative factor, then isolate the variable.

$x-4=18/(-3)$

1. $x-4=-6$

2. $x=-2$

$x=-2$

$-2$

$-3(-2-4)=18$

−10 subtracts four instead of adding it.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم الطرفين على −3.","En":"Divide both sides by −3."},{"Ar":"أضف 4 إلى الطرفين.","En":"Add four to both sides."}],"Solution":{"Idea":{"Ar":"نقسم أولاً على المعامل السالب ثم نعزل المتغير.","En":"Divide by the negative factor, then isolate the variable."},"FormulaLatex":"x-4=18/(-3)","Steps":[{"Ar":"$x-4=-6$","En":"$x-4=-6$"},{"Ar":"$x=-2$","En":"$x=-2$"}],"Substitution":{"Ar":"$x=-2$","En":"$x=-2$"},"Result":{"Ar":"$-2$","En":"$-2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-3(-2-4)=18$","En":"$-3(-2-4)=18$"},"CommonError":{"Ar":"−10 ينتج من طرح 4 بدلاً من جمعها.","En":"−10 subtracts four instead of adding it."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−10 ينتج من طرح 4 بدلاً من جمعها.","En":"−10 subtracts four instead of adding it."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"2 يعكس إشارة الحل.","En":"2 reverses the sign of the solution."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"10 يهمل إشارة المعامل السالب.","En":"10 ignores the negative factor."},"Order":4}]}$mw$),
($mw$growth-v41-grade-7-sample-space-outcomes-forbidden-pair-1$mw$,$mw$sample-space-outcomes-forbidden-pair$mw$,$mw$sample-spaces$mw$,$mw$grade-7$mw$,7,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فضاء عينة بشرط استبعاد","En":"Sample space with an excluded pair"},"Question":{"Ar":"يختار طالب وجبة من A وB ومشروباً من X وY وZ. الزوج (B,Z) غير متاح، وبقية الأزواج متاحة. كم اختياراً مختلفاً يوجد؟","En":"A student selects a meal from A and B and a drink from X, Y, Z. The pair (B,Z) is unavailable, and all other pairs are available. How many distinct choices exist?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 عدد المشروبات وحدها.","En":"3 counts drinks alone."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يستبعد زوجين لا زوجاً واحداً.","En":"4 removes two pairs, not one."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يشمل الزوج غير المتاح.","En":"6 includes the unavailable pair."}}],"Hints":[{"Ar":"كم زوجاً لو كانت كلها متاحة؟","En":"How many pairs if all were available?"},{"Ar":"استبعد الزوج الواحد الممنوع.","En":"Remove the single unavailable pair."}],"Solution":{"Idea":{"Ar":"نحسب جميع الأزواج ثم نستبعد الزوج غير المتاح.","En":"Count all pairs and remove the unavailable pair."},"FormulaLatex":"2\\cdot3-1=5","Steps":[{"Ar":"$2\\cdot3=6$","En":"$2\\cdot3=6$"},{"Ar":"$6-1=5$","En":"$6-1=5$"}],"Substitution":{"Ar":"$6-1=5$","En":"$6-1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مع A ثلاثة مشروبات، ومع B مشروبان.","En":"A has three drink choices and B has two."},"CommonError":{"Ar":"3 عدد المشروبات وحدها.","En":"3 counts drinks alone."}}}$mw$::jsonb,$mw$نحسب جميع الأزواج ثم نستبعد الزوج غير المتاح.

$2\cdot3-1=5$

1. $2\cdot3=6$

2. $6-1=5$

$6-1=5$

$5$

مع A ثلاثة مشروبات، ومع B مشروبان.

3 عدد المشروبات وحدها.$mw$,$mw$Count all pairs and remove the unavailable pair.

$2\cdot3-1=5$

1. $2\cdot3=6$

2. $6-1=5$

$6-1=5$

$5$

A has three drink choices and B has two.

3 counts drinks alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم زوجاً لو كانت كلها متاحة؟","En":"How many pairs if all were available?"},{"Ar":"استبعد الزوج الواحد الممنوع.","En":"Remove the single unavailable pair."}],"Solution":{"Idea":{"Ar":"نحسب جميع الأزواج ثم نستبعد الزوج غير المتاح.","En":"Count all pairs and remove the unavailable pair."},"FormulaLatex":"2\\cdot3-1=5","Steps":[{"Ar":"$2\\cdot3=6$","En":"$2\\cdot3=6$"},{"Ar":"$6-1=5$","En":"$6-1=5$"}],"Substitution":{"Ar":"$6-1=5$","En":"$6-1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مع A ثلاثة مشروبات، ومع B مشروبان.","En":"A has three drink choices and B has two."},"CommonError":{"Ar":"3 عدد المشروبات وحدها.","En":"3 counts drinks alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 عدد المشروبات وحدها.","En":"3 counts drinks alone."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 يستبعد زوجين لا زوجاً واحداً.","En":"4 removes two pairs, not one."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"6 يشمل الزوج غير المتاح.","En":"6 includes the unavailable pair."},"Order":4}]}$mw$),
($mw$growth-v41-grade-11-trig-identity-factor-shared-squared-1$mw$,$mw$trig-identity-factor-shared-squared$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-11$mw$,11,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبسيط تعبير مثلثي بالتحليل","En":"Simplifying a trigonometric expression by factoring"},"Question":{"Ar":"أي تعبير يكافئ $\\sin^4\\theta+\\sin^2\\theta\\cos^2\\theta$ لكل زاوية حقيقية؟","En":"Which expression equals $\\sin^4\\theta+\\sin^2\\theta\\cos^2\\theta$ for every real angle?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 قيمة القوس فقط.","En":"1 is only the parenthesized factor."}},{"LatexCode":"\\sin^2\\theta","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\cos^2\\theta","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العامل المشترك مربع الجيب لا جيب التمام.","En":"The common factor is sine squared, not cosine squared."}},{"LatexCode":"\\sin^4\\theta","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل الحد الثاني.","En":"Omits the second term."}}],"Hints":[{"Ar":"استخرج العامل المشترك.","En":"Extract the common factor."},{"Ar":"ما قيمة مجموع مربعي الجيب وجيب التمام؟","En":"What is the sum of sine and cosine squared?"}],"Solution":{"Idea":{"Ar":"نستخرج مربع الجيب عاملاً مشتركاً ثم نستعمل المتطابقة الأساسية.","En":"Factor out sine squared and use the basic identity."},"FormulaLatex":"\\sin^2\\theta(\\sin^2\\theta+\\cos^2\\theta)","Steps":[{"Ar":"$\\sin^2\\theta+\\cos^2\\theta=1$","En":"$\\sin^2\\theta+\\cos^2\\theta=1$"},{"Ar":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$","En":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$"}],"Substitution":{"Ar":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$","En":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$"},"Result":{"Ar":"$\\sin^2\\theta$","En":"$\\sin^2\\theta$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=30^\\circ:\\ 1/16+3/16=1/4$","En":"$\\theta=30^\\circ:\\ 1/16+3/16=1/4$"},"CommonError":{"Ar":"1 قيمة القوس فقط.","En":"1 is only the parenthesized factor."}}}$mw$::jsonb,$mw$نستخرج مربع الجيب عاملاً مشتركاً ثم نستعمل المتطابقة الأساسية.

$\sin^2\theta(\sin^2\theta+\cos^2\theta)$

1. $\sin^2\theta+\cos^2\theta=1$

2. $\sin^2\theta\cdot1=\sin^2\theta$

$\sin^2\theta\cdot1=\sin^2\theta$

$\sin^2\theta$

$\theta=30^\circ:\ 1/16+3/16=1/4$

1 قيمة القوس فقط.$mw$,$mw$Factor out sine squared and use the basic identity.

$\sin^2\theta(\sin^2\theta+\cos^2\theta)$

1. $\sin^2\theta+\cos^2\theta=1$

2. $\sin^2\theta\cdot1=\sin^2\theta$

$\sin^2\theta\cdot1=\sin^2\theta$

$\sin^2\theta$

$\theta=30^\circ:\ 1/16+3/16=1/4$

1 is only the parenthesized factor.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استخرج العامل المشترك.","En":"Extract the common factor."},{"Ar":"ما قيمة مجموع مربعي الجيب وجيب التمام؟","En":"What is the sum of sine and cosine squared?"}],"Solution":{"Idea":{"Ar":"نستخرج مربع الجيب عاملاً مشتركاً ثم نستعمل المتطابقة الأساسية.","En":"Factor out sine squared and use the basic identity."},"FormulaLatex":"\\sin^2\\theta(\\sin^2\\theta+\\cos^2\\theta)","Steps":[{"Ar":"$\\sin^2\\theta+\\cos^2\\theta=1$","En":"$\\sin^2\\theta+\\cos^2\\theta=1$"},{"Ar":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$","En":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$"}],"Substitution":{"Ar":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$","En":"$\\sin^2\\theta\\cdot1=\\sin^2\\theta$"},"Result":{"Ar":"$\\sin^2\\theta$","En":"$\\sin^2\\theta$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=30^\\circ:\\ 1/16+3/16=1/4$","En":"$\\theta=30^\\circ:\\ 1/16+3/16=1/4$"},"CommonError":{"Ar":"1 قيمة القوس فقط.","En":"1 is only the parenthesized factor."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1 قيمة القوس فقط.","En":"1 is only the parenthesized factor."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"العامل المشترك مربع الجيب لا جيب التمام.","En":"The common factor is sine squared, not cosine squared."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يهمل الحد الثاني.","En":"Omits the second term."},"Order":4}]}$mw$),
($mw$growth-v41-grade-12-dot-product-projection-vector-components-1$mw$,$mw$dot-product-projection-vector-components$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الإسقاط المتجهي","En":"Vector projection"},"Question":{"Ar":"إذا كان u=(4,2) وv=(1,1)، فما الإسقاط المتجهي للمتجه u على اتجاه v؟","En":"If u=(4,2) and v=(1,1), what is the vector projection of u onto the direction of v?"},"Options":[{"LatexCode":"(2,2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 ليس معامل الإسقاط.","En":"2 is not the projection coefficient."}},{"LatexCode":"(3,3)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(6,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يهمل القسمة على مربع المعيار.","En":"6 omits division by the squared norm."}},{"LatexCode":"(4,2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"u ليس موازياً لـ v.","En":"u is not parallel to v."}}],"Hints":[{"Ar":"احسب الضرب القياسي.","En":"Calculate the dot product."},{"Ar":"اقسم على مربع معيار v واضرب في v.","En":"Divide by the squared norm of v and multiply by v."}],"Solution":{"Idea":{"Ar":"الإسقاط المتجهي يساوي المتجه v مضروباً في نسبة الضرب القياسي إلى مربع معياره.","En":"Vector projection is v multiplied by the dot product divided by the squared norm of v."},"FormulaLatex":"\\operatorname{proj}_v u=\\frac{u\\cdot v}{v\\cdot v}v","Steps":[{"Ar":"$u\\cdot v=6,\\quad v\\cdot v=2$","En":"$u\\cdot v=6,\\quad v\\cdot v=2$"},{"Ar":"$(6/2)(1,1)=(3,3)$","En":"$(6/2)(1,1)=(3,3)$"}],"Substitution":{"Ar":"$(6/2)(1,1)=(3,3)$","En":"$(6/2)(1,1)=(3,3)$"},"Result":{"Ar":"$(3,3)$","En":"$(3,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$((4,2)-(3,3))\\cdot(1,1)=0$","En":"$((4,2)-(3,3))\\cdot(1,1)=0$"},"CommonError":{"Ar":"2 ليس معامل الإسقاط.","En":"2 is not the projection coefficient."}}}$mw$::jsonb,$mw$الإسقاط المتجهي يساوي المتجه v مضروباً في نسبة الضرب القياسي إلى مربع معياره.

$\operatorname{proj}_v u=\frac{u\cdot v}{v\cdot v}v$

1. $u\cdot v=6,\quad v\cdot v=2$

2. $(6/2)(1,1)=(3,3)$

$(6/2)(1,1)=(3,3)$

$(3,3)$

$((4,2)-(3,3))\cdot(1,1)=0$

2 ليس معامل الإسقاط.$mw$,$mw$Vector projection is v multiplied by the dot product divided by the squared norm of v.

$\operatorname{proj}_v u=\frac{u\cdot v}{v\cdot v}v$

1. $u\cdot v=6,\quad v\cdot v=2$

2. $(6/2)(1,1)=(3,3)$

$(6/2)(1,1)=(3,3)$

$(3,3)$

$((4,2)-(3,3))\cdot(1,1)=0$

2 is not the projection coefficient.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الضرب القياسي.","En":"Calculate the dot product."},{"Ar":"اقسم على مربع معيار v واضرب في v.","En":"Divide by the squared norm of v and multiply by v."}],"Solution":{"Idea":{"Ar":"الإسقاط المتجهي يساوي المتجه v مضروباً في نسبة الضرب القياسي إلى مربع معياره.","En":"Vector projection is v multiplied by the dot product divided by the squared norm of v."},"FormulaLatex":"\\operatorname{proj}_v u=\\frac{u\\cdot v}{v\\cdot v}v","Steps":[{"Ar":"$u\\cdot v=6,\\quad v\\cdot v=2$","En":"$u\\cdot v=6,\\quad v\\cdot v=2$"},{"Ar":"$(6/2)(1,1)=(3,3)$","En":"$(6/2)(1,1)=(3,3)$"}],"Substitution":{"Ar":"$(6/2)(1,1)=(3,3)$","En":"$(6/2)(1,1)=(3,3)$"},"Result":{"Ar":"$(3,3)$","En":"$(3,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$((4,2)-(3,3))\\cdot(1,1)=0$","En":"$((4,2)-(3,3))\\cdot(1,1)=0$"},"CommonError":{"Ar":"2 ليس معامل الإسقاط.","En":"2 is not the projection coefficient."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 ليس معامل الإسقاط.","En":"2 is not the projection coefficient."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 يهمل القسمة على مربع المعيار.","En":"6 omits division by the squared norm."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"u ليس موازياً لـ v.","En":"u is not parallel to v."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v41 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
