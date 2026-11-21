-- MathWorld DEV ONLY: publish exactly four reviewed pilot topics + 31 questions.
-- Prerequisites: current MathWorld frontend icon assets and Backend curriculum v2 migrations.
-- Nothing in this script changes user accounts, Premium grants or Free category selections.
-- Revision-safe: all changes and assertions share a single transaction.
-- Independent human editorial certification is NOT claimed; this is a reviewed development pilot.

BEGIN;
SELECT pg_advisory_xact_lock(20261121);

DO $mw_preflight$
BEGIN
 IF (SELECT COUNT(*) FROM "CurriculumTopicProposals" WHERE "StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')) <> 4 THEN
   RAISE EXCEPTION 'Missing one or more verified pilot topics';
 END IF;
 IF (SELECT COUNT(*) FROM "CurriculumDraftItems" i JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
     WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')) <> 31 THEN
   RAISE EXCEPTION 'Pilot questions must total exactly 31';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumTopicProposals" t WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
    AND (t."EditorialStatus" <> 'Draft' OR t."ProposedQuestionCount" <>
      (SELECT COUNT(*) FROM "CurriculumDraftItems" i WHERE i."TopicProposalId"=t."Id"))) THEN
   RAISE EXCEPTION 'Topic counts or editorial draft state have changed';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumDraftItems" i JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
     WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math') AND (i."EditorialStatus" <> 'Draft'
       OR NULLIF(btrim(i."QuestionTextAr"),'') IS NULL OR NULLIF(btrim(i."QuestionTextEn"),'') IS NULL
       OR NULLIF(btrim(i."DetailedSolutionAr"),'') IS NULL OR NULLIF(btrim(i."DetailedSolutionEn"),'') IS NULL
       OR jsonb_array_length(i."OptionsJson") <> 4
       OR (SELECT COUNT(*) FROM jsonb_array_elements(i."OptionsJson") o
           WHERE (o->>'IsCorrect')::boolean) <> 1
       OR (SELECT COUNT(DISTINCT o->>'LatexCode') FROM jsonb_array_elements(i."OptionsJson") o) <> 4)) THEN
   RAISE EXCEPTION 'Incomplete/unreviewed pilot question or invalid options';
 END IF;
 IF EXISTS (SELECT 1 FROM "Categories" c JOIN "CurriculumTopicProposals" t
    ON t."StageId"=c."StageId" AND (c."NameAr"=t."NameAr" OR c."NameEn"=t."NameEn")
    WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')) THEN
   RAISE EXCEPTION 'Pilot category already exists in student catalogue';
 END IF;
 IF EXISTS (SELECT 1 FROM "Problems" p JOIN "CurriculumDraftItems" i
     ON p."QuestionTextAr"=i."QuestionTextAr" OR p."QuestionTextEn"=i."QuestionTextEn"
     JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId" AND t."StageId"=p."StageId"
     WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')) THEN
   RAISE EXCEPTION 'A pilot question already exists in this stage';
 END IF;
END $mw_preflight$;

INSERT INTO "Categories"
  ("NameAr","NameEn","Icon","Order","DescriptionAr","DescriptionEn","StageId")
SELECT t."NameAr",t."NameEn",
  CASE t."StableKey"
    WHEN 'p-fractions-decimals' THEN 'https://math-world-frontend.vercel.app/category-icons/fractions.svg'
    WHEN 'm-statistics' THEN 'https://math-world-frontend.vercel.app/category-icons/statistics.svg'
    WHEN 's-sequences-series' THEN 'https://math-world-frontend.vercel.app/category-icons/sequences.svg'
    WHEN 'u-discrete-math' THEN 'https://math-world-frontend.vercel.app/category-icons/discrete.svg'
  END,
  (SELECT COALESCE(MAX(old."Order"),0)+1 FROM "Categories" old WHERE old."StageId"=t."StageId"),
  t."DescriptionAr",t."DescriptionEn",t."StageId"
FROM "CurriculumTopicProposals" t
WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math');

WITH skill_defs("TopicKey","SkillKey","NameAr","NameEn","SortOrder") AS (VALUES
('p-fractions-decimals','fraction-models','تمثيل الكسور','Fraction Models',10),
('p-fractions-decimals','equivalence','الكسور المتكافئة','Equivalent Fractions',20),
('p-fractions-decimals','fraction-operations','العمليات على الكسور','Fraction Operations',30),
('p-fractions-decimals','decimal-place-value','القيمة المكانية والكسور العشرية','Decimal Place Value',40),
('p-fractions-decimals','basic-percentages','المئويات المبسطة','Basic Percentages',50),
('m-statistics','charts','تمثيل البيانات وقراءتها','Charts and Data Displays',10),
('m-statistics','summary-measures','مقاييس النزعة المركزية','Summary Statistics',20),
('m-statistics','distributions','التشتت وتوزيع البيانات','Data Spread and Distributions',30),
('s-sequences-series','arithmetic-sequences','المتتاليات الحسابية','Arithmetic Sequences',10),
('s-sequences-series','geometric-sequences','المتتاليات الهندسية','Geometric Sequences',20),
('s-sequences-series','recurrence-relations','العلاقات الرجوعية','Recurrence Relations',30),
('s-sequences-series','series-sums','مجموع المتسلسلات','Series Sums',40),
('u-discrete-math','logic','المنطق الرياضي','Mathematical Logic',10),
('u-discrete-math','proofs','مبادئ البرهان','Proof Principles',20),
('u-discrete-math','relations','العلاقات والتكافؤ','Relations and Equivalence',30),
('u-discrete-math','combinatorics','العد والتوافيق','Combinatorics',40),
('u-discrete-math','graphs','نظرية الرسوم البيانية','Graph Theory',50)
)
INSERT INTO "CurriculumSkills"
  ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished")
SELECT t."StableKey" || '-' || s."SkillKey",t."DomainId",t."StageId",c."Id",
  s."NameAr",s."NameEn",s."NameAr",s."NameEn",s."SortOrder",FALSE
FROM skill_defs s
JOIN "CurriculumTopicProposals" t ON t."StableKey"=s."TopicKey"
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
ON CONFLICT ("StableKey") DO NOTHING;

INSERT INTO "Problems"
  ("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn",
   "StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt")
SELECT i."LearningObjectiveAr",i."LearningObjectiveEn",i."QuestionTextAr",i."QuestionTextEn",
  i."DetailedSolutionAr",i."DetailedSolutionEn",t."StageId",c."Id",10,0,0,NOW()
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId" AND t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn";

INSERT INTO "QuestionOptions" ("LatexCode","IsCorrect","Order","ProblemId")
SELECT o->>'LatexCode',(o->>'IsCorrect')::boolean,(o->>'Order')::integer,p."Id"
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId" AND t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
JOIN "Problems" p ON p."CategoryId"=c."Id" AND p."QuestionTextAr"=i."QuestionTextAr" AND p."QuestionTextEn"=i."QuestionTextEn"
CROSS JOIN LATERAL jsonb_array_elements(i."OptionsJson") o;

INSERT INTO "CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary")
SELECT p."Id",s."Id",TRUE
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId" AND t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
JOIN "Problems" p ON p."CategoryId"=c."Id" AND p."QuestionTextAr"=i."QuestionTextAr" AND p."QuestionTextEn"=i."QuestionTextEn"
JOIN "CurriculumSkills" s ON s."CategoryId"=c."Id" AND s."StableKey"=t."StableKey" || '-' || i."PrimarySkillKey";

DO $mw_verify$
BEGIN
 IF (SELECT COUNT(*) FROM "Categories" c JOIN "CurriculumTopicProposals" t
       ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
       WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')) <> 4 THEN
   RAISE EXCEPTION 'Published category count differs from expected four';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumTopicProposals" t JOIN "Categories" c
       ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
       LEFT JOIN "Problems" p ON p."CategoryId"=c."Id"
       WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
       GROUP BY t."Id" HAVING COUNT(p."Id") <> MAX(t."ProposedQuestionCount")) THEN
   RAISE EXCEPTION 'An editorial pilot category is empty or has wrong problem count';
 END IF;
 IF (SELECT COUNT(*) FROM "CurriculumProblemSkills" ps JOIN "Problems" p ON p."Id"=ps."ProblemId"
       JOIN "Categories" c ON c."Id"=p."CategoryId"
       JOIN "CurriculumTopicProposals" t ON c."StageId"=t."StageId" AND c."NameEn"=t."NameEn"
       WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math') AND ps."IsPrimary") <> 31 THEN
   RAISE EXCEPTION 'Each pilot problem must have exactly one primary skill';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumTopicProposals" t
       JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameEn"=t."NameEn"
       JOIN "Problems" p ON p."CategoryId"=c."Id"
       WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math') AND 
       ((SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id") <> 4
       OR (SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id" AND o."IsCorrect") <> 1
       OR (SELECT COUNT(DISTINCT o."LatexCode") FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id") <> 4)) THEN
   RAISE EXCEPTION 'Invalid answer choices for published pilot problem';
 END IF;
END $mw_verify$;

UPDATE "CurriculumDraftItems" i SET "EditorialStatus"='Published'
FROM "CurriculumTopicProposals" t
WHERE i."TopicProposalId"=t."Id" AND t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math');
UPDATE "CurriculumTopicProposals" SET "EditorialStatus"='Published'
WHERE "StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math');

COMMIT;

-- One-shot publication: intentionally fails at preflight on re-run.
-- Post-publication verification query:
-- SELECT c."StageId", c."NameAr", count(p."Id") FROM "Categories" c
-- JOIN "Problems" p ON p."CategoryId"=c."Id"
-- GROUP BY c."Id" ORDER BY c."StageId",c."Order";
