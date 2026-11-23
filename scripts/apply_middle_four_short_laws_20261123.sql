-- Four stage-two explanation-only clarity updates, one-time atomic transaction.
BEGIN;
DO $mw_four_middle_clarity$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون الأسس: أ^ن يعني ضرب العدد أ في نفسه ن مرات عندما يكون ن عدداً صحيحاً موجباً. إذن 2⁵ = 2 × 2 × 2 × 2 × 2. نحسب بالتدرج: 2 × 2 = 4، ثم 4 × 2 = 8، ثم 8 × 2 = 16، وأخيراً 16 × 2 = 32. النتيجة 32.', "DetailedSolutionEn"='Exponent rule: For a positive integer n, a^n is the product of n factors equal to a. Thus 2⁵ = 2 × 2 × 2 × 2 × 2. Calculate stepwise: 2 × 2 = 4, then 8, then 16 and finally 32. Answer: 32.'
 WHERE "Id"=41 AND "StageId"=2 AND "CategoryId"=5
 AND "QuestionTextAr"='ما قيمة 2 أس 5؟' AND "QuestionTextEn"='What is 2 raised to the fifth power?'
 AND "DetailedSolutionAr"='2 أس 5 يعني 2 × 2 × 2 × 2 × 2 = 32.' AND "DetailedSolutionEn"='Two to the fifth power equals 2 × 2 × 2 × 2 × 2 = 32.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=41 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=41
 AND o."Id"=153 AND o."IsCorrect" AND o."LatexCode"='32');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle explanation 41 modified; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون فيثاغورس في المثلث القائم: مربع الوتر يساوي مجموع مربعي الضلعين القائمين، ج² = أ² + ب². طولا الضلعين القائمين 6 و8 سم. بالتعويض: ج² = 6² + 8² = 36 + 64 = 100، لذا الوتر ج = √100 = 10 سم. نأخذ الجذر الموجب لأن الطول لا يكون سالباً.', "DetailedSolutionEn"='Pythagorean theorem: In a right triangle, the hypotenuse squared equals the sum of squares of the legs, c² = a² + b². For legs 6 cm and 8 cm, c² = 6² + 8² = 36 + 64 = 100. Therefore c = √100 = 10 cm, taking the positive length.'
 WHERE "Id"=44 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='مثلث قائم ضلعاه القائمان 6 سم و8 سم؛ ما طول الوتر؟' AND "QuestionTextEn"='A right triangle has legs of 6 cm and 8 cm. How long is its hypotenuse?'
 AND "DetailedSolutionAr"='حسب فيثاغورس: مربع الوتر = 6² + 8² = 36 + 64 = 100، فالوتر 10 سم.' AND "DetailedSolutionEn"='By Pythagoras, c² = 6² + 8² = 100, so c = 10 cm.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=44 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=44
 AND o."Id"=168 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle explanation 44 modified; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='القانون المستخدم: عند ثبات سعر الوحدة، الكلفة الكلية = عدد القطع × سعر القطعة الواحدة. تكلفة أربعة أقلام هي 12 وحدة، إذن سعر القلم = 12 ÷ 4 = 3 وحدات. تكلفة سبعة أقلام = 7 × 3 = 21 وحدة. التحقق: 21 ÷ 7 = 3، وهو سعر القلم نفسه.', "DetailedSolutionEn"='Rule used: With a constant unit price, total cost = quantity × unit price. Four pens cost 12 units, so each costs 12 ÷ 4 = 3 units. Seven pens cost 7 × 3 = 21 units. Check: 21 ÷ 7 = 3 units per pen.'
 WHERE "Id"=59 AND "StageId"=2 AND "CategoryId"=7
 AND "QuestionTextAr"='ثمن أربعة أقلام 12، فكم ثمن سبعة أقلام بالسعر نفسه؟' AND "QuestionTextEn"='Four identical pens cost 12 units. How much do seven cost at the same rate?'
 AND "DetailedSolutionAr"='ثمن القلم الواحد 12 ÷ 4 = 3، وثمن السبعة 7 × 3 = 21.' AND "DetailedSolutionEn"='One pen costs 12 / 4 = 3 units; seven cost 7 × 3 = 21.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=59 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=59
 AND o."Id"=228 AND o."IsCorrect" AND o."LatexCode"='21');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle explanation 59 modified; rollback all'; END IF;
 UPDATE public."Problems" SET "DetailedSolutionAr"='قانون المسافة بين نقطتين في المستوى الإحداثي: د = √((س₂ − س₁)² + (ص₂ − ص₁)²). بين (1،2) و(7،10) نحسب فرق س = 7 − 1 = 6، وفرق ص = 10 − 2 = 8. بالتعويض: د = √(6² + 8²) = √(36 + 64) = √100 = 10 وحدات طول.', "DetailedSolutionEn"='Distance formula between two coordinate points: d = √((x₂ − x₁)² + (y₂ − y₁)²). Between (1,2) and (7,10), Δx = 7 − 1 = 6 and Δy = 10 − 2 = 8. Substitute: d = √(6² + 8²) = √(36 + 64) = √100 = 10 length units.'
 WHERE "Id"=857 AND "StageId"=2 AND "CategoryId"=34
 AND "QuestionTextAr"='كم المسافة بين النقطتين (1،2) و(7،10) على المستوى الإحداثي؟' AND "QuestionTextEn"='Find the distance between (1,2) and (7,10) in the coordinate plane.'
 AND "DetailedSolutionAr"='فرق الإحداثيين 6 و8، لذا المسافة = √(6²+8²)=√100=10.' AND "DetailedSolutionEn"='The horizontal and vertical differences are 6 and 8. Distance = sqrt(6²+8²) = 10.'
 AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=857 AND o."IsCorrect")=1
 AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=857
 AND o."Id"=3422 AND o."IsCorrect" AND o."LatexCode"='10');
 GET DIAGNOSTICS affected=ROW_COUNT;
 IF affected<>1 THEN RAISE EXCEPTION 'Middle explanation 857 modified; rollback all'; END IF;
END $mw_four_middle_clarity$;
COMMIT;
