-- MathWorld primary arithmetic: independently verified category-1 solutions.
-- Source: content/editorial/primary-arithmetic-reviewed-solution-laws-20261123.json
-- Only bilingual DetailedSolutionAr/En change; exact-match guards + correct option checks.
-- Run ONCE; PostgreSQL single transaction, abort all 16 on any mismatch.
BEGIN;
DO $mw_primary_arithmetic$
DECLARE affected integer;
BEGIN
  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: الجزء الباقي = الكل − الجزء المعطى. كان لدى أحمد 12 تفاحة وأعطى 5. بالتعويض: 12 − 5 = 7 تفاحات. التحقق: 7 + 5 = 12.',
        "DetailedSolutionEn" = 'Rule: Remaining quantity = original total − amount given away. Ahmed had 12 apples and gave away 5. Compute 12 − 5 = 7 apples; check: 7 + 5 = 12.'
    WHERE "Id" = 3 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'إذا كان مع أحمد $12$ تفاحة، وأعطى صديقه $5$ تفاحات. كم تفاحة بقيت مع أحمد؟'
      AND "DetailedSolutionAr" = 'نقوم بطرح عدد التفاحات التي أعطاها أحمد من العدد الكلي: $12 - 5 = 7$ تفاحات متبقية.'
      AND "DetailedSolutionEn" = 'We subtract the number of apples Ahmed gave away from the total: $12 - 5 = 7$ apples remaining.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 3 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 1 AND q."ProblemId" = 3 AND q."IsCorrect" AND q."LatexCode" = '7');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 3: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'القانون: الجمع بالقيمة المكانية مع حمل العشرات. في 25 + 17: نجمع الآحاد 5 + 7 = 12، فنكتب 2 ونحمل عشرة. ثم نجمع العشرات 2 + 1 + 1 المحمول = 4. الناتج 42.',
        "DetailedSolutionEn" = 'Rule: Add by place value with carrying. For 25 + 17, add ones 5 + 7 = 12: write 2 and carry 1 ten. Add tens 2 + 1 + 1 = 4. The sum is 42.'
    WHERE "Id" = 36 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'ما ناتج جمع $25 + 17$؟'
      AND "DetailedSolutionAr" = 'نقوم بجمع العددين:
$25 + 17 = 25 + 10 + 7$
$= 35 + 7$
$= 42$
يمكن التحقق عن طريق الجمع العمودي:
$$\begin{array}{c} 25 \\ + 17 \\ \hline 42 \end{array}$$'
      AND "DetailedSolutionEn" = 'We add the two numbers:
$25 + 17 = 25 + 10 + 7$
$= 35 + 7$
$= 42$
We can verify using column addition:
$$\begin{array}{c} 25 \\ + 17 \\ \hline 42 \end{array}$$'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 36 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 133 AND q."ProblemId" = 36 AND q."IsCorrect" AND q."LatexCode" = '42');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 36: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: نفكك العدد المطروح بحسب منازله. في 84 − 29 نفكك 29 إلى 20 و9. أولاً 84 − 20 = 64، ثم 64 − 9 = 55. التحقق: 55 + 29 = 84.',
        "DetailedSolutionEn" = 'Rule: Decompose the subtrahend by place value. To find 84 − 29, first subtract 20 from 84 to get 64, then 9 to get 55. Check: 55 + 29 = 84.'
    WHERE "Id" = 37 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'كم يساوي 84 - 29؟'
      AND "DetailedSolutionAr" = 'نطرح 29 من 84: 84 - 20 = 64، ثم 64 - 9 = 55.'
      AND "DetailedSolutionEn" = 'Subtract 20 from 84 to get 64, then subtract 9 to get 55.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 37 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 137 AND q."ProblemId" = 37 AND q."IsCorrect" AND q."LatexCode" = '55');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 37: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'قاعدة ترتيب العمليات: نحسب ما داخل الأقواس أولاً. في (17 + 9) − 4 نجمع 17 + 9 = 26، ثم نطرح 4: 26 − 4 = 22. إذن الناتج 22.',
        "DetailedSolutionEn" = 'Order-of-operations rule: Evaluate parentheses first. In (17 + 9) − 4, add 17 + 9 = 26, then compute 26 − 4 = 22. The result is 22.'
    WHERE "Id" = 69 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب (17+9)-4.'
      AND "DetailedSolutionAr" = 'نجمع 17+9=26 ثم نطرح 4 فنحصل على 22.'
      AND "DetailedSolutionEn" = 'First 17+9=26; then subtract 4 to obtain 22.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 69 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 268 AND q."ProblemId" = 69 AND q."IsCorrect" AND q."LatexCode" = '22');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 69: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'قاعدة ترتيب العمليات: الجمع داخل القوس قبل الطرح الخارجي. نحسب 21 + 12 = 33 أولاً، ثم 33 − 5 = 28. التحقق: 28 + 5 = 33.',
        "DetailedSolutionEn" = 'Order-of-operations rule: Add inside parentheses before the outside subtraction. First 21 + 12 = 33, then 33 − 5 = 28. Check: 28 + 5 = 33.'
    WHERE "Id" = 84 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب (21+12)-5.'
      AND "DetailedSolutionAr" = 'نجمع 21+12=33 ثم نطرح 5 فنحصل على 28.'
      AND "DetailedSolutionEn" = 'First 21+12=33; then subtract 5 to obtain 28.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 84 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 327 AND q."ProblemId" = 84 AND q."IsCorrect" AND q."LatexCode" = '28');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 84: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'قاعدة ترتيب العمليات: نحل الأقواس أولاً. في (25 + 15) − 6 نجمع 25 + 15 = 40 ثم نطرح 6: 40 − 6 = 34. التحقق 34 + 6 = 40.',
        "DetailedSolutionEn" = 'Order-of-operations rule: Evaluate the parentheses first. Add 25 + 15 = 40, then subtract 6: 40 − 6 = 34. Check: 34 + 6 = 40.'
    WHERE "Id" = 99 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب (25+15)-6.'
      AND "DetailedSolutionAr" = 'نجمع 25+15=40 ثم نطرح 6 فنحصل على 34.'
      AND "DetailedSolutionEn" = 'First 25+15=40; then subtract 6 to obtain 34.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 99 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 386 AND q."ProblemId" = 99 AND q."IsCorrect" AND q."LatexCode" = '34');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 99: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'قاعدة الأقواس: ننجز الجمع قبل الطرح. في (29 + 18) − 7 نحسب 29 + 18 = 47، ثم 47 − 7 = 40. التحقق: 40 + 7 = 47.',
        "DetailedSolutionEn" = 'Parentheses rule: Complete addition before subtraction. In (29 + 18) − 7, calculate 29 + 18 = 47 and then 47 − 7 = 40. Check: 40 + 7 = 47.'
    WHERE "Id" = 114 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب (29+18)-7.'
      AND "DetailedSolutionAr" = 'نجمع 29+18=47 ثم نطرح 7 فنحصل على 40.'
      AND "DetailedSolutionEn" = 'First 29+18=47; then subtract 7 to obtain 40.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 114 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 445 AND q."ProblemId" = 114 AND q."IsCorrect" AND q."LatexCode" = '40');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 114: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'قاعدة ترتيب العمليات: نبدأ بالعبارة بين القوسين. 33 + 21 = 54، وبعد ذلك نحسب 54 − 8 = 46. التحقق: 46 + 8 = 54.',
        "DetailedSolutionEn" = 'Order-of-operations rule: Start with the grouped expression. Add 33 + 21 = 54, then subtract 8: 54 − 8 = 46. Check: 46 + 8 = 54.'
    WHERE "Id" = 129 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب (33+21)-8.'
      AND "DetailedSolutionAr" = 'نجمع 33+21=54 ثم نطرح 8 فنحصل على 46.'
      AND "DetailedSolutionEn" = 'First 33+21=54; then subtract 8 to obtain 46.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 129 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 508 AND q."ProblemId" = 129 AND q."IsCorrect" AND q."LatexCode" = '46');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 129: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: جمع الآحاد والعشرات والمئات مع الحمل. في 275 + 168: الآحاد 5 + 8 = 13، نكتب 3 ونحمل 1؛ العشرات 7 + 6 + 1 = 14، نكتب 4 ونحمل 1؛ المئات 2 + 1 + 1 = 4. النتيجة 443.',
        "DetailedSolutionEn" = 'Rule: Add place by place, carrying when a column reaches ten. In 275 + 168: ones 5 + 8 = 13, write 3 and carry 1; tens 7 + 6 + 1 = 14, write 4 and carry 1; hundreds 2 + 1 + 1 = 4. Answer: 443.'
    WHERE "Id" = 609 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب 275 + 168.'
      AND "DetailedSolutionAr" = 'نجمع الآحاد: 5 + 8 = 13، ثم العشرات مع المحمول، فنحصل على 443.'
      AND "DetailedSolutionEn" = 'Add the ones: 5 + 8 = 13; regroup through the tens and hundreds to obtain 443.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 609 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 2426 AND q."ProblemId" = 609 AND q."IsCorrect" AND q."LatexCode" = '443');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 609: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: لإيجاد حد مجهول في الجمع نطرح الحد المعلوم من الناتج. إذا كان 486 + س = 725، فـ س = 725 − 486 = 239. التحقق: 486 + 239 = 725.',
        "DetailedSolutionEn" = 'Rule: To find a missing addend, subtract the known addend from the total. From 486 + x = 725, compute x = 725 − 486 = 239. Check: 486 + 239 = 725.'
    WHERE "Id" = 610 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'أي عدد نضيفه إلى 486 لنحصل على 725؟'
      AND "DetailedSolutionAr" = 'العدد الناقص = 725 − 486 = 239. نتحقق: 486 + 239 = 725.'
      AND "DetailedSolutionEn" = 'Subtract 486 from 725: 239. Check: 486 + 239 = 725.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 610 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 2431 AND q."ProblemId" = 610 AND q."IsCorrect" AND q."LatexCode" = '239');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 610: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'قاعدة التقريب إلى أقرب مئة: ننظر إلى خانة العشرات. العدد 198 يُقرّب إلى 200 والعدد 306 إلى 300. التقدير = 200 + 300 = 500. لاحظ أنه ليس المجموع الدقيق 504.',
        "DetailedSolutionEn" = 'Rule: Round each number to the nearest hundred using the tens digit. Thus 198 rounds to 200 and 306 rounds to 300. The estimated sum is 200 + 300 = 500, not the exact total 504.'
    WHERE "Id" = 611 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'قدّر مجموع 198 + 306 بتقريب كل عدد إلى أقرب مئة قبل الجمع.'
      AND "DetailedSolutionAr" = '198 ≈ 200 و306 ≈ 300، فيكون المجموع التقديري 500.'
      AND "DetailedSolutionEn" = '198 rounds to 200 and 306 rounds to 300. The estimate is 500.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 611 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 2434 AND q."ProblemId" = 611 AND q."IsCorrect" AND q."LatexCode" = '500');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 611: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: إجمالي الركاب = مجموع الركاب الموجودين ومن صعدوا. أولاً 38 بالغاً + 27 طفلاً = 65 راكباً، ثم صعد 16 آخرون: 65 + 16 = 81 راكباً. لم ينزل أحد.',
        "DetailedSolutionEn" = 'Rule: Total passengers = all groups still aboard. First 38 adults + 27 children = 65 passengers. Another 16 board, giving 65 + 16 = 81. Nobody is said to get off.'
    WHERE "Id" = 612 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'في الحافلة 38 بالغاً و27 طفلاً. صعد 16 راكباً آخر. كم راكباً صار في الحافلة؟'
      AND "DetailedSolutionAr" = '38 + 27 = 65، ثم 65 + 16 = 81 راكباً.'
      AND "DetailedSolutionEn" = 'First 38 + 27 = 65; then 65 + 16 = 81 passengers.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 612 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 2439 AND q."ProblemId" = 612 AND q."IsCorrect" AND q."LatexCode" = '81');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 612: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'القانون: الكمية المستخدمة = الكمية الأصلية − الكمية المتبقية. في الخزان 425 لتراً وبقي 178 لتراً. نحسب 425 − 178 = 247 لتراً مستخدماً. التحقق: 247 + 178 = 425.',
        "DetailedSolutionEn" = 'Rule: Amount used = initial amount − remaining amount. The tank held 425 liters and 178 remain. Compute 425 − 178 = 247 liters used. Check: 247 + 178 = 425.'
    WHERE "Id" = 761 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'خزان فيه 425 لتراً من الماء. بقي فيه 178 لتراً بعد استخدام بعض الماء. كم لتراً استُخدم؟'
      AND "DetailedSolutionAr" = 'المستخدم = الكمية الأصلية − الباقي = 425 − 178 = 247 لتراً. نتحقق: 247 + 178 = 425.'
      AND "DetailedSolutionEn" = 'Used water equals initial minus remaining: 425 − 178 = 247 liters. Check: 247 + 178 = 425.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 761 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 3034 AND q."ProblemId" = 761 AND q."IsCorrect" AND q."LatexCode" = '247');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 761: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: فرق مجموعتين = العدد الأكبر − الأصغر. لدى ليلى 650 ملصقاً ولدى سامر 487، لذلك الفرق 650 − 487 = 163 ملصقاً. التحقق: 487 + 163 = 650.',
        "DetailedSolutionEn" = 'Rule: The difference between two collections is the larger count minus the smaller. Layla has 650 stickers versus Samer''s 487, so 650 − 487 = 163 more stickers. Check: 487 + 163 = 650.'
    WHERE "Id" = 762 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'جمعت ليلى 650 ملصقاً، وجمع سامر 487 ملصقاً. بكم ملصقاً تزيد مجموعة ليلى؟'
      AND "DetailedSolutionAr" = 'الفرق = 650 − 487 = 163 ملصقاً. هذه مقارنة وليست مجموع المجموعتين.'
      AND "DetailedSolutionEn" = 'The difference is 650 − 487 = 163 stickers, not the sum of the collections.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 762 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 3038 AND q."ProblemId" = 762 AND q."IsCorrect" AND q."LatexCode" = '163');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 762: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'القانون: العدد الأصلي = العدد المسحوب + العدد المتبقي. سُحبت 38 بطاقة وبقيت 95، إذن الأصل = 38 + 95 = 133 بطاقة. التحقق: 133 − 38 = 95.',
        "DetailedSolutionEn" = 'Rule: Original quantity = removed quantity + remaining quantity. With 38 cards removed and 95 left, the starting quantity was 38 + 95 = 133. Check: 133 − 38 = 95.'
    WHERE "Id" = 763 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'بعد سحب 38 بطاقة من صندوق بقيت 95 بطاقة. كم بطاقة كانت في الصندوق قبل السحب؟'
      AND "DetailedSolutionAr" = 'إذا كان العدد الأصلي x فـ x − 38 = 95، وبالتالي x = 95 + 38 = 133.'
      AND "DetailedSolutionEn" = 'If x is the original quantity, x − 38 = 95, so x = 95 + 38 = 133.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 763 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 3043 AND q."ProblemId" = 763 AND q."IsCorrect" AND q."LatexCode" = '133');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 763: original solution/question/answer changed; abort entire batch'; END IF;

  UPDATE public."Problems"
    SET "DetailedSolutionAr" = 'المبدأ: عند وجود صفر في منزلة العشرات نستلف من المئات ونعيد التجميع. نعيد كتابة 503 كـ 4 مئات و9 عشرات و13 آحاداً. ثم 13 − 7 = 6 و9 − 8 = 1 و4 − 2 = 2. الناتج 216؛ التحقق: 216 + 287 = 503.',
        "DetailedSolutionEn" = 'Rule: Regroup across a zero tens digit by borrowing from the hundreds. Rewrite 503 as 4 hundreds, 9 tens and 13 ones. Then 13 − 7 = 6, 9 − 8 = 1, and 4 − 2 = 2. Result: 216. Check: 216 + 287 = 503.'
    WHERE "Id" = 764 AND "StageId" = 1 AND "CategoryId" = 1
      AND "QuestionTextAr" = 'احسب 503 − 287 مع الانتباه إلى الاستلاف من المئات.'
      AND "DetailedSolutionAr" = 'نحوّل 503 إلى 4 مئات و9 عشرات و13 آحاداً؛ 13−7=6 و9−8=1 و4−2=2، فالنتيجة 216.'
      AND "DetailedSolutionEn" = 'Regroup 503 as 4 hundreds, 9 tens and 13 ones. Then 13−7=6, 9−8=1, and 4−2=2: 216.'
      AND (SELECT COUNT(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 764 AND q."IsCorrect") = 1
      AND EXISTS (SELECT 1 FROM public."QuestionOptions" q WHERE q."Id" = 3046 AND q."ProblemId" = 764 AND q."IsCorrect" AND q."LatexCode" = '216');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 764: original solution/question/answer changed; abort entire batch'; END IF;
END
$mw_primary_arithmetic$;
COMMIT;
