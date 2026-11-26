-- One-time owner-authorized v22 original linked school growth. Do not replay after publication.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v22-grade-1-net-decrease-after-return-1$mw$,$mw$net-decrease-after-return$mw$,$mw$primary-subtraction$mw$,$mw$grade-1$mw$,1,1,1,2,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":2,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نقص العدد بعد عودة بعض الأطفال","En":"Net decrease after some children return"},"Question":{"Ar":"كان 12 طفلاً في الساحة. غادر 5 أطفال، ثم عاد طفلان من الأطفال الخمسة. كم طفلاً نقص عدد الموجودين في الساحة مقارنة بالبداية؟","En":"There were 12 children in a yard. Five left, then two of those five returned. By how many did the number in the yard decrease compared with the start?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الموجودين بعد المغادرة وقبل العودة.","En":"This is the count after departure but before the return."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا العدد النهائي في الساحة، لا مقدار النقص.","En":"This is the final count in the yard, not the decrease."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يراع عودة طفلين.","En":"Ignores the two children who returned."}}],"Hints":[{"Ar":"من غادر ثم عاد لا يظل غائباً.","En":"A child who left and returned is no longer absent."},{"Ar":"اطرح عدد العائدين من عدد المغادرين.","En":"Subtract the number returning from the number leaving."}],"Solution":{"Idea":{"Ar":"النقص الصافي هو عدد المغادرين الذين لم يعودوا، ما دام العائدون من المجموعة نفسها.","En":"The net decrease is the number who left and did not return, when the returning children are from the same group."},"FormulaLatex":"5-2","Steps":[{"Ar":"غادر 5 أطفال وعاد منهم 2.","En":"Five left, and two of them returned."},{"Ar":"نطرح $5-2=3$ لمعرفة عدد من بقي خارج الساحة.","En":"Subtract $5-2=3$ to find how many remain outside the yard."}],"Substitution":{"Ar":"$5-2=3$","En":"$5-2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"أطفال","En":"children"},"Verification":{"Ar":"$12-5+2=9$ ثم $12-9=3$.","En":"$12-5+2=9$, then $12-9=3$."},"CommonError":{"Ar":"لا تخلط العدد النهائي بمقدار النقص.","En":"Do not confuse the final count with the decrease."}}}$mw$::jsonb,$mw$النقص الصافي هو عدد المغادرين الذين لم يعودوا، ما دام العائدون من المجموعة نفسها.

$5-2$

1. غادر 5 أطفال وعاد منهم 2.

2. نطرح $5-2=3$ لمعرفة عدد من بقي خارج الساحة.

$5-2=3$

$3$ أطفال

$12-5+2=9$ ثم $12-9=3$.

لا تخلط العدد النهائي بمقدار النقص.$mw$,$mw$The net decrease is the number who left and did not return, when the returning children are from the same group.

$5-2$

1. Five left, and two of them returned.

2. Subtract $5-2=3$ to find how many remain outside the yard.

$5-2=3$

$3$ children

$12-5+2=9$, then $12-9=3$.

Do not confuse the final count with the decrease.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"من غادر ثم عاد لا يظل غائباً.","En":"A child who left and returned is no longer absent."},{"Ar":"اطرح عدد العائدين من عدد المغادرين.","En":"Subtract the number returning from the number leaving."}],"Solution":{"Idea":{"Ar":"النقص الصافي هو عدد المغادرين الذين لم يعودوا، ما دام العائدون من المجموعة نفسها.","En":"The net decrease is the number who left and did not return, when the returning children are from the same group."},"FormulaLatex":"5-2","Steps":[{"Ar":"غادر 5 أطفال وعاد منهم 2.","En":"Five left, and two of them returned."},{"Ar":"نطرح $5-2=3$ لمعرفة عدد من بقي خارج الساحة.","En":"Subtract $5-2=3$ to find how many remain outside the yard."}],"Substitution":{"Ar":"$5-2=3$","En":"$5-2=3$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"أطفال","En":"children"},"Verification":{"Ar":"$12-5+2=9$ ثم $12-9=3$.","En":"$12-5+2=9$, then $12-9=3$."},"CommonError":{"Ar":"لا تخلط العدد النهائي بمقدار النقص.","En":"Do not confuse the final count with the decrease."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الموجودين بعد المغادرة وقبل العودة.","En":"This is the count after departure but before the return."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا العدد النهائي في الساحة، لا مقدار النقص.","En":"This is the final count in the yard, not the decrease."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لم يراع عودة طفلين.","En":"Ignores the two children who returned."},"Order":4}]}$mw$),
($mw$growth-v22-grade-1-counting-grid-left-to-right-1$mw$,$mw$counting-grid-left-to-right$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"العد عبر صفوف متساوية","En":"Counting across equal rows"},"Question":{"Ar":"في كل صف من صفين توجد 4 خانات. تُرقّم الخانات من 1 بالترتيب من اليسار إلى اليمين في الصف الأول، ثم من اليسار إلى اليمين في الصف الثاني. ما رقم الخانة الثانية في الصف الثاني؟","En":"There are two rows of four boxes each. Number the boxes from 1, left to right in the first row, then left to right in the second row. What is the number of the second box in the second row?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعيد العد من 1 في الصف الثاني بدلاً من متابعة الترقيم.","En":"Restarts numbering at 1 in the second row."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا رقم أول خانة في الصف الثاني.","En":"This is the first box in the second row."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا رقم آخر خانة في الصف الثاني.","En":"This is the last box in the second row."}}],"Hints":[{"Ar":"أكمل ترقيم الصف الأول قبل الانتقال للثاني.","En":"Finish numbering the first row before moving to the second."},{"Ar":"تابع العد بعد 4 حتى الخانة الثانية من الصف الثاني.","En":"Continue counting after 4 to the second box in the second row."}],"Solution":{"Idea":{"Ar":"عند الانتقال للصف التالي نستمر في العد ولا نبدأ من جديد.","En":"When moving to the next row, continue the count instead of restarting."},"FormulaLatex":"4+2","Steps":[{"Ar":"أرقام الصف الأول هي 1، 2، 3، 4.","En":"The first row is numbered 1, 2, 3, 4."},{"Ar":"أول خانة في الصف الثاني تحمل الرقم 5، والتي تليها تحمل الرقم 6.","En":"The first box of the second row is 5, and the next is 6."}],"Substitution":{"Ar":"$4+2=6$","En":"$4+2=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"رقم الخانة","En":"box number"},"Verification":{"Ar":"يبقى بعد الخانة 6 خانتان تحملان 7 و8، فيكتمل الصف الثاني.","En":"Two boxes after box 6 are numbered 7 and 8, completing the second row."},"CommonError":{"Ar":"لا تبدأ الترقيم من 1 في كل صف.","En":"Do not restart numbering at 1 in each row."}}}$mw$::jsonb,$mw$عند الانتقال للصف التالي نستمر في العد ولا نبدأ من جديد.

$4+2$

1. أرقام الصف الأول هي 1، 2، 3، 4.

2. أول خانة في الصف الثاني تحمل الرقم 5، والتي تليها تحمل الرقم 6.

$4+2=6$

$6$ رقم الخانة

يبقى بعد الخانة 6 خانتان تحملان 7 و8، فيكتمل الصف الثاني.

لا تبدأ الترقيم من 1 في كل صف.$mw$,$mw$When moving to the next row, continue the count instead of restarting.

$4+2$

1. The first row is numbered 1, 2, 3, 4.

2. The first box of the second row is 5, and the next is 6.

$4+2=6$

$6$ box number

Two boxes after box 6 are numbered 7 and 8, completing the second row.

Do not restart numbering at 1 in each row.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أكمل ترقيم الصف الأول قبل الانتقال للثاني.","En":"Finish numbering the first row before moving to the second."},{"Ar":"تابع العد بعد 4 حتى الخانة الثانية من الصف الثاني.","En":"Continue counting after 4 to the second box in the second row."}],"Solution":{"Idea":{"Ar":"عند الانتقال للصف التالي نستمر في العد ولا نبدأ من جديد.","En":"When moving to the next row, continue the count instead of restarting."},"FormulaLatex":"4+2","Steps":[{"Ar":"أرقام الصف الأول هي 1، 2، 3، 4.","En":"The first row is numbered 1, 2, 3, 4."},{"Ar":"أول خانة في الصف الثاني تحمل الرقم 5، والتي تليها تحمل الرقم 6.","En":"The first box of the second row is 5, and the next is 6."}],"Substitution":{"Ar":"$4+2=6$","En":"$4+2=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"رقم الخانة","En":"box number"},"Verification":{"Ar":"يبقى بعد الخانة 6 خانتان تحملان 7 و8، فيكتمل الصف الثاني.","En":"Two boxes after box 6 are numbered 7 and 8, completing the second row."},"CommonError":{"Ar":"لا تبدأ الترقيم من 1 في كل صف.","En":"Do not restart numbering at 1 in each row."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعيد العد من 1 في الصف الثاني بدلاً من متابعة الترقيم.","En":"Restarts numbering at 1 in the second row."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا رقم أول خانة في الصف الثاني.","En":"This is the first box in the second row."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا رقم آخر خانة في الصف الثاني.","En":"This is the last box in the second row."},"Order":4}]}$mw$),
($mw$growth-v22-grade-2-alternating-skip-count-membership-1$mw$,$mw$alternating-skip-count-membership$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز نمطين للعد","En":"Distinguishing two counting patterns"},"Question":{"Ar":"تعدّ هدى من 3 بزيادة 2 كل مرة، ويعدّ سامر من 4 بزيادة 2 كل مرة. أي عدد سيقوله سامر ولن تقوله هدى؟","En":"Huda counts from 3, adding 2 each time. Samer counts from 4, adding 2 each time. Which number will Samer say but Huda will not?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 يظهر في نمط هدى.","En":"7 appears in Huda's pattern."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"9 يظهر في نمط هدى.","En":"9 appears in Huda's pattern."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 يظهر في نمط هدى.","En":"15 appears in Huda's pattern."}}],"Hints":[{"Ar":"اكتب الأعداد الأولى لكل طفل.","En":"Write the first few numbers for each child."},{"Ar":"لاحظ أن زيادة 2 تحافظ على كون العدد زوجياً أو فردياً.","En":"Notice that adding 2 preserves whether a number is even or odd."}],"Solution":{"Idea":{"Ar":"الزيادة بمقدار 2 تحافظ على نمط الزوجية أو الفردية؛ يبدأ سامر بعدد زوجي وتبدأ هدى بعدد فردي.","En":"Adding 2 preserves parity; Samer starts with an even number and Huda with an odd number."},"FormulaLatex":"3+2=5,\\quad 4+2=6","Steps":[{"Ar":"نمط هدى: 3، 5، 7، 9، 11، 13، 15.","En":"Huda's pattern: 3, 5, 7, 9, 11, 13, 15."},{"Ar":"نمط سامر: 4، 6، 8، 10، 12؛ نجد 12 هنا فقط.","En":"Samer's pattern: 4, 6, 8, 10, 12; only this pattern contains 12."}],"Substitution":{"Ar":"$4+2+2+2+2=12$","En":"$4+2+2+2+2=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"كل عدد في نمط هدى فردي، بينما 12 زوجي.","En":"Every number in Huda's pattern is odd, whereas 12 is even."},"CommonError":{"Ar":"لا تخلط بين نقطة البداية ومقدار الزيادة.","En":"Do not confuse the starting value with the step size."}}}$mw$::jsonb,$mw$الزيادة بمقدار 2 تحافظ على نمط الزوجية أو الفردية؛ يبدأ سامر بعدد زوجي وتبدأ هدى بعدد فردي.

$3+2=5,\quad 4+2=6$

1. نمط هدى: 3، 5، 7، 9، 11، 13، 15.

2. نمط سامر: 4، 6، 8، 10، 12؛ نجد 12 هنا فقط.

$4+2+2+2+2=12$

$12$ بلا وحدة قياس

كل عدد في نمط هدى فردي، بينما 12 زوجي.

لا تخلط بين نقطة البداية ومقدار الزيادة.$mw$,$mw$Adding 2 preserves parity; Samer starts with an even number and Huda with an odd number.

$3+2=5,\quad 4+2=6$

1. Huda's pattern: 3, 5, 7, 9, 11, 13, 15.

2. Samer's pattern: 4, 6, 8, 10, 12; only this pattern contains 12.

$4+2+2+2+2=12$

$12$ Dimensionless

Every number in Huda's pattern is odd, whereas 12 is even.

Do not confuse the starting value with the step size.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب الأعداد الأولى لكل طفل.","En":"Write the first few numbers for each child."},{"Ar":"لاحظ أن زيادة 2 تحافظ على كون العدد زوجياً أو فردياً.","En":"Notice that adding 2 preserves whether a number is even or odd."}],"Solution":{"Idea":{"Ar":"الزيادة بمقدار 2 تحافظ على نمط الزوجية أو الفردية؛ يبدأ سامر بعدد زوجي وتبدأ هدى بعدد فردي.","En":"Adding 2 preserves parity; Samer starts with an even number and Huda with an odd number."},"FormulaLatex":"3+2=5,\\quad 4+2=6","Steps":[{"Ar":"نمط هدى: 3، 5، 7، 9، 11، 13، 15.","En":"Huda's pattern: 3, 5, 7, 9, 11, 13, 15."},{"Ar":"نمط سامر: 4، 6، 8، 10، 12؛ نجد 12 هنا فقط.","En":"Samer's pattern: 4, 6, 8, 10, 12; only this pattern contains 12."}],"Substitution":{"Ar":"$4+2+2+2+2=12$","En":"$4+2+2+2+2=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"كل عدد في نمط هدى فردي، بينما 12 زوجي.","En":"Every number in Huda's pattern is odd, whereas 12 is even."},"CommonError":{"Ar":"لا تخلط بين نقطة البداية ومقدار الزيادة.","En":"Do not confuse the starting value with the step size."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"7 يظهر في نمط هدى.","En":"7 appears in Huda's pattern."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"9 يظهر في نمط هدى.","En":"9 appears in Huda's pattern."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"15 يظهر في نمط هدى.","En":"15 appears in Huda's pattern."},"Order":4}]}$mw$),
($mw$growth-v22-grade-2-unlabelled-centimeter-scale-1$mw$,$mw$unlabelled-centimeter-scale$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قراءة تدريج غير مرقّم بالكامل","En":"Reading a partly labelled ruler"},"Question":{"Ar":"مسطرة تبدأ من 0 سم، وتظهر الأرقام عند 0 و5 و10 و15 فقط، لكن توجد علامة عند كل سنتيمتر. يبدأ قلم عند 0 وتنتهي حافته عند العلامة الثالثة بعد 10. كم طول القلم؟","En":"A ruler starts at 0 cm and has labels only at 0, 5, 10 and 15, but a tick at every centimetre. A pencil starts at 0 and ends at the third tick after 10. How long is the pencil?"},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تجاهل العلامات غير المرقمة بعد 10.","En":"Ignores unlabelled ticks after 10."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد علامتين بعد 10 فقط.","En":"Counts only two ticks after 10."}},{"LatexCode":"13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار الرقم المطبوع التالي دون قراءة العلامة المطلوبة.","En":"Chooses the next printed label rather than the requested tick."}}],"Hints":[{"Ar":"المسافة بين علامتين متتاليتين سنتيمتر واحد.","En":"Adjacent ticks are one centimetre apart."},{"Ar":"تابع العد من 10 ثلاث خطوات.","En":"Count three steps after 10."}],"Solution":{"Idea":{"Ar":"عندما يبدأ القياس عند الصفر وتساوي المسافة بين العلامات وحدة واحدة، نضيف عدد الفواصل إلى الرقم المعروف.","En":"When measurement starts at zero and consecutive ticks are one unit apart, add the number of intervals to the known reading."},"FormulaLatex":"L=10+3\\times1","Steps":[{"Ar":"العلامة الأولى بعد 10 تمثل 11 سم.","En":"The first tick after 10 represents 11 cm."},{"Ar":"العلامتان التاليتان تمثلان 12 ثم 13 سم.","En":"The next two ticks represent 12 and then 13 cm."}],"Substitution":{"Ar":"$10+3=13$","En":"$10+3=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"يبقى من 13 إلى 15 فاصلان، أي سنتيمتران.","En":"Two intervals remain from 13 to 15, or two centimetres."},"CommonError":{"Ar":"لا تتجاهل العلامات التي ليس فوقها رقم.","En":"Do not ignore ticks without printed numbers."}}}$mw$::jsonb,$mw$عندما يبدأ القياس عند الصفر وتساوي المسافة بين العلامات وحدة واحدة، نضيف عدد الفواصل إلى الرقم المعروف.

$L=10+3\times1$

1. العلامة الأولى بعد 10 تمثل 11 سم.

2. العلامتان التاليتان تمثلان 12 ثم 13 سم.

$10+3=13$

$13$ سم

يبقى من 13 إلى 15 فاصلان، أي سنتيمتران.

لا تتجاهل العلامات التي ليس فوقها رقم.$mw$,$mw$When measurement starts at zero and consecutive ticks are one unit apart, add the number of intervals to the known reading.

$L=10+3\times1$

1. The first tick after 10 represents 11 cm.

2. The next two ticks represent 12 and then 13 cm.

$10+3=13$

$13$ cm

Two intervals remain from 13 to 15, or two centimetres.

Do not ignore ticks without printed numbers.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المسافة بين علامتين متتاليتين سنتيمتر واحد.","En":"Adjacent ticks are one centimetre apart."},{"Ar":"تابع العد من 10 ثلاث خطوات.","En":"Count three steps after 10."}],"Solution":{"Idea":{"Ar":"عندما يبدأ القياس عند الصفر وتساوي المسافة بين العلامات وحدة واحدة، نضيف عدد الفواصل إلى الرقم المعروف.","En":"When measurement starts at zero and consecutive ticks are one unit apart, add the number of intervals to the known reading."},"FormulaLatex":"L=10+3\\times1","Steps":[{"Ar":"العلامة الأولى بعد 10 تمثل 11 سم.","En":"The first tick after 10 represents 11 cm."},{"Ar":"العلامتان التاليتان تمثلان 12 ثم 13 سم.","En":"The next two ticks represent 12 and then 13 cm."}],"Substitution":{"Ar":"$10+3=13$","En":"$10+3=13$"},"Result":{"Ar":"$13$","En":"$13$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"يبقى من 13 إلى 15 فاصلان، أي سنتيمتران.","En":"Two intervals remain from 13 to 15, or two centimetres."},"CommonError":{"Ar":"لا تتجاهل العلامات التي ليس فوقها رقم.","En":"Do not ignore ticks without printed numbers."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تجاهل العلامات غير المرقمة بعد 10.","En":"Ignores unlabelled ticks after 10."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عد علامتين بعد 10 فقط.","En":"Counts only two ticks after 10."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"اختار الرقم المطبوع التالي دون قراءة العلامة المطلوبة.","En":"Chooses the next printed label rather than the requested tick."},"Order":4}]}$mw$),
($mw$growth-v22-grade-6-sum-nonoverlapping-triangular-banners-1$mw$,$mw$sum-nonoverlapping-triangular-banners$mw$,$mw$primary-triangle-area$mw$,$mw$grade-6$mw$,6,1,3,14,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":14,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساحة رايتين مثلثتين","En":"Area of two triangular banners"},"Question":{"Ar":"يُراد قص رايتين مثلثتين لا تتداخلان من قماش. قاعدة الأولى 6 سم وارتفاعها العمودي 3 سم، وقاعدة الثانية 4 سم وارتفاعها العمودي 5 سم. ما مجموع مساحتيهما؟","En":"Two nonoverlapping triangular banners are to be cut from fabric. The first has base 6 cm and perpendicular height 3 cm; the second has base 4 cm and perpendicular height 5 cm. What is their combined area?"},"Options":[{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"18 هو حاصل ضرب قاعدة الأولى بارتفاعها، وليس مجموع المساحتين.","En":"18 is the product of the first base and height, not the combined area."}},{"LatexCode":"19","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 هو حاصل ضرب قاعدة الثانية بارتفاعها، وليس مجموع المساحتين.","En":"20 is the product of the second base and height, not the combined area."}},{"LatexCode":"38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع حاصلَي الضرب دون القسمة على 2.","En":"Adds the two products without halving."}}],"Hints":[{"Ar":"احسب مساحة كل مثلث على حدة.","En":"Find the area of each triangle separately."},{"Ar":"استخدم نصف حاصل ضرب القاعدة في الارتفاع العمودي، ثم اجمع المساحتين.","En":"Use half the base times its perpendicular height, then add the areas."}],"Solution":{"Idea":{"Ar":"مساحة المثلث نصف حاصل ضرب القاعدة في الارتفاع العمودي المقابل؛ ولعدم التداخل نجمع المساحتين.","En":"Triangle area is half the base times its corresponding perpendicular height; disjoint areas can be added."},"FormulaLatex":"A=\\frac{b_1h_1+b_2h_2}{2}","Steps":[{"Ar":"$A_1=6\\times3\\div2=9$.","En":"$A_1=6\\times3\\div2=9$."},{"Ar":"$A_2=4\\times5\\div2=10$، ثم $A=9+10$.","En":"$A_2=4\\times5\\div2=10$, then $A=9+10$."}],"Substitution":{"Ar":"$(18+20)/2=19$","En":"$(18+20)/2=19$"},"Result":{"Ar":"$19$","En":"$19$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$2\\times19=38=18+20$","En":"$2\\times19=38=18+20$"},"CommonError":{"Ar":"لا تحسب حاصل ضرب القاعدة والارتفاع على أنه مساحة المثلث.","En":"Do not treat base times height as the area of a triangle."}}}$mw$::jsonb,$mw$مساحة المثلث نصف حاصل ضرب القاعدة في الارتفاع العمودي المقابل؛ ولعدم التداخل نجمع المساحتين.

$A=\frac{b_1h_1+b_2h_2}{2}$

1. $A_1=6\times3\div2=9$.

2. $A_2=4\times5\div2=10$، ثم $A=9+10$.

$(18+20)/2=19$

$19$ سم²

$2\times19=38=18+20$

لا تحسب حاصل ضرب القاعدة والارتفاع على أنه مساحة المثلث.$mw$,$mw$Triangle area is half the base times its corresponding perpendicular height; disjoint areas can be added.

$A=\frac{b_1h_1+b_2h_2}{2}$

1. $A_1=6\times3\div2=9$.

2. $A_2=4\times5\div2=10$, then $A=9+10$.

$(18+20)/2=19$

$19$ cm²

$2\times19=38=18+20$

Do not treat base times height as the area of a triangle.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب مساحة كل مثلث على حدة.","En":"Find the area of each triangle separately."},{"Ar":"استخدم نصف حاصل ضرب القاعدة في الارتفاع العمودي، ثم اجمع المساحتين.","En":"Use half the base times its perpendicular height, then add the areas."}],"Solution":{"Idea":{"Ar":"مساحة المثلث نصف حاصل ضرب القاعدة في الارتفاع العمودي المقابل؛ ولعدم التداخل نجمع المساحتين.","En":"Triangle area is half the base times its corresponding perpendicular height; disjoint areas can be added."},"FormulaLatex":"A=\\frac{b_1h_1+b_2h_2}{2}","Steps":[{"Ar":"$A_1=6\\times3\\div2=9$.","En":"$A_1=6\\times3\\div2=9$."},{"Ar":"$A_2=4\\times5\\div2=10$، ثم $A=9+10$.","En":"$A_2=4\\times5\\div2=10$, then $A=9+10$."}],"Substitution":{"Ar":"$(18+20)/2=19$","En":"$(18+20)/2=19$"},"Result":{"Ar":"$19$","En":"$19$"},"Unit":{"Ar":"سم²","En":"cm²"},"Verification":{"Ar":"$2\\times19=38=18+20$","En":"$2\\times19=38=18+20$"},"CommonError":{"Ar":"لا تحسب حاصل ضرب القاعدة والارتفاع على أنه مساحة المثلث.","En":"Do not treat base times height as the area of a triangle."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"18 هو حاصل ضرب قاعدة الأولى بارتفاعها، وليس مجموع المساحتين.","En":"18 is the product of the first base and height, not the combined area."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"20 هو حاصل ضرب قاعدة الثانية بارتفاعها، وليس مجموع المساحتين.","En":"20 is the product of the second base and height, not the combined area."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع حاصلَي الضرب دون القسمة على 2.","En":"Adds the two products without halving."},"Order":4}]}$mw$),
($mw$growth-v22-grade-6-compare-fixed-and-percent-discounts-1$mw$,$mw$compare-fixed-and-percent-discounts$mw$,$mw$p-fractions-decimals-basic-percentages$mw$,$mw$grade-6$mw$,6,1,21,93,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":93,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة خصمين مختلفين","En":"Comparing two discount offers"},"Question":{"Ar":"سعر حقيبة 80 وحدة نقدية في متجرين. الأول يقدم خصماً بنسبة 15%، والثاني يخصم 10 وحدات نقدية. بكم يزيد الخصم الأكبر على الأصغر؟","En":"A bag costs 80 currency units at two shops. The first offers a 15% discount; the second deducts 10 currency units. By how much does the larger discount exceed the smaller?"},"Options":[{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 10 من 15 مباشرة يخلط نسبة مئوية مع مبلغ.","En":"Subtracts 10 directly from 15, mixing a percentage with an amount."}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الخصم الثاني فقط.","En":"This is the second discount alone."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الخصم الأول فقط، لا الفرق.","En":"This is the first discount alone, not the difference."}}],"Hints":[{"Ar":"حوّل الخصم النسبي إلى مبلغ نقدي.","En":"Convert the percentage discount into money."},{"Ar":"قارن مبلغ الخصم المحسوب بالخصم الثابت.","En":"Compare the calculated discount with the fixed discount."}],"Solution":{"Idea":{"Ar":"نحسب الخصم النسبي من السعر الأصلي، ثم نقارن المبلغين بالوحدة نفسها.","En":"Calculate the percentage discount from the original price, then compare both amounts in the same unit."},"FormulaLatex":"D=P\\frac{p}{100},\\quad \\Delta=|D-F|","Steps":[{"Ar":"$D=80\\times15/100=12$.","En":"$D=80\\times15/100=12$."},{"Ar":"الخصم الثابت 10؛ الفرق $12-10=2$.","En":"The fixed discount is 10; the difference is $12-10=2$."}],"Substitution":{"Ar":"$|12-10|=2$","En":"$|12-10|=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"وحدة نقدية","En":"currency units"},"Verification":{"Ar":"السعران بعد الخصم هما 68 و70؛ الفرق بينهما 2 أيضاً.","En":"The discounted prices are 68 and 70; their difference is also 2."},"CommonError":{"Ar":"لا تقارن نسبة 15% مباشرة بمبلغ 10.","En":"Do not compare 15% directly with the amount 10."}}}$mw$::jsonb,$mw$نحسب الخصم النسبي من السعر الأصلي، ثم نقارن المبلغين بالوحدة نفسها.

$D=P\frac{p}{100},\quad \Delta=|D-F|$

1. $D=80\times15/100=12$.

2. الخصم الثابت 10؛ الفرق $12-10=2$.

$|12-10|=2$

$2$ وحدة نقدية

السعران بعد الخصم هما 68 و70؛ الفرق بينهما 2 أيضاً.

لا تقارن نسبة 15% مباشرة بمبلغ 10.$mw$,$mw$Calculate the percentage discount from the original price, then compare both amounts in the same unit.

$D=P\frac{p}{100},\quad \Delta=|D-F|$

1. $D=80\times15/100=12$.

2. The fixed discount is 10; the difference is $12-10=2$.

$|12-10|=2$

$2$ currency units

The discounted prices are 68 and 70; their difference is also 2.

Do not compare 15% directly with the amount 10.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الخصم النسبي إلى مبلغ نقدي.","En":"Convert the percentage discount into money."},{"Ar":"قارن مبلغ الخصم المحسوب بالخصم الثابت.","En":"Compare the calculated discount with the fixed discount."}],"Solution":{"Idea":{"Ar":"نحسب الخصم النسبي من السعر الأصلي، ثم نقارن المبلغين بالوحدة نفسها.","En":"Calculate the percentage discount from the original price, then compare both amounts in the same unit."},"FormulaLatex":"D=P\\frac{p}{100},\\quad \\Delta=|D-F|","Steps":[{"Ar":"$D=80\\times15/100=12$.","En":"$D=80\\times15/100=12$."},{"Ar":"الخصم الثابت 10؛ الفرق $12-10=2$.","En":"The fixed discount is 10; the difference is $12-10=2$."}],"Substitution":{"Ar":"$|12-10|=2$","En":"$|12-10|=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"وحدة نقدية","En":"currency units"},"Verification":{"Ar":"السعران بعد الخصم هما 68 و70؛ الفرق بينهما 2 أيضاً.","En":"The discounted prices are 68 and 70; their difference is also 2."},"CommonError":{"Ar":"لا تقارن نسبة 15% مباشرة بمبلغ 10.","En":"Do not compare 15% directly with the amount 10."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"طرح 10 من 15 مباشرة يخلط نسبة مئوية مع مبلغ.","En":"Subtracts 10 directly from 15, mixing a percentage with an amount."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الخصم الثاني فقط.","En":"This is the second discount alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار الخصم الأول فقط، لا الفرق.","En":"This is the first discount alone, not the difference."},"Order":4}]}$mw$),
($mw$growth-v22-grade-9-inequality-variable-both-sides-1$mw$,$mw$inequality-variable-both-sides$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-9$mw$,9,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متغير في طرفي المتباينة","En":"Variable on both sides of an inequality"},"Question":{"Ar":"ما مجموعة حلول المتباينة $4x+5\\le2x+13$ في الأعداد الحقيقية؟","En":"What is the real solution set of $4x+5\\le2x+13$?"},"Options":[{"LatexCode":"x\\ge4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اتجاه المتباينة لا ينعكس عند القسمة على 2 الموجب.","En":"The inequality direction does not reverse when dividing by positive 2."}},{"LatexCode":"x<4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استبعد حالة المساواة رغم وجود رمز أصغر من أو يساوي.","En":"Excludes equality although the symbol permits it."}},{"LatexCode":"x\\le4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x\\le9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحد 9 لا يحقق المتباينة: عنده الطرفان 41 و31.","En":"The bound 9 fails: at 9 the two sides are 41 and 31."}}],"Hints":[{"Ar":"اطرح الحد المتغير الأصغر من الطرفين.","En":"Subtract the smaller variable term from both sides."},{"Ar":"اعزل المتغير بالقسمة على معامل موجب ولا تعكس الاتجاه.","En":"Isolate the variable by dividing by a positive coefficient without reversing the sign."}],"Solution":{"Idea":{"Ar":"إضافة أو طرح المقدار نفسه من الطرفين يحافظ على المتباينة، وكذلك القسمة على عدد موجب.","En":"Adding or subtracting the same quantity on both sides preserves an inequality, as does division by a positive number."},"FormulaLatex":"a\\le b\\Rightarrow a-c\\le b-c,\\quad \\frac{a}{k}\\le\\frac{b}{k}\\ (k>0)","Steps":[{"Ar":"نطرح $2x$ من الطرفين: $2x+5\\le13$.","En":"Subtract $2x$ from both sides: $2x+5\\le13$."},{"Ar":"نطرح 5 فنحصل على $2x\\le8$، ثم نقسم على 2 الموجب.","En":"Subtract 5 to get $2x\\le8$, then divide by positive 2."}],"Substitution":{"Ar":"$x\\le8/2=4$","En":"$x\\le8/2=4$"},"Result":{"Ar":"$x\\le4$","En":"$x\\le4$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"عند $x=4$ الطرفان 21؛ عند $x=3$ الطرفان 17 و19؛ وعند $x=5$ الطرفان 25 و23.","En":"At $x=4$ both sides are 21; at $x=3$ the sides are 17 and 19; at $x=5$ they are 25 and 23."},"CommonError":{"Ar":"اعكس اتجاه المتباينة فقط عند الضرب أو القسمة على عدد سالب.","En":"Reverse the inequality only when multiplying or dividing by a negative number."}}}$mw$::jsonb,$mw$إضافة أو طرح المقدار نفسه من الطرفين يحافظ على المتباينة، وكذلك القسمة على عدد موجب.

$a\le b\Rightarrow a-c\le b-c,\quad \frac{a}{k}\le\frac{b}{k}\ (k>0)$

1. نطرح $2x$ من الطرفين: $2x+5\le13$.

2. نطرح 5 فنحصل على $2x\le8$، ثم نقسم على 2 الموجب.

$x\le8/2=4$

$x\le4$ بلا وحدة قياس

عند $x=4$ الطرفان 21؛ عند $x=3$ الطرفان 17 و19؛ وعند $x=5$ الطرفان 25 و23.

اعكس اتجاه المتباينة فقط عند الضرب أو القسمة على عدد سالب.$mw$,$mw$Adding or subtracting the same quantity on both sides preserves an inequality, as does division by a positive number.

$a\le b\Rightarrow a-c\le b-c,\quad \frac{a}{k}\le\frac{b}{k}\ (k>0)$

1. Subtract $2x$ from both sides: $2x+5\le13$.

2. Subtract 5 to get $2x\le8$, then divide by positive 2.

$x\le8/2=4$

$x\le4$ Dimensionless

At $x=4$ both sides are 21; at $x=3$ the sides are 17 and 19; at $x=5$ they are 25 and 23.

Reverse the inequality only when multiplying or dividing by a negative number.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اطرح الحد المتغير الأصغر من الطرفين.","En":"Subtract the smaller variable term from both sides."},{"Ar":"اعزل المتغير بالقسمة على معامل موجب ولا تعكس الاتجاه.","En":"Isolate the variable by dividing by a positive coefficient without reversing the sign."}],"Solution":{"Idea":{"Ar":"إضافة أو طرح المقدار نفسه من الطرفين يحافظ على المتباينة، وكذلك القسمة على عدد موجب.","En":"Adding or subtracting the same quantity on both sides preserves an inequality, as does division by a positive number."},"FormulaLatex":"a\\le b\\Rightarrow a-c\\le b-c,\\quad \\frac{a}{k}\\le\\frac{b}{k}\\ (k>0)","Steps":[{"Ar":"نطرح $2x$ من الطرفين: $2x+5\\le13$.","En":"Subtract $2x$ from both sides: $2x+5\\le13$."},{"Ar":"نطرح 5 فنحصل على $2x\\le8$، ثم نقسم على 2 الموجب.","En":"Subtract 5 to get $2x\\le8$, then divide by positive 2."}],"Substitution":{"Ar":"$x\\le8/2=4$","En":"$x\\le8/2=4$"},"Result":{"Ar":"$x\\le4$","En":"$x\\le4$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"عند $x=4$ الطرفان 21؛ عند $x=3$ الطرفان 17 و19؛ وعند $x=5$ الطرفان 25 و23.","En":"At $x=4$ both sides are 21; at $x=3$ the sides are 17 and 19; at $x=5$ they are 25 and 23."},"CommonError":{"Ar":"اعكس اتجاه المتباينة فقط عند الضرب أو القسمة على عدد سالب.","En":"Reverse the inequality only when multiplying or dividing by a negative number."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اتجاه المتباينة لا ينعكس عند القسمة على 2 الموجب.","En":"The inequality direction does not reverse when dividing by positive 2."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"استبعد حالة المساواة رغم وجود رمز أصغر من أو يساوي.","En":"Excludes equality although the symbol permits it."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الحد 9 لا يحقق المتباينة: عنده الطرفان 41 و31.","En":"The bound 9 fails: at 9 the two sides are 41 and 31."},"Order":4}]}$mw$),
($mw$growth-v22-grade-9-compare-mad-equal-mean-1$mw$,$mw$compare-mad-equal-mean$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تشتت مختلف مع متوسط متساوٍ","En":"Different spread with equal means"},"Question":{"Ar":"مجموعتا القياسات A وB هما (2، 4، 6، 8) و(4، 4، 6، 6) على الترتيب. بكم يزيد متوسط الانحراف المطلق عن المتوسط الحسابي في المجموعة A على نظيره في المجموعة B؟","En":"Data sets A and B are (2, 4, 6, 8) and (4, 4, 6, 6), respectively. By how much does the mean absolute deviation from the mean in A exceed that in B?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تساوي المتوسطين لا يعني تساوي التشتت.","En":"Equal means do not imply equal spreads."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا متوسط الانحراف المطلق للمجموعة A وحدها.","En":"This is the mean absolute deviation of A alone."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق بين مجموعَي الانحرافات قبل القسمة على 4.","En":"This is the difference in sums of deviations before dividing by 4."}}],"Hints":[{"Ar":"احسب المتوسط الحسابي لكل مجموعة أولاً.","En":"Find the arithmetic mean of each data set first."},{"Ar":"احسب المسافات المطلقة عن المتوسط، واجمعها ثم اقسم على عدد القيم.","En":"Find absolute distances from the mean, add them and divide by the number of values."}],"Solution":{"Idea":{"Ar":"متوسط الانحراف المطلق يقيس متوسط المسافة عن المتوسط الحسابي؛ نطبقه على كل مجموعة غير فارغة ثم نقارن.","En":"Mean absolute deviation measures the average distance from the arithmetic mean; apply it to each nonempty set and compare."},"FormulaLatex":"MAD=\\frac1n\\sum_{i=1}^{n}|x_i-\\bar x|,\\quad n>0","Steps":[{"Ar":"متوسط كل مجموعة هو 5.","En":"Both data sets have mean 5."},{"Ar":"$MAD_A=(3+1+1+3)/4=2$.","En":"$MAD_A=(3+1+1+3)/4=2$."},{"Ar":"$MAD_B=(1+1+1+1)/4=1$.","En":"$MAD_B=(1+1+1+1)/4=1$."}],"Substitution":{"Ar":"$2-1=1$","En":"$2-1=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"بلا وحدة محددة في السؤال","En":"No specific unit stated"},"Verification":{"Ar":"مجموعا المسافات 8 و4، وفرقهما 4؛ بالقسمة على 4 نحصل على 1.","En":"The distance sums are 8 and 4; their difference is 4, giving 1 after division by 4."},"CommonError":{"Ar":"لا تجمع الانحرافات بإشاراتها؛ خذ قيمها المطلقة.","En":"Do not sum signed deviations; use absolute values."}}}$mw$::jsonb,$mw$متوسط الانحراف المطلق يقيس متوسط المسافة عن المتوسط الحسابي؛ نطبقه على كل مجموعة غير فارغة ثم نقارن.

$MAD=\frac1n\sum_{i=1}^{n}|x_i-\bar x|,\quad n>0$

1. متوسط كل مجموعة هو 5.

2. $MAD_A=(3+1+1+3)/4=2$.

3. $MAD_B=(1+1+1+1)/4=1$.

$2-1=1$

$1$ بلا وحدة محددة في السؤال

مجموعا المسافات 8 و4، وفرقهما 4؛ بالقسمة على 4 نحصل على 1.

لا تجمع الانحرافات بإشاراتها؛ خذ قيمها المطلقة.$mw$,$mw$Mean absolute deviation measures the average distance from the arithmetic mean; apply it to each nonempty set and compare.

$MAD=\frac1n\sum_{i=1}^{n}|x_i-\bar x|,\quad n>0$

1. Both data sets have mean 5.

2. $MAD_A=(3+1+1+3)/4=2$.

3. $MAD_B=(1+1+1+1)/4=1$.

$2-1=1$

$1$ No specific unit stated

The distance sums are 8 and 4; their difference is 4, giving 1 after division by 4.

Do not sum signed deviations; use absolute values.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب المتوسط الحسابي لكل مجموعة أولاً.","En":"Find the arithmetic mean of each data set first."},{"Ar":"احسب المسافات المطلقة عن المتوسط، واجمعها ثم اقسم على عدد القيم.","En":"Find absolute distances from the mean, add them and divide by the number of values."}],"Solution":{"Idea":{"Ar":"متوسط الانحراف المطلق يقيس متوسط المسافة عن المتوسط الحسابي؛ نطبقه على كل مجموعة غير فارغة ثم نقارن.","En":"Mean absolute deviation measures the average distance from the arithmetic mean; apply it to each nonempty set and compare."},"FormulaLatex":"MAD=\\frac1n\\sum_{i=1}^{n}|x_i-\\bar x|,\\quad n>0","Steps":[{"Ar":"متوسط كل مجموعة هو 5.","En":"Both data sets have mean 5."},{"Ar":"$MAD_A=(3+1+1+3)/4=2$.","En":"$MAD_A=(3+1+1+3)/4=2$."},{"Ar":"$MAD_B=(1+1+1+1)/4=1$.","En":"$MAD_B=(1+1+1+1)/4=1$."}],"Substitution":{"Ar":"$2-1=1$","En":"$2-1=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"بلا وحدة محددة في السؤال","En":"No specific unit stated"},"Verification":{"Ar":"مجموعا المسافات 8 و4، وفرقهما 4؛ بالقسمة على 4 نحصل على 1.","En":"The distance sums are 8 and 4; their difference is 4, giving 1 after division by 4."},"CommonError":{"Ar":"لا تجمع الانحرافات بإشاراتها؛ خذ قيمها المطلقة.","En":"Do not sum signed deviations; use absolute values."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تساوي المتوسطين لا يعني تساوي التشتت.","En":"Equal means do not imply equal spreads."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا متوسط الانحراف المطلق للمجموعة A وحدها.","En":"This is the mean absolute deviation of A alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق بين مجموعَي الانحرافات قبل القسمة على 4.","En":"This is the difference in sums of deviations before dividing by 4."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v22 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
