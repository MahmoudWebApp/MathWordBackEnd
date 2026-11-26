-- One-time owner-authorized v43 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v43-grade-1-closed-shape-sticks-missing-side-1$mw$,$mw$closed-shape-sticks-missing-side$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال شكل مغلق","En":"Completing a closed shape"},"Question":{"Ar":"رتب طفل ثلاثة عيدان متساوية على ثلاثة أضلاع من مربع، دون أن يغلق الشكل. كم عوداً آخر من النوع نفسه يحتاج لإكمال المربع؟","En":"A child arranges three equal sticks along three sides of a square, leaving the shape open. How many more identical sticks complete the square?"},"Options":[{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عودان يعطيان خمسة عيدان.","En":"Two more would give five sticks."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة عدد العيدان الموجودة.","En":"Three is the existing count."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعة العدد الكلي لا الباقي.","En":"Four is the total, not the missing count."}}],"Hints":[{"Ar":"عد أضلاع المربع الكامل.","En":"Count the sides of a complete square."},{"Ar":"اطرح عدد العيدان الموجودة.","En":"Subtract the sticks already present."}],"Solution":{"Idea":{"Ar":"للمربع أربعة أضلاع، والموجود ثلاثة.","En":"A square has four sides; three are present."},"FormulaLatex":"4-3=1","Steps":[{"Ar":"نحتاج أربعة أضلاع ليكتمل المربع.","En":"Four sides complete the square."},{"Ar":"$4-3=1$","En":"$4-3=1$"}],"Substitution":{"Ar":"$4-3=1$","En":"$4-3=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+1=4$","En":"$3+1=4$"},"CommonError":{"Ar":"عودان يعطيان خمسة عيدان.","En":"Two more would give five sticks."}}}$mw$::jsonb,$mw$للمربع أربعة أضلاع، والموجود ثلاثة.

$4-3=1$

1. نحتاج أربعة أضلاع ليكتمل المربع.

2. $4-3=1$

$4-3=1$

$1$

$3+1=4$

عودان يعطيان خمسة عيدان.$mw$,$mw$A square has four sides; three are present.

$4-3=1$

1. Four sides complete the square.

2. $4-3=1$

$4-3=1$

$1$

$3+1=4$

Two more would give five sticks.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد أضلاع المربع الكامل.","En":"Count the sides of a complete square."},{"Ar":"اطرح عدد العيدان الموجودة.","En":"Subtract the sticks already present."}],"Solution":{"Idea":{"Ar":"للمربع أربعة أضلاع، والموجود ثلاثة.","En":"A square has four sides; three are present."},"FormulaLatex":"4-3=1","Steps":[{"Ar":"نحتاج أربعة أضلاع ليكتمل المربع.","En":"Four sides complete the square."},{"Ar":"$4-3=1$","En":"$4-3=1$"}],"Substitution":{"Ar":"$4-3=1$","En":"$4-3=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+1=4$","En":"$3+1=4$"},"CommonError":{"Ar":"عودان يعطيان خمسة عيدان.","En":"Two more would give five sticks."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عودان يعطيان خمسة عيدان.","En":"Two more would give five sticks."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة عدد العيدان الموجودة.","En":"Three is the existing count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أربعة العدد الكلي لا الباقي.","En":"Four is the total, not the missing count."},"Order":4}]}$mw$),
($mw$growth-v43-grade-1-length-identify-valid-unit-arrangement-1$mw$,$mw$length-identify-valid-unit-arrangement$mw$,$mw$length$mw$,$mw$grade-1$mw$,1,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"اختيار قياس صحيح","En":"Choosing a valid measurement"},"Question":{"Ar":"نريد قياس طول قلم باستعمال عيدان متساوية. أي طريقة صحيحة؟ A: عيدان متداخلة؛ B: عيدان بينها فراغات؛ C: عيدان متجاورة من طرف القلم إلى طرفه دون فراغات؛ D: عيدان بأطوال مختلفة.","En":"To measure a pencil using equal sticks, which method is valid? A: overlapping sticks; B: sticks with gaps; C: end-to-end sticks covering the pencil with no gaps; D: sticks of different lengths."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"التداخل يكرر قياس جزء من الطول.","En":"Overlap measures part of the length twice."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفراغات تترك جزءاً دون قياس.","En":"Gaps leave part unmeasured."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الوحدات المختلفة لا تعطي عدداً بوحدة ثابتة.","En":"Different units do not give a count in a fixed unit."}}],"Hints":[{"Ar":"يجب أن تكون الوحدات متساوية.","En":"The units must be equal."},{"Ar":"استبعد الفراغات والتداخل.","En":"Exclude gaps and overlap."}],"Solution":{"Idea":{"Ar":"القياس بوحدة متكررة يتطلب وحدات متساوية دون فراغ أو تداخل.","En":"Repeated-unit measurement requires equal units with no gaps or overlap."},"FormulaLatex":"L=n\\ell","Steps":[{"Ar":"نبدأ عند طرف القلم.","En":"Start at one end of the pencil."},{"Ar":"نكرر العود نفسه بالطول حتى الطرف الآخر دون فراغات.","En":"Repeat equal-length sticks to the other end without gaps."}],"Substitution":{"Ar":"نكرر العود نفسه بالطول حتى الطرف الآخر دون فراغات.","En":"Repeat equal-length sticks to the other end without gaps."},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يغطي الاختيار C الطول كله بوحدة ثابتة.","En":"Option C covers the full length using a fixed unit."},"CommonError":{"Ar":"التداخل يكرر قياس جزء من الطول.","En":"Overlap measures part of the length twice."}}}$mw$::jsonb,$mw$القياس بوحدة متكررة يتطلب وحدات متساوية دون فراغ أو تداخل.

$L=n\ell$

1. نبدأ عند طرف القلم.

2. نكرر العود نفسه بالطول حتى الطرف الآخر دون فراغات.

نكرر العود نفسه بالطول حتى الطرف الآخر دون فراغات.

$C$

يغطي الاختيار C الطول كله بوحدة ثابتة.

التداخل يكرر قياس جزء من الطول.$mw$,$mw$Repeated-unit measurement requires equal units with no gaps or overlap.

$L=n\ell$

1. Start at one end of the pencil.

2. Repeat equal-length sticks to the other end without gaps.

Repeat equal-length sticks to the other end without gaps.

$C$

Option C covers the full length using a fixed unit.

Overlap measures part of the length twice.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"يجب أن تكون الوحدات متساوية.","En":"The units must be equal."},{"Ar":"استبعد الفراغات والتداخل.","En":"Exclude gaps and overlap."}],"Solution":{"Idea":{"Ar":"القياس بوحدة متكررة يتطلب وحدات متساوية دون فراغ أو تداخل.","En":"Repeated-unit measurement requires equal units with no gaps or overlap."},"FormulaLatex":"L=n\\ell","Steps":[{"Ar":"نبدأ عند طرف القلم.","En":"Start at one end of the pencil."},{"Ar":"نكرر العود نفسه بالطول حتى الطرف الآخر دون فراغات.","En":"Repeat equal-length sticks to the other end without gaps."}],"Substitution":{"Ar":"نكرر العود نفسه بالطول حتى الطرف الآخر دون فراغات.","En":"Repeat equal-length sticks to the other end without gaps."},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يغطي الاختيار C الطول كله بوحدة ثابتة.","En":"Option C covers the full length using a fixed unit."},"CommonError":{"Ar":"التداخل يكرر قياس جزء من الطول.","En":"Overlap measures part of the length twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"التداخل يكرر قياس جزء من الطول.","En":"Overlap measures part of the length twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الفراغات تترك جزءاً دون قياس.","En":"Gaps leave part unmeasured."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الوحدات المختلفة لا تعطي عدداً بوحدة ثابتة.","En":"Different units do not give a count in a fixed unit."},"Order":4}]}$mw$),
($mw$growth-v43-grade-2-counting-pattern-two-missing-consecutive-1$mw$,$mw$counting-pattern-two-missing-consecutive$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إكمال نمط عد","En":"Completing a counting pattern"},"Question":{"Ar":"العد بنمط ثابت: 12، 16، □، □، 28. ما مجموع العددين المفقودين؟","En":"A constant-step counting pattern is 12, 16, □, □, 28. What is the sum of the two missing numbers?"},"Options":[{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"36 يجمع 16 و20.","En":"36 adds 16 and 20."}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"40 يجمع 12 و28.","En":"40 adds 12 and 28."}},{"LatexCode":"44","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"48 يكرر 24.","En":"48 counts 24 twice."}}],"Hints":[{"Ar":"احسب الفرق بين أول عددين.","En":"Find the difference between the first two numbers."},{"Ar":"أكمل النمط ثم اجمع العددين.","En":"Complete the pattern and add the missing numbers."}],"Solution":{"Idea":{"Ar":"الخطوة ثابتة وتساوي أربعة.","En":"The constant step is four."},"FormulaLatex":"16+4=20","Steps":[{"Ar":"$20+4=24$","En":"$20+4=24$"},{"Ar":"$20+24=44$","En":"$20+24=44$"}],"Substitution":{"Ar":"$20+24=44$","En":"$20+24=44$"},"Result":{"Ar":"$44$","En":"$44$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24+4=28$","En":"$24+4=28$"},"CommonError":{"Ar":"36 يجمع 16 و20.","En":"36 adds 16 and 20."}}}$mw$::jsonb,$mw$الخطوة ثابتة وتساوي أربعة.

$16+4=20$

1. $20+4=24$

2. $20+24=44$

$20+24=44$

$44$

$24+4=28$

36 يجمع 16 و20.$mw$,$mw$The constant step is four.

$16+4=20$

1. $20+4=24$

2. $20+24=44$

$20+24=44$

$44$

$24+4=28$

36 adds 16 and 20.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"احسب الفرق بين أول عددين.","En":"Find the difference between the first two numbers."},{"Ar":"أكمل النمط ثم اجمع العددين.","En":"Complete the pattern and add the missing numbers."}],"Solution":{"Idea":{"Ar":"الخطوة ثابتة وتساوي أربعة.","En":"The constant step is four."},"FormulaLatex":"16+4=20","Steps":[{"Ar":"$20+4=24$","En":"$20+4=24$"},{"Ar":"$20+24=44$","En":"$20+24=44$"}],"Substitution":{"Ar":"$20+24=44$","En":"$20+24=44$"},"Result":{"Ar":"$44$","En":"$44$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$24+4=28$","En":"$24+4=28$"},"CommonError":{"Ar":"36 يجمع 16 و20.","En":"36 adds 16 and 20."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"36 يجمع 16 و20.","En":"36 adds 16 and 20."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"40 يجمع 12 و28.","En":"40 adds 12 and 28."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"48 يكرر 24.","En":"48 counts 24 twice."},"Order":4}]}$mw$),
($mw$growth-v43-grade-3-fraction-equivalent-whole-model-two-partitions-1$mw$,$mw$fraction-equivalent-whole-model-two-partitions$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"كسران يمثلان الجزء نفسه","En":"Equivalent fractions in a model"},"Question":{"Ar":"شريطان متساويا الطول. قُسّم الأول إلى نصفين ولُوّن نصف، وقُسّم الثاني إلى ستة أجزاء متساوية. كم جزءاً من الثاني يجب تلوينه ليطابق طول الجزء الملون من الأول؟","En":"Two strips have equal length. The first is divided into halves and one half is coloured. The second is divided into six equal parts. How many parts of the second must be coloured to match the coloured length of the first?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جزء واحد يمثل السدس.","En":"One part is one sixth."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جزآن يمثلان الثلث.","En":"Two parts represent one third."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ستة أجزاء تمثل الشريط كله.","En":"Six parts represent the whole strip."}}],"Hints":[{"Ar":"الشريطان متساويا الطول.","En":"The strips are equally long."},{"Ar":"قسّم ستة إلى مجموعتين متساويتين.","En":"Split six into two equal groups."}],"Solution":{"Idea":{"Ar":"النصف يعني جزءاً من جزأين متساويين؛ نصف الستة ثلاثة.","En":"Half of six equal parts is three."},"FormulaLatex":"\\frac12=\\frac36","Steps":[{"Ar":"$6/2=3$","En":"$6/2=3$"},{"Ar":"$3/6=1/2$","En":"$3/6=1/2$"}],"Substitution":{"Ar":"$3/6=1/2$","En":"$3/6=1/2$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+3=6$","En":"$3+3=6$"},"CommonError":{"Ar":"جزء واحد يمثل السدس.","En":"One part is one sixth."}}}$mw$::jsonb,$mw$النصف يعني جزءاً من جزأين متساويين؛ نصف الستة ثلاثة.

$\frac12=\frac36$

1. $6/2=3$

2. $3/6=1/2$

$3/6=1/2$

$3$

$3+3=6$

جزء واحد يمثل السدس.$mw$,$mw$Half of six equal parts is three.

$\frac12=\frac36$

1. $6/2=3$

2. $3/6=1/2$

$3/6=1/2$

$3$

$3+3=6$

One part is one sixth.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"الشريطان متساويا الطول.","En":"The strips are equally long."},{"Ar":"قسّم ستة إلى مجموعتين متساويتين.","En":"Split six into two equal groups."}],"Solution":{"Idea":{"Ar":"النصف يعني جزءاً من جزأين متساويين؛ نصف الستة ثلاثة.","En":"Half of six equal parts is three."},"FormulaLatex":"\\frac12=\\frac36","Steps":[{"Ar":"$6/2=3$","En":"$6/2=3$"},{"Ar":"$3/6=1/2$","En":"$3/6=1/2$"}],"Substitution":{"Ar":"$3/6=1/2$","En":"$3/6=1/2$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3+3=6$","En":"$3+3=6$"},"CommonError":{"Ar":"جزء واحد يمثل السدس.","En":"One part is one sixth."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جزء واحد يمثل السدس.","En":"One part is one sixth."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جزآن يمثلان الثلث.","En":"Two parts represent one third."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ستة أجزاء تمثل الشريط كله.","En":"Six parts represent the whole strip."},"Order":4}]}$mw$),
($mw$growth-v43-grade-3-time-clock-minute-hand-rotation-fraction-1$mw$,$mw$time-clock-minute-hand-rotation-fraction$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"دورة عقرب الدقائق","En":"Minute-hand rotation"},"Question":{"Ar":"يشير عقرب الدقائق إلى 12. كم دقيقة تمر حتى يدور نصف دورة كاملة للمرة الأولى؟","En":"The minute hand points to 12. How many minutes pass before it first completes half a full turn?"},"Options":[{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 ربع دورة.","En":"15 is a quarter turn."}},{"LatexCode":"30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"45 ثلاثة أرباع دورة.","En":"45 is three quarters of a turn."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60 دورة كاملة.","En":"60 is a full turn."}}],"Hints":[{"Ar":"كم دقيقة في الدورة الكاملة؟","En":"How many minutes are in one full turn?"},{"Ar":"اقسم الزمن على اثنين.","En":"Divide that time by two."}],"Solution":{"Idea":{"Ar":"الدورة الكاملة لعقرب الدقائق تستغرق ستين دقيقة.","En":"One full minute-hand rotation takes sixty minutes."},"FormulaLatex":"60/2=30","Steps":[{"Ar":"نصف دورة يعني نصف الساعة.","En":"Half a turn is half an hour."},{"Ar":"$60/2=30$","En":"$60/2=30$"}],"Substitution":{"Ar":"$60/2=30$","En":"$60/2=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$30+30=60$","En":"$30+30=60$"},"CommonError":{"Ar":"15 ربع دورة.","En":"15 is a quarter turn."}}}$mw$::jsonb,$mw$الدورة الكاملة لعقرب الدقائق تستغرق ستين دقيقة.

$60/2=30$

1. نصف دورة يعني نصف الساعة.

2. $60/2=30$

$60/2=30$

$30$ دقيقة

$30+30=60$

15 ربع دورة.$mw$,$mw$One full minute-hand rotation takes sixty minutes.

$60/2=30$

1. Half a turn is half an hour.

2. $60/2=30$

$60/2=30$

$30$ minutes

$30+30=60$

15 is a quarter turn.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم دقيقة في الدورة الكاملة؟","En":"How many minutes are in one full turn?"},{"Ar":"اقسم الزمن على اثنين.","En":"Divide that time by two."}],"Solution":{"Idea":{"Ar":"الدورة الكاملة لعقرب الدقائق تستغرق ستين دقيقة.","En":"One full minute-hand rotation takes sixty minutes."},"FormulaLatex":"60/2=30","Steps":[{"Ar":"نصف دورة يعني نصف الساعة.","En":"Half a turn is half an hour."},{"Ar":"$60/2=30$","En":"$60/2=30$"}],"Substitution":{"Ar":"$60/2=30$","En":"$60/2=30$"},"Result":{"Ar":"$30$","En":"$30$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$30+30=60$","En":"$30+30=60$"},"CommonError":{"Ar":"15 ربع دورة.","En":"15 is a quarter turn."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"15 ربع دورة.","En":"15 is a quarter turn."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"45 ثلاثة أرباع دورة.","En":"45 is three quarters of a turn."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"60 دورة كاملة.","En":"60 is a full turn."},"Order":4}]}$mw$),
($mw$growth-v43-grade-4-addition-decomposition-missing-place-part-1$mw$,$mw$addition-decomposition-missing-place-part$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"جمع بالتفكيك","En":"Addition by decomposition"},"Question":{"Ar":"لحساب 486+257، جمع طالب المئات فحصل على 600، والعشرات فحصل على 130. كم يجب أن يضيف من مجموع الآحاد ليحصل على الناتج الصحيح؟","En":"To calculate 486+257, a pupil adds hundreds to get 600 and tens to get 130. What must be added for the ones to complete the correct sum?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يهمل العشرة الناتجة.","En":"3 drops the extra ten."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 آحاد العدد الثاني فقط.","En":"7 is only the second ones digit."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"30 لا يساوي مجموع 6 و7.","En":"30 is not the sum of 6 and 7."}}],"Hints":[{"Ar":"حدد رقمي الآحاد.","En":"Identify both ones digits."},{"Ar":"اجمعهما كاملاً، ولا تكتفِ برقم الآحاد الناتج.","En":"Add them fully, not just the resulting ones digit."}],"Solution":{"Idea":{"Ar":"نجمع الآحاد بحسب قيمتها دون إسقاط العشرة الناتجة عن الحمل.","En":"Add the ones at their full value without dropping the resulting ten."},"FormulaLatex":"6+7=13","Steps":[{"Ar":"$400+200=600$","En":"$400+200=600$"},{"Ar":"$80+50=130$","En":"$80+50=130$"},{"Ar":"$6+7=13$","En":"$6+7=13$"}],"Substitution":{"Ar":"$6+7=13$","En":"$6+7=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$600+130+13=743$","En":"$600+130+13=743$"},"CommonError":{"Ar":"3 يهمل العشرة الناتجة.","En":"3 drops the extra ten."}}}$mw$::jsonb,$mw$نجمع الآحاد بحسب قيمتها دون إسقاط العشرة الناتجة عن الحمل.

$6+7=13$

1. $400+200=600$

2. $80+50=130$

3. $6+7=13$

$6+7=13$

$13$

$600+130+13=743$

3 يهمل العشرة الناتجة.$mw$,$mw$Add the ones at their full value without dropping the resulting ten.

$6+7=13$

1. $400+200=600$

2. $80+50=130$

3. $6+7=13$

$6+7=13$

$13$

$600+130+13=743$

3 drops the extra ten.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد رقمي الآحاد.","En":"Identify both ones digits."},{"Ar":"اجمعهما كاملاً، ولا تكتفِ برقم الآحاد الناتج.","En":"Add them fully, not just the resulting ones digit."}],"Solution":{"Idea":{"Ar":"نجمع الآحاد بحسب قيمتها دون إسقاط العشرة الناتجة عن الحمل.","En":"Add the ones at their full value without dropping the resulting ten."},"FormulaLatex":"6+7=13","Steps":[{"Ar":"$400+200=600$","En":"$400+200=600$"},{"Ar":"$80+50=130$","En":"$80+50=130$"},{"Ar":"$6+7=13$","En":"$6+7=13$"}],"Substitution":{"Ar":"$6+7=13$","En":"$6+7=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$600+130+13=743$","En":"$600+130+13=743$"},"CommonError":{"Ar":"3 يهمل العشرة الناتجة.","En":"3 drops the extra ten."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 يهمل العشرة الناتجة.","En":"3 drops the extra ten."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"7 آحاد العدد الثاني فقط.","En":"7 is only the second ones digit."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"30 لا يساوي مجموع 6 و7.","En":"30 is not the sum of 6 and 7."},"Order":4}]}$mw$),
($mw$growth-v43-grade-4-length-conversion-perimeter-square-in-mm-1$mw$,$mw$length-conversion-perimeter-square-in-mm$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"محيط مربع بالمليمتر","En":"Square perimeter in millimetres"},"Question":{"Ar":"طول ضلع مربع 3 سم. ما محيطه بالمليمتر؟","En":"A square has side length 3 cm. What is its perimeter in millimetres?"},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 المحيط بالسنتيمتر.","En":"12 is the perimeter in centimetres."}},{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"30 طول ضلع واحد بالمليمتر.","En":"30 is one side in millimetres."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"60 طول ضلعين فقط.","En":"60 counts two sides only."}},{"LatexCode":"120","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"السنتيمتر عشرة مليمترات.","En":"One centimetre equals ten millimetres."},{"Ar":"المربع أربعة أضلاع متساوية.","En":"A square has four equal sides."}],"Solution":{"Idea":{"Ar":"نحول طول الضلع إلى مليمترات ثم نجمع الأضلاع الأربعة.","En":"Convert the side length to millimetres, then add the four sides."},"FormulaLatex":"4\\cdot3\\cdot10=120","Steps":[{"Ar":"$3\\ \\mathrm{cm}=30\\ \\mathrm{mm}$","En":"$3\\ \\mathrm{cm}=30\\ \\mathrm{mm}$"},{"Ar":"$4\\cdot30=120$","En":"$4\\cdot30=120$"}],"Substitution":{"Ar":"$4\\cdot30=120$","En":"$4\\cdot30=120$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"ملم","En":"mm"},"Verification":{"Ar":"$120/4=30$","En":"$120/4=30$"},"CommonError":{"Ar":"12 المحيط بالسنتيمتر.","En":"12 is the perimeter in centimetres."}}}$mw$::jsonb,$mw$نحول طول الضلع إلى مليمترات ثم نجمع الأضلاع الأربعة.

$4\cdot3\cdot10=120$

1. $3\ \mathrm{cm}=30\ \mathrm{mm}$

2. $4\cdot30=120$

$4\cdot30=120$

$120$ ملم

$120/4=30$

12 المحيط بالسنتيمتر.$mw$,$mw$Convert the side length to millimetres, then add the four sides.

$4\cdot3\cdot10=120$

1. $3\ \mathrm{cm}=30\ \mathrm{mm}$

2. $4\cdot30=120$

$4\cdot30=120$

$120$ mm

$120/4=30$

12 is the perimeter in centimetres.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"السنتيمتر عشرة مليمترات.","En":"One centimetre equals ten millimetres."},{"Ar":"المربع أربعة أضلاع متساوية.","En":"A square has four equal sides."}],"Solution":{"Idea":{"Ar":"نحول طول الضلع إلى مليمترات ثم نجمع الأضلاع الأربعة.","En":"Convert the side length to millimetres, then add the four sides."},"FormulaLatex":"4\\cdot3\\cdot10=120","Steps":[{"Ar":"$3\\ \\mathrm{cm}=30\\ \\mathrm{mm}$","En":"$3\\ \\mathrm{cm}=30\\ \\mathrm{mm}$"},{"Ar":"$4\\cdot30=120$","En":"$4\\cdot30=120$"}],"Substitution":{"Ar":"$4\\cdot30=120$","En":"$4\\cdot30=120$"},"Result":{"Ar":"$120$","En":"$120$"},"Unit":{"Ar":"ملم","En":"mm"},"Verification":{"Ar":"$120/4=30$","En":"$120/4=30$"},"CommonError":{"Ar":"12 المحيط بالسنتيمتر.","En":"12 is the perimeter in centimetres."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"12 المحيط بالسنتيمتر.","En":"12 is the perimeter in centimetres."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"30 طول ضلع واحد بالمليمتر.","En":"30 is one side in millimetres."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"60 طول ضلعين فقط.","En":"60 counts two sides only."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v43-grade-5-multiplication-use-near-hundred-factor-1$mw$,$mw$multiplication-use-near-hundred-factor$mw$,$mw$primary-multiplication$mw$,$mw$grade-5$mw$,5,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الضرب باستخدام عدد قريب من المئة","En":"Multiplying using a near-hundred factor"},"Question":{"Ar":"لإيجاد 27×99 ذهنياً، أي تعبير يعطي الناتج نفسه؟","En":"To calculate 27×99 mentally, which expression gives the same product?"},"Options":[{"LatexCode":"2700-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يطرح 1 بدلاً من 27.","En":"Subtracts one instead of 27."}},{"LatexCode":"2700-27","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2700+27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يستخدم 101 بدلاً من 99.","En":"This uses 101 rather than 99."}},{"LatexCode":"270-27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"270 يعادل الضرب في 10 لا 100.","En":"270 corresponds to multiplying by ten, not 100."}}],"Hints":[{"Ar":"اكتب 99 بدلالة 100.","En":"Express 99 using 100."},{"Ar":"اضرب 27 في الحدين.","En":"Multiply 27 by both terms."}],"Solution":{"Idea":{"Ar":"نكتب 99 على صورة 100 ناقص 1 ونوزع الضرب.","En":"Write 99 as 100 minus one and distribute."},"FormulaLatex":"27(100-1)=2700-27","Steps":[{"Ar":"$27\\cdot100=2700$","En":"$27\\cdot100=2700$"},{"Ar":"$27\\cdot1=27$","En":"$27\\cdot1=27$"}],"Substitution":{"Ar":"$27\\cdot1=27$","En":"$27\\cdot1=27$"},"Result":{"Ar":"$2700-27$","En":"$2700-27$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2700-27=2673$","En":"$2700-27=2673$"},"CommonError":{"Ar":"يطرح 1 بدلاً من 27.","En":"Subtracts one instead of 27."}}}$mw$::jsonb,$mw$نكتب 99 على صورة 100 ناقص 1 ونوزع الضرب.

$27(100-1)=2700-27$

1. $27\cdot100=2700$

2. $27\cdot1=27$

$27\cdot1=27$

$2700-27$

$2700-27=2673$

يطرح 1 بدلاً من 27.$mw$,$mw$Write 99 as 100 minus one and distribute.

$27(100-1)=2700-27$

1. $27\cdot100=2700$

2. $27\cdot1=27$

$27\cdot1=27$

$2700-27$

$2700-27=2673$

Subtracts one instead of 27.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب 99 بدلالة 100.","En":"Express 99 using 100."},{"Ar":"اضرب 27 في الحدين.","En":"Multiply 27 by both terms."}],"Solution":{"Idea":{"Ar":"نكتب 99 على صورة 100 ناقص 1 ونوزع الضرب.","En":"Write 99 as 100 minus one and distribute."},"FormulaLatex":"27(100-1)=2700-27","Steps":[{"Ar":"$27\\cdot100=2700$","En":"$27\\cdot100=2700$"},{"Ar":"$27\\cdot1=27$","En":"$27\\cdot1=27$"}],"Substitution":{"Ar":"$27\\cdot1=27$","En":"$27\\cdot1=27$"},"Result":{"Ar":"$2700-27$","En":"$2700-27$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2700-27=2673$","En":"$2700-27=2673$"},"CommonError":{"Ar":"يطرح 1 بدلاً من 27.","En":"Subtracts one instead of 27."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يطرح 1 بدلاً من 27.","En":"Subtracts one instead of 27."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا يستخدم 101 بدلاً من 99.","En":"This uses 101 rather than 99."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"270 يعادل الضرب في 10 لا 100.","En":"270 corresponds to multiplying by ten, not 100."},"Order":4}]}$mw$),
($mw$growth-v43-grade-5-mass-equal-share-after-container-tare-1$mw$,$mw$mass-equal-share-after-container-tare$mw$,$mw$mass$mw$,$mw$grade-5$mw$,5,1,82,322,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":322,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"توزيع الكتلة بعد طرح العبوة","En":"Sharing mass after removing container weight"},"Question":{"Ar":"كتلة وعاء مع محتواه 3 كغ و200 غ. كتلة الوعاء الفارغ 400 غ. قُسّم المحتوى بالتساوي إلى أربع حصص. ما كتلة كل حصة بالغرام؟","En":"A container and its contents weigh 3 kg 200 g. The empty container weighs 400 g. The contents are divided equally into four portions. What is the mass of each portion in grams?"},"Options":[{"LatexCode":"600","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربع حصص من 600 تساوي 2400.","En":"Four 600 g portions total 2400 g."}},{"LatexCode":"700","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"800","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"800 يقسم الكتلة مع الوعاء.","En":"800 divides the mass including the container."}},{"LatexCode":"900","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"900 يضيف كتلة الوعاء قبل القسمة.","En":"900 adds container mass before division."}}],"Hints":[{"Ar":"حول الكيلوغرامات إلى غرامات.","En":"Convert kilograms to grams."},{"Ar":"اطرح الوعاء قبل القسمة.","En":"Remove the container's mass before dividing."}],"Solution":{"Idea":{"Ar":"نوحد الوحدات ونطرح كتلة الوعاء ثم نقسم كتلة المحتوى.","En":"Unify units, remove container mass, then divide the contents' mass."},"FormulaLatex":"(3200-400)/4=700","Steps":[{"Ar":"$3\\cdot1000+200=3200$","En":"$3\\cdot1000+200=3200$"},{"Ar":"$3200-400=2800$","En":"$3200-400=2800$"},{"Ar":"$2800/4=700$","En":"$2800/4=700$"}],"Substitution":{"Ar":"$2800/4=700$","En":"$2800/4=700$"},"Result":{"Ar":"$700$","En":"$700$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$4\\cdot700+400=3200$","En":"$4\\cdot700+400=3200$"},"CommonError":{"Ar":"أربع حصص من 600 تساوي 2400.","En":"Four 600 g portions total 2400 g."}}}$mw$::jsonb,$mw$نوحد الوحدات ونطرح كتلة الوعاء ثم نقسم كتلة المحتوى.

$(3200-400)/4=700$

1. $3\cdot1000+200=3200$

2. $3200-400=2800$

3. $2800/4=700$

$2800/4=700$

$700$ غ

$4\cdot700+400=3200$

أربع حصص من 600 تساوي 2400.$mw$,$mw$Unify units, remove container mass, then divide the contents' mass.

$(3200-400)/4=700$

1. $3\cdot1000+200=3200$

2. $3200-400=2800$

3. $2800/4=700$

$2800/4=700$

$700$ g

$4\cdot700+400=3200$

Four 600 g portions total 2400 g.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حول الكيلوغرامات إلى غرامات.","En":"Convert kilograms to grams."},{"Ar":"اطرح الوعاء قبل القسمة.","En":"Remove the container's mass before dividing."}],"Solution":{"Idea":{"Ar":"نوحد الوحدات ونطرح كتلة الوعاء ثم نقسم كتلة المحتوى.","En":"Unify units, remove container mass, then divide the contents' mass."},"FormulaLatex":"(3200-400)/4=700","Steps":[{"Ar":"$3\\cdot1000+200=3200$","En":"$3\\cdot1000+200=3200$"},{"Ar":"$3200-400=2800$","En":"$3200-400=2800$"},{"Ar":"$2800/4=700$","En":"$2800/4=700$"}],"Substitution":{"Ar":"$2800/4=700$","En":"$2800/4=700$"},"Result":{"Ar":"$700$","En":"$700$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$4\\cdot700+400=3200$","En":"$4\\cdot700+400=3200$"},"CommonError":{"Ar":"أربع حصص من 600 تساوي 2400.","En":"Four 600 g portions total 2400 g."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أربع حصص من 600 تساوي 2400.","En":"Four 600 g portions total 2400 g."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"800 يقسم الكتلة مع الوعاء.","En":"800 divides the mass including the container."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"900 يضيف كتلة الوعاء قبل القسمة.","En":"900 adds container mass before division."},"Order":4}]}$mw$),
($mw$growth-v43-grade-6-two-step-equation-unknown-start-division-model-1$mw$,$mw$two-step-equation-unknown-start-division-model$mw$,$mw$primary-two-step-equations$mw$,$mw$grade-6$mw$,6,1,2,10,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":10,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع العدد قبل القسمة","En":"Recovering a number before division"},"Question":{"Ar":"أضاف طالب 8 إلى عدد مجهول x ثم قسم المجموع على 4 فحصل على 11. ما x؟","En":"A pupil adds 8 to an unknown number x and divides the sum by 4 to obtain 11. What is x?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يطرح 8 من الناتج النهائي مباشرة.","En":"3 subtracts eight directly from the final output."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"19 يضيف 8 دون عكس القسمة.","En":"19 adds eight without undoing division."}},{"LatexCode":"36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"52","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"52 يجمع 8 بدلاً من طرحها.","En":"52 adds eight instead of subtracting it."}}],"Hints":[{"Ar":"اضرب 11 في 4.","En":"Multiply eleven by four."},{"Ar":"اطرح 8 من المجموع.","En":"Subtract eight from the sum."}],"Solution":{"Idea":{"Ar":"نعكس القسمة أولاً ثم الجمع، لأن الجمع وقع قبل القسمة.","En":"Undo division first and then addition, since addition occurred before division."},"FormulaLatex":"(x+8)/4=11","Steps":[{"Ar":"$x+8=44$","En":"$x+8=44$"},{"Ar":"$x=44-8=36$","En":"$x=44-8=36$"}],"Substitution":{"Ar":"$x=44-8=36$","En":"$x=44-8=36$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(36+8)/4=11$","En":"$(36+8)/4=11$"},"CommonError":{"Ar":"3 يطرح 8 من الناتج النهائي مباشرة.","En":"3 subtracts eight directly from the final output."}}}$mw$::jsonb,$mw$نعكس القسمة أولاً ثم الجمع، لأن الجمع وقع قبل القسمة.

$(x+8)/4=11$

1. $x+8=44$

2. $x=44-8=36$

$x=44-8=36$

$36$

$(36+8)/4=11$

3 يطرح 8 من الناتج النهائي مباشرة.$mw$,$mw$Undo division first and then addition, since addition occurred before division.

$(x+8)/4=11$

1. $x+8=44$

2. $x=44-8=36$

$x=44-8=36$

$36$

$(36+8)/4=11$

3 subtracts eight directly from the final output.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اضرب 11 في 4.","En":"Multiply eleven by four."},{"Ar":"اطرح 8 من المجموع.","En":"Subtract eight from the sum."}],"Solution":{"Idea":{"Ar":"نعكس القسمة أولاً ثم الجمع، لأن الجمع وقع قبل القسمة.","En":"Undo division first and then addition, since addition occurred before division."},"FormulaLatex":"(x+8)/4=11","Steps":[{"Ar":"$x+8=44$","En":"$x+8=44$"},{"Ar":"$x=44-8=36$","En":"$x=44-8=36$"}],"Substitution":{"Ar":"$x=44-8=36$","En":"$x=44-8=36$"},"Result":{"Ar":"$36$","En":"$36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(36+8)/4=11$","En":"$(36+8)/4=11$"},"CommonError":{"Ar":"3 يطرح 8 من الناتج النهائي مباشرة.","En":"3 subtracts eight directly from the final output."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 يطرح 8 من الناتج النهائي مباشرة.","En":"3 subtracts eight directly from the final output."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"19 يضيف 8 دون عكس القسمة.","En":"19 adds eight without undoing division."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"52 يجمع 8 بدلاً من طرحها.","En":"52 adds eight instead of subtracting it."},"Order":4}]}$mw$),
($mw$growth-v43-grade-6-triangle-area-complement-rectangle-cut-1$mw$,$mw$triangle-area-complement-rectangle-cut$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة الجزء الباقي بعد قص مثلث","En":"Remaining area after cutting a triangle"},"Question":{"Ar":"لوح مستطيل أبعاده 12 سم و8 سم. قُص منه مثلث قاعدته 6 سم وارتفاعه العمودي 8 سم. ما مساحة اللوح الباقي؟","En":"A rectangular sheet is 12 cm by 8 cm. A triangle with base 6 cm and perpendicular height 8 cm is cut out. What area remains?"},"Options":[{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"24 مساحة الجزء المقطوع.","En":"24 is the removed area."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"48 ينتج من إهمال النصف.","En":"48 results from omitting one half."}},{"LatexCode":"72","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"96","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"96 المساحة قبل القص.","En":"96 is the original area."}}],"Hints":[{"Ar":"احسب مساحة المستطيل.","En":"Find the rectangle area."},{"Ar":"احسب نصف حاصل ضرب قاعدة المثلث في ارتفاعه ثم اطرحه.","En":"Find half the product of triangle base and height, then subtract."}],"Solution":{"Idea":{"Ar":"نطرح مساحة المثلث المقطوع من مساحة المستطيل.","En":"Subtract the removed triangle's area from the rectangle's area."},"FormulaLatex":"12\\cdot8-6\\cdot8/2=72","Steps":[{"Ar":"$A_R=96$","En":"$A_R=96$"},{"Ar":"$A_T=24$","En":"$A_T=24$"},{"Ar":"$96-24=72$","En":"$96-24=72$"}],"Substitution":{"Ar":"$96-24=72$","En":"$96-24=72$"},"Result":{"Ar":"$72$","En":"$72$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$72+24=96$","En":"$72+24=96$"},"CommonError":{"Ar":"24 مساحة الجزء المقطوع.","En":"24 is the removed area."}}}$mw$::jsonb,$mw$نطرح مساحة المثلث المقطوع من مساحة المستطيل.

$12\cdot8-6\cdot8/2=72$

1. $A_R=96$

2. $A_T=24$

3. $96-24=72$

$96-24=72$

$72$ سم²

$72+24=96$

24 مساحة الجزء المقطوع.$mw$,$mw$Subtract the removed triangle's area from the rectangle's area.

$12\cdot8-6\cdot8/2=72$

1. $A_R=96$

2. $A_T=24$

3. $96-24=72$

$96-24=72$

$72$ cm²

$72+24=96$

24 is the removed area.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مساحة المستطيل.","En":"Find the rectangle area."},{"Ar":"احسب نصف حاصل ضرب قاعدة المثلث في ارتفاعه ثم اطرحه.","En":"Find half the product of triangle base and height, then subtract."}],"Solution":{"Idea":{"Ar":"نطرح مساحة المثلث المقطوع من مساحة المستطيل.","En":"Subtract the removed triangle's area from the rectangle's area."},"FormulaLatex":"12\\cdot8-6\\cdot8/2=72","Steps":[{"Ar":"$A_R=96$","En":"$A_R=96$"},{"Ar":"$A_T=24$","En":"$A_T=24$"},{"Ar":"$96-24=72$","En":"$96-24=72$"}],"Substitution":{"Ar":"$96-24=72$","En":"$96-24=72$"},"Result":{"Ar":"$72$","En":"$72$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$72+24=96$","En":"$72+24=96$"},"CommonError":{"Ar":"24 مساحة الجزء المقطوع.","En":"24 is the removed area."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"24 مساحة الجزء المقطوع.","En":"24 is the removed area."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"48 ينتج من إهمال النصف.","En":"48 results from omitting one half."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"96 المساحة قبل القص.","En":"96 is the original area."},"Order":4}]}$mw$),
($mw$growth-v43-grade-6-signed-number-negative-zero-order-1$mw$,$mw$signed-number-negative-zero-order$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,345,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":345,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد موضع الصفر بين الأعداد","En":"Locating zero in an ordering"},"Question":{"Ar":"رتبت القيم −1.5 و0 و−0.2 و1.2 تصاعدياً. ما ترتيب الصفر في القائمة؟","En":"The numbers −1.5, 0, −0.2 and 1.2 are sorted in increasing order. What is the position of zero in the list?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الأول عدد سالب.","En":"The first is negative."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الثاني ما زال سالباً.","En":"The second is still negative."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الرابع هو 1.2.","En":"The fourth is 1.2."}}],"Hints":[{"Ar":"ضع السوالب قبل الصفر.","En":"Place negatives before zero."},{"Ar":"عد موضع الصفر بعد العددين السالبين.","En":"Count zero's position after both negatives."}],"Solution":{"Idea":{"Ar":"كل عدد سالب أصغر من الصفر، وكل عدد موجب أكبر منه.","En":"Every negative number is below zero and every positive number is above it."},"FormulaLatex":"-1.5<-0.2<0<1.2","Steps":[{"Ar":"يوجد عددان سالبان قبل الصفر.","En":"Two negative numbers precede zero."},{"Ar":"$2+1=3$","En":"$2+1=3$"}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يبقى عدد موجب واحد بعد الصفر.","En":"One positive number follows zero."},"CommonError":{"Ar":"الأول عدد سالب.","En":"The first is negative."}}}$mw$::jsonb,$mw$كل عدد سالب أصغر من الصفر، وكل عدد موجب أكبر منه.

$-1.5<-0.2<0<1.2$

1. يوجد عددان سالبان قبل الصفر.

2. $2+1=3$

$2+1=3$

$3$

يبقى عدد موجب واحد بعد الصفر.

الأول عدد سالب.$mw$,$mw$Every negative number is below zero and every positive number is above it.

$-1.5<-0.2<0<1.2$

1. Two negative numbers precede zero.

2. $2+1=3$

$2+1=3$

$3$

One positive number follows zero.

The first is negative.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ضع السوالب قبل الصفر.","En":"Place negatives before zero."},{"Ar":"عد موضع الصفر بعد العددين السالبين.","En":"Count zero's position after both negatives."}],"Solution":{"Idea":{"Ar":"كل عدد سالب أصغر من الصفر، وكل عدد موجب أكبر منه.","En":"Every negative number is below zero and every positive number is above it."},"FormulaLatex":"-1.5<-0.2<0<1.2","Steps":[{"Ar":"يوجد عددان سالبان قبل الصفر.","En":"Two negative numbers precede zero."},{"Ar":"$2+1=3$","En":"$2+1=3$"}],"Substitution":{"Ar":"$2+1=3$","En":"$2+1=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يبقى عدد موجب واحد بعد الصفر.","En":"One positive number follows zero."},"CommonError":{"Ar":"الأول عدد سالب.","En":"The first is negative."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"الأول عدد سالب.","En":"The first is negative."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الثاني ما زال سالباً.","En":"The second is still negative."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الرابع هو 1.2.","En":"The fourth is 1.2."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v43 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
