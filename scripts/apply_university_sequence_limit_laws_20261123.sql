-- One-time, atomic explanation-only changes to 12 university sequence-limit questions.
-- Refuse stale question/answer texts and leave learner history, billing, and options alone.
BEGIN;
DO $mw_uni_seq$
DECLARE affected int;
BEGIN
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان البسط ثابتاً والمقام n يزداد بلا حد، فإن الكسر يميل إلى الصفر. في المتتالية aₙ = 1/n نحسب مثلاً 1/10 = 0.1 و1/100 = 0.01، فتتناقص القيم نحو 0. وبالتعريف: لكل ε > 0 نختار n > 1/ε، فيصير |1/n − 0| < ε، إذن النهاية 0.',"DetailedSolutionEn"='Rule used: A fixed numerator divided by an unbounded positive denominator tends to zero. For aₙ = 1/n, for every ε > 0 choose n > 1/ε. Then |1/n − 0| = 1/n < ε. Therefore lim(n→∞) 1/n = 0.'
 WHERE "Id"=52 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='ما نهاية المتتالية 1/n عندما n تؤول إلى ما لا نهاية؟' AND "QuestionTextEn"='What is the limit of the sequence 1/n as n tends to infinity?'
 AND "DetailedSolutionAr"='كلما كبرت n تناقصت 1/n واقتربت من الصفر، لذلك النهاية صفر.' AND "DetailedSolutionEn"='As n grows without bound, 1/n approaches 0, so the limit is zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=52 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=52 AND o."Id"=200 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',52; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان c ثابتاً فإن lim(c/n) = 0 عند n → ∞. في المتتالية aₙ = 3/n: لأي ε > 0 نختار n > 3/ε، عندئذ |3/n − 0| < ε. لهذا تتقارب المتتالية إلى الصفر رغم أن كل حدودها موجبة.',"DetailedSolutionEn"='Rule used: For any fixed real constant c, c/n → 0 as n → ∞. For aₙ = 3/n and any ε > 0, choose n > 3/ε. Then |3/n − 0| < ε, proving that the sequence converges to 0.'
 WHERE "Id"=146 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='أوجد نهاية المتتالية \(a_n=\frac{3}{n}\) عندما \(n\to\infty\).' AND "QuestionTextEn"='Find the limit of \(a_n=\frac{3}{n}\) as \(n\to\infty\).'
 AND "DetailedSolutionAr"='عندما يزداد n بلا حد، يقترب الكسر 3/n من الصفر.' AND "DetailedSolutionEn"='As n grows without bound, 3/n tends to zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=146 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=146 AND o."Id"=575 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',146; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: الكسر ذو البسط الثابت والمقام الذي يزداد إلى ما لا نهاية يتقارب إلى الصفر. للمتتالية aₙ = 2/(n+1)، لأي ε > 0 نختار n أكبر من 2/ε، عندها 0 < 2/(n+1) < ε. إذن lim(aₙ) عندما n → ∞ يساوي 0.',"DetailedSolutionEn"='Rule used: A constant divided by a denominator increasing without bound has limit zero. For aₙ = 2/(n+1), given any ε > 0 choose n > 2/ε. Then 0 < 2/(n+1) < ε, proving lim(n→∞) aₙ = 0.'
 WHERE "Id"=338 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='أوجد نهاية \(a_n=\frac{2}{n+1}\) عندما \(n\to\infty\).' AND "QuestionTextEn"='Find limit of \(a_n=\frac{2}{n+1}\) as n tends to infinity.'
 AND "DetailedSolutionAr"='البسط ثابت والمقام ينمو بلا حد؛ النهاية صفر.' AND "DetailedSolutionEn"='Numerator stays constant and denominator grows, so the limit is zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=338 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=338 AND o."Id"=1344 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',338; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: الكسر ذو البسط الثابت والمقام الذي يزداد إلى ما لا نهاية يتقارب إلى الصفر. للمتتالية aₙ = 3/(n+1)، لأي ε > 0 نختار n أكبر من 3/ε، عندها 0 < 3/(n+1) < ε. إذن lim(aₙ) عندما n → ∞ يساوي 0.',"DetailedSolutionEn"='Rule used: A constant divided by a denominator increasing without bound has limit zero. For aₙ = 3/(n+1), given any ε > 0 choose n > 3/ε. Then 0 < 3/(n+1) < ε, proving lim(n→∞) aₙ = 0.'
 WHERE "Id"=350 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='أوجد نهاية \(a_n=\frac{3}{n+1}\) عندما \(n\to\infty\).' AND "QuestionTextEn"='Find limit of \(a_n=\frac{3}{n+1}\) as n tends to infinity.'
 AND "DetailedSolutionAr"='البسط ثابت والمقام ينمو بلا حد؛ النهاية صفر.' AND "DetailedSolutionEn"='Numerator stays constant and denominator grows, so the limit is zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=350 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=350 AND o."Id"=1391 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',350; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: الكسر ذو البسط الثابت والمقام الذي يزداد إلى ما لا نهاية يتقارب إلى الصفر. للمتتالية aₙ = 4/(n+1)، لأي ε > 0 نختار n أكبر من 4/ε، عندها 0 < 4/(n+1) < ε. إذن lim(aₙ) عندما n → ∞ يساوي 0.',"DetailedSolutionEn"='Rule used: A constant divided by a denominator increasing without bound has limit zero. For aₙ = 4/(n+1), given any ε > 0 choose n > 4/ε. Then 0 < 4/(n+1) < ε, proving lim(n→∞) aₙ = 0.'
 WHERE "Id"=362 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='أوجد نهاية \(a_n=\frac{4}{n+1}\) عندما \(n\to\infty\).' AND "QuestionTextEn"='Find limit of \(a_n=\frac{4}{n+1}\) as n tends to infinity.'
 AND "DetailedSolutionAr"='البسط ثابت والمقام ينمو بلا حد؛ النهاية صفر.' AND "DetailedSolutionEn"='Numerator stays constant and denominator grows, so the limit is zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=362 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=362 AND o."Id"=1438 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',362; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: الكسر ذو البسط الثابت والمقام الذي يزداد إلى ما لا نهاية يتقارب إلى الصفر. للمتتالية aₙ = 5/(n+1)، لأي ε > 0 نختار n أكبر من 5/ε، عندها 0 < 5/(n+1) < ε. إذن lim(aₙ) عندما n → ∞ يساوي 0.',"DetailedSolutionEn"='Rule used: A constant divided by a denominator increasing without bound has limit zero. For aₙ = 5/(n+1), given any ε > 0 choose n > 5/ε. Then 0 < 5/(n+1) < ε, proving lim(n→∞) aₙ = 0.'
 WHERE "Id"=374 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='أوجد نهاية \(a_n=\frac{5}{n+1}\) عندما \(n\to\infty\).' AND "QuestionTextEn"='Find limit of \(a_n=\frac{5}{n+1}\) as n tends to infinity.'
 AND "DetailedSolutionAr"='البسط ثابت والمقام ينمو بلا حد؛ النهاية صفر.' AND "DetailedSolutionEn"='Numerator stays constant and denominator grows, so the limit is zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=374 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=374 AND o."Id"=1485 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',374; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: الكسر ذو البسط الثابت والمقام الذي يزداد إلى ما لا نهاية يتقارب إلى الصفر. للمتتالية aₙ = 6/(n+1)، لأي ε > 0 نختار n أكبر من 6/ε، عندها 0 < 6/(n+1) < ε. إذن lim(aₙ) عندما n → ∞ يساوي 0.',"DetailedSolutionEn"='Rule used: A constant divided by a denominator increasing without bound has limit zero. For aₙ = 6/(n+1), given any ε > 0 choose n > 6/ε. Then 0 < 6/(n+1) < ε, proving lim(n→∞) aₙ = 0.'
 WHERE "Id"=386 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='أوجد نهاية \(a_n=\frac{6}{n+1}\) عندما \(n\to\infty\).' AND "QuestionTextEn"='Find limit of \(a_n=\frac{6}{n+1}\) as n tends to infinity.'
 AND "DetailedSolutionAr"='البسط ثابت والمقام ينمو بلا حد؛ النهاية صفر.' AND "DetailedSolutionEn"='Numerator stays constant and denominator grows, so the limit is zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=386 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=386 AND o."Id"=1536 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',386; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان |r| < 1 فإن المتتالية الهندسية rⁿ تتقارب إلى الصفر. في حالتنا r = 1/2، وهو بين الصفر والواحد؛ بالتالي aₙ = (1/2)ⁿ = 1/2ⁿ. ومع زيادة n يكبر المقام 2ⁿ بلا حد، لذا lim(aₙ) = 0.',"DetailedSolutionEn"='Rule used: For a geometric sequence rⁿ with |r| < 1, the terms tend to zero. Here r = 1/2 lies strictly between 0 and 1, so aₙ = (1/2)ⁿ = 1/2ⁿ. As n increases, 2ⁿ grows without bound; hence lim aₙ = 0.'
 WHERE "Id"=339 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='ما نهاية \(a_n=(\frac{1}{2})^n\) عندما \(n\to\infty\)؟' AND "QuestionTextEn"='Find the limit of \(a_n=(\frac{1}{2})^n\) as n tends to infinity.'
 AND "DetailedSolutionAr"='بما أن 0<1/2<1 فالقوى تتجه إلى صفر.' AND "DetailedSolutionEn"='Because 0<1/2<1, its powers tend to zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=339 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=339 AND o."Id"=1347 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',339; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان |r| < 1 فإن المتتالية الهندسية rⁿ تتقارب إلى الصفر. في حالتنا r = 1/3، وهو بين الصفر والواحد؛ بالتالي aₙ = (1/3)ⁿ = 1/3ⁿ. ومع زيادة n يكبر المقام 3ⁿ بلا حد، لذا lim(aₙ) = 0.',"DetailedSolutionEn"='Rule used: For a geometric sequence rⁿ with |r| < 1, the terms tend to zero. Here r = 1/3 lies strictly between 0 and 1, so aₙ = (1/3)ⁿ = 1/3ⁿ. As n increases, 3ⁿ grows without bound; hence lim aₙ = 0.'
 WHERE "Id"=351 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='ما نهاية \(a_n=(\frac{1}{3})^n\) عندما \(n\to\infty\)؟' AND "QuestionTextEn"='Find the limit of \(a_n=(\frac{1}{3})^n\) as n tends to infinity.'
 AND "DetailedSolutionAr"='بما أن 0<1/3<1 فالقوى تتجه إلى صفر.' AND "DetailedSolutionEn"='Because 0<1/3<1, its powers tend to zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=351 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=351 AND o."Id"=1394 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',351; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان |r| < 1 فإن المتتالية الهندسية rⁿ تتقارب إلى الصفر. في حالتنا r = 1/4، وهو بين الصفر والواحد؛ بالتالي aₙ = (1/4)ⁿ = 1/4ⁿ. ومع زيادة n يكبر المقام 4ⁿ بلا حد، لذا lim(aₙ) = 0.',"DetailedSolutionEn"='Rule used: For a geometric sequence rⁿ with |r| < 1, the terms tend to zero. Here r = 1/4 lies strictly between 0 and 1, so aₙ = (1/4)ⁿ = 1/4ⁿ. As n increases, 4ⁿ grows without bound; hence lim aₙ = 0.'
 WHERE "Id"=363 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='ما نهاية \(a_n=(\frac{1}{4})^n\) عندما \(n\to\infty\)؟' AND "QuestionTextEn"='Find the limit of \(a_n=(\frac{1}{4})^n\) as n tends to infinity.'
 AND "DetailedSolutionAr"='بما أن 0<1/4<1 فالقوى تتجه إلى صفر.' AND "DetailedSolutionEn"='Because 0<1/4<1, its powers tend to zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=363 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=363 AND o."Id"=1441 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',363; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان |r| < 1 فإن المتتالية الهندسية rⁿ تتقارب إلى الصفر. في حالتنا r = 1/5، وهو بين الصفر والواحد؛ بالتالي aₙ = (1/5)ⁿ = 1/5ⁿ. ومع زيادة n يكبر المقام 5ⁿ بلا حد، لذا lim(aₙ) = 0.',"DetailedSolutionEn"='Rule used: For a geometric sequence rⁿ with |r| < 1, the terms tend to zero. Here r = 1/5 lies strictly between 0 and 1, so aₙ = (1/5)ⁿ = 1/5ⁿ. As n increases, 5ⁿ grows without bound; hence lim aₙ = 0.'
 WHERE "Id"=375 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='ما نهاية \(a_n=(\frac{1}{5})^n\) عندما \(n\to\infty\)؟' AND "QuestionTextEn"='Find the limit of \(a_n=(\frac{1}{5})^n\) as n tends to infinity.'
 AND "DetailedSolutionAr"='بما أن 0<1/5<1 فالقوى تتجه إلى صفر.' AND "DetailedSolutionEn"='Because 0<1/5<1, its powers tend to zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=375 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=375 AND o."Id"=1492 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',375; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: إذا كان |r| < 1 فإن المتتالية الهندسية rⁿ تتقارب إلى الصفر. في حالتنا r = 1/6، وهو بين الصفر والواحد؛ بالتالي aₙ = (1/6)ⁿ = 1/6ⁿ. ومع زيادة n يكبر المقام 6ⁿ بلا حد، لذا lim(aₙ) = 0.',"DetailedSolutionEn"='Rule used: For a geometric sequence rⁿ with |r| < 1, the terms tend to zero. Here r = 1/6 lies strictly between 0 and 1, so aₙ = (1/6)ⁿ = 1/6ⁿ. As n increases, 6ⁿ grows without bound; hence lim aₙ = 0.'
 WHERE "Id"=387 AND "StageId"=4 AND "CategoryId"=36
 AND "QuestionTextAr"='ما نهاية \(a_n=(\frac{1}{6})^n\) عندما \(n\to\infty\)؟' AND "QuestionTextEn"='Find the limit of \(a_n=(\frac{1}{6})^n\) as n tends to infinity.'
 AND "DetailedSolutionAr"='بما أن 0<1/6<1 فالقوى تتجه إلى صفر.' AND "DetailedSolutionEn"='Because 0<1/6<1, its powers tend to zero.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=387 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=387 AND o."Id"=1539 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'University sequence % changed; abort',387; END IF;
END $mw_uni_seq$;
COMMIT;
