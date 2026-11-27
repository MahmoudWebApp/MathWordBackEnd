-- One-time owner-authorized import AND publication from reviewed v17/v19 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v17-grade-2-length-invariant-under-slide-1$mw$,$mw$length-invariant-under-slide$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"شريط يتحرّك فوق مسطرة","En":"Sliding a strip along a ruler"},"Question":{"Ar":"بداية شريط مستقيم عند 4 سم ونهايته عند 11 سم على مسطرة. حُرّك الشريط على امتداد المسطرة حتى صارت بدايته عند 9 سم. عند أي قراءة أصبحت نهايته؟","En":"A straight strip starts at 4 cm and ends at 11 cm on a ruler. The strip is slid along the ruler until its start is at 9 cm. At what reading is its end now?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب طول الشريط لا قراءة النهاية.","En":"Gives the strip length instead of the end reading."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع قراءة البداية الجديدة والنهاية القديمة مباشرة.","En":"Adds the new start and the old end directly."}},{"LatexCode":"16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف مقدار حركة البداية إلى موضع البداية الجديد.","En":"Adds the shift to the new start instead of to the original end."}}],"Hints":[{"Ar":"كم تحرّكت البداية؟","En":"How far did the starting point move?"},{"Ar":"تتحرّك النهاية المسافة نفسها في الاتجاه نفسه.","En":"The end moves the same distance in the same direction."}],"Solution":{"Idea":{"Ar":"عند إزاحة الشريط دون تمديده يبقى طوله ثابتاً، وتتحرك بدايته ونهايته بالمقدار نفسه.","En":"Sliding without stretching preserves length, moving both endpoints by the same amount."},"FormulaLatex":"b_2=a_2+(b_1-a_1)","Steps":[{"Ar":"طول الشريط ثابت: $11-4=7$ سم.","En":"Its length stays $11-4=7$ cm."},{"Ar":"أضف الطول إلى موضع البداية الجديد، وهو 9 سم.","En":"Add the length to the new start reading of 9 cm."}],"Substitution":{"Ar":"$9+(11-4)=16$","En":"$9+(11-4)=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"سم على المسطرة","En":"cm on the ruler"},"Verification":{"Ar":"طول الشريط 7 سم قبل الحركة، و16 ناقص 9 يساوي 7 سم بعدها.","En":"The length was 7 cm before the slide, and 16 minus 9 gives 7 cm afterwards."},"CommonError":{"Ar":"حسب طول الشريط لا قراءة النهاية.","En":"Gives the strip length instead of the end reading."}}}$mw$::jsonb,$mw$عند إزاحة الشريط دون تمديده يبقى طوله ثابتاً، وتتحرك بدايته ونهايته بالمقدار نفسه.

$b_2=a_2+(b_1-a_1)$

1. طول الشريط ثابت: $11-4=7$ سم.

2. أضف الطول إلى موضع البداية الجديد، وهو 9 سم.

$9+(11-4)=16$

$16$ سم على المسطرة

طول الشريط 7 سم قبل الحركة، و16 ناقص 9 يساوي 7 سم بعدها.

حسب طول الشريط لا قراءة النهاية.$mw$,$mw$Sliding without stretching preserves length, moving both endpoints by the same amount.

$b_2=a_2+(b_1-a_1)$

1. Its length stays $11-4=7$ cm.

2. Add the length to the new start reading of 9 cm.

$9+(11-4)=16$

$16$ cm on the ruler

The length was 7 cm before the slide, and 16 minus 9 gives 7 cm afterwards.

Gives the strip length instead of the end reading.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"كم تحرّكت البداية؟","En":"How far did the starting point move?"},{"Ar":"تتحرّك النهاية المسافة نفسها في الاتجاه نفسه.","En":"The end moves the same distance in the same direction."}],"Solution":{"Idea":{"Ar":"عند إزاحة الشريط دون تمديده يبقى طوله ثابتاً، وتتحرك بدايته ونهايته بالمقدار نفسه.","En":"Sliding without stretching preserves length, moving both endpoints by the same amount."},"FormulaLatex":"b_2=a_2+(b_1-a_1)","Steps":[{"Ar":"طول الشريط ثابت: $11-4=7$ سم.","En":"Its length stays $11-4=7$ cm."},{"Ar":"أضف الطول إلى موضع البداية الجديد، وهو 9 سم.","En":"Add the length to the new start reading of 9 cm."}],"Substitution":{"Ar":"$9+(11-4)=16$","En":"$9+(11-4)=16$"},"Result":{"Ar":"$16$","En":"$16$"},"Unit":{"Ar":"سم على المسطرة","En":"cm on the ruler"},"Verification":{"Ar":"طول الشريط 7 سم قبل الحركة، و16 ناقص 9 يساوي 7 سم بعدها.","En":"The length was 7 cm before the slide, and 16 minus 9 gives 7 cm afterwards."},"CommonError":{"Ar":"حسب طول الشريط لا قراءة النهاية.","En":"Gives the strip length instead of the end reading."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب طول الشريط لا قراءة النهاية.","En":"Gives the strip length instead of the end reading."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع قراءة البداية الجديدة والنهاية القديمة مباشرة.","En":"Adds the new start and the old end directly."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف مقدار حركة البداية إلى موضع البداية الجديد.","En":"Adds the shift to the new start instead of to the original end."},"Order":4}]}$mw$),
($mw$growth-v17-grade-3-reverse-area-after-width-change-1$mw$,$mw$reverse-area-after-width-change$mw$,$mw$primary-rectangle-area$mw$,$mw$grade-3$mw$,3,1,3,13,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":13,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"مساحة تزداد عند التوسعة","En":"Area gained by widening"},"Question":{"Ar":"عرض مستطيل 4 أمتار. زاد عرضه إلى 7 أمتار وبقي طوله ثابتاً. ازدادت مساحته بمقدار 18 متراً مربعاً. ما طول المستطيل؟","En":"A rectangle is 4 metres wide. Its width grows to 7 metres while its length stays fixed. Its area increases by 18 square metres. What is its length?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عرض الشريط المضاف.","En":"Gives the width of the added strip."}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استخدم مقدار زيادة المساحة بوصفه طولاً.","En":"Uses the area increase as a length."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم على مجموع العرضين بدلاً من الفرق بينهما ثم قرّب الناتج.","En":"Divides by the sum instead of the difference of the widths and rounds."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تخيّل الجزء المضاف شريطاً مستطيلاً على امتداد الطول.","En":"Imagine the addition as a rectangular strip along the length."},{"Ar":"احسب عرض الشريط المضاف واستخدم مساحته.","En":"Find the added strip's width and use its area."}],"Solution":{"Idea":{"Ar":"المساحة المضافة مستطيل طوله ثابت وعرضه مقدار الزيادة.","En":"The added area is a rectangle with the unchanged length and the increase in width."},"FormulaLatex":"\\Delta A=L(w_2-w_1),\\quad L=\\frac{\\Delta A}{w_2-w_1}","Steps":[{"Ar":"عرض الشريط المضاف 7 ناقص 4، أي 3 أمتار.","En":"The new strip is 7 minus 4, or 3 metres wide."},{"Ar":"مساحة الشريط 18، فنقسمها على 3 لإيجاد طوله.","En":"The strip has area 18, so divide by 3 for its length."}],"Substitution":{"Ar":"$L=\\frac{18}{7-4}=6$","En":"$L=\\frac{18}{7-4}=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"المساحتان 4 × 6 = 24 و7 × 6 = 42، والفرق بينهما 18 م².","En":"The areas are 4 × 6 = 24 and 7 × 6 = 42, a difference of 18 square metres."},"CommonError":{"Ar":"أعطى عرض الشريط المضاف.","En":"Gives the width of the added strip."}}}$mw$::jsonb,$mw$المساحة المضافة مستطيل طوله ثابت وعرضه مقدار الزيادة.

$\Delta A=L(w_2-w_1),\quad L=\frac{\Delta A}{w_2-w_1}$

1. عرض الشريط المضاف 7 ناقص 4، أي 3 أمتار.

2. مساحة الشريط 18، فنقسمها على 3 لإيجاد طوله.

$L=\frac{18}{7-4}=6$

$6$ م

المساحتان 4 × 6 = 24 و7 × 6 = 42، والفرق بينهما 18 م².

أعطى عرض الشريط المضاف.$mw$,$mw$The added area is a rectangle with the unchanged length and the increase in width.

$\Delta A=L(w_2-w_1),\quad L=\frac{\Delta A}{w_2-w_1}$

1. The new strip is 7 minus 4, or 3 metres wide.

2. The strip has area 18, so divide by 3 for its length.

$L=\frac{18}{7-4}=6$

$6$ m

The areas are 4 × 6 = 24 and 7 × 6 = 42, a difference of 18 square metres.

Gives the width of the added strip.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"تخيّل الجزء المضاف شريطاً مستطيلاً على امتداد الطول.","En":"Imagine the addition as a rectangular strip along the length."},{"Ar":"احسب عرض الشريط المضاف واستخدم مساحته.","En":"Find the added strip's width and use its area."}],"Solution":{"Idea":{"Ar":"المساحة المضافة مستطيل طوله ثابت وعرضه مقدار الزيادة.","En":"The added area is a rectangle with the unchanged length and the increase in width."},"FormulaLatex":"\\Delta A=L(w_2-w_1),\\quad L=\\frac{\\Delta A}{w_2-w_1}","Steps":[{"Ar":"عرض الشريط المضاف 7 ناقص 4، أي 3 أمتار.","En":"The new strip is 7 minus 4, or 3 metres wide."},{"Ar":"مساحة الشريط 18، فنقسمها على 3 لإيجاد طوله.","En":"The strip has area 18, so divide by 3 for its length."}],"Substitution":{"Ar":"$L=\\frac{18}{7-4}=6$","En":"$L=\\frac{18}{7-4}=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"المساحتان 4 × 6 = 24 و7 × 6 = 42، والفرق بينهما 18 م².","En":"The areas are 4 × 6 = 24 and 7 × 6 = 42, a difference of 18 square metres."},"CommonError":{"Ar":"أعطى عرض الشريط المضاف.","En":"Gives the width of the added strip."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى عرض الشريط المضاف.","En":"Gives the width of the added strip."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استخدم مقدار زيادة المساحة بوصفه طولاً.","En":"Uses the area increase as a length."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم على مجموع العرضين بدلاً من الفرق بينهما ثم قرّب الناتج.","En":"Divides by the sum instead of the difference of the widths and rounds."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v17-grade-3-latest-departure-with-buffer-1$mw$,$mw$latest-departure-with-buffer$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"وقت الخروج الأخير","En":"Last possible departure"},"Question":{"Ar":"يبدأ عرض الساعة 10:00 صباحاً. يجب أن تصل هند قبل بدايته بـ10 دقائق على الأقل. تستغرق الرحلة 25 دقيقة. ما آخر وقت يمكنها أن تغادر فيه؟","En":"A show starts at 10:00 a.m. Hind must arrive at least 10 minutes before it starts. The trip takes 25 minutes. What is the latest time at which she can leave?"},"Options":[{"LatexCode":"9{:}25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9{:}35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح زمن الرحلة وحده وأغفل وقت الوصول المبكر.","En":"Subtracts the trip alone and misses the arrival buffer."}},{"LatexCode":"9{:}50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى آخر وقت للوصول بدلاً من المغادرة.","En":"Gives the latest arrival rather than departure."}},{"LatexCode":"9{:}15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الدقائق العشر مرتين.","En":"Subtracts the ten-minute buffer twice."}}],"Hints":[{"Ar":"احسب أولاً آخر وقت مسموح للوصول.","En":"First determine the latest acceptable arrival time."},{"Ar":"ارجع 25 دقيقة من وقت الوصول الذي وجدته.","En":"Count back 25 minutes from the arrival time you found."}],"Solution":{"Idea":{"Ar":"نرجع في الزمن من بداية العرض بمقدار هامش الوصول وزمن الرحلة.","En":"Work backward from the show time by the arrival buffer and journey duration."},"FormulaLatex":"t_D=t_S-b-d","Steps":[{"Ar":"آخر وقت مسموح للوصول هو 9:50 صباحاً.","En":"The latest allowed arrival is 9:50 a.m."},{"Ar":"نطرح 25 دقيقة من 9:50 فنصل إلى 9:25 صباحاً.","En":"Subtracting 25 minutes from 9:50 gives 9:25 a.m."},{"Ar":"565 دقيقة بعد منتصف الليل تساوي 9 ساعات و25 دقيقة.","En":"565 minutes after midnight is 9 hours and 25 minutes."}],"Substitution":{"Ar":"$t_D=600-10-25=565\\ \\mathrm{min}$","En":"$t_D=600-10-25=565\\ \\mathrm{min}$"},"Result":{"Ar":"$9{:}25$","En":"$9{:}25$"},"Unit":{"Ar":"صباحاً","En":"a.m."},"Verification":{"Ar":"المغادرة عند 9:25 تعطي وصولاً عند 9:50. وبعدها بدقيقة يصبح الوصول 9:51 ويتبقّى 9 دقائق فقط.","En":"Leaving at 9:25 gives arrival at 9:50. A minute later gives 9:51, leaving only nine minutes."},"CommonError":{"Ar":"طرح زمن الرحلة وحده وأغفل وقت الوصول المبكر.","En":"Subtracts the trip alone and misses the arrival buffer."}}}$mw$::jsonb,$mw$نرجع في الزمن من بداية العرض بمقدار هامش الوصول وزمن الرحلة.

$t_D=t_S-b-d$

1. آخر وقت مسموح للوصول هو 9:50 صباحاً.

2. نطرح 25 دقيقة من 9:50 فنصل إلى 9:25 صباحاً.

3. 565 دقيقة بعد منتصف الليل تساوي 9 ساعات و25 دقيقة.

$t_D=600-10-25=565\ \mathrm{min}$

$9{:}25$ صباحاً

المغادرة عند 9:25 تعطي وصولاً عند 9:50. وبعدها بدقيقة يصبح الوصول 9:51 ويتبقّى 9 دقائق فقط.

طرح زمن الرحلة وحده وأغفل وقت الوصول المبكر.$mw$,$mw$Work backward from the show time by the arrival buffer and journey duration.

$t_D=t_S-b-d$

1. The latest allowed arrival is 9:50 a.m.

2. Subtracting 25 minutes from 9:50 gives 9:25 a.m.

3. 565 minutes after midnight is 9 hours and 25 minutes.

$t_D=600-10-25=565\ \mathrm{min}$

$9{:}25$ a.m.

Leaving at 9:25 gives arrival at 9:50. A minute later gives 9:51, leaving only nine minutes.

Subtracts the trip alone and misses the arrival buffer.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"احسب أولاً آخر وقت مسموح للوصول.","En":"First determine the latest acceptable arrival time."},{"Ar":"ارجع 25 دقيقة من وقت الوصول الذي وجدته.","En":"Count back 25 minutes from the arrival time you found."}],"Solution":{"Idea":{"Ar":"نرجع في الزمن من بداية العرض بمقدار هامش الوصول وزمن الرحلة.","En":"Work backward from the show time by the arrival buffer and journey duration."},"FormulaLatex":"t_D=t_S-b-d","Steps":[{"Ar":"آخر وقت مسموح للوصول هو 9:50 صباحاً.","En":"The latest allowed arrival is 9:50 a.m."},{"Ar":"نطرح 25 دقيقة من 9:50 فنصل إلى 9:25 صباحاً.","En":"Subtracting 25 minutes from 9:50 gives 9:25 a.m."},{"Ar":"565 دقيقة بعد منتصف الليل تساوي 9 ساعات و25 دقيقة.","En":"565 minutes after midnight is 9 hours and 25 minutes."}],"Substitution":{"Ar":"$t_D=600-10-25=565\\ \\mathrm{min}$","En":"$t_D=600-10-25=565\\ \\mathrm{min}$"},"Result":{"Ar":"$9{:}25$","En":"$9{:}25$"},"Unit":{"Ar":"صباحاً","En":"a.m."},"Verification":{"Ar":"المغادرة عند 9:25 تعطي وصولاً عند 9:50. وبعدها بدقيقة يصبح الوصول 9:51 ويتبقّى 9 دقائق فقط.","En":"Leaving at 9:25 gives arrival at 9:50. A minute later gives 9:51, leaving only nine minutes."},"CommonError":{"Ar":"طرح زمن الرحلة وحده وأغفل وقت الوصول المبكر.","En":"Subtracts the trip alone and misses the arrival buffer."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح زمن الرحلة وحده وأغفل وقت الوصول المبكر.","En":"Subtracts the trip alone and misses the arrival buffer."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى آخر وقت للوصول بدلاً من المغادرة.","En":"Gives the latest arrival rather than departure."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح الدقائق العشر مرتين.","En":"Subtracts the ten-minute buffer twice."},"Order":4}]}$mw$),
($mw$growth-v17-grade-4-mixed-unit-mass-across-scales-1$mw$,$mw$mixed-unit-mass-across-scales$mw$,$mw$mass$mw$,$mw$grade-4$mw$,4,1,82,322,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":322,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"قراءة وزن مختلف الوحدات","En":"Mass readings in mixed units"},"Question":{"Ar":"ميزان أول يشير إلى 2 كغ و150 غ لكيس يحتوي على ثمار. ميزان ثان يشير إلى أن كتلة الثمار وحدها 1970 غ. ما كتلة الكيس الفارغ بالغرام؟","En":"One scale shows 2 kg 150 g for a bag and the fruit inside it. A second scale shows 1970 g for the fruit alone. What is the mass of the empty bag in grams?"},"Options":[{"LatexCode":"30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يضف 150 غ إلى الكيلوغرامين قبل الطرح.","En":"Omits the 150 g from the combined reading before subtracting."}},{"LatexCode":"150","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اعتبر جزء الغرامات الظاهر كتلة الكيس مباشرة.","En":"Treats the grams portion of the first reading as the bag's mass."}},{"LatexCode":"180","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1970","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى كتلة الثمار وحدها.","En":"Reports the fruit mass."}}],"Hints":[{"Ar":"وحّد وحدة قراءتي الميزان.","En":"Write both scale readings in one unit."},{"Ar":"اطرح الثمار وحدها من كتلة الكيس والثمار معاً.","En":"Subtract the fruit mass from the total for the bag and fruit."}],"Solution":{"Idea":{"Ar":"كتلة الكيس الفارغ هي الكتلة الإجمالية ناقص كتلة المحتويات بعد توحيد الوحدات.","En":"Empty bag mass equals total mass minus contents mass after converting units."},"FormulaLatex":"m_{\\mathrm{bag}}=1000k+g-m_{\\mathrm{fruit}}","Steps":[{"Ar":"تساوي كتلة الكيس والثمار 2150 غ.","En":"The bag and fruit together have mass 2150 g."},{"Ar":"نطرح 1970 غ من 2150 غ لإبقاء كتلة الكيس وحده.","En":"Subtracting 1970 g from 2150 g leaves the bag's mass."}],"Substitution":{"Ar":"$2150-1970=180$","En":"$2150-1970=180$"},"Result":{"Ar":"$180$","En":"$180$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"إذا جمعنا 1970 و180 عدنا إلى 2150 غ.","En":"Adding 1970 and 180 gives the original 2150 g."},"CommonError":{"Ar":"لم يضف 150 غ إلى الكيلوغرامين قبل الطرح.","En":"Omits the 150 g from the combined reading before subtracting."}}}$mw$::jsonb,$mw$كتلة الكيس الفارغ هي الكتلة الإجمالية ناقص كتلة المحتويات بعد توحيد الوحدات.

$m_{\mathrm{bag}}=1000k+g-m_{\mathrm{fruit}}$

1. تساوي كتلة الكيس والثمار 2150 غ.

2. نطرح 1970 غ من 2150 غ لإبقاء كتلة الكيس وحده.

$2150-1970=180$

$180$ غ

إذا جمعنا 1970 و180 عدنا إلى 2150 غ.

لم يضف 150 غ إلى الكيلوغرامين قبل الطرح.$mw$,$mw$Empty bag mass equals total mass minus contents mass after converting units.

$m_{\mathrm{bag}}=1000k+g-m_{\mathrm{fruit}}$

1. The bag and fruit together have mass 2150 g.

2. Subtracting 1970 g from 2150 g leaves the bag's mass.

$2150-1970=180$

$180$ g

Adding 1970 and 180 gives the original 2150 g.

Omits the 150 g from the combined reading before subtracting.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"وحّد وحدة قراءتي الميزان.","En":"Write both scale readings in one unit."},{"Ar":"اطرح الثمار وحدها من كتلة الكيس والثمار معاً.","En":"Subtract the fruit mass from the total for the bag and fruit."}],"Solution":{"Idea":{"Ar":"كتلة الكيس الفارغ هي الكتلة الإجمالية ناقص كتلة المحتويات بعد توحيد الوحدات.","En":"Empty bag mass equals total mass minus contents mass after converting units."},"FormulaLatex":"m_{\\mathrm{bag}}=1000k+g-m_{\\mathrm{fruit}}","Steps":[{"Ar":"تساوي كتلة الكيس والثمار 2150 غ.","En":"The bag and fruit together have mass 2150 g."},{"Ar":"نطرح 1970 غ من 2150 غ لإبقاء كتلة الكيس وحده.","En":"Subtracting 1970 g from 2150 g leaves the bag's mass."}],"Substitution":{"Ar":"$2150-1970=180$","En":"$2150-1970=180$"},"Result":{"Ar":"$180$","En":"$180$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"إذا جمعنا 1970 و180 عدنا إلى 2150 غ.","En":"Adding 1970 and 180 gives the original 2150 g."},"CommonError":{"Ar":"لم يضف 150 غ إلى الكيلوغرامين قبل الطرح.","En":"Omits the 150 g from the combined reading before subtracting."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يضف 150 غ إلى الكيلوغرامين قبل الطرح.","En":"Omits the 150 g from the combined reading before subtracting."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"اعتبر جزء الغرامات الظاهر كتلة الكيس مباشرة.","En":"Treats the grams portion of the first reading as the bag's mass."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى كتلة الثمار وحدها.","En":"Reports the fruit mass."},"Order":4}]}$mw$),
($mw$growth-v17-grade-5-repeated-fill-from-smaller-dispenser-1$mw$,$mw$repeated-fill-from-smaller-dispenser$mw$,$mw$capacity$mw$,$mw$grade-5$mw$,5,1,82,320,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":320,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"عدد التعبئات الكاملة","En":"Number of full refills"},"Question":{"Ar":"في موزّع 1800 مل من الماء. يُستخدم لملء زجاجة سعتها 500 مل تحتوي أصلاً على 200 مل. بعد كل تعبئة تُفرغ الزجاجة تماماً في وعاء آخر ثم تُعاد للموزّع. كم مرة يمكن أن تصبح الزجاجة ممتلئة تماماً؟","En":"A dispenser contains 1800 mL of water. It tops up a 500 mL bottle that initially holds 200 mL. After each fill, the bottle is emptied completely into another container and brought back. How many times can the bottle become completely full?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل الزجاجة على أنها فارغة منذ البداية.","En":"Treats the bottle as empty from the beginning."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل 300 مل لكل تعبئة.","En":"Uses 300 mL for every fill."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الماء الموجود أصلاً كتعبئة كاملة إضافية.","En":"Counts the initial water as an extra full fill."}}],"Hints":[{"Ar":"هل تحتاج التعبئة الأولى إلى الكمية نفسها التي تحتاجها التالية؟","En":"Does the first fill require the same amount as the later ones?"},{"Ar":"اطرح كمية التعبئة الأولى ثم عد التعبئات الكاملة من الباقي.","En":"Subtract the first fill and count full refills from the remainder."}],"Solution":{"Idea":{"Ar":"التعبئة الأولى تحتاج فقط إلى الكمية الناقصة، والتعبئات التالية تبدأ من زجاجة فارغة.","En":"The first fill requires only the missing amount; later fills start with an empty bottle."},"FormulaLatex":"N=1+\\frac{1800-(500-200)}{500}","Steps":[{"Ar":"تحتاج الزجاجة أول مرة إلى 300 مل، فيبقى في الموزع 1500 مل.","En":"The first fill takes 300 mL, leaving 1500 mL in the dispenser."},{"Ar":"يُعاد ملؤها وهي فارغة ثلاث مرات من هذه الكمية.","En":"The remaining water fills the empty bottle three more times."}],"Substitution":{"Ar":"$1+1500/500=4$","En":"$1+1500/500=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"مرات","En":"fills"},"Verification":{"Ar":"تستهلك التعبئات الأربع 300 + 500 + 500 + 500 مل، وهو كل ماء الموزع.","En":"Four fills use 300 + 500 + 500 + 500 mL, the entire dispenser supply."},"CommonError":{"Ar":"لا تعامل التعبئة الأولى مثل التعبئات اللاحقة، ولا تعدّ التعبئة الجزئية تعبئة كاملة.","En":"Do not treat the first fill like later fills or count partial fills as complete."}}}$mw$::jsonb,$mw$التعبئة الأولى تحتاج فقط إلى الكمية الناقصة، والتعبئات التالية تبدأ من زجاجة فارغة.

$N=1+\frac{1800-(500-200)}{500}$

1. تحتاج الزجاجة أول مرة إلى 300 مل، فيبقى في الموزع 1500 مل.

2. يُعاد ملؤها وهي فارغة ثلاث مرات من هذه الكمية.

$1+1500/500=4$

$4$ مرات

تستهلك التعبئات الأربع 300 + 500 + 500 + 500 مل، وهو كل ماء الموزع.

لا تعامل التعبئة الأولى مثل التعبئات اللاحقة، ولا تعدّ التعبئة الجزئية تعبئة كاملة.$mw$,$mw$The first fill requires only the missing amount; later fills start with an empty bottle.

$N=1+\frac{1800-(500-200)}{500}$

1. The first fill takes 300 mL, leaving 1500 mL in the dispenser.

2. The remaining water fills the empty bottle three more times.

$1+1500/500=4$

$4$ fills

Four fills use 300 + 500 + 500 + 500 mL, the entire dispenser supply.

Do not treat the first fill like later fills or count partial fills as complete.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"هل تحتاج التعبئة الأولى إلى الكمية نفسها التي تحتاجها التالية؟","En":"Does the first fill require the same amount as the later ones?"},{"Ar":"اطرح كمية التعبئة الأولى ثم عد التعبئات الكاملة من الباقي.","En":"Subtract the first fill and count full refills from the remainder."}],"Solution":{"Idea":{"Ar":"التعبئة الأولى تحتاج فقط إلى الكمية الناقصة، والتعبئات التالية تبدأ من زجاجة فارغة.","En":"The first fill requires only the missing amount; later fills start with an empty bottle."},"FormulaLatex":"N=1+\\frac{1800-(500-200)}{500}","Steps":[{"Ar":"تحتاج الزجاجة أول مرة إلى 300 مل، فيبقى في الموزع 1500 مل.","En":"The first fill takes 300 mL, leaving 1500 mL in the dispenser."},{"Ar":"يُعاد ملؤها وهي فارغة ثلاث مرات من هذه الكمية.","En":"The remaining water fills the empty bottle three more times."}],"Substitution":{"Ar":"$1+1500/500=4$","En":"$1+1500/500=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"مرات","En":"fills"},"Verification":{"Ar":"تستهلك التعبئات الأربع 300 + 500 + 500 + 500 مل، وهو كل ماء الموزع.","En":"Four fills use 300 + 500 + 500 + 500 mL, the entire dispenser supply."},"CommonError":{"Ar":"لا تعامل التعبئة الأولى مثل التعبئات اللاحقة، ولا تعدّ التعبئة الجزئية تعبئة كاملة.","En":"Do not treat the first fill like later fills or count partial fills as complete."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عامل الزجاجة على أنها فارغة منذ البداية.","En":"Treats the bottle as empty from the beginning."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل 300 مل لكل تعبئة.","En":"Uses 300 mL for every fill."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الماء الموجود أصلاً كتعبئة كاملة إضافية.","En":"Counts the initial water as an extra full fill."},"Order":4}]}$mw$),
($mw$growth-v17-grade-6-fixed-subgroup-divisibility-minimum-1$mw$,$mw$fixed-subgroup-divisibility-minimum$mw$,$mw$p-fractions-decimals-basic-percentages$mw$,$mw$grade-6$mw$,6,1,21,93,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":93,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"أقل حجم لمجموعة","En":"Smallest group size"},"Question":{"Ar":"اختار 35% من أعضاء فريق نشاطاً واختار 40% نشاطاً ثانياً، واختار الأعضاء الباقون نشاطاً ثالثاً. يختار كل عضو نشاطاً واحداً فقط. إذا كانت النسب دقيقة، فما أصغر عدد ممكن لأعضاء الفريق؟","En":"Exactly 35% of a club chose one activity and 40% chose a second. All remaining members chose a third, with one activity per member. What is the smallest possible number of members?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اكتفى بمقام الكسر الذي يمثل 40%.","En":"Uses only the denominator of the fraction for 40%."}},{"LatexCode":"35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل النسبة المئوية كعدد الأعضاء.","En":"Treats the percentage as the number of members."}},{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"100","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن المقام 100 لا يمكن تبسيطه.","En":"Assumes the percent denominator 100 cannot be reduced."}}],"Hints":[{"Ar":"يجب أن يكون عدد أعضاء كل نشاط عدداً صحيحاً.","En":"The count for every activity must be a whole number."},{"Ar":"حوّل 35% و40% إلى كسرين في أبسط صورة.","En":"Convert 35% and 40% into simplest fractions."}],"Solution":{"Idea":{"Ar":"النسب الدقيقة تفرض أن أعداد الأشخاص الناتجة عنها أعداد صحيحة؛ نبحث عن أصغر عدد كلي يحقق ذلك.","En":"Exact percentages require whole-person counts; find the smallest total satisfying all constraints."},"FormulaLatex":"35\\%=\\frac{7}{20},\\quad 40\\%=\\frac{2}{5}","Steps":[{"Ar":"بسّط النسب: $35\\%=\\frac7{20}$ و$40\\%=\\frac25$.","En":"Reduce the percentages: $35\\%=\\frac7{20}$ and $40\\%=\\frac25$."},{"Ar":"لأن 7 و20 أوليان فيما بينهما، فلا بد أن يكون العدد الكلي من مضاعفات 20.","En":"Since 7 and 20 are coprime, the total must be a multiple of 20."},{"Ar":"العدد 20 يقبل القسمة على 5 أيضاً، فيحقق الشرط الثاني.","En":"Twenty is also divisible by 5, meeting the second requirement."}],"Substitution":{"Ar":"$N=20,\\quad 20\\times\\frac7{20}=7,\\quad 20\\times\\frac25=8$","En":"$N=20,\\quad 20\\times\\frac7{20}=7,\\quad 20\\times\\frac25=8$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"عضواً","En":"members"},"Verification":{"Ar":"من أصل 20 يختار الأنشطة الثلاثة 7 و8 و5 أعضاء.","En":"With 20 members, the activity counts are 7, 8 and 5."},"CommonError":{"Ar":"اكتفى بمقام الكسر الذي يمثل 40%.","En":"Uses only the denominator of the fraction for 40%."}}}$mw$::jsonb,$mw$النسب الدقيقة تفرض أن أعداد الأشخاص الناتجة عنها أعداد صحيحة؛ نبحث عن أصغر عدد كلي يحقق ذلك.

$35\%=\frac{7}{20},\quad 40\%=\frac{2}{5}$

1. بسّط النسب: $35\%=\frac7{20}$ و$40\%=\frac25$.

2. لأن 7 و20 أوليان فيما بينهما، فلا بد أن يكون العدد الكلي من مضاعفات 20.

3. العدد 20 يقبل القسمة على 5 أيضاً، فيحقق الشرط الثاني.

$N=20,\quad 20\times\frac7{20}=7,\quad 20\times\frac25=8$

$20$ عضواً

من أصل 20 يختار الأنشطة الثلاثة 7 و8 و5 أعضاء.

اكتفى بمقام الكسر الذي يمثل 40%.$mw$,$mw$Exact percentages require whole-person counts; find the smallest total satisfying all constraints.

$35\%=\frac{7}{20},\quad 40\%=\frac{2}{5}$

1. Reduce the percentages: $35\%=\frac7{20}$ and $40\%=\frac25$.

2. Since 7 and 20 are coprime, the total must be a multiple of 20.

3. Twenty is also divisible by 5, meeting the second requirement.

$N=20,\quad 20\times\frac7{20}=7,\quad 20\times\frac25=8$

$20$ members

With 20 members, the activity counts are 7, 8 and 5.

Uses only the denominator of the fraction for 40%.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"يجب أن يكون عدد أعضاء كل نشاط عدداً صحيحاً.","En":"The count for every activity must be a whole number."},{"Ar":"حوّل 35% و40% إلى كسرين في أبسط صورة.","En":"Convert 35% and 40% into simplest fractions."}],"Solution":{"Idea":{"Ar":"النسب الدقيقة تفرض أن أعداد الأشخاص الناتجة عنها أعداد صحيحة؛ نبحث عن أصغر عدد كلي يحقق ذلك.","En":"Exact percentages require whole-person counts; find the smallest total satisfying all constraints."},"FormulaLatex":"35\\%=\\frac{7}{20},\\quad 40\\%=\\frac{2}{5}","Steps":[{"Ar":"بسّط النسب: $35\\%=\\frac7{20}$ و$40\\%=\\frac25$.","En":"Reduce the percentages: $35\\%=\\frac7{20}$ and $40\\%=\\frac25$."},{"Ar":"لأن 7 و20 أوليان فيما بينهما، فلا بد أن يكون العدد الكلي من مضاعفات 20.","En":"Since 7 and 20 are coprime, the total must be a multiple of 20."},{"Ar":"العدد 20 يقبل القسمة على 5 أيضاً، فيحقق الشرط الثاني.","En":"Twenty is also divisible by 5, meeting the second requirement."}],"Substitution":{"Ar":"$N=20,\\quad 20\\times\\frac7{20}=7,\\quad 20\\times\\frac25=8$","En":"$N=20,\\quad 20\\times\\frac7{20}=7,\\quad 20\\times\\frac25=8$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"عضواً","En":"members"},"Verification":{"Ar":"من أصل 20 يختار الأنشطة الثلاثة 7 و8 و5 أعضاء.","En":"With 20 members, the activity counts are 7, 8 and 5."},"CommonError":{"Ar":"اكتفى بمقام الكسر الذي يمثل 40%.","En":"Uses only the denominator of the fraction for 40%."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اكتفى بمقام الكسر الذي يمثل 40%.","En":"Uses only the denominator of the fraction for 40%."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عامل النسبة المئوية كعدد الأعضاء.","En":"Treats the percentage as the number of members."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن المقام 100 لا يمكن تبسيطه.","En":"Assumes the percent denominator 100 cannot be reduced."},"Order":4}]}$mw$),
($mw$growth-v17-grade-7-phase-offset-synchronization-1$mw$,$mw$phase-offset-synchronization$mw$,$mw$middle-lcm$mw$,$mw$grade-7$mw$,7,2,5,24,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":24,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"أول تزامن بعد البداية","En":"First synchronization after startup"},"Question":{"Ar":"يصدر المنبّه الأول إشارة بعد 4 ثوانٍ من البدء ثم كل 6 ثوانٍ. يصدر الثاني إشارة بعد ثانيتين من البدء ثم كل 4 ثوانٍ. عند أي ثانية يتزامنان لأول مرة؟","En":"One alarm first beeps 4 seconds after startup and then every 6 seconds. Another first beeps at 2 seconds and then every 4 seconds. At which second do they first beep together?"},"Options":[{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب المضاعف المشترك الأصغر للفاصلين وحدهما.","En":"Computes the least common multiple of the intervals alone."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف عند ثاني إشارة للمنبه الثاني.","En":"Stops at the second alarm’s second beep."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تجاوز أول تزامن واختار الإشارة الثالثة للأول.","En":"Skips the first coincidence and chooses the first alarm’s third beep."}}],"Hints":[{"Ar":"اكتب أوقات الإشارات الأولى لكل منبه.","En":"List the first few beep times for both alarms."},{"Ar":"ابدأ كل قائمة عند وقت أول إشارة قبل إضافة الفاصل.","En":"Start each list at its first beep time before adding its interval."}],"Solution":{"Idea":{"Ar":"نبحث عن أول وقت مشترك بين سلسلتي الإشارات، مع مراعاة اختلاف وقت البداية.","En":"Find the first shared event time while accounting for different starting offsets."},"FormulaLatex":"t=4+6a=2+4b,\\quad a,b\\in\\mathbb{Z}_{\\ge0}","Steps":[{"Ar":"أوقات الأول 4 و10 و16، وأوقات الثاني 2 و6 و10 و14.","En":"The first alarm beeps at 4, 10, 16, and the second at 2, 6, 10, 14."},{"Ar":"أول قيمة مشتركة هي 10.","En":"The first shared time is 10."}],"Substitution":{"Ar":"$4+6=2+2(4)=10$","En":"$4+6=2+2(4)=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"ثانية","En":"seconds"},"Verification":{"Ar":"قبل الثانية 10 لم يصدر الأول إلا عند 4، ولم يصدر الثاني عند 4.","En":"Before 10 the first only beeps at 4, and the second does not beep then."},"CommonError":{"Ar":"حسب المضاعف المشترك الأصغر للفاصلين وحدهما.","En":"Computes the least common multiple of the intervals alone."}}}$mw$::jsonb,$mw$نبحث عن أول وقت مشترك بين سلسلتي الإشارات، مع مراعاة اختلاف وقت البداية.

$t=4+6a=2+4b,\quad a,b\in\mathbb{Z}_{\ge0}$

1. أوقات الأول 4 و10 و16، وأوقات الثاني 2 و6 و10 و14.

2. أول قيمة مشتركة هي 10.

$4+6=2+2(4)=10$

$10$ ثانية

قبل الثانية 10 لم يصدر الأول إلا عند 4، ولم يصدر الثاني عند 4.

حسب المضاعف المشترك الأصغر للفاصلين وحدهما.$mw$,$mw$Find the first shared event time while accounting for different starting offsets.

$t=4+6a=2+4b,\quad a,b\in\mathbb{Z}_{\ge0}$

1. The first alarm beeps at 4, 10, 16, and the second at 2, 6, 10, 14.

2. The first shared time is 10.

$4+6=2+2(4)=10$

$10$ seconds

Before 10 the first only beeps at 4, and the second does not beep then.

Computes the least common multiple of the intervals alone.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"اكتب أوقات الإشارات الأولى لكل منبه.","En":"List the first few beep times for both alarms."},{"Ar":"ابدأ كل قائمة عند وقت أول إشارة قبل إضافة الفاصل.","En":"Start each list at its first beep time before adding its interval."}],"Solution":{"Idea":{"Ar":"نبحث عن أول وقت مشترك بين سلسلتي الإشارات، مع مراعاة اختلاف وقت البداية.","En":"Find the first shared event time while accounting for different starting offsets."},"FormulaLatex":"t=4+6a=2+4b,\\quad a,b\\in\\mathbb{Z}_{\\ge0}","Steps":[{"Ar":"أوقات الأول 4 و10 و16، وأوقات الثاني 2 و6 و10 و14.","En":"The first alarm beeps at 4, 10, 16, and the second at 2, 6, 10, 14."},{"Ar":"أول قيمة مشتركة هي 10.","En":"The first shared time is 10."}],"Substitution":{"Ar":"$4+6=2+2(4)=10$","En":"$4+6=2+2(4)=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"ثانية","En":"seconds"},"Verification":{"Ar":"قبل الثانية 10 لم يصدر الأول إلا عند 4، ولم يصدر الثاني عند 4.","En":"Before 10 the first only beeps at 4, and the second does not beep then."},"CommonError":{"Ar":"حسب المضاعف المشترك الأصغر للفاصلين وحدهما.","En":"Computes the least common multiple of the intervals alone."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب المضاعف المشترك الأصغر للفاصلين وحدهما.","En":"Computes the least common multiple of the intervals alone."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"توقف عند ثاني إشارة للمنبه الثاني.","En":"Stops at the second alarm’s second beep."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تجاوز أول تزامن واختار الإشارة الثالثة للأول.","En":"Skips the first coincidence and chooses the first alarm’s third beep."},"Order":4}]}$mw$),
($mw$growth-v17-grade-7-three-line-vertical-angle-sum-1$mw$,$mw$three-line-vertical-angle-sum$mw$,$mw$middle-vertical-angles$mw$,$mw$grade-7$mw$,7,2,8,38,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":38,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"ثلاثة مستقيمات حول نقطة","En":"Three lines around one point"},"Question":{"Ar":"تتقاطع ثلاثة مستقيمات مختلفة في نقطة. قياسات ثلاث زوايا متتالية بين أنصاف المستقيمات في نصف دورة هي $x^\\circ$ و$2x^\\circ$ و45°. ما قياس الزاوية المقابلة بالرأس للزاوية التي قياسها $2x^\\circ$؟","En":"Three distinct lines cross at one point. The consecutive angles in one half turn measure x°, 2x° and 45°. What is the measure of the angle vertically opposite the 2x° angle?"},"Options":[{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ذكر x بدلاً من ضعفها.","En":"Reports x instead of twice x."}},{"LatexCode":"90","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"135","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ذكر مجموع x و2x.","En":"Gives the sum of x and 2x."}},{"LatexCode":"180","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ذكر مجموع الزوايا في نصف الدورة.","En":"Gives the total for the half turn."}}],"Hints":[{"Ar":"كم درجة في نصف دورة؟","En":"How many degrees are in a half turn?"},{"Ar":"أوجد x ثم استخدم تساوي الزاويتين المتقابلتين بالرأس.","En":"Find x, then use equality of vertically opposite angles."}],"Solution":{"Idea":{"Ar":"مجموع الزوايا المتجاورة في نصف دورة 180 درجة، والمتقابلتان بالرأس متساويتان.","En":"Adjacent angles forming a half-turn sum to 180 degrees, and vertical angles are equal."},"FormulaLatex":"x+2x+45=180","Steps":[{"Ar":"بطرح 45 من 180 ينتج 3x = 135، فيكون x = 45.","En":"Subtracting 45 from 180 gives 3x = 135, so x = 45."},{"Ar":"زاوية 2x تساوي 90 درجة والمقابلة لها بالرأس تساويها.","En":"The 2x angle is 90 degrees and its vertically opposite angle has the same measure."}],"Substitution":{"Ar":"$2(45)=90$","En":"$2(45)=90$"},"Result":{"Ar":"$90$","En":"$90$"},"Unit":{"Ar":"درجة","En":"degrees"},"Verification":{"Ar":"النصف الآخر له القياسات 45 و90 و45 بالترتيب نفسه، فيكتمل 360 درجة.","En":"The other half has angles 45, 90 and 45 in the same order, completing 360 degrees."},"CommonError":{"Ar":"ذكر x بدلاً من ضعفها.","En":"Reports x instead of twice x."}}}$mw$::jsonb,$mw$مجموع الزوايا المتجاورة في نصف دورة 180 درجة، والمتقابلتان بالرأس متساويتان.

$x+2x+45=180$

1. بطرح 45 من 180 ينتج 3x = 135، فيكون x = 45.

2. زاوية 2x تساوي 90 درجة والمقابلة لها بالرأس تساويها.

$2(45)=90$

$90$ درجة

النصف الآخر له القياسات 45 و90 و45 بالترتيب نفسه، فيكتمل 360 درجة.

ذكر x بدلاً من ضعفها.$mw$,$mw$Adjacent angles forming a half-turn sum to 180 degrees, and vertical angles are equal.

$x+2x+45=180$

1. Subtracting 45 from 180 gives 3x = 135, so x = 45.

2. The 2x angle is 90 degrees and its vertically opposite angle has the same measure.

$2(45)=90$

$90$ degrees

The other half has angles 45, 90 and 45 in the same order, completing 360 degrees.

Reports x instead of twice x.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"كم درجة في نصف دورة؟","En":"How many degrees are in a half turn?"},{"Ar":"أوجد x ثم استخدم تساوي الزاويتين المتقابلتين بالرأس.","En":"Find x, then use equality of vertically opposite angles."}],"Solution":{"Idea":{"Ar":"مجموع الزوايا المتجاورة في نصف دورة 180 درجة، والمتقابلتان بالرأس متساويتان.","En":"Adjacent angles forming a half-turn sum to 180 degrees, and vertical angles are equal."},"FormulaLatex":"x+2x+45=180","Steps":[{"Ar":"بطرح 45 من 180 ينتج 3x = 135، فيكون x = 45.","En":"Subtracting 45 from 180 gives 3x = 135, so x = 45."},{"Ar":"زاوية 2x تساوي 90 درجة والمقابلة لها بالرأس تساويها.","En":"The 2x angle is 90 degrees and its vertically opposite angle has the same measure."}],"Substitution":{"Ar":"$2(45)=90$","En":"$2(45)=90$"},"Result":{"Ar":"$90$","En":"$90$"},"Unit":{"Ar":"درجة","En":"degrees"},"Verification":{"Ar":"النصف الآخر له القياسات 45 و90 و45 بالترتيب نفسه، فيكتمل 360 درجة.","En":"The other half has angles 45, 90 and 45 in the same order, completing 360 degrees."},"CommonError":{"Ar":"ذكر x بدلاً من ضعفها.","En":"Reports x instead of twice x."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ذكر x بدلاً من ضعفها.","En":"Reports x instead of twice x."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ذكر مجموع x و2x.","En":"Gives the sum of x and 2x."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ذكر مجموع الزوايا في نصف الدورة.","En":"Gives the total for the half turn."},"Order":4}]}$mw$),
($mw$growth-v17-grade-8-projection-overhang-from-shadow-1$mw$,$mw$projection-overhang-from-shadow$mw$,$mw$middle-similar-triangles$mw$,$mw$grade-8$mw$,8,2,34,40,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":40,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"ظل يتجاوز حافة","En":"A shadow extending past an edge"},"Question":{"Ar":"في وقت واحد وعلى أرض أفقية، يلقي عمود رأسي ارتفاعه 2 م ظلاً طوله 3 م. في اتجاه الظل نفسه تبدأ حافة منطقة مبلطة على بعد 7 م من قاعدة شجرة رأسية ارتفاعها 6 م. كم متراً يمتد ظل الشجرة بعد تلك الحافة؟","En":"At the same time on level ground, a 2 m vertical post casts a 3 m shadow. In the shadow direction, the edge of a paved area begins 7 m from the base of a 6 m vertical tree. How far does the tree’s shadow extend past that edge?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ذكر طول ظل الشجرة كله.","En":"Reports the entire tree shadow."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نقل طول ظل العمود إلى الشجرة.","En":"Uses the post shadow length for the tree."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع طول الظل ومسافة الحافة.","En":"Adds the shadow length and the edge distance."}}],"Hints":[{"Ar":"أوجد طول ظل الشجرة كاملاً قبل مقارنة الحافة.","En":"Find the whole length of the tree’s shadow before using the edge."},{"Ar":"تتشابه المثلثات الناتجة عن الظلال، لذلك معامل تكبير الطول هو نفسه معامل تكبير الارتفاع.","En":"The shadow triangles are similar, so lengths scale by the same factor as heights."}],"Solution":{"Idea":{"Ar":"الأشعة المتوازية في الوقت نفسه تعطي مثلثين متشابهين، فنحسب الظل الكامل ثم الجزء المتجاوز للحافة.","En":"Parallel rays at the same time produce similar triangles; find the full shadow then subtract the distance to the edge."},"FormulaLatex":"\\frac{s}{6}=\\frac32,\\quad d=s-7","Steps":[{"Ar":"ارتفاع الشجرة ثلاثة أمثال ارتفاع العمود، فطول ظلها ثلاثة أمثال 3 م، أي 9 م.","En":"The tree is three times the post height, so its shadow is three times 3 m, or 9 m."},{"Ar":"الحافة تقع على بعد 7 م، فيتبقى متران بعد الحافة.","En":"The edge is at 7 m, leaving two metres beyond it."}],"Substitution":{"Ar":"$9-7=2$","En":"$9-7=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"المسافة إلى الحافة والمقدار المتجاوز لها يجتمعان إلى 9 م، والنسبة 9 إلى 6 تساوي 3 إلى 2.","En":"The distance to the edge plus the overhang is 9 m, and 9 to 6 equals 3 to 2."},"CommonError":{"Ar":"ذكر طول ظل الشجرة كله.","En":"Reports the entire tree shadow."}}}$mw$::jsonb,$mw$الأشعة المتوازية في الوقت نفسه تعطي مثلثين متشابهين، فنحسب الظل الكامل ثم الجزء المتجاوز للحافة.

$\frac{s}{6}=\frac32,\quad d=s-7$

1. ارتفاع الشجرة ثلاثة أمثال ارتفاع العمود، فطول ظلها ثلاثة أمثال 3 م، أي 9 م.

2. الحافة تقع على بعد 7 م، فيتبقى متران بعد الحافة.

$9-7=2$

$2$ م

المسافة إلى الحافة والمقدار المتجاوز لها يجتمعان إلى 9 م، والنسبة 9 إلى 6 تساوي 3 إلى 2.

ذكر طول ظل الشجرة كله.$mw$,$mw$Parallel rays at the same time produce similar triangles; find the full shadow then subtract the distance to the edge.

$\frac{s}{6}=\frac32,\quad d=s-7$

1. The tree is three times the post height, so its shadow is three times 3 m, or 9 m.

2. The edge is at 7 m, leaving two metres beyond it.

$9-7=2$

$2$ m

The distance to the edge plus the overhang is 9 m, and 9 to 6 equals 3 to 2.

Reports the entire tree shadow.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"أوجد طول ظل الشجرة كاملاً قبل مقارنة الحافة.","En":"Find the whole length of the tree’s shadow before using the edge."},{"Ar":"تتشابه المثلثات الناتجة عن الظلال، لذلك معامل تكبير الطول هو نفسه معامل تكبير الارتفاع.","En":"The shadow triangles are similar, so lengths scale by the same factor as heights."}],"Solution":{"Idea":{"Ar":"الأشعة المتوازية في الوقت نفسه تعطي مثلثين متشابهين، فنحسب الظل الكامل ثم الجزء المتجاوز للحافة.","En":"Parallel rays at the same time produce similar triangles; find the full shadow then subtract the distance to the edge."},"FormulaLatex":"\\frac{s}{6}=\\frac32,\\quad d=s-7","Steps":[{"Ar":"ارتفاع الشجرة ثلاثة أمثال ارتفاع العمود، فطول ظلها ثلاثة أمثال 3 م، أي 9 م.","En":"The tree is three times the post height, so its shadow is three times 3 m, or 9 m."},{"Ar":"الحافة تقع على بعد 7 م، فيتبقى متران بعد الحافة.","En":"The edge is at 7 m, leaving two metres beyond it."}],"Substitution":{"Ar":"$9-7=2$","En":"$9-7=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"م","En":"m"},"Verification":{"Ar":"المسافة إلى الحافة والمقدار المتجاوز لها يجتمعان إلى 9 م، والنسبة 9 إلى 6 تساوي 3 إلى 2.","En":"The distance to the edge plus the overhang is 9 m, and 9 to 6 equals 3 to 2."},"CommonError":{"Ar":"ذكر طول ظل الشجرة كله.","En":"Reports the entire tree shadow."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ذكر طول ظل الشجرة كله.","En":"Reports the entire tree shadow."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"نقل طول ظل العمود إلى الشجرة.","En":"Uses the post shadow length for the tree."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع طول الظل ومسافة الحافة.","En":"Adds the shadow length and the edge distance."},"Order":4}]}$mw$);
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
