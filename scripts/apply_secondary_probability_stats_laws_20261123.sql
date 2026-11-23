-- 17 independently reviewed secondary probability/statistics bilingual worked solutions.
-- One-time exact-source-and-correct-answer transaction; no user/question changes.
BEGIN;
DO $mw_secondary_probability_stats$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون احتمال الأحداث المستقلة: احتمال تحقق جميع الأحداث = حاصل ضرب احتمالاتها. احتمال ظهور الصورة في رمية واحدة لعملة عادلة هو 1/2. خلال 3 رميات مستقلة، احتمال ظهور الصورة في كل مرة = (1/2)^3 = 1/8. يوجد ناتج واحد مناسب من أصل 8 نتائج متساوية الاحتمال.', "DetailedSolutionEn"='Independent-events rule: Multiply the probabilities of all independent events. Each fair-coin toss has a 1/2 chance of heads. For 3 independent tosses, P(all heads) = (1/2)^3 = 1/8. Exactly one outcome out of 8 equally likely sequences is all heads.'
 WHERE "Id"=64 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة ثلاث مرات. ما احتمال ظهور الصورة في كل الرميات؟' AND "QuestionTextEn"='A fair coin is tossed three times. What is the probability of heads on every toss?'
 AND "DetailedSolutionAr"='الرميات مستقلة، واحتمال الصورة في كل رمية 1/2؛ إذن (1/2)³ = 1/8.' AND "DetailedSolutionEn"='Independent tosses each have probability 1/2, so all heads has probability (1/2)^3 = 1/8.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=64 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=64 AND o."Id"=245
 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{8}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 64: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: احتمال ظهور الصورة مرتين بالضبط في 4 رميات مستقلة لعملة عادلة = عدد طرق اختيار موضعي الصورتين ÷ جميع النتائج. عدد جميع السلاسل = 2^4 = 16. عدد الاختيارات C(4,2) = 4 × (4 − 1) ÷ 2 = 6. بالتعويض: الاحتمال = 6/16، ويساوي 3/8 بعد التبسيط.', "DetailedSolutionEn"='Binomial counting rule: For exactly two heads in 4 independent fair-coin tosses, choose the two head positions among all 2^n equally likely outcomes. Total outcomes = 2^4 = 16; favorable choices C(4,2) = 4 × (4 − 1)/2 = 6. Thus P = 6/16, equivalent to 3/8 when simplified.'
 WHERE "Id"=80 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 4 مرات. ما احتمال ظهور الصورة مرتين بالضبط؟' AND "QuestionTextEn"='Toss a fair coin 4 times. What is the probability of exactly two heads?'
 AND "DetailedSolutionAr"='عدد النتائج 2^4=16، وعدد طرق اختيار صورتين C(4,2)=6، فالاحتمال 6/16.' AND "DetailedSolutionEn"='There are 16 equally likely results and C(4,2)=6 ways to choose two heads, so probability=6/16.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=80 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=80 AND o."Id"=309
 AND o."IsCorrect" AND o."LatexCode"='\frac{6}{16}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 80: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: احتمال ظهور الصورة مرتين بالضبط في 5 رميات مستقلة لعملة عادلة = عدد طرق اختيار موضعي الصورتين ÷ جميع النتائج. عدد جميع السلاسل = 2^5 = 32. عدد الاختيارات C(5,2) = 5 × (5 − 1) ÷ 2 = 10. بالتعويض: الاحتمال = 10/32، ويساوي 5/16 بعد التبسيط.', "DetailedSolutionEn"='Binomial counting rule: For exactly two heads in 5 independent fair-coin tosses, choose the two head positions among all 2^n equally likely outcomes. Total outcomes = 2^5 = 32; favorable choices C(5,2) = 5 × (5 − 1)/2 = 10. Thus P = 10/32, equivalent to 5/16 when simplified.'
 WHERE "Id"=95 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 5 مرات. ما احتمال ظهور الصورة مرتين بالضبط؟' AND "QuestionTextEn"='Toss a fair coin 5 times. What is the probability of exactly two heads?'
 AND "DetailedSolutionAr"='عدد النتائج 2^5=32، وعدد طرق اختيار صورتين C(5,2)=10، فالاحتمال 10/32.' AND "DetailedSolutionEn"='There are 32 equally likely results and C(5,2)=10 ways to choose two heads, so probability=10/32.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=95 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=95 AND o."Id"=372
 AND o."IsCorrect" AND o."LatexCode"='\frac{10}{32}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 95: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: احتمال ظهور الصورة مرتين بالضبط في 6 رميات مستقلة لعملة عادلة = عدد طرق اختيار موضعي الصورتين ÷ جميع النتائج. عدد جميع السلاسل = 2^6 = 64. عدد الاختيارات C(6,2) = 6 × (6 − 1) ÷ 2 = 15. بالتعويض: الاحتمال = 15/64، ويساوي 15/64 بعد التبسيط.', "DetailedSolutionEn"='Binomial counting rule: For exactly two heads in 6 independent fair-coin tosses, choose the two head positions among all 2^n equally likely outcomes. Total outcomes = 2^6 = 64; favorable choices C(6,2) = 6 × (6 − 1)/2 = 15. Thus P = 15/64, equivalent to 15/64 when simplified.'
 WHERE "Id"=110 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 6 مرات. ما احتمال ظهور الصورة مرتين بالضبط؟' AND "QuestionTextEn"='Toss a fair coin 6 times. What is the probability of exactly two heads?'
 AND "DetailedSolutionAr"='عدد النتائج 2^6=64، وعدد طرق اختيار صورتين C(6,2)=15، فالاحتمال 15/64.' AND "DetailedSolutionEn"='There are 64 equally likely results and C(6,2)=15 ways to choose two heads, so probability=15/64.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=110 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=110 AND o."Id"=431
 AND o."IsCorrect" AND o."LatexCode"='\frac{15}{64}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 110: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: احتمال ظهور الصورة مرتين بالضبط في 7 رميات مستقلة لعملة عادلة = عدد طرق اختيار موضعي الصورتين ÷ جميع النتائج. عدد جميع السلاسل = 2^7 = 128. عدد الاختيارات C(7,2) = 7 × (7 − 1) ÷ 2 = 21. بالتعويض: الاحتمال = 21/128، ويساوي 21/128 بعد التبسيط.', "DetailedSolutionEn"='Binomial counting rule: For exactly two heads in 7 independent fair-coin tosses, choose the two head positions among all 2^n equally likely outcomes. Total outcomes = 2^7 = 128; favorable choices C(7,2) = 7 × (7 − 1)/2 = 21. Thus P = 21/128, equivalent to 21/128 when simplified.'
 WHERE "Id"=125 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 7 مرات. ما احتمال ظهور الصورة مرتين بالضبط؟' AND "QuestionTextEn"='Toss a fair coin 7 times. What is the probability of exactly two heads?'
 AND "DetailedSolutionAr"='عدد النتائج 2^7=128، وعدد طرق اختيار صورتين C(7,2)=21، فالاحتمال 21/128.' AND "DetailedSolutionEn"='There are 128 equally likely results and C(7,2)=21 ways to choose two heads, so probability=21/128.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=125 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=125 AND o."Id"=490
 AND o."IsCorrect" AND o."LatexCode"='\frac{21}{128}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 125: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: احتمال ظهور الصورة مرتين بالضبط في 8 رميات مستقلة لعملة عادلة = عدد طرق اختيار موضعي الصورتين ÷ جميع النتائج. عدد جميع السلاسل = 2^8 = 256. عدد الاختيارات C(8,2) = 8 × (8 − 1) ÷ 2 = 28. بالتعويض: الاحتمال = 28/256، ويساوي 7/64 بعد التبسيط.', "DetailedSolutionEn"='Binomial counting rule: For exactly two heads in 8 independent fair-coin tosses, choose the two head positions among all 2^n equally likely outcomes. Total outcomes = 2^8 = 256; favorable choices C(8,2) = 8 × (8 − 1)/2 = 28. Thus P = 28/256, equivalent to 7/64 when simplified.'
 WHERE "Id"=140 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 8 مرات. ما احتمال ظهور الصورة مرتين بالضبط؟' AND "QuestionTextEn"='Toss a fair coin 8 times. What is the probability of exactly two heads?'
 AND "DetailedSolutionAr"='عدد النتائج 2^8=256، وعدد طرق اختيار صورتين C(8,2)=28، فالاحتمال 28/256.' AND "DetailedSolutionEn"='There are 256 equally likely results and C(8,2)=28 ways to choose two heads, so probability=28/256.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=140 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=140 AND o."Id"=549
 AND o."IsCorrect" AND o."LatexCode"='\frac{28}{256}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 140: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون احتمال الأحداث المستقلة: احتمال تحقق جميع الأحداث = حاصل ضرب احتمالاتها. احتمال ظهور الصورة في رمية واحدة لعملة عادلة هو 1/2. خلال 2 رميات مستقلة، احتمال ظهور الصورة في كل مرة = (1/2)^2 = 1/4. يوجد ناتج واحد مناسب من أصل 4 نتائج متساوية الاحتمال.', "DetailedSolutionEn"='Independent-events rule: Multiply the probabilities of all independent events. Each fair-coin toss has a 1/2 chance of heads. For 2 independent tosses, P(all heads) = (1/2)^2 = 1/4. Exactly one outcome out of 4 equally likely sequences is all heads.'
 WHERE "Id"=279 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 2 مرات؛ ما احتمال الصورة في كل الرميات؟' AND "QuestionTextEn"='Toss a fair coin 2 times; probability of heads on all tosses?'
 AND "DetailedSolutionAr"='الاحتمال=(1/2)^2=1/4.' AND "DetailedSolutionEn"='Probability=(1/2)^2=1/4.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=279 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=279 AND o."Id"=1107
 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{4}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 279: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون احتمال الأحداث المستقلة: احتمال تحقق جميع الأحداث = حاصل ضرب احتمالاتها. احتمال ظهور الصورة في رمية واحدة لعملة عادلة هو 1/2. خلال 3 رميات مستقلة، احتمال ظهور الصورة في كل مرة = (1/2)^3 = 1/8. يوجد ناتج واحد مناسب من أصل 8 نتائج متساوية الاحتمال.', "DetailedSolutionEn"='Independent-events rule: Multiply the probabilities of all independent events. Each fair-coin toss has a 1/2 chance of heads. For 3 independent tosses, P(all heads) = (1/2)^3 = 1/8. Exactly one outcome out of 8 equally likely sequences is all heads.'
 WHERE "Id"=291 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 3 مرات؛ ما احتمال الصورة في كل الرميات؟' AND "QuestionTextEn"='Toss a fair coin 3 times; probability of heads on all tosses?'
 AND "DetailedSolutionAr"='الاحتمال=(1/2)^3=1/8.' AND "DetailedSolutionEn"='Probability=(1/2)^3=1/8.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=291 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=291 AND o."Id"=1154
 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{8}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 291: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون احتمال الأحداث المستقلة: احتمال تحقق جميع الأحداث = حاصل ضرب احتمالاتها. احتمال ظهور الصورة في رمية واحدة لعملة عادلة هو 1/2. خلال 4 رميات مستقلة، احتمال ظهور الصورة في كل مرة = (1/2)^4 = 1/16. يوجد ناتج واحد مناسب من أصل 16 نتائج متساوية الاحتمال.', "DetailedSolutionEn"='Independent-events rule: Multiply the probabilities of all independent events. Each fair-coin toss has a 1/2 chance of heads. For 4 independent tosses, P(all heads) = (1/2)^4 = 1/16. Exactly one outcome out of 16 equally likely sequences is all heads.'
 WHERE "Id"=303 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 4 مرات؛ ما احتمال الصورة في كل الرميات؟' AND "QuestionTextEn"='Toss a fair coin 4 times; probability of heads on all tosses?'
 AND "DetailedSolutionAr"='الاحتمال=(1/2)^4=1/16.' AND "DetailedSolutionEn"='Probability=(1/2)^4=1/16.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=303 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=303 AND o."Id"=1201
 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{16}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 303: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون احتمال الأحداث المستقلة: احتمال تحقق جميع الأحداث = حاصل ضرب احتمالاتها. احتمال ظهور الصورة في رمية واحدة لعملة عادلة هو 1/2. خلال 5 رميات مستقلة، احتمال ظهور الصورة في كل مرة = (1/2)^5 = 1/32. يوجد ناتج واحد مناسب من أصل 32 نتائج متساوية الاحتمال.', "DetailedSolutionEn"='Independent-events rule: Multiply the probabilities of all independent events. Each fair-coin toss has a 1/2 chance of heads. For 5 independent tosses, P(all heads) = (1/2)^5 = 1/32. Exactly one outcome out of 32 equally likely sequences is all heads.'
 WHERE "Id"=315 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 5 مرات؛ ما احتمال الصورة في كل الرميات؟' AND "QuestionTextEn"='Toss a fair coin 5 times; probability of heads on all tosses?'
 AND "DetailedSolutionAr"='الاحتمال=(1/2)^5=1/32.' AND "DetailedSolutionEn"='Probability=(1/2)^5=1/32.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=315 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=315 AND o."Id"=1252
 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{32}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 315: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون احتمال الأحداث المستقلة: احتمال تحقق جميع الأحداث = حاصل ضرب احتمالاتها. احتمال ظهور الصورة في رمية واحدة لعملة عادلة هو 1/2. خلال 6 رميات مستقلة، احتمال ظهور الصورة في كل مرة = (1/2)^6 = 1/64. يوجد ناتج واحد مناسب من أصل 64 نتائج متساوية الاحتمال.', "DetailedSolutionEn"='Independent-events rule: Multiply the probabilities of all independent events. Each fair-coin toss has a 1/2 chance of heads. For 6 independent tosses, P(all heads) = (1/2)^6 = 1/64. Exactly one outcome out of 64 equally likely sequences is all heads.'
 WHERE "Id"=327 AND "StageId"=3 AND "CategoryId"=12
 AND "QuestionTextAr"='نرمي قطعة نقد عادلة 6 مرات؛ ما احتمال الصورة في كل الرميات؟' AND "QuestionTextEn"='Toss a fair coin 6 times; probability of heads on all tosses?'
 AND "DetailedSolutionAr"='الاحتمال=(1/2)^6=1/64.' AND "DetailedSolutionEn"='Probability=(1/2)^6=1/64.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=327 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=327 AND o."Id"=1299
 AND o."IsCorrect" AND o."LatexCode"='\frac{1}{64}');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 327: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون التباين السكاني: مجموع مربعات فروق القيم عن المتوسط ÷ عدد قيم المجتمع، وليس عددها ناقص واحد. البيانات 2، 2، 4، 4 متوسطها (2 + 2 + 4 + 4) ÷ 4 = 3. الفروق −1 و−1 و1 و1؛ مربعاتها 1 و1 و1 و1، ومجموعها 4. إذن التباين = 4 ÷ 4 = 1.', "DetailedSolutionEn"='Population variance rule: Sum of squared deviations from the mean ÷ population size N (not N−1). For 2, 2, 4, 4 the mean is 12/4 = 3. Deviations are −1, −1, 1, 1, whose squares sum to 4. Divide by N = 4: population variance = 1.'
 WHERE "Id"=48 AND "StageId"=3 AND "CategoryId"=35
 AND "QuestionTextAr"='ما التباين السكاني للقيم 2 و2 و4 و4؟' AND "QuestionTextEn"='What is the population variance of 2, 2, 4, and 4?'
 AND "DetailedSolutionAr"='المتوسط 3، ومجموع مربعات الانحرافات 4؛ التباين السكاني = 4 ÷ 4 = 1.' AND "DetailedSolutionEn"='The mean is 3. The sum of squared deviations is 4, so population variance = 4 / 4 = 1.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=48 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=48 AND o."Id"=184
 AND o."IsCorrect" AND o."LatexCode"='1');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 48: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المتوسط الحسابي للبيانات المتكررة = مجموع (القيمة × تكرارها) ÷ مجموع التكرارات. العدد 2 يتكرر 3 مرات والعدد 8 يتكرر 3 مرات. بالتعويض: المتوسط = (2 × 3 + 8 × 3) ÷ (3 + 3) = 30 ÷ 6 = 5. تساوي التكرارين يجعل المتوسط في منتصف العددين.', "DetailedSolutionEn"='Weighted-mean rule: Mean = sum(value × frequency) ÷ total frequency. The number 2 appears 3 times, and 8 appears 3 times. Substitute: (2 × 3 + 8 × 3) ÷ (3 + 3) = 30 ÷ 6 = 5. Equal frequencies place the mean halfway between the two values.'
 WHERE "Id"=280 AND "StageId"=3 AND "CategoryId"=35
 AND "QuestionTextAr"='تكررت القيمة 2 عدد 3 مرات والقيمة 8 عدد 3 مرات، أوجد المتوسط.' AND "QuestionTextEn"='Value 2 appears 3 times and 8 appears 3 times. Find the mean.'
 AND "DetailedSolutionAr"='لتساوي التكرارات المتوسط=(2+8)/2=5.' AND "DetailedSolutionEn"='Equal frequencies mean the average is (2+8)/2=5.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=280 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=280 AND o."Id"=1110
 AND o."IsCorrect" AND o."LatexCode"='5');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 280: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المتوسط الحسابي للبيانات المتكررة = مجموع (القيمة × تكرارها) ÷ مجموع التكرارات. العدد 3 يتكرر 4 مرات والعدد 9 يتكرر 4 مرات. بالتعويض: المتوسط = (3 × 4 + 9 × 4) ÷ (4 + 4) = 48 ÷ 8 = 6. تساوي التكرارين يجعل المتوسط في منتصف العددين.', "DetailedSolutionEn"='Weighted-mean rule: Mean = sum(value × frequency) ÷ total frequency. The number 3 appears 4 times, and 9 appears 4 times. Substitute: (3 × 4 + 9 × 4) ÷ (4 + 4) = 48 ÷ 8 = 6. Equal frequencies place the mean halfway between the two values.'
 WHERE "Id"=292 AND "StageId"=3 AND "CategoryId"=35
 AND "QuestionTextAr"='تكررت القيمة 3 عدد 4 مرات والقيمة 9 عدد 4 مرات، أوجد المتوسط.' AND "QuestionTextEn"='Value 3 appears 4 times and 9 appears 4 times. Find the mean.'
 AND "DetailedSolutionAr"='لتساوي التكرارات المتوسط=(3+9)/2=6.' AND "DetailedSolutionEn"='Equal frequencies mean the average is (3+9)/2=6.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=292 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=292 AND o."Id"=1157
 AND o."IsCorrect" AND o."LatexCode"='6');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 292: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المتوسط الحسابي للبيانات المتكررة = مجموع (القيمة × تكرارها) ÷ مجموع التكرارات. العدد 4 يتكرر 5 مرات والعدد 10 يتكرر 5 مرات. بالتعويض: المتوسط = (4 × 5 + 10 × 5) ÷ (5 + 5) = 70 ÷ 10 = 7. تساوي التكرارين يجعل المتوسط في منتصف العددين.', "DetailedSolutionEn"='Weighted-mean rule: Mean = sum(value × frequency) ÷ total frequency. The number 4 appears 5 times, and 10 appears 5 times. Substitute: (4 × 5 + 10 × 5) ÷ (5 + 5) = 70 ÷ 10 = 7. Equal frequencies place the mean halfway between the two values.'
 WHERE "Id"=304 AND "StageId"=3 AND "CategoryId"=35
 AND "QuestionTextAr"='تكررت القيمة 4 عدد 5 مرات والقيمة 10 عدد 5 مرات، أوجد المتوسط.' AND "QuestionTextEn"='Value 4 appears 5 times and 10 appears 5 times. Find the mean.'
 AND "DetailedSolutionAr"='لتساوي التكرارات المتوسط=(4+10)/2=7.' AND "DetailedSolutionEn"='Equal frequencies mean the average is (4+10)/2=7.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=304 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=304 AND o."Id"=1208
 AND o."IsCorrect" AND o."LatexCode"='7');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 304: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المتوسط الحسابي للبيانات المتكررة = مجموع (القيمة × تكرارها) ÷ مجموع التكرارات. العدد 5 يتكرر 6 مرات والعدد 11 يتكرر 6 مرات. بالتعويض: المتوسط = (5 × 6 + 11 × 6) ÷ (6 + 6) = 96 ÷ 12 = 8. تساوي التكرارين يجعل المتوسط في منتصف العددين.', "DetailedSolutionEn"='Weighted-mean rule: Mean = sum(value × frequency) ÷ total frequency. The number 5 appears 6 times, and 11 appears 6 times. Substitute: (5 × 6 + 11 × 6) ÷ (6 + 6) = 96 ÷ 12 = 8. Equal frequencies place the mean halfway between the two values.'
 WHERE "Id"=316 AND "StageId"=3 AND "CategoryId"=35
 AND "QuestionTextAr"='تكررت القيمة 5 عدد 6 مرات والقيمة 11 عدد 6 مرات، أوجد المتوسط.' AND "QuestionTextEn"='Value 5 appears 6 times and 11 appears 6 times. Find the mean.'
 AND "DetailedSolutionAr"='لتساوي التكرارات المتوسط=(5+11)/2=8.' AND "DetailedSolutionEn"='Equal frequencies mean the average is (5+11)/2=8.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=316 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=316 AND o."Id"=1255
 AND o."IsCorrect" AND o."LatexCode"='8');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 316: unexpected source or answer; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: المتوسط الحسابي للبيانات المتكررة = مجموع (القيمة × تكرارها) ÷ مجموع التكرارات. العدد 6 يتكرر 7 مرات والعدد 12 يتكرر 7 مرات. بالتعويض: المتوسط = (6 × 7 + 12 × 7) ÷ (7 + 7) = 126 ÷ 14 = 9. تساوي التكرارين يجعل المتوسط في منتصف العددين.', "DetailedSolutionEn"='Weighted-mean rule: Mean = sum(value × frequency) ÷ total frequency. The number 6 appears 7 times, and 12 appears 7 times. Substitute: (6 × 7 + 12 × 7) ÷ (7 + 7) = 126 ÷ 14 = 9. Equal frequencies place the mean halfway between the two values.'
 WHERE "Id"=328 AND "StageId"=3 AND "CategoryId"=35
 AND "QuestionTextAr"='تكررت القيمة 6 عدد 7 مرات والقيمة 12 عدد 7 مرات، أوجد المتوسط.' AND "QuestionTextEn"='Value 6 appears 7 times and 12 appears 7 times. Find the mean.'
 AND "DetailedSolutionAr"='لتساوي التكرارات المتوسط=(6+12)/2=9.' AND "DetailedSolutionEn"='Equal frequencies mean the average is (6+12)/2=9.'
 AND (SELECT count(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=328 AND o."IsCorrect")=1
 AND EXISTS (SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=328 AND o."Id"=1302
 AND o."IsCorrect" AND o."LatexCode"='9');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Secondary prob/stats problem 328: unexpected source or answer; rollback all'; END IF;
END $mw_secondary_probability_stats$;
COMMIT;
