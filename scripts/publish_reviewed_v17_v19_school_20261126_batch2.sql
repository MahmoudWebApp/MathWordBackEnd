-- One-time owner-authorized import AND publication from reviewed v17/v19 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v17-grade-8-compare-input-revisions-linear-with-fee-1$mw$,$mw$compare-input-revisions-linear-with-fee$mw$,$mw$middle-linear-function-evaluation$mw$,$mw$grade-8$mw$,8,2,6,26,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":26,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"أثر تصحيح قراءتين على الفاتورة","En":"Effect of correcting two readings on a bill"},"Question":{"Ar":"تحسب فاتورة الماء من فرق قراءتي العداد بالمتر المكعب، بسعر 3 ريالات للمتر المكعب، مع رسم ثابت قدره 10 ريالات. بعد إصدار الفاتورة تبيّن أن قراءة البداية أقل من القيمة الصحيحة بأربعة أمتار مكعبة، وأن قراءة النهاية أقل من القيمة الصحيحة بتسعة أمتار مكعبة. بكم تزداد الفاتورة بعد تصحيح القراءتين؟","En":"A water bill uses the difference between meter readings at 3 riyals per cubic metre plus a fixed 10-riyal fee. The starting reading on the bill was 4 cubic metres below the true reading, and the ending reading was 9 below the true reading. How much does the bill increase after correcting both?"},"Options":[{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صحّح قراءة النهاية وحدها.","En":"Corrects only the ending reading."}},{"LatexCode":"39","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع التصحيحين بدلاً من طرح أحدهما من الآخر.","En":"Adds the two corrections instead of subtracting one from the other."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الرسم الثابت إلى زيادة الفاتورة.","En":"Adds the fixed fee to the increase."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"يُحسب الاستهلاك بطرح قراءة البداية من قراءة النهاية.","En":"Consumption is the ending reading minus the starting reading."},{"Ar":"ما أثر إضافة 9 إلى النهاية و4 إلى البداية على الفرق بينهما؟","En":"What happens to that difference when 9 is added to the end and 4 to the start?"}],"Solution":{"Idea":{"Ar":"يتغير الاستهلاك بمقدار تصحيح قراءة النهاية ناقص تصحيح قراءة البداية، والرسم الثابت لا يتغير.","En":"Consumption changes by the end-reading correction minus the start-reading correction; the fixed charge cancels."},"FormulaLatex":"\\Delta B=3(\\Delta E-\\Delta S)","Steps":[{"Ar":"يزداد فرق القراءتين بمقدار 9 ناقص 4، أي 5 أمتار مكعبة.","En":"The reading difference rises by 9 minus 4, or 5 cubic metres."},{"Ar":"يُحتسب سعر 3 ريالات لكل متر مكعب إضافي، والرسم ثابت في الفاتورتين.","En":"Each extra cubic metre costs 3 riyals; the same fixed fee appears on both bills."}],"Substitution":{"Ar":"$3(9-4)=15$","En":"$3(9-4)=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"ريالاً","En":"riyals"},"Verification":{"Ar":"لو كان الاستهلاك المسجل 10، لكانت الفاتورة 40، وبعد التصحيح يكون 15 والفاتورة 55، والفرق 15.","En":"If recorded use were 10, the bill would be 40. Corrected use would be 15 and the bill 55, a difference of 15."},"CommonError":{"Ar":"صحّح قراءة النهاية وحدها.","En":"Corrects only the ending reading."}}}$mw$::jsonb,$mw$يتغير الاستهلاك بمقدار تصحيح قراءة النهاية ناقص تصحيح قراءة البداية، والرسم الثابت لا يتغير.

$\Delta B=3(\Delta E-\Delta S)$

1. يزداد فرق القراءتين بمقدار 9 ناقص 4، أي 5 أمتار مكعبة.

2. يُحتسب سعر 3 ريالات لكل متر مكعب إضافي، والرسم ثابت في الفاتورتين.

$3(9-4)=15$

$15$ ريالاً

لو كان الاستهلاك المسجل 10، لكانت الفاتورة 40، وبعد التصحيح يكون 15 والفاتورة 55، والفرق 15.

صحّح قراءة النهاية وحدها.$mw$,$mw$Consumption changes by the end-reading correction minus the start-reading correction; the fixed charge cancels.

$\Delta B=3(\Delta E-\Delta S)$

1. The reading difference rises by 9 minus 4, or 5 cubic metres.

2. Each extra cubic metre costs 3 riyals; the same fixed fee appears on both bills.

$3(9-4)=15$

$15$ riyals

If recorded use were 10, the bill would be 40. Corrected use would be 15 and the bill 55, a difference of 15.

Corrects only the ending reading.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"يُحسب الاستهلاك بطرح قراءة البداية من قراءة النهاية.","En":"Consumption is the ending reading minus the starting reading."},{"Ar":"ما أثر إضافة 9 إلى النهاية و4 إلى البداية على الفرق بينهما؟","En":"What happens to that difference when 9 is added to the end and 4 to the start?"}],"Solution":{"Idea":{"Ar":"يتغير الاستهلاك بمقدار تصحيح قراءة النهاية ناقص تصحيح قراءة البداية، والرسم الثابت لا يتغير.","En":"Consumption changes by the end-reading correction minus the start-reading correction; the fixed charge cancels."},"FormulaLatex":"\\Delta B=3(\\Delta E-\\Delta S)","Steps":[{"Ar":"يزداد فرق القراءتين بمقدار 9 ناقص 4، أي 5 أمتار مكعبة.","En":"The reading difference rises by 9 minus 4, or 5 cubic metres."},{"Ar":"يُحتسب سعر 3 ريالات لكل متر مكعب إضافي، والرسم ثابت في الفاتورتين.","En":"Each extra cubic metre costs 3 riyals; the same fixed fee appears on both bills."}],"Substitution":{"Ar":"$3(9-4)=15$","En":"$3(9-4)=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"ريالاً","En":"riyals"},"Verification":{"Ar":"لو كان الاستهلاك المسجل 10، لكانت الفاتورة 40، وبعد التصحيح يكون 15 والفاتورة 55، والفرق 15.","En":"If recorded use were 10, the bill would be 40. Corrected use would be 15 and the bill 55, a difference of 15."},"CommonError":{"Ar":"صحّح قراءة النهاية وحدها.","En":"Corrects only the ending reading."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"صحّح قراءة النهاية وحدها.","En":"Corrects only the ending reading."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع التصحيحين بدلاً من طرح أحدهما من الآخر.","En":"Adds the two corrections instead of subtracting one from the other."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الرسم الثابت إلى زيادة الفاتورة.","En":"Adds the fixed fee to the increase."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v17-grade-9-deduce-bounded-cumulative-count-1$mw$,$mw$deduce-bounded-cumulative-count$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"حدّ التسجيل داخل فئة","En":"A threshold inside a class"},"Question":{"Ar":"سُجّلت أزمنة صحيحة بالثواني لاثني عشر متسابقاً. تقع خمسة أزمنة بين 10 و14، وأربعة بين 15 و19، وثلاثة بين 20 و24، مع شمول الطرفين. كان اثنان بالضبط من أصحاب الفئة الوسطى دون 18 ثانية. كم متسابقاً كان زمنه 18 ثانية فأكثر؟","En":"Twelve race times are recorded in whole seconds. Five are from 10 to 14, four from 15 to 19, and three from 20 to 24, with inclusive endpoints. Exactly two times in the middle class are below 18 seconds. How many times are 18 seconds or more?"},"Options":[{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب عدد الأزمنة المستبعدة أو جمع الفئتين الأخيرتين كاملاً.","En":"Counts the excluded times or includes both last classes in full."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الفئة الأخيرة فقط.","En":"Counts only the last class."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الجزء المؤهل من الفئة الوسطى فقط.","En":"Counts only the qualifying part of the middle class."}}],"Hints":[{"Ar":"هل تشمل الإجابة أي زمن من الفئة الأولى؟","En":"Does the first class contribute any qualifying times?"},{"Ar":"أخرج صاحبي الزمن دون 18 من الفئة الوسطى ثم أضف الفئة الأخيرة.","En":"Remove the two times below 18 from the middle class, then add the last class."}],"Solution":{"Idea":{"Ar":"نجمع عدد الأزمنة المؤهلة في كل فئة، بعد استبعاد ما يقع دون الحد المطلوب.","En":"Add qualifying observations in each class after excluding values below the threshold."},"FormulaLatex":"N=(f_2-k)+f_3","Steps":[{"Ar":"كل أزمنة الفئة الأولى دون الحد، في حين تحقق أزمنة الفئة الثالثة الثلاثة الشرط.","En":"All first-class times are below the threshold, while all three times in the last class qualify."},{"Ar":"يتبقى زمنان من الفئة الوسطى بعد استبعاد الزمنين المعلومين.","En":"Two times remain in the middle class after excluding the given two."}],"Substitution":{"Ar":"$(4-2)+3=5$","En":"$(4-2)+3=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"متسابقين","En":"racers"},"Verification":{"Ar":"توجد سبعة أزمنة دون 18، فيبقى خمسة من اثني عشر.","En":"Seven times are below 18, leaving five out of twelve."},"CommonError":{"Ar":"حسب عدد الأزمنة المستبعدة أو جمع الفئتين الأخيرتين كاملاً.","En":"Counts the excluded times or includes both last classes in full."}}}$mw$::jsonb,$mw$نجمع عدد الأزمنة المؤهلة في كل فئة، بعد استبعاد ما يقع دون الحد المطلوب.

$N=(f_2-k)+f_3$

1. كل أزمنة الفئة الأولى دون الحد، في حين تحقق أزمنة الفئة الثالثة الثلاثة الشرط.

2. يتبقى زمنان من الفئة الوسطى بعد استبعاد الزمنين المعلومين.

$(4-2)+3=5$

$5$ متسابقين

توجد سبعة أزمنة دون 18، فيبقى خمسة من اثني عشر.

حسب عدد الأزمنة المستبعدة أو جمع الفئتين الأخيرتين كاملاً.$mw$,$mw$Add qualifying observations in each class after excluding values below the threshold.

$N=(f_2-k)+f_3$

1. All first-class times are below the threshold, while all three times in the last class qualify.

2. Two times remain in the middle class after excluding the given two.

$(4-2)+3=5$

$5$ racers

Seven times are below 18, leaving five out of twelve.

Counts the excluded times or includes both last classes in full.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"هل تشمل الإجابة أي زمن من الفئة الأولى؟","En":"Does the first class contribute any qualifying times?"},{"Ar":"أخرج صاحبي الزمن دون 18 من الفئة الوسطى ثم أضف الفئة الأخيرة.","En":"Remove the two times below 18 from the middle class, then add the last class."}],"Solution":{"Idea":{"Ar":"نجمع عدد الأزمنة المؤهلة في كل فئة، بعد استبعاد ما يقع دون الحد المطلوب.","En":"Add qualifying observations in each class after excluding values below the threshold."},"FormulaLatex":"N=(f_2-k)+f_3","Steps":[{"Ar":"كل أزمنة الفئة الأولى دون الحد، في حين تحقق أزمنة الفئة الثالثة الثلاثة الشرط.","En":"All first-class times are below the threshold, while all three times in the last class qualify."},{"Ar":"يتبقى زمنان من الفئة الوسطى بعد استبعاد الزمنين المعلومين.","En":"Two times remain in the middle class after excluding the given two."}],"Substitution":{"Ar":"$(4-2)+3=5$","En":"$(4-2)+3=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"متسابقين","En":"racers"},"Verification":{"Ar":"توجد سبعة أزمنة دون 18، فيبقى خمسة من اثني عشر.","En":"Seven times are below 18, leaving five out of twelve."},"CommonError":{"Ar":"حسب عدد الأزمنة المستبعدة أو جمع الفئتين الأخيرتين كاملاً.","En":"Counts the excluded times or includes both last classes in full."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب عدد الأزمنة المستبعدة أو جمع الفئتين الأخيرتين كاملاً.","En":"Counts the excluded times or includes both last classes in full."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الفئة الأخيرة فقط.","En":"Counts only the last class."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب الجزء المؤهل من الفئة الوسطى فقط.","En":"Counts only the qualifying part of the middle class."},"Order":4}]}$mw$),
($mw$growth-v17-grade-10-compare-towers-fixed-angle-different-baselines-1$mw$,$mw$compare-towers-fixed-angle-different-baselines$mw$,$mw$secondary-right-triangle-trig-ratios$mw$,$mw$grade-10$mw$,10,3,10,48,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":48,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"قياسان بالزاوية نفسها","En":"Two sightings at the same angle"},"Question":{"Ar":"على أرض أفقية، كانت زاوية ارتفاع قمّة برج أول من نقطة تبعد 12 متراً عن قاعدته مساوية لزاوية ارتفاع قمة برج ثانٍ من نقطة تبعد 20 متراً عن قاعدته. قِيسَت الزاويتان من مستوى الأرض. إذا كان انخفاض ارتفاع البرج الأول عن الثاني 6 أمتار، فما ارتفاع البرج الثاني؟","En":"On level ground, the angle of elevation to the first tower from 12 metres away equals that to the second tower from 20 metres away. Both angles are measured from ground level. If the second tower is 6 metres taller, how tall is it?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى ارتفاع البرج الأول.","En":"Reports the first tower's height."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس الظل ثم ضربه في مسافة البرج الأول.","En":"Reverses the tangent and multiplies by the first distance."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى فرق الارتفاعين.","En":"Reports the height difference."}}],"Hints":[{"Ar":"اكتب ظل الزاوية لكل برج باستخدام الارتفاع والمسافة الأفقية.","En":"Write the tangent for each tower using height and horizontal distance."},{"Ar":"عبّر عن فرق الارتفاعين بدلالة الظل المشترك.","En":"Express the height difference using the common tangent."}],"Solution":{"Idea":{"Ar":"لزاوية الارتفاع نفسها، تكون نسبة الارتفاع إلى المسافة الأفقية ثابتة.","En":"For the same elevation angle the ratio of height to horizontal distance is constant."},"FormulaLatex":"h_2-h_1=(d_2-d_1)\\tan\\theta","Steps":[{"Ar":"كل ارتفاع يساوي المسافة الأفقية مضروبة في الظل نفسه.","En":"Each height equals its horizontal distance times the same tangent."},{"Ar":"فرق المسافتين 8 أمتار وفرق الارتفاعين 6 أمتار، فيساوي الظل 6/8.","En":"The distances differ by 8 metres and the heights by 6 metres, giving tangent 6/8."},{"Ar":"اضرب ظل الزاوية في المسافة الأفقية للبرج الثاني.","En":"Multiply the common tangent by the second tower's horizontal distance."}],"Substitution":{"Ar":"$20(6/8)=15$","En":"$20(6/8)=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"متراً","En":"metres"},"Verification":{"Ar":"ارتفاع الأول 9 أمتار، ولدينا 9/12=15/20 والفرق 6 أمتار.","En":"The first is 9 metres tall, giving 9/12=15/20 and a height difference of 6 metres."},"CommonError":{"Ar":"أعطى ارتفاع البرج الأول.","En":"Reports the first tower's height."}}}$mw$::jsonb,$mw$لزاوية الارتفاع نفسها، تكون نسبة الارتفاع إلى المسافة الأفقية ثابتة.

$h_2-h_1=(d_2-d_1)\tan\theta$

1. كل ارتفاع يساوي المسافة الأفقية مضروبة في الظل نفسه.

2. فرق المسافتين 8 أمتار وفرق الارتفاعين 6 أمتار، فيساوي الظل 6/8.

3. اضرب ظل الزاوية في المسافة الأفقية للبرج الثاني.

$20(6/8)=15$

$15$ متراً

ارتفاع الأول 9 أمتار، ولدينا 9/12=15/20 والفرق 6 أمتار.

أعطى ارتفاع البرج الأول.$mw$,$mw$For the same elevation angle the ratio of height to horizontal distance is constant.

$h_2-h_1=(d_2-d_1)\tan\theta$

1. Each height equals its horizontal distance times the same tangent.

2. The distances differ by 8 metres and the heights by 6 metres, giving tangent 6/8.

3. Multiply the common tangent by the second tower's horizontal distance.

$20(6/8)=15$

$15$ metres

The first is 9 metres tall, giving 9/12=15/20 and a height difference of 6 metres.

Reports the first tower's height.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"اكتب ظل الزاوية لكل برج باستخدام الارتفاع والمسافة الأفقية.","En":"Write the tangent for each tower using height and horizontal distance."},{"Ar":"عبّر عن فرق الارتفاعين بدلالة الظل المشترك.","En":"Express the height difference using the common tangent."}],"Solution":{"Idea":{"Ar":"لزاوية الارتفاع نفسها، تكون نسبة الارتفاع إلى المسافة الأفقية ثابتة.","En":"For the same elevation angle the ratio of height to horizontal distance is constant."},"FormulaLatex":"h_2-h_1=(d_2-d_1)\\tan\\theta","Steps":[{"Ar":"كل ارتفاع يساوي المسافة الأفقية مضروبة في الظل نفسه.","En":"Each height equals its horizontal distance times the same tangent."},{"Ar":"فرق المسافتين 8 أمتار وفرق الارتفاعين 6 أمتار، فيساوي الظل 6/8.","En":"The distances differ by 8 metres and the heights by 6 metres, giving tangent 6/8."},{"Ar":"اضرب ظل الزاوية في المسافة الأفقية للبرج الثاني.","En":"Multiply the common tangent by the second tower's horizontal distance."}],"Substitution":{"Ar":"$20(6/8)=15$","En":"$20(6/8)=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"متراً","En":"metres"},"Verification":{"Ar":"ارتفاع الأول 9 أمتار، ولدينا 9/12=15/20 والفرق 6 أمتار.","En":"The first is 9 metres tall, giving 9/12=15/20 and a height difference of 6 metres."},"CommonError":{"Ar":"أعطى ارتفاع البرج الأول.","En":"Reports the first tower's height."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى ارتفاع البرج الأول.","En":"Reports the first tower's height."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عكس الظل ثم ضربه في مسافة البرج الأول.","En":"Reverses the tangent and multiplies by the first distance."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى فرق الارتفاعين.","En":"Reports the height difference."},"Order":4}]}$mw$),
($mw$growth-v17-grade-10-staggered-index-equal-arithmetic-rows-1$mw$,$mw$staggered-index-equal-arithmetic-rows$mw$,$mw$s-sequences-series-arithmetic-sequences$mw$,$mw$grade-10$mw$,10,3,23,104,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":104,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"تطابق صفين بمؤشّرين مختلفين","En":"Matching rows with offset indices"},"Question":{"Ar":"عدادان يعرضان القيم $a_n=5+3(n-1)$ و$b_n=1+4(n-1)$ للعدد الصحيح $n\\ge1$. عند أي خطوة $n\\ge2$ تساوي قراءة العداد الأول قراءة العداد الثاني في الخطوة السابقة؟","En":"Two counters have readings $a_n=5+3(n-1)$ and $b_n=1+4(n-1)$ at integer step $n\\ge1$. At which step $n\\ge2$ does the first counter's current reading equal the second counter's preceding reading?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ساوى القراءتين عند الخطوة نفسها.","En":"Equates readings at the same step."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى رقم الخطوة السابقة للعداد الثاني.","En":"Reports the previous step of the second counter."}},{"LatexCode":"29","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى القراءة المشتركة.","En":"Reports the common reading."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"عوّض بـn−1 في صيغة العداد الثاني.","En":"Substitute n−1 into the second counter's formula."},{"Ar":"ساوِ 5+3(n−1) بـ1+4(n−2).","En":"Set 5+3(n−1) equal to 1+4(n−2)."}],"Solution":{"Idea":{"Ar":"يجب إزاحة مؤشر العداد الثاني خطوة واحدة إلى الوراء قبل مساواة الصيغتين.","En":"Shift the second counter's index back one step before equating the expressions."},"FormulaLatex":"a_n=b_{n-1}","Steps":[{"Ar":"تبسيط صيغة العداد الأول يعطي 3n+2.","En":"Simplify the first counter's reading to 3n+2."},{"Ar":"القراءة السابقة للثاني هي 4n−7. بمساواتها بالأولى نجد n=9.","En":"The previous reading of the second is 4n−7. Equate this to the first to get n=9."}],"Substitution":{"Ar":"$3n+2=4n-7\\Rightarrow n=9$","En":"$3n+2=4n-7\\Rightarrow n=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"رقم الخطوة","En":"step number"},"Verification":{"Ar":"في الخطوة 9 للعداد الأول والخطوة 8 للثاني تظهر القيمة 29 في كليهما.","En":"The first counter at step 9 and the second at step 8 both show 29."},"CommonError":{"Ar":"ساوى القراءتين عند الخطوة نفسها.","En":"Equates readings at the same step."}}}$mw$::jsonb,$mw$يجب إزاحة مؤشر العداد الثاني خطوة واحدة إلى الوراء قبل مساواة الصيغتين.

$a_n=b_{n-1}$

1. تبسيط صيغة العداد الأول يعطي 3n+2.

2. القراءة السابقة للثاني هي 4n−7. بمساواتها بالأولى نجد n=9.

$3n+2=4n-7\Rightarrow n=9$

$9$ رقم الخطوة

في الخطوة 9 للعداد الأول والخطوة 8 للثاني تظهر القيمة 29 في كليهما.

ساوى القراءتين عند الخطوة نفسها.$mw$,$mw$Shift the second counter's index back one step before equating the expressions.

$a_n=b_{n-1}$

1. Simplify the first counter's reading to 3n+2.

2. The previous reading of the second is 4n−7. Equate this to the first to get n=9.

$3n+2=4n-7\Rightarrow n=9$

$9$ step number

The first counter at step 9 and the second at step 8 both show 29.

Equates readings at the same step.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"عوّض بـn−1 في صيغة العداد الثاني.","En":"Substitute n−1 into the second counter's formula."},{"Ar":"ساوِ 5+3(n−1) بـ1+4(n−2).","En":"Set 5+3(n−1) equal to 1+4(n−2)."}],"Solution":{"Idea":{"Ar":"يجب إزاحة مؤشر العداد الثاني خطوة واحدة إلى الوراء قبل مساواة الصيغتين.","En":"Shift the second counter's index back one step before equating the expressions."},"FormulaLatex":"a_n=b_{n-1}","Steps":[{"Ar":"تبسيط صيغة العداد الأول يعطي 3n+2.","En":"Simplify the first counter's reading to 3n+2."},{"Ar":"القراءة السابقة للثاني هي 4n−7. بمساواتها بالأولى نجد n=9.","En":"The previous reading of the second is 4n−7. Equate this to the first to get n=9."}],"Substitution":{"Ar":"$3n+2=4n-7\\Rightarrow n=9$","En":"$3n+2=4n-7\\Rightarrow n=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"رقم الخطوة","En":"step number"},"Verification":{"Ar":"في الخطوة 9 للعداد الأول والخطوة 8 للثاني تظهر القيمة 29 في كليهما.","En":"The first counter at step 9 and the second at step 8 both show 29."},"CommonError":{"Ar":"ساوى القراءتين عند الخطوة نفسها.","En":"Equates readings at the same step."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ساوى القراءتين عند الخطوة نفسها.","En":"Equates readings at the same step."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى رقم الخطوة السابقة للعداد الثاني.","En":"Reports the previous step of the second counter."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى القراءة المشتركة.","En":"Reports the common reading."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v17-grade-11-selection-pairs-different-flavours-1$mw$,$mw$selection-pairs-different-flavours$mw$,$mw$secondary-combinations$mw$,$mw$grade-11$mw$,11,3,12,56,$mw${"StageId":3,"CategoryId":12,"PrimarySkillId":56,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"اختيار نكهتين مختلفتين","En":"Choosing two different flavours"},"Question":{"Ar":"لدى متجر 4 علب نعناع و3 علب ليمون وعلبتا توت. العلب مميزة بأرقامها، ونختار علبتين دون ترتيب. كم زوجاً يضم نكهتين مختلفتين؟","En":"A shop has four mint tins, three lemon tins and two berry tins. Tins are individually numbered, and a selection of two is unordered. How many pairs contain different flavours?"},"Options":[{"LatexCode":"26","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب جميع الأزواج دون شرط النكهة.","En":"Counts all pairs regardless of flavour."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الأزواج التي لها النكهة نفسها.","En":"Counts same-flavour pairs."}},{"LatexCode":"52","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ كل زوج مختلف النكهة بترتيبين.","En":"Counts each different-flavour pair in both orders."}}],"Hints":[{"Ar":"ما أزواج النكهات الممكنة؟","En":"List the possible flavour pairs."},{"Ar":"اضرب عددي العلب لكل زوج نكهات ثم اجمع حالات النكهات الثلاث.","En":"Multiply the tin counts for each flavour pair, then add across the three cases."}],"Solution":{"Idea":{"Ar":"نقسم الأزواج حسب النكهتين المختلفتين، ونعد كل زوج مرة واحدة.","En":"Partition pairs by the two distinct flavours and count each pair once."},"FormulaLatex":"N=ab+ac+bc","Steps":[{"Ar":"لزوج نعناع وليمون 12 اختياراً، ولزوج نعناع وتوت 8.","En":"Mint–lemon gives 12 selections and mint–berry gives 8."},{"Ar":"لزوج ليمون وتوت 6 اختيارات. مجموع الحالات غير المتداخلة هو المطلوب.","En":"Lemon–berry gives 6 selections. Add these disjoint cases."}],"Substitution":{"Ar":"$12+8+6=26$","En":"$12+8+6=26$"},"Result":{"Ar":"$26$","En":"$26$"},"Unit":{"Ar":"زوجاً","En":"pairs"},"Verification":{"Ar":"من جميع الأزواج وعددها 36 نستبعد 6+3+1 أزواج متجانسة، فيبقى 26.","En":"Of the 36 total pairs, exclude 6+3+1 same-flavour pairs to leave 26."},"CommonError":{"Ar":"حسب جميع الأزواج دون شرط النكهة.","En":"Counts all pairs regardless of flavour."}}}$mw$::jsonb,$mw$نقسم الأزواج حسب النكهتين المختلفتين، ونعد كل زوج مرة واحدة.

$N=ab+ac+bc$

1. لزوج نعناع وليمون 12 اختياراً، ولزوج نعناع وتوت 8.

2. لزوج ليمون وتوت 6 اختيارات. مجموع الحالات غير المتداخلة هو المطلوب.

$12+8+6=26$

$26$ زوجاً

من جميع الأزواج وعددها 36 نستبعد 6+3+1 أزواج متجانسة، فيبقى 26.

حسب جميع الأزواج دون شرط النكهة.$mw$,$mw$Partition pairs by the two distinct flavours and count each pair once.

$N=ab+ac+bc$

1. Mint–lemon gives 12 selections and mint–berry gives 8.

2. Lemon–berry gives 6 selections. Add these disjoint cases.

$12+8+6=26$

$26$ pairs

Of the 36 total pairs, exclude 6+3+1 same-flavour pairs to leave 26.

Counts all pairs regardless of flavour.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"ما أزواج النكهات الممكنة؟","En":"List the possible flavour pairs."},{"Ar":"اضرب عددي العلب لكل زوج نكهات ثم اجمع حالات النكهات الثلاث.","En":"Multiply the tin counts for each flavour pair, then add across the three cases."}],"Solution":{"Idea":{"Ar":"نقسم الأزواج حسب النكهتين المختلفتين، ونعد كل زوج مرة واحدة.","En":"Partition pairs by the two distinct flavours and count each pair once."},"FormulaLatex":"N=ab+ac+bc","Steps":[{"Ar":"لزوج نعناع وليمون 12 اختياراً، ولزوج نعناع وتوت 8.","En":"Mint–lemon gives 12 selections and mint–berry gives 8."},{"Ar":"لزوج ليمون وتوت 6 اختيارات. مجموع الحالات غير المتداخلة هو المطلوب.","En":"Lemon–berry gives 6 selections. Add these disjoint cases."}],"Substitution":{"Ar":"$12+8+6=26$","En":"$12+8+6=26$"},"Result":{"Ar":"$26$","En":"$26$"},"Unit":{"Ar":"زوجاً","En":"pairs"},"Verification":{"Ar":"من جميع الأزواج وعددها 36 نستبعد 6+3+1 أزواج متجانسة، فيبقى 26.","En":"Of the 36 total pairs, exclude 6+3+1 same-flavour pairs to leave 26."},"CommonError":{"Ar":"حسب جميع الأزواج دون شرط النكهة.","En":"Counts all pairs regardless of flavour."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب جميع الأزواج دون شرط النكهة.","En":"Counts all pairs regardless of flavour."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الأزواج التي لها النكهة نفسها.","En":"Counts same-flavour pairs."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ كل زوج مختلف النكهة بترتيبين.","En":"Counts each different-flavour pair in both orders."},"Order":4}]}$mw$),
($mw$growth-v17-grade-11-variance-deletion-equal-opposite-deviations-1$mw$,$mw$variance-deletion-equal-opposite-deviations$mw$,$mw$secondary-population-variance$mw$,$mw$grade-11$mw$,11,3,35,54,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":54,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"تباين بعد حذف درجتين","En":"Variance after removing two scores"},"Question":{"Ar":"متوسط مجموعة من ثماني درجات يساوي 10، وتباين المجتمع فيها 9. نحذف درجتين قيمتاهما 6 و14. ما تباين المجتمع للدرجات الست المتبقية؟","En":"Eight scores have a mean of 10 and population variance 9. Remove scores 6 and 14. What is the population variance of the six remaining scores?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع المربعات الجديد على عدد الدرجات الأصلي.","En":"Divides the new total by the original number of scores."}},{"LatexCode":"\\frac{20}{3}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن بقاء المتوسط يعني بقاء التباين.","En":"Assumes an unchanged mean implies an unchanged variance."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"غيّر المقام دون طرح مساهمتي الدرجتين.","En":"Changes the denominator without removing either contribution."}}],"Hints":[{"Ar":"هل يتغير المتوسط عند حذف درجتين مجموعهما 20؟","En":"Does the mean change after removing two scores whose sum is 20?"},{"Ar":"احسب مجموع مربعات الانحرافات القديم، ثم احذف مربعي انحرافي الدرجتين.","En":"Recover the old squared-deviation total, then remove the two deleted contributions."}],"Solution":{"Idea":{"Ar":"حذف قيمتين متناظرتين حول المتوسط لا يغيّر المتوسط، ولكنه يغيّر مجموع مربعات الانحرافات وعدد القيم.","En":"Removing two values symmetric about the mean preserves the mean but changes the squared-deviation sum and sample count."},"FormulaLatex":"\\sigma_{\\mathrm{new}}^2=\\frac{n\\sigma^2-(6-10)^2-(14-10)^2}{n-2}","Steps":[{"Ar":"يبقى المتوسط 10 لأن متوسط القيمتين المحذوفتين يساوي المتوسط الأصلي.","En":"The mean remains 10 because the removed scores average to the original mean."},{"Ar":"مجموع مربعات الانحرافات الأصلي 72. ينقص بمقدار 32 وتبقى ست درجات.","En":"The original squared-deviation total is 72. It drops by 32, leaving six scores."}],"Substitution":{"Ar":"$\\frac{72-32}{6}=\\frac{20}{3}$","En":"$\\frac{72-32}{6}=\\frac{20}{3}$"},"Result":{"Ar":"$\\frac{20}{3}$","En":"$\\frac{20}{3}$"},"Unit":{"Ar":"وحدات مربعة","En":"squared score units"},"Verification":{"Ar":"إعادة إدخال الدرجتين ترفع مجموع المربعات من 40 إلى 72، و72/8=9.","En":"Reinserting the scores raises the squared-deviation total from 40 to 72, and 72/8=9."},"CommonError":{"Ar":"قسم مجموع المربعات الجديد على عدد الدرجات الأصلي.","En":"Divides the new total by the original number of scores."}}}$mw$::jsonb,$mw$حذف قيمتين متناظرتين حول المتوسط لا يغيّر المتوسط، ولكنه يغيّر مجموع مربعات الانحرافات وعدد القيم.

$\sigma_{\mathrm{new}}^2=\frac{n\sigma^2-(6-10)^2-(14-10)^2}{n-2}$

1. يبقى المتوسط 10 لأن متوسط القيمتين المحذوفتين يساوي المتوسط الأصلي.

2. مجموع مربعات الانحرافات الأصلي 72. ينقص بمقدار 32 وتبقى ست درجات.

$\frac{72-32}{6}=\frac{20}{3}$

$\frac{20}{3}$ وحدات مربعة

إعادة إدخال الدرجتين ترفع مجموع المربعات من 40 إلى 72، و72/8=9.

قسم مجموع المربعات الجديد على عدد الدرجات الأصلي.$mw$,$mw$Removing two values symmetric about the mean preserves the mean but changes the squared-deviation sum and sample count.

$\sigma_{\mathrm{new}}^2=\frac{n\sigma^2-(6-10)^2-(14-10)^2}{n-2}$

1. The mean remains 10 because the removed scores average to the original mean.

2. The original squared-deviation total is 72. It drops by 32, leaving six scores.

$\frac{72-32}{6}=\frac{20}{3}$

$\frac{20}{3}$ squared score units

Reinserting the scores raises the squared-deviation total from 40 to 72, and 72/8=9.

Divides the new total by the original number of scores.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"هل يتغير المتوسط عند حذف درجتين مجموعهما 20؟","En":"Does the mean change after removing two scores whose sum is 20?"},{"Ar":"احسب مجموع مربعات الانحرافات القديم، ثم احذف مربعي انحرافي الدرجتين.","En":"Recover the old squared-deviation total, then remove the two deleted contributions."}],"Solution":{"Idea":{"Ar":"حذف قيمتين متناظرتين حول المتوسط لا يغيّر المتوسط، ولكنه يغيّر مجموع مربعات الانحرافات وعدد القيم.","En":"Removing two values symmetric about the mean preserves the mean but changes the squared-deviation sum and sample count."},"FormulaLatex":"\\sigma_{\\mathrm{new}}^2=\\frac{n\\sigma^2-(6-10)^2-(14-10)^2}{n-2}","Steps":[{"Ar":"يبقى المتوسط 10 لأن متوسط القيمتين المحذوفتين يساوي المتوسط الأصلي.","En":"The mean remains 10 because the removed scores average to the original mean."},{"Ar":"مجموع مربعات الانحرافات الأصلي 72. ينقص بمقدار 32 وتبقى ست درجات.","En":"The original squared-deviation total is 72. It drops by 32, leaving six scores."}],"Substitution":{"Ar":"$\\frac{72-32}{6}=\\frac{20}{3}$","En":"$\\frac{72-32}{6}=\\frac{20}{3}$"},"Result":{"Ar":"$\\frac{20}{3}$","En":"$\\frac{20}{3}$"},"Unit":{"Ar":"وحدات مربعة","En":"squared score units"},"Verification":{"Ar":"إعادة إدخال الدرجتين ترفع مجموع المربعات من 40 إلى 72، و72/8=9.","En":"Reinserting the scores raises the squared-deviation total from 40 to 72, and 72/8=9."},"CommonError":{"Ar":"قسم مجموع المربعات الجديد على عدد الدرجات الأصلي.","En":"Divides the new total by the original number of scores."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع المربعات الجديد على عدد الدرجات الأصلي.","En":"Divides the new total by the original number of scores."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن بقاء المتوسط يعني بقاء التباين.","En":"Assumes an unchanged mean implies an unchanged variance."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"غيّر المقام دون طرح مساهمتي الدرجتين.","En":"Changes the denominator without removing either contribution."},"Order":4}]}$mw$),
($mw$growth-v17-grade-12-alternating-affine-two-cycle-1$mw$,$mw$alternating-affine-two-cycle$mw$,$mw$s-sequences-series-recurrence-relations$mw$,$mw$grade-12$mw$,12,3,23,102,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":102,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"دورة في متتالية","En":"A cycle in a recurrence"},"Question":{"Ar":"تبدأ متتالية بالحد $a_1=3$ وتتبع القاعدة $a_{n+1}=11-a_n$. ما قيمة $a_{2026}$؟","En":"A sequence starts with $a_1=3$ and follows $a_{n+1}=11-a_n$. What is $a_{2026}$?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم قيمة الحدود ذات المؤشر الفردي.","En":"Uses the value at odd indices."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع حدين متتاليين.","En":"Reports the sum of consecutive terms."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى النقطة الثابتة رغم أن المتتالية تبدأ من 3.","En":"Reports the fixed point even though the sequence starts at 3."}}],"Hints":[{"Ar":"احسب الحدّين التاليين للحد الأول.","En":"Compute the two terms after the initial one."},{"Ar":"طبّق القاعدة مرتين على حد عام لتعرف ما الذي يتكرر.","En":"Apply the rule twice to a general term to see what repeats."}],"Solution":{"Idea":{"Ar":"تطبيق قاعدة المتتالية مرتين يعيد القيمة نفسها، لذلك يعتمد الناتج على زوجية المؤشر.","En":"Applying the recurrence twice returns the same value, so the answer depends on index parity."},"FormulaLatex":"a_{n+2}=11-(11-a_n)=a_n","Steps":[{"Ar":"الحد الثاني 8 والثالث 3. كل تطبيقين يعيدان القيمة الأصلية.","En":"The second term is 8 and the third is 3. Two applications undo each other."},{"Ar":"الحدود الزوجية كلها 8، و2026 عدد زوجي.","En":"Every even-indexed term equals 8, and 2026 is even."}],"Substitution":{"Ar":"$a_{2026}=a_2=8$","En":"$a_{2026}=a_2=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"يأتي بعد 8 القيمة 3، وبعد 3 القيمة 8 مجدداً.","En":"The rule sends 8 to 3 and sends 3 back to 8."},"CommonError":{"Ar":"استخدم قيمة الحدود ذات المؤشر الفردي.","En":"Uses the value at odd indices."}}}$mw$::jsonb,$mw$تطبيق قاعدة المتتالية مرتين يعيد القيمة نفسها، لذلك يعتمد الناتج على زوجية المؤشر.

$a_{n+2}=11-(11-a_n)=a_n$

1. الحد الثاني 8 والثالث 3. كل تطبيقين يعيدان القيمة الأصلية.

2. الحدود الزوجية كلها 8، و2026 عدد زوجي.

$a_{2026}=a_2=8$

$8$ بلا وحدة

يأتي بعد 8 القيمة 3، وبعد 3 القيمة 8 مجدداً.

استخدم قيمة الحدود ذات المؤشر الفردي.$mw$,$mw$Applying the recurrence twice returns the same value, so the answer depends on index parity.

$a_{n+2}=11-(11-a_n)=a_n$

1. The second term is 8 and the third is 3. Two applications undo each other.

2. Every even-indexed term equals 8, and 2026 is even.

$a_{2026}=a_2=8$

$8$ unitless

The rule sends 8 to 3 and sends 3 back to 8.

Uses the value at odd indices.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"احسب الحدّين التاليين للحد الأول.","En":"Compute the two terms after the initial one."},{"Ar":"طبّق القاعدة مرتين على حد عام لتعرف ما الذي يتكرر.","En":"Apply the rule twice to a general term to see what repeats."}],"Solution":{"Idea":{"Ar":"تطبيق قاعدة المتتالية مرتين يعيد القيمة نفسها، لذلك يعتمد الناتج على زوجية المؤشر.","En":"Applying the recurrence twice returns the same value, so the answer depends on index parity."},"FormulaLatex":"a_{n+2}=11-(11-a_n)=a_n","Steps":[{"Ar":"الحد الثاني 8 والثالث 3. كل تطبيقين يعيدان القيمة الأصلية.","En":"The second term is 8 and the third is 3. Two applications undo each other."},{"Ar":"الحدود الزوجية كلها 8، و2026 عدد زوجي.","En":"Every even-indexed term equals 8, and 2026 is even."}],"Substitution":{"Ar":"$a_{2026}=a_2=8$","En":"$a_{2026}=a_2=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"يأتي بعد 8 القيمة 3، وبعد 3 القيمة 8 مجدداً.","En":"The rule sends 8 to 3 and sends 3 back to 8."},"CommonError":{"Ar":"استخدم قيمة الحدود ذات المؤشر الفردي.","En":"Uses the value at odd indices."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استخدم قيمة الحدود ذات المؤشر الفردي.","En":"Uses the value at odd indices."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع حدين متتاليين.","En":"Reports the sum of consecutive terms."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى النقطة الثابتة رغم أن المتتالية تبدأ من 3.","En":"Reports the fixed point even though the sequence starts at 3."},"Order":4}]}$mw$),
($mw$growth-v17-grade-12-recover-net-change-from-reversed-measurements-1$mw$,$mw$recover-net-change-from-reversed-measurements$mw$,$mw$secondary-definite-integrals$mw$,$mw$grade-12$mw$,12,3,11,51,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":51,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"تغيّر المخزون في فترة وسطى","En":"Inventory change in a middle interval"},"Question":{"Ar":"يمثل $r(t)$ المعدل الصافي لتغيّر مخزون خزان باللتر في الساعة. إذا كانت $\\int_0^6 r(t)\\,dt=11$ و$\\int_2^0 r(t)\\,dt=-4$ و$\\int_6^5 r(t)\\,dt=3$، فما صافي تغيّر المخزون من الساعة 2 إلى الساعة 5؟","En":"The function $r(t)$ is the net rate of change of tank inventory in litres per hour. If $\\int_0^6 r(t)\\,dt=11$, $\\int_2^0 r(t)\\,dt=-4$, and $\\int_6^5 r(t)\\,dt=3$, what is the net inventory change from hour 2 to hour 5?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 3 كأن التغير الأخير كان في الاتجاه الأمامي.","En":"Subtracts 3 as if the final interval were given forwards."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح القيمتين المعكوستين كما وردتا.","En":"Subtracts both reversed readings as given."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صحّح اتجاه الفترة الأخيرة وأغفل الفترة الأولى.","En":"Reverses the last interval and omits the first one."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"حوّل القياسين المعكوسين إلى الاتجاه الذي يزداد فيه الزمن.","En":"Rewrite the reversed readings in the forward time direction."},{"Ar":"قسّم التكامل من 0 إلى 6 إلى ثلاث فترات عند 2 و5.","En":"Split the integral from 0 to 6 at hours 2 and 5."}],"Solution":{"Idea":{"Ar":"تُجمع التكاملات على الفترات المتجاورة، وعكس حدود التكامل يغيّر إشارته.","En":"Integrals add across adjacent intervals, and reversing their bounds changes the sign."},"FormulaLatex":"\\int_2^5 r(t)\\,dt=\\int_0^6 r(t)\\,dt+\\int_2^0 r(t)\\,dt+\\int_6^5 r(t)\\,dt","Steps":[{"Ar":"صافي 0 إلى 2 يساوي 4، وصافي 5 إلى 6 يساوي −3.","En":"The net changes on 0 to 2 and 5 to 6 are 4 and −3."},{"Ar":"اطرح التغيرين الطرفيين من التغير الكلي لتبقى الفترة الوسطى.","En":"Subtract those endpoint interval changes from the whole to isolate the middle interval."}],"Substitution":{"Ar":"$11+(-4)+3=10$","En":"$11+(-4)+3=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"لترات","En":"litres"},"Verification":{"Ar":"نجمع 4 و10 و−3 فنستعيد التغير الكلي 11 لتراً.","En":"Adding 4, 10 and −3 recovers the total net change of 11 litres."},"CommonError":{"Ar":"طرح 3 كأن التغير الأخير كان في الاتجاه الأمامي.","En":"Subtracts 3 as if the final interval were given forwards."}}}$mw$::jsonb,$mw$تُجمع التكاملات على الفترات المتجاورة، وعكس حدود التكامل يغيّر إشارته.

$\int_2^5 r(t)\,dt=\int_0^6 r(t)\,dt+\int_2^0 r(t)\,dt+\int_6^5 r(t)\,dt$

1. صافي 0 إلى 2 يساوي 4، وصافي 5 إلى 6 يساوي −3.

2. اطرح التغيرين الطرفيين من التغير الكلي لتبقى الفترة الوسطى.

$11+(-4)+3=10$

$10$ لترات

نجمع 4 و10 و−3 فنستعيد التغير الكلي 11 لتراً.

طرح 3 كأن التغير الأخير كان في الاتجاه الأمامي.$mw$,$mw$Integrals add across adjacent intervals, and reversing their bounds changes the sign.

$\int_2^5 r(t)\,dt=\int_0^6 r(t)\,dt+\int_2^0 r(t)\,dt+\int_6^5 r(t)\,dt$

1. The net changes on 0 to 2 and 5 to 6 are 4 and −3.

2. Subtract those endpoint interval changes from the whole to isolate the middle interval.

$11+(-4)+3=10$

$10$ litres

Adding 4, 10 and −3 recovers the total net change of 11 litres.

Subtracts 3 as if the final interval were given forwards.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"حوّل القياسين المعكوسين إلى الاتجاه الذي يزداد فيه الزمن.","En":"Rewrite the reversed readings in the forward time direction."},{"Ar":"قسّم التكامل من 0 إلى 6 إلى ثلاث فترات عند 2 و5.","En":"Split the integral from 0 to 6 at hours 2 and 5."}],"Solution":{"Idea":{"Ar":"تُجمع التكاملات على الفترات المتجاورة، وعكس حدود التكامل يغيّر إشارته.","En":"Integrals add across adjacent intervals, and reversing their bounds changes the sign."},"FormulaLatex":"\\int_2^5 r(t)\\,dt=\\int_0^6 r(t)\\,dt+\\int_2^0 r(t)\\,dt+\\int_6^5 r(t)\\,dt","Steps":[{"Ar":"صافي 0 إلى 2 يساوي 4، وصافي 5 إلى 6 يساوي −3.","En":"The net changes on 0 to 2 and 5 to 6 are 4 and −3."},{"Ar":"اطرح التغيرين الطرفيين من التغير الكلي لتبقى الفترة الوسطى.","En":"Subtract those endpoint interval changes from the whole to isolate the middle interval."}],"Substitution":{"Ar":"$11+(-4)+3=10$","En":"$11+(-4)+3=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"لترات","En":"litres"},"Verification":{"Ar":"نجمع 4 و10 و−3 فنستعيد التغير الكلي 11 لتراً.","En":"Adding 4, 10 and −3 recovers the total net change of 11 litres."},"CommonError":{"Ar":"طرح 3 كأن التغير الأخير كان في الاتجاه الأمامي.","En":"Subtracts 3 as if the final interval were given forwards."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح 3 كأن التغير الأخير كان في الاتجاه الأمامي.","En":"Subtracts 3 as if the final interval were given forwards."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح القيمتين المعكوستين كما وردتا.","En":"Subtracts both reversed readings as given."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"صحّح اتجاه الفترة الأخيرة وأغفل الفترة الأولى.","En":"Reverses the last interval and omits the first one."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v19-grade-1-count-visible-faces-on-turning-cards-1$mw$,$mw$count-visible-faces-on-turning-cards$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عدّ النجوم بعد قلب البطاقات","En":"Counting stars after turning cards"},"Question":{"Ar":"هناك خمس بطاقات. على الوجه الظاهر لكل بطاقة نجمة واحدة، والوجه الآخر فارغ. قلبت لين البطاقات الثلاث الأولى إلى الوجه الفارغ، ثم أعادت قلب البطاقة الثانية وحدها. كم نجمة تظهر الآن؟","En":"Five cards each show one star and have a blank back. Lin turns the first three cards blank side up, then turns only the second card back over. How many stars are visible now?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف قبل إعادة قلب البطاقة الثانية.","En":"Stops before the second card is turned back."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب ظهور نجمة على إحدى البطاقتين اللتين بقيتا مقلوبتين.","En":"Counts a star on one of the two cards still blank side up."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ كل النجوم على البطاقات ولو كانت مخفية.","En":"Counts every star on the cards, including hidden ones."}}],"Hints":[{"Ar":"أي البطاقات لم تُقلب أبداً؟","En":"Which cards were never turned?"},{"Ar":"بعد القلب الأول، ماذا يتغير عند إعادة قلب البطاقة الثانية فقط؟","En":"After the first turns, what changes when only card two is turned back?"}],"Solution":{"Idea":{"Ar":"نتتبع الوجه الظاهر لكل بطاقة؛ إعادة قلب بطاقة تُظهر نجمتها مرة أخرى.","En":"Track the visible face of each card; turning a blank card back reveals its star."},"FormulaLatex":"5-3+1","Steps":[{"Ar":"بعد القلب الأول تظهر نجمتا البطاقتين الرابعة والخامسة.","En":"After the first turns, cards four and five still show stars."},{"Ar":"تظهر نجمة البطاقة الثانية مجدداً، فنضيف نجمة واحدة.","En":"The star on card two reappears, adding one star."}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"نجوم","En":"stars"},"Verification":{"Ar":"البطاقتان الأولى والثالثة فقط تظهران الوجه الفارغ. بقيت ثلاث بطاقات تظهر نجمة.","En":"Only cards one and three show blanks. The other three show a star."},"CommonError":{"Ar":"توقف قبل إعادة قلب البطاقة الثانية.","En":"Stops before the second card is turned back."}}}$mw$::jsonb,$mw$نتتبع الوجه الظاهر لكل بطاقة؛ إعادة قلب بطاقة تُظهر نجمتها مرة أخرى.

$5-3+1$

1. بعد القلب الأول تظهر نجمتا البطاقتين الرابعة والخامسة.

2. تظهر نجمة البطاقة الثانية مجدداً، فنضيف نجمة واحدة.

$2+1=3$

$3$ نجوم

البطاقتان الأولى والثالثة فقط تظهران الوجه الفارغ. بقيت ثلاث بطاقات تظهر نجمة.

توقف قبل إعادة قلب البطاقة الثانية.$mw$,$mw$Track the visible face of each card; turning a blank card back reveals its star.

$5-3+1$

1. After the first turns, cards four and five still show stars.

2. The star on card two reappears, adding one star.

$2+1=3$

$3$ stars

Only cards one and three show blanks. The other three show a star.

Stops before the second card is turned back.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"أي البطاقات لم تُقلب أبداً؟","En":"Which cards were never turned?"},{"Ar":"بعد القلب الأول، ماذا يتغير عند إعادة قلب البطاقة الثانية فقط؟","En":"After the first turns, what changes when only card two is turned back?"}],"Solution":{"Idea":{"Ar":"نتتبع الوجه الظاهر لكل بطاقة؛ إعادة قلب بطاقة تُظهر نجمتها مرة أخرى.","En":"Track the visible face of each card; turning a blank card back reveals its star."},"FormulaLatex":"5-3+1","Steps":[{"Ar":"بعد القلب الأول تظهر نجمتا البطاقتين الرابعة والخامسة.","En":"After the first turns, cards four and five still show stars."},{"Ar":"تظهر نجمة البطاقة الثانية مجدداً، فنضيف نجمة واحدة.","En":"The star on card two reappears, adding one star."}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"نجوم","En":"stars"},"Verification":{"Ar":"البطاقتان الأولى والثالثة فقط تظهران الوجه الفارغ. بقيت ثلاث بطاقات تظهر نجمة.","En":"Only cards one and three show blanks. The other three show a star."},"CommonError":{"Ar":"توقف قبل إعادة قلب البطاقة الثانية.","En":"Stops before the second card is turned back."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"توقف قبل إعادة قلب البطاقة الثانية.","En":"Stops before the second card is turned back."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب ظهور نجمة على إحدى البطاقتين اللتين بقيتا مقلوبتين.","En":"Counts a star on one of the two cards still blank side up."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ كل النجوم على البطاقات ولو كانت مخفية.","En":"Counts every star on the cards, including hidden ones."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v17/v19 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
