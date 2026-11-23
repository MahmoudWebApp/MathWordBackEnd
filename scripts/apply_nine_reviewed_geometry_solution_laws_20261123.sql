-- MathWorld: independently reviewed geometry worked-solution laws, wave 1.
-- Nine solution-text-only updates: 8, 9, 39, 55, 156, 157, 613, 614, 615.
-- Problem 616 deliberately excluded: separately corrected and verified in production.
-- Source: content/editorial/solution-law-review-wave1-20261123.json
-- Numeric oracles and correct option IDs: tests/check_solution_law_review_wave1_20261123.py
-- All preconditions are exact; any changed row prevents all updates from committing.
-- NOTE: ONE-TIME SQL; do not rerun after successful application.
-- No changes to stage, category, questions, answer choices, correct keys, progress or subscriptions.
BEGIN;
DO $mw_solution_wave1$
DECLARE affected INTEGER;
BEGIN
  -- Problem 8: reviewed 20; preserve the verified correct option 21.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: محيط المربع = 4 × طول الضلع. طول الضلع 5 سم، لذا نعوّض: 4 × 5 = 20 سم. النتيجة: محيط المربع 20 سم لأن للمربع أربعة أضلاع متساوية.',
         "DetailedSolutionEn" = 'Rule used: Perimeter of a square = 4 × side length. Substitute the 5 cm side: 4 × 5 = 20 cm. The perimeter is 20 cm because the square has four equal sides.'
   WHERE "Id" = 8
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مربع طول ضلعه $5$ سم. ما محيطه؟'
     AND "DetailedSolutionAr" = 'محيط المربع = $4 \times \text{طول الضلع} = 4 \times 5 = 20$ سم.'
     AND "DetailedSolutionEn" = 'Perimeter of a square = $4 \times \text{side length} = 4 \times 5 = 20$ cm.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 8 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 8 AND qo."Id" = 21 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 8: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 9: reviewed 24; preserve the verified correct option 25.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: مساحة المستطيل = الطول × العرض. المعطيات: الطول 8 م والعرض 3 م. بالتعويض: 8 × 3 = 24. النتيجة: 24 م²؛ لأن المساحة تُقاس بوحدات مربعة.',
         "DetailedSolutionEn" = 'Rule used: Area of a rectangle = length × width. The dimensions are 8 m and 3 m. Substitution gives 8 × 3 = 24. Final area = 24 m²; area is measured in square units.'
   WHERE "Id" = 9
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مستطيل طوله $8$ متر وعرضه $3$ متر. ما مساحته؟'
     AND "DetailedSolutionAr" = 'مساحة المستطيل = الطول $\times$ العرض $= 8 \times 3 = 24$ متر مربع.'
     AND "DetailedSolutionEn" = 'Area of rectangle = length $\times$ width $= 8 \times 3 = 24$ square meters.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 9 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 9 AND qo."Id" = 25 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 9: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 39: reviewed 26; preserve the verified correct option 147.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: محيط المستطيل = 2 × (الطول + العرض). المعطيات: 8 سم و5 سم. نجمع أولاً: 8 + 5 = 13 سم، ثم نضرب في 2: 2 × 13 = 26 سم. النتيجة 26 سم؛ المحيط طول حدود الشكل.',
         "DetailedSolutionEn" = 'Rule used: Rectangle perimeter = 2 × (length + width). Dimensions are 8 cm and 5 cm. First sum: 8 + 5 = 13 cm, then double: 2 × 13 = 26 cm. The perimeter is 26 cm, the distance around the rectangle.'
   WHERE "Id" = 39
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مستطيل طوله 8 سم وعرضه 5 سم؛ ما محيطه؟'
     AND "DetailedSolutionAr" = 'المحيط يساوي 2 × (الطول + العرض)، أي 2 × (8 + 5) = 26 سم.'
     AND "DetailedSolutionEn" = 'Perimeter = 2(length + width) = 2(8 + 5) = 26 cm.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 39 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 39 AND qo."Id" = 147 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 39: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 55: reviewed 30; preserve the verified correct option 212.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: مساحة المثلث = (القاعدة × الارتفاع العمودي) ÷ 2. نعوّض القاعدة 10 سم والارتفاع 6 سم: (10 × 6) ÷ 2 = 60 ÷ 2 = 30 سم². النتيجة 30 سم²، ونستخدم الارتفاع العمودي على القاعدة.',
         "DetailedSolutionEn" = 'Rule used: Triangle area = (base × perpendicular height) ÷ 2. Substitute base 10 cm and height 6 cm: (10 × 6) ÷ 2 = 60 ÷ 2 = 30 cm². The answer is 30 cm²; the height must be perpendicular to the base.'
   WHERE "Id" = 55
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مثلث قاعدته 10 سم وارتفاعه 6 سم، ما مساحته؟'
     AND "DetailedSolutionAr" = 'المساحة = نصف القاعدة × الارتفاع = 10 × 6 ÷ 2 = 30 سم².'
     AND "DetailedSolutionEn" = 'Triangle area = base × height / 2 = 10 × 6 / 2 = 30 cm².'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 55 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 55 AND qo."Id" = 212 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 55: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 156: reviewed 70; preserve the verified correct option 616.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: مجموع الزوايا الداخلية للمثلث = 180°. المعطيات: 50° و60°. الزاوية المجهولة = 180° − (50° + 60°) = 180° − 110° = 70°. نتحقق: 50° + 60° + 70° = 180°.',
         "DetailedSolutionEn" = 'Rule used: The interior angles of a triangle sum to 180°. Given 50° and 60°, the missing angle is 180° − (50° + 60°) = 70°. Check: 50° + 60° + 70° = 180°.'
   WHERE "Id" = 156
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'زاويتا مثلث هما 50° و60°، ما الثالثة؟'
     AND "DetailedSolutionAr" = 'الزاوية الثالثة=180−50−60=70°.'
     AND "DetailedSolutionEn" = 'The third angle=180−50−60=70°.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 156 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 156 AND qo."Id" = 616 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 156: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 157: reviewed 200; preserve the verified correct option 619.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'قاعدة التحويل: 1 متر = 100 سنتيمتر. للتحويل من المتر إلى السنتيمتر نضرب في 100. المعطى 2 متر، لذا 2 × 100 = 200 سنتيمتر. النتيجة: 200 سم.',
         "DetailedSolutionEn" = 'Conversion rule: 1 metre = 100 centimetres. Multiply metres by 100 to obtain centimetres. For 2 metres, 2 × 100 = 200 centimetres. Final answer: 200 cm.'
   WHERE "Id" = 157
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'حوّل 2 متر إلى سنتيمترات.'
     AND "DetailedSolutionAr" = 'بما أن المتر 100 سم فالنتيجة 200.'
     AND "DetailedSolutionEn" = 'One metre equals 100 cm, giving 200.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 157 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 157 AND qo."Id" = 619 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 157: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 613: reviewed 7; preserve the verified correct option 2443.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: مساحة المثلث = (القاعدة × الارتفاع) ÷ 2، ومنها الارتفاع = (2 × المساحة) ÷ القاعدة. المعطيات: المساحة 42 سم² والقاعدة 12 سم. الارتفاع = (2 × 42) ÷ 12 = 84 ÷ 12 = 7 سم. التحقق: 12 × 7 ÷ 2 = 42 سم².',
         "DetailedSolutionEn" = 'Rule used: Triangle area A = base × height ÷ 2, hence height = 2A ÷ base. Given A = 42 cm² and base = 12 cm, height = (2 × 42) ÷ 12 = 7 cm. Check: 12 × 7 ÷ 2 = 42 cm².'
   WHERE "Id" = 613
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مساحة مثلث 42 سم² وقاعدته 12 سم. ما ارتفاعه بالسنتيمتر؟'
     AND "DetailedSolutionAr" = 'المساحة = القاعدة × الارتفاع ÷ 2، لذا الارتفاع = 2 × 42 ÷ 12 = 7 سم.'
     AND "DetailedSolutionEn" = 'Using A = bh/2, the height is 2 × 42 ÷ 12 = 7 cm.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 613 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 613 AND qo."Id" = 2443 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 613: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 614: reviewed 36; preserve the verified correct option 2446.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: مساحة المثلث القائم = (طول الضلع القائم الأول × طول الضلع القائم الثاني) ÷ 2. لأن الضلعين 9 و8 سم متعامدان، يمثّلان القاعدة والارتفاع: 9 × 8 ÷ 2 = 72 ÷ 2 = 36 سم².',
         "DetailedSolutionEn" = 'Rule used: Right-triangle area = (first perpendicular side × second perpendicular side) ÷ 2. The 9 cm and 8 cm sides meet at a right angle, so 9 × 8 ÷ 2 = 36 cm².'
   WHERE "Id" = 614
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مثلث قائم طولا ضلعيه المتعامدين 9 سم و8 سم. كم مساحته بالسم²؟'
     AND "DetailedSolutionAr" = 'الضلعان المتعامدان هما القاعدة والارتفاع، فالمساحة = 9 × 8 ÷ 2 = 36.'
     AND "DetailedSolutionEn" = 'The perpendicular sides form the base and height: 9 × 8 ÷ 2 = 36.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 614 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 614 AND qo."Id" = 2446 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 614: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

  -- Problem 615: reviewed 35; preserve the verified correct option 2450.
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: مساحة المثلث = (القاعدة × الارتفاع العمودي) ÷ 2. القاعدة 14 سم والارتفاع العمودي 5 سم، فنحسب 14 × 5 ÷ 2 = 35 سم². الضلع الآخر 12 سم ليس ارتفاعاً عمودياً؛ لا نستخدمه في هذا القانون.',
         "DetailedSolutionEn" = 'Rule used: Triangle area = (base × perpendicular height) ÷ 2. With base 14 cm and perpendicular height 5 cm, area = 14 × 5 ÷ 2 = 35 cm². The other 12 cm side is not the perpendicular height and is not used.'
   WHERE "Id" = 615
     AND "StageId" = 1
     AND "CategoryId" = 3
     AND "QuestionTextAr" = 'مثلث قاعدته 14 سم وارتفاعه العمودي 5 سم وطول أحد أضلاعه الأخرى 12 سم. ما مساحته بالسم²؟'
     AND "DetailedSolutionAr" = 'نستخدم الارتفاع العمودي لا الضلع الآخر؛ المساحة = 14 × 5 ÷ 2 = 35.'
     AND "DetailedSolutionEn" = 'Use the perpendicular height, not the other side: 14 × 5 ÷ 2 = 35.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 615 AND qo."IsCorrect") = 1
     AND EXISTS (SELECT 1 FROM public."QuestionOptions" qo WHERE qo."ProblemId" = 615 AND qo."Id" = 2450 AND qo."IsCorrect");
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN
    RAISE EXCEPTION 'Problem 615: stale explanation, changed question/answer, or missing source row; abort nine-row transaction';
  END IF;

END
$mw_solution_wave1$;
COMMIT;
-- Post-application verification (read-only):
-- SELECT "Id","DetailedSolutionAr","DetailedSolutionEn" FROM public."Problems"
-- WHERE "Id" IN (8,9,39,55,156,157,613,614,615) ORDER BY "Id";
