-- One-time owner-authorized v54 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v54-grade-1-shape-triangle-sticks-two-independent-1$mw$,$mw$shape-triangle-sticks-two-independent$mw$,$mw$primary-shape-attributes-composition$mw$,$mw$grade-1$mw$,1,1,96,354,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":354,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عيدان لشكلين منفصلين","En":"Sticks for separate shapes"},"Question":{"Ar":"نريد تكوين مثلثين مغلقين منفصلين، باستعمال عود واحد لكل ضلع. لدينا 5 عيدان. كم عوداً إضافياً نحتاج؟","En":"We want to make two separate closed triangles using one stick for each side. We have five sticks. How many extra sticks are needed?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي سبعة عيدان.","En":"Would give seven sticks."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي ثمانية عيدان.","En":"Would give eight sticks."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا العدد الكلي المطلوب.","En":"This is the total needed."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"عد أضلاع مثلث واحد.","En":"Count one triangle's sides."},{"Ar":"اجمع أضلاع المثلثين واطرح الموجود.","En":"Add both side counts and subtract available sticks."}],"Solution":{"Idea":{"Ar":"لكل مثلث ثلاثة أضلاع، ولا يشترك المثلثان في ضلع.","En":"Each triangle has three sides and they share no side."},"FormulaLatex":"3+3-5","Steps":[{"Ar":"$3+3=6$","En":"$3+3=6$"},{"Ar":"$6-5=1$","En":"$6-5=1$"}],"Substitution":{"Ar":"$6-5$","En":"$6-5$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+1=6$","En":"$5+1=6$"},"CommonError":{"Ar":"يعطي سبعة عيدان.","En":"Would give seven sticks."}}}$mw$::jsonb,$mw$لكل مثلث ثلاثة أضلاع، ولا يشترك المثلثان في ضلع.

$3+3-5$

1. $3+3=6$

2. $6-5=1$

$6-5$

$1$

$5+1=6$

يعطي سبعة عيدان.$mw$,$mw$Each triangle has three sides and they share no side.

$3+3-5$

1. $3+3=6$

2. $6-5=1$

$6-5$

$1$

$5+1=6$

Would give seven sticks.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد أضلاع مثلث واحد.","En":"Count one triangle's sides."},{"Ar":"اجمع أضلاع المثلثين واطرح الموجود.","En":"Add both side counts and subtract available sticks."}],"Solution":{"Idea":{"Ar":"لكل مثلث ثلاثة أضلاع، ولا يشترك المثلثان في ضلع.","En":"Each triangle has three sides and they share no side."},"FormulaLatex":"3+3-5","Steps":[{"Ar":"$3+3=6$","En":"$3+3=6$"},{"Ar":"$6-5=1$","En":"$6-5=1$"}],"Substitution":{"Ar":"$6-5$","En":"$6-5$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5+1=6$","En":"$5+1=6$"},"CommonError":{"Ar":"يعطي سبعة عيدان.","En":"Would give seven sticks."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعطي سبعة عيدان.","En":"Would give seven sticks."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعطي ثمانية عيدان.","En":"Would give eight sticks."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا العدد الكلي المطلوب.","En":"This is the total needed."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v54-grade-2-counting-pattern-change-direction-endpoint-1$mw$,$mw$counting-pattern-change-direction-endpoint$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عد بتغيير الاتجاه","En":"Counting with a change of direction"},"Question":{"Ar":"بدأ عداد عند 30، ثم زاد 10 في كل خطوة لثلاث خطوات، وبعدها نقص 5 في كل خطوة لخطوتين. ما العدد النهائي؟","En":"A counter starts at 30, increases by ten for three steps, then decreases by five for two steps. What is the final number?"},"Options":[{"LatexCode":"55","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"نقص مرة واحدة فقط.","En":"Decreases only once."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف قبل النقص.","En":"Stops before decreasing."}},{"LatexCode":"50","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 20 بدلاً من 10.","En":"Subtracts twenty instead of ten."}}],"Hints":[{"Ar":"عد ثلاث عشرات للأمام.","En":"Count forward three tens."},{"Ar":"عد خمس وحدات للخلف مرتين.","En":"Count back five twice."}],"Solution":{"Idea":{"Ar":"نتابع العد أولاً للأمام ثم للخلف.","En":"Follow the forward count and then the backward count."},"FormulaLatex":"30+3\\cdot10-2\\cdot5","Steps":[{"Ar":"$30+10+10+10=60$","En":"$30+10+10+10=60$"},{"Ar":"$60-5-5=50$","En":"$60-5-5=50$"}],"Substitution":{"Ar":"$30+30-10$","En":"$30+30-10$"},"Result":{"Ar":"$50$","En":"$50$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50+10=60$","En":"$50+10=60$"},"CommonError":{"Ar":"طرح 20 بدلاً من 10.","En":"Subtracts twenty instead of ten."}}}$mw$::jsonb,$mw$نتابع العد أولاً للأمام ثم للخلف.

$30+3\cdot10-2\cdot5$

1. $30+10+10+10=60$

2. $60-5-5=50$

$30+30-10$

$50$

$50+10=60$

طرح 20 بدلاً من 10.$mw$,$mw$Follow the forward count and then the backward count.

$30+3\cdot10-2\cdot5$

1. $30+10+10+10=60$

2. $60-5-5=50$

$30+30-10$

$50$

$50+10=60$

Subtracts twenty instead of ten.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد ثلاث عشرات للأمام.","En":"Count forward three tens."},{"Ar":"عد خمس وحدات للخلف مرتين.","En":"Count back five twice."}],"Solution":{"Idea":{"Ar":"نتابع العد أولاً للأمام ثم للخلف.","En":"Follow the forward count and then the backward count."},"FormulaLatex":"30+3\\cdot10-2\\cdot5","Steps":[{"Ar":"$30+10+10+10=60$","En":"$30+10+10+10=60$"},{"Ar":"$60-5-5=50$","En":"$60-5-5=50$"}],"Substitution":{"Ar":"$30+30-10$","En":"$30+30-10$"},"Result":{"Ar":"$50$","En":"$50$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50+10=60$","En":"$50+10=60$"},"CommonError":{"Ar":"طرح 20 بدلاً من 10.","En":"Subtracts twenty instead of ten."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"نقص مرة واحدة فقط.","En":"Decreases only once."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"توقف قبل النقص.","En":"Stops before decreasing."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح 20 بدلاً من 10.","En":"Subtracts twenty instead of ten."},"Order":4}]}$mw$),
($mw$growth-v54-grade-3-fraction-model-equal-parts-pair-recombine-1$mw$,$mw$fraction-model-equal-parts-pair-recombine$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"إعادة تجميع أجزاء متساوية","En":"Regrouping equal parts"},"Question":{"Ar":"شريط مقسم إلى 12 جزءاً متساوياً. جُمعت كل ثلاثة أجزاء متجاورة في مجموعة واحدة. ما الكسر الذي تمثله مجموعة واحدة من الشريط كله؟","En":"A strip is divided into twelve equal parts. Every three adjacent parts are grouped together. What fraction of the whole strip is one group?"},"Options":[{"LatexCode":"\\frac14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac1{12}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمثل جزءاً صغيراً واحداً.","En":"Represents one small part."}},{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمثل أربع قطع صغيرة لا ثلاثاً.","En":"Represents four small parts, not three."}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمثل ثلاث مجموعات كاملة.","En":"Represents three full groups."}}],"Hints":[{"Ar":"كم مجموعة من ثلاثة في 12؟","En":"How many groups of three fit in twelve?"},{"Ar":"مجموعة واحدة من أربع مجموعات متساوية.","En":"One of four equal groups."}],"Solution":{"Idea":{"Ar":"نحسب عدد المجموعات المتساوية في الوحدة.","En":"Find how many equal groups make the whole."},"FormulaLatex":"12/3=4","Steps":[{"Ar":"$12/3=4$","En":"$12/3=4$"},{"Ar":"$3/12=1/4$","En":"$3/12=1/4$"}],"Substitution":{"Ar":"$3/12$","En":"$3/12$"},"Result":{"Ar":"$\\frac14$","En":"$\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot(1/4)=1$","En":"$4\\cdot(1/4)=1$"},"CommonError":{"Ar":"يمثل جزءاً صغيراً واحداً.","En":"Represents one small part."}}}$mw$::jsonb,$mw$نحسب عدد المجموعات المتساوية في الوحدة.

$12/3=4$

1. $12/3=4$

2. $3/12=1/4$

$3/12$

$\frac14$

$4\cdot(1/4)=1$

يمثل جزءاً صغيراً واحداً.$mw$,$mw$Find how many equal groups make the whole.

$12/3=4$

1. $12/3=4$

2. $3/12=1/4$

$3/12$

$\frac14$

$4\cdot(1/4)=1$

Represents one small part.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كم مجموعة من ثلاثة في 12؟","En":"How many groups of three fit in twelve?"},{"Ar":"مجموعة واحدة من أربع مجموعات متساوية.","En":"One of four equal groups."}],"Solution":{"Idea":{"Ar":"نحسب عدد المجموعات المتساوية في الوحدة.","En":"Find how many equal groups make the whole."},"FormulaLatex":"12/3=4","Steps":[{"Ar":"$12/3=4$","En":"$12/3=4$"},{"Ar":"$3/12=1/4$","En":"$3/12=1/4$"}],"Substitution":{"Ar":"$3/12$","En":"$3/12$"},"Result":{"Ar":"$\\frac14$","En":"$\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot(1/4)=1$","En":"$4\\cdot(1/4)=1$"},"CommonError":{"Ar":"يمثل جزءاً صغيراً واحداً.","En":"Represents one small part."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يمثل جزءاً صغيراً واحداً.","En":"Represents one small part."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يمثل أربع قطع صغيرة لا ثلاثاً.","En":"Represents four small parts, not three."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يمثل ثلاث مجموعات كاملة.","En":"Represents three full groups."},"Order":4}]}$mw$),
($mw$growth-v54-grade-3-time-clock-same-duration-start-shift-1$mw$,$mw$time-clock-same-duration-start-shift$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"تغير وقت النهاية","En":"Changing an end time"},"Question":{"Ar":"يبدأ درس عند 9:10 وينتهي عند 9:45. في يوم آخر يبدأ الدرس عند 9:25 ويستغرق المدة نفسها. متى ينتهي؟","En":"A lesson begins at 9:10 and ends at 9:45. On another day it begins at 9:25 and lasts just as long. When does it end?"},"Options":[{"LatexCode":"9{:}45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا وقت النهاية القديم.","En":"The old end time."}},{"LatexCode":"9{:}50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 25 دقيقة فقط.","En":"Adds only twenty-five minutes."}},{"LatexCode":"10{:}15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف 50 دقيقة.","En":"Adds fifty minutes."}},{"LatexCode":"10{:}00","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب مدة الدرس الأول.","En":"Find the original duration."},{"Ar":"أضفها إلى 9:25.","En":"Add it to 9:25."}],"Solution":{"Idea":{"Ar":"نحسب المدة ثم نضيفها إلى وقت البدء الجديد.","En":"Find the duration and add it to the new start."},"FormulaLatex":"45-10=35","Steps":[{"Ar":"$45-10=35$","En":"$45-10=35$"},{"Ar":"$25+35=60$","En":"$25+35=60$"}],"Substitution":{"Ar":"$25+35=60$","En":"$25+35=60$"},"Result":{"Ar":"$10{:}00$","En":"$10{:}00$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9{:}25+35\\text{ min}=10{:}00$","En":"$9{:}25+35\\text{ min}=10{:}00$"},"CommonError":{"Ar":"هذا وقت النهاية القديم.","En":"The old end time."}}}$mw$::jsonb,$mw$نحسب المدة ثم نضيفها إلى وقت البدء الجديد.

$45-10=35$

1. $45-10=35$

2. $25+35=60$

$25+35=60$

$10{:}00$

$9{:}25+35\text{ min}=10{:}00$

هذا وقت النهاية القديم.$mw$,$mw$Find the duration and add it to the new start.

$45-10=35$

1. $45-10=35$

2. $25+35=60$

$25+35=60$

$10{:}00$

$9{:}25+35\text{ min}=10{:}00$

The old end time.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"احسب مدة الدرس الأول.","En":"Find the original duration."},{"Ar":"أضفها إلى 9:25.","En":"Add it to 9:25."}],"Solution":{"Idea":{"Ar":"نحسب المدة ثم نضيفها إلى وقت البدء الجديد.","En":"Find the duration and add it to the new start."},"FormulaLatex":"45-10=35","Steps":[{"Ar":"$45-10=35$","En":"$45-10=35$"},{"Ar":"$25+35=60$","En":"$25+35=60$"}],"Substitution":{"Ar":"$25+35=60$","En":"$25+35=60$"},"Result":{"Ar":"$10{:}00$","En":"$10{:}00$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9{:}25+35\\text{ min}=10{:}00$","En":"$9{:}25+35\\text{ min}=10{:}00$"},"CommonError":{"Ar":"هذا وقت النهاية القديم.","En":"The old end time."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا وقت النهاية القديم.","En":"The old end time."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 25 دقيقة فقط.","En":"Adds only twenty-five minutes."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف 50 دقيقة.","En":"Adds fifty minutes."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v54-grade-4-equation-product-equality-known-factor-both-1$mw$,$mw$equation-product-equality-known-factor-both$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مساواة حاصلَي ضرب","En":"Equal products"},"Question":{"Ar":"ما العدد n الذي يجعل $6n=9\\times4$؟","En":"What number n makes $6n=9\\times4$ true?"},"Options":[{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 54 في الطرف الأيسر.","En":"Gives 54 on the left."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب الطرف الأيمن.","En":"This is the right-side product."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 24 في الطرف الأيسر.","En":"Gives 24 on the left."}}],"Hints":[{"Ar":"احسب 9×4.","En":"Calculate nine times four."},{"Ar":"اقسم الناتج على ستة.","En":"Divide by six."}],"Solution":{"Idea":{"Ar":"نحسب الطرف الأيمن ثم نقسم على معامل n.","En":"Calculate the right side then divide by the coefficient of n."},"FormulaLatex":"n=(9\\cdot4)/6","Steps":[{"Ar":"$9\\cdot4=36$","En":"$9\\cdot4=36$"},{"Ar":"$n=36/6=6$","En":"$n=36/6=6$"}],"Substitution":{"Ar":"$36/6$","En":"$36/6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot6=9\\cdot4$","En":"$6\\cdot6=9\\cdot4$"},"CommonError":{"Ar":"يعطي 24 في الطرف الأيسر.","En":"Gives 24 on the left."}}}$mw$::jsonb,$mw$نحسب الطرف الأيمن ثم نقسم على معامل n.

$n=(9\cdot4)/6$

1. $9\cdot4=36$

2. $n=36/6=6$

$36/6$

$6$

$6\cdot6=9\cdot4$

يعطي 24 في الطرف الأيسر.$mw$,$mw$Calculate the right side then divide by the coefficient of n.

$n=(9\cdot4)/6$

1. $9\cdot4=36$

2. $n=36/6=6$

$36/6$

$6$

$6\cdot6=9\cdot4$

Gives 24 on the left.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب 9×4.","En":"Calculate nine times four."},{"Ar":"اقسم الناتج على ستة.","En":"Divide by six."}],"Solution":{"Idea":{"Ar":"نحسب الطرف الأيمن ثم نقسم على معامل n.","En":"Calculate the right side then divide by the coefficient of n."},"FormulaLatex":"n=(9\\cdot4)/6","Steps":[{"Ar":"$9\\cdot4=36$","En":"$9\\cdot4=36$"},{"Ar":"$n=36/6=6$","En":"$n=36/6=6$"}],"Substitution":{"Ar":"$36/6$","En":"$36/6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot6=9\\cdot4$","En":"$6\\cdot6=9\\cdot4$"},"CommonError":{"Ar":"يعطي 24 في الطرف الأيسر.","En":"Gives 24 on the left."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعطي 54 في الطرف الأيسر.","En":"Gives 54 on the left."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب الطرف الأيمن.","En":"This is the right-side product."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 24 في الطرف الأيسر.","En":"Gives 24 on the left."},"Order":4}]}$mw$),
($mw$growth-v54-grade-5-estimate-quotient-compatible-multiple-compare-1$mw$,$mw$estimate-quotient-compatible-multiple-compare$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تقدير خارج القسمة بعدد متوافق","En":"Estimating a quotient with a compatible number"},"Question":{"Ar":"لتقدير $238\\div6$، استبدل 238 بأقرب مضاعف للعدد 6. ما الناتج التقديري؟","En":"To estimate $238\\div6$, replace 238 by the nearest multiple of six. What is the estimated quotient?"},"Options":[{"LatexCode":"42","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستخدم 252 البعيد عن 238.","En":"Uses 252, farther from 238."}},{"LatexCode":"40","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"38","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستخدم 228 البعيد عن 238.","En":"Uses 228, farther from 238."}},{"LatexCode":"39","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستخدم 234 وهو أبعد من 240.","En":"Uses 234, farther than 240."}}],"Hints":[{"Ar":"أوجد المضاعفين الأقرب أسفل العدد وأعلاه.","En":"Find the multiples immediately below and above."},{"Ar":"اختر الأقرب ثم اقسم.","En":"Choose the nearer and divide."}],"Solution":{"Idea":{"Ar":"نقارن المضاعفين المحيطين بالعدد ونختار الأقرب.","En":"Compare adjacent multiples and use the nearer one."},"FormulaLatex":"6\\cdot39=234,\\quad6\\cdot40=240","Steps":[{"Ar":"$238-234=4$","En":"$238-234=4$"},{"Ar":"$240-238=2$","En":"$240-238=2$"},{"Ar":"$240/6=40$","En":"$240/6=40$"}],"Substitution":{"Ar":"$240/6$","En":"$240/6$"},"Result":{"Ar":"$40$","En":"$40$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot40=240$","En":"$6\\cdot40=240$"},"CommonError":{"Ar":"يستخدم 228 البعيد عن 238.","En":"Uses 228, farther from 238."}}}$mw$::jsonb,$mw$نقارن المضاعفين المحيطين بالعدد ونختار الأقرب.

$6\cdot39=234,\quad6\cdot40=240$

1. $238-234=4$

2. $240-238=2$

3. $240/6=40$

$240/6$

$40$

$6\cdot40=240$

يستخدم 228 البعيد عن 238.$mw$,$mw$Compare adjacent multiples and use the nearer one.

$6\cdot39=234,\quad6\cdot40=240$

1. $238-234=4$

2. $240-238=2$

3. $240/6=40$

$240/6$

$40$

$6\cdot40=240$

Uses 228, farther from 238.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أوجد المضاعفين الأقرب أسفل العدد وأعلاه.","En":"Find the multiples immediately below and above."},{"Ar":"اختر الأقرب ثم اقسم.","En":"Choose the nearer and divide."}],"Solution":{"Idea":{"Ar":"نقارن المضاعفين المحيطين بالعدد ونختار الأقرب.","En":"Compare adjacent multiples and use the nearer one."},"FormulaLatex":"6\\cdot39=234,\\quad6\\cdot40=240","Steps":[{"Ar":"$238-234=4$","En":"$238-234=4$"},{"Ar":"$240-238=2$","En":"$240-238=2$"},{"Ar":"$240/6=40$","En":"$240/6=40$"}],"Substitution":{"Ar":"$240/6$","En":"$240/6$"},"Result":{"Ar":"$40$","En":"$40$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$6\\cdot40=240$","En":"$6\\cdot40=240$"},"CommonError":{"Ar":"يستخدم 228 البعيد عن 238.","En":"Uses 228, farther from 238."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يستخدم 252 البعيد عن 238.","En":"Uses 252, farther from 238."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يستخدم 228 البعيد عن 238.","En":"Uses 228, farther from 238."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يستخدم 234 وهو أبعد من 240.","En":"Uses 234, farther than 240."},"Order":4}]}$mw$),
($mw$growth-v54-grade-6-two-step-equation-sum-equal-groups-after-removal-1$mw$,$mw$two-step-equation-sum-equal-groups-after-removal$mw$,$mw$primary-two-step-equations$mw$,$mw$grade-6$mw$,6,1,2,10,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":10,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عدد عناصر في مجموعة","En":"Items in a group"},"Question":{"Ar":"أربع أكياس تحتوي العدد نفسه x من الكرات. أُزيلت 5 كرات من المجموع فبقي 27. ما x؟","En":"Four bags contain the same number x of balls. Five balls are removed from the total, leaving 27. Find x."},"Options":[{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا العدد المزال.","En":"This is the removed count."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي 23 كرة بعد الإزالة.","En":"Leaves 23 balls after removal."}},{"LatexCode":"32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا العدد الأصلي في جميع الأكياس.","En":"This is the original total across all bags."}}],"Hints":[{"Ar":"كم كان العدد قبل الإزالة؟","En":"What was the total before removal?"},{"Ar":"قسّم المجموع على أربعة.","En":"Divide the total by four."}],"Solution":{"Idea":{"Ar":"نعيد الخمس إلى المجموع ثم نقسم على أربعة.","En":"Restore the five balls and divide the total by four."},"FormulaLatex":"4x-5=27","Steps":[{"Ar":"$4x=32$","En":"$4x=32$"},{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=(27+5)/4$","En":"$x=(27+5)/4$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot8-5=27$","En":"$4\\cdot8-5=27$"},"CommonError":{"Ar":"هذا العدد المزال.","En":"This is the removed count."}}}$mw$::jsonb,$mw$نعيد الخمس إلى المجموع ثم نقسم على أربعة.

$4x-5=27$

1. $4x=32$

2. $x=8$

$x=(27+5)/4$

$8$

$4\cdot8-5=27$

هذا العدد المزال.$mw$,$mw$Restore the five balls and divide the total by four.

$4x-5=27$

1. $4x=32$

2. $x=8$

$x=(27+5)/4$

$8$

$4\cdot8-5=27$

This is the removed count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم كان العدد قبل الإزالة؟","En":"What was the total before removal?"},{"Ar":"قسّم المجموع على أربعة.","En":"Divide the total by four."}],"Solution":{"Idea":{"Ar":"نعيد الخمس إلى المجموع ثم نقسم على أربعة.","En":"Restore the five balls and divide the total by four."},"FormulaLatex":"4x-5=27","Steps":[{"Ar":"$4x=32$","En":"$4x=32$"},{"Ar":"$x=8$","En":"$x=8$"}],"Substitution":{"Ar":"$x=(27+5)/4$","En":"$x=(27+5)/4$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot8-5=27$","En":"$4\\cdot8-5=27$"},"CommonError":{"Ar":"هذا العدد المزال.","En":"This is the removed count."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا العدد المزال.","En":"This is the removed count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يعطي 23 كرة بعد الإزالة.","En":"Leaves 23 balls after removal."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا العدد الأصلي في جميع الأكياس.","En":"This is the original total across all bags."},"Order":4}]}$mw$),
($mw$growth-v54-grade-6-signed-number-between-opposite-bound-count-1$mw$,$mw$signed-number-between-opposite-bound-count$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,345,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":345,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد الأعداد بين قيمتين متقابلتين","En":"Counting integers between opposites"},"Question":{"Ar":"كم عدداً صحيحاً يقع بين −2 و2 حصراً دون الطرفين؟","En":"How many integers lie strictly between −2 and 2, excluding both endpoints?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أهمل الصفر.","En":"Omits zero."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أدرج طرفاً واحداً.","En":"Includes one endpoint."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أدرج الطرفين.","En":"Includes both endpoints."}},{"LatexCode":"3","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"ابدأ بالعدد الذي يلي −2.","En":"Start at the integer after −2."},{"Ar":"توقف قبل 2 ولا تنس الصفر.","En":"Stop before two and include zero."}],"Solution":{"Idea":{"Ar":"نكتب الأعداد الصحيحة الداخلية بما فيها الصفر.","En":"List the interior integers including zero."},"FormulaLatex":"-2<x<2","Steps":[{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"$x\\in\\{-1,0,1\\}$","En":"$x\\in\\{-1,0,1\\}$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-2<-1<0<1<2$","En":"$-2<-1<0<1<2$"},"CommonError":{"Ar":"أهمل الصفر.","En":"Omits zero."}}}$mw$::jsonb,$mw$نكتب الأعداد الصحيحة الداخلية بما فيها الصفر.

$-2<x<2$

1. $1+1+1=3$

$x\in\{-1,0,1\}$

$3$

$-2<-1<0<1<2$

أهمل الصفر.$mw$,$mw$List the interior integers including zero.

$-2<x<2$

1. $1+1+1=3$

$x\in\{-1,0,1\}$

$3$

$-2<-1<0<1<2$

Omits zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ابدأ بالعدد الذي يلي −2.","En":"Start at the integer after −2."},{"Ar":"توقف قبل 2 ولا تنس الصفر.","En":"Stop before two and include zero."}],"Solution":{"Idea":{"Ar":"نكتب الأعداد الصحيحة الداخلية بما فيها الصفر.","En":"List the interior integers including zero."},"FormulaLatex":"-2<x<2","Steps":[{"Ar":"$1+1+1=3$","En":"$1+1+1=3$"}],"Substitution":{"Ar":"$x\\in\\{-1,0,1\\}$","En":"$x\\in\\{-1,0,1\\}$"},"Result":{"Ar":"$3$","En":"$3$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-2<-1<0<1<2$","En":"$-2<-1<0<1<2$"},"CommonError":{"Ar":"أهمل الصفر.","En":"Omits zero."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أهمل الصفر.","En":"Omits zero."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أدرج طرفاً واحداً.","En":"Includes one endpoint."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أدرج الطرفين.","En":"Includes both endpoints."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v54-grade-4-place-value-digit-same-number-ratio-1$mw$,$mw$place-value-digit-same-number-ratio$mw$,$mw$place-value$mw$,$mw$grade-4$mw$,4,1,81,305,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":305,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"قيمة رقم مكرر","En":"Repeated digit place values"},"Question":{"Ar":"في العدد 5050، بكم مرة تزيد قيمة الرقم 5 في منزلة الآلاف على قيمة الرقم 5 في منزلة العشرات؟","En":"In 5050, how many times as large is the value of the thousands digit 5 as the value of the tens digit 5?"},"Options":[{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة رقم العشرات.","En":"This is the tens digit's value."}},{"LatexCode":"1000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يقسم قيمة الآلاف على قيمة العشرات.","En":"Does not divide the two place values."}},{"LatexCode":"100","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يفصل بين المنزلتين انتقالان لا انتقال واحد.","En":"There are two place shifts, not one."}}],"Hints":[{"Ar":"اكتب قيمة كل رقم 5.","En":"Write the value of each five."},{"Ar":"اقسم الكبرى على الصغرى.","En":"Divide the larger by the smaller."}],"Solution":{"Idea":{"Ar":"نقارن قيمتي الرقم بحسب المنزلتين.","En":"Compare the digit's two place values."},"FormulaLatex":"5000/50","Steps":[{"Ar":"$5000/50=100$","En":"$5000/50=100$"}],"Substitution":{"Ar":"$(5\\cdot1000)/(5\\cdot10)$","En":"$(5\\cdot1000)/(5\\cdot10)$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50\\cdot100=5000$","En":"$50\\cdot100=5000$"},"CommonError":{"Ar":"يفصل بين المنزلتين انتقالان لا انتقال واحد.","En":"There are two place shifts, not one."}}}$mw$::jsonb,$mw$نقارن قيمتي الرقم بحسب المنزلتين.

$5000/50$

1. $5000/50=100$

$(5\cdot1000)/(5\cdot10)$

$100$

$50\cdot100=5000$

يفصل بين المنزلتين انتقالان لا انتقال واحد.$mw$,$mw$Compare the digit's two place values.

$5000/50$

1. $5000/50=100$

$(5\cdot1000)/(5\cdot10)$

$100$

$50\cdot100=5000$

There are two place shifts, not one.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب قيمة كل رقم 5.","En":"Write the value of each five."},{"Ar":"اقسم الكبرى على الصغرى.","En":"Divide the larger by the smaller."}],"Solution":{"Idea":{"Ar":"نقارن قيمتي الرقم بحسب المنزلتين.","En":"Compare the digit's two place values."},"FormulaLatex":"5000/50","Steps":[{"Ar":"$5000/50=100$","En":"$5000/50=100$"}],"Substitution":{"Ar":"$(5\\cdot1000)/(5\\cdot10)$","En":"$(5\\cdot1000)/(5\\cdot10)$"},"Result":{"Ar":"$100$","En":"$100$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$50\\cdot100=5000$","En":"$50\\cdot100=5000$"},"CommonError":{"Ar":"يفصل بين المنزلتين انتقالان لا انتقال واحد.","En":"There are two place shifts, not one."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة رقم العشرات.","En":"This is the tens digit's value."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا يقسم قيمة الآلاف على قيمة العشرات.","En":"Does not divide the two place values."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يفصل بين المنزلتين انتقالان لا انتقال واحد.","En":"There are two place shifts, not one."},"Order":4}]}$mw$),
($mw$growth-v54-grade-5-decimal-place-value-regroup-tenths-hundredths-1$mw$,$mw$decimal-place-value-regroup-tenths-hundredths$mw$,$mw$p-fractions-decimals-decimal-place-value$mw$,$mw$grade-5$mw$,5,1,21,94,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":94,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"إعادة تجميع الأجزاء العشرية","En":"Regrouping decimal parts"},"Question":{"Ar":"ما العدد العشري الذي يتكون من 3 آحاد و14 جزءاً من مئة؟","En":"What decimal consists of three ones and fourteen hundredths?"},"Options":[{"LatexCode":"3.4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"وضع الرقم 4 في منزلة الأعشار بدلاً من تحويل الأجزاء الأربعة عشر من مئة.","En":"Places four in the tenths position instead of converting all fourteen hundredths."}},{"LatexCode":"3.14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3.014","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل الأجزاء المئوية كأجزاء من ألف.","En":"Treats hundredths as thousandths."}},{"LatexCode":"4.4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل 14 كأجزاء من عشرة.","En":"Treats fourteen as tenths."}}],"Hints":[{"Ar":"اقسم 14 على 100.","En":"Divide fourteen by one hundred."},{"Ar":"أضف الناتج إلى 3.","En":"Add the result to three."}],"Solution":{"Idea":{"Ar":"أربعة عشر جزءاً من مئة تساوي 0.14.","En":"Fourteen hundredths equal 0.14."},"FormulaLatex":"3+14/100","Steps":[{"Ar":"$14/100=0.14$","En":"$14/100=0.14$"},{"Ar":"$3+0.14=3.14$","En":"$3+0.14=3.14$"}],"Substitution":{"Ar":"$3+0.14$","En":"$3+0.14$"},"Result":{"Ar":"$3.14$","En":"$3.14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3.14-3=0.14$","En":"$3.14-3=0.14$"},"CommonError":{"Ar":"عامل الأجزاء المئوية كأجزاء من ألف.","En":"Treats hundredths as thousandths."}}}$mw$::jsonb,$mw$أربعة عشر جزءاً من مئة تساوي 0.14.

$3+14/100$

1. $14/100=0.14$

2. $3+0.14=3.14$

$3+0.14$

$3.14$

$3.14-3=0.14$

عامل الأجزاء المئوية كأجزاء من ألف.$mw$,$mw$Fourteen hundredths equal 0.14.

$3+14/100$

1. $14/100=0.14$

2. $3+0.14=3.14$

$3+0.14$

$3.14$

$3.14-3=0.14$

Treats hundredths as thousandths.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم 14 على 100.","En":"Divide fourteen by one hundred."},{"Ar":"أضف الناتج إلى 3.","En":"Add the result to three."}],"Solution":{"Idea":{"Ar":"أربعة عشر جزءاً من مئة تساوي 0.14.","En":"Fourteen hundredths equal 0.14."},"FormulaLatex":"3+14/100","Steps":[{"Ar":"$14/100=0.14$","En":"$14/100=0.14$"},{"Ar":"$3+0.14=3.14$","En":"$3+0.14=3.14$"}],"Substitution":{"Ar":"$3+0.14$","En":"$3+0.14$"},"Result":{"Ar":"$3.14$","En":"$3.14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$3.14-3=0.14$","En":"$3.14-3=0.14$"},"CommonError":{"Ar":"عامل الأجزاء المئوية كأجزاء من ألف.","En":"Treats hundredths as thousandths."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"وضع الرقم 4 في منزلة الأعشار بدلاً من تحويل الأجزاء الأربعة عشر من مئة.","En":"Places four in the tenths position instead of converting all fourteen hundredths."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عامل الأجزاء المئوية كأجزاء من ألف.","En":"Treats hundredths as thousandths."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامل 14 كأجزاء من عشرة.","En":"Treats fourteen as tenths."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v54 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
