-- DEVELOPMENT ONLY. Split four overly broad categories by existing, verified skill labels.
-- Never delete problems or attempts: preserves problem IDs, progress, Premium and
-- first-two-Free category selections. Run only after new category SVGs are live.
-- PREVIEW ONLY until dependent icons on the single Vercel production site are READY.
BEGIN;
SELECT pg_advisory_xact_lock(20261121);

DO $preflight$
DECLARE n integer;
BEGIN
 IF (SELECT COUNT(*) FROM "Problems")<>447 OR (SELECT COUNT(*) FROM "Categories")<>20 OR
    (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary")<>447 THEN
   RAISE EXCEPTION 'Unexpected curriculum inventory; review before splitting';
 END IF;
 IF EXISTS(SELECT 1 FROM "Categories" WHERE "NameEn" IN
   ('Multiplication & Division', 'Triangles, Similarity & Pythagoras',
    'Descriptive Statistics', 'Sequences & Convergence')) THEN
   RAISE EXCEPTION 'New category titles already exist';
 END IF;
 IF (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=1)<>25 OR
    (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=8)<>24 OR
    (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=12)<>24 OR
    (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=16)<>24 THEN
   RAISE EXCEPTION 'Source category counts changed; re-audit the distribution';
 END IF;
 IF EXISTS(SELECT 1 FROM "Problems" p
   LEFT JOIN "CurriculumProblemSkills" ps ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
   LEFT JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId"
   WHERE p."CategoryId" IN (1,8,12,16)
   AND (s."Id" IS NULL OR s."CategoryId"<>p."CategoryId" OR s."StageId"<>p."StageId")) THEN
   RAISE EXCEPTION 'Some source questions have an invalid primary skill link';
 END IF;
 IF (SELECT COUNT(*) FROM "Categories" WHERE "Id"=1 AND "NameEn"='Numbers & Operations')<>1 OR
    (SELECT COUNT(*) FROM "Categories" WHERE "Id"=8 AND "NameEn"='Geometry & Proofs')<>1 OR
    (SELECT COUNT(*) FROM "Categories" WHERE "Id"=12 AND "NameEn"='Advanced Statistics')<>1 OR
    (SELECT COUNT(*) FROM "Categories" WHERE "Id"=16 AND "NameEn"='Real Analysis')<>1 THEN
   RAISE EXCEPTION 'One or more category names have changed';
 END IF;
END $preflight$;

-- Rename original categories to their actual retained objectives.
UPDATE "Categories" SET
 "NameAr"='الجمع والطرح والمسائل الحسابية',
 "NameEn"='Addition, Subtraction & Word Problems',
 "DescriptionAr"='التدرّب على الجمع والطرح وحل المسائل الحسابية متعددة الخطوات.',
 "DescriptionEn"='Build addition and subtraction fluency and solve multistep arithmetic word problems.'
WHERE "Id"=1;
UPDATE "Categories" SET
 "NameAr"='الزوايا والقياس الهندسي',
 "NameEn"='Angles & Geometric Measurement',
 "DescriptionAr"='استكشاف زوايا الأشكال والمضلعات وتطبيقات القياس والمساحة.',
 "DescriptionEn"='Understand angles and polygons, with foundational geometric measurement and area.'
WHERE "Id"=8;
UPDATE "Categories" SET
 "NameAr"='الاحتمالات والتوافيق',
 "NameEn"='Probability & Combinatorics',
 "DescriptionAr"='الاحتمال والتجارب العشوائية والعد والتوافيق.',
 "DescriptionEn"='Explore chance experiments, probability calculations and basic combinations.'
WHERE "Id"=12;
UPDATE "Categories" SET
 "NameAr"='النهايات والاستمرارية',
 "NameEn"='Limits & Continuity',
 "DescriptionAr"='النهايات والاستمرارية وقيمة الدوال ونتائج نظرية القيمة المتوسطة.',
 "DescriptionEn"='Study limits, continuity, differentiability and the intermediate value theorem.'
WHERE "Id"=16;

-- New categories get a real mathematical icon, stage-specific color, and no empty state.
INSERT INTO "Categories"
("NameAr","NameEn","Icon","Order","DescriptionAr","DescriptionEn","StageId")
VALUES
('الضرب والقسمة','Multiplication & Division',
 'https://math-world-frontend.vercel.app/category-icons/multiplication-division.svg',
 (SELECT COALESCE(MAX("Order"),0)+1 FROM "Categories" WHERE "StageId"=1),
 'المهارات الأساسية للضرب والقسمة والمسائل اللفظية التي تستخدم العمليات الضربية.',
 'Multiplication and division methods, with real-world multiplicative word problems.',1),
('المثلثات والتشابه وفيثاغورس','Triangles, Similarity & Pythagoras',
 'https://math-world-frontend.vercel.app/category-icons/triangle-similarity.svg',
 (SELECT COALESCE(MAX("Order"),0)+1 FROM "Categories" WHERE "StageId"=2),
 'التشابه في المثلثات وتطبيق نظرية فيثاغورس لفهم الأطوال والعلاقات الهندسية.',
 'Triangles, similarity and the Pythagorean theorem applied to geometric relationships.',2),
('الإحصاء الوصفي','Descriptive Statistics',
 'https://math-world-frontend.vercel.app/category-icons/descriptive-statistics.svg',
 (SELECT COALESCE(MAX("Order"),0)+1 FROM "Categories" WHERE "StageId"=3),
 'تحليل القيم الإحصائية باستخدام المتوسط والتباين وفهم معنى كل مقياس.',
 'Summarize and interpret data using measures such as the mean and variance.',3),
('المتتاليات والتقارب','Sequences & Convergence',
 'https://math-world-frontend.vercel.app/category-icons/sequences-convergence.svg',
 (SELECT COALESCE(MAX("Order"),0)+1 FROM "Categories" WHERE "StageId"=4),
 'دراسة نهايات المتتاليات ورتابتها وتقاربها والمتسلسلات المرتبطة بها.',
 'Sequences, limits, monotonicity and convergence of related series.',4);

WITH assignments("SourceId","NewName","SkillKey") AS (VALUES
 (1,'Multiplication & Division','primary-multiplication'),
 (1,'Multiplication & Division','primary-division'),
 (1,'Multiplication & Division','primary-multiplicative-word-problems'),
 (8,'Triangles, Similarity & Pythagoras','middle-pythagorean-theorem'),
 (8,'Triangles, Similarity & Pythagoras','middle-similar-triangles'),
 (12,'Descriptive Statistics','secondary-arithmetic-mean'),
 (12,'Descriptive Statistics','secondary-population-variance'),
 (16,'Sequences & Convergence','university-sequence-limits'),
 (16,'Sequences & Convergence','university-monotone-convergence'),
 (16,'Sequences & Convergence','university-series-convergence')
)
UPDATE "Problems" p SET "CategoryId"=newcat."Id"
FROM "CurriculumProblemSkills" ps
JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId" AND ps."IsPrimary"
JOIN assignments a ON a."SourceId"=s."CategoryId" AND a."SkillKey"=s."StableKey"
JOIN "Categories" newcat ON newcat."NameEn"=a."NewName" AND newcat."StageId"=s."StageId"
WHERE ps."ProblemId"=p."Id" AND p."CategoryId"=a."SourceId";

WITH assignments("SourceId","NewName","SkillKey") AS (VALUES
 (1,'Multiplication & Division','primary-multiplication'),
 (1,'Multiplication & Division','primary-division'),
 (1,'Multiplication & Division','primary-multiplicative-word-problems'),
 (8,'Triangles, Similarity & Pythagoras','middle-pythagorean-theorem'),
 (8,'Triangles, Similarity & Pythagoras','middle-similar-triangles'),
 (12,'Descriptive Statistics','secondary-arithmetic-mean'),
 (12,'Descriptive Statistics','secondary-population-variance'),
 (16,'Sequences & Convergence','university-sequence-limits'),
 (16,'Sequences & Convergence','university-monotone-convergence'),
 (16,'Sequences & Convergence','university-series-convergence')
)
UPDATE "CurriculumSkills" s SET "CategoryId"=newcat."Id"
FROM assignments a
JOIN "Categories" newcat ON newcat."NameEn"=a."NewName"
WHERE s."CategoryId"=a."SourceId" AND s."StableKey"=a."SkillKey"
  AND s."StageId"=newcat."StageId";

DO $postflight$
DECLARE totals int[];
BEGIN
 IF (SELECT COUNT(*) FROM "Categories")<>24 OR
    (SELECT COUNT(*) FROM "Problems")<>447 OR
    (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary")<>447 THEN
   RAISE EXCEPTION 'Totals changed unexpectedly during topic split';
 END IF;
 IF EXISTS(SELECT 1 FROM "Categories" c LEFT JOIN "Problems" p ON p."CategoryId"=c."Id"
   GROUP BY c."Id" HAVING COUNT(p."Id")=0) THEN
   RAISE EXCEPTION 'Split introduced an empty category';
 END IF;
 IF EXISTS(SELECT 1 FROM "Problems" p JOIN "CurriculumProblemSkills" ps
   ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
   JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId"
   WHERE p."CategoryId"<>s."CategoryId" OR p."StageId"<>s."StageId") THEN
   RAISE EXCEPTION 'Problem skill/category or stage mismatch after split';
 END IF;
 IF (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=1)<>8 OR
    (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=8)<>8 OR
    (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=12)<>17 OR
    (SELECT COUNT(*) FROM "Problems" WHERE "CategoryId"=16)<>10 THEN
   RAISE EXCEPTION 'Unexpected retained question counts';
 END IF;
 IF (SELECT COUNT(*) FROM "Problems" p JOIN "Categories" c ON c."Id"=p."CategoryId"
     WHERE c."NameEn"='Multiplication & Division')<>17 OR
    (SELECT COUNT(*) FROM "Problems" p JOIN "Categories" c ON c."Id"=p."CategoryId"
     WHERE c."NameEn"='Triangles, Similarity & Pythagoras')<>16 OR
    (SELECT COUNT(*) FROM "Problems" p JOIN "Categories" c ON c."Id"=p."CategoryId"
     WHERE c."NameEn"='Descriptive Statistics')<>7 OR
    (SELECT COUNT(*) FROM "Problems" p JOIN "Categories" c ON c."Id"=p."CategoryId"
     WHERE c."NameEn"='Sequences & Convergence')<>14 THEN
   RAISE EXCEPTION 'Unexpected moved question counts';
 END IF;
 IF EXISTS (WITH ranked AS (
   SELECT c."StageId",c."Id",row_number() over(partition by c."StageId" ORDER BY c."Order",c."Id") rn
   FROM "Categories" c)
   SELECT 1 FROM ranked WHERE rn<=2 AND "Id" NOT IN (1,2,5,6,9,10,13,14)) THEN
   RAISE EXCEPTION 'Splitting changed the original first-two Free categories';
 END IF;
END $postflight$;
COMMIT;
-- Single-run migration. Intentional preflight rejection on repeated execution.
