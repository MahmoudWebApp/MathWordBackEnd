-- One-time guarded 3-row university law clarification; no answer or student-state changes.
BEGIN;
DO $mw_final_uni$
DECLARE n integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التعامد بين متجهين: يكون حاصل الضرب النقطي صفراً. للمتجهين (k، 2) و(3، −6) نحسب (k،2) · (3،−6) = 3k + 2 × (−6) = 3k − 12. نساوي الناتج بالصفر: 3k − 12 = 0، إذن 3k = 12 ومنها k = 4. التحقق: 3 × 4 − 12 = 0.',"DetailedSolutionEn"='Orthogonality rule: Two vectors are perpendicular exactly when their dot product is zero. For (k,2) and (3,−6), compute 3k + 2(−6) = 3k − 12. Solve 3k − 12 = 0 to obtain k = 4. Check: 3 × 4 − 12 = 0.'
 WHERE "Id"=647 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='المتجهان (k، 2) و(3، −6) متعامدان. ما قيمة k؟' AND "QuestionTextEn"='Vectors (k, 2) and (3, −6) are perpendicular. What is k?'
 AND "DetailedSolutionAr"='شرط التعامد: 3k + 2(−6) = 0، أي 3k = 12، فتكون k = 4.' AND "DetailedSolutionEn"='Orthogonality requires 3k + 2(−6) = 0, hence 3k = 12 and k = 4.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=647 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=647 AND o."Id"=2579 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS n=ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'University explanation % stale; abort',647; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='شرط الاستمرارية عند نقطة الفصل x = 2: النهاية اليسرى تساوي النهاية اليمنى وقيمة الدالة f(2). من الفرع الأيسر lim(x→2⁻)(kx+1) = 2k + 1. ومن الفرع الأيمن f(2) = 2² = 4. لذلك 2k + 1 = 4، ومنها 2k = 3 وk = 3/2. التحقق: 2 × (3/2) + 1 = 4.',"DetailedSolutionEn"='Continuity at x = 2 requires the left-hand limit, right-hand limit, and f(2) to agree. From the first branch the left limit is 2k + 1. From the second branch f(2) = 2² = 4. Set 2k + 1 = 4, giving 2k = 3 and k = 3/2. Check: 2(3/2) + 1 = 4.'
 WHERE "Id"=797 AND "StageId"=4 AND "CategoryId"=16
 AND "QuestionTextAr"='لتكن f(x)=kx+1 إذا x<2، وf(x)=x² إذا x≥2. ما قيمة k التي تجعل f متصلة عند x=2؟' AND "QuestionTextEn"='Let f(x)=kx+1 for x<2, and f(x)=x² for x≥2. Which k makes f continuous at x=2?'
 AND "DetailedSolutionAr"='نساوي النهاية اليسرى 2k+1 بالقيمة اليمنى f(2)=4؛ فنجد 2k=3 وk=3/2.' AND "DetailedSolutionEn"='Set left limit 2k+1 equal to f(2)=4: 2k=3 and k=3/2.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=797 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=797 AND o."Id"=3179 AND o."IsCorrect" AND o."LatexCode"='\frac32');
 GET DIAGNOSTICS n=ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'University explanation % stale; abort',797; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المعادلة التفاضلية y′ = ay: حلها العام y = Ce^(ax)، لأن مشتقة Ce^(ax) تساوي aCe^(ax). عند a = 2 يصبح y = Ce^(2x). الشرط الابتدائي y(0) = 3 يعني C = 3، ولذلك y(1) = 3e^(2×1) = 3e². التحقق: y′ = 2y وy(0) = 3.',"DetailedSolutionEn"='Rule: The differential equation y′ = ay has general solution y = Ce^(ax), because its derivative is aCe^(ax). With a = 2, y = Ce^(2x). The initial condition y(0) = 3 gives C = 3. Hence y(1) = 3e^(2×1) = 3e². Check that y′ = 2y and y(0) = 3.'
 WHERE "Id"=864 AND "StageId"=4 AND "CategoryId"=15
 AND "QuestionTextAr"='إذا كان y''=2y وy(0)=3، فما y(1)؟' AND "QuestionTextEn"='For y''=2y and y(0)=3, what is y(1)?'
 AND "DetailedSolutionAr"='الحل العام y=Ce^(2x)، وبشرط البداية C=3، لذا y(1)=3e².' AND "DetailedSolutionEn"='The general solution is y=Ce^(2x); y(0)=3 gives C=3, so y(1)=3e².'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=864 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=864 AND o."Id"=3449 AND o."IsCorrect" AND o."LatexCode"='3e^2');
 GET DIAGNOSTICS n=ROW_COUNT;
 IF n<>1 THEN RAISE EXCEPTION 'University explanation % stale; abort',864; END IF;
END $mw_final_uni$;
COMMIT;
