-- One-time owner-authorized v70 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v70-grade-8-mean-range-fixed-minimum-impossible-1$mw$,$mw$mean-range-fixed-minimum-impossible$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متوسط مستحيل ضمن مجال","En":"Impossible mean within a range"},"Question":{"Ar":"أصغر قراءة 4 وأكبر قراءة 12 في مجموعة من خمس قراءات. أي متوسط حسابي يستحيل لهذه المجموعة؟","En":"Five readings have minimum 4 and maximum 12. Which mean is impossible for the data set?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن أن تكون القيم 4،4،5،5،12.","En":"Values 4,4,5,5,12 attain six."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن أن تكون القيم 4،8،8،8،12.","En":"Values 4,8,8,8,12 attain eight."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن أن تكون القيم 4،10،12،12،12.","En":"Values 4,10,12,12,12 attain ten."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"استعمل حقيقة أن قراءة واحدة على الأقل تساوي 4.","En":"Use the fact that at least one reading equals four."},{"Ar":"افترض أكبر قيم ممكنة للقراءات الأخرى.","En":"Consider the largest possible other readings."}],"Solution":{"Idea":{"Ar":"بوجود قراءة أصغر من 12 لا يمكن أن يساوي المتوسط القيمة الكبرى 12.","En":"Because one reading is below 12, the mean cannot equal the maximum."},"FormulaLatex":"\\bar{x}\\le(4+4\\cdot12)/5","Steps":[{"Ar":"$x_1=4,\\quad x_2,x_3,x_4,x_5\\le12$","En":"$x_1=4,\\quad x_2,x_3,x_4,x_5\\le12$"},{"Ar":"$\\bar{x}\\le52/5=10.4$","En":"$\\bar{x}\\le52/5=10.4$"},{"Ar":"$12>10.4$","En":"$12>10.4$"}],"Substitution":{"Ar":"$(4+12+12+12+12)/5$","En":"$(4+12+12+12+12)/5$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المجموعة 4،12،12،12،12 تحقق الحد الأعلى 10.4 فقط.","En":"The data 4,12,12,12,12 attain the upper bound 10.4."},"CommonError":{"Ar":"يمكن أن تكون القيم 4،4،5،5،12.","En":"Values 4,4,5,5,12 attain six."}}}$mw$::jsonb,$mw$بوجود قراءة أصغر من 12 لا يمكن أن يساوي المتوسط القيمة الكبرى 12.

$\bar{x}\le(4+4\cdot12)/5$

1. $x_1=4,\quad x_2,x_3,x_4,x_5\le12$

2. $\bar{x}\le52/5=10.4$

3. $12>10.4$

$(4+12+12+12+12)/5$

$12$

المجموعة 4،12،12،12،12 تحقق الحد الأعلى 10.4 فقط.

يمكن أن تكون القيم 4،4،5،5،12.$mw$,$mw$Because one reading is below 12, the mean cannot equal the maximum.

$\bar{x}\le(4+4\cdot12)/5$

1. $x_1=4,\quad x_2,x_3,x_4,x_5\le12$

2. $\bar{x}\le52/5=10.4$

3. $12>10.4$

$(4+12+12+12+12)/5$

$12$

The data 4,12,12,12,12 attain the upper bound 10.4.

Values 4,4,5,5,12 attain six.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل حقيقة أن قراءة واحدة على الأقل تساوي 4.","En":"Use the fact that at least one reading equals four."},{"Ar":"افترض أكبر قيم ممكنة للقراءات الأخرى.","En":"Consider the largest possible other readings."}],"Solution":{"Idea":{"Ar":"بوجود قراءة أصغر من 12 لا يمكن أن يساوي المتوسط القيمة الكبرى 12.","En":"Because one reading is below 12, the mean cannot equal the maximum."},"FormulaLatex":"\\bar{x}\\le(4+4\\cdot12)/5","Steps":[{"Ar":"$x_1=4,\\quad x_2,x_3,x_4,x_5\\le12$","En":"$x_1=4,\\quad x_2,x_3,x_4,x_5\\le12$"},{"Ar":"$\\bar{x}\\le52/5=10.4$","En":"$\\bar{x}\\le52/5=10.4$"},{"Ar":"$12>10.4$","En":"$12>10.4$"}],"Substitution":{"Ar":"$(4+12+12+12+12)/5$","En":"$(4+12+12+12+12)/5$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"المجموعة 4،12،12،12،12 تحقق الحد الأعلى 10.4 فقط.","En":"The data 4,12,12,12,12 attain the upper bound 10.4."},"CommonError":{"Ar":"يمكن أن تكون القيم 4،4،5،5،12.","En":"Values 4,4,5,5,12 attain six."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يمكن أن تكون القيم 4،4،5،5،12.","En":"Values 4,4,5,5,12 attain six."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يمكن أن تكون القيم 4،8،8،8،12.","En":"Values 4,8,8,8,12 attain eight."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يمكن أن تكون القيم 4،10،12،12،12.","En":"Values 4,10,12,12,12 attain ten."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v70-grade-10-arithmetic-termwise-sum-difference-1$mw$,$mw$arithmetic-termwise-sum-difference$mw$,$mw$s-sequences-series-arithmetic-sequences$mw$,$mw$grade-10$mw$,10,3,23,104,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":104,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جمع متتاليتين حسابيتين","En":"Termwise sum of arithmetic sequences"},"Question":{"Ar":"متتاليتان حسابيتان لهما الفرقان 7 و-4. نكوّن متتالية جديدة بجمع الحدين ذوي الفهرس نفسه. ما فرق المتتالية الجديدة؟","En":"Two arithmetic sequences have differences 7 and -4. Form a new sequence by adding terms with the same index. What is its common difference?"},"Options":[{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الفرق السالب بدل جمعه.","En":"Subtracts the negative difference instead of adding it."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب الفرقين.","En":"Multiplies the differences."}},{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس الإشارة.","En":"Reverses the sign."}}],"Hints":[{"Ar":"اكتب الحد الجديد كمجموع حدين.","En":"Write the new term as a sum."},{"Ar":"وزع الطرح على المجموعين.","En":"Distribute subtraction over both sums."}],"Solution":{"Idea":{"Ar":"فرق مجموع الحدين يساوي مجموع فرق كل متتالية.","En":"The difference of the termwise sum equals the sum of the two differences."},"FormulaLatex":"c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)","Steps":[{"Ar":"$7+(-4)=3$","En":"$7+(-4)=3$"}],"Substitution":{"Ar":"$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$","En":"$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مثلاً 2،9 و10،6 تعطيان 12،15 وفرقاً 3.","En":"For example 2,9 and 10,6 give 12,15 with gap three."},"CommonError":{"Ar":"طرح الفرق السالب بدل جمعه.","En":"Subtracts the negative difference instead of adding it."}}}$mw$::jsonb,$mw$فرق مجموع الحدين يساوي مجموع فرق كل متتالية.

$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$

1. $7+(-4)=3$

$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$

$3$

مثلاً 2،9 و10،6 تعطيان 12،15 وفرقاً 3.

طرح الفرق السالب بدل جمعه.$mw$,$mw$The difference of the termwise sum equals the sum of the two differences.

$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$

1. $7+(-4)=3$

$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$

$3$

For example 2,9 and 10,6 give 12,15 with gap three.

Subtracts the negative difference instead of adding it.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الحد الجديد كمجموع حدين.","En":"Write the new term as a sum."},{"Ar":"وزع الطرح على المجموعين.","En":"Distribute subtraction over both sums."}],"Solution":{"Idea":{"Ar":"فرق مجموع الحدين يساوي مجموع فرق كل متتالية.","En":"The difference of the termwise sum equals the sum of the two differences."},"FormulaLatex":"c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)","Steps":[{"Ar":"$7+(-4)=3$","En":"$7+(-4)=3$"}],"Substitution":{"Ar":"$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$","En":"$c_{n+1}-c_n=(a_{n+1}-a_n)+(b_{n+1}-b_n)$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مثلاً 2،9 و10،6 تعطيان 12،15 وفرقاً 3.","En":"For example 2,9 and 10,6 give 12,15 with gap three."},"CommonError":{"Ar":"طرح الفرق السالب بدل جمعه.","En":"Subtracts the negative difference instead of adding it."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح الفرق السالب بدل جمعه.","En":"Subtracts the negative difference instead of adding it."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ضرب الفرقين.","En":"Multiplies the differences."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس الإشارة.","En":"Reverses the sign."},"Order":4}]}$mw$),
($mw$growth-v70-grade-10-geometric-termwise-product-ratio-1$mw$,$mw$geometric-termwise-product-ratio$mw$,$mw$s-sequences-series-geometric-sequences$mw$,$mw$grade-10$mw$,10,3,23,103,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":103,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جداء متتاليتين هندسيتين","En":"Termwise product of geometric sequences"},"Question":{"Ar":"متتاليتان هندسيتان حدودهما غير صفرية، أساساهما 2 و-3. نضرب الحدين ذوي الفهرس نفسه. ما أساس المتتالية الناتجة؟","En":"Two geometric sequences have nonzero terms and ratios 2 and -3. Multiply terms with the same index. What is the resulting ratio?"},"Options":[{"LatexCode":"-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأساسين.","En":"Adds the ratios."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الإشارة السالبة.","En":"Drops the negative sign."}},{"LatexCode":"-6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل أساس المتتالية الأولى.","En":"Ignores the first ratio."}}],"Hints":[{"Ar":"اكتب نسبة حدين جديدين.","En":"Write the ratio of two new terms."},{"Ar":"افصل الكسر إلى جداء نسبتين.","En":"Separate the quotient into two ratios."}],"Solution":{"Idea":{"Ar":"نسبة الجداءين المتتاليين تساوي جداء النسبتين.","En":"The ratio of successive products equals the product of the two ratios."},"FormulaLatex":"\\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b","Steps":[{"Ar":"$2(-3)=-6$","En":"$2(-3)=-6$"}],"Substitution":{"Ar":"$\\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$","En":"$\\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$"},"Result":{"Ar":"$-6$","En":"$-6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان 1،2 والحدان 4،-12 يعطيان 4،-24؛ النسبة -6.","En":"Terms 1,2 and 4,-12 give 4,-24, with ratio -6."},"CommonError":{"Ar":"جمع الأساسين.","En":"Adds the ratios."}}}$mw$::jsonb,$mw$نسبة الجداءين المتتاليين تساوي جداء النسبتين.

$\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$

1. $2(-3)=-6$

$\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$

$-6$

الحدان 1،2 والحدان 4،-12 يعطيان 4،-24؛ النسبة -6.

جمع الأساسين.$mw$,$mw$The ratio of successive products equals the product of the two ratios.

$\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$

1. $2(-3)=-6$

$\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$

$-6$

Terms 1,2 and 4,-12 give 4,-24, with ratio -6.

Adds the ratios.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب نسبة حدين جديدين.","En":"Write the ratio of two new terms."},{"Ar":"افصل الكسر إلى جداء نسبتين.","En":"Separate the quotient into two ratios."}],"Solution":{"Idea":{"Ar":"نسبة الجداءين المتتاليين تساوي جداء النسبتين.","En":"The ratio of successive products equals the product of the two ratios."},"FormulaLatex":"\\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b","Steps":[{"Ar":"$2(-3)=-6$","En":"$2(-3)=-6$"}],"Substitution":{"Ar":"$\\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$","En":"$\\frac{a_{n+1}b_{n+1}}{a_nb_n}=r_ar_b$"},"Result":{"Ar":"$-6$","En":"$-6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الحدان 1،2 والحدان 4،-12 يعطيان 4،-24؛ النسبة -6.","En":"Terms 1,2 and 4,-12 give 4,-24, with ratio -6."},"CommonError":{"Ar":"جمع الأساسين.","En":"Adds the ratios."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع الأساسين.","En":"Adds the ratios."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل الإشارة السالبة.","En":"Drops the negative sign."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل أساس المتتالية الأولى.","En":"Ignores the first ratio."},"Order":4}]}$mw$),
($mw$growth-v70-grade-9-rectangle-perimeter-from-diagonal-and-side-1$mw$,$mw$rectangle-perimeter-from-diagonal-and-side$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محيط مستطيل من قطره","En":"Rectangle perimeter from diagonal"},"Question":{"Ar":"مستطيل طول قطره 17 سم وطول أحد ضلعيه 8 سم. ما محيطه بالسنتيمتر؟","En":"A rectangle has diagonal 17 cm and one side 8 cm. Find its perimeter in centimetres."},"Options":[{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف الضلع المجهول وحده.","En":"Doubles only the unknown side."}},{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل القطر كضلع.","En":"Uses the diagonal as a side."}},{"LatexCode":"46","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف القطر فقط.","En":"Doubles only the diagonal."}}],"Hints":[{"Ar":"طبق فيثاغورس على نصف المستطيل.","En":"Apply Pythagoras to half the rectangle."},{"Ar":"اجمع الضلعين واضرب في 2.","En":"Add the two sides and double."}],"Solution":{"Idea":{"Ar":"القطر يقسم المستطيل إلى مثلثين قائمين. نحسب الضلع الآخر ثم المحيط.","En":"The diagonal forms right triangles. Find the other side, then the perimeter."},"FormulaLatex":"b=\\sqrt{17^2-8^2}","Steps":[{"Ar":"$b=\\sqrt{225}=15$","En":"$b=\\sqrt{225}=15$"},{"Ar":"$P=2(8+15)=46$","En":"$P=2(8+15)=46$"}],"Substitution":{"Ar":"$b=\\sqrt{17^2-8^2}$","En":"$b=\\sqrt{17^2-8^2}$"},"Result":{"Ar":"$46$","En":"$46$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$8^2+15^2=289=17^2$ و$8+15+8+15=46$.","En":"$8^2+15^2=289=17^2$ and $8+15+8+15=46$."},"CommonError":{"Ar":"ضاعف الضلع المجهول وحده.","En":"Doubles only the unknown side."}}}$mw$::jsonb,$mw$القطر يقسم المستطيل إلى مثلثين قائمين. نحسب الضلع الآخر ثم المحيط.

$b=\sqrt{17^2-8^2}$

1. $b=\sqrt{225}=15$

2. $P=2(8+15)=46$

$b=\sqrt{17^2-8^2}$

$46$

سم

$8^2+15^2=289=17^2$ و$8+15+8+15=46$.

ضاعف الضلع المجهول وحده.$mw$,$mw$The diagonal forms right triangles. Find the other side, then the perimeter.

$b=\sqrt{17^2-8^2}$

1. $b=\sqrt{225}=15$

2. $P=2(8+15)=46$

$b=\sqrt{17^2-8^2}$

$46$

cm

$8^2+15^2=289=17^2$ and $8+15+8+15=46$.

Doubles only the unknown side.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"طبق فيثاغورس على نصف المستطيل.","En":"Apply Pythagoras to half the rectangle."},{"Ar":"اجمع الضلعين واضرب في 2.","En":"Add the two sides and double."}],"Solution":{"Idea":{"Ar":"القطر يقسم المستطيل إلى مثلثين قائمين. نحسب الضلع الآخر ثم المحيط.","En":"The diagonal forms right triangles. Find the other side, then the perimeter."},"FormulaLatex":"b=\\sqrt{17^2-8^2}","Steps":[{"Ar":"$b=\\sqrt{225}=15$","En":"$b=\\sqrt{225}=15$"},{"Ar":"$P=2(8+15)=46$","En":"$P=2(8+15)=46$"}],"Substitution":{"Ar":"$b=\\sqrt{17^2-8^2}$","En":"$b=\\sqrt{17^2-8^2}$"},"Result":{"Ar":"$46$","En":"$46$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$8^2+15^2=289=17^2$ و$8+15+8+15=46$.","En":"$8^2+15^2=289=17^2$ and $8+15+8+15=46$."},"CommonError":{"Ar":"ضاعف الضلع المجهول وحده.","En":"Doubles only the unknown side."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ضاعف الضلع المجهول وحده.","En":"Doubles only the unknown side."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل القطر كضلع.","En":"Uses the diagonal as a side."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف القطر فقط.","En":"Doubles only the diagonal."},"Order":4}]}$mw$),
($mw$growth-v70-grade-9-right-triangle-hypotenuse-integer-bound-1$mw$,$mw$right-triangle-hypotenuse-integer-bound$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حصر طول الوتر","En":"Bounding a hypotenuse"},"Question":{"Ar":"في مثلث قائم ضلعاه القائمان 4 و5 سم. بين أي عددين صحيحين متتاليين يقع طول الوتر بالسنتيمتر؟","En":"A right triangle has legs 4 and 5 cm. Between which consecutive integers does its hypotenuse length in centimetres lie?"},"Options":[{"LatexCode":"(5,6)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع 6 أصغر من 41.","En":"Six squared is below 41."}},{"LatexCode":"(6,7)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(7,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع 7 أكبر من 41.","En":"Seven squared is above 41."}},{"LatexCode":"(8,9)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الضلعين بدلاً من استخدام مربعيهما.","En":"Adds legs rather than using squares."}}],"Hints":[{"Ar":"احسب مجموع مربعي الضلعين.","En":"Sum the squared legs."},{"Ar":"حدد مربعين كاملين يحيطان بالناتج.","En":"Locate two surrounding perfect squares."}],"Solution":{"Idea":{"Ar":"نقارن مربع الوتر بالمربعات الكاملة المتتالية.","En":"Compare the squared hypotenuse with consecutive perfect squares."},"FormulaLatex":"c^2=4^2+5^2=41","Steps":[{"Ar":"$36<41<49$","En":"$36<41<49$"},{"Ar":"$6<c<7$","En":"$6<c<7$"}],"Substitution":{"Ar":"$c^2=4^2+5^2=41$","En":"$c^2=4^2+5^2=41$"},"Result":{"Ar":"$6<c<7$ سم","En":"$6<c<7$ cm"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6^2=36$ و$7^2=49$؛ كلاهما يحصر 41.","En":"$6^2=36$ and $7^2=49$ bracket 41."},"CommonError":{"Ar":"مربع 6 أصغر من 41.","En":"Six squared is below 41."}}}$mw$::jsonb,$mw$نقارن مربع الوتر بالمربعات الكاملة المتتالية.

$c^2=4^2+5^2=41$

1. $36<41<49$

2. $6<c<7$

$c^2=4^2+5^2=41$

$6<c<7$ سم

$6^2=36$ و$7^2=49$؛ كلاهما يحصر 41.

مربع 6 أصغر من 41.$mw$,$mw$Compare the squared hypotenuse with consecutive perfect squares.

$c^2=4^2+5^2=41$

1. $36<41<49$

2. $6<c<7$

$c^2=4^2+5^2=41$

$6<c<7$ cm

$6^2=36$ and $7^2=49$ bracket 41.

Six squared is below 41.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مجموع مربعي الضلعين.","En":"Sum the squared legs."},{"Ar":"حدد مربعين كاملين يحيطان بالناتج.","En":"Locate two surrounding perfect squares."}],"Solution":{"Idea":{"Ar":"نقارن مربع الوتر بالمربعات الكاملة المتتالية.","En":"Compare the squared hypotenuse with consecutive perfect squares."},"FormulaLatex":"c^2=4^2+5^2=41","Steps":[{"Ar":"$36<41<49$","En":"$36<41<49$"},{"Ar":"$6<c<7$","En":"$6<c<7$"}],"Substitution":{"Ar":"$c^2=4^2+5^2=41$","En":"$c^2=4^2+5^2=41$"},"Result":{"Ar":"$6<c<7$ سم","En":"$6<c<7$ cm"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6^2=36$ و$7^2=49$؛ كلاهما يحصر 41.","En":"$6^2=36$ and $7^2=49$ bracket 41."},"CommonError":{"Ar":"مربع 6 أصغر من 41.","En":"Six squared is below 41."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مربع 6 أصغر من 41.","En":"Six squared is below 41."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"مربع 7 أكبر من 41.","En":"Seven squared is above 41."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع الضلعين بدلاً من استخدام مربعيهما.","En":"Adds legs rather than using squares."},"Order":4}]}$mw$),
($mw$growth-v70-grade-11-recurrence-backward-nonlinear-square-positive-1$mw$,$mw$recurrence-backward-nonlinear-square-positive$mw$,$mw$s-sequences-series-recurrence-relations$mw$,$mw$grade-11$mw$,11,3,23,102,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":102,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع حد سابق","En":"Recovering a previous term"},"Question":{"Ar":"متتالية جميع حدودها موجبة تحقق $a_{n+1}=a_n^2+1$. إذا كان $a_3=26$ فما $a_1$؟","En":"A sequence of positive terms satisfies $a_{n+1}=a_n^2+1$. If $a_3=26$, find $a_1$."},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف عند الحد الثاني.","En":"Stops at the second term."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الواحد ولم يأخذ الجذر في الخطوة الثانية.","En":"Subtracts one without taking the second square root."}},{"LatexCode":"\\sqrt{26}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل طرح الواحد.","En":"Omits subtracting one."}}],"Hints":[{"Ar":"ابدأ بالحد الثالث واعكس العملية.","En":"Start at the third term and invert the operation."},{"Ar":"كرر ذلك للوصول إلى الحد الأول.","En":"Repeat to recover the first term."}],"Solution":{"Idea":{"Ar":"نعكس العلاقة بطرح الواحد ثم أخذ الجذر الموجب في كل خطوة.","En":"Invert the recurrence by subtracting one then taking the positive square root."},"FormulaLatex":"a_n=\\sqrt{a_{n+1}-1}","Steps":[{"Ar":"$a_2=\\sqrt{26-1}=5$","En":"$a_2=\\sqrt{26-1}=5$"},{"Ar":"$a_1=\\sqrt{5-1}=2$","En":"$a_1=\\sqrt{5-1}=2$"}],"Substitution":{"Ar":"$a_n=\\sqrt{a_{n+1}-1}$","En":"$a_n=\\sqrt{a_{n+1}-1}$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2^2+1=5$ ثم $5^2+1=26$.","En":"$2^2+1=5$ then $5^2+1=26$."},"CommonError":{"Ar":"توقف عند الحد الثاني.","En":"Stops at the second term."}}}$mw$::jsonb,$mw$نعكس العلاقة بطرح الواحد ثم أخذ الجذر الموجب في كل خطوة.

$a_n=\sqrt{a_{n+1}-1}$

1. $a_2=\sqrt{26-1}=5$

2. $a_1=\sqrt{5-1}=2$

$a_n=\sqrt{a_{n+1}-1}$

$2$

$2^2+1=5$ ثم $5^2+1=26$.

توقف عند الحد الثاني.$mw$,$mw$Invert the recurrence by subtracting one then taking the positive square root.

$a_n=\sqrt{a_{n+1}-1}$

1. $a_2=\sqrt{26-1}=5$

2. $a_1=\sqrt{5-1}=2$

$a_n=\sqrt{a_{n+1}-1}$

$2$

$2^2+1=5$ then $5^2+1=26$.

Stops at the second term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالحد الثالث واعكس العملية.","En":"Start at the third term and invert the operation."},{"Ar":"كرر ذلك للوصول إلى الحد الأول.","En":"Repeat to recover the first term."}],"Solution":{"Idea":{"Ar":"نعكس العلاقة بطرح الواحد ثم أخذ الجذر الموجب في كل خطوة.","En":"Invert the recurrence by subtracting one then taking the positive square root."},"FormulaLatex":"a_n=\\sqrt{a_{n+1}-1}","Steps":[{"Ar":"$a_2=\\sqrt{26-1}=5$","En":"$a_2=\\sqrt{26-1}=5$"},{"Ar":"$a_1=\\sqrt{5-1}=2$","En":"$a_1=\\sqrt{5-1}=2$"}],"Substitution":{"Ar":"$a_n=\\sqrt{a_{n+1}-1}$","En":"$a_n=\\sqrt{a_{n+1}-1}$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2^2+1=5$ ثم $5^2+1=26$.","En":"$2^2+1=5$ then $5^2+1=26$."},"CommonError":{"Ar":"توقف عند الحد الثاني.","En":"Stops at the second term."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"توقف عند الحد الثاني.","En":"Stops at the second term."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح الواحد ولم يأخذ الجذر في الخطوة الثانية.","En":"Subtracts one without taking the second square root."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل طرح الواحد.","En":"Omits subtracting one."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v70 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
