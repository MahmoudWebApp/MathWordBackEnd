-- One-time owner-authorized v31 primary depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v31-grade-1-compare-identical-informal-units-1$mw$,$mw$compare-identical-informal-units$mw$,$mw$length$mw$,$mw$grade-1$mw$,1,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مقارنة الأطوال بوحدة مشتركة","En":"Comparing lengths with a common unit"},"Question":{"Ar":"غطت خمسة مشابك ورقية متطابقة طول قلم أحمر، وغطت سبعة مشابك من النوع نفسه طول قلم أزرق، دون فراغات أو تداخل. كم مشبكاً يغطي الفرق بين الطولين؟","En":"Five identical paperclips cover a red pencil exactly, and seven of the same paperclips cover a blue pencil exactly, without gaps or overlap. How many paperclips cover the difference in lengths?"},"Options":[{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طول الأحمر وحده.","En":"Red pencil length alone."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طول الأزرق وحده.","En":"Blue pencil length alone."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع الطولين لا الفرق.","En":"Sum of lengths, not the difference."}}],"Hints":[{"Ar":"الوحدات متساوية، فقارن العدين.","En":"The units are equal, so compare the counts."},{"Ar":"طابق خمس وحدات من كل قياس وعد الباقي.","En":"Match five units from each measurement and count the remainder."}],"Solution":{"Idea":{"Ar":"عند قياس طولين بوحدات متطابقة، يساوي فرق الطول فرق عددي الوحدات.","En":"For lengths measured in identical units, subtract their unit counts."},"FormulaLatex":"7-5","Steps":[{"Ar":"طول الأزرق سبع وحدات والأحمر خمس.","En":"Blue measures seven units and red five."},{"Ar":"تبقى وحدتان بعد مطابقة خمس من كل طول.","En":"Two units remain after matching five from each length."}],"Substitution":{"Ar":"$7-5=2$","En":"$7-5=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"مشابك","En":"Paperclips"},"Verification":{"Ar":"5+2=7 يؤكد الفرق.","En":"5+2=7 confirms the difference."},"CommonError":{"Ar":"لا تجمع الطولين عند طلب الفرق.","En":"Do not add lengths when asked for the difference."}}}$mw$::jsonb,$mw$عند قياس طولين بوحدات متطابقة، يساوي فرق الطول فرق عددي الوحدات.

$7-5$

1. طول الأزرق سبع وحدات والأحمر خمس.

2. تبقى وحدتان بعد مطابقة خمس من كل طول.

$7-5=2$

$2$ مشابك

5+2=7 يؤكد الفرق.

لا تجمع الطولين عند طلب الفرق.$mw$,$mw$For lengths measured in identical units, subtract their unit counts.

$7-5$

1. Blue measures seven units and red five.

2. Two units remain after matching five from each length.

$7-5=2$

$2$ Paperclips

5+2=7 confirms the difference.

Do not add lengths when asked for the difference.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"الوحدات متساوية، فقارن العدين.","En":"The units are equal, so compare the counts."},{"Ar":"طابق خمس وحدات من كل قياس وعد الباقي.","En":"Match five units from each measurement and count the remainder."}],"Solution":{"Idea":{"Ar":"عند قياس طولين بوحدات متطابقة، يساوي فرق الطول فرق عددي الوحدات.","En":"For lengths measured in identical units, subtract their unit counts."},"FormulaLatex":"7-5","Steps":[{"Ar":"طول الأزرق سبع وحدات والأحمر خمس.","En":"Blue measures seven units and red five."},{"Ar":"تبقى وحدتان بعد مطابقة خمس من كل طول.","En":"Two units remain after matching five from each length."}],"Substitution":{"Ar":"$7-5=2$","En":"$7-5=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"مشابك","En":"Paperclips"},"Verification":{"Ar":"5+2=7 يؤكد الفرق.","En":"5+2=7 confirms the difference."},"CommonError":{"Ar":"لا تجمع الطولين عند طلب الفرق.","En":"Do not add lengths when asked for the difference."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طول الأحمر وحده.","En":"Red pencil length alone."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طول الأزرق وحده.","En":"Blue pencil length alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مجموع الطولين لا الفرق.","En":"Sum of lengths, not the difference."},"Order":4}]}$mw$),
($mw$growth-v31-grade-1-order-hour-half-hour-1$mw$,$mw$order-hour-half-hour$mw$,$mw$time$mw$,$mw$grade-1$mw$,1,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"ترتيب مواعيد الصباح","En":"Ordering morning times"},"Question":{"Ar":"تبدأ القراءة الساعة 8:00 صباحاً، والرياضة الساعة 9:00 صباحاً. أي وقت يقع بين موعدي البدء دون أن يساوي أياً منهما؟","En":"Reading starts at 8:00 a.m. and exercise starts at 9:00 a.m. Which time lies strictly between the two start times?"},"Options":[{"LatexCode":"8{:}00","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وقت القراءة نفسه.","En":"The reading start itself."}},{"LatexCode":"9{:}00","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وقت الرياضة نفسه.","En":"The exercise start itself."}},{"LatexCode":"8{:}30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7{:}30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قبل القراءة.","En":"Before reading."}}],"Hints":[{"Ar":"ابحث عن وقت بعد الثامنة.","En":"Find a time after eight."},{"Ar":"نصف الساعة بعد الثامنة وقبل التاسعة.","En":"Half past eight comes after eight and before nine."}],"Solution":{"Idea":{"Ar":"ترتب الأوقات في الصباح حسب الساعة ثم الدقائق.","En":"Morning times are ordered by hour and then minute."},"FormulaLatex":"8{:}00<8{:}30<9{:}00","Steps":[{"Ar":"الثامنة والنصف بعد الثامنة تماماً.","En":"Half past eight is after eight o'clock."},{"Ar":"وتسبق التاسعة بنصف ساعة.","En":"It is half an hour before nine."}],"Substitution":{"Ar":"$8{:}30$","En":"$8{:}30$"},"Result":{"Ar":"$8{:}30$","En":"$8{:}30$"},"Unit":{"Ar":"وقت","En":"Time"},"Verification":{"Ar":"عقرب الساعات بين 8 و9 عند هذا الوقت.","En":"The hour hand lies between eight and nine at this time."},"CommonError":{"Ar":"لا تختَر أحد طرفي الفترة.","En":"Do not select either endpoint."}}}$mw$::jsonb,$mw$ترتب الأوقات في الصباح حسب الساعة ثم الدقائق.

$8{:}00<8{:}30<9{:}00$

1. الثامنة والنصف بعد الثامنة تماماً.

2. وتسبق التاسعة بنصف ساعة.

$8{:}30$

$8{:}30$ وقت

عقرب الساعات بين 8 و9 عند هذا الوقت.

لا تختَر أحد طرفي الفترة.$mw$,$mw$Morning times are ordered by hour and then minute.

$8{:}00<8{:}30<9{:}00$

1. Half past eight is after eight o'clock.

2. It is half an hour before nine.

$8{:}30$

$8{:}30$ Time

The hour hand lies between eight and nine at this time.

Do not select either endpoint.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ابحث عن وقت بعد الثامنة.","En":"Find a time after eight."},{"Ar":"نصف الساعة بعد الثامنة وقبل التاسعة.","En":"Half past eight comes after eight and before nine."}],"Solution":{"Idea":{"Ar":"ترتب الأوقات في الصباح حسب الساعة ثم الدقائق.","En":"Morning times are ordered by hour and then minute."},"FormulaLatex":"8{:}00<8{:}30<9{:}00","Steps":[{"Ar":"الثامنة والنصف بعد الثامنة تماماً.","En":"Half past eight is after eight o'clock."},{"Ar":"وتسبق التاسعة بنصف ساعة.","En":"It is half an hour before nine."}],"Substitution":{"Ar":"$8{:}30$","En":"$8{:}30$"},"Result":{"Ar":"$8{:}30$","En":"$8{:}30$"},"Unit":{"Ar":"وقت","En":"Time"},"Verification":{"Ar":"عقرب الساعات بين 8 و9 عند هذا الوقت.","En":"The hour hand lies between eight and nine at this time."},"CommonError":{"Ar":"لا تختَر أحد طرفي الفترة.","En":"Do not select either endpoint."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"وقت القراءة نفسه.","En":"The reading start itself."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"وقت الرياضة نفسه.","En":"The exercise start itself."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قبل القراءة.","En":"Before reading."},"Order":4}]}$mw$),
($mw$growth-v31-grade-1-common-attribute-triangle-square-1$mw$,$mw$common-attribute-triangle-square$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"خاصية مشتركة بين شكلين","En":"A shared shape attribute"},"Question":{"Ar":"أمامك مثلث ومربع. أي عبارة صحيحة عن كليهما؟ A: لكل منهما ثلاثة أضلاع. B: لكل منهما أربعة رؤوس. C: كلاهما مغلق وأضلاعه مستقيمة. D: كلاهما له حافة منحنية.","En":"Consider a triangle and a square. Which statement is true of both? A: Both have three sides. B: Both have four vertices. C: Both are closed with straight sides. D: Both have a curved edge."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المربع له أربعة أضلاع.","En":"A square has four sides."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المثلث له ثلاثة رؤوس.","En":"A triangle has three vertices."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا حافة منحنية في أي منهما.","En":"Neither has a curved edge."}}],"Hints":[{"Ar":"فكر بخصائص كل شكل.","En":"Think of each shape's attributes."},{"Ar":"ابحث عن صفة صحيحة في الشكلين معاً.","En":"Seek an attribute true of both."}],"Solution":{"Idea":{"Ar":"يمكن لأشكال مختلفة أن تشترك في الإغلاق واستقامة الأضلاع.","En":"Different shapes can share closure and straight sides."},"FormulaLatex":"3\\ne4","Steps":[{"Ar":"المثلث مغلق بثلاثة أضلاع مستقيمة.","En":"A triangle is closed with three straight sides."},{"Ar":"المربع مغلق بأربعة أضلاع مستقيمة.","En":"A square is closed with four straight sides."},{"Ar":"الإغلاق واستقامة الأضلاع مشتركان بينهما.","En":"Closure and straight sides are shared."}],"Substitution":{"Ar":"$C$","En":"$C$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"عبارة","En":"Statement"},"Verification":{"Ar":"تتبع حد كل شكل يعيدنا لنقطة البداية عبر قطع مستقيمة.","En":"Tracing either boundary returns to the start along straight segments."},"CommonError":{"Ar":"لا تختَر صفة تخص شكلاً واحداً فقط.","En":"Do not choose an attribute of only one shape."}}}$mw$::jsonb,$mw$يمكن لأشكال مختلفة أن تشترك في الإغلاق واستقامة الأضلاع.

$3\ne4$

1. المثلث مغلق بثلاثة أضلاع مستقيمة.

2. المربع مغلق بأربعة أضلاع مستقيمة.

3. الإغلاق واستقامة الأضلاع مشتركان بينهما.

$C$

$C$ عبارة

تتبع حد كل شكل يعيدنا لنقطة البداية عبر قطع مستقيمة.

لا تختَر صفة تخص شكلاً واحداً فقط.$mw$,$mw$Different shapes can share closure and straight sides.

$3\ne4$

1. A triangle is closed with three straight sides.

2. A square is closed with four straight sides.

3. Closure and straight sides are shared.

$C$

$C$ Statement

Tracing either boundary returns to the start along straight segments.

Do not choose an attribute of only one shape.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"فكر بخصائص كل شكل.","En":"Think of each shape's attributes."},{"Ar":"ابحث عن صفة صحيحة في الشكلين معاً.","En":"Seek an attribute true of both."}],"Solution":{"Idea":{"Ar":"يمكن لأشكال مختلفة أن تشترك في الإغلاق واستقامة الأضلاع.","En":"Different shapes can share closure and straight sides."},"FormulaLatex":"3\\ne4","Steps":[{"Ar":"المثلث مغلق بثلاثة أضلاع مستقيمة.","En":"A triangle is closed with three straight sides."},{"Ar":"المربع مغلق بأربعة أضلاع مستقيمة.","En":"A square is closed with four straight sides."},{"Ar":"الإغلاق واستقامة الأضلاع مشتركان بينهما.","En":"Closure and straight sides are shared."}],"Substitution":{"Ar":"$C$","En":"$C$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"عبارة","En":"Statement"},"Verification":{"Ar":"تتبع حد كل شكل يعيدنا لنقطة البداية عبر قطع مستقيمة.","En":"Tracing either boundary returns to the start along straight segments."},"CommonError":{"Ar":"لا تختَر صفة تخص شكلاً واحداً فقط.","En":"Do not choose an attribute of only one shape."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المربع له أربعة أضلاع.","En":"A square has four sides."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المثلث له ثلاثة رؤوس.","En":"A triangle has three vertices."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا حافة منحنية في أي منهما.","En":"Neither has a curved edge."},"Order":4}]}$mw$),
($mw$growth-v31-grade-1-classify-observations-ordered-counts-1$mw$,$mw$classify-observations-ordered-counts$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"مطابقة سجل البيانات بالمشاهدات","En":"Matching a record to observations"},"Question":{"Ar":"شاهدت ندى الطيور بالتتابع: عصفور، حمامة، عصفور، عصفور، حمامة. أي زوج يمثل عدد العصافير ثم الحمام؟","En":"Nada observes birds in order: sparrow, pigeon, sparrow, sparrow, pigeon. Which ordered pair gives the sparrow count followed by the pigeon count?"},"Options":[{"LatexCode":"(2,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الفئتين.","En":"Reverses category order."}},{"LatexCode":"(3,2)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(3,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد حمامة إضافية.","En":"Counts an extra pigeon."}},{"LatexCode":"(5,2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 عدد جميع الطيور.","En":"Five counts all birds."}}],"Hints":[{"Ar":"عد كل نوع وحده.","En":"Count each type separately."},{"Ar":"اكتب عدد العصافير أولاً ثم الحمام.","En":"Write sparrows first, then pigeons."}],"Solution":{"Idea":{"Ar":"نسجل كل مشاهدة مرة واحدة في فئتها.","En":"Record each observation exactly once in its category."},"FormulaLatex":"3+2=5","Steps":[{"Ar":"العصافير في المشاهدات الأولى والثالثة والرابعة: ثلاثة.","En":"Sparrows occur first, third and fourth: three."},{"Ar":"الحمام في المشاهدتين الثانية والخامسة: اثنان.","En":"Pigeons occur second and fifth: two."}],"Substitution":{"Ar":"$(3,2)$","En":"$(3,2)$"},"Result":{"Ar":"$(3,2)$","En":"$(3,2)$"},"Unit":{"Ar":"طيور","En":"Birds"},"Verification":{"Ar":"3+2=5 يوافق مجموع المشاهدات.","En":"3+2=5 matches the observation count."},"CommonError":{"Ar":"لا تعكس ترتيب الفئتين في الزوج.","En":"Do not reverse the category order in the pair."}}}$mw$::jsonb,$mw$نسجل كل مشاهدة مرة واحدة في فئتها.

$3+2=5$

1. العصافير في المشاهدات الأولى والثالثة والرابعة: ثلاثة.

2. الحمام في المشاهدتين الثانية والخامسة: اثنان.

$(3,2)$

$(3,2)$ طيور

3+2=5 يوافق مجموع المشاهدات.

لا تعكس ترتيب الفئتين في الزوج.$mw$,$mw$Record each observation exactly once in its category.

$3+2=5$

1. Sparrows occur first, third and fourth: three.

2. Pigeons occur second and fifth: two.

$(3,2)$

$(3,2)$ Birds

3+2=5 matches the observation count.

Do not reverse the category order in the pair.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد كل نوع وحده.","En":"Count each type separately."},{"Ar":"اكتب عدد العصافير أولاً ثم الحمام.","En":"Write sparrows first, then pigeons."}],"Solution":{"Idea":{"Ar":"نسجل كل مشاهدة مرة واحدة في فئتها.","En":"Record each observation exactly once in its category."},"FormulaLatex":"3+2=5","Steps":[{"Ar":"العصافير في المشاهدات الأولى والثالثة والرابعة: ثلاثة.","En":"Sparrows occur first, third and fourth: three."},{"Ar":"الحمام في المشاهدتين الثانية والخامسة: اثنان.","En":"Pigeons occur second and fifth: two."}],"Substitution":{"Ar":"$(3,2)$","En":"$(3,2)$"},"Result":{"Ar":"$(3,2)$","En":"$(3,2)$"},"Unit":{"Ar":"طيور","En":"Birds"},"Verification":{"Ar":"3+2=5 يوافق مجموع المشاهدات.","En":"3+2=5 matches the observation count."},"CommonError":{"Ar":"لا تعكس ترتيب الفئتين في الزوج.","En":"Do not reverse the category order in the pair."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عكس ترتيب الفئتين.","En":"Reverses category order."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عد حمامة إضافية.","En":"Counts an extra pigeon."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"5 عدد جميع الطيور.","En":"Five counts all birds."},"Order":4}]}$mw$),
($mw$growth-v31-grade-2-equal-halves-different-outlines-1$mw$,$mw$equal-halves-different-outlines$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أنصاف متساوية بأشكال مختلفة","En":"Equal halves with different outlines"},"Question":{"Ar":"قُسم مربع مرة بخط يصل منتصف ضلعه العلوي بمنتصف ضلعه السفلي، ومرة أخرى بقطر يصل رأسين متقابلين. أي عبارة صحيحة؟ A: الأول فقط يعطي نصفين متساويين. B: الثاني فقط. C: كلاهما يعطي نصفين متساويين. D: لا أحد منهما.","En":"A square is divided once by a line joining the midpoints of its top and bottom sides, and separately by a diagonal joining opposite vertices. Which statement is true? A: Only the first gives equal halves. B: Only the second. C: Both give equal halves. D: Neither."},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القطر يعطي مثلثين متطابقين أيضاً.","En":"The diagonal also gives matching triangles."}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خط المنتصف يعطي مستطيلين متطابقين أيضاً.","En":"The midpoint line also gives matching rectangles."}},{"LatexCode":"C","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"كل تقسيم يعطي جزأين متساويين.","En":"Each partition gives two equal parts."}}],"Hints":[{"Ar":"تخيل طي المربع على خط المنتصف.","En":"Imagine folding along the midpoint line."},{"Ar":"ثم تخيل طيه على القطر.","En":"Then imagine folding along the diagonal."}],"Solution":{"Idea":{"Ar":"النصفان متساويا المساحة؛ ولا يشترط تماثل شكل الأنصاف بين تقسيمين مختلفين.","En":"Halves have equal area; their outlines need not match across different partitions."},"FormulaLatex":"\\frac12+\\frac12=1","Steps":[{"Ar":"التقسيم الأول يعطي مستطيلين متطابقين.","En":"The first gives matching rectangles."},{"Ar":"الثاني يعطي مثلثين متطابقين.","En":"The second gives matching triangles."},{"Ar":"كلاهما يعطي نصفين متساويين.","En":"Both give equal halves."}],"Substitution":{"Ar":"$C$","En":"$C$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"عبارة","En":"Statement"},"Verification":{"Ar":"عند طي المربع في كل حالة يتطابق الجزءان.","En":"Folding in either case makes the two parts coincide."},"CommonError":{"Ar":"لا تشترط أن تكون الأنصاف مستطيلات فقط.","En":"Do not assume halves must be rectangles."}}}$mw$::jsonb,$mw$النصفان متساويا المساحة؛ ولا يشترط تماثل شكل الأنصاف بين تقسيمين مختلفين.

$\frac12+\frac12=1$

1. التقسيم الأول يعطي مستطيلين متطابقين.

2. الثاني يعطي مثلثين متطابقين.

3. كلاهما يعطي نصفين متساويين.

$C$

$C$ عبارة

عند طي المربع في كل حالة يتطابق الجزءان.

لا تشترط أن تكون الأنصاف مستطيلات فقط.$mw$,$mw$Halves have equal area; their outlines need not match across different partitions.

$\frac12+\frac12=1$

1. The first gives matching rectangles.

2. The second gives matching triangles.

3. Both give equal halves.

$C$

$C$ Statement

Folding in either case makes the two parts coincide.

Do not assume halves must be rectangles.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تخيل طي المربع على خط المنتصف.","En":"Imagine folding along the midpoint line."},{"Ar":"ثم تخيل طيه على القطر.","En":"Then imagine folding along the diagonal."}],"Solution":{"Idea":{"Ar":"النصفان متساويا المساحة؛ ولا يشترط تماثل شكل الأنصاف بين تقسيمين مختلفين.","En":"Halves have equal area; their outlines need not match across different partitions."},"FormulaLatex":"\\frac12+\\frac12=1","Steps":[{"Ar":"التقسيم الأول يعطي مستطيلين متطابقين.","En":"The first gives matching rectangles."},{"Ar":"الثاني يعطي مثلثين متطابقين.","En":"The second gives matching triangles."},{"Ar":"كلاهما يعطي نصفين متساويين.","En":"Both give equal halves."}],"Substitution":{"Ar":"$C$","En":"$C$"},"Result":{"Ar":"$C$","En":"$C$"},"Unit":{"Ar":"عبارة","En":"Statement"},"Verification":{"Ar":"عند طي المربع في كل حالة يتطابق الجزءان.","En":"Folding in either case makes the two parts coincide."},"CommonError":{"Ar":"لا تشترط أن تكون الأنصاف مستطيلات فقط.","En":"Do not assume halves must be rectangles."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"القطر يعطي مثلثين متطابقين أيضاً.","En":"The diagonal also gives matching triangles."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"خط المنتصف يعطي مستطيلين متطابقين أيضاً.","En":"The midpoint line also gives matching rectangles."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"كل تقسيم يعطي جزأين متساويين.","En":"Each partition gives two equal parts."},"Order":4}]}$mw$),
($mw$growth-v31-grade-2-picture-graph-transfer-between-categories-1$mw$,$mw$picture-graph-transfer-between-categories$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نقل عنصر بين فئتين","En":"Moving an entry between categories"},"Question":{"Ar":"يمثل كل رمز ● طالباً واحداً. اختيارات النشاط: A: ●●●●●؛ B: ●●●؛ C: ●●●●. غيّر طالب واحد اختياره من A إلى B ولم يغادر أحد. كم طالباً في المجموع بعد التغيير؟","En":"Each ● represents one pupil. Activity choices are A: ●●●●●; B: ●●●; C: ●●●●. One pupil switches from A to B and nobody leaves. How many pupils are there altogether after the change?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف طالبين رغم أن أحداً لم يغادر.","En":"Removes two pupils although nobody left."}},{"LatexCode":"11","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الطالب من A دون إضافته إلى B.","En":"Removes the pupil from A without adding to B."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف الطالب إلى B دون حذفه من A.","En":"Adds the pupil to B without removing from A."}}],"Hints":[{"Ar":"احسب الأعداد قبل النقل.","En":"Count before the switch."},{"Ar":"انقل طالباً من A إلى B دون تغيير العدد الكلي.","En":"Move one pupil from A to B without changing the total."}],"Solution":{"Idea":{"Ar":"نقل عنصر بين فئتين دون خروجه من المجموعة يحافظ على المجموع.","En":"Moving an item between categories without leaving the group preserves the total."},"FormulaLatex":"(5-1)+(3+1)+4","Steps":[{"Ar":"الأعداد قبل النقل 5 و3 و4.","En":"Before the switch: 5,3,4."},{"Ar":"بعد النقل تصبح 4 و4 و4.","En":"Afterwards: 4,4,4."}],"Substitution":{"Ar":"$4+4+4=12$","En":"$4+4+4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"طلاب","En":"Pupils"},"Verification":{"Ar":"5+3+4=12 أيضاً؛ لم يضف أو يحذف طالب.","En":"5+3+4=12 too; no pupil was added or removed."},"CommonError":{"Ar":"لا تسجل الطالب في فئتين بعد نقله.","En":"Do not count the transferred pupil in both categories."}}}$mw$::jsonb,$mw$نقل عنصر بين فئتين دون خروجه من المجموعة يحافظ على المجموع.

$(5-1)+(3+1)+4$

1. الأعداد قبل النقل 5 و3 و4.

2. بعد النقل تصبح 4 و4 و4.

$4+4+4=12$

$12$ طلاب

5+3+4=12 أيضاً؛ لم يضف أو يحذف طالب.

لا تسجل الطالب في فئتين بعد نقله.$mw$,$mw$Moving an item between categories without leaving the group preserves the total.

$(5-1)+(3+1)+4$

1. Before the switch: 5,3,4.

2. Afterwards: 4,4,4.

$4+4+4=12$

$12$ Pupils

5+3+4=12 too; no pupil was added or removed.

Do not count the transferred pupil in both categories.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب الأعداد قبل النقل.","En":"Count before the switch."},{"Ar":"انقل طالباً من A إلى B دون تغيير العدد الكلي.","En":"Move one pupil from A to B without changing the total."}],"Solution":{"Idea":{"Ar":"نقل عنصر بين فئتين دون خروجه من المجموعة يحافظ على المجموع.","En":"Moving an item between categories without leaving the group preserves the total."},"FormulaLatex":"(5-1)+(3+1)+4","Steps":[{"Ar":"الأعداد قبل النقل 5 و3 و4.","En":"Before the switch: 5,3,4."},{"Ar":"بعد النقل تصبح 4 و4 و4.","En":"Afterwards: 4,4,4."}],"Substitution":{"Ar":"$4+4+4=12$","En":"$4+4+4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"طلاب","En":"Pupils"},"Verification":{"Ar":"5+3+4=12 أيضاً؛ لم يضف أو يحذف طالب.","En":"5+3+4=12 too; no pupil was added or removed."},"CommonError":{"Ar":"لا تسجل الطالب في فئتين بعد نقله.","En":"Do not count the transferred pupil in both categories."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حذف طالبين رغم أن أحداً لم يغادر.","En":"Removes two pupils although nobody left."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح الطالب من A دون إضافته إلى B.","En":"Removes the pupil from A without adding to B."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف الطالب إلى B دون حذفه من A.","En":"Adds the pupil to B without removing from A."},"Order":4}]}$mw$),
($mw$growth-v31-grade-6-median-even-after-extreme-insertion-1$mw$,$mw$median-even-after-extreme-insertion$mw$,$mw$primary-median$mw$,$mw$grade-6$mw$,6,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أثر إضافة قيمة على الوسيط","En":"Effect of adding a value on the median"},"Question":{"Ar":"البيانات المرتبة هي 2، 5، 7، 9، 12. أضيفت القيمة 20. ما الوسيط الجديد؟","En":"The sorted data are 2,5,7,9,12. The value 20 is added. What is the new median?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الوسيط قبل الإضافة.","En":"This is the old median."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار القيمة الرابعة وحدها رغم أن العدد زوجي.","En":"Chooses only the fourth value despite even count."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 ليست قيمة وسطية.","En":"12 is not a middle observation."}}],"Hints":[{"Ar":"أعد حساب عدد المشاهدات.","En":"Recount observations."},{"Ar":"عند ست قيم احسب متوسط الثالثة والرابعة.","En":"With six observations, average the third and fourth."}],"Solution":{"Idea":{"Ar":"وسيط البيانات المرتبة ذات العدد الزوجي متوسط القيمتين الوسطيتين.","En":"The median of sorted data with even count is the average of the middle two observations."},"FormulaLatex":"M=\\frac{x_{n/2}+x_{n/2+1}}2","Steps":[{"Ar":"القائمة الجديدة 2،5،7،9،12،20.","En":"New list: 2,5,7,9,12,20."},{"Ar":"القيمتان الوسطيتان هما 7 و9.","En":"The middle values are 7 and 9."}],"Substitution":{"Ar":"$ (7+9)/2=8 $","En":"$ (7+9)/2=8 $"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"توجد ثلاث قيم أقل من 8 وثلاث أعلى منه، وهو منتصف 7 و9.","En":"Three values lie below eight and three above, and it is midway between seven and nine."},"CommonError":{"Ar":"لا تستخدم قاعدة الوسيط لعدد فردي بعد تغير العدد.","En":"Do not apply the odd-count median rule after the count changes."}}}$mw$::jsonb,$mw$وسيط البيانات المرتبة ذات العدد الزوجي متوسط القيمتين الوسطيتين.

$M=\frac{x_{n/2}+x_{n/2+1}}2$

1. القائمة الجديدة 2،5،7،9،12،20.

2. القيمتان الوسطيتان هما 7 و9.

$ (7+9)/2=8 $

$8$ بلا وحدة محددة

توجد ثلاث قيم أقل من 8 وثلاث أعلى منه، وهو منتصف 7 و9.

لا تستخدم قاعدة الوسيط لعدد فردي بعد تغير العدد.$mw$,$mw$The median of sorted data with even count is the average of the middle two observations.

$M=\frac{x_{n/2}+x_{n/2+1}}2$

1. New list: 2,5,7,9,12,20.

2. The middle values are 7 and 9.

$ (7+9)/2=8 $

$8$ No specified unit

Three values lie below eight and three above, and it is midway between seven and nine.

Do not apply the odd-count median rule after the count changes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أعد حساب عدد المشاهدات.","En":"Recount observations."},{"Ar":"عند ست قيم احسب متوسط الثالثة والرابعة.","En":"With six observations, average the third and fourth."}],"Solution":{"Idea":{"Ar":"وسيط البيانات المرتبة ذات العدد الزوجي متوسط القيمتين الوسطيتين.","En":"The median of sorted data with even count is the average of the middle two observations."},"FormulaLatex":"M=\\frac{x_{n/2}+x_{n/2+1}}2","Steps":[{"Ar":"القائمة الجديدة 2،5،7،9،12،20.","En":"New list: 2,5,7,9,12,20."},{"Ar":"القيمتان الوسطيتان هما 7 و9.","En":"The middle values are 7 and 9."}],"Substitution":{"Ar":"$ (7+9)/2=8 $","En":"$ (7+9)/2=8 $"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"بلا وحدة محددة","En":"No specified unit"},"Verification":{"Ar":"توجد ثلاث قيم أقل من 8 وثلاث أعلى منه، وهو منتصف 7 و9.","En":"Three values lie below eight and three above, and it is midway between seven and nine."},"CommonError":{"Ar":"لا تستخدم قاعدة الوسيط لعدد فردي بعد تغير العدد.","En":"Do not apply the odd-count median rule after the count changes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا الوسيط قبل الإضافة.","En":"This is the old median."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"اختار القيمة الرابعة وحدها رغم أن العدد زوجي.","En":"Chooses only the fourth value despite even count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 ليست قيمة وسطية.","En":"12 is not a middle observation."},"Order":4}]}$mw$),
($mw$growth-v31-grade-6-mean-unchanged-add-mean-value-1$mw$,$mw$mean-unchanged-add-mean-value$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-6$mw$,6,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إضافة قيمة تساوي المتوسط","En":"Adding an observation equal to the mean"},"Question":{"Ar":"متوسط أطوال أربع قطع خشبية هو 6 سم. أضيفت قطعة خامسة طولها 6 سم. ما المتوسط الجديد؟","En":"Four wooden pieces have mean length 6 cm. A fifth piece of length 6 cm is added. What is the new mean?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة عدد القطع الجديد.","En":"Five is the new piece count."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"إضافة قيمة تساوي المتوسط لا تزيده بواحد.","En":"Adding a value equal to the mean does not increase it by one."}},{"LatexCode":"7.5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسمة المجموع الجديد على العدد القديم تعطي 7.5 خطأً.","En":"Dividing the new total by the old count incorrectly gives 7.5."}}],"Hints":[{"Ar":"استرجع المجموع القديم من المتوسط والعدد.","En":"Recover the old total from mean and count."},{"Ar":"أضف 6 ثم اقسم على خمسة.","En":"Add six, then divide by five."}],"Solution":{"Idea":{"Ar":"إضافة مشاهدة تساوي المتوسط الحالي لمجموعة غير فارغة لا تغير المتوسط.","En":"Adding a value equal to the mean of a nonempty data set leaves it unchanged."},"FormulaLatex":"\\bar x_{\\mathrm{new}}=\\frac{4\\cdot6+6}{5}","Steps":[{"Ar":"المجموع القديم 4×6=24 سم.","En":"Old total is 4×6=24 cm."},{"Ar":"الجديد 24+6=30 سم لخمس قطع.","En":"New total is 24+6=30 cm for five pieces."}],"Substitution":{"Ar":"$30/5=6$","En":"$30/5=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"خمس قطع بمتوسط 6 سم تعطي مجموعاً 30 سم، مطابقاً للمجموع الفعلي.","En":"Five pieces averaging 6 cm total 30 cm, matching the actual total."},"CommonError":{"Ar":"لا تنس تحديث المقام.","En":"Do not forget to update the denominator."}}}$mw$::jsonb,$mw$إضافة مشاهدة تساوي المتوسط الحالي لمجموعة غير فارغة لا تغير المتوسط.

$\bar x_{\mathrm{new}}=\frac{4\cdot6+6}{5}$

1. المجموع القديم 4×6=24 سم.

2. الجديد 24+6=30 سم لخمس قطع.

$30/5=6$

$6$ سم

خمس قطع بمتوسط 6 سم تعطي مجموعاً 30 سم، مطابقاً للمجموع الفعلي.

لا تنس تحديث المقام.$mw$,$mw$Adding a value equal to the mean of a nonempty data set leaves it unchanged.

$\bar x_{\mathrm{new}}=\frac{4\cdot6+6}{5}$

1. Old total is 4×6=24 cm.

2. New total is 24+6=30 cm for five pieces.

$30/5=6$

$6$ cm

Five pieces averaging 6 cm total 30 cm, matching the actual total.

Do not forget to update the denominator.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استرجع المجموع القديم من المتوسط والعدد.","En":"Recover the old total from mean and count."},{"Ar":"أضف 6 ثم اقسم على خمسة.","En":"Add six, then divide by five."}],"Solution":{"Idea":{"Ar":"إضافة مشاهدة تساوي المتوسط الحالي لمجموعة غير فارغة لا تغير المتوسط.","En":"Adding a value equal to the mean of a nonempty data set leaves it unchanged."},"FormulaLatex":"\\bar x_{\\mathrm{new}}=\\frac{4\\cdot6+6}{5}","Steps":[{"Ar":"المجموع القديم 4×6=24 سم.","En":"Old total is 4×6=24 cm."},{"Ar":"الجديد 24+6=30 سم لخمس قطع.","En":"New total is 24+6=30 cm for five pieces."}],"Substitution":{"Ar":"$30/5=6$","En":"$30/5=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"خمس قطع بمتوسط 6 سم تعطي مجموعاً 30 سم، مطابقاً للمجموع الفعلي.","En":"Five pieces averaging 6 cm total 30 cm, matching the actual total."},"CommonError":{"Ar":"لا تنس تحديث المقام.","En":"Do not forget to update the denominator."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خمسة عدد القطع الجديد.","En":"Five is the new piece count."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"إضافة قيمة تساوي المتوسط لا تزيده بواحد.","En":"Adding a value equal to the mean does not increase it by one."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قسمة المجموع الجديد على العدد القديم تعطي 7.5 خطأً.","En":"Dividing the new total by the old count incorrectly gives 7.5."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v31 primary depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
