-- One-time owner-authorized v35 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v35-grade-2-cube-vertices-count-two-faces-1$mw$,$mw$cube-vertices-count-two-faces$mw$,$mw$primary-shape-attributes-partition$mw$,$mw$grade-2$mw$,2,1,96,355,$mw${"StageId":1,"CategoryId":96,"PrimarySkillId":355,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"عد رؤوس المكعب","En":"Counting cube vertices"},"Question":{"Ar":"للمكعب وجه علوي ووجه سفلي متقابلان. إذا وضعنا نقطة عند كل رأس من هذين الوجهين فقط، فكم نقطة مختلفة نضع؟","En":"A cube has opposite top and bottom faces. If a dot is placed at every vertex of those two faces only, how many distinct dots are placed?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 يعد رؤوس وجه واحد.","En":"4 counts one face only."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6 عدد أوجه المكعب.","En":"6 counts cube faces."}},{"LatexCode":"8","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"12 عدد أحرف المكعب لا رؤوسه.","En":"12 counts edges rather than vertices."}}],"Hints":[{"Ar":"عد رؤوس كل وجه على حدة.","En":"Count the vertices of each face."},{"Ar":"هل يشترك الوجهان المتقابلان في رأس؟","En":"Do opposite faces share any vertex?"}],"Solution":{"Idea":{"Ar":"الوجهان المتقابلان لا يشتركان في أي رأس.","En":"Opposite faces have no shared vertices."},"FormulaLatex":"4+4","Steps":[{"Ar":"للوجه العلوي أربعة رؤوس.","En":"The top face has four vertices."},{"Ar":"للوجه السفلي أربعة رؤوس أخرى.","En":"The bottom face has four different vertices."}],"Substitution":{"Ar":"$4+4=8$","En":"$4+4=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8-4=4$","En":"$8-4=4$"},"CommonError":{"Ar":"لا تخلط بين الرأس والحرف والوجه.","En":"Do not confuse vertices, edges and faces."}}}$mw$::jsonb,$mw$الوجهان المتقابلان لا يشتركان في أي رأس.

$4+4$

1. للوجه العلوي أربعة رؤوس.

2. للوجه السفلي أربعة رؤوس أخرى.

$4+4=8$

$8$

$8-4=4$

لا تخلط بين الرأس والحرف والوجه.$mw$,$mw$Opposite faces have no shared vertices.

$4+4$

1. The top face has four vertices.

2. The bottom face has four different vertices.

$4+4=8$

$8$

$8-4=4$

Do not confuse vertices, edges and faces.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"عد رؤوس كل وجه على حدة.","En":"Count the vertices of each face."},{"Ar":"هل يشترك الوجهان المتقابلان في رأس؟","En":"Do opposite faces share any vertex?"}],"Solution":{"Idea":{"Ar":"الوجهان المتقابلان لا يشتركان في أي رأس.","En":"Opposite faces have no shared vertices."},"FormulaLatex":"4+4","Steps":[{"Ar":"للوجه العلوي أربعة رؤوس.","En":"The top face has four vertices."},{"Ar":"للوجه السفلي أربعة رؤوس أخرى.","En":"The bottom face has four different vertices."}],"Substitution":{"Ar":"$4+4=8$","En":"$4+4=8$"},"Result":{"Ar":"$8$","En":"$8$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8-4=4$","En":"$8-4=4$"},"CommonError":{"Ar":"لا تخلط بين الرأس والحرف والوجه.","En":"Do not confuse vertices, edges and faces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"4 يعد رؤوس وجه واحد.","En":"4 counts one face only."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"6 عدد أوجه المكعب.","En":"6 counts cube faces."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"12 عدد أحرف المكعب لا رؤوسه.","En":"12 counts edges rather than vertices."},"Order":4}]}$mw$),
($mw$growth-v35-grade-3-fraction-distance-between-ticks-1$mw$,$mw$fraction-distance-between-ticks$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المسافة بين علامتين كسريتين","En":"Distance between fraction marks"},"Question":{"Ar":"على خط الأعداد قُسّمت المسافة من 0 إلى 1 إلى ستة أجزاء متساوية. ما طول المسافة من العلامة الثانية بعد الصفر إلى العلامة الخامسة بعده، بوحدة المسافة من 0 إلى 1؟","En":"On a number line the interval from 0 to 1 is split into six equal parts. What is the distance from the second tick after zero to the fifth tick after zero, in units of the interval from 0 to 1?"},"Options":[{"LatexCode":"\\frac16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"سدس واحد طول خطوة واحدة فقط.","En":"One sixth is only one step."}},{"LatexCode":"\\frac26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"سدسان موضع البداية لا المسافة.","En":"Two sixths is the starting position, not the distance."}},{"LatexCode":"\\frac36","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac56","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خمسة أسداس موضع النهاية.","En":"Five sixths is the ending position."}}],"Hints":[{"Ar":"حدد عدد الخطوات من العلامة الثانية إلى الخامسة.","En":"Find the number of steps from the second to the fifth mark."},{"Ar":"طول الخطوة الواحدة سدس.","En":"Each step is one sixth long."}],"Solution":{"Idea":{"Ar":"كل خطوة طولها سدس، ونعد الفواصل بين العلامتين لا العلامات نفسها.","En":"Each step is one sixth; count the intervals between the marks, not the marks themselves."},"FormulaLatex":"\\frac{5-2}{6}","Steps":[{"Ar":"ننتقل من الثانية إلى الثالثة، ثم الرابعة، ثم الخامسة.","En":"Move from the second tick to the third, fourth and fifth."},{"Ar":"هذه ثلاث خطوات، طول كل منها سدس.","En":"There are three steps, each one sixth long."}],"Substitution":{"Ar":"$\\frac{5-2}{6}=\\frac36$","En":"$\\frac{5-2}{6}=\\frac36$"},"Result":{"Ar":"$\\frac36$","En":"$\\frac36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac26+\\frac36=\\frac56$","En":"$\\frac26+\\frac36=\\frac56$"},"CommonError":{"Ar":"لا تعد علامة البداية خطوة.","En":"Do not count the starting mark as a step."}}}$mw$::jsonb,$mw$كل خطوة طولها سدس، ونعد الفواصل بين العلامتين لا العلامات نفسها.

$\frac{5-2}{6}$

1. ننتقل من الثانية إلى الثالثة، ثم الرابعة، ثم الخامسة.

2. هذه ثلاث خطوات، طول كل منها سدس.

$\frac{5-2}{6}=\frac36$

$\frac36$

$\frac26+\frac36=\frac56$

لا تعد علامة البداية خطوة.$mw$,$mw$Each step is one sixth; count the intervals between the marks, not the marks themselves.

$\frac{5-2}{6}$

1. Move from the second tick to the third, fourth and fifth.

2. There are three steps, each one sixth long.

$\frac{5-2}{6}=\frac36$

$\frac36$

$\frac26+\frac36=\frac56$

Do not count the starting mark as a step.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد عدد الخطوات من العلامة الثانية إلى الخامسة.","En":"Find the number of steps from the second to the fifth mark."},{"Ar":"طول الخطوة الواحدة سدس.","En":"Each step is one sixth long."}],"Solution":{"Idea":{"Ar":"كل خطوة طولها سدس، ونعد الفواصل بين العلامتين لا العلامات نفسها.","En":"Each step is one sixth; count the intervals between the marks, not the marks themselves."},"FormulaLatex":"\\frac{5-2}{6}","Steps":[{"Ar":"ننتقل من الثانية إلى الثالثة، ثم الرابعة، ثم الخامسة.","En":"Move from the second tick to the third, fourth and fifth."},{"Ar":"هذه ثلاث خطوات، طول كل منها سدس.","En":"There are three steps, each one sixth long."}],"Substitution":{"Ar":"$\\frac{5-2}{6}=\\frac36$","En":"$\\frac{5-2}{6}=\\frac36$"},"Result":{"Ar":"$\\frac36$","En":"$\\frac36$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\frac26+\\frac36=\\frac56$","En":"$\\frac26+\\frac36=\\frac56$"},"CommonError":{"Ar":"لا تعد علامة البداية خطوة.","En":"Do not count the starting mark as a step."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"سدس واحد طول خطوة واحدة فقط.","En":"One sixth is only one step."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"سدسان موضع البداية لا المسافة.","En":"Two sixths is the starting position, not the distance."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"خمسة أسداس موضع النهاية.","En":"Five sixths is the ending position."},"Order":4}]}$mw$),
($mw$growth-v35-grade-6-choose-equation-for-repeated-additive-model-1$mw$,$mw$choose-equation-for-repeated-additive-model$mw$,$mw$primary-two-step-equations$mw$,$mw$grade-6$mw$,6,1,2,10,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":10,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة من وصف عددي","En":"Equation from a numerical description"},"Question":{"Ar":"ضُرب عدد مجهول x في 4، ثم أضيف 9 إلى الناتج فأصبح 41. أي معادلة تمثل الوصف بالترتيب الصحيح؟","En":"An unknown number x is multiplied by 4, then 9 is added to the result to give 41. Which equation represents the description in the correct order?"},"Options":[{"LatexCode":"4(x+9)=41","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 9 قبل الضرب.","En":"This adds 9 before multiplying."}},{"LatexCode":"9x+4=41","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يبدّل دور 4 و9.","En":"This swaps the roles of 4 and 9."}},{"LatexCode":"4x+9=41","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4x-9=41","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 9 بدلاً من إضافته.","En":"This subtracts 9 instead of adding it."}}],"Hints":[{"Ar":"اكتب ناتج الضرب أولاً.","En":"Write the product first."},{"Ar":"أضف 9 إلى الناتج لا إلى x قبل الضرب.","En":"Add 9 to the product, not to x before multiplication."}],"Solution":{"Idea":{"Ar":"نترجم العمليات حسب ترتيبها: الضرب أولاً ثم الجمع.","En":"Translate operations in order: multiplication first, then addition."},"FormulaLatex":"4x+9=41","Steps":[{"Ar":"الضرب في 4 يعطي 4x.","En":"Multiplication by 4 gives 4x."},{"Ar":"إضافة 9 تعطي الطرف الذي يساوي 41.","En":"Adding 9 gives the expression equal to 41."}],"Substitution":{"Ar":"$4x+9=41$","En":"$4x+9=41$"},"Result":{"Ar":"$4x+9=41$","En":"$4x+9=41$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot8+9=41$","En":"$4\\cdot8+9=41$"},"CommonError":{"Ar":"انتبه إلى موضع الأقواس وترتيب العمليات.","En":"Pay attention to parentheses and operation order."}}}$mw$::jsonb,$mw$نترجم العمليات حسب ترتيبها: الضرب أولاً ثم الجمع.

$4x+9=41$

1. الضرب في 4 يعطي 4x.

2. إضافة 9 تعطي الطرف الذي يساوي 41.

$4x+9=41$

$4x+9=41$

$4\cdot8+9=41$

انتبه إلى موضع الأقواس وترتيب العمليات.$mw$,$mw$Translate operations in order: multiplication first, then addition.

$4x+9=41$

1. Multiplication by 4 gives 4x.

2. Adding 9 gives the expression equal to 41.

$4x+9=41$

$4x+9=41$

$4\cdot8+9=41$

Pay attention to parentheses and operation order.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب ناتج الضرب أولاً.","En":"Write the product first."},{"Ar":"أضف 9 إلى الناتج لا إلى x قبل الضرب.","En":"Add 9 to the product, not to x before multiplication."}],"Solution":{"Idea":{"Ar":"نترجم العمليات حسب ترتيبها: الضرب أولاً ثم الجمع.","En":"Translate operations in order: multiplication first, then addition."},"FormulaLatex":"4x+9=41","Steps":[{"Ar":"الضرب في 4 يعطي 4x.","En":"Multiplication by 4 gives 4x."},{"Ar":"إضافة 9 تعطي الطرف الذي يساوي 41.","En":"Adding 9 gives the expression equal to 41."}],"Substitution":{"Ar":"$4x+9=41$","En":"$4x+9=41$"},"Result":{"Ar":"$4x+9=41$","En":"$4x+9=41$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot8+9=41$","En":"$4\\cdot8+9=41$"},"CommonError":{"Ar":"انتبه إلى موضع الأقواس وترتيب العمليات.","En":"Pay attention to parentheses and operation order."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا يضيف 9 قبل الضرب.","En":"This adds 9 before multiplying."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا يبدّل دور 4 و9.","En":"This swaps the roles of 4 and 9."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يطرح 9 بدلاً من إضافته.","En":"This subtracts 9 instead of adding it."},"Order":4}]}$mw$),
($mw$growth-v35-grade-6-absolute-value-versus-number-order-1$mw$,$mw$absolute-value-versus-number-order$mw$,$mw$primary-signed-rational-number-sense$mw$,$mw$grade-6$mw$,6,1,81,345,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":345,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المسافة عن الصفر والترتيب","En":"Distance from zero versus order"},"Question":{"Ar":"أي عدد من الخيارات أبعد عن الصفر على خط الأعداد؟","En":"Which of the following numbers is farthest from zero on the number line?"},"Options":[{"LatexCode":"-4.5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3.8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3.8 يبعد 3.8 وحدات فقط.","En":"3.8 is only 3.8 units away."}},{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"−2 يبعد وحدتين فقط.","En":"−2 is only two units away."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"4 أكبر عدداً من −4.5 لكنه أقرب إلى الصفر.","En":"4 is numerically greater than −4.5 but closer to zero."}}],"Hints":[{"Ar":"احسب المسافة عن الصفر لكل عدد.","En":"Find each number's distance from zero."},{"Ar":"قارن القيم المطلقة.","En":"Compare absolute values."}],"Solution":{"Idea":{"Ar":"المسافة عن الصفر هي القيمة المطلقة، وليست ترتيب الأعداد الموقعة.","En":"Distance from zero is absolute value, not signed numerical order."},"FormulaLatex":"|-4.5|=4.5","Steps":[{"Ar":"$|-4.5|=4.5,\\quad|3.8|=3.8$","En":"$|-4.5|=4.5,\\quad|3.8|=3.8$"},{"Ar":"$|-2|=2,\\quad|4|=4$","En":"$|-2|=2,\\quad|4|=4$"}],"Substitution":{"Ar":"$4.5>4>3.8>2$","En":"$4.5>4>3.8>2$"},"Result":{"Ar":"$-4.5$","En":"$-4.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|-4.5|>|4|$","En":"$|-4.5|>|4|$"},"CommonError":{"Ar":"العدد الأكبر ليس دائماً الأبعد عن الصفر.","En":"The greatest number is not always farthest from zero."}}}$mw$::jsonb,$mw$المسافة عن الصفر هي القيمة المطلقة، وليست ترتيب الأعداد الموقعة.

$|-4.5|=4.5$

1. $|-4.5|=4.5,\quad|3.8|=3.8$

2. $|-2|=2,\quad|4|=4$

$4.5>4>3.8>2$

$-4.5$

$|-4.5|>|4|$

العدد الأكبر ليس دائماً الأبعد عن الصفر.$mw$,$mw$Distance from zero is absolute value, not signed numerical order.

$|-4.5|=4.5$

1. $|-4.5|=4.5,\quad|3.8|=3.8$

2. $|-2|=2,\quad|4|=4$

$4.5>4>3.8>2$

$-4.5$

$|-4.5|>|4|$

The greatest number is not always farthest from zero.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب المسافة عن الصفر لكل عدد.","En":"Find each number's distance from zero."},{"Ar":"قارن القيم المطلقة.","En":"Compare absolute values."}],"Solution":{"Idea":{"Ar":"المسافة عن الصفر هي القيمة المطلقة، وليست ترتيب الأعداد الموقعة.","En":"Distance from zero is absolute value, not signed numerical order."},"FormulaLatex":"|-4.5|=4.5","Steps":[{"Ar":"$|-4.5|=4.5,\\quad|3.8|=3.8$","En":"$|-4.5|=4.5,\\quad|3.8|=3.8$"},{"Ar":"$|-2|=2,\\quad|4|=4$","En":"$|-2|=2,\\quad|4|=4$"}],"Substitution":{"Ar":"$4.5>4>3.8>2$","En":"$4.5>4>3.8>2$"},"Result":{"Ar":"$-4.5$","En":"$-4.5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$|-4.5|>|4|$","En":"$|-4.5|>|4|$"},"CommonError":{"Ar":"العدد الأكبر ليس دائماً الأبعد عن الصفر.","En":"The greatest number is not always farthest from zero."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"3.8 يبعد 3.8 وحدات فقط.","En":"3.8 is only 3.8 units away."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"−2 يبعد وحدتين فقط.","En":"−2 is only two units away."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"4 أكبر عدداً من −4.5 لكنه أقرب إلى الصفر.","En":"4 is numerically greater than −4.5 but closer to zero."},"Order":4}]}$mw$),
($mw$growth-v35-grade-7-combined-event-union-disjoint-spinner-1$mw$,$mw$combined-event-union-disjoint-spinner$mw$,$mw$simple-compound-events$mw$,$mw$grade-7$mw$,7,2,85,337,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":337,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"احتمال حدثين متنافيين","En":"Probability of disjoint outcomes"},"Question":{"Ar":"قرص دوّار له 10 قطاعات متساوية، مرقمة من 1 إلى 10. ما احتمال ظهور عدد أقل من 3 أو أكبر من 8 في دورة واحدة؟","En":"A spinner has 10 equal sectors numbered 1 through 10. What is the probability of landing on a number less than 3 or greater than 8 in one spin?"},"Options":[{"LatexCode":"\\frac15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"خُمس يحسب أحد الجزأين فقط.","En":"One fifth counts only one part of the event."}},{"LatexCode":"\\frac25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أخماس تشمل 3 و8 خطأً.","En":"Three fifths incorrectly includes 3 and 8."}},{"LatexCode":"\\frac45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أربعة أخماس لا يوافق عدد القطاعات المطلوبة.","En":"Four fifths does not match the favorable sector count."}}],"Hints":[{"Ar":"حدد الأعداد المطلوبة في كل جزء من الشرط.","En":"List the numbers satisfying each part of the condition."},{"Ar":"اجمع الأعداد المختلفة ثم اقسم على 10.","En":"Count the distinct favorable numbers and divide by ten."}],"Solution":{"Idea":{"Ar":"نجمع نتائج الحدثين المتنافيين ثم نقسم على عدد النتائج المتساوية الاحتمال.","En":"Combine the disjoint favorable outcomes and divide by the number of equally likely outcomes."},"FormulaLatex":"P=\\frac{2+2}{10}","Steps":[{"Ar":"الأعداد الأقل من 3 هي 1 و2.","En":"The numbers below 3 are 1 and 2."},{"Ar":"الأعداد الأكبر من 8 هي 9 و10، ولا يوجد تداخل.","En":"The numbers above 8 are 9 and 10, with no overlap."}],"Substitution":{"Ar":"$P=4/10=2/5$","En":"$P=4/10=2/5$"},"Result":{"Ar":"$\\frac25$","En":"$\\frac25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+6=10$","En":"$4+6=10$"},"CommonError":{"Ar":"لا تشمل 3 أو 8 لأن المتراجحتين صارمتان.","En":"Exclude 3 and 8 because the inequalities are strict."}}}$mw$::jsonb,$mw$نجمع نتائج الحدثين المتنافيين ثم نقسم على عدد النتائج المتساوية الاحتمال.

$P=\frac{2+2}{10}$

1. الأعداد الأقل من 3 هي 1 و2.

2. الأعداد الأكبر من 8 هي 9 و10، ولا يوجد تداخل.

$P=4/10=2/5$

$\frac25$

$4+6=10$

لا تشمل 3 أو 8 لأن المتراجحتين صارمتان.$mw$,$mw$Combine the disjoint favorable outcomes and divide by the number of equally likely outcomes.

$P=\frac{2+2}{10}$

1. The numbers below 3 are 1 and 2.

2. The numbers above 8 are 9 and 10, with no overlap.

$P=4/10=2/5$

$\frac25$

$4+6=10$

Exclude 3 and 8 because the inequalities are strict.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد الأعداد المطلوبة في كل جزء من الشرط.","En":"List the numbers satisfying each part of the condition."},{"Ar":"اجمع الأعداد المختلفة ثم اقسم على 10.","En":"Count the distinct favorable numbers and divide by ten."}],"Solution":{"Idea":{"Ar":"نجمع نتائج الحدثين المتنافيين ثم نقسم على عدد النتائج المتساوية الاحتمال.","En":"Combine the disjoint favorable outcomes and divide by the number of equally likely outcomes."},"FormulaLatex":"P=\\frac{2+2}{10}","Steps":[{"Ar":"الأعداد الأقل من 3 هي 1 و2.","En":"The numbers below 3 are 1 and 2."},{"Ar":"الأعداد الأكبر من 8 هي 9 و10، ولا يوجد تداخل.","En":"The numbers above 8 are 9 and 10, with no overlap."}],"Substitution":{"Ar":"$P=4/10=2/5$","En":"$P=4/10=2/5$"},"Result":{"Ar":"$\\frac25$","En":"$\\frac25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+6=10$","En":"$4+6=10$"},"CommonError":{"Ar":"لا تشمل 3 أو 8 لأن المتراجحتين صارمتان.","En":"Exclude 3 and 8 because the inequalities are strict."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"خُمس يحسب أحد الجزأين فقط.","En":"One fifth counts only one part of the event."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ثلاثة أخماس تشمل 3 و8 خطأً.","En":"Three fifths incorrectly includes 3 and 8."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أربعة أخماس لا يوافق عدد القطاعات المطلوبة.","En":"Four fifths does not match the favorable sector count."},"Order":4}]}$mw$),
($mw$growth-v35-grade-8-experimental-frequency-complement-inverse-1$mw$,$mw$experimental-frequency-complement-inverse$mw$,$mw$frequency$mw$,$mw$grade-8$mw$,8,2,85,335,$mw${"StageId":2,"CategoryId":85,"PrimarySkillId":335,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استرجاع تكرار عدم النجاح","En":"Recovering failure frequency"},"Question":{"Ar":"في تجربة تكررت 80 مرة، كان التكرار النسبي للنجاح 0.65 بالضبط. كم مرة لم يحدث النجاح؟","En":"In 80 trials, the observed relative frequency of success was exactly 0.65. How many trials were unsuccessful?"},"Options":[{"LatexCode":"28","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"35 النسبة المئوية لعدم النجاح لا عدد المحاولات.","En":"35 is the failure percentage, not the trial count."}},{"LatexCode":"52","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"52 عدد النجاحات.","En":"52 is the number of successes."}},{"LatexCode":"65","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"65 النسبة المئوية للنجاح.","En":"65 is the success percentage."}}],"Hints":[{"Ar":"ما التكرار النسبي لعدم النجاح؟","En":"What is the relative frequency of failure?"},{"Ar":"اضرب هذه النسبة في 80.","En":"Multiply that proportion by 80."}],"Solution":{"Idea":{"Ar":"نجد التكرار النسبي للحدث المتمم ثم نضربه في عدد المحاولات.","En":"Find the relative frequency of the complement, then multiply by the trial count."},"FormulaLatex":"N=80(1-0.65)","Steps":[{"Ar":"$1-0.65=0.35$","En":"$1-0.65=0.35$"},{"Ar":"$80\\cdot0.35=28$","En":"$80\\cdot0.35=28$"}],"Substitution":{"Ar":"$N=28$","En":"$N=28$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$52+28=80$","En":"$52+28=80$"},"CommonError":{"Ar":"لا تخلط بين النسبة المئوية وعدد المحاولات.","En":"Do not confuse a percentage with a trial count."}}}$mw$::jsonb,$mw$نجد التكرار النسبي للحدث المتمم ثم نضربه في عدد المحاولات.

$N=80(1-0.65)$

1. $1-0.65=0.35$

2. $80\cdot0.35=28$

$N=28$

$28$

$52+28=80$

لا تخلط بين النسبة المئوية وعدد المحاولات.$mw$,$mw$Find the relative frequency of the complement, then multiply by the trial count.

$N=80(1-0.65)$

1. $1-0.65=0.35$

2. $80\cdot0.35=28$

$N=28$

$28$

$52+28=80$

Do not confuse a percentage with a trial count.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما التكرار النسبي لعدم النجاح؟","En":"What is the relative frequency of failure?"},{"Ar":"اضرب هذه النسبة في 80.","En":"Multiply that proportion by 80."}],"Solution":{"Idea":{"Ar":"نجد التكرار النسبي للحدث المتمم ثم نضربه في عدد المحاولات.","En":"Find the relative frequency of the complement, then multiply by the trial count."},"FormulaLatex":"N=80(1-0.65)","Steps":[{"Ar":"$1-0.65=0.35$","En":"$1-0.65=0.35$"},{"Ar":"$80\\cdot0.35=28$","En":"$80\\cdot0.35=28$"}],"Substitution":{"Ar":"$N=28$","En":"$N=28$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$52+28=80$","En":"$52+28=80$"},"CommonError":{"Ar":"لا تخلط بين النسبة المئوية وعدد المحاولات.","En":"Do not confuse a percentage with a trial count."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"35 النسبة المئوية لعدم النجاح لا عدد المحاولات.","En":"35 is the failure percentage, not the trial count."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"52 عدد النجاحات.","En":"52 is the number of successes."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"65 النسبة المئوية للنجاح.","En":"65 is the success percentage."},"Order":4}]}$mw$),
($mw$growth-v35-grade-11-vector-magnitude-scaled-difference-1$mw$,$mw$vector-magnitude-scaled-difference$mw$,$mw$magnitude$mw$,$mw$grade-11$mw$,11,3,87,339,$mw${"StageId":3,"CategoryId":87,"PrimarySkillId":339,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معيار فرق متجهين","En":"Magnitude of a vector difference"},"Question":{"Ar":"إذا كان u=(5,1) وv=(2,5)، فما معيار المتجه u−v وفق المعيار الإقليدي؟","En":"If u=(5,1) and v=(2,5), what is the Euclidean magnitude of u−v?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 هو مقدار فرق 4 و3 وليس المعيار الإقليدي.","En":"1 is the difference between 4 and 3, not the Euclidean norm."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 مجموع القيم المطلقة لا المعيار الإقليدي.","En":"7 is the sum of absolute components, not the Euclidean norm."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"25 مربع المعيار.","En":"25 is the squared norm."}}],"Hints":[{"Ar":"احسب متجه الفرق أولاً.","En":"Compute the difference vector first."},{"Ar":"ربع كل مركبة واجمع ثم خذ الجذر.","En":"Square each component, add, then take the square root."}],"Solution":{"Idea":{"Ar":"نطرح المركبات المتناظرة ثم نحسب الجذر التربيعي لمجموع مربعاتها.","En":"Subtract corresponding components, then take the square root of their squared sum."},"FormulaLatex":"\\|u-v\\|=\\sqrt{(u_1-v_1)^2+(u_2-v_2)^2}","Steps":[{"Ar":"$u-v=(3,-4)$","En":"$u-v=(3,-4)$"},{"Ar":"$\\sqrt{3^2+(-4)^2}=\\sqrt{25}$","En":"$\\sqrt{3^2+(-4)^2}=\\sqrt{25}$"}],"Substitution":{"Ar":"$\\sqrt{25}=5$","En":"$\\sqrt{25}=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5^2=9+16$","En":"$5^2=9+16$"},"CommonError":{"Ar":"لا تجمع المعايير أو المركبات مباشرة.","En":"Do not simply add norms or components."}}}$mw$::jsonb,$mw$نطرح المركبات المتناظرة ثم نحسب الجذر التربيعي لمجموع مربعاتها.

$\|u-v\|=\sqrt{(u_1-v_1)^2+(u_2-v_2)^2}$

1. $u-v=(3,-4)$

2. $\sqrt{3^2+(-4)^2}=\sqrt{25}$

$\sqrt{25}=5$

$5$

$5^2=9+16$

لا تجمع المعايير أو المركبات مباشرة.$mw$,$mw$Subtract corresponding components, then take the square root of their squared sum.

$\|u-v\|=\sqrt{(u_1-v_1)^2+(u_2-v_2)^2}$

1. $u-v=(3,-4)$

2. $\sqrt{3^2+(-4)^2}=\sqrt{25}$

$\sqrt{25}=5$

$5$

$5^2=9+16$

Do not simply add norms or components.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب متجه الفرق أولاً.","En":"Compute the difference vector first."},{"Ar":"ربع كل مركبة واجمع ثم خذ الجذر.","En":"Square each component, add, then take the square root."}],"Solution":{"Idea":{"Ar":"نطرح المركبات المتناظرة ثم نحسب الجذر التربيعي لمجموع مربعاتها.","En":"Subtract corresponding components, then take the square root of their squared sum."},"FormulaLatex":"\\|u-v\\|=\\sqrt{(u_1-v_1)^2+(u_2-v_2)^2}","Steps":[{"Ar":"$u-v=(3,-4)$","En":"$u-v=(3,-4)$"},{"Ar":"$\\sqrt{3^2+(-4)^2}=\\sqrt{25}$","En":"$\\sqrt{3^2+(-4)^2}=\\sqrt{25}$"}],"Substitution":{"Ar":"$\\sqrt{25}=5$","En":"$\\sqrt{25}=5$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5^2=9+16$","En":"$5^2=9+16$"},"CommonError":{"Ar":"لا تجمع المعايير أو المركبات مباشرة.","En":"Do not simply add norms or components."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1 هو مقدار فرق 4 و3 وليس المعيار الإقليدي.","En":"1 is the difference between 4 and 3, not the Euclidean norm."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"7 مجموع القيم المطلقة لا المعيار الإقليدي.","En":"7 is the sum of absolute components, not the Euclidean norm."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"25 مربع المعيار.","En":"25 is the squared norm."},"Order":4}]}$mw$),
($mw$growth-v35-grade-12-circle-point-inside-outside-squared-distance-1$mw$,$mw$circle-point-inside-outside-squared-distance$mw$,$mw$circles$mw$,$mw$grade-12$mw$,12,3,88,328,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":328,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"موقع نقطة بالنسبة إلى دائرة","En":"Point position relative to a circle"},"Question":{"Ar":"الدائرة معادلتها $(x-1)^2+(y+2)^2=25$. أي نقطة من الخيارات تقع داخل الدائرة تماماً، لا على محيطها؟","En":"The circle has equation $(x-1)^2+(y+2)^2=25$. Which point lies strictly inside the circle, not on its circumference?"},"Options":[{"LatexCode":"(6,-2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع المسافة 25؛ تقع على المحيط.","En":"Squared distance is 25, so it lies on the circumference."}},{"LatexCode":"(1,4)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع المسافة 36؛ تقع خارج الدائرة.","En":"Squared distance is 36, so it lies outside."}},{"LatexCode":"(3,1)","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"(-4,-2)","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"مربع المسافة 25؛ تقع على المحيط.","En":"Squared distance is 25, so it lies on the circumference."}}],"Hints":[{"Ar":"اقرأ المركز ومربع نصف القطر من المعادلة.","En":"Read the centre and squared radius from the equation."},{"Ar":"اختبر مربع المسافة لكل خيار.","En":"Test the squared distance for each option."}],"Solution":{"Idea":{"Ar":"تكون النقطة داخل الدائرة تماماً عندما يكون مربع بعدها عن المركز أقل من مربع نصف القطر.","En":"A point is strictly inside when its squared distance from the centre is less than the squared radius."},"FormulaLatex":"(x-1)^2+(y+2)^2<25","Steps":[{"Ar":"المركز (1,−2) ومربع نصف القطر 25.","En":"The centre is (1,−2) and squared radius is 25."},{"Ar":"$(3-1)^2+(1+2)^2=4+9=13$","En":"$(3-1)^2+(1+2)^2=4+9=13$"}],"Substitution":{"Ar":"$13<25$","En":"$13<25$"},"Result":{"Ar":"$(3,1)$","En":"$(3,1)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$25,36,13,25$","En":"$25,36,13,25$"},"CommonError":{"Ar":"لا تعد النقاط التي تحقق المساواة نقاطاً داخلية.","En":"Do not count boundary points as interior."}}}$mw$::jsonb,$mw$تكون النقطة داخل الدائرة تماماً عندما يكون مربع بعدها عن المركز أقل من مربع نصف القطر.

$(x-1)^2+(y+2)^2<25$

1. المركز (1,−2) ومربع نصف القطر 25.

2. $(3-1)^2+(1+2)^2=4+9=13$

$13<25$

$(3,1)$

$25,36,13,25$

لا تعد النقاط التي تحقق المساواة نقاطاً داخلية.$mw$,$mw$A point is strictly inside when its squared distance from the centre is less than the squared radius.

$(x-1)^2+(y+2)^2<25$

1. The centre is (1,−2) and squared radius is 25.

2. $(3-1)^2+(1+2)^2=4+9=13$

$13<25$

$(3,1)$

$25,36,13,25$

Do not count boundary points as interior.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقرأ المركز ومربع نصف القطر من المعادلة.","En":"Read the centre and squared radius from the equation."},{"Ar":"اختبر مربع المسافة لكل خيار.","En":"Test the squared distance for each option."}],"Solution":{"Idea":{"Ar":"تكون النقطة داخل الدائرة تماماً عندما يكون مربع بعدها عن المركز أقل من مربع نصف القطر.","En":"A point is strictly inside when its squared distance from the centre is less than the squared radius."},"FormulaLatex":"(x-1)^2+(y+2)^2<25","Steps":[{"Ar":"المركز (1,−2) ومربع نصف القطر 25.","En":"The centre is (1,−2) and squared radius is 25."},{"Ar":"$(3-1)^2+(1+2)^2=4+9=13$","En":"$(3-1)^2+(1+2)^2=4+9=13$"}],"Substitution":{"Ar":"$13<25$","En":"$13<25$"},"Result":{"Ar":"$(3,1)$","En":"$(3,1)$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$25,36,13,25$","En":"$25,36,13,25$"},"CommonError":{"Ar":"لا تعد النقاط التي تحقق المساواة نقاطاً داخلية.","En":"Do not count boundary points as interior."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"مربع المسافة 25؛ تقع على المحيط.","En":"Squared distance is 25, so it lies on the circumference."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"مربع المسافة 36؛ تقع خارج الدائرة.","En":"Squared distance is 36, so it lies outside."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"مربع المسافة 25؛ تقع على المحيط.","En":"Squared distance is 25, so it lies on the circumference."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v35 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
