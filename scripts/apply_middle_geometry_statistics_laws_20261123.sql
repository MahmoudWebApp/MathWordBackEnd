-- MathWorld middle-stage math: 31 reviewed bilingual explanations from categories 8 and 22.
-- Run only once after CI checks. Atomic and guarded against modified questions/answers.
-- No updates to question wording, options, scores, history, access, or subscriptions.
BEGIN;
DO $mw_middle_geometry_stats$
DECLARE affected integer;
BEGIN
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ الهندسي: الزوايا المتقابلة بالرأس متساوية عند تقاطع مستقيمين. إذا كانت إحدى الزاويتين 117°، فالزاوية المقابلة لها تساوي 117° أيضاً. أما الزاوية المجاورة فهي مكملة لها وقياسها 180° − 117° = 63°، وليست المطلوبة.',
      "DetailedSolutionEn"='Geometry principle: Vertically opposite angles formed by intersecting straight lines are equal. An angle opposite a 117° angle also measures 117°. An adjacent angle is supplementary, 180° − 117° = 63°, but that is not the requested angle.'
  WHERE "Id"=60 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='زاويتان متقابلتان بالرأس، قياس إحداهما 117°. ما قياس الأخرى؟'
    AND "QuestionTextEn"='Two vertically opposite angles are formed by intersecting lines. One is 117°. What is the other?'
    AND "DetailedSolutionAr"='الزاويتان المتقابلتان بالرأس متساويتان، لذا قياس الثانية 117°.'
    AND "DetailedSolutionEn"='Vertically opposite angles are equal, so the other angle is 117°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=60 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=60
               AND o."Id"=229 AND o."IsCorrect" AND o."LatexCode"='117');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 60: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لمضلع ذي 5 أضلاع هو (ن − 2) × 180°. يمكن تقسيم المضلع من رأس واحد إلى 3 مثلثات. بالتعويض: (5 − 2) × 180° = 3 × 180° = 540°.',
      "DetailedSolutionEn"='Rule used: Sum of the interior angles of an 5-sided polygon = (n − 2) × 180°. Drawing diagonals from one vertex divides it into 3 triangles, so (5 − 2) × 180° = 3 × 180° = 540°.'
  WHERE "Id"=218 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='ما مجموع الزوايا الداخلية لمضلع عدد أضلاعه 5؟'
    AND "QuestionTextEn"='Find the sum of interior angles of a polygon with 5 sides.'
    AND "DetailedSolutionAr"='المجموع=(5−2)×180=540°.'
    AND "DetailedSolutionEn"='Sum=(5−2)×180=540°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=218 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=218
               AND o."Id"=864 AND o."IsCorrect" AND o."LatexCode"='540');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 218: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لمضلع ذي 6 أضلاع هو (ن − 2) × 180°. يمكن تقسيم المضلع من رأس واحد إلى 4 مثلثات. بالتعويض: (6 − 2) × 180° = 4 × 180° = 720°.',
      "DetailedSolutionEn"='Rule used: Sum of the interior angles of an 6-sided polygon = (n − 2) × 180°. Drawing diagonals from one vertex divides it into 4 triangles, so (6 − 2) × 180° = 4 × 180° = 720°.'
  WHERE "Id"=230 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='ما مجموع الزوايا الداخلية لمضلع عدد أضلاعه 6؟'
    AND "QuestionTextEn"='Find the sum of interior angles of a polygon with 6 sides.'
    AND "DetailedSolutionAr"='المجموع=(6−2)×180=720°.'
    AND "DetailedSolutionEn"='Sum=(6−2)×180=720°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=230 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=230
               AND o."Id"=911 AND o."IsCorrect" AND o."LatexCode"='720');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 230: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لمضلع ذي 7 أضلاع هو (ن − 2) × 180°. يمكن تقسيم المضلع من رأس واحد إلى 5 مثلثات. بالتعويض: (7 − 2) × 180° = 5 × 180° = 900°.',
      "DetailedSolutionEn"='Rule used: Sum of the interior angles of an 7-sided polygon = (n − 2) × 180°. Drawing diagonals from one vertex divides it into 5 triangles, so (7 − 2) × 180° = 5 × 180° = 900°.'
  WHERE "Id"=242 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='ما مجموع الزوايا الداخلية لمضلع عدد أضلاعه 7؟'
    AND "QuestionTextEn"='Find the sum of interior angles of a polygon with 7 sides.'
    AND "DetailedSolutionAr"='المجموع=(7−2)×180=900°.'
    AND "DetailedSolutionEn"='Sum=(7−2)×180=900°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=242 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=242
               AND o."Id"=958 AND o."IsCorrect" AND o."LatexCode"='900');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 242: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لمضلع ذي 8 أضلاع هو (ن − 2) × 180°. يمكن تقسيم المضلع من رأس واحد إلى 6 مثلثات. بالتعويض: (8 − 2) × 180° = 6 × 180° = 1080°.',
      "DetailedSolutionEn"='Rule used: Sum of the interior angles of an 8-sided polygon = (n − 2) × 180°. Drawing diagonals from one vertex divides it into 6 triangles, so (8 − 2) × 180° = 6 × 180° = 1080°.'
  WHERE "Id"=254 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='ما مجموع الزوايا الداخلية لمضلع عدد أضلاعه 8؟'
    AND "QuestionTextEn"='Find the sum of interior angles of a polygon with 8 sides.'
    AND "DetailedSolutionAr"='المجموع=(8−2)×180=1080°.'
    AND "DetailedSolutionEn"='Sum=(8−2)×180=1080°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=254 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=254
               AND o."Id"=1005 AND o."IsCorrect" AND o."LatexCode"='1080');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 254: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لمضلع ذي 9 أضلاع هو (ن − 2) × 180°. يمكن تقسيم المضلع من رأس واحد إلى 7 مثلثات. بالتعويض: (9 − 2) × 180° = 7 × 180° = 1260°.',
      "DetailedSolutionEn"='Rule used: Sum of the interior angles of an 9-sided polygon = (n − 2) × 180°. Drawing diagonals from one vertex divides it into 7 triangles, so (9 − 2) × 180° = 7 × 180° = 1260°.'
  WHERE "Id"=266 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='ما مجموع الزوايا الداخلية لمضلع عدد أضلاعه 9؟'
    AND "QuestionTextEn"='Find the sum of interior angles of a polygon with 9 sides.'
    AND "DetailedSolutionAr"='المجموع=(9−2)×180=1260°.'
    AND "DetailedSolutionEn"='Sum=(9−2)×180=1260°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=266 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=266
               AND o."Id"=1056 AND o."IsCorrect" AND o."LatexCode"='1260');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 266: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مساحة الدائرة = π × (نصف القطر)². بما أن نصف القطر 5 سم، فإن المساحة = π × 5² = π × 25 = 25π سم². أبقينا الناتج بدلالة π لأن السؤال لم يطلب تقريباً عشرياً.',
      "DetailedSolutionEn"='Rule used: Circle area A = πr². With radius r = 5 cm, substitute A = π × 5² = π × 25 = 25π cm². We leave π symbolic because the question requests an exact answer in terms of π.'
  WHERE "Id"=625 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='ما مساحة دائرة نصف قطرها 5 سم بدلالة π؟'
    AND "QuestionTextEn"='What is the area of a circle of radius 5 cm, expressed in terms of π?'
    AND "DetailedSolutionAr"='المساحة = πr² = π × 5² = 25π سم².'
    AND "DetailedSolutionEn"='Area = πr² = π × 5² = 25π cm².'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=625 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=625
               AND o."Id"=2490 AND o."IsCorrect" AND o."LatexCode"='25\pi');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 625: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: نصف القطر = القطر ÷ 2، ومساحة الدائرة = πr². القطر 18 سم، لذلك نصف القطر 18 ÷ 2 = 9 سم. بالتعويض: π × 9² = 81π سم². لا نستخدم القطر 18 مكان نصف القطر في القانون.',
      "DetailedSolutionEn"='Rule used: Radius = diameter ÷ 2 and circle area A = πr². A diameter of 18 cm gives radius 9 cm. Substitute A = π × 9² = 81π cm². Using 18 instead of the radius would be incorrect.'
  WHERE "Id"=626 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='قطر دائرة 18 سم. ما مساحتها بدلالة π؟'
    AND "QuestionTextEn"='A circle''s diameter is 18 cm. What is its area in terms of π?'
    AND "DetailedSolutionAr"='نصف القطر 9 سم، لذا المساحة = π × 9² = 81π سم².'
    AND "DetailedSolutionEn"='The radius is 9 cm, so the area is π × 9² = 81π cm².'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=626 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=626
               AND o."Id"=2495 AND o."IsCorrect" AND o."LatexCode"='81\pi');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 626: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مساحة نصف الدائرة = نصف مساحة الدائرة الكاملة = (πr²) ÷ 2. نصف القطر 6 سم؛ أولاً مساحة الدائرة = π × 6² = 36π سم²، ثم مساحة نصفها = 36π ÷ 2 = 18π سم².',
      "DetailedSolutionEn"='Rule used: A semicircle has half the area of a full circle: A = πr²/2. With r = 6 cm, full-circle area is π × 6² = 36π cm². Half is 36π ÷ 2 = 18π cm².'
  WHERE "Id"=627 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='مساحة نصف دائرة نصف قطرها 6 سم تساوي كم بدلالة π؟'
    AND "QuestionTextEn"='A semicircle has radius 6 cm. What is its area in terms of π?'
    AND "DetailedSolutionAr"='مساحة الدائرة الكاملة 36π، ونصفها 18π سم².'
    AND "DetailedSolutionEn"='The full circle has area 36π; half is 18π cm².'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=627 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=627
               AND o."Id"=2499 AND o."IsCorrect" AND o."LatexCode"='18\pi');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 627: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: مساحة الدائرة = πr². إذا كانت المساحة 64π سم²، نحل πr² = 64π بقسمة الطرفين على π لنحصل على r² = 64. لأن نصف القطر طول غير سالب، r = √64 = 8 سم. التحقق: π × 8² = 64π.',
      "DetailedSolutionEn"='Rule used: Circle area A = πr². From 64π = πr², divide by π to obtain r² = 64. Radius is nonnegative, so r = √64 = 8 cm. Check: π × 8² = 64π.'
  WHERE "Id"=628 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='مساحة دائرة 64π سم². كم طول نصف قطرها بالسنتيمتر؟'
    AND "QuestionTextEn"='A circle''s area is 64π cm². What is its radius in centimeters?'
    AND "DetailedSolutionAr"='بما أن πr² = 64π، إذن r² = 64 ونأخذ نصف القطر الموجب r = 8.'
    AND "DetailedSolutionEn"='From πr² = 64π, we get r² = 64 and take the positive radius r = 8.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=628 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=628
               AND o."Id"=2502 AND o."IsCorrect" AND o."LatexCode"='8');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 628: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: زاويتا القاعدة في المثلث متساوي الساقين متساويتان. مجموع زوايا أي مثلث 180°. بوجود زاوية رأس 40° يكون مجموع زاويتي القاعدة 180° − 40° = 140°. إذن قياس كل منهما = 140° ÷ 2 = 70°.',
      "DetailedSolutionEn"='Rule used: Base angles of an isosceles triangle are equal, and all triangle angles sum to 180°. With a 40° apex, the two base angles sum to 180° − 40° = 140°, so each equals 140° ÷ 2 = 70°.'
  WHERE "Id"=697 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='زاوية رأس مثلث متساوي الساقين 40°. كم قياس كل زاوية عند القاعدة؟'
    AND "QuestionTextEn"='The apex angle of an isosceles triangle is 40°. What is each base angle?'
    AND "DetailedSolutionAr"='الزاويتان عند القاعدة متساويتان، ومجموعهما 180 − 40 = 140°. إذن كل منهما 70°.'
    AND "DetailedSolutionEn"='The two base angles are equal and sum to 180 − 40 = 140°, so each is 70°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=697 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=697
               AND o."Id"=2843 AND o."IsCorrect" AND o."LatexCode"='70');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 697: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: الزاوية الخارجية للمثلث تساوي مجموع الزاويتين الداخليتين البعيدتين عنها. قياس الخارجية 125° وإحدى البعيدتين 45°، لذا 125° = 45° + س. بطرح 45° نحصل على س = 125° − 45° = 80°.',
      "DetailedSolutionEn"='Rule used: A triangle''s exterior angle equals the sum of the two remote interior angles. Thus 125° = 45° + x. Subtract 45° from both sides: x = 125° − 45° = 80°.'
  WHERE "Id"=698 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='زاوية خارجية في مثلث تساوي 125°، وإحدى الزاويتين الداخليتين غير المجاورتين تساوي 45°. كم قياس الأخرى؟'
    AND "QuestionTextEn"='An exterior angle of a triangle is 125°, and one remote interior angle is 45°. What is the other remote interior angle?'
    AND "DetailedSolutionAr"='الزاوية الخارجية تساوي مجموع الداخليتين البعيدتين عنها، إذن 125 − 45 = 80°.'
    AND "DetailedSolutionEn"='The exterior angle equals the sum of the two remote interior angles, so 125 − 45 = 80°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=698 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=698
               AND o."Id"=2847 AND o."IsCorrect" AND o."LatexCode"='80');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 698: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: إحدى زوايا المثلث القائم 90° ومجموع الزوايا الثلاث 180°، لذا مجموع الزاويتين الحادتين = 90°. إذا كانت إحداهما 35° فإن الأخرى = 90° − 35° = 55°. التحقق: 90° + 35° + 55° = 180°.',
      "DetailedSolutionEn"='Rule used: A right triangle has one 90° angle, so its two acute angles total 90°. When one acute angle is 35°, the other equals 90° − 35° = 55°. Check: 90° + 35° + 55° = 180°.'
  WHERE "Id"=699 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='في مثلث قائم إحدى الزاويتين الحادتين 35°. ما قياس الزاوية الحادة الأخرى؟'
    AND "QuestionTextEn"='In a right triangle, one acute angle is 35°. What is the other acute angle?'
    AND "DetailedSolutionAr"='مجموع الزاويتين الحادتين في المثلث القائم 90°، لذا 90 − 35 = 55°.'
    AND "DetailedSolutionEn"='The two acute angles of a right triangle sum to 90°, so the other is 55°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=699 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=699
               AND o."Id"=2851 AND o."IsCorrect" AND o."LatexCode"='55');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 699: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: مجموع زوايا المثلث 180° والنسبة 1 : 2 : 3 تمثل ستة أجزاء متساوية. الجزء الواحد = 180° ÷ (1 + 2 + 3) = 30°. أكبر زاوية تمثل 3 أجزاء، لذلك 3 × 30° = 90°. الزوايا الثلاث هي 30° و60° و90°.',
      "DetailedSolutionEn"='Rule used: A triangle''s angles sum to 180°. A 1:2:3 ratio has 1 + 2 + 3 = 6 equal parts, so each part is 180° ÷ 6 = 30°. The largest angle has 3 parts: 3 × 30° = 90°. The angles are 30°, 60°, 90°.'
  WHERE "Id"=700 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='زوايا مثلث بنسبة 1 : 2 : 3. ما قياس أكبر زاوية فيه بالدرجات؟'
    AND "QuestionTextEn"='A triangle''s angles are in the ratio 1 : 2 : 3. How many degrees is its largest angle?'
    AND "DetailedSolutionAr"='مجموع الأجزاء 6، والجزء = 180 ÷ 6 = 30°؛ أكبر زاوية = 3 × 30 = 90°.'
    AND "DetailedSolutionEn"='There are 6 parts in total. Each is 180 ÷ 6 = 30°; the largest angle is 3 × 30 = 90°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=700 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=700
               AND o."Id"=2747 AND o."IsCorrect" AND o."LatexCode"='90');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 700: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: الزوايا المتقابلة بالرأس متساوية. نساوي التعبيرين: س + 20 = 3س − 40. بإضافة 40 وطرح س من الطرفين نحصل على 60 = 2س، وبالتالي س = 60 ÷ 2 = 30. التحقق: 30 + 20 = 3 × 30 − 40 = 50°.',
      "DetailedSolutionEn"='Rule used: Vertically opposite angles are equal. Set x + 20 = 3x − 40. Rearrange to obtain 60 = 2x, hence x = 30. Check the two angle measures: 30 + 20 = 50° and 3 × 30 − 40 = 50°.'
  WHERE "Id"=701 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='زاويتان متقابلتان بالرأس قياساهما (x + 20)° و(3x − 40)°. ما x؟'
    AND "QuestionTextEn"='Vertically opposite angles measure (x + 20)° and (3x − 40)°. Find x.'
    AND "DetailedSolutionAr"='الزاويتان متساويتان: x + 20 = 3x − 40، ومنه 2x = 60، إذن x = 30.'
    AND "DetailedSolutionEn"='Vertically opposite angles are equal: x + 20 = 3x − 40; hence 2x = 60 and x = 30.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=701 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=701
               AND o."Id"=2750 AND o."IsCorrect" AND o."LatexCode"='30');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 701: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: الزوايا المتقابلة بالرأس متساوية. نكتب 2س + 5 = س + 35؛ بطرح س و5 نحصل على س = 30. لكن السؤال يطلب قياس الزاوية لا قيمة س؛ بالتعويض: 2 × 30 + 5 = 65°. والزاوية المقابلة تساوي 30 + 35 = 65°.',
      "DetailedSolutionEn"='Rule used: Vertically opposite angles are equal, so 2x + 5 = x + 35 and x = 30. The question asks for the angle, not x. Substitute: 2 × 30 + 5 = 65°. The opposite angle is also 30 + 35 = 65°.'
  WHERE "Id"=702 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='زاويتان متقابلتان بالرأس قياساهما (2x + 5)° و(x + 35)°. ما قياس **إحداهما**؟'
    AND "QuestionTextEn"='Two vertically opposite angles measure (2x + 5)° and (x + 35)°. What is the measure of either angle?'
    AND "DetailedSolutionAr"='من 2x + 5 = x + 35 نجد x = 30. بالتعويض يكون قياس الزاوية 2 × 30 + 5 = 65°.'
    AND "DetailedSolutionEn"='Equating the opposite angles gives x = 30. Substitution gives 2 × 30 + 5 = 65°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=702 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=702
               AND o."Id"=2756 AND o."IsCorrect" AND o."LatexCode"='65');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 702: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: الزاويتان المتقابلتان بالرأس متساويتان في القياس. إذا كان مجموعهما 146°، نكتب س + س = 146° أي 2س = 146°. نقسم على 2 لنحصل على س = 73°. التحقق: 73° + 73° = 146°.',
      "DetailedSolutionEn"='Rule used: Vertically opposite angles have equal measures. If their sum is 146°, let each measure x: x + x = 146°, so 2x = 146°. Divide by 2 to get x = 73°. Check: 73° + 73° = 146°.'
  WHERE "Id"=703 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='مجموع قياسي زاويتين متقابلتين بالرأس 146°. كم قياس كل منهما؟'
    AND "QuestionTextEn"='The sum of two vertically opposite angles is 146°. What is the measure of each?'
    AND "DetailedSolutionAr"='لأنهما متساويتان، نقسم المجموع على 2: 146 ÷ 2 = 73°.'
    AND "DetailedSolutionEn"='They have equal measures, so each is 146 ÷ 2 = 73°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=703 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=703
               AND o."Id"=2759 AND o."IsCorrect" AND o."LatexCode"='73');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 703: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: عند تقاطع مستقيمين تتساوى كل زاويتين متقابلتين بالرأس، وتتكامل كل زاويتين متجاورتين إلى 180°. إذا كانت زاوية 65° فالمقابلة 65° أيضاً، والمجاورتان 180° − 65° = 115°. إذن زاويتان فقط من الأربع قياسهما 65°.',
      "DetailedSolutionEn"='Rule used: Intersecting lines form equal vertically opposite angles and adjacent angles sum to 180°. If one angle is 65°, its opposite is also 65°, while the two adjacent angles are 180° − 65° = 115°. Exactly two of the four measure 65°.'
  WHERE "Id"=704 AND "StageId"=2 AND "CategoryId"=8
    AND "QuestionTextAr"='يتقاطع خطان مستقيمان وتتشكل زاوية قياسها 65°. كم زاوية من الزوايا الأربع تساوي 65°؟'
    AND "QuestionTextEn"='Two straight lines intersect and one of the four angles measures 65°. How many of the four angles measure 65°?'
    AND "DetailedSolutionAr"='الزاوية المقابلة لها بالرأس تساوي 65° أيضاً، والزاويتان الباقيتان 115°. إذن زاويتان فقط تساويان 65°.'
    AND "DetailedSolutionEn"='The vertically opposite angle is also 65°, while the adjacent angles are 115°. Exactly two angles measure 65°.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=704 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=704
               AND o."Id"=2762 AND o."IsCorrect" AND o."LatexCode"='2');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 704: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: مجموع فئات الرسم البياني غير المتداخلة يساوي العدد الكلي. بيانات المشي 8 وركوب الدراجات 12 والحافلة 10 طلاب. نجمع 8 + 12 + 10 = 30 طالباً. نفترض أن كل طالب محسوب في فئة واحدة فقط، حتى لا يحدث عدّ مزدوج.',
      "DetailedSolutionEn"='Rule used: Sum the disjoint categories in a chart to find the total. There are 8 walkers, 12 cyclists and 10 bus riders. Add 8 + 12 + 10 = 30 pupils. Each pupil is counted once.'
  WHERE "Id"=429 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='يبين مخطط أن 8 طلاب يذهبون مشياً و12 بالدراجة و10 بالحافلة. كم العدد الكلي؟'
    AND "QuestionTextEn"='A chart shows 8 pupils walk, 12 cycle and 10 take a bus. What is the total?'
    AND "DetailedSolutionAr"='نجمع الفئات غير المتداخلة: $8+12+10=30$ طالباً.'
    AND "DetailedSolutionEn"='Add the mutually exclusive groups: $8+12+10=30$ pupils.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=429 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=429
               AND o."Id"=1707 AND o."IsCorrect" AND o."LatexCode"='30');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 429: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: المتوسط الحسابي = مجموع القيم ÷ عددها. إذا أضفنا 3 إلى كل قيمة من ن قيم، يزداد المجموع بمقدار 3ن؛ بالتالي المتوسط الجديد = (المجموع + 3ن) ÷ ن = المتوسط القديم + 3. إذن يزداد المتوسط بمقدار 3.',
      "DetailedSolutionEn"='Rule used: Mean = sum ÷ count. Adding 3 to each of n observations adds 3n to the sum. New mean = (sum + 3n)/n = old mean + 3. Therefore the mean increases by exactly 3.'
  WHERE "Id"=431 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='إذا أضفنا 3 إلى كل مشاهدة في مجموعة بيانات، كيف يتغير المتوسط الحسابي؟'
    AND "QuestionTextEn"='If 3 is added to every observation in a data set, how does its mean change?'
    AND "DetailedSolutionAr"='تزداد كل قيمة بمقدار 3، لذا يزداد مجموع القيم بمقدار 3 لكل مشاهدة؛ يزداد المتوسط بمقدار 3.'
    AND "DetailedSolutionEn"='Adding 3 to each observation increases the total by three times the number of observations, so the mean increases by 3.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=431 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=431
               AND o."Id"=1713 AND o."IsCorrect" AND o."LatexCode"='+3');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 431: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: الوسيط هو القيمة الوسطى بعد ترتيب البيانات. لدينا خمس قيم مرتبة 1، 4، 7، 9، 12؛ رتبة الوسيط = (5 + 1) ÷ 2 = 3. العدد الثالث هو 7، إذن الوسيط 7، وليس متوسط القيم كلها.',
      "DetailedSolutionEn"='Rule used: The median is the middle observation in sorted order. For 1, 4, 7, 9, 12 there are five values, so median position = (5 + 1) ÷ 2 = 3. The third value is 7; the median is 7.'
  WHERE "Id"=432 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='ما وسيط البيانات المرتبة: 1، 4، 7، 9، 12؟'
    AND "QuestionTextEn"='What is the median of the sorted values 1, 4, 7, 9, 12?'
    AND "DetailedSolutionAr"='لدينا خمس قيم مرتبة؛ القيمة الثالثة في المنتصف هي 7.'
    AND "DetailedSolutionEn"='With five ordered observations, the middle (third) value is 7.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=432 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=432
               AND o."Id"=1719 AND o."IsCorrect" AND o."LatexCode"='7');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 432: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: المدى = أكبر مشاهدة − أصغر مشاهدة. في القيم 3، 4، 6، 9، 20، أكبر قيمة 20 وأصغرها 3. بالتعويض: المدى = 20 − 3 = 17. لا نجمع القيم لأن المدى يقيس الانتشار بين الطرفين.',
      "DetailedSolutionEn"='Rule used: Range = maximum observation − minimum observation. For 3, 4, 6, 9, 20 the maximum is 20 and the minimum is 3. Hence range = 20 − 3 = 17; we do not add the values.'
  WHERE "Id"=433 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='احسب مدى القيم: 3، 4، 6، 9، 20.'
    AND "QuestionTextEn"='Find the range of the values 3, 4, 6, 9, 20.'
    AND "DetailedSolutionAr"='المدى = أكبر قيمة − أصغر قيمة = $20-3=17$.'
    AND "DetailedSolutionEn"='The range is maximum minus minimum: $20-3=17$.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=433 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=433
               AND o."Id"=1724 AND o."IsCorrect" AND o."LatexCode"='17');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 433: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: التكرار النسبي المئوي = عدد استجابات الفئة ÷ إجمالي الاستجابات × 100%. لدينا 5 استجابات من 20؛ نحسب 5 ÷ 20 = 1/4 = 0.25، ثم 0.25 × 100% = 25%. إذن التكرار النسبي 25%.',
      "DetailedSolutionEn"='Rule used: Relative frequency as a percentage = category count ÷ total responses × 100%. With 5 out of 20, calculate 5 ÷ 20 = 1/4 = 0.25; then 0.25 × 100% = 25%. Answer: 25%.'
  WHERE "Id"=434 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='من أصل 20 استجابة في استبيان، اختار 5 طلاب خياراً معيناً. ما التكرار النسبي بالنسبة المئوية؟'
    AND "QuestionTextEn"='In a survey with 20 responses, 5 select one option. What is the relative frequency as a percentage?'
    AND "DetailedSolutionAr"='التكرار النسبي $\frac5{20}=0.25=25\%$.'
    AND "DetailedSolutionEn"='The relative frequency is $\frac5{20}=0.25=25\%$.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=434 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=434
               AND o."Id"=1726 AND o."IsCorrect" AND o."LatexCode"='25\%');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 434: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: المتوسط المرجح بالتكرارات = مجموع (القيمة × تكرارها) ÷ مجموع التكرارات. العدد 2 يتكرر 3 مرات والعدد 7 مرتين؛ المجموع = 2 × 3 + 7 × 2 = 6 + 14 = 20. عدد المشاهدات = 3 + 2 = 5. المتوسط = 20 ÷ 5 = 4.',
      "DetailedSolutionEn"='Rule used: Frequency-weighted mean = sum(value × frequency) ÷ total frequency. The value 2 occurs 3 times and 7 occurs twice, giving sum 2 × 3 + 7 × 2 = 20. There are 5 observations, so mean = 20 ÷ 5 = 4.'
  WHERE "Id"=435 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='ظهرت القيمة 2 ثلاث مرات والقيمة 7 مرتين في مجموعة بيانات. ما المتوسط الحسابي؟'
    AND "QuestionTextEn"='In a data set, 2 appears three times and 7 appears twice. What is the mean?'
    AND "DetailedSolutionAr"='المجموع $3\times2+2\times7=20$، وعدد القيم 5، فالمتوسط $20\div5=4$.'
    AND "DetailedSolutionEn"='The total is $3\times2+2\times7=20$ across five observations, so the mean is 4.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=435 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=435
               AND o."Id"=1732 AND o."IsCorrect" AND o."LatexCode"='4');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 435: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: الوسيط يتحدد بموقع القيمة الوسطى في البيانات المرتبة، لا بحجم القيمة المتطرفة. المجموعة 4، 5، 6، 7، 50 وسيطها 6، وبعد استبدال 50 بـ500 تصبح 4، 5، 6، 7، 500 ووسيطها أيضاً 6. يتغير المتوسط والمدى والانحراف المعياري لأن القيمة القصوى تغيرت.',
      "DetailedSolutionEn"='Rule used: Median depends on the middle ordered position rather than the size of an extreme value. Both 4, 5, 6, 7, 50 and 4, 5, 6, 7, 500 have the third value 6 as the median. Mean, range, and standard deviation change when the maximum changes.'
  WHERE "Id"=479 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='إذا استُبدلت أكبر قيمة في البيانات 4، 5، 6، 7، 50 بالعدد 500، فأي مقياس من الآتي يبقى دون تغيير؟'
    AND "QuestionTextEn"='If the largest value in 4, 5, 6, 7, 50 is replaced by 500, which statistic remains unchanged?'
    AND "DetailedSolutionAr"='الوسيط هو القيمة الثالثة 6 في الحالتين، بينما يتغير المتوسط والمدى والانحراف المعياري.'
    AND "DetailedSolutionEn"='The median remains the middle value 6; the mean, range and standard deviation all change.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=479 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=479
               AND o."Id"=1906 AND o."IsCorrect" AND o."LatexCode"='\text{الوسيط (Median)}');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 479: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: المنوال هو القيمة الأعلى تكراراً. البيانات 1، 1، 2، 3، 3، 3، 9 تحتوي على 3 ثلاث مرات، والعدد 1 مرتين، و2 و9 مرة لكل منهما. بما أن 3 أكثر تكراراً من كل قيمة أخرى، فإن المنوال = 3.',
      "DetailedSolutionEn"='Rule used: Mode is the most frequent data value. In 1, 1, 2, 3, 3, 3, 9, the value 3 appears three times, 1 appears twice, and 2 and 9 appear once each. Thus the mode is 3.'
  WHERE "Id"=481 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='ما منوال القيم 1، 1، 2، 3، 3، 3، 9؟'
    AND "QuestionTextEn"='What is the mode of 1, 1, 2, 3, 3, 3, 9?'
    AND "DetailedSolutionAr"='القيمة 3 تكررت ثلاث مرات، وهو أكثر من تكرار أي قيمة أخرى؛ لذلك المنوال هو 3.'
    AND "DetailedSolutionEn"='The value 3 occurs three times, more often than any other value, so the mode is 3.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=481 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=481
               AND o."Id"=1915 AND o."IsCorrect" AND o."LatexCode"='3');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 481: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: المدى = القيمة العظمى − القيمة الصغرى. عند إضافة 5 إلى كل مشاهدة، تزداد العظمى والصغرى بالمقدار نفسه، ويصبح المدى الجديد = (العظمى + 5) − (الصغرى + 5) = العظمى − الصغرى. إذن المدى لا يتغير.',
      "DetailedSolutionEn"='Rule used: Range = maximum − minimum. Adding 5 to every observation increases both extremes by 5, giving new range (max + 5) − (min + 5) = max − min. The range remains unchanged.'
  WHERE "Id"=482 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='إذا أضفنا 5 إلى كل قيمة في مجموعة بيانات، ماذا يحدث للمدى؟'
    AND "QuestionTextEn"='If 5 is added to every value in a dataset, what happens to the range?'
    AND "DetailedSolutionAr"='المدى هو الأكبر ناقص الأصغر. بعد إضافة 5 إلى كليهما تصبح $(\max+5)-(\min+5)=\max-\min$، فلا يتغير.'
    AND "DetailedSolutionEn"='Range is maximum minus minimum. Adding 5 to both gives $(\max+5)-(\min+5)=\max-\min$, so it is unchanged.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=482 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=482
               AND o."Id"=1919 AND o."IsCorrect" AND o."LatexCode"='\text{لا يتغير (Unchanged)}');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 482: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: قيمة الرمز الواحد في المخطط المصور = 4 كتب. لدى المجموعة أ ست نجوم فتُمثّل 6 × 4 = 24 كتاباً، ولدى ب ثلاث نجوم فتُمثّل 3 × 4 = 12 كتاباً. الفرق = 24 − 12 = 12 كتاباً، وليس ثلاث نجوم فقط.',
      "DetailedSolutionEn"='Rule used: In a pictograph, each star stands for 4 books. Group A''s six stars represent 6 × 4 = 24 books; B''s three stars represent 3 × 4 = 12 books. Difference = 24 − 12 = 12 books, not merely three symbols.'
  WHERE "Id"=823 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='في مخطط تصويري للكتب، كل رمز ★ يمثّل 4 كتب. يظهر لدى المجموعة أ ستة رموز ولدى المجموعة ب ثلاثة رموز. كم كتاباً تزيد المجموعة أ عن ب؟'
    AND "QuestionTextEn"='In a book pictograph, each star represents 4 books. Group A has six stars and group B has three stars. How many more books does group A have?'
    AND "DetailedSolutionAr"='أ = 6 × 4 = 24 كتاباً، وب = 3 × 4 = 12 كتاباً، والفرق = 12 كتاباً.'
    AND "DetailedSolutionEn"='A represents 6 × 4 = 24 books and B represents 3 × 4 = 12 books, so the difference is 12.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=823 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=823
               AND o."Id"=3283 AND o."IsCorrect" AND o."LatexCode"='12');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 823: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='المبدأ المستخدم: أكبر زيادة بين نقطتين متتاليتين تعني أكبر فرق موجب (القيمة التالية − السابقة). للفترات: 23 − 14 = +9، ثم 19 − 23 = −4 وهو انخفاض، ثم 31 − 19 = +12. أكبر زيادة هي +12.',
      "DetailedSolutionEn"='Rule used: Largest consecutive increase means the largest positive next-minus-previous change. The differences are 23 − 14 = +9, 19 − 23 = −4 (a decrease), and 31 − 19 = +12. The largest increase is 12.'
  WHERE "Id"=824 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='يعرض مخطط خطي أربع قراءات متتالية: 14 ثم 23 ثم 19 ثم 31. ما مقدار أكبر زيادة بين قراءتين متتاليتين؟'
    AND "QuestionTextEn"='A line chart shows four successive values: 14, 23, 19, and 31. What is the largest increase between consecutive points?'
    AND "DetailedSolutionAr"='الفروق المتتالية: +9 ثم −4 ثم +12؛ أكبر زيادة هي 12.'
    AND "DetailedSolutionEn"='The successive differences are +9, −4, and +12. The largest positive change is 12.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=824 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=824
               AND o."Id"=3288 AND o."IsCorrect" AND o."LatexCode"='12');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 824: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: متوسط الانحراف المطلق = مجموع المسافات المطلقة عن المتوسط ÷ عدد القيم. للبيانات 2، 4، 6 المتوسط = (2 + 4 + 6)/3 = 4. الانحرافات المطلقة |2 − 4| = 2، |4 − 4| = 0، |6 − 4| = 2. مجموعها 4، فنقسم على 3: الناتج 4/3.',
      "DetailedSolutionEn"='Rule used: Mean absolute deviation (MAD) = sum of absolute distances from the mean ÷ number of values. The mean of 2, 4, 6 is 4. Absolute deviations are |2−4| = 2, |4−4| = 0 and |6−4| = 2. Their sum is 4; dividing by 3 gives MAD = 4/3.'
  WHERE "Id"=825 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='للقيم 2 و4 و6 متوسط حسابي يساوي 4. ما متوسط الانحرافات المطلقة لهذه القيم عن المتوسط؟'
    AND "QuestionTextEn"='The data values 2, 4, and 6 have a mean of 4. What is their mean absolute deviation?'
    AND "DetailedSolutionAr"='الانحرافات المطلقة هي 2 و0 و2؛ المتوسط = (2 + 0 + 2) / 3 = 4/3.'
    AND "DetailedSolutionEn"='The absolute deviations are 2, 0, and 2; their mean is (2 + 0 + 2) / 3 = 4/3.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=825 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=825
               AND o."Id"=3289 AND o."IsCorrect" AND o."LatexCode"='\frac{4}{3}');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 825: stale explanation/question or altered answer; rollback all'; END IF;
  UPDATE public."Problems"
  SET "DetailedSolutionAr"='القانون المستخدم: المدى الربيعي IQR = الربيع الثالث Q3 − الربيع الأول Q1. للمجموعة أ: 18 − 6 = 12. للمجموعة ب: 15 − 9 = 6. الفرق بين المديين = 12 − 6 = 6. إذن مدى أ الربيعي يتجاوز مدى ب بمقدار 6.',
      "DetailedSolutionEn"='Rule used: Interquartile range (IQR) = Q3 − Q1. For A, IQR = 18 − 6 = 12; for B, IQR = 15 − 9 = 6. The amount by which A exceeds B is 12 − 6 = 6.'
  WHERE "Id"=826 AND "StageId"=2 AND "CategoryId"=22
    AND "QuestionTextAr"='في مجموعتين من البيانات: للمجموعة أ الربيع الأول 6 والثالث 18، وللمجموعة ب الربيع الأول 9 والثالث 15. بكم يزيد المدى الربيعي للمجموعة أ؟'
    AND "QuestionTextEn"='For data set A, Q1 = 6 and Q3 = 18. For data set B, Q1 = 9 and Q3 = 15. By how much does A''s interquartile range exceed B''s?'
    AND "DetailedSolutionAr"='مدى أ الربيعي = 18 − 6 = 12، ومدى ب = 15 − 9 = 6؛ الفرق 6.'
    AND "DetailedSolutionEn"='A''s IQR is 18 − 6 = 12; B''s is 15 − 9 = 6; the difference is 6.'
    AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=826 AND o."IsCorrect")=1
    AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=826
               AND o."Id"=3294 AND o."IsCorrect" AND o."LatexCode"='6');
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 826: stale explanation/question or altered answer; rollback all'; END IF;
END $mw_middle_geometry_stats$;
COMMIT;
