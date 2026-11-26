-- One-time owner-authorized v23 original linked school growth. Held count-gap and binary adjacency candidates excluded.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v23-grade-1-choose-subtraction-expression-1$mw$,$mw$choose-subtraction-expression$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار عملية الطرح المناسبة","En":"Choosing the subtraction expression"},"Question":{"Ar":"لدى مريم 9 ملصقات. تريد أن تحتفظ بأربعة منها وتعطي الباقي لصديقتها. أي تعبير يحسب عدد الملصقات التي ستعطيها؟","En":"Mariam has 9 stickers. She wants to keep four and give the rest to her friend. Which expression finds how many she will give?"},"Options":[{"LatexCode":"9+4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع يزيد العدد ولا يفصل الجزء المحتفظ به.","En":"Addition increases the count rather than removing the kept part."}},{"LatexCode":"9-4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4-9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بدأ بالجزء المحتفظ به وطرح الكل منه.","En":"Starts with the kept part and subtracts the whole."}},{"LatexCode":"9-0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الصفر يتجاهل الملصقات المحتفظ بها.","En":"Subtracting zero ignores the kept stickers."}}],"Hints":[{"Ar":"حدّد العدد الكلي والجزء الذي لن تعطيه مريم.","En":"Identify the total and the part Mariam will not give."},{"Ar":"لإيجاد الباقي اطرح الجزء المحتفظ به من الكل.","En":"To find the rest, subtract the kept part from the whole."}],"Solution":{"Idea":{"Ar":"نقسم مجموعة الملصقات إلى جزأين لا يتداخلان: ما تحتفظ به وما تعطيه.","En":"Partition the stickers into two disjoint parts: those kept and those given."},"FormulaLatex":"9-4","Steps":[{"Ar":"الكل 9 والجزء المحتفظ به 4.","En":"The total is 9 and the kept part is 4."},{"Ar":"التعبير المطلوب هو 9 ناقص 4؛ ويساوي 5.","En":"The required expression is 9 minus 4, which equals 5."}],"Substitution":{"Ar":"$9-4=5$","En":"$9-4=5$"},"Result":{"Ar":"$9-4$","En":"$9-4$"},"Unit":{"Ar":"تعبير حسابي","En":"Arithmetic expression"},"Verification":{"Ar":"خمسة ملصقات مع الأربعة المحتفظ بها تعيد العدد 9.","En":"Five given plus four kept restores the total of nine."},"CommonError":{"Ar":"لا تعكس ترتيب الطرح.","En":"Do not reverse the subtraction."}}}$mw$::jsonb,$mw$نقسم مجموعة الملصقات إلى جزأين لا يتداخلان: ما تحتفظ به وما تعطيه.

$9-4$

1. الكل 9 والجزء المحتفظ به 4.

2. التعبير المطلوب هو 9 ناقص 4؛ ويساوي 5.

$9-4=5$

$9-4$ تعبير حسابي

خمسة ملصقات مع الأربعة المحتفظ بها تعيد العدد 9.

لا تعكس ترتيب الطرح.$mw$,$mw$Partition the stickers into two disjoint parts: those kept and those given.

$9-4$

1. The total is 9 and the kept part is 4.

2. The required expression is 9 minus 4, which equals 5.

$9-4=5$

$9-4$ Arithmetic expression

Five given plus four kept restores the total of nine.

Do not reverse the subtraction.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدّد العدد الكلي والجزء الذي لن تعطيه مريم.","En":"Identify the total and the part Mariam will not give."},{"Ar":"لإيجاد الباقي اطرح الجزء المحتفظ به من الكل.","En":"To find the rest, subtract the kept part from the whole."}],"Solution":{"Idea":{"Ar":"نقسم مجموعة الملصقات إلى جزأين لا يتداخلان: ما تحتفظ به وما تعطيه.","En":"Partition the stickers into two disjoint parts: those kept and those given."},"FormulaLatex":"9-4","Steps":[{"Ar":"الكل 9 والجزء المحتفظ به 4.","En":"The total is 9 and the kept part is 4."},{"Ar":"التعبير المطلوب هو 9 ناقص 4؛ ويساوي 5.","En":"The required expression is 9 minus 4, which equals 5."}],"Substitution":{"Ar":"$9-4=5$","En":"$9-4=5$"},"Result":{"Ar":"$9-4$","En":"$9-4$"},"Unit":{"Ar":"تعبير حسابي","En":"Arithmetic expression"},"Verification":{"Ar":"خمسة ملصقات مع الأربعة المحتفظ بها تعيد العدد 9.","En":"Five given plus four kept restores the total of nine."},"CommonError":{"Ar":"لا تعكس ترتيب الطرح.","En":"Do not reverse the subtraction."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الجمع يزيد العدد ولا يفصل الجزء المحتفظ به.","En":"Addition increases the count rather than removing the kept part."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"بدأ بالجزء المحتفظ به وطرح الكل منه.","En":"Starts with the kept part and subtracts the whole."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح الصفر يتجاهل الملصقات المحتفظ بها.","En":"Subtracting zero ignores the kept stickers."},"Order":4}]}$mw$),
($mw$growth-v23-grade-2-repeated-digits-skip-pattern-1$mw$,$mw$repeated-digits-skip-pattern$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نمط الأعداد ذات الرقمين المتماثلين","En":"Repeated-digit counting pattern"},"Question":{"Ar":"تكتب هدى الأعداد المكونة من رقمين متماثلين، بدءاً من 11 وحتى 55 مع احتساب الطرفين. كم عدداً تكتب؟","En":"Huda writes the two-digit numbers with identical digits, from 11 through 55 inclusive. How many numbers does she write?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد الطرفين أو عد الفواصل بدلاً من الأعداد.","En":"Omits an endpoint or counts intervals rather than numbers."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"66 خارج المجال المحدد.","En":"66 is outside the stated range."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"11 مقدار الزيادة بين عددين متتاليين وليس عدد الأعداد.","En":"11 is the step size, not the number of entries."}}],"Hints":[{"Ar":"ابدأ بالعدد 11 واكتب العدد التالي ذا الرقمين المتماثلين.","En":"Start at 11 and write the next repeated-digit number."},{"Ar":"زد 11 في كل خطوة وتوقف عند 55.","En":"Add 11 each step and stop at 55."}],"Solution":{"Idea":{"Ar":"الأعداد المطلوبة نمط عد بزيادة 11، ونحتسب البداية والنهاية.","En":"The required numbers form a skip-counting pattern by 11, including both endpoints."},"FormulaLatex":"11,22,33,44,55","Steps":[{"Ar":"الأعداد هي 11، 22، 33، 44، 55.","En":"The numbers are 11, 22, 33, 44, 55."},{"Ar":"نعد الأعداد المكتوبة، لا المسافات بينها.","En":"Count the written numbers, not the gaps between them."}],"Substitution":{"Ar":"$1+1+1+1+1=5$","En":"$1+1+1+1+1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"أعداد","En":"Numbers"},"Verification":{"Ar":"توجد أربع زيادات بمقدار 11 بعد العدد الأول؛ فيكون العدد الكلي خمسة.","En":"There are four increments of 11 after the first number, giving five entries."},"CommonError":{"Ar":"لا تنسَ احتساب 11 و55.","En":"Remember to count both 11 and 55."}}}$mw$::jsonb,$mw$الأعداد المطلوبة نمط عد بزيادة 11، ونحتسب البداية والنهاية.

$11,22,33,44,55$

1. الأعداد هي 11، 22، 33، 44، 55.

2. نعد الأعداد المكتوبة، لا المسافات بينها.

$1+1+1+1+1=5$

$5$ أعداد

توجد أربع زيادات بمقدار 11 بعد العدد الأول؛ فيكون العدد الكلي خمسة.

لا تنسَ احتساب 11 و55.$mw$,$mw$The required numbers form a skip-counting pattern by 11, including both endpoints.

$11,22,33,44,55$

1. The numbers are 11, 22, 33, 44, 55.

2. Count the written numbers, not the gaps between them.

$1+1+1+1+1=5$

$5$ Numbers

There are four increments of 11 after the first number, giving five entries.

Remember to count both 11 and 55.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالعدد 11 واكتب العدد التالي ذا الرقمين المتماثلين.","En":"Start at 11 and write the next repeated-digit number."},{"Ar":"زد 11 في كل خطوة وتوقف عند 55.","En":"Add 11 each step and stop at 55."}],"Solution":{"Idea":{"Ar":"الأعداد المطلوبة نمط عد بزيادة 11، ونحتسب البداية والنهاية.","En":"The required numbers form a skip-counting pattern by 11, including both endpoints."},"FormulaLatex":"11,22,33,44,55","Steps":[{"Ar":"الأعداد هي 11، 22، 33، 44، 55.","En":"The numbers are 11, 22, 33, 44, 55."},{"Ar":"نعد الأعداد المكتوبة، لا المسافات بينها.","En":"Count the written numbers, not the gaps between them."}],"Substitution":{"Ar":"$1+1+1+1+1=5$","En":"$1+1+1+1+1=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"أعداد","En":"Numbers"},"Verification":{"Ar":"توجد أربع زيادات بمقدار 11 بعد العدد الأول؛ فيكون العدد الكلي خمسة.","En":"There are four increments of 11 after the first number, giving five entries."},"CommonError":{"Ar":"لا تنسَ احتساب 11 و55.","En":"Remember to count both 11 and 55."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد الطرفين أو عد الفواصل بدلاً من الأعداد.","En":"Omits an endpoint or counts intervals rather than numbers."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"66 خارج المجال المحدد.","En":"66 is outside the stated range."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"11 مقدار الزيادة بين عددين متتاليين وليس عدد الأعداد.","En":"11 is the step size, not the number of entries."},"Order":4}]}$mw$),
($mw$growth-v23-grade-2-length-measurement-gap-1$mw$,$mw$length-measurement-gap$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تصحيح قياس فيه فجوة","En":"Correcting a measurement gap"},"Question":{"Ar":"غطّى طفل حافة كتاب بثلاث قطع طول كل منها 4 سم، من بداية الحافة إلى نهايتها تماماً، دون تداخل. ترك فجوة مقدارها 1 سم بين القطعتين الأولى والثانية، ولم يترك أي فجوة أخرى. كم طول الحافة؟","En":"A child covers a book edge with three pieces, each 4 cm long, from one endpoint to the other. There is a 1 cm gap between the first and second pieces and no other gap or overlap. How long is the edge?"},"Options":[{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الفجوة مع أنها جزء من طول الحافة.","En":"Subtracts the gap although it is part of the edge length."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع أطوال القطع وأهمل الفجوة.","En":"Adds the piece lengths but ignores the gap."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"احتسب فجوتين مع وجود فجوة واحدة فقط.","En":"Counts two gaps when only one exists."}}],"Hints":[{"Ar":"احسب مجموع أطوال القطع الثلاث أولاً.","En":"Find the combined length of the three pieces first."},{"Ar":"الفجوة جزء من الحافة، فأضف طولها إلى المجموع.","En":"The gap is part of the edge, so add its length to the total."}],"Solution":{"Idea":{"Ar":"عند عدم التداخل يساوي طول الحافة مجموع أطوال القطع والفجوات الواقعة بينها.","En":"With no overlap, the edge length equals the total of the pieces and the gaps between them."},"FormulaLatex":"4+4+4+1","Steps":[{"Ar":"أطوال القطع الثلاث مجموعها 12 سم.","En":"The three pieces total 12 cm."},{"Ar":"الفجوة الوحيدة طولها 1 سم، فنضيفها.","En":"The single gap is 1 cm long, so add it."}],"Substitution":{"Ar":"$12+1=13$","En":"$12+1=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"بطرح الفجوة من 13 سم يبقى 12 سم، وهو مجموع أطوال القطع.","En":"Removing the gap from 13 cm leaves 12 cm, the combined piece length."},"CommonError":{"Ar":"لا تفترض أن القطع تلامس بعضها عندما يذكر السؤال وجود فجوة.","En":"Do not assume pieces touch when a gap is specified."}}}$mw$::jsonb,$mw$عند عدم التداخل يساوي طول الحافة مجموع أطوال القطع والفجوات الواقعة بينها.

$4+4+4+1$

1. أطوال القطع الثلاث مجموعها 12 سم.

2. الفجوة الوحيدة طولها 1 سم، فنضيفها.

$12+1=13$

$13$ سم

بطرح الفجوة من 13 سم يبقى 12 سم، وهو مجموع أطوال القطع.

لا تفترض أن القطع تلامس بعضها عندما يذكر السؤال وجود فجوة.$mw$,$mw$With no overlap, the edge length equals the total of the pieces and the gaps between them.

$4+4+4+1$

1. The three pieces total 12 cm.

2. The single gap is 1 cm long, so add it.

$12+1=13$

$13$ cm

Removing the gap from 13 cm leaves 12 cm, the combined piece length.

Do not assume pieces touch when a gap is specified.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مجموع أطوال القطع الثلاث أولاً.","En":"Find the combined length of the three pieces first."},{"Ar":"الفجوة جزء من الحافة، فأضف طولها إلى المجموع.","En":"The gap is part of the edge, so add its length to the total."}],"Solution":{"Idea":{"Ar":"عند عدم التداخل يساوي طول الحافة مجموع أطوال القطع والفجوات الواقعة بينها.","En":"With no overlap, the edge length equals the total of the pieces and the gaps between them."},"FormulaLatex":"4+4+4+1","Steps":[{"Ar":"أطوال القطع الثلاث مجموعها 12 سم.","En":"The three pieces total 12 cm."},{"Ar":"الفجوة الوحيدة طولها 1 سم، فنضيفها.","En":"The single gap is 1 cm long, so add it."}],"Substitution":{"Ar":"$12+1=13$","En":"$12+1=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"بطرح الفجوة من 13 سم يبقى 12 سم، وهو مجموع أطوال القطع.","En":"Removing the gap from 13 cm leaves 12 cm, the combined piece length."},"CommonError":{"Ar":"لا تفترض أن القطع تلامس بعضها عندما يذكر السؤال وجود فجوة.","En":"Do not assume pieces touch when a gap is specified."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح الفجوة مع أنها جزء من طول الحافة.","En":"Subtracts the gap although it is part of the edge length."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع أطوال القطع وأهمل الفجوة.","En":"Adds the piece lengths but ignores the gap."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"احتسب فجوتين مع وجود فجوة واحدة فقط.","En":"Counts two gaps when only one exists."},"Order":4}]}$mw$),
($mw$growth-v23-grade-6-choose-max-triangle-area-pair-1$mw$,$mw$choose-max-triangle-area-pair$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار أكبر مساحة مثلث","En":"Choosing the largest triangle area"},"Question":{"Ar":"أمام مهندس أربعة تصاميم مثلثية. يمثل كل زوج مرتب طول القاعدة والارتفاع العمودي بالسنتيمتر. أي زوج يعطي أكبر مساحة؟","En":"An engineer has four triangular designs. Each ordered pair gives the base and its perpendicular height in centimetres. Which pair produces the greatest area?"},"Options":[{"LatexCode":"(12,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مساحته 18 سم²، أقل من 21 سم².","En":"Its area is 18 cm², less than 21 cm²."}},{"LatexCode":"(8,5)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مساحته 20 سم²، أقل من 21 سم².","En":"Its area is 20 cm², less than 21 cm²."}},{"LatexCode":"(7,6)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(10,4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مساحته 20 سم²، أقل من 21 سم².","En":"Its area is 20 cm², less than 21 cm²."}}],"Hints":[{"Ar":"لا يكفي اختيار أطول قاعدة.","En":"Choosing the longest base alone is not enough."},{"Ar":"اضرب قاعدة كل تصميم في ارتفاعه العمودي وقارن النواتج.","En":"Multiply each base by its perpendicular height and compare the products."}],"Solution":{"Idea":{"Ar":"مساحة المثلث نصف حاصل ضرب القاعدة في ارتفاعها العمودي المقابل؛ لذلك ترتيب المساحات هو ترتيب الحواصل.","En":"Triangle area is half the product of base and corresponding perpendicular height, so area ordering follows product ordering."},"FormulaLatex":"A=\\frac12 bh","Steps":[{"Ar":"حواصل الضرب بالترتيب: 36، 40، 42، 40.","En":"The products in order are 36, 40, 42, 40."},{"Ar":"أكبر حاصل ضرب 42، ومساحته 21 سم².","En":"The largest product is 42, giving area 21 cm²."}],"Substitution":{"Ar":"$42/2=21$","En":"$42/2=21$"},"Result":{"Ar":"$(7,6)$","En":"$(7,6)$"},"Unit":{"Ar":"الزوج بالسنتيمتر","En":"Pair in cm"},"Verification":{"Ar":"المساحات الأربع 18 و20 و21 و20 سم²، لذا توجد مساحة كبرى واحدة.","En":"The four areas are 18, 20, 21 and 20 cm², so the maximum is unique."},"CommonError":{"Ar":"لا تقارن القواعد أو الارتفاعات وحدها.","En":"Do not compare bases or heights alone."}}}$mw$::jsonb,$mw$مساحة المثلث نصف حاصل ضرب القاعدة في ارتفاعها العمودي المقابل؛ لذلك ترتيب المساحات هو ترتيب الحواصل.

$A=\frac12 bh$

1. حواصل الضرب بالترتيب: 36، 40، 42، 40.

2. أكبر حاصل ضرب 42، ومساحته 21 سم².

$42/2=21$

$(7,6)$ الزوج بالسنتيمتر

المساحات الأربع 18 و20 و21 و20 سم²، لذا توجد مساحة كبرى واحدة.

لا تقارن القواعد أو الارتفاعات وحدها.$mw$,$mw$Triangle area is half the product of base and corresponding perpendicular height, so area ordering follows product ordering.

$A=\frac12 bh$

1. The products in order are 36, 40, 42, 40.

2. The largest product is 42, giving area 21 cm².

$42/2=21$

$(7,6)$ Pair in cm

The four areas are 18, 20, 21 and 20 cm², so the maximum is unique.

Do not compare bases or heights alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لا يكفي اختيار أطول قاعدة.","En":"Choosing the longest base alone is not enough."},{"Ar":"اضرب قاعدة كل تصميم في ارتفاعه العمودي وقارن النواتج.","En":"Multiply each base by its perpendicular height and compare the products."}],"Solution":{"Idea":{"Ar":"مساحة المثلث نصف حاصل ضرب القاعدة في ارتفاعها العمودي المقابل؛ لذلك ترتيب المساحات هو ترتيب الحواصل.","En":"Triangle area is half the product of base and corresponding perpendicular height, so area ordering follows product ordering."},"FormulaLatex":"A=\\frac12 bh","Steps":[{"Ar":"حواصل الضرب بالترتيب: 36، 40، 42، 40.","En":"The products in order are 36, 40, 42, 40."},{"Ar":"أكبر حاصل ضرب 42، ومساحته 21 سم².","En":"The largest product is 42, giving area 21 cm²."}],"Substitution":{"Ar":"$42/2=21$","En":"$42/2=21$"},"Result":{"Ar":"$(7,6)$","En":"$(7,6)$"},"Unit":{"Ar":"الزوج بالسنتيمتر","En":"Pair in cm"},"Verification":{"Ar":"المساحات الأربع 18 و20 و21 و20 سم²، لذا توجد مساحة كبرى واحدة.","En":"The four areas are 18, 20, 21 and 20 cm², so the maximum is unique."},"CommonError":{"Ar":"لا تقارن القواعد أو الارتفاعات وحدها.","En":"Do not compare bases or heights alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مساحته 18 سم²، أقل من 21 سم².","En":"Its area is 18 cm², less than 21 cm²."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مساحته 20 سم²، أقل من 21 سم².","En":"Its area is 20 cm², less than 21 cm²."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مساحته 20 سم²، أقل من 21 سم².","En":"Its area is 20 cm², less than 21 cm²."},"Order":4}]}$mw$),
($mw$growth-v23-grade-6-fraction-expression-order-1$mw$,$mw$fraction-expression-order$mw$,$mw$p-fractions-decimals-fraction-operations$mw$,$mw$grade-6$mw$,6,1,21,95,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":95,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر الأقواس في حساب الكسور","En":"Effect of parentheses on fraction operations"},"Question":{"Ar":"احسب الفرق بين التعبيرين: $A=\\frac34-\\left(\\frac12-\\frac14\\right)$ و$B=\\left(\\frac34-\\frac12\\right)-\\frac14$. ما قيمة $A-B$؟","En":"Compute the difference between $A=\\frac34-\\left(\\frac12-\\frac14\\right)$ and $B=\\left(\\frac34-\\frac12\\right)-\\frac14$. What is $A-B$?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفترض أن تغيير الأقواس لا يؤثر في الطرح، لكن A وB مختلفان.","En":"Assumes changing parentheses has no effect on subtraction, but A and B differ."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الفرق داخل قوس A، لا الفرق النهائي.","En":"This is the value inside the parentheses of A, not the final difference."}},{"LatexCode":"\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب $B-A$ بدلاً من $A-B$.","En":"Computes $B-A$ instead of $A-B$."}}],"Hints":[{"Ar":"احسب كل تعبير على حدة وابدأ بالأقواس.","En":"Evaluate each expression separately, starting with parentheses."},{"Ar":"اكتب النصف على صورة ربعين، ثم احسب الفرق بين النتيجتين.","En":"Write one half as two quarters, then find the difference of the results."}],"Solution":{"Idea":{"Ar":"الطرح ليس تجميعياً؛ نحترم الأقواس ونوحد المقامات قبل الطرح.","En":"Subtraction is not associative; respect parentheses and use common denominators."},"FormulaLatex":"a-(b-c)=a-b+c,\\quad (a-b)-c=a-b-c","Steps":[{"Ar":"$A=\\frac34-\\frac14=\\frac12$.","En":"$A=\\frac34-\\frac14=\\frac12$."},{"Ar":"$B=\\frac14-\\frac14=0$.","En":"$B=\\frac14-\\frac14=0$."},{"Ar":"نطرح $A-B=\\frac12-0$.","En":"Subtract $A-B=\\frac12-0$."}],"Substitution":{"Ar":"$\\frac12-0=\\frac12$","En":"$\\frac12-0=\\frac12$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"الفرق العام بين التعبيرين يساوي $2c$؛ هنا $2\\times\\frac14=\\frac12$.","En":"The general difference between the expressions is $2c$; here $2\\times\\frac14=\\frac12$."},"CommonError":{"Ar":"لا تحذف الأقواس دون مراعاة إشارة الطرح.","En":"Do not remove parentheses without accounting for the minus sign."}}}$mw$::jsonb,$mw$الطرح ليس تجميعياً؛ نحترم الأقواس ونوحد المقامات قبل الطرح.

$a-(b-c)=a-b+c,\quad (a-b)-c=a-b-c$

1. $A=\frac34-\frac14=\frac12$.

2. $B=\frac14-\frac14=0$.

3. نطرح $A-B=\frac12-0$.

$\frac12-0=\frac12$

$\frac12$ بلا وحدة قياس

الفرق العام بين التعبيرين يساوي $2c$؛ هنا $2\times\frac14=\frac12$.

لا تحذف الأقواس دون مراعاة إشارة الطرح.$mw$,$mw$Subtraction is not associative; respect parentheses and use common denominators.

$a-(b-c)=a-b+c,\quad (a-b)-c=a-b-c$

1. $A=\frac34-\frac14=\frac12$.

2. $B=\frac14-\frac14=0$.

3. Subtract $A-B=\frac12-0$.

$\frac12-0=\frac12$

$\frac12$ Dimensionless

The general difference between the expressions is $2c$; here $2\times\frac14=\frac12$.

Do not remove parentheses without accounting for the minus sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب كل تعبير على حدة وابدأ بالأقواس.","En":"Evaluate each expression separately, starting with parentheses."},{"Ar":"اكتب النصف على صورة ربعين، ثم احسب الفرق بين النتيجتين.","En":"Write one half as two quarters, then find the difference of the results."}],"Solution":{"Idea":{"Ar":"الطرح ليس تجميعياً؛ نحترم الأقواس ونوحد المقامات قبل الطرح.","En":"Subtraction is not associative; respect parentheses and use common denominators."},"FormulaLatex":"a-(b-c)=a-b+c,\\quad (a-b)-c=a-b-c","Steps":[{"Ar":"$A=\\frac34-\\frac14=\\frac12$.","En":"$A=\\frac34-\\frac14=\\frac12$."},{"Ar":"$B=\\frac14-\\frac14=0$.","En":"$B=\\frac14-\\frac14=0$."},{"Ar":"نطرح $A-B=\\frac12-0$.","En":"Subtract $A-B=\\frac12-0$."}],"Substitution":{"Ar":"$\\frac12-0=\\frac12$","En":"$\\frac12-0=\\frac12$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"الفرق العام بين التعبيرين يساوي $2c$؛ هنا $2\\times\\frac14=\\frac12$.","En":"The general difference between the expressions is $2c$; here $2\\times\\frac14=\\frac12$."},"CommonError":{"Ar":"لا تحذف الأقواس دون مراعاة إشارة الطرح.","En":"Do not remove parentheses without accounting for the minus sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يفترض أن تغيير الأقواس لا يؤثر في الطرح، لكن A وB مختلفان.","En":"Assumes changing parentheses has no effect on subtraction, but A and B differ."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الفرق داخل قوس A، لا الفرق النهائي.","En":"This is the value inside the parentheses of A, not the final difference."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب $B-A$ بدلاً من $A-B$.","En":"Computes $B-A$ instead of $A-B$."},"Order":4}]}$mw$),
($mw$growth-v23-grade-9-inequality-interval-endpoint-translation-1$mw$,$mw$inequality-interval-endpoint-translation$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترجمة شرطين إلى متباينة","En":"Translating two bounds into an inequality"},"Question":{"Ar":"يقبل جهاز عدداً حقيقياً إذا كان أكبر من 2 ولا يتجاوز 7. أي متباينة تصف جميع القيم المقبولة بدقة؟","En":"A device accepts a real number if it is greater than 2 and does not exceed 7. Which inequality describes exactly all accepted values?"},"Options":[{"LatexCode":"2\\le x\\le7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تضم القيمة 2 مع أنها غير مقبولة.","En":"Includes 2 although it is not accepted."}},{"LatexCode":"2<x<7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تستبعد القيمة 7 مع أنها مقبولة.","En":"Excludes 7 although it is accepted."}},{"LatexCode":"2<x\\le7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2\\le x<7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تضم 2 وتستبعد 7، خلاف الشرطين.","En":"Includes 2 and excludes 7, contrary to both bounds."}}],"Hints":[{"Ar":"حدّد إن كانت كل قيمة حدية مسموحة أم مستبعدة.","En":"Decide whether each endpoint is allowed or excluded."},{"Ar":"استخدم رمزاً صارماً للحد المستبعد ورمز المساواة للحد المسموح.","En":"Use a strict sign for the excluded endpoint and an inclusive sign for the allowed endpoint."}],"Solution":{"Idea":{"Ar":"تتحقق المتباينة المركبة عندما يتحقق الشرطان معاً.","En":"A compound inequality is satisfied when both conditions hold simultaneously."},"FormulaLatex":"x>a\\ \\land\\ x\\le b\\iff a<x\\le b","Steps":[{"Ar":"أكبر من 2 يعني $x>2$.","En":"Greater than 2 means $x>2$."},{"Ar":"لا يتجاوز 7 يعني $x\\le7$.","En":"Does not exceed 7 means $x\\le7$."},{"Ar":"نجمع الشرطين: $2<x\\le7$.","En":"Combine the conditions: $2<x\\le7$."}],"Substitution":{"Ar":"$x>2,\\ x\\le7\\implies2<x\\le7$","En":"$x>2,\\ x\\le7\\implies2<x\\le7$"},"Result":{"Ar":"$2<x\\le7$","En":"$2<x\\le7$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"القيمة 2 مرفوضة، و7 مقبولة، و4 مقبولة، و8 مرفوضة.","En":"2 is rejected, 7 and 4 are accepted, and 8 is rejected."},"CommonError":{"Ar":"لا تخلط بين أكبر من وأكبر من أو يساوي.","En":"Do not confuse greater than with greater than or equal to."}}}$mw$::jsonb,$mw$تتحقق المتباينة المركبة عندما يتحقق الشرطان معاً.

$x>a\ \land\ x\le b\iff a<x\le b$

1. أكبر من 2 يعني $x>2$.

2. لا يتجاوز 7 يعني $x\le7$.

3. نجمع الشرطين: $2<x\le7$.

$x>2,\ x\le7\implies2<x\le7$

$2<x\le7$ بلا وحدة قياس

القيمة 2 مرفوضة، و7 مقبولة، و4 مقبولة، و8 مرفوضة.

لا تخلط بين أكبر من وأكبر من أو يساوي.$mw$,$mw$A compound inequality is satisfied when both conditions hold simultaneously.

$x>a\ \land\ x\le b\iff a<x\le b$

1. Greater than 2 means $x>2$.

2. Does not exceed 7 means $x\le7$.

3. Combine the conditions: $2<x\le7$.

$x>2,\ x\le7\implies2<x\le7$

$2<x\le7$ Dimensionless

2 is rejected, 7 and 4 are accepted, and 8 is rejected.

Do not confuse greater than with greater than or equal to.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدّد إن كانت كل قيمة حدية مسموحة أم مستبعدة.","En":"Decide whether each endpoint is allowed or excluded."},{"Ar":"استخدم رمزاً صارماً للحد المستبعد ورمز المساواة للحد المسموح.","En":"Use a strict sign for the excluded endpoint and an inclusive sign for the allowed endpoint."}],"Solution":{"Idea":{"Ar":"تتحقق المتباينة المركبة عندما يتحقق الشرطان معاً.","En":"A compound inequality is satisfied when both conditions hold simultaneously."},"FormulaLatex":"x>a\\ \\land\\ x\\le b\\iff a<x\\le b","Steps":[{"Ar":"أكبر من 2 يعني $x>2$.","En":"Greater than 2 means $x>2$."},{"Ar":"لا يتجاوز 7 يعني $x\\le7$.","En":"Does not exceed 7 means $x\\le7$."},{"Ar":"نجمع الشرطين: $2<x\\le7$.","En":"Combine the conditions: $2<x\\le7$."}],"Substitution":{"Ar":"$x>2,\\ x\\le7\\implies2<x\\le7$","En":"$x>2,\\ x\\le7\\implies2<x\\le7$"},"Result":{"Ar":"$2<x\\le7$","En":"$2<x\\le7$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"القيمة 2 مرفوضة، و7 مقبولة، و4 مقبولة، و8 مرفوضة.","En":"2 is rejected, 7 and 4 are accepted, and 8 is rejected."},"CommonError":{"Ar":"لا تخلط بين أكبر من وأكبر من أو يساوي.","En":"Do not confuse greater than with greater than or equal to."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تضم القيمة 2 مع أنها غير مقبولة.","En":"Includes 2 although it is not accepted."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تستبعد القيمة 7 مع أنها مقبولة.","En":"Excludes 7 although it is accepted."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تضم 2 وتستبعد 7، خلاف الشرطين.","En":"Includes 2 and excludes 7, contrary to both bounds."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v23 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
