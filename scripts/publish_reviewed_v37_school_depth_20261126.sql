-- One-time owner-authorized v37 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v37-grade-3-elapsed-time-same-finish-different-start-1$mw$,$mw$elapsed-time-same-finish-different-start$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"موعد انتهاء مشترك","En":"A shared finishing time"},"Question":{"Ar":"بدأت القراءة الساعة 8:15 صباحاً، وبدأ الرسم الساعة 8:40 صباحاً. انتهى النشاطان في الوقت نفسه. بكم دقيقة تزيد مدة القراءة على مدة الرسم؟","En":"Reading starts at 8:15 a.m. and drawing at 8:40 a.m. Both activities end at the same time. By how many minutes is reading longer?"},"Options":[{"LatexCode":"15","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"15 رقم الدقائق في موعد بداية القراءة، لا الفرق بين الموعدين.","En":"15 is the minute component of the reading start, not the difference."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"20 ليس الفرق بين الموعدين.","En":"20 is not the difference between the starts."}},{"LatexCode":"25","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"40","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"40 رقم الدقائق في موعد بداية الرسم، لا الفرق.","En":"40 is the minute component of the drawing start, not the difference."}}],"Hints":[{"Ar":"لا تحتاج إلى معرفة موعد النهاية المشترك.","En":"You do not need the shared finishing time."},{"Ar":"قارن موعدي البداية.","En":"Compare the start times."}],"Solution":{"Idea":{"Ar":"عند تساوي موعد النهاية، يساوي فرق المدتين فرق موعدي البداية.","En":"With a common finish, the difference in durations equals the difference in start times."},"FormulaLatex":"40-15","Steps":[{"Ar":"بدأت القراءة قبل الرسم في الساعة نفسها.","En":"Reading starts earlier within the same hour."},{"Ar":"نحسب الفرق بين الدقيقتين 15 و40.","En":"Subtract minute 15 from minute 40."}],"Substitution":{"Ar":"$40-15=25$","En":"$40-15=25$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$15+25=40$","En":"$15+25=40$"},"CommonError":{"Ar":"لا تجمع رقمي الدقائق.","En":"Do not add the minute readings."}}}$mw$::jsonb,$mw$عند تساوي موعد النهاية، يساوي فرق المدتين فرق موعدي البداية.

$40-15$

1. بدأت القراءة قبل الرسم في الساعة نفسها.

2. نحسب الفرق بين الدقيقتين 15 و40.

$40-15=25$

$25$ دقيقة

$15+25=40$

لا تجمع رقمي الدقائق.$mw$,$mw$With a common finish, the difference in durations equals the difference in start times.

$40-15$

1. Reading starts earlier within the same hour.

2. Subtract minute 15 from minute 40.

$40-15=25$

$25$ minutes

$15+25=40$

Do not add the minute readings.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"لا تحتاج إلى معرفة موعد النهاية المشترك.","En":"You do not need the shared finishing time."},{"Ar":"قارن موعدي البداية.","En":"Compare the start times."}],"Solution":{"Idea":{"Ar":"عند تساوي موعد النهاية، يساوي فرق المدتين فرق موعدي البداية.","En":"With a common finish, the difference in durations equals the difference in start times."},"FormulaLatex":"40-15","Steps":[{"Ar":"بدأت القراءة قبل الرسم في الساعة نفسها.","En":"Reading starts earlier within the same hour."},{"Ar":"نحسب الفرق بين الدقيقتين 15 و40.","En":"Subtract minute 15 from minute 40."}],"Substitution":{"Ar":"$40-15=25$","En":"$40-15=25$"},"Result":{"Ar":"$25$","En":"$25$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"$15+25=40$","En":"$15+25=40$"},"CommonError":{"Ar":"لا تجمع رقمي الدقائق.","En":"Do not add the minute readings."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"15 رقم الدقائق في موعد بداية القراءة، لا الفرق بين الموعدين.","En":"15 is the minute component of the reading start, not the difference."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"20 ليس الفرق بين الموعدين.","En":"20 is not the difference between the starts."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"40 رقم الدقائق في موعد بداية الرسم، لا الفرق.","En":"40 is the minute component of the drawing start, not the difference."},"Order":4}]}$mw$),
($mw$growth-v37-grade-4-multiplicative-equation-check-wrong-factor-1$mw$,$mw$multiplicative-equation-check-wrong-factor$mw$,$mw$primary-one-step-multiplicative-equations$mw$,$mw$grade-4$mw$,4,1,2,9,$mw${"StageId":1,"CategoryId":2,"PrimarySkillId":9,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"اختبار حل مقترح","En":"Checking a proposed solution"},"Question":{"Ar":"اقترح طالب أن x=8 حل للمعادلة 9x=63. بكم يزيد الطرف الأيسر على الطرف الأيمن عند التعويض بالقيمة المقترحة؟","En":"A student proposes x=8 as a solution of 9x=63. By how much does the left side exceed the right side when the proposed value is substituted?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 فرق قيمة x المقترحة عن الحل الصحيح، لا فرق الطرفين.","En":"1 is the difference between the proposed and correct x values, not the sides."}},{"LatexCode":"7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"7 هو الحل الصحيح للمعادلة.","En":"7 is the actual solution."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"72","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"72 قيمة الطرف الأيسر وحده.","En":"72 is the left side alone."}}],"Hints":[{"Ar":"عوّض 8 في الطرف الأيسر.","En":"Substitute 8 on the left."},{"Ar":"اطرح 63 من حاصل الضرب.","En":"Subtract 63 from the product."}],"Solution":{"Idea":{"Ar":"نختبر الحل بالتعويض ثم نقارن الطرفين.","En":"Check a proposed solution by substitution, then compare the sides."},"FormulaLatex":"9\\cdot8-63","Steps":[{"Ar":"$9\\cdot8=72$","En":"$9\\cdot8=72$"},{"Ar":"$72-63=9$","En":"$72-63=9$"}],"Substitution":{"Ar":"$72-63=9$","En":"$72-63=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$63+9=72$","En":"$63+9=72$"},"CommonError":{"Ar":"المطلوب فرق الطرفين، وليس قيمة الحل الصحيح.","En":"The question asks for the difference between sides, not the correct solution."}}}$mw$::jsonb,$mw$نختبر الحل بالتعويض ثم نقارن الطرفين.

$9\cdot8-63$

1. $9\cdot8=72$

2. $72-63=9$

$72-63=9$

$9$

$63+9=72$

المطلوب فرق الطرفين، وليس قيمة الحل الصحيح.$mw$,$mw$Check a proposed solution by substitution, then compare the sides.

$9\cdot8-63$

1. $9\cdot8=72$

2. $72-63=9$

$72-63=9$

$9$

$63+9=72$

The question asks for the difference between sides, not the correct solution.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"عوّض 8 في الطرف الأيسر.","En":"Substitute 8 on the left."},{"Ar":"اطرح 63 من حاصل الضرب.","En":"Subtract 63 from the product."}],"Solution":{"Idea":{"Ar":"نختبر الحل بالتعويض ثم نقارن الطرفين.","En":"Check a proposed solution by substitution, then compare the sides."},"FormulaLatex":"9\\cdot8-63","Steps":[{"Ar":"$9\\cdot8=72$","En":"$9\\cdot8=72$"},{"Ar":"$72-63=9$","En":"$72-63=9$"}],"Substitution":{"Ar":"$72-63=9$","En":"$72-63=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$63+9=72$","En":"$63+9=72$"},"CommonError":{"Ar":"المطلوب فرق الطرفين، وليس قيمة الحل الصحيح.","En":"The question asks for the difference between sides, not the correct solution."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1 فرق قيمة x المقترحة عن الحل الصحيح، لا فرق الطرفين.","En":"1 is the difference between the proposed and correct x values, not the sides."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"7 هو الحل الصحيح للمعادلة.","En":"7 is the actual solution."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"72 قيمة الطرف الأيسر وحده.","En":"72 is the left side alone."},"Order":4}]}$mw$),
($mw$growth-v37-grade-7-linear-equation-error-identify-intermediate-1$mw$,$mw$linear-equation-error-identify-intermediate$mw$,$mw$middle-linear-equations$mw$,$mw$grade-7$mw$,7,2,6,25,$mw${"StageId":2,"CategoryId":6,"PrimarySkillId":25,"SecondarySkillIds":[],"TrackIds":[7],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الخطوة الصحيحة في حل معادلة","En":"Correct equation-solving step"},"Question":{"Ar":"لحل المعادلة 5(x−2)=35، أي معادلة تنتج مباشرة عن قسمة الطرفين على 5 دون إجراء أي عملية أخرى؟","En":"To solve 5(x−2)=35, which equation follows immediately from dividing both sides by 5, without any other operation?"},"Options":[{"LatexCode":"x-2=7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"x-2=35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يُقسم الطرف الأيمن.","En":"The right side was not divided."}},{"LatexCode":"x=7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تم حذف −2 دون عملية مبررة.","En":"The −2 was removed without a justified operation."}},{"LatexCode":"x-10=7","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لا ينتج −10 بعد قسمة العامل الخارجي.","En":"−10 does not follow from cancelling the outside factor."}}],"Hints":[{"Ar":"اقسم التعبير كاملاً، لا جزءاً منه.","En":"Divide the entire expression, not one part."},{"Ar":"أبقِ ما داخل القوس دون تغيير.","En":"Keep the expression inside the parentheses unchanged."}],"Solution":{"Idea":{"Ar":"قسمة طرفي المعادلة على العدد غير الصفري نفسه تحافظ على تكافؤ المعادلة.","En":"Dividing both sides by the same nonzero number preserves equivalence."},"FormulaLatex":"\\frac{5(x-2)}5=\\frac{35}5","Steps":[{"Ar":"يُختزل العامل 5 في الطرف الأيسر.","En":"The factor 5 cancels on the left."},{"Ar":"نحسب 35÷5 في الطرف الأيمن.","En":"Calculate 35÷5 on the right."}],"Substitution":{"Ar":"$x-2=7$","En":"$x-2=7$"},"Result":{"Ar":"$x-2=7$","En":"$x-2=7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x=9\\Rightarrow5(9-2)=35$","En":"$x=9\\Rightarrow5(9-2)=35$"},"CommonError":{"Ar":"لا تحذف −2 عند اختزال العامل 5.","En":"Do not remove −2 when cancelling the factor 5."}}}$mw$::jsonb,$mw$قسمة طرفي المعادلة على العدد غير الصفري نفسه تحافظ على تكافؤ المعادلة.

$\frac{5(x-2)}5=\frac{35}5$

1. يُختزل العامل 5 في الطرف الأيسر.

2. نحسب 35÷5 في الطرف الأيمن.

$x-2=7$

$x-2=7$

$x=9\Rightarrow5(9-2)=35$

لا تحذف −2 عند اختزال العامل 5.$mw$,$mw$Dividing both sides by the same nonzero number preserves equivalence.

$\frac{5(x-2)}5=\frac{35}5$

1. The factor 5 cancels on the left.

2. Calculate 35÷5 on the right.

$x-2=7$

$x-2=7$

$x=9\Rightarrow5(9-2)=35$

Do not remove −2 when cancelling the factor 5.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اقسم التعبير كاملاً، لا جزءاً منه.","En":"Divide the entire expression, not one part."},{"Ar":"أبقِ ما داخل القوس دون تغيير.","En":"Keep the expression inside the parentheses unchanged."}],"Solution":{"Idea":{"Ar":"قسمة طرفي المعادلة على العدد غير الصفري نفسه تحافظ على تكافؤ المعادلة.","En":"Dividing both sides by the same nonzero number preserves equivalence."},"FormulaLatex":"\\frac{5(x-2)}5=\\frac{35}5","Steps":[{"Ar":"يُختزل العامل 5 في الطرف الأيسر.","En":"The factor 5 cancels on the left."},{"Ar":"نحسب 35÷5 في الطرف الأيمن.","En":"Calculate 35÷5 on the right."}],"Substitution":{"Ar":"$x-2=7$","En":"$x-2=7$"},"Result":{"Ar":"$x-2=7$","En":"$x-2=7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$x=9\\Rightarrow5(9-2)=35$","En":"$x=9\\Rightarrow5(9-2)=35$"},"CommonError":{"Ar":"لا تحذف −2 عند اختزال العامل 5.","En":"Do not remove −2 when cancelling the factor 5."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"لم يُقسم الطرف الأيمن.","En":"The right side was not divided."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"تم حذف −2 دون عملية مبررة.","En":"The −2 was removed without a justified operation."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لا ينتج −10 بعد قسمة العامل الخارجي.","En":"−10 does not follow from cancelling the outside factor."},"Order":4}]}$mw$),
($mw$growth-v37-grade-11-trig-squared-sine-from-double-cos-squared-1$mw$,$mw$trig-squared-sine-from-double-cos-squared$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-11$mw$,11,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"تبسيط مجموع مثلثي","En":"Simplifying a trigonometric sum"},"Question":{"Ar":"لأي زاوية حقيقية θ، إذا كان $\\sin^2\\theta=\\frac25$ فما قيمة $\\sin^2\\theta+2\\cos^2\\theta$؟","En":"For a real angle θ, if $\\sin^2\\theta=\\frac25$, what is $\\sin^2\\theta+2\\cos^2\\theta$?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 يساوي مجموع المربعين دون معامل 2.","En":"1 is the sum of squares without coefficient 2."}},{"LatexCode":"\\frac65","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"6/5 يحسب ضعف مربع جيب التمام وحده.","En":"6/5 counts only twice cosine squared."}},{"LatexCode":"\\frac85","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"2 يفترض وجود المعامل 2 أمام الحدين.","En":"2 assumes coefficient 2 on both terms."}}],"Hints":[{"Ar":"استرجع مربع جيب التمام.","En":"Recover cosine squared."},{"Ar":"انتبه للمعامل 2 في التعبير المطلوب.","En":"Notice coefficient 2 in the requested expression."}],"Solution":{"Idea":{"Ar":"نعوض عن مربع جيب التمام باستخدام متطابقة فيثاغورس.","En":"Use the Pythagorean identity to replace cosine squared."},"FormulaLatex":"\\sin^2\\theta+\\cos^2\\theta=1","Steps":[{"Ar":"$\\cos^2\\theta=1-2/5=3/5$","En":"$\\cos^2\\theta=1-2/5=3/5$"},{"Ar":"$2/5+2(3/5)=8/5$","En":"$2/5+2(3/5)=8/5$"}],"Substitution":{"Ar":"$2/5+6/5=8/5$","En":"$2/5+6/5=8/5$"},"Result":{"Ar":"$\\frac85$","En":"$\\frac85$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1+\\cos^2\\theta=1+3/5=8/5$","En":"$1+\\cos^2\\theta=1+3/5=8/5$"},"CommonError":{"Ar":"لا تستبدل التعبير كله بالعدد 1.","En":"Do not replace the whole expression with one."}}}$mw$::jsonb,$mw$نعوض عن مربع جيب التمام باستخدام متطابقة فيثاغورس.

$\sin^2\theta+\cos^2\theta=1$

1. $\cos^2\theta=1-2/5=3/5$

2. $2/5+2(3/5)=8/5$

$2/5+6/5=8/5$

$\frac85$

$1+\cos^2\theta=1+3/5=8/5$

لا تستبدل التعبير كله بالعدد 1.$mw$,$mw$Use the Pythagorean identity to replace cosine squared.

$\sin^2\theta+\cos^2\theta=1$

1. $\cos^2\theta=1-2/5=3/5$

2. $2/5+2(3/5)=8/5$

$2/5+6/5=8/5$

$\frac85$

$1+\cos^2\theta=1+3/5=8/5$

Do not replace the whole expression with one.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"استرجع مربع جيب التمام.","En":"Recover cosine squared."},{"Ar":"انتبه للمعامل 2 في التعبير المطلوب.","En":"Notice coefficient 2 in the requested expression."}],"Solution":{"Idea":{"Ar":"نعوض عن مربع جيب التمام باستخدام متطابقة فيثاغورس.","En":"Use the Pythagorean identity to replace cosine squared."},"FormulaLatex":"\\sin^2\\theta+\\cos^2\\theta=1","Steps":[{"Ar":"$\\cos^2\\theta=1-2/5=3/5$","En":"$\\cos^2\\theta=1-2/5=3/5$"},{"Ar":"$2/5+2(3/5)=8/5$","En":"$2/5+2(3/5)=8/5$"}],"Substitution":{"Ar":"$2/5+6/5=8/5$","En":"$2/5+6/5=8/5$"},"Result":{"Ar":"$\\frac85$","En":"$\\frac85$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1+\\cos^2\\theta=1+3/5=8/5$","En":"$1+\\cos^2\\theta=1+3/5=8/5$"},"CommonError":{"Ar":"لا تستبدل التعبير كله بالعدد 1.","En":"Do not replace the whole expression with one."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1 يساوي مجموع المربعين دون معامل 2.","En":"1 is the sum of squares without coefficient 2."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"6/5 يحسب ضعف مربع جيب التمام وحده.","En":"6/5 counts only twice cosine squared."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"2 يفترض وجود المعامل 2 أمام الحدين.","En":"2 assumes coefficient 2 on both terms."},"Order":4}]}$mw$),
($mw$growth-v37-grade-12-trig-reciprocal-squared-ratio-identity-1$mw$,$mw$trig-reciprocal-squared-ratio-identity$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة مربعين مثلثيين","En":"Ratio of trigonometric squares"},"Question":{"Ar":"إذا كانت $\\tan\\theta=2$ و$\\cos\\theta\\ne0$، فما قيمة $\\frac{1}{1+\\tan^2\\theta}$؟","En":"If $\\tan\\theta=2$ and $\\cos\\theta\\ne0$, what is $\\frac{1}{1+\\tan^2\\theta}$?"},"Options":[{"LatexCode":"\\frac15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1/3 ينتج من عدم تربيع 2.","En":"1/3 omits squaring 2."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1/4 يهمل الواحد في المقام.","En":"1/4 omits the one in the denominator."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"5 هو المقام لا مقلوبه.","En":"5 is the denominator, not its reciprocal."}}],"Hints":[{"Ar":"ربع الظل أولاً.","En":"Square tangent first."},{"Ar":"أضف 1 ثم خذ المقلوب.","En":"Add one, then take the reciprocal."}],"Solution":{"Idea":{"Ar":"من المتطابقة 1+tan²θ=sec²θ، يساوي مقلوب الطرف مربع جيب التمام.","En":"By 1+tan²θ=sec²θ, the reciprocal equals cosine squared."},"FormulaLatex":"\\frac1{1+\\tan^2\\theta}=\\cos^2\\theta","Steps":[{"Ar":"$\\tan^2\\theta=4$","En":"$\\tan^2\\theta=4$"},{"Ar":"$1+\\tan^2\\theta=5$","En":"$1+\\tan^2\\theta=5$"}],"Substitution":{"Ar":"$1/(1+4)=1/5$","En":"$1/(1+4)=1/5$"},"Result":{"Ar":"$\\frac15$","En":"$\\frac15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot\\frac15=1$","En":"$5\\cdot\\frac15=1$"},"CommonError":{"Ar":"لا تستبدل مربع الظل بالظل نفسه.","En":"Do not replace tangent squared by tangent."}}}$mw$::jsonb,$mw$من المتطابقة 1+tan²θ=sec²θ، يساوي مقلوب الطرف مربع جيب التمام.

$\frac1{1+\tan^2\theta}=\cos^2\theta$

1. $\tan^2\theta=4$

2. $1+\tan^2\theta=5$

$1/(1+4)=1/5$

$\frac15$

$5\cdot\frac15=1$

لا تستبدل مربع الظل بالظل نفسه.$mw$,$mw$By 1+tan²θ=sec²θ, the reciprocal equals cosine squared.

$\frac1{1+\tan^2\theta}=\cos^2\theta$

1. $\tan^2\theta=4$

2. $1+\tan^2\theta=5$

$1/(1+4)=1/5$

$\frac15$

$5\cdot\frac15=1$

Do not replace tangent squared by tangent.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ربع الظل أولاً.","En":"Square tangent first."},{"Ar":"أضف 1 ثم خذ المقلوب.","En":"Add one, then take the reciprocal."}],"Solution":{"Idea":{"Ar":"من المتطابقة 1+tan²θ=sec²θ، يساوي مقلوب الطرف مربع جيب التمام.","En":"By 1+tan²θ=sec²θ, the reciprocal equals cosine squared."},"FormulaLatex":"\\frac1{1+\\tan^2\\theta}=\\cos^2\\theta","Steps":[{"Ar":"$\\tan^2\\theta=4$","En":"$\\tan^2\\theta=4$"},{"Ar":"$1+\\tan^2\\theta=5$","En":"$1+\\tan^2\\theta=5$"}],"Substitution":{"Ar":"$1/(1+4)=1/5$","En":"$1/(1+4)=1/5$"},"Result":{"Ar":"$\\frac15$","En":"$\\frac15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$5\\cdot\\frac15=1$","En":"$5\\cdot\\frac15=1$"},"CommonError":{"Ar":"لا تستبدل مربع الظل بالظل نفسه.","En":"Do not replace tangent squared by tangent."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"1/3 ينتج من عدم تربيع 2.","En":"1/3 omits squaring 2."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"1/4 يهمل الواحد في المقام.","En":"1/4 omits the one in the denominator."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"5 هو المقام لا مقلوبه.","En":"5 is the denominator, not its reciprocal."},"Order":4}]}$mw$),
($mw$growth-v37-grade-12-trig-square-complement-product-1$mw$,$mw$trig-square-complement-product$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"حاصل ضرب مربعي الجيب وجيب التمام","En":"Product of sine and cosine squares"},"Question":{"Ar":"إذا كان $\\sin^2\\theta=\\frac14$، فما قيمة $\\sin^2\\theta\\cos^2\\theta$؟","En":"If $\\sin^2\\theta=\\frac14$, what is $\\sin^2\\theta\\cos^2\\theta$?"},"Options":[{"LatexCode":"\\frac1{16}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1/16 يربع 1/4 بدلاً من ضرب المربعين المختلفين.","En":"1/16 squares 1/4 instead of multiplying the two different squares."}},{"LatexCode":"\\frac3{16}","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"3/4 قيمة مربع جيب التمام وحده.","En":"3/4 is cosine squared alone."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"1 مجموع المربعين لا حاصل ضربهما.","En":"1 is their sum, not their product."}}],"Hints":[{"Ar":"أوجد المربع المتمم للعدد 1/4.","En":"Find the square complementary to 1/4."},{"Ar":"اضرب المربعين ولا تجمعهما.","En":"Multiply the squares rather than adding."}],"Solution":{"Idea":{"Ar":"نستخرج مربع جيب التمام من متطابقة فيثاغورس ثم نضرب.","En":"Find cosine squared from the Pythagorean identity, then multiply."},"FormulaLatex":"\\sin^2\\theta\\cos^2\\theta=\\sin^2\\theta(1-\\sin^2\\theta)","Steps":[{"Ar":"$\\cos^2\\theta=1-1/4=3/4$","En":"$\\cos^2\\theta=1-1/4=3/4$"},{"Ar":"$(1/4)(3/4)=3/16$","En":"$(1/4)(3/4)=3/16$"}],"Substitution":{"Ar":"$3/16$","En":"$3/16$"},"Result":{"Ar":"$\\frac3{16}$","En":"$\\frac3{16}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/4+3/4=1$","En":"$1/4+3/4=1$"},"CommonError":{"Ar":"لا تخلط بين متطابقة الجمع وحاصل الضرب.","En":"Do not confuse the sum identity with a product."}}}$mw$::jsonb,$mw$نستخرج مربع جيب التمام من متطابقة فيثاغورس ثم نضرب.

$\sin^2\theta\cos^2\theta=\sin^2\theta(1-\sin^2\theta)$

1. $\cos^2\theta=1-1/4=3/4$

2. $(1/4)(3/4)=3/16$

$3/16$

$\frac3{16}$

$1/4+3/4=1$

لا تخلط بين متطابقة الجمع وحاصل الضرب.$mw$,$mw$Find cosine squared from the Pythagorean identity, then multiply.

$\sin^2\theta\cos^2\theta=\sin^2\theta(1-\sin^2\theta)$

1. $\cos^2\theta=1-1/4=3/4$

2. $(1/4)(3/4)=3/16$

$3/16$

$\frac3{16}$

$1/4+3/4=1$

Do not confuse the sum identity with a product.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"أوجد المربع المتمم للعدد 1/4.","En":"Find the square complementary to 1/4."},{"Ar":"اضرب المربعين ولا تجمعهما.","En":"Multiply the squares rather than adding."}],"Solution":{"Idea":{"Ar":"نستخرج مربع جيب التمام من متطابقة فيثاغورس ثم نضرب.","En":"Find cosine squared from the Pythagorean identity, then multiply."},"FormulaLatex":"\\sin^2\\theta\\cos^2\\theta=\\sin^2\\theta(1-\\sin^2\\theta)","Steps":[{"Ar":"$\\cos^2\\theta=1-1/4=3/4$","En":"$\\cos^2\\theta=1-1/4=3/4$"},{"Ar":"$(1/4)(3/4)=3/16$","En":"$(1/4)(3/4)=3/16$"}],"Substitution":{"Ar":"$3/16$","En":"$3/16$"},"Result":{"Ar":"$\\frac3{16}$","En":"$\\frac3{16}$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$1/4+3/4=1$","En":"$1/4+3/4=1$"},"CommonError":{"Ar":"لا تخلط بين متطابقة الجمع وحاصل الضرب.","En":"Do not confuse the sum identity with a product."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"1/16 يربع 1/4 بدلاً من ضرب المربعين المختلفين.","En":"1/16 squares 1/4 instead of multiplying the two different squares."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"3/4 قيمة مربع جيب التمام وحده.","En":"3/4 is cosine squared alone."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"1 مجموع المربعين لا حاصل ضربهما.","En":"1 is their sum, not their product."},"Order":4}]}$mw$);
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
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v37 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
