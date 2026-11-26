-- One-time owner-authorized import AND publication from reviewed v15/v16/v18 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v15-grade-5-largest-median-hidden-scores-1$mw$,$mw$largest-median-hidden-scores$mw$,$mw$primary-median$mw$,$mw$grade-5$mw$,5,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"وسيط خمس بطاقات","En":"Median of five cards"},"Question":{"Ar":"على كل بطاقة عدد صحيح من 0 إلى 20، ويُسمح بالتكرار. في مجموعة من خمس بطاقات ظهرت الأعداد 4 و9 و15 وبقيت بطاقتان مقلوبتين. ما أكبر وسيط ممكن للأعداد الخمسة؟","En":"Each card shows a whole number from 0 to 20, and repeats are allowed. In a set of five cards, 4, 9 and 15 are visible and two cards are face down. What is the greatest possible median of all five numbers?"},"Options":[{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى أكبر قيمة ممكنة لبطاقة واحدة.","En":"Reports the maximum for one card."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب وسيط البطاقات الظاهرة وحدها.","En":"Takes the median of just the visible cards."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ منتصف المجال من صفر إلى عشرين.","En":"Takes the midpoint of the allowed range."}}],"Hints":[{"Ar":"أي مرتبة يحتلها الوسيط بعد ترتيب خمس بطاقات؟","En":"Which rank is the median among five sorted cards?"},{"Ar":"كم قيمة معلومة لا تزيد على أكبر قيمة ظاهرة؟","En":"How many known values do not exceed the largest visible value?"}],"Solution":{"Idea":{"Ar":"الوسيط هو القيمة الثالثة بعد ترتيب خمس قيم؛ نحدد حداً أعلى ونثبت إمكان بلوغه.","En":"The median is the third ordered value of five; find an upper bound and show it is attainable."},"FormulaLatex":"m=x_{(3)}","Steps":[{"Ar":"هناك ثلاث قيم لا تزيد على 15، لذا لا يمكن للقيمة الثالثة في الترتيب التصاعدي أن تتجاوز 15.","En":"Three values are already at most 15, so the third-smallest value cannot exceed 15."},{"Ar":"لتحقيق هذا الحد نختار 20 لكل من البطاقتين المخفيتين.","En":"To attain this bound, choose 20 for both hidden cards."}],"Substitution":{"Ar":"$(4,9,15,20,20)\\Rightarrow m=15$","En":"$(4,9,15,20,20)\\Rightarrow m=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"العدد 15 يقع في الوسط بين قيمتين قبله وقيمتين بعده في المثال، وأي وسيط أكبر يستلزم وجود ثلاث قيم أكبر من 15 مع أن بطاقتين فقط مخفيتان.","En":"In the example 15 has two values on either side. A greater median would require three cards above 15, but only two cards are hidden."},"CommonError":{"Ar":"أعطى أكبر قيمة ممكنة لبطاقة واحدة.","En":"Reports the maximum for one card."}}}$mw$::jsonb,$mw$الوسيط هو القيمة الثالثة بعد ترتيب خمس قيم؛ نحدد حداً أعلى ونثبت إمكان بلوغه.

$m=x_{(3)}$

1. هناك ثلاث قيم لا تزيد على 15، لذا لا يمكن للقيمة الثالثة في الترتيب التصاعدي أن تتجاوز 15.

2. لتحقيق هذا الحد نختار 20 لكل من البطاقتين المخفيتين.

$(4,9,15,20,20)\Rightarrow m=15$

$15$ بلا وحدة

العدد 15 يقع في الوسط بين قيمتين قبله وقيمتين بعده في المثال، وأي وسيط أكبر يستلزم وجود ثلاث قيم أكبر من 15 مع أن بطاقتين فقط مخفيتان.

أعطى أكبر قيمة ممكنة لبطاقة واحدة.$mw$,$mw$The median is the third ordered value of five; find an upper bound and show it is attainable.

$m=x_{(3)}$

1. Three values are already at most 15, so the third-smallest value cannot exceed 15.

2. To attain this bound, choose 20 for both hidden cards.

$(4,9,15,20,20)\Rightarrow m=15$

$15$ unitless

In the example 15 has two values on either side. A greater median would require three cards above 15, but only two cards are hidden.

Reports the maximum for one card.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"أي مرتبة يحتلها الوسيط بعد ترتيب خمس بطاقات؟","En":"Which rank is the median among five sorted cards?"},{"Ar":"كم قيمة معلومة لا تزيد على أكبر قيمة ظاهرة؟","En":"How many known values do not exceed the largest visible value?"}],"Solution":{"Idea":{"Ar":"الوسيط هو القيمة الثالثة بعد ترتيب خمس قيم؛ نحدد حداً أعلى ونثبت إمكان بلوغه.","En":"The median is the third ordered value of five; find an upper bound and show it is attainable."},"FormulaLatex":"m=x_{(3)}","Steps":[{"Ar":"هناك ثلاث قيم لا تزيد على 15، لذا لا يمكن للقيمة الثالثة في الترتيب التصاعدي أن تتجاوز 15.","En":"Three values are already at most 15, so the third-smallest value cannot exceed 15."},{"Ar":"لتحقيق هذا الحد نختار 20 لكل من البطاقتين المخفيتين.","En":"To attain this bound, choose 20 for both hidden cards."}],"Substitution":{"Ar":"$(4,9,15,20,20)\\Rightarrow m=15$","En":"$(4,9,15,20,20)\\Rightarrow m=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"العدد 15 يقع في الوسط بين قيمتين قبله وقيمتين بعده في المثال، وأي وسيط أكبر يستلزم وجود ثلاث قيم أكبر من 15 مع أن بطاقتين فقط مخفيتان.","En":"In the example 15 has two values on either side. A greater median would require three cards above 15, but only two cards are hidden."},"CommonError":{"Ar":"أعطى أكبر قيمة ممكنة لبطاقة واحدة.","En":"Reports the maximum for one card."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى أكبر قيمة ممكنة لبطاقة واحدة.","En":"Reports the maximum for one card."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب وسيط البطاقات الظاهرة وحدها.","En":"Takes the median of just the visible cards."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أخذ منتصف المجال من صفر إلى عشرين.","En":"Takes the midpoint of the allowed range."},"Order":4}]}$mw$),
($mw$growth-v15-grade-5-capacity-displaced-by-submerged-blocks-1$mw$,$mw$capacity-displaced-by-submerged-blocks$mw$,$mw$capacity$mw$,$mw$grade-5$mw$,5,1,82,320,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":320,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"قراءة إناء مدرّج","En":"Reading a graduated vessel"},"Question":{"Ar":"يتسع إناء مدرّج لـ1000 مل. كان مستوى الماء عند علامة 350 مل، ثم غُمِرت فيه كليّاً ثلاثة مكعبات متطابقة لا تمتص الماء فبلغ المستوى علامة 470 مل. أُضيف مكعبان مماثلان وغُمِرا كليّاً. كم مل من الماء يمكن إضافته الآن حتى يمتلئ الإناء؟","En":"A graduated vessel holds 1000 mL. The water level reads 350 mL. After three identical blocks that absorb no water are fully submerged, the level reads 470 mL. Two more identical blocks are then fully submerged. How many mL of water can now be added to fill the vessel?"},"Options":[{"LatexCode":"530","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل القراءة بعد ثلاثة مكعبات دون احتساب المكعبين الإضافيين.","En":"Uses the reading after three blocks and neglects the two extra blocks."}},{"LatexCode":"450","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"550","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى القراءة النهائية بدلاً من الحيّز المتبقي.","En":"Reports the final level instead of the available capacity."}},{"LatexCode":"650","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الماء الأصلي فقط وأغفل حيّز المكعبات.","En":"Subtracts only the original water and ignores the blocks."}}],"Hints":[{"Ar":"فرق القراءتين الأولى والثانية يمثل الحيّز الذي شغلته ثلاثة مكعبات.","En":"The difference between the first two readings is the space occupied by three blocks."},{"Ar":"احسب حيّز مكعب واحد، ثم حدّد مستوى الماء بعد إضافة المكعبين.","En":"Find the space occupied by one block, then the level after the two extra blocks are added."}],"Solution":{"Idea":{"Ar":"فرق مستوى الماء يمثل حجم الأجسام المغمورة، ونحسب الحيز المتبقي بعد إضافة الأجسام الأخرى.","En":"The change in water reading gives the submerged objects' volume; compute the remaining capacity after adding the other objects."},"FormulaLatex":"v=(L_3-L_0)/3,\\quad R=C-L_3-2v","Steps":[{"Ar":"شغلت ثلاثة مكعبات 120 مل، فشغل كل مكعب 40 مل.","En":"Three blocks displace 120 mL, so each block occupies 40 mL."},{"Ar":"يرتفع المستوى بمقدار 80 مل أخرى إلى علامة 550 مل، ونطرح ذلك من سعة الإناء.","En":"The level rises by another 80 mL to the 550 mL mark. Subtract that reading from the capacity."}],"Substitution":{"Ar":"$1000-(470+80)=450$","En":"$1000-(470+80)=450$"},"Result":{"Ar":"$450$","En":"$450$"},"Unit":{"Ar":"مل","En":"mL"},"Verification":{"Ar":"الماء الأصلي 350 مل والماء المضاف 450 مل، وتشغل المكعبات الخمسة حيّز 200 مل. المجموع 1000 مل.","En":"The original 350 mL of water, 450 mL of added water and 200 mL occupied by five blocks total 1000 mL."},"CommonError":{"Ar":"استعمل القراءة بعد ثلاثة مكعبات دون احتساب المكعبين الإضافيين.","En":"Uses the reading after three blocks and neglects the two extra blocks."}}}$mw$::jsonb,$mw$فرق مستوى الماء يمثل حجم الأجسام المغمورة، ونحسب الحيز المتبقي بعد إضافة الأجسام الأخرى.

$v=(L_3-L_0)/3,\quad R=C-L_3-2v$

1. شغلت ثلاثة مكعبات 120 مل، فشغل كل مكعب 40 مل.

2. يرتفع المستوى بمقدار 80 مل أخرى إلى علامة 550 مل، ونطرح ذلك من سعة الإناء.

$1000-(470+80)=450$

$450$ مل

الماء الأصلي 350 مل والماء المضاف 450 مل، وتشغل المكعبات الخمسة حيّز 200 مل. المجموع 1000 مل.

استعمل القراءة بعد ثلاثة مكعبات دون احتساب المكعبين الإضافيين.$mw$,$mw$The change in water reading gives the submerged objects' volume; compute the remaining capacity after adding the other objects.

$v=(L_3-L_0)/3,\quad R=C-L_3-2v$

1. Three blocks displace 120 mL, so each block occupies 40 mL.

2. The level rises by another 80 mL to the 550 mL mark. Subtract that reading from the capacity.

$1000-(470+80)=450$

$450$ mL

The original 350 mL of water, 450 mL of added water and 200 mL occupied by five blocks total 1000 mL.

Uses the reading after three blocks and neglects the two extra blocks.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"فرق القراءتين الأولى والثانية يمثل الحيّز الذي شغلته ثلاثة مكعبات.","En":"The difference between the first two readings is the space occupied by three blocks."},{"Ar":"احسب حيّز مكعب واحد، ثم حدّد مستوى الماء بعد إضافة المكعبين.","En":"Find the space occupied by one block, then the level after the two extra blocks are added."}],"Solution":{"Idea":{"Ar":"فرق مستوى الماء يمثل حجم الأجسام المغمورة، ونحسب الحيز المتبقي بعد إضافة الأجسام الأخرى.","En":"The change in water reading gives the submerged objects' volume; compute the remaining capacity after adding the other objects."},"FormulaLatex":"v=(L_3-L_0)/3,\\quad R=C-L_3-2v","Steps":[{"Ar":"شغلت ثلاثة مكعبات 120 مل، فشغل كل مكعب 40 مل.","En":"Three blocks displace 120 mL, so each block occupies 40 mL."},{"Ar":"يرتفع المستوى بمقدار 80 مل أخرى إلى علامة 550 مل، ونطرح ذلك من سعة الإناء.","En":"The level rises by another 80 mL to the 550 mL mark. Subtract that reading from the capacity."}],"Substitution":{"Ar":"$1000-(470+80)=450$","En":"$1000-(470+80)=450$"},"Result":{"Ar":"$450$","En":"$450$"},"Unit":{"Ar":"مل","En":"mL"},"Verification":{"Ar":"الماء الأصلي 350 مل والماء المضاف 450 مل، وتشغل المكعبات الخمسة حيّز 200 مل. المجموع 1000 مل.","En":"The original 350 mL of water, 450 mL of added water and 200 mL occupied by five blocks total 1000 mL."},"CommonError":{"Ar":"استعمل القراءة بعد ثلاثة مكعبات دون احتساب المكعبين الإضافيين.","En":"Uses the reading after three blocks and neglects the two extra blocks."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل القراءة بعد ثلاثة مكعبات دون احتساب المكعبين الإضافيين.","En":"Uses the reading after three blocks and neglects the two extra blocks."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى القراءة النهائية بدلاً من الحيّز المتبقي.","En":"Reports the final level instead of the available capacity."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح الماء الأصلي فقط وأغفل حيّز المكعبات.","En":"Subtracts only the original water and ignores the blocks."},"Order":4}]}$mw$),
($mw$growth-v15-grade-6-oblique-triangle-rectangle-complement-1$mw$,$mw$oblique-triangle-rectangle-complement$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"مثلث داخل بطاقة","En":"Triangle inside a card"},"Question":{"Ar":"بطاقة مستطيلة عرضها الأفقي 8 سم وارتفاعها 6 سم. رُسم مثلث رؤوسه الركن السفلي الأيسر، ونقطة على الحافة العلوية تبعد 3 سم عن اليسار، ونقطة على الحافة اليمنى ترتفع 2 سم عن الأسفل. ما مساحة المثلث؟","En":"A rectangular card is 8 cm wide and 6 cm high. A triangle joins the bottom-left corner, a point on the top edge 3 cm from the left, and a point on the right edge 2 cm above the bottom. What is the area of this triangle?"},"Options":[{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اعتبر المثلث نصف المستطيل لأن رأساً واحداً يقع في ركنه.","En":"Assumes the triangle is half the card just because one vertex is a corner."}},{"LatexCode":"27","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع المساحات المحيطة.","En":"Reports the combined area of the surrounding regions."}},{"LatexCode":"21","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"31","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح مثلثين فقط وأغفل مثلث أعلى اليمين.","En":"Subtracts only two triangles, omitting the top-right corner."}}],"Hints":[{"Ar":"ارسم البطاقة والنقاط ثم ظلّل الأجزاء الواقعة خارج المثلث.","En":"Sketch the card and its three marked points, then shade the regions outside the triangle."},{"Ar":"كل جزء مظلّل مثلث قائم ضلعاه المتعامدان على حافتي البطاقة. اطرح مساحاتها من مساحة البطاقة.","En":"Each shaded region is a right triangle with its legs along the card edges. Subtract their areas from the card area."}],"Solution":{"Idea":{"Ar":"نستعمل مساحة المستطيل ونطرح مساحات المثلثات القائمة الثلاث المحيطة بالمثلث المطلوب.","En":"Subtract the areas of the three surrounding right triangles from the rectangle's area."},"FormulaLatex":"A=wh-\\tfrac12(a_1b_1+a_2b_2+a_3b_3)","Steps":[{"Ar":"مساحة البطاقة 48 سم². المثلثان عند أعلى اليسار وأسفل اليمين مساحتاهما 3 × 6 ÷ 2 = 9 و8 × 2 ÷ 2 = 8 سم².","En":"The card covers 48 cm². The top-left and bottom-right triangles cover 3 × 6 ÷ 2 = 9 and 8 × 2 ÷ 2 = 8 cm²."},{"Ar":"ضلعا المثلث عند أعلى اليمين هما 8 − 3 = 5 و6 − 2 = 4 سم، فمساحته 10 سم². نطرح المساحات الثلاث.","En":"The top-right triangle has legs 8 − 3 = 5 and 6 − 2 = 4 cm, giving 10 cm². Subtract all three areas."}],"Substitution":{"Ar":"$48-9-8-10=21$","En":"$48-9-8-10=21$"},"Result":{"Ar":"$21$","En":"$21$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"المثلث المطلوب مع المثلثات المحيطة يملأ البطاقة: 21 + 9 + 8 + 10 = 48 سم².","En":"The central triangle and its neighbours fill the card: 21 + 9 + 8 + 10 = 48 cm²."},"CommonError":{"Ar":"اعتبر المثلث نصف المستطيل لأن رأساً واحداً يقع في ركنه.","En":"Assumes the triangle is half the card just because one vertex is a corner."}}}$mw$::jsonb,$mw$نستعمل مساحة المستطيل ونطرح مساحات المثلثات القائمة الثلاث المحيطة بالمثلث المطلوب.

$A=wh-\tfrac12(a_1b_1+a_2b_2+a_3b_3)$

1. مساحة البطاقة 48 سم². المثلثان عند أعلى اليسار وأسفل اليمين مساحتاهما 3 × 6 ÷ 2 = 9 و8 × 2 ÷ 2 = 8 سم².

2. ضلعا المثلث عند أعلى اليمين هما 8 − 3 = 5 و6 − 2 = 4 سم، فمساحته 10 سم². نطرح المساحات الثلاث.

$48-9-8-10=21$

$21$ سم²

المثلث المطلوب مع المثلثات المحيطة يملأ البطاقة: 21 + 9 + 8 + 10 = 48 سم².

اعتبر المثلث نصف المستطيل لأن رأساً واحداً يقع في ركنه.$mw$,$mw$Subtract the areas of the three surrounding right triangles from the rectangle's area.

$A=wh-\tfrac12(a_1b_1+a_2b_2+a_3b_3)$

1. The card covers 48 cm². The top-left and bottom-right triangles cover 3 × 6 ÷ 2 = 9 and 8 × 2 ÷ 2 = 8 cm².

2. The top-right triangle has legs 8 − 3 = 5 and 6 − 2 = 4 cm, giving 10 cm². Subtract all three areas.

$48-9-8-10=21$

$21$ cm²

The central triangle and its neighbours fill the card: 21 + 9 + 8 + 10 = 48 cm².

Assumes the triangle is half the card just because one vertex is a corner.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"ارسم البطاقة والنقاط ثم ظلّل الأجزاء الواقعة خارج المثلث.","En":"Sketch the card and its three marked points, then shade the regions outside the triangle."},{"Ar":"كل جزء مظلّل مثلث قائم ضلعاه المتعامدان على حافتي البطاقة. اطرح مساحاتها من مساحة البطاقة.","En":"Each shaded region is a right triangle with its legs along the card edges. Subtract their areas from the card area."}],"Solution":{"Idea":{"Ar":"نستعمل مساحة المستطيل ونطرح مساحات المثلثات القائمة الثلاث المحيطة بالمثلث المطلوب.","En":"Subtract the areas of the three surrounding right triangles from the rectangle's area."},"FormulaLatex":"A=wh-\\tfrac12(a_1b_1+a_2b_2+a_3b_3)","Steps":[{"Ar":"مساحة البطاقة 48 سم². المثلثان عند أعلى اليسار وأسفل اليمين مساحتاهما 3 × 6 ÷ 2 = 9 و8 × 2 ÷ 2 = 8 سم².","En":"The card covers 48 cm². The top-left and bottom-right triangles cover 3 × 6 ÷ 2 = 9 and 8 × 2 ÷ 2 = 8 cm²."},{"Ar":"ضلعا المثلث عند أعلى اليمين هما 8 − 3 = 5 و6 − 2 = 4 سم، فمساحته 10 سم². نطرح المساحات الثلاث.","En":"The top-right triangle has legs 8 − 3 = 5 and 6 − 2 = 4 cm, giving 10 cm². Subtract all three areas."}],"Substitution":{"Ar":"$48-9-8-10=21$","En":"$48-9-8-10=21$"},"Result":{"Ar":"$21$","En":"$21$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"المثلث المطلوب مع المثلثات المحيطة يملأ البطاقة: 21 + 9 + 8 + 10 = 48 سم².","En":"The central triangle and its neighbours fill the card: 21 + 9 + 8 + 10 = 48 cm²."},"CommonError":{"Ar":"اعتبر المثلث نصف المستطيل لأن رأساً واحداً يقع في ركنه.","En":"Assumes the triangle is half the card just because one vertex is a corner."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اعتبر المثلث نصف المستطيل لأن رأساً واحداً يقع في ركنه.","En":"Assumes the triangle is half the card just because one vertex is a corner."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع المساحات المحيطة.","En":"Reports the combined area of the surrounding regions."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح مثلثين فقط وأغفل مثلث أعلى اليمين.","En":"Subtracts only two triangles, omitting the top-right corner."},"Order":4}]}$mw$),
($mw$growth-v15-grade-6-minimum-overlap-of-percentage-groups-1$mw$,$mw$minimum-overlap-of-percentage-groups$mw$,$mw$p-fractions-decimals-basic-percentages$mw$,$mw$grade-6$mw$,6,1,21,93,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":93,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"طلاب في ناديين","En":"Students in two clubs"},"Question":{"Ar":"في صف فيه 40 طالباً، اشترك 70% منهم في نادي الرسم و55% في نادي القراءة. يمكن للطالب أن يشترك في الناديين. ما أقل عدد ممكن للطلاب المشتركين في كليهما؟","En":"In a class of 40, 70% of the students join the art club and 55% join the reading club. Students may join both. What is the smallest possible number belonging to both clubs?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح عددي أعضاء الناديين.","En":"Subtracts the two club sizes."}},{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن نادي القراءة بالكامل داخل نادي الرسم، وهو أكبر تداخل ممكن.","En":"Places all reading members in art, giving the maximum overlap."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض إمكان الفصل بين الناديين مع أن مجموع العضويتين يتجاوز عدد طلاب الصف.","En":"Assumes disjoint membership even though memberships exceed the class size."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب عدد طلاب نادي الرسم، ثم عدد مَن هم خارج هذا النادي.","En":"Find the art club membership and then the number outside the art club."},{"Ar":"حتى تقلّل الاشتراك المزدوج، حاول أن تضع أكبر عدد ممكن من طلاب القراءة خارج نادي الرسم.","En":"To minimize double membership, put as many reading club members as possible outside the art club."}],"Solution":{"Idea":{"Ar":"لتصغير التداخل نضع أكبر عدد ممكن من أعضاء النادي الثاني خارج النادي الأول.","En":"Minimize overlap by placing as many members of the second club as possible outside the first club."},"FormulaLatex":"n_{\\min}=\\max(0,A+B-N)","Steps":[{"Ar":"حوّل النسب إلى أعداد: $A=40\\times0.70=28$ و$B=40\\times0.55=22$.","En":"Convert the percentages to counts: $A=40\\times0.70=28$ and $B=40\\times0.55=22$."},{"Ar":"في الرسم 28 طالباً، فيبقى 12 خارجه. وفي القراءة 22 طالباً.","En":"There are 28 art club members and 12 students outside it. The reading club has 22 members."},{"Ar":"حتى لو اشترك الاثنا عشر جميعهم في القراءة يبقى عشرة من طلاب القراءة يجب أن يكونوا في الرسم أيضاً.","En":"Even if all twelve outside art join reading, ten reading members must also be in art."}],"Substitution":{"Ar":"$22-(40-28)=10$","En":"$22-(40-28)=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"طلاب","En":"students"},"Verification":{"Ar":"يمكن توزيع الطلاب إلى 18 في الرسم وحده و12 في القراءة وحدها و10 في الناديين. بذلك تتحقق النسب ويبلغ المجموع 40.","En":"A split of 18 in art only, 12 in reading only and 10 in both realizes the two percentages and totals 40 students."},"CommonError":{"Ar":"طرح عددي أعضاء الناديين.","En":"Subtracts the two club sizes."}}}$mw$::jsonb,$mw$لتصغير التداخل نضع أكبر عدد ممكن من أعضاء النادي الثاني خارج النادي الأول.

$n_{\min}=\max(0,A+B-N)$

1. حوّل النسب إلى أعداد: $A=40\times0.70=28$ و$B=40\times0.55=22$.

2. في الرسم 28 طالباً، فيبقى 12 خارجه. وفي القراءة 22 طالباً.

3. حتى لو اشترك الاثنا عشر جميعهم في القراءة يبقى عشرة من طلاب القراءة يجب أن يكونوا في الرسم أيضاً.

$22-(40-28)=10$

$10$ طلاب

يمكن توزيع الطلاب إلى 18 في الرسم وحده و12 في القراءة وحدها و10 في الناديين. بذلك تتحقق النسب ويبلغ المجموع 40.

طرح عددي أعضاء الناديين.$mw$,$mw$Minimize overlap by placing as many members of the second club as possible outside the first club.

$n_{\min}=\max(0,A+B-N)$

1. Convert the percentages to counts: $A=40\times0.70=28$ and $B=40\times0.55=22$.

2. There are 28 art club members and 12 students outside it. The reading club has 22 members.

3. Even if all twelve outside art join reading, ten reading members must also be in art.

$22-(40-28)=10$

$10$ students

A split of 18 in art only, 12 in reading only and 10 in both realizes the two percentages and totals 40 students.

Subtracts the two club sizes.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"احسب عدد طلاب نادي الرسم، ثم عدد مَن هم خارج هذا النادي.","En":"Find the art club membership and then the number outside the art club."},{"Ar":"حتى تقلّل الاشتراك المزدوج، حاول أن تضع أكبر عدد ممكن من طلاب القراءة خارج نادي الرسم.","En":"To minimize double membership, put as many reading club members as possible outside the art club."}],"Solution":{"Idea":{"Ar":"لتصغير التداخل نضع أكبر عدد ممكن من أعضاء النادي الثاني خارج النادي الأول.","En":"Minimize overlap by placing as many members of the second club as possible outside the first club."},"FormulaLatex":"n_{\\min}=\\max(0,A+B-N)","Steps":[{"Ar":"حوّل النسب إلى أعداد: $A=40\\times0.70=28$ و$B=40\\times0.55=22$.","En":"Convert the percentages to counts: $A=40\\times0.70=28$ and $B=40\\times0.55=22$."},{"Ar":"في الرسم 28 طالباً، فيبقى 12 خارجه. وفي القراءة 22 طالباً.","En":"There are 28 art club members and 12 students outside it. The reading club has 22 members."},{"Ar":"حتى لو اشترك الاثنا عشر جميعهم في القراءة يبقى عشرة من طلاب القراءة يجب أن يكونوا في الرسم أيضاً.","En":"Even if all twelve outside art join reading, ten reading members must also be in art."}],"Substitution":{"Ar":"$22-(40-28)=10$","En":"$22-(40-28)=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"طلاب","En":"students"},"Verification":{"Ar":"يمكن توزيع الطلاب إلى 18 في الرسم وحده و12 في القراءة وحدها و10 في الناديين. بذلك تتحقق النسب ويبلغ المجموع 40.","En":"A split of 18 in art only, 12 in reading only and 10 in both realizes the two percentages and totals 40 students."},"CommonError":{"Ar":"طرح عددي أعضاء الناديين.","En":"Subtracts the two club sizes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح عددي أعضاء الناديين.","En":"Subtracts the two club sizes."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن نادي القراءة بالكامل داخل نادي الرسم، وهو أكبر تداخل ممكن.","En":"Places all reading members in art, giving the maximum overlap."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"افترض إمكان الفصل بين الناديين مع أن مجموع العضويتين يتجاوز عدد طلاب الصف.","En":"Assumes disjoint membership even though memberships exceed the class size."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v15-grade-7-wheel-visit-cycle-1$mw$,$mw$wheel-visit-cycle$mw$,$mw$middle-gcd$mw$,$mw$grade-7$mw$,7,2,5,22,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":22,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"المواضع التي يزورها المؤشّر","En":"Positions visited by a pointer"},"Question":{"Ar":"لعجلة 18 موضعاً مرقّماً من 0 إلى 17. يبدأ المؤشّر عند 0، وفي كل نقلة يتقدّم ستة مواضع في الاتجاه نفسه. كم موضعاً مختلفاً يزوره، بما في ذلك البداية، قبل أن يعيد زيارة موضع سبق أن زاره؟","En":"A wheel has 18 positions numbered 0 through 17. A pointer starts at 0 and advances six positions in the same direction each turn. How many distinct positions, including the start, does it visit before its first repeat?"},"Options":[{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أسقط موضع البداية من العدّ.","En":"Leaves the starting position out."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ العودة إلى الصفر كزيارة لموضع جديد.","En":"Counts the return to zero as a new position."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم طول الخطوة عدداً للمواضع المختلفة.","En":"Uses the step size as the count of distinct positions."}}],"Hints":[{"Ar":"بعد اجتياز الموضع 17 يأتي الموضع 0 مجدداً.","En":"After position 17 comes position 0 again."},{"Ar":"ابحث عن أصغر مضاعف موجب للخطوة يكمل عدداً صحيحاً من الدورات.","En":"Look for the first positive multiple of the step that completes a whole number of revolutions."}],"Solution":{"Idea":{"Ar":"نتتبع مواضع المؤشر حتى يعود إلى نقطة البداية؛ عدد المواضع قبل التكرار هو طول الدورة.","En":"Track positions until the pointer returns to the start; the distinct count is the cycle length."},"FormulaLatex":"p_j=6j\\pmod{18}","Steps":[{"Ar":"ابدأ عند 0، وبعد النقلة الأولى يصل المؤشر إلى 6، وبعد الثانية إلى 12.","En":"Start at 0; the first move reaches 6 and the second reaches 12."},{"Ar":"بعد النقلة الثالثة يصبح مجموع التقدم 18، فيعود إلى 0. المواضع المختلفة هي 0 و6 و12.","En":"The third move totals 18 steps and returns to 0. The distinct positions are 0, 6, and 12."}],"Substitution":{"Ar":"$18\\div6=3$","En":"$18\\div6=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"مواضع","En":"positions"},"Verification":{"Ar":"تسلسل المواضع هو 0، 6، 12، ثم 0. الموضع الأخير مكرّر.","En":"The sequence is 0, 6, 12, then 0. The last position repeats."},"CommonError":{"Ar":"أسقط موضع البداية من العدّ.","En":"Leaves the starting position out."}}}$mw$::jsonb,$mw$نتتبع مواضع المؤشر حتى يعود إلى نقطة البداية؛ عدد المواضع قبل التكرار هو طول الدورة.

$p_j=6j\pmod{18}$

1. ابدأ عند 0، وبعد النقلة الأولى يصل المؤشر إلى 6، وبعد الثانية إلى 12.

2. بعد النقلة الثالثة يصبح مجموع التقدم 18، فيعود إلى 0. المواضع المختلفة هي 0 و6 و12.

$18\div6=3$

$3$ مواضع

تسلسل المواضع هو 0، 6، 12، ثم 0. الموضع الأخير مكرّر.

أسقط موضع البداية من العدّ.$mw$,$mw$Track positions until the pointer returns to the start; the distinct count is the cycle length.

$p_j=6j\pmod{18}$

1. Start at 0; the first move reaches 6 and the second reaches 12.

2. The third move totals 18 steps and returns to 0. The distinct positions are 0, 6, and 12.

$18\div6=3$

$3$ positions

The sequence is 0, 6, 12, then 0. The last position repeats.

Leaves the starting position out.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"بعد اجتياز الموضع 17 يأتي الموضع 0 مجدداً.","En":"After position 17 comes position 0 again."},{"Ar":"ابحث عن أصغر مضاعف موجب للخطوة يكمل عدداً صحيحاً من الدورات.","En":"Look for the first positive multiple of the step that completes a whole number of revolutions."}],"Solution":{"Idea":{"Ar":"نتتبع مواضع المؤشر حتى يعود إلى نقطة البداية؛ عدد المواضع قبل التكرار هو طول الدورة.","En":"Track positions until the pointer returns to the start; the distinct count is the cycle length."},"FormulaLatex":"p_j=6j\\pmod{18}","Steps":[{"Ar":"ابدأ عند 0، وبعد النقلة الأولى يصل المؤشر إلى 6، وبعد الثانية إلى 12.","En":"Start at 0; the first move reaches 6 and the second reaches 12."},{"Ar":"بعد النقلة الثالثة يصبح مجموع التقدم 18، فيعود إلى 0. المواضع المختلفة هي 0 و6 و12.","En":"The third move totals 18 steps and returns to 0. The distinct positions are 0, 6, and 12."}],"Substitution":{"Ar":"$18\\div6=3$","En":"$18\\div6=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"مواضع","En":"positions"},"Verification":{"Ar":"تسلسل المواضع هو 0، 6، 12، ثم 0. الموضع الأخير مكرّر.","En":"The sequence is 0, 6, 12, then 0. The last position repeats."},"CommonError":{"Ar":"أسقط موضع البداية من العدّ.","En":"Leaves the starting position out."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أسقط موضع البداية من العدّ.","En":"Leaves the starting position out."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدّ العودة إلى الصفر كزيارة لموضع جديد.","En":"Counts the return to zero as a new position."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استخدم طول الخطوة عدداً للمواضع المختلفة.","En":"Uses the step size as the count of distinct positions."},"Order":4}]}$mw$),
($mw$growth-v15-grade-7-strict-fare-crossover-1$mw$,$mw$strict-fare-crossover$mw$,$mw$inequality-contexts$mw$,$mw$grade-7$mw$,7,2,84,325,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":325,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أول عدد رحلات يوفّر المال","En":"First ride count that saves money"},"Question":{"Ar":"تكلف تذكرة الرحلة 5 ريالات دون بطاقة. وتكلف البطاقة 18 ريالاً، ثم يدفع حاملها ريالين عن كل رحلة. ما أقل عدد صحيح من الرحلات يجعل شراء البطاقة أوفر فعلاً من الدفع دونها؟","En":"Without a pass, each ride costs 5 riyals. A pass costs 18 riyals upfront plus 2 per ride. What is the smallest whole number of rides for which buying the pass costs strictly less?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اعتبر التعادل وفراً.","En":"Counts break-even as saving money."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قارن ثمن البطاقة وحده بكلفة الرحلات العادية وأغفل الريالين لكل رحلة.","En":"Compares the pass fee alone against regular fares and omits its per-ride charge."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم ثمن البطاقة على أجرة الرحلة المخفّضة بدلاً من مقدار التوفير.","En":"Divides the pass price by the discounted fare instead of the savings per ride."}}],"Hints":[{"Ar":"اكتب كلفة كل اختيار لعدد رحلات واحد متغيّر.","En":"Write both costs using the same variable for the number of rides."},{"Ar":"يجب أن يتجاوز التوفير المتراكم من الرحلات ثمن البطاقة.","En":"The savings accumulated on the rides must exceed the upfront pass price."}],"Solution":{"Idea":{"Ar":"نقارن الكلفتين عند عدد الرحلات نفسه، ونبحث عن أصغر عدد صحيح يجعل كلفة البطاقة أقل فعلاً.","En":"Compare costs for the same number of rides and find the first integer at which the pass is strictly cheaper."},"FormulaLatex":"18+2n<5n,\\quad n\\in\\mathbb{Z}_{\\ge0}","Steps":[{"Ar":"يوفّر حامل البطاقة 3 ريالات لكل رحلة بعد دفع 18 ريالاً في البداية.","En":"After the upfront 18 riyals, the pass saves 3 riyals per ride."},{"Ar":"تتساوى الكلفتان عند 6 رحلات. أول عدد صحيح يحقق وفراً هو العدد التالي.","En":"The costs are equal at 6 rides. The first whole number producing savings is the next one."},{"Ar":"بحل المتباينة نجد $n>6$، وأصغر عدد صحيح يحققها هو 7.","En":"Solving gives $n>6$; the smallest integer satisfying it is 7."}],"Substitution":{"Ar":"$n>18/3=6$","En":"$n>18/3=6$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"رحلات","En":"rides"},"Verification":{"Ar":"عند 7 رحلات تصبح كلفة البطاقة 32 ريالاً مقابل 35. عند 6 تكون الكلفتان 30.","En":"At 7 rides the pass costs 32 versus 35. At 6 both cost 30."},"CommonError":{"Ar":"اعتبر التعادل وفراً.","En":"Counts break-even as saving money."}}}$mw$::jsonb,$mw$نقارن الكلفتين عند عدد الرحلات نفسه، ونبحث عن أصغر عدد صحيح يجعل كلفة البطاقة أقل فعلاً.

$18+2n<5n,\quad n\in\mathbb{Z}_{\ge0}$

1. يوفّر حامل البطاقة 3 ريالات لكل رحلة بعد دفع 18 ريالاً في البداية.

2. تتساوى الكلفتان عند 6 رحلات. أول عدد صحيح يحقق وفراً هو العدد التالي.

3. بحل المتباينة نجد $n>6$، وأصغر عدد صحيح يحققها هو 7.

$n>18/3=6$

$7$ رحلات

عند 7 رحلات تصبح كلفة البطاقة 32 ريالاً مقابل 35. عند 6 تكون الكلفتان 30.

اعتبر التعادل وفراً.$mw$,$mw$Compare costs for the same number of rides and find the first integer at which the pass is strictly cheaper.

$18+2n<5n,\quad n\in\mathbb{Z}_{\ge0}$

1. After the upfront 18 riyals, the pass saves 3 riyals per ride.

2. The costs are equal at 6 rides. The first whole number producing savings is the next one.

3. Solving gives $n>6$; the smallest integer satisfying it is 7.

$n>18/3=6$

$7$ rides

At 7 rides the pass costs 32 versus 35. At 6 both cost 30.

Counts break-even as saving money.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"اكتب كلفة كل اختيار لعدد رحلات واحد متغيّر.","En":"Write both costs using the same variable for the number of rides."},{"Ar":"يجب أن يتجاوز التوفير المتراكم من الرحلات ثمن البطاقة.","En":"The savings accumulated on the rides must exceed the upfront pass price."}],"Solution":{"Idea":{"Ar":"نقارن الكلفتين عند عدد الرحلات نفسه، ونبحث عن أصغر عدد صحيح يجعل كلفة البطاقة أقل فعلاً.","En":"Compare costs for the same number of rides and find the first integer at which the pass is strictly cheaper."},"FormulaLatex":"18+2n<5n,\\quad n\\in\\mathbb{Z}_{\\ge0}","Steps":[{"Ar":"يوفّر حامل البطاقة 3 ريالات لكل رحلة بعد دفع 18 ريالاً في البداية.","En":"After the upfront 18 riyals, the pass saves 3 riyals per ride."},{"Ar":"تتساوى الكلفتان عند 6 رحلات. أول عدد صحيح يحقق وفراً هو العدد التالي.","En":"The costs are equal at 6 rides. The first whole number producing savings is the next one."},{"Ar":"بحل المتباينة نجد $n>6$، وأصغر عدد صحيح يحققها هو 7.","En":"Solving gives $n>6$; the smallest integer satisfying it is 7."}],"Substitution":{"Ar":"$n>18/3=6$","En":"$n>18/3=6$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"رحلات","En":"rides"},"Verification":{"Ar":"عند 7 رحلات تصبح كلفة البطاقة 32 ريالاً مقابل 35. عند 6 تكون الكلفتان 30.","En":"At 7 rides the pass costs 32 versus 35. At 6 both cost 30."},"CommonError":{"Ar":"اعتبر التعادل وفراً.","En":"Counts break-even as saving money."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اعتبر التعادل وفراً.","En":"Counts break-even as saving money."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قارن ثمن البطاقة وحده بكلفة الرحلات العادية وأغفل الريالين لكل رحلة.","En":"Compares the pass fee alone against regular fares and omits its per-ride charge."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسم ثمن البطاقة على أجرة الرحلة المخفّضة بدلاً من مقدار التوفير.","En":"Divides the pass price by the discounted fare instead of the savings per ride."},"Order":4}]}$mw$),
($mw$growth-v15-grade-8-subtract-nested-running-counts-1$mw$,$mw$subtract-nested-running-counts$mw$,$mw$frequency$mw$,$mw$grade-8$mw$,8,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أزمنة تقع بين حدّين","En":"Times between two cutoffs"},"Question":{"Ar":"في سباق شارك فيه 40 عدّاءً. أنهى 11 منهم السباق في 12 دقيقة أو أقل، وأنهاه 29 في 16 دقيقة أو أقل. كم عدّاءً استغرق أكثر من 12 دقيقة وبحدّ أقصى 16 دقيقة؟","En":"In a race with 40 runners, 11 finished in 12 minutes or less, and 29 finished in 16 minutes or less. How many took more than 12 minutes but no more than 16?"},"Options":[{"LatexCode":"29","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أبقى فئة 12 دقيقة أو أقل ضمن العدد.","En":"Keeps runners finishing at or below 12 minutes."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب مَن تجاوزوا الدقيقة 16.","En":"Counts runners finishing after 16 minutes."}},{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع التكرارين التراكميين مع أن الفئة الأصغر داخلة في الكبرى.","En":"Adds the two running counts although the smaller group is included in the larger."}}],"Hints":[{"Ar":"هل العدّاء الذي أنهى في 10 دقائق محسوب في العددين؟","En":"Is a runner finishing in 10 minutes included in both counts?"},{"Ar":"ابدأ بالعدد حتى الدقيقة 16 واستبعد من أنهوا حتى الدقيقة 12.","En":"Start with the count through minute 16 and remove those who finished through minute 12."}],"Solution":{"Idea":{"Ar":"التكرار التراكمي حتى الحد الأعلى يشمل جميع القيم حتى الحد الأدنى، فنطرح التكرارين.","En":"The cumulative count at the upper limit includes all observations at or below the lower limit; subtract the two counts."},"FormulaLatex":"f_{(a,b]}=F(b)-F(a)","Steps":[{"Ar":"يتضمن العدد 29 كل العدّائين الأحد عشر الذين سجّلوا 12 دقيقة أو أقل.","En":"The 29 include all 11 runners who finished in 12 minutes or less."},{"Ar":"بطرحهم تبقى فئة الأزمنة المطلوبة، وتشمل من أنهى في الدقيقة 16 تماماً.","En":"Subtracting them leaves the desired time band, including finishes at exactly 16 minutes."}],"Substitution":{"Ar":"$29-11=18$","En":"$29-11=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"عدّاءً","En":"runners"},"Verification":{"Ar":"لدينا 11 عند الحد الأول أو قبله، و18 في الفئة، و11 بعد الدقيقة 16، فيكتمل العدد 40.","En":"There are 11 at or below the first cutoff, 18 in the band and 11 above 16 minutes, totalling 40."},"CommonError":{"Ar":"أبقى فئة 12 دقيقة أو أقل ضمن العدد.","En":"Keeps runners finishing at or below 12 minutes."}}}$mw$::jsonb,$mw$التكرار التراكمي حتى الحد الأعلى يشمل جميع القيم حتى الحد الأدنى، فنطرح التكرارين.

$f_{(a,b]}=F(b)-F(a)$

1. يتضمن العدد 29 كل العدّائين الأحد عشر الذين سجّلوا 12 دقيقة أو أقل.

2. بطرحهم تبقى فئة الأزمنة المطلوبة، وتشمل من أنهى في الدقيقة 16 تماماً.

$29-11=18$

$18$ عدّاءً

لدينا 11 عند الحد الأول أو قبله، و18 في الفئة، و11 بعد الدقيقة 16، فيكتمل العدد 40.

أبقى فئة 12 دقيقة أو أقل ضمن العدد.$mw$,$mw$The cumulative count at the upper limit includes all observations at or below the lower limit; subtract the two counts.

$f_{(a,b]}=F(b)-F(a)$

1. The 29 include all 11 runners who finished in 12 minutes or less.

2. Subtracting them leaves the desired time band, including finishes at exactly 16 minutes.

$29-11=18$

$18$ runners

There are 11 at or below the first cutoff, 18 in the band and 11 above 16 minutes, totalling 40.

Keeps runners finishing at or below 12 minutes.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"هل العدّاء الذي أنهى في 10 دقائق محسوب في العددين؟","En":"Is a runner finishing in 10 minutes included in both counts?"},{"Ar":"ابدأ بالعدد حتى الدقيقة 16 واستبعد من أنهوا حتى الدقيقة 12.","En":"Start with the count through minute 16 and remove those who finished through minute 12."}],"Solution":{"Idea":{"Ar":"التكرار التراكمي حتى الحد الأعلى يشمل جميع القيم حتى الحد الأدنى، فنطرح التكرارين.","En":"The cumulative count at the upper limit includes all observations at or below the lower limit; subtract the two counts."},"FormulaLatex":"f_{(a,b]}=F(b)-F(a)","Steps":[{"Ar":"يتضمن العدد 29 كل العدّائين الأحد عشر الذين سجّلوا 12 دقيقة أو أقل.","En":"The 29 include all 11 runners who finished in 12 minutes or less."},{"Ar":"بطرحهم تبقى فئة الأزمنة المطلوبة، وتشمل من أنهى في الدقيقة 16 تماماً.","En":"Subtracting them leaves the desired time band, including finishes at exactly 16 minutes."}],"Substitution":{"Ar":"$29-11=18$","En":"$29-11=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"عدّاءً","En":"runners"},"Verification":{"Ar":"لدينا 11 عند الحد الأول أو قبله، و18 في الفئة، و11 بعد الدقيقة 16، فيكتمل العدد 40.","En":"There are 11 at or below the first cutoff, 18 in the band and 11 above 16 minutes, totalling 40."},"CommonError":{"Ar":"أبقى فئة 12 دقيقة أو أقل ضمن العدد.","En":"Keeps runners finishing at or below 12 minutes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أبقى فئة 12 دقيقة أو أقل ضمن العدد.","En":"Keeps runners finishing at or below 12 minutes."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب مَن تجاوزوا الدقيقة 16.","En":"Counts runners finishing after 16 minutes."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع التكرارين التراكميين مع أن الفئة الأصغر داخلة في الكبرى.","En":"Adds the two running counts although the smaller group is included in the larger."},"Order":4}]}$mw$),
($mw$growth-v15-grade-8-reprinted-map-scale-denominator-1$mw$,$mw$reprinted-map-scale-denominator$mw$,$mw$middle-map-scale$mw$,$mw$grade-8$mw$,8,2,7,33,$mw${"StageId":2,"CategoryId":7,"PrimarySkillId":33,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"مقياس خريطة بعد تكبيرها","En":"Scale of an enlarged map"},"Question":{"Ar":"مقياس خريطة هو 1 : 60,000. كُبّرت على آلة تصوير حتى صار خطّ طوله 4 سم على الأصل بطول 6 سم على النسخة. إذا كان مقياس النسخة 1 : n، فما قيمة n؟","En":"A map has scale 1 : 60,000. A copier enlarges it so that a 4 cm line on the original is 6 cm on the copy. If the copy has scale 1 : n, what is n?"},"Options":[{"LatexCode":"90000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب مقام المقياس بمعامل التكبير.","En":"Multiplies the denominator by the enlargement factor."}},{"LatexCode":"60000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أبقى المقياس الأصلي بعد تغيير طول الرسم.","En":"Keeps the original scale after the drawn length changes."}},{"LatexCode":"10000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم 60,000 على طول النسخة دون احتساب طول الأصل.","En":"Divides 60,000 by the copied length without using the original length."}},{"LatexCode":"40000","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"هل تتغيّر المسافة على الأرض عند تكبير الرسم؟","En":"Does enlarging the drawing change the ground distance?"},{"Ar":"احسب المسافة الحقيقية التي تمثلها السنتيمترات الأربعة، ثم وزّعها على ستة سنتيمترات.","En":"Find the ground distance represented by the original four centimetres, then distribute it over six centimetres."}],"Solution":{"Idea":{"Ar":"تكبير الخريطة لا يغير المسافة الحقيقية؛ يتغير طول الرسم ومقام المقياس عكسياً.","En":"Enlarging a map preserves the real distance; drawing length and scale denominator vary inversely."},"FormulaLatex":"L_{old}n_{old}=L_{new}n_{new}","Steps":[{"Ar":"الخط الأصلي يمثّل 240,000 سم على الأرض.","En":"The original line represents 240,000 cm on the ground."},{"Ar":"تمثّل ستة سنتيمترات على النسخة المسافة نفسها، فيمثّل كل سنتيمتر سدسها.","En":"Six centimetres on the copy represent that same ground distance, so each represents one sixth of it."}],"Substitution":{"Ar":"$4(60000)/6=40000$","En":"$4(60000)/6=40000$"},"Result":{"Ar":"$40000$","En":"$40000$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"على النسخة يمثّل 6 سم مسافة 240,000 سم عند مقام المقياس 40,000، تماماً كالأصل.","En":"With denominator 40,000, the 6 cm copy line represents 240,000 cm, as on the original."},"CommonError":{"Ar":"ضرب مقام المقياس بمعامل التكبير.","En":"Multiplies the denominator by the enlargement factor."}}}$mw$::jsonb,$mw$تكبير الخريطة لا يغير المسافة الحقيقية؛ يتغير طول الرسم ومقام المقياس عكسياً.

$L_{old}n_{old}=L_{new}n_{new}$

1. الخط الأصلي يمثّل 240,000 سم على الأرض.

2. تمثّل ستة سنتيمترات على النسخة المسافة نفسها، فيمثّل كل سنتيمتر سدسها.

$4(60000)/6=40000$

$40000$ بلا وحدة

على النسخة يمثّل 6 سم مسافة 240,000 سم عند مقام المقياس 40,000، تماماً كالأصل.

ضرب مقام المقياس بمعامل التكبير.$mw$,$mw$Enlarging a map preserves the real distance; drawing length and scale denominator vary inversely.

$L_{old}n_{old}=L_{new}n_{new}$

1. The original line represents 240,000 cm on the ground.

2. Six centimetres on the copy represent that same ground distance, so each represents one sixth of it.

$4(60000)/6=40000$

$40000$ unitless

With denominator 40,000, the 6 cm copy line represents 240,000 cm, as on the original.

Multiplies the denominator by the enlargement factor.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"هل تتغيّر المسافة على الأرض عند تكبير الرسم؟","En":"Does enlarging the drawing change the ground distance?"},{"Ar":"احسب المسافة الحقيقية التي تمثلها السنتيمترات الأربعة، ثم وزّعها على ستة سنتيمترات.","En":"Find the ground distance represented by the original four centimetres, then distribute it over six centimetres."}],"Solution":{"Idea":{"Ar":"تكبير الخريطة لا يغير المسافة الحقيقية؛ يتغير طول الرسم ومقام المقياس عكسياً.","En":"Enlarging a map preserves the real distance; drawing length and scale denominator vary inversely."},"FormulaLatex":"L_{old}n_{old}=L_{new}n_{new}","Steps":[{"Ar":"الخط الأصلي يمثّل 240,000 سم على الأرض.","En":"The original line represents 240,000 cm on the ground."},{"Ar":"تمثّل ستة سنتيمترات على النسخة المسافة نفسها، فيمثّل كل سنتيمتر سدسها.","En":"Six centimetres on the copy represent that same ground distance, so each represents one sixth of it."}],"Substitution":{"Ar":"$4(60000)/6=40000$","En":"$4(60000)/6=40000$"},"Result":{"Ar":"$40000$","En":"$40000$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"على النسخة يمثّل 6 سم مسافة 240,000 سم عند مقام المقياس 40,000، تماماً كالأصل.","En":"With denominator 40,000, the 6 cm copy line represents 240,000 cm, as on the original."},"CommonError":{"Ar":"ضرب مقام المقياس بمعامل التكبير.","En":"Multiplies the denominator by the enlargement factor."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ضرب مقام المقياس بمعامل التكبير.","En":"Multiplies the denominator by the enlargement factor."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أبقى المقياس الأصلي بعد تغيير طول الرسم.","En":"Keeps the original scale after the drawn length changes."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم 60,000 على طول النسخة دون احتساب طول الأصل.","En":"Divides 60,000 by the copied length without using the original length."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v15-grade-7-equivalent-area-single-pond-1$mw$,$mw$equivalent-area-single-pond$mw$,$mw$middle-circle-area$mw$,$mw$grade-7$mw$,7,2,8,36,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":36,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"بركة واحدة بمساحة بركتين","En":"One pond with the area of two"},"Question":{"Ar":"تريد بلدية استبدال بركتين دائريتين نصفا قطريهما 6 م و8 م ببركة دائرية واحدة لها مساحة سطح الماء الكلية نفسها. ما نصف قطر البركة الجديدة؟","En":"A town plans to replace two circular ponds of radii 6 m and 8 m with one circular pond having the same total water-surface area. What should its radius be?"},"Options":[{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع نصفي القطر مباشرة.","En":"Adds the radii directly."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ المتوسط الحسابي لنصفي القطر.","En":"Averages the two radii."}},{"LatexCode":"100","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف عند مربع نصف القطر.","En":"Stops at the squared radius."}}],"Hints":[{"Ar":"اجمع مساحتي سطحي الماء.","En":"Add the two water-surface areas."},{"Ar":"ساوِ المجموع بمساحة الدائرة الجديدة، ثم اختصر العامل المشترك π.","En":"Set the sum equal to the new circle’s area, then cancel the common factor π."}],"Solution":{"Idea":{"Ar":"نساوي مساحة الدائرة الجديدة بمجموع مساحتي الدائرتين القديمتين، ثم نوجد نصف القطر الموجب.","En":"Set the new circle's area equal to the combined old areas, then find the positive radius."},"FormulaLatex":"\\pi R^2=\\pi r_1^2+\\pi r_2^2","Steps":[{"Ar":"مجموع مساحتي البركتين هو 36π + 64π = 100π متر مربع.","En":"The pond areas total 36π + 64π = 100π square metres."},{"Ar":"مربع نصف القطر الجديد يساوي 100، ونأخذ الجذر الموجب لأنه طول.","En":"The new squared radius is 100. Take the positive square root because the radius is a length."}],"Substitution":{"Ar":"$R=\\sqrt{36+64}=10$","En":"$R=\\sqrt{36+64}=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"البركة الجديدة مساحتها 100π متر مربع. وبعد طرح 64π يبقى 36π، وهي مساحة البركة الأصغر.","En":"The new area is 100π square metres. Removing 64π leaves 36π, the smaller pond’s area."},"CommonError":{"Ar":"جمع نصفي القطر مباشرة.","En":"Adds the radii directly."}}}$mw$::jsonb,$mw$نساوي مساحة الدائرة الجديدة بمجموع مساحتي الدائرتين القديمتين، ثم نوجد نصف القطر الموجب.

$\pi R^2=\pi r_1^2+\pi r_2^2$

1. مجموع مساحتي البركتين هو 36π + 64π = 100π متر مربع.

2. مربع نصف القطر الجديد يساوي 100، ونأخذ الجذر الموجب لأنه طول.

$R=\sqrt{36+64}=10$

$10$ م

البركة الجديدة مساحتها 100π متر مربع. وبعد طرح 64π يبقى 36π، وهي مساحة البركة الأصغر.

جمع نصفي القطر مباشرة.$mw$,$mw$Set the new circle's area equal to the combined old areas, then find the positive radius.

$\pi R^2=\pi r_1^2+\pi r_2^2$

1. The pond areas total 36π + 64π = 100π square metres.

2. The new squared radius is 100. Take the positive square root because the radius is a length.

$R=\sqrt{36+64}=10$

$10$ m

The new area is 100π square metres. Removing 64π leaves 36π, the smaller pond’s area.

Adds the radii directly.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"اجمع مساحتي سطحي الماء.","En":"Add the two water-surface areas."},{"Ar":"ساوِ المجموع بمساحة الدائرة الجديدة، ثم اختصر العامل المشترك π.","En":"Set the sum equal to the new circle’s area, then cancel the common factor π."}],"Solution":{"Idea":{"Ar":"نساوي مساحة الدائرة الجديدة بمجموع مساحتي الدائرتين القديمتين، ثم نوجد نصف القطر الموجب.","En":"Set the new circle's area equal to the combined old areas, then find the positive radius."},"FormulaLatex":"\\pi R^2=\\pi r_1^2+\\pi r_2^2","Steps":[{"Ar":"مجموع مساحتي البركتين هو 36π + 64π = 100π متر مربع.","En":"The pond areas total 36π + 64π = 100π square metres."},{"Ar":"مربع نصف القطر الجديد يساوي 100، ونأخذ الجذر الموجب لأنه طول.","En":"The new squared radius is 100. Take the positive square root because the radius is a length."}],"Substitution":{"Ar":"$R=\\sqrt{36+64}=10$","En":"$R=\\sqrt{36+64}=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"البركة الجديدة مساحتها 100π متر مربع. وبعد طرح 64π يبقى 36π، وهي مساحة البركة الأصغر.","En":"The new area is 100π square metres. Removing 64π leaves 36π, the smaller pond’s area."},"CommonError":{"Ar":"جمع نصفي القطر مباشرة.","En":"Adds the radii directly."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع نصفي القطر مباشرة.","En":"Adds the radii directly."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أخذ المتوسط الحسابي لنصفي القطر.","En":"Averages the two radii."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"توقف عند مربع نصف القطر.","En":"Stops at the squared radius."},"Order":4}]}$mw$),
($mw$growth-v15-grade-9-minimum-median-grouped-integers-1$mw$,$mw$minimum-median-grouped-integers$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"أصغر وسيط تسمح به الفئات","En":"Smallest median consistent with grouped scores"},"Question":{"Ar":"سُجّلت عشر درجات صحيحة. خمس درجات بين 10 و19، وثلاث بين 20 و29، واثنتان بين 30 و39، وجميع الحدود مشمولة. ما أصغر وسيط ممكن للدرجات العشر؟","En":"Ten integer scores are grouped as follows: five between 10 and 19, three between 20 and 29, and two between 30 and 39, all endpoints included. What is the smallest possible median of the ten scores?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الموضع الخامس وحده.","En":"Uses only the fifth position."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الموضع السادس وحده.","En":"Uses only the sixth position."}},{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"19.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن أكبر درجة في الفئة الأولى لا بد أن تساوي حدّها الأعلى.","En":"Assumes the largest score in the first group must equal its upper endpoint."}}],"Hints":[{"Ar":"في قائمة مرتبة من عشر قيم، أي موضعين يحددان الوسيط؟","En":"Which two positions determine the median of ten sorted values?"},{"Ar":"حدّد فئة كل من الدرجة الخامسة والسادسة. ما أصغر قيمة ممكنة لكل منهما؟","En":"Locate the fifth and sixth scores by group. What is the smallest possible value of each?"}],"Solution":{"Idea":{"Ar":"الوسيط لعشر قيم هو متوسط المرتبتين الخامسة والسادسة؛ نبحث عن أصغر قيمتين ممكنتين لهما معاً.","En":"For ten values, the median averages positions five and six; find their jointly attainable minimum values."},"FormulaLatex":"M=(x_{(5)}+x_{(6)})/2","Steps":[{"Ar":"تقع الدرجة الخامسة في الفئة الأولى فلا تقل عن 10، والسادسة في الثانية فلا تقل عن 20.","En":"The fifth score lies in the first group and is at least 10. The sixth lies in the second and is at least 20."},{"Ar":"يمكن بلوغ الحدّين معاً بجعل جميع درجات كل فئة تساوي حدّها الأدنى، فنأخذ متوسط 10 و20.","En":"Assign every score its group minimum to attain both bounds together, then average 10 and 20."}],"Substitution":{"Ar":"$(10+20)/2=15$","En":"$(10+20)/2=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"درجة","En":"points"},"Verification":{"Ar":"القائمة 10، 10، 10، 10، 10، 20، 20، 20، 30، 30 تحقق التكرارات ووسيطها 15.","En":"The list 10, 10, 10, 10, 10, 20, 20, 20, 30, 30 has the specified counts and median 15."},"CommonError":{"Ar":"استعمل الموضع الخامس وحده.","En":"Uses only the fifth position."}}}$mw$::jsonb,$mw$الوسيط لعشر قيم هو متوسط المرتبتين الخامسة والسادسة؛ نبحث عن أصغر قيمتين ممكنتين لهما معاً.

$M=(x_{(5)}+x_{(6)})/2$

1. تقع الدرجة الخامسة في الفئة الأولى فلا تقل عن 10، والسادسة في الثانية فلا تقل عن 20.

2. يمكن بلوغ الحدّين معاً بجعل جميع درجات كل فئة تساوي حدّها الأدنى، فنأخذ متوسط 10 و20.

$(10+20)/2=15$

$15$ درجة

القائمة 10، 10، 10، 10، 10، 20، 20، 20، 30، 30 تحقق التكرارات ووسيطها 15.

استعمل الموضع الخامس وحده.$mw$,$mw$For ten values, the median averages positions five and six; find their jointly attainable minimum values.

$M=(x_{(5)}+x_{(6)})/2$

1. The fifth score lies in the first group and is at least 10. The sixth lies in the second and is at least 20.

2. Assign every score its group minimum to attain both bounds together, then average 10 and 20.

$(10+20)/2=15$

$15$ points

The list 10, 10, 10, 10, 10, 20, 20, 20, 30, 30 has the specified counts and median 15.

Uses only the fifth position.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"في قائمة مرتبة من عشر قيم، أي موضعين يحددان الوسيط؟","En":"Which two positions determine the median of ten sorted values?"},{"Ar":"حدّد فئة كل من الدرجة الخامسة والسادسة. ما أصغر قيمة ممكنة لكل منهما؟","En":"Locate the fifth and sixth scores by group. What is the smallest possible value of each?"}],"Solution":{"Idea":{"Ar":"الوسيط لعشر قيم هو متوسط المرتبتين الخامسة والسادسة؛ نبحث عن أصغر قيمتين ممكنتين لهما معاً.","En":"For ten values, the median averages positions five and six; find their jointly attainable minimum values."},"FormulaLatex":"M=(x_{(5)}+x_{(6)})/2","Steps":[{"Ar":"تقع الدرجة الخامسة في الفئة الأولى فلا تقل عن 10، والسادسة في الثانية فلا تقل عن 20.","En":"The fifth score lies in the first group and is at least 10. The sixth lies in the second and is at least 20."},{"Ar":"يمكن بلوغ الحدّين معاً بجعل جميع درجات كل فئة تساوي حدّها الأدنى، فنأخذ متوسط 10 و20.","En":"Assign every score its group minimum to attain both bounds together, then average 10 and 20."}],"Substitution":{"Ar":"$(10+20)/2=15$","En":"$(10+20)/2=15$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"درجة","En":"points"},"Verification":{"Ar":"القائمة 10، 10، 10، 10، 10، 20، 20، 20، 30، 30 تحقق التكرارات ووسيطها 15.","En":"The list 10, 10, 10, 10, 10, 20, 20, 20, 30, 30 has the specified counts and median 15."},"CommonError":{"Ar":"استعمل الموضع الخامس وحده.","En":"Uses only the fifth position."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل الموضع الخامس وحده.","En":"Uses only the fifth position."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الموضع السادس وحده.","En":"Uses only the sixth position."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن أكبر درجة في الفئة الأولى لا بد أن تساوي حدّها الأعلى.","En":"Assumes the largest score in the first group must equal its upper endpoint."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v15/v16/v18 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
