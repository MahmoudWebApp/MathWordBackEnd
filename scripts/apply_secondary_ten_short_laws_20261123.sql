-- Ten final upper-secondary explanation clarity updates; one-time atomic transaction.
-- Guard original questions, both previous explanations and the immutable answer keys.
BEGIN;
DO $mw_secondary_ten$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: حاصل الضرب الصفري. نحلل س² − 7س + 12 إلى (س − 3)(س − 4) لأن 3 + 4 = 7 و3 × 4 = 12. يساوي حاصل الضرب صفراً فقط إذا كان أحد العاملين صفراً؛ إذن الجذران س = 3 أو س = 4. التحقق بالتعويض يؤكد الجذرين.', "DetailedSolutionEn"='Rule used: Zero-product property. Factor x²−7x+12 as (x−3)(x−4) because 3+4=7 and 3×4=12. At least one factor must be zero, hence x=3 or x=4. Substitution confirms both roots.'
 WHERE "Id"=45 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما جذرا المعادلة x² - 7x + 12 = 0؟' AND "QuestionTextEn"='What are the roots of x² - 7x + 12 = 0?'
 AND "DetailedSolutionAr"='نحلل المقدار إلى (x - 3)(x - 4) = 0، إذن الجذران 3 و4.' AND "DetailedSolutionEn"='Factor as (x - 3)(x - 4) = 0. Thus the roots are 3 and 4.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=45 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=45 AND o."Id"=169 AND o."IsCorrect" AND o."LatexCode"='(3,4)');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 45 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون تكامل القوى: ∫س^ن dس = س^(ن+1)/(ن+1) + C عندما ن ≠ −1. نزيد الأس في ∫6س² dس من 2 إلى 3 ونقسم المعامل 6 على 3، فنحصل على 6س³/3 + C = 2س³ + C. التحقق: مشتقة 2س³ + C هي 6س².', "DetailedSolutionEn"='Power-integration rule: ∫x^n dx = x^(n+1)/(n+1) + C for n ≠ −1. In ∫6x² dx, increase the power to 3 and divide the coefficient by 3: 6x³/3+C = 2x³+C. Differentiating the result returns 6x².'
 WHERE "Id"=63 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد التكامل غير المحدد للدالة 6x² بالنسبة إلى x.' AND "QuestionTextEn"='Find the indefinite integral of 6x² with respect to x.'
 AND "DetailedSolutionAr"='نستخدم قاعدة تكامل القوى: ∫6x² dx = 6x³/3 + C = 2x³ + C.' AND "DetailedSolutionEn"='By the power rule, ∫6x² dx = 6x³/3 + C = 2x³ + C.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=63 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=63 AND o."Id"=244 AND o."IsCorrect" AND o."LatexCode"='2x^{3}+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 63 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون مجموع المتسلسلة الهندسية اللانهائية: S = أ₁/(1−r) بشرط |r| < 1. للمتسلسلة 4 + 2 + 1 + 1/2 + ... نجد الحد الأول أ₁ = 4 والنسبة المشتركة r = 2/4 = 1/2. بالتعويض: S = 4/(1−1/2) = 4/(1/2) = 8.', "DetailedSolutionEn"='Infinite geometric-series sum law: S = a₁/(1−r) when |r|<1. For 4+2+1+1/2+..., a₁=4 and r=2/4=1/2. The ratio has absolute value below one, so the series converges. Substitute S=4/(1−1/2)=8.'
 WHERE "Id"=442 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='أوجد مجموع المتسلسلة الهندسية اللانهائية $4+2+1+\frac12+\cdots$.' AND "QuestionTextEn"='Find the sum of the infinite geometric series $4+2+1+\frac12+\cdots$.'
 AND "DetailedSolutionAr"='النسبة $r=\frac12$ وتحقق $|r|<1$، إذن $S=\frac4{1-1/2}=8$.' AND "DetailedSolutionEn"='Here $r=\frac12$ with $|r|<1$, so $S=\frac4{1-1/2}=8$.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=442 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=442 AND o."Id"=1759 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 442 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: S = أ₁/(1−r) لمجموع متسلسلة هندسية لانهائية متقاربة حين |r| < 1. المتسلسلة 6 + 2 + 2/3 + 2/9 + ... حدها الأول 6 ونسبتها r = 2/6 = 1/3. بالتعويض: S = 6/(1−1/3) = 6/(2/3) = 9.', "DetailedSolutionEn"='Rule used: The convergent geometric series sum is S=a₁/(1−r) for |r|<1. The series 6+2+2/3+2/9+... has first term 6 and ratio 2/6=1/3. Therefore S=6/(1−1/3)=6/(2/3)=9.'
 WHERE "Id"=509 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='احسب مجموع المتسلسلة اللانهائية $6+2+\frac23+\frac29+\cdots$.' AND "QuestionTextEn"='Compute the infinite sum $6+2+\frac23+\frac29+\cdots$.'
 AND "DetailedSolutionAr"='النسبة المشتركة $\frac13$، لذا $S=\frac6{1-1/3}=9$.' AND "DetailedSolutionEn"='The common ratio is $\frac13$, so $S=\frac6{1-1/3}=9$.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=509 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=509 AND o."Id"=2026 AND o."IsCorrect" AND o."LatexCode"='9');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 509 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='تعريف اللوغاريتم: logₐ(ب) = ج يعني أن أ^ج = ب. بما أن 125 = 5³، فإن 1/125 = 5^(−3). إذن log₅(1/125) = −3 لأن رفع 5 للأس السالب الثالث يعطينا مقلوب 125. التحقق بإعادة الأس: 5^(−3) = 1/125.', "DetailedSolutionEn"='Logarithm definition: log_a(b)=c means a^c=b. Since 125=5³, we have 1/125=5^(−3). Thus log₅(1/125)=−3, because the negative exponent gives a reciprocal. Check by exponentiation: 5^(−3)=1/125.'
 WHERE "Id"=637 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='أوجد قيمة log₅(1/125).' AND "QuestionTextEn"='Evaluate log base 5 of 1/125.'
 AND "DetailedSolutionAr"='لأن 1/125 = 5⁻³، فإن log₅(1/125) = −3.' AND "DetailedSolutionEn"='Since 1/125 = 5^(−3), log base 5 of 1/125 equals −3.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=637 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=637 AND o."Id"=2538 AND o."IsCorrect" AND o."LatexCode"='-3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 637 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الحد العام الهندسي أₙ = أ₁r^(ن−1). عند قسمة أ₄ على أ₂ يُحذف الحد الأول وتبقى r². إذن r² = 54/6 = 9، فيكون r = ±3. لكن السؤال اشترط أن تكون النسبة المشتركة موجبة، لذلك نختار r = 3 دون السالب.', "DetailedSolutionEn"='Geometric nth-term law: a_n=a₁r^(n−1). Dividing the fourth term by the second cancels a₁ and leaves r². Thus r²=54/6=9 and r=±3. Since the question explicitly requires a positive common ratio, choose r=3.'
 WHERE "Id"=710 AND "StageId"=3 AND "CategoryId"=23
 AND "QuestionTextAr"='في متتالية هندسية حدها الثاني 6 وحدها الرابع 54، وأساسها موجب. ما قيمة الأساس؟' AND "QuestionTextEn"='In a geometric sequence the second term is 6 and the fourth is 54. Its common ratio is positive. What is the ratio?'
 AND "DetailedSolutionAr"='النسبة بين الحد الرابع والثاني تساوي r² = 54/6 = 9؛ وبما أن r موجب، فـ r = 3.' AND "DetailedSolutionEn"='Since a₄/a₂ = r² = 54/6 = 9 and r is positive, r = 3.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=710 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=710 AND o."Id"=2787 AND o."IsCorrect" AND o."LatexCode"='3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 710 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: تحليل المربع الكامل. كثير الحدود س² − 10س + 25 يساوي (س − 5)² لأن −10 = −2×5 و25 = 5². إذن (س − 5)² = 0، وبالتالي س = 5. يسمى جذراً مكرراً لأن المميز يساوي 100 − 100 = 0.', "DetailedSolutionEn"='Rule used: Perfect-square factoring. The polynomial x²−10x+25=(x−5)² because −10=−2×5 and 25=5². Solving (x−5)²=0 gives x=5, a repeated root. Its discriminant also confirms this: 100−100=0.'
 WHERE "Id"=769 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='أوجد الجذر الحقيقي للمعادلة x² − 10x + 25 = 0.' AND "QuestionTextEn"='Find the real root of x² − 10x + 25 = 0.'
 AND "DetailedSolutionAr"='نحلل إلى (x−5)²=0، فالجذر x=5 مكرر مرتين.' AND "DetailedSolutionEn"='Factor as (x−5)²=0. The single distinct root is x=5, repeated twice.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=769 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=769 AND o."Id"=3067 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 769 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: تحليل المعادلة التربيعية واستخدام حاصل الضرب الصفري. نحل 2س² − 7س + 3 = (2س − 1)(س − 3) = 0. من العامل الأول 2س − 1 = 0 فنجد س = 1/2، ومن الثاني س − 3 = 0 فنجد س = 3. مجموعة الجذور هي {1/2، 3}.', "DetailedSolutionEn"='Rule used: Factor the quadratic and use the zero-product property. Since 2x²−7x+3=(2x−1)(x−3), each factor may be set to zero. Solving 2x−1=0 gives x=1/2, and x−3=0 gives x=3. Both roots satisfy the original equation.'
 WHERE "Id"=770 AND "StageId"=3 AND "CategoryId"=9
 AND "QuestionTextAr"='ما جذرا المعادلة 2x² − 7x + 3 = 0؟' AND "QuestionTextEn"='What are the roots of 2x² − 7x + 3 = 0?'
 AND "DetailedSolutionAr"='نحلل (2x−1)(x−3)=0، ومنه الجذران x=1/2 وx=3.' AND "DetailedSolutionEn"='Factor (2x−1)(x−3)=0. The roots are x=1/2 and x=3.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=770 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=770 AND o."Id"=3069 AND o."IsCorrect" AND o."LatexCode"='\{3,\frac12\}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 770 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: خطية التكامل وقاعدة القوى. نكامل كل حد بمفرده: ∫6س² dس = 6س³/3 = 2س³، و∫(−4س) dس = −4س²/2 = −2س². بجمع الناتجين وإضافة ثابت التكامل تصبح الدالة الأصلية 2س³ − 2س² + C. التحقق بالمشتقة يعيد 6س² − 4س.', "DetailedSolutionEn"='Rule used: Integrate term by term with the power rule. ∫6x²dx=6x³/3=2x³, and ∫(−4x)dx=−4x²/2=−2x². Including the integration constant gives 2x³−2x²+C. Differentiate to verify it returns 6x²−4x.'
 WHERE "Id"=861 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب التكامل غير المحدد ∫(6x²−4x)dx.' AND "QuestionTextEn"='Compute the indefinite integral ∫(6x²−4x) dx.'
 AND "DetailedSolutionAr"='بتكامل كل حد نحصل على 2x³−2x²+C. المشتقة تعيد 6x²−4x.' AND "DetailedSolutionEn"='Integrate termwise to obtain 2x³−2x²+C; differentiating gives the original integrand.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=861 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=861 AND o."Id"=3437 AND o."IsCorrect" AND o."LatexCode"='2x^3-2x^2+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 861 source or answer changed; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبرهنة التكامل الأساسية، فالتكامل المحدد يساوي قيمة الدالة الأصلية عند الحد الأعلى ناقص قيمتها عند الأدنى. الدالة الأصلية لـ3س² + 1 هي F(س) = س³ + س. لذا ∫₀²(3س²+1)dس = F(2) − F(0) = (8+2) − 0 = 10.', "DetailedSolutionEn"='Fundamental Theorem of Calculus: A definite integral equals the antiderivative at the upper bound minus the lower bound. For 3x²+1, use F(x)=x³+x. Thus ∫₀²(3x²+1)dx=F(2)−F(0)=(8+2)−0=10.'
 WHERE "Id"=862 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='ما قيمة التكامل المحدد من 0 إلى 2 للدالة 3x²+1؟' AND "QuestionTextEn"='Evaluate the definite integral of 3x²+1 from x=0 to x=2.'
 AND "DetailedSolutionAr"='الدالة الأصلية x³+x، ونتيجة التعويض عند الحدين = (8+2)−0=10.' AND "DetailedSolutionEn"='An antiderivative is x³+x. At the bounds, (8+2)−0=10.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=862 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=862 AND o."Id"=3443 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary problem 862 source or answer changed; rollback entire batch'; END IF;
END $mw_secondary_ten$;
COMMIT;
