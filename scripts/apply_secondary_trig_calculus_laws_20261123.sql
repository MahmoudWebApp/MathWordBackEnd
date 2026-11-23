-- Final 45 stage-three calculus/trigonometry worked-solution explanations.
-- Atomic one-time exact-original-question / original-solution / correct-answer guarded update.
-- Only DetailedSolutionAr and DetailedSolutionEn modified.
BEGIN;
DO $mw_secondary_trig_calculus$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: جيب الزاوية في مثلث قائم = طول الضلع المقابل ÷ طول الوتر. في مثلث زواياه 30° و60° و90° يكون الضلع المقابل لـ30° نصف الوتر؛ لذا sin(30°) = 1 ÷ 2 = 1/2. هذه قيمة دقيقة وليست تقريباً عشرياً.', "DetailedSolutionEn"='Rule used: In a right triangle, sine = opposite side ÷ hypotenuse. In a 30°–60°–90° triangle, the side opposite 30° is half the hypotenuse. Therefore sin(30°) = 1/2. This is an exact trigonometric value.'
 WHERE "Id"=22 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما قيمة $\sin 30^\circ$؟' AND "QuestionTextEn"='What is the value of $\sin 30^\circ$?'
 AND "DetailedSolutionAr"='حسب جدول النسب المثلثية، $\sin 30^\circ = \frac{1}{2}$.' AND "DetailedSolutionEn"='According to the trigonometric ratios table, $\sin 30^\circ = \frac{1}{2}$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=22 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=22
 AND o."Id"=77 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 22 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: جيب تمام الزاوية في مثلث قائم = طول الضلع المجاور ÷ الوتر. في المثلث ذي الزوايا 30° و60° و90° يساوي الضلع المجاور للزاوية 60° نصف الوتر. إذن cos(60°) = 1/2، وهي قيمة دقيقة.', "DetailedSolutionEn"='Rule used: In a right triangle, cosine = adjacent side ÷ hypotenuse. In a 30°–60°–90° triangle, the side adjacent to the 60° angle is half the hypotenuse, so cos(60°) = 1/2 exactly.'
 WHERE "Id"=46 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما قيمة cos(60°)؟' AND "QuestionTextEn"='What is cos(60°)?'
 AND "DetailedSolutionAr"='من القيم المثلثية الأساسية: cos(60°) = 1/2.' AND "DetailedSolutionEn"='From standard trigonometric values, cos(60°) = 1/2.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=46 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=46
 AND o."Id"=174 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 46 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: ظل الزاوية في المثلث القائم = المقابل ÷ المجاور. في مثلث 45°–45°–90° تكون الساقان متساويتين، لذلك طول المقابل يساوي طول المجاور. بالتعويض: tan(45°) = الساق ÷ الساق = 1، بشرط أن الساق غير صفرية.', "DetailedSolutionEn"='Rule used: Tangent of an acute angle in a right triangle = opposite ÷ adjacent. In a 45°–45°–90° triangle, the two legs are equal. Therefore tan(45°) = leg/leg = 1, with a nonzero leg.'
 WHERE "Id"=62 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما قيمة tan(45°)؟' AND "QuestionTextEn"='What is tan(45°)?'
 AND "DetailedSolutionAr"='من القيم المثلثية الأساسية: tan(45°) = 1.' AND "DetailedSolutionEn"='From standard trigonometric values, tan(45°) = 1.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=62 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=62
 AND o."Id"=239 AND o."IsCorrect" AND o."LatexCode"='1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 62 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: sin(θ) = طول الضلع المقابل للزاوية θ ÷ طول الوتر في المثلث القائم. المعطيات: المقابل = 3 والوتر = 5. بالتعويض: sin(θ) = 3 ÷ 5 = 3/5. لا نستخدم الضلع المجاور عند حساب الجيب.', "DetailedSolutionEn"='Right-triangle sine rule: sin(θ) = opposite side ÷ hypotenuse. The opposite side is 3 and the hypotenuse is 5; substitute sin(θ) = 3/5. The adjacent side is not used when calculating sine.'
 WHERE "Id"=78 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مثلث قائم: الضلع المقابل للزاوية θ يساوي 3 والوتر 5 والمجاور 4. أوجد \(\sin\theta\).' AND "QuestionTextEn"='In a right triangle opposite θ is 3, hypotenuse 5, adjacent 4. Find \(\sin\theta\).'
 AND "DetailedSolutionAr"='الجيب = المقابل ÷ الوتر = 3/5.' AND "DetailedSolutionEn"='Sine = opposite / hypotenuse = 3/5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=78 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=78
 AND o."Id"=303 AND o."IsCorrect" AND o."LatexCode"='\frac{3}{5}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 78 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: sin(θ) = طول الضلع المقابل للزاوية θ ÷ طول الوتر في المثلث القائم. المعطيات: المقابل = 5 والوتر = 13. بالتعويض: sin(θ) = 5 ÷ 13 = 5/13. لا نستخدم الضلع المجاور عند حساب الجيب.', "DetailedSolutionEn"='Right-triangle sine rule: sin(θ) = opposite side ÷ hypotenuse. The opposite side is 5 and the hypotenuse is 13; substitute sin(θ) = 5/13. The adjacent side is not used when calculating sine.'
 WHERE "Id"=93 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مثلث قائم: الضلع المقابل للزاوية θ يساوي 5 والوتر 13 والمجاور 12. أوجد \(\sin\theta\).' AND "QuestionTextEn"='In a right triangle opposite θ is 5, hypotenuse 13, adjacent 12. Find \(\sin\theta\).'
 AND "DetailedSolutionAr"='الجيب = المقابل ÷ الوتر = 5/13.' AND "DetailedSolutionEn"='Sine = opposite / hypotenuse = 5/13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=93 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=93
 AND o."Id"=362 AND o."IsCorrect" AND o."LatexCode"='\frac{5}{13}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 93 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: sin(θ) = طول الضلع المقابل للزاوية θ ÷ طول الوتر في المثلث القائم. المعطيات: المقابل = 8 والوتر = 17. بالتعويض: sin(θ) = 8 ÷ 17 = 8/17. لا نستخدم الضلع المجاور عند حساب الجيب.', "DetailedSolutionEn"='Right-triangle sine rule: sin(θ) = opposite side ÷ hypotenuse. The opposite side is 8 and the hypotenuse is 17; substitute sin(θ) = 8/17. The adjacent side is not used when calculating sine.'
 WHERE "Id"=108 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مثلث قائم: الضلع المقابل للزاوية θ يساوي 8 والوتر 17 والمجاور 15. أوجد \(\sin\theta\).' AND "QuestionTextEn"='In a right triangle opposite θ is 8, hypotenuse 17, adjacent 15. Find \(\sin\theta\).'
 AND "DetailedSolutionAr"='الجيب = المقابل ÷ الوتر = 8/17.' AND "DetailedSolutionEn"='Sine = opposite / hypotenuse = 8/17.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=108 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=108
 AND o."Id"=421 AND o."IsCorrect" AND o."LatexCode"='\frac{8}{17}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 108 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: sin(θ) = طول الضلع المقابل للزاوية θ ÷ طول الوتر في المثلث القائم. المعطيات: المقابل = 7 والوتر = 25. بالتعويض: sin(θ) = 7 ÷ 25 = 7/25. لا نستخدم الضلع المجاور عند حساب الجيب.', "DetailedSolutionEn"='Right-triangle sine rule: sin(θ) = opposite side ÷ hypotenuse. The opposite side is 7 and the hypotenuse is 25; substitute sin(θ) = 7/25. The adjacent side is not used when calculating sine.'
 WHERE "Id"=123 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مثلث قائم: الضلع المقابل للزاوية θ يساوي 7 والوتر 25 والمجاور 24. أوجد \(\sin\theta\).' AND "QuestionTextEn"='In a right triangle opposite θ is 7, hypotenuse 25, adjacent 24. Find \(\sin\theta\).'
 AND "DetailedSolutionAr"='الجيب = المقابل ÷ الوتر = 7/25.' AND "DetailedSolutionEn"='Sine = opposite / hypotenuse = 7/25.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=123 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=123
 AND o."Id"=484 AND o."IsCorrect" AND o."LatexCode"='\frac{7}{25}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 123 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: sin(θ) = طول الضلع المقابل للزاوية θ ÷ طول الوتر في المثلث القائم. المعطيات: المقابل = 9 والوتر = 41. بالتعويض: sin(θ) = 9 ÷ 41 = 9/41. لا نستخدم الضلع المجاور عند حساب الجيب.', "DetailedSolutionEn"='Right-triangle sine rule: sin(θ) = opposite side ÷ hypotenuse. The opposite side is 9 and the hypotenuse is 41; substitute sin(θ) = 9/41. The adjacent side is not used when calculating sine.'
 WHERE "Id"=138 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مثلث قائم: الضلع المقابل للزاوية θ يساوي 9 والوتر 41 والمجاور 40. أوجد \(\sin\theta\).' AND "QuestionTextEn"='In a right triangle opposite θ is 9, hypotenuse 41, adjacent 40. Find \(\sin\theta\).'
 AND "DetailedSolutionAr"='الجيب = المقابل ÷ الوتر = 9/41.' AND "DetailedSolutionEn"='Sine = opposite / hypotenuse = 9/41.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=138 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=138
 AND o."Id"=543 AND o."IsCorrect" AND o."LatexCode"='\frac{9}{41}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 138 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: cos(θ) = طول الضلع المجاور للزاوية ÷ طول الوتر في المثلث القائم. الضلع المجاور 4 والوتر 5؛ بالتعويض: cos(θ) = 4 ÷ 5 = 4/5. بما أن المجاور أقصر من الوتر فالنتيجة أقل من 1.', "DetailedSolutionEn"='Right-triangle cosine rule: cos(θ) = adjacent side ÷ hypotenuse. With adjacent 4 and hypotenuse 5, substitute cos(θ) = 4/5. Since a triangle''s leg is shorter than its hypotenuse, this positive ratio is below 1.'
 WHERE "Id"=272 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مجاور الزاوية θ في مثلث قائم 4 والوتر 5، أوجد \(\cos\theta\).' AND "QuestionTextEn"='Right triangle: adjacent to θ is 4, hypotenuse 5. Find cos θ.'
 AND "DetailedSolutionAr"='جيب التمام=4/5.' AND "DetailedSolutionEn"='Cosine=adjacent/hypotenuse=4/5.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=272 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=272
 AND o."Id"=1078 AND o."IsCorrect" AND o."LatexCode"='\frac{4}{5}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 272 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: tan(θ) = طول الضلع المقابل للزاوية ÷ طول الضلع المجاور، وليس المقابل ÷ الوتر. المعطيات: المقابل 3 والمجاور 4. بالتعويض: tan(θ) = 3 ÷ 4 = 3/4. لا نحتاج حساب طول الوتر لهذا السؤال.', "DetailedSolutionEn"='Right-triangle tangent rule: tan(θ) = opposite side ÷ adjacent side, not opposite ÷ hypotenuse. Given opposite 3 and adjacent 4, substitute tan(θ) = 3/4. The hypotenuse is unnecessary for tangent here.'
 WHERE "Id"=273 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مقابل الزاوية θ 3 والمجاور 4 في مثلث قائم، أوجد \(\tan\theta\).' AND "QuestionTextEn"='Right triangle: opposite θ is 3, adjacent 4. Find tan θ.'
 AND "DetailedSolutionAr"='في المثلث القائم، ظل الزاوية يساوي طول الضلع المقابل مقسوماً على طول المجاور: $\tan\theta=\frac{3}{4}$.' AND "DetailedSolutionEn"='In a right triangle, tangent is the opposite side divided by the adjacent side: $\tan\theta=\frac{3}{4}$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=273 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=273
 AND o."Id"=1081 AND o."IsCorrect" AND o."LatexCode"='\frac{3}{4}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 273 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: جيب الزاوية يمثل الإحداثي الصادي لنقطة على دائرة الوحدة. عند 0° تقع النقطة عند (1،0)، لذلك الإحداثي الصادي يساوي 0. ومن ثم sin(0°) = 0. ويمكن رؤيته أيضاً في مثلث قائم عندما يقترب الضلع المقابل من الصفر.', "DetailedSolutionEn"='Unit-circle rule: Sine is the y-coordinate of the point on the unit circle. At angle 0°, the point is (1,0), so its y-coordinate is 0. Therefore sin(0°) = 0. This agrees with the right-triangle limiting picture.'
 WHERE "Id"=274 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما القيمة الدقيقة لجيب الزاوية 0°؟' AND "QuestionTextEn"='Find the exact sine of angle 0°.'
 AND "DetailedSolutionAr"='من جدول الزوايا الخاصة: الجيب=0.' AND "DetailedSolutionEn"='From special-angle values, sine=0.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=274 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=274
 AND o."Id"=1088 AND o."IsCorrect" AND o."LatexCode"='0');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 274 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: cos(θ) = طول الضلع المجاور للزاوية ÷ طول الوتر في المثلث القائم. الضلع المجاور 12 والوتر 13؛ بالتعويض: cos(θ) = 12 ÷ 13 = 12/13. بما أن المجاور أقصر من الوتر فالنتيجة أقل من 1.', "DetailedSolutionEn"='Right-triangle cosine rule: cos(θ) = adjacent side ÷ hypotenuse. With adjacent 12 and hypotenuse 13, substitute cos(θ) = 12/13. Since a triangle''s leg is shorter than its hypotenuse, this positive ratio is below 1.'
 WHERE "Id"=284 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مجاور الزاوية θ في مثلث قائم 12 والوتر 13، أوجد \(\cos\theta\).' AND "QuestionTextEn"='Right triangle: adjacent to θ is 12, hypotenuse 13. Find cos θ.'
 AND "DetailedSolutionAr"='جيب التمام=12/13.' AND "DetailedSolutionEn"='Cosine=adjacent/hypotenuse=12/13.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=284 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=284
 AND o."Id"=1125 AND o."IsCorrect" AND o."LatexCode"='\frac{12}{13}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 284 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: tan(θ) = طول الضلع المقابل للزاوية ÷ طول الضلع المجاور، وليس المقابل ÷ الوتر. المعطيات: المقابل 5 والمجاور 12. بالتعويض: tan(θ) = 5 ÷ 12 = 5/12. لا نحتاج حساب طول الوتر لهذا السؤال.', "DetailedSolutionEn"='Right-triangle tangent rule: tan(θ) = opposite side ÷ adjacent side, not opposite ÷ hypotenuse. Given opposite 5 and adjacent 12, substitute tan(θ) = 5/12. The hypotenuse is unnecessary for tangent here.'
 WHERE "Id"=285 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مقابل الزاوية θ 5 والمجاور 12 في مثلث قائم، أوجد \(\tan\theta\).' AND "QuestionTextEn"='Right triangle: opposite θ is 5, adjacent 12. Find tan θ.'
 AND "DetailedSolutionAr"='في المثلث القائم، ظل الزاوية يساوي طول الضلع المقابل مقسوماً على طول المجاور: $\tan\theta=\frac{5}{12}$.' AND "DetailedSolutionEn"='In a right triangle, tangent is the opposite side divided by the adjacent side: $\tan\theta=\frac{5}{12}$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=285 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=285
 AND o."Id"=1132 AND o."IsCorrect" AND o."LatexCode"='\frac{5}{12}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 285 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في المثلث الخاص 30°–60°–90° تكون النسبة بين الضلع المقابل لـ30° والوتر هي 1 : 2. وبما أن sin(θ) = المقابل ÷ الوتر، فإن sin(30°) = 1/2. النتيجة كسر دقيق لا يحتاج إلى آلة حاسبة.', "DetailedSolutionEn"='Special-triangle rule: In a 30°–60°–90° right triangle, the side opposite 30° is half the hypotenuse (ratio 1:2). Since sine = opposite/hypotenuse, sin(30°) = 1/2 exactly.'
 WHERE "Id"=286 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما القيمة الدقيقة لجيب الزاوية 30°؟' AND "QuestionTextEn"='Find the exact sine of angle 30°.'
 AND "DetailedSolutionAr"='من جدول الزوايا الخاصة: الجيب=\frac{1}{2}.' AND "DetailedSolutionEn"='From special-angle values, sine=\frac{1}{2}.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=286 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=286
 AND o."Id"=1135 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 286 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: cos(θ) = طول الضلع المجاور للزاوية ÷ طول الوتر في المثلث القائم. الضلع المجاور 15 والوتر 17؛ بالتعويض: cos(θ) = 15 ÷ 17 = 15/17. بما أن المجاور أقصر من الوتر فالنتيجة أقل من 1.', "DetailedSolutionEn"='Right-triangle cosine rule: cos(θ) = adjacent side ÷ hypotenuse. With adjacent 15 and hypotenuse 17, substitute cos(θ) = 15/17. Since a triangle''s leg is shorter than its hypotenuse, this positive ratio is below 1.'
 WHERE "Id"=296 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مجاور الزاوية θ في مثلث قائم 15 والوتر 17، أوجد \(\cos\theta\).' AND "QuestionTextEn"='Right triangle: adjacent to θ is 15, hypotenuse 17. Find cos θ.'
 AND "DetailedSolutionAr"='جيب التمام=15/17.' AND "DetailedSolutionEn"='Cosine=adjacent/hypotenuse=15/17.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=296 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=296
 AND o."Id"=1176 AND o."IsCorrect" AND o."LatexCode"='\frac{15}{17}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 296 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: tan(θ) = طول الضلع المقابل للزاوية ÷ طول الضلع المجاور، وليس المقابل ÷ الوتر. المعطيات: المقابل 8 والمجاور 15. بالتعويض: tan(θ) = 8 ÷ 15 = 8/15. لا نحتاج حساب طول الوتر لهذا السؤال.', "DetailedSolutionEn"='Right-triangle tangent rule: tan(θ) = opposite side ÷ adjacent side, not opposite ÷ hypotenuse. Given opposite 8 and adjacent 15, substitute tan(θ) = 8/15. The hypotenuse is unnecessary for tangent here.'
 WHERE "Id"=297 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مقابل الزاوية θ 8 والمجاور 15 في مثلث قائم، أوجد \(\tan\theta\).' AND "QuestionTextEn"='Right triangle: opposite θ is 8, adjacent 15. Find tan θ.'
 AND "DetailedSolutionAr"='في المثلث القائم، ظل الزاوية يساوي طول الضلع المقابل مقسوماً على طول المجاور: $\tan\theta=\frac{8}{15}$.' AND "DetailedSolutionEn"='In a right triangle, tangent is the opposite side divided by the adjacent side: $\tan\theta=\frac{8}{15}$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=297 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=297
 AND o."Id"=1179 AND o."IsCorrect" AND o."LatexCode"='\frac{8}{15}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 297 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في مثلث قائم متساوي الساقين 45°–45°–90° يمكن أخذ الساقين 1 و1. بفيثاغورس الوتر = √(1² + 1²) = √2. إذن sin(45°) = المقابل ÷ الوتر = 1/√2 = √2/2 بعد إزالة الجذر من المقام.', "DetailedSolutionEn"='Special-triangle rule: In a 45°–45°–90° right triangle, take both legs equal to 1. By Pythagoras, hypotenuse = √(1² + 1²) = √2. Sine is opposite/hypotenuse: sin(45°) = 1/√2 = √2/2 after rationalizing.'
 WHERE "Id"=298 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما القيمة الدقيقة لجيب الزاوية 45°؟' AND "QuestionTextEn"='Find the exact sine of angle 45°.'
 AND "DetailedSolutionAr"='من جدول الزوايا الخاصة: الجيب=\frac{\sqrt{2}}{2}.' AND "DetailedSolutionEn"='From special-angle values, sine=\frac{\sqrt{2}}{2}.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=298 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=298
 AND o."Id"=1182 AND o."IsCorrect" AND o."LatexCode"='\frac{\sqrt{2}}{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 298 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: cos(θ) = طول الضلع المجاور للزاوية ÷ طول الوتر في المثلث القائم. الضلع المجاور 24 والوتر 25؛ بالتعويض: cos(θ) = 24 ÷ 25 = 24/25. بما أن المجاور أقصر من الوتر فالنتيجة أقل من 1.', "DetailedSolutionEn"='Right-triangle cosine rule: cos(θ) = adjacent side ÷ hypotenuse. With adjacent 24 and hypotenuse 25, substitute cos(θ) = 24/25. Since a triangle''s leg is shorter than its hypotenuse, this positive ratio is below 1.'
 WHERE "Id"=308 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مجاور الزاوية θ في مثلث قائم 24 والوتر 25، أوجد \(\cos\theta\).' AND "QuestionTextEn"='Right triangle: adjacent to θ is 24, hypotenuse 25. Find cos θ.'
 AND "DetailedSolutionAr"='جيب التمام=24/25.' AND "DetailedSolutionEn"='Cosine=adjacent/hypotenuse=24/25.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=308 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=308
 AND o."Id"=1223 AND o."IsCorrect" AND o."LatexCode"='\frac{24}{25}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 308 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: tan(θ) = طول الضلع المقابل للزاوية ÷ طول الضلع المجاور، وليس المقابل ÷ الوتر. المعطيات: المقابل 7 والمجاور 24. بالتعويض: tan(θ) = 7 ÷ 24 = 7/24. لا نحتاج حساب طول الوتر لهذا السؤال.', "DetailedSolutionEn"='Right-triangle tangent rule: tan(θ) = opposite side ÷ adjacent side, not opposite ÷ hypotenuse. Given opposite 7 and adjacent 24, substitute tan(θ) = 7/24. The hypotenuse is unnecessary for tangent here.'
 WHERE "Id"=309 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مقابل الزاوية θ 7 والمجاور 24 في مثلث قائم، أوجد \(\tan\theta\).' AND "QuestionTextEn"='Right triangle: opposite θ is 7, adjacent 24. Find tan θ.'
 AND "DetailedSolutionAr"='في المثلث القائم، ظل الزاوية يساوي طول الضلع المقابل مقسوماً على طول المجاور: $\tan\theta=\frac{7}{24}$.' AND "DetailedSolutionEn"='In a right triangle, tangent is the opposite side divided by the adjacent side: $\tan\theta=\frac{7}{24}$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=309 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=309
 AND o."Id"=1226 AND o."IsCorrect" AND o."LatexCode"='\frac{7}{24}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 309 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: في مثلث 30°–60°–90° تكون أطوال الضلع المقابل لـ60° والوتر بنسبة √3 : 2. من قانون الجيب = المقابل ÷ الوتر نجد sin(60°) = √3/2. تُستنتج النسبة من فيثاغورس بأضلاع 1 و√3 ووتر 2.', "DetailedSolutionEn"='Special-triangle rule: The side opposite 60° in a 30°–60°–90° triangle is √3 when the hypotenuse is 2. Sine = opposite/hypotenuse, so sin(60°) = √3/2. The side ratios follow from Pythagoras with legs 1 and √3.'
 WHERE "Id"=310 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما القيمة الدقيقة لجيب الزاوية 60°؟' AND "QuestionTextEn"='Find the exact sine of angle 60°.'
 AND "DetailedSolutionAr"='من جدول الزوايا الخاصة: الجيب=\frac{\sqrt{3}}{2}.' AND "DetailedSolutionEn"='From special-angle values, sine=\frac{\sqrt{3}}{2}.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=310 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=310
 AND o."Id"=1229 AND o."IsCorrect" AND o."LatexCode"='\frac{\sqrt{3}}{2}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 310 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: cos(θ) = طول الضلع المجاور للزاوية ÷ طول الوتر في المثلث القائم. الضلع المجاور 40 والوتر 41؛ بالتعويض: cos(θ) = 40 ÷ 41 = 40/41. بما أن المجاور أقصر من الوتر فالنتيجة أقل من 1.', "DetailedSolutionEn"='Right-triangle cosine rule: cos(θ) = adjacent side ÷ hypotenuse. With adjacent 40 and hypotenuse 41, substitute cos(θ) = 40/41. Since a triangle''s leg is shorter than its hypotenuse, this positive ratio is below 1.'
 WHERE "Id"=320 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مجاور الزاوية θ في مثلث قائم 40 والوتر 41، أوجد \(\cos\theta\).' AND "QuestionTextEn"='Right triangle: adjacent to θ is 40, hypotenuse 41. Find cos θ.'
 AND "DetailedSolutionAr"='جيب التمام=40/41.' AND "DetailedSolutionEn"='Cosine=adjacent/hypotenuse=40/41.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=320 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=320
 AND o."Id"=1270 AND o."IsCorrect" AND o."LatexCode"='\frac{40}{41}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 320 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: tan(θ) = طول الضلع المقابل للزاوية ÷ طول الضلع المجاور، وليس المقابل ÷ الوتر. المعطيات: المقابل 9 والمجاور 40. بالتعويض: tan(θ) = 9 ÷ 40 = 9/40. لا نحتاج حساب طول الوتر لهذا السؤال.', "DetailedSolutionEn"='Right-triangle tangent rule: tan(θ) = opposite side ÷ adjacent side, not opposite ÷ hypotenuse. Given opposite 9 and adjacent 40, substitute tan(θ) = 9/40. The hypotenuse is unnecessary for tangent here.'
 WHERE "Id"=321 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='مقابل الزاوية θ 9 والمجاور 40 في مثلث قائم، أوجد \(\tan\theta\).' AND "QuestionTextEn"='Right triangle: opposite θ is 9, adjacent 40. Find tan θ.'
 AND "DetailedSolutionAr"='في المثلث القائم، ظل الزاوية يساوي طول الضلع المقابل مقسوماً على طول المجاور: $\tan\theta=\frac{9}{40}$.' AND "DetailedSolutionEn"='In a right triangle, tangent is the opposite side divided by the adjacent side: $\tan\theta=\frac{9}{40}$.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=321 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=321
 AND o."Id"=1273 AND o."IsCorrect" AND o."LatexCode"='\frac{9}{40}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 321 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='المبدأ المستخدم: جيب الزاوية هو الإحداثي الصادي على دائرة الوحدة. عند 90° نصل إلى النقطة (0،1)، ولذلك sin(90°) = 1. يمكن اعتباره أكبر قيمة ممكنة للجيب لأن الإحداثي الصادي على دائرة الوحدة لا يتجاوز 1.', "DetailedSolutionEn"='Unit-circle rule: Sine is the y-coordinate on the unit circle. At 90°, the point is (0,1), so sin(90°) = 1. This is the maximum possible sine value because a unit circle has y-coordinate at most 1.'
 WHERE "Id"=322 AND "StageId"=3 AND "CategoryId"=10
 AND "QuestionTextAr"='ما القيمة الدقيقة لجيب الزاوية 90°؟' AND "QuestionTextEn"='Find the exact sine of angle 90°.'
 AND "DetailedSolutionAr"='من جدول الزوايا الخاصة: الجيب=1.' AND "DetailedSolutionEn"='From special-angle values, sine=1.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=322 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=322
 AND o."Id"=1280 AND o."IsCorrect" AND o."LatexCode"='1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 322 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون اشتقاق القوة: مشتقة أ س^ن هي أ ن س^(ن−1)، ومشتقة أ س هي أ. للدالة f(س) = 5س² − 4س، مشتقة 5س² = 5 × 2س = 10س، ومشتقة −4س = −4. بجمع المشتقات نحصل على f''(س) = 10س − 4.', "DetailedSolutionEn"='Power rule of differentiation: d(ax^n)/dx = anx^(n−1), and d(ax)/dx = a. For f(x) = 5x² − 4x, derivative of 5x² is 10x and derivative of −4x is −4. Therefore f''(x) = 10x − 4.'
 WHERE "Id"=47 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد مشتقة f(x) = 5x² - 4x.' AND "QuestionTextEn"='Find the derivative of f(x) = 5x² - 4x.'
 AND "DetailedSolutionAr"='مشتقة 5x² هي 10x، ومشتقة -4x هي -4؛ المشتقة 10x - 4.' AND "DetailedSolutionEn"='Differentiate term by term: d(5x²)/dx = 10x and d(-4x)/dx = -4.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=47 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=47
 AND o."Id"=179 AND o."IsCorrect" AND o."LatexCode"='10x-4');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 47 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون اشتقاق القوى: إذا كانت f(س) = 2س² + 3س فإن f''(س) = 2 × 2س + 3 = 4س + 3. لحساب المشتقة عند س = 1 نعوّض: f''(1) = 4 × 1 + 3 = 4 + 3 = 7. المطلوب قيمة الميل عند هذه النقطة لا قيمة الدالة نفسها.', "DetailedSolutionEn"='Power rule: For f(x) = 2x² + 3x, f''(x) = 2 × 2x + 3 = 4x + 3. Evaluate at x = 1: f''(1) = 4 × 1 + 3 = 4 + 3 = 7. This is the slope, not f(1).'
 WHERE "Id"=79 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='إذا كانت \(f(x)=2x^2+3x\)، احسب \(f''(1)\).' AND "QuestionTextEn"='Given \(f(x)=2x^2+3x\), compute \(f''(1)\).'
 AND "DetailedSolutionAr"='المشتقة f''(x)=4x+3، وعند 1 تساوي 7.' AND "DetailedSolutionEn"='Differentiate to f''(x)=4x+3, then evaluate at 1 to get 7.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=79 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=79
 AND o."Id"=306 AND o."IsCorrect" AND o."LatexCode"='7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 79 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون اشتقاق القوى: إذا كانت f(س) = 3س² + 4س فإن f''(س) = 2 × 3س + 4 = 6س + 4. لحساب المشتقة عند س = 2 نعوّض: f''(2) = 6 × 2 + 4 = 12 + 4 = 16. المطلوب قيمة الميل عند هذه النقطة لا قيمة الدالة نفسها.', "DetailedSolutionEn"='Power rule: For f(x) = 3x² + 4x, f''(x) = 2 × 3x + 4 = 6x + 4. Evaluate at x = 2: f''(2) = 6 × 2 + 4 = 12 + 4 = 16. This is the slope, not f(2).'
 WHERE "Id"=94 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='إذا كانت \(f(x)=3x^2+4x\)، احسب \(f''(2)\).' AND "QuestionTextEn"='Given \(f(x)=3x^2+4x\), compute \(f''(2)\).'
 AND "DetailedSolutionAr"='المشتقة f''(x)=6x+4، وعند 2 تساوي 16.' AND "DetailedSolutionEn"='Differentiate to f''(x)=6x+4, then evaluate at 2 to get 16.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=94 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=94
 AND o."Id"=365 AND o."IsCorrect" AND o."LatexCode"='16');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 94 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون اشتقاق القوى: إذا كانت f(س) = 4س² + 5س فإن f''(س) = 2 × 4س + 5 = 8س + 5. لحساب المشتقة عند س = 3 نعوّض: f''(3) = 8 × 3 + 5 = 24 + 5 = 29. المطلوب قيمة الميل عند هذه النقطة لا قيمة الدالة نفسها.', "DetailedSolutionEn"='Power rule: For f(x) = 4x² + 5x, f''(x) = 2 × 4x + 5 = 8x + 5. Evaluate at x = 3: f''(3) = 8 × 3 + 5 = 24 + 5 = 29. This is the slope, not f(3).'
 WHERE "Id"=109 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='إذا كانت \(f(x)=4x^2+5x\)، احسب \(f''(3)\).' AND "QuestionTextEn"='Given \(f(x)=4x^2+5x\), compute \(f''(3)\).'
 AND "DetailedSolutionAr"='المشتقة f''(x)=8x+5، وعند 3 تساوي 29.' AND "DetailedSolutionEn"='Differentiate to f''(x)=8x+5, then evaluate at 3 to get 29.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=109 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=109
 AND o."Id"=428 AND o."IsCorrect" AND o."LatexCode"='29');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 109 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون اشتقاق القوى: إذا كانت f(س) = 5س² + 6س فإن f''(س) = 2 × 5س + 6 = 10س + 6. لحساب المشتقة عند س = 4 نعوّض: f''(4) = 10 × 4 + 6 = 40 + 6 = 46. المطلوب قيمة الميل عند هذه النقطة لا قيمة الدالة نفسها.', "DetailedSolutionEn"='Power rule: For f(x) = 5x² + 6x, f''(x) = 2 × 5x + 6 = 10x + 6. Evaluate at x = 4: f''(4) = 10 × 4 + 6 = 40 + 6 = 46. This is the slope, not f(4).'
 WHERE "Id"=124 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='إذا كانت \(f(x)=5x^2+6x\)، احسب \(f''(4)\).' AND "QuestionTextEn"='Given \(f(x)=5x^2+6x\), compute \(f''(4)\).'
 AND "DetailedSolutionAr"='المشتقة f''(x)=10x+6، وعند 4 تساوي 46.' AND "DetailedSolutionEn"='Differentiate to f''(x)=10x+6, then evaluate at 4 to get 46.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=124 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=124
 AND o."Id"=487 AND o."IsCorrect" AND o."LatexCode"='46');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 124 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون اشتقاق القوى: إذا كانت f(س) = 6س² + 7س فإن f''(س) = 2 × 6س + 7 = 12س + 7. لحساب المشتقة عند س = 5 نعوّض: f''(5) = 12 × 5 + 7 = 60 + 7 = 67. المطلوب قيمة الميل عند هذه النقطة لا قيمة الدالة نفسها.', "DetailedSolutionEn"='Power rule: For f(x) = 6x² + 7x, f''(x) = 2 × 6x + 7 = 12x + 7. Evaluate at x = 5: f''(5) = 12 × 5 + 7 = 60 + 7 = 67. This is the slope, not f(5).'
 WHERE "Id"=139 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='إذا كانت \(f(x)=6x^2+7x\)، احسب \(f''(5)\).' AND "QuestionTextEn"='Given \(f(x)=6x^2+7x\), compute \(f''(5)\).'
 AND "DetailedSolutionAr"='المشتقة f''(x)=12x+7، وعند 5 تساوي 67.' AND "DetailedSolutionEn"='Differentiate to f''(x)=12x+7, then evaluate at 5 to get 67.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=139 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=139
 AND o."Id"=546 AND o."IsCorrect" AND o."LatexCode"='67');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 139 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مشتقة أ س^ن هي أ ن س^(ن−1). في f(س) = 3س^3 تكون f''(س) = 3 × 3س^2 = 9س^2. عند س = 2 نحسب f''(2) = 9 × 2^2 = 9 × 4 = 36. نشتق أولاً ثم نعوّض بقيمة س.', "DetailedSolutionEn"='Power rule: d(ax^n)/dx = anx^(n−1). For f(x) = 3x^3, f''(x) = 3 × 3x^2 = 9x^2. Then f''(2) = 9 × 2^2 = 9 × 4 = 36. Differentiate first, then substitute the given x.'
 WHERE "Id"=275 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد \(f''(2)\) للدالة \(f(x)=3x^{3}\).' AND "QuestionTextEn"='Find f''(2) for \(f(x)=3x^{3}\).'
 AND "DetailedSolutionAr"='بقاعدة القوة f''(x)=9x^{2}، فالقيمة 36.' AND "DetailedSolutionEn"='By the power rule f''(x)=9x^{2}, giving 36.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=275 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=275
 AND o."Id"=1089 AND o."IsCorrect" AND o."LatexCode"='36');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 275 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التكامل غير المحدد للقوى: ∫أ س^ن dس = أ × س^(ن+1)/(ن+1) + C، ما دام ن ≠ −1. لدينا ∫4س^1 dس، نزيد الأس إلى 2 ونقسم المعامل على 2: (4/2)س^2 + C = 2س^2 + C. نضيف ثابت التكامل C لأن التكامل غير محدد.', "DetailedSolutionEn"='Indefinite power-integration rule: ∫a x^n dx = a x^(n+1)/(n+1) + C when n ≠ −1. For ∫4x^1 dx, raise the exponent to 2 and divide the coefficient by 2: (4/2)x^2 + C = 2x^2 + C. Include integration constant C.'
 WHERE "Id"=276 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int 4x^{1}\,dx\).' AND "QuestionTextEn"='Compute \(\int 4x^{1}\,dx\).'
 AND "DetailedSolutionAr"='نقسم على الأس الجديد 2 فنحصل على 2x^{2}+C.' AND "DetailedSolutionEn"='Divide by the new power 2, obtaining 2x^{2}+C.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=276 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=276
 AND o."Id"=1096 AND o."IsCorrect" AND o."LatexCode"='2x^{2}+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 276 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبرهنة التكامل الأساسية؛ التكامل المحدد من 0 إلى 3 للدالة 4t يساوي F(3) − F(0)، حيث F(t) = (4/2)t² = 2t². بالتعويض: 2 × 3² − 2 × 0² = 2 × 9 = 18.', "DetailedSolutionEn"='Fundamental Theorem of Calculus: Evaluate ∫₀^3 4t dt as F(3) − F(0), where F(t) = (4/2)t² = 2t². Substitute: 2 × 3² − 2 × 0² = 2 × 9 = 18.'
 WHERE "Id"=277 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int_0^{3} 4t\,dt\).' AND "QuestionTextEn"='Evaluate \(\int_0^{3} 4t\,dt\).'
 AND "DetailedSolutionAr"='الدالة الأصلية 2t²، وعند الحد الأعلى الناتج 18.' AND "DetailedSolutionEn"='Antiderivative 2t²; evaluating gives 18.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=277 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=277
 AND o."Id"=1099 AND o."IsCorrect" AND o."LatexCode"='18');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 277 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مشتقة أ س^ن هي أ ن س^(ن−1). في f(س) = 4س^4 تكون f''(س) = 4 × 4س^3 = 16س^3. عند س = 3 نحسب f''(3) = 16 × 3^3 = 16 × 27 = 432. نشتق أولاً ثم نعوّض بقيمة س.', "DetailedSolutionEn"='Power rule: d(ax^n)/dx = anx^(n−1). For f(x) = 4x^4, f''(x) = 4 × 4x^3 = 16x^3. Then f''(3) = 16 × 3^3 = 16 × 27 = 432. Differentiate first, then substitute the given x.'
 WHERE "Id"=287 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد \(f''(3)\) للدالة \(f(x)=4x^{4}\).' AND "QuestionTextEn"='Find f''(3) for \(f(x)=4x^{4}\).'
 AND "DetailedSolutionAr"='بقاعدة القوة f''(x)=16x^{3}، فالقيمة 432.' AND "DetailedSolutionEn"='By the power rule f''(x)=16x^{3}, giving 432.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=287 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=287
 AND o."Id"=1140 AND o."IsCorrect" AND o."LatexCode"='432');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 287 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التكامل غير المحدد للقوى: ∫أ س^ن dس = أ × س^(ن+1)/(ن+1) + C، ما دام ن ≠ −1. لدينا ∫9س^2 dس، نزيد الأس إلى 3 ونقسم المعامل على 3: (9/3)س^3 + C = 3س^3 + C. نضيف ثابت التكامل C لأن التكامل غير محدد.', "DetailedSolutionEn"='Indefinite power-integration rule: ∫a x^n dx = a x^(n+1)/(n+1) + C when n ≠ −1. For ∫9x^2 dx, raise the exponent to 3 and divide the coefficient by 3: (9/3)x^3 + C = 3x^3 + C. Include integration constant C.'
 WHERE "Id"=288 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int 9x^{2}\,dx\).' AND "QuestionTextEn"='Compute \(\int 9x^{2}\,dx\).'
 AND "DetailedSolutionAr"='نقسم على الأس الجديد 3 فنحصل على 3x^{3}+C.' AND "DetailedSolutionEn"='Divide by the new power 3, obtaining 3x^{3}+C.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=288 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=288
 AND o."Id"=1143 AND o."IsCorrect" AND o."LatexCode"='3x^{3}+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 288 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبرهنة التكامل الأساسية؛ التكامل المحدد من 0 إلى 4 للدالة 6t يساوي F(4) − F(0)، حيث F(t) = (6/2)t² = 3t². بالتعويض: 3 × 4² − 3 × 0² = 3 × 16 = 48.', "DetailedSolutionEn"='Fundamental Theorem of Calculus: Evaluate ∫₀^4 6t dt as F(4) − F(0), where F(t) = (6/2)t² = 3t². Substitute: 3 × 4² − 3 × 0² = 3 × 16 = 48.'
 WHERE "Id"=289 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int_0^{4} 6t\,dt\).' AND "QuestionTextEn"='Evaluate \(\int_0^{4} 6t\,dt\).'
 AND "DetailedSolutionAr"='الدالة الأصلية 3t²، وعند الحد الأعلى الناتج 48.' AND "DetailedSolutionEn"='Antiderivative 3t²; evaluating gives 48.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=289 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=289
 AND o."Id"=1146 AND o."IsCorrect" AND o."LatexCode"='48');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 289 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مشتقة أ س^ن هي أ ن س^(ن−1). في f(س) = 5س^5 تكون f''(س) = 5 × 5س^4 = 25س^4. عند س = 4 نحسب f''(4) = 25 × 4^4 = 25 × 256 = 6400. نشتق أولاً ثم نعوّض بقيمة س.', "DetailedSolutionEn"='Power rule: d(ax^n)/dx = anx^(n−1). For f(x) = 5x^5, f''(x) = 5 × 5x^4 = 25x^4. Then f''(4) = 25 × 4^4 = 25 × 256 = 6400. Differentiate first, then substitute the given x.'
 WHERE "Id"=299 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد \(f''(4)\) للدالة \(f(x)=5x^{5}\).' AND "QuestionTextEn"='Find f''(4) for \(f(x)=5x^{5}\).'
 AND "DetailedSolutionAr"='بقاعدة القوة f''(x)=25x^{4}، فالقيمة 6400.' AND "DetailedSolutionEn"='By the power rule f''(x)=25x^{4}, giving 6400.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=299 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=299
 AND o."Id"=1187 AND o."IsCorrect" AND o."LatexCode"='6400');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 299 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التكامل غير المحدد للقوى: ∫أ س^ن dس = أ × س^(ن+1)/(ن+1) + C، ما دام ن ≠ −1. لدينا ∫16س^3 dس، نزيد الأس إلى 4 ونقسم المعامل على 4: (16/4)س^4 + C = 4س^4 + C. نضيف ثابت التكامل C لأن التكامل غير محدد.', "DetailedSolutionEn"='Indefinite power-integration rule: ∫a x^n dx = a x^(n+1)/(n+1) + C when n ≠ −1. For ∫16x^3 dx, raise the exponent to 4 and divide the coefficient by 4: (16/4)x^4 + C = 4x^4 + C. Include integration constant C.'
 WHERE "Id"=300 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int 16x^{3}\,dx\).' AND "QuestionTextEn"='Compute \(\int 16x^{3}\,dx\).'
 AND "DetailedSolutionAr"='نقسم على الأس الجديد 4 فنحصل على 4x^{4}+C.' AND "DetailedSolutionEn"='Divide by the new power 4, obtaining 4x^{4}+C.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=300 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=300
 AND o."Id"=1190 AND o."IsCorrect" AND o."LatexCode"='4x^{4}+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 300 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبرهنة التكامل الأساسية؛ التكامل المحدد من 0 إلى 5 للدالة 8t يساوي F(5) − F(0)، حيث F(t) = (8/2)t² = 4t². بالتعويض: 4 × 5² − 4 × 0² = 4 × 25 = 100.', "DetailedSolutionEn"='Fundamental Theorem of Calculus: Evaluate ∫₀^5 8t dt as F(5) − F(0), where F(t) = (8/2)t² = 4t². Substitute: 4 × 5² − 4 × 0² = 4 × 25 = 100.'
 WHERE "Id"=301 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int_0^{5} 8t\,dt\).' AND "QuestionTextEn"='Evaluate \(\int_0^{5} 8t\,dt\).'
 AND "DetailedSolutionAr"='الدالة الأصلية 4t²، وعند الحد الأعلى الناتج 100.' AND "DetailedSolutionEn"='Antiderivative 4t²; evaluating gives 100.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=301 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=301
 AND o."Id"=1193 AND o."IsCorrect" AND o."LatexCode"='100');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 301 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مشتقة أ س^ن هي أ ن س^(ن−1). في f(س) = 6س^6 تكون f''(س) = 6 × 6س^5 = 36س^5. عند س = 5 نحسب f''(5) = 36 × 5^5 = 36 × 3125 = 112500. نشتق أولاً ثم نعوّض بقيمة س.', "DetailedSolutionEn"='Power rule: d(ax^n)/dx = anx^(n−1). For f(x) = 6x^6, f''(x) = 6 × 6x^5 = 36x^5. Then f''(5) = 36 × 5^5 = 36 × 3125 = 112500. Differentiate first, then substitute the given x.'
 WHERE "Id"=311 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد \(f''(5)\) للدالة \(f(x)=6x^{6}\).' AND "QuestionTextEn"='Find f''(5) for \(f(x)=6x^{6}\).'
 AND "DetailedSolutionAr"='بقاعدة القوة f''(x)=36x^{5}، فالقيمة 112500.' AND "DetailedSolutionEn"='By the power rule f''(x)=36x^{5}, giving 112500.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=311 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=311
 AND o."Id"=1234 AND o."IsCorrect" AND o."LatexCode"='112500');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 311 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التكامل غير المحدد للقوى: ∫أ س^ن dس = أ × س^(ن+1)/(ن+1) + C، ما دام ن ≠ −1. لدينا ∫25س^4 dس، نزيد الأس إلى 5 ونقسم المعامل على 5: (25/5)س^5 + C = 5س^5 + C. نضيف ثابت التكامل C لأن التكامل غير محدد.', "DetailedSolutionEn"='Indefinite power-integration rule: ∫a x^n dx = a x^(n+1)/(n+1) + C when n ≠ −1. For ∫25x^4 dx, raise the exponent to 5 and divide the coefficient by 5: (25/5)x^5 + C = 5x^5 + C. Include integration constant C.'
 WHERE "Id"=312 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int 25x^{4}\,dx\).' AND "QuestionTextEn"='Compute \(\int 25x^{4}\,dx\).'
 AND "DetailedSolutionAr"='نقسم على الأس الجديد 5 فنحصل على 5x^{5}+C.' AND "DetailedSolutionEn"='Divide by the new power 5, obtaining 5x^{5}+C.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=312 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=312
 AND o."Id"=1237 AND o."IsCorrect" AND o."LatexCode"='5x^{5}+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 312 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبرهنة التكامل الأساسية؛ التكامل المحدد من 0 إلى 6 للدالة 10t يساوي F(6) − F(0)، حيث F(t) = (10/2)t² = 5t². بالتعويض: 5 × 6² − 5 × 0² = 5 × 36 = 180.', "DetailedSolutionEn"='Fundamental Theorem of Calculus: Evaluate ∫₀^6 10t dt as F(6) − F(0), where F(t) = (10/2)t² = 5t². Substitute: 5 × 6² − 5 × 0² = 5 × 36 = 180.'
 WHERE "Id"=313 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int_0^{6} 10t\,dt\).' AND "QuestionTextEn"='Evaluate \(\int_0^{6} 10t\,dt\).'
 AND "DetailedSolutionAr"='الدالة الأصلية 5t²، وعند الحد الأعلى الناتج 180.' AND "DetailedSolutionEn"='Antiderivative 5t²; evaluating gives 180.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=313 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=313
 AND o."Id"=1244 AND o."IsCorrect" AND o."LatexCode"='180');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 313 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مشتقة أ س^ن هي أ ن س^(ن−1). في f(س) = 7س^7 تكون f''(س) = 7 × 7س^6 = 49س^6. عند س = 6 نحسب f''(6) = 49 × 6^6 = 49 × 46656 = 2286144. نشتق أولاً ثم نعوّض بقيمة س.', "DetailedSolutionEn"='Power rule: d(ax^n)/dx = anx^(n−1). For f(x) = 7x^7, f''(x) = 7 × 7x^6 = 49x^6. Then f''(6) = 49 × 6^6 = 49 × 46656 = 2286144. Differentiate first, then substitute the given x.'
 WHERE "Id"=323 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='أوجد \(f''(6)\) للدالة \(f(x)=7x^{7}\).' AND "QuestionTextEn"='Find f''(6) for \(f(x)=7x^{7}\).'
 AND "DetailedSolutionAr"='بقاعدة القوة f''(x)=49x^{6}، فالقيمة 2286144.' AND "DetailedSolutionEn"='By the power rule f''(x)=49x^{6}, giving 2286144.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=323 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=323
 AND o."Id"=1281 AND o."IsCorrect" AND o."LatexCode"='2286144');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 323 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التكامل غير المحدد للقوى: ∫أ س^ن dس = أ × س^(ن+1)/(ن+1) + C، ما دام ن ≠ −1. لدينا ∫36س^5 dس، نزيد الأس إلى 6 ونقسم المعامل على 6: (36/6)س^6 + C = 6س^6 + C. نضيف ثابت التكامل C لأن التكامل غير محدد.', "DetailedSolutionEn"='Indefinite power-integration rule: ∫a x^n dx = a x^(n+1)/(n+1) + C when n ≠ −1. For ∫36x^5 dx, raise the exponent to 6 and divide the coefficient by 6: (36/6)x^6 + C = 6x^6 + C. Include integration constant C.'
 WHERE "Id"=324 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int 36x^{5}\,dx\).' AND "QuestionTextEn"='Compute \(\int 36x^{5}\,dx\).'
 AND "DetailedSolutionAr"='نقسم على الأس الجديد 6 فنحصل على 6x^{6}+C.' AND "DetailedSolutionEn"='Divide by the new power 6, obtaining 6x^{6}+C.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=324 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=324
 AND o."Id"=1288 AND o."IsCorrect" AND o."LatexCode"='6x^{6}+C');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 324 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مبرهنة التكامل الأساسية؛ التكامل المحدد من 0 إلى 7 للدالة 12t يساوي F(7) − F(0)، حيث F(t) = (12/2)t² = 6t². بالتعويض: 6 × 7² − 6 × 0² = 6 × 49 = 294.', "DetailedSolutionEn"='Fundamental Theorem of Calculus: Evaluate ∫₀^7 12t dt as F(7) − F(0), where F(t) = (12/2)t² = 6t². Substitute: 6 × 7² − 6 × 0² = 6 × 49 = 294.'
 WHERE "Id"=325 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='احسب \(\int_0^{7} 12t\,dt\).' AND "QuestionTextEn"='Evaluate \(\int_0^{7} 12t\,dt\).'
 AND "DetailedSolutionAr"='الدالة الأصلية 6t²، وعند الحد الأعلى الناتج 294.' AND "DetailedSolutionEn"='Antiderivative 6t²; evaluating gives 294.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=325 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=325
 AND o."Id"=1291 AND o."IsCorrect" AND o."LatexCode"='294');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 325 modified; rollback entire batch'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: مشتقة س^ن هي ن س^(ن−1)، ومشتقة الحد الخطي −4س هي −4. للدالة f(س) = 2س³ − 4س نجد f''(س) = 2 × 3س² − 4 = 6س² − 4. عند س = 3 نعوّض: f''(3) = 6 × 3² − 4 = 6 × 9 − 4 = 50. القيمة 50 هي ميل المماس عند س = 3.', "DetailedSolutionEn"='Power rule: d(x^n)/dx = nx^(n−1), and derivative of −4x is −4. For f(x) = 2x³ − 4x, f''(x) = 2 × 3x² − 4 = 6x² − 4. Evaluate x = 3: f''(3) = 6 × 3² − 4 = 54 − 4 = 50, the tangent slope at x = 3.'
 WHERE "Id"=859 AND "StageId"=3 AND "CategoryId"=11
 AND "QuestionTextAr"='لتكن f(x)=2x³−4x. ما قيمة f''(3)؟' AND "QuestionTextEn"='Let f(x)=2x³−4x. What is f''(3)?'
 AND "DetailedSolutionAr"='f''(x)=6x²−4، بالتعويض x=3 نحصل على 6×9−4=50.' AND "DetailedSolutionEn"='Differentiate to get f''(x)=6x²−4. At x=3, this is 54−4=50.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=859 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=859
 AND o."Id"=3431 AND o."IsCorrect" AND o."LatexCode"='50');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Stage-three trig/calculus question 859 modified; rollback entire batch'; END IF;
END $mw_secondary_trig_calculus$;
COMMIT;
