-- One-time, guarded bilingual worked-solution updates, primary fractions category 21.
-- All-or-nothing transaction. No options/answers, stages, access, or student-data modifications.
BEGIN;
DO $mw_fraction_review$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: لإيجاد كسر من كمية نضرب الكمية في الكسر. الكتب العلمية = (2/3) × 36؛ نقسم 36 على 3 أولاً فنحصل على 12، ثم نضرب في 2: 12 × 2 = 24 كتاباً علمياً. التحقق: 24 من 36 يساوي ثلثي المجموع.',
 "DetailedSolutionEn"='Rule used: To find a fraction of a quantity, multiply the total by the fraction. Science books = (2/3) × 36. First 36 ÷ 3 = 12, then 12 × 2 = 24 books. Check: 24/36 = 2/3.'
 WHERE "Id"=423 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='في مكتبة 36 كتاباً، ثلثاها كتب علمية. كم كتاباً علمياً يوجد؟' AND "QuestionTextEn"='A library has 36 books. Two-thirds are science books. How many science books are there?'
 AND "DetailedSolutionAr"='نحسب $\frac23\times36=24$ كتاباً علمياً.' AND "DetailedSolutionEn"='Compute $\frac23\times36=24$ science books.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=423 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=423
 AND o."Id"=1682 AND o."IsCorrect" AND o."LatexCode"='24');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 423: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: الكسر الذي يمثل جزءاً من كل = عدد الأجزاء المختارة ÷ العدد الكلي للأجزاء المتساوية. قُسمت الفطيرة إلى 8 قطع متساوية وأُكلت 3 منها. إذن الجزء المأكول = 3/8؛ البسط 3 والمقام 8.',
 "DetailedSolutionEn"='Rule used: Fraction of a whole = selected equal parts ÷ total equal parts. The pie has 8 equal pieces, and 3 were eaten. Thus the eaten fraction is 3/8: numerator 3, denominator 8.'
 WHERE "Id"=424 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='قُسّمت فطيرة إلى 8 قطع متساوية وأُكلت 3 قطع. ما الكسر الذي يمثل الجزء المأكول؟' AND "QuestionTextEn"='A pie is cut into 8 equal pieces and 3 pieces are eaten. What fraction was eaten?'
 AND "DetailedSolutionAr"='عدد القطع المأكولة 3 من أصل 8 قطع متساوية، لذلك الكسر هو $\frac{3}{8}$.' AND "DetailedSolutionEn"='Three of the eight equal pieces were eaten, so the fraction is $\frac{3}{8}$. '
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=424 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=424
 AND o."Id"=1685 AND o."IsCorrect" AND o."LatexCode"='\frac{3}{8}');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 424: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: النسبة المئوية تعني أجزاء من مئة، و25% = 25/100 = 1/4. لإيجاد 25% من 80 طالباً نحسب 80 ÷ 4 = 20 طالباً. إذن دخل المسابقة 20 طالباً، وهو ربع المجموعة.',
 "DetailedSolutionEn"='Rule used: Percent means per hundred, so 25% = 25/100 = 1/4. For 80 pupils, calculate 80 × 1/4 = 80 ÷ 4 = 20 pupils. This is one quarter of the group.'
 WHERE "Id"=426 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='في صف 80 تلميذاً، شارك 25% منهم في مسابقة. كم تلميذاً شارك؟' AND "QuestionTextEn"='In a school group of 80 pupils, 25% entered a competition. How many entered?'
 AND "DetailedSolutionAr"='نحوّل 25% إلى ربع: $\frac14\times80=20$.' AND "DetailedSolutionEn"='25% is one quarter: $\frac14\times80=20$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=426 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=426
 AND o."Id"=1694 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 426: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='قاعدة التقريب إلى أقرب جزء من مئة: نحتفظ برقمين بعد الفاصلة وننظر إلى الرقم الثالث. في 4.786 رقم الأجزاء من مئة هو 8 ورقم الألف هو 6؛ ولأنه 6 أكبر من أو يساوي 5 نزيد 8 إلى 9، فتكون النتيجة 4.79.',
 "DetailedSolutionEn"='Rounding rule: To the nearest hundredth, keep two decimal places and inspect the third digit. In 4.786, the hundredths digit is 8 and the thousandths digit is 6. Since 6 ≥ 5, increase 8 to 9; result: 4.79.'
 WHERE "Id"=427 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='قرّب العدد $4.786$ إلى أقرب جزء من مئة.' AND "QuestionTextEn"='Round $4.786$ to the nearest hundredth.'
 AND "DetailedSolutionAr"='رقم الألف 6، لذا نزيد رقم الجزء من مئة من 8 إلى 9؛ الناتج $4.79$.' AND "DetailedSolutionEn"='The thousandths digit is 6, so round the hundredths digit up from 8 to 9: $4.79$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=427 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=427
 AND o."Id"=1699 AND o."IsCorrect" AND o."LatexCode"='4.79');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 427: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: على خط الأعداد من 0 إلى 1 المقسم إلى 8 أجزاء متساوية، طول كل خطوة هو 1/8. بدءاً من الصفر، العلامة الخامسة تبعد 5 خطوات، أي 5 × (1/8) = 5/8. هذا الكسر أقل من 1 وأكبر من الصفر.',
 "DetailedSolutionEn"='Rule used: Dividing the interval from 0 to 1 into 8 equal parts makes each step 1/8. The fifth tick after zero is 5 steps away: 5 × 1/8 = 5/8. It lies strictly between 0 and 1.'
 WHERE "Id"=477 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='قُسّمت المسافة بين 0 و1 على مستقيم أعداد إلى 8 أجزاء متساوية. أي كسر يقع عند العلامة الخامسة بعد الصفر؟' AND "QuestionTextEn"='The interval from 0 to 1 on a number line is divided into 8 equal parts. Which fraction marks the fifth tick after zero?'
 AND "DetailedSolutionAr"='كل علامة تمثل ثُمْناً واحداً، لذا العلامة الخامسة بعد الصفر هي $\frac58$.' AND "DetailedSolutionEn"='Each interval represents one eighth, so the fifth tick after zero marks $\frac58$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=477 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=477
 AND o."Id"=1898 AND o."IsCorrect" AND o."LatexCode"='\frac58');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 477: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: 10% = 10/100 = 1/10. لإيجاد 10% من 340 نحسب 340 × 1/10 = 340 ÷ 10 = 34. إذن عشر العدد 340 يساوي 34، وليس 340.',
 "DetailedSolutionEn"='Rule used: 10% equals 10/100 = 1/10. Calculate 10% of 340 as 340 × 1/10 = 340 ÷ 10 = 34. Thus ten percent of 340 is 34.'
 WHERE "Id"=617 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='كم تساوي 10% من 340؟' AND "QuestionTextEn"='What is 10% of 340?'
 AND "DetailedSolutionAr"='10% تعني العشر، و340 ÷ 10 = 34.' AND "DetailedSolutionEn"='Ten percent is one tenth, and 340 ÷ 10 = 34.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=617 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=617
 AND o."Id"=2459 AND o."IsCorrect" AND o."LatexCode"='34');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 617: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: 5% هو نصف 10%، لأن 5 = 10 ÷ 2. بما أن 10% من 260 هو 26، فنحسب 5% = 26 ÷ 2 = 13. التحقق: 260 × 5/100 = 13.',
 "DetailedSolutionEn"='Rule used: 5% is half of 10%. Given that 10% of 260 is 26, half of 26 is 26 ÷ 2 = 13. Check directly: 260 × 5/100 = 13.'
 WHERE "Id"=618 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='يعرف طالب أن 10% من العدد 260 تساوي 26. فكم تساوي 5% من العدد نفسه؟' AND "QuestionTextEn"='A pupil knows that 10% of 260 is 26. What is 5% of the same amount?'
 AND "DetailedSolutionAr"='10% من 260 يساوي 26، و5% نصفه، أي 13.' AND "DetailedSolutionEn"='10% of 260 is 26. Five percent is half of that, or 13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=618 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=618
 AND o."Id"=2462 AND o."IsCorrect" AND o."LatexCode"='13');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 618: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: النسبة المئوية = الجزء ÷ الكل × 100%. من أصل 120 طالباً اختار 30 الرياضيات، لذا 30 ÷ 120 = 1/4 = 0.25؛ ثم 0.25 × 100% = 25%. النتيجة 25%.',
 "DetailedSolutionEn"='Rule used: Percentage = part ÷ whole × 100%. The fraction is 30/120 = 1/4 = 0.25. Multiplying 0.25 by 100% gives 25%. Therefore 25% chose mathematics.'
 WHERE "Id"=619 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='اختار 30 طالباً الرياضيات من بين 120 طالباً. ما نسبتهم المئوية؟' AND "QuestionTextEn"='30 out of 120 pupils chose mathematics. What percentage is that?'
 AND "DetailedSolutionAr"='النسبة = 30 ÷ 120 = 1/4 = 25%.' AND "DetailedSolutionEn"='The share is 30 ÷ 120 = 1/4 = 25%.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=619 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=619
 AND o."Id"=2466 AND o."IsCorrect" AND o."LatexCode"='25%');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 619: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: مقدار الخصم = السعر الأصلي × نسبة الخصم. بما أن 25% = 1/4 وسعر الحقيبة 80 وحدة، نحسب الخصم = 80 ÷ 4 = 20 وحدة. السعر بعد الخصم 80 − 20 = 60، لكنه ليس المطلوب؛ المطلوب قيمة الخصم 20.',
 "DetailedSolutionEn"='Rule used: Discount amount = original price × discount rate. Since 25% = 1/4, the discount on 80 units is 80 ÷ 4 = 20 units. The price after discount is 60, but the question asks for the 20-unit discount.'
 WHERE "Id"=620 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='سعر حقيبة 80 وحدة نقدية. إذا كان الخصم 25%، فما **قيمة الخصم**؟' AND "QuestionTextEn"='A bag costs 80 units of currency. With a 25% discount, what is the **discount amount**?'
 AND "DetailedSolutionAr"='25% = ربع، وقيمة الخصم 80 ÷ 4 = 20. السعر النهائي 60 لكنه غير مطلوب.' AND "DetailedSolutionEn"='Twenty-five percent is a quarter: 80 ÷ 4 = 20 discount. The final price, 60, is not asked for.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=620 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=620
 AND o."Id"=2470 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 620: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: الكسور المتكافئة تنتج عند ضرب البسط والمقام في العامل نفسه غير الصفري. في 3/5 = س/20 نضرب المقام 5 في 4 ليصبح 20، لذلك نضرب البسط 3 في 4 أيضاً: س = 3 × 4 = 12. التحقق: 12/20 = 3/5.',
 "DetailedSolutionEn"='Rule used: Equivalent fractions multiply numerator and denominator by the same nonzero factor. In 3/5 = x/20, the denominator 5 becomes 20 by multiplying by 4. Therefore x = 3 × 4 = 12; check 12/20 = 3/5.'
 WHERE "Id"=693 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='أكمل الكسر المكافئ: 3/5 = x/20. ما قيمة x؟' AND "QuestionTextEn"='Complete the equivalent fraction: 3/5 = x/20. Find x.'
 AND "DetailedSolutionAr"='ضربنا المقام 5 في 4، لذلك نضرب البسط 3 في 4، فيكون x = 12.' AND "DetailedSolutionEn"='The denominator is multiplied by 4, so multiply the numerator by 4: x = 12.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=693 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=693
 AND o."Id"=2826 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 693: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: تبسيط كسر يتم بقسمة البسط والمقام على القاسم المشترك الأكبر. القاسم المشترك الأكبر للعددين 14 و21 هو 7؛ إذن 14/21 = (14 ÷ 7)/(21 ÷ 7) = 2/3. لا يوجد قاسم مشترك أكبر من 1 بين 2 و3.',
 "DetailedSolutionEn"='Rule used: Simplify a fraction by dividing numerator and denominator by their greatest common divisor. gcd(14, 21) = 7, so 14/21 = (14 ÷ 7)/(21 ÷ 7) = 2/3. Since 2 and 3 share no factor greater than 1, this is simplest form.'
 WHERE "Id"=694 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='ما الصورة المبسطة للكسر 14/21؟' AND "QuestionTextEn"='What is the simplest form of 14/21?'
 AND "DetailedSolutionAr"='القاسم المشترك الأكبر لـ14 و21 هو 7. بالقسمة عليهما: 14/21 = 2/3.' AND "DetailedSolutionEn"='The greatest common divisor of 14 and 21 is 7. Divide numerator and denominator by 7 to obtain 2/3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=694 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=694
 AND o."Id"=2830 AND o."IsCorrect" AND o."LatexCode"='\frac23');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 694: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: العدد العشري ذو منزلتين بعد الفاصلة يكتب على مقام 100. نحول 0.75 إلى 75/100، ثم نقسم البسط والمقام على 25: (75 ÷ 25)/(100 ÷ 25) = 3/4. إذن 0.75 يساوي ثلاثة أرباع تماماً.',
 "DetailedSolutionEn"='Rule used: A decimal with two places can be written over 100. Thus 0.75 = 75/100. Divide both terms by 25: (75 ÷ 25)/(100 ÷ 25) = 3/4. Therefore 0.75 equals three quarters exactly.'
 WHERE "Id"=695 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='أي كسر يساوي العدد العشري 0.75 بالضبط؟' AND "QuestionTextEn"='Which fraction is exactly equal to the decimal 0.75?'
 AND "DetailedSolutionAr"='0.75 = 75/100، ونختصر بقسمة البسط والمقام على 25 لنحصل على 3/4.' AND "DetailedSolutionEn"='0.75 = 75/100. Divide numerator and denominator by 25 to get 3/4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=695 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=695
 AND o."Id"=2835 AND o."IsCorrect" AND o."LatexCode"='\frac34');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 695: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: كسران متكافئان يجب أن يكون لهما القيمة نفسها، ولا يكفي جمع 1 للبسط والمقام. نقارن 2/3 و3/4 بالضرب التبادلي: 2 × 4 = 8 و3 × 3 = 9، وبما أن 8 < 9 إذن 2/3 < 3/4. كلام التلميذ غير صحيح.',
 "DetailedSolutionEn"='Rule used: Equivalent fractions must have the same value; adding 1 to both numerator and denominator does not preserve value in general. Cross-multiply: 2 × 4 = 8 and 3 × 3 = 9. Since 8 < 9, we have 2/3 < 3/4, not equality.'
 WHERE "Id"=696 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='يقول طالب إن 2/3 و3/4 كسران متكافئان لأننا زدنا 1 للبسط والمقام. ما المقارنة الصحيحة؟' AND "QuestionTextEn"='A pupil says 2/3 and 3/4 are equivalent because 1 was added to both numerator and denominator. Which comparison is correct?'
 AND "DetailedSolutionAr"='بالضرب التبادلي 2 × 4 = 8 و3 × 3 = 9، لذا 2/3 أصغر من 3/4، ولا يكفي جمع العدد نفسه مع البسط والمقام للحفاظ على التكافؤ.' AND "DetailedSolutionEn"='Cross-multiply: 2 × 4 = 8 and 3 × 3 = 9, so 2/3 < 3/4. Adding the same amount to numerator and denominator does not preserve equivalence.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=696 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=696
 AND o."Id"=2839 AND o."IsCorrect" AND o."LatexCode"='\frac23<\frac34');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 696: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: الكسر المظلل = الخلايا المظللة ÷ إجمالي الخلايا المتساوية. لدينا 9 خلايا مظللة من 12، فيكون الكسر 9/12. نقسم البسط والمقام على 3 للحصول على أبسط صورة: 9/12 = 3/4.',
 "DetailedSolutionEn"='Rule used: Shaded fraction = shaded equal cells ÷ total equal cells. With 9 shaded cells out of 12, the fraction is 9/12. Divide numerator and denominator by 3: 9/12 = 3/4 in simplest form.'
 WHERE "Id"=817 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='مستطيل مكوّن من 12 مربعاً متساوياً، ظُلّل 9 منها. ما الكسر الذي يعبّر عن الجزء المظلل في أبسط صورة؟' AND "QuestionTextEn"='A rectangle is divided into 12 equal cells and 9 are shaded. What fraction of the rectangle is shaded, in simplest form?'
 AND "DetailedSolutionAr"='الجزء المظلل 9 من 12، وبالقسمة على 3 نحصل على 3/4.' AND "DetailedSolutionEn"='Nine of 12 cells are shaded. Divide numerator and denominator by 3 to obtain 3/4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=817 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=817
 AND o."Id"=3257 AND o."IsCorrect" AND o."LatexCode"='\frac{3}{4}');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 817: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: عند جمع كسور ذات مقام واحد نجمع البسطين ونبقي المقام نفسه. الشريط الأول كامل، أي 8/8، ومن الثاني 3/8؛ لذلك المجموع = 8/8 + 3/8 = 11/8، أي أحد عشر ثُمناً، وهو أكبر من شريط واحد كامل.',
 "DetailedSolutionEn"='Rule used: Add like fractions by adding numerators while keeping the denominator. One full bar is 8/8; three segments of the next bar are 3/8. Hence 8/8 + 3/8 = 11/8, or eleven eighths.'
 WHERE "Id"=818 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='لدينا شريطان متساويان، كل شريط مقسّم إلى 8 أجزاء. لُوّن الشريط الأول كله و3 أجزاء من الثاني. كم ثُمناً لُوّن بالمجموع؟' AND "QuestionTextEn"='Two identical bars each contain 8 equal segments. All of the first bar and 3 segments of the second are colored. How many eighths are colored altogether?'
 AND "DetailedSolutionAr"='الشريط الكامل = 8 أثمان، ومع 3 أثمان يصبح المجموع 11 ثُمناً، أي 11/8.' AND "DetailedSolutionEn"='The full bar is eight eighths; adding three more eighths gives 11/8.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=818 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=818
 AND o."Id"=3262 AND o."IsCorrect" AND o."LatexCode"='\frac{11}{8}');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 818: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: لإيجاد جزء من كسر نضرب الكسرين. نصف ثلاثة أرباع لتر يساوي (1/2) × (3/4) = (1 × 3)/(2 × 4) = 3/8 لتر. النتيجة أقل من 3/4 لتر لأننا أخذنا نصف الكمية فقط.',
 "DetailedSolutionEn"='Rule used: To find a fraction of another fraction, multiply them. Half of 3/4 liter is (1/2) × (3/4) = (1 × 3)/(2 × 4) = 3/8 liter. The amount is smaller than 3/4 liter because only half was taken.'
 WHERE "Id"=819 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='أخذت مريم نصف الكمية الموجودة في زجاجة تحتوي 3/4 لتر من العصير. كم لتراً أخذت؟' AND "QuestionTextEn"='Mariam took half the juice from a bottle containing 3/4 liter. How many liters did she take?'
 AND "DetailedSolutionAr"='نحسب نصف ثلاثة أرباع: (1/2) × (3/4) = 3/8 لتر.' AND "DetailedSolutionEn"='Half of three quarters is (1/2) × (3/4) = 3/8 liter.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=819 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=819
 AND o."Id"=3267 AND o."IsCorrect" AND o."LatexCode"='\frac{3}{8}');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 819: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='القانون المستخدم: قسمة كسر على عدد صحيح تعني ضربه في مقلوب ذلك العدد. نصيب الطفل = (2/3) ÷ 4 = (2/3) × (1/4) = 2/12 = 1/6 كيلوغرام. التحقق: 4 × 1/6 = 4/6 = 2/3 كيلوغرام.',
 "DetailedSolutionEn"='Rule used: Dividing a fraction by a whole number means multiplying by the reciprocal. Each child''s share is (2/3) ÷ 4 = (2/3) × (1/4) = 2/12 = 1/6 kg. Check: 4 × 1/6 = 2/3 kg.'
 WHERE "Id"=820 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='قُسّمت كمية مقدارها 2/3 كغ من الفاكهة بالتساوي على 4 أطفال. ما نصيب الطفل الواحد بالكيلوغرام؟' AND "QuestionTextEn"='A 2/3-kilogram portion of fruit is divided equally among four children. How many kilograms does each child receive?'
 AND "DetailedSolutionAr"='النصيب = (2/3) ÷ 4 = (2/3) × (1/4) = 1/6 كغ.' AND "DetailedSolutionEn"='Each share is (2/3) ÷ 4 = 2/12 = 1/6 kilogram.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=820 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=820
 AND o."Id"=3272 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{6}');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 820: changed question/answer/source; rollback all'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr"='المبدأ المستخدم: الضرب في 10 يجعل القيمة المكانية لكل رقم عشرة أضعاف، فتتحرك الفاصلة منزلة واحدة نحو اليمين. في 0.47 × 10 يصبح 4 أعشار 4 آحاداً و7 أجزاء من مئة 7 أعشار؛ الناتج 4.7. التحقق: 4.7 ÷ 10 = 0.47.',
 "DetailedSolutionEn"='Rule used: Multiplying a decimal by 10 shifts each digit one place to the left in place value, equivalently moving the decimal point one place right. Thus 0.47 × 10 = 4.7. Check: 4.7 ÷ 10 = 0.47.'
 WHERE "Id"=822 AND "StageId"=1 AND "CategoryId"=21
 AND "QuestionTextAr"='ما قيمة 0.47 مضروبة في 10؟ استخدم انتقال المنازل العشرية لتحديد الإجابة.' AND "QuestionTextEn"='What is 0.47 multiplied by 10? Use decimal place value to find the answer.'
 AND "DetailedSolutionAr"='الضرب في 10 ينقل قيمة كل رقم منزلة واحدة لليسار؛ 0.47 × 10 = 4.7.' AND "DetailedSolutionEn"='Multiplying by ten shifts the value of each digit one place to the left: 0.47 × 10 = 4.7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=822 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=822
 AND o."Id"=3278 AND o."IsCorrect" AND o."LatexCode"='4.7');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Fractions problem 822: changed question/answer/source; rollback all'; END IF;
END $mw_fraction_review$;
COMMIT;
