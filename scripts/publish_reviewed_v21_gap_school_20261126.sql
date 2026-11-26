-- One-time owner-authorized import AND publication of original v21 linked gap tasks.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v21-grade-1-remove-two-distinct-groups-1$mw$,$mw$remove-two-distinct-groups$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إزالة مجموعتين","En":"Removing two groups"},"Question":{"Ar":"على الطاولة 17 بطاقة. وضعت ريم 3 بطاقات في حقيبة و4 بطاقات أخرى في صندوق. كم بطاقة بقيت على الطاولة؟","En":"There are 17 cards on a table. Reem puts 3 cards into a bag and 4 other cards into a box. How many cards remain on the table?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح بطاقات الحقيبة فقط.","En":"Subtracts only the bag cards."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح بطاقات الصندوق فقط.","En":"Subtracts only the box cards."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب العدد الذي غادر لا العدد الباقي.","En":"Counts the removed cards rather than the remainder."}}],"Hints":[{"Ar":"احسب البطاقات التي غادرت الطاولة في المرتين.","En":"Count the cards removed on both occasions."},{"Ar":"اطرح مجموع البطاقات التي غادرت من العدد الأصلي.","En":"Subtract the total removed from the original count."}],"Solution":{"Idea":{"Ar":"نطرح من العدد الأصلي مجموع المجموعتين اللتين غادرتا الطاولة، ولا نعدّ بطاقة مرتين.","En":"Subtract the combined count of the two disjoint removed groups from the initial count."},"FormulaLatex":"17-(3+4)","Steps":[{"Ar":"غادرت الطاولة $3+4=7$ بطاقات.","En":"A total of $3+4=7$ cards left the table."},{"Ar":"نطرح البطاقات السبع من العدد الأصلي.","En":"Subtract those seven from the initial count."}],"Substitution":{"Ar":"$17-7=10$","En":"$17-7=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"بطاقات","En":"cards"},"Verification":{"Ar":"بإعادة البطاقات السبع إلى العشر نصل إلى 17.","En":"Returning seven cards to the ten restores the original 17."},"CommonError":{"Ar":"طرح بطاقات الحقيبة فقط.","En":"Subtracts only the bag cards."}}}$mw$::jsonb,$mw$نطرح من العدد الأصلي مجموع المجموعتين اللتين غادرتا الطاولة، ولا نعدّ بطاقة مرتين.

$17-(3+4)$

1. غادرت الطاولة $3+4=7$ بطاقات.

2. نطرح البطاقات السبع من العدد الأصلي.

$17-7=10$

$10$ بطاقات

بإعادة البطاقات السبع إلى العشر نصل إلى 17.

طرح بطاقات الحقيبة فقط.$mw$,$mw$Subtract the combined count of the two disjoint removed groups from the initial count.

$17-(3+4)$

1. A total of $3+4=7$ cards left the table.

2. Subtract those seven from the initial count.

$17-7=10$

$10$ cards

Returning seven cards to the ten restores the original 17.

Subtracts only the bag cards.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب البطاقات التي غادرت الطاولة في المرتين.","En":"Count the cards removed on both occasions."},{"Ar":"اطرح مجموع البطاقات التي غادرت من العدد الأصلي.","En":"Subtract the total removed from the original count."}],"Solution":{"Idea":{"Ar":"نطرح من العدد الأصلي مجموع المجموعتين اللتين غادرتا الطاولة، ولا نعدّ بطاقة مرتين.","En":"Subtract the combined count of the two disjoint removed groups from the initial count."},"FormulaLatex":"17-(3+4)","Steps":[{"Ar":"غادرت الطاولة $3+4=7$ بطاقات.","En":"A total of $3+4=7$ cards left the table."},{"Ar":"نطرح البطاقات السبع من العدد الأصلي.","En":"Subtract those seven from the initial count."}],"Substitution":{"Ar":"$17-7=10$","En":"$17-7=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"بطاقات","En":"cards"},"Verification":{"Ar":"بإعادة البطاقات السبع إلى العشر نصل إلى 17.","En":"Returning seven cards to the ten restores the original 17."},"CommonError":{"Ar":"طرح بطاقات الحقيبة فقط.","En":"Subtracts only the bag cards."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح بطاقات الحقيبة فقط.","En":"Subtracts only the bag cards."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح بطاقات الصندوق فقط.","En":"Subtracts only the box cards."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب العدد الذي غادر لا العدد الباقي.","En":"Counts the removed cards rather than the remainder."},"Order":4}]}$mw$),
($mw$growth-v21-grade-1-zero-removal-conservation-1$mw$,$mw$zero-removal-conservation$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"لم يُؤخذ شيء","En":"Nothing removed"},"Question":{"Ar":"في طبق 9 حبات فاكهة. لم يأخذ أحد أي حبة منه. كم حبة في الطبق الآن؟","En":"A plate holds 9 pieces of fruit. Nobody takes any fruit from it. How many pieces are on the plate now?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خلط بين العدد المأخوذ والعدد الباقي.","En":"Confuses removed count with remaining count."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أخذ حبة رغم عدم أخذ شيء.","En":"Assumes one was removed although none were taken."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف حبة من غير أن يذكر السؤال إضافة.","En":"Adds one although no addition occurred."}}],"Hints":[{"Ar":"هل خرجت أي حبة من الطبق؟","En":"Did any piece leave the plate?"},{"Ar":"ما العملية التي تمثل أخذ صفر من العدد؟","En":"Which operation represents taking zero away?"}],"Solution":{"Idea":{"Ar":"طرح الصفر يحافظ على العدد الأصلي لأن أي عنصر لم يغادر.","En":"Subtracting zero preserves the original count because no object has left."},"FormulaLatex":"9-0","Steps":[{"Ar":"عدد الحبات التي أُخذت هو صفر.","En":"The number removed is zero."},{"Ar":"طرح الصفر لا يغيّر العدد.","En":"Subtracting zero leaves the count unchanged."}],"Substitution":{"Ar":"$9-0=9$","En":"$9-0=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"حبات","En":"pieces"},"Verification":{"Ar":"تظل الحبات التسع في الطبق، فلا يوجد شيء مفقود.","En":"All nine pieces remain on the plate."},"CommonError":{"Ar":"خلط بين العدد المأخوذ والعدد الباقي.","En":"Confuses removed count with remaining count."}}}$mw$::jsonb,$mw$طرح الصفر يحافظ على العدد الأصلي لأن أي عنصر لم يغادر.

$9-0$

1. عدد الحبات التي أُخذت هو صفر.

2. طرح الصفر لا يغيّر العدد.

$9-0=9$

$9$ حبات

تظل الحبات التسع في الطبق، فلا يوجد شيء مفقود.

خلط بين العدد المأخوذ والعدد الباقي.$mw$,$mw$Subtracting zero preserves the original count because no object has left.

$9-0$

1. The number removed is zero.

2. Subtracting zero leaves the count unchanged.

$9-0=9$

$9$ pieces

All nine pieces remain on the plate.

Confuses removed count with remaining count.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"هل خرجت أي حبة من الطبق؟","En":"Did any piece leave the plate?"},{"Ar":"ما العملية التي تمثل أخذ صفر من العدد؟","En":"Which operation represents taking zero away?"}],"Solution":{"Idea":{"Ar":"طرح الصفر يحافظ على العدد الأصلي لأن أي عنصر لم يغادر.","En":"Subtracting zero preserves the original count because no object has left."},"FormulaLatex":"9-0","Steps":[{"Ar":"عدد الحبات التي أُخذت هو صفر.","En":"The number removed is zero."},{"Ar":"طرح الصفر لا يغيّر العدد.","En":"Subtracting zero leaves the count unchanged."}],"Substitution":{"Ar":"$9-0=9$","En":"$9-0=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"حبات","En":"pieces"},"Verification":{"Ar":"تظل الحبات التسع في الطبق، فلا يوجد شيء مفقود.","En":"All nine pieces remain on the plate."},"CommonError":{"Ar":"خلط بين العدد المأخوذ والعدد الباقي.","En":"Confuses removed count with remaining count."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خلط بين العدد المأخوذ والعدد الباقي.","En":"Confuses removed count with remaining count."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"افترض أخذ حبة رغم عدم أخذ شيء.","En":"Assumes one was removed although none were taken."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف حبة من غير أن يذكر السؤال إضافة.","En":"Adds one although no addition occurred."},"Order":4}]}$mw$),
($mw$growth-v21-grade-1-ordinal-object-replacement-position-1$mw$,$mw$ordinal-object-replacement-position$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"موضع بعد تغيير الدور","En":"Position after a change"},"Question":{"Ar":"في طابور من 8 أطفال، يقف سامر في المكان الخامس من الأمام. غادر الطفل الذي في المكان الثاني. ما مكان سامر الجديد من الأمام؟","En":"In a line of 8 children, Samer is fifth from the front. The child in second place leaves. What is Samer's new position from the front?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يغيّر الموضع بعد مغادرة طفل قبله.","En":"Leaves the position unchanged."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"زاد الموضع بدلاً من إنقاصه.","En":"Increases the position instead of decreasing it."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد من أمام سامر لا موضعه.","En":"Counts those ahead, not Samer's position."}}],"Hints":[{"Ar":"هل كان الطفل المغادر قبل سامر أم بعده؟","En":"Was the departing child ahead of or behind Samer?"},{"Ar":"عند مغادرة طفل قبله، كيف يتغير عدد الأطفال الذين يسبقونه؟","En":"How does the number ahead change when one of them leaves?"}],"Solution":{"Idea":{"Ar":"يتحدد موضع الشخص بعدد من يسبقونه مضافاً إليه واحد؛ مغادرة شخص سابق تنقص الموضع واحداً.","En":"Position equals the number ahead plus one; removing an earlier person decreases the position by one."},"FormulaLatex":"p_{\\mathrm{new}}=5-1","Steps":[{"Ar":"كان أمام سامر أربعة أطفال.","En":"Four children were ahead of Samer."},{"Ar":"بعد مغادرة أحدهم يبقى أمامه ثلاثة أطفال، ثم يأتي سامر.","En":"After one leaves, three are ahead, followed by Samer."}],"Substitution":{"Ar":"$5-1=4$","En":"$5-1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"المكان","En":"position"},"Verification":{"Ar":"في الطابور الجديد يشغل الثلاثة الأوائل الأماكن 1 و2 و3، ويأتي سامر رابعاً.","En":"In the new line, the three ahead occupy positions 1, 2 and 3, and Samer is fourth."},"CommonError":{"Ar":"لم يغيّر الموضع بعد مغادرة طفل قبله.","En":"Leaves the position unchanged."}}}$mw$::jsonb,$mw$يتحدد موضع الشخص بعدد من يسبقونه مضافاً إليه واحد؛ مغادرة شخص سابق تنقص الموضع واحداً.

$p_{\mathrm{new}}=5-1$

1. كان أمام سامر أربعة أطفال.

2. بعد مغادرة أحدهم يبقى أمامه ثلاثة أطفال، ثم يأتي سامر.

$5-1=4$

$4$ المكان

في الطابور الجديد يشغل الثلاثة الأوائل الأماكن 1 و2 و3، ويأتي سامر رابعاً.

لم يغيّر الموضع بعد مغادرة طفل قبله.$mw$,$mw$Position equals the number ahead plus one; removing an earlier person decreases the position by one.

$p_{\mathrm{new}}=5-1$

1. Four children were ahead of Samer.

2. After one leaves, three are ahead, followed by Samer.

$5-1=4$

$4$ position

In the new line, the three ahead occupy positions 1, 2 and 3, and Samer is fourth.

Leaves the position unchanged.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل كان الطفل المغادر قبل سامر أم بعده؟","En":"Was the departing child ahead of or behind Samer?"},{"Ar":"عند مغادرة طفل قبله، كيف يتغير عدد الأطفال الذين يسبقونه؟","En":"How does the number ahead change when one of them leaves?"}],"Solution":{"Idea":{"Ar":"يتحدد موضع الشخص بعدد من يسبقونه مضافاً إليه واحد؛ مغادرة شخص سابق تنقص الموضع واحداً.","En":"Position equals the number ahead plus one; removing an earlier person decreases the position by one."},"FormulaLatex":"p_{\\mathrm{new}}=5-1","Steps":[{"Ar":"كان أمام سامر أربعة أطفال.","En":"Four children were ahead of Samer."},{"Ar":"بعد مغادرة أحدهم يبقى أمامه ثلاثة أطفال، ثم يأتي سامر.","En":"After one leaves, three are ahead, followed by Samer."}],"Substitution":{"Ar":"$5-1=4$","En":"$5-1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"المكان","En":"position"},"Verification":{"Ar":"في الطابور الجديد يشغل الثلاثة الأوائل الأماكن 1 و2 و3، ويأتي سامر رابعاً.","En":"In the new line, the three ahead occupy positions 1, 2 and 3, and Samer is fourth."},"CommonError":{"Ar":"لم يغيّر الموضع بعد مغادرة طفل قبله.","En":"Leaves the position unchanged."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يغيّر الموضع بعد مغادرة طفل قبله.","En":"Leaves the position unchanged."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"زاد الموضع بدلاً من إنقاصه.","En":"Increases the position instead of decreasing it."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد من أمام سامر لا موضعه.","En":"Counts those ahead, not Samer's position."},"Order":4}]}$mw$),
($mw$growth-v21-grade-2-compare-length-via-shared-reference-1$mw$,$mw$compare-length-via-shared-reference$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة بطول مرجعي","En":"Comparing via a reference"},"Question":{"Ar":"الشريط الأحمر أطول من الشريط الأبيض بـ4 سم. الشريط الأزرق أقصر من الشريط الأبيض بـ3 سم. بكم يزيد طول الأحمر على الأزرق؟","En":"A red strip is 4 cm longer than a white strip. A blue strip is 3 cm shorter than the white strip. How much longer is the red strip than the blue strip?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الفارقين مع أن الأشرطة على جانبين مختلفين من الطول المرجعي.","En":"Subtracts the gaps despite opposite sides of the reference."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الفارق بين الأحمر والأبيض فقط.","En":"Uses only the red-white difference."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الفارق بين الأبيض والأزرق فقط.","En":"Uses only the white-blue difference."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تخيّل أن الأطراف اليسرى للأشرطة الثلاثة عند الموضع نفسه.","En":"Imagine aligning the left ends of all three strips."},{"Ar":"اجمع المسافة من نهاية الأزرق إلى نهاية الأبيض ومن الأبيض إلى الأحمر.","En":"Combine the gap from blue to white and from white to red."}],"Solution":{"Idea":{"Ar":"يقع الطول المرجعي بين الطولين الآخرين، لذلك نجمع الفرقين.","En":"The reference length lies between the two other lengths, so add the two gaps."},"FormulaLatex":"D=4+3","Steps":[{"Ar":"نهاية الأزرق تقع قبل نهاية الأبيض بثلاثة سنتيمترات.","En":"Blue ends three centimetres before white."},{"Ar":"نهاية الأحمر تقع بعد نهاية الأبيض بأربعة سنتيمترات؛ المسافتان متتاليتان.","En":"Red ends four centimetres beyond white; the two gaps are consecutive."}],"Substitution":{"Ar":"$4+3=7$","En":"$4+3=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"إذا كان الأبيض 10 سم، فالأحمر 14 والأزرق 7، وفرق الطولين 7 سم.","En":"If white is 10 cm, red is 14 and blue is 7; the difference is 7 cm."},"CommonError":{"Ar":"طرح الفارقين مع أن الأشرطة على جانبين مختلفين من الطول المرجعي.","En":"Subtracts the gaps despite opposite sides of the reference."}}}$mw$::jsonb,$mw$يقع الطول المرجعي بين الطولين الآخرين، لذلك نجمع الفرقين.

$D=4+3$

1. نهاية الأزرق تقع قبل نهاية الأبيض بثلاثة سنتيمترات.

2. نهاية الأحمر تقع بعد نهاية الأبيض بأربعة سنتيمترات؛ المسافتان متتاليتان.

$4+3=7$

$7$ سم

إذا كان الأبيض 10 سم، فالأحمر 14 والأزرق 7، وفرق الطولين 7 سم.

طرح الفارقين مع أن الأشرطة على جانبين مختلفين من الطول المرجعي.$mw$,$mw$The reference length lies between the two other lengths, so add the two gaps.

$D=4+3$

1. Blue ends three centimetres before white.

2. Red ends four centimetres beyond white; the two gaps are consecutive.

$4+3=7$

$7$ cm

If white is 10 cm, red is 14 and blue is 7; the difference is 7 cm.

Subtracts the gaps despite opposite sides of the reference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيّل أن الأطراف اليسرى للأشرطة الثلاثة عند الموضع نفسه.","En":"Imagine aligning the left ends of all three strips."},{"Ar":"اجمع المسافة من نهاية الأزرق إلى نهاية الأبيض ومن الأبيض إلى الأحمر.","En":"Combine the gap from blue to white and from white to red."}],"Solution":{"Idea":{"Ar":"يقع الطول المرجعي بين الطولين الآخرين، لذلك نجمع الفرقين.","En":"The reference length lies between the two other lengths, so add the two gaps."},"FormulaLatex":"D=4+3","Steps":[{"Ar":"نهاية الأزرق تقع قبل نهاية الأبيض بثلاثة سنتيمترات.","En":"Blue ends three centimetres before white."},{"Ar":"نهاية الأحمر تقع بعد نهاية الأبيض بأربعة سنتيمترات؛ المسافتان متتاليتان.","En":"Red ends four centimetres beyond white; the two gaps are consecutive."}],"Substitution":{"Ar":"$4+3=7$","En":"$4+3=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"إذا كان الأبيض 10 سم، فالأحمر 14 والأزرق 7، وفرق الطولين 7 سم.","En":"If white is 10 cm, red is 14 and blue is 7; the difference is 7 cm."},"CommonError":{"Ar":"طرح الفارقين مع أن الأشرطة على جانبين مختلفين من الطول المرجعي.","En":"Subtracts the gaps despite opposite sides of the reference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح الفارقين مع أن الأشرطة على جانبين مختلفين من الطول المرجعي.","En":"Subtracts the gaps despite opposite sides of the reference."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب الفارق بين الأحمر والأبيض فقط.","En":"Uses only the red-white difference."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب الفارق بين الأبيض والأزرق فقط.","En":"Uses only the white-blue difference."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v21-grade-6-fraction-comparison-sum-exceeds-whole-1$mw$,$mw$fraction-comparison-sum-exceeds-whole$mw$,$mw$p-fractions-decimals-fraction-operations$mw$,$mw$grade-6$mw$,6,1,21,95,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":95,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"هل تكفي الكمية؟","En":"Is there enough?"},"Question":{"Ar":"تحتاج وصفة إلى $\\frac23$ كوب من الدقيق ووصفة أخرى إلى $\\frac56$ كوب. لديك كوب واحد فقط. ما كمية الدقيق الإضافية اللازمة للوصفتين معاً؟","En":"One recipe requires $\\frac23$ cup of flour and another requires $\\frac56$ cup. You have one cup. How much extra flour is needed for both recipes together?"},"Options":[{"LatexCode":"\\frac{3}{2}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع الدقيق المطلوب دون طرح الموجود.","En":"Reports total required without subtracting available flour."}},{"LatexCode":"\\frac{1}{2}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac{1}{6}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الكسرين بدل جمعهما وطرح الكوب.","En":"Subtracts the two fractions instead of adding and subtracting one cup."}},{"LatexCode":"\\frac{1}{3}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب مكمل الثلثين إلى الواحد وأهمل الوصفة الأخرى.","En":"Finds the complement of two thirds and ignores the other recipe."}}],"Hints":[{"Ar":"وحّد مقامي الكسرين أولاً.","En":"First use a common denominator for the fractions."},{"Ar":"اجمع حاجتي الوصفتين ثم اطرح الكمية المتوافرة.","En":"Add the two requirements and subtract the available amount."}],"Solution":{"Idea":{"Ar":"نجمع الكسور ذات المقام الموحد ثم نطرح الكمية المتاحة لتحديد العجز.","En":"Add fractions with a common denominator, then subtract the available quantity to determine the shortage."},"FormulaLatex":"E=\\frac23+\\frac56-1","Steps":[{"Ar":"نكتب الثلثين على صورة $\\frac46$.","En":"Write two thirds as $\\frac46$."},{"Ar":"الكمية المطلوبة $\\frac96$ كوب، والمتوافر $\\frac66$ كوب.","En":"The required amount is $\\frac96$ cup; the available amount is $\\frac66$ cup."}],"Substitution":{"Ar":"$\\frac96-\\frac66=\\frac36=\\frac12$","En":"$\\frac96-\\frac66=\\frac36=\\frac12$"},"Result":{"Ar":"$\\frac{1}{2}$","En":"$\\frac{1}{2}$"},"Unit":{"Ar":"كوب","En":"cup"},"Verification":{"Ar":"كوب ونصف يساويان $\\frac32=\\frac96$ كوب، وهو مجموع الكميتين المطلوبتين.","En":"One and a half cups equals $\\frac32=\\frac96$, the combined requirement."},"CommonError":{"Ar":"أعطى مجموع الدقيق المطلوب دون طرح الموجود.","En":"Reports total required without subtracting available flour."}}}$mw$::jsonb,$mw$نجمع الكسور ذات المقام الموحد ثم نطرح الكمية المتاحة لتحديد العجز.

$E=\frac23+\frac56-1$

1. نكتب الثلثين على صورة $\frac46$.

2. الكمية المطلوبة $\frac96$ كوب، والمتوافر $\frac66$ كوب.

$\frac96-\frac66=\frac36=\frac12$

$\frac{1}{2}$ كوب

كوب ونصف يساويان $\frac32=\frac96$ كوب، وهو مجموع الكميتين المطلوبتين.

أعطى مجموع الدقيق المطلوب دون طرح الموجود.$mw$,$mw$Add fractions with a common denominator, then subtract the available quantity to determine the shortage.

$E=\frac23+\frac56-1$

1. Write two thirds as $\frac46$.

2. The required amount is $\frac96$ cup; the available amount is $\frac66$ cup.

$\frac96-\frac66=\frac36=\frac12$

$\frac{1}{2}$ cup

One and a half cups equals $\frac32=\frac96$, the combined requirement.

Reports total required without subtracting available flour.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"وحّد مقامي الكسرين أولاً.","En":"First use a common denominator for the fractions."},{"Ar":"اجمع حاجتي الوصفتين ثم اطرح الكمية المتوافرة.","En":"Add the two requirements and subtract the available amount."}],"Solution":{"Idea":{"Ar":"نجمع الكسور ذات المقام الموحد ثم نطرح الكمية المتاحة لتحديد العجز.","En":"Add fractions with a common denominator, then subtract the available quantity to determine the shortage."},"FormulaLatex":"E=\\frac23+\\frac56-1","Steps":[{"Ar":"نكتب الثلثين على صورة $\\frac46$.","En":"Write two thirds as $\\frac46$."},{"Ar":"الكمية المطلوبة $\\frac96$ كوب، والمتوافر $\\frac66$ كوب.","En":"The required amount is $\\frac96$ cup; the available amount is $\\frac66$ cup."}],"Substitution":{"Ar":"$\\frac96-\\frac66=\\frac36=\\frac12$","En":"$\\frac96-\\frac66=\\frac36=\\frac12$"},"Result":{"Ar":"$\\frac{1}{2}$","En":"$\\frac{1}{2}$"},"Unit":{"Ar":"كوب","En":"cup"},"Verification":{"Ar":"كوب ونصف يساويان $\\frac32=\\frac96$ كوب، وهو مجموع الكميتين المطلوبتين.","En":"One and a half cups equals $\\frac32=\\frac96$, the combined requirement."},"CommonError":{"Ar":"أعطى مجموع الدقيق المطلوب دون طرح الموجود.","En":"Reports total required without subtracting available flour."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع الدقيق المطلوب دون طرح الموجود.","En":"Reports total required without subtracting available flour."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح الكسرين بدل جمعهما وطرح الكوب.","En":"Subtracts the two fractions instead of adding and subtracting one cup."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب مكمل الثلثين إلى الواحد وأهمل الوصفة الأخرى.","En":"Finds the complement of two thirds and ignores the other recipe."},"Order":4}]}$mw$),
($mw$growth-v21-grade-9-iqr-invariant-translation-1$mw$,$mw$iqr-invariant-translation$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"تأثير إضافة ثابت","En":"Effect of adding a constant"},"Question":{"Ar":"للقيم في مجموعة بيانات ربيع أول 12 وربيع ثالث 21. أضيف العدد 5 إلى كل قيمة. ما المدى الربيعي للمجموعة الجديدة؟","En":"A data set has first quartile 12 and third quartile 21. Every value is increased by 5. What is the interquartile range of the new data set?"},"Options":[{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 5 إلى المدى الربيعي القديم.","En":"Adds 5 to the old IQR."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 5 من المدى الربيعي.","En":"Subtracts 5 from the IQR."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى الربيع الثالث الجديد وحده.","En":"Reports only the new third quartile."}}],"Hints":[{"Ar":"كيف تتغير القيم المرتبة عندما نضيف العدد نفسه إلى كل قيمة؟","En":"How do ordered values change when the same number is added to every value?"},{"Ar":"احسب الفرق بين الربيعين بعد تغييرهما.","En":"Find the difference between the two updated quartiles."}],"Solution":{"Idea":{"Ar":"إضافة ثابت إلى جميع القيم تزيد الربيعين بالمقدار نفسه فلا تغير الفرق بينهما.","En":"Adding a constant to all values shifts both quartiles equally and leaves their difference unchanged."},"FormulaLatex":"IQR=Q_3-Q_1","Steps":[{"Ar":"الربيع الأول الجديد 17 والثالث الجديد 26.","En":"The new first quartile is 17 and the third is 26."},{"Ar":"نطرح الربيع الأول من الثالث.","En":"Subtract the first quartile from the third."}],"Substitution":{"Ar":"$26-17=9$","En":"$26-17=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"إضافة ثابت إلى الطرفين تلغى عند الطرح: $(21+5)-(12+5)=21-12$.","En":"The added constant cancels in the difference: $(21+5)-(12+5)=21-12$."},"CommonError":{"Ar":"أضاف 5 إلى المدى الربيعي القديم.","En":"Adds 5 to the old IQR."}}}$mw$::jsonb,$mw$إضافة ثابت إلى جميع القيم تزيد الربيعين بالمقدار نفسه فلا تغير الفرق بينهما.

$IQR=Q_3-Q_1$

1. الربيع الأول الجديد 17 والثالث الجديد 26.

2. نطرح الربيع الأول من الثالث.

$26-17=9$

$9$ دون وحدة

إضافة ثابت إلى الطرفين تلغى عند الطرح: $(21+5)-(12+5)=21-12$.

أضاف 5 إلى المدى الربيعي القديم.$mw$,$mw$Adding a constant to all values shifts both quartiles equally and leaves their difference unchanged.

$IQR=Q_3-Q_1$

1. The new first quartile is 17 and the third is 26.

2. Subtract the first quartile from the third.

$26-17=9$

$9$ unitless

The added constant cancels in the difference: $(21+5)-(12+5)=21-12$.

Adds 5 to the old IQR.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"كيف تتغير القيم المرتبة عندما نضيف العدد نفسه إلى كل قيمة؟","En":"How do ordered values change when the same number is added to every value?"},{"Ar":"احسب الفرق بين الربيعين بعد تغييرهما.","En":"Find the difference between the two updated quartiles."}],"Solution":{"Idea":{"Ar":"إضافة ثابت إلى جميع القيم تزيد الربيعين بالمقدار نفسه فلا تغير الفرق بينهما.","En":"Adding a constant to all values shifts both quartiles equally and leaves their difference unchanged."},"FormulaLatex":"IQR=Q_3-Q_1","Steps":[{"Ar":"الربيع الأول الجديد 17 والثالث الجديد 26.","En":"The new first quartile is 17 and the third is 26."},{"Ar":"نطرح الربيع الأول من الثالث.","En":"Subtract the first quartile from the third."}],"Substitution":{"Ar":"$26-17=9$","En":"$26-17=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"إضافة ثابت إلى الطرفين تلغى عند الطرح: $(21+5)-(12+5)=21-12$.","En":"The added constant cancels in the difference: $(21+5)-(12+5)=21-12$."},"CommonError":{"Ar":"أضاف 5 إلى المدى الربيعي القديم.","En":"Adds 5 to the old IQR."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أضاف 5 إلى المدى الربيعي القديم.","En":"Adds 5 to the old IQR."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 5 من المدى الربيعي.","En":"Subtracts 5 from the IQR."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى الربيع الثالث الجديد وحده.","En":"Reports only the new third quartile."},"Order":4}]}$mw$),
($mw$growth-v21-grade-9-mad-scale-data-1$mw$,$mw$mad-scale-data$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"تحجيم الانحراف المتوسط","En":"Scaling mean absolute deviation"},"Question":{"Ar":"المتوسط الحسابي لمجموعة قيم هو 8، ومتوسط الانحراف المطلق عن المتوسط هو 2. ضُربت كل قيمة في 3. ما متوسط الانحراف المطلق الجديد؟","En":"A data set has mean 8 and mean absolute deviation from the mean of 2. Every value is multiplied by 3. What is the new mean absolute deviation?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن التحجيم لا يؤثر على التشتت.","En":"Assumes scaling leaves spread unchanged."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 3 بدلاً من ضرب الانحراف في 3.","En":"Adds 3 rather than multiplying by 3."}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المتوسط الجديد بدل مقياس التشتت.","En":"Reports the new mean rather than spread."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"كيف يتغير المتوسط عندما تُضرب كل قيمة في العدد نفسه؟","En":"How does the mean change when each value is multiplied by the same number?"},{"Ar":"فكّر في أثر الضرب على المسافة بين كل قيمة والمتوسط الجديد.","En":"Consider the effect of multiplication on each distance from the new mean."}],"Solution":{"Idea":{"Ar":"ضرب كل قيمة في معامل موجب يضرب المتوسط والمسافات المطلقة عن المتوسط بالمعامل نفسه.","En":"Multiplying every value by a positive constant scales the mean and absolute deviations by the same constant."},"FormulaLatex":"\\operatorname{MAD}(3x)=3\\operatorname{MAD}(x)","Steps":[{"Ar":"المتوسط الجديد هو 24.","En":"The new mean is 24."},{"Ar":"كل مسافة مطلقة عن المتوسط تصبح ثلاثة أمثال المسافة الأصلية؛ وكذلك متوسطها.","En":"Every absolute distance from the mean triples, so their average triples as well."}],"Substitution":{"Ar":"$3\\times2=6$","En":"$3\\times2=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"مثلاً القيم 6 و10 متوسطها 8 وانحرافهما المطلق 2، وبعد الضرب تصبح 18 و30 ومتوسطهما 24 وانحرافهما 6.","En":"For example, 6 and 10 have mean 8 and MAD 2; after scaling, 18 and 30 have mean 24 and MAD 6."},"CommonError":{"Ar":"افترض أن التحجيم لا يؤثر على التشتت.","En":"Assumes scaling leaves spread unchanged."}}}$mw$::jsonb,$mw$ضرب كل قيمة في معامل موجب يضرب المتوسط والمسافات المطلقة عن المتوسط بالمعامل نفسه.

$\operatorname{MAD}(3x)=3\operatorname{MAD}(x)$

1. المتوسط الجديد هو 24.

2. كل مسافة مطلقة عن المتوسط تصبح ثلاثة أمثال المسافة الأصلية؛ وكذلك متوسطها.

$3\times2=6$

$6$ دون وحدة

مثلاً القيم 6 و10 متوسطها 8 وانحرافهما المطلق 2، وبعد الضرب تصبح 18 و30 ومتوسطهما 24 وانحرافهما 6.

افترض أن التحجيم لا يؤثر على التشتت.$mw$,$mw$Multiplying every value by a positive constant scales the mean and absolute deviations by the same constant.

$\operatorname{MAD}(3x)=3\operatorname{MAD}(x)$

1. The new mean is 24.

2. Every absolute distance from the mean triples, so their average triples as well.

$3\times2=6$

$6$ unitless

For example, 6 and 10 have mean 8 and MAD 2; after scaling, 18 and 30 have mean 24 and MAD 6.

Assumes scaling leaves spread unchanged.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"كيف يتغير المتوسط عندما تُضرب كل قيمة في العدد نفسه؟","En":"How does the mean change when each value is multiplied by the same number?"},{"Ar":"فكّر في أثر الضرب على المسافة بين كل قيمة والمتوسط الجديد.","En":"Consider the effect of multiplication on each distance from the new mean."}],"Solution":{"Idea":{"Ar":"ضرب كل قيمة في معامل موجب يضرب المتوسط والمسافات المطلقة عن المتوسط بالمعامل نفسه.","En":"Multiplying every value by a positive constant scales the mean and absolute deviations by the same constant."},"FormulaLatex":"\\operatorname{MAD}(3x)=3\\operatorname{MAD}(x)","Steps":[{"Ar":"المتوسط الجديد هو 24.","En":"The new mean is 24."},{"Ar":"كل مسافة مطلقة عن المتوسط تصبح ثلاثة أمثال المسافة الأصلية؛ وكذلك متوسطها.","En":"Every absolute distance from the mean triples, so their average triples as well."}],"Substitution":{"Ar":"$3\\times2=6$","En":"$3\\times2=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"مثلاً القيم 6 و10 متوسطها 8 وانحرافهما المطلق 2، وبعد الضرب تصبح 18 و30 ومتوسطهما 24 وانحرافهما 6.","En":"For example, 6 and 10 have mean 8 and MAD 2; after scaling, 18 and 30 have mean 24 and MAD 6."},"CommonError":{"Ar":"افترض أن التحجيم لا يؤثر على التشتت.","En":"Assumes scaling leaves spread unchanged."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"افترض أن التحجيم لا يؤثر على التشتت.","En":"Assumes scaling leaves spread unchanged."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 3 بدلاً من ضرب الانحراف في 3.","En":"Adds 3 rather than multiplying by 3."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى المتوسط الجديد بدل مقياس التشتت.","En":"Reports the new mean rather than spread."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v21-grade-9-outlier-effect-range-1$mw$,$mw$outlier-effect-range$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تأثير قيمة شاذة","En":"Outlier and range"},"Question":{"Ar":"القياسات المرتبة هي 4، 7، 9، 11، 30. إذا صُحّحت القراءة 30 إلى 13، بكم انخفض المدى؟","En":"The ordered measurements are 4, 7, 9, 11, 30. If the reading 30 is corrected to 13, by how much does the range decrease?"},"Options":[{"LatexCode":"17","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المدى الجديد لا مقدار الانخفاض.","En":"Reports the new range rather than its decrease."}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المدى القديم.","En":"Reports the old range."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 11 من 30 وأهمل أن 13 هي أكبر قيمة جديدة.","En":"Subtracts 11 from 30 and ignores that 13 is the new maximum."}}],"Hints":[{"Ar":"المدى يساوي أكبر قيمة ناقص أصغر قيمة.","En":"The range is the largest value minus the smallest value."},{"Ar":"احسب المدى قبل التصحيح وبعده، ثم قارن بينهما.","En":"Compute the range before and after correction, then compare."}],"Solution":{"Idea":{"Ar":"نحدد أكبر وأصغر قيمة قبل التصحيح وبعده ثم نقارن المديين.","En":"Identify the maximum and minimum before and after correction, then compare the two ranges."},"FormulaLatex":"R=\\max(x_i)-\\min(x_i)","Steps":[{"Ar":"المدى القديم $30-4=26$.","En":"The old range is $30-4=26$."},{"Ar":"المدى الجديد $13-4=9$، فنطرح الجديد من القديم.","En":"The new range is $13-4=9$; subtract it from the old one."}],"Substitution":{"Ar":"$26-9=17$","En":"$26-9=17$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"القيمة الدنيا لم تتغير، وانخفضت العليا من 30 إلى 13 بمقدار 17.","En":"The minimum is unchanged and the maximum falls from 30 to 13 by 17."},"CommonError":{"Ar":"أعطى المدى الجديد لا مقدار الانخفاض.","En":"Reports the new range rather than its decrease."}}}$mw$::jsonb,$mw$نحدد أكبر وأصغر قيمة قبل التصحيح وبعده ثم نقارن المديين.

$R=\max(x_i)-\min(x_i)$

1. المدى القديم $30-4=26$.

2. المدى الجديد $13-4=9$، فنطرح الجديد من القديم.

$26-9=17$

$17$ دون وحدة

القيمة الدنيا لم تتغير، وانخفضت العليا من 30 إلى 13 بمقدار 17.

أعطى المدى الجديد لا مقدار الانخفاض.$mw$,$mw$Identify the maximum and minimum before and after correction, then compare the two ranges.

$R=\max(x_i)-\min(x_i)$

1. The old range is $30-4=26$.

2. The new range is $13-4=9$; subtract it from the old one.

$26-9=17$

$17$ unitless

The minimum is unchanged and the maximum falls from 30 to 13 by 17.

Reports the new range rather than its decrease.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المدى يساوي أكبر قيمة ناقص أصغر قيمة.","En":"The range is the largest value minus the smallest value."},{"Ar":"احسب المدى قبل التصحيح وبعده، ثم قارن بينهما.","En":"Compute the range before and after correction, then compare."}],"Solution":{"Idea":{"Ar":"نحدد أكبر وأصغر قيمة قبل التصحيح وبعده ثم نقارن المديين.","En":"Identify the maximum and minimum before and after correction, then compare the two ranges."},"FormulaLatex":"R=\\max(x_i)-\\min(x_i)","Steps":[{"Ar":"المدى القديم $30-4=26$.","En":"The old range is $30-4=26$."},{"Ar":"المدى الجديد $13-4=9$، فنطرح الجديد من القديم.","En":"The new range is $13-4=9$; subtract it from the old one."}],"Substitution":{"Ar":"$26-9=17$","En":"$26-9=17$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"القيمة الدنيا لم تتغير، وانخفضت العليا من 30 إلى 13 بمقدار 17.","En":"The minimum is unchanged and the maximum falls from 30 to 13 by 17."},"CommonError":{"Ar":"أعطى المدى الجديد لا مقدار الانخفاض.","En":"Reports the new range rather than its decrease."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى المدى الجديد لا مقدار الانخفاض.","En":"Reports the new range rather than its decrease."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى المدى القديم.","En":"Reports the old range."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح 11 من 30 وأهمل أن 13 هي أكبر قيمة جديدة.","En":"Subtracts 11 from 30 and ignores that 13 is the new maximum."},"Order":4}]}$mw$),
($mw$growth-v21-grade-9-triangle-similarity-inconsistent-correspondence-1$mw$,$mw$triangle-similarity-inconsistent-correspondence$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-9$mw$,9,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"تمييز التشابه","En":"Recognizing similarity"},"Question":{"Ar":"أضلاع مثلث أطوالها 4 و6 و8 سم. أي مجموعة أطوال يمكن أن تكون أضلاع مثلث مشابه له؟","En":"A triangle has sides 4, 6 and 8 cm. Which set of lengths could be the sides of a similar triangle?"},"Options":[{"LatexCode":"(6,8,10)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 2 لكل ضلع، والإضافة لا تحفظ نسبة التشابه.","En":"Adds 2 to each side; addition does not preserve ratios."}},{"LatexCode":"(8,12,14)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضاعف ضلعين دون الثالث.","En":"Doubles two sides but not the third."}},{"LatexCode":"(6,9,12)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(5,7,9)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 1 لكل ضلع بدلاً من ضربها بمعامل واحد.","En":"Adds 1 rather than multiplying all sides by one factor."}}],"Hints":[{"Ar":"رتّب الأطوال من الأصغر إلى الأكبر.","En":"Order the lengths from smallest to largest."},{"Ar":"اقسم كل طول من إحدى المجموعات على الطول المناظر له في المثلث الأصلي. هل النسب متساوية؟","En":"Divide each candidate side by its corresponding original side. Are the ratios equal?"}],"Solution":{"Idea":{"Ar":"تشابه مثلثين يقتضي تناسب أضلاعهما الثلاثة المتناظرة بمعامل موجب ثابت.","En":"Similar triangles require all three corresponding sides to share one positive scale factor."},"FormulaLatex":"\\frac{a'}a=\\frac{b'}b=\\frac{c'}c","Steps":[{"Ar":"نقارن كل طول جديد بالطول المناظر في المثلث الأصلي.","En":"Compare each new side with its corresponding original side."},{"Ar":"المجموعة $6,9,12$ تعطي النسبة نفسها $\\frac32$ في المقارنات الثلاث.","En":"The set $6,9,12$ gives the same ratio $\\frac32$ in all three comparisons."}],"Substitution":{"Ar":"$6/4=9/6=12/8=3/2$","En":"$6/4=9/6=12/8=3/2$"},"Result":{"Ar":"$(6,9,12)$","En":"$(6,9,12)$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"تتحقق متباينة المثلث $6+9>12$، والنسب الثلاث متساوية.","En":"The triangle inequality $6+9>12$ holds, and all three ratios agree."},"CommonError":{"Ar":"أضاف 2 لكل ضلع، والإضافة لا تحفظ نسبة التشابه.","En":"Adds 2 to each side; addition does not preserve ratios."}}}$mw$::jsonb,$mw$تشابه مثلثين يقتضي تناسب أضلاعهما الثلاثة المتناظرة بمعامل موجب ثابت.

$\frac{a'}a=\frac{b'}b=\frac{c'}c$

1. نقارن كل طول جديد بالطول المناظر في المثلث الأصلي.

2. المجموعة $6,9,12$ تعطي النسبة نفسها $\frac32$ في المقارنات الثلاث.

$6/4=9/6=12/8=3/2$

$(6,9,12)$ سم

تتحقق متباينة المثلث $6+9>12$، والنسب الثلاث متساوية.

أضاف 2 لكل ضلع، والإضافة لا تحفظ نسبة التشابه.$mw$,$mw$Similar triangles require all three corresponding sides to share one positive scale factor.

$\frac{a'}a=\frac{b'}b=\frac{c'}c$

1. Compare each new side with its corresponding original side.

2. The set $6,9,12$ gives the same ratio $\frac32$ in all three comparisons.

$6/4=9/6=12/8=3/2$

$(6,9,12)$ cm

The triangle inequality $6+9>12$ holds, and all three ratios agree.

Adds 2 to each side; addition does not preserve ratios.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"رتّب الأطوال من الأصغر إلى الأكبر.","En":"Order the lengths from smallest to largest."},{"Ar":"اقسم كل طول من إحدى المجموعات على الطول المناظر له في المثلث الأصلي. هل النسب متساوية؟","En":"Divide each candidate side by its corresponding original side. Are the ratios equal?"}],"Solution":{"Idea":{"Ar":"تشابه مثلثين يقتضي تناسب أضلاعهما الثلاثة المتناظرة بمعامل موجب ثابت.","En":"Similar triangles require all three corresponding sides to share one positive scale factor."},"FormulaLatex":"\\frac{a'}a=\\frac{b'}b=\\frac{c'}c","Steps":[{"Ar":"نقارن كل طول جديد بالطول المناظر في المثلث الأصلي.","En":"Compare each new side with its corresponding original side."},{"Ar":"المجموعة $6,9,12$ تعطي النسبة نفسها $\\frac32$ في المقارنات الثلاث.","En":"The set $6,9,12$ gives the same ratio $\\frac32$ in all three comparisons."}],"Substitution":{"Ar":"$6/4=9/6=12/8=3/2$","En":"$6/4=9/6=12/8=3/2$"},"Result":{"Ar":"$(6,9,12)$","En":"$(6,9,12)$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"تتحقق متباينة المثلث $6+9>12$، والنسب الثلاث متساوية.","En":"The triangle inequality $6+9>12$ holds, and all three ratios agree."},"CommonError":{"Ar":"أضاف 2 لكل ضلع، والإضافة لا تحفظ نسبة التشابه.","En":"Adds 2 to each side; addition does not preserve ratios."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أضاف 2 لكل ضلع، والإضافة لا تحفظ نسبة التشابه.","En":"Adds 2 to each side; addition does not preserve ratios."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضاعف ضلعين دون الثالث.","En":"Doubles two sides but not the third."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 1 لكل ضلع بدلاً من ضربها بمعامل واحد.","En":"Adds 1 rather than multiplying all sides by one factor."},"Order":4}]}$mw$),
($mw$growth-v21-grade-9-quadratic-even-symmetry-evaluation-1$mw$,$mw$quadratic-even-symmetry-evaluation$mw$,$mw$middle-quadratic-function-evaluation$mw$,$mw$grade-9$mw$,9,2,6,27,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":27,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تماثل قيم دالة تربيعية","En":"Symmetric quadratic evaluations"},"Question":{"Ar":"إذا كانت $f(x)=2x^2-5$، فما قيمة $f(-3)-f(3)$؟","En":"If $f(x)=2x^2-5$, what is $f(-3)-f(3)$?"},"Options":[{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الناتجين بدلاً من طرحهما.","En":"Adds the two outputs rather than subtracting."}},{"LatexCode":"-36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل مربع العدد السالب كأنه سالب.","En":"Treats the square of a negative input as negative."}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى قيمة الدالة عند أحد المدخلين فقط.","En":"Reports the function value at just one input."}},{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب مربع العدد السالب ومربع العدد الموجب.","En":"Compute the squares of the negative and positive inputs."},{"Ar":"عوّض في الدالة لكل قيمة، ثم اطرح الناتجين.","En":"Substitute each input into the function, then subtract the outputs."}],"Solution":{"Idea":{"Ar":"في الدالة المعطاة يعتمد الناتج على مربع المدخل، فيتساوى الناتجان عند عددين متعاكسين.","En":"The given function depends on the squared input, so opposite inputs produce equal outputs."},"FormulaLatex":"f(-x)=f(x)\\quad\\text{for }f(x)=2x^2-5","Steps":[{"Ar":"عند $x=-3$ يكون المربع 9، ومنه $f(-3)=13$.","En":"At $x=-3$, the square is 9, so $f(-3)=13$."},{"Ar":"عند $x=3$ يكون المربع 9 أيضاً، فيكون $f(3)=13$.","En":"At $x=3$, the square is also 9, so $f(3)=13$."}],"Substitution":{"Ar":"$13-13=0$","En":"$13-13=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"التربيع يزيل إشارة المدخل في هذه الدالة، فتتساوى القيمتان.","En":"Squaring removes the input sign in this function, so the two outputs agree."},"CommonError":{"Ar":"جمع الناتجين بدلاً من طرحهما.","En":"Adds the two outputs rather than subtracting."}}}$mw$::jsonb,$mw$في الدالة المعطاة يعتمد الناتج على مربع المدخل، فيتساوى الناتجان عند عددين متعاكسين.

$f(-x)=f(x)\quad\text{for }f(x)=2x^2-5$

1. عند $x=-3$ يكون المربع 9، ومنه $f(-3)=13$.

2. عند $x=3$ يكون المربع 9 أيضاً، فيكون $f(3)=13$.

$13-13=0$

$0$ دون وحدة

التربيع يزيل إشارة المدخل في هذه الدالة، فتتساوى القيمتان.

جمع الناتجين بدلاً من طرحهما.$mw$,$mw$The given function depends on the squared input, so opposite inputs produce equal outputs.

$f(-x)=f(x)\quad\text{for }f(x)=2x^2-5$

1. At $x=-3$, the square is 9, so $f(-3)=13$.

2. At $x=3$, the square is also 9, so $f(3)=13$.

$13-13=0$

$0$ unitless

Squaring removes the input sign in this function, so the two outputs agree.

Adds the two outputs rather than subtracting.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مربع العدد السالب ومربع العدد الموجب.","En":"Compute the squares of the negative and positive inputs."},{"Ar":"عوّض في الدالة لكل قيمة، ثم اطرح الناتجين.","En":"Substitute each input into the function, then subtract the outputs."}],"Solution":{"Idea":{"Ar":"في الدالة المعطاة يعتمد الناتج على مربع المدخل، فيتساوى الناتجان عند عددين متعاكسين.","En":"The given function depends on the squared input, so opposite inputs produce equal outputs."},"FormulaLatex":"f(-x)=f(x)\\quad\\text{for }f(x)=2x^2-5","Steps":[{"Ar":"عند $x=-3$ يكون المربع 9، ومنه $f(-3)=13$.","En":"At $x=-3$, the square is 9, so $f(-3)=13$."},{"Ar":"عند $x=3$ يكون المربع 9 أيضاً، فيكون $f(3)=13$.","En":"At $x=3$, the square is also 9, so $f(3)=13$."}],"Substitution":{"Ar":"$13-13=0$","En":"$13-13=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"دون وحدة","En":"unitless"},"Verification":{"Ar":"التربيع يزيل إشارة المدخل في هذه الدالة، فتتساوى القيمتان.","En":"Squaring removes the input sign in this function, so the two outputs agree."},"CommonError":{"Ar":"جمع الناتجين بدلاً من طرحهما.","En":"Adds the two outputs rather than subtracting."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع الناتجين بدلاً من طرحهما.","En":"Adds the two outputs rather than subtracting."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل مربع العدد السالب كأنه سالب.","En":"Treats the square of a negative input as negative."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى قيمة الدالة عند أحد المدخلين فقط.","En":"Reports the function value at just one input."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v21 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
