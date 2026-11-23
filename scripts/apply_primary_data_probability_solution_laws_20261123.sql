-- Atomic, one-time bilingual law-explanation updates: elementary data/probability, category 4.
-- Preserve exact existing question, correct option and student records; abort on stale data.
BEGIN;
DO $mw_data_probability$
DECLARE affected integer;
BEGIN
  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: المتوسط الحسابي = مجموع القيم ÷ عددها. القيم هي 4 و6 و8 و10؛ مجموعها = 4 + 6 + 8 + 10 = 28، وعددها 4. بالتعويض: المتوسط = 28 ÷ 4 = 7.',
     "DetailedSolutionEn" = 'Rule used: Arithmetic mean = sum of values ÷ number of values. Add 4 + 6 + 8 + 10 = 28. There are 4 values, so the mean is 28 ÷ 4 = 7.'
   WHERE "Id" = 40 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما المتوسط الحسابي للأعداد 4 و6 و8 و10؟'
     AND "QuestionTextEn" = 'What is the mean of 4, 6, 8, and 10?'
     AND "DetailedSolutionAr" = 'مجموع الأعداد 28 وعددها 4، إذن المتوسط 28 ÷ 4 = 7.'
     AND "DetailedSolutionEn" = 'The sum is 28 and there are four values, so the mean is 28 / 4 = 7.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 40 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 40 AND o."Id" = 152
                   AND o."IsCorrect" AND o."LatexCode" = '7');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 40: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: الاحتمال = عدد النواتج المناسبة ÷ عدد النواتج الممكنة بالتساوي. حجر النرد العادل له 6 أوجه، والزوجية منها 2 و4 و6؛ إذن عدد النواتج المناسبة 3. بالتعويض: الاحتمال = 3 ÷ 6 = 1/2.',
     "DetailedSolutionEn" = 'Rule used: Probability = favorable outcomes ÷ equally likely possible outcomes. A fair die has 6 faces; the even ones are 2, 4, and 6. Thus there are 3 favorable outcomes, so P(even) = 3/6 = 1/2.'
   WHERE "Id" = 56 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'عند رمي نرد عادل، ما احتمال الحصول على عدد زوجي؟'
     AND "QuestionTextEn" = 'When rolling a fair six-sided die, what is the probability of an even number?'
     AND "DetailedSolutionAr" = 'الأعداد الزوجية هي 2 و4 و6، أي 3 نتائج من أصل 6، فالاحتمال 1/2.'
     AND "DetailedSolutionEn" = 'Even outcomes are 2, 4, and 6: three of six possible outcomes, giving 1/2.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 56 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 56 AND o."Id" = 213
                   AND o."IsCorrect" AND o."LatexCode" = '\frac{1}{2}');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 56: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: المتوسط الحسابي = مجموع البيانات ÷ عدد القيم. نضيف 5 + 8 + 11 = 24، ولدينا 3 قيم. بالتعويض: المتوسط = 24 ÷ 3 = 8. هذا العدد يمثّل القيمة المتوسطة حسابياً للمجموعة.',
     "DetailedSolutionEn" = 'Rule used: Arithmetic mean = total sum ÷ number of observations. Add 5 + 8 + 11 = 24. Since there are 3 values, the mean is 24 ÷ 3 = 8.'
   WHERE "Id" = 72 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'أوجد المتوسط الحسابي للقيم 5 و8 و11.'
     AND "QuestionTextEn" = 'Find the arithmetic mean of 5, 8, and 11.'
     AND "DetailedSolutionAr" = 'المجموع 24 ونقسمه على ثلاثة فنحصل على 8.'
     AND "DetailedSolutionEn" = 'The sum is 24; dividing by three gives 8.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 72 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 72 AND o."Id" = 277
                   AND o."IsCorrect" AND o."LatexCode" = '8');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 72: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: المتوسط الحسابي = مجموع البيانات ÷ عدد القيم. نضيف 7 + 10 + 13 = 30، ولدينا 3 قيم. بالتعويض: المتوسط = 30 ÷ 3 = 10. هذا العدد يمثّل القيمة المتوسطة حسابياً للمجموعة.',
     "DetailedSolutionEn" = 'Rule used: Arithmetic mean = total sum ÷ number of observations. Add 7 + 10 + 13 = 30. Since there are 3 values, the mean is 30 ÷ 3 = 10.'
   WHERE "Id" = 87 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'أوجد المتوسط الحسابي للقيم 7 و10 و13.'
     AND "QuestionTextEn" = 'Find the arithmetic mean of 7, 10, and 13.'
     AND "DetailedSolutionAr" = 'المجموع 30 ونقسمه على ثلاثة فنحصل على 10.'
     AND "DetailedSolutionEn" = 'The sum is 30; dividing by three gives 10.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 87 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 87 AND o."Id" = 340
                   AND o."IsCorrect" AND o."LatexCode" = '10');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 87: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: المتوسط الحسابي = مجموع البيانات ÷ عدد القيم. نضيف 9 + 12 + 15 = 36، ولدينا 3 قيم. بالتعويض: المتوسط = 36 ÷ 3 = 12. هذا العدد يمثّل القيمة المتوسطة حسابياً للمجموعة.',
     "DetailedSolutionEn" = 'Rule used: Arithmetic mean = total sum ÷ number of observations. Add 9 + 12 + 15 = 36. Since there are 3 values, the mean is 36 ÷ 3 = 12.'
   WHERE "Id" = 102 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'أوجد المتوسط الحسابي للقيم 9 و12 و15.'
     AND "QuestionTextEn" = 'Find the arithmetic mean of 9, 12, and 15.'
     AND "DetailedSolutionAr" = 'المجموع 36 ونقسمه على ثلاثة فنحصل على 12.'
     AND "DetailedSolutionEn" = 'The sum is 36; dividing by three gives 12.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 102 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 102 AND o."Id" = 399
                   AND o."IsCorrect" AND o."LatexCode" = '12');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 102: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: المتوسط الحسابي = مجموع البيانات ÷ عدد القيم. نضيف 11 + 14 + 17 = 42، ولدينا 3 قيم. بالتعويض: المتوسط = 42 ÷ 3 = 14. هذا العدد يمثّل القيمة المتوسطة حسابياً للمجموعة.',
     "DetailedSolutionEn" = 'Rule used: Arithmetic mean = total sum ÷ number of observations. Add 11 + 14 + 17 = 42. Since there are 3 values, the mean is 42 ÷ 3 = 14.'
   WHERE "Id" = 117 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'أوجد المتوسط الحسابي للقيم 11 و14 و17.'
     AND "QuestionTextEn" = 'Find the arithmetic mean of 11, 14, and 17.'
     AND "DetailedSolutionAr" = 'المجموع 42 ونقسمه على ثلاثة فنحصل على 14.'
     AND "DetailedSolutionEn" = 'The sum is 42; dividing by three gives 14.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 117 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 117 AND o."Id" = 458
                   AND o."IsCorrect" AND o."LatexCode" = '14');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 117: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: المتوسط الحسابي = مجموع البيانات ÷ عدد القيم. نضيف 13 + 16 + 19 = 48، ولدينا 3 قيم. بالتعويض: المتوسط = 48 ÷ 3 = 16. هذا العدد يمثّل القيمة المتوسطة حسابياً للمجموعة.',
     "DetailedSolutionEn" = 'Rule used: Arithmetic mean = total sum ÷ number of observations. Add 13 + 16 + 19 = 48. Since there are 3 values, the mean is 48 ÷ 3 = 16.'
   WHERE "Id" = 132 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'أوجد المتوسط الحسابي للقيم 13 و16 و19.'
     AND "QuestionTextEn" = 'Find the arithmetic mean of 13, 16, and 19.'
     AND "DetailedSolutionAr" = 'المجموع 48 ونقسمه على ثلاثة فنحصل على 16.'
     AND "DetailedSolutionEn" = 'The sum is 48; dividing by three gives 16.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 132 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 132 AND o."Id" = 517
                   AND o."IsCorrect" AND o."LatexCode" = '16');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 132: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: المنوال هو القيمة الأكثر تكراراً في مجموعة البيانات. في القائمة 3، 9، 3، 4، 3 يتكرر العدد 3 ثلاث مرات، بينما يظهر 9 مرة واحدة و4 مرة واحدة. لذلك المنوال = 3.',
     "DetailedSolutionEn" = 'Rule used: The mode is the most frequently occurring value. In 3, 9, 3, 4, 3, the value 3 appears 3 times, while 9 and 4 appear once each. Therefore the mode is 3.'
   WHERE "Id" = 158 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما المنوال: 3، 9، 3، 4، 3؟'
     AND "QuestionTextEn" = 'Find the mode: 3, 9, 3, 4, 3.'
     AND "DetailedSolutionAr" = '3 يتكرر ثلاث مرات وهو الأكثر تكراراً.'
     AND "DetailedSolutionEn" = 'The value 3 occurs three times, most often.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 158 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 158 AND o."Id" = 624
                   AND o."IsCorrect" AND o."LatexCode" = '3');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 158: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: المنوال هو القيمة الأكثر تكراراً في مجموعة البيانات. في القائمة 4، 11، 4، 5، 4 يتكرر العدد 4 ثلاث مرات، بينما يظهر 11 مرة واحدة و5 مرة واحدة. لذلك المنوال = 4.',
     "DetailedSolutionEn" = 'Rule used: The mode is the most frequently occurring value. In 4, 11, 4, 5, 4, the value 4 appears 3 times, while 11 and 5 appear once each. Therefore the mode is 4.'
   WHERE "Id" = 170 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما المنوال: 4، 11، 4، 5، 4؟'
     AND "QuestionTextEn" = 'Find the mode: 4, 11, 4, 5, 4.'
     AND "DetailedSolutionAr" = '4 يتكرر ثلاث مرات وهو الأكثر تكراراً.'
     AND "DetailedSolutionEn" = 'The value 4 occurs three times, most often.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 170 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 170 AND o."Id" = 671
                   AND o."IsCorrect" AND o."LatexCode" = '4');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 170: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: المنوال هو القيمة الأكثر تكراراً في مجموعة البيانات. في القائمة 5، 13، 5، 6، 5 يتكرر العدد 5 ثلاث مرات، بينما يظهر 13 مرة واحدة و6 مرة واحدة. لذلك المنوال = 5.',
     "DetailedSolutionEn" = 'Rule used: The mode is the most frequently occurring value. In 5, 13, 5, 6, 5, the value 5 appears 3 times, while 13 and 6 appear once each. Therefore the mode is 5.'
   WHERE "Id" = 182 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما المنوال: 5، 13، 5، 6، 5؟'
     AND "QuestionTextEn" = 'Find the mode: 5, 13, 5, 6, 5.'
     AND "DetailedSolutionAr" = '5 يتكرر ثلاث مرات وهو الأكثر تكراراً.'
     AND "DetailedSolutionEn" = 'The value 5 occurs three times, most often.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 182 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 182 AND o."Id" = 718
                   AND o."IsCorrect" AND o."LatexCode" = '5');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 182: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: المنوال هو القيمة الأكثر تكراراً في مجموعة البيانات. في القائمة 6، 15، 6، 7، 6 يتكرر العدد 6 ثلاث مرات، بينما يظهر 15 مرة واحدة و7 مرة واحدة. لذلك المنوال = 6.',
     "DetailedSolutionEn" = 'Rule used: The mode is the most frequently occurring value. In 6, 15, 6, 7, 6, the value 6 appears 3 times, while 15 and 7 appear once each. Therefore the mode is 6.'
   WHERE "Id" = 194 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما المنوال: 6، 15، 6، 7، 6؟'
     AND "QuestionTextEn" = 'Find the mode: 6, 15, 6, 7, 6.'
     AND "DetailedSolutionAr" = '6 يتكرر ثلاث مرات وهو الأكثر تكراراً.'
     AND "DetailedSolutionEn" = 'The value 6 occurs three times, most often.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 194 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 194 AND o."Id" = 765
                   AND o."IsCorrect" AND o."LatexCode" = '6');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 194: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: المنوال هو القيمة الأكثر تكراراً في مجموعة البيانات. في القائمة 7، 17، 7، 8، 7 يتكرر العدد 7 ثلاث مرات، بينما يظهر 17 مرة واحدة و8 مرة واحدة. لذلك المنوال = 7.',
     "DetailedSolutionEn" = 'Rule used: The mode is the most frequently occurring value. In 7, 17, 7, 8, 7, the value 7 appears 3 times, while 17 and 8 appear once each. Therefore the mode is 7.'
   WHERE "Id" = 206 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما المنوال: 7، 17، 7، 8، 7؟'
     AND "QuestionTextEn" = 'Find the mode: 7, 17, 7, 8, 7.'
     AND "DetailedSolutionAr" = '7 يتكرر ثلاث مرات وهو الأكثر تكراراً.'
     AND "DetailedSolutionEn" = 'The value 7 occurs three times, most often.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 206 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 206 AND o."Id" = 816
                   AND o."IsCorrect" AND o."LatexCode" = '7');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 206: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: احتمال اختيار كرة حمراء = عدد الكرات الحمراء ÷ العدد الكلي للكرات، بافتراض السحب العشوائي المتساوي. لدينا 1 حمراء و6 زرقاء، فيكون المجموع 1 + 6 = 7. بالتعويض: الاحتمال = 1/7.',
     "DetailedSolutionEn" = 'Rule used: Probability of red = number of red balls ÷ total number of balls for a uniformly random draw. There are 1 red and 6 blue balls, a total of 1 + 6 = 7. Thus P(red) = 1/7.'
   WHERE "Id" = 159 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'في كيس 1 كرات حمراء و6 زرقاء. ما احتمال سحب حمراء؟'
     AND "QuestionTextEn" = 'A bag has 1 red and 6 blue balls. Find the probability of red.'
     AND "DetailedSolutionAr" = 'الاحتمال=الحمراء/المجموع=1/7.'
     AND "DetailedSolutionEn" = 'Probability=red/total=1/7.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 159 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 159 AND o."Id" = 627
                   AND o."IsCorrect" AND o."LatexCode" = '\frac{1}{7}');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 159: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: احتمال اختيار كرة حمراء = عدد الكرات الحمراء ÷ العدد الكلي للكرات، بافتراض السحب العشوائي المتساوي. لدينا 2 حمراء و7 زرقاء، فيكون المجموع 2 + 7 = 9. بالتعويض: الاحتمال = 2/9.',
     "DetailedSolutionEn" = 'Rule used: Probability of red = number of red balls ÷ total number of balls for a uniformly random draw. There are 2 red and 7 blue balls, a total of 2 + 7 = 9. Thus P(red) = 2/9.'
   WHERE "Id" = 171 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'في كيس 2 كرات حمراء و7 زرقاء. ما احتمال سحب حمراء؟'
     AND "QuestionTextEn" = 'A bag has 2 red and 7 blue balls. Find the probability of red.'
     AND "DetailedSolutionAr" = 'الاحتمال=الحمراء/المجموع=2/9.'
     AND "DetailedSolutionEn" = 'Probability=red/total=2/9.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 171 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 171 AND o."Id" = 674
                   AND o."IsCorrect" AND o."LatexCode" = '\frac{2}{9}');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 171: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: احتمال اختيار كرة حمراء = عدد الكرات الحمراء ÷ العدد الكلي للكرات، بافتراض السحب العشوائي المتساوي. لدينا 3 حمراء و8 زرقاء، فيكون المجموع 3 + 8 = 11. بالتعويض: الاحتمال = 3/11.',
     "DetailedSolutionEn" = 'Rule used: Probability of red = number of red balls ÷ total number of balls for a uniformly random draw. There are 3 red and 8 blue balls, a total of 3 + 8 = 11. Thus P(red) = 3/11.'
   WHERE "Id" = 183 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'في كيس 3 كرات حمراء و8 زرقاء. ما احتمال سحب حمراء؟'
     AND "QuestionTextEn" = 'A bag has 3 red and 8 blue balls. Find the probability of red.'
     AND "DetailedSolutionAr" = 'الاحتمال=الحمراء/المجموع=3/11.'
     AND "DetailedSolutionEn" = 'Probability=red/total=3/11.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 183 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 183 AND o."Id" = 721
                   AND o."IsCorrect" AND o."LatexCode" = '\frac{3}{11}');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 183: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: احتمال اختيار كرة حمراء = عدد الكرات الحمراء ÷ العدد الكلي للكرات، بافتراض السحب العشوائي المتساوي. لدينا 4 حمراء و9 زرقاء، فيكون المجموع 4 + 9 = 13. بالتعويض: الاحتمال = 4/13.',
     "DetailedSolutionEn" = 'Rule used: Probability of red = number of red balls ÷ total number of balls for a uniformly random draw. There are 4 red and 9 blue balls, a total of 4 + 9 = 13. Thus P(red) = 4/13.'
   WHERE "Id" = 195 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'في كيس 4 كرات حمراء و9 زرقاء. ما احتمال سحب حمراء؟'
     AND "QuestionTextEn" = 'A bag has 4 red and 9 blue balls. Find the probability of red.'
     AND "DetailedSolutionAr" = 'الاحتمال=الحمراء/المجموع=4/13.'
     AND "DetailedSolutionEn" = 'Probability=red/total=4/13.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 195 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 195 AND o."Id" = 772
                   AND o."IsCorrect" AND o."LatexCode" = '\frac{4}{13}');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 195: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'القانون المستخدم: احتمال اختيار كرة حمراء = عدد الكرات الحمراء ÷ العدد الكلي للكرات، بافتراض السحب العشوائي المتساوي. لدينا 5 حمراء و10 زرقاء، فيكون المجموع 5 + 10 = 15. بالتعويض: الاحتمال = 5/15. ويمكن تبسيط الكسر إلى 1/3، وهو مكافئ تماماً لـ5/15.',
     "DetailedSolutionEn" = 'Rule used: Probability of red = number of red balls ÷ total number of balls for a uniformly random draw. There are 5 red and 10 blue balls, a total of 5 + 10 = 15. Thus P(red) = 5/15. This is equivalent to 1/3 after simplifying 5/15.'
   WHERE "Id" = 207 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'في كيس 5 كرات حمراء و10 زرقاء. ما احتمال سحب حمراء؟'
     AND "QuestionTextEn" = 'A bag has 5 red and 10 blue balls. Find the probability of red.'
     AND "DetailedSolutionAr" = 'الاحتمال=الحمراء/المجموع=5/15.'
     AND "DetailedSolutionEn" = 'Probability=red/total=5/15.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 207 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 207 AND o."Id" = 819
                   AND o."IsCorrect" AND o."LatexCode" = '\frac{5}{15}');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 207: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: الوسيط هو القيمة الوسطى بعد ترتيب البيانات تصاعدياً. القيم 6، 9، 10، 13، 17 مرتبة أصلاً وعددها 5، فتكون رتبة الوسط (5 + 1) ÷ 2 = 3. القيمة الثالثة هي 10، لذا الوسيط = 10.',
     "DetailedSolutionEn" = 'Rule used: The median is the middle value after sorting the observations. The five values 6, 9, 10, 13, 17 are already ordered; the middle position is (5 + 1) ÷ 2 = 3. The third value is 10, so the median is 10.'
   WHERE "Id" = 160 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما وسيط القيم المرتبة 6، 9، 10، 13، 17؟'
     AND "QuestionTextEn" = 'What is the median of ordered values 6, 9, 10, 13, 17?'
     AND "DetailedSolutionAr" = 'العدد الأوسط هو الثالث 10.'
     AND "DetailedSolutionEn" = 'The third, middle value is 10.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 160 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 160 AND o."Id" = 630
                   AND o."IsCorrect" AND o."LatexCode" = '10');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 160: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: الوسيط هو القيمة الوسطى بعد ترتيب البيانات تصاعدياً. القيم 9، 12، 13، 16، 20 مرتبة أصلاً وعددها 5، فتكون رتبة الوسط (5 + 1) ÷ 2 = 3. القيمة الثالثة هي 13، لذا الوسيط = 13.',
     "DetailedSolutionEn" = 'Rule used: The median is the middle value after sorting the observations. The five values 9, 12, 13, 16, 20 are already ordered; the middle position is (5 + 1) ÷ 2 = 3. The third value is 13, so the median is 13.'
   WHERE "Id" = 172 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما وسيط القيم المرتبة 9، 12، 13، 16، 20؟'
     AND "QuestionTextEn" = 'What is the median of ordered values 9, 12, 13, 16, 20?'
     AND "DetailedSolutionAr" = 'العدد الأوسط هو الثالث 13.'
     AND "DetailedSolutionEn" = 'The third, middle value is 13.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 172 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 172 AND o."Id" = 677
                   AND o."IsCorrect" AND o."LatexCode" = '13');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 172: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: الوسيط هو القيمة الوسطى بعد ترتيب البيانات تصاعدياً. القيم 12، 15، 16، 19، 23 مرتبة أصلاً وعددها 5، فتكون رتبة الوسط (5 + 1) ÷ 2 = 3. القيمة الثالثة هي 16، لذا الوسيط = 16.',
     "DetailedSolutionEn" = 'Rule used: The median is the middle value after sorting the observations. The five values 12, 15, 16, 19, 23 are already ordered; the middle position is (5 + 1) ÷ 2 = 3. The third value is 16, so the median is 16.'
   WHERE "Id" = 184 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما وسيط القيم المرتبة 12، 15، 16، 19، 23؟'
     AND "QuestionTextEn" = 'What is the median of ordered values 12, 15, 16, 19, 23?'
     AND "DetailedSolutionAr" = 'العدد الأوسط هو الثالث 16.'
     AND "DetailedSolutionEn" = 'The third, middle value is 16.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 184 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 184 AND o."Id" = 728
                   AND o."IsCorrect" AND o."LatexCode" = '16');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 184: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: الوسيط هو القيمة الوسطى بعد ترتيب البيانات تصاعدياً. القيم 15، 18، 19، 22، 26 مرتبة أصلاً وعددها 5، فتكون رتبة الوسط (5 + 1) ÷ 2 = 3. القيمة الثالثة هي 19، لذا الوسيط = 19.',
     "DetailedSolutionEn" = 'Rule used: The median is the middle value after sorting the observations. The five values 15, 18, 19, 22, 26 are already ordered; the middle position is (5 + 1) ÷ 2 = 3. The third value is 19, so the median is 19.'
   WHERE "Id" = 196 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما وسيط القيم المرتبة 15، 18، 19، 22، 26؟'
     AND "QuestionTextEn" = 'What is the median of ordered values 15, 18, 19, 22, 26?'
     AND "DetailedSolutionAr" = 'العدد الأوسط هو الثالث 19.'
     AND "DetailedSolutionEn" = 'The third, middle value is 19.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 196 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 196 AND o."Id" = 775
                   AND o."IsCorrect" AND o."LatexCode" = '19');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 196: changed source/answer, abort all'; END IF;

  UPDATE public."Problems" SET
     "DetailedSolutionAr" = 'المبدأ المستخدم: الوسيط هو القيمة الوسطى بعد ترتيب البيانات تصاعدياً. القيم 18، 21، 22، 25، 29 مرتبة أصلاً وعددها 5، فتكون رتبة الوسط (5 + 1) ÷ 2 = 3. القيمة الثالثة هي 22، لذا الوسيط = 22.',
     "DetailedSolutionEn" = 'Rule used: The median is the middle value after sorting the observations. The five values 18, 21, 22, 25, 29 are already ordered; the middle position is (5 + 1) ÷ 2 = 3. The third value is 22, so the median is 22.'
   WHERE "Id" = 208 AND "StageId" = 1 AND "CategoryId" = 4
     AND "QuestionTextAr" = 'ما وسيط القيم المرتبة 18، 21، 22، 25، 29؟'
     AND "QuestionTextEn" = 'What is the median of ordered values 18, 21, 22, 25, 29?'
     AND "DetailedSolutionAr" = 'العدد الأوسط هو الثالث 22.'
     AND "DetailedSolutionEn" = 'The third, middle value is 22.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 208 AND o."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" o
                 WHERE o."ProblemId" = 208 AND o."Id" = 822
                   AND o."IsCorrect" AND o."LatexCode" = '22');
   GET DIAGNOSTICS affected = ROW_COUNT;
   IF affected <> 1 THEN RAISE EXCEPTION 'Primary data-probability problem 208: changed source/answer, abort all'; END IF;

END $mw_data_probability$;
COMMIT;
