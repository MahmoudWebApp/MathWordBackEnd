-- One-time owner-authorized v76 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v76-grade-1-read-bars-with-shifted-start-1$mw$,$mw$read-bars-with-shifted-start$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"صفا الملصقات","En":"Two sticker rows"},"Question":{"Ar":"وضعت ليلى ملصقاً لكل صوت. في صف التفاح أربعة ملصقات متلاصقة، وفي صف الموز ثلاثة متباعدة. يمتد صف الموز على الورقة مسافة أطول. أي فاكهة حصلت على أصوات أكثر؟ A التفاح، B الموز، C تعادلتا، D لم يصوّت أحد.","En":"Layla places one sticker per vote. The apple row has four stickers close together. The banana row has three spaced apart and stretches farther across the paper. Which fruit got more votes? A apples, B bananas, C they tied, D nobody voted."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المسافة بين الملصقات لا تضيف أصواتاً.","En":"Spaces between stickers add no votes."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يتطلب التعادل تساوي عدد الملصقات.","En":"A tie requires equal sticker counts."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"كل ملصق يدل على صوت مسجل.","En":"Each sticker represents a recorded vote."}}],"Hints":[{"Ar":"ما الذي يمثّل صوتاً واحداً؟","En":"What represents one vote?"},{"Ar":"تخيّل ترتيب الصفين بالمسافات نفسها.","En":"Imagine both rows spaced the same way."}],"Solution":{"Idea":{"Ar":"نقارن عدد الملصقات في الصفين.","En":"Compare how many stickers each row contains."},"FormulaLatex":"4>3","Steps":[{"Ar":"نعد أربعة أصوات للتفاح وثلاثة للموز.","En":"Count four apple votes and three banana votes."},{"Ar":"الأربعة أكبر من الثلاثة.","En":"Four is greater than three."}],"Substitution":{"Ar":"$4>3$","En":"$4>3$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا قربنا ملصقات الموز من بعضها فسيظل عددها ثلاثة.","En":"Moving the banana stickers closer together still leaves three."},"CommonError":{"Ar":"المسافة بين الملصقات لا تضيف أصواتاً.","En":"Spaces between stickers add no votes."}}}$mw$::jsonb,$mw$نقارن عدد الملصقات في الصفين.

$4>3$

1. نعد أربعة أصوات للتفاح وثلاثة للموز.

2. الأربعة أكبر من الثلاثة.

$A$

إذا قربنا ملصقات الموز من بعضها فسيظل عددها ثلاثة.

المسافة بين الملصقات لا تضيف أصواتاً.$mw$,$mw$Compare how many stickers each row contains.

$4>3$

1. Count four apple votes and three banana votes.

2. Four is greater than three.

$A$

Moving the banana stickers closer together still leaves three.

Spaces between stickers add no votes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما الذي يمثّل صوتاً واحداً؟","En":"What represents one vote?"},{"Ar":"تخيّل ترتيب الصفين بالمسافات نفسها.","En":"Imagine both rows spaced the same way."}],"Solution":{"Idea":{"Ar":"نقارن عدد الملصقات في الصفين.","En":"Compare how many stickers each row contains."},"FormulaLatex":"4>3","Steps":[{"Ar":"نعد أربعة أصوات للتفاح وثلاثة للموز.","En":"Count four apple votes and three banana votes."},{"Ar":"الأربعة أكبر من الثلاثة.","En":"Four is greater than three."}],"Substitution":{"Ar":"$4>3$","En":"$4>3$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"إذا قربنا ملصقات الموز من بعضها فسيظل عددها ثلاثة.","En":"Moving the banana stickers closer together still leaves three."},"CommonError":{"Ar":"المسافة بين الملصقات لا تضيف أصواتاً.","En":"Spaces between stickers add no votes."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المسافة بين الملصقات لا تضيف أصواتاً.","En":"Spaces between stickers add no votes."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يتطلب التعادل تساوي عدد الملصقات.","En":"A tie requires equal sticker counts."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"كل ملصق يدل على صوت مسجل.","En":"Each sticker represents a recorded vote."},"Order":4}]}$mw$),
($mw$growth-v76-grade-1-minimum-extra-votes-to-lead-1$mw$,$mw$minimum-extra-votes-to-lead$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"متى تتقدم السباحة؟","En":"When will swimming lead?"},"Question":{"Ar":"اختار 5 أطفال الجري واختار 3 السباحة. انضم أطفال جدد اختاروا السباحة فقط. ما أقل عدد منهم يجعل أصوات السباحة أكثر من أصوات الجري؟","En":"Five children chose running and three chose swimming. Some new children join and all choose swimming. What is the fewest new children needed for swimming to have more votes than running?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صوتان يحققان التعادل فقط.","En":"Two votes only make a tie."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة تكفي، لكن عدداً أصغر يكفي أيضاً.","En":"Five is enough, but fewer will also work."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صوت واحد يجعل العدد أربعة ويبقى أقل من خمسة.","En":"One vote gives four, still below five."}}],"Hints":[{"Ar":"هل يكفي أن يتساوى العددان؟","En":"Would equal counts be enough?"},{"Ar":"ابدأ بثلاثة وعدّ الأصوات الجديدة واحداً واحداً.","En":"Start at three and count the new votes one at a time."}],"Solution":{"Idea":{"Ar":"نصل أولاً إلى التعادل ثم نضيف صوتاً.","En":"First reach a tie, then add one vote."},"FormulaLatex":"3+3=6","Steps":[{"Ar":"تحتاج السباحة إلى صوتين لتصل إلى خمسة.","En":"Swimming needs two votes to reach five."},{"Ar":"الصوت التالي يجعلها تتقدم لأول مرة.","En":"The next vote puts it ahead for the first time."}],"Substitution":{"Ar":"$3+3=6$","En":"$3+3=6$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد صوتين يكون العددان متساويين؛ وبعد ثلاثة تصبح النتيجة ستة مقابل خمسة.","En":"Two votes give a tie. Three give swimming six votes to five."},"CommonError":{"Ar":"صوتان يحققان التعادل فقط.","En":"Two votes only make a tie."}}}$mw$::jsonb,$mw$نصل أولاً إلى التعادل ثم نضيف صوتاً.

$3+3=6$

1. تحتاج السباحة إلى صوتين لتصل إلى خمسة.

2. الصوت التالي يجعلها تتقدم لأول مرة.

$3$

بعد صوتين يكون العددان متساويين؛ وبعد ثلاثة تصبح النتيجة ستة مقابل خمسة.

صوتان يحققان التعادل فقط.$mw$,$mw$First reach a tie, then add one vote.

$3+3=6$

1. Swimming needs two votes to reach five.

2. The next vote puts it ahead for the first time.

$3$

Two votes give a tie. Three give swimming six votes to five.

Two votes only make a tie.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل يكفي أن يتساوى العددان؟","En":"Would equal counts be enough?"},{"Ar":"ابدأ بثلاثة وعدّ الأصوات الجديدة واحداً واحداً.","En":"Start at three and count the new votes one at a time."}],"Solution":{"Idea":{"Ar":"نصل أولاً إلى التعادل ثم نضيف صوتاً.","En":"First reach a tie, then add one vote."},"FormulaLatex":"3+3=6","Steps":[{"Ar":"تحتاج السباحة إلى صوتين لتصل إلى خمسة.","En":"Swimming needs two votes to reach five."},{"Ar":"الصوت التالي يجعلها تتقدم لأول مرة.","En":"The next vote puts it ahead for the first time."}],"Substitution":{"Ar":"$3+3=6$","En":"$3+3=6$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بعد صوتين يكون العددان متساويين؛ وبعد ثلاثة تصبح النتيجة ستة مقابل خمسة.","En":"Two votes give a tie. Three give swimming six votes to five."},"CommonError":{"Ar":"صوتان يحققان التعادل فقط.","En":"Two votes only make a tie."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"صوتان يحققان التعادل فقط.","En":"Two votes only make a tie."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"خمسة تكفي، لكن عدداً أصغر يكفي أيضاً.","En":"Five is enough, but fewer will also work."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"صوت واحد يجعل العدد أربعة ويبقى أقل من خمسة.","En":"One vote gives four, still below five."},"Order":4}]}$mw$),
($mw$growth-v76-grade-1-choose-record-partition-1$mw$,$mw$choose-record-partition$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"سجلّان للتصويت","En":"Two voting records"},"Question":{"Ar":"صوّت 6 أطفال مرة واحدة لكل منهم: للشتاء أو للصيف. أي زوج من العددين يمكن أن يُكتب في السجل؟ العدد الأول للشتاء والثاني للصيف.","En":"Six children each voted once for either winter or summer. Which pair of counts could appear in the record? The first number is for winter and the second for summer."},"Options":[{"LatexCode":"(2,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع خمسة، فينقص صوت.","En":"These counts total five, one vote short."}},{"LatexCode":"(4,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع سبعة، أي أكثر من عدد الأطفال.","En":"These counts total seven, more than the number of children."}},{"LatexCode":"(2,4)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(4,4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع ثمانية مع أن الأطفال ستة.","En":"These counts total eight although there are six children."}}],"Hints":[{"Ar":"كم صوتاً مع كل طفل؟","En":"How many votes does each child have?"},{"Ar":"اختبر كل زوج باستخدام ست بطاقات.","En":"Try each pair using six cards."}],"Solution":{"Idea":{"Ar":"مجموع أصوات الفئتين يساوي عدد المصوتين.","En":"The two category counts add up to the number of voters."},"FormulaLatex":"2+4=6","Steps":[{"Ar":"نجمع عددي كل خيار.","En":"Add the two counts in each choice."},{"Ar":"نختار الزوج الذي يحصي الأصوات الستة كلها.","En":"Choose the pair accounting for all six votes."}],"Substitution":{"Ar":"$2+4=6$","En":"$2+4=6$"},"Result":{"Ar":"$(2,4)$","En":"$(2,4)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يمكن تخصيص بطاقتين للشتاء وأربع للصيف باستعمال ست بطاقات بالضبط.","En":"Two winter cards and four summer cards use exactly six cards."},"CommonError":{"Ar":"المجموع خمسة، فينقص صوت.","En":"These counts total five, one vote short."}}}$mw$::jsonb,$mw$مجموع أصوات الفئتين يساوي عدد المصوتين.

$2+4=6$

1. نجمع عددي كل خيار.

2. نختار الزوج الذي يحصي الأصوات الستة كلها.

$(2,4)$

يمكن تخصيص بطاقتين للشتاء وأربع للصيف باستعمال ست بطاقات بالضبط.

المجموع خمسة، فينقص صوت.$mw$,$mw$The two category counts add up to the number of voters.

$2+4=6$

1. Add the two counts in each choice.

2. Choose the pair accounting for all six votes.

$(2,4)$

Two winter cards and four summer cards use exactly six cards.

These counts total five, one vote short.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم صوتاً مع كل طفل؟","En":"How many votes does each child have?"},{"Ar":"اختبر كل زوج باستخدام ست بطاقات.","En":"Try each pair using six cards."}],"Solution":{"Idea":{"Ar":"مجموع أصوات الفئتين يساوي عدد المصوتين.","En":"The two category counts add up to the number of voters."},"FormulaLatex":"2+4=6","Steps":[{"Ar":"نجمع عددي كل خيار.","En":"Add the two counts in each choice."},{"Ar":"نختار الزوج الذي يحصي الأصوات الستة كلها.","En":"Choose the pair accounting for all six votes."}],"Substitution":{"Ar":"$2+4=6$","En":"$2+4=6$"},"Result":{"Ar":"$(2,4)$","En":"$(2,4)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"يمكن تخصيص بطاقتين للشتاء وأربع للصيف باستعمال ست بطاقات بالضبط.","En":"Two winter cards and four summer cards use exactly six cards."},"CommonError":{"Ar":"المجموع خمسة، فينقص صوت.","En":"These counts total five, one vote short."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المجموع خمسة، فينقص صوت.","En":"These counts total five, one vote short."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المجموع سبعة، أي أكثر من عدد الأطفال.","En":"These counts total seven, more than the number of children."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"المجموع ثمانية مع أن الأطفال ستة.","En":"These counts total eight although there are six children."},"Order":4}]}$mw$),
($mw$growth-v76-grade-1-compare-survey-with-population-1$mw$,$mw$compare-survey-with-population$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"من شارك في التصويت؟","En":"Who took part in the vote?"},"Question":{"Ar":"في الصف 9 أطفال. عدّت المعلمة أصوات الأطفال الحاضرين فقط، وصوّت كل حاضر مرة واحدة. اختار 3 أطفال الرسم و4 الغناء، وهما الخياران الوحيدان. كم طفلاً من الصف غاب عن التصويت؟","En":"A class has 9 children. Only those present voted, and each voted once. Three chose drawing and four chose singing. These were the only choices. How many children in the class missed the vote?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد المشاركين.","En":"This counts the voters."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد من اختاروا الرسم.","En":"This counts children who chose drawing."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد من اختاروا الغناء.","En":"This counts children who chose singing."}}],"Hints":[{"Ar":"كيف تعرف عدد المشاركين من سجل الأصوات؟","En":"How can the vote record tell you how many took part?"},{"Ar":"طابق كل صوت مع طفل من الصف.","En":"Match each vote with one child in the class."}],"Solution":{"Idea":{"Ar":"نحصي المشاركين من الفئتين ثم نقارنهم بالصف كله.","En":"Count participants in both categories, then compare with the whole class."},"FormulaLatex":"9-(3+4)=2","Steps":[{"Ar":"شارك سبعة أطفال في التصويت.","En":"Seven children took part in the vote."},{"Ar":"من بين الأطفال التسعة لم يشارك طفلان.","En":"Two of the nine children did not take part."}],"Substitution":{"Ar":"$9-(3+4)=2$","En":"$9-(3+4)=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"سبعة مشاركين وطفلان غائبان يعطون العدد الكامل للصف.","En":"Seven participants and two absent children account for all nine."},"CommonError":{"Ar":"هذا عدد المشاركين.","En":"This counts the voters."}}}$mw$::jsonb,$mw$نحصي المشاركين من الفئتين ثم نقارنهم بالصف كله.

$9-(3+4)=2$

1. شارك سبعة أطفال في التصويت.

2. من بين الأطفال التسعة لم يشارك طفلان.

$2$

سبعة مشاركين وطفلان غائبان يعطون العدد الكامل للصف.

هذا عدد المشاركين.$mw$,$mw$Count participants in both categories, then compare with the whole class.

$9-(3+4)=2$

1. Seven children took part in the vote.

2. Two of the nine children did not take part.

$2$

Seven participants and two absent children account for all nine.

This counts the voters.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كيف تعرف عدد المشاركين من سجل الأصوات؟","En":"How can the vote record tell you how many took part?"},{"Ar":"طابق كل صوت مع طفل من الصف.","En":"Match each vote with one child in the class."}],"Solution":{"Idea":{"Ar":"نحصي المشاركين من الفئتين ثم نقارنهم بالصف كله.","En":"Count participants in both categories, then compare with the whole class."},"FormulaLatex":"9-(3+4)=2","Steps":[{"Ar":"شارك سبعة أطفال في التصويت.","En":"Seven children took part in the vote."},{"Ar":"من بين الأطفال التسعة لم يشارك طفلان.","En":"Two of the nine children did not take part."}],"Substitution":{"Ar":"$9-(3+4)=2$","En":"$9-(3+4)=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"سبعة مشاركين وطفلان غائبان يعطون العدد الكامل للصف.","En":"Seven participants and two absent children account for all nine."},"CommonError":{"Ar":"هذا عدد المشاركين.","En":"This counts the voters."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد المشاركين.","En":"This counts the voters."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد من اختاروا الرسم.","En":"This counts children who chose drawing."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد من اختاروا الغناء.","En":"This counts children who chose singing."},"Order":4}]}$mw$),
($mw$growth-v76-grade-1-fixed-categories-changing-order-1$mw$,$mw$fixed-categories-changing-order$mw$,$mw$primary-category-count-data$mw$,$mw$grade-1$mw$,1,1,97,356,$mw${"StageId":1,"CategoryId":97,"PrimarySkillId":356,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تغيير ترتيب السجل","En":"Reordering a record"},"Question":{"Ar":"سجلت هناء الحيوانات بهذا الترتيب: قطط 3، طيور 1، أسماك 2. ستعيد كتابة الأعداد بترتيب جديد: طيور، أسماك، قطط. ما الأعداد التي تكتبها بالترتيب الجديد؟","En":"Hana recorded cats 3, birds 1 and fish 2, in that order. She rewrites the counts in a new order: birds, fish, cats. Which numbers should she write in the new order?"},"Options":[{"LatexCode":"(3,1,2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا ترتيب السجل القديم.","En":"This preserves the old order."}},{"LatexCode":"(2,1,3)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس عددي الطيور والأسماك.","En":"This swaps the bird and fish counts."}},{"LatexCode":"(1,2,3)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(1,3,2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس عددي الأسماك والقطط.","En":"This swaps the fish and cat counts."}}],"Hints":[{"Ar":"ما اسم الفئة الأولى في الترتيب الجديد؟","En":"Which label comes first in the new order?"},{"Ar":"ابحث عن عدد كل حيوان في السجل الأول قبل الانتقال إلى التالي.","En":"Look up each animal in the first record before moving to the next."}],"Solution":{"Idea":{"Ar":"نتتبع اسم الحيوان مع عدده حتى لو تغير مكانه.","En":"Keep each animal label with its count when its position changes."},"FormulaLatex":"1+2+3=3+1+2","Steps":[{"Ar":"نبدأ بالطيور فنكتب واحداً، ثم بالأسماك فنكتب اثنين.","En":"Start with birds and write one, then write two for fish."},{"Ar":"نختم بالقطط فنكتب ثلاثة.","En":"Finish with cats and write three."}],"Substitution":{"Ar":"$1+2+3=3+1+2$","En":"$1+2+3=3+1+2$"},"Result":{"Ar":"$(1,2,3)$","En":"$(1,2,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالعودة إلى الأسماء نقرأ قطط 3 وطيور 1 وأسماك 2 كما في السجل الأول.","En":"Reading by label again gives cats 3, birds 1 and fish 2 as in the first record."},"CommonError":{"Ar":"هذا ترتيب السجل القديم.","En":"This preserves the old order."}}}$mw$::jsonb,$mw$نتتبع اسم الحيوان مع عدده حتى لو تغير مكانه.

$1+2+3=3+1+2$

1. نبدأ بالطيور فنكتب واحداً، ثم بالأسماك فنكتب اثنين.

2. نختم بالقطط فنكتب ثلاثة.

$(1,2,3)$

بالعودة إلى الأسماء نقرأ قطط 3 وطيور 1 وأسماك 2 كما في السجل الأول.

هذا ترتيب السجل القديم.$mw$,$mw$Keep each animal label with its count when its position changes.

$1+2+3=3+1+2$

1. Start with birds and write one, then write two for fish.

2. Finish with cats and write three.

$(1,2,3)$

Reading by label again gives cats 3, birds 1 and fish 2 as in the first record.

This preserves the old order.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما اسم الفئة الأولى في الترتيب الجديد؟","En":"Which label comes first in the new order?"},{"Ar":"ابحث عن عدد كل حيوان في السجل الأول قبل الانتقال إلى التالي.","En":"Look up each animal in the first record before moving to the next."}],"Solution":{"Idea":{"Ar":"نتتبع اسم الحيوان مع عدده حتى لو تغير مكانه.","En":"Keep each animal label with its count when its position changes."},"FormulaLatex":"1+2+3=3+1+2","Steps":[{"Ar":"نبدأ بالطيور فنكتب واحداً، ثم بالأسماك فنكتب اثنين.","En":"Start with birds and write one, then write two for fish."},{"Ar":"نختم بالقطط فنكتب ثلاثة.","En":"Finish with cats and write three."}],"Substitution":{"Ar":"$1+2+3=3+1+2$","En":"$1+2+3=3+1+2$"},"Result":{"Ar":"$(1,2,3)$","En":"$(1,2,3)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"بالعودة إلى الأسماء نقرأ قطط 3 وطيور 1 وأسماك 2 كما في السجل الأول.","En":"Reading by label again gives cats 3, birds 1 and fish 2 as in the first record."},"CommonError":{"Ar":"هذا ترتيب السجل القديم.","En":"This preserves the old order."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا ترتيب السجل القديم.","En":"This preserves the old order."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عكس عددي الطيور والأسماك.","En":"This swaps the bird and fish counts."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عكس عددي الأسماك والقطط.","En":"This swaps the fish and cat counts."},"Order":4}]}$mw$);
DO $$ BEGIN IF EXISTS (SELECT 1 FROM (SELECT track, category, count(*) n FROM growth_batch GROUP BY 1,2) b WHERE b.n+(SELECT count(*) FROM "LearningTrackProblems" tp JOIN "Problems" p ON p."Id"=tp."ProblemId" WHERE tp."TrackId"=b.track AND p."CategoryId"=b.category)>20) THEN RAISE EXCEPTION 'Target already filled'; END IF; END $$;
CREATE TEMP TABLE growth_seen ON COMMIT DROP AS SELECT upper(regexp_replace(btrim(ar),'[[:space:]]+',' ','g')) ar,upper(regexp_replace(btrim(en),'[[:space:]]+',' ','g')) en FROM (SELECT "QuestionTextAr" ar,"QuestionTextEn" en FROM public."Problems" UNION ALL SELECT "QuestionTextAr","QuestionTextEn" FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn' AND "WizardJson" IS NOT NULL UNION ALL SELECT "WizardJson"::jsonb#>>'{Question,Ar}',"WizardJson"::jsonb#>>'{Question,En}' FROM public."CurriculumDraftItems" WHERE "EditorialStatus"<>'Withdrawn') q;
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM growth_seen q WHERE q.ar=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR q.en=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO growth_seen VALUES (upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')),upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')));
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v76 targeted depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
