-- One-time owner-authorized v64 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v64-grade-3-place-value-decompose-with-zero-tens-1$mw$,$mw$place-value-decompose-with-zero-tens$mw$,$mw$place-value$mw$,$mw$grade-3$mw$,3,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تفكيك عدد دون عشرات","En":"Decomposition without tens"},"Question":{"Ar":"أي تعبير يمثل العدد 608 باستعمال المئات والآحاد فقط؟","En":"Which expression represents 608 using hundreds and ones only?"},"Options":[{"LatexCode":"6\\cdot100+8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6\\cdot10+8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 68.","En":"Gives 68."}},{"LatexCode":"8\\cdot100+6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 806.","En":"Gives 806."}},{"LatexCode":"6\\cdot100+8\\cdot10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 680.","En":"Gives 680."}}],"Hints":[{"Ar":"حدد منزلة 6.","En":"Locate the digit six."},{"Ar":"رقم العشرات صفر.","En":"The tens digit is zero."}],"Solution":{"Idea":{"Ar":"الرقم 6 في المئات والرقم 8 في الآحاد.","En":"Six is in the hundreds place and eight in the ones place."},"FormulaLatex":"608=600+8","Steps":[{"Ar":"$600+8=608$","En":"$600+8=608$"}],"Substitution":{"Ar":"$6\\cdot100+8$","En":"$6\\cdot100+8$"},"Result":{"Ar":"$6\\cdot100+8$","En":"$6\\cdot100+8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$608-600=8$","En":"$608-600=8$"},"CommonError":{"Ar":"يعطي 68.","En":"Gives 68."}}}$mw$::jsonb,$mw$الرقم 6 في المئات والرقم 8 في الآحاد.

$608=600+8$

1. $600+8=608$

$6\cdot100+8$

$6\cdot100+8$

$608-600=8$

يعطي 68.$mw$,$mw$Six is in the hundreds place and eight in the ones place.

$608=600+8$

1. $600+8=608$

$6\cdot100+8$

$6\cdot100+8$

$608-600=8$

Gives 68.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"حدد منزلة 6.","En":"Locate the digit six."},{"Ar":"رقم العشرات صفر.","En":"The tens digit is zero."}],"Solution":{"Idea":{"Ar":"الرقم 6 في المئات والرقم 8 في الآحاد.","En":"Six is in the hundreds place and eight in the ones place."},"FormulaLatex":"608=600+8","Steps":[{"Ar":"$600+8=608$","En":"$600+8=608$"}],"Substitution":{"Ar":"$6\\cdot100+8$","En":"$6\\cdot100+8$"},"Result":{"Ar":"$6\\cdot100+8$","En":"$6\\cdot100+8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$608-600=8$","En":"$608-600=8$"},"CommonError":{"Ar":"يعطي 68.","En":"Gives 68."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 68.","En":"Gives 68."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 806.","En":"Gives 806."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 680.","En":"Gives 680."},"Order":4}]}$mw$),
($mw$growth-v64-grade-3-rounding-sum-of-two-rounded-estimates-error-direction-1$mw$,$mw$rounding-sum-of-two-rounded-estimates-error-direction$mw$,$mw$rounding$mw$,$mw$grade-3$mw$,3,1,81,306,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":306,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"اتجاه خطأ تقدير مجموع","En":"Direction of sum estimation error"},"Question":{"Ar":"عند تقدير مجموع 132 و243 بتقريب كل عدد إلى أقرب مئة، بكم يقل المجموع التقديري عن المجموع الدقيق؟","En":"When estimating 132+243 by rounding each number to the nearest hundred, how much smaller is the estimate than the exact sum?"},"Options":[{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ليس مجموع المقدارين المحذوفين.","En":"Not the total of the two rounding losses."}},{"LatexCode":"43","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق تقريب 243 وحده.","En":"This is the rounding loss of 243 alone."}},{"LatexCode":"375","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع الدقيق.","En":"This is the exact sum."}},{"LatexCode":"75","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"قرّب العددين أولاً.","En":"Round both numbers first."},{"Ar":"احسب الفرق بين المجموعين.","En":"Find the difference between the two sums."}],"Solution":{"Idea":{"Ar":"كلا العددين يقرب إلى المئة الأدنى، فنطرح التقدير من المجموع الدقيق.","En":"Both numbers round down; subtract the estimate from the exact sum."},"FormulaLatex":"(132+243)-(100+200)","Steps":[{"Ar":"$132+243=375$","En":"$132+243=375$"},{"Ar":"$100+200=300$","En":"$100+200=300$"},{"Ar":"$375-300=75$","En":"$375-300=75$"}],"Substitution":{"Ar":"$375-300$","En":"$375-300$"},"Result":{"Ar":"$75$","En":"$75$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$32+43=75$","En":"$32+43=75$"},"CommonError":{"Ar":"ليس مجموع المقدارين المحذوفين.","En":"Not the total of the two rounding losses."}}}$mw$::jsonb,$mw$كلا العددين يقرب إلى المئة الأدنى، فنطرح التقدير من المجموع الدقيق.

$(132+243)-(100+200)$

1. $132+243=375$

2. $100+200=300$

3. $375-300=75$

$375-300$

$75$

$32+43=75$

ليس مجموع المقدارين المحذوفين.$mw$,$mw$Both numbers round down; subtract the estimate from the exact sum.

$(132+243)-(100+200)$

1. $132+243=375$

2. $100+200=300$

3. $375-300=75$

$375-300$

$75$

$32+43=75$

Not the total of the two rounding losses.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"قرّب العددين أولاً.","En":"Round both numbers first."},{"Ar":"احسب الفرق بين المجموعين.","En":"Find the difference between the two sums."}],"Solution":{"Idea":{"Ar":"كلا العددين يقرب إلى المئة الأدنى، فنطرح التقدير من المجموع الدقيق.","En":"Both numbers round down; subtract the estimate from the exact sum."},"FormulaLatex":"(132+243)-(100+200)","Steps":[{"Ar":"$132+243=375$","En":"$132+243=375$"},{"Ar":"$100+200=300$","En":"$100+200=300$"},{"Ar":"$375-300=75$","En":"$375-300=75$"}],"Substitution":{"Ar":"$375-300$","En":"$375-300$"},"Result":{"Ar":"$75$","En":"$75$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$32+43=75$","En":"$32+43=75$"},"CommonError":{"Ar":"ليس مجموع المقدارين المحذوفين.","En":"Not the total of the two rounding losses."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ليس مجموع المقدارين المحذوفين.","En":"Not the total of the two rounding losses."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق تقريب 243 وحده.","En":"This is the rounding loss of 243 alone."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا المجموع الدقيق.","En":"This is the exact sum."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v64-grade-7-sample-space-two-distinct-dice-equal-outcomes-count-1$mw$,$mw$sample-space-two-distinct-dice-equal-outcomes-count$mw$,$mw$sample-spaces$mw$,$mw$grade-7$mw$,7,2,85,336,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":336,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نواتج حجرين متساويين","En":"Equal outcomes of two dice"},"Question":{"Ar":"يُرمى حجران متميزان من النرد، كل منهما مرقم من 1 إلى 6. كم ناتجاً مرتباً يظهر فيه العدد نفسه على الحجرين؟","En":"Two distinguishable dice, each numbered one through six, are rolled. How many ordered outcomes show the same number on both dice?"},"Options":[{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد النواتج المختلفة العددين.","En":"Counts unequal-number outcomes."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد النواتج كلها.","En":"Counts all outcomes."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع عددَي الأوجه.","En":"Adds the two face counts."}}],"Hints":[{"Ar":"إذا ظهر 1 على الأول، ماذا يجب أن يظهر على الثاني؟","En":"If the first shows one, what must the second show?"},{"Ar":"كرر ذلك للأعداد الستة.","En":"Repeat for all six numbers."}],"Solution":{"Idea":{"Ar":"لكل عدد على الحجر الأول خيار واحد مطابق على الثاني.","En":"Each first-die number has exactly one matching second-die number."},"FormulaLatex":"\\{(1,1),(2,2),\\ldots,(6,6)\\}","Steps":[{"Ar":"$6\\cdot1=6$","En":"$6\\cdot1=6$"}],"Substitution":{"Ar":"$6\\cdot1$","En":"$6\\cdot1$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6+30=36$","En":"$6+30=36$"},"CommonError":{"Ar":"جمع عددَي الأوجه.","En":"Adds the two face counts."}}}$mw$::jsonb,$mw$لكل عدد على الحجر الأول خيار واحد مطابق على الثاني.

$\{(1,1),(2,2),\ldots,(6,6)\}$

1. $6\cdot1=6$

$6\cdot1$

$6$

$6+30=36$

جمع عددَي الأوجه.$mw$,$mw$Each first-die number has exactly one matching second-die number.

$\{(1,1),(2,2),\ldots,(6,6)\}$

1. $6\cdot1=6$

$6\cdot1$

$6$

$6+30=36$

Adds the two face counts.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"إذا ظهر 1 على الأول، ماذا يجب أن يظهر على الثاني؟","En":"If the first shows one, what must the second show?"},{"Ar":"كرر ذلك للأعداد الستة.","En":"Repeat for all six numbers."}],"Solution":{"Idea":{"Ar":"لكل عدد على الحجر الأول خيار واحد مطابق على الثاني.","En":"Each first-die number has exactly one matching second-die number."},"FormulaLatex":"\\{(1,1),(2,2),\\ldots,(6,6)\\}","Steps":[{"Ar":"$6\\cdot1=6$","En":"$6\\cdot1=6$"}],"Substitution":{"Ar":"$6\\cdot1$","En":"$6\\cdot1$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6+30=36$","En":"$6+30=36$"},"CommonError":{"Ar":"جمع عددَي الأوجه.","En":"Adds the two face counts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد النواتج المختلفة العددين.","En":"Counts unequal-number outcomes."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد النواتج كلها.","En":"Counts all outcomes."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع عددَي الأوجه.","En":"Adds the two face counts."},"Order":4}]}$mw$),
($mw$growth-v64-grade-7-probability-union-overlapping-label-events-1$mw$,$mw$probability-union-overlapping-label-events$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال اتحاد حدثين متداخلين","En":"Probability of overlapping events"},"Question":{"Ar":"تُسحب بطاقة عشوائياً من بطاقات مرقمة من 1 إلى 12. ما احتمال أن يكون رقمها من مضاعفات 2 أو 3 أو كليهما؟","En":"One card is selected uniformly from cards numbered 1 to 12. What is the probability its number is a multiple of two or three or both?"},"Options":[{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال مضاعفات 2 وحدها.","En":"This is just the probability of multiples of two."}},{"LatexCode":"\\frac23","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac56","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد المضاعفات المشتركة مرتين.","En":"Counts common multiples twice."}},{"LatexCode":"\\frac16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال التقاطع فقط.","En":"This is just the intersection probability."}}],"Hints":[{"Ar":"حدد مضاعفات كل عدد.","En":"List multiples of each number."},{"Ar":"لا تعد 6 و12 مرتين.","En":"Do not count six and twelve twice."}],"Solution":{"Idea":{"Ar":"نعد مضاعفات 2 و3 ونطرح المشتركة مرة واحدة.","En":"Count multiples of two and three, subtracting common multiples once."},"FormulaLatex":"P=(6+4-2)/12","Steps":[{"Ar":"$6+4-2=8$","En":"$6+4-2=8$"},{"Ar":"$8/12=2/3$","En":"$8/12=2/3$"}],"Substitution":{"Ar":"$8/12$","En":"$8/12$"},"Result":{"Ar":"$\\frac23$","En":"$\\frac23$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\{2,3,4,6,8,9,10,12\\}$","En":"$\\{2,3,4,6,8,9,10,12\\}$"},"CommonError":{"Ar":"عد المضاعفات المشتركة مرتين.","En":"Counts common multiples twice."}}}$mw$::jsonb,$mw$نعد مضاعفات 2 و3 ونطرح المشتركة مرة واحدة.

$P=(6+4-2)/12$

1. $6+4-2=8$

2. $8/12=2/3$

$8/12$

$\frac23$

$\{2,3,4,6,8,9,10,12\}$

عد المضاعفات المشتركة مرتين.$mw$,$mw$Count multiples of two and three, subtracting common multiples once.

$P=(6+4-2)/12$

1. $6+4-2=8$

2. $8/12=2/3$

$8/12$

$\frac23$

$\{2,3,4,6,8,9,10,12\}$

Counts common multiples twice.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد مضاعفات كل عدد.","En":"List multiples of each number."},{"Ar":"لا تعد 6 و12 مرتين.","En":"Do not count six and twelve twice."}],"Solution":{"Idea":{"Ar":"نعد مضاعفات 2 و3 ونطرح المشتركة مرة واحدة.","En":"Count multiples of two and three, subtracting common multiples once."},"FormulaLatex":"P=(6+4-2)/12","Steps":[{"Ar":"$6+4-2=8$","En":"$6+4-2=8$"},{"Ar":"$8/12=2/3$","En":"$8/12=2/3$"}],"Substitution":{"Ar":"$8/12$","En":"$8/12$"},"Result":{"Ar":"$\\frac23$","En":"$\\frac23$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\{2,3,4,6,8,9,10,12\\}$","En":"$\\{2,3,4,6,8,9,10,12\\}$"},"CommonError":{"Ar":"عد المضاعفات المشتركة مرتين.","En":"Counts common multiples twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال مضاعفات 2 وحدها.","En":"This is just the probability of multiples of two."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عد المضاعفات المشتركة مرتين.","En":"Counts common multiples twice."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال التقاطع فقط.","En":"This is just the intersection probability."},"Order":4}]}$mw$),
($mw$growth-v64-grade-8-map-scale-infer-length-from-real-distance-mixed-units-1$mw$,$mw$map-scale-infer-length-from-real-distance-mixed-units$mw$,$mw$middle-map-scale$mw$,$mw$grade-8$mw$,8,2,7,33,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":33,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مسافة على الخريطة","En":"Map length from real distance"},"Question":{"Ar":"مقياس خريطة هو 1:25000. كم سنتيمتراً تمثل مسافة حقيقية طولها 1.5 كم؟","En":"A map has scale 1:25000. How many centimetres on the map represent a real distance of 1.5 km?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.06","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حوّل المسافة إلى أمتار ثم قسمها دون تحويلها إلى سنتيمترات.","En":"Uses the distance in metres instead of centimetres."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ بعامل عشرة في التحويل.","En":"Makes a factor-of-ten conversion error."}},{"LatexCode":"37500","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب 1.5 في مقام المقياس دون توحيد الوحدات أو القسمة.","En":"Multiplies 1.5 by the scale denominator without conversion or division."}}],"Hints":[{"Ar":"كم سنتيمتراً في كيلومتر واحد؟","En":"How many centimetres are in a kilometre?"},{"Ar":"اقسم المسافة الحقيقية بالسنتيمتر على 25000.","En":"Divide the real centimetre distance by 25000."}],"Solution":{"Idea":{"Ar":"نوحد الوحدات إلى سنتيمترات ثم نقسم على مقام المقياس.","En":"Convert to centimetres and divide by the scale denominator."},"FormulaLatex":"L=150000/25000","Steps":[{"Ar":"$1.5\\cdot100000=150000$","En":"$1.5\\cdot100000=150000$"},{"Ar":"$150000/25000=6$","En":"$150000/25000=6$"}],"Substitution":{"Ar":"$150000/25000$","En":"$150000/25000$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$6\\cdot25000=150000$","En":"$6\\cdot25000=150000$"},"CommonError":{"Ar":"لم يحول الكيلومترات إلى سنتيمترات.","En":"Does not convert kilometres to centimetres correctly."}}}$mw$::jsonb,$mw$نوحد الوحدات إلى سنتيمترات ثم نقسم على مقام المقياس.

$L=150000/25000$

1. $1.5\cdot100000=150000$

2. $150000/25000=6$

$150000/25000$

$6$ سم

$6\cdot25000=150000$

لم يحول الكيلومترات إلى سنتيمترات.$mw$,$mw$Convert to centimetres and divide by the scale denominator.

$L=150000/25000$

1. $1.5\cdot100000=150000$

2. $150000/25000=6$

$150000/25000$

$6$ cm

$6\cdot25000=150000$

Does not convert kilometres to centimetres correctly.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم سنتيمتراً في كيلومتر واحد؟","En":"How many centimetres are in a kilometre?"},{"Ar":"اقسم المسافة الحقيقية بالسنتيمتر على 25000.","En":"Divide the real centimetre distance by 25000."}],"Solution":{"Idea":{"Ar":"نوحد الوحدات إلى سنتيمترات ثم نقسم على مقام المقياس.","En":"Convert to centimetres and divide by the scale denominator."},"FormulaLatex":"L=150000/25000","Steps":[{"Ar":"$1.5\\cdot100000=150000$","En":"$1.5\\cdot100000=150000$"},{"Ar":"$150000/25000=6$","En":"$150000/25000=6$"}],"Substitution":{"Ar":"$150000/25000$","En":"$150000/25000$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$6\\cdot25000=150000$","En":"$6\\cdot25000=150000$"},"CommonError":{"Ar":"لم يحول الكيلومترات إلى سنتيمترات.","En":"Does not convert kilometres to centimetres correctly."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حوّل المسافة إلى أمتار ثم قسمها دون تحويلها إلى سنتيمترات.","En":"Uses the distance in metres instead of centimetres."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أخطأ بعامل عشرة في التحويل.","En":"Makes a factor-of-ten conversion error."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضرب 1.5 في مقام المقياس دون توحيد الوحدات أو القسمة.","En":"Multiplies 1.5 by the scale denominator without conversion or division."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v64 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
