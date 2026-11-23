-- One-time, atomic change of bilingual solution text for category 33.
-- Never rerun after successful execution. No questions, options, keys, or student data changed.
-- Source: content/editorial/primary-multiplication-division-solution-laws-20261123.json
BEGIN;
DO $mw_cat33$
DECLARE affected integer;
BEGIN
  -- Problem 53; correct answer 54
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: يمكن الاستفادة من حقيقة أن 9 = 10 − 1. بالتوزيع: 9 × 6 = (10 − 1) × 6 = 60 − 6 = 54. إذن ناتج ضرب 9 في 6 هو 54.',
         "DetailedSolutionEn" = 'Rule used: Apply the distributive property with 9 = 10 − 1. Compute 9 × 6 = (10 − 1) × 6 = 60 − 6 = 54. Thus the product is 54.'
   WHERE "Id" = 53
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'كم يساوي 9 × 6؟'
     AND "QuestionTextEn" = 'What is 9 multiplied by 6?'
     AND "DetailedSolutionAr" = 'نحسب 9 × 6 = 54.'
     AND "DetailedSolutionEn" = 'Multiply nine by six: 54.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 53 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 53
            AND o."Id" = 202
            AND o."IsCorrect" AND o."LatexCode" = '54'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 53: stale source/answer; rollback entire batch'; END IF;

  -- Problem 149; correct answer 48
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: خاصية التوزيع في الضرب. نفكك 12 إلى 10 + 2، فيكون 12 × 4 = (10 + 2) × 4 = 10 × 4 + 2 × 4 = 40 + 8 = 48. النتيجة 48.',
         "DetailedSolutionEn" = 'Rule used: The distributive property. Split 12 into 10 + 2: 12 × 4 = (10 + 2) × 4 = (10 × 4) + (2 × 4) = 40 + 8 = 48. Answer: 48.'
   WHERE "Id" = 149
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 12 × 4.'
     AND "QuestionTextEn" = 'Compute 12 × 4.'
     AND "DetailedSolutionAr" = 'بضرب العددين: 12×4=48.'
     AND "DetailedSolutionEn" = 'Multiply: 12×4=48.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 149 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 149
            AND o."Id" = 587
            AND o."IsCorrect" AND o."LatexCode" = '48'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 149: stale source/answer; rollback entire batch'; END IF;

  -- Problem 150; correct answer 12
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: القسمة عكس الضرب، وناتج القسمة هو العدد الذي إذا ضربناه في المقسوم عليه أعاد المقسوم. نبحث عن عدد نضربه في 3 لنحصل على 36؛ بما أن 3 × 12 = 36، إذن 36 ÷ 3 = 12.',
         "DetailedSolutionEn" = 'Rule used: Division is the inverse of multiplication. Find the number that gives 36 when multiplied by 3. Since 3 × 12 = 36, we have 36 ÷ 3 = 12.'
   WHERE "Id" = 150
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 36 ÷ 3.'
     AND "QuestionTextEn" = 'Calculate 36 divided by 3.'
     AND "DetailedSolutionAr" = 'لأن 3×12=36، الناتج 12.'
     AND "DetailedSolutionEn" = 'Since 3×12=36, the quotient is 12.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 150 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 150
            AND o."Id" = 590
            AND o."IsCorrect" AND o."LatexCode" = '12'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 150: stale source/answer; rollback entire batch'; END IF;

  -- Problem 151; correct answer 28
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: الثمن الكلي = ثمن القطعة الواحدة × عدد القطع. ثمن القلم 7 وحدات وعدد الأقلام 4، فنحسب 7 × 4 = 28 وحدة نقدية. نستخدم الضرب لأن السعر نفسه يتكرر أربع مرات.',
         "DetailedSolutionEn" = 'Rule used: Total cost = unit price × number of items. Each pen costs 7 units, and there are 4 pens. Substitute 7 × 4 = 28 currency units. Multiplication combines four equal prices.'
   WHERE "Id" = 151
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'ثمن القلم 7 وحدات. كم ثمن 4 أقلام؟'
     AND "QuestionTextEn" = 'Each pen costs 7 units. What do 4 pens cost?'
     AND "DetailedSolutionAr" = 'الثمن=4×7=28.'
     AND "DetailedSolutionEn" = 'Cost=4×7=28.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 151 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 151
            AND o."Id" = 593
            AND o."IsCorrect" AND o."LatexCode" = '28'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 151: stale source/answer; rollback entire batch'; END IF;

  -- Problem 161; correct answer 75
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: نوزع الضرب على جمع الأعداد. نفكك 15 إلى 10 + 5، فنحسب 15 × 5 = (10 × 5) + (5 × 5) = 50 + 25 = 75. إذن الناتج 75.',
         "DetailedSolutionEn" = 'Rule used: Distribute multiplication over addition. Decompose 15 into 10 + 5: 15 × 5 = (10 × 5) + (5 × 5) = 50 + 25 = 75. The answer is 75.'
   WHERE "Id" = 161
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 15 × 5.'
     AND "QuestionTextEn" = 'Compute 15 × 5.'
     AND "DetailedSolutionAr" = 'بضرب العددين: 15×5=75.'
     AND "DetailedSolutionEn" = 'Multiply: 15×5=75.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 161 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 161
            AND o."Id" = 634
            AND o."IsCorrect" AND o."LatexCode" = '75'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 161: stale source/answer; rollback entire batch'; END IF;

  -- Problem 162; correct answer 14
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: القسمة إلى مجموعات متساوية هي عكس الضرب. نريد عدد المجموعات الأربع في 56؛ بما أن 4 × 14 = 56، فإن 56 ÷ 4 = 14. ويمكن التأكد: 14 + 14 + 14 + 14 = 56.',
         "DetailedSolutionEn" = 'Rule used: Equal sharing and multiplication are inverses. Because 4 × 14 = 56, dividing 56 into 4 equal groups gives 56 ÷ 4 = 14. Check: 14 + 14 + 14 + 14 = 56.'
   WHERE "Id" = 162
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 56 ÷ 4.'
     AND "QuestionTextEn" = 'Calculate 56 divided by 4.'
     AND "DetailedSolutionAr" = 'لأن 4×14=56، الناتج 14.'
     AND "DetailedSolutionEn" = 'Since 4×14=56, the quotient is 14.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 162 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 162
            AND o."Id" = 637
            AND o."IsCorrect" AND o."LatexCode" = '14'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 162: stale source/answer; rollback entire batch'; END IF;

  -- Problem 163; correct answer 40
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: الكلفة الكلية = سعر القلم × عدد الأقلام. بما أن القلم الواحد يكلف 8 وحدات ولدينا 5 أقلام، نحسب 8 × 5 = 40 وحدة نقدية. التحقق: خمس مجموعات من 8 تساوي 40.',
         "DetailedSolutionEn" = 'Rule used: Total cost = price per pen × number of pens. At 8 units each for 5 pens, the cost is 8 × 5 = 40 units. Check: five groups of eight total 40.'
   WHERE "Id" = 163
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'ثمن القلم 8 وحدات. كم ثمن 5 أقلام؟'
     AND "QuestionTextEn" = 'Each pen costs 8 units. What do 5 pens cost?'
     AND "DetailedSolutionAr" = 'الثمن=5×8=40.'
     AND "DetailedSolutionEn" = 'Cost=5×8=40.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 163 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 163
            AND o."Id" = 644
            AND o."IsCorrect" AND o."LatexCode" = '40'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 163: stale source/answer; rollback entire batch'; END IF;

  -- Problem 173; correct answer 108
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: خاصية التوزيع. نكتب 18 = 20 − 2، ثم نحسب 18 × 6 = (20 − 2) × 6 = 120 − 12 = 108. إذن حاصل الضرب 108.',
         "DetailedSolutionEn" = 'Rule used: Use the distributive property with 18 = 20 − 2. Thus 18 × 6 = (20 − 2) × 6 = 120 − 12 = 108. The product is 108.'
   WHERE "Id" = 173
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 18 × 6.'
     AND "QuestionTextEn" = 'Compute 18 × 6.'
     AND "DetailedSolutionAr" = 'بضرب العددين: 18×6=108.'
     AND "DetailedSolutionEn" = 'Multiply: 18×6=108.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 173 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 173
            AND o."Id" = 681
            AND o."IsCorrect" AND o."LatexCode" = '108'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 173: stale source/answer; rollback entire batch'; END IF;

  -- Problem 174; correct answer 16
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: القسمة تعيد معرفة عدد المجموعات المتساوية، ويمكن تفكيك المقسوم. نكتب 80 = 50 + 30؛ إذن 80 ÷ 5 = 50 ÷ 5 + 30 ÷ 5 = 10 + 6 = 16. نتحقق: 16 × 5 = 80.',
         "DetailedSolutionEn" = 'Rule used: Division can be applied to addends that each divide evenly. Split 80 into 50 + 30: 80 ÷ 5 = (50 ÷ 5) + (30 ÷ 5) = 10 + 6 = 16. Check: 16 × 5 = 80.'
   WHERE "Id" = 174
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 80 ÷ 5.'
     AND "QuestionTextEn" = 'Calculate 80 divided by 5.'
     AND "DetailedSolutionAr" = 'لأن 5×16=80، الناتج 16.'
     AND "DetailedSolutionEn" = 'Since 5×16=80, the quotient is 16.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 174 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 174
            AND o."Id" = 688
            AND o."IsCorrect" AND o."LatexCode" = '16'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 174: stale source/answer; rollback entire batch'; END IF;

  -- Problem 175; correct answer 54
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: ثمن جميع الأقلام = ثمن القلم الواحد × عدد الأقلام. ثمن الواحد 9 وحدات والعدد 6، لذا الكلفة = 9 × 6 = 54 وحدة. ويمكن التحقق: 10 × 6 − 6 = 54.',
         "DetailedSolutionEn" = 'Rule used: Total cost = unit price × quantity. With 6 pens at 9 units each, cost = 9 × 6 = 54 units. Check: 10 × 6 − 6 = 54.'
   WHERE "Id" = 175
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'ثمن القلم 9 وحدات. كم ثمن 6 أقلام؟'
     AND "QuestionTextEn" = 'Each pen costs 9 units. What do 6 pens cost?'
     AND "DetailedSolutionAr" = 'الثمن=6×9=54.'
     AND "DetailedSolutionEn" = 'Cost=6×9=54.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 175 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 175
            AND o."Id" = 691
            AND o."IsCorrect" AND o."LatexCode" = '54'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 175: stale source/answer; rollback entire batch'; END IF;

  -- Problem 185; correct answer 147
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: خاصية التوزيع والقيمة المكانية. نفكك 21 إلى 20 + 1، فنحسب 21 × 7 = (20 × 7) + (1 × 7) = 140 + 7 = 147. النتيجة 147.',
         "DetailedSolutionEn" = 'Rule used: Distributive property and place value. Write 21 = 20 + 1, so 21 × 7 = (20 × 7) + (1 × 7) = 140 + 7 = 147. Answer: 147.'
   WHERE "Id" = 185
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 21 × 7.'
     AND "QuestionTextEn" = 'Compute 21 × 7.'
     AND "DetailedSolutionAr" = 'بضرب العددين: 21×7=147.'
     AND "DetailedSolutionEn" = 'Multiply: 21×7=147.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 185 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 185
            AND o."Id" = 732
            AND o."IsCorrect" AND o."LatexCode" = '147'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 185: stale source/answer; rollback entire batch'; END IF;

  -- Problem 186; correct answer 18
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: نتحقق من القسمة بالضرب. لأن 6 × 18 = 108، فإن 108 ÷ 6 = 18. ولإظهار الحساب نفكك 108 إلى 60 + 48، ثم 60 ÷ 6 = 10 و48 ÷ 6 = 8؛ المجموع 18.',
         "DetailedSolutionEn" = 'Rule used: Multiplication checks division. Since 6 × 18 = 108, 108 ÷ 6 = 18. To compute it, split 108 = 60 + 48; then 60 ÷ 6 = 10 and 48 ÷ 6 = 8, totaling 18.'
   WHERE "Id" = 186
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 108 ÷ 6.'
     AND "QuestionTextEn" = 'Calculate 108 divided by 6.'
     AND "DetailedSolutionAr" = 'لأن 6×18=108، الناتج 18.'
     AND "DetailedSolutionEn" = 'Since 6×18=108, the quotient is 18.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 186 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 186
            AND o."Id" = 735
            AND o."IsCorrect" AND o."LatexCode" = '18'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 186: stale source/answer; rollback entire batch'; END IF;

  -- Problem 187; correct answer 70
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: السعر الكلي = السعر للوحدة × العدد. لدينا 7 أقلام وسعر كل قلم 10 وحدات. إذن الكلفة = 7 × 10 = 70 وحدة نقدية. الضرب بعشرة يضيف صفراً إلى العدد الصحيح 7.',
         "DetailedSolutionEn" = 'Rule used: Total price = unit price × quantity. Seven pens at 10 units each cost 7 × 10 = 70 units. Multiplying the whole number 7 by 10 gives 70.'
   WHERE "Id" = 187
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'ثمن القلم 10 وحدات. كم ثمن 7 أقلام؟'
     AND "QuestionTextEn" = 'Each pen costs 10 units. What do 7 pens cost?'
     AND "DetailedSolutionAr" = 'الثمن=7×10=70.'
     AND "DetailedSolutionEn" = 'Cost=7×10=70.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 187 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 187
            AND o."Id" = 738
            AND o."IsCorrect" AND o."LatexCode" = '70'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 187: stale source/answer; rollback entire batch'; END IF;

  -- Problem 197; correct answer 192
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: توزيع الضرب على العشرات والآحاد. نفكك 24 = 20 + 4، فنحسب 24 × 8 = 20 × 8 + 4 × 8 = 160 + 32 = 192. إذن الناتج 192.',
         "DetailedSolutionEn" = 'Rule used: Distribute multiplication over tens and ones. Split 24 into 20 + 4: 24 × 8 = (20 × 8) + (4 × 8) = 160 + 32 = 192. Answer: 192.'
   WHERE "Id" = 197
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 24 × 8.'
     AND "QuestionTextEn" = 'Compute 24 × 8.'
     AND "DetailedSolutionAr" = 'بضرب العددين: 24×8=192.'
     AND "DetailedSolutionEn" = 'Multiply: 24×8=192.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 197 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 197
            AND o."Id" = 779
            AND o."IsCorrect" AND o."LatexCode" = '192'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 197: stale source/answer; rollback entire batch'; END IF;

  -- Problem 198; correct answer 20
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: القسمة عكس الضرب. نبحث عن عدد إذا ضربناه في 7 أعطى 140. نلاحظ أن 7 × 2 = 14، وبالتالي 7 × 20 = 140. إذن 140 ÷ 7 = 20.',
         "DetailedSolutionEn" = 'Rule used: Division is the inverse of multiplication. Find the number that multiplied by 7 gives 140. Since 7 × 2 = 14, it follows that 7 × 20 = 140. Therefore 140 ÷ 7 = 20.'
   WHERE "Id" = 198
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'احسب 140 ÷ 7.'
     AND "QuestionTextEn" = 'Calculate 140 divided by 7.'
     AND "DetailedSolutionAr" = 'لأن 7×20=140، الناتج 20.'
     AND "DetailedSolutionEn" = 'Since 7×20=140, the quotient is 20.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 198 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 198
            AND o."Id" = 782
            AND o."IsCorrect" AND o."LatexCode" = '20'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 198: stale source/answer; rollback entire batch'; END IF;

  -- Problem 199; correct answer 88
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: السعر الكلي = ثمن القلم الواحد × عدد الأقلام. في المسألة 8 أقلام، وسعر الواحد 11 وحدة. بالتعويض: 8 × 11 = 8 × (10 + 1) = 80 + 8 = 88 وحدة نقدية.',
         "DetailedSolutionEn" = 'Rule used: Total cost = price per pen × number of pens. With 8 pens at 11 units each: 8 × 11 = 8 × (10 + 1) = 80 + 8 = 88 units.'
   WHERE "Id" = 199
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'ثمن القلم 11 وحدات. كم ثمن 8 أقلام؟'
     AND "QuestionTextEn" = 'Each pen costs 11 units. What do 8 pens cost?'
     AND "DetailedSolutionAr" = 'الثمن=8×11=88.'
     AND "DetailedSolutionEn" = 'Cost=8×11=88.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 199 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 199
            AND o."Id" = 785
            AND o."IsCorrect" AND o."LatexCode" = '88'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 199: stale source/answer; rollback entire batch'; END IF;

  -- Problem 851; correct answer 13
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'القانون المستخدم: القسمة مع الباقي؛ العدد الكلي = (عدد الطلاب × نصيب الواحد) + الباقي، والباقي أصغر من المقسوم عليه. نحسب 96 ÷ 7: ‏7 × 13 = 91 و96 − 91 = 5. إذن يحصل كل طالب على 13 قلماً ويبقى 5 أقلام، و5 < 7.',
         "DetailedSolutionEn" = 'Rule used: Division with remainder: total = divisor × quotient + remainder, where the remainder is less than the divisor. Since 7 × 13 = 91 and 96 − 91 = 5, each of 7 pupils gets 13 pencils, with 5 left. Check: 5 < 7.'
   WHERE "Id" = 851
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'يريد معلّم توزيع 96 قلماً بالتساوي على 7 طلاب. كم قلماً يأخذ كل طالب وكم قلماً يبقى؟'
     AND "QuestionTextEn" = 'A teacher shares 96 pencils equally among 7 students. How many pencils does each student receive, and how many are left?'
     AND "DetailedSolutionAr" = '96 = 7 × 13 + 5؛ إذن نصيب كل طالب 13 قلماً ويبقى 5 أقلام.'
     AND "DetailedSolutionEn" = '96 = 7 × 13 + 5. Each pupil gets 13 pencils, with 5 left over.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 851 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 851
            AND o."Id" = 3398
            AND o."IsCorrect" AND o."LatexCode" = '\text{13 each, 5 left}'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 851: stale source/answer; rollback entire batch'; END IF;

  -- Problem 852; correct answer 4
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: عدد الحافلات يجب أن يكون عدداً صحيحاً يكفي جميع الطلاب، فنقرّب ناتج القسمة للأعلى عند وجود باقٍ. ثلاث حافلات تستوعب 3 × 38 = 114 طالباً، وهذا أقل من 145. أربع حافلات تستوعب 4 × 38 = 152، لذا الحد الأدنى 4 حافلات.',
         "DetailedSolutionEn" = 'Rule used: For a capacity requirement, round the division result up if any pupils remain. Three buses carry 3 × 38 = 114, fewer than 145. Four buses carry 4 × 38 = 152, enough for everyone. Minimum: 4 buses.'
   WHERE "Id" = 852
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'يريد 145 طالباً الذهاب في رحلة، وتستوعب الحافلة الواحدة 38 طالباً. كم حافلة نحتاج على الأقل؟'
     AND "QuestionTextEn" = '145 pupils need transport. Each bus can hold 38. What is the minimum number of buses required?'
     AND "DetailedSolutionAr" = 'ثلاث حافلات تستوعب 114 طالباً فقط، وأربع حافلات تستوعب 152؛ لذلك نحتاج 4.'
     AND "DetailedSolutionEn" = 'Three buses carry only 114 pupils; four carry 152. Therefore four buses are needed.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 852 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 852
            AND o."Id" = 3402
            AND o."IsCorrect" AND o."LatexCode" = '4'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 852: stale source/answer; rollback entire batch'; END IF;

  -- Problem 853; correct answer 181
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: نحسب مجموع الأقلام بالضرب ثم نطرح الموزع. العدد الأصلي = عدد العلب × الأقلام في العلبة = 18 × 12 = 216 قلماً. بعد توزيع 35 قلماً، الباقي = 216 − 35 = 181 قلماً. التحقق: 181 + 35 = 216.',
         "DetailedSolutionEn" = 'Rule used: Multiply to find the starting total, then subtract the distributed pencils. There are 18 × 12 = 216 pencils. After giving out 35, 216 − 35 = 181 pencils remain. Check: 181 + 35 = 216.'
   WHERE "Id" = 853
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'اشترت مدرسة 18 علبة أقلام في كل علبة 12 قلماً، ثم وزّعت 35 قلماً. كم قلماً بقي؟'
     AND "QuestionTextEn" = 'A school bought 18 boxes of pencils with 12 pencils each, then distributed 35 pencils. How many remain?'
     AND "DetailedSolutionAr" = 'العدد قبل التوزيع 18×12=216، والباقي 216−35=181.'
     AND "DetailedSolutionEn" = 'Initially there are 18×12=216 pencils. After distributing 35, 181 remain.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 853 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 853
            AND o."Id" = 3406
            AND o."IsCorrect" AND o."LatexCode" = '181'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 853: stale source/answer; rollback entire batch'; END IF;

  -- Problem 854; correct answer 1200
  UPDATE public."Problems"
     SET "DetailedSolutionAr" = 'المبدأ المستخدم: نستبدل 25 بالقيمة المكافئة 100 ÷ 4 لتسهيل الضرب. 48 × 25 = 48 × (100 ÷ 4) = (48 × 100) ÷ 4 = 4800 ÷ 4 = 1200. ويمكن التحقق: 1200 ÷ 25 = 48.',
         "DetailedSolutionEn" = 'Rule used: Replace 25 with its equivalent value 100 ÷ 4 to simplify the calculation. 48 × 25 = 48 × (100 ÷ 4) = (48 × 100) ÷ 4 = 4800 ÷ 4 = 1200. Check: 1200 ÷ 25 = 48.'
   WHERE "Id" = 854
     AND "StageId" = 1 AND "CategoryId" = 33
     AND "QuestionTextAr" = 'استخدم حقيقة أن 25 = 100÷4 لحساب 48 × 25.'
     AND "QuestionTextEn" = 'Use 25 = 100÷4 to calculate 48 × 25.'
     AND "DetailedSolutionAr" = '48 × 25 = 48 × 100 ÷ 4 = 4800 ÷ 4 = 1200.'
     AND "DetailedSolutionEn" = 'Rewrite 48×25 = 48×100/4 = 4800/4 = 1200.'
     AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId" = 854 AND o."IsCorrect") = 1
     AND EXISTS (
         SELECT 1 FROM public."QuestionOptions" o
          WHERE o."ProblemId" = 854
            AND o."Id" = 3411
            AND o."IsCorrect" AND o."LatexCode" = '1200'
     );
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Category 33 problem 854: stale source/answer; rollback entire batch'; END IF;

END $mw_cat33$;
COMMIT;
