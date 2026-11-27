-- One-time owner-authorized v25 original linked school growth. Two near-overlap candidates excluded.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v25-grade-1-missing-removed-count-from-before-after-1$mw$,$mw$missing-removed-count-from-before-after$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معرفة العدد الذي أُخرج","En":"Finding how many were removed"},"Question":{"Ar":"كان على الرف 13 كتاباً. بعد أن أخذ طفل بعض الكتب بقي 9 كتب. كم كتاباً أخذ؟","En":"There were 13 books on a shelf. After a child took some books, 9 remained. How many books did the child take?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إذا أخذ ثلاثة فسيبقى عشرة كتب لا تسعة.","En":"Taking three would leave ten, not nine."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تسعة هو عدد الكتب الباقية لا المأخوذة.","En":"Nine counts the books remaining, not those taken."}},{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع العدد الأصلي والباقي لا يعطي عدد الكتب المأخوذة.","En":"Adding the original and remaining counts does not give the number taken."}}],"Hints":[{"Ar":"ابدأ بالعدد الذي كان على الرف قبل الأخذ.","En":"Start with the number on the shelf before any were taken."},{"Ar":"اطرح التسعة الباقية من العدد الأصلي.","En":"Subtract the nine remaining from the original count."}],"Solution":{"Idea":{"Ar":"العدد الأصلي يساوي مجموع المأخوذ والباقي، لذا نطرح الباقي لمعرفة المأخوذ.","En":"The original count equals the sum of those taken and those left; subtract what remains to find what was taken."},"FormulaLatex":"13-9","Steps":[{"Ar":"كان العدد 13 ثم أصبح 9.","En":"The count began at 13 and became 9."},{"Ar":"نعد من 9 إلى 13: أربع خطوات.","En":"Count from 9 up to 13: four steps."}],"Substitution":{"Ar":"$13-9=4$","En":"$13-9=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"كتب","En":"Books"},"Verification":{"Ar":"إذا أعدنا الأربعة إلى التسعة يصبح المجموع 13.","En":"Returning the four to the nine restores the total 13."},"CommonError":{"Ar":"لا تطرح العدد الأصلي من الباقي.","En":"Do not subtract the original count from what remains."}}}$mw$::jsonb,$mw$العدد الأصلي يساوي مجموع المأخوذ والباقي، لذا نطرح الباقي لمعرفة المأخوذ.

$13-9$

1. كان العدد 13 ثم أصبح 9.

2. نعد من 9 إلى 13: أربع خطوات.

$13-9=4$

$4$ كتب

إذا أعدنا الأربعة إلى التسعة يصبح المجموع 13.

لا تطرح العدد الأصلي من الباقي.$mw$,$mw$The original count equals the sum of those taken and those left; subtract what remains to find what was taken.

$13-9$

1. The count began at 13 and became 9.

2. Count from 9 up to 13: four steps.

$13-9=4$

$4$ Books

Returning the four to the nine restores the total 13.

Do not subtract the original count from what remains.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالعدد الذي كان على الرف قبل الأخذ.","En":"Start with the number on the shelf before any were taken."},{"Ar":"اطرح التسعة الباقية من العدد الأصلي.","En":"Subtract the nine remaining from the original count."}],"Solution":{"Idea":{"Ar":"العدد الأصلي يساوي مجموع المأخوذ والباقي، لذا نطرح الباقي لمعرفة المأخوذ.","En":"The original count equals the sum of those taken and those left; subtract what remains to find what was taken."},"FormulaLatex":"13-9","Steps":[{"Ar":"كان العدد 13 ثم أصبح 9.","En":"The count began at 13 and became 9."},{"Ar":"نعد من 9 إلى 13: أربع خطوات.","En":"Count from 9 up to 13: four steps."}],"Substitution":{"Ar":"$13-9=4$","En":"$13-9=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"كتب","En":"Books"},"Verification":{"Ar":"إذا أعدنا الأربعة إلى التسعة يصبح المجموع 13.","En":"Returning the four to the nine restores the total 13."},"CommonError":{"Ar":"لا تطرح العدد الأصلي من الباقي.","En":"Do not subtract the original count from what remains."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"إذا أخذ ثلاثة فسيبقى عشرة كتب لا تسعة.","En":"Taking three would leave ten, not nine."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تسعة هو عدد الكتب الباقية لا المأخوذة.","En":"Nine counts the books remaining, not those taken."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع العدد الأصلي والباقي لا يعطي عدد الكتب المأخوذة.","En":"Adding the original and remaining counts does not give the number taken."},"Order":4}]}$mw$),
($mw$growth-v25-grade-1-count-distinct-labels-shared-boxes-1$mw$,$mw$count-distinct-labels-shared-boxes$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"العد دون تكرار الأشياء المشتركة","En":"Counting shared objects once"},"Question":{"Ar":"رسمت نور صفاً من خمسة مربعات. لوّنت أول ثلاثة مربعات بالأزرق، ثم وضعت دائرة داخل آخر ثلاثة مربعات. كم مربعاً يحمل لوناً أو دائرة أو كليهما؟","En":"Nour draws a row of five squares. She colours the first three blue and draws a circle inside the last three. How many squares have colour, a circle, or both?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ مجموعة واحدة فقط وأهمل المربعات الأخرى.","En":"Counts just one group and ignores the other squares."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استبعد المربع الأوسط رغم أنه يحمل العلامتين.","En":"Excludes the middle square even though it has both markings."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب المربع الأوسط مرتين.","En":"Counts the middle square twice."}}],"Hints":[{"Ar":"تخيل المربعات مرقمة من 1 إلى 5.","En":"Imagine the squares numbered from 1 to 5."},{"Ar":"لاحظ أن المربع الثالث موجود في المجموعتين، فلا تعده مرتين.","En":"Notice that square three belongs to both groups; count it only once."}],"Solution":{"Idea":{"Ar":"عند عد الأشياء التي تحمل إحدى علامتين نعد كل شيء مرة واحدة حتى لو حمل العلامتين.","En":"When counting objects with either of two markings, count each object once even if it has both."},"FormulaLatex":"3+3-1","Steps":[{"Ar":"المربعات الملونة هي 1 و2 و3.","En":"The coloured squares are 1, 2 and 3."},{"Ar":"المربعات ذات الدائرة هي 3 و4 و5؛ المربع الثالث مشترك.","En":"Squares with circles are 3, 4 and 5; the third is shared."},{"Ar":"نعد المربعات المختلفة: 1 و2 و3 و4 و5.","En":"Count the distinct squares: 1, 2, 3, 4 and 5."}],"Substitution":{"Ar":"$3+3-1=5$","En":"$3+3-1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"مربعات","En":"Squares"},"Verification":{"Ar":"كل واحد من المربعات الخمسة يحمل علامة واحدة على الأقل؛ فلا يمكن أن يكون العدد ستة.","En":"All five squares have at least one marking; the count cannot be six."},"CommonError":{"Ar":"لا تعد المربع المشترك مرتين.","En":"Do not count the shared square twice."}}}$mw$::jsonb,$mw$عند عد الأشياء التي تحمل إحدى علامتين نعد كل شيء مرة واحدة حتى لو حمل العلامتين.

$3+3-1$

1. المربعات الملونة هي 1 و2 و3.

2. المربعات ذات الدائرة هي 3 و4 و5؛ المربع الثالث مشترك.

3. نعد المربعات المختلفة: 1 و2 و3 و4 و5.

$3+3-1=5$

$5$ مربعات

كل واحد من المربعات الخمسة يحمل علامة واحدة على الأقل؛ فلا يمكن أن يكون العدد ستة.

لا تعد المربع المشترك مرتين.$mw$,$mw$When counting objects with either of two markings, count each object once even if it has both.

$3+3-1$

1. The coloured squares are 1, 2 and 3.

2. Squares with circles are 3, 4 and 5; the third is shared.

3. Count the distinct squares: 1, 2, 3, 4 and 5.

$3+3-1=5$

$5$ Squares

All five squares have at least one marking; the count cannot be six.

Do not count the shared square twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل المربعات مرقمة من 1 إلى 5.","En":"Imagine the squares numbered from 1 to 5."},{"Ar":"لاحظ أن المربع الثالث موجود في المجموعتين، فلا تعده مرتين.","En":"Notice that square three belongs to both groups; count it only once."}],"Solution":{"Idea":{"Ar":"عند عد الأشياء التي تحمل إحدى علامتين نعد كل شيء مرة واحدة حتى لو حمل العلامتين.","En":"When counting objects with either of two markings, count each object once even if it has both."},"FormulaLatex":"3+3-1","Steps":[{"Ar":"المربعات الملونة هي 1 و2 و3.","En":"The coloured squares are 1, 2 and 3."},{"Ar":"المربعات ذات الدائرة هي 3 و4 و5؛ المربع الثالث مشترك.","En":"Squares with circles are 3, 4 and 5; the third is shared."},{"Ar":"نعد المربعات المختلفة: 1 و2 و3 و4 و5.","En":"Count the distinct squares: 1, 2, 3, 4 and 5."}],"Substitution":{"Ar":"$3+3-1=5$","En":"$3+3-1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"مربعات","En":"Squares"},"Verification":{"Ar":"كل واحد من المربعات الخمسة يحمل علامة واحدة على الأقل؛ فلا يمكن أن يكون العدد ستة.","En":"All five squares have at least one marking; the count cannot be six."},"CommonError":{"Ar":"لا تعد المربع المشترك مرتين.","En":"Do not count the shared square twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عدّ مجموعة واحدة فقط وأهمل المربعات الأخرى.","En":"Counts just one group and ignores the other squares."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استبعد المربع الأوسط رغم أنه يحمل العلامتين.","En":"Excludes the middle square even though it has both markings."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب المربع الأوسط مرتين.","En":"Counts the middle square twice."},"Order":4}]}$mw$),
($mw$growth-v25-grade-2-count-multiples-five-from-offset-1$mw$,$mw$count-multiples-five-from-offset$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد الخطوات حتى عدد مستهدف","En":"Counting steps to a target"},"Question":{"Ar":"بدأت سارة من 7، وتضيف 5 في كل خطوة. وصلت إلى 32. كم خطوة أجرتها بعد العدد 7؟","En":"Sara starts at 7 and adds 5 at each step. She reaches 32. How many steps did she take after the starting number 7?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربع خطوات تصل إلى 27 فقط.","En":"Four steps reach only 27."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ست خطوات تصل إلى 37، بعد العدد المطلوب.","En":"Six steps reach 37, beyond the target."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"25 هو الفرق بين العددين وليس عدد الخطوات.","En":"25 is the difference, not the number of steps."}}],"Hints":[{"Ar":"اكتب الأعداد التي تصل إليها عند إضافة خمسة.","En":"List the numbers reached by adding five."},{"Ar":"عد الانتقالات فقط، ولا تعد نقطة البداية خطوة.","En":"Count transitions only; the starting number is not a step."}],"Solution":{"Idea":{"Ar":"نعد القفزات المتساوية بمقدار خمسة حتى العدد المطلوب.","En":"Count equal jumps of size five until reaching the target."},"FormulaLatex":"7+5+5+5+5+5","Steps":[{"Ar":"الأعداد التي نصل إليها هي 12،17،22،27،32.","En":"The numbers reached are 12, 17, 22, 27, 32."},{"Ar":"هذه خمس قفزات بعد البداية 7.","En":"These are five jumps after the starting number 7."}],"Substitution":{"Ar":"$32-7=25=5+5+5+5+5$","En":"$32-7=25=5+5+5+5+5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"خطوات","En":"Steps"},"Verification":{"Ar":"بعد خمس إضافات مقدار كل منها 5 نحصل على 7+25=32.","En":"Five additions of size 5 give 7+25=32."},"CommonError":{"Ar":"لا تعد العدد 7 ضمن الخطوات.","En":"Do not count 7 as a step."}}}$mw$::jsonb,$mw$نعد القفزات المتساوية بمقدار خمسة حتى العدد المطلوب.

$7+5+5+5+5+5$

1. الأعداد التي نصل إليها هي 12،17،22،27،32.

2. هذه خمس قفزات بعد البداية 7.

$32-7=25=5+5+5+5+5$

$5$ خطوات

بعد خمس إضافات مقدار كل منها 5 نحصل على 7+25=32.

لا تعد العدد 7 ضمن الخطوات.$mw$,$mw$Count equal jumps of size five until reaching the target.

$7+5+5+5+5+5$

1. The numbers reached are 12, 17, 22, 27, 32.

2. These are five jumps after the starting number 7.

$32-7=25=5+5+5+5+5$

$5$ Steps

Five additions of size 5 give 7+25=32.

Do not count 7 as a step.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الأعداد التي تصل إليها عند إضافة خمسة.","En":"List the numbers reached by adding five."},{"Ar":"عد الانتقالات فقط، ولا تعد نقطة البداية خطوة.","En":"Count transitions only; the starting number is not a step."}],"Solution":{"Idea":{"Ar":"نعد القفزات المتساوية بمقدار خمسة حتى العدد المطلوب.","En":"Count equal jumps of size five until reaching the target."},"FormulaLatex":"7+5+5+5+5+5","Steps":[{"Ar":"الأعداد التي نصل إليها هي 12،17،22،27،32.","En":"The numbers reached are 12, 17, 22, 27, 32."},{"Ar":"هذه خمس قفزات بعد البداية 7.","En":"These are five jumps after the starting number 7."}],"Substitution":{"Ar":"$32-7=25=5+5+5+5+5$","En":"$32-7=25=5+5+5+5+5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"خطوات","En":"Steps"},"Verification":{"Ar":"بعد خمس إضافات مقدار كل منها 5 نحصل على 7+25=32.","En":"Five additions of size 5 give 7+25=32."},"CommonError":{"Ar":"لا تعد العدد 7 ضمن الخطوات.","En":"Do not count 7 as a step."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أربع خطوات تصل إلى 27 فقط.","En":"Four steps reach only 27."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ست خطوات تصل إلى 37، بعد العدد المطلوب.","En":"Six steps reach 37, beyond the target."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"25 هو الفرق بين العددين وليس عدد الخطوات.","En":"25 is the difference, not the number of steps."},"Order":4}]}$mw$),
($mw$growth-v25-grade-6-percent-weighted-two-group-attendance-1$mw$,$mw$percent-weighted-two-group-attendance$mw$,$mw$p-fractions-decimals-basic-percentages$mw$,$mw$grade-6$mw$,6,1,21,93,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":93,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"النسبة الكلية لمجموعتين مختلفتي الحجم","En":"Combined percentage for unequal groups"},"Question":{"Ar":"في المجموعة A يوجد 20 طالباً حضر منهم 90%. وفي المجموعة B يوجد 30 طالباً حضر منهم 60%. ما النسبة المئوية للحاضرين من المجموعتين معاً؟","En":"Group A has 20 pupils, of whom 90% attended. Group B has 30 pupils, of whom 60% attended. What percentage of all pupils in the two groups attended?"},"Options":[{"LatexCode":"60\\%","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60% نسبة المجموعة الثانية فقط.","En":"60% is the second group's attendance alone."}},{"LatexCode":"72\\%","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"75\\%","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"75% متوسط النسبتين دون مراعاة اختلاف حجمي المجموعتين.","En":"75% averages the two rates without accounting for different group sizes."}},{"LatexCode":"90\\%","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"90% نسبة المجموعة الأولى فقط.","En":"90% is the first group's attendance alone."}}],"Hints":[{"Ar":"احسب عدد الحاضرين في كل مجموعة على حدة.","En":"Calculate the number attending in each group separately."},{"Ar":"اجمع الحاضرين واقسمهم على إجمالي عدد الطلاب في المجموعتين.","En":"Add attendees and divide by the total number of pupils in both groups."}],"Solution":{"Idea":{"Ar":"النسبة المئوية الكلية هي نسبة مجموع الأجزاء إلى مجموع الكميات الكلية الموجبة؛ ليست المتوسط البسيط للنسب عند اختلاف الأوزان.","En":"The overall percentage is the ratio of the combined parts to the positive combined total; it is not the simple average of rates when group sizes differ."},"FormulaLatex":"p=\\frac{0.9(20)+0.6(30)}{20+30}\\times100\\%","Steps":[{"Ar":"حضر 18 طالباً من المجموعة الأولى لأن 0.9×20=18.","En":"18 attended from group A because 0.9×20=18."},{"Ar":"حضر 18 طالباً من المجموعة الثانية لأن 0.6×30=18.","En":"18 attended from group B because 0.6×30=18."},{"Ar":"حضر 36 من مجموع 50 طالباً؛ نحول الكسر إلى نسبة مئوية.","En":"36 out of 50 attended; convert the fraction to a percentage."}],"Substitution":{"Ar":"$\\frac{36}{50}\\times100\\%=72\\%$","En":"$\\frac{36}{50}\\times100\\%=72\\%$"},"Result":{"Ar":"$72\\%$","En":"$72\\%$"},"Unit":{"Ar":"نسبة مئوية","En":"Percentage"},"Verification":{"Ar":"غاب 14 من 50 أي 28%، ومجموع نسبتي الحضور والغياب 100%.","En":"14 of 50 were absent, or 28%; attendance and absence add to 100%."},"CommonError":{"Ar":"لا تأخذ متوسط النسبتين قبل النظر إلى حجمي المجموعتين.","En":"Do not average the rates before considering group sizes."}}}$mw$::jsonb,$mw$النسبة المئوية الكلية هي نسبة مجموع الأجزاء إلى مجموع الكميات الكلية الموجبة؛ ليست المتوسط البسيط للنسب عند اختلاف الأوزان.

$p=\frac{0.9(20)+0.6(30)}{20+30}\times100\%$

1. حضر 18 طالباً من المجموعة الأولى لأن 0.9×20=18.

2. حضر 18 طالباً من المجموعة الثانية لأن 0.6×30=18.

3. حضر 36 من مجموع 50 طالباً؛ نحول الكسر إلى نسبة مئوية.

$\frac{36}{50}\times100\%=72\%$

$72\%$ نسبة مئوية

غاب 14 من 50 أي 28%، ومجموع نسبتي الحضور والغياب 100%.

لا تأخذ متوسط النسبتين قبل النظر إلى حجمي المجموعتين.$mw$,$mw$The overall percentage is the ratio of the combined parts to the positive combined total; it is not the simple average of rates when group sizes differ.

$p=\frac{0.9(20)+0.6(30)}{20+30}\times100\%$

1. 18 attended from group A because 0.9×20=18.

2. 18 attended from group B because 0.6×30=18.

3. 36 out of 50 attended; convert the fraction to a percentage.

$\frac{36}{50}\times100\%=72\%$

$72\%$ Percentage

14 of 50 were absent, or 28%; attendance and absence add to 100%.

Do not average the rates before considering group sizes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد الحاضرين في كل مجموعة على حدة.","En":"Calculate the number attending in each group separately."},{"Ar":"اجمع الحاضرين واقسمهم على إجمالي عدد الطلاب في المجموعتين.","En":"Add attendees and divide by the total number of pupils in both groups."}],"Solution":{"Idea":{"Ar":"النسبة المئوية الكلية هي نسبة مجموع الأجزاء إلى مجموع الكميات الكلية الموجبة؛ ليست المتوسط البسيط للنسب عند اختلاف الأوزان.","En":"The overall percentage is the ratio of the combined parts to the positive combined total; it is not the simple average of rates when group sizes differ."},"FormulaLatex":"p=\\frac{0.9(20)+0.6(30)}{20+30}\\times100\\%","Steps":[{"Ar":"حضر 18 طالباً من المجموعة الأولى لأن 0.9×20=18.","En":"18 attended from group A because 0.9×20=18."},{"Ar":"حضر 18 طالباً من المجموعة الثانية لأن 0.6×30=18.","En":"18 attended from group B because 0.6×30=18."},{"Ar":"حضر 36 من مجموع 50 طالباً؛ نحول الكسر إلى نسبة مئوية.","En":"36 out of 50 attended; convert the fraction to a percentage."}],"Substitution":{"Ar":"$\\frac{36}{50}\\times100\\%=72\\%$","En":"$\\frac{36}{50}\\times100\\%=72\\%$"},"Result":{"Ar":"$72\\%$","En":"$72\\%$"},"Unit":{"Ar":"نسبة مئوية","En":"Percentage"},"Verification":{"Ar":"غاب 14 من 50 أي 28%، ومجموع نسبتي الحضور والغياب 100%.","En":"14 of 50 were absent, or 28%; attendance and absence add to 100%."},"CommonError":{"Ar":"لا تأخذ متوسط النسبتين قبل النظر إلى حجمي المجموعتين.","En":"Do not average the rates before considering group sizes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"60% نسبة المجموعة الثانية فقط.","En":"60% is the second group's attendance alone."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"75% متوسط النسبتين دون مراعاة اختلاف حجمي المجموعتين.","En":"75% averages the two rates without accounting for different group sizes."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"90% نسبة المجموعة الأولى فقط.","En":"90% is the first group's attendance alone."},"Order":4}]}$mw$),
($mw$growth-v25-grade-9-inequality-check-counterexample-wrong-sign-1$mw$,$mw$inequality-check-counterexample-wrong-sign$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اكتشاف حل خاطئ لمتباينة","En":"Finding a counterexample to an inequality claim"},"Question":{"Ar":"حل طالب المتباينة $-3x>9$ وادعى أن الحل $x>-3$. أي قيمة من الخيارات تحقق المتباينة الأصلية ولكنها لا تحقق الحل الذي ادعاه؟","En":"A pupil solves $-3x>9$ and claims that the solution is $x>-3$. Which option satisfies the original inequality but not the pupil's claimed solution?"},"Options":[{"LatexCode":"-4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند −3 يصبح الطرف الأيسر 9؛ المطلوب أكبر من 9 بصرامة.","En":"At −3 the left side is 9, but the inequality is strictly greater."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند صفر يصبح الطرف الأيسر صفر، فلا يحقق الأصل.","En":"At zero the left side is zero, so the original fails."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند 4 يكون الطرف الأيسر −12، فلا يحقق الأصل.","En":"At 4 the left side is −12, so the original fails."}}],"Hints":[{"Ar":"تذكر أثر القسمة على عدد سالب في اتجاه المتباينة.","En":"Recall the effect of dividing an inequality by a negative number."},{"Ar":"اختبر القيمتين الأقل من أو المساويتين للحد −3 في المتباينة الأصلية.","En":"Test the options below or equal to −3 in the original inequality."}],"Solution":{"Idea":{"Ar":"قسمة متباينة على عدد سالب تقلب اتجاهها؛ ويمكن التحقق من خطأ مجموعة حلول باستعمال مثال مضاد.","En":"Dividing an inequality by a negative number reverses its direction; a counterexample can demonstrate a faulty solution set."},"FormulaLatex":"-3x>9\\iff x<-3","Steps":[{"Ar":"نقسم الطرفين على $-3$ ونقلب الإشارة، فيصبح الحل $x<-3$.","En":"Divide both sides by $-3$ and reverse the sign, giving $x<-3$."},{"Ar":"القيمة −4 هي الخيار الوحيد الأصغر من −3.","En":"−4 is the only option below −3."},{"Ar":"بالتعويض $-3(-4)=12>9$، لكنها لا تحقق $x>-3$.","En":"Substituting gives $-3(-4)=12>9$, but the value does not satisfy $x>-3$."}],"Substitution":{"Ar":"$12>9$","En":"$12>9$"},"Result":{"Ar":"$-4$","En":"$-4$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"الحد −3 يعطي مساواة لا متباينة صارمة، لذلك هو مستبعد؛ −4 تحقق الشرطين المطلوبين للمثال المضاد.","En":"The boundary −3 gives equality, not a strict inequality, so it is excluded; −4 satisfies both requirements for the counterexample."},"CommonError":{"Ar":"لا تبق اتجاه المتباينة عند القسمة على عدد سالب.","En":"Do not preserve the inequality direction when dividing by a negative number."}}}$mw$::jsonb,$mw$قسمة متباينة على عدد سالب تقلب اتجاهها؛ ويمكن التحقق من خطأ مجموعة حلول باستعمال مثال مضاد.

$-3x>9\iff x<-3$

1. نقسم الطرفين على $-3$ ونقلب الإشارة، فيصبح الحل $x<-3$.

2. القيمة −4 هي الخيار الوحيد الأصغر من −3.

3. بالتعويض $-3(-4)=12>9$، لكنها لا تحقق $x>-3$.

$12>9$

$-4$ بلا وحدة قياس

الحد −3 يعطي مساواة لا متباينة صارمة، لذلك هو مستبعد؛ −4 تحقق الشرطين المطلوبين للمثال المضاد.

لا تبق اتجاه المتباينة عند القسمة على عدد سالب.$mw$,$mw$Dividing an inequality by a negative number reverses its direction; a counterexample can demonstrate a faulty solution set.

$-3x>9\iff x<-3$

1. Divide both sides by $-3$ and reverse the sign, giving $x<-3$.

2. −4 is the only option below −3.

3. Substituting gives $-3(-4)=12>9$, but the value does not satisfy $x>-3$.

$12>9$

$-4$ Dimensionless

The boundary −3 gives equality, not a strict inequality, so it is excluded; −4 satisfies both requirements for the counterexample.

Do not preserve the inequality direction when dividing by a negative number.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تذكر أثر القسمة على عدد سالب في اتجاه المتباينة.","En":"Recall the effect of dividing an inequality by a negative number."},{"Ar":"اختبر القيمتين الأقل من أو المساويتين للحد −3 في المتباينة الأصلية.","En":"Test the options below or equal to −3 in the original inequality."}],"Solution":{"Idea":{"Ar":"قسمة متباينة على عدد سالب تقلب اتجاهها؛ ويمكن التحقق من خطأ مجموعة حلول باستعمال مثال مضاد.","En":"Dividing an inequality by a negative number reverses its direction; a counterexample can demonstrate a faulty solution set."},"FormulaLatex":"-3x>9\\iff x<-3","Steps":[{"Ar":"نقسم الطرفين على $-3$ ونقلب الإشارة، فيصبح الحل $x<-3$.","En":"Divide both sides by $-3$ and reverse the sign, giving $x<-3$."},{"Ar":"القيمة −4 هي الخيار الوحيد الأصغر من −3.","En":"−4 is the only option below −3."},{"Ar":"بالتعويض $-3(-4)=12>9$، لكنها لا تحقق $x>-3$.","En":"Substituting gives $-3(-4)=12>9$, but the value does not satisfy $x>-3$."}],"Substitution":{"Ar":"$12>9$","En":"$12>9$"},"Result":{"Ar":"$-4$","En":"$-4$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"الحد −3 يعطي مساواة لا متباينة صارمة، لذلك هو مستبعد؛ −4 تحقق الشرطين المطلوبين للمثال المضاد.","En":"The boundary −3 gives equality, not a strict inequality, so it is excluded; −4 satisfies both requirements for the counterexample."},"CommonError":{"Ar":"لا تبق اتجاه المتباينة عند القسمة على عدد سالب.","En":"Do not preserve the inequality direction when dividing by a negative number."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عند −3 يصبح الطرف الأيسر 9؛ المطلوب أكبر من 9 بصرامة.","En":"At −3 the left side is 9, but the inequality is strictly greater."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عند صفر يصبح الطرف الأيسر صفر، فلا يحقق الأصل.","En":"At zero the left side is zero, so the original fails."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عند 4 يكون الطرف الأيسر −12، فلا يحقق الأصل.","En":"At 4 the left side is −12, so the original fails."},"Order":4}]}$mw$),
($mw$growth-v25-grade-9-probability-disjoint-events-from-union-1$mw$,$mw$probability-disjoint-events-from-union$mw$,$mw$simple-compound-events$mw$,$mw$grade-9$mw$,9,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج احتمال حدث من اتحاد حدثين متنافيين","En":"Recovering an event probability from a disjoint union"},"Question":{"Ar":"في تجربة عشوائية، الحدثان $A$ و$B$ متنافيان، و$P(A)=0.35$ و$P(A\\cup B)=0.8$. ما قيمة $P(B)$؟","En":"In a random experiment, events $A$ and $B$ are disjoint, with $P(A)=0.35$ and $P(A\\cup B)=0.8$. What is $P(B)$?"},"Options":[{"LatexCode":"0.20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.20 هو احتمال عدم وقوع أي من الحدثين.","En":"0.20 is the probability that neither event occurs."}},{"LatexCode":"0.35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.35 هو احتمال الحدث A المعطى.","En":"0.35 is the given probability of A."}},{"LatexCode":"0.45","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.80","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"0.80 احتمال الاتحاد وليس الحدث B منفرداً.","En":"0.80 is the union probability, not B alone."}}],"Hints":[{"Ar":"ما احتمال وقوع الحدثين المتنافيين معاً؟","En":"What is the probability that both disjoint events occur together?"},{"Ar":"استخدم جمع احتمالي الحدثين ثم اطرح الاحتمال المعطى للحدث A.","En":"Use the sum of the event probabilities, then subtract the given probability of A."}],"Solution":{"Idea":{"Ar":"الحدثان المتنافيان لا يمكن وقوعهما معاً، وبالتالي احتمال تقاطعهما صفر؛ احتمال اتحادهما مجموع احتماليهما.","En":"Disjoint events cannot occur together, so their intersection probability is zero and their union probability is the sum of their probabilities."},"FormulaLatex":"P(A\\cup B)=P(A)+P(B)-P(A\\cap B)","Steps":[{"Ar":"بما أن الحدثين متنافيان فإن $P(A\\cap B)=0$.","En":"Because the events are disjoint, $P(A\\cap B)=0$."},{"Ar":"نعوض في قاعدة الجمع: $0.8=0.35+P(B)$.","En":"Substitute into the addition rule: $0.8=0.35+P(B)$."},{"Ar":"نطرح 0.35 من الطرفين لنجد احتمال B.","En":"Subtract 0.35 from both sides to find the probability of B."}],"Substitution":{"Ar":"$0.8-0.35=0.45$","En":"$0.8-0.35=0.45$"},"Result":{"Ar":"$0.45$","En":"$0.45$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"0.35+0.45=0.80، والاحتمال الناتج يقع بين صفر وواحد.","En":"0.35+0.45=0.80, and the resulting probability lies between zero and one."},"CommonError":{"Ar":"لا تستخدم قاعدة ضرب احتمالات الأحداث المستقلة؛ التنافي مختلف عن الاستقلال.","En":"Do not use the multiplication rule for independent events; disjointness differs from independence."}}}$mw$::jsonb,$mw$الحدثان المتنافيان لا يمكن وقوعهما معاً، وبالتالي احتمال تقاطعهما صفر؛ احتمال اتحادهما مجموع احتماليهما.

$P(A\cup B)=P(A)+P(B)-P(A\cap B)$

1. بما أن الحدثين متنافيان فإن $P(A\cap B)=0$.

2. نعوض في قاعدة الجمع: $0.8=0.35+P(B)$.

3. نطرح 0.35 من الطرفين لنجد احتمال B.

$0.8-0.35=0.45$

$0.45$ بلا وحدة قياس

0.35+0.45=0.80، والاحتمال الناتج يقع بين صفر وواحد.

لا تستخدم قاعدة ضرب احتمالات الأحداث المستقلة؛ التنافي مختلف عن الاستقلال.$mw$,$mw$Disjoint events cannot occur together, so their intersection probability is zero and their union probability is the sum of their probabilities.

$P(A\cup B)=P(A)+P(B)-P(A\cap B)$

1. Because the events are disjoint, $P(A\cap B)=0$.

2. Substitute into the addition rule: $0.8=0.35+P(B)$.

3. Subtract 0.35 from both sides to find the probability of B.

$0.8-0.35=0.45$

$0.45$ Dimensionless

0.35+0.45=0.80, and the resulting probability lies between zero and one.

Do not use the multiplication rule for independent events; disjointness differs from independence.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما احتمال وقوع الحدثين المتنافيين معاً؟","En":"What is the probability that both disjoint events occur together?"},{"Ar":"استخدم جمع احتمالي الحدثين ثم اطرح الاحتمال المعطى للحدث A.","En":"Use the sum of the event probabilities, then subtract the given probability of A."}],"Solution":{"Idea":{"Ar":"الحدثان المتنافيان لا يمكن وقوعهما معاً، وبالتالي احتمال تقاطعهما صفر؛ احتمال اتحادهما مجموع احتماليهما.","En":"Disjoint events cannot occur together, so their intersection probability is zero and their union probability is the sum of their probabilities."},"FormulaLatex":"P(A\\cup B)=P(A)+P(B)-P(A\\cap B)","Steps":[{"Ar":"بما أن الحدثين متنافيان فإن $P(A\\cap B)=0$.","En":"Because the events are disjoint, $P(A\\cap B)=0$."},{"Ar":"نعوض في قاعدة الجمع: $0.8=0.35+P(B)$.","En":"Substitute into the addition rule: $0.8=0.35+P(B)$."},{"Ar":"نطرح 0.35 من الطرفين لنجد احتمال B.","En":"Subtract 0.35 from both sides to find the probability of B."}],"Substitution":{"Ar":"$0.8-0.35=0.45$","En":"$0.8-0.35=0.45$"},"Result":{"Ar":"$0.45$","En":"$0.45$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"0.35+0.45=0.80، والاحتمال الناتج يقع بين صفر وواحد.","En":"0.35+0.45=0.80, and the resulting probability lies between zero and one."},"CommonError":{"Ar":"لا تستخدم قاعدة ضرب احتمالات الأحداث المستقلة؛ التنافي مختلف عن الاستقلال.","En":"Do not use the multiplication rule for independent events; disjointness differs from independence."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"0.20 هو احتمال عدم وقوع أي من الحدثين.","En":"0.20 is the probability that neither event occurs."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"0.35 هو احتمال الحدث A المعطى.","En":"0.35 is the given probability of A."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"0.80 احتمال الاتحاد وليس الحدث B منفرداً.","En":"0.80 is the union probability, not B alone."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v25 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
