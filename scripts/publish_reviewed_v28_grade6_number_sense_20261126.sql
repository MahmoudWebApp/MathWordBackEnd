-- One-time grade6 number sense expansion: CCSS 6.NS.C.5–7, existing category81, new stage-appropriate skill, no free pair changes.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v28-grade-6-signed-number-context-reference-1$mw$,$mw$signed-number-context-reference$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,0,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تفسير الإشارة بالنسبة إلى مستوى مرجعي","En":"Interpreting signs relative to a reference"},"Question":{"Ar":"اتُّخذ سطح البحر مستوى الصفر. توجد غواصة على عمق 18 متراً تحت سطح البحر، وطائر على ارتفاع 12 متراً فوقه. أي زوج مرتب يمثل موقع الغواصة ثم الطائر بالمتر؟","En":"Sea level is the zero reference. A submarine is 18 metres below sea level and a bird is 12 metres above it. Which ordered pair represents the submarine's position followed by the bird's position in metres?"},"Options":[{"LatexCode":"(18,12)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وضع الغواصة فوق سطح البحر رغم أنها تحته.","En":"Places the submarine above sea level although it is below."}},{"LatexCode":"(-18,12)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(18,-12)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس إشارتَي الموقعين.","En":"Reverses both position signs."}},{"LatexCode":"(-12,18)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بدّل المقدارين 18 و12.","En":"Swaps the magnitudes 18 and 12."}}],"Hints":[{"Ar":"تحت الصفر نستخدم إشارة سالبة.","En":"Below zero we use a negative sign."},{"Ar":"حافظ على ترتيب الغواصة ثم الطائر.","En":"Keep the order submarine, then bird."}],"Solution":{"Idea":{"Ar":"نستخدم الصفر مرجعاً؛ المواقع فوقه موجبة وتحته سالبة.","En":"Use zero as reference; positions above it are positive and below it negative."},"FormulaLatex":"(s,b)=(-18,12)","Steps":[{"Ar":"الغواصة تحت الصفر بـ18 متراً، فموقعها −18.","En":"The submarine is 18 metres below zero, so its position is −18."},{"Ar":"الطائر فوق الصفر بـ12 متراً، فموقعه +12.","En":"The bird is 12 metres above zero, so its position is +12."},{"Ar":"نكتب الموقعين بالترتيب المطلوب.","En":"Write the positions in the requested order."}],"Substitution":{"Ar":"$(-18,12)$","En":"$(-18,12)$"},"Result":{"Ar":"$(-18,12)$","En":"$(-18,12)$"},"Unit":{"Ar":"متر","En":"Metres"},"Verification":{"Ar":"القيمة الأولى سالبة والثانية موجبة، ومقداراهما 18 و12 بالترتيب.","En":"The first value is negative and the second positive, with magnitudes 18 and 12 respectively."},"CommonError":{"Ar":"لا تخلط بين مقدار المسافة وإشارة الموقع.","En":"Do not confuse distance magnitude with position sign."}}}$mw$::jsonb,$mw$نستخدم الصفر مرجعاً؛ المواقع فوقه موجبة وتحته سالبة.

$(s,b)=(-18,12)$

1. الغواصة تحت الصفر بـ18 متراً، فموقعها −18.

2. الطائر فوق الصفر بـ12 متراً، فموقعه +12.

3. نكتب الموقعين بالترتيب المطلوب.

$(-18,12)$

$(-18,12)$ متر

القيمة الأولى سالبة والثانية موجبة، ومقداراهما 18 و12 بالترتيب.

لا تخلط بين مقدار المسافة وإشارة الموقع.$mw$,$mw$Use zero as reference; positions above it are positive and below it negative.

$(s,b)=(-18,12)$

1. The submarine is 18 metres below zero, so its position is −18.

2. The bird is 12 metres above zero, so its position is +12.

3. Write the positions in the requested order.

$(-18,12)$

$(-18,12)$ Metres

The first value is negative and the second positive, with magnitudes 18 and 12 respectively.

Do not confuse distance magnitude with position sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"تحت الصفر نستخدم إشارة سالبة.","En":"Below zero we use a negative sign."},{"Ar":"حافظ على ترتيب الغواصة ثم الطائر.","En":"Keep the order submarine, then bird."}],"Solution":{"Idea":{"Ar":"نستخدم الصفر مرجعاً؛ المواقع فوقه موجبة وتحته سالبة.","En":"Use zero as reference; positions above it are positive and below it negative."},"FormulaLatex":"(s,b)=(-18,12)","Steps":[{"Ar":"الغواصة تحت الصفر بـ18 متراً، فموقعها −18.","En":"The submarine is 18 metres below zero, so its position is −18."},{"Ar":"الطائر فوق الصفر بـ12 متراً، فموقعه +12.","En":"The bird is 12 metres above zero, so its position is +12."},{"Ar":"نكتب الموقعين بالترتيب المطلوب.","En":"Write the positions in the requested order."}],"Substitution":{"Ar":"$(-18,12)$","En":"$(-18,12)$"},"Result":{"Ar":"$(-18,12)$","En":"$(-18,12)$"},"Unit":{"Ar":"متر","En":"Metres"},"Verification":{"Ar":"القيمة الأولى سالبة والثانية موجبة، ومقداراهما 18 و12 بالترتيب.","En":"The first value is negative and the second positive, with magnitudes 18 and 12 respectively."},"CommonError":{"Ar":"لا تخلط بين مقدار المسافة وإشارة الموقع.","En":"Do not confuse distance magnitude with position sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"وضع الغواصة فوق سطح البحر رغم أنها تحته.","En":"Places the submarine above sea level although it is below."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس إشارتَي الموقعين.","En":"Reverses both position signs."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"بدّل المقدارين 18 و12.","En":"Swaps the magnitudes 18 and 12."},"Order":4}]}$mw$),
($mw$growth-v28-grade-6-signed-fraction-between-negative-integers-1$mw$,$mw$signed-fraction-between-negative-integers$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,0,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد موضع كسر سالب","En":"Locating a negative fraction"},"Question":{"Ar":"على مستقيم أعداد يزداد من اليسار إلى اليمين، أي عدد يقع بين $-2$ و$-1$ دون الطرفين؟","En":"On a number line increasing from left to right, which number lies strictly between $-2$ and $-1$?"},"Options":[{"LatexCode":"-\\frac52","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2.5 أصغر من −2.","En":"−2.5 is less than −2."}},{"LatexCode":"-\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−0.5 أكبر من −1.","En":"−0.5 is greater than −1."}},{"LatexCode":"-\\frac32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1.5 موجب ويقع يمين الصفر.","En":"1.5 is positive and lies to the right of zero."}}],"Hints":[{"Ar":"حوّل الكسور إلى أنصاف واضحة على المستقيم.","En":"Think of the fractions as half-unit positions."},{"Ar":"ابحث عن عدد سالب أكبر من −2 وأصغر من −1.","En":"Seek a negative number greater than −2 and less than −1."}],"Solution":{"Idea":{"Ar":"الأعداد تزداد بالاتجاه نحو اليمين؛ يمكن مقارنة الكسور السالبة بتحويلها إلى قيم عشرية مكافئة.","En":"Numbers increase to the right; negative fractions can be compared using equivalent decimals."},"FormulaLatex":"-2<-\\frac32=-1.5<-1","Steps":[{"Ar":"−5/2 يساوي −2.5 ويقع قبل −2.","En":"−5/2 equals −2.5 and lies before −2."},{"Ar":"−1/2 يساوي −0.5 ويقع بعد −1.","En":"−1/2 equals −0.5 and lies after −1."},{"Ar":"−3/2 يساوي −1.5، وهو داخل الفترة المطلوبة.","En":"−3/2 equals −1.5, within the requested interval."}],"Substitution":{"Ar":"$-2<-1.5<-1$","En":"$-2<-1.5<-1$"},"Result":{"Ar":"$-\\frac32$","En":"$-\\frac32$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"$-1.5$ يقع في منتصف المسافة بين −2 و−1، ولا يساوي أي طرف.","En":"$-1.5$ lies midway between −2 and −1, equal to neither endpoint."},"CommonError":{"Ar":"لا ترتب الأعداد السالبة بحسب قيمها المطلقة وحدها.","En":"Do not order negative numbers by absolute magnitude alone."}}}$mw$::jsonb,$mw$الأعداد تزداد بالاتجاه نحو اليمين؛ يمكن مقارنة الكسور السالبة بتحويلها إلى قيم عشرية مكافئة.

$-2<-\frac32=-1.5<-1$

1. −5/2 يساوي −2.5 ويقع قبل −2.

2. −1/2 يساوي −0.5 ويقع بعد −1.

3. −3/2 يساوي −1.5، وهو داخل الفترة المطلوبة.

$-2<-1.5<-1$

$-\frac32$ بلا وحدة قياس

$-1.5$ يقع في منتصف المسافة بين −2 و−1، ولا يساوي أي طرف.

لا ترتب الأعداد السالبة بحسب قيمها المطلقة وحدها.$mw$,$mw$Numbers increase to the right; negative fractions can be compared using equivalent decimals.

$-2<-\frac32=-1.5<-1$

1. −5/2 equals −2.5 and lies before −2.

2. −1/2 equals −0.5 and lies after −1.

3. −3/2 equals −1.5, within the requested interval.

$-2<-1.5<-1$

$-\frac32$ Dimensionless

$-1.5$ lies midway between −2 and −1, equal to neither endpoint.

Do not order negative numbers by absolute magnitude alone.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل الكسور إلى أنصاف واضحة على المستقيم.","En":"Think of the fractions as half-unit positions."},{"Ar":"ابحث عن عدد سالب أكبر من −2 وأصغر من −1.","En":"Seek a negative number greater than −2 and less than −1."}],"Solution":{"Idea":{"Ar":"الأعداد تزداد بالاتجاه نحو اليمين؛ يمكن مقارنة الكسور السالبة بتحويلها إلى قيم عشرية مكافئة.","En":"Numbers increase to the right; negative fractions can be compared using equivalent decimals."},"FormulaLatex":"-2<-\\frac32=-1.5<-1","Steps":[{"Ar":"−5/2 يساوي −2.5 ويقع قبل −2.","En":"−5/2 equals −2.5 and lies before −2."},{"Ar":"−1/2 يساوي −0.5 ويقع بعد −1.","En":"−1/2 equals −0.5 and lies after −1."},{"Ar":"−3/2 يساوي −1.5، وهو داخل الفترة المطلوبة.","En":"−3/2 equals −1.5, within the requested interval."}],"Substitution":{"Ar":"$-2<-1.5<-1$","En":"$-2<-1.5<-1$"},"Result":{"Ar":"$-\\frac32$","En":"$-\\frac32$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"$-1.5$ يقع في منتصف المسافة بين −2 و−1، ولا يساوي أي طرف.","En":"$-1.5$ lies midway between −2 and −1, equal to neither endpoint."},"CommonError":{"Ar":"لا ترتب الأعداد السالبة بحسب قيمها المطلقة وحدها.","En":"Do not order negative numbers by absolute magnitude alone."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−2.5 أصغر من −2.","En":"−2.5 is less than −2."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"−0.5 أكبر من −1.","En":"−0.5 is greater than −1."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"1.5 موجب ويقع يمين الصفر.","En":"1.5 is positive and lies to the right of zero."},"Order":4}]}$mw$),
($mw$growth-v28-grade-6-absolute-value-versus-order-1$mw$,$mw$absolute-value-versus-order$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,0,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تمييز القيمة المطلقة عن ترتيب العدد","En":"Distinguishing absolute value from order"},"Question":{"Ar":"أي عبارة صحيحة عن العددين $a=-8$ و$b=-3$؟","En":"Which statement about $a=-8$ and $b=-3$ is true?"},"Options":[{"LatexCode":"a>b,\\ |a|>|b|","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−8 يقع يسار −3 فلا يكون أكبر منه.","En":"−8 lies to the left of −3, so it is not greater."}},{"LatexCode":"a<b,\\ |a|<|b|","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المسافة 8 عن الصفر أكبر من المسافة 3.","En":"Distance 8 from zero exceeds distance 3."}},{"LatexCode":"a>b,\\ |a|<|b|","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخطأ في ترتيب العددين وفي مقارنة المسافتين.","En":"Both the numerical order and distance comparison are wrong."}},{"LatexCode":"a<b,\\ |a|>|b|","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"رتّب العددين على مستقيم الأعداد أولاً.","En":"Order the numbers on a number line first."},{"Ar":"ثم قارن مسافة كل عدد عن الصفر، بغض النظر عن الإشارة.","En":"Then compare their distances from zero, ignoring signs."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة هي المسافة غير السالبة إلى الصفر؛ ترتيب العددين لا يلزم أن يطابق ترتيب المسافتين.","En":"Absolute value is nonnegative distance from zero; ordering numbers need not match ordering their distances."},"FormulaLatex":"-8<-3,\\quad |-8|=8>3=|-3|","Steps":[{"Ar":"على مستقيم الأعداد −8 قبل −3، إذن a أصغر من b.","En":"On the number line −8 precedes −3, so a is smaller than b."},{"Ar":"القيمة المطلقة لـ−8 هي 8 ولـ−3 هي 3.","En":"Absolute values of −8 and −3 are 8 and 3."},{"Ar":"بما أن 8 أكبر من 3، فإن القيمة المطلقة للأول أكبر.","En":"Since 8 exceeds 3, the first absolute value is larger."}],"Substitution":{"Ar":"$a<b,\\ |a|>|b|$","En":"$a<b,\\ |a|>|b|$"},"Result":{"Ar":"$a<b,\\ |a|>|b|$","En":"$a<b,\\ |a|>|b|$"},"Unit":{"Ar":"علاقة مقارنة","En":"Comparison statement"},"Verification":{"Ar":"العدد الأبعد عن الصفر في الجهة السالبة هو الأصغر عددياً رغم أن مسافته أكبر.","En":"On the negative side, the number farther from zero is numerically smaller despite its larger distance."},"CommonError":{"Ar":"لا تحذف الإشارة عند مقارنة الأعداد نفسها.","En":"Do not remove signs when comparing the numbers themselves."}}}$mw$::jsonb,$mw$القيمة المطلقة هي المسافة غير السالبة إلى الصفر؛ ترتيب العددين لا يلزم أن يطابق ترتيب المسافتين.

$-8<-3,\quad |-8|=8>3=|-3|$

1. على مستقيم الأعداد −8 قبل −3، إذن a أصغر من b.

2. القيمة المطلقة لـ−8 هي 8 ولـ−3 هي 3.

3. بما أن 8 أكبر من 3، فإن القيمة المطلقة للأول أكبر.

$a<b,\ |a|>|b|$

$a<b,\ |a|>|b|$ علاقة مقارنة

العدد الأبعد عن الصفر في الجهة السالبة هو الأصغر عددياً رغم أن مسافته أكبر.

لا تحذف الإشارة عند مقارنة الأعداد نفسها.$mw$,$mw$Absolute value is nonnegative distance from zero; ordering numbers need not match ordering their distances.

$-8<-3,\quad |-8|=8>3=|-3|$

1. On the number line −8 precedes −3, so a is smaller than b.

2. Absolute values of −8 and −3 are 8 and 3.

3. Since 8 exceeds 3, the first absolute value is larger.

$a<b,\ |a|>|b|$

$a<b,\ |a|>|b|$ Comparison statement

On the negative side, the number farther from zero is numerically smaller despite its larger distance.

Do not remove signs when comparing the numbers themselves.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"رتّب العددين على مستقيم الأعداد أولاً.","En":"Order the numbers on a number line first."},{"Ar":"ثم قارن مسافة كل عدد عن الصفر، بغض النظر عن الإشارة.","En":"Then compare their distances from zero, ignoring signs."}],"Solution":{"Idea":{"Ar":"القيمة المطلقة هي المسافة غير السالبة إلى الصفر؛ ترتيب العددين لا يلزم أن يطابق ترتيب المسافتين.","En":"Absolute value is nonnegative distance from zero; ordering numbers need not match ordering their distances."},"FormulaLatex":"-8<-3,\\quad |-8|=8>3=|-3|","Steps":[{"Ar":"على مستقيم الأعداد −8 قبل −3، إذن a أصغر من b.","En":"On the number line −8 precedes −3, so a is smaller than b."},{"Ar":"القيمة المطلقة لـ−8 هي 8 ولـ−3 هي 3.","En":"Absolute values of −8 and −3 are 8 and 3."},{"Ar":"بما أن 8 أكبر من 3، فإن القيمة المطلقة للأول أكبر.","En":"Since 8 exceeds 3, the first absolute value is larger."}],"Substitution":{"Ar":"$a<b,\\ |a|>|b|$","En":"$a<b,\\ |a|>|b|$"},"Result":{"Ar":"$a<b,\\ |a|>|b|$","En":"$a<b,\\ |a|>|b|$"},"Unit":{"Ar":"علاقة مقارنة","En":"Comparison statement"},"Verification":{"Ar":"العدد الأبعد عن الصفر في الجهة السالبة هو الأصغر عددياً رغم أن مسافته أكبر.","En":"On the negative side, the number farther from zero is numerically smaller despite its larger distance."},"CommonError":{"Ar":"لا تحذف الإشارة عند مقارنة الأعداد نفسها.","En":"Do not remove signs when comparing the numbers themselves."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−8 يقع يسار −3 فلا يكون أكبر منه.","En":"−8 lies to the left of −3, so it is not greater."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المسافة 8 عن الصفر أكبر من المسافة 3.","En":"Distance 8 from zero exceeds distance 3."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أخطأ في ترتيب العددين وفي مقارنة المسافتين.","En":"Both the numerical order and distance comparison are wrong."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v28-grade-6-opposite-of-opposite-reference-1$mw$,$mw$opposite-of-opposite-reference$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,0,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تحديد مقابل المقابل","En":"Finding the opposite of an opposite"},"Question":{"Ar":"إذا كان $x=-\\frac34$، فأي عدد يمثل مقابل مقابل $x$ على مستقيم الأعداد؟","En":"If $x=-\\frac34$, which number is the opposite of the opposite of $x$ on the number line?"},"Options":[{"LatexCode":"-\\frac34","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقابل x مرة واحدة فقط.","En":"This is the opposite of x only once."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الصفر ليس مقابل عدد غير صفري.","En":"Zero is not the opposite of a nonzero number."}},{"LatexCode":"-\\frac43","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قلب البسط والمقام ليس إيجاد المقابل.","En":"Swapping numerator and denominator does not find the opposite."}}],"Hints":[{"Ar":"المقابل يقع على الجانب الآخر من الصفر وعلى المسافة نفسها.","En":"The opposite is on the other side of zero at the same distance."},{"Ar":"طبّق تغيير الإشارة مرتين دون تغيير المقدار.","En":"Change the sign twice without changing magnitude."}],"Solution":{"Idea":{"Ar":"مقابل عدد حقيقي هو سالب ذلك العدد، ومقابل المقابل يعيد العدد الأصلي.","En":"The opposite of a real number is its negative; taking the opposite twice returns the original."},"FormulaLatex":"-(-x)=x","Steps":[{"Ar":"مقابل $-\\frac34$ هو $\\frac34$.","En":"The opposite of $-\\frac34$ is $\\frac34$."},{"Ar":"مقابل $\\frac34$ هو $-\\frac34$؛ عدنا إلى الموقع الأصلي.","En":"The opposite of $\\frac34$ is $-\\frac34$; we return to the original position."}],"Substitution":{"Ar":"$-(+\\frac34)=-\\frac34$","En":"$-(+\\frac34)=-\\frac34$"},"Result":{"Ar":"$-\\frac34$","En":"$-\\frac34$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"المواقع الثلاثة المتتابعة هي −0.75 ثم 0.75 ثم −0.75؛ المسافة عن الصفر ثابتة.","En":"The successive positions are −0.75, 0.75, −0.75; distance from zero is unchanged."},"CommonError":{"Ar":"المقابل الجمعي ليس المقلوب الضربي.","En":"The additive opposite is not the multiplicative reciprocal."}}}$mw$::jsonb,$mw$مقابل عدد حقيقي هو سالب ذلك العدد، ومقابل المقابل يعيد العدد الأصلي.

$-(-x)=x$

1. مقابل $-\frac34$ هو $\frac34$.

2. مقابل $\frac34$ هو $-\frac34$؛ عدنا إلى الموقع الأصلي.

$-(+\frac34)=-\frac34$

$-\frac34$ بلا وحدة قياس

المواقع الثلاثة المتتابعة هي −0.75 ثم 0.75 ثم −0.75؛ المسافة عن الصفر ثابتة.

المقابل الجمعي ليس المقلوب الضربي.$mw$,$mw$The opposite of a real number is its negative; taking the opposite twice returns the original.

$-(-x)=x$

1. The opposite of $-\frac34$ is $\frac34$.

2. The opposite of $\frac34$ is $-\frac34$; we return to the original position.

$-(+\frac34)=-\frac34$

$-\frac34$ Dimensionless

The successive positions are −0.75, 0.75, −0.75; distance from zero is unchanged.

The additive opposite is not the multiplicative reciprocal.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المقابل يقع على الجانب الآخر من الصفر وعلى المسافة نفسها.","En":"The opposite is on the other side of zero at the same distance."},{"Ar":"طبّق تغيير الإشارة مرتين دون تغيير المقدار.","En":"Change the sign twice without changing magnitude."}],"Solution":{"Idea":{"Ar":"مقابل عدد حقيقي هو سالب ذلك العدد، ومقابل المقابل يعيد العدد الأصلي.","En":"The opposite of a real number is its negative; taking the opposite twice returns the original."},"FormulaLatex":"-(-x)=x","Steps":[{"Ar":"مقابل $-\\frac34$ هو $\\frac34$.","En":"The opposite of $-\\frac34$ is $\\frac34$."},{"Ar":"مقابل $\\frac34$ هو $-\\frac34$؛ عدنا إلى الموقع الأصلي.","En":"The opposite of $\\frac34$ is $-\\frac34$; we return to the original position."}],"Substitution":{"Ar":"$-(+\\frac34)=-\\frac34$","En":"$-(+\\frac34)=-\\frac34$"},"Result":{"Ar":"$-\\frac34$","En":"$-\\frac34$"},"Unit":{"Ar":"بلا وحدة قياس","En":"Dimensionless"},"Verification":{"Ar":"المواقع الثلاثة المتتابعة هي −0.75 ثم 0.75 ثم −0.75؛ المسافة عن الصفر ثابتة.","En":"The successive positions are −0.75, 0.75, −0.75; distance from zero is unchanged."},"CommonError":{"Ar":"المقابل الجمعي ليس المقلوب الضربي.","En":"The additive opposite is not the multiplicative reciprocal."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقابل x مرة واحدة فقط.","En":"This is the opposite of x only once."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الصفر ليس مقابل عدد غير صفري.","En":"Zero is not the opposite of a nonzero number."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"قلب البسط والمقام ليس إيجاد المقابل.","En":"Swapping numerator and denominator does not find the opposite."},"Order":4}]}$mw$),
($mw$growth-v28-grade-6-signed-rational-comparison-temperature-1$mw$,$mw$signed-rational-comparison-temperature$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,0,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":0,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة درجات حرارة سالبة","En":"Comparing negative temperatures"},"Question":{"Ar":"سجلت محطات A وB وC وD درجات الحرارة −2.4 و−2.1 و−2.8 و−2.5 درجة مئوية بالترتيب. أي محطة كانت الأدفأ؟","En":"Stations A, B, C and D recorded temperatures −2.4, −2.1, −2.8 and −2.5 degrees Celsius respectively. Which station was warmest?"},"Options":[{"LatexCode":"A","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2.4 أقل من −2.1.","En":"−2.4 is less than −2.1."}},{"LatexCode":"B","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2.8 هو الأبرد لا الأدفأ.","En":"−2.8 is the coldest, not the warmest."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2.5 أقل من −2.1.","En":"−2.5 is less than −2.1."}}],"Hints":[{"Ar":"درجة الحرارة الأعلى تمثل الجو الأدفأ.","En":"The higher temperature represents warmer conditions."},{"Ar":"من بين الأعداد السالبة يكون الأقرب إلى الصفر أكبر.","En":"Among negative numbers, the one closest to zero is greatest."}],"Solution":{"Idea":{"Ar":"نقارن درجات الحرارة عددياً، لا بمقاديرها المطلقة؛ في الجهة السالبة تكون القيمة الأقرب للصفر أكبر.","En":"Compare temperatures numerically, not by absolute magnitude; on the negative side, the value closest to zero is greater."},"FormulaLatex":"-2.8<-2.5<-2.4<-2.1","Steps":[{"Ar":"نرتب القراءات من الأصغر إلى الأكبر: −2.8، −2.5، −2.4، −2.1.","En":"Order readings from least to greatest: −2.8, −2.5, −2.4, −2.1."},{"Ar":"أكبر قراءة هي −2.1، وتخص المحطة B.","En":"The greatest reading is −2.1, belonging to station B."}],"Substitution":{"Ar":"$-2.1>-2.4$","En":"$-2.1>-2.4$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"محطة","En":"Station"},"Verification":{"Ar":"جميع القراءات سالبة، و−2.1 أقربها إلى الصفر؛ فهي الأعلى.","En":"All readings are negative and −2.1 is closest to zero, so it is highest."},"CommonError":{"Ar":"لا تعتبر العدد ذا القيمة المطلقة الأكبر أدفأ عندما تكون القراءات سالبة.","En":"Do not treat the greatest absolute magnitude as warmest when readings are negative."}}}$mw$::jsonb,$mw$نقارن درجات الحرارة عددياً، لا بمقاديرها المطلقة؛ في الجهة السالبة تكون القيمة الأقرب للصفر أكبر.

$-2.8<-2.5<-2.4<-2.1$

1. نرتب القراءات من الأصغر إلى الأكبر: −2.8، −2.5، −2.4، −2.1.

2. أكبر قراءة هي −2.1، وتخص المحطة B.

$-2.1>-2.4$

$B$ محطة

جميع القراءات سالبة، و−2.1 أقربها إلى الصفر؛ فهي الأعلى.

لا تعتبر العدد ذا القيمة المطلقة الأكبر أدفأ عندما تكون القراءات سالبة.$mw$,$mw$Compare temperatures numerically, not by absolute magnitude; on the negative side, the value closest to zero is greater.

$-2.8<-2.5<-2.4<-2.1$

1. Order readings from least to greatest: −2.8, −2.5, −2.4, −2.1.

2. The greatest reading is −2.1, belonging to station B.

$-2.1>-2.4$

$B$ Station

All readings are negative and −2.1 is closest to zero, so it is highest.

Do not treat the greatest absolute magnitude as warmest when readings are negative.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"درجة الحرارة الأعلى تمثل الجو الأدفأ.","En":"The higher temperature represents warmer conditions."},{"Ar":"من بين الأعداد السالبة يكون الأقرب إلى الصفر أكبر.","En":"Among negative numbers, the one closest to zero is greatest."}],"Solution":{"Idea":{"Ar":"نقارن درجات الحرارة عددياً، لا بمقاديرها المطلقة؛ في الجهة السالبة تكون القيمة الأقرب للصفر أكبر.","En":"Compare temperatures numerically, not by absolute magnitude; on the negative side, the value closest to zero is greater."},"FormulaLatex":"-2.8<-2.5<-2.4<-2.1","Steps":[{"Ar":"نرتب القراءات من الأصغر إلى الأكبر: −2.8، −2.5، −2.4، −2.1.","En":"Order readings from least to greatest: −2.8, −2.5, −2.4, −2.1."},{"Ar":"أكبر قراءة هي −2.1، وتخص المحطة B.","En":"The greatest reading is −2.1, belonging to station B."}],"Substitution":{"Ar":"$-2.1>-2.4$","En":"$-2.1>-2.4$"},"Result":{"Ar":"$B$","En":"$B$"},"Unit":{"Ar":"محطة","En":"Station"},"Verification":{"Ar":"جميع القراءات سالبة، و−2.1 أقربها إلى الصفر؛ فهي الأعلى.","En":"All readings are negative and −2.1 is closest to zero, so it is highest."},"CommonError":{"Ar":"لا تعتبر العدد ذا القيمة المطلقة الأكبر أدفأ عندما تكون القراءات سالبة.","En":"Do not treat the greatest absolute magnitude as warmest when readings are negative."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"−2.4 أقل من −2.1.","En":"−2.4 is less than −2.1."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"−2.8 هو الأبرد لا الأدفأ.","En":"−2.8 is the coldest, not the warmest."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"−2.5 أقل من −2.1.","En":"−2.5 is less than −2.1."},"Order":4}]}$mw$);
CREATE TEMP TABLE before_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE before_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $links$
DECLARE sid int;
BEGIN
 PERFORM 1 FROM "LearningTracks" WHERE "Id"=6 FOR UPDATE;
 IF NOT EXISTS(SELECT 1 FROM "LearningTracks" WHERE "Id"=6 AND "StageId"=1 AND "Code"='grade-6' AND "IsPublished" AND "Revision"=32) THEN RAISE EXCEPTION 'Grade6 revision changed'; END IF;
 IF (SELECT free_pair FROM before_track_free WHERE track=6) IS DISTINCT FROM ARRAY[2,3] OR EXISTS(SELECT 1 FROM "LearningTrackCategories" WHERE "TrackId"=6 AND "CategoryId"=81) OR (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=6)<>4 THEN RAISE EXCEPTION 'Grade6 category scope changed'; END IF;
 IF NOT EXISTS(SELECT 1 FROM "Categories" WHERE "Id"=81 AND "StageId"=1 AND "Order"=7 AND "NameEn"='Number Sense & Place Value') OR NOT EXISTS(SELECT 1 FROM "CurriculumDomains" WHERE "Id"=1 AND "StableKey"='numbers-operations' AND "IsPublished") OR EXISTS(SELECT 1 FROM "CurriculumSkills" WHERE "StableKey"='primary-signed-rational-number-sense') THEN RAISE EXCEPTION 'Skill scope changed'; END IF;
 INSERT INTO "CurriculumSkills"("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished") VALUES('primary-signed-rational-number-sense',1,1,81,'الأعداد النسبية ذات الإشارة وترتيبها','Signed rational number sense','تفسير الإشارات بالنسبة إلى الصفر، وتحديد مواضع الأعداد النسبية ومقابلها وترتيبها وتمييز القيمة المطلقة عن الترتيب.','Interpret signs relative to zero, locate and order rational numbers and their opposites, and distinguish absolute value from numerical order.',6,true) RETURNING "Id" INTO sid;
 INSERT INTO "LearningTrackCategories"("TrackId","CategoryId") VALUES(6,81);
 INSERT INTO "LearningTrackSkills"("TrackId","SkillId") VALUES(6,sid);
 UPDATE growth_batch SET skill=sid,wizard=jsonb_set(wizard,'{PrimarySkillId}',to_jsonb(sid));
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v28 signed-number candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;

CREATE TEMP TABLE after_track_free ON COMMIT DROP AS with valid as (select distinct l."TrackId" track,c."Id" cat,c."Order" ord,p."Id" problem from "LearningTrackProblems" l join "LearningTracks" t on t."Id"=l."TrackId" join "Problems" p on p."Id"=l."ProblemId" join "Categories" c on c."Id"=p."CategoryId" join "CurriculumProblemSkills" ps on ps."ProblemId"=p."Id" and ps."IsPrimary" join "CurriculumSkills" s on s."Id"=ps."SkillId" join "CurriculumDomains" d on d."Id"=s."DomainId" where t."StageId"=p."StageId" and c."StageId"=t."StageId" and s."StageId"=t."StageId" and s."CategoryId"=c."Id" and s."IsPublished" and d."IsPublished" and exists(select 1 from "LearningTrackCategories" where "TrackId"=t."Id" and "CategoryId"=c."Id") and exists(select 1 from "LearningTrackSkills" where "TrackId"=t."Id" and "SkillId"=s."Id")), cats as(select distinct track,cat,ord from valid) select track,(array_agg(cat order by ord,cat))[1:2] free_pair from cats group by track;
CREATE TEMP TABLE after_stage_free ON COMMIT DROP AS select "StageId" stage,(array_agg("Id" order by "Order","Id"))[1:2] free_pair from "Categories" group by "StageId";
DO $check$
BEGIN
 IF EXISTS((SELECT * FROM before_track_free EXCEPT SELECT * FROM after_track_free) UNION ALL (SELECT * FROM after_track_free EXCEPT SELECT * FROM before_track_free)) OR EXISTS((SELECT * FROM before_stage_free EXCEPT SELECT * FROM after_stage_free) UNION ALL (SELECT * FROM after_stage_free EXCEPT SELECT * FROM before_stage_free)) THEN RAISE EXCEPTION 'Free entitlement pair changed'; END IF;
 IF (SELECT count(*) FROM "LearningTrackCategories" WHERE "TrackId"=6)<>5 OR (SELECT count(*) FROM "LearningTrackProblems" l JOIN "Problems" p ON p."Id"=l."ProblemId" JOIN "CurriculumProblemSkills" ps ON ps."ProblemId"=p."Id" AND ps."IsPrimary" JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId" JOIN "CurriculumDomains" d ON d."Id"=s."DomainId" WHERE l."TrackId"=6 AND p."StageId"=1 AND p."CategoryId"=81 AND s."StageId"=1 AND s."CategoryId"=81 AND s."StableKey"='primary-signed-rational-number-sense' AND s."IsPublished" AND d."IsPublished" AND EXISTS(SELECT 1 FROM "LearningTrackSkills" WHERE "TrackId"=6 AND "SkillId"=s."Id"))<>5 THEN RAISE EXCEPTION 'New category population invalid'; END IF;
END $check$;
COMMIT;
