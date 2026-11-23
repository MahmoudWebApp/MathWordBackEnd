-- MathWorld middle-stage category 5 & 6: 51 individually verified bilingual solutions.
-- Apply only once after all CI checks. Atomic guard checks source questions, old text and correct options.
-- No category changes, answer changes, access changes or changes to students' histories.
BEGIN;
DO $mw_middle_number_theory_algebra$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: القاسم المشترك الأكبر هو أكبر عدد صحيح موجب يقسم العددين دون باقٍ. نستخدم خوارزمية إقليدس: 60 = 48 × 1 + 12، ثم 48 = 12 × 4 + 0. آخر باقٍ غير صفري هو 12؛ إذن القاسم المشترك الأكبر للعددين 48 و60 يساوي 12.', "DetailedSolutionEn"='Rule used: The greatest common divisor (GCD) is the largest positive integer dividing both numbers. Euclidean algorithm: 60 = 48 × 1 + 12, then 48 = 12 × 4 + 0. The last nonzero remainder is 12, so gcd(48, 60) = 12.'
 WHERE "Id"=57 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='ما القاسم المشترك الأكبر للعددين 48 و60؟' AND "QuestionTextEn"='What is the greatest common divisor of 48 and 60?'
 AND "DetailedSolutionAr"='عوامل 48 و60 المشتركة تتضمن 1 و2 و3 و4 و6 و12، وأكبرها 12.' AND "DetailedSolutionEn"='The common positive divisors include 1, 2, 3, 4, 6, and 12; the greatest is 12.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=57 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=57 AND o."Id"=218
 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 57: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأسس: عند ضرب قوتين لهما الأساس نفسه، نجمع الأسين ونُبقي الأساس كما هو: أ^م × أ^ن = أ^(م + ن). في هذه المسألة الأساس 2، وبالتالي 2^3 × 2² = 2^(3 + 2) = 2^5. المطلوب كتابتها كقوة واحدة، لذلك لا نحتاج إلى حساب القيمة العشرية.', "DetailedSolutionEn"='Exponent law: When multiplying powers with the same base, add the exponents and keep the base: a^m × a^n = a^(m+n). Here the common base is 2, so 2^3 × 2² = 2^(3 + 2) = 2^5. The question asks for one power rather than its numerical evaluation.'
 WHERE "Id"=73 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(2^{3}\times2^2\) على صورة قوة للعدد 2.' AND "QuestionTextEn"='Write \(2^{3}\times2^2\) as a single power of 2.'
 AND "DetailedSolutionAr"='نجمع الأسين لأن الأساس واحد: 3+2=5.' AND "DetailedSolutionEn"='For equal bases add the exponents: 3+2=5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=73 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=73 AND o."Id"=284
 AND o."IsCorrect" AND o."LatexCode"='2^{5}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 73: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأسس: عند ضرب قوتين لهما الأساس نفسه، نجمع الأسين ونُبقي الأساس كما هو: أ^م × أ^ن = أ^(م + ن). في هذه المسألة الأساس 2، وبالتالي 2^4 × 2² = 2^(4 + 2) = 2^6. المطلوب كتابتها كقوة واحدة، لذلك لا نحتاج إلى حساب القيمة العشرية.', "DetailedSolutionEn"='Exponent law: When multiplying powers with the same base, add the exponents and keep the base: a^m × a^n = a^(m+n). Here the common base is 2, so 2^4 × 2² = 2^(4 + 2) = 2^6. The question asks for one power rather than its numerical evaluation.'
 WHERE "Id"=88 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(2^{4}\times2^2\) على صورة قوة للعدد 2.' AND "QuestionTextEn"='Write \(2^{4}\times2^2\) as a single power of 2.'
 AND "DetailedSolutionAr"='نجمع الأسين لأن الأساس واحد: 4+2=6.' AND "DetailedSolutionEn"='For equal bases add the exponents: 4+2=6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=88 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=88 AND o."Id"=343
 AND o."IsCorrect" AND o."LatexCode"='2^{6}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 88: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأسس: عند ضرب قوتين لهما الأساس نفسه، نجمع الأسين ونُبقي الأساس كما هو: أ^م × أ^ن = أ^(م + ن). في هذه المسألة الأساس 2، وبالتالي 2^5 × 2² = 2^(5 + 2) = 2^7. المطلوب كتابتها كقوة واحدة، لذلك لا نحتاج إلى حساب القيمة العشرية.', "DetailedSolutionEn"='Exponent law: When multiplying powers with the same base, add the exponents and keep the base: a^m × a^n = a^(m+n). Here the common base is 2, so 2^5 × 2² = 2^(5 + 2) = 2^7. The question asks for one power rather than its numerical evaluation.'
 WHERE "Id"=103 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(2^{5}\times2^2\) على صورة قوة للعدد 2.' AND "QuestionTextEn"='Write \(2^{5}\times2^2\) as a single power of 2.'
 AND "DetailedSolutionAr"='نجمع الأسين لأن الأساس واحد: 5+2=7.' AND "DetailedSolutionEn"='For equal bases add the exponents: 5+2=7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=103 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=103 AND o."Id"=402
 AND o."IsCorrect" AND o."LatexCode"='2^{7}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 103: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأسس: عند ضرب قوتين لهما الأساس نفسه، نجمع الأسين ونُبقي الأساس كما هو: أ^م × أ^ن = أ^(م + ن). في هذه المسألة الأساس 2، وبالتالي 2^6 × 2² = 2^(6 + 2) = 2^8. المطلوب كتابتها كقوة واحدة، لذلك لا نحتاج إلى حساب القيمة العشرية.', "DetailedSolutionEn"='Exponent law: When multiplying powers with the same base, add the exponents and keep the base: a^m × a^n = a^(m+n). Here the common base is 2, so 2^6 × 2² = 2^(6 + 2) = 2^8. The question asks for one power rather than its numerical evaluation.'
 WHERE "Id"=118 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(2^{6}\times2^2\) على صورة قوة للعدد 2.' AND "QuestionTextEn"='Write \(2^{6}\times2^2\) as a single power of 2.'
 AND "DetailedSolutionAr"='نجمع الأسين لأن الأساس واحد: 6+2=8.' AND "DetailedSolutionEn"='For equal bases add the exponents: 6+2=8.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=118 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=118 AND o."Id"=461
 AND o."IsCorrect" AND o."LatexCode"='2^{8}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 118: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأسس: عند ضرب قوتين لهما الأساس نفسه، نجمع الأسين ونُبقي الأساس كما هو: أ^م × أ^ن = أ^(م + ن). في هذه المسألة الأساس 2، وبالتالي 2^7 × 2² = 2^(7 + 2) = 2^9. المطلوب كتابتها كقوة واحدة، لذلك لا نحتاج إلى حساب القيمة العشرية.', "DetailedSolutionEn"='Exponent law: When multiplying powers with the same base, add the exponents and keep the base: a^m × a^n = a^(m+n). Here the common base is 2, so 2^7 × 2² = 2^(7 + 2) = 2^9. The question asks for one power rather than its numerical evaluation.'
 WHERE "Id"=133 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(2^{7}\times2^2\) على صورة قوة للعدد 2.' AND "QuestionTextEn"='Write \(2^{7}\times2^2\) as a single power of 2.'
 AND "DetailedSolutionAr"='نجمع الأسين لأن الأساس واحد: 7+2=9.' AND "DetailedSolutionEn"='For equal bases add the exponents: 7+2=9.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=133 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=133 AND o."Id"=524
 AND o."IsCorrect" AND o."LatexCode"='2^{9}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 133: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: القاسم المشترك الأكبر للعددين (3 × 2) و(5 × 2) هو 2 لأن 3 و5 لا قاسم مشترك بينهما غير 1. نكتب 6 = 3 × 2 و10 = 5 × 2. الجزء المشترك الأكبر هو 2، ولذلك gcd(6, 10) = 2.', "DetailedSolutionEn"='Rule used: If two numbers are 3 × 2 and 5 × 2, then gcd = 2 because 3 and 5 are coprime. Factor 6 = 3 × 2 and 10 = 5 × 2; the largest shared factor is 2. Thus gcd(6, 10) = 2.'
 WHERE "Id"=209 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد القاسم المشترك الأكبر لـ6 و10.' AND "QuestionTextEn"='Find gcd(6,10).'
 AND "DetailedSolutionAr"='العددان 3×2 و5×2، وبما أن 3 و5 أوليان فيما بينهما فالقاسم الأكبر 2.' AND "DetailedSolutionEn"='Numbers are 3×2 and 5×2; as 3 and 5 are coprime, gcd=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=209 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=209 AND o."Id"=827
 AND o."IsCorrect" AND o."LatexCode"='2');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 209: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون قسمة الأسس المتشابهة: أ^ن ÷ أ^م = أ^(ن − م) عندما يكون أ غير صفري. هنا الأساس 2 نفسه في البسط والمقام، لذلك 2^5 ÷ 2^3 = 2^(5 − 3) = 2^2. نحافظ على صورة القوة لأن المطلوب تبسيط العبارة الأسية.', "DetailedSolutionEn"='Quotient law of exponents: a^n ÷ a^m = a^(n−m) for nonzero a. Both numerator and denominator use base 2, so 2^5 ÷ 2^3 = 2^(5 − 3) = 2^2. The simplified result remains in exponent form.'
 WHERE "Id"=210 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(\frac{2^{5}}{2^{3}}\).' AND "QuestionTextEn"='Simplify \(\frac{2^{5}}{2^{3}}\).'
 AND "DetailedSolutionAr"='نطرح الأسين: 5-3=2.' AND "DetailedSolutionEn"='Subtract the exponents: 5-3=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=210 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=210 AND o."Id"=830
 AND o."IsCorrect" AND o."LatexCode"='2^{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 210: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المضاعف المشترك الأصغر للعددين = حاصل ضربهما ÷ القاسم المشترك الأكبر لهما. العددان 8 و10، والقاسم المشترك الأكبر = 2، لأنهما 2 × 4 و2 × 5. بالتعويض: LCM = (8 × 10) ÷ 2 = 40. هذا أصغر عدد موجب يقبل القسمة على العددين.', "DetailedSolutionEn"='Rule used: Least common multiple = product of the numbers ÷ their greatest common divisor. For 8 and 10, the GCD is 2, because the numbers are 2×4 and 2×5. Therefore LCM = (8 × 10) ÷ 2 = 40, the smallest positive multiple shared by both.'
 WHERE "Id"=211 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد المضاعف المشترك الأصغر للعددين 8 و10.' AND "QuestionTextEn"='Find the least common multiple of 8 and 10.'
 AND "DetailedSolutionAr"='لأن 4 و5 أوليان فيما بينهما فإن المضاعف المشترك الأصغر 20×2=40.' AND "DetailedSolutionEn"='LCM(4,5)=20, so LCM(8,10)=20×2=40.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=211 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=211 AND o."Id"=833
 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 211: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: القاسم المشترك الأكبر للعددين (3 × 3) و(5 × 3) هو 3 لأن 3 و5 لا قاسم مشترك بينهما غير 1. نكتب 9 = 3 × 3 و15 = 5 × 3. الجزء المشترك الأكبر هو 3، ولذلك gcd(9, 15) = 3.', "DetailedSolutionEn"='Rule used: If two numbers are 3 × 3 and 5 × 3, then gcd = 3 because 3 and 5 are coprime. Factor 9 = 3 × 3 and 15 = 5 × 3; the largest shared factor is 3. Thus gcd(9, 15) = 3.'
 WHERE "Id"=221 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد القاسم المشترك الأكبر لـ9 و15.' AND "QuestionTextEn"='Find gcd(9,15).'
 AND "DetailedSolutionAr"='العددان 3×3 و5×3، وبما أن 3 و5 أوليان فيما بينهما فالقاسم الأكبر 3.' AND "DetailedSolutionEn"='Numbers are 3×3 and 5×3; as 3 and 5 are coprime, gcd=3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=221 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=221 AND o."Id"=874
 AND o."IsCorrect" AND o."LatexCode"='3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 221: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون قسمة الأسس المتشابهة: أ^ن ÷ أ^م = أ^(ن − م) عندما يكون أ غير صفري. هنا الأساس 3 نفسه في البسط والمقام، لذلك 3^6 ÷ 3^4 = 3^(6 − 4) = 3^2. نحافظ على صورة القوة لأن المطلوب تبسيط العبارة الأسية.', "DetailedSolutionEn"='Quotient law of exponents: a^n ÷ a^m = a^(n−m) for nonzero a. Both numerator and denominator use base 3, so 3^6 ÷ 3^4 = 3^(6 − 4) = 3^2. The simplified result remains in exponent form.'
 WHERE "Id"=222 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(\frac{3^{6}}{3^{4}}\).' AND "QuestionTextEn"='Simplify \(\frac{3^{6}}{3^{4}}\).'
 AND "DetailedSolutionAr"='نطرح الأسين: 6-4=2.' AND "DetailedSolutionEn"='Subtract the exponents: 6-4=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=222 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=222 AND o."Id"=877
 AND o."IsCorrect" AND o."LatexCode"='3^{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 222: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المضاعف المشترك الأصغر للعددين = حاصل ضربهما ÷ القاسم المشترك الأكبر لهما. العددان 12 و15، والقاسم المشترك الأكبر = 3، لأنهما 3 × 4 و3 × 5. بالتعويض: LCM = (12 × 15) ÷ 3 = 60. هذا أصغر عدد موجب يقبل القسمة على العددين.', "DetailedSolutionEn"='Rule used: Least common multiple = product of the numbers ÷ their greatest common divisor. For 12 and 15, the GCD is 3, because the numbers are 3×4 and 3×5. Therefore LCM = (12 × 15) ÷ 3 = 60, the smallest positive multiple shared by both.'
 WHERE "Id"=223 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد المضاعف المشترك الأصغر للعددين 12 و15.' AND "QuestionTextEn"='Find the least common multiple of 12 and 15.'
 AND "DetailedSolutionAr"='لأن 4 و5 أوليان فيما بينهما فإن المضاعف المشترك الأصغر 20×3=60.' AND "DetailedSolutionEn"='LCM(4,5)=20, so LCM(12,15)=20×3=60.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=223 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=223 AND o."Id"=884
 AND o."IsCorrect" AND o."LatexCode"='60');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 223: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: القاسم المشترك الأكبر للعددين (3 × 4) و(5 × 4) هو 4 لأن 3 و5 لا قاسم مشترك بينهما غير 1. نكتب 12 = 3 × 4 و20 = 5 × 4. الجزء المشترك الأكبر هو 4، ولذلك gcd(12, 20) = 4.', "DetailedSolutionEn"='Rule used: If two numbers are 3 × 4 and 5 × 4, then gcd = 4 because 3 and 5 are coprime. Factor 12 = 3 × 4 and 20 = 5 × 4; the largest shared factor is 4. Thus gcd(12, 20) = 4.'
 WHERE "Id"=233 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد القاسم المشترك الأكبر لـ12 و20.' AND "QuestionTextEn"='Find gcd(12,20).'
 AND "DetailedSolutionAr"='العددان 3×4 و5×4، وبما أن 3 و5 أوليان فيما بينهما فالقاسم الأكبر 4.' AND "DetailedSolutionEn"='Numbers are 3×4 and 5×4; as 3 and 5 are coprime, gcd=4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=233 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=233 AND o."Id"=921
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 233: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون قسمة الأسس المتشابهة: أ^ن ÷ أ^م = أ^(ن − م) عندما يكون أ غير صفري. هنا الأساس 4 نفسه في البسط والمقام، لذلك 4^7 ÷ 4^5 = 4^(7 − 5) = 4^2. نحافظ على صورة القوة لأن المطلوب تبسيط العبارة الأسية.', "DetailedSolutionEn"='Quotient law of exponents: a^n ÷ a^m = a^(n−m) for nonzero a. Both numerator and denominator use base 4, so 4^7 ÷ 4^5 = 4^(7 − 5) = 4^2. The simplified result remains in exponent form.'
 WHERE "Id"=234 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(\frac{4^{7}}{4^{5}}\).' AND "QuestionTextEn"='Simplify \(\frac{4^{7}}{4^{5}}\).'
 AND "DetailedSolutionAr"='نطرح الأسين: 7-5=2.' AND "DetailedSolutionEn"='Subtract the exponents: 7-5=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=234 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=234 AND o."Id"=928
 AND o."IsCorrect" AND o."LatexCode"='4^{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 234: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المضاعف المشترك الأصغر للعددين = حاصل ضربهما ÷ القاسم المشترك الأكبر لهما. العددان 16 و20، والقاسم المشترك الأكبر = 4، لأنهما 4 × 4 و4 × 5. بالتعويض: LCM = (16 × 20) ÷ 4 = 80. هذا أصغر عدد موجب يقبل القسمة على العددين.', "DetailedSolutionEn"='Rule used: Least common multiple = product of the numbers ÷ their greatest common divisor. For 16 and 20, the GCD is 4, because the numbers are 4×4 and 4×5. Therefore LCM = (16 × 20) ÷ 4 = 80, the smallest positive multiple shared by both.'
 WHERE "Id"=235 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد المضاعف المشترك الأصغر للعددين 16 و20.' AND "QuestionTextEn"='Find the least common multiple of 16 and 20.'
 AND "DetailedSolutionAr"='لأن 4 و5 أوليان فيما بينهما فإن المضاعف المشترك الأصغر 20×4=80.' AND "DetailedSolutionEn"='LCM(4,5)=20, so LCM(16,20)=20×4=80.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=235 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=235 AND o."Id"=931
 AND o."IsCorrect" AND o."LatexCode"='80');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 235: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: القاسم المشترك الأكبر للعددين (3 × 5) و(5 × 5) هو 5 لأن 3 و5 لا قاسم مشترك بينهما غير 1. نكتب 15 = 3 × 5 و25 = 5 × 5. الجزء المشترك الأكبر هو 5، ولذلك gcd(15, 25) = 5.', "DetailedSolutionEn"='Rule used: If two numbers are 3 × 5 and 5 × 5, then gcd = 5 because 3 and 5 are coprime. Factor 15 = 3 × 5 and 25 = 5 × 5; the largest shared factor is 5. Thus gcd(15, 25) = 5.'
 WHERE "Id"=245 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد القاسم المشترك الأكبر لـ15 و25.' AND "QuestionTextEn"='Find gcd(15,25).'
 AND "DetailedSolutionAr"='العددان 3×5 و5×5، وبما أن 3 و5 أوليان فيما بينهما فالقاسم الأكبر 5.' AND "DetailedSolutionEn"='Numbers are 3×5 and 5×5; as 3 and 5 are coprime, gcd=5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=245 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=245 AND o."Id"=972
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 245: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون قسمة الأسس المتشابهة: أ^ن ÷ أ^م = أ^(ن − م) عندما يكون أ غير صفري. هنا الأساس 5 نفسه في البسط والمقام، لذلك 5^8 ÷ 5^6 = 5^(8 − 6) = 5^2. نحافظ على صورة القوة لأن المطلوب تبسيط العبارة الأسية.', "DetailedSolutionEn"='Quotient law of exponents: a^n ÷ a^m = a^(n−m) for nonzero a. Both numerator and denominator use base 5, so 5^8 ÷ 5^6 = 5^(8 − 6) = 5^2. The simplified result remains in exponent form.'
 WHERE "Id"=246 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(\frac{5^{8}}{5^{6}}\).' AND "QuestionTextEn"='Simplify \(\frac{5^{8}}{5^{6}}\).'
 AND "DetailedSolutionAr"='نطرح الأسين: 8-6=2.' AND "DetailedSolutionEn"='Subtract the exponents: 8-6=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=246 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=246 AND o."Id"=975
 AND o."IsCorrect" AND o."LatexCode"='5^{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 246: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المضاعف المشترك الأصغر للعددين = حاصل ضربهما ÷ القاسم المشترك الأكبر لهما. العددان 20 و25، والقاسم المشترك الأكبر = 5، لأنهما 5 × 4 و5 × 5. بالتعويض: LCM = (20 × 25) ÷ 5 = 100. هذا أصغر عدد موجب يقبل القسمة على العددين.', "DetailedSolutionEn"='Rule used: Least common multiple = product of the numbers ÷ their greatest common divisor. For 20 and 25, the GCD is 5, because the numbers are 5×4 and 5×5. Therefore LCM = (20 × 25) ÷ 5 = 100, the smallest positive multiple shared by both.'
 WHERE "Id"=247 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد المضاعف المشترك الأصغر للعددين 20 و25.' AND "QuestionTextEn"='Find the least common multiple of 20 and 25.'
 AND "DetailedSolutionAr"='لأن 4 و5 أوليان فيما بينهما فإن المضاعف المشترك الأصغر 20×5=100.' AND "DetailedSolutionEn"='LCM(4,5)=20, so LCM(20,25)=20×5=100.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=247 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=247 AND o."Id"=978
 AND o."IsCorrect" AND o."LatexCode"='100');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 247: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: القاسم المشترك الأكبر للعددين (3 × 6) و(5 × 6) هو 6 لأن 3 و5 لا قاسم مشترك بينهما غير 1. نكتب 18 = 3 × 6 و30 = 5 × 6. الجزء المشترك الأكبر هو 6، ولذلك gcd(18, 30) = 6.', "DetailedSolutionEn"='Rule used: If two numbers are 3 × 6 and 5 × 6, then gcd = 6 because 3 and 5 are coprime. Factor 18 = 3 × 6 and 30 = 5 × 6; the largest shared factor is 6. Thus gcd(18, 30) = 6.'
 WHERE "Id"=257 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد القاسم المشترك الأكبر لـ18 و30.' AND "QuestionTextEn"='Find gcd(18,30).'
 AND "DetailedSolutionAr"='العددان 3×6 و5×6، وبما أن 3 و5 أوليان فيما بينهما فالقاسم الأكبر 6.' AND "DetailedSolutionEn"='Numbers are 3×6 and 5×6; as 3 and 5 are coprime, gcd=6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=257 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=257 AND o."Id"=1019
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 257: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون قسمة الأسس المتشابهة: أ^ن ÷ أ^م = أ^(ن − م) عندما يكون أ غير صفري. هنا الأساس 6 نفسه في البسط والمقام، لذلك 6^9 ÷ 6^7 = 6^(9 − 7) = 6^2. نحافظ على صورة القوة لأن المطلوب تبسيط العبارة الأسية.', "DetailedSolutionEn"='Quotient law of exponents: a^n ÷ a^m = a^(n−m) for nonzero a. Both numerator and denominator use base 6, so 6^9 ÷ 6^7 = 6^(9 − 7) = 6^2. The simplified result remains in exponent form.'
 WHERE "Id"=258 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='بسّط \(\frac{6^{9}}{6^{7}}\).' AND "QuestionTextEn"='Simplify \(\frac{6^{9}}{6^{7}}\).'
 AND "DetailedSolutionAr"='نطرح الأسين: 9-7=2.' AND "DetailedSolutionEn"='Subtract the exponents: 9-7=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=258 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=258 AND o."Id"=1022
 AND o."IsCorrect" AND o."LatexCode"='6^{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 258: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المضاعف المشترك الأصغر للعددين = حاصل ضربهما ÷ القاسم المشترك الأكبر لهما. العددان 24 و30، والقاسم المشترك الأكبر = 6، لأنهما 6 × 4 و6 × 5. بالتعويض: LCM = (24 × 30) ÷ 6 = 120. هذا أصغر عدد موجب يقبل القسمة على العددين.', "DetailedSolutionEn"='Rule used: Least common multiple = product of the numbers ÷ their greatest common divisor. For 24 and 30, the GCD is 6, because the numbers are 6×4 and 6×5. Therefore LCM = (24 × 30) ÷ 6 = 120, the smallest positive multiple shared by both.'
 WHERE "Id"=259 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أوجد المضاعف المشترك الأصغر للعددين 24 و30.' AND "QuestionTextEn"='Find the least common multiple of 24 and 30.'
 AND "DetailedSolutionAr"='لأن 4 و5 أوليان فيما بينهما فإن المضاعف المشترك الأصغر 20×6=120.' AND "DetailedSolutionEn"='LCM(4,5)=20, so LCM(24,30)=20×6=120.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=259 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=259 AND o."Id"=1025
 AND o."IsCorrect" AND o."LatexCode"='120');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 259: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: القوة الثالثة تعني ضرب العدد في نفسه ثلاث مرات، والإشارة السالبة تبقى سالبة عند تكرار عدد سالب عدداً فردياً من المرات. بالتعويض: (−4)³ = (−4) × (−4) × (−4) = 16 × (−4) = −64. الأقواس مهمة لأن الأس يتناول العدد السالب كله.', "DetailedSolutionEn"='Rule used: Cubing a number multiplies it by itself three times. The product of three negative factors is negative. Therefore (−4)³ = (−4) × (−4) × (−4) = 16 × (−4) = −64. Parentheses ensure the negative sign is part of the base.'
 WHERE "Id"=765 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='ما قيمة (−4)³؟' AND "QuestionTextEn"='What is the value of (−4)³?'
 AND "DetailedSolutionAr"='نضرب العدد −4 ثلاث مرات: (−4)×(−4)×(−4) = 16×(−4) = −64.' AND "DetailedSolutionEn"='Multiply the negative base three times: (−4)(−4)(−4) = 16(−4) = −64.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=765 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=765 AND o."Id"=3049
 AND o."IsCorrect" AND o."LatexCode"='-64');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 765: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأس صفر: لأي عدد غير صفري أ، يكون أ⁰ = 1. العدد 17 غير صفري، وبالتالي 17⁰ = 1. ويمكن تفسيره بقانون قسمة الأسس: 17³ ÷ 17³ = 17^(3−3) = 17⁰، وبما أن العدد مقسوماً على نفسه يساوي 1، فالنتيجة 1.', "DetailedSolutionEn"='Zero-exponent law: For any nonzero a, a⁰ = 1. Since 17 is nonzero, 17⁰ = 1. Verify with the quotient law: 17³ ÷ 17³ = 17^(3−3) = 17⁰, but a nonzero number divided by itself equals 1.'
 WHERE "Id"=766 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='أي قيمة تساوي 17⁰؟' AND "QuestionTextEn"='What is 17 to the power zero?'
 AND "DetailedSolutionAr"='أي عدد غير صفري مرفوع للأس صفر يساوي 1، لذا 17⁰ = 1.' AND "DetailedSolutionEn"='Every nonzero number raised to the zero power equals 1. Thus 17⁰ = 1.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=766 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=766 AND o."Id"=3054
 AND o."IsCorrect" AND o."LatexCode"='1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 766: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأس السالب: أ^(−ن) = 1 ÷ أ^ن لأي أساس غير صفري. إذن 2^(−3) = 1 ÷ 2³. نحسب 2³ = 2 × 2 × 2 = 8، فيكون الناتج 1/8 في أبسط صورة. الأس السالب لا يعني أن نتيجة القوة عدد سالب.', "DetailedSolutionEn"='Negative-exponent law: a^(−n) = 1/a^n for nonzero base a. Thus 2^(−3) = 1/2³. Compute 2³ = 2 × 2 × 2 = 8; the simplified result is 1/8. A negative exponent does not make the value negative.'
 WHERE "Id"=767 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='احسب 2⁻³ واكتب الناتج ككسر مبسط.' AND "QuestionTextEn"='Evaluate 2^(-3) and express the result as a simplified fraction.'
 AND "DetailedSolutionAr"='الأس السالب يعني المقلوب: 2⁻³ = 1 / 2³ = 1/8.' AND "DetailedSolutionEn"='A negative exponent means a reciprocal: 2^(-3) = 1/2³ = 1/8.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=767 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=767 AND o."Id"=3057
 AND o."IsCorrect" AND o."LatexCode"='\frac18');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 767: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: حجم المكعب = طول الحرف³ لأن الطول والعرض والارتفاع متساوية. طول الحرف 3 سم، فنحسب الحجم = 3 × 3 × 3 = 3³ = 27 سم³. وحدة الحجم مكعبة، وليست سم أو سم²، لأنها تقيس حيزاً ثلاثي الأبعاد.', "DetailedSolutionEn"='Rule used: Volume of a cube = edge length³ because its length, width and height are equal. With edge 3 cm, V = 3 × 3 × 3 = 3³ = 27 cm³. Volume is measured in cubic units, not square or linear units.'
 WHERE "Id"=768 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='صندوق مكعب طول حرفه 3 سم. ما حجمه بالسم³؟' AND "QuestionTextEn"='A cube-shaped box has an edge length of 3 cm. What is its volume in cm³?'
 AND "DetailedSolutionAr"='حجم المكعب = طول الحرف × نفسه × نفسه = 3³ = 27 سم³.' AND "DetailedSolutionEn"='The volume of a cube is edge length cubed: 3³ = 27 cm³.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=768 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=768 AND o."Id"=3063
 AND o."IsCorrect" AND o."LatexCode"='27');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 768: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: قيمة الدالة f(4) تعني تعويض س = 4 في قاعدة الدالة قبل إجراء العمليات. لدينا f(x) = x² − 3، لذا f(4) = 4² − 3. نحسب الأس أولاً: 4² = 16، ثم 16 − 3 = 13. النتيجة 13.', "DetailedSolutionEn"='Rule used: Evaluate f(4) by substituting x = 4 into the function before applying order of operations. Given f(x) = x² − 3, we obtain f(4) = 4² − 3 = 16 − 3 = 13. The exponent is evaluated before subtraction.'
 WHERE "Id"=42 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت f(x) = x² - 3، فأوجد f(4).' AND "QuestionTextEn"='If f(x) = x² - 3, find f(4).'
 AND "DetailedSolutionAr"='نعوض x = 4 فنحصل على 4² - 3 = 16 - 3 = 13.' AND "DetailedSolutionEn"='Substitute x = 4: 4² - 3 = 16 - 3 = 13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=42 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=42 AND o."Id"=158
 AND o."IsCorrect" AND o."LatexCode"='13');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 42: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لعزل المتغير في معادلة خطية نستخدم العمليات العكسية بالتساوي على طرفي المعادلة. من 2س + 7 = 19 نطرح 7 فنحصل على 2س = 12، ثم نقسم على 2: س = 6. التحقق بالتعويض: 2 × 6 + 7 = 19.', "DetailedSolutionEn"='Rule used: Solve a linear equation with inverse operations applied equally to both sides. From 2x + 7 = 19, subtract 7 to get 2x = 12, then divide by 2: x = 6. Check: 2 × 6 + 7 = 19.'
 WHERE "Id"=58 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='حل المعادلة 2x + 7 = 19.' AND "QuestionTextEn"='Solve the equation 2x + 7 = 19.'
 AND "DetailedSolutionAr"='نطرح 7: 2x = 12، ثم نقسم على 2: x = 6.' AND "DetailedSolutionEn"='Subtract 7: 2x = 12. Divide by 2: x = 6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=58 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=58 AND o."Id"=223
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 58: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لإيجاد قيمة دالة خطية نعوّض عن المتغير س بقيمة المدخل ثم ننفذ الضرب قبل الجمع. قاعدة الدالة f(س) = 2س + 3، والمدخل 2. إذن f(2) = 2 × 2 + 3 = 4 + 3 = 7.', "DetailedSolutionEn"='Rule used: Evaluate a linear function by replacing x with the input and multiplying before adding. For f(x) = 2x + 3 at input 2, calculate f(2) = 2 × 2 + 3 = 4 + 3 = 7.'
 WHERE "Id"=74 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(f(x)=2x+3\)، أوجد \(f(2)\).' AND "QuestionTextEn"='If \(f(x)=2x+3\), find \(f(2)\).'
 AND "DetailedSolutionAr"='بالتعويض نحصل على 2×2+3=7.' AND "DetailedSolutionEn"='Substitute: 2×2+3=7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=74 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=74 AND o."Id"=287
 AND o."IsCorrect" AND o."LatexCode"='7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 74: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لإيجاد قيمة دالة خطية نعوّض عن المتغير س بقيمة المدخل ثم ننفذ الضرب قبل الجمع. قاعدة الدالة f(س) = 3س + 4، والمدخل 3. إذن f(3) = 3 × 3 + 4 = 9 + 4 = 13.', "DetailedSolutionEn"='Rule used: Evaluate a linear function by replacing x with the input and multiplying before adding. For f(x) = 3x + 4 at input 3, calculate f(3) = 3 × 3 + 4 = 9 + 4 = 13.'
 WHERE "Id"=89 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(f(x)=3x+4\)، أوجد \(f(3)\).' AND "QuestionTextEn"='If \(f(x)=3x+4\), find \(f(3)\).'
 AND "DetailedSolutionAr"='بالتعويض نحصل على 3×3+4=13.' AND "DetailedSolutionEn"='Substitute: 3×3+4=13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=89 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=89 AND o."Id"=346
 AND o."IsCorrect" AND o."LatexCode"='13');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 89: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لإيجاد قيمة دالة خطية نعوّض عن المتغير س بقيمة المدخل ثم ننفذ الضرب قبل الجمع. قاعدة الدالة f(س) = 4س + 5، والمدخل 4. إذن f(4) = 4 × 4 + 5 = 16 + 5 = 21.', "DetailedSolutionEn"='Rule used: Evaluate a linear function by replacing x with the input and multiplying before adding. For f(x) = 4x + 5 at input 4, calculate f(4) = 4 × 4 + 5 = 16 + 5 = 21.'
 WHERE "Id"=104 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(f(x)=4x+5\)، أوجد \(f(4)\).' AND "QuestionTextEn"='If \(f(x)=4x+5\), find \(f(4)\).'
 AND "DetailedSolutionAr"='بالتعويض نحصل على 4×4+5=21.' AND "DetailedSolutionEn"='Substitute: 4×4+5=21.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=104 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=104 AND o."Id"=405
 AND o."IsCorrect" AND o."LatexCode"='21');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 104: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لإيجاد قيمة دالة خطية نعوّض عن المتغير س بقيمة المدخل ثم ننفذ الضرب قبل الجمع. قاعدة الدالة f(س) = 5س + 6، والمدخل 5. إذن f(5) = 5 × 5 + 6 = 25 + 6 = 31.', "DetailedSolutionEn"='Rule used: Evaluate a linear function by replacing x with the input and multiplying before adding. For f(x) = 5x + 6 at input 5, calculate f(5) = 5 × 5 + 6 = 25 + 6 = 31.'
 WHERE "Id"=119 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(f(x)=5x+6\)، أوجد \(f(5)\).' AND "QuestionTextEn"='If \(f(x)=5x+6\), find \(f(5)\).'
 AND "DetailedSolutionAr"='بالتعويض نحصل على 5×5+6=31.' AND "DetailedSolutionEn"='Substitute: 5×5+6=31.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=119 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=119 AND o."Id"=468
 AND o."IsCorrect" AND o."LatexCode"='31');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 119: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لإيجاد قيمة دالة خطية نعوّض عن المتغير س بقيمة المدخل ثم ننفذ الضرب قبل الجمع. قاعدة الدالة f(س) = 6س + 7، والمدخل 6. إذن f(6) = 6 × 6 + 7 = 36 + 7 = 43.', "DetailedSolutionEn"='Rule used: Evaluate a linear function by replacing x with the input and multiplying before adding. For f(x) = 6x + 7 at input 6, calculate f(6) = 6 × 6 + 7 = 36 + 7 = 43.'
 WHERE "Id"=134 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(f(x)=6x+7\)، أوجد \(f(6)\).' AND "QuestionTextEn"='If \(f(x)=6x+7\), find \(f(6)\).'
 AND "DetailedSolutionAr"='بالتعويض نحصل على 6×6+7=43.' AND "DetailedSolutionEn"='Substitute: 6×6+7=43.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=134 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=134 AND o."Id"=527
 AND o."IsCorrect" AND o."LatexCode"='43');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 134: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: حل f(س) = 11 يعني إيجاد المدخل الذي يجعل الدالة تساوي 11. لدينا f(س) = 2س + 5؛ نحل 2س + 5 = 11. نطرح 5: 2س = 6، ثم نقسم على 2: س = 6 ÷ 2 = 3. التحقق: 2 × 3 + 5 = 11.', "DetailedSolutionEn"='Rule used: Solving f(x) = 11 finds the input producing that output. With f(x) = 2x + 5, set 2x + 5 = 11. Subtract 5: 2x = 6, then divide by 2: x = 6 ÷ 2 = 3. Check: 2 × 3 + 5 = 11.'
 WHERE "Id"=212 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='لتكن \(f(x)=2x+5\)، إذا كانت \(f(x)=11\) فأوجد x.' AND "QuestionTextEn"='Given \(f(x)=2x+5\), solve f(x)=11.'
 AND "DetailedSolutionAr"='نطرح 5 ثم نقسم على 2 لنجد x=3.' AND "DetailedSolutionEn"='Subtract 5, divide by 2, and obtain x=3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=212 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=212 AND o."Id"=838
 AND o."IsCorrect" AND o."LatexCode"='3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 212: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ميل المستقيم بين نقطتين: م = (ص₂ − ص₁) ÷ (س₂ − س₁)، بشرط اختلاف الإحداثيين السينيين. بين (1،4) و(4،10) يكون التغير الرأسي = 10 − 4 = 6، والتغير الأفقي = 4 − 1 = 3. بالتعويض: الميل = 6 ÷ 3 = 2.', "DetailedSolutionEn"='Slope formula: m = (y₂ − y₁)/(x₂ − x₁) for points with different x-coordinates. Between (1, 4) and (4, 10), the rise is 10 − 4 = 6, and the run is 4 − 1 = 3. Thus m = 6 ÷ 3 = 2.'
 WHERE "Id"=213 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='ما ميل المستقيم المار بالنقطتين (1،4) و(4،10)؟' AND "QuestionTextEn"='Find the slope between (1,4) and (4,10).'
 AND "DetailedSolutionAr"='الميل = (10−4)/(4−1)=6/3=2.' AND "DetailedSolutionEn"='Slope = (10−4)/(4−1)=6/3=2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=213 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=213 AND o."Id"=841
 AND o."IsCorrect" AND o."LatexCode"='2');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 213: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: عند حساب دالة تربيعية نبدأ بالتعويض ثم الأس، وبعده الضرب وأخيراً الجمع. للدالة g(س) = 2س² + 3 عند س = 2: ‏g(2) = 2 × 2² + 3 = 2 × 4 + 3 = 8 + 3 = 11.', "DetailedSolutionEn"='Rule used: For a quadratic function, substitute first, evaluate the exponent, multiply, then add. With g(x) = 2x² + 3 and x = 2, g(2) = 2 × 2² + 3 = 2 × 4 + 3 = 8 + 3 = 11.'
 WHERE "Id"=214 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(g(x)=2x^2+3\)، أوجد \(g(2)\).' AND "QuestionTextEn"='Given \(g(x)=2x^2+3\), find g(2).'
 AND "DetailedSolutionAr"='نحسب 2×2²+3=11.' AND "DetailedSolutionEn"='Compute 2×2²+3=11.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=214 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=214 AND o."Id"=848
 AND o."IsCorrect" AND o."LatexCode"='11');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 214: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: حل f(س) = 18 يعني إيجاد المدخل الذي يجعل الدالة تساوي 18. لدينا f(س) = 3س + 6؛ نحل 3س + 6 = 18. نطرح 6: 3س = 12، ثم نقسم على 3: س = 12 ÷ 3 = 4. التحقق: 3 × 4 + 6 = 18.', "DetailedSolutionEn"='Rule used: Solving f(x) = 18 finds the input producing that output. With f(x) = 3x + 6, set 3x + 6 = 18. Subtract 6: 3x = 12, then divide by 3: x = 12 ÷ 3 = 4. Check: 3 × 4 + 6 = 18.'
 WHERE "Id"=224 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='لتكن \(f(x)=3x+6\)، إذا كانت \(f(x)=18\) فأوجد x.' AND "QuestionTextEn"='Given \(f(x)=3x+6\), solve f(x)=18.'
 AND "DetailedSolutionAr"='نطرح 6 ثم نقسم على 3 لنجد x=4.' AND "DetailedSolutionEn"='Subtract 6, divide by 3, and obtain x=4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=224 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=224 AND o."Id"=885
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 224: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ميل المستقيم بين نقطتين: م = (ص₂ − ص₁) ÷ (س₂ − س₁)، بشرط اختلاف الإحداثيين السينيين. بين (2،5) و(6،17) يكون التغير الرأسي = 17 − 5 = 12، والتغير الأفقي = 6 − 2 = 4. بالتعويض: الميل = 12 ÷ 4 = 3.', "DetailedSolutionEn"='Slope formula: m = (y₂ − y₁)/(x₂ − x₁) for points with different x-coordinates. Between (2, 5) and (6, 17), the rise is 17 − 5 = 12, and the run is 6 − 2 = 4. Thus m = 12 ÷ 4 = 3.'
 WHERE "Id"=225 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='ما ميل المستقيم المار بالنقطتين (2،5) و(6،17)؟' AND "QuestionTextEn"='Find the slope between (2,5) and (6,17).'
 AND "DetailedSolutionAr"='الميل = (17−5)/(6−2)=12/4=3.' AND "DetailedSolutionEn"='Slope = (17−5)/(6−2)=12/4=3.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=225 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=225 AND o."Id"=892
 AND o."IsCorrect" AND o."LatexCode"='3');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 225: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: عند حساب دالة تربيعية نبدأ بالتعويض ثم الأس، وبعده الضرب وأخيراً الجمع. للدالة g(س) = 3س² + 4 عند س = 3: ‏g(3) = 3 × 3² + 4 = 3 × 9 + 4 = 27 + 4 = 31.', "DetailedSolutionEn"='Rule used: For a quadratic function, substitute first, evaluate the exponent, multiply, then add. With g(x) = 3x² + 4 and x = 3, g(3) = 3 × 3² + 4 = 3 × 9 + 4 = 27 + 4 = 31.'
 WHERE "Id"=226 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(g(x)=3x^2+4\)، أوجد \(g(3)\).' AND "QuestionTextEn"='Given \(g(x)=3x^2+4\), find g(3).'
 AND "DetailedSolutionAr"='نحسب 3×3²+4=31.' AND "DetailedSolutionEn"='Compute 3×3²+4=31.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=226 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=226 AND o."Id"=895
 AND o."IsCorrect" AND o."LatexCode"='31');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 226: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: حل f(س) = 27 يعني إيجاد المدخل الذي يجعل الدالة تساوي 27. لدينا f(س) = 4س + 7؛ نحل 4س + 7 = 27. نطرح 7: 4س = 20، ثم نقسم على 4: س = 20 ÷ 4 = 5. التحقق: 4 × 5 + 7 = 27.', "DetailedSolutionEn"='Rule used: Solving f(x) = 27 finds the input producing that output. With f(x) = 4x + 7, set 4x + 7 = 27. Subtract 7: 4x = 20, then divide by 4: x = 20 ÷ 4 = 5. Check: 4 × 5 + 7 = 27.'
 WHERE "Id"=236 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='لتكن \(f(x)=4x+7\)، إذا كانت \(f(x)=27\) فأوجد x.' AND "QuestionTextEn"='Given \(f(x)=4x+7\), solve f(x)=27.'
 AND "DetailedSolutionAr"='نطرح 7 ثم نقسم على 4 لنجد x=5.' AND "DetailedSolutionEn"='Subtract 7, divide by 4, and obtain x=5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=236 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=236 AND o."Id"=936
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 236: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ميل المستقيم بين نقطتين: م = (ص₂ − ص₁) ÷ (س₂ − س₁)، بشرط اختلاف الإحداثيين السينيين. بين (3،6) و(8،26) يكون التغير الرأسي = 26 − 6 = 20، والتغير الأفقي = 8 − 3 = 5. بالتعويض: الميل = 20 ÷ 5 = 4.', "DetailedSolutionEn"='Slope formula: m = (y₂ − y₁)/(x₂ − x₁) for points with different x-coordinates. Between (3, 6) and (8, 26), the rise is 26 − 6 = 20, and the run is 8 − 3 = 5. Thus m = 20 ÷ 5 = 4.'
 WHERE "Id"=237 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='ما ميل المستقيم المار بالنقطتين (3،6) و(8،26)؟' AND "QuestionTextEn"='Find the slope between (3,6) and (8,26).'
 AND "DetailedSolutionAr"='الميل = (26−6)/(8−3)=20/5=4.' AND "DetailedSolutionEn"='Slope = (26−6)/(8−3)=20/5=4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=237 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=237 AND o."Id"=939
 AND o."IsCorrect" AND o."LatexCode"='4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 237: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: عند حساب دالة تربيعية نبدأ بالتعويض ثم الأس، وبعده الضرب وأخيراً الجمع. للدالة g(س) = 4س² + 5 عند س = 4: ‏g(4) = 4 × 4² + 5 = 4 × 16 + 5 = 64 + 5 = 69.', "DetailedSolutionEn"='Rule used: For a quadratic function, substitute first, evaluate the exponent, multiply, then add. With g(x) = 4x² + 5 and x = 4, g(4) = 4 × 4² + 5 = 4 × 16 + 5 = 64 + 5 = 69.'
 WHERE "Id"=238 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(g(x)=4x^2+5\)، أوجد \(g(4)\).' AND "QuestionTextEn"='Given \(g(x)=4x^2+5\), find g(4).'
 AND "DetailedSolutionAr"='نحسب 4×4²+5=69.' AND "DetailedSolutionEn"='Compute 4×4²+5=69.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=238 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=238 AND o."Id"=942
 AND o."IsCorrect" AND o."LatexCode"='69');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 238: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: حل f(س) = 38 يعني إيجاد المدخل الذي يجعل الدالة تساوي 38. لدينا f(س) = 5س + 8؛ نحل 5س + 8 = 38. نطرح 8: 5س = 30، ثم نقسم على 5: س = 30 ÷ 5 = 6. التحقق: 5 × 6 + 8 = 38.', "DetailedSolutionEn"='Rule used: Solving f(x) = 38 finds the input producing that output. With f(x) = 5x + 8, set 5x + 8 = 38. Subtract 8: 5x = 30, then divide by 5: x = 30 ÷ 5 = 6. Check: 5 × 6 + 8 = 38.'
 WHERE "Id"=248 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='لتكن \(f(x)=5x+8\)، إذا كانت \(f(x)=38\) فأوجد x.' AND "QuestionTextEn"='Given \(f(x)=5x+8\), solve f(x)=38.'
 AND "DetailedSolutionAr"='نطرح 8 ثم نقسم على 5 لنجد x=6.' AND "DetailedSolutionEn"='Subtract 8, divide by 5, and obtain x=6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=248 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=248 AND o."Id"=983
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 248: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ميل المستقيم بين نقطتين: م = (ص₂ − ص₁) ÷ (س₂ − س₁)، بشرط اختلاف الإحداثيين السينيين. بين (4،7) و(10،37) يكون التغير الرأسي = 37 − 7 = 30، والتغير الأفقي = 10 − 4 = 6. بالتعويض: الميل = 30 ÷ 6 = 5.', "DetailedSolutionEn"='Slope formula: m = (y₂ − y₁)/(x₂ − x₁) for points with different x-coordinates. Between (4, 7) and (10, 37), the rise is 37 − 7 = 30, and the run is 10 − 4 = 6. Thus m = 30 ÷ 6 = 5.'
 WHERE "Id"=249 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='ما ميل المستقيم المار بالنقطتين (4،7) و(10،37)؟' AND "QuestionTextEn"='Find the slope between (4,7) and (10,37).'
 AND "DetailedSolutionAr"='الميل = (37−7)/(10−4)=30/6=5.' AND "DetailedSolutionEn"='Slope = (37−7)/(10−4)=30/6=5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=249 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=249 AND o."Id"=986
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 249: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: عند حساب دالة تربيعية نبدأ بالتعويض ثم الأس، وبعده الضرب وأخيراً الجمع. للدالة g(س) = 5س² + 6 عند س = 5: ‏g(5) = 5 × 5² + 6 = 5 × 25 + 6 = 125 + 6 = 131.', "DetailedSolutionEn"='Rule used: For a quadratic function, substitute first, evaluate the exponent, multiply, then add. With g(x) = 5x² + 6 and x = 5, g(5) = 5 × 5² + 6 = 5 × 25 + 6 = 125 + 6 = 131.'
 WHERE "Id"=250 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(g(x)=5x^2+6\)، أوجد \(g(5)\).' AND "QuestionTextEn"='Given \(g(x)=5x^2+6\), find g(5).'
 AND "DetailedSolutionAr"='نحسب 5×5²+6=131.' AND "DetailedSolutionEn"='Compute 5×5²+6=131.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=250 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=250 AND o."Id"=989
 AND o."IsCorrect" AND o."LatexCode"='131');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 250: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: حل f(س) = 51 يعني إيجاد المدخل الذي يجعل الدالة تساوي 51. لدينا f(س) = 6س + 9؛ نحل 6س + 9 = 51. نطرح 9: 6س = 42، ثم نقسم على 6: س = 42 ÷ 6 = 7. التحقق: 6 × 7 + 9 = 51.', "DetailedSolutionEn"='Rule used: Solving f(x) = 51 finds the input producing that output. With f(x) = 6x + 9, set 6x + 9 = 51. Subtract 9: 6x = 42, then divide by 6: x = 42 ÷ 6 = 7. Check: 6 × 7 + 9 = 51.'
 WHERE "Id"=260 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='لتكن \(f(x)=6x+9\)، إذا كانت \(f(x)=51\) فأوجد x.' AND "QuestionTextEn"='Given \(f(x)=6x+9\), solve f(x)=51.'
 AND "DetailedSolutionAr"='نطرح 9 ثم نقسم على 6 لنجد x=7.' AND "DetailedSolutionEn"='Subtract 9, divide by 6, and obtain x=7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=260 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=260 AND o."Id"=1030
 AND o."IsCorrect" AND o."LatexCode"='7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 260: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون ميل المستقيم بين نقطتين: م = (ص₂ − ص₁) ÷ (س₂ − س₁)، بشرط اختلاف الإحداثيين السينيين. بين (5،8) و(12،50) يكون التغير الرأسي = 50 − 8 = 42، والتغير الأفقي = 12 − 5 = 7. بالتعويض: الميل = 42 ÷ 7 = 6.', "DetailedSolutionEn"='Slope formula: m = (y₂ − y₁)/(x₂ − x₁) for points with different x-coordinates. Between (5, 8) and (12, 50), the rise is 50 − 8 = 42, and the run is 12 − 5 = 7. Thus m = 42 ÷ 7 = 6.'
 WHERE "Id"=261 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='ما ميل المستقيم المار بالنقطتين (5،8) و(12،50)؟' AND "QuestionTextEn"='Find the slope between (5,8) and (12,50).'
 AND "DetailedSolutionAr"='الميل = (50−8)/(12−5)=42/7=6.' AND "DetailedSolutionEn"='Slope = (50−8)/(12−5)=42/7=6.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=261 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=261 AND o."Id"=1033
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 261: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: عند حساب دالة تربيعية نبدأ بالتعويض ثم الأس، وبعده الضرب وأخيراً الجمع. للدالة g(س) = 6س² + 7 عند س = 6: ‏g(6) = 6 × 6² + 7 = 6 × 36 + 7 = 216 + 7 = 223.', "DetailedSolutionEn"='Rule used: For a quadratic function, substitute first, evaluate the exponent, multiply, then add. With g(x) = 6x² + 7 and x = 6, g(6) = 6 × 6² + 7 = 6 × 36 + 7 = 216 + 7 = 223.'
 WHERE "Id"=262 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='إذا كانت \(g(x)=6x^2+7\)، أوجد \(g(6)\).' AND "QuestionTextEn"='Given \(g(x)=6x^2+7\), find g(6).'
 AND "DetailedSolutionAr"='نحسب 6×6²+7=223.' AND "DetailedSolutionEn"='Compute 6×6²+7=223.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=262 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=262 AND o."Id"=1040
 AND o."IsCorrect" AND o."LatexCode"='223');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 262: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المعادلة 4(س − 3) = 28، يمكن فك الضرب بقسمة الطرفين على 4 أولاً. نحصل على س − 3 = 28 ÷ 4 = 7، ثم نضيف 3 إلى الطرفين: س = 10. التحقق: 4 × (10 − 3) = 4 × 7 = 28.', "DetailedSolutionEn"='Rule used: Undo the outer multiplication before the subtraction. From 4(x − 3) = 28, divide both sides by 4 to obtain x − 3 = 7. Add 3 to both sides: x = 10. Check: 4 × (10 − 3) = 28.'
 WHERE "Id"=621 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='حل المعادلة: 4(x − 3) = 28.' AND "QuestionTextEn"='Solve 4(x − 3) = 28.'
 AND "DetailedSolutionAr"='نقسم على 4 فنحصل على x − 3 = 7، ثم نضيف 3، فيكون x = 10.' AND "DetailedSolutionEn"='Divide by 4 to get x − 3 = 7, then add 3 to get x = 10.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=621 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=621 AND o."Id"=2475
 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 621: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: لجمع حدود المتغير في طرف واحد من المعادلة نطرح 2س من الطرفين: 2س + 5 = 3س − 8 تصبح 5 = س − 8. نضيف 8 إلى الطرفين: س = 13. التحقق: الطرف الأيسر 2 × 13 + 5 = 31، والأيمن 3 × 13 − 8 = 31.', "DetailedSolutionEn"='Rule used: Collect variable terms on one side. Subtract 2x from both sides of 2x + 5 = 3x − 8 to obtain 5 = x − 8. Add 8: x = 13. Check: 2 × 13 + 5 = 31 and 3 × 13 − 8 = 31.'
 WHERE "Id"=622 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='أوجد x من المعادلة: 2x + 5 = 3x − 8.' AND "QuestionTextEn"='Find x from 2x + 5 = 3x − 8.'
 AND "DetailedSolutionAr"='بطرح 2x وإضافة 8 نحصل على 13 = x.' AND "DetailedSolutionEn"='Subtract 2x from both sides and add 8 to obtain x = 13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=622 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=622 AND o."Id"=2480
 AND o."IsCorrect" AND o."LatexCode"='13');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 622: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: الضرب يعكس القسمة. في (س + 6) ÷ 3 = 9 نضرب طرفي المعادلة في 3 لنحصل على س + 6 = 27. نطرح 6: س = 27 − 6 = 21. التحقق: (21 + 6) ÷ 3 = 9.', "DetailedSolutionEn"='Rule used: Multiplication undoes division. From (x + 6)/3 = 9, multiply both sides by 3 to obtain x + 6 = 27. Subtract 6: x = 27 − 6 = 21. Check: (21 + 6)/3 = 9.'
 WHERE "Id"=623 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='حل: (x + 6) ÷ 3 = 9.' AND "QuestionTextEn"='Solve (x + 6) ÷ 3 = 9.'
 AND "DetailedSolutionAr"='نضرب الطرفين في 3: x + 6 = 27، لذلك x = 21.' AND "DetailedSolutionEn"='Multiply both sides by 3: x + 6 = 27, so x = 21.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=623 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=623 AND o."Id"=2483
 AND o."IsCorrect" AND o."LatexCode"='21');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 623: stale answer/question/source; rollback batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: نحول المسألة الكلامية إلى معادلة ثم نعزل المجهول. إذا كان سعر الدفتر الواحد س، فإن ثمن 3 دفاتر مع توصيل 5 وحدات هو 3س + 5 = 41. نطرح 5 لنحصل على 3س = 36، ثم س = 36 ÷ 3 = 12 وحدة للدفتر. التحقق: 3 × 12 + 5 = 41.', "DetailedSolutionEn"='Rule used: Translate the word problem into an equation. Let x be the price of one notebook: 3x + 5 = 41 for three identical notebooks plus delivery. Subtract 5 to get 3x = 36; divide by 3: x = 12 units. Check: 3 × 12 + 5 = 41.'
 WHERE "Id"=624 AND "StageId"=2 AND "CategoryId"=6
 AND "QuestionTextAr"='ثمن 3 دفاتر متساوية السعر مع رسوم توصيل 5 وحدات هو 41 وحدة. ما ثمن الدفتر الواحد؟' AND "QuestionTextEn"='Three equally priced notebooks plus 5 units for delivery cost 41 units in total. How much does one notebook cost?'
 AND "DetailedSolutionAr"='إذا كان سعر الدفتر x، فـ 3x + 5 = 41. إذن 3x = 36 ومنه x = 12.' AND "DetailedSolutionEn"='Let x be the price per notebook. Then 3x + 5 = 41, so 3x = 36 and x = 12.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=624 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=624 AND o."Id"=2486
 AND o."IsCorrect" AND o."LatexCode"='12');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle theory/algebra problem 624: stale answer/question/source; rollback batch'; END IF;
END $mw_middle_number_theory_algebra$;
COMMIT;
