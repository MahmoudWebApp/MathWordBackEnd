-- One-time owner-authorized v33 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v33-grade-1-compare-unit-size-same-length-1$mw$,$mw$compare-unit-size-same-length$mw$,$mw$length$mw$,$mw$grade-1$mw$,1,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قياس الطول بوحدتين","En":"Measuring with two unit sizes"},"Question":{"Ar":"طول شريط يساوي طول ست قطع قصيرة متطابقة. كل قطعة طويلة تساوي طول قطعتين قصيرتين. كم قطعة طويلة تغطي الشريط دون فراغات أو تداخل؟","En":"A strip is six identical short pieces long. Each long piece is twice as long as a short piece. How many long pieces cover the strip without gaps or overlaps?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 عدد القطع القصيرة في كل طويلة، لا عدد القطع الطويلة.","En":"2 is the number of short pieces in one long piece."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 عدد القطع القصيرة.","En":"6 counts the short pieces."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 يضاعف العدد بدلاً من تجميع القطع.","En":"12 doubles the count instead of grouping pieces."}}],"Hints":[{"Ar":"كم قطعة قصيرة تعادل قطعة طويلة؟","En":"How many short pieces equal a long piece?"},{"Ar":"كوّن أزواجاً من القطع الست.","En":"Make pairs from the six pieces."}],"Solution":{"Idea":{"Ar":"عندما تكبر وحدة القياس يقل العدد اللازم لتغطية الطول نفسه.","En":"A larger unit requires fewer units to cover the same length."},"FormulaLatex":"6\\div2","Steps":[{"Ar":"نجمع القطع القصيرة الست في أزواج.","En":"Group the six short pieces into pairs."},{"Ar":"كل زوج يساوي قطعة طويلة واحدة.","En":"Each pair equals one long piece."}],"Substitution":{"Ar":"$6\\div2=3$","En":"$6\\div2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\times2=6$","En":"$3\\times2=6$"},"CommonError":{"Ar":"لا تستخدم عدد الوحدات القصيرة نفسه عند تغيير حجم الوحدة.","En":"Do not keep the same count when the unit size changes."}}}$mw$::jsonb,$mw$عندما تكبر وحدة القياس يقل العدد اللازم لتغطية الطول نفسه.

$6\div2$

1. نجمع القطع القصيرة الست في أزواج.

2. كل زوج يساوي قطعة طويلة واحدة.

$6\div2=3$

$3$

$3\times2=6$

لا تستخدم عدد الوحدات القصيرة نفسه عند تغيير حجم الوحدة.$mw$,$mw$A larger unit requires fewer units to cover the same length.

$6\div2$

1. Group the six short pieces into pairs.

2. Each pair equals one long piece.

$6\div2=3$

$3$

$3\times2=6$

Do not keep the same count when the unit size changes.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم قطعة قصيرة تعادل قطعة طويلة؟","En":"How many short pieces equal a long piece?"},{"Ar":"كوّن أزواجاً من القطع الست.","En":"Make pairs from the six pieces."}],"Solution":{"Idea":{"Ar":"عندما تكبر وحدة القياس يقل العدد اللازم لتغطية الطول نفسه.","En":"A larger unit requires fewer units to cover the same length."},"FormulaLatex":"6\\div2","Steps":[{"Ar":"نجمع القطع القصيرة الست في أزواج.","En":"Group the six short pieces into pairs."},{"Ar":"كل زوج يساوي قطعة طويلة واحدة.","En":"Each pair equals one long piece."}],"Substitution":{"Ar":"$6\\div2=3$","En":"$6\\div2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\times2=6$","En":"$3\\times2=6$"},"CommonError":{"Ar":"لا تستخدم عدد الوحدات القصيرة نفسه عند تغيير حجم الوحدة.","En":"Do not keep the same count when the unit size changes."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"2 عدد القطع القصيرة في كل طويلة، لا عدد القطع الطويلة.","En":"2 is the number of short pieces in one long piece."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 عدد القطع القصيرة.","En":"6 counts the short pieces."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 يضاعف العدد بدلاً من تجميع القطع.","En":"12 doubles the count instead of grouping pieces."},"Order":4}]}$mw$),
($mw$growth-v33-grade-1-separate-shapes-total-vertices-1$mw$,$mw$separate-shapes-total-vertices$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عد زوايا شكلين","En":"Counting corners of two shapes"},"Question":{"Ar":"على طاولة مثلث ومربع منفصلان لا يتلامسان. كم زاوية للشكلين معاً؟","En":"A triangle and a square are on a table without touching. How many corners do the two shapes have altogether?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 زوايا المثلث فقط.","En":"3 counts only the triangle."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 زوايا المربع فقط.","En":"4 counts only the square."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 يكرر عدد زوايا المثلث مرتين.","En":"6 counts two triangles instead."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"عد زوايا المثلث.","En":"Count the triangle's corners."},{"Ar":"أضف إليها زوايا المربع الأربع.","En":"Add the square's four corners."}],"Solution":{"Idea":{"Ar":"نجمع عدد زوايا الشكلين المنفصلين.","En":"Add the corners of the two separate shapes."},"FormulaLatex":"3+4","Steps":[{"Ar":"للمثلث ثلاث زوايا وللمربع أربع زوايا.","En":"The triangle has three corners and the square has four."},{"Ar":"لا توجد زوايا مشتركة، فنعدها كلها.","En":"There are no shared corners, so count them all."}],"Substitution":{"Ar":"$3+4=7$","En":"$3+4=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7-4=3$","En":"$7-4=3$"},"CommonError":{"Ar":"لا تعد زوايا شكل واحد فقط.","En":"Do not count just one shape."}}}$mw$::jsonb,$mw$نجمع عدد زوايا الشكلين المنفصلين.

$3+4$

1. للمثلث ثلاث زوايا وللمربع أربع زوايا.

2. لا توجد زوايا مشتركة، فنعدها كلها.

$3+4=7$

$7$

$7-4=3$

لا تعد زوايا شكل واحد فقط.$mw$,$mw$Add the corners of the two separate shapes.

$3+4$

1. The triangle has three corners and the square has four.

2. There are no shared corners, so count them all.

$3+4=7$

$7$

$7-4=3$

Do not count just one shape.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد زوايا المثلث.","En":"Count the triangle's corners."},{"Ar":"أضف إليها زوايا المربع الأربع.","En":"Add the square's four corners."}],"Solution":{"Idea":{"Ar":"نجمع عدد زوايا الشكلين المنفصلين.","En":"Add the corners of the two separate shapes."},"FormulaLatex":"3+4","Steps":[{"Ar":"للمثلث ثلاث زوايا وللمربع أربع زوايا.","En":"The triangle has three corners and the square has four."},{"Ar":"لا توجد زوايا مشتركة، فنعدها كلها.","En":"There are no shared corners, so count them all."}],"Substitution":{"Ar":"$3+4=7$","En":"$3+4=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7-4=3$","En":"$7-4=3$"},"CommonError":{"Ar":"لا تعد زوايا شكل واحد فقط.","En":"Do not count just one shape."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"3 زوايا المثلث فقط.","En":"3 counts only the triangle."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 زوايا المربع فقط.","En":"4 counts only the square."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 يكرر عدد زوايا المثلث مرتين.","En":"6 counts two triangles instead."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v33-grade-2-pictograph-zero-threshold-1$mw$,$mw$pictograph-zero-threshold$mw$,$mw$primary-single-unit-picture-data$mw$,$mw$grade-2$mw$,2,1,97,357,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":357,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قراءة صف فارغ في سجل مصور","En":"Reading an empty pictograph row"},"Question":{"Ar":"كل ● يمثل كتاباً واحداً. سجل الرفوف: A: ●●●؛ B: لا رموز؛ C: ●؛ D: ●●. كم رفاً يحوي أقل من كتابين؟","En":"Each ● represents one book. Shelf record: A: ●●●; B: no symbols; C: ●; D: ●●. How many shelves contain fewer than two books?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 يهمل الرف الفارغ أو الرف ذي الكتاب الواحد.","En":"1 misses either the empty shelf or the shelf with one book."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3 يشمل رفاً فيه كتابان رغم الشرط الصارم.","En":"3 includes a shelf with two books despite the strict condition."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يعد الرفوف جميعها.","En":"4 counts every shelf."}}],"Hints":[{"Ar":"ما عدد الكتب عندما لا يظهر أي رمز؟","En":"How many books does a row with no symbols represent?"},{"Ar":"لا تعد الرف الذي يحتوي كتابين بالضبط.","En":"Do not count the shelf with exactly two books."}],"Solution":{"Idea":{"Ar":"الصف الخالي من الرموز يمثل صفراً، والأقل من اثنين يشمل الصفر والواحد.","En":"A row with no symbols represents zero; fewer than two includes zero and one."},"FormulaLatex":"0<2,\\quad1<2","Steps":[{"Ar":"الأعداد للرفوف A وB وC وD هي 3 و0 و1 و2 بالترتيب.","En":"The counts for A, B, C and D are 3, 0, 1 and 2 respectively."},{"Ar":"الرفان B وC وحدهما يحققان الشرط.","En":"Only shelves B and C meet the condition."}],"Substitution":{"Ar":"$0,1$","En":"$0,1$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+2=4$","En":"$2+2=4$"},"CommonError":{"Ar":"الأقل من اثنين لا يشمل الاثنين.","En":"Fewer than two excludes two."}}}$mw$::jsonb,$mw$الصف الخالي من الرموز يمثل صفراً، والأقل من اثنين يشمل الصفر والواحد.

$0<2,\quad1<2$

1. الأعداد للرفوف A وB وC وD هي 3 و0 و1 و2 بالترتيب.

2. الرفان B وC وحدهما يحققان الشرط.

$0,1$

$2$

$2+2=4$

الأقل من اثنين لا يشمل الاثنين.$mw$,$mw$A row with no symbols represents zero; fewer than two includes zero and one.

$0<2,\quad1<2$

1. The counts for A, B, C and D are 3, 0, 1 and 2 respectively.

2. Only shelves B and C meet the condition.

$0,1$

$2$

$2+2=4$

Fewer than two excludes two.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ما عدد الكتب عندما لا يظهر أي رمز؟","En":"How many books does a row with no symbols represent?"},{"Ar":"لا تعد الرف الذي يحتوي كتابين بالضبط.","En":"Do not count the shelf with exactly two books."}],"Solution":{"Idea":{"Ar":"الصف الخالي من الرموز يمثل صفراً، والأقل من اثنين يشمل الصفر والواحد.","En":"A row with no symbols represents zero; fewer than two includes zero and one."},"FormulaLatex":"0<2,\\quad1<2","Steps":[{"Ar":"الأعداد للرفوف A وB وC وD هي 3 و0 و1 و2 بالترتيب.","En":"The counts for A, B, C and D are 3, 0, 1 and 2 respectively."},{"Ar":"الرفان B وC وحدهما يحققان الشرط.","En":"Only shelves B and C meet the condition."}],"Substitution":{"Ar":"$0,1$","En":"$0,1$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2+2=4$","En":"$2+2=4$"},"CommonError":{"Ar":"الأقل من اثنين لا يشمل الاثنين.","En":"Fewer than two excludes two."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1 يهمل الرف الفارغ أو الرف ذي الكتاب الواحد.","En":"1 misses either the empty shelf or the shelf with one book."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"3 يشمل رفاً فيه كتابان رغم الشرط الصارم.","En":"3 includes a shelf with two books despite the strict condition."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"4 يعد الرفوف جميعها.","En":"4 counts every shelf."},"Order":4}]}$mw$),
($mw$growth-v33-grade-3-third-departure-interval-count-1$mw$,$mw$third-departure-interval-count$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الفترات بين المواعيد","En":"Intervals between departures"},"Question":{"Ar":"تغادر أول حافلة الساعة 9:05 صباحاً، ثم تغادر حافلة كل 15 دقيقة. في أي وقت تغادر الحافلة الثالثة؟","En":"The first bus leaves at 9:05 a.m. and another bus leaves every 15 minutes. When does the third bus leave?"},"Options":[{"LatexCode":"9{:}20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9:20 موعد الثانية.","En":"9:20 is the second departure."}},{"LatexCode":"9{:}30","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9:30 لا يقع بعد فترتين كاملتين من 9:05.","En":"9:30 is not two full intervals after 9:05."}},{"LatexCode":"9{:}35","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9{:}50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9:50 موعد الرابعة.","En":"9:50 is the fourth departure."}}],"Hints":[{"Ar":"ابدأ عد الحافلات من الموعد الأول نفسه.","En":"Count the first departure as bus one."},{"Ar":"كم فترة تفصل الحافلة الأولى عن الثالثة؟","En":"How many intervals separate the first and third buses?"}],"Solution":{"Idea":{"Ar":"بين الموعد الأول والثالث فترتان فقط.","En":"There are two intervals between the first and third departures."},"FormulaLatex":"2\\times15=30","Steps":[{"Ar":"الثانية بعد 15 دقيقة من 9:05، أي 9:20.","En":"The second leaves 15 minutes after 9:05, at 9:20."},{"Ar":"نضيف 15 دقيقة أخرى إلى 9:20.","En":"Add another 15 minutes to 9:20."}],"Substitution":{"Ar":"$9{:}20+15\\ \\mathrm{min}=9{:}35$","En":"$9{:}20+15\\ \\mathrm{min}=9{:}35$"},"Result":{"Ar":"$9{:}35$","En":"$9{:}35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$30=15+15$","En":"$30=15+15$"},"CommonError":{"Ar":"لا تضف ثلاث فترات للوصول إلى الحافلة الثالثة.","En":"Do not add three intervals to reach the third bus."}}}$mw$::jsonb,$mw$بين الموعد الأول والثالث فترتان فقط.

$2\times15=30$

1. الثانية بعد 15 دقيقة من 9:05، أي 9:20.

2. نضيف 15 دقيقة أخرى إلى 9:20.

$9{:}20+15\ \mathrm{min}=9{:}35$

$9{:}35$

$30=15+15$

لا تضف ثلاث فترات للوصول إلى الحافلة الثالثة.$mw$,$mw$There are two intervals between the first and third departures.

$2\times15=30$

1. The second leaves 15 minutes after 9:05, at 9:20.

2. Add another 15 minutes to 9:20.

$9{:}20+15\ \mathrm{min}=9{:}35$

$9{:}35$

$30=15+15$

Do not add three intervals to reach the third bus.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ عد الحافلات من الموعد الأول نفسه.","En":"Count the first departure as bus one."},{"Ar":"كم فترة تفصل الحافلة الأولى عن الثالثة؟","En":"How many intervals separate the first and third buses?"}],"Solution":{"Idea":{"Ar":"بين الموعد الأول والثالث فترتان فقط.","En":"There are two intervals between the first and third departures."},"FormulaLatex":"2\\times15=30","Steps":[{"Ar":"الثانية بعد 15 دقيقة من 9:05، أي 9:20.","En":"The second leaves 15 minutes after 9:05, at 9:20."},{"Ar":"نضيف 15 دقيقة أخرى إلى 9:20.","En":"Add another 15 minutes to 9:20."}],"Substitution":{"Ar":"$9{:}20+15\\ \\mathrm{min}=9{:}35$","En":"$9{:}20+15\\ \\mathrm{min}=9{:}35$"},"Result":{"Ar":"$9{:}35$","En":"$9{:}35$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$30=15+15$","En":"$30=15+15$"},"CommonError":{"Ar":"لا تضف ثلاث فترات للوصول إلى الحافلة الثالثة.","En":"Do not add three intervals to reach the third bus."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"9:20 موعد الثانية.","En":"9:20 is the second departure."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"9:30 لا يقع بعد فترتين كاملتين من 9:05.","En":"9:30 is not two full intervals after 9:05."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"9:50 موعد الرابعة.","En":"9:50 is the fourth departure."},"Order":4}]}$mw$),
($mw$growth-v33-grade-5-rounding-errors-cancel-1$mw$,$mw$rounding-errors-cancel$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تعويض أخطاء التقريب","En":"Cancelling rounding errors"},"Question":{"Ar":"قرّب كل عدد في 246+354 إلى أقرب عشرة ثم اجمع. ما الفرق بين هذا المجموع التقديري والمجموع الدقيق؟","En":"Round each addend in 246+354 to the nearest ten, then add. What is the absolute difference between the estimated and exact sums?"},"Options":[{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 مقدار خطأ تقريب أحد العددين فقط.","En":"4 is the magnitude of one rounding error."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 يجمع مقداري الخطأ دون مراعاة اتجاهيهما.","En":"8 adds error magnitudes without considering their signs."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"10 منزلة التقريب وليس الفرق.","En":"10 is the rounding place, not the difference."}}],"Hints":[{"Ar":"قرّب العددين منفصلين.","En":"Round both numbers separately."},{"Ar":"احسب المجموعين وقارن بينهما.","En":"Calculate and compare the two sums."}],"Solution":{"Idea":{"Ar":"قد يتعادل خطأ تقريب لأعلى مع خطأ مساوٍ له لأسفل.","En":"An upward rounding error can cancel an equal downward error."},"FormulaLatex":"|(250+350)-(246+354)|","Steps":[{"Ar":"$246\\to250,\\quad354\\to350$","En":"$246\\to250,\\quad354\\to350$"},{"Ar":"$250+350=600,\\quad246+354=600$","En":"$250+350=600,\\quad246+354=600$"}],"Substitution":{"Ar":"$|600-600|=0$","En":"$|600-600|=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+(-4)=0$","En":"$4+(-4)=0$"},"CommonError":{"Ar":"لا تفترض أن كل تقريب يغير المجموع النهائي.","En":"Do not assume rounding always changes the final sum."}}}$mw$::jsonb,$mw$قد يتعادل خطأ تقريب لأعلى مع خطأ مساوٍ له لأسفل.

$|(250+350)-(246+354)|$

1. $246\to250,\quad354\to350$

2. $250+350=600,\quad246+354=600$

$|600-600|=0$

$0$

$4+(-4)=0$

لا تفترض أن كل تقريب يغير المجموع النهائي.$mw$,$mw$An upward rounding error can cancel an equal downward error.

$|(250+350)-(246+354)|$

1. $246\to250,\quad354\to350$

2. $250+350=600,\quad246+354=600$

$|600-600|=0$

$0$

$4+(-4)=0$

Do not assume rounding always changes the final sum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قرّب العددين منفصلين.","En":"Round both numbers separately."},{"Ar":"احسب المجموعين وقارن بينهما.","En":"Calculate and compare the two sums."}],"Solution":{"Idea":{"Ar":"قد يتعادل خطأ تقريب لأعلى مع خطأ مساوٍ له لأسفل.","En":"An upward rounding error can cancel an equal downward error."},"FormulaLatex":"|(250+350)-(246+354)|","Steps":[{"Ar":"$246\\to250,\\quad354\\to350$","En":"$246\\to250,\\quad354\\to350$"},{"Ar":"$250+350=600,\\quad246+354=600$","En":"$250+350=600,\\quad246+354=600$"}],"Substitution":{"Ar":"$|600-600|=0$","En":"$|600-600|=0$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+(-4)=0$","En":"$4+(-4)=0$"},"CommonError":{"Ar":"لا تفترض أن كل تقريب يغير المجموع النهائي.","En":"Do not assume rounding always changes the final sum."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"4 مقدار خطأ تقريب أحد العددين فقط.","En":"4 is the magnitude of one rounding error."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"8 يجمع مقداري الخطأ دون مراعاة اتجاهيهما.","En":"8 adds error magnitudes without considering their signs."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"10 منزلة التقريب وليس الفرق.","En":"10 is the rounding place, not the difference."},"Order":4}]}$mw$),
($mw$growth-v33-grade-11-test-pair-unit-circle-consistency-1$mw$,$mw$test-pair-unit-circle-consistency$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-11$mw$,11,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار اتساق قيم الجيب وجيب التمام","En":"Testing sine and cosine consistency"},"Question":{"Ar":"أي زوج مرتب يمكن أن يكون قيمتي الجيب وجيب التمام لزاوية حقيقية، بالترتيب؟","En":"Which ordered pair can represent the sine and cosine of a real angle, respectively?"},"Options":[{"LatexCode":"(1/2,1/2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع المربعين 1/2 وليس 1.","En":"The squares sum to 1/2, not 1."}},{"LatexCode":"(3/5,4/5)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(1,1)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع المربعين 2.","En":"The squares sum to 2."}},{"LatexCode":"(2/3,2/3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مجموع المربعين 8/9.","En":"The squares sum to 8/9."}}],"Hints":[{"Ar":"استعمل متطابقة فيثاغورس المثلثية.","En":"Use the Pythagorean identity."},{"Ar":"ابحث عن زوج مجموع مربعيه واحد.","En":"Find the pair whose squared components sum to one."}],"Solution":{"Idea":{"Ar":"أي زوج من قيم الجيب وجيب التمام يقع على دائرة الوحدة، فيكون مجموع مربعيه واحداً.","En":"Any sine-cosine pair lies on the unit circle, so the squares sum to one."},"FormulaLatex":"\\sin^2\\theta+\\cos^2\\theta=1","Steps":[{"Ar":"نربع كل مركبة في كل زوج ثم نجمع المربعين.","En":"Square both components in each pair and add them."},{"Ar":"$(3/5)^2+(4/5)^2=9/25+16/25=1$","En":"$(3/5)^2+(4/5)^2=9/25+16/25=1$"}],"Substitution":{"Ar":"$(3/5)^2+(4/5)^2=1$","En":"$(3/5)^2+(4/5)^2=1$"},"Result":{"Ar":"$(3/5,4/5)$","En":"$(3/5,4/5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3^2+4^2=5^2$","En":"$3^2+4^2=5^2$"},"CommonError":{"Ar":"لا يكفي أن تكون كل قيمة بين −1 و1 وحدها.","En":"It is not enough that each value lies between −1 and 1."}}}$mw$::jsonb,$mw$أي زوج من قيم الجيب وجيب التمام يقع على دائرة الوحدة، فيكون مجموع مربعيه واحداً.

$\sin^2\theta+\cos^2\theta=1$

1. نربع كل مركبة في كل زوج ثم نجمع المربعين.

2. $(3/5)^2+(4/5)^2=9/25+16/25=1$

$(3/5)^2+(4/5)^2=1$

$(3/5,4/5)$

$3^2+4^2=5^2$

لا يكفي أن تكون كل قيمة بين −1 و1 وحدها.$mw$,$mw$Any sine-cosine pair lies on the unit circle, so the squares sum to one.

$\sin^2\theta+\cos^2\theta=1$

1. Square both components in each pair and add them.

2. $(3/5)^2+(4/5)^2=9/25+16/25=1$

$(3/5)^2+(4/5)^2=1$

$(3/5,4/5)$

$3^2+4^2=5^2$

It is not enough that each value lies between −1 and 1.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل متطابقة فيثاغورس المثلثية.","En":"Use the Pythagorean identity."},{"Ar":"ابحث عن زوج مجموع مربعيه واحد.","En":"Find the pair whose squared components sum to one."}],"Solution":{"Idea":{"Ar":"أي زوج من قيم الجيب وجيب التمام يقع على دائرة الوحدة، فيكون مجموع مربعيه واحداً.","En":"Any sine-cosine pair lies on the unit circle, so the squares sum to one."},"FormulaLatex":"\\sin^2\\theta+\\cos^2\\theta=1","Steps":[{"Ar":"نربع كل مركبة في كل زوج ثم نجمع المربعين.","En":"Square both components in each pair and add them."},{"Ar":"$(3/5)^2+(4/5)^2=9/25+16/25=1$","En":"$(3/5)^2+(4/5)^2=9/25+16/25=1$"}],"Substitution":{"Ar":"$(3/5)^2+(4/5)^2=1$","En":"$(3/5)^2+(4/5)^2=1$"},"Result":{"Ar":"$(3/5,4/5)$","En":"$(3/5,4/5)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3^2+4^2=5^2$","En":"$3^2+4^2=5^2$"},"CommonError":{"Ar":"لا يكفي أن تكون كل قيمة بين −1 و1 وحدها.","En":"It is not enough that each value lies between −1 and 1."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مجموع المربعين 1/2 وليس 1.","En":"The squares sum to 1/2, not 1."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"مجموع المربعين 2.","En":"The squares sum to 2."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مجموع المربعين 8/9.","En":"The squares sum to 8/9."},"Order":4}]}$mw$),
($mw$growth-v33-grade-12-dot-product-linear-combination-known-products-1$mw$,$mw$dot-product-linear-combination-known-products$mw$,$mw$dot-product$mw$,$mw$grade-12$mw$,12,3,87,338,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":338,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"خطية الضرب القياسي","En":"Linearity of the dot product"},"Question":{"Ar":"إذا كان حاصل الضرب القياسي u·v=−6 وu·w=4، فما قيمة u·(2v−w)؟","En":"If u·v=−6 and u·w=4, what is u·(2v−w)?"},"Options":[{"LatexCode":"-16","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−8 ينتج من إضافة 4 إلى −12 بدلاً من طرحها.","En":"−8 adds 4 to −12 instead of subtracting it."}},{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2 يجمع القيمتين المعطاتين ويتجاهل المعاملات.","En":"−2 adds the given values and ignores the coefficients."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"16 يعكس إشارة الناتج الصحيح.","En":"16 reverses the sign of the correct result."}}],"Hints":[{"Ar":"وزع الضرب القياسي على الفرق.","En":"Distribute the dot product across the difference."},{"Ar":"ضاعف القيمة الأولى فقط، ثم اطرح الثانية.","En":"Double only the first value, then subtract the second."}],"Solution":{"Idea":{"Ar":"الضرب القياسي خطي في كل مدخل، فنوزع ونستخرج المعاملات.","En":"The dot product is linear in each argument, so distribute and extract scalar coefficients."},"FormulaLatex":"u\\cdot(2v-w)=2(u\\cdot v)-u\\cdot w","Steps":[{"Ar":"$2(u\\cdot v)=2(-6)=-12$","En":"$2(u\\cdot v)=2(-6)=-12$"},{"Ar":"نطرح حاصل الضرب القياسي مع المتجه الثالث.","En":"Subtract the dot product with the third vector."}],"Substitution":{"Ar":"$2(-6)-4=-16$","En":"$2(-6)-4=-16$"},"Result":{"Ar":"$-16$","En":"$-16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-16+4=-12$","En":"$-16+4=-12$"},"CommonError":{"Ar":"لا توزع العدد 2 على المتجه w.","En":"Do not apply the coefficient 2 to w."}}}$mw$::jsonb,$mw$الضرب القياسي خطي في كل مدخل، فنوزع ونستخرج المعاملات.

$u\cdot(2v-w)=2(u\cdot v)-u\cdot w$

1. $2(u\cdot v)=2(-6)=-12$

2. نطرح حاصل الضرب القياسي مع المتجه الثالث.

$2(-6)-4=-16$

$-16$

$-16+4=-12$

لا توزع العدد 2 على المتجه w.$mw$,$mw$The dot product is linear in each argument, so distribute and extract scalar coefficients.

$u\cdot(2v-w)=2(u\cdot v)-u\cdot w$

1. $2(u\cdot v)=2(-6)=-12$

2. Subtract the dot product with the third vector.

$2(-6)-4=-16$

$-16$

$-16+4=-12$

Do not apply the coefficient 2 to w.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزع الضرب القياسي على الفرق.","En":"Distribute the dot product across the difference."},{"Ar":"ضاعف القيمة الأولى فقط، ثم اطرح الثانية.","En":"Double only the first value, then subtract the second."}],"Solution":{"Idea":{"Ar":"الضرب القياسي خطي في كل مدخل، فنوزع ونستخرج المعاملات.","En":"The dot product is linear in each argument, so distribute and extract scalar coefficients."},"FormulaLatex":"u\\cdot(2v-w)=2(u\\cdot v)-u\\cdot w","Steps":[{"Ar":"$2(u\\cdot v)=2(-6)=-12$","En":"$2(u\\cdot v)=2(-6)=-12$"},{"Ar":"نطرح حاصل الضرب القياسي مع المتجه الثالث.","En":"Subtract the dot product with the third vector."}],"Substitution":{"Ar":"$2(-6)-4=-16$","En":"$2(-6)-4=-16$"},"Result":{"Ar":"$-16$","En":"$-16$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-16+4=-12$","En":"$-16+4=-12$"},"CommonError":{"Ar":"لا توزع العدد 2 على المتجه w.","En":"Do not apply the coefficient 2 to w."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"−8 ينتج من إضافة 4 إلى −12 بدلاً من طرحها.","En":"−8 adds 4 to −12 instead of subtracting it."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"−2 يجمع القيمتين المعطاتين ويتجاهل المعاملات.","En":"−2 adds the given values and ignores the coefficients."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"16 يعكس إشارة الناتج الصحيح.","En":"16 reverses the sign of the correct result."},"Order":4}]}$mw$),
($mw$growth-v33-grade-12-circle-center-general-form-complete-square-1$mw$,$mw$circle-center-general-form-complete-square$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مركز دائرة من صيغتها العامة","En":"Circle centre from general form"},"Question":{"Ar":"ما مركز الدائرة التي معادلتها x²+y²−6x+8y=0؟","En":"What is the centre of the circle x²+y²−6x+8y=0?"},"Options":[{"LatexCode":"(-3,4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعكس إشارتي إحداثيي المركز.","En":"Reverses both centre-coordinate signs."}},{"LatexCode":"(6,-8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستخدم المعاملين بعد تغيير الإشارة دون تنصيفهما.","En":"Uses the negated coefficients without halving."}},{"LatexCode":"(3,-4)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(-6,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينقل معاملي الحدود الخطية كما هما.","En":"Copies the linear coefficients directly."}}],"Hints":[{"Ar":"أكمل مربع الحدود التي تحتوي x وحدها ثم y وحدها.","En":"Complete the square separately for x and y."},{"Ar":"انتبه لإشارة الإحداثي في الصيغة القياسية.","En":"Read the coordinate signs in standard form carefully."}],"Solution":{"Idea":{"Ar":"نكتب المعادلة بصيغة المركز ونصف القطر بإكمال مربع كل متغير.","En":"Complete the square for each variable to obtain centre-radius form."},"FormulaLatex":"(x-h)^2+(y-k)^2=r^2","Steps":[{"Ar":"$x^2-6x=(x-3)^2-9$","En":"$x^2-6x=(x-3)^2-9$"},{"Ar":"$y^2+8y=(y+4)^2-16$","En":"$y^2+8y=(y+4)^2-16$"},{"Ar":"$(x-3)^2+(y+4)^2=25$","En":"$(x-3)^2+(y+4)^2=25$"}],"Substitution":{"Ar":"$(h,k)=(3,-4)$","En":"$(h,k)=(3,-4)$"},"Result":{"Ar":"$(3,-4)$","En":"$(3,-4)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(x-3)^2+(y+4)^2=25$","En":"$(x-3)^2+(y+4)^2=25$"},"CommonError":{"Ar":"لا تخلط بين إشارة الحد داخل القوس وإشارة إحداثي المركز.","En":"Do not confuse the sign inside a bracket with the sign of the centre coordinate."}}}$mw$::jsonb,$mw$نكتب المعادلة بصيغة المركز ونصف القطر بإكمال مربع كل متغير.

$(x-h)^2+(y-k)^2=r^2$

1. $x^2-6x=(x-3)^2-9$

2. $y^2+8y=(y+4)^2-16$

3. $(x-3)^2+(y+4)^2=25$

$(h,k)=(3,-4)$

$(3,-4)$

$(x-3)^2+(y+4)^2=25$

لا تخلط بين إشارة الحد داخل القوس وإشارة إحداثي المركز.$mw$,$mw$Complete the square for each variable to obtain centre-radius form.

$(x-h)^2+(y-k)^2=r^2$

1. $x^2-6x=(x-3)^2-9$

2. $y^2+8y=(y+4)^2-16$

3. $(x-3)^2+(y+4)^2=25$

$(h,k)=(3,-4)$

$(3,-4)$

$(x-3)^2+(y+4)^2=25$

Do not confuse the sign inside a bracket with the sign of the centre coordinate.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أكمل مربع الحدود التي تحتوي x وحدها ثم y وحدها.","En":"Complete the square separately for x and y."},{"Ar":"انتبه لإشارة الإحداثي في الصيغة القياسية.","En":"Read the coordinate signs in standard form carefully."}],"Solution":{"Idea":{"Ar":"نكتب المعادلة بصيغة المركز ونصف القطر بإكمال مربع كل متغير.","En":"Complete the square for each variable to obtain centre-radius form."},"FormulaLatex":"(x-h)^2+(y-k)^2=r^2","Steps":[{"Ar":"$x^2-6x=(x-3)^2-9$","En":"$x^2-6x=(x-3)^2-9$"},{"Ar":"$y^2+8y=(y+4)^2-16$","En":"$y^2+8y=(y+4)^2-16$"},{"Ar":"$(x-3)^2+(y+4)^2=25$","En":"$(x-3)^2+(y+4)^2=25$"}],"Substitution":{"Ar":"$(h,k)=(3,-4)$","En":"$(h,k)=(3,-4)$"},"Result":{"Ar":"$(3,-4)$","En":"$(3,-4)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(x-3)^2+(y+4)^2=25$","En":"$(x-3)^2+(y+4)^2=25$"},"CommonError":{"Ar":"لا تخلط بين إشارة الحد داخل القوس وإشارة إحداثي المركز.","En":"Do not confuse the sign inside a bracket with the sign of the centre coordinate."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعكس إشارتي إحداثيي المركز.","En":"Reverses both centre-coordinate signs."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يستخدم المعاملين بعد تغيير الإشارة دون تنصيفهما.","En":"Uses the negated coefficients without halving."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ينقل معاملي الحدود الخطية كما هما.","En":"Copies the linear coefficients directly."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v33 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
