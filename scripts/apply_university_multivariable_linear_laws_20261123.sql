-- Individually reviewed 45 university multivariable-calculus and linear-algebra solutions.
-- One-time atomic explanation-only update; original bilingual question, solution and correct option guarded.
BEGIN;
DO $mw_university_multivariable_linear$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الجزئية: عند اشتقاق دالة بالنسبة إلى س نعامل ص كثابت. للدالة f(س،ص) = س²ص + 3ص تكون ∂f/∂س = 2سص، لأن مشتقة 3ص بالنسبة لس تساوي صفراً. عند النقطة (2،1) نحسب 2 × 2 × 1 = 4.', "DetailedSolutionEn"='Partial derivative rule: When differentiating with respect to x, treat y as constant. For f(x,y)=x²y+3y, ∂f/∂x=2xy because 3y has zero x-derivative. At (2,1), substitute 2×2×1=4.'
 WHERE "Id"=49 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت f(x,y) = x²y + 3y، فما قيمة المشتقة الجزئية بالنسبة إلى x عند (2,1)؟' AND "QuestionTextEn"='For f(x,y) = x²y + 3y, evaluate the partial derivative with respect to x at (2,1).'
 AND "DetailedSolutionAr"='المشتقة الجزئية بالنسبة إلى x هي 2xy؛ بالتعويض (2,1) نحصل على 2 × 2 × 1 = 4.' AND "DetailedSolutionEn"='The partial derivative with respect to x is 2xy. At (2,1), it equals 4.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=49 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=49 AND o."Id"=185
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 49 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون متجه التدرج للدالة ذات متغيرين: ∇f = (∂f/∂س، ∂f/∂ص). للدالة f(س،ص) = س² + ص² نحصل على ∂f/∂س = 2س و∂f/∂ص = 2ص. عند (1،2) تكون المركبتان (2 × 1، 2 × 2) = (2،4).', "DetailedSolutionEn"='Gradient rule: ∇f=(∂f/∂x,∂f/∂y). For f(x,y)=x²+y², the partial derivatives are 2x and 2y. At (1,2), evaluate (2×1,2×2)=(2,4).'
 WHERE "Id"=65 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت f(x,y) = x² + y²، فما متجه التدرج عند النقطة (1,2)؟' AND "QuestionTextEn"='For f(x,y) = x² + y², what is its gradient at (1,2)?'
 AND "DetailedSolutionAr"='متجه التدرج يساوي (2x, 2y)، وعند (1,2) يساوي (2,4).' AND "DetailedSolutionEn"='The gradient is (2x, 2y), which at (1,2) equals (2,4).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=65 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=65 AND o."Id"=250
 AND o."IsCorrect" AND o."LatexCode"='(2,4)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 65 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الاشتقاق الجزئي: عند اشتقاق f(س،ص) = 2س²ص + 1ص² بالنسبة إلى س نثبت ص، فنحصل على ∂f/∂س = 4سص. حد 1ص² مشتقته صفر بالنسبة لس. عند (2،1) نعوّض 4 × 2 × 1 = 8.', "DetailedSolutionEn"='Partial-derivative power rule: For f(x,y)=2x²y+1y², treat y as constant. Thus ∂f/∂x=4xy; 1y² contributes zero. At (2,1), substitute 4×2×1=8.'
 WHERE "Id"=81 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت \(f(x,y)=2x^2y+1y^2\)، أوجد \(\partial f/\partial x\) عند \((2,1)\).' AND "QuestionTextEn"='For \(f(x,y)=2x^2y+1y^2\), evaluate \(\partial f/\partial x\) at \((2,1)\).'
 AND "DetailedSolutionAr"='نثبت y فنحصل على ∂f/∂x=4xy. بالتعويض نحصل على 8.' AND "DetailedSolutionEn"='Hold y constant: ∂f/∂x=4xy. Substitution gives 8.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=81 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=81 AND o."Id"=316
 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 81 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الاشتقاق الجزئي: عند اشتقاق f(س،ص) = 3س²ص + 2ص² بالنسبة إلى س نثبت ص، فنحصل على ∂f/∂س = 6سص. حد 2ص² مشتقته صفر بالنسبة لس. عند (3،2) نعوّض 6 × 3 × 2 = 36.', "DetailedSolutionEn"='Partial-derivative power rule: For f(x,y)=3x²y+2y², treat y as constant. Thus ∂f/∂x=6xy; 2y² contributes zero. At (3,2), substitute 6×3×2=36.'
 WHERE "Id"=96 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت \(f(x,y)=3x^2y+2y^2\)، أوجد \(\partial f/\partial x\) عند \((3,2)\).' AND "QuestionTextEn"='For \(f(x,y)=3x^2y+2y^2\), evaluate \(\partial f/\partial x\) at \((3,2)\).'
 AND "DetailedSolutionAr"='نثبت y فنحصل على ∂f/∂x=6xy. بالتعويض نحصل على 36.' AND "DetailedSolutionEn"='Hold y constant: ∂f/∂x=6xy. Substitution gives 36.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=96 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=96 AND o."Id"=375
 AND o."IsCorrect" AND o."LatexCode"='36');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 96 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الاشتقاق الجزئي: عند اشتقاق f(س،ص) = 4س²ص + 3ص² بالنسبة إلى س نثبت ص، فنحصل على ∂f/∂س = 8سص. حد 3ص² مشتقته صفر بالنسبة لس. عند (4،3) نعوّض 8 × 4 × 3 = 96.', "DetailedSolutionEn"='Partial-derivative power rule: For f(x,y)=4x²y+3y², treat y as constant. Thus ∂f/∂x=8xy; 3y² contributes zero. At (4,3), substitute 8×4×3=96.'
 WHERE "Id"=111 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت \(f(x,y)=4x^2y+3y^2\)، أوجد \(\partial f/\partial x\) عند \((4,3)\).' AND "QuestionTextEn"='For \(f(x,y)=4x^2y+3y^2\), evaluate \(\partial f/\partial x\) at \((4,3)\).'
 AND "DetailedSolutionAr"='نثبت y فنحصل على ∂f/∂x=8xy. بالتعويض نحصل على 96.' AND "DetailedSolutionEn"='Hold y constant: ∂f/∂x=8xy. Substitution gives 96.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=111 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=111 AND o."Id"=434
 AND o."IsCorrect" AND o."LatexCode"='96');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 111 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الاشتقاق الجزئي: عند اشتقاق f(س،ص) = 5س²ص + 4ص² بالنسبة إلى س نثبت ص، فنحصل على ∂f/∂س = 10سص. حد 4ص² مشتقته صفر بالنسبة لس. عند (5،4) نعوّض 10 × 5 × 4 = 200.', "DetailedSolutionEn"='Partial-derivative power rule: For f(x,y)=5x²y+4y², treat y as constant. Thus ∂f/∂x=10xy; 4y² contributes zero. At (5,4), substitute 10×5×4=200.'
 WHERE "Id"=126 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت \(f(x,y)=5x^2y+4y^2\)، أوجد \(\partial f/\partial x\) عند \((5,4)\).' AND "QuestionTextEn"='For \(f(x,y)=5x^2y+4y^2\), evaluate \(\partial f/\partial x\) at \((5,4)\).'
 AND "DetailedSolutionAr"='نثبت y فنحصل على ∂f/∂x=10xy. بالتعويض نحصل على 200.' AND "DetailedSolutionEn"='Hold y constant: ∂f/∂x=10xy. Substitution gives 200.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=126 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=126 AND o."Id"=493
 AND o."IsCorrect" AND o."LatexCode"='200');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 126 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الاشتقاق الجزئي: عند اشتقاق f(س،ص) = 6س²ص + 5ص² بالنسبة إلى س نثبت ص، فنحصل على ∂f/∂س = 12سص. حد 5ص² مشتقته صفر بالنسبة لس. عند (6،5) نعوّض 12 × 6 × 5 = 360.', "DetailedSolutionEn"='Partial-derivative power rule: For f(x,y)=6x²y+5y², treat y as constant. Thus ∂f/∂x=12xy; 5y² contributes zero. At (6,5), substitute 12×6×5=360.'
 WHERE "Id"=141 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا كانت \(f(x,y)=6x^2y+5y^2\)، أوجد \(\partial f/\partial x\) عند \((6,5)\).' AND "QuestionTextEn"='For \(f(x,y)=6x^2y+5y^2\), evaluate \(\partial f/\partial x\) at \((6,5)\).'
 AND "DetailedSolutionAr"='نثبت y فنحصل على ∂f/∂x=12xy. بالتعويض نحصل على 360.' AND "DetailedSolutionEn"='Hold y constant: ∂f/∂x=12xy. Substitution gives 360.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=141 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=141 AND o."Id"=556
 AND o."IsCorrect" AND o."LatexCode"='360');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 141 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الجزئية بالنسبة إلى ص: نعامل س كثابت. للدالة f(س،ص) = 2س²ص + 1ص² نجد ∂f/∂ص = 2س² + 2ص. عند (2،3) نحسب 2 × 2² + 2 × 3 = 8 + 6 = 14.', "DetailedSolutionEn"='Partial derivative with respect to y: Treat x as constant. For f(x,y)=2x²y+1y², ∂f/∂y=2x²+2y. At (2,3), calculate 2×2²+2×3=8+6=14.'
 WHERE "Id"=329 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا \(f(x,y)=2x^2y+1y^2\)، أوجد \(\partial f/\partial y\) عند (2،3).' AND "QuestionTextEn"='Given \(f(x,y)=2x^2y+1y^2\), evaluate \(\partial f/\partial y\) at (2,3).'
 AND "DetailedSolutionAr"='المشتقة الجزئية=2x²+2y، وبالتعويض 14.' AND "DetailedSolutionEn"='Partial derivative=2x²+2y; evaluating gives 14.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=329 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=329 AND o."Id"=1307
 AND o."IsCorrect" AND o."LatexCode"='14');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 329 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التدرج: ∇f(س،ص) = (∂f/∂س،∂f/∂ص). للدالة f(س،ص) = س² + ص²، التدرج هو (2س،2ص). عند النقطة (2،3) تصبح المركبتان (2 × 2،2 × 3) = (4،6). هذا متجه وليس عدداً واحداً.', "DetailedSolutionEn"='Gradient rule: ∇f=(∂f/∂x,∂f/∂y). For f(x,y)=x²+y², ∇f=(2x,2y). At (2,3), the result is (2×2,2×3)=(4,6). A gradient is a vector, not a scalar.'
 WHERE "Id"=330 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='ما تدرج \(f(x,y)=x^2+y^2\) عند النقطة (2،3)؟' AND "QuestionTextEn"='Find gradient of \(f(x,y)=x^2+y^2\) at (2,3).'
 AND "DetailedSolutionAr"='التدرج=(2x,2y)، أي (4,6).' AND "DetailedSolutionEn"='Gradient=(2x,2y), so (4,6).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=330 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=330 AND o."Id"=1310
 AND o."IsCorrect" AND o."LatexCode"='(4,6)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 330 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الاتجاهية في اتجاه وحدة u: Dᵤf = ∇f · u. للدالة f(س،ص) = س² + 3ص² يكون ∇f = (2س،6ص). اتجاه س الموجب يساوي متجه الوحدة u=(1،0)، لذا Dᵤf = 2س × 1 + 6ص × 0 = 2س. عند (1،2) الناتج 2.', "DetailedSolutionEn"='Directional derivative: D_u f = ∇f · u for a unit direction u. For f(x,y)=x²+3y², ∇f=(2x,6y). The positive x-direction is u=(1,0), so D_u f=2x×1+6y×0=2x. At (1,2), this equals 2.'
 WHERE "Id"=331 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='لدالة \(f(x,y)=x^2+3y^2\)، احسب المشتقة الاتجاهية عند (1،2) باتجاه محور x الموجب.' AND "QuestionTextEn"='For \(f(x,y)=x^2+3y^2\), find directional derivative at (1,2) in positive x-direction.'
 AND "DetailedSolutionAr"='الاتجاه (1,0) والمشتقة الاتجاهية هي ∂f/∂x=2x=2.' AND "DetailedSolutionEn"='Direction (1,0); derivative equals ∂f/∂x=2x=2.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=331 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=331 AND o."Id"=1313
 AND o."IsCorrect" AND o."LatexCode"='2');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 331 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الجزئية بالنسبة إلى ص: نعامل س كثابت. للدالة f(س،ص) = 3س²ص + 2ص² نجد ∂f/∂ص = 3س² + 4ص. عند (3،4) نحسب 3 × 3² + 4 × 4 = 27 + 16 = 43.', "DetailedSolutionEn"='Partial derivative with respect to y: Treat x as constant. For f(x,y)=3x²y+2y², ∂f/∂y=3x²+4y. At (3,4), calculate 3×3²+4×4=27+16=43.'
 WHERE "Id"=341 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا \(f(x,y)=3x^2y+2y^2\)، أوجد \(\partial f/\partial y\) عند (3،4).' AND "QuestionTextEn"='Given \(f(x,y)=3x^2y+2y^2\), evaluate \(\partial f/\partial y\) at (3,4).'
 AND "DetailedSolutionAr"='المشتقة الجزئية=3x²+4y، وبالتعويض 43.' AND "DetailedSolutionEn"='Partial derivative=3x²+4y; evaluating gives 43.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=341 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=341 AND o."Id"=1354
 AND o."IsCorrect" AND o."LatexCode"='43');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 341 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التدرج: ∇f(س،ص) = (∂f/∂س،∂f/∂ص). للدالة f(س،ص) = س² + ص²، التدرج هو (2س،2ص). عند النقطة (3،4) تصبح المركبتان (2 × 3،2 × 4) = (6،8). هذا متجه وليس عدداً واحداً.', "DetailedSolutionEn"='Gradient rule: ∇f=(∂f/∂x,∂f/∂y). For f(x,y)=x²+y², ∇f=(2x,2y). At (3,4), the result is (2×3,2×4)=(6,8). A gradient is a vector, not a scalar.'
 WHERE "Id"=342 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='ما تدرج \(f(x,y)=x^2+y^2\) عند النقطة (3،4)؟' AND "QuestionTextEn"='Find gradient of \(f(x,y)=x^2+y^2\) at (3,4).'
 AND "DetailedSolutionAr"='التدرج=(2x,2y)، أي (6,8).' AND "DetailedSolutionEn"='Gradient=(2x,2y), so (6,8).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=342 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=342 AND o."Id"=1357
 AND o."IsCorrect" AND o."LatexCode"='(6,8)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 342 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الاتجاهية في اتجاه وحدة u: Dᵤf = ∇f · u. للدالة f(س،ص) = س² + 3ص² يكون ∇f = (2س،6ص). اتجاه س الموجب يساوي متجه الوحدة u=(1،0)، لذا Dᵤf = 2س × 1 + 6ص × 0 = 2س. عند (2،3) الناتج 4.', "DetailedSolutionEn"='Directional derivative: D_u f = ∇f · u for a unit direction u. For f(x,y)=x²+3y², ∇f=(2x,6y). The positive x-direction is u=(1,0), so D_u f=2x×1+6y×0=2x. At (2,3), this equals 4.'
 WHERE "Id"=343 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='لدالة \(f(x,y)=x^2+3y^2\)، احسب المشتقة الاتجاهية عند (2،3) باتجاه محور x الموجب.' AND "QuestionTextEn"='For \(f(x,y)=x^2+3y^2\), find directional derivative at (2,3) in positive x-direction.'
 AND "DetailedSolutionAr"='الاتجاه (1,0) والمشتقة الاتجاهية هي ∂f/∂x=2x=4.' AND "DetailedSolutionEn"='Direction (1,0); derivative equals ∂f/∂x=2x=4.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=343 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=343 AND o."Id"=1364
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 343 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الجزئية بالنسبة إلى ص: نعامل س كثابت. للدالة f(س،ص) = 4س²ص + 3ص² نجد ∂f/∂ص = 4س² + 6ص. عند (4،5) نحسب 4 × 4² + 6 × 5 = 64 + 30 = 94.', "DetailedSolutionEn"='Partial derivative with respect to y: Treat x as constant. For f(x,y)=4x²y+3y², ∂f/∂y=4x²+6y. At (4,5), calculate 4×4²+6×5=64+30=94.'
 WHERE "Id"=353 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا \(f(x,y)=4x^2y+3y^2\)، أوجد \(\partial f/\partial y\) عند (4،5).' AND "QuestionTextEn"='Given \(f(x,y)=4x^2y+3y^2\), evaluate \(\partial f/\partial y\) at (4,5).'
 AND "DetailedSolutionAr"='المشتقة الجزئية=4x²+6y، وبالتعويض 94.' AND "DetailedSolutionEn"='Partial derivative=4x²+6y; evaluating gives 94.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=353 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=353 AND o."Id"=1401
 AND o."IsCorrect" AND o."LatexCode"='94');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 353 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التدرج: ∇f(س،ص) = (∂f/∂س،∂f/∂ص). للدالة f(س،ص) = س² + ص²، التدرج هو (2س،2ص). عند النقطة (4،5) تصبح المركبتان (2 × 4،2 × 5) = (8،10). هذا متجه وليس عدداً واحداً.', "DetailedSolutionEn"='Gradient rule: ∇f=(∂f/∂x,∂f/∂y). For f(x,y)=x²+y², ∇f=(2x,2y). At (4,5), the result is (2×4,2×5)=(8,10). A gradient is a vector, not a scalar.'
 WHERE "Id"=354 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='ما تدرج \(f(x,y)=x^2+y^2\) عند النقطة (4،5)؟' AND "QuestionTextEn"='Find gradient of \(f(x,y)=x^2+y^2\) at (4,5).'
 AND "DetailedSolutionAr"='التدرج=(2x,2y)، أي (8,10).' AND "DetailedSolutionEn"='Gradient=(2x,2y), so (8,10).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=354 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=354 AND o."Id"=1408
 AND o."IsCorrect" AND o."LatexCode"='(8,10)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 354 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الاتجاهية في اتجاه وحدة u: Dᵤf = ∇f · u. للدالة f(س،ص) = س² + 3ص² يكون ∇f = (2س،6ص). اتجاه س الموجب يساوي متجه الوحدة u=(1،0)، لذا Dᵤf = 2س × 1 + 6ص × 0 = 2س. عند (3،4) الناتج 6.', "DetailedSolutionEn"='Directional derivative: D_u f = ∇f · u for a unit direction u. For f(x,y)=x²+3y², ∇f=(2x,6y). The positive x-direction is u=(1,0), so D_u f=2x×1+6y×0=2x. At (3,4), this equals 6.'
 WHERE "Id"=355 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='لدالة \(f(x,y)=x^2+3y^2\)، احسب المشتقة الاتجاهية عند (3،4) باتجاه محور x الموجب.' AND "QuestionTextEn"='For \(f(x,y)=x^2+3y^2\), find directional derivative at (3,4) in positive x-direction.'
 AND "DetailedSolutionAr"='الاتجاه (1,0) والمشتقة الاتجاهية هي ∂f/∂x=2x=6.' AND "DetailedSolutionEn"='Direction (1,0); derivative equals ∂f/∂x=2x=6.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=355 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=355 AND o."Id"=1411
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 355 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الجزئية بالنسبة إلى ص: نعامل س كثابت. للدالة f(س،ص) = 5س²ص + 4ص² نجد ∂f/∂ص = 5س² + 8ص. عند (5،6) نحسب 5 × 5² + 8 × 6 = 125 + 48 = 173.', "DetailedSolutionEn"='Partial derivative with respect to y: Treat x as constant. For f(x,y)=5x²y+4y², ∂f/∂y=5x²+8y. At (5,6), calculate 5×5²+8×6=125+48=173.'
 WHERE "Id"=365 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا \(f(x,y)=5x^2y+4y^2\)، أوجد \(\partial f/\partial y\) عند (5،6).' AND "QuestionTextEn"='Given \(f(x,y)=5x^2y+4y^2\), evaluate \(\partial f/\partial y\) at (5,6).'
 AND "DetailedSolutionAr"='المشتقة الجزئية=5x²+8y، وبالتعويض 173.' AND "DetailedSolutionEn"='Partial derivative=5x²+8y; evaluating gives 173.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=365 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=365 AND o."Id"=1452
 AND o."IsCorrect" AND o."LatexCode"='173');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 365 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التدرج: ∇f(س،ص) = (∂f/∂س،∂f/∂ص). للدالة f(س،ص) = س² + ص²، التدرج هو (2س،2ص). عند النقطة (5،6) تصبح المركبتان (2 × 5،2 × 6) = (10،12). هذا متجه وليس عدداً واحداً.', "DetailedSolutionEn"='Gradient rule: ∇f=(∂f/∂x,∂f/∂y). For f(x,y)=x²+y², ∇f=(2x,2y). At (5,6), the result is (2×5,2×6)=(10,12). A gradient is a vector, not a scalar.'
 WHERE "Id"=366 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='ما تدرج \(f(x,y)=x^2+y^2\) عند النقطة (5،6)؟' AND "QuestionTextEn"='Find gradient of \(f(x,y)=x^2+y^2\) at (5,6).'
 AND "DetailedSolutionAr"='التدرج=(2x,2y)، أي (10,12).' AND "DetailedSolutionEn"='Gradient=(2x,2y), so (10,12).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=366 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=366 AND o."Id"=1455
 AND o."IsCorrect" AND o."LatexCode"='(10,12)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 366 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الاتجاهية في اتجاه وحدة u: Dᵤf = ∇f · u. للدالة f(س،ص) = س² + 3ص² يكون ∇f = (2س،6ص). اتجاه س الموجب يساوي متجه الوحدة u=(1،0)، لذا Dᵤf = 2س × 1 + 6ص × 0 = 2س. عند (4،5) الناتج 8.', "DetailedSolutionEn"='Directional derivative: D_u f = ∇f · u for a unit direction u. For f(x,y)=x²+3y², ∇f=(2x,6y). The positive x-direction is u=(1,0), so D_u f=2x×1+6y×0=2x. At (4,5), this equals 8.'
 WHERE "Id"=367 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='لدالة \(f(x,y)=x^2+3y^2\)، احسب المشتقة الاتجاهية عند (4،5) باتجاه محور x الموجب.' AND "QuestionTextEn"='For \(f(x,y)=x^2+3y^2\), find directional derivative at (4,5) in positive x-direction.'
 AND "DetailedSolutionAr"='الاتجاه (1,0) والمشتقة الاتجاهية هي ∂f/∂x=2x=8.' AND "DetailedSolutionEn"='Direction (1,0); derivative equals ∂f/∂x=2x=8.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=367 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=367 AND o."Id"=1458
 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 367 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الجزئية بالنسبة إلى ص: نعامل س كثابت. للدالة f(س،ص) = 6س²ص + 5ص² نجد ∂f/∂ص = 6س² + 10ص. عند (6،7) نحسب 6 × 6² + 10 × 7 = 216 + 70 = 286.', "DetailedSolutionEn"='Partial derivative with respect to y: Treat x as constant. For f(x,y)=6x²y+5y², ∂f/∂y=6x²+10y. At (6,7), calculate 6×6²+10×7=216+70=286.'
 WHERE "Id"=377 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='إذا \(f(x,y)=6x^2y+5y^2\)، أوجد \(\partial f/\partial y\) عند (6،7).' AND "QuestionTextEn"='Given \(f(x,y)=6x^2y+5y^2\), evaluate \(\partial f/\partial y\) at (6,7).'
 AND "DetailedSolutionAr"='المشتقة الجزئية=6x²+10y، وبالتعويض 286.' AND "DetailedSolutionEn"='Partial derivative=6x²+10y; evaluating gives 286.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=377 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=377 AND o."Id"=1499
 AND o."IsCorrect" AND o."LatexCode"='286');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 377 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التدرج: ∇f(س،ص) = (∂f/∂س،∂f/∂ص). للدالة f(س،ص) = س² + ص²، التدرج هو (2س،2ص). عند النقطة (6،7) تصبح المركبتان (2 × 6،2 × 7) = (12،14). هذا متجه وليس عدداً واحداً.', "DetailedSolutionEn"='Gradient rule: ∇f=(∂f/∂x,∂f/∂y). For f(x,y)=x²+y², ∇f=(2x,2y). At (6,7), the result is (2×6,2×7)=(12,14). A gradient is a vector, not a scalar.'
 WHERE "Id"=378 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='ما تدرج \(f(x,y)=x^2+y^2\) عند النقطة (6،7)؟' AND "QuestionTextEn"='Find gradient of \(f(x,y)=x^2+y^2\) at (6,7).'
 AND "DetailedSolutionAr"='التدرج=(2x,2y)، أي (12,14).' AND "DetailedSolutionEn"='Gradient=(2x,2y), so (12,14).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=378 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=378 AND o."Id"=1502
 AND o."IsCorrect" AND o."LatexCode"='(12,14)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 378 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المشتقة الاتجاهية في اتجاه وحدة u: Dᵤf = ∇f · u. للدالة f(س،ص) = س² + 3ص² يكون ∇f = (2س،6ص). اتجاه س الموجب يساوي متجه الوحدة u=(1،0)، لذا Dᵤf = 2س × 1 + 6ص × 0 = 2س. عند (5،6) الناتج 10.', "DetailedSolutionEn"='Directional derivative: D_u f = ∇f · u for a unit direction u. For f(x,y)=x²+3y², ∇f=(2x,6y). The positive x-direction is u=(1,0), so D_u f=2x×1+6y×0=2x. At (5,6), this equals 10.'
 WHERE "Id"=379 AND "StageId"=4 AND "CategoryId"=13
 AND "QuestionTextAr"='لدالة \(f(x,y)=x^2+3y^2\)، احسب المشتقة الاتجاهية عند (5،6) باتجاه محور x الموجب.' AND "QuestionTextEn"='For \(f(x,y)=x^2+3y^2\), find directional derivative at (5,6) in positive x-direction.'
 AND "DetailedSolutionAr"='الاتجاه (1,0) والمشتقة الاتجاهية هي ∂f/∂x=2x=10.' AND "DetailedSolutionEn"='Direction (1,0); derivative equals ∂f/∂x=2x=10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=379 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=379 AND o."Id"=1505
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 379 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد مصفوفة 2×2: إذا كانت A = [[أ،ب],[ج،د]]، فإن det(A) = أ×د − ب×ج. للمصفوفة [[2،3],[1،4]] نحسب المحدد = 2×4 − 3×1 = 8 − 3 = 5. لا نجمع العنصرين القطريين، فهذا تعريف الأثر لا المحدد.', "DetailedSolutionEn"='Determinant of a 2×2 matrix [[a,b],[c,d]] is ad−bc. For [[2,3],[1,4]], compute det = 2×4 − 3×1 = 8 − 3 = 5. Summing diagonal entries would compute the trace, not the determinant.'
 WHERE "Id"=30 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='أوجد محدد (Determinant) المصفوفة $A = \begin{pmatrix} 2 & 3 \\ 1 & 4 \end{pmatrix}$.' AND "QuestionTextEn"='Find the determinant of the matrix $A = \begin{pmatrix} 2 & 3 \\ 1 & 4 \end{pmatrix}$.'
 AND "DetailedSolutionAr"='المحدد $= (2)(4) - (3)(1) = 8 - 3 = 5$.' AND "DetailedSolutionEn"='Determinant $= (2)(4) - (3)(1) = 8 - 3 = 5$.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=30 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=30 AND o."Id"=109
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 30 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد 2×2 هو ضرب القطر الرئيسي وطرح ضرب القطر المقابل. مصفوفة الصفين (2،1) و(3،4) هي [[2،1],[3،4]]. بالتعويض: det = (2×4) − (1×3) = 8 − 3 = 5. الإشارة ناقص بين حاصلَي الضرب ضرورية.', "DetailedSolutionEn"='For a 2×2 matrix, determinant = main diagonal product − other diagonal product. Rows (2,1) and (3,4) form [[2,1],[3,4]]. Substitute det = (2×4) − (1×3) = 8 − 3 = 5; the subtraction matters.'
 WHERE "Id"=50 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما محدد المصفوفة ذات الصفين (2,1) و(3,4)؟' AND "QuestionTextEn"='Find the determinant of the 2x2 matrix with rows (2,1) and (3,4).'
 AND "DetailedSolutionAr"='محدد المصفوفة = (2 × 4) - (1 × 3) = 8 - 3 = 5.' AND "DetailedSolutionEn"='The determinant is (2 × 4) - (1 × 3) = 8 - 3 = 5.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=50 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=50 AND o."Id"=190
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 50 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الضرب النقطي لمتجهين: (أ،ب) · (ج،د) = أج + بد، أي نضرب المركبات المتناظرة ثم نجمع. للمتجهين (1،2) و(3،4)، الناتج = 1×3 + 2×4 = 3 + 8 = 11. الضرب النقطي قيمة عددية، وليس متجهاً.', "DetailedSolutionEn"='Dot-product rule: (a,b)·(c,d)=ac+bd. Multiply corresponding components and add. For (1,2) and (3,4), compute 1×3 + 2×4 = 3 + 8 = 11. A dot product is scalar, not a vector.'
 WHERE "Id"=66 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما الضرب القياسي للمتجهين (1,2) و(3,4)؟' AND "QuestionTextEn"='What is the dot product of vectors (1,2) and (3,4)?'
 AND "DetailedSolutionAr"='الضرب القياسي = 1 × 3 + 2 × 4 = 3 + 8 = 11.' AND "DetailedSolutionEn"='The dot product is 1 × 3 + 2 × 4 = 11.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=66 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=66 AND o."Id"=255
 AND o."IsCorrect" AND o."LatexCode"='11');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 66 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد المصفوفة [[أ،ب],[ج،د]] هو det = أ×د − ب×ج. للمصفوفة [[2،1],[2،4]] نضرب القطر الرئيسي 2×4=8 ثم القطر الآخر 1×2=2. نطرح: det = 8 − 2 = 6.', "DetailedSolutionEn"='Determinant formula for [[a,b],[c,d]] is ad−bc. In [[2,1],[2,4]], the main diagonal product is 2×4=8; the other product is 1×2=2. Subtract: det = 8−2=6.'
 WHERE "Id"=82 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='احسب محدد المصفوفة \(\begin{pmatrix}2&1\\2&4\end{pmatrix}\).' AND "QuestionTextEn"='Compute the determinant of \(\begin{pmatrix}2&1\\2&4\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المحدد = ad−bc=2×4−1×2=6.' AND "DetailedSolutionEn"='Determinant = ad−bc=2×4−1×2=6.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=82 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=82 AND o."Id"=319
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 82 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد المصفوفة [[أ،ب],[ج،د]] هو det = أ×د − ب×ج. للمصفوفة [[3،2],[2،5]] نضرب القطر الرئيسي 3×5=15 ثم القطر الآخر 2×2=4. نطرح: det = 15 − 4 = 11.', "DetailedSolutionEn"='Determinant formula for [[a,b],[c,d]] is ad−bc. In [[3,2],[2,5]], the main diagonal product is 3×5=15; the other product is 2×2=4. Subtract: det = 15−4=11.'
 WHERE "Id"=97 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='احسب محدد المصفوفة \(\begin{pmatrix}3&2\\2&5\end{pmatrix}\).' AND "QuestionTextEn"='Compute the determinant of \(\begin{pmatrix}3&2\\2&5\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المحدد = ad−bc=3×5−2×2=11.' AND "DetailedSolutionEn"='Determinant = ad−bc=3×5−2×2=11.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=97 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=97 AND o."Id"=378
 AND o."IsCorrect" AND o."LatexCode"='11');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 97 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد المصفوفة [[أ،ب],[ج،د]] هو det = أ×د − ب×ج. للمصفوفة [[4،3],[2،6]] نضرب القطر الرئيسي 4×6=24 ثم القطر الآخر 3×2=6. نطرح: det = 24 − 6 = 18.', "DetailedSolutionEn"='Determinant formula for [[a,b],[c,d]] is ad−bc. In [[4,3],[2,6]], the main diagonal product is 4×6=24; the other product is 3×2=6. Subtract: det = 24−6=18.'
 WHERE "Id"=112 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='احسب محدد المصفوفة \(\begin{pmatrix}4&3\\2&6\end{pmatrix}\).' AND "QuestionTextEn"='Compute the determinant of \(\begin{pmatrix}4&3\\2&6\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المحدد = ad−bc=4×6−3×2=18.' AND "DetailedSolutionEn"='Determinant = ad−bc=4×6−3×2=18.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=112 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=112 AND o."Id"=437
 AND o."IsCorrect" AND o."LatexCode"='18');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 112 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد المصفوفة [[أ،ب],[ج،د]] هو det = أ×د − ب×ج. للمصفوفة [[5،4],[2،7]] نضرب القطر الرئيسي 5×7=35 ثم القطر الآخر 4×2=8. نطرح: det = 35 − 8 = 27.', "DetailedSolutionEn"='Determinant formula for [[a,b],[c,d]] is ad−bc. In [[5,4],[2,7]], the main diagonal product is 5×7=35; the other product is 4×2=8. Subtract: det = 35−8=27.'
 WHERE "Id"=127 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='احسب محدد المصفوفة \(\begin{pmatrix}5&4\\2&7\end{pmatrix}\).' AND "QuestionTextEn"='Compute the determinant of \(\begin{pmatrix}5&4\\2&7\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المحدد = ad−bc=5×7−4×2=27.' AND "DetailedSolutionEn"='Determinant = ad−bc=5×7−4×2=27.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=127 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=127 AND o."Id"=500
 AND o."IsCorrect" AND o."LatexCode"='27');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 127 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون محدد المصفوفة [[أ،ب],[ج،د]] هو det = أ×د − ب×ج. للمصفوفة [[6،5],[2،8]] نضرب القطر الرئيسي 6×8=48 ثم القطر الآخر 5×2=10. نطرح: det = 48 − 10 = 38.', "DetailedSolutionEn"='Determinant formula for [[a,b],[c,d]] is ad−bc. In [[6,5],[2,8]], the main diagonal product is 6×8=48; the other product is 5×2=10. Subtract: det = 48−10=38.'
 WHERE "Id"=142 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='احسب محدد المصفوفة \(\begin{pmatrix}6&5\\2&8\end{pmatrix}\).' AND "QuestionTextEn"='Compute the determinant of \(\begin{pmatrix}6&5\\2&8\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المحدد = ad−bc=6×8−5×2=38.' AND "DetailedSolutionEn"='Determinant = ad−bc=6×8−5×2=38.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=142 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=142 AND o."Id"=559
 AND o."IsCorrect" AND o."LatexCode"='38');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 142 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف أثر المصفوفة المربعة tr(A): مجموع عناصر القطر الرئيسي من أعلى اليسار إلى أسفل اليمين. المصفوفة المعطاة قطرها الرئيسي 2 و4، لذا tr(A) = 2 + 4 = 6. لا نخلط بين الأثر والمحدد، فالعمليتان مختلفتان.', "DetailedSolutionEn"='Trace of a square matrix is the sum of its main diagonal entries. Here the main diagonal contains 2 and 4, so tr(A) = 2 + 4 = 6. The trace is not the determinant.'
 WHERE "Id"=332 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما أثر المصفوفة \(\begin{pmatrix}2&0\\0&4\end{pmatrix}\)؟' AND "QuestionTextEn"='Find trace of \(\begin{pmatrix}2&0\\0&4\end{pmatrix}\).'
 AND "DetailedSolutionAr"='الأثر مجموع عناصر القطر 2+4=6.' AND "DetailedSolutionEn"='Trace is diagonal sum 2+4=6.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=332 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=332 AND o."Id"=1318
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 332 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ضرب المتجه بعدد حقيقي: k(أ،ب) = (kأ، kب). عند ضرب المتجه (3،4) في العدد 2 نضرب كل مركبة مستقلة: (2×3، 2×4) = (6،8). لا نجمع المركبتين، لأن الناتج متجه ذو مركبتين.', "DetailedSolutionEn"='Scalar-vector multiplication: k(a,b)=(ka,kb). Multiplying (3,4) by 2 scales each component: (2×3,2×4)=(6,8). The result remains a two-component vector.'
 WHERE "Id"=333 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='اضرب المتجه (3،4) بالعدد 2.' AND "QuestionTextEn"='Multiply vector (3,4) by scalar 2.'
 AND "DetailedSolutionAr"='نضرب كل مركبة: (6,8).' AND "DetailedSolutionEn"='Multiply each coordinate: (6,8).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=333 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=333 AND o."Id"=1321
 AND o."IsCorrect" AND o."LatexCode"='(6,8)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 333 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة المحدد للمصفوفة المثلثية: حاصل ضرب عناصر القطر الرئيسي. للمصفوفة [[2،3],[0،5]] نحسب det = 2×5 − 3×0 = 2×5 = 10. وجود صفر تحت القطر يبسط القانون، فلا تسهم القيمة 3 في الحد المطروح.', "DetailedSolutionEn"='Triangular matrix determinant equals the product of the main diagonal entries. For [[2,3],[0,5]], det=2×5−3×0=2×5=10. The zero below the diagonal removes the second product.'
 WHERE "Id"=334 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما محدد \(\begin{pmatrix}2&3\\0&5\end{pmatrix}\)؟' AND "QuestionTextEn"='Find determinant of \(\begin{pmatrix}2&3\\0&5\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المصفوفة مثلثية، المحدد=2×5=10.' AND "DetailedSolutionEn"='This is triangular; determinant=2×5=10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=334 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=334 AND o."Id"=1328
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 334 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف أثر المصفوفة المربعة tr(A): مجموع عناصر القطر الرئيسي من أعلى اليسار إلى أسفل اليمين. المصفوفة المعطاة قطرها الرئيسي 3 و5، لذا tr(A) = 3 + 5 = 8. لا نخلط بين الأثر والمحدد، فالعمليتان مختلفتان.', "DetailedSolutionEn"='Trace of a square matrix is the sum of its main diagonal entries. Here the main diagonal contains 3 and 5, so tr(A) = 3 + 5 = 8. The trace is not the determinant.'
 WHERE "Id"=344 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما أثر المصفوفة \(\begin{pmatrix}3&0\\0&5\end{pmatrix}\)؟' AND "QuestionTextEn"='Find trace of \(\begin{pmatrix}3&0\\0&5\end{pmatrix}\).'
 AND "DetailedSolutionAr"='الأثر مجموع عناصر القطر 3+5=8.' AND "DetailedSolutionEn"='Trace is diagonal sum 3+5=8.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=344 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=344 AND o."Id"=1365
 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 344 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ضرب المتجه بعدد حقيقي: k(أ،ب) = (kأ، kب). عند ضرب المتجه (4،5) في العدد 3 نضرب كل مركبة مستقلة: (3×4، 3×5) = (12،15). لا نجمع المركبتين، لأن الناتج متجه ذو مركبتين.', "DetailedSolutionEn"='Scalar-vector multiplication: k(a,b)=(ka,kb). Multiplying (4,5) by 3 scales each component: (3×4,3×5)=(12,15). The result remains a two-component vector.'
 WHERE "Id"=345 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='اضرب المتجه (4،5) بالعدد 3.' AND "QuestionTextEn"='Multiply vector (4,5) by scalar 3.'
 AND "DetailedSolutionAr"='نضرب كل مركبة: (12,15).' AND "DetailedSolutionEn"='Multiply each coordinate: (12,15).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=345 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=345 AND o."Id"=1372
 AND o."IsCorrect" AND o."LatexCode"='(12,15)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 345 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة المحدد للمصفوفة المثلثية: حاصل ضرب عناصر القطر الرئيسي. للمصفوفة [[3،4],[0،6]] نحسب det = 3×6 − 4×0 = 3×6 = 18. وجود صفر تحت القطر يبسط القانون، فلا تسهم القيمة 4 في الحد المطروح.', "DetailedSolutionEn"='Triangular matrix determinant equals the product of the main diagonal entries. For [[3,4],[0,6]], det=3×6−4×0=3×6=18. The zero below the diagonal removes the second product.'
 WHERE "Id"=346 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما محدد \(\begin{pmatrix}3&4\\0&6\end{pmatrix}\)؟' AND "QuestionTextEn"='Find determinant of \(\begin{pmatrix}3&4\\0&6\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المصفوفة مثلثية، المحدد=3×6=18.' AND "DetailedSolutionEn"='This is triangular; determinant=3×6=18.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=346 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=346 AND o."Id"=1375
 AND o."IsCorrect" AND o."LatexCode"='18');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 346 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف أثر المصفوفة المربعة tr(A): مجموع عناصر القطر الرئيسي من أعلى اليسار إلى أسفل اليمين. المصفوفة المعطاة قطرها الرئيسي 4 و6، لذا tr(A) = 4 + 6 = 10. لا نخلط بين الأثر والمحدد، فالعمليتان مختلفتان.', "DetailedSolutionEn"='Trace of a square matrix is the sum of its main diagonal entries. Here the main diagonal contains 4 and 6, so tr(A) = 4 + 6 = 10. The trace is not the determinant.'
 WHERE "Id"=356 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما أثر المصفوفة \(\begin{pmatrix}4&0\\0&6\end{pmatrix}\)؟' AND "QuestionTextEn"='Find trace of \(\begin{pmatrix}4&0\\0&6\end{pmatrix}\).'
 AND "DetailedSolutionAr"='الأثر مجموع عناصر القطر 4+6=10.' AND "DetailedSolutionEn"='Trace is diagonal sum 4+6=10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=356 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=356 AND o."Id"=1416
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 356 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ضرب المتجه بعدد حقيقي: k(أ،ب) = (kأ، kب). عند ضرب المتجه (5،6) في العدد 4 نضرب كل مركبة مستقلة: (4×5، 4×6) = (20،24). لا نجمع المركبتين، لأن الناتج متجه ذو مركبتين.', "DetailedSolutionEn"='Scalar-vector multiplication: k(a,b)=(ka,kb). Multiplying (5,6) by 4 scales each component: (4×5,4×6)=(20,24). The result remains a two-component vector.'
 WHERE "Id"=357 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='اضرب المتجه (5،6) بالعدد 4.' AND "QuestionTextEn"='Multiply vector (5,6) by scalar 4.'
 AND "DetailedSolutionAr"='نضرب كل مركبة: (20,24).' AND "DetailedSolutionEn"='Multiply each coordinate: (20,24).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=357 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=357 AND o."Id"=1419
 AND o."IsCorrect" AND o."LatexCode"='(20,24)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 357 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة المحدد للمصفوفة المثلثية: حاصل ضرب عناصر القطر الرئيسي. للمصفوفة [[4،5],[0،7]] نحسب det = 4×7 − 5×0 = 4×7 = 28. وجود صفر تحت القطر يبسط القانون، فلا تسهم القيمة 5 في الحد المطروح.', "DetailedSolutionEn"='Triangular matrix determinant equals the product of the main diagonal entries. For [[4,5],[0,7]], det=4×7−5×0=4×7=28. The zero below the diagonal removes the second product.'
 WHERE "Id"=358 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما محدد \(\begin{pmatrix}4&5\\0&7\end{pmatrix}\)؟' AND "QuestionTextEn"='Find determinant of \(\begin{pmatrix}4&5\\0&7\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المصفوفة مثلثية، المحدد=4×7=28.' AND "DetailedSolutionEn"='This is triangular; determinant=4×7=28.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=358 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=358 AND o."Id"=1422
 AND o."IsCorrect" AND o."LatexCode"='28');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 358 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف أثر المصفوفة المربعة tr(A): مجموع عناصر القطر الرئيسي من أعلى اليسار إلى أسفل اليمين. المصفوفة المعطاة قطرها الرئيسي 5 و7، لذا tr(A) = 5 + 7 = 12. لا نخلط بين الأثر والمحدد، فالعمليتان مختلفتان.', "DetailedSolutionEn"='Trace of a square matrix is the sum of its main diagonal entries. Here the main diagonal contains 5 and 7, so tr(A) = 5 + 7 = 12. The trace is not the determinant.'
 WHERE "Id"=368 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما أثر المصفوفة \(\begin{pmatrix}5&0\\0&7\end{pmatrix}\)؟' AND "QuestionTextEn"='Find trace of \(\begin{pmatrix}5&0\\0&7\end{pmatrix}\).'
 AND "DetailedSolutionAr"='الأثر مجموع عناصر القطر 5+7=12.' AND "DetailedSolutionEn"='Trace is diagonal sum 5+7=12.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=368 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=368 AND o."Id"=1463
 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 368 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ضرب المتجه بعدد حقيقي: k(أ،ب) = (kأ، kب). عند ضرب المتجه (6،7) في العدد 5 نضرب كل مركبة مستقلة: (5×6، 5×7) = (30،35). لا نجمع المركبتين، لأن الناتج متجه ذو مركبتين.', "DetailedSolutionEn"='Scalar-vector multiplication: k(a,b)=(ka,kb). Multiplying (6,7) by 5 scales each component: (5×6,5×7)=(30,35). The result remains a two-component vector.'
 WHERE "Id"=369 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='اضرب المتجه (6،7) بالعدد 5.' AND "QuestionTextEn"='Multiply vector (6,7) by scalar 5.'
 AND "DetailedSolutionAr"='نضرب كل مركبة: (30,35).' AND "DetailedSolutionEn"='Multiply each coordinate: (30,35).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=369 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=369 AND o."Id"=1466
 AND o."IsCorrect" AND o."LatexCode"='(30,35)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 369 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة المحدد للمصفوفة المثلثية: حاصل ضرب عناصر القطر الرئيسي. للمصفوفة [[5،6],[0،8]] نحسب det = 5×8 − 6×0 = 5×8 = 40. وجود صفر تحت القطر يبسط القانون، فلا تسهم القيمة 6 في الحد المطروح.', "DetailedSolutionEn"='Triangular matrix determinant equals the product of the main diagonal entries. For [[5,6],[0,8]], det=5×8−6×0=5×8=40. The zero below the diagonal removes the second product.'
 WHERE "Id"=370 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما محدد \(\begin{pmatrix}5&6\\0&8\end{pmatrix}\)؟' AND "QuestionTextEn"='Find determinant of \(\begin{pmatrix}5&6\\0&8\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المصفوفة مثلثية، المحدد=5×8=40.' AND "DetailedSolutionEn"='This is triangular; determinant=5×8=40.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=370 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=370 AND o."Id"=1469
 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 370 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف أثر المصفوفة المربعة tr(A): مجموع عناصر القطر الرئيسي من أعلى اليسار إلى أسفل اليمين. المصفوفة المعطاة قطرها الرئيسي 6 و8، لذا tr(A) = 6 + 8 = 14. لا نخلط بين الأثر والمحدد، فالعمليتان مختلفتان.', "DetailedSolutionEn"='Trace of a square matrix is the sum of its main diagonal entries. Here the main diagonal contains 6 and 8, so tr(A) = 6 + 8 = 14. The trace is not the determinant.'
 WHERE "Id"=380 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما أثر المصفوفة \(\begin{pmatrix}6&0\\0&8\end{pmatrix}\)؟' AND "QuestionTextEn"='Find trace of \(\begin{pmatrix}6&0\\0&8\end{pmatrix}\).'
 AND "DetailedSolutionAr"='الأثر مجموع عناصر القطر 6+8=14.' AND "DetailedSolutionEn"='Trace is diagonal sum 6+8=14.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=380 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=380 AND o."Id"=1510
 AND o."IsCorrect" AND o."LatexCode"='14');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 380 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ضرب المتجه بعدد حقيقي: k(أ،ب) = (kأ، kب). عند ضرب المتجه (7،8) في العدد 6 نضرب كل مركبة مستقلة: (6×7، 6×8) = (42،48). لا نجمع المركبتين، لأن الناتج متجه ذو مركبتين.', "DetailedSolutionEn"='Scalar-vector multiplication: k(a,b)=(ka,kb). Multiplying (7,8) by 6 scales each component: (6×7,6×8)=(42,48). The result remains a two-component vector.'
 WHERE "Id"=381 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='اضرب المتجه (7،8) بالعدد 6.' AND "QuestionTextEn"='Multiply vector (7,8) by scalar 6.'
 AND "DetailedSolutionAr"='نضرب كل مركبة: (42,48).' AND "DetailedSolutionEn"='Multiply each coordinate: (42,48).'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=381 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=381 AND o."Id"=1513
 AND o."IsCorrect" AND o."LatexCode"='(42,48)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 381 changed; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قاعدة المحدد للمصفوفة المثلثية: حاصل ضرب عناصر القطر الرئيسي. للمصفوفة [[6،7],[0،9]] نحسب det = 6×9 − 7×0 = 6×9 = 54. وجود صفر تحت القطر يبسط القانون، فلا تسهم القيمة 7 في الحد المطروح.', "DetailedSolutionEn"='Triangular matrix determinant equals the product of the main diagonal entries. For [[6,7],[0,9]], det=6×9−7×0=6×9=54. The zero below the diagonal removes the second product.'
 WHERE "Id"=382 AND "StageId"=4 AND "CategoryId"=14
 AND "QuestionTextAr"='ما محدد \(\begin{pmatrix}6&7\\0&9\end{pmatrix}\)؟' AND "QuestionTextEn"='Find determinant of \(\begin{pmatrix}6&7\\0&9\end{pmatrix}\).'
 AND "DetailedSolutionAr"='المصفوفة مثلثية، المحدد=6×9=54.' AND "DetailedSolutionEn"='This is triangular; determinant=6×9=54.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=382 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=382 AND o."Id"=1520
 AND o."IsCorrect" AND o."LatexCode"='54');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University multi/linear problem 382 changed; rollback all'; END IF;
END $mw_university_multivariable_linear$;
COMMIT;
