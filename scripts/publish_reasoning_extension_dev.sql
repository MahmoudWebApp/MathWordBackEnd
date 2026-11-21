-- Development-only controlled publication of independently checked reasoning questions.
-- Preconditions: 21 staged questions (from content/batches/mathworld-reasoning-extension-20261121.json),
-- four previously published categories, valid options, and MathWorld curriculum v2 schema.
-- Does not change accounts, existing problems, orders of categories, Free selections or Premium grants.
-- Publishes category skill names for discovery, NEVER asserts that learner mastery is proven.

BEGIN;
SELECT pg_advisory_xact_lock(20261121);

DO $mw_before$
BEGIN
 IF (SELECT COUNT(*) FROM "CurriculumDraftItems"
    WHERE "ContentKey" LIKE 'mw-reasoning-%' AND "EditorialStatus"='Draft') <> 21 THEN
  RAISE EXCEPTION 'Expected exactly 21 draft reasoning questions';
 END IF;
 IF (SELECT COUNT(*) FROM "CurriculumDraftItems"
    WHERE "ContentKey" LIKE 'mw-reasoning-%') <> 21 THEN
  RAISE EXCEPTION 'Unexpected reasoning question key collision';
 END IF;
 IF EXISTS (
   SELECT 1 FROM "CurriculumDraftItems" i
   JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
   WHERE i."ContentKey" LIKE 'mw-reasoning-%'
   AND (t."EditorialStatus"<>'Published'
      OR NULLIF(btrim(i."QuestionTextAr"),'') IS NULL
      OR NULLIF(btrim(i."QuestionTextEn"),'') IS NULL
      OR NULLIF(btrim(i."DetailedSolutionAr"),'') IS NULL
      OR NULLIF(btrim(i."DetailedSolutionEn"),'') IS NULL
      OR jsonb_array_length(i."OptionsJson")<>4
      OR (SELECT COUNT(*) FROM jsonb_array_elements(i."OptionsJson") o
          WHERE (o->>'IsCorrect')::boolean)<>1
      OR (SELECT COUNT(DISTINCT o->>'LatexCode') FROM jsonb_array_elements(i."OptionsJson") o)<>4)
 ) THEN
  RAISE EXCEPTION 'Reasoning batch content failed publication checks';
 END IF;
 IF EXISTS (
  SELECT 1 FROM "CurriculumDraftItems" i
  JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
  JOIN "Problems" p ON p."StageId"=t."StageId"
    AND (p."QuestionTextAr"=i."QuestionTextAr" OR p."QuestionTextEn"=i."QuestionTextEn")
  WHERE i."ContentKey" LIKE 'mw-reasoning-%'
 ) THEN
  RAISE EXCEPTION 'A reasoning question already exists';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumTopicProposals" t
  WHERE t."StableKey" IN ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
  AND NOT EXISTS(SELECT 1 FROM "Categories" c WHERE c."StageId"=t."StageId"
    AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn")) THEN
  RAISE EXCEPTION 'Published categories are missing';
 END IF;
END $mw_before$;

-- Two genuinely different objectives were isolated from broader historical labels.
WITH definitions ("TopicKey","SkillSuffix","NameAr","NameEn","SortOrder") AS
(VALUES
 ('p-fractions-decimals','fraction-comparisons','مقارنة الكسور','Fraction Comparisons',25),
 ('s-sequences-series','series-convergence','تقارب المتسلسلات وتباعدها','Series Convergence and Divergence',50)
)
INSERT INTO "CurriculumSkills"
("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished")
SELECT t."StableKey"||'-'||d."SkillSuffix",t."DomainId",t."StageId",c."Id",
d."NameAr",d."NameEn",d."NameAr",d."NameEn",d."SortOrder",FALSE
FROM definitions d JOIN "CurriculumTopicProposals" t ON t."StableKey"=d."TopicKey"
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
ON CONFLICT ("StableKey") DO NOTHING;

INSERT INTO "Problems"
("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn",
"StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt")
SELECT i."LearningObjectiveAr",i."LearningObjectiveEn",i."QuestionTextAr",i."QuestionTextEn",
i."DetailedSolutionAr",i."DetailedSolutionEn",t."StageId",c."Id",10,0,0,NOW()
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
WHERE i."ContentKey" LIKE 'mw-reasoning-%' AND i."EditorialStatus"='Draft';

INSERT INTO "QuestionOptions"("LatexCode","IsCorrect","Order","ProblemId")
SELECT o->>'LatexCode',(o->>'IsCorrect')::boolean,(o->>'Order')::integer,p."Id"
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
JOIN "Problems" p ON p."CategoryId"=c."Id" AND p."QuestionTextAr"=i."QuestionTextAr" AND p."QuestionTextEn"=i."QuestionTextEn"
CROSS JOIN LATERAL jsonb_array_elements(i."OptionsJson") o
WHERE i."ContentKey" LIKE 'mw-reasoning-%' AND i."EditorialStatus"='Draft';

INSERT INTO "CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary")
SELECT p."Id",s."Id",TRUE
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
JOIN "Problems" p ON p."CategoryId"=c."Id" AND p."QuestionTextAr"=i."QuestionTextAr" AND p."QuestionTextEn"=i."QuestionTextEn"
JOIN "CurriculumSkills" s ON s."CategoryId"=c."Id" AND s."StableKey"=t."StableKey"||'-'||i."PrimarySkillKey"
WHERE i."ContentKey" LIKE 'mw-reasoning-%' AND i."EditorialStatus"='Draft';

DO $mw_after$
BEGIN
 IF (SELECT COUNT(*) FROM "Problems") <> 438 THEN
  RAISE EXCEPTION 'Unexpected total of live development problems after extension';
 END IF;
 IF (SELECT COUNT(*) FROM "Categories") <> 20 THEN
  RAISE EXCEPTION 'Curriculum extension must not change category count';
 END IF;
 IF (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary") <> 438 THEN
  RAISE EXCEPTION 'Not all new problems have primary skill links';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumDraftItems" i
  JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
  JOIN "Categories" c ON c."StageId"=t."StageId" AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
  JOIN "Problems" p ON p."CategoryId"=c."Id" AND p."QuestionTextAr"=i."QuestionTextAr" AND p."QuestionTextEn"=i."QuestionTextEn"
  WHERE i."ContentKey" LIKE 'mw-reasoning-%' AND (
    (SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id")<>4
    OR (SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id" AND o."IsCorrect")<>1
    OR (SELECT COUNT(DISTINCT o."LatexCode") FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id")<>4
    OR NOT EXISTS(SELECT 1 FROM "CurriculumProblemSkills" ps WHERE ps."ProblemId"=p."Id" AND ps."IsPrimary"))) THEN
  RAISE EXCEPTION 'Published reasoning question failed options or skill QA';
 END IF;
 IF (SELECT COUNT(*) FROM "Categories" c JOIN "CurriculumSkills" s ON s."CategoryId"=c."Id"
  WHERE c."Id" IN (21,22,23,24)) <> 19 THEN
  RAISE EXCEPTION 'Two new skills missing from pilot categories';
 END IF;
END $mw_after$;

-- Publishing an objective means it is browseable, not that mastery has been measured.
UPDATE "CurriculumDomains"
SET "IsPublished"=TRUE
WHERE "Id" IN (
  SELECT DISTINCT s."DomainId" FROM "CurriculumSkills" s
  WHERE s."CategoryId" IN (21,22,23,24));
UPDATE "CurriculumSkills" SET "IsPublished"=TRUE
WHERE "CategoryId" IN (21,22,23,24);

UPDATE "CurriculumDraftItems" SET "EditorialStatus"='Published'
WHERE "ContentKey" LIKE 'mw-reasoning-%';

COMMIT;

-- A second execution is intentionally rejected by the preflight, not duplicated.
