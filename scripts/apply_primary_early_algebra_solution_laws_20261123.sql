-- One-time exact-match bilingual solution update for primary early algebra.
-- No changes to problems' questions/options/answers, student state, or access.
BEGIN;
DO $mw_early_algebra$
DECLARE affected integer;
BEGIN
  -- Problem 38, independent correct numeric answer 14
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الطرح هو العملية العكسية للجمع؛ لعزل المجهول نطرح 9 من طرفي المعادلة. في س + 9 = 23 نحسب س = 23 − 9 = 14. التحقق بالتعويض: 14 + 9 = 23، إذن الحل صحيح.',
      "DetailedSolutionEn" = 'Rule used: Subtraction reverses addition. To isolate the unknown in x + 9 = 23, subtract 9 from both sides: x = 23 − 9 = 14. Check by substitution: 14 + 9 = 23.'
  WHERE "Id" = 38
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'إذا كان x + 9 = 23، فما قيمة x؟'
    AND "QuestionTextEn" = 'If x + 9 = 23, what is x?'
    AND "DetailedSolutionAr" = 'نطرح 9 من الطرفين، فنحصل على x = 23 - 9 = 14.'
    AND "DetailedSolutionEn" = 'Subtract 9 from both sides: x = 23 - 9 = 14.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 38 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 38 AND q."Id" = 142
                  AND q."IsCorrect" AND q."LatexCode" = '14');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 38: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 54, independent correct numeric answer 9
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: القسمة هي العملية العكسية للضرب؛ نعزل المجهول بقسمة الطرفين على 4. إذا كان 4س = 36، إذن س = 36 ÷ 4 = 9. التحقق: 4 × 9 = 36.',
      "DetailedSolutionEn" = 'Rule used: Division reverses multiplication. For 4x = 36, divide both sides by 4: x = 36 ÷ 4 = 9. Check: 4 × 9 = 36.'
  WHERE "Id" = 54
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'إذا كان 4x = 36، فما قيمة x؟'
    AND "QuestionTextEn" = 'If 4x = 36, what is x?'
    AND "DetailedSolutionAr" = 'نقسم الطرفين على 4 فنحصل على x = 9.'
    AND "DetailedSolutionEn" = 'Divide both sides by 4 to obtain x = 9.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 54 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 54 AND q."Id" = 207
                  AND q."IsCorrect" AND q."LatexCode" = '9');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 54: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 70, independent correct numeric answer 5
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الطرح هو العملية العكسية للجمع؛ لعزل المجهول نطرح 7 من طرفي المعادلة. في س + 7 = 12 نحسب س = 12 − 7 = 5. التحقق بالتعويض: 5 + 7 = 12، إذن الحل صحيح.',
      "DetailedSolutionEn" = 'Rule used: Subtraction reverses addition. To isolate the unknown in x + 7 = 12, subtract 7 from both sides: x = 12 − 7 = 5. Check by substitution: 5 + 7 = 12.'
  WHERE "Id" = 70
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة س+7=12.'
    AND "QuestionTextEn" = 'Solve x+7=12.'
    AND "DetailedSolutionAr" = 'نطرح 7 من الطرفين، فنجد س=12-7=5.'
    AND "DetailedSolutionEn" = 'Subtract 7 from both sides to find x=12-7=5.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 70 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 70 AND q."Id" = 271
                  AND q."IsCorrect" AND q."LatexCode" = '5');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 70: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 85, independent correct numeric answer 7
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الطرح هو العملية العكسية للجمع؛ لعزل المجهول نطرح 8 من طرفي المعادلة. في س + 8 = 15 نحسب س = 15 − 8 = 7. التحقق بالتعويض: 7 + 8 = 15، إذن الحل صحيح.',
      "DetailedSolutionEn" = 'Rule used: Subtraction reverses addition. To isolate the unknown in x + 8 = 15, subtract 8 from both sides: x = 15 − 8 = 7. Check by substitution: 7 + 8 = 15.'
  WHERE "Id" = 85
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة س+8=15.'
    AND "QuestionTextEn" = 'Solve x+8=15.'
    AND "DetailedSolutionAr" = 'نطرح 8 من الطرفين، فنجد س=15-8=7.'
    AND "DetailedSolutionEn" = 'Subtract 8 from both sides to find x=15-8=7.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 85 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 85 AND q."Id" = 330
                  AND q."IsCorrect" AND q."LatexCode" = '7');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 85: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 100, independent correct numeric answer 9
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الطرح هو العملية العكسية للجمع؛ لعزل المجهول نطرح 9 من طرفي المعادلة. في س + 9 = 18 نحسب س = 18 − 9 = 9. التحقق بالتعويض: 9 + 9 = 18، إذن الحل صحيح.',
      "DetailedSolutionEn" = 'Rule used: Subtraction reverses addition. To isolate the unknown in x + 9 = 18, subtract 9 from both sides: x = 18 − 9 = 9. Check by substitution: 9 + 9 = 18.'
  WHERE "Id" = 100
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة س+9=18.'
    AND "QuestionTextEn" = 'Solve x+9=18.'
    AND "DetailedSolutionAr" = 'نطرح 9 من الطرفين، فنجد س=18-9=9.'
    AND "DetailedSolutionEn" = 'Subtract 9 from both sides to find x=18-9=9.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 100 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 100 AND q."Id" = 389
                  AND q."IsCorrect" AND q."LatexCode" = '9');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 100: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 115, independent correct numeric answer 11
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الطرح هو العملية العكسية للجمع؛ لعزل المجهول نطرح 10 من طرفي المعادلة. في س + 10 = 21 نحسب س = 21 − 10 = 11. التحقق بالتعويض: 11 + 10 = 21، إذن الحل صحيح.',
      "DetailedSolutionEn" = 'Rule used: Subtraction reverses addition. To isolate the unknown in x + 10 = 21, subtract 10 from both sides: x = 21 − 10 = 11. Check by substitution: 11 + 10 = 21.'
  WHERE "Id" = 115
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة س+10=21.'
    AND "QuestionTextEn" = 'Solve x+10=21.'
    AND "DetailedSolutionAr" = 'نطرح 10 من الطرفين، فنجد س=21-10=11.'
    AND "DetailedSolutionEn" = 'Subtract 10 from both sides to find x=21-10=11.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 115 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 115 AND q."Id" = 452
                  AND q."IsCorrect" AND q."LatexCode" = '11');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 115: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 130, independent correct numeric answer 13
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الطرح هو العملية العكسية للجمع؛ لعزل المجهول نطرح 11 من طرفي المعادلة. في س + 11 = 24 نحسب س = 24 − 11 = 13. التحقق بالتعويض: 13 + 11 = 24، إذن الحل صحيح.',
      "DetailedSolutionEn" = 'Rule used: Subtraction reverses addition. To isolate the unknown in x + 11 = 24, subtract 11 from both sides: x = 24 − 11 = 13. Check by substitution: 13 + 11 = 24.'
  WHERE "Id" = 130
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة س+11=24.'
    AND "QuestionTextEn" = 'Solve x+11=24.'
    AND "DetailedSolutionAr" = 'نطرح 11 من الطرفين، فنجد س=24-11=13.'
    AND "DetailedSolutionEn" = 'Subtract 11 from both sides to find x=24-11=13.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 130 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 130 AND q."Id" = 511
                  AND q."IsCorrect" AND q."LatexCode" = '13');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 130: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 152, independent correct numeric answer 3
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: نستخدم العمليات العكسية لعزل المجهول، ونلغي الجمع قبل الضرب. في المعادلة 2س + 4 = 10 نطرح 4 من الطرفين، فنحصل على 2س = 6. ثم نقسم على 2: س = 6 ÷ 2 = 3. التحقق: 2 × 3 + 4 = 10.',
      "DetailedSolutionEn" = 'Rule used: Solve a two-step equation with inverse operations: undo addition, then multiplication. From 2x + 4 = 10, subtract 4 to obtain 2x = 6, then divide by 2: x = 6 ÷ 2 = 3. Check: 2 × 3 + 4 = 10.'
  WHERE "Id" = 152
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة \(2x+4=10\).'
    AND "QuestionTextEn" = 'Solve \(2x+4=10\).'
    AND "DetailedSolutionAr" = 'بطرح 4 ثم القسمة على 2 نجد س=3.'
    AND "DetailedSolutionEn" = 'Subtract 4, then divide by 2 to find x=3.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 152 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 152 AND q."Id" = 598
                  AND q."IsCorrect" AND q."LatexCode" = '3');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 152: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 164, independent correct numeric answer 4
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: نستخدم العمليات العكسية لعزل المجهول، ونلغي الجمع قبل الضرب. في المعادلة 3س + 5 = 17 نطرح 5 من الطرفين، فنحصل على 3س = 12. ثم نقسم على 3: س = 12 ÷ 3 = 4. التحقق: 3 × 4 + 5 = 17.',
      "DetailedSolutionEn" = 'Rule used: Solve a two-step equation with inverse operations: undo addition, then multiplication. From 3x + 5 = 17, subtract 5 to obtain 3x = 12, then divide by 3: x = 12 ÷ 3 = 4. Check: 3 × 4 + 5 = 17.'
  WHERE "Id" = 164
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة \(3x+5=17\).'
    AND "QuestionTextEn" = 'Solve \(3x+5=17\).'
    AND "DetailedSolutionAr" = 'بطرح 5 ثم القسمة على 3 نجد س=4.'
    AND "DetailedSolutionEn" = 'Subtract 5, then divide by 3 to find x=4.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 164 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 164 AND q."Id" = 645
                  AND q."IsCorrect" AND q."LatexCode" = '4');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 164: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 176, independent correct numeric answer 5
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: نستخدم العمليات العكسية لعزل المجهول، ونلغي الجمع قبل الضرب. في المعادلة 4س + 6 = 26 نطرح 6 من الطرفين، فنحصل على 4س = 20. ثم نقسم على 4: س = 20 ÷ 4 = 5. التحقق: 4 × 5 + 6 = 26.',
      "DetailedSolutionEn" = 'Rule used: Solve a two-step equation with inverse operations: undo addition, then multiplication. From 4x + 6 = 26, subtract 6 to obtain 4x = 20, then divide by 4: x = 20 ÷ 4 = 5. Check: 4 × 5 + 6 = 26.'
  WHERE "Id" = 176
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة \(4x+6=26\).'
    AND "QuestionTextEn" = 'Solve \(4x+6=26\).'
    AND "DetailedSolutionAr" = 'بطرح 6 ثم القسمة على 4 نجد س=5.'
    AND "DetailedSolutionEn" = 'Subtract 6, then divide by 4 to find x=5.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 176 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 176 AND q."Id" = 696
                  AND q."IsCorrect" AND q."LatexCode" = '5');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 176: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 188, independent correct numeric answer 6
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: نستخدم العمليات العكسية لعزل المجهول، ونلغي الجمع قبل الضرب. في المعادلة 5س + 7 = 37 نطرح 7 من الطرفين، فنحصل على 5س = 30. ثم نقسم على 5: س = 30 ÷ 5 = 6. التحقق: 5 × 6 + 7 = 37.',
      "DetailedSolutionEn" = 'Rule used: Solve a two-step equation with inverse operations: undo addition, then multiplication. From 5x + 7 = 37, subtract 7 to obtain 5x = 30, then divide by 5: x = 30 ÷ 5 = 6. Check: 5 × 6 + 7 = 37.'
  WHERE "Id" = 188
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة \(5x+7=37\).'
    AND "QuestionTextEn" = 'Solve \(5x+7=37\).'
    AND "DetailedSolutionAr" = 'بطرح 7 ثم القسمة على 5 نجد س=6.'
    AND "DetailedSolutionEn" = 'Subtract 7, then divide by 5 to find x=6.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 188 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 188 AND q."Id" = 743
                  AND q."IsCorrect" AND q."LatexCode" = '6');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 188: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 200, independent correct numeric answer 7
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: نستخدم العمليات العكسية لعزل المجهول، ونلغي الجمع قبل الضرب. في المعادلة 6س + 8 = 50 نطرح 8 من الطرفين، فنحصل على 6س = 42. ثم نقسم على 6: س = 42 ÷ 6 = 7. التحقق: 6 × 7 + 8 = 50.',
      "DetailedSolutionEn" = 'Rule used: Solve a two-step equation with inverse operations: undo addition, then multiplication. From 6x + 8 = 50, subtract 8 to obtain 6x = 42, then divide by 6: x = 42 ÷ 6 = 7. Check: 6 × 7 + 8 = 50.'
  WHERE "Id" = 200
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'حل المعادلة \(6x+8=50\).'
    AND "QuestionTextEn" = 'Solve \(6x+8=50\).'
    AND "DetailedSolutionAr" = 'بطرح 8 ثم القسمة على 6 نجد س=7.'
    AND "DetailedSolutionEn" = 'Subtract 8, then divide by 6 to find x=7.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 200 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 200 AND q."Id" = 790
                  AND q."IsCorrect" AND q."LatexCode" = '7');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 200: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 153, independent correct numeric answer 14
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: في النمط الحسابي نضيف فرقاً ثابتاً إلى كل حد لنصل إلى الحد التالي. الفرق بين الحدود هو 3؛ من الحد الرابع 11 نضيف 3 فنحصل على الحد الخامس 11 + 3 = 14. ويمكن التحقق: الحد الأول + أربع قفزات = 2 + 4 × 3 = 14.',
      "DetailedSolutionEn" = 'Rule used: An arithmetic sequence increases by the same common difference each time. The difference is 3; after the fourth term 11, the fifth is 11 + 3 = 14. Check: first term plus four steps = 2 + 4 × 3 = 14.'
  WHERE "Id" = 153
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'المتتالية 2، 5، 8، 11؛ ما الحد الخامس؟'
    AND "QuestionTextEn" = 'Sequence 2, 5, 8, 11; find the fifth term.'
    AND "DetailedSolutionAr" = 'نزيد بمقدار 3 كل مرة، فالحد الخامس 14.'
    AND "DetailedSolutionEn" = 'Add 3 each time, giving fifth term 14.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 153 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 153 AND q."Id" = 601
                  AND q."IsCorrect" AND q."LatexCode" = '14');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 153: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 165, independent correct numeric answer 19
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: في النمط الحسابي نضيف فرقاً ثابتاً إلى كل حد لنصل إلى الحد التالي. الفرق بين الحدود هو 4؛ من الحد الرابع 15 نضيف 4 فنحصل على الحد الخامس 15 + 4 = 19. ويمكن التحقق: الحد الأول + أربع قفزات = 3 + 4 × 4 = 19.',
      "DetailedSolutionEn" = 'Rule used: An arithmetic sequence increases by the same common difference each time. The difference is 4; after the fourth term 15, the fifth is 15 + 4 = 19. Check: first term plus four steps = 3 + 4 × 4 = 19.'
  WHERE "Id" = 165
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'المتتالية 3، 7، 11، 15؛ ما الحد الخامس؟'
    AND "QuestionTextEn" = 'Sequence 3, 7, 11, 15; find the fifth term.'
    AND "DetailedSolutionAr" = 'نزيد بمقدار 4 كل مرة، فالحد الخامس 19.'
    AND "DetailedSolutionEn" = 'Add 4 each time, giving fifth term 19.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 165 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 165 AND q."Id" = 652
                  AND q."IsCorrect" AND q."LatexCode" = '19');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 165: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 177, independent correct numeric answer 24
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: في النمط الحسابي نضيف فرقاً ثابتاً إلى كل حد لنصل إلى الحد التالي. الفرق بين الحدود هو 5؛ من الحد الرابع 19 نضيف 5 فنحصل على الحد الخامس 19 + 5 = 24. ويمكن التحقق: الحد الأول + أربع قفزات = 4 + 4 × 5 = 24.',
      "DetailedSolutionEn" = 'Rule used: An arithmetic sequence increases by the same common difference each time. The difference is 5; after the fourth term 19, the fifth is 19 + 5 = 24. Check: first term plus four steps = 4 + 4 × 5 = 24.'
  WHERE "Id" = 177
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'المتتالية 4، 9، 14، 19؛ ما الحد الخامس؟'
    AND "QuestionTextEn" = 'Sequence 4, 9, 14, 19; find the fifth term.'
    AND "DetailedSolutionAr" = 'نزيد بمقدار 5 كل مرة، فالحد الخامس 24.'
    AND "DetailedSolutionEn" = 'Add 5 each time, giving fifth term 24.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 177 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 177 AND q."Id" = 699
                  AND q."IsCorrect" AND q."LatexCode" = '24');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 177: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 189, independent correct numeric answer 29
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: في النمط الحسابي نضيف فرقاً ثابتاً إلى كل حد لنصل إلى الحد التالي. الفرق بين الحدود هو 6؛ من الحد الرابع 23 نضيف 6 فنحصل على الحد الخامس 23 + 6 = 29. ويمكن التحقق: الحد الأول + أربع قفزات = 5 + 4 × 6 = 29.',
      "DetailedSolutionEn" = 'Rule used: An arithmetic sequence increases by the same common difference each time. The difference is 6; after the fourth term 23, the fifth is 23 + 6 = 29. Check: first term plus four steps = 5 + 4 × 6 = 29.'
  WHERE "Id" = 189
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'المتتالية 5، 11، 17، 23؛ ما الحد الخامس؟'
    AND "QuestionTextEn" = 'Sequence 5, 11, 17, 23; find the fifth term.'
    AND "DetailedSolutionAr" = 'نزيد بمقدار 6 كل مرة، فالحد الخامس 29.'
    AND "DetailedSolutionEn" = 'Add 6 each time, giving fifth term 29.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 189 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 189 AND q."Id" = 746
                  AND q."IsCorrect" AND q."LatexCode" = '29');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 189: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 201, independent correct numeric answer 34
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: في النمط الحسابي نضيف فرقاً ثابتاً إلى كل حد لنصل إلى الحد التالي. الفرق بين الحدود هو 7؛ من الحد الرابع 27 نضيف 7 فنحصل على الحد الخامس 27 + 7 = 34. ويمكن التحقق: الحد الأول + أربع قفزات = 6 + 4 × 7 = 34.',
      "DetailedSolutionEn" = 'Rule used: An arithmetic sequence increases by the same common difference each time. The difference is 7; after the fourth term 27, the fifth is 27 + 7 = 34. Check: first term plus four steps = 6 + 4 × 7 = 34.'
  WHERE "Id" = 201
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'المتتالية 6، 13، 20، 27؛ ما الحد الخامس؟'
    AND "QuestionTextEn" = 'Sequence 6, 13, 20, 27; find the fifth term.'
    AND "DetailedSolutionAr" = 'نزيد بمقدار 7 كل مرة، فالحد الخامس 34.'
    AND "DetailedSolutionEn" = 'Add 7 each time, giving fifth term 34.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 201 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 201 AND q."Id" = 793
                  AND q."IsCorrect" AND q."LatexCode" = '34');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 201: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 689, independent correct numeric answer 9
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: في التوزيع بالتساوي يكون نصيب كل صندوق = العدد الكلي ÷ عدد الصناديق. لدينا 54 كرة وستة صناديق؛ نكتب 6س = 54 ثم نقسم على 6 لنحصل على س = 54 ÷ 6 = 9 كرات لكل صندوق. التحقق: 6 × 9 = 54.',
      "DetailedSolutionEn" = 'Rule used: Equal sharing means the amount per box equals the total divided by the number of boxes. For 54 balls in 6 boxes, 6x = 54, so x = 54 ÷ 6 = 9 balls per box. Check: 6 × 9 = 54.'
  WHERE "Id" = 689
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'وُزّعت 54 كرة بالتساوي على 6 صناديق. إذا كان في كل صندوق x كرة، فما قيمة x؟'
    AND "QuestionTextEn" = '54 balls are distributed equally across 6 boxes. If each box holds x balls, what is x?'
    AND "DetailedSolutionAr" = 'نكتب 6x = 54، ثم نقسم الطرفين على 6، فنجد x = 9.'
    AND "DetailedSolutionEn" = 'Write 6x = 54 and divide both sides by 6 to obtain x = 9.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 689 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 689 AND q."Id" = 2811
                  AND q."IsCorrect" AND q."LatexCode" = '9');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 689: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 690, independent correct numeric answer 13
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: نقسم طرفي المعادلة على معامل المتغير لعزله. من 7k = 91 نحصل على k = 91 ÷ 7 = 13. التحقق بالتعويض: 7 × 13 = 91، لذلك قيمة k الصحيحة هي 13.',
      "DetailedSolutionEn" = 'Rule used: Isolate a variable by dividing both sides by its coefficient. From 7k = 91, calculate k = 91 ÷ 7 = 13. Check: 7 × 13 = 91, confirming k = 13.'
  WHERE "Id" = 690
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'أي قيمة للمتغير k تحقق 7k = 91؟'
    AND "QuestionTextEn" = 'Which value of k satisfies 7k = 91?'
    AND "DetailedSolutionAr" = 'نقسم 91 على 7، فيكون k = 13؛ نتحقق: 7 × 13 = 91.'
    AND "DetailedSolutionEn" = 'Divide 91 by 7 to obtain k = 13. Verify: 7 × 13 = 91.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 690 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 690 AND q."Id" = 2815
                  AND q."IsCorrect" AND q."LatexCode" = '13');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 690: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 691, independent correct numeric answer 9
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: عند توزيع أشياء بالتساوي، عدد الأشياء في كل صف = العدد الكلي ÷ عدد الصفوف. لدينا 72 بلاطة موزعة على 8 صفوف، لذلك 8س = 72 ومنها س = 72 ÷ 8 = 9 بلاطات في كل صف. التحقق: 8 × 9 = 72.',
      "DetailedSolutionEn" = 'Rule used: For equal rows, tiles per row = total tiles ÷ number of rows. With 72 tiles in 8 equal rows, 8x = 72 and x = 72 ÷ 8 = 9 tiles per row. Check: 8 × 9 = 72.'
  WHERE "Id" = 691
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'رتّبت 72 بلاطة في 8 صفوف متساوية. ما عدد البلاطات في كل صف؟'
    AND "QuestionTextEn" = '72 tiles are arranged in 8 equal rows. How many tiles are in each row?'
    AND "DetailedSolutionAr" = 'إذا كان عدد البلاطات في الصف x فإن 8x = 72، وبالتالي x = 9.'
    AND "DetailedSolutionEn" = 'If each row contains x tiles, 8x = 72, so x = 9.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 691 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 691 AND q."Id" = 2819
                  AND q."IsCorrect" AND q."LatexCode" = '9');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 691: stale question, solution, or answer; abort entire transaction'; END IF;

  -- Problem 692, independent correct numeric answer 60
  UPDATE public."Problems"
  SET "DetailedSolutionAr" = 'المبدأ المستخدم: الضرب يعكس القسمة؛ إذا كان س ÷ 5 = 12 فإننا نضرب الطرفين في 5. بالتعويض س = 12 × 5 = 60. التحقق: 60 ÷ 5 = 12، لذا القيمة المطلوبة 60.',
      "DetailedSolutionEn" = 'Rule used: Multiplication reverses division. For x ÷ 5 = 12, multiply both sides by 5: x = 12 × 5 = 60. Check: 60 ÷ 5 = 12, so x is 60.'
  WHERE "Id" = 692
    AND "StageId" = 1 AND "CategoryId" = 2
    AND "QuestionTextAr" = 'إذا كان x ÷ 5 = 12، فما قيمة x؟'
    AND "QuestionTextEn" = 'If x ÷ 5 = 12, what is x?'
    AND "DetailedSolutionAr" = 'نضرب الطرفين في 5: x = 12 × 5 = 60.'
    AND "DetailedSolutionEn" = 'Multiply both sides by 5: x = 12 × 5 = 60.'
    AND (SELECT count(*) FROM public."QuestionOptions" q WHERE q."ProblemId" = 692 AND q."IsCorrect") = 1
    AND EXISTS (SELECT 1 FROM public."QuestionOptions" q
                WHERE q."ProblemId" = 692 AND q."Id" = 2823
                  AND q."IsCorrect" AND q."LatexCode" = '60');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Early algebra 692: stale question, solution, or answer; abort entire transaction'; END IF;

END $mw_early_algebra$;
COMMIT;
