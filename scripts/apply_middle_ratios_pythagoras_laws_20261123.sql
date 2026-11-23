-- MathWorld: 39 independently reviewed middle-stage ratio/Pythagoras explanations.
-- Use once. All-or-nothing exact-source and immutable answer-key transaction.
-- Only DetailedSolutionAr and DetailedSolutionEn are changed.
BEGIN;
DO $mw_middle_ratio_triangle$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: عند ثبات سعر الوحدة، الثمن الكلي = عدد الدفاتر × سعر الدفتر الواحد. إذا كان ثمن 3 دفاتر 12 وحدة، فسعر الواحد = 12 ÷ 3 = 4 وحدات. بالتعويض في طلب 5 دفاتر: 5 × 4 = 20 وحدة.', "DetailedSolutionEn"='Rule used: With a constant unit rate, total cost = number of notebooks × price per notebook. Three notebooks cost 12 units, so one costs 12 ÷ 3 = 4. For five notebooks, total cost = 5 × 4 = 20 units.'
 WHERE "Id"=75 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا كان ثمن 3 دفاتر 12، فما ثمن 5 دفاتر بالسعر نفسه؟' AND "QuestionTextEn"='If three notebooks cost 12, how much do five cost at the same price per notebook?'
 AND "DetailedSolutionAr"='ثمن الواحد 12÷3=4، إذن ثمن خمسة 20.' AND "DetailedSolutionEn"='One notebook costs 12/3=4, so five cost 20.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=75 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=75 AND o."Id"=290
 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 75 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: عند ثبات سعر الوحدة، الثمن الكلي = عدد الدفاتر × سعر الدفتر الواحد. إذا كان ثمن 3 دفاتر 15 وحدة، فسعر الواحد = 15 ÷ 3 = 5 وحدات. بالتعويض في طلب 5 دفاتر: 5 × 5 = 25 وحدة.', "DetailedSolutionEn"='Rule used: With a constant unit rate, total cost = number of notebooks × price per notebook. Three notebooks cost 15 units, so one costs 15 ÷ 3 = 5. For five notebooks, total cost = 5 × 5 = 25 units.'
 WHERE "Id"=90 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا كان ثمن 3 دفاتر 15، فما ثمن 5 دفاتر بالسعر نفسه؟' AND "QuestionTextEn"='If three notebooks cost 15, how much do five cost at the same price per notebook?'
 AND "DetailedSolutionAr"='ثمن الواحد 15÷3=5، إذن ثمن خمسة 25.' AND "DetailedSolutionEn"='One notebook costs 15/3=5, so five cost 25.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=90 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=90 AND o."Id"=349
 AND o."IsCorrect" AND o."LatexCode"='25');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 90 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: عند ثبات سعر الوحدة، الثمن الكلي = عدد الدفاتر × سعر الدفتر الواحد. إذا كان ثمن 3 دفاتر 18 وحدة، فسعر الواحد = 18 ÷ 3 = 6 وحدات. بالتعويض في طلب 5 دفاتر: 5 × 6 = 30 وحدة.', "DetailedSolutionEn"='Rule used: With a constant unit rate, total cost = number of notebooks × price per notebook. Three notebooks cost 18 units, so one costs 18 ÷ 3 = 6. For five notebooks, total cost = 5 × 6 = 30 units.'
 WHERE "Id"=105 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا كان ثمن 3 دفاتر 18، فما ثمن 5 دفاتر بالسعر نفسه؟' AND "QuestionTextEn"='If three notebooks cost 18, how much do five cost at the same price per notebook?'
 AND "DetailedSolutionAr"='ثمن الواحد 18÷3=6، إذن ثمن خمسة 30.' AND "DetailedSolutionEn"='One notebook costs 18/3=6, so five cost 30.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=105 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=105 AND o."Id"=412
 AND o."IsCorrect" AND o."LatexCode"='30');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 105 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: عند ثبات سعر الوحدة، الثمن الكلي = عدد الدفاتر × سعر الدفتر الواحد. إذا كان ثمن 3 دفاتر 21 وحدة، فسعر الواحد = 21 ÷ 3 = 7 وحدات. بالتعويض في طلب 5 دفاتر: 5 × 7 = 35 وحدة.', "DetailedSolutionEn"='Rule used: With a constant unit rate, total cost = number of notebooks × price per notebook. Three notebooks cost 21 units, so one costs 21 ÷ 3 = 7. For five notebooks, total cost = 5 × 7 = 35 units.'
 WHERE "Id"=120 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا كان ثمن 3 دفاتر 21، فما ثمن 5 دفاتر بالسعر نفسه؟' AND "QuestionTextEn"='If three notebooks cost 21, how much do five cost at the same price per notebook?'
 AND "DetailedSolutionAr"='ثمن الواحد 21÷3=7، إذن ثمن خمسة 35.' AND "DetailedSolutionEn"='One notebook costs 21/3=7, so five cost 35.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=120 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=120 AND o."Id"=471
 AND o."IsCorrect" AND o."LatexCode"='35');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 120 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: عند ثبات سعر الوحدة، الثمن الكلي = عدد الدفاتر × سعر الدفتر الواحد. إذا كان ثمن 3 دفاتر 24 وحدة، فسعر الواحد = 24 ÷ 3 = 8 وحدات. بالتعويض في طلب 5 دفاتر: 5 × 8 = 40 وحدة.', "DetailedSolutionEn"='Rule used: With a constant unit rate, total cost = number of notebooks × price per notebook. Three notebooks cost 24 units, so one costs 24 ÷ 3 = 8. For five notebooks, total cost = 5 × 8 = 40 units.'
 WHERE "Id"=135 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا كان ثمن 3 دفاتر 24، فما ثمن 5 دفاتر بالسعر نفسه؟' AND "QuestionTextEn"='If three notebooks cost 24, how much do five cost at the same price per notebook?'
 AND "DetailedSolutionAr"='ثمن الواحد 24÷3=8، إذن ثمن خمسة 40.' AND "DetailedSolutionEn"='One notebook costs 24/3=8, so five cost 40.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=135 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=135 AND o."Id"=530
 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 135 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبلغ الخصم = السعر الأصلي × نسبة الخصم المئوية ÷ 100. السعر 100 وحدة والنسبة 10%، لذا الخصم = 100 × 10 ÷ 100 = 10 وحدة. السؤال يطلب قيمة الخصم فقط، وليس السعر بعد الخصم.', "DetailedSolutionEn"='Rule used: Discount amount = original price × discount percentage ÷ 100. Given 100 units and 10%, substitute: discount = 100 × 10 ÷ 100 = 10 units. The question asks for the discount amount, not the final sale price.'
 WHERE "Id"=215 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='خصم متجر 10% من ثمن 100، ما قيمة الخصم؟' AND "QuestionTextEn"='A store discounts 10% from a price of 100. Find the discount amount.'
 AND "DetailedSolutionAr"='الخصم=100×10/100=10.' AND "DetailedSolutionEn"='Discount=100×10/100=10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=215 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=215 AND o."Id"=849
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 215 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المسافة الحقيقية = المسافة على الخريطة × قيمة مقياس الرسم لكل سنتيمتر. كل 1 سم يمثل 2 كم، والمسافة المرسومة 3 سم. بالتعويض: 3 × 2 = 6 كيلومتراً.', "DetailedSolutionEn"='Rule used: Actual distance = map distance × real distance represented by one centimetre. Each map centimetre means 2 km, and the measured map distance is 3 cm. Hence 3 × 2 = 6 km.'
 WHERE "Id"=216 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='مقياس خريطة: 1 سم يمثل 2 كم. كم يمثل 3 سم؟' AND "QuestionTextEn"='Map scale: 1 cm represents 2 km. What distance is 3 cm?'
 AND "DetailedSolutionAr"='المسافة الحقيقية=2×3=6 كم.' AND "DetailedSolutionEn"='Actual distance=2×3=6 km.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=216 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=216 AND o."Id"=856
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 216 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: القيمة الجديدة بعد زيادة نسبتها 25% = القيمة الأصلية + (القيمة الأصلية × 25 ÷ 100). في هذه المسألة الأصل 40؛ مقدار الزيادة = 40 × 25 ÷ 100 = 10. إذن القيمة الجديدة = 40 + 10 = 50.', "DetailedSolutionEn"='Rule used: New value after a 25% increase = original value + original × 25/100. Starting at 40, compute the increase 40 × 25/100 = 10. Add it to the original: 40 + 10 = 50.'
 WHERE "Id"=217 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا ارتفع سعر 40 بنسبة 25%، فما السعر الجديد؟' AND "QuestionTextEn"='If 40 increases by 25%, what is the new price?'
 AND "DetailedSolutionAr"='الزيادة=10، فالجديد=40+10=50.' AND "DetailedSolutionEn"='Increase=10, so new price=40+10=50.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=217 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=217 AND o."Id"=859
 AND o."IsCorrect" AND o."LatexCode"='50');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 217 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبلغ الخصم = السعر الأصلي × نسبة الخصم المئوية ÷ 100. السعر 120 وحدة والنسبة 20%، لذا الخصم = 120 × 20 ÷ 100 = 24 وحدة. السؤال يطلب قيمة الخصم فقط، وليس السعر بعد الخصم.', "DetailedSolutionEn"='Rule used: Discount amount = original price × discount percentage ÷ 100. Given 120 units and 20%, substitute: discount = 120 × 20 ÷ 100 = 24 units. The question asks for the discount amount, not the final sale price.'
 WHERE "Id"=227 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='خصم متجر 20% من ثمن 120، ما قيمة الخصم؟' AND "QuestionTextEn"='A store discounts 20% from a price of 120. Find the discount amount.'
 AND "DetailedSolutionAr"='الخصم=120×20/100=24.' AND "DetailedSolutionEn"='Discount=120×20/100=24.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=227 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=227 AND o."Id"=900
 AND o."IsCorrect" AND o."LatexCode"='24');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 227 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المسافة الحقيقية = المسافة على الخريطة × قيمة مقياس الرسم لكل سنتيمتر. كل 1 سم يمثل 3 كم، والمسافة المرسومة 4 سم. بالتعويض: 4 × 3 = 12 كيلومتراً.', "DetailedSolutionEn"='Rule used: Actual distance = map distance × real distance represented by one centimetre. Each map centimetre means 3 km, and the measured map distance is 4 cm. Hence 4 × 3 = 12 km.'
 WHERE "Id"=228 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='مقياس خريطة: 1 سم يمثل 3 كم. كم يمثل 4 سم؟' AND "QuestionTextEn"='Map scale: 1 cm represents 3 km. What distance is 4 cm?'
 AND "DetailedSolutionAr"='المسافة الحقيقية=3×4=12 كم.' AND "DetailedSolutionEn"='Actual distance=3×4=12 km.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=228 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=228 AND o."Id"=903
 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 228 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: القيمة الجديدة بعد زيادة نسبتها 25% = القيمة الأصلية + (القيمة الأصلية × 25 ÷ 100). في هذه المسألة الأصل 60؛ مقدار الزيادة = 60 × 25 ÷ 100 = 15. إذن القيمة الجديدة = 60 + 15 = 75.', "DetailedSolutionEn"='Rule used: New value after a 25% increase = original value + original × 25/100. Starting at 60, compute the increase 60 × 25/100 = 15. Add it to the original: 60 + 15 = 75.'
 WHERE "Id"=229 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا ارتفع سعر 60 بنسبة 25%، فما السعر الجديد؟' AND "QuestionTextEn"='If 60 increases by 25%, what is the new price?'
 AND "DetailedSolutionAr"='الزيادة=15، فالجديد=60+15=75.' AND "DetailedSolutionEn"='Increase=15, so new price=60+15=75.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=229 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=229 AND o."Id"=906
 AND o."IsCorrect" AND o."LatexCode"='75');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 229 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبلغ الخصم = السعر الأصلي × نسبة الخصم المئوية ÷ 100. السعر 140 وحدة والنسبة 25%، لذا الخصم = 140 × 25 ÷ 100 = 35 وحدة. السؤال يطلب قيمة الخصم فقط، وليس السعر بعد الخصم.', "DetailedSolutionEn"='Rule used: Discount amount = original price × discount percentage ÷ 100. Given 140 units and 25%, substitute: discount = 140 × 25 ÷ 100 = 35 units. The question asks for the discount amount, not the final sale price.'
 WHERE "Id"=239 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='خصم متجر 25% من ثمن 140، ما قيمة الخصم؟' AND "QuestionTextEn"='A store discounts 25% from a price of 140. Find the discount amount.'
 AND "DetailedSolutionAr"='الخصم=140×25/100=35.' AND "DetailedSolutionEn"='Discount=140×25/100=35.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=239 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=239 AND o."Id"=947
 AND o."IsCorrect" AND o."LatexCode"='35');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 239 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المسافة الحقيقية = المسافة على الخريطة × قيمة مقياس الرسم لكل سنتيمتر. كل 1 سم يمثل 4 كم، والمسافة المرسومة 5 سم. بالتعويض: 5 × 4 = 20 كيلومتراً.', "DetailedSolutionEn"='Rule used: Actual distance = map distance × real distance represented by one centimetre. Each map centimetre means 4 km, and the measured map distance is 5 cm. Hence 5 × 4 = 20 km.'
 WHERE "Id"=240 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='مقياس خريطة: 1 سم يمثل 4 كم. كم يمثل 5 سم؟' AND "QuestionTextEn"='Map scale: 1 cm represents 4 km. What distance is 5 cm?'
 AND "DetailedSolutionAr"='المسافة الحقيقية=4×5=20 كم.' AND "DetailedSolutionEn"='Actual distance=4×5=20 km.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=240 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=240 AND o."Id"=950
 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 240 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: القيمة الجديدة بعد زيادة نسبتها 25% = القيمة الأصلية + (القيمة الأصلية × 25 ÷ 100). في هذه المسألة الأصل 80؛ مقدار الزيادة = 80 × 25 ÷ 100 = 20. إذن القيمة الجديدة = 80 + 20 = 100.', "DetailedSolutionEn"='Rule used: New value after a 25% increase = original value + original × 25/100. Starting at 80, compute the increase 80 × 25/100 = 20. Add it to the original: 80 + 20 = 100.'
 WHERE "Id"=241 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا ارتفع سعر 80 بنسبة 25%، فما السعر الجديد؟' AND "QuestionTextEn"='If 80 increases by 25%, what is the new price?'
 AND "DetailedSolutionAr"='الزيادة=20، فالجديد=80+20=100.' AND "DetailedSolutionEn"='Increase=20, so new price=80+20=100.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=241 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=241 AND o."Id"=953
 AND o."IsCorrect" AND o."LatexCode"='100');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 241 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبلغ الخصم = السعر الأصلي × نسبة الخصم المئوية ÷ 100. السعر 160 وحدة والنسبة 40%، لذا الخصم = 160 × 40 ÷ 100 = 64 وحدة. السؤال يطلب قيمة الخصم فقط، وليس السعر بعد الخصم.', "DetailedSolutionEn"='Rule used: Discount amount = original price × discount percentage ÷ 100. Given 160 units and 40%, substitute: discount = 160 × 40 ÷ 100 = 64 units. The question asks for the discount amount, not the final sale price.'
 WHERE "Id"=251 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='خصم متجر 40% من ثمن 160، ما قيمة الخصم؟' AND "QuestionTextEn"='A store discounts 40% from a price of 160. Find the discount amount.'
 AND "DetailedSolutionAr"='الخصم=160×40/100=64.' AND "DetailedSolutionEn"='Discount=160×40/100=64.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=251 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=251 AND o."Id"=994
 AND o."IsCorrect" AND o."LatexCode"='64');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 251 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المسافة الحقيقية = المسافة على الخريطة × قيمة مقياس الرسم لكل سنتيمتر. كل 1 سم يمثل 5 كم، والمسافة المرسومة 6 سم. بالتعويض: 6 × 5 = 30 كيلومتراً.', "DetailedSolutionEn"='Rule used: Actual distance = map distance × real distance represented by one centimetre. Each map centimetre means 5 km, and the measured map distance is 6 cm. Hence 6 × 5 = 30 km.'
 WHERE "Id"=252 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='مقياس خريطة: 1 سم يمثل 5 كم. كم يمثل 6 سم؟' AND "QuestionTextEn"='Map scale: 1 cm represents 5 km. What distance is 6 cm?'
 AND "DetailedSolutionAr"='المسافة الحقيقية=5×6=30 كم.' AND "DetailedSolutionEn"='Actual distance=5×6=30 km.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=252 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=252 AND o."Id"=997
 AND o."IsCorrect" AND o."LatexCode"='30');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 252 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: القيمة الجديدة بعد زيادة نسبتها 25% = القيمة الأصلية + (القيمة الأصلية × 25 ÷ 100). في هذه المسألة الأصل 100؛ مقدار الزيادة = 100 × 25 ÷ 100 = 25. إذن القيمة الجديدة = 100 + 25 = 125.', "DetailedSolutionEn"='Rule used: New value after a 25% increase = original value + original × 25/100. Starting at 100, compute the increase 100 × 25/100 = 25. Add it to the original: 100 + 25 = 125.'
 WHERE "Id"=253 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا ارتفع سعر 100 بنسبة 25%، فما السعر الجديد؟' AND "QuestionTextEn"='If 100 increases by 25%, what is the new price?'
 AND "DetailedSolutionAr"='الزيادة=25، فالجديد=100+25=125.' AND "DetailedSolutionEn"='Increase=25, so new price=100+25=125.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=253 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=253 AND o."Id"=1004
 AND o."IsCorrect" AND o."LatexCode"='125');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 253 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبلغ الخصم = السعر الأصلي × نسبة الخصم المئوية ÷ 100. السعر 180 وحدة والنسبة 50%، لذا الخصم = 180 × 50 ÷ 100 = 90 وحدة. السؤال يطلب قيمة الخصم فقط، وليس السعر بعد الخصم.', "DetailedSolutionEn"='Rule used: Discount amount = original price × discount percentage ÷ 100. Given 180 units and 50%, substitute: discount = 180 × 50 ÷ 100 = 90 units. The question asks for the discount amount, not the final sale price.'
 WHERE "Id"=263 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='خصم متجر 50% من ثمن 180، ما قيمة الخصم؟' AND "QuestionTextEn"='A store discounts 50% from a price of 180. Find the discount amount.'
 AND "DetailedSolutionAr"='الخصم=180×50/100=90.' AND "DetailedSolutionEn"='Discount=180×50/100=90.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=263 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=263 AND o."Id"=1041
 AND o."IsCorrect" AND o."LatexCode"='90');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 263 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المسافة الحقيقية = المسافة على الخريطة × قيمة مقياس الرسم لكل سنتيمتر. كل 1 سم يمثل 6 كم، والمسافة المرسومة 7 سم. بالتعويض: 7 × 6 = 42 كيلومتراً.', "DetailedSolutionEn"='Rule used: Actual distance = map distance × real distance represented by one centimetre. Each map centimetre means 6 km, and the measured map distance is 7 cm. Hence 7 × 6 = 42 km.'
 WHERE "Id"=264 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='مقياس خريطة: 1 سم يمثل 6 كم. كم يمثل 7 سم؟' AND "QuestionTextEn"='Map scale: 1 cm represents 6 km. What distance is 7 cm?'
 AND "DetailedSolutionAr"='المسافة الحقيقية=6×7=42 كم.' AND "DetailedSolutionEn"='Actual distance=6×7=42 km.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=264 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=264 AND o."Id"=1048
 AND o."IsCorrect" AND o."LatexCode"='42');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 264 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: القيمة الجديدة بعد زيادة نسبتها 25% = القيمة الأصلية + (القيمة الأصلية × 25 ÷ 100). في هذه المسألة الأصل 120؛ مقدار الزيادة = 120 × 25 ÷ 100 = 30. إذن القيمة الجديدة = 120 + 30 = 150.', "DetailedSolutionEn"='Rule used: New value after a 25% increase = original value + original × 25/100. Starting at 120, compute the increase 120 × 25/100 = 30. Add it to the original: 120 + 30 = 150.'
 WHERE "Id"=265 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='إذا ارتفع سعر 120 بنسبة 25%، فما السعر الجديد؟' AND "QuestionTextEn"='If 120 increases by 25%, what is the new price?'
 AND "DetailedSolutionAr"='الزيادة=30، فالجديد=120+30=150.' AND "DetailedSolutionEn"='Increase=30, so new price=120+30=150.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=265 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=265 AND o."Id"=1051
 AND o."IsCorrect" AND o."LatexCode"='150');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 265 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: عند معرفة العدد الكلي ونسبة مجموعتين، نجمع أجزاء النسبة ثم نحسب قيمة الجزء. نسبة الأزرق إلى الأخضر 2 : 7، ومجموع الأجزاء 2 + 7 = 9. الكرات 45، فقيمة الجزء = 45 ÷ 9 = 5؛ الزرقاء = 2 × 5 = 10 كرات. التحقق: الخضراء 7 × 5 = 35 والمجموع 45.', "DetailedSolutionEn"='Rule used: To divide a known total in a ratio, sum the ratio parts and find the value of one part. For blue:green = 2:7, total parts = 2 + 7 = 9; one part = 45 ÷ 9 = 5. Blue = 2 × 5 = 10 balls. Check: green = 7 × 5 = 35 and total = 45.'
 WHERE "Id"=629 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='نسبة الكرات الزرقاء إلى الخضراء 2 : 7، ومجموع الكرات 45. كم كرة زرقاء؟' AND "QuestionTextEn"='Blue to green balls are in the ratio 2 : 7, with 45 balls total. How many are blue?'
 AND "DetailedSolutionAr"='عدد الأجزاء = 2 + 7 = 9، وقيمة الجزء 45 ÷ 9 = 5؛ الزرقاء = 2 × 5 = 10.' AND "DetailedSolutionEn"='Total ratio parts: 2 + 7 = 9; each part is 45 ÷ 9 = 5. Blue balls: 2 × 5 = 10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=629 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=629 AND o."Id"=2506
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 629 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: النسبة 5 : 3 تمثل خمسة أجزاء للكتب العربية وثلاثة للإنجليزية. إذا كانت الكتب العربية 35، فقيمة الجزء = 35 ÷ 5 = 7 كتب. إذن الكتب الإنجليزية = 3 × 7 = 21 كتاباً. لا نقسم 35 على مجموع الأجزاء لأن 35 يمثل فئة واحدة لا المجموع.', "DetailedSolutionEn"='Rule used: A 5:3 Arabic-to-English book ratio gives 5 parts for Arabic and 3 for English. Since the five Arabic parts total 35, one part is 35 ÷ 5 = 7 books. English books = 3 × 7 = 21. The 35 books are not the whole collection.'
 WHERE "Id"=630 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='نسبة عدد الكتب العربية إلى الإنكليزية 5 : 3، وإذا كان عدد العربية 35، فكم كتاباً إنكليزياً؟' AND "QuestionTextEn"='Arabic to English books have ratio 5 : 3. If there are 35 Arabic books, how many English books are there?'
 AND "DetailedSolutionAr"='خمسة أجزاء = 35، إذن الجزء 7، وثلاثة أجزاء = 3 × 7 = 21.' AND "DetailedSolutionEn"='Five parts equal 35, so each part is 7. Three parts give 21 English books.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=630 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=630 AND o."Id"=2510
 AND o."IsCorrect" AND o."LatexCode"='21');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 630 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في النسبة أصفر : أزرق = 4 : 9، تمثل 9 أجزاء الأقلام الزرقاء وعددها 36. إذن قيمة الجزء = 36 ÷ 9 = 4 أقلام. عدد الأقلام الصفراء = 4 أجزاء × 4 = 16 قلماً. التحقق: 16 : 36 تبسط بقسمة الطرفين على 4 إلى 4 : 9.', "DetailedSolutionEn"='Rule used: In yellow:blue = 4:9, the 9 blue parts represent 36 pencils. One part = 36 ÷ 9 = 4 pencils. Yellow pencils = 4 parts × 4 = 16. Check: 16:36 simplifies to 4:9.'
 WHERE "Id"=631 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='نسبة أقلام التلوين الصفراء إلى الزرقاء 4 : 9. إذا كان عدد الزرقاء 36، فما عدد الصفراء؟' AND "QuestionTextEn"='Yellow to blue coloring pencils have a 4 : 9 ratio. If there are 36 blue pencils, how many yellow?'
 AND "DetailedSolutionAr"='تسعة أجزاء = 36، فالجزء 4، والأصفر 4 أجزاء = 16.' AND "DetailedSolutionEn"='Nine parts total 36, so one part is 4; the four yellow parts total 16.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=631 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=631 AND o."Id"=2515
 AND o."IsCorrect" AND o."LatexCode"='16');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 631 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: النسب المتناسبة تتغير بضرب طرفي النسبة في العامل نفسه. الوصفة تحتاج 3 أكواب أرز مقابل 5 أكواب ماء. للحصول على 12 كوب أرز، عامل التكبير = 12 ÷ 3 = 4. إذن الماء = 5 × 4 = 20 كوباً، ونسبة 12 : 20 تساوي 3 : 5.', "DetailedSolutionEn"='Rule used: Equivalent ratios multiply both parts by the same scale factor. A recipe needs rice:water = 3:5. To reach 12 cups of rice, multiply by 12 ÷ 3 = 4. Water needed = 5 × 4 = 20 cups. Check: 12:20 simplifies to 3:5.'
 WHERE "Id"=632 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='تحتاج وصفة إلى 3 أكواب من الأرز لكل 5 أكواب ماء. كم كوب ماء نحتاج عند استخدام 12 كوب أرز؟' AND "QuestionTextEn"='A recipe uses 3 cups of rice for every 5 cups of water. How many cups of water are needed for 12 cups of rice?'
 AND "DetailedSolutionAr"='نضرب الأرز في 4 (3 إلى 12)، لذا نضرب الماء في 4: 5 × 4 = 20 كوباً.' AND "DetailedSolutionEn"='Rice is scaled by 4 (3 to 12), so water must also be multiplied by 4: 5 × 4 = 20 cups.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=632 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=632 AND o."Id"=2519
 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 632 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: نظرية فيثاغورس للمثلث القائم: مربع الوتر = مربع الضلع القائم الأول + مربع الثاني. الضلعان 3 و4؛ بالتعويض: ج² = 3² + 4² = 9 + 16 = 25. نأخذ الجذر التربيعي الموجب: ج = √25 = 5.', "DetailedSolutionEn"='Rule used: Pythagorean theorem for a right triangle: hypotenuse² = leg₁² + leg₂². Given legs 3 and 4, c² = 3² + 4² = 9 + 16 = 25. The hypotenuse is positive, so c = √25 = 5.'
 WHERE "Id"=76 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلث قائم ضلعا قائمته 3 و4. أوجد الوتر.' AND "QuestionTextEn"='A right triangle has legs 3 and 4. Find the hypotenuse.'
 AND "DetailedSolutionAr"='بتطبيق نظرية فيثاغورس: √(3²+4²)=5.' AND "DetailedSolutionEn"='Using Pythagoras: √(3²+4²)=5.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=76 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=76 AND o."Id"=293
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 76 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: نظرية فيثاغورس للمثلث القائم: مربع الوتر = مربع الضلع القائم الأول + مربع الثاني. الضلعان 6 و8؛ بالتعويض: ج² = 6² + 8² = 36 + 64 = 100. نأخذ الجذر التربيعي الموجب: ج = √100 = 10.', "DetailedSolutionEn"='Rule used: Pythagorean theorem for a right triangle: hypotenuse² = leg₁² + leg₂². Given legs 6 and 8, c² = 6² + 8² = 36 + 64 = 100. The hypotenuse is positive, so c = √100 = 10.'
 WHERE "Id"=91 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلث قائم ضلعا قائمته 6 و8. أوجد الوتر.' AND "QuestionTextEn"='A right triangle has legs 6 and 8. Find the hypotenuse.'
 AND "DetailedSolutionAr"='بتطبيق نظرية فيثاغورس: √(6²+8²)=10.' AND "DetailedSolutionEn"='Using Pythagoras: √(6²+8²)=10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=91 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=91 AND o."Id"=356
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 91 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: نظرية فيثاغورس للمثلث القائم: مربع الوتر = مربع الضلع القائم الأول + مربع الثاني. الضلعان 9 و12؛ بالتعويض: ج² = 9² + 12² = 81 + 144 = 225. نأخذ الجذر التربيعي الموجب: ج = √225 = 15.', "DetailedSolutionEn"='Rule used: Pythagorean theorem for a right triangle: hypotenuse² = leg₁² + leg₂². Given legs 9 and 12, c² = 9² + 12² = 81 + 144 = 225. The hypotenuse is positive, so c = √225 = 15.'
 WHERE "Id"=106 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلث قائم ضلعا قائمته 9 و12. أوجد الوتر.' AND "QuestionTextEn"='A right triangle has legs 9 and 12. Find the hypotenuse.'
 AND "DetailedSolutionAr"='بتطبيق نظرية فيثاغورس: √(9²+12²)=15.' AND "DetailedSolutionEn"='Using Pythagoras: √(9²+12²)=15.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=106 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=106 AND o."Id"=415
 AND o."IsCorrect" AND o."LatexCode"='15');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 106 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: نظرية فيثاغورس للمثلث القائم: مربع الوتر = مربع الضلع القائم الأول + مربع الثاني. الضلعان 12 و16؛ بالتعويض: ج² = 12² + 16² = 144 + 256 = 400. نأخذ الجذر التربيعي الموجب: ج = √400 = 20.', "DetailedSolutionEn"='Rule used: Pythagorean theorem for a right triangle: hypotenuse² = leg₁² + leg₂². Given legs 12 and 16, c² = 12² + 16² = 144 + 256 = 400. The hypotenuse is positive, so c = √400 = 20.'
 WHERE "Id"=121 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلث قائم ضلعا قائمته 12 و16. أوجد الوتر.' AND "QuestionTextEn"='A right triangle has legs 12 and 16. Find the hypotenuse.'
 AND "DetailedSolutionAr"='بتطبيق نظرية فيثاغورس: √(12²+16²)=20.' AND "DetailedSolutionEn"='Using Pythagoras: √(12²+16²)=20.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=121 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=121 AND o."Id"=474
 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 121 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: نظرية فيثاغورس للمثلث القائم: مربع الوتر = مربع الضلع القائم الأول + مربع الثاني. الضلعان 15 و20؛ بالتعويض: ج² = 15² + 20² = 225 + 400 = 625. نأخذ الجذر التربيعي الموجب: ج = √625 = 25.', "DetailedSolutionEn"='Rule used: Pythagorean theorem for a right triangle: hypotenuse² = leg₁² + leg₂². Given legs 15 and 20, c² = 15² + 20² = 225 + 400 = 625. The hypotenuse is positive, so c = √625 = 25.'
 WHERE "Id"=136 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلث قائم ضلعا قائمته 15 و20. أوجد الوتر.' AND "QuestionTextEn"='A right triangle has legs 15 and 20. Find the hypotenuse.'
 AND "DetailedSolutionAr"='بتطبيق نظرية فيثاغورس: √(15²+20²)=25.' AND "DetailedSolutionEn"='Using Pythagoras: √(15²+20²)=25.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=136 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=136 AND o."Id"=533
 AND o."IsCorrect" AND o."LatexCode"='25');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 136 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: في المثلث القائم أ² + ب² = ج²، حيث ج هو الوتر الأطول. لإيجاد الضلع المجهول ب نعكس القانون: ب = √(ج² − أ²). الوتر 5 والضلع 3؛ بالتعويض: ب = √(25 − 9) = √16 = 4. نأخذ الجذر الموجب لأن الطول غير سالب.', "DetailedSolutionEn"='Rule used: In a right triangle a² + b² = c², where c is the hypotenuse. Rearrange to find the unknown leg: b = √(c² − a²). Given c = 5, a = 3, calculate b = √(25 − 9) = √16 = 4. Take the positive root since length is nonnegative.'
 WHERE "Id"=219 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='وتر مثلث قائم 5، وأحد ضلعيه 3. ما الضلع الثاني؟' AND "QuestionTextEn"='A right triangle has hypotenuse 5 and one leg 3. Find its other leg.'
 AND "DetailedSolutionAr"='بتطبيق فيثاغورس: √(5²−3²)=4.' AND "DetailedSolutionEn"='By Pythagoras, √(5²−3²)=4.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=219 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=219 AND o."Id"=867
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 219 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المثلثات المتشابهة تتناسب الأضلاع المتناظرة بعامل التشابه نفسه. إذا كان الضلع الأصلي 3 وعامل التكبير 2، فالضلع المناظر = 3 × 2 = 6. نضرب الأطوال في العامل، ولا نربعه إلا عند حساب المساحات.', "DetailedSolutionEn"='Rule used: Corresponding side lengths of similar triangles are multiplied by the linear scale factor. An original side of 3 with scale factor 2 gives corresponding side = 3 × 2 = 6. Square the scale factor for areas, not for side lengths.'
 WHERE "Id"=220 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلثان متشابهان. طول ضلع في الأول 3 ومعامل التكبير 2، ما طول الضلع المناظر؟' AND "QuestionTextEn"='Similar triangles: a side is 3 with scale factor 2. Find the corresponding side.'
 AND "DetailedSolutionAr"='الطول الجديد=3×2=6.' AND "DetailedSolutionEn"='New length=3×2=6.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=220 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=220 AND o."Id"=870
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 220 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: في المثلث القائم أ² + ب² = ج²، حيث ج هو الوتر الأطول. لإيجاد الضلع المجهول ب نعكس القانون: ب = √(ج² − أ²). الوتر 13 والضلع 5؛ بالتعويض: ب = √(169 − 25) = √144 = 12. نأخذ الجذر الموجب لأن الطول غير سالب.', "DetailedSolutionEn"='Rule used: In a right triangle a² + b² = c², where c is the hypotenuse. Rearrange to find the unknown leg: b = √(c² − a²). Given c = 13, a = 5, calculate b = √(169 − 25) = √144 = 12. Take the positive root since length is nonnegative.'
 WHERE "Id"=231 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='وتر مثلث قائم 13، وأحد ضلعيه 5. ما الضلع الثاني؟' AND "QuestionTextEn"='A right triangle has hypotenuse 13 and one leg 5. Find its other leg.'
 AND "DetailedSolutionAr"='بتطبيق فيثاغورس: √(13²−5²)=12.' AND "DetailedSolutionEn"='By Pythagoras, √(13²−5²)=12.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=231 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=231 AND o."Id"=914
 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 231 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المثلثات المتشابهة تتناسب الأضلاع المتناظرة بعامل التشابه نفسه. إذا كان الضلع الأصلي 4 وعامل التكبير 3، فالضلع المناظر = 4 × 3 = 12. نضرب الأطوال في العامل، ولا نربعه إلا عند حساب المساحات.', "DetailedSolutionEn"='Rule used: Corresponding side lengths of similar triangles are multiplied by the linear scale factor. An original side of 4 with scale factor 3 gives corresponding side = 4 × 3 = 12. Square the scale factor for areas, not for side lengths.'
 WHERE "Id"=232 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلثان متشابهان. طول ضلع في الأول 4 ومعامل التكبير 3، ما طول الضلع المناظر؟' AND "QuestionTextEn"='Similar triangles: a side is 4 with scale factor 3. Find the corresponding side.'
 AND "DetailedSolutionAr"='الطول الجديد=4×3=12.' AND "DetailedSolutionEn"='New length=4×3=12.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=232 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=232 AND o."Id"=917
 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 232 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: في المثلث القائم أ² + ب² = ج²، حيث ج هو الوتر الأطول. لإيجاد الضلع المجهول ب نعكس القانون: ب = √(ج² − أ²). الوتر 17 والضلع 8؛ بالتعويض: ب = √(289 − 64) = √225 = 15. نأخذ الجذر الموجب لأن الطول غير سالب.', "DetailedSolutionEn"='Rule used: In a right triangle a² + b² = c², where c is the hypotenuse. Rearrange to find the unknown leg: b = √(c² − a²). Given c = 17, a = 8, calculate b = √(289 − 64) = √225 = 15. Take the positive root since length is nonnegative.'
 WHERE "Id"=243 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='وتر مثلث قائم 17، وأحد ضلعيه 8. ما الضلع الثاني؟' AND "QuestionTextEn"='A right triangle has hypotenuse 17 and one leg 8. Find its other leg.'
 AND "DetailedSolutionAr"='بتطبيق فيثاغورس: √(17²−8²)=15.' AND "DetailedSolutionEn"='By Pythagoras, √(17²−8²)=15.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=243 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=243 AND o."Id"=961
 AND o."IsCorrect" AND o."LatexCode"='15');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 243 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المثلثات المتشابهة تتناسب الأضلاع المتناظرة بعامل التشابه نفسه. إذا كان الضلع الأصلي 5 وعامل التكبير 4، فالضلع المناظر = 5 × 4 = 20. نضرب الأطوال في العامل، ولا نربعه إلا عند حساب المساحات.', "DetailedSolutionEn"='Rule used: Corresponding side lengths of similar triangles are multiplied by the linear scale factor. An original side of 5 with scale factor 4 gives corresponding side = 5 × 4 = 20. Square the scale factor for areas, not for side lengths.'
 WHERE "Id"=244 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلثان متشابهان. طول ضلع في الأول 5 ومعامل التكبير 4، ما طول الضلع المناظر؟' AND "QuestionTextEn"='Similar triangles: a side is 5 with scale factor 4. Find the corresponding side.'
 AND "DetailedSolutionAr"='الطول الجديد=5×4=20.' AND "DetailedSolutionEn"='New length=5×4=20.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=244 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=244 AND o."Id"=968
 AND o."IsCorrect" AND o."LatexCode"='20');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 244 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: في المثلث القائم أ² + ب² = ج²، حيث ج هو الوتر الأطول. لإيجاد الضلع المجهول ب نعكس القانون: ب = √(ج² − أ²). الوتر 25 والضلع 7؛ بالتعويض: ب = √(625 − 49) = √576 = 24. نأخذ الجذر الموجب لأن الطول غير سالب.', "DetailedSolutionEn"='Rule used: In a right triangle a² + b² = c², where c is the hypotenuse. Rearrange to find the unknown leg: b = √(c² − a²). Given c = 25, a = 7, calculate b = √(625 − 49) = √576 = 24. Take the positive root since length is nonnegative.'
 WHERE "Id"=255 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='وتر مثلث قائم 25، وأحد ضلعيه 7. ما الضلع الثاني؟' AND "QuestionTextEn"='A right triangle has hypotenuse 25 and one leg 7. Find its other leg.'
 AND "DetailedSolutionAr"='بتطبيق فيثاغورس: √(25²−7²)=24.' AND "DetailedSolutionEn"='By Pythagoras, √(25²−7²)=24.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=255 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=255 AND o."Id"=1012
 AND o."IsCorrect" AND o."LatexCode"='24');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 255 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المثلثات المتشابهة تتناسب الأضلاع المتناظرة بعامل التشابه نفسه. إذا كان الضلع الأصلي 6 وعامل التكبير 5، فالضلع المناظر = 6 × 5 = 30. نضرب الأطوال في العامل، ولا نربعه إلا عند حساب المساحات.', "DetailedSolutionEn"='Rule used: Corresponding side lengths of similar triangles are multiplied by the linear scale factor. An original side of 6 with scale factor 5 gives corresponding side = 6 × 5 = 30. Square the scale factor for areas, not for side lengths.'
 WHERE "Id"=256 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلثان متشابهان. طول ضلع في الأول 6 ومعامل التكبير 5، ما طول الضلع المناظر؟' AND "QuestionTextEn"='Similar triangles: a side is 6 with scale factor 5. Find the corresponding side.'
 AND "DetailedSolutionAr"='الطول الجديد=6×5=30.' AND "DetailedSolutionEn"='New length=6×5=30.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=256 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=256 AND o."Id"=1015
 AND o."IsCorrect" AND o."LatexCode"='30');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 256 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: في المثلث القائم أ² + ب² = ج²، حيث ج هو الوتر الأطول. لإيجاد الضلع المجهول ب نعكس القانون: ب = √(ج² − أ²). الوتر 41 والضلع 9؛ بالتعويض: ب = √(1681 − 81) = √1600 = 40. نأخذ الجذر الموجب لأن الطول غير سالب.', "DetailedSolutionEn"='Rule used: In a right triangle a² + b² = c², where c is the hypotenuse. Rearrange to find the unknown leg: b = √(c² − a²). Given c = 41, a = 9, calculate b = √(1681 − 81) = √1600 = 40. Take the positive root since length is nonnegative.'
 WHERE "Id"=267 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='وتر مثلث قائم 41، وأحد ضلعيه 9. ما الضلع الثاني؟' AND "QuestionTextEn"='A right triangle has hypotenuse 41 and one leg 9. Find its other leg.'
 AND "DetailedSolutionAr"='بتطبيق فيثاغورس: √(41²−9²)=40.' AND "DetailedSolutionEn"='By Pythagoras, √(41²−9²)=40.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=267 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=267 AND o."Id"=1059
 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 267 changed; abort entire set'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المثلثات المتشابهة تتناسب الأضلاع المتناظرة بعامل التشابه نفسه. إذا كان الضلع الأصلي 7 وعامل التكبير 6، فالضلع المناظر = 7 × 6 = 42. نضرب الأطوال في العامل، ولا نربعه إلا عند حساب المساحات.', "DetailedSolutionEn"='Rule used: Corresponding side lengths of similar triangles are multiplied by the linear scale factor. An original side of 7 with scale factor 6 gives corresponding side = 7 × 6 = 42. Square the scale factor for areas, not for side lengths.'
 WHERE "Id"=268 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلثان متشابهان. طول ضلع في الأول 7 ومعامل التكبير 6، ما طول الضلع المناظر؟' AND "QuestionTextEn"='Similar triangles: a side is 7 with scale factor 6. Find the corresponding side.'
 AND "DetailedSolutionAr"='الطول الجديد=7×6=42.' AND "DetailedSolutionEn"='New length=7×6=42.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=268 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=268 AND o."Id"=1062
 AND o."IsCorrect" AND o."LatexCode"='42');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Ratio/geometry question 268 changed; abort entire set'; END IF;
END $mw_middle_ratio_triangle$;
COMMIT;
