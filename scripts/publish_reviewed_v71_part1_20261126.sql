-- One-time owner-authorized v71 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v71-grade-11-recurrence-shift-to-geometric-1$mw$,$mw$recurrence-shift-to-geometric$mw$,$mw$s-sequences-series-recurrence-relations$mw$,$mw$grade-11$mw$,11,3,23,102,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":102,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحويل علاقة تراجعية","En":"Shifting a recurrence"},"Question":{"Ar":"إذا كان $a_{n+1}=2a_n+5$، وعرّفنا $b_n=a_n+5$، فما العلاقة بين $b_{n+1}$ و$b_n$؟","En":"If $a_{n+1}=2a_n+5$ and $b_n=a_n+5$, how does $b_{n+1}$ relate to $b_n$?"},"Options":[{"LatexCode":"b_{n+1}=b_n+5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يضاعف الحد السابق.","En":"Does not double the previous term."}},{"LatexCode":"b_{n+1}=2b_n","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"b_{n+1}=2b_n+5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أبقى الثابت رغم امتصاصه في التحويل.","En":"Retains the constant after the shift absorbs it."}},{"LatexCode":"b_{n+1}=b_n^2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استبدل التضاعف بالتربيع.","En":"Replaces doubling with squaring."}}],"Hints":[{"Ar":"اكتب تعريف الحد الجديد عند الفهرس التالي.","En":"Write the new definition at the next index."},{"Ar":"استخرج العامل 2.","En":"Factor out two."}],"Solution":{"Idea":{"Ar":"نعوض في تعريف الحد الجديد ثم نجمع الحدود.","En":"Substitute in the definition of the new term and collect terms."},"FormulaLatex":"b_{n+1}=a_{n+1}+5","Steps":[{"Ar":"$b_{n+1}=2a_n+10$","En":"$b_{n+1}=2a_n+10$"},{"Ar":"$b_{n+1}=2(a_n+5)=2b_n$","En":"$b_{n+1}=2(a_n+5)=2b_n$"}],"Substitution":{"Ar":"$b_{n+1}=a_{n+1}+5$","En":"$b_{n+1}=a_{n+1}+5$"},"Result":{"Ar":"$b_{n+1}=2b_n$","En":"$b_{n+1}=2b_n$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا كان $a_1=1$ فإن $a_2=7$ و$b_1=6,b_2=12$.","En":"If $a_1=1$, then $a_2=7$ and $b_1=6,b_2=12$."},"CommonError":{"Ar":"لم يضاعف الحد السابق.","En":"Does not double the previous term."}}}$mw$::jsonb,$mw$نعوض في تعريف الحد الجديد ثم نجمع الحدود.

$b_{n+1}=a_{n+1}+5$

1. $b_{n+1}=2a_n+10$

2. $b_{n+1}=2(a_n+5)=2b_n$

$b_{n+1}=a_{n+1}+5$

$b_{n+1}=2b_n$

إذا كان $a_1=1$ فإن $a_2=7$ و$b_1=6,b_2=12$.

لم يضاعف الحد السابق.$mw$,$mw$Substitute in the definition of the new term and collect terms.

$b_{n+1}=a_{n+1}+5$

1. $b_{n+1}=2a_n+10$

2. $b_{n+1}=2(a_n+5)=2b_n$

$b_{n+1}=a_{n+1}+5$

$b_{n+1}=2b_n$

If $a_1=1$, then $a_2=7$ and $b_1=6,b_2=12$.

Does not double the previous term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب تعريف الحد الجديد عند الفهرس التالي.","En":"Write the new definition at the next index."},{"Ar":"استخرج العامل 2.","En":"Factor out two."}],"Solution":{"Idea":{"Ar":"نعوض في تعريف الحد الجديد ثم نجمع الحدود.","En":"Substitute in the definition of the new term and collect terms."},"FormulaLatex":"b_{n+1}=a_{n+1}+5","Steps":[{"Ar":"$b_{n+1}=2a_n+10$","En":"$b_{n+1}=2a_n+10$"},{"Ar":"$b_{n+1}=2(a_n+5)=2b_n$","En":"$b_{n+1}=2(a_n+5)=2b_n$"}],"Substitution":{"Ar":"$b_{n+1}=a_{n+1}+5$","En":"$b_{n+1}=a_{n+1}+5$"},"Result":{"Ar":"$b_{n+1}=2b_n$","En":"$b_{n+1}=2b_n$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا كان $a_1=1$ فإن $a_2=7$ و$b_1=6,b_2=12$.","En":"If $a_1=1$, then $a_2=7$ and $b_1=6,b_2=12$."},"CommonError":{"Ar":"لم يضاعف الحد السابق.","En":"Does not double the previous term."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يضاعف الحد السابق.","En":"Does not double the previous term."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أبقى الثابت رغم امتصاصه في التحويل.","En":"Retains the constant after the shift absorbs it."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استبدل التضاعف بالتربيع.","En":"Replaces doubling with squaring."},"Order":4}]}$mw$),
($mw$growth-v71-grade-11-finite-geometric-sum-scaled-difference-1$mw$,$mw$finite-geometric-sum-scaled-difference$mw$,$mw$s-sequences-series-series-sums$mw$,$mw$grade-11$mw$,11,3,23,101,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":101,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجموع هندسي بالطرح","En":"Geometric sum by subtraction"},"Question":{"Ar":"لتكن $S=3+9+27+81+243$. ما قيمة $3S-S$ دون الحاجة لجمع الحدود الخمسة مباشرة؟","En":"Let $S=3+9+27+81+243$. Find $3S-S$ without directly adding all five terms."},"Options":[{"LatexCode":"729","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الحد الأول المطروح.","En":"Omits the first subtracted term."}},{"LatexCode":"726","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"240","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الطرفين الأصليين بدلاً من طرفي المجموعين.","En":"Subtracts original endpoints instead of shifted endpoints."}},{"LatexCode":"486","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل ضعف الحد الأخير فقط.","En":"Uses only twice the last term."}}],"Hints":[{"Ar":"اكتب حدود المجموع بعد ضربها في 3.","En":"Write the terms after multiplication by three."},{"Ar":"احذف الحدود المشتركة عند الطرح.","En":"Cancel the shared terms on subtraction."}],"Solution":{"Idea":{"Ar":"بعد ضرب المجموع في 3 تتطابق الحدود الوسطى وتختفي بالطرح.","En":"Multiplying by three aligns interior terms, which cancel on subtraction."},"FormulaLatex":"3S-S=(9+27+81+243+729)-(3+9+27+81+243)","Steps":[{"Ar":"$3S-S=729-3$","En":"$3S-S=729-3$"},{"Ar":"$3S-S=726$","En":"$3S-S=726$"}],"Substitution":{"Ar":"$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$","En":"$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$"},"Result":{"Ar":"$726$","En":"$726$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$S=363$ ومن ثم $2S=726$.","En":"$S=363$, so $2S=726$."},"CommonError":{"Ar":"أهمل الحد الأول المطروح.","En":"Omits the first subtracted term."}}}$mw$::jsonb,$mw$بعد ضرب المجموع في 3 تتطابق الحدود الوسطى وتختفي بالطرح.

$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$

1. $3S-S=729-3$

2. $3S-S=726$

$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$

$726$

$S=363$ ومن ثم $2S=726$.

أهمل الحد الأول المطروح.$mw$,$mw$Multiplying by three aligns interior terms, which cancel on subtraction.

$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$

1. $3S-S=729-3$

2. $3S-S=726$

$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$

$726$

$S=363$, so $2S=726$.

Omits the first subtracted term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب حدود المجموع بعد ضربها في 3.","En":"Write the terms after multiplication by three."},{"Ar":"احذف الحدود المشتركة عند الطرح.","En":"Cancel the shared terms on subtraction."}],"Solution":{"Idea":{"Ar":"بعد ضرب المجموع في 3 تتطابق الحدود الوسطى وتختفي بالطرح.","En":"Multiplying by three aligns interior terms, which cancel on subtraction."},"FormulaLatex":"3S-S=(9+27+81+243+729)-(3+9+27+81+243)","Steps":[{"Ar":"$3S-S=729-3$","En":"$3S-S=729-3$"},{"Ar":"$3S-S=726$","En":"$3S-S=726$"}],"Substitution":{"Ar":"$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$","En":"$3S-S=(9+27+81+243+729)-(3+9+27+81+243)$"},"Result":{"Ar":"$726$","En":"$726$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$S=363$ ومن ثم $2S=726$.","En":"$S=363$, so $2S=726$."},"CommonError":{"Ar":"أهمل الحد الأول المطروح.","En":"Omits the first subtracted term."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الحد الأول المطروح.","En":"Omits the first subtracted term."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح الطرفين الأصليين بدلاً من طرفي المجموعين.","En":"Subtracts original endpoints instead of shifted endpoints."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل ضعف الحد الأخير فقط.","En":"Uses only twice the last term."},"Order":4}]}$mw$),
($mw$growth-v71-grade-9-right-triangle-median-coordinate-identity-1$mw$,$mw$right-triangle-median-coordinate-identity$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-9$mw$,9,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المسافة إلى منتصف الوتر","En":"Distance to the hypotenuse midpoint"},"Question":{"Ar":"في مثلث قائم رؤوسه $A=(0,0),B=(8,0),C=(0,6)$، ما المسافة من $A$ إلى منتصف الوتر $BC$؟","En":"A right triangle has vertices $A=(0,0),B=(8,0),C=(0,6)$. Find the distance from $A$ to the midpoint of hypotenuse $BC$."},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الوتر كله.","En":"Finds the entire hypotenuse."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع إحداثيي المنتصف.","En":"Adds the midpoint coordinates."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الإحداثي الأفقي وحده.","En":"Uses only the horizontal coordinate."}}],"Hints":[{"Ar":"خذ متوسط الإحداثيين الأفقيين والعموديين.","En":"Average each coordinate separately."},{"Ar":"شكل مثلثاً قائماً من الإزاحتين.","En":"Form a right triangle from the two displacements."}],"Solution":{"Idea":{"Ar":"نجد إحداثيي المنتصف ثم نستخدم فيثاغورس للمسافة من الأصل.","En":"Find midpoint coordinates, then apply Pythagoras to the distance from the origin."},"FormulaLatex":"M=(4,3)","Steps":[{"Ar":"$AM^2=4^2+3^2=25$","En":"$AM^2=4^2+3^2=25$"},{"Ar":"$AM=5$","En":"$AM=5$"}],"Substitution":{"Ar":"$M=(4,3)$","En":"$M=(4,3)$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$BC=\\sqrt{8^2+6^2}=10$ و$AM=BC/2=5$.","En":"$BC=\\sqrt{8^2+6^2}=10$ and $AM=BC/2=5$."},"CommonError":{"Ar":"حسب الوتر كله.","En":"Finds the entire hypotenuse."}}}$mw$::jsonb,$mw$نجد إحداثيي المنتصف ثم نستخدم فيثاغورس للمسافة من الأصل.

$M=(4,3)$

1. $AM^2=4^2+3^2=25$

2. $AM=5$

$M=(4,3)$

$5$

$BC=\sqrt{8^2+6^2}=10$ و$AM=BC/2=5$.

حسب الوتر كله.$mw$,$mw$Find midpoint coordinates, then apply Pythagoras to the distance from the origin.

$M=(4,3)$

1. $AM^2=4^2+3^2=25$

2. $AM=5$

$M=(4,3)$

$5$

$BC=\sqrt{8^2+6^2}=10$ and $AM=BC/2=5$.

Finds the entire hypotenuse.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"خذ متوسط الإحداثيين الأفقيين والعموديين.","En":"Average each coordinate separately."},{"Ar":"شكل مثلثاً قائماً من الإزاحتين.","En":"Form a right triangle from the two displacements."}],"Solution":{"Idea":{"Ar":"نجد إحداثيي المنتصف ثم نستخدم فيثاغورس للمسافة من الأصل.","En":"Find midpoint coordinates, then apply Pythagoras to the distance from the origin."},"FormulaLatex":"M=(4,3)","Steps":[{"Ar":"$AM^2=4^2+3^2=25$","En":"$AM^2=4^2+3^2=25$"},{"Ar":"$AM=5$","En":"$AM=5$"}],"Substitution":{"Ar":"$M=(4,3)$","En":"$M=(4,3)$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$BC=\\sqrt{8^2+6^2}=10$ و$AM=BC/2=5$.","En":"$BC=\\sqrt{8^2+6^2}=10$ and $AM=BC/2=5$."},"CommonError":{"Ar":"حسب الوتر كله.","En":"Finds the entire hypotenuse."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب الوتر كله.","En":"Finds the entire hypotenuse."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع إحداثيي المنتصف.","En":"Adds the midpoint coordinates."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الإحداثي الأفقي وحده.","En":"Uses only the horizontal coordinate."},"Order":4}]}$mw$),
($mw$growth-v71-grade-9-similar-triangle-parallel-cut-side-remainder-1$mw$,$mw$similar-triangle-parallel-cut-side-remainder$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قطعة موازية وضلع متبقٍ","En":"Parallel segment and remaining side"},"Question":{"Ar":"في مثلث $ABC$ تقع $D$ داخل القطعة $AB$ و$E$ داخل القطعة $AC$، و$DE\\parallel BC$. إذا كان $AD=4,DB=6,AE=8$ فما $EC$؟","En":"In triangle $ABC$, $D$ lies strictly inside segment $AB$ and $E$ strictly inside segment $AC$, with $DE\\parallel BC$. If $AD=4,DB=6,AE=8$, find $EC$."},"Options":[{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الضلع الكامل $AC$.","En":"Finds the full side $AC$."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل طول $AB$ مباشرة.","En":"Uses the length of $AB$ directly."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف $AE$ دون استعمال النسبة.","En":"Doubles $AE$ without using the proportion."}}],"Hints":[{"Ar":"قارن القطعتين على الضلع الأول.","En":"Compare the segments on the first side."},{"Ar":"اكتب النسبة المناظرة على الضلع الثاني.","En":"Write the matching ratio on the second side."}],"Solution":{"Idea":{"Ar":"الخط الموازي يقسم الضلعين بالنسبة نفسها.","En":"The parallel segment divides the two sides in equal proportions."},"FormulaLatex":"AD/DB=AE/EC","Steps":[{"Ar":"$4/6=8/EC$","En":"$4/6=8/EC$"},{"Ar":"$EC=48/4=12$","En":"$EC=48/4=12$"}],"Substitution":{"Ar":"$AD/DB=AE/EC$","En":"$AD/DB=AE/EC$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4/10=8/20$ وبالتالي المثلثان متشابهان.","En":"$4/10=8/20$, confirming similarity."},"CommonError":{"Ar":"حسب الضلع الكامل $AC$.","En":"Finds the full side $AC$."}}}$mw$::jsonb,$mw$الخط الموازي يقسم الضلعين بالنسبة نفسها.

$AD/DB=AE/EC$

1. $4/6=8/EC$

2. $EC=48/4=12$

$AD/DB=AE/EC$

$12$

$4/10=8/20$ وبالتالي المثلثان متشابهان.

حسب الضلع الكامل $AC$.$mw$,$mw$The parallel segment divides the two sides in equal proportions.

$AD/DB=AE/EC$

1. $4/6=8/EC$

2. $EC=48/4=12$

$AD/DB=AE/EC$

$12$

$4/10=8/20$, confirming similarity.

Finds the full side $AC$.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قارن القطعتين على الضلع الأول.","En":"Compare the segments on the first side."},{"Ar":"اكتب النسبة المناظرة على الضلع الثاني.","En":"Write the matching ratio on the second side."}],"Solution":{"Idea":{"Ar":"الخط الموازي يقسم الضلعين بالنسبة نفسها.","En":"The parallel segment divides the two sides in equal proportions."},"FormulaLatex":"AD/DB=AE/EC","Steps":[{"Ar":"$4/6=8/EC$","En":"$4/6=8/EC$"},{"Ar":"$EC=48/4=12$","En":"$EC=48/4=12$"}],"Substitution":{"Ar":"$AD/DB=AE/EC$","En":"$AD/DB=AE/EC$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4/10=8/20$ وبالتالي المثلثان متشابهان.","En":"$4/10=8/20$, confirming similarity."},"CommonError":{"Ar":"حسب الضلع الكامل $AC$.","En":"Finds the full side $AC$."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب الضلع الكامل $AC$.","En":"Finds the full side $AC$."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل طول $AB$ مباشرة.","En":"Uses the length of $AB$ directly."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف $AE$ دون استعمال النسبة.","En":"Doubles $AE$ without using the proportion."},"Order":4}]}$mw$),
($mw$growth-v71-grade-9-similarity-composition-three-triangles-1$mw$,$mw$similarity-composition-three-triangles$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تركيب نسب التشابه","En":"Composing similarity scales"},"Question":{"Ar":"ثلاثة مثلثات متشابهة. نسبة الأطوال من الأول إلى الثاني $3/2$، ومن الثاني إلى الثالث $4/3$. إذا كان ضلع في الأول طوله 7، فما طول نظيره في الثالث؟","En":"Three triangles are similar. The length scale from first to second is $3/2$, and from second to third is $4/3$. If a side of the first is 7, find its counterpart in the third."},"Options":[{"LatexCode":"14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{21}{2}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم معامل الانتقال الأول فقط.","En":"Uses only the first scale."}},{"LatexCode":"\\frac{28}{3}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم معامل الانتقال الثاني فقط.","En":"Uses only the second scale."}},{"LatexCode":"\\frac{119}{6}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع المعاملين بدلاً من ضربهما.","En":"Adds the scales instead of multiplying."}}],"Hints":[{"Ar":"احسب معامل التحويل على مرحلتين.","En":"Compose the two scale changes."},{"Ar":"طبق المعامل الكلي على الضلع المعطى.","En":"Apply the total scale to the given side."}],"Solution":{"Idea":{"Ar":"معامل التشابه الكلي حاصل ضرب معاملي الانتقال.","En":"The combined scale is the product of the two scales."},"FormulaLatex":"k=(3/2)(4/3)","Steps":[{"Ar":"$k=2$","En":"$k=2$"},{"Ar":"$7k=14$","En":"$7k=14$"}],"Substitution":{"Ar":"$k=(3/2)(4/3)$","En":"$k=(3/2)(4/3)$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7\\cdot3/2=10.5$ ثم $10.5\\cdot4/3=14$.","En":"$7\\cdot3/2=10.5$, then $10.5\\cdot4/3=14$."},"CommonError":{"Ar":"استخدم معامل الانتقال الأول فقط.","En":"Uses only the first scale."}}}$mw$::jsonb,$mw$معامل التشابه الكلي حاصل ضرب معاملي الانتقال.

$k=(3/2)(4/3)$

1. $k=2$

2. $7k=14$

$k=(3/2)(4/3)$

$14$

$7\cdot3/2=10.5$ ثم $10.5\cdot4/3=14$.

استخدم معامل الانتقال الأول فقط.$mw$,$mw$The combined scale is the product of the two scales.

$k=(3/2)(4/3)$

1. $k=2$

2. $7k=14$

$k=(3/2)(4/3)$

$14$

$7\cdot3/2=10.5$, then $10.5\cdot4/3=14$.

Uses only the first scale.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب معامل التحويل على مرحلتين.","En":"Compose the two scale changes."},{"Ar":"طبق المعامل الكلي على الضلع المعطى.","En":"Apply the total scale to the given side."}],"Solution":{"Idea":{"Ar":"معامل التشابه الكلي حاصل ضرب معاملي الانتقال.","En":"The combined scale is the product of the two scales."},"FormulaLatex":"k=(3/2)(4/3)","Steps":[{"Ar":"$k=2$","En":"$k=2$"},{"Ar":"$7k=14$","En":"$7k=14$"}],"Substitution":{"Ar":"$k=(3/2)(4/3)$","En":"$k=(3/2)(4/3)$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7\\cdot3/2=10.5$ ثم $10.5\\cdot4/3=14$.","En":"$7\\cdot3/2=10.5$, then $10.5\\cdot4/3=14$."},"CommonError":{"Ar":"استخدم معامل الانتقال الأول فقط.","En":"Uses only the first scale."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استخدم معامل الانتقال الأول فقط.","En":"Uses only the first scale."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استخدم معامل الانتقال الثاني فقط.","En":"Uses only the second scale."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع المعاملين بدلاً من ضربهما.","En":"Adds the scales instead of multiplying."},"Order":4}]}$mw$),
($mw$growth-v71-grade-11-circle-complete-square-center-radius-1$mw$,$mw$circle-complete-square-center-radius$mw$,$mw$circles$mw$,$mw$grade-11$mw$,11,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مركز ونصف قطر بإكمال المربع","En":"Completing squares for a circle"},"Question":{"Ar":"ما نصف قطر الدائرة $x^2+y^2-6x+4y=12$؟","En":"Find the radius of $x^2+y^2-6x+4y=12$."},"Options":[{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل مربع نصف القطر.","En":"Uses the squared radius."}},{"LatexCode":"\\sqrt{12}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل إكمال المربع.","En":"Omits completing squares."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\sqrt{17}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم تضف مربعي نصفي المعاملين على نحو صحيح.","En":"Does not correctly add both squared half-coefficients."}}],"Hints":[{"Ar":"خذ نصف معامل كل حد خطي ثم ربعه.","En":"Halve each linear coefficient and square it."},{"Ar":"أضف المربعين إلى الطرفين.","En":"Add both squares to both sides."}],"Solution":{"Idea":{"Ar":"نكمل المربع في كل متغير لنحصل على الصورة القياسية.","En":"Complete the square in both variables to obtain standard form."},"FormulaLatex":"(x-3)^2+(y+2)^2=12+9+4","Steps":[{"Ar":"$(x-3)^2+(y+2)^2=25$","En":"$(x-3)^2+(y+2)^2=25$"},{"Ar":"$r=5$","En":"$r=5$"}],"Substitution":{"Ar":"$(x-3)^2+(y+2)^2=12+9+4$","En":"$(x-3)^2+(y+2)^2=12+9+4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"النقطة $(8,-2)$ تحقق المعادلة الأصلية وتبعد 5 عن المركز $(3,-2)$.","En":"Point $(8,-2)$ satisfies the original equation and is five units from center $(3,-2)$."},"CommonError":{"Ar":"استعمل مربع نصف القطر.","En":"Uses the squared radius."}}}$mw$::jsonb,$mw$نكمل المربع في كل متغير لنحصل على الصورة القياسية.

$(x-3)^2+(y+2)^2=12+9+4$

1. $(x-3)^2+(y+2)^2=25$

2. $r=5$

$(x-3)^2+(y+2)^2=12+9+4$

$5$

النقطة $(8,-2)$ تحقق المعادلة الأصلية وتبعد 5 عن المركز $(3,-2)$.

استعمل مربع نصف القطر.$mw$,$mw$Complete the square in both variables to obtain standard form.

$(x-3)^2+(y+2)^2=12+9+4$

1. $(x-3)^2+(y+2)^2=25$

2. $r=5$

$(x-3)^2+(y+2)^2=12+9+4$

$5$

Point $(8,-2)$ satisfies the original equation and is five units from center $(3,-2)$.

Uses the squared radius.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"خذ نصف معامل كل حد خطي ثم ربعه.","En":"Halve each linear coefficient and square it."},{"Ar":"أضف المربعين إلى الطرفين.","En":"Add both squares to both sides."}],"Solution":{"Idea":{"Ar":"نكمل المربع في كل متغير لنحصل على الصورة القياسية.","En":"Complete the square in both variables to obtain standard form."},"FormulaLatex":"(x-3)^2+(y+2)^2=12+9+4","Steps":[{"Ar":"$(x-3)^2+(y+2)^2=25$","En":"$(x-3)^2+(y+2)^2=25$"},{"Ar":"$r=5$","En":"$r=5$"}],"Substitution":{"Ar":"$(x-3)^2+(y+2)^2=12+9+4$","En":"$(x-3)^2+(y+2)^2=12+9+4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"النقطة $(8,-2)$ تحقق المعادلة الأصلية وتبعد 5 عن المركز $(3,-2)$.","En":"Point $(8,-2)$ satisfies the original equation and is five units from center $(3,-2)$."},"CommonError":{"Ar":"استعمل مربع نصف القطر.","En":"Uses the squared radius."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل مربع نصف القطر.","En":"Uses the squared radius."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل إكمال المربع.","En":"Omits completing squares."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لم تضف مربعي نصفي المعاملين على نحو صحيح.","En":"Does not correctly add both squared half-coefficients."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v71 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
