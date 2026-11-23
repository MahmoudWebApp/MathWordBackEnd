-- MathWorld University: reviewed limits/logic explanations (24 rows), one-time and atomic.
-- Only bilingual explanation texts change; exact source and immutable correct option keys guarded.
BEGIN;
DO $mw_university_limits_discrete$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة: إذا كانت دالة متصلة على [0،1] فإنها تأخذ كل قيمة بين قيمتي الطرفين. بما أن f(0)=-2 سالب وf(1)=1 موجب، فالصفر يقع بينهما. لذلك توجد نقطة ج داخل (0،1) تحقق f(ج)=0. لا تضمن المبرهنة تفرد هذا الجذر.', "DetailedSolutionEn"='Intermediate Value Theorem: Continuity on [0,1] ensures every output between f(0)=-2 and f(1)=1 is attained. Since zero lies between opposite-sign endpoint values, some c in (0,1) satisfies f(c)=0. Uniqueness is not guaranteed.'
 WHERE "Id"=68 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='إذا كانت f متصلة على [0,1] وتحقق f(0)=-2 وf(1)=1، فما الذي تضمنه نظرية القيمة الوسيطة؟' AND "QuestionTextEn"='A continuous function f on [0,1] satisfies f(0)=-2 and f(1)=1. What does the intermediate value theorem guarantee?'
 AND "DetailedSolutionAr"='لأن الصفر يقع بين -2 و1 والدالة متصلة، فهناك c داخل (0,1) بحيث f(c)=0.' AND "DetailedSolutionEn"='Since zero lies between -2 and 1 and f is continuous, there exists c in (0,1) with f(c)=0.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=68 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=68 AND o."Id"=261
 AND o."IsCorrect" AND o."LatexCode"='\exists c\in(0,1):f(c)=0');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 68: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة: إذا كانت دالة متصلة على [0،2] فإنها تأخذ كل قيمة بين قيمتي الطرفين. بما أن f(0)=-3 سالب وf(2)=2 موجب، فالصفر يقع بينهما. لذلك توجد نقطة ج داخل (0،2) تحقق f(ج)=0. لا تضمن المبرهنة تفرد هذا الجذر.', "DetailedSolutionEn"='Intermediate Value Theorem: Continuity on [0,2] ensures every output between f(0)=-3 and f(2)=2 is attained. Since zero lies between opposite-sign endpoint values, some c in (0,2) satisfies f(c)=0. Uniqueness is not guaranteed.'
 WHERE "Id"=144 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='الدالة f متصلة على [0,2] وتحقق f(0)=-3 وf(2)=2. ما النتيجة المضمونة؟' AND "QuestionTextEn"='f is continuous on [0,2], f(0)=-3 and f(2)=2. Which statement is guaranteed?'
 AND "DetailedSolutionAr"='الصفر يقع بين قيمتي الطرفين؛ حسب نظرية القيمة الوسيطة يوجد c بين 0 و2 تحقق f(c)=0.' AND "DetailedSolutionEn"='Zero is between the endpoint values. The intermediate value theorem guarantees a c in (0,2) with f(c)=0.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=144 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=144 AND o."Id"=565
 AND o."IsCorrect" AND o."LatexCode"='\exists c\in(0,2):f(c)=0');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 144: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: وجود المشتقة عند نقطة يستلزم اتصال الدالة فيها. إذا كان حد [f(1+h)−f(1)]/h موجوداً ومنتهياً عندما h→0، فبضربه في h ينتج f(1+h)−f(1)→0. إذن lim عند x→1 لـ f(x) يساوي f(1)، وهي صيغة الاتصال عند النقطة 1.', "DetailedSolutionEn"='Differentiability implies continuity at the same point. If the difference quotient [f(1+h)−f(1)]/h has a finite limit as h→0, multiplying by h gives f(1+h)−f(1)→0. Therefore f(x)→f(1) as x→1, which is continuity at x=1.'
 WHERE "Id"=145 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='إذا كانت f قابلة للاشتقاق عند x=1، فما النتيجة اللازمة؟' AND "QuestionTextEn"='If f is differentiable at x=1, what must hold?'
 AND "DetailedSolutionAr"='وجود المشتقة عند نقطة يستلزم اتصال الدالة عندها.' AND "DetailedSolutionEn"='Differentiability at a point implies continuity at that point.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=145 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=145 AND o."Id"=572
 AND o."IsCorrect" AND o."LatexCode"='f\text{ is continuous at }1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 145: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة تشترط الاتصال على فترة مغلقة. لأن f(0)=-2 أقل من الصفر وf(1)=3 أكبر منه، فإن الاتصال على [0،1] يضمن أخذ القيمة 0 في نقطة داخل (0،1). اختلاف إشارتي الطرفين وحده من دون اتصال لا يكفي؛ لذا شرط الاتصال هو المطلوب.', "DetailedSolutionEn"='The Intermediate Value Theorem requires continuity on a closed interval. Because f(0)=-2 is negative and f(1)=3 is positive, continuity on [0,1] guarantees a root c in (0,1) with f(c)=0. Opposite endpoint signs alone, without continuity, are insufficient.'
 WHERE "Id"=340 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='لدالة f تحقق f(0)=-2 وf(1)=3، ما الشرط الكافي لضمان وجود جذر في (0,1) بنظرية القيمة الوسيطة؟' AND "QuestionTextEn"='For f(0)=-2 and f(1)=3, what sufficient condition guarantees a root in (0,1) by the intermediate value theorem?'
 AND "DetailedSolutionAr"='إذا كانت الدالة متصلة على [0,1] والصفر بين قيمتي الطرفين، يوجد جذر.' AND "DetailedSolutionEn"='Continuity on [0,1] and opposite-signed endpoints guarantee a root.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=340 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=340 AND o."Id"=1350
 AND o."IsCorrect" AND o."LatexCode"='f\text{ is continuous on }[0,1]');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 340: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة تشترط الاتصال على فترة مغلقة. لأن f(0)=-3 أقل من الصفر وf(1)=4 أكبر منه، فإن الاتصال على [0،1] يضمن أخذ القيمة 0 في نقطة داخل (0،1). اختلاف إشارتي الطرفين وحده من دون اتصال لا يكفي؛ لذا شرط الاتصال هو المطلوب.', "DetailedSolutionEn"='The Intermediate Value Theorem requires continuity on a closed interval. Because f(0)=-3 is negative and f(1)=4 is positive, continuity on [0,1] guarantees a root c in (0,1) with f(c)=0. Opposite endpoint signs alone, without continuity, are insufficient.'
 WHERE "Id"=352 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='لدالة f تحقق f(0)=-3 وf(1)=4، ما الشرط الكافي لضمان وجود جذر في (0,1) بنظرية القيمة الوسيطة؟' AND "QuestionTextEn"='For f(0)=-3 and f(1)=4, what sufficient condition guarantees a root in (0,1) by the intermediate value theorem?'
 AND "DetailedSolutionAr"='إذا كانت الدالة متصلة على [0,1] والصفر بين قيمتي الطرفين، يوجد جذر.' AND "DetailedSolutionEn"='Continuity on [0,1] and opposite-signed endpoints guarantee a root.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=352 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=352 AND o."Id"=1397
 AND o."IsCorrect" AND o."LatexCode"='f\text{ is continuous on }[0,1]');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 352: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة تشترط الاتصال على فترة مغلقة. لأن f(0)=-4 أقل من الصفر وf(1)=5 أكبر منه، فإن الاتصال على [0،1] يضمن أخذ القيمة 0 في نقطة داخل (0،1). اختلاف إشارتي الطرفين وحده من دون اتصال لا يكفي؛ لذا شرط الاتصال هو المطلوب.', "DetailedSolutionEn"='The Intermediate Value Theorem requires continuity on a closed interval. Because f(0)=-4 is negative and f(1)=5 is positive, continuity on [0,1] guarantees a root c in (0,1) with f(c)=0. Opposite endpoint signs alone, without continuity, are insufficient.'
 WHERE "Id"=364 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='لدالة f تحقق f(0)=-4 وf(1)=5، ما الشرط الكافي لضمان وجود جذر في (0,1) بنظرية القيمة الوسيطة؟' AND "QuestionTextEn"='For f(0)=-4 and f(1)=5, what sufficient condition guarantees a root in (0,1) by the intermediate value theorem?'
 AND "DetailedSolutionAr"='إذا كانت الدالة متصلة على [0,1] والصفر بين قيمتي الطرفين، يوجد جذر.' AND "DetailedSolutionEn"='Continuity on [0,1] and opposite-signed endpoints guarantee a root.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=364 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=364 AND o."Id"=1448
 AND o."IsCorrect" AND o."LatexCode"='f\text{ is continuous on }[0,1]');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 364: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة تشترط الاتصال على فترة مغلقة. لأن f(0)=-5 أقل من الصفر وf(1)=6 أكبر منه، فإن الاتصال على [0،1] يضمن أخذ القيمة 0 في نقطة داخل (0،1). اختلاف إشارتي الطرفين وحده من دون اتصال لا يكفي؛ لذا شرط الاتصال هو المطلوب.', "DetailedSolutionEn"='The Intermediate Value Theorem requires continuity on a closed interval. Because f(0)=-5 is negative and f(1)=6 is positive, continuity on [0,1] guarantees a root c in (0,1) with f(c)=0. Opposite endpoint signs alone, without continuity, are insufficient.'
 WHERE "Id"=376 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='لدالة f تحقق f(0)=-5 وf(1)=6، ما الشرط الكافي لضمان وجود جذر في (0,1) بنظرية القيمة الوسيطة؟' AND "QuestionTextEn"='For f(0)=-5 and f(1)=6, what sufficient condition guarantees a root in (0,1) by the intermediate value theorem?'
 AND "DetailedSolutionAr"='إذا كانت الدالة متصلة على [0,1] والصفر بين قيمتي الطرفين، يوجد جذر.' AND "DetailedSolutionEn"='Continuity on [0,1] and opposite-signed endpoints guarantee a root.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=376 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=376 AND o."Id"=1495
 AND o."IsCorrect" AND o."LatexCode"='f\text{ is continuous on }[0,1]');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 376: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة القيمة الوسيطة تشترط الاتصال على فترة مغلقة. لأن f(0)=-6 أقل من الصفر وf(1)=7 أكبر منه، فإن الاتصال على [0،1] يضمن أخذ القيمة 0 في نقطة داخل (0،1). اختلاف إشارتي الطرفين وحده من دون اتصال لا يكفي؛ لذا شرط الاتصال هو المطلوب.', "DetailedSolutionEn"='The Intermediate Value Theorem requires continuity on a closed interval. Because f(0)=-6 is negative and f(1)=7 is positive, continuity on [0,1] guarantees a root c in (0,1) with f(c)=0. Opposite endpoint signs alone, without continuity, are insufficient.'
 WHERE "Id"=388 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='لدالة f تحقق f(0)=-6 وf(1)=7، ما الشرط الكافي لضمان وجود جذر في (0,1) بنظرية القيمة الوسيطة؟' AND "QuestionTextEn"='For f(0)=-6 and f(1)=7, what sufficient condition guarantees a root in (0,1) by the intermediate value theorem?'
 AND "DetailedSolutionAr"='إذا كانت الدالة متصلة على [0,1] والصفر بين قيمتي الطرفين، يوجد جذر.' AND "DetailedSolutionEn"='Continuity on [0,1] and opposite-signed endpoints guarantee a root.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=388 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=388 AND o."Id"=1542
 AND o."IsCorrect" AND o."LatexCode"='f\text{ is continuous on }[0,1]');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 388: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التوافيق: اختيار شخصين من سبعة دون ترتيب يُحسب بـ C(7,2) = 7!/(2!5!). نبسط إلى 7 × 6 ÷ 2 = 21. نقسم على 2 لأن اختيار أ ثم ب يعطي المجموعة نفسها عند اختيار ب ثم أ، ولا يُحسب ترتيب الأشخاص هنا.', "DetailedSolutionEn"='Combinations rule: Selecting two people from seven without order is C(7,2) = 7!/(2!5!) = 7×6/2 = 21. Divide by two because the pair A,B is identical to B,A when order is irrelevant.'
 WHERE "Id"=444 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='كم طريقة لاختيار شخصين من 7 أشخاص دون ترتيب؟' AND "QuestionTextEn"='How many unordered ways can two people be selected from seven?'
 AND "DetailedSolutionAr"='عدد التوافيق $\binom72=\frac{7\cdot6}{2}=21$.' AND "DetailedSolutionEn"='Use combinations: $\binom72=\frac{7\cdot6}{2}=21$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=444 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=444 AND o."Id"=1766
 AND o."IsCorrect" AND o."LatexCode"='21');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 444: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون العكس النقيض: الشرطية P ⇒ Q مكافئة دائماً للشرطية ¬Q ⇒ ¬P. الاثنتان كاذبتان فقط عندما تكون P صادقة وQ كاذبة، وصادقتان في بقية حالات جدول الصدق. أما Q ⇒ P فهي العكس وليست مكافئة بالضرورة.', "DetailedSolutionEn"='Contrapositive rule: P⇒Q is logically equivalent to ¬Q⇒¬P. Both are false only when P is true and Q false, and true for the other three truth assignments. Reversing without negating, Q⇒P, is not generally equivalent.'
 WHERE "Id"=445 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='العبارة $P\Rightarrow Q$ تكافئ منطقياً أي عبارة؟' AND "QuestionTextEn"='Which statement is logically equivalent to $P\Rightarrow Q$?'
 AND "DetailedSolutionAr"='العكس النقيض مكافئ دائماً: $\neg Q\Rightarrow\neg P$.' AND "DetailedSolutionEn"='An implication is logically equivalent to its contrapositive: $\neg Q\Rightarrow\neg P$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=445 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=445 AND o."Id"=1772
 AND o."IsCorrect" AND o."LatexCode"='\neg Q\Rightarrow\neg P');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 445: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون دي مورغان: نفي العبارة المركبة من اقتران P وQ يعادل فصل نفي كل منهما. لذلك ¬(P ∧ Q) = ¬P ∨ ¬Q. يمكن التحقق بجدول الصدق: نفي الاقتران صادق إذا كانت واحدة على الأقل من العبارتين كاذبة.', "DetailedSolutionEn"='De Morgan''s law: Negating a conjunction turns AND into OR and negates each component: ¬(P∧Q) ≡ ¬P∨¬Q. A truth table confirms both expressions hold whenever at least one of P or Q is false.'
 WHERE "Id"=446 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='أي تعبير منطقي يكافئ $\neg(P\land Q)$؟' AND "QuestionTextEn"='Which logical expression is equivalent to $\neg(P\land Q)$?'
 AND "DetailedSolutionAr"='حسب قانون دي مورغان، نفي اقتران عبارتين يساوي فصل نفييهما: $\neg P\lor\neg Q$.' AND "DetailedSolutionEn"='By De Morgan''s law, negating a conjunction gives the disjunction of the negations: $\neg P\lor\neg Q$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=446 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=446 AND o."Id"=1773
 AND o."IsCorrect" AND o."LatexCode"='\neg P\lor\neg Q');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 446: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبرهنة المصافحة للرسم غير الموجه: مجموع درجات الرؤوس = ضعف عدد الحواف، لأن كل حافة تدخل مرتين في مجموع الدرجات. الدرجات 2 و2 و2 و2، ومجموعها 8. إذن عدد الحواف = 8 ÷ 2 = 4.', "DetailedSolutionEn"='Handshaking Lemma: Sum of vertex degrees = 2 × number of edges in an undirected graph, since every edge contributes to two vertex degrees. The four degrees total 2+2+2+2=8; divide by two to get 4 edges.'
 WHERE "Id"=447 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='في رسم بياني غير موجه درجات رؤوسه $2,2,2,2$. كم ضلعاً فيه؟' AND "QuestionTextEn"='An undirected graph has vertex degrees $2,2,2,2$. How many edges does it have?'
 AND "DetailedSolutionAr"='مجموع الدرجات 8 ويحسب كل ضلع مرتين، لذا عدد الأضلاع $8/2=4$.' AND "DetailedSolutionEn"='The degree sum is 8 and counts every edge twice, hence $8/2=4$ edges.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=447 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=447 AND o."Id"=1779
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 447: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبدأ صندوق الحمام: توزيع 13 عنصراً على 12 صندوقاً يضمن أن صندوقاً واحداً على الأقل يحوي سقف(13/12) = 2 عنصرين. لو احتوى كل صندوق عنصراً واحداً فقط لاستطعنا وضع 12 عنصراً، ما يناقض وجود العنصر الثالث عشر.', "DetailedSolutionEn"='Pigeonhole principle: Placing 13 objects into 12 boxes guarantees some box has at least ceil(13/12)=2 objects. If every box held at most one, only 12 objects could fit, contradicting the thirteenth object.'
 WHERE "Id"=449 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='وُزِّع 13 عنصراً على 12 صندوقاً. ما أقل عدد من العناصر يُضمَن وجوده في صندوق واحد على الأقل؟' AND "QuestionTextEn"='Thirteen objects are placed into twelve boxes. What is the minimum number guaranteed to occur in at least one box?'
 AND "DetailedSolutionAr"='وفق مبدأ الحمام، $\lceil13/12\rceil=2$، فلا بد من صندوق يحوي عنصرين على الأقل.' AND "DetailedSolutionEn"='By the pigeonhole principle, $\lceil13/12\rceil=2$, so some box holds at least two objects.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=449 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=449 AND o."Id"=1785
 AND o."IsCorrect" AND o."LatexCode"='2');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 449: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأشجار: الرسم المتصل الخالي من الدورات ذو n رؤوس له n−1 حافة بالضبط. بما أن الشجرة فيها 9 رؤوس، عدد الحواف = 9−1 = 8. لا يمكن إضافة حافة أخرى بين رؤوس الشجرة من دون تكوين دورة، لذلك العلاقة ثابتة.', "DetailedSolutionEn"='Tree edge theorem: A connected acyclic graph with n vertices contains exactly n−1 edges. With n=9, the tree has 9−1=8 edges. Adding another edge would create a cycle, confirming the characteristic count.'
 WHERE "Id"=450 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='شجرة متصلة بلا دورات فيها 9 رؤوس. كم ضلعاً فيها؟' AND "QuestionTextEn"='A connected acyclic tree has 9 vertices. How many edges does it have?'
 AND "DetailedSolutionAr"='كل شجرة ذات $n$ رؤوس تحتوي على $n-1$ ضلع، لذا $9-1=8$.' AND "DetailedSolutionEn"='Every tree with $n$ vertices has $n-1$ edges, so $9-1=8$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=450 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=450 AND o."Id"=1791
 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 450: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة صدق الشرطية P ⇒ Q: لا تكون خاطئة إلا عندما تكون المقدمة P صادقة والنتيجة Q كاذبة. في السؤال المقدمة P كاذبة والنتيجة Q صادقة، فلا تتحقق حالة الكذب الوحيدة. لذلك قيمة الشرطية صادقة.', "DetailedSolutionEn"='Material implication rule: P⇒Q is false only when antecedent P is true and consequent Q is false. Here P is false and Q is true, so that exceptional false case does not occur. The implication is true.'
 WHERE "Id"=488 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='إذا كانت $P$ خاطئة و$Q$ صحيحة، فما قيمة $P\Rightarrow Q$؟' AND "QuestionTextEn"='If $P$ is false and $Q$ is true, what is the truth value of $P\Rightarrow Q$?'
 AND "DetailedSolutionAr"='الشرطية $P\Rightarrow Q$ خاطئة فقط عندما تكون $P$ صحيحة و$Q$ خاطئة؛ لذلك هي صحيحة هنا.' AND "DetailedSolutionEn"='A material implication is false only when $P$ is true and $Q$ is false, so it is true here.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=488 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=488 AND o."Id"=1941
 AND o."IsCorrect" AND o."LatexCode"='\text{صحيحة (True)}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 488: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التوافيق مع عنصر إجباري: نثبت الشخص المحدد ضمن لجنة من ثلاثة ثم نختار شخصين من الخمسة الآخرين دون ترتيب. عدد اللجان C(5,2) = 5 × 4 ÷ 2 = 10. اختيار C(6,3) يحصي لجاناً لا تضم الشخص المطلوب.', "DetailedSolutionEn"='Combinations with a mandatory member: Fix the designated person first, then select two more out of the remaining five, ignoring order. C(5,2)=5×4/2=10 valid committees; C(6,3) would incorrectly include groups excluding the required person.'
 WHERE "Id"=489 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='كم مجموعة من 3 أشخاص يمكن تشكيلها من 6 أشخاص إذا كان يجب أن تضم شخصاً معيناً؟' AND "QuestionTextEn"='How many three-person groups can be chosen from six people if a designated person must be included?'
 AND "DetailedSolutionAr"='نثبت الشخص المطلوب ثم نختار شخصين من الخمسة الباقين؛ العدد $\binom52=10$.' AND "DetailedSolutionEn"='Include the designated person, then choose 2 of the other 5: $\binom52=10$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=489 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=489 AND o."Id"=1946
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 489: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التكافؤ بترديد 4: تكون الأعداد الصحيحة متكافئة إذا أعطت باقي القسمة نفسه على 4. البواقي الممكنة حصراً 0 و1 و2 و3، وينتمي كل عدد صحيح إلى صنف واحد منها. لذلك لدينا أربعة أصناف تكافؤ متميزة.', "DetailedSolutionEn"='Congruence modulo four groups integers by their remainder after division by 4. The possible remainders are exactly 0, 1, 2, and 3, and each integer belongs to one such class. There are consequently 4 distinct equivalence classes.'
 WHERE "Id"=490 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='على مجموعة الأعداد الصحيحة، عرّف $a\sim b$ إذا كان $a-b$ من مضاعفات 4. كم صنف تكافؤ مختلف يوجد؟' AND "QuestionTextEn"='On the integers, define $a\sim b$ when $a-b$ is divisible by 4. How many distinct equivalence classes are there?'
 AND "DetailedSolutionAr"='يوجد أربعة أصناف بحسب الباقي عند القسمة على 4: 0 و1 و2 و3.' AND "DetailedSolutionEn"='The four classes are determined by residues 0, 1, 2 and 3 modulo 4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=490 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=490 AND o."Id"=1951
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 490: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الحواف للرسم البسيط غير الموجه: لا يمكن وجود أكثر من حافة واحدة بين أي زوج مختلف من الرؤوس، ولا توجد حلقات. لأقصى عدد حواف بين 5 رؤوس نربط كل زوج، فيكون العدد C(5,2) = 5 × 4 ÷ 2 = 10 حواف.', "DetailedSolutionEn"='Simple-undirected-graph rule: At most one edge can connect each unordered pair of distinct vertices and no loops are permitted. The complete graph on five vertices contains all C(5,2) = 5×4/2 = 10 edges, the maximum.'
 WHERE "Id"=491 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='ما أكبر عدد من الحواف في رسم بياني بسيط غير موجه يحوي 5 رؤوس؟' AND "QuestionTextEn"='What is the maximum number of edges in a simple undirected graph with five vertices?'
 AND "DetailedSolutionAr"='في الرسم الكامل يتصل كل زوج من الرؤوس بحافة واحدة، فيكون العدد $\binom52=5\times4/2=10$.' AND "DetailedSolutionEn"='In a complete graph, every pair of vertices is joined by one edge: $\binom52=5\times4/2=10$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=491 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=491 AND o."Id"=1955
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 491: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='مبدأ الحمام: نجزئ {1،2،3،4} إلى زوجين مجموع كل منهما 5، وهما {1،4} و{2،3}. عند اختيار ثلاثة أعداد مختلفة من زوجين فقط، لابد أن يؤخذ عددان من أحد الزوجين، ومجموعهما 5. لذلك الإجابة نعم دائماً.', "DetailedSolutionEn"='Pigeonhole argument: Partition {1,2,3,4} into the two complementary pairs {1,4} and {2,3}, each summing to five. Picking three distinct numbers from only two pairs forces a complete pair among the chosen numbers, proving the answer is always yes.'
 WHERE "Id"=492 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='اختيرت ثلاثة أعداد مختلفة من $\{1,2,3,4\}$. هل يُضمن وجود عددين مجموعهما 5؟' AND "QuestionTextEn"='Three distinct numbers are chosen from $\{1,2,3,4\}$. Must two of them add up to 5?'
 AND "DetailedSolutionAr"='الأزواج المكملة هي (1،4) و(2،3). اختيار ثلاثة أعداد من هذين الزوجين يضمن أخذ عددين من زوج واحد، ومجموعهما 5.' AND "DetailedSolutionEn"='The complementary pairs are (1,4) and (2,3). Choosing three numbers from these two pairs forces both members of one pair to be selected, so their sum is 5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=492 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=492 AND o."Id"=1957
 AND o."IsCorrect" AND o."LatexCode"='\text{نعم (Yes)}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 492: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون تعدّي العلاقة: إذا كان 1R2 وكان 2R3، فلا بد أن يكون 1R3. العلاقة المعطاة تحتوي الزوجين المرتبين (1،2) و(2،3)، لذلك يلزم إضافة الزوج (1،3). هذا تطبيق للتعدي، وليس لمفهوم التناظر.', "DetailedSolutionEn"='Transitivity rule: If 1R2 and 2R3, then 1R3 must hold. As ordered pairs (1,2) and (2,3) are present, pair (1,3) is required to satisfy transitivity. This does not follow from symmetry.'
 WHERE "Id"=795 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='علاقة على {1,2,3} تحتوي الزوجين (1,2) و(2,3) فقط. أي زوج يجب إضافته لتصبح متعدية؟' AND "QuestionTextEn"='A relation on {1,2,3} contains exactly (1,2) and (2,3). Which extra pair is needed for transitivity?'
 AND "DetailedSolutionAr"='لأن 1R2 و2R3، فالتعدي يقتضي 1R3؛ نضيف الزوج (1,3).' AND "DetailedSolutionEn"='Since 1R2 and 2R3, transitivity requires 1R3. Add the pair (1,3).'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=795 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=795 AND o."Id"=3170
 AND o."IsCorrect" AND o."LatexCode"='(1,3)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 795: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الرسم الثنائي الكامل Kₘ,ₙ: كل رأس في المجموعة الأولى يتصل بجميع رؤوس الثانية؛ لذلك عدد الحواف = m × n. في K₂,₃ مجموعتا الرؤوس تحويان 2 و3، فنحسب 2 × 3 = 6 حواف متمايزة.', "DetailedSolutionEn"='Complete bipartite graph rule: K_(m,n) connects every vertex in one group to all vertices in the other, giving m×n edges. For K_(2,3), the groups contain 2 and 3 vertices, so 2×3=6 distinct edges.'
 WHERE "Id"=831 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='في الرسم البياني الثنائي الكامل K₂,₃، كل رأس من المجموعة الأولى متصل بكل رأس من الثانية. كم حافة في الرسم؟' AND "QuestionTextEn"='In the complete bipartite graph K₂,₃, every vertex in the first group connects to every vertex in the second. How many edges are there?'
 AND "DetailedSolutionAr"='عدد الحواف في Kₘ,ₙ هو m × n؛ بالتالي 2 × 3 = 6 حواف.' AND "DetailedSolutionEn"='A complete bipartite graph Kₘ,ₙ has m × n edges; here 2 × 3 = 6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=831 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=831 AND o."Id"=3315
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 831: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة تلوين الدورة الفردية: عند السير حول خمسة رؤوس بمحاولة التناوب بين لونين يظهر تعارض عند وصل الرأس الخامس بالأول. لهذا لا تكفي لونان لتلوين دورة طولها 5 من دون تساوي ألوان المتجاورين. ثلاثة ألوان تكفي، إذن العدد اللوني 3.', "DetailedSolutionEn"='Odd-cycle coloring theorem: Alternating two colors around a five-vertex cycle causes a color conflict on the closing edge. A proper coloring of an odd cycle is therefore impossible with two colors, while three suffice; its chromatic number is 3.'
 WHERE "Id"=832 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='ما أقل عدد من الألوان لتلوين رؤوس دورة بسيطة مؤلفة من 5 رؤوس بحيث لا يتجاور رأسان من اللون نفسه؟' AND "QuestionTextEn"='What is the minimum number of colors needed to color the vertices of a 5-cycle so adjacent vertices have different colors?'
 AND "DetailedSolutionAr"='الدورة ذات طول فردي لا يمكن تلوينها بلونين، وثلاثة ألوان تكفي، لذا العدد اللوني 3.' AND "DetailedSolutionEn"='An odd cycle cannot be colored with two colors, but three colors suffice; the chromatic number is 3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=832 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=832 AND o."Id"=3320
 AND o."IsCorrect" AND o."LatexCode"='3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 832: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة التكافؤ الثنائي P ↔ Q: العبارة صادقة حين تتطابق قيمتا الصدق للجزأين. الحالات الممكنة الأربع هي (ص،ص) و(ص،خ) و(خ،ص) و(خ،خ). تتطابق القيمتان في الأولى والرابعة فقط، فيكون عدد الحالات الصادقة 2.', "DetailedSolutionEn"='Biconditional truth rule: P↔Q is true exactly when P and Q share the same truth value. The four assignments are (T,T), (T,F), (F,T), (F,F). Only the first and last agree, so there are 2 true assignments.'
 WHERE "Id"=833 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='عند فحص الحالات الأربع الممكنة لقيمتي P وQ، في كم حالة تكون العبارة P ↔ Q صحيحة؟' AND "QuestionTextEn"='Among the four possible truth assignments for P and Q, in how many is the biconditional P ↔ Q true?'
 AND "DetailedSolutionAr"='التكافؤ صادق عندما تتساوى القيمتان: (ص،ص) و(خ،خ)، أي في حالتين.' AND "DetailedSolutionEn"='A biconditional is true when both truth values match: (true,true) and (false,false), so in two assignments.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=833 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=833 AND o."Id"=3321
 AND o."IsCorrect" AND o."LatexCode"='2');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 833: original question/explanation/answer changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الامتصاص في المنطق: P ∧ (P ∨ Q) = P. إذا كانت P كاذبة فالاقتران كله كاذب، وإذا كانت P صادقة فإن الفصل P ∨ Q صادق، ويصبح الاقتران صادقاً. النتيجة تساوي P في جميع قيم Q.', "DetailedSolutionEn"='Boolean absorption law: P∧(P∨Q)=P. If P is false, the conjunction is false; if P is true, P∨Q is automatically true, making the conjunction true as well. Hence the whole expression equals P regardless of Q.'
 WHERE "Id"=834 AND "StageId"=4 AND "CategoryId"=24
 AND "QuestionTextAr"='بسط العبارة المنطقية P ∧ (P ∨ Q) باستخدام قوانين الجبر المنطقي.' AND "QuestionTextEn"='Simplify the logical expression P ∧ (P ∨ Q) using Boolean algebra.'
 AND "DetailedSolutionAr"='بقانون الامتصاص P ∧ (P ∨ Q) = P لأي قيمتي صدق لـ P وQ.' AND "DetailedSolutionEn"='By the absorption law, P ∧ (P ∨ Q) = P for all truth assignments.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=834 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=834 AND o."Id"=3326
 AND o."IsCorrect" AND o."LatexCode"='P');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University limits/discrete problem 834: original question/explanation/answer changed; rollback all'; END IF;
END $mw_university_limits_discrete$;
COMMIT;
