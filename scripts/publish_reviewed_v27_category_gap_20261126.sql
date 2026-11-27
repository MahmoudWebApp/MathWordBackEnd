-- One-time owner-authorized content and grade-category mapping expansion; preserve all free pairs. CCSS 1.MD.A.2,1.MD.B.3,6.SP.B.5.c; Cambridge primary strand progression.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v27-grade-1-same-size-unit-length-iteration-1$mw$,$mw$same-size-unit-length-iteration$mw$,$mw$length$mw$,$mw$grade-1$mw$,1,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"القياس بوحدات متساوية","En":"Measuring with equal units"},"Question":{"Ar":"لدى طفل أعواد متساوية الطول. يضع أربعة أعواد متلامسة من طرف إلى طرف دون تداخل أو فراغات على طول قلم. يصل العود الرابع تماماً إلى نهاية القلم. كم طول القلم بوحدة العود؟","En":"A child has equal-length sticks. Four sticks placed end to end without gaps or overlaps cover a pencil exactly. What is the pencil length in stick units?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أعواد لا تصل إلى نهاية القلم.","En":"Three sticks do not reach the end of the pencil."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة أعواد تتجاوز نهاية القلم.","En":"Five sticks extend beyond the pencil."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد طرفي كل عود لا الأعواد نفسها.","En":"Counts both ends of each stick instead of the sticks."}}],"Hints":[{"Ar":"ما وحدة الطول في هذا السؤال؟","En":"What is the unit of length here?"},{"Ar":"عد الأعواد المستخدمة نفسها، لا أطرافها.","En":"Count the sticks themselves, not their ends."}],"Solution":{"Idea":{"Ar":"عند وضع وحدات متساوية دون فراغات أو تداخل، يساوي الطول عدد الوحدات التي تغطيه تماماً.","En":"Equal units laid without gaps or overlap measure length by the number of units that exactly cover it."},"FormulaLatex":"1+1+1+1","Steps":[{"Ar":"كل عود يمثل وحدة طول واحدة.","En":"Each stick represents one unit of length."},{"Ar":"تغطي أربعة أعواد القلم تماماً، إذن طول القلم أربع وحدات.","En":"Four sticks cover the pencil exactly, so its length is four units."}],"Substitution":{"Ar":"$1+1+1+1=4$","En":"$1+1+1+1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"وحدات طول","En":"Length units"},"Verification":{"Ar":"إذا أزلنا عوداً واحداً تصبح التغطية ناقصة، مما يؤكد أن أربعة أعواد لازمة.","En":"Removing one stick leaves the coverage incomplete, confirming four sticks are needed."},"CommonError":{"Ar":"لا تعد نقاط التلامس أو أطراف الأعواد بدلاً من وحدات الطول.","En":"Do not count contact points or stick endpoints instead of length units."}}}$mw$::jsonb,$mw$عند وضع وحدات متساوية دون فراغات أو تداخل، يساوي الطول عدد الوحدات التي تغطيه تماماً.

$1+1+1+1$

1. كل عود يمثل وحدة طول واحدة.

2. تغطي أربعة أعواد القلم تماماً، إذن طول القلم أربع وحدات.

$1+1+1+1=4$

$4$ وحدات طول

إذا أزلنا عوداً واحداً تصبح التغطية ناقصة، مما يؤكد أن أربعة أعواد لازمة.

لا تعد نقاط التلامس أو أطراف الأعواد بدلاً من وحدات الطول.$mw$,$mw$Equal units laid without gaps or overlap measure length by the number of units that exactly cover it.

$1+1+1+1$

1. Each stick represents one unit of length.

2. Four sticks cover the pencil exactly, so its length is four units.

$1+1+1+1=4$

$4$ Length units

Removing one stick leaves the coverage incomplete, confirming four sticks are needed.

Do not count contact points or stick endpoints instead of length units.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ما وحدة الطول في هذا السؤال؟","En":"What is the unit of length here?"},{"Ar":"عد الأعواد المستخدمة نفسها، لا أطرافها.","En":"Count the sticks themselves, not their ends."}],"Solution":{"Idea":{"Ar":"عند وضع وحدات متساوية دون فراغات أو تداخل، يساوي الطول عدد الوحدات التي تغطيه تماماً.","En":"Equal units laid without gaps or overlap measure length by the number of units that exactly cover it."},"FormulaLatex":"1+1+1+1","Steps":[{"Ar":"كل عود يمثل وحدة طول واحدة.","En":"Each stick represents one unit of length."},{"Ar":"تغطي أربعة أعواد القلم تماماً، إذن طول القلم أربع وحدات.","En":"Four sticks cover the pencil exactly, so its length is four units."}],"Substitution":{"Ar":"$1+1+1+1=4$","En":"$1+1+1+1=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"وحدات طول","En":"Length units"},"Verification":{"Ar":"إذا أزلنا عوداً واحداً تصبح التغطية ناقصة، مما يؤكد أن أربعة أعواد لازمة.","En":"Removing one stick leaves the coverage incomplete, confirming four sticks are needed."},"CommonError":{"Ar":"لا تعد نقاط التلامس أو أطراف الأعواد بدلاً من وحدات الطول.","En":"Do not count contact points or stick endpoints instead of length units."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أعواد لا تصل إلى نهاية القلم.","En":"Three sticks do not reach the end of the pencil."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خمسة أعواد تتجاوز نهاية القلم.","En":"Five sticks extend beyond the pencil."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عد طرفي كل عود لا الأعواد نفسها.","En":"Counts both ends of each stick instead of the sticks."},"Order":4}]}$mw$),
($mw$growth-v27-grade-1-read-half-hour-from-clock-hands-1$mw$,$mw$read-half-hour-from-clock-hands$mw$,$mw$time$mw$,$mw$grade-1$mw$,1,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"قراءة الساعة ونصف الساعة","En":"Reading the half hour"},"Question":{"Ar":"على ساعة ذات عقربين، يشير عقرب الدقائق إلى العدد 6 ويقع عقرب الساعات في منتصف المسافة بين 2 و3. ما الوقت؟","En":"On an analogue clock, the minute hand points to 6 and the hour hand is halfway between 2 and 3. What time is it?"},"Options":[{"LatexCode":"2{:}00","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند 2:00 يشير عقرب الدقائق إلى 12.","En":"At 2:00 the minute hand points to 12."}},{"LatexCode":"2{:}30","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3{:}00","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عند 3:00 يشير عقرب الساعات إلى 3 تماماً.","En":"At 3:00 the hour hand points exactly at 3."}},{"LatexCode":"6{:}02","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"العدد 6 على قرص الساعة يمثل 30 دقيقة لعقرب الدقائق، وليس الساعة السادسة.","En":"The numeral 6 represents 30 minutes for the minute hand, not six o'clock."}}],"Hints":[{"Ar":"حدد أولاً ما إذا كان عقرب الدقائق عند 12 أم 6.","En":"First decide whether the minute hand is at 12 or 6."},{"Ar":"عقرب الساعات تجاوز 2 ولم يصل إلى 3.","En":"The hour hand has passed 2 but not reached 3."}],"Solution":{"Idea":{"Ar":"عقرب الدقائق عند 6 يعني نصف ساعة بعد الساعة التي تجاوزها عقرب الساعات.","En":"A minute hand at 6 means half an hour past the hour already passed by the hour hand."},"FormulaLatex":"30=60/2","Steps":[{"Ar":"عقرب الدقائق عند 6 يعني 30 دقيقة.","En":"The minute hand at 6 means 30 minutes."},{"Ar":"عقرب الساعات بين 2 و3 يعني أن الساعة الثانية قد مرت.","En":"The hour hand between 2 and 3 means two o'clock has passed."}],"Substitution":{"Ar":"$2{:}30$","En":"$2{:}30$"},"Result":{"Ar":"$2{:}30$","En":"$2{:}30$"},"Unit":{"Ar":"وقت","En":"Time"},"Verification":{"Ar":"بعد نصف ساعة أخرى يصبح الوقت 3:00 ويصل عقرب الدقائق إلى 12.","En":"Another half hour brings 3:00 and the minute hand to 12."},"CommonError":{"Ar":"لا تبدل بين وظيفة عقرب الساعات وعقرب الدقائق.","En":"Do not swap the roles of the hour and minute hands."}}}$mw$::jsonb,$mw$عقرب الدقائق عند 6 يعني نصف ساعة بعد الساعة التي تجاوزها عقرب الساعات.

$30=60/2$

1. عقرب الدقائق عند 6 يعني 30 دقيقة.

2. عقرب الساعات بين 2 و3 يعني أن الساعة الثانية قد مرت.

$2{:}30$

$2{:}30$ وقت

بعد نصف ساعة أخرى يصبح الوقت 3:00 ويصل عقرب الدقائق إلى 12.

لا تبدل بين وظيفة عقرب الساعات وعقرب الدقائق.$mw$,$mw$A minute hand at 6 means half an hour past the hour already passed by the hour hand.

$30=60/2$

1. The minute hand at 6 means 30 minutes.

2. The hour hand between 2 and 3 means two o'clock has passed.

$2{:}30$

$2{:}30$ Time

Another half hour brings 3:00 and the minute hand to 12.

Do not swap the roles of the hour and minute hands.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"حدد أولاً ما إذا كان عقرب الدقائق عند 12 أم 6.","En":"First decide whether the minute hand is at 12 or 6."},{"Ar":"عقرب الساعات تجاوز 2 ولم يصل إلى 3.","En":"The hour hand has passed 2 but not reached 3."}],"Solution":{"Idea":{"Ar":"عقرب الدقائق عند 6 يعني نصف ساعة بعد الساعة التي تجاوزها عقرب الساعات.","En":"A minute hand at 6 means half an hour past the hour already passed by the hour hand."},"FormulaLatex":"30=60/2","Steps":[{"Ar":"عقرب الدقائق عند 6 يعني 30 دقيقة.","En":"The minute hand at 6 means 30 minutes."},{"Ar":"عقرب الساعات بين 2 و3 يعني أن الساعة الثانية قد مرت.","En":"The hour hand between 2 and 3 means two o'clock has passed."}],"Substitution":{"Ar":"$2{:}30$","En":"$2{:}30$"},"Result":{"Ar":"$2{:}30$","En":"$2{:}30$"},"Unit":{"Ar":"وقت","En":"Time"},"Verification":{"Ar":"بعد نصف ساعة أخرى يصبح الوقت 3:00 ويصل عقرب الدقائق إلى 12.","En":"Another half hour brings 3:00 and the minute hand to 12."},"CommonError":{"Ar":"لا تبدل بين وظيفة عقرب الساعات وعقرب الدقائق.","En":"Do not swap the roles of the hour and minute hands."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عند 2:00 يشير عقرب الدقائق إلى 12.","En":"At 2:00 the minute hand points to 12."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عند 3:00 يشير عقرب الساعات إلى 3 تماماً.","En":"At 3:00 the hour hand points exactly at 3."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"العدد 6 على قرص الساعة يمثل 30 دقيقة لعقرب الدقائق، وليس الساعة السادسة.","En":"The numeral 6 represents 30 minutes for the minute hand, not six o'clock."},"Order":4}]}$mw$),
($mw$growth-v27-grade-6-mean-combine-frequency-counts-1$mw$,$mw$mean-combine-frequency-counts$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-6$mw$,6,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حساب المتوسط من التكرارات","En":"Computing a mean from frequencies"},"Question":{"Ar":"سجلت مجموعة من 8 طلاب عدد الكتب المقروءة: 3 طلاب قرؤوا كتابين لكل منهم، و4 طلاب قرؤوا 4 كتب لكل منهم، وطالب واحد قرأ 10 كتب. ما متوسط عدد الكتب لكل طالب؟","En":"Eight pupils reported their reading: 3 read 2 books each, 4 read 4 books each, and 1 read 10 books. What is the mean number of books per pupil?"},"Options":[{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع 32 كتاباً وعدد الطلاب 8، فلا يساوي المتوسط 5.","En":"There are 32 books and 8 pupils, so the mean is not 5."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 لا يساوي مجموع القراءات مقسوماً على عدد الطلاب.","En":"6 is not the total readings divided by the pupil count."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 هو عدد الطلاب وليس متوسط القراءات.","En":"8 is the pupil count, not the mean reading."}}],"Hints":[{"Ar":"احسب عدد الكتب في كل مجموعة من الطلاب.","En":"Find the total books read by each group."},{"Ar":"اجمع الكتب واقسم على عدد الطلاب، لا عدد مجموعات التكرار.","En":"Add the books and divide by the number of pupils, not the number of frequency groups."}],"Solution":{"Idea":{"Ar":"المتوسط الحسابي للبيانات ذات التكرار يساوي مجموع حاصل ضرب كل قيمة في تكرارها مقسوماً على مجموع التكرارات الموجب.","En":"The mean of frequency data is the sum of each value times its frequency divided by the positive total frequency."},"FormulaLatex":"\\bar x=\\frac{\\sum_i f_ix_i}{\\sum_i f_i}","Steps":[{"Ar":"المجموع للفئة الأولى 3×2=6 كتب، وللثانية 4×4=16، وللثالثة 1×10=10.","En":"The first group reads 3×2=6 books, the second 4×4=16, and the third 1×10=10."},{"Ar":"إجمالي الكتب 6+16+10=32. العدد الكلي للطلاب 3+4+1=8.","En":"Total books are 6+16+10=32. The total pupils are 3+4+1=8."}],"Substitution":{"Ar":"$\\bar x=\\frac{32}{8}=4$","En":"$\\bar x=\\frac{32}{8}=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"كتب لكل طالب","En":"Books per pupil"},"Verification":{"Ar":"لو قرأ كل طالب 4 كتب لحصلنا على 8×4=32 كتاباً، وهو المجموع الفعلي.","En":"If each pupil read four books, 8×4=32 would match the actual total."},"CommonError":{"Ar":"لا تحسب متوسط 2 و4 و10 دون التكرارات.","En":"Do not average 2, 4 and 10 without their frequencies."}}}$mw$::jsonb,$mw$المتوسط الحسابي للبيانات ذات التكرار يساوي مجموع حاصل ضرب كل قيمة في تكرارها مقسوماً على مجموع التكرارات الموجب.

$\bar x=\frac{\sum_i f_ix_i}{\sum_i f_i}$

1. المجموع للفئة الأولى 3×2=6 كتب، وللثانية 4×4=16، وللثالثة 1×10=10.

2. إجمالي الكتب 6+16+10=32. العدد الكلي للطلاب 3+4+1=8.

$\bar x=\frac{32}{8}=4$

$4$ كتب لكل طالب

لو قرأ كل طالب 4 كتب لحصلنا على 8×4=32 كتاباً، وهو المجموع الفعلي.

لا تحسب متوسط 2 و4 و10 دون التكرارات.$mw$,$mw$The mean of frequency data is the sum of each value times its frequency divided by the positive total frequency.

$\bar x=\frac{\sum_i f_ix_i}{\sum_i f_i}$

1. The first group reads 3×2=6 books, the second 4×4=16, and the third 1×10=10.

2. Total books are 6+16+10=32. The total pupils are 3+4+1=8.

$\bar x=\frac{32}{8}=4$

$4$ Books per pupil

If each pupil read four books, 8×4=32 would match the actual total.

Do not average 2, 4 and 10 without their frequencies.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب عدد الكتب في كل مجموعة من الطلاب.","En":"Find the total books read by each group."},{"Ar":"اجمع الكتب واقسم على عدد الطلاب، لا عدد مجموعات التكرار.","En":"Add the books and divide by the number of pupils, not the number of frequency groups."}],"Solution":{"Idea":{"Ar":"المتوسط الحسابي للبيانات ذات التكرار يساوي مجموع حاصل ضرب كل قيمة في تكرارها مقسوماً على مجموع التكرارات الموجب.","En":"The mean of frequency data is the sum of each value times its frequency divided by the positive total frequency."},"FormulaLatex":"\\bar x=\\frac{\\sum_i f_ix_i}{\\sum_i f_i}","Steps":[{"Ar":"المجموع للفئة الأولى 3×2=6 كتب، وللثانية 4×4=16، وللثالثة 1×10=10.","En":"The first group reads 3×2=6 books, the second 4×4=16, and the third 1×10=10."},{"Ar":"إجمالي الكتب 6+16+10=32. العدد الكلي للطلاب 3+4+1=8.","En":"Total books are 6+16+10=32. The total pupils are 3+4+1=8."}],"Substitution":{"Ar":"$\\bar x=\\frac{32}{8}=4$","En":"$\\bar x=\\frac{32}{8}=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"كتب لكل طالب","En":"Books per pupil"},"Verification":{"Ar":"لو قرأ كل طالب 4 كتب لحصلنا على 8×4=32 كتاباً، وهو المجموع الفعلي.","En":"If each pupil read four books, 8×4=32 would match the actual total."},"CommonError":{"Ar":"لا تحسب متوسط 2 و4 و10 دون التكرارات.","En":"Do not average 2, 4 and 10 without their frequencies."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المجموع 32 كتاباً وعدد الطلاب 8، فلا يساوي المتوسط 5.","En":"There are 32 books and 8 pupils, so the mean is not 5."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 لا يساوي مجموع القراءات مقسوماً على عدد الطلاب.","En":"6 is not the total readings divided by the pupil count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 هو عدد الطلاب وليس متوسط القراءات.","En":"8 is the pupil count, not the mean reading."},"Order":4}]}$mw$),
($mw$growth-v27-grade-6-median-from-ordered-frequency-groups-1$mw$,$mw$median-from-ordered-frequency-groups$mw$,$mw$primary-median$mw$,$mw$grade-6$mw$,6,1,4,18,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":18,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد الوسيط من تكرارات مرتبة","En":"Finding the median from ordered frequencies"},"Question":{"Ar":"أُحصيت أعداد الأقلام في حقائب 9 طلاب: طالبان لديهما قلم واحد لكل منهما، و4 طلاب لديهم 3 أقلام لكل منهم، و3 طلاب لديهم 5 أقلام لكل منهم. ما وسيط عدد الأقلام؟","En":"The numbers of pencils in 9 pupils' bags are recorded: 2 pupils have 1 each, 4 have 3 each, and 3 have 5 each. What is the median number of pencils?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القيمة 1 تشغل الموضعين الأول والثاني فقط.","En":"1 occupies only the first two positions."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 تكرار القيمة 3 وليس قيمة من البيانات.","En":"4 is the frequency of value 3, not an observed value."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"القيمة 5 تشغل المواضع السابع إلى التاسع، وليس الخامس.","En":"5 occupies positions seven to nine, not the fifth."}}],"Hints":[{"Ar":"حدد موضع الوسيط في قائمة تضم 9 قيماً مرتبة.","En":"Find the median position in a sorted list of 9 observations."},{"Ar":"استعمل التكرارات لتعرف أي قيمة تحتل ذلك الموضع.","En":"Use the frequencies to find which value occupies that position."}],"Solution":{"Idea":{"Ar":"إذا كان عدد القيم فردياً ومرتباً تصاعدياً، يقع الوسيط في الموضع الأوسط.","En":"For an odd number of values in ascending order, the median is the middle observation."},"FormulaLatex":"k=\\frac{n+1}{2}","Steps":[{"Ar":"عدد الطلاب 9، لذا موضع الوسيط (9+1)/2=5.","En":"There are 9 pupils, so the median position is (9+1)/2=5."},{"Ar":"القيمة 1 في الموضعين 1 و2، والقيمة 3 في المواضع 3 إلى 6، والقيمة 5 في المواضع 7 إلى 9.","En":"Value 1 occupies positions 1 and 2, value 3 positions 3 through 6, and value 5 positions 7 through 9."},{"Ar":"الموضع الخامس يحمل القيمة 3.","En":"The fifth position contains value 3."}],"Substitution":{"Ar":"$k=5$","En":"$k=5$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"أقلام","En":"Pencils"},"Verification":{"Ar":"القائمة هي 1،1،3،3،3،3،5،5،5، وتوجد أربع قيم قبل الموضع الخامس وأربع بعده.","En":"The list is 1,1,3,3,3,3,5,5,5, with four entries before and four after position five."},"CommonError":{"Ar":"لا تخلط بين قيمة الوسيط وعدد مرات تكرارها.","En":"Do not confuse the median value with its frequency."}}}$mw$::jsonb,$mw$إذا كان عدد القيم فردياً ومرتباً تصاعدياً، يقع الوسيط في الموضع الأوسط.

$k=\frac{n+1}{2}$

1. عدد الطلاب 9، لذا موضع الوسيط (9+1)/2=5.

2. القيمة 1 في الموضعين 1 و2، والقيمة 3 في المواضع 3 إلى 6، والقيمة 5 في المواضع 7 إلى 9.

3. الموضع الخامس يحمل القيمة 3.

$k=5$

$3$ أقلام

القائمة هي 1،1،3،3،3،3،5،5،5، وتوجد أربع قيم قبل الموضع الخامس وأربع بعده.

لا تخلط بين قيمة الوسيط وعدد مرات تكرارها.$mw$,$mw$For an odd number of values in ascending order, the median is the middle observation.

$k=\frac{n+1}{2}$

1. There are 9 pupils, so the median position is (9+1)/2=5.

2. Value 1 occupies positions 1 and 2, value 3 positions 3 through 6, and value 5 positions 7 through 9.

3. The fifth position contains value 3.

$k=5$

$3$ Pencils

The list is 1,1,3,3,3,3,5,5,5, with four entries before and four after position five.

Do not confuse the median value with its frequency.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد موضع الوسيط في قائمة تضم 9 قيماً مرتبة.","En":"Find the median position in a sorted list of 9 observations."},{"Ar":"استعمل التكرارات لتعرف أي قيمة تحتل ذلك الموضع.","En":"Use the frequencies to find which value occupies that position."}],"Solution":{"Idea":{"Ar":"إذا كان عدد القيم فردياً ومرتباً تصاعدياً، يقع الوسيط في الموضع الأوسط.","En":"For an odd number of values in ascending order, the median is the middle observation."},"FormulaLatex":"k=\\frac{n+1}{2}","Steps":[{"Ar":"عدد الطلاب 9، لذا موضع الوسيط (9+1)/2=5.","En":"There are 9 pupils, so the median position is (9+1)/2=5."},{"Ar":"القيمة 1 في الموضعين 1 و2، والقيمة 3 في المواضع 3 إلى 6، والقيمة 5 في المواضع 7 إلى 9.","En":"Value 1 occupies positions 1 and 2, value 3 positions 3 through 6, and value 5 positions 7 through 9."},{"Ar":"الموضع الخامس يحمل القيمة 3.","En":"The fifth position contains value 3."}],"Substitution":{"Ar":"$k=5$","En":"$k=5$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"أقلام","En":"Pencils"},"Verification":{"Ar":"القائمة هي 1،1،3،3،3،3،5،5،5، وتوجد أربع قيم قبل الموضع الخامس وأربع بعده.","En":"The list is 1,1,3,3,3,3,5,5,5, with four entries before and four after position five."},"CommonError":{"Ar":"لا تخلط بين قيمة الوسيط وعدد مرات تكرارها.","En":"Do not confuse the median value with its frequency."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"القيمة 1 تشغل الموضعين الأول والثاني فقط.","En":"1 occupies only the first two positions."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"4 تكرار القيمة 3 وليس قيمة من البيانات.","En":"4 is the frequency of value 3, not an observed value."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"القيمة 5 تشغل المواضع السابع إلى التاسع، وليس الخامس.","En":"5 occupies positions seven to nine, not the fifth."},"Order":4}]}$mw$),
($mw$growth-v27-grade-6-mean-compare-two-equal-total-different-count-1$mw$,$mw$mean-compare-two-equal-total-different-count$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-6$mw$,6,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة المتوسطات عند تساوي المجموع","En":"Comparing means with equal totals"},"Question":{"Ar":"جمع فريق A مقدار 48 نقطة في 6 جولات، وجمع فريق B المقدار نفسه في 8 جولات. بكم يزيد متوسط نقاط A لكل جولة على متوسط نقاط B؟","En":"Team A scores 48 points in 6 rounds, and Team B scores the same total in 8 rounds. By how much does A's mean points per round exceed B's?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تساوي المجموعين لا يعني تساوي المتوسطين عندما يختلف عدد الجولات.","En":"Equal totals do not imply equal means when round counts differ."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 هو متوسط الفريق B، وليس الفرق.","En":"6 is Team B's mean, not the difference."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"8 هو متوسط الفريق A، وليس الفرق.","En":"8 is Team A's mean, not the difference."}}],"Hints":[{"Ar":"احسب متوسط كل فريق باستخدام عدد جولاته.","En":"Find each team's mean using its own round count."},{"Ar":"اطرح متوسط B من متوسط A.","En":"Subtract B's mean from A's mean."}],"Solution":{"Idea":{"Ar":"المتوسط الحسابي يساوي مجموع القيم على عددها الموجب؛ وعند تساوي المجموع يزداد المتوسط إذا قل العدد.","En":"Arithmetic mean is total divided by positive count; for equal positive totals, the smaller count has the greater mean."},"FormulaLatex":"\\Delta=\\frac{48}{6}-\\frac{48}{8}","Steps":[{"Ar":"متوسط A يساوي 48/6=8 نقاط للجولة.","En":"A's mean is 48/6=8 points per round."},{"Ar":"متوسط B يساوي 48/8=6 نقاط للجولة.","En":"B's mean is 48/8=6 points per round."},{"Ar":"الفرق يساوي 8−6=2.","En":"The difference is 8−6=2."}],"Substitution":{"Ar":"$8-6=2$","En":"$8-6=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"نقطة لكل جولة","En":"Points per round"},"Verification":{"Ar":"التحقق: 8×6=48 و6×8=48، فالمتوسطان يوافقان المجموعين وعددي الجولات.","En":"Check: 8×6=48 and 6×8=48, matching the totals and round counts."},"CommonError":{"Ar":"لا تستخدم مجموع النقاط وحده للمقارنة بين المتوسطات.","En":"Do not compare means using totals alone."}}}$mw$::jsonb,$mw$المتوسط الحسابي يساوي مجموع القيم على عددها الموجب؛ وعند تساوي المجموع يزداد المتوسط إذا قل العدد.

$\Delta=\frac{48}{6}-\frac{48}{8}$

1. متوسط A يساوي 48/6=8 نقاط للجولة.

2. متوسط B يساوي 48/8=6 نقاط للجولة.

3. الفرق يساوي 8−6=2.

$8-6=2$

$2$ نقطة لكل جولة

التحقق: 8×6=48 و6×8=48، فالمتوسطان يوافقان المجموعين وعددي الجولات.

لا تستخدم مجموع النقاط وحده للمقارنة بين المتوسطات.$mw$,$mw$Arithmetic mean is total divided by positive count; for equal positive totals, the smaller count has the greater mean.

$\Delta=\frac{48}{6}-\frac{48}{8}$

1. A's mean is 48/6=8 points per round.

2. B's mean is 48/8=6 points per round.

3. The difference is 8−6=2.

$8-6=2$

$2$ Points per round

Check: 8×6=48 and 6×8=48, matching the totals and round counts.

Do not compare means using totals alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب متوسط كل فريق باستخدام عدد جولاته.","En":"Find each team's mean using its own round count."},{"Ar":"اطرح متوسط B من متوسط A.","En":"Subtract B's mean from A's mean."}],"Solution":{"Idea":{"Ar":"المتوسط الحسابي يساوي مجموع القيم على عددها الموجب؛ وعند تساوي المجموع يزداد المتوسط إذا قل العدد.","En":"Arithmetic mean is total divided by positive count; for equal positive totals, the smaller count has the greater mean."},"FormulaLatex":"\\Delta=\\frac{48}{6}-\\frac{48}{8}","Steps":[{"Ar":"متوسط A يساوي 48/6=8 نقاط للجولة.","En":"A's mean is 48/6=8 points per round."},{"Ar":"متوسط B يساوي 48/8=6 نقاط للجولة.","En":"B's mean is 48/8=6 points per round."},{"Ar":"الفرق يساوي 8−6=2.","En":"The difference is 8−6=2."}],"Substitution":{"Ar":"$8-6=2$","En":"$8-6=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"نقطة لكل جولة","En":"Points per round"},"Verification":{"Ar":"التحقق: 8×6=48 و6×8=48، فالمتوسطان يوافقان المجموعين وعددي الجولات.","En":"Check: 8×6=48 and 6×8=48, matching the totals and round counts."},"CommonError":{"Ar":"لا تستخدم مجموع النقاط وحده للمقارنة بين المتوسطات.","En":"Do not compare means using totals alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تساوي المجموعين لا يعني تساوي المتوسطين عندما يختلف عدد الجولات.","En":"Equal totals do not imply equal means when round counts differ."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"6 هو متوسط الفريق B، وليس الفرق.","En":"6 is Team B's mean, not the difference."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"8 هو متوسط الفريق A، وليس الفرق.","En":"8 is Team A's mean, not the difference."},"Order":4}]}$mw$);

-- Existing category IDs only. No category/order/entitlement changes.
CREATE TEMP TABLE before_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE before_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $links$
BEGIN
 PERFORM 1 FROM "LearningTracks" WHERE "Id" IN (1,6) ORDER BY "Id" FOR UPDATE;
 IF NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=1 AND "StageId"=1 AND "Code"='grade-1' AND "IsPublished" AND "Revision"=27) OR NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=6 AND "StageId"=1 AND "Code"='grade-6' AND "IsPublished" AND "Revision"=29) THEN RAISE EXCEPTION 'Track revision changed'; END IF;
 IF (SELECT free_pair FROM before_track_free WHERE track=1) IS DISTINCT FROM ARRAY[1,81] OR (SELECT free_pair FROM before_track_free WHERE track=6) IS DISTINCT FROM ARRAY[2,3] THEN RAISE EXCEPTION 'Free pair changed'; END IF;
 IF EXISTS(SELECT 1 FROM "LearningTrackCategories" WHERE ("TrackId","CategoryId") IN ((1,82),(6,4))) OR EXISTS(SELECT 1 FROM "LearningTrackSkills" WHERE ("TrackId","SkillId") IN ((1,321),(1,324),(6,18),(6,19))) THEN RAISE EXCEPTION 'Links already present'; END IF;
 IF (SELECT count(*) FROM "Categories" WHERE "StageId"=1 AND "Id" IN(4,82))<>2 THEN RAISE EXCEPTION 'Category stage mismatch'; END IF;
 INSERT INTO "LearningTrackCategories"("TrackId","CategoryId") VALUES(1,82),(6,4);
 INSERT INTO "LearningTrackSkills"("TrackId","SkillId") VALUES(1,321),(1,324),(6,18),(6,19);
END $links$;
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v27 category-gap candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;

CREATE TEMP TABLE after_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE after_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $check$
BEGIN
 IF EXISTS((SELECT * FROM before_track_free EXCEPT SELECT * FROM after_track_free) UNION ALL (SELECT * FROM after_track_free EXCEPT SELECT * FROM before_track_free)) OR EXISTS((SELECT * FROM before_stage_free EXCEPT SELECT * FROM after_stage_free) UNION ALL (SELECT * FROM after_stage_free EXCEPT SELECT * FROM before_stage_free)) THEN RAISE EXCEPTION 'Free entitlement pair changed'; END IF;
 IF (SELECT count(*) FROM (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")) x WHERE track=1 AND cat=82)<>2 OR (SELECT count(*) FROM (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")) x WHERE track=6 AND cat=4)<>3 THEN RAISE EXCEPTION 'New categories not correctly populated'; END IF;
 IF (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=1)<>3 OR (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=6)<>4 THEN RAISE EXCEPTION 'Unexpected category count'; END IF;
END $check$;
COMMIT;
