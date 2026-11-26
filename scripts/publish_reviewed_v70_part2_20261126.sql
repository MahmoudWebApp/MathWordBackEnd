-- One-time owner-authorized v70 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v70-grade-11-recurrence-multiplicative-invariant-1$mw$,$mw$recurrence-multiplicative-invariant$mw$,$mw$s-sequences-series-recurrence-relations$mw$,$mw$grade-11$mw$,11,3,23,102,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":102,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ثابت في علاقة تراجعية","En":"Invariant of a recurrence"},"Question":{"Ar":"إذا كان $a_1=3$ و$a_{n+1}=\\frac{n}{n+1}a_n$ لكل $n\\ge1$، فما قيمة $6a_6$؟","En":"If $a_1=3$ and $a_{n+1}=\\frac{n}{n+1}a_n$ for $n\\ge1$, find $6a_6$."},"Options":[{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض ثبات الحد نفسه.","En":"Assumes the term itself stays constant."}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الحد السادس دون ضربه في ستة.","En":"Finds only the sixth term."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الفهرس وحده.","En":"Uses the index alone."}}],"Hints":[{"Ar":"اضرب طرفي العلاقة في $n+1$.","En":"Multiply both sides by $n+1$."},{"Ar":"تتبع المقدار الذي لا يتغير بين حدين.","En":"Track the quantity that stays constant."}],"Solution":{"Idea":{"Ar":"بعد ضرب العلاقة في الفهرس الجديد نرى أن حاصل ضرب الفهرس في الحد ثابت.","En":"Multiplying the recurrence by the new index reveals a constant index-term product."},"FormulaLatex":"(n+1)a_{n+1}=na_n","Steps":[{"Ar":"$6a_6=5a_5=\\cdots=a_1$","En":"$6a_6=5a_5=\\cdots=a_1$"},{"Ar":"$6a_6=3$","En":"$6a_6=3$"}],"Substitution":{"Ar":"$(n+1)a_{n+1}=na_n$","En":"$(n+1)a_{n+1}=na_n$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$a_2=3/2,a_3=1$، وفي الحالتين حاصل الضرب 3.","En":"$a_2=3/2,a_3=1$; both index products are three."},"CommonError":{"Ar":"افترض ثبات الحد نفسه.","En":"Assumes the term itself stays constant."}}}$mw$::jsonb,$mw$بعد ضرب العلاقة في الفهرس الجديد نرى أن حاصل ضرب الفهرس في الحد ثابت.

$(n+1)a_{n+1}=na_n$

1. $6a_6=5a_5=\cdots=a_1$

2. $6a_6=3$

$(n+1)a_{n+1}=na_n$

$3$

$a_2=3/2,a_3=1$، وفي الحالتين حاصل الضرب 3.

افترض ثبات الحد نفسه.$mw$,$mw$Multiplying the recurrence by the new index reveals a constant index-term product.

$(n+1)a_{n+1}=na_n$

1. $6a_6=5a_5=\cdots=a_1$

2. $6a_6=3$

$(n+1)a_{n+1}=na_n$

$3$

$a_2=3/2,a_3=1$; both index products are three.

Assumes the term itself stays constant.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اضرب طرفي العلاقة في $n+1$.","En":"Multiply both sides by $n+1$."},{"Ar":"تتبع المقدار الذي لا يتغير بين حدين.","En":"Track the quantity that stays constant."}],"Solution":{"Idea":{"Ar":"بعد ضرب العلاقة في الفهرس الجديد نرى أن حاصل ضرب الفهرس في الحد ثابت.","En":"Multiplying the recurrence by the new index reveals a constant index-term product."},"FormulaLatex":"(n+1)a_{n+1}=na_n","Steps":[{"Ar":"$6a_6=5a_5=\\cdots=a_1$","En":"$6a_6=5a_5=\\cdots=a_1$"},{"Ar":"$6a_6=3$","En":"$6a_6=3$"}],"Substitution":{"Ar":"$(n+1)a_{n+1}=na_n$","En":"$(n+1)a_{n+1}=na_n$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$a_2=3/2,a_3=1$، وفي الحالتين حاصل الضرب 3.","En":"$a_2=3/2,a_3=1$; both index products are three."},"CommonError":{"Ar":"افترض ثبات الحد نفسه.","En":"Assumes the term itself stays constant."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"افترض ثبات الحد نفسه.","En":"Assumes the term itself stays constant."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب الحد السادس دون ضربه في ستة.","En":"Finds only the sixth term."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الفهرس وحده.","En":"Uses the index alone."},"Order":4}]}$mw$),
($mw$growth-v70-grade-11-finite-series-weighted-geometric-shift-1$mw$,$mw$finite-series-weighted-geometric-shift$mw$,$mw$s-sequences-series-series-sums$mw$,$mw$grade-11$mw$,11,3,23,101,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":101,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع هندسي موزون","En":"Weighted geometric sum"},"Question":{"Ar":"احسب $S=1+2\\cdot2+3\\cdot4+4\\cdot8$.","En":"Evaluate $S=1+2\\cdot2+3\\cdot4+4\\cdot8$."},"Options":[{"LatexCode":"49","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع القوى دون أوزان.","En":"Sums the powers without weights."}},{"LatexCode":"32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الحد الأخير وحده.","En":"Uses only the final term."}},{"LatexCode":"64","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استبدل المجموع بقوة للعدد 2.","En":"Replaces the sum by a power of two."}}],"Hints":[{"Ar":"احسب كل جداء قبل الجمع.","En":"Evaluate each product before summing."},{"Ar":"اجمع القيم الأربع.","En":"Add all four values."}],"Solution":{"Idea":{"Ar":"نحسب الحدود الموزونة كلّاً على حدة، ويمكن التحقق بإزاحة المجموع ومقارنته بمضاعفه.","En":"Evaluate the weighted terms; check by shifting and comparing with twice the sum."},"FormulaLatex":"S=1+4+12+32","Steps":[{"Ar":"$S=5+44$","En":"$S=5+44$"},{"Ar":"$S=49$","En":"$S=49$"}],"Substitution":{"Ar":"$S=1+4+12+32$","En":"$S=1+4+12+32$"},"Result":{"Ar":"$49$","En":"$49$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2S-S=64-(1+2+4+8)=49$.","En":"$2S-S=64-(1+2+4+8)=49$."},"CommonError":{"Ar":"جمع القوى دون أوزان.","En":"Sums the powers without weights."}}}$mw$::jsonb,$mw$نحسب الحدود الموزونة كلّاً على حدة، ويمكن التحقق بإزاحة المجموع ومقارنته بمضاعفه.

$S=1+4+12+32$

1. $S=5+44$

2. $S=49$

$S=1+4+12+32$

$49$

$2S-S=64-(1+2+4+8)=49$.

جمع القوى دون أوزان.$mw$,$mw$Evaluate the weighted terms; check by shifting and comparing with twice the sum.

$S=1+4+12+32$

1. $S=5+44$

2. $S=49$

$S=1+4+12+32$

$49$

$2S-S=64-(1+2+4+8)=49$.

Sums the powers without weights.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب كل جداء قبل الجمع.","En":"Evaluate each product before summing."},{"Ar":"اجمع القيم الأربع.","En":"Add all four values."}],"Solution":{"Idea":{"Ar":"نحسب الحدود الموزونة كلّاً على حدة، ويمكن التحقق بإزاحة المجموع ومقارنته بمضاعفه.","En":"Evaluate the weighted terms; check by shifting and comparing with twice the sum."},"FormulaLatex":"S=1+4+12+32","Steps":[{"Ar":"$S=5+44$","En":"$S=5+44$"},{"Ar":"$S=49$","En":"$S=49$"}],"Substitution":{"Ar":"$S=1+4+12+32$","En":"$S=1+4+12+32$"},"Result":{"Ar":"$49$","En":"$49$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2S-S=64-(1+2+4+8)=49$.","En":"$2S-S=64-(1+2+4+8)=49$."},"CommonError":{"Ar":"جمع القوى دون أوزان.","En":"Sums the powers without weights."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع القوى دون أوزان.","En":"Sums the powers without weights."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الحد الأخير وحده.","En":"Uses only the final term."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استبدل المجموع بقوة للعدد 2.","En":"Replaces the sum by a power of two."},"Order":4}]}$mw$),
($mw$growth-v70-grade-11-series-block-sum-with-indexed-repetition-1$mw$,$mw$series-block-sum-with-indexed-repetition$mw$,$mw$s-sequences-series-series-sums$mw$,$mw$grade-11$mw$,11,3,23,101,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":101,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع كتل متزايدة","En":"Sum of growing blocks"},"Question":{"Ar":"نجمع كتل الأعداد التالية: الأولى (1)، الثانية (1،2)، الثالثة (1،2،3)، الرابعة (1،2،3،4). ما مجموع كل الأعداد في الكتل الأربع؟","En":"Sum the entries of four blocks: (1), (1,2), (1,2,3), (1,2,3,4). What is the total?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع أعداد الكتلة الأخيرة فقط.","En":"Sums only the last block."}},{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع مربعات أطوال الكتل.","En":"Sums squared block sizes."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أربع كتل من أربعة عناصر متساوية.","En":"Assumes four equal blocks of four units."}}],"Hints":[{"Ar":"احسب مجموع كل كتلة مستقلة.","En":"Find each block total."},{"Ar":"اجمع المجاميع الأربعة لا الكتلة الأخيرة وحدها.","En":"Add all four totals, not only the last block."}],"Solution":{"Idea":{"Ar":"نجمع كل كتلة ثم نجمع المجاميع الجزئية.","En":"Sum each block and then add the partial sums."},"FormulaLatex":"S=1+3+6+10","Steps":[{"Ar":"$S=4+16=20$","En":"$S=4+16=20$"}],"Substitution":{"Ar":"$S=1+3+6+10$","En":"$S=1+3+6+10$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"العدد 1 يظهر أربع مرات، و2 ثلاث مرات، و3 مرتين، و4 مرة: $4+6+6+4=20$.","En":"One occurs four times, two three times, three twice, four once: $4+6+6+4=20$."},"CommonError":{"Ar":"جمع أعداد الكتلة الأخيرة فقط.","En":"Sums only the last block."}}}$mw$::jsonb,$mw$نجمع كل كتلة ثم نجمع المجاميع الجزئية.

$S=1+3+6+10$

1. $S=4+16=20$

$S=1+3+6+10$

$20$

العدد 1 يظهر أربع مرات، و2 ثلاث مرات، و3 مرتين، و4 مرة: $4+6+6+4=20$.

جمع أعداد الكتلة الأخيرة فقط.$mw$,$mw$Sum each block and then add the partial sums.

$S=1+3+6+10$

1. $S=4+16=20$

$S=1+3+6+10$

$20$

One occurs four times, two three times, three twice, four once: $4+6+6+4=20$.

Sums only the last block.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مجموع كل كتلة مستقلة.","En":"Find each block total."},{"Ar":"اجمع المجاميع الأربعة لا الكتلة الأخيرة وحدها.","En":"Add all four totals, not only the last block."}],"Solution":{"Idea":{"Ar":"نجمع كل كتلة ثم نجمع المجاميع الجزئية.","En":"Sum each block and then add the partial sums."},"FormulaLatex":"S=1+3+6+10","Steps":[{"Ar":"$S=4+16=20$","En":"$S=4+16=20$"}],"Substitution":{"Ar":"$S=1+3+6+10$","En":"$S=1+3+6+10$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"العدد 1 يظهر أربع مرات، و2 ثلاث مرات، و3 مرتين، و4 مرة: $4+6+6+4=20$.","En":"One occurs four times, two three times, three twice, four once: $4+6+6+4=20$."},"CommonError":{"Ar":"جمع أعداد الكتلة الأخيرة فقط.","En":"Sums only the last block."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع أعداد الكتلة الأخيرة فقط.","En":"Sums only the last block."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع مربعات أطوال الكتل.","En":"Sums squared block sizes."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"افترض أربع كتل من أربعة عناصر متساوية.","En":"Assumes four equal blocks of four units."},"Order":4}]}$mw$),
($mw$growth-v70-grade-11-circle-intersection-subtract-equations-1$mw$,$mw$circle-intersection-subtract-equations$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محور مشترك لدائرتين","En":"Common chord line of two circles"},"Question":{"Ar":"تتقاطع الدائرتان $x^2+y^2=25$ و$(x-6)^2+y^2=25$. ما الإحداثي الأفقي المشترك لنقطتي التقاطع؟","En":"The circles $x^2+y^2=25$ and $(x-6)^2+y^2=25$ intersect. What x-coordinate do both intersection points share?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل مركز الدائرة الأولى.","En":"Uses the first center."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف القطر.","En":"Uses the radius."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل مركز الدائرة الثانية.","En":"Uses the second center."}}],"Hints":[{"Ar":"اطرح المعادلتين.","En":"Subtract the equations."},{"Ar":"وسع مربع الفرق ثم حل المعادلة الخطية.","En":"Expand the square and solve the linear equation."}],"Solution":{"Idea":{"Ar":"بطرح معادلتي الدائرتين تزول الحدود التربيعية المشتركة.","En":"Subtracting the circle equations cancels common quadratic terms."},"FormulaLatex":"x^2-(x-6)^2=0","Steps":[{"Ar":"$12x-36=0$","En":"$12x-36=0$"},{"Ar":"$x=3$","En":"$x=3$"}],"Substitution":{"Ar":"$x^2-(x-6)^2=0$","En":"$x^2-(x-6)^2=0$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"النقطتان $(3,4)$ و$(3,-4)$ تحققان المعادلتين.","En":"Both $(3,4)$ and $(3,-4)$ satisfy both equations."},"CommonError":{"Ar":"استعمل مركز الدائرة الأولى.","En":"Uses the first center."}}}$mw$::jsonb,$mw$بطرح معادلتي الدائرتين تزول الحدود التربيعية المشتركة.

$x^2-(x-6)^2=0$

1. $12x-36=0$

2. $x=3$

$x^2-(x-6)^2=0$

$3$

النقطتان $(3,4)$ و$(3,-4)$ تحققان المعادلتين.

استعمل مركز الدائرة الأولى.$mw$,$mw$Subtracting the circle equations cancels common quadratic terms.

$x^2-(x-6)^2=0$

1. $12x-36=0$

2. $x=3$

$x^2-(x-6)^2=0$

$3$

Both $(3,4)$ and $(3,-4)$ satisfy both equations.

Uses the first center.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح المعادلتين.","En":"Subtract the equations."},{"Ar":"وسع مربع الفرق ثم حل المعادلة الخطية.","En":"Expand the square and solve the linear equation."}],"Solution":{"Idea":{"Ar":"بطرح معادلتي الدائرتين تزول الحدود التربيعية المشتركة.","En":"Subtracting the circle equations cancels common quadratic terms."},"FormulaLatex":"x^2-(x-6)^2=0","Steps":[{"Ar":"$12x-36=0$","En":"$12x-36=0$"},{"Ar":"$x=3$","En":"$x=3$"}],"Substitution":{"Ar":"$x^2-(x-6)^2=0$","En":"$x^2-(x-6)^2=0$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"النقطتان $(3,4)$ و$(3,-4)$ تحققان المعادلتين.","En":"Both $(3,4)$ and $(3,-4)$ satisfy both equations."},"CommonError":{"Ar":"استعمل مركز الدائرة الأولى.","En":"Uses the first center."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل مركز الدائرة الأولى.","En":"Uses the first center."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل نصف القطر.","En":"Uses the radius."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل مركز الدائرة الثانية.","En":"Uses the second center."},"Order":4}]}$mw$),
($mw$growth-v70-grade-2-shape-joined-square-triangle-outer-sides-1$mw$,$mw$shape-joined-square-triangle-outer-sides$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حدود شكل مركب","En":"Outer sides of joined shapes"},"Question":{"Ar":"نلصق مثلثاً متساوي الأضلاع خارج مربع، على ضلع كامل مشترك. كم ضلعاً يظهر في الحد الخارجي للشكل الناتج؟","En":"Attach an equilateral triangle outside a square along one complete shared side. How many sides appear on the outside boundary?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الضلع المشترك مرتين.","En":"Counts the shared side twice."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف نسخة واحدة من الضلع المشترك.","En":"Removes only one copy of the shared side."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد الضلعين الظاهرين للمثلث.","En":"Omits a visible triangle side."}}],"Hints":[{"Ar":"عد الأضلاع الظاهرة للمربع.","En":"Count the exposed square sides."},{"Ar":"أضف الأضلاع الظاهرة للمثلث فقط.","En":"Add only exposed triangle sides."}],"Solution":{"Idea":{"Ar":"الضلع المشترك داخل الشكل فلا نحسبه من حدود المربع ولا من حدود المثلث.","En":"The shared side is inside the joined shape, so it counts for neither outer boundary."},"FormulaLatex":"(4-1)+(3-1)","Steps":[{"Ar":"$3+2=5$","En":"$3+2=5$"}],"Substitution":{"Ar":"$3+2$","En":"$3+2$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثلاثة أضلاع مربعة وضلعان مثلثيان تكون خمسة أضلاع خارجية.","En":"Three exposed square sides plus two triangle sides give five."},"CommonError":{"Ar":"عد الضلع المشترك مرتين.","En":"Counts the shared side twice."}}}$mw$::jsonb,$mw$الضلع المشترك داخل الشكل فلا نحسبه من حدود المربع ولا من حدود المثلث.

$(4-1)+(3-1)$

1. $3+2=5$

$3+2$

$5$

ثلاثة أضلاع مربعة وضلعان مثلثيان تكون خمسة أضلاع خارجية.

عد الضلع المشترك مرتين.$mw$,$mw$The shared side is inside the joined shape, so it counts for neither outer boundary.

$(4-1)+(3-1)$

1. $3+2=5$

$3+2$

$5$

Three exposed square sides plus two triangle sides give five.

Counts the shared side twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد الأضلاع الظاهرة للمربع.","En":"Count the exposed square sides."},{"Ar":"أضف الأضلاع الظاهرة للمثلث فقط.","En":"Add only exposed triangle sides."}],"Solution":{"Idea":{"Ar":"الضلع المشترك داخل الشكل فلا نحسبه من حدود المربع ولا من حدود المثلث.","En":"The shared side is inside the joined shape, so it counts for neither outer boundary."},"FormulaLatex":"(4-1)+(3-1)","Steps":[{"Ar":"$3+2=5$","En":"$3+2=5$"}],"Substitution":{"Ar":"$3+2$","En":"$3+2$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"ثلاثة أضلاع مربعة وضلعان مثلثيان تكون خمسة أضلاع خارجية.","En":"Three exposed square sides plus two triangle sides give five."},"CommonError":{"Ar":"عد الضلع المشترك مرتين.","En":"Counts the shared side twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عد الضلع المشترك مرتين.","En":"Counts the shared side twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حذف نسخة واحدة من الضلع المشترك.","En":"Removes only one copy of the shared side."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أهمل أحد الضلعين الظاهرين للمثلث.","En":"Omits a visible triangle side."},"Order":4}]}$mw$),
($mw$growth-v70-grade-2-triangular-prism-vertices-distinct-bases-1$mw$,$mw$triangular-prism-vertices-distinct-bases$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"رؤوس منشور ثلاثي","En":"Vertices of a triangular prism"},"Question":{"Ar":"منشور ثلاثي له قاعدتان مثلثتان متقابلتان لا تشتركان في أي رأس. كم رأساً له؟","En":"A triangular prism has two opposite triangular bases sharing no vertices. How many vertices does it have?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد رؤوس قاعدة واحدة.","En":"Counts only one base."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الأوجه لا الرؤوس.","En":"Counts faces instead of vertices."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الحواف لا الرؤوس.","En":"Counts edges rather than vertices."}}],"Hints":[{"Ar":"عد زوايا القاعدة المثلثية.","En":"Count corners on one triangular base."},{"Ar":"أضف رؤوس القاعدة الأخرى.","En":"Add the other base's vertices."}],"Solution":{"Idea":{"Ar":"لكل قاعدة ثلاثة رؤوس مختلفة عن رؤوس القاعدة الأخرى.","En":"Each base has three vertices distinct from those of the other base."},"FormulaLatex":"V=3+3","Steps":[{"Ar":"$V=6$","En":"$V=6$"}],"Substitution":{"Ar":"$V=3+3$","En":"$V=3+3$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأضلاع الجانبية تصل كل رأس بنظيره ولا تنشئ رؤوساً إضافية.","En":"Side edges connect matching vertices without adding any."},"CommonError":{"Ar":"عد رؤوس قاعدة واحدة.","En":"Counts only one base."}}}$mw$::jsonb,$mw$لكل قاعدة ثلاثة رؤوس مختلفة عن رؤوس القاعدة الأخرى.

$V=3+3$

1. $V=6$

$V=3+3$

$6$

الأضلاع الجانبية تصل كل رأس بنظيره ولا تنشئ رؤوساً إضافية.

عد رؤوس قاعدة واحدة.$mw$,$mw$Each base has three vertices distinct from those of the other base.

$V=3+3$

1. $V=6$

$V=3+3$

$6$

Side edges connect matching vertices without adding any.

Counts only one base.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عد زوايا القاعدة المثلثية.","En":"Count corners on one triangular base."},{"Ar":"أضف رؤوس القاعدة الأخرى.","En":"Add the other base's vertices."}],"Solution":{"Idea":{"Ar":"لكل قاعدة ثلاثة رؤوس مختلفة عن رؤوس القاعدة الأخرى.","En":"Each base has three vertices distinct from those of the other base."},"FormulaLatex":"V=3+3","Steps":[{"Ar":"$V=6$","En":"$V=6$"}],"Substitution":{"Ar":"$V=3+3$","En":"$V=3+3$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"الأضلاع الجانبية تصل كل رأس بنظيره ولا تنشئ رؤوساً إضافية.","En":"Side edges connect matching vertices without adding any."},"CommonError":{"Ar":"عد رؤوس قاعدة واحدة.","En":"Counts only one base."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عد رؤوس قاعدة واحدة.","En":"Counts only one base."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عد الأوجه لا الرؤوس.","En":"Counts faces instead of vertices."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عد الحواف لا الرؤوس.","En":"Counts edges rather than vertices."},"Order":4}]}$mw$);
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
