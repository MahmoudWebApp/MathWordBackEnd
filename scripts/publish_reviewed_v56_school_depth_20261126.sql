-- One-time owner-authorized v56 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v56-grade-8-pythagorean-converse-classify-right-triangle-1$mw$,$mw$pythagorean-converse-classify-right-triangle$mw$,$mw$middle-pythagorean-theorem$mw$,$mw$grade-8$mw$,8,2,34,37,$mw${"StageId":2,"CategoryId":34,"PrimarySkillId":37,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار مثلث قائم","En":"Testing a right triangle"},"Question":{"Ar":"أي مجموعة أطوال يمكن أن تكون أضلاع مثلث قائم؟","En":"Which set of lengths can form a right triangle?"},"Options":[{"LatexCode":"(7,24,25)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(6,8,11)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"36+64 لا يساوي 121.","En":"36+64 is not 121."}},{"LatexCode":"(5,5,7)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"25+25 لا يساوي 49.","En":"25+25 is not 49."}},{"LatexCode":"(4,6,8)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"16+36 لا يساوي 64.","En":"16+36 is not 64."}}],"Hints":[{"Ar":"ربع الضلعين الأقصر.","En":"Square the shorter sides."},{"Ar":"قارن مجموع المربعين بمربع الأطول.","En":"Compare the sum with the longest side squared."}],"Solution":{"Idea":{"Ar":"نختبر عكس نظرية فيثاغورس باستخدام أطول ضلع.","En":"Apply the converse of Pythagoras using the longest side."},"FormulaLatex":"a^2+b^2=c^2","Steps":[{"Ar":"$49+576=625$","En":"$49+576=625$"},{"Ar":"$25^2=625$","En":"$25^2=625$"}],"Substitution":{"Ar":"$7^2+24^2$","En":"$7^2+24^2$"},"Result":{"Ar":"$(7,24,25)$","En":"$(7,24,25)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+24>25$","En":"$7+24>25$"},"CommonError":{"Ar":"36+64 لا يساوي 121.","En":"36+64 is not 121."}}}$mw$::jsonb,$mw$نختبر عكس نظرية فيثاغورس باستخدام أطول ضلع.

$a^2+b^2=c^2$

1. $49+576=625$

2. $25^2=625$

$7^2+24^2$

$(7,24,25)$

$7+24>25$

36+64 لا يساوي 121.$mw$,$mw$Apply the converse of Pythagoras using the longest side.

$a^2+b^2=c^2$

1. $49+576=625$

2. $25^2=625$

$7^2+24^2$

$(7,24,25)$

$7+24>25$

36+64 is not 121.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ربع الضلعين الأقصر.","En":"Square the shorter sides."},{"Ar":"قارن مجموع المربعين بمربع الأطول.","En":"Compare the sum with the longest side squared."}],"Solution":{"Idea":{"Ar":"نختبر عكس نظرية فيثاغورس باستخدام أطول ضلع.","En":"Apply the converse of Pythagoras using the longest side."},"FormulaLatex":"a^2+b^2=c^2","Steps":[{"Ar":"$49+576=625$","En":"$49+576=625$"},{"Ar":"$25^2=625$","En":"$25^2=625$"}],"Substitution":{"Ar":"$7^2+24^2$","En":"$7^2+24^2$"},"Result":{"Ar":"$(7,24,25)$","En":"$(7,24,25)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7+24>25$","En":"$7+24>25$"},"CommonError":{"Ar":"36+64 لا يساوي 121.","En":"36+64 is not 121."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"36+64 لا يساوي 121.","En":"36+64 is not 121."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"25+25 لا يساوي 49.","En":"25+25 is not 49."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"16+36 لا يساوي 64.","En":"16+36 is not 64."},"Order":4}]}$mw$),
($mw$growth-v56-grade-11-log-domain-quadratic-argument-positive-1$mw$,$mw$log-domain-quadratic-argument-positive$mw$,$mw$logarithm-domain$mw$,$mw$grade-11$mw$,11,3,86,312,$mw${"StageId":3,"CategoryId":86,"PrimarySkillId":312,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مجال لوغاريتم حجة تربيعية","En":"Logarithm of a quadratic argument"},"Question":{"Ar":"ما مجال الدالة الحقيقية $f(x)=\\ln(9-x^2)$؟","En":"Find the real domain of $f(x)=\\ln(9-x^2)$."},"Options":[{"LatexCode":"-3\\le x\\le3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضم نقطتين تجعل الحجة صفراً.","En":"Includes two points making the argument zero."}},{"LatexCode":"x>3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يجعل الحجة سالبة.","En":"Makes the argument negative."}},{"LatexCode":"x<-3\\ \\text{or}\\ x>3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يختار خارج المجال المسموح.","En":"Selects the exterior of the allowed interval."}},{"LatexCode":"-3<x<3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اشترط أن تكون الحجة موجبة.","En":"Require a positive argument."},{"Ar":"حل متراجحة مربع العدد.","En":"Solve the squared inequality."}],"Solution":{"Idea":{"Ar":"حجة اللوغاريتم الحقيقي موجبة حصراً.","En":"A real logarithm requires a strictly positive argument."},"FormulaLatex":"9-x^2>0","Steps":[{"Ar":"$|x|<3$","En":"$|x|<3$"},{"Ar":"$-3<x<3$","En":"$-3<x<3$"}],"Substitution":{"Ar":"$x^2<9$","En":"$x^2<9$"},"Result":{"Ar":"$-3<x<3$","En":"$-3<x<3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند x=0 الحجة 9 موجبة، وعند الطرفين تساوي صفراً، وخارجهما تكون سالبة.","En":"At x=0 the argument is positive (9); at the endpoints it is zero, and outside it is negative."},"CommonError":{"Ar":"يضم نقطتين تجعل الحجة صفراً.","En":"Includes two points making the argument zero."}}}$mw$::jsonb,$mw$حجة اللوغاريتم الحقيقي موجبة حصراً.

$9-x^2>0$

1. $|x|<3$

2. $-3<x<3$

$x^2<9$

$-3<x<3$

عند x=0 الحجة 9 موجبة، وعند الطرفين تساوي صفراً، وخارجهما تكون سالبة.

يضم نقطتين تجعل الحجة صفراً.$mw$,$mw$A real logarithm requires a strictly positive argument.

$9-x^2>0$

1. $|x|<3$

2. $-3<x<3$

$x^2<9$

$-3<x<3$

At x=0 the argument is positive (9); at the endpoints it is zero, and outside it is negative.

Includes two points making the argument zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اشترط أن تكون الحجة موجبة.","En":"Require a positive argument."},{"Ar":"حل متراجحة مربع العدد.","En":"Solve the squared inequality."}],"Solution":{"Idea":{"Ar":"حجة اللوغاريتم الحقيقي موجبة حصراً.","En":"A real logarithm requires a strictly positive argument."},"FormulaLatex":"9-x^2>0","Steps":[{"Ar":"$|x|<3$","En":"$|x|<3$"},{"Ar":"$-3<x<3$","En":"$-3<x<3$"}],"Substitution":{"Ar":"$x^2<9$","En":"$x^2<9$"},"Result":{"Ar":"$-3<x<3$","En":"$-3<x<3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"عند x=0 الحجة 9 موجبة، وعند الطرفين تساوي صفراً، وخارجهما تكون سالبة.","En":"At x=0 the argument is positive (9); at the endpoints it is zero, and outside it is negative."},"CommonError":{"Ar":"يضم نقطتين تجعل الحجة صفراً.","En":"Includes two points making the argument zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يضم نقطتين تجعل الحجة صفراً.","En":"Includes two points making the argument zero."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يجعل الحجة سالبة.","En":"Makes the argument negative."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يختار خارج المجال المسموح.","En":"Selects the exterior of the allowed interval."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v56-grade-12-recurrence-backward-two-steps-1$mw$,$mw$recurrence-backward-two-steps$mw$,$mw$s-sequences-series-recurrence-relations$mw$,$mw$grade-12$mw$,12,3,23,102,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":102,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع حد سابق","En":"Recovering an earlier term"},"Question":{"Ar":"تتبع متتالية العلاقة $a_{n+1}=2a_n+3$. إذا كان $a_4=29$، فما $a_2$؟","En":"A sequence follows $a_{n+1}=2a_n+3$. If $a_4=29$, find $a_2$."},"Options":[{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يعكس العمليتين في الخطوة الثانية.","En":"Does not reverse both operations in the second step."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم الحد الثالث تقريباً على اثنين دون طرح 3.","En":"Approximately halves term three without subtracting three."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الحد الثالث.","En":"This is the third term."}}],"Hints":[{"Ar":"استخرج الحد الثالث أولاً.","En":"Recover term three first."},{"Ar":"كرر العملية لاسترجاع الحد الثاني.","En":"Repeat to recover term two."}],"Solution":{"Idea":{"Ar":"نعكس العلاقة بطرح ثلاثة ثم القسمة على اثنين.","En":"Reverse the recurrence by subtracting three then halving."},"FormulaLatex":"a_n=(a_{n+1}-3)/2","Steps":[{"Ar":"$a_3=13$","En":"$a_3=13$"},{"Ar":"$a_2=(13-3)/2=5$","En":"$a_2=(13-3)/2=5$"}],"Substitution":{"Ar":"$a_3=(29-3)/2$","En":"$a_3=(29-3)/2$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(2\\cdot5+3)+3=29$","En":"$2(2\\cdot5+3)+3=29$"},"CommonError":{"Ar":"هذا الحد الثالث.","En":"This is the third term."}}}$mw$::jsonb,$mw$نعكس العلاقة بطرح ثلاثة ثم القسمة على اثنين.

$a_n=(a_{n+1}-3)/2$

1. $a_3=13$

2. $a_2=(13-3)/2=5$

$a_3=(29-3)/2$

$5$

$2(2\cdot5+3)+3=29$

هذا الحد الثالث.$mw$,$mw$Reverse the recurrence by subtracting three then halving.

$a_n=(a_{n+1}-3)/2$

1. $a_3=13$

2. $a_2=(13-3)/2=5$

$a_3=(29-3)/2$

$5$

$2(2\cdot5+3)+3=29$

This is the third term.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استخرج الحد الثالث أولاً.","En":"Recover term three first."},{"Ar":"كرر العملية لاسترجاع الحد الثاني.","En":"Repeat to recover term two."}],"Solution":{"Idea":{"Ar":"نعكس العلاقة بطرح ثلاثة ثم القسمة على اثنين.","En":"Reverse the recurrence by subtracting three then halving."},"FormulaLatex":"a_n=(a_{n+1}-3)/2","Steps":[{"Ar":"$a_3=13$","En":"$a_3=13$"},{"Ar":"$a_2=(13-3)/2=5$","En":"$a_2=(13-3)/2=5$"}],"Substitution":{"Ar":"$a_3=(29-3)/2$","En":"$a_3=(29-3)/2$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(2\\cdot5+3)+3=29$","En":"$2(2\\cdot5+3)+3=29$"},"CommonError":{"Ar":"هذا الحد الثالث.","En":"This is the third term."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يعكس العمليتين في الخطوة الثانية.","En":"Does not reverse both operations in the second step."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم الحد الثالث تقريباً على اثنين دون طرح 3.","En":"Approximately halves term three without subtracting three."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا الحد الثالث.","En":"This is the third term."},"Order":4}]}$mw$),
($mw$growth-v56-grade-1-counting-position-swap-neighbour-1$mw$,$mw$counting-position-swap-neighbour$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تبديل مكانين","En":"Swapping positions"},"Question":{"Ar":"في صف من ستة أطفال، تقف نور في المكان الثاني وتبدل مكانها مع الطفل الرابع. ما ترتيبها الجديد من الأمام؟","En":"In a line of six children, Nour is second and swaps places with the fourth child. What is her new position from the front?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأطفال.","En":"The number of children."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مكانها القديم.","En":"Her old position."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا المكان بينهما.","En":"The position between them."}}],"Hints":[{"Ar":"حدد مكان الطفل الآخر.","En":"Identify the other child's place."},{"Ar":"التبديل لا يغير عدد الأطفال.","En":"Swapping does not change the count."}],"Solution":{"Idea":{"Ar":"تنتقل نور إلى المكان الذي كان يشغله الطفل الرابع.","En":"Nour moves to the fourth child's old position."},"FormulaLatex":"2\\longrightarrow4","Steps":[{"Ar":"$2+2=4$","En":"$2+2=4$"}],"Substitution":{"Ar":"$2+2$","En":"$2+2$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\le6$","En":"$4\\le6$"},"CommonError":{"Ar":"هذا مكانها القديم.","En":"Her old position."}}}$mw$::jsonb,$mw$تنتقل نور إلى المكان الذي كان يشغله الطفل الرابع.

$2\longrightarrow4$

1. $2+2=4$

$2+2$

$4$

$4\le6$

هذا مكانها القديم.$mw$,$mw$Nour moves to the fourth child's old position.

$2\longrightarrow4$

1. $2+2=4$

$2+2$

$4$

$4\le6$

Her old position.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"حدد مكان الطفل الآخر.","En":"Identify the other child's place."},{"Ar":"التبديل لا يغير عدد الأطفال.","En":"Swapping does not change the count."}],"Solution":{"Idea":{"Ar":"تنتقل نور إلى المكان الذي كان يشغله الطفل الرابع.","En":"Nour moves to the fourth child's old position."},"FormulaLatex":"2\\longrightarrow4","Steps":[{"Ar":"$2+2=4$","En":"$2+2=4$"}],"Substitution":{"Ar":"$2+2$","En":"$2+2$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\le6$","En":"$4\\le6$"},"CommonError":{"Ar":"هذا مكانها القديم.","En":"Her old position."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الأطفال.","En":"The number of children."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مكانها القديم.","En":"Her old position."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا المكان بينهما.","En":"The position between them."},"Order":4}]}$mw$),
($mw$growth-v56-grade-1-counting-identify-skipped-number-1$mw$,$mw$counting-identify-skipped-number$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عدد مفقود أثناء العد","En":"Skipped counting number"},"Question":{"Ar":"عد طفل هكذا: 11،12،13،15،16. أي عدد نسيه؟","En":"A child counts 11,12,13,15,16. Which number was skipped?"},"Options":[{"LatexCode":"14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ذُكر في العد.","En":"Was already counted."}},{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ذُكر في العد.","En":"Was already counted."}},{"LatexCode":"17","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يأتي بعد نهاية العد المعطاة.","En":"Comes after the given list."}}],"Hints":[{"Ar":"ما العدد التالي بعد 13؟","En":"What comes just after thirteen?"},{"Ar":"تحقق أنه يسبق 15.","En":"Check it comes before fifteen."}],"Solution":{"Idea":{"Ar":"في العد التصاعدي العادي نزيد واحداً كل مرة.","En":"In ordinary forward counting, add one each time."},"FormulaLatex":"13+1=14","Steps":[{"Ar":"$13+1=14$","En":"$13+1=14$"},{"Ar":"$14+1=15$","En":"$14+1=15$"}],"Substitution":{"Ar":"$13+1$","En":"$13+1$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15-14=1$","En":"$15-14=1$"},"CommonError":{"Ar":"ذُكر في العد.","En":"Was already counted."}}}$mw$::jsonb,$mw$في العد التصاعدي العادي نزيد واحداً كل مرة.

$13+1=14$

1. $13+1=14$

2. $14+1=15$

$13+1$

$14$

$15-14=1$

ذُكر في العد.$mw$,$mw$In ordinary forward counting, add one each time.

$13+1=14$

1. $13+1=14$

2. $14+1=15$

$13+1$

$14$

$15-14=1$

Was already counted.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"ما العدد التالي بعد 13؟","En":"What comes just after thirteen?"},{"Ar":"تحقق أنه يسبق 15.","En":"Check it comes before fifteen."}],"Solution":{"Idea":{"Ar":"في العد التصاعدي العادي نزيد واحداً كل مرة.","En":"In ordinary forward counting, add one each time."},"FormulaLatex":"13+1=14","Steps":[{"Ar":"$13+1=14$","En":"$13+1=14$"},{"Ar":"$14+1=15$","En":"$14+1=15$"}],"Substitution":{"Ar":"$13+1$","En":"$13+1$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$15-14=1$","En":"$15-14=1$"},"CommonError":{"Ar":"ذُكر في العد.","En":"Was already counted."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ذُكر في العد.","En":"Was already counted."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ذُكر في العد.","En":"Was already counted."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يأتي بعد نهاية العد المعطاة.","En":"Comes after the given list."},"Order":4}]}$mw$),
($mw$growth-v56-grade-5-probability-equally-likely-letters-multiplicity-1$mw$,$mw$probability-equally-likely-letters-multiplicity$mw$,$mw$primary-simple-probability$mw$,$mw$grade-5$mw$,5,1,4,17,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":17,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال حرف مكرر","En":"Probability of a repeated letter"},"Question":{"Ar":"توجد خمس بطاقات مكتوب عليها A،A،B،C،C. تُسحب بطاقة واحدة عشوائياً. ما احتمال ظهور الحرف B؟","En":"Five cards are labelled A,A,B,C,C. One card is drawn uniformly at random. What is the probability of B?"},"Options":[{"LatexCode":"\\frac25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال A أو C كل على حدة.","En":"This is the probability of either A or C individually."}},{"LatexCode":"\\frac45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال عدم ظهور B.","En":"This is the probability of not drawing B."}},{"LatexCode":"\\frac15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عد الحروف المختلفة لا البطاقات.","En":"Counts distinct labels rather than cards."}}],"Hints":[{"Ar":"كم بطاقة عليها B؟","En":"How many cards show B?"},{"Ar":"المجموع خمس بطاقات لا ثلاثة حروف.","En":"There are five cards, not three labels."}],"Solution":{"Idea":{"Ar":"نعد البطاقات التي تحمل B ونقسم على عدد البطاقات.","En":"Count cards labelled B and divide by total cards."},"FormulaLatex":"P(B)=n_B/n","Steps":[{"Ar":"$n_B=1$","En":"$n_B=1$"},{"Ar":"$n=5$","En":"$n=5$"},{"Ar":"$P(B)=1/5$","En":"$P(B)=1/5$"}],"Substitution":{"Ar":"$1/5$","En":"$1/5$"},"Result":{"Ar":"$\\frac15$","En":"$\\frac15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/5+4/5=1$","En":"$1/5+4/5=1$"},"CommonError":{"Ar":"عد الحروف المختلفة لا البطاقات.","En":"Counts distinct labels rather than cards."}}}$mw$::jsonb,$mw$نعد البطاقات التي تحمل B ونقسم على عدد البطاقات.

$P(B)=n_B/n$

1. $n_B=1$

2. $n=5$

3. $P(B)=1/5$

$1/5$

$\frac15$

$1/5+4/5=1$

عد الحروف المختلفة لا البطاقات.$mw$,$mw$Count cards labelled B and divide by total cards.

$P(B)=n_B/n$

1. $n_B=1$

2. $n=5$

3. $P(B)=1/5$

$1/5$

$\frac15$

$1/5+4/5=1$

Counts distinct labels rather than cards.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم بطاقة عليها B؟","En":"How many cards show B?"},{"Ar":"المجموع خمس بطاقات لا ثلاثة حروف.","En":"There are five cards, not three labels."}],"Solution":{"Idea":{"Ar":"نعد البطاقات التي تحمل B ونقسم على عدد البطاقات.","En":"Count cards labelled B and divide by total cards."},"FormulaLatex":"P(B)=n_B/n","Steps":[{"Ar":"$n_B=1$","En":"$n_B=1$"},{"Ar":"$n=5$","En":"$n=5$"},{"Ar":"$P(B)=1/5$","En":"$P(B)=1/5$"}],"Substitution":{"Ar":"$1/5$","En":"$1/5$"},"Result":{"Ar":"$\\frac15$","En":"$\\frac15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/5+4/5=1$","En":"$1/5+4/5=1$"},"CommonError":{"Ar":"عد الحروف المختلفة لا البطاقات.","En":"Counts distinct labels rather than cards."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال A أو C كل على حدة.","En":"This is the probability of either A or C individually."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا احتمال عدم ظهور B.","En":"This is the probability of not drawing B."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عد الحروف المختلفة لا البطاقات.","En":"Counts distinct labels rather than cards."},"Order":4}]}$mw$),
($mw$growth-v56-grade-5-mean-equalizing-by-transfer-two-values-1$mw$,$mw$mean-equalizing-by-transfer-two-values$mw$,$mw$primary-arithmetic-mean$mw$,$mw$grade-5$mw$,5,1,4,19,$mw${"StageId":1,"CategoryId":4,"PrimarySkillId":19,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المتوسط بتوزيع متساو","En":"Mean through equal sharing"},"Question":{"Ar":"مع طالب 14 بطاقة ومع طالب آخر 8 بطاقات. إذا أعاد الطالبان توزيع البطاقات بالتساوي، فكم بطاقة يحصل عليها كل واحد؟","En":"One pupil has fourteen cards and another has eight. If they redistribute the cards equally, how many does each receive?"},"Options":[{"LatexCode":"22","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المجموع قبل التوزيع.","En":"The total before sharing."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد البطاقات التي تنتقل من الأول إلى الثاني.","En":"The number transferred between pupils."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الفرق بين العددين.","En":"The difference of the counts."}}],"Hints":[{"Ar":"اجمع البطاقات أولاً.","En":"Combine the cards first."},{"Ar":"قسّمها بالتساوي على اثنين.","En":"Share equally between two."}],"Solution":{"Idea":{"Ar":"المتوسط هو العدد الذي يحصل عليه كل فرد عند توزيع المجموع بالتساوي.","En":"The mean is each person's share when the total is shared equally."},"FormulaLatex":"(14+8)/2","Steps":[{"Ar":"$14+8=22$","En":"$14+8=22$"},{"Ar":"$22/2=11$","En":"$22/2=11$"}],"Substitution":{"Ar":"$22/2$","En":"$22/2$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11+11=22$","En":"$11+11=22$"},"CommonError":{"Ar":"عدد البطاقات التي تنتقل من الأول إلى الثاني.","En":"The number transferred between pupils."}}}$mw$::jsonb,$mw$المتوسط هو العدد الذي يحصل عليه كل فرد عند توزيع المجموع بالتساوي.

$(14+8)/2$

1. $14+8=22$

2. $22/2=11$

$22/2$

$11$

$11+11=22$

عدد البطاقات التي تنتقل من الأول إلى الثاني.$mw$,$mw$The mean is each person's share when the total is shared equally.

$(14+8)/2$

1. $14+8=22$

2. $22/2=11$

$22/2$

$11$

$11+11=22$

The number transferred between pupils.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع البطاقات أولاً.","En":"Combine the cards first."},{"Ar":"قسّمها بالتساوي على اثنين.","En":"Share equally between two."}],"Solution":{"Idea":{"Ar":"المتوسط هو العدد الذي يحصل عليه كل فرد عند توزيع المجموع بالتساوي.","En":"The mean is each person's share when the total is shared equally."},"FormulaLatex":"(14+8)/2","Steps":[{"Ar":"$14+8=22$","En":"$14+8=22$"},{"Ar":"$22/2=11$","En":"$22/2=11$"}],"Substitution":{"Ar":"$22/2$","En":"$22/2$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$11+11=22$","En":"$11+11=22$"},"CommonError":{"Ar":"عدد البطاقات التي تنتقل من الأول إلى الثاني.","En":"The number transferred between pupils."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"المجموع قبل التوزيع.","En":"The total before sharing."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عدد البطاقات التي تنتقل من الأول إلى الثاني.","En":"The number transferred between pupils."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الفرق بين العددين.","En":"The difference of the counts."},"Order":4}]}$mw$),
($mw$growth-v56-grade-8-slope-zero-horizontal-from-table-1$mw$,$mw$slope-zero-horizontal-from-table$mw$,$mw$middle-slope$mw$,$mw$grade-8$mw$,8,2,6,29,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":29,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ميل خط أفقي","En":"Slope of a horizontal line"},"Question":{"Ar":"يمر مستقيم بالنقطتين (−2,4) و(5,4). ما ميله؟","En":"A line passes through (−2,4) and (5,4). Find its slope."},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"التغير الرأسي ليس مساوياً للأفقي.","En":"Rise is not equal to run."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا التغير الأفقي.","En":"This is the horizontal change."}},{"LatexCode":"\\frac47","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الإحداثي الرأسي بدلاً من تغيره.","En":"Uses the ordinate rather than its change."}},{"LatexCode":"0","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"هل تغيرت قيمة y؟","En":"Did the y-value change?"},{"Ar":"اقسم التغير الرأسي على 7.","En":"Divide the vertical change by seven."}],"Solution":{"Idea":{"Ar":"الميل يساوي التغير الرأسي على التغير الأفقي.","En":"Slope is rise divided by run."},"FormulaLatex":"m=(y_2-y_1)/(x_2-x_1)","Steps":[{"Ar":"$0/7=0$","En":"$0/7=0$"}],"Substitution":{"Ar":"$(4-4)/(5-(-2))$","En":"$(4-4)/(5-(-2))$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+0\\cdot7=4$","En":"$4+0\\cdot7=4$"},"CommonError":{"Ar":"التغير الرأسي ليس مساوياً للأفقي.","En":"Rise is not equal to run."}}}$mw$::jsonb,$mw$الميل يساوي التغير الرأسي على التغير الأفقي.

$m=(y_2-y_1)/(x_2-x_1)$

1. $0/7=0$

$(4-4)/(5-(-2))$

$0$

$4+0\cdot7=4$

التغير الرأسي ليس مساوياً للأفقي.$mw$,$mw$Slope is rise divided by run.

$m=(y_2-y_1)/(x_2-x_1)$

1. $0/7=0$

$(4-4)/(5-(-2))$

$0$

$4+0\cdot7=4$

Rise is not equal to run.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"هل تغيرت قيمة y؟","En":"Did the y-value change?"},{"Ar":"اقسم التغير الرأسي على 7.","En":"Divide the vertical change by seven."}],"Solution":{"Idea":{"Ar":"الميل يساوي التغير الرأسي على التغير الأفقي.","En":"Slope is rise divided by run."},"FormulaLatex":"m=(y_2-y_1)/(x_2-x_1)","Steps":[{"Ar":"$0/7=0$","En":"$0/7=0$"}],"Substitution":{"Ar":"$(4-4)/(5-(-2))$","En":"$(4-4)/(5-(-2))$"},"Result":{"Ar":"$0$","En":"$0$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+0\\cdot7=4$","En":"$4+0\\cdot7=4$"},"CommonError":{"Ar":"التغير الرأسي ليس مساوياً للأفقي.","En":"Rise is not equal to run."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"التغير الرأسي ليس مساوياً للأفقي.","En":"Rise is not equal to run."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا التغير الأفقي.","En":"This is the horizontal change."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الإحداثي الرأسي بدلاً من تغيره.","En":"Uses the ordinate rather than its change."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v56-grade-8-linear-function-difference-independent-start-1$mw$,$mw$linear-function-difference-independent-start$mw$,$mw$middle-linear-function-evaluation$mw$,$mw$grade-8$mw$,8,2,6,26,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":26,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق قيم دالة خطية","En":"Difference of linear function values"},"Question":{"Ar":"لدينا $f(x)=3x-7$. ما قيمة $f(12)-f(10)$؟","En":"Let $f(x)=3x-7$. Find $f(12)-f(10)$."},"Options":[{"LatexCode":"-1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الثابت رغم إلغائه في الفرق.","En":"Subtracts the constant despite cancellation."}},{"LatexCode":"29","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الدالة عند 12 فقط.","En":"The function value at twelve alone."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا فرق المدخلين فقط.","En":"The input difference only."}}],"Hints":[{"Ar":"احسب فرق المدخلين.","En":"Find the input difference."},{"Ar":"اضرب الفرق في 3.","En":"Multiply the difference by three."}],"Solution":{"Idea":{"Ar":"في فرق قيم دالة خطية يُلغى الحد الثابت.","En":"The constant cancels in the difference of linear function values."},"FormulaLatex":"f(b)-f(a)=3(b-a)","Steps":[{"Ar":"$3\\cdot2=6$","En":"$3\\cdot2=6$"}],"Substitution":{"Ar":"$3(12-10)$","En":"$3(12-10)$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(36-7)-(30-7)=6$","En":"$(36-7)-(30-7)=6$"},"CommonError":{"Ar":"هذا فرق المدخلين فقط.","En":"The input difference only."}}}$mw$::jsonb,$mw$في فرق قيم دالة خطية يُلغى الحد الثابت.

$f(b)-f(a)=3(b-a)$

1. $3\cdot2=6$

$3(12-10)$

$6$

$(36-7)-(30-7)=6$

هذا فرق المدخلين فقط.$mw$,$mw$The constant cancels in the difference of linear function values.

$f(b)-f(a)=3(b-a)$

1. $3\cdot2=6$

$3(12-10)$

$6$

$(36-7)-(30-7)=6$

The input difference only.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب فرق المدخلين.","En":"Find the input difference."},{"Ar":"اضرب الفرق في 3.","En":"Multiply the difference by three."}],"Solution":{"Idea":{"Ar":"في فرق قيم دالة خطية يُلغى الحد الثابت.","En":"The constant cancels in the difference of linear function values."},"FormulaLatex":"f(b)-f(a)=3(b-a)","Steps":[{"Ar":"$3\\cdot2=6$","En":"$3\\cdot2=6$"}],"Substitution":{"Ar":"$3(12-10)$","En":"$3(12-10)$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(36-7)-(30-7)=6$","En":"$(36-7)-(30-7)=6$"},"CommonError":{"Ar":"هذا فرق المدخلين فقط.","En":"The input difference only."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح الثابت رغم إلغائه في الفرق.","En":"Subtracts the constant despite cancellation."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة الدالة عند 12 فقط.","En":"The function value at twelve alone."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا فرق المدخلين فقط.","En":"The input difference only."},"Order":4}]}$mw$),
($mw$growth-v56-grade-8-linear-equation-identify-inconsistent-equation-1$mw$,$mw$linear-equation-identify-inconsistent-equation$mw$,$mw$middle-linear-equations$mw$,$mw$grade-8$mw$,8,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة بلا حل","En":"Equation with no solution"},"Question":{"Ar":"أي معادلة من الخيارات ليس لها أي حل حقيقي؟","En":"Which equation has no real solution?"},"Options":[{"LatexCode":"3x=0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حلها x=0.","En":"Its solution is x=0."}},{"LatexCode":"2(x+3)=2x+5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2x+6=10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حلها x=2.","En":"Its solution is x=2."}},{"LatexCode":"2(x+3)=2x+6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صحيحة لكل x.","En":"True for every x."}}],"Hints":[{"Ar":"وزع العامل خارج القوس.","En":"Distribute the factor."},{"Ar":"اطرح حدود x من الطرفين.","En":"Subtract the x terms on both sides."}],"Solution":{"Idea":{"Ar":"عند اختزال المتغير وبقاء مساواة خاطئة لا توجد حلول.","En":"If the variable cancels and a false equality remains, no solutions exist."},"FormulaLatex":"2x+6=2x+5","Steps":[{"Ar":"$6=5$","En":"$6=5$"},{"Ar":"$6\\ne5$","En":"$6\\ne5$"}],"Substitution":{"Ar":"$2x+6-2x=2x+5-2x$","En":"$2x+6-2x=2x+5-2x$"},"Result":{"Ar":"$2(x+3)=2x+5$","En":"$2(x+3)=2x+5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(x+3)-(2x+5)=1$","En":"$2(x+3)-(2x+5)=1$"},"CommonError":{"Ar":"حلها x=2.","En":"Its solution is x=2."}}}$mw$::jsonb,$mw$عند اختزال المتغير وبقاء مساواة خاطئة لا توجد حلول.

$2x+6=2x+5$

1. $6=5$

2. $6\ne5$

$2x+6-2x=2x+5-2x$

$2(x+3)=2x+5$

$2(x+3)-(2x+5)=1$

حلها x=2.$mw$,$mw$If the variable cancels and a false equality remains, no solutions exist.

$2x+6=2x+5$

1. $6=5$

2. $6\ne5$

$2x+6-2x=2x+5-2x$

$2(x+3)=2x+5$

$2(x+3)-(2x+5)=1$

Its solution is x=2.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"وزع العامل خارج القوس.","En":"Distribute the factor."},{"Ar":"اطرح حدود x من الطرفين.","En":"Subtract the x terms on both sides."}],"Solution":{"Idea":{"Ar":"عند اختزال المتغير وبقاء مساواة خاطئة لا توجد حلول.","En":"If the variable cancels and a false equality remains, no solutions exist."},"FormulaLatex":"2x+6=2x+5","Steps":[{"Ar":"$6=5$","En":"$6=5$"},{"Ar":"$6\\ne5$","En":"$6\\ne5$"}],"Substitution":{"Ar":"$2x+6-2x=2x+5-2x$","En":"$2x+6-2x=2x+5-2x$"},"Result":{"Ar":"$2(x+3)=2x+5$","En":"$2(x+3)=2x+5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(x+3)-(2x+5)=1$","En":"$2(x+3)-(2x+5)=1$"},"CommonError":{"Ar":"حلها x=2.","En":"Its solution is x=2."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حلها x=0.","En":"Its solution is x=0."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حلها x=2.","En":"Its solution is x=2."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"صحيحة لكل x.","En":"True for every x."},"Order":4}]}$mw$),
($mw$growth-v56-grade-7-triangle-angles-check-feasibility-from-two-1$mw$,$mw$triangle-angles-check-feasibility-from-two$mw$,$mw$middle-triangle-angles$mw$,$mw$grade-7$mw$,7,2,8,35,$mw${"StageId":2,"CategoryId":8,"PrimarySkillId":35,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إمكان تكوين مثلث من زاويتين","En":"Feasibility of two angles"},"Question":{"Ar":"أي زوج من قياسات زاويتين لا يمكن أن ينتمي إلى مثلث غير منعدم المساحة؟","En":"Which pair of angle measures cannot belong to a nondegenerate triangle?"},"Options":[{"LatexCode":"(95^\\circ,85^\\circ)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(20^\\circ,40^\\circ)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تبقى زاوية ثالثة مقدارها 120°.","En":"Leaves a third angle of 120°."}},{"LatexCode":"(90^\\circ,30^\\circ)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تبقى زاوية ثالثة مقدارها 60°.","En":"Leaves a third angle of 60°."}},{"LatexCode":"(100^\\circ,50^\\circ)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تبقى زاوية ثالثة مقدارها 30°.","En":"Leaves a third angle of 30°."}}],"Hints":[{"Ar":"اجمع كل زوج.","En":"Add each pair."},{"Ar":"يجب أن تبقى زاوية موجبة.","En":"A positive third angle must remain."}],"Solution":{"Idea":{"Ar":"مجموع زاويتين في مثلث يجب أن يكون أقل من 180° حتى تكون الثالثة موجبة.","En":"The sum of two angles must be below 180° so the third is positive."},"FormulaLatex":"C=180^\\circ-(A+B)","Steps":[{"Ar":"$95+85=180$","En":"$95+85=180$"},{"Ar":"$C=0^\\circ$","En":"$C=0^\\circ$"}],"Substitution":{"Ar":"$180-(95+85)$","En":"$180-(95+85)$"},"Result":{"Ar":"$(95^\\circ,85^\\circ)$","En":"$(95^\\circ,85^\\circ)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$95+85+0=180$","En":"$95+85+0=180$"},"CommonError":{"Ar":"تبقى زاوية ثالثة مقدارها 120°.","En":"Leaves a third angle of 120°."}}}$mw$::jsonb,$mw$مجموع زاويتين في مثلث يجب أن يكون أقل من 180° حتى تكون الثالثة موجبة.

$C=180^\circ-(A+B)$

1. $95+85=180$

2. $C=0^\circ$

$180-(95+85)$

$(95^\circ,85^\circ)$

$95+85+0=180$

تبقى زاوية ثالثة مقدارها 120°.$mw$,$mw$The sum of two angles must be below 180° so the third is positive.

$C=180^\circ-(A+B)$

1. $95+85=180$

2. $C=0^\circ$

$180-(95+85)$

$(95^\circ,85^\circ)$

$95+85+0=180$

Leaves a third angle of 120°.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع كل زوج.","En":"Add each pair."},{"Ar":"يجب أن تبقى زاوية موجبة.","En":"A positive third angle must remain."}],"Solution":{"Idea":{"Ar":"مجموع زاويتين في مثلث يجب أن يكون أقل من 180° حتى تكون الثالثة موجبة.","En":"The sum of two angles must be below 180° so the third is positive."},"FormulaLatex":"C=180^\\circ-(A+B)","Steps":[{"Ar":"$95+85=180$","En":"$95+85=180$"},{"Ar":"$C=0^\\circ$","En":"$C=0^\\circ$"}],"Substitution":{"Ar":"$180-(95+85)$","En":"$180-(95+85)$"},"Result":{"Ar":"$(95^\\circ,85^\\circ)$","En":"$(95^\\circ,85^\\circ)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$95+85+0=180$","En":"$95+85+0=180$"},"CommonError":{"Ar":"تبقى زاوية ثالثة مقدارها 120°.","En":"Leaves a third angle of 120°."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تبقى زاوية ثالثة مقدارها 120°.","En":"Leaves a third angle of 120°."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تبقى زاوية ثالثة مقدارها 60°.","En":"Leaves a third angle of 60°."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"تبقى زاوية ثالثة مقدارها 30°.","En":"Leaves a third angle of 30°."},"Order":4}]}$mw$),
($mw$growth-v56-grade-8-exponent-laws-power-of-product-infer-exponent-1$mw$,$mw$exponent-laws-power-of-product-infer-exponent$mw$,$mw$middle-exponent-laws$mw$,$mw$grade-8$mw$,8,2,5,21,$mw${"StageId":2,"CategoryId":5,"PrimarySkillId":21,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أس حاصل ضرب","En":"Power of a product"},"Question":{"Ar":"بسّط $\\frac{(3a^2)^3}{9a^4}$ حيث $a\\ne0$.","En":"Simplify $\\frac{(3a^2)^3}{9a^4}$ for $a\\ne0$."},"Options":[{"LatexCode":"3a^6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يطرح أس المقام.","En":"Does not subtract the denominator exponent."}},{"LatexCode":"a^2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل قسمة المعاملات 27 على 9.","En":"Loses the coefficient quotient 27/9."}},{"LatexCode":"3a^{10}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأسين بدلاً من طرحهما.","En":"Adds exponents rather than subtracting."}},{"LatexCode":"3a^2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"اضرب الأس الداخلي في الخارجي.","En":"Multiply inner and outer exponents."},{"Ar":"اقسم المعاملات واطرح الأسس.","En":"Divide coefficients and subtract exponents."}],"Solution":{"Idea":{"Ar":"نرفع كل عامل للقوة ثم نقسم المعاملات ونطرح الأسس.","En":"Raise each factor to the power, divide coefficients, and subtract exponents."},"FormulaLatex":"(3a^2)^3=27a^6","Steps":[{"Ar":"$27/9=3$","En":"$27/9=3$"},{"Ar":"$a^{6-4}=a^2$","En":"$a^{6-4}=a^2$"}],"Substitution":{"Ar":"$27a^6/(9a^4)$","En":"$27a^6/(9a^4)$"},"Result":{"Ar":"$3a^2$","En":"$3a^2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3a^2\\cdot9a^4=27a^6$","En":"$3a^2\\cdot9a^4=27a^6$"},"CommonError":{"Ar":"لم يطرح أس المقام.","En":"Does not subtract the denominator exponent."}}}$mw$::jsonb,$mw$نرفع كل عامل للقوة ثم نقسم المعاملات ونطرح الأسس.

$(3a^2)^3=27a^6$

1. $27/9=3$

2. $a^{6-4}=a^2$

$27a^6/(9a^4)$

$3a^2$

$3a^2\cdot9a^4=27a^6$

لم يطرح أس المقام.$mw$,$mw$Raise each factor to the power, divide coefficients, and subtract exponents.

$(3a^2)^3=27a^6$

1. $27/9=3$

2. $a^{6-4}=a^2$

$27a^6/(9a^4)$

$3a^2$

$3a^2\cdot9a^4=27a^6$

Does not subtract the denominator exponent.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اضرب الأس الداخلي في الخارجي.","En":"Multiply inner and outer exponents."},{"Ar":"اقسم المعاملات واطرح الأسس.","En":"Divide coefficients and subtract exponents."}],"Solution":{"Idea":{"Ar":"نرفع كل عامل للقوة ثم نقسم المعاملات ونطرح الأسس.","En":"Raise each factor to the power, divide coefficients, and subtract exponents."},"FormulaLatex":"(3a^2)^3=27a^6","Steps":[{"Ar":"$27/9=3$","En":"$27/9=3$"},{"Ar":"$a^{6-4}=a^2$","En":"$a^{6-4}=a^2$"}],"Substitution":{"Ar":"$27a^6/(9a^4)$","En":"$27a^6/(9a^4)$"},"Result":{"Ar":"$3a^2$","En":"$3a^2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3a^2\\cdot9a^4=27a^6$","En":"$3a^2\\cdot9a^4=27a^6$"},"CommonError":{"Ar":"لم يطرح أس المقام.","En":"Does not subtract the denominator exponent."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لم يطرح أس المقام.","En":"Does not subtract the denominator exponent."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أهمل قسمة المعاملات 27 على 9.","En":"Loses the coefficient quotient 27/9."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع الأسين بدلاً من طرحهما.","En":"Adds exponents rather than subtracting."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v56-grade-11-derivative-polynomial-recover-coefficient-from-slope-1$mw$,$mw$derivative-polynomial-recover-coefficient-from-slope$mw$,$mw$secondary-polynomial-derivatives$mw$,$mw$grade-11$mw$,11,3,11,49,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":49,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معامل من ميل معلوم","En":"Coefficient from a given slope"},"Question":{"Ar":"إذا كان $f(x)=ax^3+2x$ وميل مماسه عند x=2 يساوي 26، فما a؟","En":"If $f(x)=ax^3+2x$ has tangent slope 26 at x=2, find a."},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي ميلاً 74.","En":"Gives slope 74."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا معامل a في المعادلة بعد التعويض.","En":"This is the coefficient of a after substitution."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي ميلاً 38.","En":"Gives slope 38."}}],"Hints":[{"Ar":"ميل المماس هو قيمة المشتقة.","En":"Tangent slope is the derivative value."},{"Ar":"عوّض x=2 ثم حل في a.","En":"Substitute x=2 and solve for a."}],"Solution":{"Idea":{"Ar":"نشتق الدالة ثم نعوض قيمة x في المشتقة.","En":"Differentiate and substitute x into the derivative."},"FormulaLatex":"f'(x)=3ax^2+2","Steps":[{"Ar":"$12a+2=26$","En":"$12a+2=26$"},{"Ar":"$12a=24$","En":"$12a=24$"},{"Ar":"$a=2$","En":"$a=2$"}],"Substitution":{"Ar":"$3a(2)^2+2=26$","En":"$3a(2)^2+2=26$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot2\\cdot4+2=26$","En":"$3\\cdot2\\cdot4+2=26$"},"CommonError":{"Ar":"يعطي ميلاً 38.","En":"Gives slope 38."}}}$mw$::jsonb,$mw$نشتق الدالة ثم نعوض قيمة x في المشتقة.

$f'(x)=3ax^2+2$

1. $12a+2=26$

2. $12a=24$

3. $a=2$

$3a(2)^2+2=26$

$2$

$3\cdot2\cdot4+2=26$

يعطي ميلاً 38.$mw$,$mw$Differentiate and substitute x into the derivative.

$f'(x)=3ax^2+2$

1. $12a+2=26$

2. $12a=24$

3. $a=2$

$3a(2)^2+2=26$

$2$

$3\cdot2\cdot4+2=26$

Gives slope 38.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ميل المماس هو قيمة المشتقة.","En":"Tangent slope is the derivative value."},{"Ar":"عوّض x=2 ثم حل في a.","En":"Substitute x=2 and solve for a."}],"Solution":{"Idea":{"Ar":"نشتق الدالة ثم نعوض قيمة x في المشتقة.","En":"Differentiate and substitute x into the derivative."},"FormulaLatex":"f'(x)=3ax^2+2","Steps":[{"Ar":"$12a+2=26$","En":"$12a+2=26$"},{"Ar":"$12a=24$","En":"$12a=24$"},{"Ar":"$a=2$","En":"$a=2$"}],"Substitution":{"Ar":"$3a(2)^2+2=26$","En":"$3a(2)^2+2=26$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3\\cdot2\\cdot4+2=26$","En":"$3\\cdot2\\cdot4+2=26$"},"CommonError":{"Ar":"يعطي ميلاً 38.","En":"Gives slope 38."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعطي ميلاً 74.","En":"Gives slope 74."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا معامل a في المعادلة بعد التعويض.","En":"This is the coefficient of a after substitution."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعطي ميلاً 38.","En":"Gives slope 38."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v56 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
