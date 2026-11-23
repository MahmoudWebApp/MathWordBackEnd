-- Atomic, one-time 38-row bilingual law review: secondary advanced algebra and sequences.
-- Exact original questions/answers/old solutions required. No student history, questions, options, stage or access changes.
BEGIN;
DO $mw_secondary_algebra_sequences$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف اللوغاريتم: logₐ(ب) = ج يعني أن أ^ج = ب، بشرط أ > 0 وأ ≠ 1 وب > 0. للعدد 32 والأساس 2 نبحث عن الأس الذي يحقق 2^س = 32. لأن 2 × 2 × 2 × 2 × 2 = 2⁵ = 32، فإن log₂32 = 5.', "DetailedSolutionEn"='Logarithm definition: log_a(b) = c means a^c = b for a > 0, a ≠ 1, and b > 0. To find log₂32, solve 2^x = 32. Since 2 × 2 × 2 × 2 × 2 = 2⁵ = 32, the logarithm is 5.'
 WHERE "Id"=21 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='أوجد قيمة $\log_2 32$.' AND "QuestionTextEn"='Find the value of $\log_2 32$.'
 AND "DetailedSolutionAr"='$2^5 = 32$، لذلك $\log_2 32 = 5$.' AND "DetailedSolutionEn"='$2^5 = 32$, therefore $\log_2 32 = 5$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=21 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=21
 AND o."Id"=73 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 21 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف اللوغاريتم: logₐ(ب) هو الأس الذي نرفع إليه الأساس أ للحصول على ب. نبحث عن س بحيث 3^س = 81. نحسب 3 × 3 × 3 × 3 = 3⁴ = 81؛ لذلك log₃81 = 4. تحققنا من الجواب بإعادة تطبيق عملية الأس.', "DetailedSolutionEn"='Logarithm definition: log_a(b) is the exponent that makes a^x = b. Here solve 3^x = 81. Because 3 × 3 × 3 × 3 = 3⁴ = 81, log₃81 = 4. Exponentiation checks the result.'
 WHERE "Id"=61 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='أوجد قيمة لوغاريتم 81 للأساس 3.' AND "QuestionTextEn"='Evaluate log base 3 of 81.'
 AND "DetailedSolutionAr"='بما أن 3 أس 4 = 81، فإن لوغاريتم 81 للأساس 3 يساوي 4.' AND "DetailedSolutionEn"='Because 3 to the fourth power is 81, log base 3 of 81 is 4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=61 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=61
 AND o."Id"=234 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 61 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة حاصل الضرب الصفري: إذا كان (س − 2)(س − 5) = 0، فلا بد أن يكون أحد العاملين صفراً. إذن س = 2 أو س = 5. المطلوب مجموع الجذرين، فنجمع 2 + 5 = 7. ويمكن أيضاً التحقق من قاعدة فييتا: مجموع الجذرين يساوي سالب معامل س في الصورة المعيارية.', "DetailedSolutionEn"='Zero-product rule: If (x − 2)(x − 5) = 0, one of the factors must vanish, so the roots are x = 2 and x = 5. The requested sum is 2 + 5 = 7. This also agrees with Vieta''s root-sum relation for the expanded quadratic.'
 WHERE "Id"=77 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما مجموع جذري المعادلة \((x-2)(x-5)=0\)؟' AND "QuestionTextEn"='Find the sum of the roots of \((x-2)(x-5)=0\).'
 AND "DetailedSolutionAr"='الجذران هما 2 و5 ومجموعهما 7.' AND "DetailedSolutionEn"='The roots are 2 and 5, so the sum is 7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=77 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=77
 AND o."Id"=300 AND o."IsCorrect" AND o."LatexCode"='7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 77 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة حاصل الضرب الصفري: إذا كان (س − 3)(س − 6) = 0، فلا بد أن يكون أحد العاملين صفراً. إذن س = 3 أو س = 6. المطلوب مجموع الجذرين، فنجمع 3 + 6 = 9. ويمكن أيضاً التحقق من قاعدة فييتا: مجموع الجذرين يساوي سالب معامل س في الصورة المعيارية.', "DetailedSolutionEn"='Zero-product rule: If (x − 3)(x − 6) = 0, one of the factors must vanish, so the roots are x = 3 and x = 6. The requested sum is 3 + 6 = 9. This also agrees with Vieta''s root-sum relation for the expanded quadratic.'
 WHERE "Id"=92 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما مجموع جذري المعادلة \((x-3)(x-6)=0\)؟' AND "QuestionTextEn"='Find the sum of the roots of \((x-3)(x-6)=0\).'
 AND "DetailedSolutionAr"='الجذران هما 3 و6 ومجموعهما 9.' AND "DetailedSolutionEn"='The roots are 3 and 6, so the sum is 9.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=92 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=92
 AND o."Id"=359 AND o."IsCorrect" AND o."LatexCode"='9');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 92 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة حاصل الضرب الصفري: إذا كان (س − 4)(س − 7) = 0، فلا بد أن يكون أحد العاملين صفراً. إذن س = 4 أو س = 7. المطلوب مجموع الجذرين، فنجمع 4 + 7 = 11. ويمكن أيضاً التحقق من قاعدة فييتا: مجموع الجذرين يساوي سالب معامل س في الصورة المعيارية.', "DetailedSolutionEn"='Zero-product rule: If (x − 4)(x − 7) = 0, one of the factors must vanish, so the roots are x = 4 and x = 7. The requested sum is 4 + 7 = 11. This also agrees with Vieta''s root-sum relation for the expanded quadratic.'
 WHERE "Id"=107 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما مجموع جذري المعادلة \((x-4)(x-7)=0\)؟' AND "QuestionTextEn"='Find the sum of the roots of \((x-4)(x-7)=0\).'
 AND "DetailedSolutionAr"='الجذران هما 4 و7 ومجموعهما 11.' AND "DetailedSolutionEn"='The roots are 4 and 7, so the sum is 11.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=107 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=107
 AND o."Id"=418 AND o."IsCorrect" AND o."LatexCode"='11');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 107 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة حاصل الضرب الصفري: إذا كان (س − 5)(س − 8) = 0، فلا بد أن يكون أحد العاملين صفراً. إذن س = 5 أو س = 8. المطلوب مجموع الجذرين، فنجمع 5 + 8 = 13. ويمكن أيضاً التحقق من قاعدة فييتا: مجموع الجذرين يساوي سالب معامل س في الصورة المعيارية.', "DetailedSolutionEn"='Zero-product rule: If (x − 5)(x − 8) = 0, one of the factors must vanish, so the roots are x = 5 and x = 8. The requested sum is 5 + 8 = 13. This also agrees with Vieta''s root-sum relation for the expanded quadratic.'
 WHERE "Id"=122 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما مجموع جذري المعادلة \((x-5)(x-8)=0\)؟' AND "QuestionTextEn"='Find the sum of the roots of \((x-5)(x-8)=0\).'
 AND "DetailedSolutionAr"='الجذران هما 5 و8 ومجموعهما 13.' AND "DetailedSolutionEn"='The roots are 5 and 8, so the sum is 13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=122 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=122
 AND o."Id"=477 AND o."IsCorrect" AND o."LatexCode"='13');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 122 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة حاصل الضرب الصفري: إذا كان (س − 6)(س − 9) = 0، فلا بد أن يكون أحد العاملين صفراً. إذن س = 6 أو س = 9. المطلوب مجموع الجذرين، فنجمع 6 + 9 = 15. ويمكن أيضاً التحقق من قاعدة فييتا: مجموع الجذرين يساوي سالب معامل س في الصورة المعيارية.', "DetailedSolutionEn"='Zero-product rule: If (x − 6)(x − 9) = 0, one of the factors must vanish, so the roots are x = 6 and x = 9. The requested sum is 6 + 9 = 15. This also agrees with Vieta''s root-sum relation for the expanded quadratic.'
 WHERE "Id"=137 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما مجموع جذري المعادلة \((x-6)(x-9)=0\)؟' AND "QuestionTextEn"='Find the sum of the roots of \((x-6)(x-9)=0\).'
 AND "DetailedSolutionAr"='الجذران هما 6 و9 ومجموعهما 15.' AND "DetailedSolutionEn"='The roots are 6 and 9, so the sum is 15.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=137 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=137
 AND o."Id"=540 AND o."IsCorrect" AND o."LatexCode"='15');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 137 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون فييتا لمعادلة تربيعية أ س² + ب س + ج = 0: حاصل ضرب الجذرين = ج ÷ أ. في س² − 7س + 10 = 0 معامل س² هو 1 والحد الثابت 10، لذا حاصل الضرب = 10 ÷ 1 = 10. التحقق: التحليل (س − 2)(س − 5) يعطي الجذرين 2 و5 ومنتجهما 10.', "DetailedSolutionEn"='Vieta''s theorem: For ax² + bx + c = 0, the product of the two roots is c/a. In x² − 7x + 10 = 0, a = 1 and c = 10, so root product = 10/1 = 10. Check: factoring as (x − 2)(x − 5) yields roots 2, 5 with product 10.'
 WHERE "Id"=269 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما حاصل ضرب جذري \(x^2-7x+10=0\)؟' AND "QuestionTextEn"='What is the product of the roots of \(x^2-7x+10=0\)?'
 AND "DetailedSolutionAr"='بقاعدة فييتا حاصل الضرب هو الحد الثابت 10.' AND "DetailedSolutionEn"='Vieta: the product equals the constant 10.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=269 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=269
 AND o."Id"=1067 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 269 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مميّز المعادلة التربيعية أ س² + ب س + ج = 0 هو Δ = ب² − 4أج. في س² + 2س + 3 = 0 لدينا أ = 1، ب = 2، ج = 3. بالتعويض: Δ = 2² − 4 × 1 × 3 = 4 − 12 = -8. إشارة المميز تساعد لاحقاً في تحديد عدد الجذور الحقيقية.', "DetailedSolutionEn"='Quadratic discriminant law: For ax² + bx + c = 0, Δ = b² − 4ac. In x² + 2x + 3 = 0, a = 1, b = 2, c = 3. Substitute: Δ = 2² − 4 × 1 × 3 = 4 − 12 = -8. The discriminant sign can then classify real roots.'
 WHERE "Id"=270 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='احسب مميز \(x^2+2x+3=0\).' AND "QuestionTextEn"='Compute the discriminant of \(x^2+2x+3=0\).'
 AND "DetailedSolutionAr"='المميز 2²−4×3=-8.' AND "DetailedSolutionEn"='Discriminant 2²−4×3=-8.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=270 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=270
 AND o."Id"=1070 AND o."IsCorrect" AND o."LatexCode"='-8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 270 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لتحليل س² + 5س + 6 نبحث عن عددين مجموعهما 5 وحاصل ضربهما 6. العددان 2 و3 لأن 2 + 3 = 5 و2 × 3 = 6. إذن التحليل (س + 2)(س + 3). التحقق بالتوزيع: س² + (2 + 3)س + 2×3 يعيد المقدار الأصلي.', "DetailedSolutionEn"='Factoring rule: To factor x² + 5x + 6, find two numbers with sum 5 and product 6. They are 2 and 3 because 2 + 3 = 5 and 2 × 3 = 6. Therefore the factors are (x + 2)(x + 3). Expanding reproduces x² + 5x + 6.'
 WHERE "Id"=271 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='حلّل \(x^2+5x+6\) إلى عوامل.' AND "QuestionTextEn"='Factor \(x^2+5x+6\).'
 AND "DetailedSolutionAr"='لأن 2+3=5 و2×3=6 فالعوامل صحيحة.' AND "DetailedSolutionEn"='Since 2+3=5 and 2×3=6, the factors follow.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=271 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=271
 AND o."Id"=1073 AND o."IsCorrect" AND o."LatexCode"='(x+2)(x+3)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 271 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون فييتا لمعادلة تربيعية أ س² + ب س + ج = 0: حاصل ضرب الجذرين = ج ÷ أ. في س² − 9س + 18 = 0 معامل س² هو 1 والحد الثابت 18، لذا حاصل الضرب = 18 ÷ 1 = 18. التحقق: التحليل (س − 3)(س − 6) يعطي الجذرين 3 و6 ومنتجهما 18.', "DetailedSolutionEn"='Vieta''s theorem: For ax² + bx + c = 0, the product of the two roots is c/a. In x² − 9x + 18 = 0, a = 1 and c = 18, so root product = 18/1 = 18. Check: factoring as (x − 3)(x − 6) yields roots 3, 6 with product 18.'
 WHERE "Id"=281 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما حاصل ضرب جذري \(x^2-9x+18=0\)؟' AND "QuestionTextEn"='What is the product of the roots of \(x^2-9x+18=0\)?'
 AND "DetailedSolutionAr"='بقاعدة فييتا حاصل الضرب هو الحد الثابت 18.' AND "DetailedSolutionEn"='Vieta: the product equals the constant 18.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=281 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=281
 AND o."Id"=1114 AND o."IsCorrect" AND o."LatexCode"='18');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 281 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مميّز المعادلة التربيعية أ س² + ب س + ج = 0 هو Δ = ب² − 4أج. في س² + 3س + 4 = 0 لدينا أ = 1، ب = 3، ج = 4. بالتعويض: Δ = 3² − 4 × 1 × 4 = 9 − 16 = -7. إشارة المميز تساعد لاحقاً في تحديد عدد الجذور الحقيقية.', "DetailedSolutionEn"='Quadratic discriminant law: For ax² + bx + c = 0, Δ = b² − 4ac. In x² + 3x + 4 = 0, a = 1, b = 3, c = 4. Substitute: Δ = 3² − 4 × 1 × 4 = 9 − 16 = -7. The discriminant sign can then classify real roots.'
 WHERE "Id"=282 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='احسب مميز \(x^2+3x+4=0\).' AND "QuestionTextEn"='Compute the discriminant of \(x^2+3x+4=0\).'
 AND "DetailedSolutionAr"='المميز 3²−4×4=-7.' AND "DetailedSolutionEn"='Discriminant 3²−4×4=-7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=282 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=282
 AND o."Id"=1117 AND o."IsCorrect" AND o."LatexCode"='-7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 282 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لتحليل س² + 7س + 12 نبحث عن عددين مجموعهما 7 وحاصل ضربهما 12. العددان 3 و4 لأن 3 + 4 = 7 و3 × 4 = 12. إذن التحليل (س + 3)(س + 4). التحقق بالتوزيع: س² + (3 + 4)س + 3×4 يعيد المقدار الأصلي.', "DetailedSolutionEn"='Factoring rule: To factor x² + 7x + 12, find two numbers with sum 7 and product 12. They are 3 and 4 because 3 + 4 = 7 and 3 × 4 = 12. Therefore the factors are (x + 3)(x + 4). Expanding reproduces x² + 7x + 12.'
 WHERE "Id"=283 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='حلّل \(x^2+7x+12\) إلى عوامل.' AND "QuestionTextEn"='Factor \(x^2+7x+12\).'
 AND "DetailedSolutionAr"='لأن 3+4=7 و3×4=12 فالعوامل صحيحة.' AND "DetailedSolutionEn"='Since 3+4=7 and 3×4=12, the factors follow.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=283 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=283
 AND o."Id"=1124 AND o."IsCorrect" AND o."LatexCode"='(x+3)(x+4)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 283 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون فييتا لمعادلة تربيعية أ س² + ب س + ج = 0: حاصل ضرب الجذرين = ج ÷ أ. في س² − 11س + 28 = 0 معامل س² هو 1 والحد الثابت 28، لذا حاصل الضرب = 28 ÷ 1 = 28. التحقق: التحليل (س − 4)(س − 7) يعطي الجذرين 4 و7 ومنتجهما 28.', "DetailedSolutionEn"='Vieta''s theorem: For ax² + bx + c = 0, the product of the two roots is c/a. In x² − 11x + 28 = 0, a = 1 and c = 28, so root product = 28/1 = 28. Check: factoring as (x − 4)(x − 7) yields roots 4, 7 with product 28.'
 WHERE "Id"=293 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما حاصل ضرب جذري \(x^2-11x+28=0\)؟' AND "QuestionTextEn"='What is the product of the roots of \(x^2-11x+28=0\)?'
 AND "DetailedSolutionAr"='بقاعدة فييتا حاصل الضرب هو الحد الثابت 28.' AND "DetailedSolutionEn"='Vieta: the product equals the constant 28.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=293 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=293
 AND o."Id"=1161 AND o."IsCorrect" AND o."LatexCode"='28');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 293 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مميّز المعادلة التربيعية أ س² + ب س + ج = 0 هو Δ = ب² − 4أج. في س² + 4س + 5 = 0 لدينا أ = 1، ب = 4، ج = 5. بالتعويض: Δ = 4² − 4 × 1 × 5 = 16 − 20 = -4. إشارة المميز تساعد لاحقاً في تحديد عدد الجذور الحقيقية.', "DetailedSolutionEn"='Quadratic discriminant law: For ax² + bx + c = 0, Δ = b² − 4ac. In x² + 4x + 5 = 0, a = 1, b = 4, c = 5. Substitute: Δ = 4² − 4 × 1 × 5 = 16 − 20 = -4. The discriminant sign can then classify real roots.'
 WHERE "Id"=294 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='احسب مميز \(x^2+4x+5=0\).' AND "QuestionTextEn"='Compute the discriminant of \(x^2+4x+5=0\).'
 AND "DetailedSolutionAr"='المميز 4²−4×5=-4.' AND "DetailedSolutionEn"='Discriminant 4²−4×5=-4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=294 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=294
 AND o."Id"=1168 AND o."IsCorrect" AND o."LatexCode"='-4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 294 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لتحليل س² + 9س + 20 نبحث عن عددين مجموعهما 9 وحاصل ضربهما 20. العددان 4 و5 لأن 4 + 5 = 9 و4 × 5 = 20. إذن التحليل (س + 4)(س + 5). التحقق بالتوزيع: س² + (4 + 5)س + 4×5 يعيد المقدار الأصلي.', "DetailedSolutionEn"='Factoring rule: To factor x² + 9x + 20, find two numbers with sum 9 and product 20. They are 4 and 5 because 4 + 5 = 9 and 4 × 5 = 20. Therefore the factors are (x + 4)(x + 5). Expanding reproduces x² + 9x + 20.'
 WHERE "Id"=295 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='حلّل \(x^2+9x+20\) إلى عوامل.' AND "QuestionTextEn"='Factor \(x^2+9x+20\).'
 AND "DetailedSolutionAr"='لأن 4+5=9 و4×5=20 فالعوامل صحيحة.' AND "DetailedSolutionEn"='Since 4+5=9 and 4×5=20, the factors follow.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=295 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=295
 AND o."Id"=1171 AND o."IsCorrect" AND o."LatexCode"='(x+4)(x+5)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 295 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون فييتا لمعادلة تربيعية أ س² + ب س + ج = 0: حاصل ضرب الجذرين = ج ÷ أ. في س² − 13س + 40 = 0 معامل س² هو 1 والحد الثابت 40، لذا حاصل الضرب = 40 ÷ 1 = 40. التحقق: التحليل (س − 5)(س − 8) يعطي الجذرين 5 و8 ومنتجهما 40.', "DetailedSolutionEn"='Vieta''s theorem: For ax² + bx + c = 0, the product of the two roots is c/a. In x² − 13x + 40 = 0, a = 1 and c = 40, so root product = 40/1 = 40. Check: factoring as (x − 5)(x − 8) yields roots 5, 8 with product 40.'
 WHERE "Id"=305 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما حاصل ضرب جذري \(x^2-13x+40=0\)؟' AND "QuestionTextEn"='What is the product of the roots of \(x^2-13x+40=0\)?'
 AND "DetailedSolutionAr"='بقاعدة فييتا حاصل الضرب هو الحد الثابت 40.' AND "DetailedSolutionEn"='Vieta: the product equals the constant 40.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=305 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=305
 AND o."Id"=1212 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 305 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مميّز المعادلة التربيعية أ س² + ب س + ج = 0 هو Δ = ب² − 4أج. في س² + 5س + 6 = 0 لدينا أ = 1، ب = 5، ج = 6. بالتعويض: Δ = 5² − 4 × 1 × 6 = 25 − 24 = 1. إشارة المميز تساعد لاحقاً في تحديد عدد الجذور الحقيقية.', "DetailedSolutionEn"='Quadratic discriminant law: For ax² + bx + c = 0, Δ = b² − 4ac. In x² + 5x + 6 = 0, a = 1, b = 5, c = 6. Substitute: Δ = 5² − 4 × 1 × 6 = 25 − 24 = 1. The discriminant sign can then classify real roots.'
 WHERE "Id"=306 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='احسب مميز \(x^2+5x+6=0\).' AND "QuestionTextEn"='Compute the discriminant of \(x^2+5x+6=0\).'
 AND "DetailedSolutionAr"='المميز 5²−4×6=1.' AND "DetailedSolutionEn"='Discriminant 5²−4×6=1.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=306 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=306
 AND o."Id"=1215 AND o."IsCorrect" AND o."LatexCode"='1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 306 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لتحليل س² + 11س + 30 نبحث عن عددين مجموعهما 11 وحاصل ضربهما 30. العددان 5 و6 لأن 5 + 6 = 11 و5 × 6 = 30. إذن التحليل (س + 5)(س + 6). التحقق بالتوزيع: س² + (5 + 6)س + 5×6 يعيد المقدار الأصلي.', "DetailedSolutionEn"='Factoring rule: To factor x² + 11x + 30, find two numbers with sum 11 and product 30. They are 5 and 6 because 5 + 6 = 11 and 5 × 6 = 30. Therefore the factors are (x + 5)(x + 6). Expanding reproduces x² + 11x + 30.'
 WHERE "Id"=307 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='حلّل \(x^2+11x+30\) إلى عوامل.' AND "QuestionTextEn"='Factor \(x^2+11x+30\).'
 AND "DetailedSolutionAr"='لأن 5+6=11 و5×6=30 فالعوامل صحيحة.' AND "DetailedSolutionEn"='Since 5+6=11 and 5×6=30, the factors follow.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=307 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=307
 AND o."Id"=1218 AND o."IsCorrect" AND o."LatexCode"='(x+5)(x+6)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 307 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون فييتا لمعادلة تربيعية أ س² + ب س + ج = 0: حاصل ضرب الجذرين = ج ÷ أ. في س² − 15س + 54 = 0 معامل س² هو 1 والحد الثابت 54، لذا حاصل الضرب = 54 ÷ 1 = 54. التحقق: التحليل (س − 6)(س − 9) يعطي الجذرين 6 و9 ومنتجهما 54.', "DetailedSolutionEn"='Vieta''s theorem: For ax² + bx + c = 0, the product of the two roots is c/a. In x² − 15x + 54 = 0, a = 1 and c = 54, so root product = 54/1 = 54. Check: factoring as (x − 6)(x − 9) yields roots 6, 9 with product 54.'
 WHERE "Id"=317 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما حاصل ضرب جذري \(x^2-15x+54=0\)؟' AND "QuestionTextEn"='What is the product of the roots of \(x^2-15x+54=0\)?'
 AND "DetailedSolutionAr"='بقاعدة فييتا حاصل الضرب هو الحد الثابت 54.' AND "DetailedSolutionEn"='Vieta: the product equals the constant 54.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=317 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=317
 AND o."Id"=1259 AND o."IsCorrect" AND o."LatexCode"='54');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 317 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مميّز المعادلة التربيعية أ س² + ب س + ج = 0 هو Δ = ب² − 4أج. في س² + 6س + 7 = 0 لدينا أ = 1، ب = 6، ج = 7. بالتعويض: Δ = 6² − 4 × 1 × 7 = 36 − 28 = 8. إشارة المميز تساعد لاحقاً في تحديد عدد الجذور الحقيقية.', "DetailedSolutionEn"='Quadratic discriminant law: For ax² + bx + c = 0, Δ = b² − 4ac. In x² + 6x + 7 = 0, a = 1, b = 6, c = 7. Substitute: Δ = 6² − 4 × 1 × 7 = 36 − 28 = 8. The discriminant sign can then classify real roots.'
 WHERE "Id"=318 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='احسب مميز \(x^2+6x+7=0\).' AND "QuestionTextEn"='Compute the discriminant of \(x^2+6x+7=0\).'
 AND "DetailedSolutionAr"='المميز 6²−4×7=8.' AND "DetailedSolutionEn"='Discriminant 6²−4×7=8.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=318 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=318
 AND o."Id"=1262 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 318 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لتحليل س² + 13س + 42 نبحث عن عددين مجموعهما 13 وحاصل ضربهما 42. العددان 6 و7 لأن 6 + 7 = 13 و6 × 7 = 42. إذن التحليل (س + 6)(س + 7). التحقق بالتوزيع: س² + (6 + 7)س + 6×7 يعيد المقدار الأصلي.', "DetailedSolutionEn"='Factoring rule: To factor x² + 13x + 42, find two numbers with sum 13 and product 42. They are 6 and 7 because 6 + 7 = 13 and 6 × 7 = 42. Therefore the factors are (x + 6)(x + 7). Expanding reproduces x² + 13x + 42.'
 WHERE "Id"=319 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='حلّل \(x^2+13x+42\) إلى عوامل.' AND "QuestionTextEn"='Factor \(x^2+13x+42\).'
 AND "DetailedSolutionAr"='لأن 6+7=13 و6×7=42 فالعوامل صحيحة.' AND "DetailedSolutionEn"='Since 6+7=13 and 6×7=42, the factors follow.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=319 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=319
 AND o."Id"=1265 AND o."IsCorrect" AND o."LatexCode"='(x+6)(x+7)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 319 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: اللوغاريتم والقوة عمليتان عكسيتان. من log₂(س) = 5 نعيد الكتابة على صورة أسية: 2⁵ = س. بالتعويض: س = 2 × 2 × 2 × 2 × 2 = 32، وهو عدد موجب كما يقتضي مجال اللوغاريتم. التحقق: log₂32 = 5.', "DetailedSolutionEn"='Rule used: Logarithms invert exponentiation. Rewrite log₂(x) = 5 in exponential form: 2⁵ = x. Evaluate x = 2 × 2 × 2 × 2 × 2 = 32. The value is positive as required by the logarithm''s domain. Check: log₂32 = 5.'
 WHERE "Id"=640 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='إذا كان log₂(x) = 5، فما قيمة x؟' AND "QuestionTextEn"='If log base 2 of x equals 5, what is x?'
 AND "DetailedSolutionAr"='التعريف يعطي x = 2⁵ = 32.' AND "DetailedSolutionEn"='The definition gives x = 2^5 = 32.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=640 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=640
 AND o."Id"=2552 AND o."IsCorrect" AND o."LatexCode"='32');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 640 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الحد النوني للمتتالية الحسابية: أₙ = أ₁ + (ن − 1)د. المتتالية 5، 9، 13، 17 لها حد أول أ₁ = 5 وفرق مشترك د = 9 − 5 = 4. بالتعويض: أₙ = 5 + 4(ن − 1) = 5 + 4ن − 4 = 4ن + 1. التحقق عند ن = 1 يعطي 5 وعند ن = 2 يعطي 9.', "DetailedSolutionEn"='Arithmetic sequence nth-term rule: a_n = a₁ + (n−1)d. The first term is 5 and common difference is 9 − 5 = 4. Substitute: a_n = 5 + 4(n−1) = 5 + 4n − 4 = 4n + 1. Check: at n=1 gives 5, at n=2 gives 9.'
 WHERE "Id"=436 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='المتتالية $5,9,13,17,\ldots$ حسابية. أي صيغة تعطي الحد $a_n$ إذا بدأنا من $n=1$؟' AND "QuestionTextEn"='The arithmetic sequence is $5,9,13,17,\ldots$. Which formula gives $a_n$ starting at $n=1$?'
 AND "DetailedSolutionAr"='الحد الأول 5 والفرق 4، لذا $a_n=5+4(n-1)=4n+1$.' AND "DetailedSolutionEn"='The first term is 5 and the common difference is 4, so $a_n=5+4(n-1)=4n+1$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=436 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=436
 AND o."Id"=1733 AND o."IsCorrect" AND o."LatexCode"='4n+1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 436 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: الفرق المشترك للمتتالية الحسابية ثابت، وبين الحدين أ₃ وأ₇ توجد 7 − 3 = 4 انتقالات. لذلك أ₇ − أ₃ = 4د. بالتعويض: 27 − 11 = 4د، أي 16 = 4د، فنقسم على 4 لنحصل على د = 4. التحقق: 11 + 4 × 4 = 27.', "DetailedSolutionEn"='Rule used: An arithmetic sequence has a constant common difference, and there are 7 − 3 = 4 steps between a₃ and a₇. Hence a₇ − a₃ = 4d. Substitute 27 − 11 = 4d, so 16 = 4d and d = 4. Check: 11 + 4 × 4 = 27.'
 WHERE "Id"=438 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='في متتالية حسابية، $a_3=11$ و$a_7=27$. ما الفرق المشترك؟' AND "QuestionTextEn"='In an arithmetic sequence, $a_3=11$ and $a_7=27$. Find the common difference.'
 AND "DetailedSolutionAr"='بين الحدين أربع خطوات: $a_7-a_3=4d=16$، ومنه $d=4$.' AND "DetailedSolutionEn"='There are four steps between the terms: $4d=27-11=16$, hence $d=4$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=438 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=438
 AND o."Id"=1742 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 438 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون مجموع أول ن حدود في متتالية حسابية: مₙ = (ن ÷ 2) × (الحد الأول + الحد الأخير). لدينا ستة حدود من 2 حتى 17 بفرق ثابت 3. بالتعويض: م₆ = (6 ÷ 2) × (2 + 17) = 3 × 19 = 57. ويمكن التأكد بالجمع 2 + 5 + 8 + 11 + 14 + 17 = 57.', "DetailedSolutionEn"='Arithmetic series sum law: S_n = n(first + last)/2. The six terms run from 2 through 17 with common difference 3. Thus S₆ = 6(2 + 17)/2 = 3 × 19 = 57. Direct check: 2 + 5 + 8 + 11 + 14 + 17 = 57.'
 WHERE "Id"=440 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='احسب مجموع الحدود الستة: 2، 5، 8، 11، 14، 17.' AND "QuestionTextEn"='Find the sum of the six terms 2, 5, 8, 11, 14, 17.'
 AND "DetailedSolutionAr"='المجموع $S_6=\frac62(2+17)=3\times19=57$.' AND "DetailedSolutionEn"='The arithmetic-series sum is $S_6=\frac62(2+17)=57$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=440 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=440
 AND o."Id"=1750 AND o."IsCorrect" AND o."LatexCode"='57');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 440 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون مجموع متتالية هندسية منتهية: مₙ = أ₁(rⁿ − 1)/(r − 1) عندما r ≠ 1. للأعداد 1، 2، 4، 8، 16 الحد الأول 1 والنسبة المشتركة 2 وعدد الحدود 5. إذن م₅ = 1 × (2⁵ − 1)/(2 − 1) = 32 − 1 = 31. والتحقق بالجمع المباشر يعطي 31.', "DetailedSolutionEn"='Finite geometric sum rule: S_n = a₁(r^n − 1)/(r − 1) for r ≠ 1. Here first term = 1, ratio = 2 and n = 5. Substitute: S₅ = 1 × (2⁵ − 1)/(2 − 1) = 32 − 1 = 31. The direct sum 1 + 2 + 4 + 8 + 16 also equals 31.'
 WHERE "Id"=441 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='احسب $1+2+4+8+16$.' AND "QuestionTextEn"='Compute $1+2+4+8+16$.'
 AND "DetailedSolutionAr"='مجموع القوى الخمس الأولى للعدد 2 يساوي $2^5-1=31$.' AND "DetailedSolutionEn"='The sum of the first five powers from $2^0$ through $2^4$ is $2^5-1=31$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=441 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=441
 AND o."Id"=1753 AND o."IsCorrect" AND o."LatexCode"='31');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 441 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المتتالية المعرفة بالعلاقة العودية نحسب كل حد بالاعتماد على سابقه. المعطى أ₁ = 2 و أₙ₊₁ = 2أₙ + 1. نحسب أ₂ = 2 × 2 + 1 = 5، ثم أ₃ = 2 × 5 + 1 = 11. إذن الحد الثالث هو 11، ولا نستطيع تجاوز حساب الحد الثاني في هذه العلاقة.', "DetailedSolutionEn"='Rule used: A recurrence defines each term from the preceding term. Given a₁ = 2 and a_(n+1) = 2a_n + 1, compute a₂ = 2 × 2 + 1 = 5, then a₃ = 2 × 5 + 1 = 11. Therefore the third term is 11.'
 WHERE "Id"=443 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='إذا $a_1=2$ و$a_{n+1}=2a_n+1$، أوجد $a_3$.' AND "QuestionTextEn"='If $a_1=2$ and $a_{n+1}=2a_n+1$, find $a_3$.'
 AND "DetailedSolutionAr"='أولاً $a_2=2(2)+1=5$، ثم $a_3=2(5)+1=11$.' AND "DetailedSolutionEn"='First $a_2=2(2)+1=5$, then $a_3=2(5)+1=11$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=443 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=443
 AND o."Id"=1764 AND o."IsCorrect" AND o."LatexCode"='11');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 443 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الحد النوني للمتتالية الحسابية: أₙ = أ₁ + (ن − 1)د. إذا كان الحد الخامس أ₅ = 23 والفرق المشترك د = 4، فنكتب 23 = أ₁ + 4 × 4. بالتالي أ₁ = 23 − 16 = 7. التحقق: 7، 11، 15، 19، 23.', "DetailedSolutionEn"='Arithmetic nth-term rule: a_n = a₁ + (n−1)d. Given a₅ = 23 and d = 4, write 23 = a₁ + 4 × 4. Rearrange: a₁ = 23 − 16 = 7. Check the first five terms: 7, 11, 15, 19, 23.'
 WHERE "Id"=483 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='في متتالية حسابية $a_5=23$ والفرق المشترك $d=4$. ما الحد الأول؟' AND "QuestionTextEn"='In an arithmetic sequence, $a_5=23$ and the common difference $d=4$. Find the first term.'
 AND "DetailedSolutionAr"='من $a_5=a_1+4d$ نحصل على $a_1=23-4\times4=7$.' AND "DetailedSolutionEn"='Since $a_5=a_1+4d$, we have $a_1=23-4\times4=7$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=483 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=483
 AND o."Id"=1921 AND o."IsCorrect" AND o."LatexCode"='7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 483 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: العلاقة العودية أₙ₊₁ = أₙ + 2ن تضيف مقداراً يتغير مع رقم الحد، فلا يجوز اعتبارها فرقاً ثابتاً. نبدأ أ₁ = 1؛ أ₂ = 1 + 2 × 1 = 3، ثم أ₃ = 3 + 2 × 2 = 7، ثم أ₄ = 7 + 2 × 3 = 13. إذن الحد الرابع هو 13.', "DetailedSolutionEn"='Rule used: The recurrence a_(n+1) = a_n + 2n adds an increment depending on n, so it is not a fixed-difference sequence. Starting with a₁ = 1: a₂ = 1 + 2 × 1 = 3, a₃ = 3 + 2 × 2 = 7, and a₄ = 7 + 2 × 3 = 13.'
 WHERE "Id"=485 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='إذا كان $a_1=1$ و$a_{n+1}=a_n+2n$ لكل $n\ge1$، فما $a_4$؟' AND "QuestionTextEn"='If $a_1=1$ and $a_{n+1}=a_n+2n$ for $n\ge1$, what is $a_4$?'
 AND "DetailedSolutionAr"='$a_2=1+2=3$ ثم $a_3=3+4=7$ ثم $a_4=7+6=13$.' AND "DetailedSolutionEn"='$a_2=1+2=3$, then $a_3=3+4=7$, then $a_4=7+6=13$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=485 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=485
 AND o."Id"=1931 AND o."IsCorrect" AND o."LatexCode"='13');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 485 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: النسبة المشتركة في المتتالية الهندسية = الحد التالي ÷ الحد السابق، بشرط ألا يكون السابق صفراً. الحدود 2، 6، 18، 54؛ نحسب 6 ÷ 2 = 3، و18 ÷ 6 = 3، و54 ÷ 18 = 3. بما أن النسبة ثابتة، فإن أساس المتتالية الهندسية يساوي 3.', "DetailedSolutionEn"='Rule used: Common ratio in a geometric sequence = next term ÷ previous nonzero term. For 2, 6, 18, 54, calculate 6 ÷ 2 = 3, 18 ÷ 6 = 3 and 54 ÷ 18 = 3. The constant ratio is therefore 3.'
 WHERE "Id"=709 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='متتالية هندسية تبدأ بالحدود 2، 6، 18، 54، ... . ما أساسها؟' AND "QuestionTextEn"='A geometric sequence begins 2, 6, 18, 54, ... . What is its common ratio?'
 AND "DetailedSolutionAr"='نقسم كل حد على الذي قبله: 6 ÷ 2 = 3، وكذلك 18 ÷ 6 = 3؛ إذن الأساس 3.' AND "DetailedSolutionEn"='Each term divided by the preceding one gives 3, so the common ratio is 3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=709 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=709
 AND o."Id"=2782 AND o."IsCorrect" AND o."LatexCode"='3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 709 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: أₙ₊₁ = أₙ − 3 يعرّف متتالية حسابية فرقها المشترك د = −3. الحد الأول أ₁ = 7، ولذلك قانون الحد النوني أₙ = 7 + (ن − 1) × (−3). عند ن = 5 نحسب أ₅ = 7 + 4 × (−3) = 7 − 12 = −5. تحققنا أيضاً من الحدود 7، 4، 1، −2، −5.', "DetailedSolutionEn"='Rule used: The recurrence a_(n+1) = a_n − 3 is an arithmetic sequence with common difference d = −3. The nth term is a_n = 7 + (n−1)(−3). For n = 5, a₅ = 7 + 4(−3) = 7 − 12 = −5. The first terms are 7, 4, 1, −2, −5.'
 WHERE "Id"=773 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='متتالية تبدأ بـ a₁=7 وتحقق aₙ₊₁=aₙ−3. ما a₅؟' AND "QuestionTextEn"='A sequence starts with a₁=7 and satisfies aₙ₊₁=aₙ−3. What is a₅?'
 AND "DetailedSolutionAr"='الحدود هي 7، 4، 1، −2، −5؛ لذلك a₅=−5.' AND "DetailedSolutionEn"='The terms are 7,4,1,−2,−5, so a₅=−5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=773 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=773
 AND o."Id"=3082 AND o."IsCorrect" AND o."LatexCode"='-5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 773 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المتتالية العودية أₙ₊₂ = أₙ₊₁ + أₙ نحسب كل حد جديد بجمع الحدين السابقين. لدينا أ₁ = 1 وأ₂ = 2؛ إذن أ₃ = 2 + 1 = 3، ثم أ₄ = 3 + 2 = 5، ثم أ₅ = 5 + 3 = 8. النتيجة 8.', "DetailedSolutionEn"='Rule used: In the recurrence a_(n+2) = a_(n+1) + a_n, each new term is the sum of the two preceding terms. Starting with a₁ = 1 and a₂ = 2, compute a₃ = 2 + 1 = 3, a₄ = 3 + 2 = 5 and a₅ = 5 + 3 = 8.'
 WHERE "Id"=774 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='لدينا a₁=1 وa₂=2 ولكل n≥1: ‏aₙ₊₂=aₙ₊₁+aₙ. ما قيمة a₅؟' AND "QuestionTextEn"='Let a₁=1, a₂=2 and aₙ₊₂=aₙ₊₁+aₙ for n≥1. What is a₅?'
 AND "DetailedSolutionAr"='نحسب a₃=3 ثم a₄=5 ثم a₅=8.' AND "DetailedSolutionEn"='Compute a₃=3, a₄=5 and a₅=8.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=774 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=774
 AND o."Id"=3087 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 774 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لتطبيق العلاقة العودية غير الخطية أₙ₊₁ = (أₙ)² + 1 يجب تربيع الحد السابق ثم إضافة 1 في كل خطوة. بدءاً من أ₁ = 1: أ₂ = 1² + 1 = 2، أ₃ = 2² + 1 = 5، أ₄ = 5² + 1 = 26. إذن الحد الرابع 26.', "DetailedSolutionEn"='Rule used: The nonlinear recurrence a_(n+1) = (a_n)² + 1 requires squaring the previous term and then adding one at each step. From a₁ = 1: a₂ = 1² + 1 = 2, a₃ = 2² + 1 = 5, and a₄ = 5² + 1 = 26.'
 WHERE "Id"=775 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='إذا كانت a₁=1 وaₙ₊₁=aₙ²+1، فما قيمة a₄؟' AND "QuestionTextEn"='If a₁=1 and aₙ₊₁=aₙ²+1, what is a₄?'
 AND "DetailedSolutionAr"='نحسب a₂=1²+1=2، ثم a₃=2²+1=5، ثم a₄=5²+1=26.' AND "DetailedSolutionEn"='Successively, a₂=2, a₃=5 and a₄=26.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=775 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=775
 AND o."Id"=3092 AND o."IsCorrect" AND o."LatexCode"='26');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 775 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المتتالية الهندسية: أₙ = أ₁r^(ن−1). لدينا أ₁ = 2 والنسبة 3، فنبحث عن أول ن بحيث 2 × 3^(ن−1) > 100. نتحقق من الحد الرابع: أ₄ = 2 × 3³ = 54، وهو لا يتجاوز 100. الحد الخامس: أ₅ = 2 × 3⁴ = 162 > 100؛ إذن أول رتبة تحقق الشرط هي 5.', "DetailedSolutionEn"='Geometric nth-term rule: a_n = a₁r^(n−1). With a₁ = 2 and r = 3, seek the first n for which 2 × 3^(n−1) > 100. Check a₄ = 2 × 3³ = 54, not above 100, while a₅ = 2 × 3⁴ = 162 > 100. Therefore the first qualifying index is 5.'
 WHERE "Id"=776 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='إذا كانت a₁=2 وaₙ₊₁=3aₙ، فما **رقم أول حد** أكبر من 100؟' AND "QuestionTextEn"='For a₁=2 and aₙ₊₁=3aₙ, what is the **index of the first term** greater than 100?'
 AND "DetailedSolutionAr"='الحدود 2، 6، 18، 54، 162. الأول الذي يتجاوز 100 هو الحد الخامس.' AND "DetailedSolutionEn"='The terms are 2,6,18,54,162. The first above 100 is the fifth term.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=776 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=776
 AND o."Id"=3095 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 776 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المتتالية الحسابية: الفرق المشترك = (الحد الأخير − الحد الأول) ÷ عدد الفواصل بينهما. لدينا خمسة حدود من 4 إلى 20، أي أربعة فواصل. الفرق = (20 − 4) ÷ 4 = 4؛ إذن الحدود المفقودة هي 4 + 4 = 8، ثم 8 + 4 = 12، ثم 12 + 4 = 16. نتأكد أن 16 + 4 = 20.', "DetailedSolutionEn"='Arithmetic-sequence rule: Common difference = (last term − first term) ÷ number of gaps. Five terms from 4 to 20 have four gaps, so d = (20 − 4)/4 = 4. Missing terms are 4 + 4 = 8, then 12, then 16. Check: 16 + 4 = 20.'
 WHERE "Id"=827 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='أكمل متتالية حسابية ذات خمسة حدود: 4، ___، ___، ___، 20. ما الحدود الثلاثة المفقودة بالترتيب؟' AND "QuestionTextEn"='Complete this five-term arithmetic sequence: 4, ___, ___, ___, 20. Which three terms are missing in order?'
 AND "DetailedSolutionAr"='هناك أربع فترات متساوية، فالفرق = (20 − 4) / 4 = 4، والحدود هي 8 و12 و16.' AND "DetailedSolutionEn"='There are four equal intervals. The common difference is (20 − 4)/4 = 4, giving 8, 12, 16.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=827 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=827
 AND o."Id"=3299 AND o."IsCorrect" AND o."LatexCode"='8,\ 12,\ 16');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 827 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الحد النوني للمتتالية الحسابية: أₙ = أ₁ + (ن − 1)د. لدينا أ₁ = 5، د = 3 ونريد أₙ = 47. نحل 47 = 5 + 3(ن − 1)؛ نطرح 5: 42 = 3(ن − 1)، ثم نقسم على 3: ن − 1 = 14، فنجد ن = 15.', "DetailedSolutionEn"='Arithmetic nth-term rule: a_n = a₁ + (n−1)d. With a₁ = 5, d = 3 and a_n = 47, solve 47 = 5 + 3(n−1). Subtract 5: 42 = 3(n−1); divide by 3 to get n−1 = 14, so the index is n = 15.'
 WHERE "Id"=828 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='متتالية حسابية حدها الأول 5 وفرقها المشترك 3. ما رتبة الحد الذي قيمته 47؟' AND "QuestionTextEn"='An arithmetic sequence starts at 5 with common difference 3. At which term index does the value 47 occur?'
 AND "DetailedSolutionAr"='47 = 5 + (n − 1) × 3، إذن 42 = 3(n − 1) ومنه n = 15.' AND "DetailedSolutionEn"='Solve 47 = 5 + 3(n − 1): n − 1 = 14, so n = 15.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=828 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=828
 AND o."Id"=3304 AND o."IsCorrect" AND o."LatexCode"='15');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 828 source or correct answer changed; abort'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: المتسلسلة التلسكوبية تحتوي حدوداً وسطى تلغي بعضها عند فك الأقواس. نجمع (1 − 1/2) + (1/2 − 1/3) + (1/3 − 1/4) + (1/4 − 1/5). تلغى −1/2 مع +1/2 و−1/3 مع +1/3 و−1/4 مع +1/4. يبقى 1 − 1/5 = 4/5.', "DetailedSolutionEn"='Telescoping-series principle: Adjacent terms cancel when the parentheses are expanded. In (1−1/2)+(1/2−1/3)+(1/3−1/4)+(1/4−1/5), the middle fractions cancel in positive/negative pairs. Only 1 − 1/5 remains, giving 4/5.'
 WHERE "Id"=830 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='أوجد مجموع (1 − 1/2) + (1/2 − 1/3) + (1/3 − 1/4) + (1/4 − 1/5).' AND "QuestionTextEn"='Find the sum (1 − 1/2) + (1/2 − 1/3) + (1/3 − 1/4) + (1/4 − 1/5).'
 AND "DetailedSolutionAr"='تتلاشى الحدود الوسطى، ويبقى 1 − 1/5 = 4/5.' AND "DetailedSolutionEn"='Intermediate terms cancel, leaving 1 − 1/5 = 4/5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=830 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=830
 AND o."Id"=3310 AND o."IsCorrect" AND o."LatexCode"='\frac{4}{5}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary algebra/series question 830 source or correct answer changed; abort'; END IF;
END $mw_secondary_algebra_sequences$;
COMMIT;
