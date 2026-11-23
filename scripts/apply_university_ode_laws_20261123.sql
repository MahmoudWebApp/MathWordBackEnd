-- One-time atomic text-only update of 22 university ODE solution explanations.
-- Exact original question and correct-option guards; no student progress or answers altered.
BEGIN;
DO $mw_ode_review$
DECLARE changed integer;
BEGIN
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: تكامل المشتقة يعيد الدالة الأصلية مع ثابت تكامل. بما أن dy/dx = 2x، نكامل الطرفين بالنسبة إلى x: ‏y = ∫2x dx = x² + C. التحقق بالتفاضل: مشتقة x² + C هي 2x، لذا الحل العام صحيح لأي ثابت حقيقي C.', "DetailedSolutionEn" = 'Rule used: Antidifferentiation reverses differentiation and introduces a free constant. Given dy/dx = 2x, integrate both sides with respect to x: y = ∫2x dx = x² + C. Differentiate to check: d(x²+C)/dx = 2x for every real constant C.'
 WHERE "Id"=51 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='ما الحل العام للمعادلة التفاضلية dy/dx = 2x؟' AND "QuestionTextEn"='What is the general solution of the differential equation dy/dx = 2x?'
 AND "DetailedSolutionAr"='نُكامل الطرفين بالنسبة إلى x فنحصل على y = x² + C.' AND "DetailedSolutionEn"='Integrate both sides with respect to x: y = x² + C.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=51 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=51
  AND o."Id"=195 AND o."IsCorrect" AND o."LatexCode"='y=x^{2}+C');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 51 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'المبدأ المستخدم: حل المعادلة y′ = y هو y = Ceˣ، إذ إن مشتقة Ceˣ تساوي نفسها. الشرط الابتدائي y(0)=2 يعطي 2 = Ce⁰ = C. بالتعويض C=2 فنحصل على y=2eˣ. التحقق: y′=2eˣ=y وy(0)=2.', "DetailedSolutionEn" = 'Rule used: An equation y′ = y has general solution y = Ceˣ because its derivative equals itself. The initial value y(0)=2 implies 2=Ce⁰=C. Thus y=2eˣ. Check: y′=2eˣ=y and y(0)=2.'
 WHERE "Id"=67 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='حل المسألة الابتدائية y'' = y مع y(0) = 2.' AND "QuestionTextEn"='Solve the initial-value problem y'' = y with y(0) = 2.'
 AND "DetailedSolutionAr"='الحل العام y = Ce^x. من y(0)=2 نحصل على C=2، إذاً y=2e^x.' AND "DetailedSolutionEn"='The general solution is y = Ce^x. Since y(0)=2, C=2 and y=2e^x.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=67 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=67
  AND o."Id"=260 AND o."IsCorrect" AND o."LatexCode"='y=2e^{x}');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 67 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: المعادلة التفاضلية من الشكل y′ = 1y لها حل عام y = Ce^(1x)، لأن مشتقة الأسّ تعيد العامل 1. من الشرط الابتدائي y(0) = 2 نحصل على C = 2 لأن e⁰ = 1. إذن الحل y = 2e^(1x). التحقق: y′ = 1 × 2e^(1x) = 1y وy(0) = 2.', "DetailedSolutionEn" = 'Rule used: For y′ = 1y, the general solution is y = Ce^(1x), since differentiation introduces the factor 1. The initial condition y(0) = 2 gives C = 2, since e⁰ = 1. Therefore y = 2e^(1x). Check: y′ = 1 × 2e^(1x) = 1y and y(0) = 2.'
 WHERE "Id"=83 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='حل المعادلة التفاضلية \(y''=1y\) مع الشرط \(y(0)=2\).' AND "QuestionTextEn"='Solve \(y''=1y\) with \(y(0)=2\).'
 AND "DetailedSolutionAr"='الحل العام y=Ce^{1x}. بتطبيق الشرط الابتدائي نحصل على C=2.' AND "DetailedSolutionEn"='The general solution is y=Ce^{1x}. The initial condition gives C=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=83 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=83
  AND o."Id"=322 AND o."IsCorrect" AND o."LatexCode"='2e^{1x}');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 83 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: المعادلة التفاضلية من الشكل y′ = 2y لها حل عام y = Ce^(2x)، لأن مشتقة الأسّ تعيد العامل 2. من الشرط الابتدائي y(0) = 3 نحصل على C = 3 لأن e⁰ = 1. إذن الحل y = 3e^(2x). التحقق: y′ = 2 × 3e^(2x) = 2y وy(0) = 3.', "DetailedSolutionEn" = 'Rule used: For y′ = 2y, the general solution is y = Ce^(2x), since differentiation introduces the factor 2. The initial condition y(0) = 3 gives C = 3, since e⁰ = 1. Therefore y = 3e^(2x). Check: y′ = 2 × 3e^(2x) = 2y and y(0) = 3.'
 WHERE "Id"=98 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='حل المعادلة التفاضلية \(y''=2y\) مع الشرط \(y(0)=3\).' AND "QuestionTextEn"='Solve \(y''=2y\) with \(y(0)=3\).'
 AND "DetailedSolutionAr"='الحل العام y=Ce^{2x}. بتطبيق الشرط الابتدائي نحصل على C=3.' AND "DetailedSolutionEn"='The general solution is y=Ce^{2x}. The initial condition gives C=3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=98 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=98
  AND o."Id"=381 AND o."IsCorrect" AND o."LatexCode"='3e^{2x}');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 98 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: المعادلة التفاضلية من الشكل y′ = 3y لها حل عام y = Ce^(3x)، لأن مشتقة الأسّ تعيد العامل 3. من الشرط الابتدائي y(0) = 4 نحصل على C = 4 لأن e⁰ = 1. إذن الحل y = 4e^(3x). التحقق: y′ = 3 × 4e^(3x) = 3y وy(0) = 4.', "DetailedSolutionEn" = 'Rule used: For y′ = 3y, the general solution is y = Ce^(3x), since differentiation introduces the factor 3. The initial condition y(0) = 4 gives C = 4, since e⁰ = 1. Therefore y = 4e^(3x). Check: y′ = 3 × 4e^(3x) = 3y and y(0) = 4.'
 WHERE "Id"=113 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='حل المعادلة التفاضلية \(y''=3y\) مع الشرط \(y(0)=4\).' AND "QuestionTextEn"='Solve \(y''=3y\) with \(y(0)=4\).'
 AND "DetailedSolutionAr"='الحل العام y=Ce^{3x}. بتطبيق الشرط الابتدائي نحصل على C=4.' AND "DetailedSolutionEn"='The general solution is y=Ce^{3x}. The initial condition gives C=4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=113 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=113
  AND o."Id"=444 AND o."IsCorrect" AND o."LatexCode"='4e^{3x}');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 113 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: المعادلة التفاضلية من الشكل y′ = 4y لها حل عام y = Ce^(4x)، لأن مشتقة الأسّ تعيد العامل 4. من الشرط الابتدائي y(0) = 5 نحصل على C = 5 لأن e⁰ = 1. إذن الحل y = 5e^(4x). التحقق: y′ = 4 × 5e^(4x) = 4y وy(0) = 5.', "DetailedSolutionEn" = 'Rule used: For y′ = 4y, the general solution is y = Ce^(4x), since differentiation introduces the factor 4. The initial condition y(0) = 5 gives C = 5, since e⁰ = 1. Therefore y = 5e^(4x). Check: y′ = 4 × 5e^(4x) = 4y and y(0) = 5.'
 WHERE "Id"=128 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='حل المعادلة التفاضلية \(y''=4y\) مع الشرط \(y(0)=5\).' AND "QuestionTextEn"='Solve \(y''=4y\) with \(y(0)=5\).'
 AND "DetailedSolutionAr"='الحل العام y=Ce^{4x}. بتطبيق الشرط الابتدائي نحصل على C=5.' AND "DetailedSolutionEn"='The general solution is y=Ce^{4x}. The initial condition gives C=5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=128 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=128
  AND o."Id"=503 AND o."IsCorrect" AND o."LatexCode"='5e^{4x}');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 128 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: المعادلة التفاضلية من الشكل y′ = 5y لها حل عام y = Ce^(5x)، لأن مشتقة الأسّ تعيد العامل 5. من الشرط الابتدائي y(0) = 6 نحصل على C = 6 لأن e⁰ = 1. إذن الحل y = 6e^(5x). التحقق: y′ = 5 × 6e^(5x) = 5y وy(0) = 6.', "DetailedSolutionEn" = 'Rule used: For y′ = 5y, the general solution is y = Ce^(5x), since differentiation introduces the factor 5. The initial condition y(0) = 6 gives C = 6, since e⁰ = 1. Therefore y = 6e^(5x). Check: y′ = 5 × 6e^(5x) = 5y and y(0) = 6.'
 WHERE "Id"=143 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='حل المعادلة التفاضلية \(y''=5y\) مع الشرط \(y(0)=6\).' AND "QuestionTextEn"='Solve \(y''=5y\) with \(y(0)=6\).'
 AND "DetailedSolutionAr"='الحل العام y=Ce^{5x}. بتطبيق الشرط الابتدائي نحصل على C=6.' AND "DetailedSolutionEn"='The general solution is y=Ce^{5x}. The initial condition gives C=6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=143 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=143
  AND o."Id"=562 AND o."IsCorrect" AND o."LatexCode"='6e^{5x}');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 143 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة التكامل: إذا كانت y′ = 3 ثابتة، فالدالة y(x) = 3x + C. باستخدام y(0) = 2 نحصل على C = 2. بالتعويض عند x = 4: ‏y(4) = 3 × 4 + 2 = 14. التحقق: مشتقة 3x + 2 هي 3، ويحقق الشرط الابتدائي.', "DetailedSolutionEn" = 'Integration rule: If y′ = 3 is constant, then y(x) = 3x + C. From y(0) = 2, we obtain C = 2. Evaluate at x = 4: y(4) = 3 × 4 + 2 = 14. The derivative is 3, and y(0) agrees with the initial value.'
 WHERE "Id"=335 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=3\) و\(y(0)=2\)، أوجد \(y(4)\).' AND "QuestionTextEn"='Given \(y''=3\), \(y(0)=2\), find \(y(4)\).'
 AND "DetailedSolutionAr"='بالتكامل y=3x+2، فالقيمة 14.' AND "DetailedSolutionEn"='Integrate y=3x+2, yielding 14.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=335 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=335
  AND o."Id"=1329 AND o."IsCorrect" AND o."LatexCode"='14');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 335 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة التكامل: إذا كانت y′ = 4 ثابتة، فالدالة y(x) = 4x + C. باستخدام y(0) = 3 نحصل على C = 3. بالتعويض عند x = 5: ‏y(5) = 4 × 5 + 3 = 23. التحقق: مشتقة 4x + 3 هي 4، ويحقق الشرط الابتدائي.', "DetailedSolutionEn" = 'Integration rule: If y′ = 4 is constant, then y(x) = 4x + C. From y(0) = 3, we obtain C = 3. Evaluate at x = 5: y(5) = 4 × 5 + 3 = 23. The derivative is 4, and y(0) agrees with the initial value.'
 WHERE "Id"=347 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=4\) و\(y(0)=3\)، أوجد \(y(5)\).' AND "QuestionTextEn"='Given \(y''=4\), \(y(0)=3\), find \(y(5)\).'
 AND "DetailedSolutionAr"='بالتكامل y=4x+3، فالقيمة 23.' AND "DetailedSolutionEn"='Integrate y=4x+3, yielding 23.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=347 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=347
  AND o."Id"=1380 AND o."IsCorrect" AND o."LatexCode"='23');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 347 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة التكامل: إذا كانت y′ = 5 ثابتة، فالدالة y(x) = 5x + C. باستخدام y(0) = 4 نحصل على C = 4. بالتعويض عند x = 6: ‏y(6) = 5 × 6 + 4 = 34. التحقق: مشتقة 5x + 4 هي 5، ويحقق الشرط الابتدائي.', "DetailedSolutionEn" = 'Integration rule: If y′ = 5 is constant, then y(x) = 5x + C. From y(0) = 4, we obtain C = 4. Evaluate at x = 6: y(6) = 5 × 6 + 4 = 34. The derivative is 5, and y(0) agrees with the initial value.'
 WHERE "Id"=359 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=5\) و\(y(0)=4\)، أوجد \(y(6)\).' AND "QuestionTextEn"='Given \(y''=5\), \(y(0)=4\), find \(y(6)\).'
 AND "DetailedSolutionAr"='بالتكامل y=5x+4، فالقيمة 34.' AND "DetailedSolutionEn"='Integrate y=5x+4, yielding 34.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=359 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=359
  AND o."Id"=1427 AND o."IsCorrect" AND o."LatexCode"='34');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 359 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة التكامل: إذا كانت y′ = 6 ثابتة، فالدالة y(x) = 6x + C. باستخدام y(0) = 5 نحصل على C = 5. بالتعويض عند x = 7: ‏y(7) = 6 × 7 + 5 = 47. التحقق: مشتقة 6x + 5 هي 6، ويحقق الشرط الابتدائي.', "DetailedSolutionEn" = 'Integration rule: If y′ = 6 is constant, then y(x) = 6x + C. From y(0) = 5, we obtain C = 5. Evaluate at x = 7: y(7) = 6 × 7 + 5 = 47. The derivative is 6, and y(0) agrees with the initial value.'
 WHERE "Id"=371 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=6\) و\(y(0)=5\)، أوجد \(y(7)\).' AND "QuestionTextEn"='Given \(y''=6\), \(y(0)=5\), find \(y(7)\).'
 AND "DetailedSolutionAr"='بالتكامل y=6x+5، فالقيمة 47.' AND "DetailedSolutionEn"='Integrate y=6x+5, yielding 47.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=371 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=371
  AND o."Id"=1474 AND o."IsCorrect" AND o."LatexCode"='47');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 371 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة التكامل: إذا كانت y′ = 7 ثابتة، فالدالة y(x) = 7x + C. باستخدام y(0) = 6 نحصل على C = 6. بالتعويض عند x = 8: ‏y(8) = 7 × 8 + 6 = 62. التحقق: مشتقة 7x + 6 هي 7، ويحقق الشرط الابتدائي.', "DetailedSolutionEn" = 'Integration rule: If y′ = 7 is constant, then y(x) = 7x + C. From y(0) = 6, we obtain C = 6. Evaluate at x = 8: y(8) = 7 × 8 + 6 = 62. The derivative is 7, and y(0) agrees with the initial value.'
 WHERE "Id"=383 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=7\) و\(y(0)=6\)، أوجد \(y(8)\).' AND "QuestionTextEn"='Given \(y''=7\), \(y(0)=6\), find \(y(8)\).'
 AND "DetailedSolutionAr"='بالتكامل y=7x+6، فالقيمة 62.' AND "DetailedSolutionEn"='Integrate y=7x+6, yielding 62.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=383 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=383
  AND o."Id"=1521 AND o."IsCorrect" AND o."LatexCode"='62');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 383 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: إذا كانت المشتقة الثانية y″ = 0، فالمشتقة الأولى ثابتة y′ = C₁ والدالة خطية y = C₁x + C₂. من y′(0) = 2 نجد C₁ = 2، ومن y(0) = 3 نجد C₂ = 3. إذن y(3) = 2 × 3 + 3 = 9.', "DetailedSolutionEn" = 'Rule used: If y″ = 0, then y′ is constant and y(x) = C₁x + C₂. The conditions y′(0) = 2 and y(0) = 3 yield C₁ = 2, C₂ = 3. Thus y(3) = 2 × 3 + 3 = 9. Differentiate twice to check that y″ = 0.'
 WHERE "Id"=336 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''''=0\) و\(y''(0)=2\) و\(y(0)=3\)، أوجد \(y(3)\).' AND "QuestionTextEn"='Given \(y''''=0\), \(y''(0)=2\), \(y(0)=3\), find \(y(3)\).'
 AND "DetailedSolutionAr"='الحل y=2x+3، لذا 9.' AND "DetailedSolutionEn"='Solution y=2x+3, giving 9.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=336 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=336
  AND o."Id"=1336 AND o."IsCorrect" AND o."LatexCode"='9');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 336 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: إذا كانت المشتقة الثانية y″ = 0، فالمشتقة الأولى ثابتة y′ = C₁ والدالة خطية y = C₁x + C₂. من y′(0) = 3 نجد C₁ = 3، ومن y(0) = 4 نجد C₂ = 4. إذن y(4) = 3 × 4 + 4 = 16.', "DetailedSolutionEn" = 'Rule used: If y″ = 0, then y′ is constant and y(x) = C₁x + C₂. The conditions y′(0) = 3 and y(0) = 4 yield C₁ = 3, C₂ = 4. Thus y(4) = 3 × 4 + 4 = 16. Differentiate twice to check that y″ = 0.'
 WHERE "Id"=348 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''''=0\) و\(y''(0)=3\) و\(y(0)=4\)، أوجد \(y(4)\).' AND "QuestionTextEn"='Given \(y''''=0\), \(y''(0)=3\), \(y(0)=4\), find \(y(4)\).'
 AND "DetailedSolutionAr"='الحل y=3x+4، لذا 16.' AND "DetailedSolutionEn"='Solution y=3x+4, giving 16.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=348 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=348
  AND o."Id"=1383 AND o."IsCorrect" AND o."LatexCode"='16');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 348 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: إذا كانت المشتقة الثانية y″ = 0، فالمشتقة الأولى ثابتة y′ = C₁ والدالة خطية y = C₁x + C₂. من y′(0) = 4 نجد C₁ = 4، ومن y(0) = 5 نجد C₂ = 5. إذن y(5) = 4 × 5 + 5 = 25.', "DetailedSolutionEn" = 'Rule used: If y″ = 0, then y′ is constant and y(x) = C₁x + C₂. The conditions y′(0) = 4 and y(0) = 5 yield C₁ = 4, C₂ = 5. Thus y(5) = 4 × 5 + 5 = 25. Differentiate twice to check that y″ = 0.'
 WHERE "Id"=360 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''''=0\) و\(y''(0)=4\) و\(y(0)=5\)، أوجد \(y(5)\).' AND "QuestionTextEn"='Given \(y''''=0\), \(y''(0)=4\), \(y(0)=5\), find \(y(5)\).'
 AND "DetailedSolutionAr"='الحل y=4x+5، لذا 25.' AND "DetailedSolutionEn"='Solution y=4x+5, giving 25.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=360 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=360
  AND o."Id"=1430 AND o."IsCorrect" AND o."LatexCode"='25');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 360 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: إذا كانت المشتقة الثانية y″ = 0، فالمشتقة الأولى ثابتة y′ = C₁ والدالة خطية y = C₁x + C₂. من y′(0) = 5 نجد C₁ = 5، ومن y(0) = 6 نجد C₂ = 6. إذن y(6) = 5 × 6 + 6 = 36.', "DetailedSolutionEn" = 'Rule used: If y″ = 0, then y′ is constant and y(x) = C₁x + C₂. The conditions y′(0) = 5 and y(0) = 6 yield C₁ = 5, C₂ = 6. Thus y(6) = 5 × 6 + 6 = 36. Differentiate twice to check that y″ = 0.'
 WHERE "Id"=372 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''''=0\) و\(y''(0)=5\) و\(y(0)=6\)، أوجد \(y(6)\).' AND "QuestionTextEn"='Given \(y''''=0\), \(y''(0)=5\), \(y(0)=6\), find \(y(6)\).'
 AND "DetailedSolutionAr"='الحل y=5x+6، لذا 36.' AND "DetailedSolutionEn"='Solution y=5x+6, giving 36.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=372 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=372
  AND o."Id"=1477 AND o."IsCorrect" AND o."LatexCode"='36');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 372 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'القانون المستخدم: إذا كانت المشتقة الثانية y″ = 0، فالمشتقة الأولى ثابتة y′ = C₁ والدالة خطية y = C₁x + C₂. من y′(0) = 6 نجد C₁ = 6، ومن y(0) = 7 نجد C₂ = 7. إذن y(7) = 6 × 7 + 7 = 49.', "DetailedSolutionEn" = 'Rule used: If y″ = 0, then y′ is constant and y(x) = C₁x + C₂. The conditions y′(0) = 6 and y(0) = 7 yield C₁ = 6, C₂ = 7. Thus y(7) = 6 × 7 + 7 = 49. Differentiate twice to check that y″ = 0.'
 WHERE "Id"=384 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''''=0\) و\(y''(0)=6\) و\(y(0)=7\)، أوجد \(y(7)\).' AND "QuestionTextEn"='Given \(y''''=0\), \(y''(0)=6\), \(y(0)=7\), find \(y(7)\).'
 AND "DetailedSolutionAr"='الحل y=6x+7، لذا 49.' AND "DetailedSolutionEn"='Solution y=6x+7, giving 49.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=384 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=384
  AND o."Id"=1528 AND o."IsCorrect" AND o."LatexCode"='49');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 384 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة تكامل القوى: ∫x dx = x²/2. إذا كانت y′ = 4x، فإن y = (4/2)x² + C = 2x² + C. من y(0) = 3 نحصل على C = 3. بالتعويض x = 2: ‏y(2) = 2 × 2² + 3 = 11. التحقق: المشتقة y′ = 4x.', "DetailedSolutionEn" = 'Power integration rule: ∫x dx = x²/2. Given y′ = 4x, integrate to y = (4/2)x² + C = 2x² + C. Use y(0) = 3 to find C = 3. Then y(2) = 2 × 2² + 3 = 11. Differentiating yields y′ = 4x.'
 WHERE "Id"=337 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=4x\) و\(y(0)=3\)، أوجد \(y(2)\).' AND "QuestionTextEn"='Given \(y''=4x\), \(y(0)=3\), find \(y(2)\).'
 AND "DetailedSolutionAr"='بالتكامل y=2x²+3، فالقيمة 11.' AND "DetailedSolutionEn"='Integrate y=2x²+3, giving 11.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=337 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=337
  AND o."Id"=1339 AND o."IsCorrect" AND o."LatexCode"='11');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 337 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة تكامل القوى: ∫x dx = x²/2. إذا كانت y′ = 6x، فإن y = (6/2)x² + C = 3x² + C. من y(0) = 4 نحصل على C = 4. بالتعويض x = 3: ‏y(3) = 3 × 3² + 4 = 31. التحقق: المشتقة y′ = 6x.', "DetailedSolutionEn" = 'Power integration rule: ∫x dx = x²/2. Given y′ = 6x, integrate to y = (6/2)x² + C = 3x² + C. Use y(0) = 4 to find C = 4. Then y(3) = 3 × 3² + 4 = 31. Differentiating yields y′ = 6x.'
 WHERE "Id"=349 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=6x\) و\(y(0)=4\)، أوجد \(y(3)\).' AND "QuestionTextEn"='Given \(y''=6x\), \(y(0)=4\), find \(y(3)\).'
 AND "DetailedSolutionAr"='بالتكامل y=3x²+4، فالقيمة 31.' AND "DetailedSolutionEn"='Integrate y=3x²+4, giving 31.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=349 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=349
  AND o."Id"=1386 AND o."IsCorrect" AND o."LatexCode"='31');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 349 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة تكامل القوى: ∫x dx = x²/2. إذا كانت y′ = 8x، فإن y = (8/2)x² + C = 4x² + C. من y(0) = 5 نحصل على C = 5. بالتعويض x = 4: ‏y(4) = 4 × 4² + 5 = 69. التحقق: المشتقة y′ = 8x.', "DetailedSolutionEn" = 'Power integration rule: ∫x dx = x²/2. Given y′ = 8x, integrate to y = (8/2)x² + C = 4x² + C. Use y(0) = 5 to find C = 5. Then y(4) = 4 × 4² + 5 = 69. Differentiating yields y′ = 8x.'
 WHERE "Id"=361 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=8x\) و\(y(0)=5\)، أوجد \(y(4)\).' AND "QuestionTextEn"='Given \(y''=8x\), \(y(0)=5\), find \(y(4)\).'
 AND "DetailedSolutionAr"='بالتكامل y=4x²+5، فالقيمة 69.' AND "DetailedSolutionEn"='Integrate y=4x²+5, giving 69.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=361 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=361
  AND o."Id"=1433 AND o."IsCorrect" AND o."LatexCode"='69');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 361 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة تكامل القوى: ∫x dx = x²/2. إذا كانت y′ = 10x، فإن y = (10/2)x² + C = 5x² + C. من y(0) = 6 نحصل على C = 6. بالتعويض x = 5: ‏y(5) = 5 × 5² + 6 = 131. التحقق: المشتقة y′ = 10x.', "DetailedSolutionEn" = 'Power integration rule: ∫x dx = x²/2. Given y′ = 10x, integrate to y = (10/2)x² + C = 5x² + C. Use y(0) = 6 to find C = 6. Then y(5) = 5 × 5² + 6 = 131. Differentiating yields y′ = 10x.'
 WHERE "Id"=373 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=10x\) و\(y(0)=6\)، أوجد \(y(5)\).' AND "QuestionTextEn"='Given \(y''=10x\), \(y(0)=6\), find \(y(5)\).'
 AND "DetailedSolutionAr"='بالتكامل y=5x²+6، فالقيمة 131.' AND "DetailedSolutionEn"='Integrate y=5x²+6, giving 131.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=373 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=373
  AND o."Id"=1484 AND o."IsCorrect" AND o."LatexCode"='131');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 373 original question/answer changed; abort entire batch'; END IF;
 UPDATE public."Problems" SET
 "DetailedSolutionAr" = 'قاعدة تكامل القوى: ∫x dx = x²/2. إذا كانت y′ = 12x، فإن y = (12/2)x² + C = 6x² + C. من y(0) = 7 نحصل على C = 7. بالتعويض x = 6: ‏y(6) = 6 × 6² + 7 = 223. التحقق: المشتقة y′ = 12x.', "DetailedSolutionEn" = 'Power integration rule: ∫x dx = x²/2. Given y′ = 12x, integrate to y = (12/2)x² + C = 6x² + C. Use y(0) = 7 to find C = 7. Then y(6) = 6 × 6² + 7 = 223. Differentiating yields y′ = 12x.'
 WHERE "Id"=385 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا \(y''=12x\) و\(y(0)=7\)، أوجد \(y(6)\).' AND "QuestionTextEn"='Given \(y''=12x\), \(y(0)=7\), find \(y(6)\).'
 AND "DetailedSolutionAr"='بالتكامل y=6x²+7، فالقيمة 223.' AND "DetailedSolutionEn"='Integrate y=6x²+7, giving 223.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=385 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=385
  AND o."Id"=1531 AND o."IsCorrect" AND o."LatexCode"='223');
 GET DIAGNOSTICS changed = ROW_COUNT;
 IF changed<>1 THEN RAISE EXCEPTION 'ODE 385 original question/answer changed; abort entire batch'; END IF;
END $mw_ode_review$;
COMMIT;
