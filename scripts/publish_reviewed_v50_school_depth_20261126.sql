-- One-time owner-authorized v50 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v50-grade-3-fraction-model-number-line-denominator-inference-1$mw$,$mw$fraction-model-number-line-denominator-inference$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"استنتاج عدد التقسيمات","En":"Inferring the number of divisions"},"Question":{"Ar":"على خط الأعداد، قُسمت المسافة من 0 إلى 1 إلى أجزاء متساوية. تقع العلامة الثالثة بعد الصفر عند 3/7. كم جزءاً متساوياً في الوحدة؟","En":"On a number line, the interval from 0 to 1 is divided equally. The third tick after zero is at 3/7. How many equal intervals make one unit?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الخطوات إلى العلامة المعطاة.","En":"This is the number of steps to the given tick."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الخطوات الباقية إلى 1.","En":"This is the number of remaining steps to one."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"10","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا يجمع البسط والمقام دون مبرر.","En":"This adds numerator and denominator without justification."}}],"Hints":[{"Ar":"كل انتقال يمثل جزءاً واحداً.","En":"Each step represents one part."},{"Ar":"انظر إلى مقام الكسر.","En":"Look at the denominator."}],"Solution":{"Idea":{"Ar":"المقام يحدد عدد الأجزاء المتساوية في الوحدة.","En":"The denominator gives the number of equal intervals per unit."},"FormulaLatex":"1=7\\cdot\\frac17","Steps":[{"Ar":"$3\\cdot(1/7)=3/7$","En":"$3\\cdot(1/7)=3/7$"},{"Ar":"$7\\cdot(1/7)=1$","En":"$7\\cdot(1/7)=1$"}],"Substitution":{"Ar":"$7\\cdot(1/7)=1$","En":"$7\\cdot(1/7)=1$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7/7=1$","En":"$7/7=1$"},"CommonError":{"Ar":"لا تخلط عدد الأجزاء المأخوذة بعدد أجزاء الوحدة.","En":"Do not confuse selected parts with parts in the whole."}}}$mw$::jsonb,$mw$المقام يحدد عدد الأجزاء المتساوية في الوحدة.

$1=7\cdot\frac17$

1. $3\cdot(1/7)=3/7$

2. $7\cdot(1/7)=1$

$7\cdot(1/7)=1$

$7$

$7/7=1$

لا تخلط عدد الأجزاء المأخوذة بعدد أجزاء الوحدة.$mw$,$mw$The denominator gives the number of equal intervals per unit.

$1=7\cdot\frac17$

1. $3\cdot(1/7)=3/7$

2. $7\cdot(1/7)=1$

$7\cdot(1/7)=1$

$7$

$7/7=1$

Do not confuse selected parts with parts in the whole.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"كل انتقال يمثل جزءاً واحداً.","En":"Each step represents one part."},{"Ar":"انظر إلى مقام الكسر.","En":"Look at the denominator."}],"Solution":{"Idea":{"Ar":"المقام يحدد عدد الأجزاء المتساوية في الوحدة.","En":"The denominator gives the number of equal intervals per unit."},"FormulaLatex":"1=7\\cdot\\frac17","Steps":[{"Ar":"$3\\cdot(1/7)=3/7$","En":"$3\\cdot(1/7)=3/7$"},{"Ar":"$7\\cdot(1/7)=1$","En":"$7\\cdot(1/7)=1$"}],"Substitution":{"Ar":"$7\\cdot(1/7)=1$","En":"$7\\cdot(1/7)=1$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7/7=1$","En":"$7/7=1$"},"CommonError":{"Ar":"لا تخلط عدد الأجزاء المأخوذة بعدد أجزاء الوحدة.","En":"Do not confuse selected parts with parts in the whole."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الخطوات إلى العلامة المعطاة.","En":"This is the number of steps to the given tick."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد الخطوات الباقية إلى 1.","En":"This is the number of remaining steps to one."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا يجمع البسط والمقام دون مبرر.","En":"This adds numerator and denominator without justification."},"Order":4}]}$mw$),
($mw$growth-v50-grade-3-time-three-activities-total-in-minutes-1$mw$,$mw$time-three-activities-total-in-minutes$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":1,"Points":10,"Title":{"Ar":"جمع مدد الأنشطة","En":"Combining activity durations"},"Question":{"Ar":"استغرقت ثلاثة أنشطة متتابعة 25 دقيقة و20 دقيقة و30 دقيقة دون فواصل. كم دقيقة استغرقت كلها؟","En":"Three consecutive activities last 25, 20 and 30 minutes with no breaks. How many minutes do they take altogether?"},"Options":[{"LatexCode":"45","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل النشاط الثالث.","En":"Omits the third activity."}},{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل النشاط الأول.","En":"Omits the first activity."}},{"LatexCode":"75","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"85","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يزيد على مجموع المدد بعشر دقائق.","En":"Exceeds the total by ten minutes."}}],"Hints":[{"Ar":"اجمع مدتي أول نشاطين.","En":"Add the first two durations."},{"Ar":"أضف مدة النشاط الثالث.","En":"Add the third duration."}],"Solution":{"Idea":{"Ar":"نجمع المدد لأنها متتابعة ولا تتداخل.","En":"Add the durations because the activities are consecutive and do not overlap."},"FormulaLatex":"T=25+20+30","Steps":[{"Ar":"$25+20=45$","En":"$25+20=45$"},{"Ar":"$45+30=75$","En":"$45+30=75$"}],"Substitution":{"Ar":"$45+30=75$","En":"$45+30=75$"},"Result":{"Ar":"$75$","En":"$75$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$75-30=45$","En":"$75-30=45$"},"CommonError":{"Ar":"لا تسقط مدة أحد الأنشطة عند الجمع.","En":"Do not omit an activity when adding."}}}$mw$::jsonb,$mw$نجمع المدد لأنها متتابعة ولا تتداخل.

$T=25+20+30$

1. $25+20=45$

2. $45+30=75$

$45+30=75$

$75$ دقيقة

$75-30=45$

لا تسقط مدة أحد الأنشطة عند الجمع.$mw$,$mw$Add the durations because the activities are consecutive and do not overlap.

$T=25+20+30$

1. $25+20=45$

2. $45+30=75$

$45+30=75$

$75$ minutes

$75-30=45$

Do not omit an activity when adding.$mw$,$mw${"DifficultyLevel":1,"Hints":[{"Ar":"اجمع مدتي أول نشاطين.","En":"Add the first two durations."},{"Ar":"أضف مدة النشاط الثالث.","En":"Add the third duration."}],"Solution":{"Idea":{"Ar":"نجمع المدد لأنها متتابعة ولا تتداخل.","En":"Add the durations because the activities are consecutive and do not overlap."},"FormulaLatex":"T=25+20+30","Steps":[{"Ar":"$25+20=45$","En":"$25+20=45$"},{"Ar":"$45+30=75$","En":"$45+30=75$"}],"Substitution":{"Ar":"$45+30=75$","En":"$45+30=75$"},"Result":{"Ar":"$75$","En":"$75$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$75-30=45$","En":"$75-30=45$"},"CommonError":{"Ar":"لا تسقط مدة أحد الأنشطة عند الجمع.","En":"Do not omit an activity when adding."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يهمل النشاط الثالث.","En":"Omits the third activity."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يهمل النشاط الأول.","En":"Omits the first activity."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يزيد على مجموع المدد بعشر دقائق.","En":"Exceeds the total by ten minutes."},"Order":4}]}$mw$),
($mw$growth-v50-grade-4-addition-sum-parity-two-odd-addends-1$mw$,$mw$addition-sum-parity-two-odd-addends$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"زوجية مجموع عددين فرديين","En":"Parity of the sum of two odd numbers"},"Question":{"Ar":"أي مجموع من الخيارات يجب أن يكون زوجياً لأنه يتكون من عددين فرديين؟","En":"Which sum must be even because both its addends are odd?"},"Options":[{"LatexCode":"146+217","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"146 زوجي و217 فردي.","En":"146 is even and 217 is odd."}},{"LatexCode":"135+289","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"122+183","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"122 زوجي و183 فردي.","En":"122 is even and 183 is odd."}},{"LatexCode":"214+97","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"214 زوجي و97 فردي.","En":"214 is even and 97 is odd."}}],"Hints":[{"Ar":"انظر إلى رقم الآحاد في كل عدد.","En":"Inspect the ones digit of each number."},{"Ar":"ابحث عن رقمَي آحاد فرديين.","En":"Find two odd ones digits."}],"Solution":{"Idea":{"Ar":"جمع عددين فرديين يعطي عدداً زوجياً لأن الآحاد الفردية تتزاوج.","En":"The sum of two odd numbers is even because their unpaired units form a pair."},"FormulaLatex":"135+289=424","Steps":[{"Ar":"$135+289=424$","En":"$135+289=424$"},{"Ar":"$424=2\\cdot212$","En":"$424=2\\cdot212$"}],"Substitution":{"Ar":"$424=2\\cdot212$","En":"$424=2\\cdot212$"},"Result":{"Ar":"$135+289$","En":"$135+289$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$424=2\\cdot212$","En":"$424=2\\cdot212$"},"CommonError":{"Ar":"لا يكفي أن يكون أحد العددين فردياً.","En":"One odd addend alone is not sufficient."}}}$mw$::jsonb,$mw$جمع عددين فرديين يعطي عدداً زوجياً لأن الآحاد الفردية تتزاوج.

$135+289=424$

1. $135+289=424$

2. $424=2\cdot212$

$424=2\cdot212$

$135+289$

$424=2\cdot212$

لا يكفي أن يكون أحد العددين فردياً.$mw$,$mw$The sum of two odd numbers is even because their unpaired units form a pair.

$135+289=424$

1. $135+289=424$

2. $424=2\cdot212$

$424=2\cdot212$

$135+289$

$424=2\cdot212$

One odd addend alone is not sufficient.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"انظر إلى رقم الآحاد في كل عدد.","En":"Inspect the ones digit of each number."},{"Ar":"ابحث عن رقمَي آحاد فرديين.","En":"Find two odd ones digits."}],"Solution":{"Idea":{"Ar":"جمع عددين فرديين يعطي عدداً زوجياً لأن الآحاد الفردية تتزاوج.","En":"The sum of two odd numbers is even because their unpaired units form a pair."},"FormulaLatex":"135+289=424","Steps":[{"Ar":"$135+289=424$","En":"$135+289=424$"},{"Ar":"$424=2\\cdot212$","En":"$424=2\\cdot212$"}],"Substitution":{"Ar":"$424=2\\cdot212$","En":"$424=2\\cdot212$"},"Result":{"Ar":"$135+289$","En":"$135+289$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$424=2\\cdot212$","En":"$424=2\\cdot212$"},"CommonError":{"Ar":"لا يكفي أن يكون أحد العددين فردياً.","En":"One odd addend alone is not sufficient."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"146 زوجي و217 فردي.","En":"146 is even and 217 is odd."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"122 زوجي و183 فردي.","En":"122 is even and 183 is odd."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"214 زوجي و97 فردي.","En":"214 is even and 97 is odd."},"Order":4}]}$mw$),
($mw$growth-v50-grade-4-addition-total-comparison-disjoint-shifts-1$mw$,$mw$addition-total-comparison-disjoint-shifts$mw$,$mw$primary-addition$mw$,$mw$grade-4$mw$,4,1,1,1,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":1,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقارنة مجموعين بعد تغير العددين","En":"Comparing sums after two changes"},"Question":{"Ar":"إذا زاد أحد عددين بمقدار 40 ونقص الآخر بمقدار 15، فبكم يزيد مجموعهما الجديد على مجموعهما الأصلي؟","En":"One addend increases by 40 and the other decreases by 15. By how much does the new sum exceed the original sum?"},"Options":[{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار النقص وحده.","En":"This is the decrease alone."}},{"LatexCode":"25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل النقص.","En":"Ignores the decrease."}},{"LatexCode":"55","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يجمع مقدارَي التغير كأنهما زيادتان.","En":"Treats both changes as increases."}}],"Hints":[{"Ar":"الزيادة تضيف 40 إلى المجموع.","En":"The increase adds forty to the sum."},{"Ar":"النقص يزيل 15 من المجموع.","En":"The decrease removes fifteen from the sum."}],"Solution":{"Idea":{"Ar":"صافي تغير المجموع هو مجموع التغيرين مع إشاراتهما.","En":"The net change in the sum is the sum of the signed changes."},"FormulaLatex":"40-15","Steps":[{"Ar":"$40-15=25$","En":"$40-15=25$"}],"Substitution":{"Ar":"$40-15=25$","En":"$40-15=25$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(100+40)+(100-15)-200=25$","En":"$(100+40)+(100-15)-200=25$"},"CommonError":{"Ar":"لا تجمع الزيادة والنقص بإشارة واحدة.","En":"Do not treat an increase and decrease as the same sign."}}}$mw$::jsonb,$mw$صافي تغير المجموع هو مجموع التغيرين مع إشاراتهما.

$40-15$

1. $40-15=25$

$40-15=25$

$25$

$(100+40)+(100-15)-200=25$

لا تجمع الزيادة والنقص بإشارة واحدة.$mw$,$mw$The net change in the sum is the sum of the signed changes.

$40-15$

1. $40-15=25$

$40-15=25$

$25$

$(100+40)+(100-15)-200=25$

Do not treat an increase and decrease as the same sign.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"الزيادة تضيف 40 إلى المجموع.","En":"The increase adds forty to the sum."},{"Ar":"النقص يزيل 15 من المجموع.","En":"The decrease removes fifteen from the sum."}],"Solution":{"Idea":{"Ar":"صافي تغير المجموع هو مجموع التغيرين مع إشاراتهما.","En":"The net change in the sum is the sum of the signed changes."},"FormulaLatex":"40-15","Steps":[{"Ar":"$40-15=25$","En":"$40-15=25$"}],"Substitution":{"Ar":"$40-15=25$","En":"$40-15=25$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$(100+40)+(100-15)-200=25$","En":"$(100+40)+(100-15)-200=25$"},"CommonError":{"Ar":"لا تجمع الزيادة والنقص بإشارة واحدة.","En":"Do not treat an increase and decrease as the same sign."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار النقص وحده.","En":"This is the decrease alone."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يهمل النقص.","En":"Ignores the decrease."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يجمع مقدارَي التغير كأنهما زيادتان.","En":"Treats both changes as increases."},"Order":4}]}$mw$),
($mw$growth-v50-grade-4-one-step-unknown-divisor-equal-sharing-1$mw$,$mw$one-step-unknown-divisor-equal-sharing$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"مقسوم عليه مجهول","En":"Unknown divisor"},"Question":{"Ar":"وزعت 84 بطاقة بالتساوي على عدد مجهول n من المجموعات، فكانت في كل مجموعة 7 بطاقات. ما n؟","En":"Eighty-four cards are shared equally among an unknown number n of groups. Each group contains seven cards. Find n."},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حجم المجموعة لا عددها.","En":"This is the group size, not its count."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"77","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينتج من الطرح بدلاً من القسمة.","En":"Uses subtraction instead of division."}},{"LatexCode":"588","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ينتج من الضرب بدلاً من القسمة.","En":"Uses multiplication instead of division."}}],"Hints":[{"Ar":"اكتب 84 على صورة سبعة مضروبة في عدد المجموعات.","En":"Write 84 as seven times the number of groups."},{"Ar":"اقسم 84 على سبعة.","En":"Divide 84 by seven."}],"Solution":{"Idea":{"Ar":"عدد المجموعات يساوي الكل مقسوماً على عدد البطاقات في كل مجموعة.","En":"The number of groups is the total divided by the group size."},"FormulaLatex":"84=7n","Steps":[{"Ar":"$n=84/7$","En":"$n=84/7$"},{"Ar":"$n=12$","En":"$n=12$"}],"Substitution":{"Ar":"$n=12$","En":"$n=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot7=84$","En":"$12\\cdot7=84$"},"CommonError":{"Ar":"فرّق بين عدد المجموعات وعدد العناصر في كل مجموعة.","En":"Distinguish group count from group size."}}}$mw$::jsonb,$mw$عدد المجموعات يساوي الكل مقسوماً على عدد البطاقات في كل مجموعة.

$84=7n$

1. $n=84/7$

2. $n=12$

$n=12$

$12$

$12\cdot7=84$

فرّق بين عدد المجموعات وعدد العناصر في كل مجموعة.$mw$,$mw$The number of groups is the total divided by the group size.

$84=7n$

1. $n=84/7$

2. $n=12$

$n=12$

$12$

$12\cdot7=84$

Distinguish group count from group size.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب 84 على صورة سبعة مضروبة في عدد المجموعات.","En":"Write 84 as seven times the number of groups."},{"Ar":"اقسم 84 على سبعة.","En":"Divide 84 by seven."}],"Solution":{"Idea":{"Ar":"عدد المجموعات يساوي الكل مقسوماً على عدد البطاقات في كل مجموعة.","En":"The number of groups is the total divided by the group size."},"FormulaLatex":"84=7n","Steps":[{"Ar":"$n=84/7$","En":"$n=84/7$"},{"Ar":"$n=12$","En":"$n=12$"}],"Substitution":{"Ar":"$n=12$","En":"$n=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$12\\cdot7=84$","En":"$12\\cdot7=84$"},"CommonError":{"Ar":"فرّق بين عدد المجموعات وعدد العناصر في كل مجموعة.","En":"Distinguish group count from group size."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا حجم المجموعة لا عددها.","En":"This is the group size, not its count."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"ينتج من الطرح بدلاً من القسمة.","En":"Uses subtraction instead of division."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ينتج من الضرب بدلاً من القسمة.","En":"Uses multiplication instead of division."},"Order":4}]}$mw$),
($mw$growth-v50-grade-4-length-conversion-remainder-after-cut-1$mw$,$mw$length-conversion-remainder-after-cut$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"طول متبق بعد القص","En":"Remaining length after cutting"},"Question":{"Ar":"حبل طوله 2 م، قُص منه 75 سم. كم سنتيمتراً بقي؟","En":"A rope is 2 m long. A 75 cm piece is cut off. How many centimetres remain?"},"Options":[{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يتعامل مع الحبل كأنه متر واحد.","En":"Treats the rope as one metre long."}},{"LatexCode":"125","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"175","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يطرح 75 كاملة.","En":"Does not subtract the full 75."}},{"LatexCode":"275","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضيف القطعة بدلاً من طرحها.","En":"Adds the piece instead of removing it."}}],"Hints":[{"Ar":"حوّل المترين إلى سنتيمترات.","En":"Convert two metres to centimetres."},{"Ar":"اطرح 75 من الناتج.","En":"Subtract 75 from the result."}],"Solution":{"Idea":{"Ar":"نوحد الوحدة قبل طرح طول القطعة.","En":"Convert to the same unit before subtracting the piece."},"FormulaLatex":"200-75","Steps":[{"Ar":"$2\\cdot100=200$","En":"$2\\cdot100=200$"},{"Ar":"$200-75=125$","En":"$200-75=125$"}],"Substitution":{"Ar":"$200-75=125$","En":"$200-75=125$"},"Result":{"Ar":"$125$","En":"$125$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$125+75=200$","En":"$125+75=200$"},"CommonError":{"Ar":"لا تطرح السنتيمترات من الأمتار مباشرة.","En":"Do not subtract centimetres directly from metres."}}}$mw$::jsonb,$mw$نوحد الوحدة قبل طرح طول القطعة.

$200-75$

1. $2\cdot100=200$

2. $200-75=125$

$200-75=125$

$125$ سم

$125+75=200$

لا تطرح السنتيمترات من الأمتار مباشرة.$mw$,$mw$Convert to the same unit before subtracting the piece.

$200-75$

1. $2\cdot100=200$

2. $200-75=125$

$200-75=125$

$125$ cm

$125+75=200$

Do not subtract centimetres directly from metres.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل المترين إلى سنتيمترات.","En":"Convert two metres to centimetres."},{"Ar":"اطرح 75 من الناتج.","En":"Subtract 75 from the result."}],"Solution":{"Idea":{"Ar":"نوحد الوحدة قبل طرح طول القطعة.","En":"Convert to the same unit before subtracting the piece."},"FormulaLatex":"200-75","Steps":[{"Ar":"$2\\cdot100=200$","En":"$2\\cdot100=200$"},{"Ar":"$200-75=125$","En":"$200-75=125$"}],"Substitution":{"Ar":"$200-75=125$","En":"$200-75=125$"},"Result":{"Ar":"$125$","En":"$125$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"$125+75=200$","En":"$125+75=200$"},"CommonError":{"Ar":"لا تطرح السنتيمترات من الأمتار مباشرة.","En":"Do not subtract centimetres directly from metres."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يتعامل مع الحبل كأنه متر واحد.","En":"Treats the rope as one metre long."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"لا يطرح 75 كاملة.","En":"Does not subtract the full 75."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يضيف القطعة بدلاً من طرحها.","En":"Adds the piece instead of removing it."},"Order":4}]}$mw$),
($mw$growth-v50-grade-4-length-conversion-unit-choice-order-1$mw$,$mw$length-conversion-unit-choice-order$mw$,$mw$primary-unit-conversions$mw$,$mw$grade-4$mw$,4,1,3,16,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":16,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ترتيب أطوال بوحدات مختلفة","En":"Ordering lengths in mixed units"},"Question":{"Ar":"أي الأطوال التالية هو الأكبر: 98 سم، 1 م، 1050 ملم، 99 سم؟","En":"Which length is greatest: 98 cm, 1 m, 1050 mm or 99 cm?"},"Options":[{"LatexCode":"98\\,\\mathrm{cm}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"98 أصغر من 105 بعد توحيد الوحدات.","En":"98 is below 105 after conversion."}},{"LatexCode":"1\\,\\mathrm{m}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"المتر 100 سم فقط.","En":"One metre is only 100 cm."}},{"LatexCode":"1050\\,\\mathrm{mm}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"99\\,\\mathrm{cm}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"99 سم أصغر من 105 سم.","En":"99 cm is shorter than 105 cm."}}],"Hints":[{"Ar":"المتر مئة سنتيمتر.","En":"One metre is one hundred centimetres."},{"Ar":"اقسم المليمترات على عشرة.","En":"Divide millimetres by ten."}],"Solution":{"Idea":{"Ar":"نحول كل طول إلى سنتيمترات للمقارنة.","En":"Express each length in centimetres to compare."},"FormulaLatex":"1\\,\\mathrm m=100\\,\\mathrm{cm},\\quad10\\,\\mathrm{mm}=1\\,\\mathrm{cm}","Steps":[{"Ar":"$1050/10=105$","En":"$1050/10=105$"},{"Ar":"$98<99<100<105$","En":"$98<99<100<105$"}],"Substitution":{"Ar":"$98<99<100<105$","En":"$98<99<100<105$"},"Result":{"Ar":"$1050\\,\\mathrm{mm}$","En":"$1050\\,\\mathrm{mm}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$105\\cdot10=1050$","En":"$105\\cdot10=1050$"},"CommonError":{"Ar":"لا تقارن الأرقام المجردة إذا اختلفت الوحدات.","En":"Do not compare raw numbers in different units."}}}$mw$::jsonb,$mw$نحول كل طول إلى سنتيمترات للمقارنة.

$1\,\mathrm m=100\,\mathrm{cm},\quad10\,\mathrm{mm}=1\,\mathrm{cm}$

1. $1050/10=105$

2. $98<99<100<105$

$98<99<100<105$

$1050\,\mathrm{mm}$

$105\cdot10=1050$

لا تقارن الأرقام المجردة إذا اختلفت الوحدات.$mw$,$mw$Express each length in centimetres to compare.

$1\,\mathrm m=100\,\mathrm{cm},\quad10\,\mathrm{mm}=1\,\mathrm{cm}$

1. $1050/10=105$

2. $98<99<100<105$

$98<99<100<105$

$1050\,\mathrm{mm}$

$105\cdot10=1050$

Do not compare raw numbers in different units.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"المتر مئة سنتيمتر.","En":"One metre is one hundred centimetres."},{"Ar":"اقسم المليمترات على عشرة.","En":"Divide millimetres by ten."}],"Solution":{"Idea":{"Ar":"نحول كل طول إلى سنتيمترات للمقارنة.","En":"Express each length in centimetres to compare."},"FormulaLatex":"1\\,\\mathrm m=100\\,\\mathrm{cm},\\quad10\\,\\mathrm{mm}=1\\,\\mathrm{cm}","Steps":[{"Ar":"$1050/10=105$","En":"$1050/10=105$"},{"Ar":"$98<99<100<105$","En":"$98<99<100<105$"}],"Substitution":{"Ar":"$98<99<100<105$","En":"$98<99<100<105$"},"Result":{"Ar":"$1050\\,\\mathrm{mm}$","En":"$1050\\,\\mathrm{mm}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$105\\cdot10=1050$","En":"$105\\cdot10=1050$"},"CommonError":{"Ar":"لا تقارن الأرقام المجردة إذا اختلفت الوحدات.","En":"Do not compare raw numbers in different units."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"98 أصغر من 105 بعد توحيد الوحدات.","En":"98 is below 105 after conversion."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"المتر 100 سم فقط.","En":"One metre is only 100 cm."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"99 سم أصغر من 105 سم.","En":"99 cm is shorter than 105 cm."},"Order":4}]}$mw$),
($mw$growth-v50-grade-5-multiplication-trailing-zero-factorization-1$mw$,$mw$multiplication-trailing-zero-factorization$mw$,$mw$primary-multiplication$mw$,$mw$grade-5$mw$,5,1,33,4,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":4,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الأصفار النهائية في حاصل الضرب","En":"Trailing zeros in a product"},"Question":{"Ar":"كم صفراً في نهاية العدد الناتج من 125×80؟","En":"How many trailing zeros does the product 125×80 have?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يهمل ثلاثة أصفار من 1000.","En":"Omits the three zeros from 1000."}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدد الأصفار أقل من الناتج الفعلي.","En":"Counts fewer zeros than the product has."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يحسب أصفار 1000 قبل الضرب في 10.","En":"Counts zeros in 1000 before multiplying by ten."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"افصل 80 إلى 8×10.","En":"Split 80 into 8×10."},{"Ar":"احسب 125×8 ثم أضف عامل العشرة.","En":"Calculate 125×8, then include the factor ten."}],"Solution":{"Idea":{"Ar":"نبحث عن مجموعات عوامل حاصل ضربها عشرة؛ هنا حاصل الضرب 10000.","En":"Identify factors that form tens; here the product is 10000."},"FormulaLatex":"125\\cdot80=(125\\cdot8)\\cdot10","Steps":[{"Ar":"$125\\cdot8=1000$","En":"$125\\cdot8=1000$"},{"Ar":"$1000\\cdot10=10000$","En":"$1000\\cdot10=10000$"}],"Substitution":{"Ar":"$1000\\cdot10=10000$","En":"$1000\\cdot10=10000$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10000/80=125$","En":"$10000/80=125$"},"CommonError":{"Ar":"لا تعتمد فقط على الأصفار الظاهرة في العاملين.","En":"Do not count only the visible zeros in the factors."}}}$mw$::jsonb,$mw$نبحث عن مجموعات عوامل حاصل ضربها عشرة؛ هنا حاصل الضرب 10000.

$125\cdot80=(125\cdot8)\cdot10$

1. $125\cdot8=1000$

2. $1000\cdot10=10000$

$1000\cdot10=10000$

$4$

$10000/80=125$

لا تعتمد فقط على الأصفار الظاهرة في العاملين.$mw$,$mw$Identify factors that form tens; here the product is 10000.

$125\cdot80=(125\cdot8)\cdot10$

1. $125\cdot8=1000$

2. $1000\cdot10=10000$

$1000\cdot10=10000$

$4$

$10000/80=125$

Do not count only the visible zeros in the factors.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"افصل 80 إلى 8×10.","En":"Split 80 into 8×10."},{"Ar":"احسب 125×8 ثم أضف عامل العشرة.","En":"Calculate 125×8, then include the factor ten."}],"Solution":{"Idea":{"Ar":"نبحث عن مجموعات عوامل حاصل ضربها عشرة؛ هنا حاصل الضرب 10000.","En":"Identify factors that form tens; here the product is 10000."},"FormulaLatex":"125\\cdot80=(125\\cdot8)\\cdot10","Steps":[{"Ar":"$125\\cdot8=1000$","En":"$125\\cdot8=1000$"},{"Ar":"$1000\\cdot10=10000$","En":"$1000\\cdot10=10000$"}],"Substitution":{"Ar":"$1000\\cdot10=10000$","En":"$1000\\cdot10=10000$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10000/80=125$","En":"$10000/80=125$"},"CommonError":{"Ar":"لا تعتمد فقط على الأصفار الظاهرة في العاملين.","En":"Do not count only the visible zeros in the factors."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يهمل ثلاثة أصفار من 1000.","En":"Omits the three zeros from 1000."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدد الأصفار أقل من الناتج الفعلي.","En":"Counts fewer zeros than the product has."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يحسب أصفار 1000 قبل الضرب في 10.","En":"Counts zeros in 1000 before multiplying by ten."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v50-grade-5-multiplication-grouped-discount-savings-1$mw$,$mw$multiplication-grouped-discount-savings$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-5$mw$,5,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"التوفير عند شراء مجموعات","En":"Savings from group purchases"},"Question":{"Ar":"تباع العبوة الواحدة بسعر 13 وحدة نقدية، وتباع مجموعة من 4 عبوات بسعر 48 وحدة. كم يوفر شراء ثلاث مجموعات مقارنة بشراء 12 عبوة منفردة؟","En":"One pack costs 13 currency units, while a group of four costs 48. How much is saved by buying three groups instead of twelve individual packs?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا توفير مجموعة واحدة.","En":"This saves for one group only."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضاعف التوفير ثلاث مرات إضافية.","En":"Triples the total savings again."}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا سعر مجموعة وليس التوفير.","En":"This is a group price, not savings."}}],"Hints":[{"Ar":"احسب سعر أربع عبوات منفردة.","En":"Find the price of four individual packs."},{"Ar":"ضاعف توفير المجموعة ثلاث مرات.","En":"Triple the savings per group."}],"Solution":{"Idea":{"Ar":"نحسب التوفير في مجموعة واحدة ثم نضربه في عدد المجموعات.","En":"Calculate savings per group and multiply by the number of groups."},"FormulaLatex":"3(4\\cdot13-48)","Steps":[{"Ar":"$4\\cdot13=52$","En":"$4\\cdot13=52$"},{"Ar":"$52-48=4$","En":"$52-48=4$"},{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"}],"Substitution":{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"وحدة نقدية","En":"currency units"},"Verification":{"Ar":"$12\\cdot13-3\\cdot48=12$","En":"$12\\cdot13-3\\cdot48=12$"},"CommonError":{"Ar":"قارن كميتين متساويتين من العبوات.","En":"Compare equal quantities of packs."}}}$mw$::jsonb,$mw$نحسب التوفير في مجموعة واحدة ثم نضربه في عدد المجموعات.

$3(4\cdot13-48)$

1. $4\cdot13=52$

2. $52-48=4$

3. $3\cdot4=12$

$3\cdot4=12$

$12$ وحدة نقدية

$12\cdot13-3\cdot48=12$

قارن كميتين متساويتين من العبوات.$mw$,$mw$Calculate savings per group and multiply by the number of groups.

$3(4\cdot13-48)$

1. $4\cdot13=52$

2. $52-48=4$

3. $3\cdot4=12$

$3\cdot4=12$

$12$ currency units

$12\cdot13-3\cdot48=12$

Compare equal quantities of packs.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب سعر أربع عبوات منفردة.","En":"Find the price of four individual packs."},{"Ar":"ضاعف توفير المجموعة ثلاث مرات.","En":"Triple the savings per group."}],"Solution":{"Idea":{"Ar":"نحسب التوفير في مجموعة واحدة ثم نضربه في عدد المجموعات.","En":"Calculate savings per group and multiply by the number of groups."},"FormulaLatex":"3(4\\cdot13-48)","Steps":[{"Ar":"$4\\cdot13=52$","En":"$4\\cdot13=52$"},{"Ar":"$52-48=4$","En":"$52-48=4$"},{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"}],"Substitution":{"Ar":"$3\\cdot4=12$","En":"$3\\cdot4=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"وحدة نقدية","En":"currency units"},"Verification":{"Ar":"$12\\cdot13-3\\cdot48=12$","En":"$12\\cdot13-3\\cdot48=12$"},"CommonError":{"Ar":"قارن كميتين متساويتين من العبوات.","En":"Compare equal quantities of packs."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذا توفير مجموعة واحدة.","En":"This saves for one group only."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يضاعف التوفير ثلاث مرات إضافية.","En":"Triples the total savings again."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا سعر مجموعة وليس التوفير.","En":"This is a group price, not savings."},"Order":4}]}$mw$),
($mw$growth-v50-grade-5-estimation-choose-operation-compatible-numbers-1$mw$,$mw$estimation-choose-operation-compatible-numbers$mw$,$mw$estimation$mw$,$mw$grade-5$mw$,5,1,81,303,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":303,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختيار تقدير حاصل الضرب","En":"Choosing a product estimate"},"Question":{"Ar":"أي تقدير ينتج عند تقريب 47 إلى أقرب عشرة و198 إلى أقرب مئة ثم ضرب العددين المقربين؟","En":"Which estimate results from rounding 47 to the nearest ten and 198 to the nearest hundred, then multiplying?"},"Options":[{"LatexCode":"8000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يقرّب 47 إلى 40 خطأً.","En":"Incorrectly rounds 47 to 40."}},{"LatexCode":"9400","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يقرّب العامل الأول.","En":"Leaves the first factor unrounded."}},{"LatexCode":"10000","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"12000","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يستعمل 60 بدلاً من 50.","En":"Uses 60 instead of 50."}}],"Hints":[{"Ar":"47 أقرب إلى 50 أم 40؟","En":"Is 47 closer to 50 or 40?"},{"Ar":"قرّب 198 إلى أقرب مئة.","En":"Round 198 to the nearest hundred."}],"Solution":{"Idea":{"Ar":"نلتزم بدقة التقريب المطلوبة لكل عامل.","En":"Use the specified rounding precision for each factor."},"FormulaLatex":"50\\cdot200","Steps":[{"Ar":"$47\\to50$","En":"$47\\to50$"},{"Ar":"$198\\to200$","En":"$198\\to200$"},{"Ar":"$50\\cdot200=10000$","En":"$50\\cdot200=10000$"}],"Substitution":{"Ar":"$50\\cdot200=10000$","En":"$50\\cdot200=10000$"},"Result":{"Ar":"$10000$","En":"$10000$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10000/200=50$","En":"$10000/200=50$"},"CommonError":{"Ar":"لا تخلط دقة التقريب بين العاملين.","En":"Do not mix the rounding precision of the factors."}}}$mw$::jsonb,$mw$نلتزم بدقة التقريب المطلوبة لكل عامل.

$50\cdot200$

1. $47\to50$

2. $198\to200$

3. $50\cdot200=10000$

$50\cdot200=10000$

$10000$

$10000/200=50$

لا تخلط دقة التقريب بين العاملين.$mw$,$mw$Use the specified rounding precision for each factor.

$50\cdot200$

1. $47\to50$

2. $198\to200$

3. $50\cdot200=10000$

$50\cdot200=10000$

$10000$

$10000/200=50$

Do not mix the rounding precision of the factors.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"47 أقرب إلى 50 أم 40؟","En":"Is 47 closer to 50 or 40?"},{"Ar":"قرّب 198 إلى أقرب مئة.","En":"Round 198 to the nearest hundred."}],"Solution":{"Idea":{"Ar":"نلتزم بدقة التقريب المطلوبة لكل عامل.","En":"Use the specified rounding precision for each factor."},"FormulaLatex":"50\\cdot200","Steps":[{"Ar":"$47\\to50$","En":"$47\\to50$"},{"Ar":"$198\\to200$","En":"$198\\to200$"},{"Ar":"$50\\cdot200=10000$","En":"$50\\cdot200=10000$"}],"Substitution":{"Ar":"$50\\cdot200=10000$","En":"$50\\cdot200=10000$"},"Result":{"Ar":"$10000$","En":"$10000$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10000/200=50$","En":"$10000/200=50$"},"CommonError":{"Ar":"لا تخلط دقة التقريب بين العاملين.","En":"Do not mix the rounding precision of the factors."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يقرّب 47 إلى 40 خطأً.","En":"Incorrectly rounds 47 to 40."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لا يقرّب العامل الأول.","En":"Leaves the first factor unrounded."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يستعمل 60 بدلاً من 50.","En":"Uses 60 instead of 50."},"Order":4}]}$mw$),
($mw$growth-v50-grade-5-mass-balance-unknown-extra-weight-1$mw$,$mw$mass-balance-unknown-extra-weight$mw$,$mw$mass$mw$,$mw$grade-5$mw$,5,1,82,322,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":322,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"كتلة إضافية لتحقيق التوازن","En":"Extra mass for balance"},"Question":{"Ar":"على كفة ميزان كتلة 2.4 كغ، وعلى الكفة الأخرى كتلتان 850 غ و950 غ. كم غراماً نضيف إلى الكفة الثانية لتتساويا؟","En":"One side of a balance holds 2.4 kg. The other holds masses of 850 g and 950 g. How many grams must be added to the second side to balance it?"},"Options":[{"LatexCode":"400","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يكمل المجموع إلى 2400.","En":"Does not bring the total to 2400."}},{"LatexCode":"600","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"850","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه إحدى الكتل الموجودة.","En":"This is one existing mass."}},{"LatexCode":"1800","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الكفة الثانية قبل الإضافة.","En":"This is the second side's existing mass."}}],"Hints":[{"Ar":"حوّل 2.4 كغ إلى غرامات.","En":"Convert 2.4 kg to grams."},{"Ar":"اطرح مجموع الكفة الثانية.","En":"Subtract the second side's total."}],"Solution":{"Idea":{"Ar":"نحسب الفرق بين الكتلتين بوحدة واحدة.","En":"Find the difference between the masses in a common unit."},"FormulaLatex":"2400-(850+950)","Steps":[{"Ar":"$850+950=1800$","En":"$850+950=1800$"},{"Ar":"$2400-1800=600$","En":"$2400-1800=600$"}],"Substitution":{"Ar":"$2400-1800=600$","En":"$2400-1800=600$"},"Result":{"Ar":"$600$","En":"$600$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$1800+600=2400$","En":"$1800+600=2400$"},"CommonError":{"Ar":"لا تخلط الكتلة الموجودة بالكتلة التي يجب إضافتها.","En":"Do not confuse existing mass with the additional mass."}}}$mw$::jsonb,$mw$نحسب الفرق بين الكتلتين بوحدة واحدة.

$2400-(850+950)$

1. $850+950=1800$

2. $2400-1800=600$

$2400-1800=600$

$600$ غ

$1800+600=2400$

لا تخلط الكتلة الموجودة بالكتلة التي يجب إضافتها.$mw$,$mw$Find the difference between the masses in a common unit.

$2400-(850+950)$

1. $850+950=1800$

2. $2400-1800=600$

$2400-1800=600$

$600$ g

$1800+600=2400$

Do not confuse existing mass with the additional mass.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حوّل 2.4 كغ إلى غرامات.","En":"Convert 2.4 kg to grams."},{"Ar":"اطرح مجموع الكفة الثانية.","En":"Subtract the second side's total."}],"Solution":{"Idea":{"Ar":"نحسب الفرق بين الكتلتين بوحدة واحدة.","En":"Find the difference between the masses in a common unit."},"FormulaLatex":"2400-(850+950)","Steps":[{"Ar":"$850+950=1800$","En":"$850+950=1800$"},{"Ar":"$2400-1800=600$","En":"$2400-1800=600$"}],"Substitution":{"Ar":"$2400-1800=600$","En":"$2400-1800=600$"},"Result":{"Ar":"$600$","En":"$600$"},"Unit":{"Ar":"غ","En":"g"},"Verification":{"Ar":"$1800+600=2400$","En":"$1800+600=2400$"},"CommonError":{"Ar":"لا تخلط الكتلة الموجودة بالكتلة التي يجب إضافتها.","En":"Do not confuse existing mass with the additional mass."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يكمل المجموع إلى 2400.","En":"Does not bring the total to 2400."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذه إحدى الكتل الموجودة.","En":"This is one existing mass."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع الكفة الثانية قبل الإضافة.","En":"This is the second side's existing mass."},"Order":4}]}$mw$),
($mw$growth-v50-grade-5-capacity-comparison-with-repeated-pours-1$mw$,$mw$capacity-comparison-with-repeated-pours$mw$,$mw$capacity$mw$,$mw$grade-5$mw$,5,1,82,320,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":320,"SecondarySkillIds":[],"TrackIds":[5],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الكمية المهدرة بعد ملء وعاء","En":"Excess after filling a container"},"Question":{"Ar":"يُصب خمس مرات مقدار 350 مل في وعاء فارغ سعته 1.5 لتر. كم مل يفيض إذا لم يُفرغ الوعاء أثناء الصب؟","En":"Five portions of 350 mL are poured into an empty container of capacity 1.5 L. How many millilitres overflow if the container is not emptied?"},"Options":[{"LatexCode":"150","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يساوي فرق 1750 و1500.","En":"Not the difference of 1750 and 1500."}},{"LatexCode":"250","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"350","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حجم صبة واحدة لا الفائض.","En":"One pour, not the overflow."}},{"LatexCode":"1750","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الحجم المصبوب كله.","En":"The total poured volume."}}],"Hints":[{"Ar":"احسب حجم الصبات الخمس.","En":"Find the volume of five pours."},{"Ar":"حوّل السعة إلى مل واطرحها.","En":"Convert capacity to mL and subtract."}],"Solution":{"Idea":{"Ar":"نطرح سعة الوعاء من الحجم المصبوب الكلي.","En":"Subtract container capacity from the total poured volume."},"FormulaLatex":"5\\cdot350-1500","Steps":[{"Ar":"$5\\cdot350=1750$","En":"$5\\cdot350=1750$"},{"Ar":"$1750-1500=250$","En":"$1750-1500=250$"}],"Substitution":{"Ar":"$1750-1500=250$","En":"$1750-1500=250$"},"Result":{"Ar":"$250$","En":"$250$"},"Unit":{"Ar":"مل","En":"mL"},"Verification":{"Ar":"$1500+250=1750$","En":"$1500+250=1750$"},"CommonError":{"Ar":"الفائض هو الجزء الذي يتجاوز السعة فقط.","En":"Overflow is only the amount exceeding capacity."}}}$mw$::jsonb,$mw$نطرح سعة الوعاء من الحجم المصبوب الكلي.

$5\cdot350-1500$

1. $5\cdot350=1750$

2. $1750-1500=250$

$1750-1500=250$

$250$ مل

$1500+250=1750$

الفائض هو الجزء الذي يتجاوز السعة فقط.$mw$,$mw$Subtract container capacity from the total poured volume.

$5\cdot350-1500$

1. $5\cdot350=1750$

2. $1750-1500=250$

$1750-1500=250$

$250$ mL

$1500+250=1750$

Overflow is only the amount exceeding capacity.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب حجم الصبات الخمس.","En":"Find the volume of five pours."},{"Ar":"حوّل السعة إلى مل واطرحها.","En":"Convert capacity to mL and subtract."}],"Solution":{"Idea":{"Ar":"نطرح سعة الوعاء من الحجم المصبوب الكلي.","En":"Subtract container capacity from the total poured volume."},"FormulaLatex":"5\\cdot350-1500","Steps":[{"Ar":"$5\\cdot350=1750$","En":"$5\\cdot350=1750$"},{"Ar":"$1750-1500=250$","En":"$1750-1500=250$"}],"Substitution":{"Ar":"$1750-1500=250$","En":"$1750-1500=250$"},"Result":{"Ar":"$250$","En":"$250$"},"Unit":{"Ar":"مل","En":"mL"},"Verification":{"Ar":"$1500+250=1750$","En":"$1500+250=1750$"},"CommonError":{"Ar":"الفائض هو الجزء الذي يتجاوز السعة فقط.","En":"Overflow is only the amount exceeding capacity."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يساوي فرق 1750 و1500.","En":"Not the difference of 1750 and 1500."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حجم صبة واحدة لا الفائض.","En":"One pour, not the overflow."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الحجم المصبوب كله.","En":"The total poured volume."},"Order":4}]}$mw$),
($mw$growth-v50-grade-6-two-step-equation-missing-constant-from-solution-1$mw$,$mw$two-step-equation-missing-constant-from-solution$mw$,$mw$primary-two-step-equations$mw$,$mw$grade-6$mw$,6,1,2,10,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":10,"SecondarySkillIds":[],"TrackIds":[6],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"ثابت مجهول من حل معطى","En":"Unknown constant from a known solution"},"Question":{"Ar":"إذا كان x=7 حلاً للمعادلة 4x+b=39، فما قيمة b؟","En":"If x=7 solves the equation 4x+b=39, what is b?"},"Options":[{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة x لا b.","En":"This is x, not b."}},{"LatexCode":"11","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب 4x.","En":"This is the product 4x."}},{"LatexCode":"35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يطرح المعامل دون التعويض.","En":"Subtracts the coefficient without substitution."}}],"Hints":[{"Ar":"عوّض x بالعدد سبعة.","En":"Substitute seven for x."},{"Ar":"اطرح حاصل الضرب من 39.","En":"Subtract the product from 39."}],"Solution":{"Idea":{"Ar":"نعوض الحل المعروف ثم نعزل الثابت.","En":"Substitute the known solution and isolate the constant."},"FormulaLatex":"b=39-4x","Steps":[{"Ar":"$4\\cdot7=28$","En":"$4\\cdot7=28$"},{"Ar":"$b=39-28=11$","En":"$b=39-28=11$"}],"Substitution":{"Ar":"$b=39-28=11$","En":"$b=39-28=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot7+11=39$","En":"$4\\cdot7+11=39$"},"CommonError":{"Ar":"لا تخلط قيمة الحل بقيمة الثابت المجهول.","En":"Do not confuse the known solution with the unknown constant."}}}$mw$::jsonb,$mw$نعوض الحل المعروف ثم نعزل الثابت.

$b=39-4x$

1. $4\cdot7=28$

2. $b=39-28=11$

$b=39-28=11$

$11$

$4\cdot7+11=39$

لا تخلط قيمة الحل بقيمة الثابت المجهول.$mw$,$mw$Substitute the known solution and isolate the constant.

$b=39-4x$

1. $4\cdot7=28$

2. $b=39-28=11$

$b=39-28=11$

$11$

$4\cdot7+11=39$

Do not confuse the known solution with the unknown constant.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض x بالعدد سبعة.","En":"Substitute seven for x."},{"Ar":"اطرح حاصل الضرب من 39.","En":"Subtract the product from 39."}],"Solution":{"Idea":{"Ar":"نعوض الحل المعروف ثم نعزل الثابت.","En":"Substitute the known solution and isolate the constant."},"FormulaLatex":"b=39-4x","Steps":[{"Ar":"$4\\cdot7=28$","En":"$4\\cdot7=28$"},{"Ar":"$b=39-28=11$","En":"$b=39-28=11$"}],"Substitution":{"Ar":"$b=39-28=11$","En":"$b=39-28=11$"},"Result":{"Ar":"$11$","En":"$11$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4\\cdot7+11=39$","En":"$4\\cdot7+11=39$"},"CommonError":{"Ar":"لا تخلط قيمة الحل بقيمة الثابت المجهول.","En":"Do not confuse the known solution with the unknown constant."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة x لا b.","En":"This is x, not b."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا حاصل ضرب 4x.","En":"This is the product 4x."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يطرح المعامل دون التعويض.","En":"Subtracts the coefficient without substitution."},"Order":4}]}$mw$),
($mw$growth-v50-grade-8-mean-combine-total-known-repeated-score-1$mw$,$mw$mean-combine-total-known-repeated-score$mw$,$mw$m-statistics-summary-measures$mw$,$mw$grade-8$mw$,8,2,22,99,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":99,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المتوسط بعد تكرار كل قراءة","En":"Mean after repeating each observation"},"Question":{"Ar":"متوسط خمس قراءات يساوي 12. إذا سُجلت كل قراءة مرتين بدلاً من مرة واحدة، فما المتوسط الجديد؟","En":"Five readings have mean 12. If each reading is recorded twice rather than once, what is the new mean?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يقسم المتوسط على اثنين رغم تضاعف المجموع.","En":"Halves the mean despite doubling the total."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يضاعف المتوسط رغم تضاعف العدد أيضاً.","En":"Doubles the mean despite doubling the count."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع القراءات الأصلي.","En":"This is the original sum."}}],"Hints":[{"Ar":"كم يصبح عدد القراءات؟","En":"What is the new number of readings?"},{"Ar":"يتضاعف المجموع أيضاً.","En":"The sum doubles too."}],"Solution":{"Idea":{"Ar":"يتضاعف مجموع القيم وعددها معاً فيبقى المتوسط ثابتاً.","En":"Both total and count double, so the mean stays unchanged."},"FormulaLatex":"\\bar x'=\\frac{2S}{2n}","Steps":[{"Ar":"$S=5\\cdot12=60$","En":"$S=5\\cdot12=60$"},{"Ar":"$\\bar x'=120/10=12$","En":"$\\bar x'=120/10=12$"}],"Substitution":{"Ar":"$\\bar x'=120/10=12$","En":"$\\bar x'=120/10=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10\\cdot12=120$","En":"$10\\cdot12=120$"},"CommonError":{"Ar":"لا تخلط تكرار البيانات بضرب قيمها في اثنين.","En":"Do not confuse duplicating observations with doubling their values."}}}$mw$::jsonb,$mw$يتضاعف مجموع القيم وعددها معاً فيبقى المتوسط ثابتاً.

$\bar x'=\frac{2S}{2n}$

1. $S=5\cdot12=60$

2. $\bar x'=120/10=12$

$\bar x'=120/10=12$

$12$

$10\cdot12=120$

لا تخلط تكرار البيانات بضرب قيمها في اثنين.$mw$,$mw$Both total and count double, so the mean stays unchanged.

$\bar x'=\frac{2S}{2n}$

1. $S=5\cdot12=60$

2. $\bar x'=120/10=12$

$\bar x'=120/10=12$

$12$

$10\cdot12=120$

Do not confuse duplicating observations with doubling their values.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كم يصبح عدد القراءات؟","En":"What is the new number of readings?"},{"Ar":"يتضاعف المجموع أيضاً.","En":"The sum doubles too."}],"Solution":{"Idea":{"Ar":"يتضاعف مجموع القيم وعددها معاً فيبقى المتوسط ثابتاً.","En":"Both total and count double, so the mean stays unchanged."},"FormulaLatex":"\\bar x'=\\frac{2S}{2n}","Steps":[{"Ar":"$S=5\\cdot12=60$","En":"$S=5\\cdot12=60$"},{"Ar":"$\\bar x'=120/10=12$","En":"$\\bar x'=120/10=12$"}],"Substitution":{"Ar":"$\\bar x'=120/10=12$","En":"$\\bar x'=120/10=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$10\\cdot12=120$","En":"$10\\cdot12=120$"},"CommonError":{"Ar":"لا تخلط تكرار البيانات بضرب قيمها في اثنين.","En":"Do not confuse duplicating observations with doubling their values."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يقسم المتوسط على اثنين رغم تضاعف المجموع.","En":"Halves the mean despite doubling the total."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يضاعف المتوسط رغم تضاعف العدد أيضاً.","En":"Doubles the mean despite doubling the count."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا مجموع القراءات الأصلي.","En":"This is the original sum."},"Order":4}]}$mw$),
($mw$growth-v50-grade-8-inequality-solution-set-count-outside-closed-range-1$mw$,$mw$inequality-solution-set-count-outside-closed-range$mw$,$mw$number-line-solutions$mw$,$mw$grade-8$mw$,8,2,84,326,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":326,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"عد القيم خارج مجال مغلق","En":"Counting values outside a closed interval"},"Question":{"Ar":"من الأعداد الصحيحة 0 إلى 8 شاملة، كم عدداً لا يحقق الشرط $2\\le x\\le6$؟","En":"Among integers from 0 through 8 inclusive, how many fail the condition $2\\le x\\le6$?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعد جانباً واحداً من المجال.","En":"Counts only one side of the interval."}},{"LatexCode":"4","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القيم التي تحقق الشرط.","En":"This counts values satisfying the condition."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القيم الأصلية كلها.","En":"This counts all original values."}}],"Hints":[{"Ar":"العددان 2 و6 يحققان الشرط.","En":"Both endpoints 2 and 6 satisfy the condition."},{"Ar":"عد القيم 0 و1 و7 و8.","En":"Count zero, one, seven and eight."}],"Solution":{"Idea":{"Ar":"نستبعد الأعداد الواقعة بين الحدين المشمولين ونعد الباقي.","En":"Exclude integers in the inclusive interval and count the rest."},"FormulaLatex":"9-(6-2+1)","Steps":[{"Ar":"$6-2+1=5$","En":"$6-2+1=5$"},{"Ar":"$9-5=4$","En":"$9-5=4$"}],"Substitution":{"Ar":"$9-5=4$","En":"$9-5=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+5=9$","En":"$4+5=9$"},"CommonError":{"Ar":"لا تستبعد حدود المجال إذا كانت الإشارة تشمل المساواة.","En":"Do not exclude inclusive endpoints."}}}$mw$::jsonb,$mw$نستبعد الأعداد الواقعة بين الحدين المشمولين ونعد الباقي.

$9-(6-2+1)$

1. $6-2+1=5$

2. $9-5=4$

$9-5=4$

$4$

$4+5=9$

لا تستبعد حدود المجال إذا كانت الإشارة تشمل المساواة.$mw$,$mw$Exclude integers in the inclusive interval and count the rest.

$9-(6-2+1)$

1. $6-2+1=5$

2. $9-5=4$

$9-5=4$

$4$

$4+5=9$

Do not exclude inclusive endpoints.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"العددان 2 و6 يحققان الشرط.","En":"Both endpoints 2 and 6 satisfy the condition."},{"Ar":"عد القيم 0 و1 و7 و8.","En":"Count zero, one, seven and eight."}],"Solution":{"Idea":{"Ar":"نستبعد الأعداد الواقعة بين الحدين المشمولين ونعد الباقي.","En":"Exclude integers in the inclusive interval and count the rest."},"FormulaLatex":"9-(6-2+1)","Steps":[{"Ar":"$6-2+1=5$","En":"$6-2+1=5$"},{"Ar":"$9-5=4$","En":"$9-5=4$"}],"Substitution":{"Ar":"$9-5=4$","En":"$9-5=4$"},"Result":{"Ar":"$4$","En":"$4$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$4+5=9$","En":"$4+5=9$"},"CommonError":{"Ar":"لا تستبعد حدود المجال إذا كانت الإشارة تشمل المساواة.","En":"Do not exclude inclusive endpoints."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"يعد جانباً واحداً من المجال.","En":"Counts only one side of the interval."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القيم التي تحقق الشرط.","En":"This counts values satisfying the condition."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"هذا عدد القيم الأصلية كلها.","En":"This counts all original values."},"Order":4}]}$mw$),
($mw$growth-v50-grade-8-inequality-solutions-error-identification-subtract-negative-1$mw$,$mw$inequality-solutions-error-identification-subtract-negative$mw$,$mw$solve-linear-inequalities$mw$,$mw$grade-8$mw$,8,2,84,327,$mw${"StageId":2,"CategoryId":84,"PrimarySkillId":327,"SecondarySkillIds":[],"TrackIds":[8],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبرير خطوة حل متراجحة","En":"Justifying an inequality step"},"Question":{"Ar":"بدأ طالب من $x-6>2$ ثم كتب $x>8$. أي عملية تبرر هذه الخطوة؟ A: إضافة 6 للطرفين؛ B: طرح 6 من الطرفين؛ C: ضرب الطرفين في 6؛ D: عكس اتجاه المتراجحة.","En":"A student starts with $x-6>2$ and writes $x>8$. Which operation justifies this step? A: add 6 to both sides; B: subtract 6 from both sides; C: multiply both sides by 6; D: reverse the inequality."},"Options":[{"LatexCode":"A","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"B","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الطرح يزيد مقدار الحد السالب.","En":"Subtracting increases the negative offset."}},{"LatexCode":"C","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الضرب لا يلغي طرح 6.","En":"Multiplication does not undo subtracting six."}},{"LatexCode":"D","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"الجمع لا يعكس الإشارة.","En":"Addition does not reverse the inequality."}}],"Hints":[{"Ar":"ما العملية العكسية لطرح 6؟","En":"What undoes subtracting six?"},{"Ar":"نفذ العملية نفسها في الطرفين.","En":"Perform the same operation on both sides."}],"Solution":{"Idea":{"Ar":"إضافة العدد نفسه إلى الطرفين تحافظ على اتجاه المتراجحة.","En":"Adding the same number to both sides preserves the inequality direction."},"FormulaLatex":"x-6+6>2+6","Steps":[{"Ar":"$x>8$","En":"$x>8$"}],"Substitution":{"Ar":"$x>8$","En":"$x>8$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9-6=3>2$","En":"$9-6=3>2$"},"CommonError":{"Ar":"لا تعكس اتجاه المتراجحة لمجرد نقل ثابت.","En":"Do not reverse an inequality simply when moving a constant."}}}$mw$::jsonb,$mw$إضافة العدد نفسه إلى الطرفين تحافظ على اتجاه المتراجحة.

$x-6+6>2+6$

1. $x>8$

$x>8$

$A$

$9-6=3>2$

لا تعكس اتجاه المتراجحة لمجرد نقل ثابت.$mw$,$mw$Adding the same number to both sides preserves the inequality direction.

$x-6+6>2+6$

1. $x>8$

$x>8$

$A$

$9-6=3>2$

Do not reverse an inequality simply when moving a constant.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ما العملية العكسية لطرح 6؟","En":"What undoes subtracting six?"},{"Ar":"نفذ العملية نفسها في الطرفين.","En":"Perform the same operation on both sides."}],"Solution":{"Idea":{"Ar":"إضافة العدد نفسه إلى الطرفين تحافظ على اتجاه المتراجحة.","En":"Adding the same number to both sides preserves the inequality direction."},"FormulaLatex":"x-6+6>2+6","Steps":[{"Ar":"$x>8$","En":"$x>8$"}],"Substitution":{"Ar":"$x>8$","En":"$x>8$"},"Result":{"Ar":"$A$","En":"$A$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$9-6=3>2$","En":"$9-6=3>2$"},"CommonError":{"Ar":"لا تعكس اتجاه المتراجحة لمجرد نقل ثابت.","En":"Do not reverse an inequality simply when moving a constant."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"الطرح يزيد مقدار الحد السالب.","En":"Subtracting increases the negative offset."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"الضرب لا يلغي طرح 6.","En":"Multiplication does not undo subtracting six."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"الجمع لا يعكس الإشارة.","En":"Addition does not reverse the inequality."},"Order":4}]}$mw$),
($mw$growth-v50-grade-9-range-possible-max-min-from-known-range-1$mw$,$mw$range-possible-max-min-from-known-range$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"استنتاج أصغر قيمة من المدى","En":"Inferring the minimum from a range"},"Question":{"Ar":"أكبر قراءة في مجموعة بيانات هي −3، والمدى يساوي 11. ما أصغر قراءة؟","En":"The largest observation in a data set is −3 and the range is 11. What is the smallest observation?"},"Options":[{"LatexCode":"-14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"-8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يعطي مدى 5 فقط.","En":"Gives range five only."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أكبر من القيمة القصوى المعطاة.","En":"Exceeds the given maximum."}},{"LatexCode":"14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أكبر من القيمة القصوى المعطاة.","En":"Exceeds the given maximum."}}],"Hints":[{"Ar":"اكتب علاقة المدى بالأكبر والأصغر.","En":"Write the range relationship."},{"Ar":"اطرح المدى من أكبر قيمة.","En":"Subtract the range from the maximum."}],"Solution":{"Idea":{"Ar":"المدى يساوي أكبر قيمة ناقص أصغر قيمة.","En":"Range equals maximum minus minimum."},"FormulaLatex":"R=M-m","Steps":[{"Ar":"$11=-3-m$","En":"$11=-3-m$"},{"Ar":"$m=-3-11=-14$","En":"$m=-3-11=-14$"}],"Substitution":{"Ar":"$m=-3-11=-14$","En":"$m=-3-11=-14$"},"Result":{"Ar":"$-14$","En":"$-14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-3-(-14)=11$","En":"$-3-(-14)=11$"},"CommonError":{"Ar":"لا تهمل إشارة القيمة القصوى السالبة.","En":"Do not ignore the negative sign of the maximum."}}}$mw$::jsonb,$mw$المدى يساوي أكبر قيمة ناقص أصغر قيمة.

$R=M-m$

1. $11=-3-m$

2. $m=-3-11=-14$

$m=-3-11=-14$

$-14$

$-3-(-14)=11$

لا تهمل إشارة القيمة القصوى السالبة.$mw$,$mw$Range equals maximum minus minimum.

$R=M-m$

1. $11=-3-m$

2. $m=-3-11=-14$

$m=-3-11=-14$

$-14$

$-3-(-14)=11$

Do not ignore the negative sign of the maximum.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب علاقة المدى بالأكبر والأصغر.","En":"Write the range relationship."},{"Ar":"اطرح المدى من أكبر قيمة.","En":"Subtract the range from the maximum."}],"Solution":{"Idea":{"Ar":"المدى يساوي أكبر قيمة ناقص أصغر قيمة.","En":"Range equals maximum minus minimum."},"FormulaLatex":"R=M-m","Steps":[{"Ar":"$11=-3-m$","En":"$11=-3-m$"},{"Ar":"$m=-3-11=-14$","En":"$m=-3-11=-14$"}],"Substitution":{"Ar":"$m=-3-11=-14$","En":"$m=-3-11=-14$"},"Result":{"Ar":"$-14$","En":"$-14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$-3-(-14)=11$","En":"$-3-(-14)=11$"},"CommonError":{"Ar":"لا تهمل إشارة القيمة القصوى السالبة.","En":"Do not ignore the negative sign of the maximum."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يعطي مدى 5 فقط.","En":"Gives range five only."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أكبر من القيمة القصوى المعطاة.","En":"Exceeds the given maximum."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أكبر من القيمة القصوى المعطاة.","En":"Exceeds the given maximum."},"Order":4}]}$mw$),
($mw$growth-v50-grade-12-trig-identity-minimum-product-denominator-1$mw$,$mw$trig-identity-minimum-product-denominator$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حد أعلى لحاصل ضرب المربعين","En":"Upper bound of the product of squares"},"Question":{"Ar":"ما أكبر قيمة لـ $\\sin^2\\theta\\cos^2\\theta$ عندما تكون θ زاوية حقيقية؟","En":"What is the maximum of $\\sin^2\\theta\\cos^2\\theta$ over real θ?"},"Options":[{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة صغرى ممكنة.","En":"This is an attainable minimum."}},{"LatexCode":"\\frac14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار أحد المربعين عند التساوي لا حاصل الضرب.","En":"This is either square at equality, not their product."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يمكن أن يكون المربعان كلاهما واحداً.","En":"Both squares cannot equal one."}}],"Hints":[{"Ar":"استعمل أن مجموع المربعين واحد.","En":"Use that the squares sum to one."},{"Ar":"مربع الفرق غير سالب.","En":"The squared difference is nonnegative."}],"Solution":{"Idea":{"Ar":"مجموع المربعين واحد، ويبلغ حاصل ضرب عددين غير سالبين بهذا المجموع أقصاه عند تساويهما.","En":"The squares sum to one; the product of two nonnegative numbers with fixed sum is maximal when equal."},"FormulaLatex":"4ab=(a+b)^2-(a-b)^2\\le1","Steps":[{"Ar":"$a=\\sin^2\\theta,\\quad b=\\cos^2\\theta$","En":"$a=\\sin^2\\theta,\\quad b=\\cos^2\\theta$"},{"Ar":"$a+b=1$","En":"$a+b=1$"},{"Ar":"$ab\\le1/4$","En":"$ab\\le1/4$"}],"Substitution":{"Ar":"$ab\\le1/4$","En":"$ab\\le1/4$"},"Result":{"Ar":"$\\frac14$","En":"$\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=45^\\circ:\\ (1/2)(1/2)=1/4$","En":"$\\theta=45^\\circ:\\ (1/2)(1/2)=1/4$"},"CommonError":{"Ar":"لا تفترض استقلال قيمتي الجيب وجيب التمام.","En":"Do not treat sine and cosine as independently varying."}}}$mw$::jsonb,$mw$مجموع المربعين واحد، ويبلغ حاصل ضرب عددين غير سالبين بهذا المجموع أقصاه عند تساويهما.

$4ab=(a+b)^2-(a-b)^2\le1$

1. $a=\sin^2\theta,\quad b=\cos^2\theta$

2. $a+b=1$

3. $ab\le1/4$

$ab\le1/4$

$\frac14$

$\theta=45^\circ:\ (1/2)(1/2)=1/4$

لا تفترض استقلال قيمتي الجيب وجيب التمام.$mw$,$mw$The squares sum to one; the product of two nonnegative numbers with fixed sum is maximal when equal.

$4ab=(a+b)^2-(a-b)^2\le1$

1. $a=\sin^2\theta,\quad b=\cos^2\theta$

2. $a+b=1$

3. $ab\le1/4$

$ab\le1/4$

$\frac14$

$\theta=45^\circ:\ (1/2)(1/2)=1/4$

Do not treat sine and cosine as independently varying.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل أن مجموع المربعين واحد.","En":"Use that the squares sum to one."},{"Ar":"مربع الفرق غير سالب.","En":"The squared difference is nonnegative."}],"Solution":{"Idea":{"Ar":"مجموع المربعين واحد، ويبلغ حاصل ضرب عددين غير سالبين بهذا المجموع أقصاه عند تساويهما.","En":"The squares sum to one; the product of two nonnegative numbers with fixed sum is maximal when equal."},"FormulaLatex":"4ab=(a+b)^2-(a-b)^2\\le1","Steps":[{"Ar":"$a=\\sin^2\\theta,\\quad b=\\cos^2\\theta$","En":"$a=\\sin^2\\theta,\\quad b=\\cos^2\\theta$"},{"Ar":"$a+b=1$","En":"$a+b=1$"},{"Ar":"$ab\\le1/4$","En":"$ab\\le1/4$"}],"Substitution":{"Ar":"$ab\\le1/4$","En":"$ab\\le1/4$"},"Result":{"Ar":"$\\frac14$","En":"$\\frac14$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$\\theta=45^\\circ:\\ (1/2)(1/2)=1/4$","En":"$\\theta=45^\\circ:\\ (1/2)(1/2)=1/4$"},"CommonError":{"Ar":"لا تفترض استقلال قيمتي الجيب وجيب التمام.","En":"Do not treat sine and cosine as independently varying."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه قيمة صغرى ممكنة.","En":"This is an attainable minimum."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مقدار أحد المربعين عند التساوي لا حاصل الضرب.","En":"This is either square at equality, not their product."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا يمكن أن يكون المربعان كلاهما واحداً.","En":"Both squares cannot equal one."},"Order":4}]}$mw$),
($mw$growth-v50-grade-12-trig-identity-solve-linear-in-squares-1$mw$,$mw$trig-identity-solve-linear-in-squares$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"معادلة في مربعي النسب","En":"Equation in squared trigonometric ratios"},"Question":{"Ar":"إذا تحقق $2\\sin^2\\theta+5\\cos^2\\theta=3$، فما قيمة $\\cos^2\\theta$؟","En":"If $2\\sin^2\\theta+5\\cos^2\\theta=3$, what is $\\cos^2\\theta$?"},"Options":[{"LatexCode":"\\frac15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا يحقق المعادلة بعد التعويض.","En":"Does not satisfy the equation on substitution."}},{"LatexCode":"\\frac13","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا مربع الجيب الناتج.","En":"This is the resulting sine squared."}},{"LatexCode":"\\frac35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يقسم 3 على 5 ويهمل حد الجيب.","En":"Divides three by five and ignores the sine term."}}],"Hints":[{"Ar":"استعمل المتطابقة الأساسية لإلغاء مربع الجيب.","En":"Use the fundamental identity to eliminate sine squared."},{"Ar":"اجمع حدود مربع جيب التمام.","En":"Collect the cosine-squared terms."}],"Solution":{"Idea":{"Ar":"نعوض مربع الجيب بواحد ناقص مربع جيب التمام.","En":"Replace sine squared by one minus cosine squared."},"FormulaLatex":"2(1-c)+5c=3,\\quad c=\\cos^2\\theta","Steps":[{"Ar":"$2+3c=3$","En":"$2+3c=3$"},{"Ar":"$3c=1$","En":"$3c=1$"},{"Ar":"$c=1/3$","En":"$c=1/3$"}],"Substitution":{"Ar":"$c=1/3$","En":"$c=1/3$"},"Result":{"Ar":"$\\frac13$","En":"$\\frac13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(2/3)+5(1/3)=3$","En":"$2(2/3)+5(1/3)=3$"},"CommonError":{"Ar":"لا تعامل مربعَي الجيب وجيب التمام كمجهولين مستقلين.","En":"Do not treat the two squared ratios as independent unknowns."}}}$mw$::jsonb,$mw$نعوض مربع الجيب بواحد ناقص مربع جيب التمام.

$2(1-c)+5c=3,\quad c=\cos^2\theta$

1. $2+3c=3$

2. $3c=1$

3. $c=1/3$

$c=1/3$

$\frac13$

$2(2/3)+5(1/3)=3$

لا تعامل مربعَي الجيب وجيب التمام كمجهولين مستقلين.$mw$,$mw$Replace sine squared by one minus cosine squared.

$2(1-c)+5c=3,\quad c=\cos^2\theta$

1. $2+3c=3$

2. $3c=1$

3. $c=1/3$

$c=1/3$

$\frac13$

$2(2/3)+5(1/3)=3$

Do not treat the two squared ratios as independent unknowns.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استعمل المتطابقة الأساسية لإلغاء مربع الجيب.","En":"Use the fundamental identity to eliminate sine squared."},{"Ar":"اجمع حدود مربع جيب التمام.","En":"Collect the cosine-squared terms."}],"Solution":{"Idea":{"Ar":"نعوض مربع الجيب بواحد ناقص مربع جيب التمام.","En":"Replace sine squared by one minus cosine squared."},"FormulaLatex":"2(1-c)+5c=3,\\quad c=\\cos^2\\theta","Steps":[{"Ar":"$2+3c=3$","En":"$2+3c=3$"},{"Ar":"$3c=1$","En":"$3c=1$"},{"Ar":"$c=1/3$","En":"$c=1/3$"}],"Substitution":{"Ar":"$c=1/3$","En":"$c=1/3$"},"Result":{"Ar":"$\\frac13$","En":"$\\frac13$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$2(2/3)+5(1/3)=3$","En":"$2(2/3)+5(1/3)=3$"},"CommonError":{"Ar":"لا تعامل مربعَي الجيب وجيب التمام كمجهولين مستقلين.","En":"Do not treat the two squared ratios as independent unknowns."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"لا يحقق المعادلة بعد التعويض.","En":"Does not satisfy the equation on substitution."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا مربع الجيب الناتج.","En":"This is the resulting sine squared."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يقسم 3 على 5 ويهمل حد الجيب.","En":"Divides three by five and ignores the sine term."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v50 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
