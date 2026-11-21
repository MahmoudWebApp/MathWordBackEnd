-- Development-only; run after validated depth wave has been staged privately.
-- Publish exactly 10 new questions in two existing topics and skills.
-- No category, stage, account, subscription, or progress edits.
BEGIN;
SELECT pg_advisory_xact_lock(20261122);

DO $preflight$
BEGIN
 IF (SELECT COUNT(*) FROM "Problems") <> 438 THEN
   RAISE EXCEPTION 'Unexpected existing problem inventory: refuse publication';
 END IF;
 IF (SELECT COUNT(*) FROM "Categories") <> 20 THEN
   RAISE EXCEPTION 'Unexpected category inventory: refuse publication';
 END IF;
 IF (SELECT COUNT(*) FROM "CurriculumDraftItems"
     WHERE "ContentKey" LIKE 'mw-depth-%' AND "EditorialStatus"='Draft') <> 10 THEN
   RAISE EXCEPTION 'Expected exactly ten draft-only depth questions';
 END IF;
 IF EXISTS (
  SELECT 1 FROM "CurriculumDraftItems" i
  JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
  WHERE i."ContentKey" LIKE 'mw-depth-%'
  AND (t."EditorialStatus"<>'Published'
    OR i."DifficultyLevel" NOT BETWEEN 1 AND 5
    OR NULLIF(btrim(i."QuestionTextAr"),'') IS NULL
    OR NULLIF(btrim(i."QuestionTextEn"),'') IS NULL
    OR NULLIF(btrim(i."DetailedSolutionAr"),'') IS NULL
    OR NULLIF(btrim(i."DetailedSolutionEn"),'') IS NULL
    OR jsonb_array_length(i."OptionsJson")<>4
    OR (SELECT COUNT(*) FROM jsonb_array_elements(i."OptionsJson") o
        WHERE (o->>'IsCorrect')::boolean)<>1
    OR (SELECT COUNT(DISTINCT o->>'LatexCode') FROM jsonb_array_elements(i."OptionsJson") o)<>4)
 ) THEN
   RAISE EXCEPTION 'Incomplete question data or invalid choices';
 END IF;
 IF EXISTS (
  SELECT 1 FROM "CurriculumDraftItems" i
  JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
  JOIN "Problems" p ON p."StageId"=t."StageId"
   AND (p."QuestionTextAr"=i."QuestionTextAr" OR p."QuestionTextEn"=i."QuestionTextEn")
  WHERE i."ContentKey" LIKE 'mw-depth-%'
 ) THEN
   RAISE EXCEPTION 'Question already published in this stage';
 END IF;
 IF EXISTS (
  SELECT 1 FROM "CurriculumDraftItems" i
  JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
  LEFT JOIN "Categories" c ON c."StageId"=t."StageId"
    AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
  LEFT JOIN "CurriculumSkills" s ON s."CategoryId"=c."Id"
    AND s."StableKey"=t."StableKey"||'-'||i."PrimarySkillKey"
  WHERE i."ContentKey" LIKE 'mw-depth-%'
    AND (c."Id" IS NULL OR s."Id" IS NULL OR NOT s."IsPublished")
 ) THEN
   RAISE EXCEPTION 'Published target topic or primary skill missing';
 END IF;
END $preflight$;

INSERT INTO "Problems"
("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn",
"DetailedSolutionAr","DetailedSolutionEn",
"StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt")
SELECT i."LearningObjectiveAr",i."LearningObjectiveEn",i."QuestionTextAr",i."QuestionTextEn",
i."DetailedSolutionAr",i."DetailedSolutionEn",t."StageId",c."Id",10,0,0,NOW()
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
JOIN "Categories" c ON c."StageId"=t."StageId"
  AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
WHERE i."ContentKey" LIKE 'mw-depth-%' AND i."EditorialStatus"='Draft';

INSERT INTO "QuestionOptions"("LatexCode","IsCorrect","Order","ProblemId")
SELECT o->>'LatexCode',(o->>'IsCorrect')::boolean,(o->>'Order')::integer,p."Id"
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
JOIN "Categories" c ON c."StageId"=t."StageId"
  AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
JOIN "Problems" p ON p."CategoryId"=c."Id"
  AND p."QuestionTextAr"=i."QuestionTextAr"
  AND p."QuestionTextEn"=i."QuestionTextEn"
CROSS JOIN LATERAL jsonb_array_elements(i."OptionsJson") o
WHERE i."ContentKey" LIKE 'mw-depth-%' AND i."EditorialStatus"='Draft';

INSERT INTO "CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary")
SELECT p."Id",s."Id",TRUE
FROM "CurriculumDraftItems" i
JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
JOIN "Categories" c ON c."StageId"=t."StageId"
  AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
JOIN "Problems" p ON p."CategoryId"=c."Id"
  AND p."QuestionTextAr"=i."QuestionTextAr"
  AND p."QuestionTextEn"=i."QuestionTextEn"
JOIN "CurriculumSkills" s ON s."CategoryId"=c."Id"
  AND s."StableKey"=t."StableKey"||'-'||i."PrimarySkillKey"
WHERE i."ContentKey" LIKE 'mw-depth-%' AND i."EditorialStatus"='Draft';

DO $verify$
DECLARE mapped_count INTEGER;
BEGIN
 IF (SELECT COUNT(*) FROM "Problems")<>448 OR
    (SELECT COUNT(*) FROM "Categories")<>20 OR
    (SELECT COUNT(*) FROM "QuestionOptions")<>1792 OR
    (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary")<>448 THEN
   RAISE EXCEPTION 'Post-publish database totals do not match';
 END IF;
 IF EXISTS (
  SELECT 1 FROM "CurriculumDraftItems" i
  JOIN "CurriculumTopicProposals" t ON t."Id"=i."TopicProposalId"
  JOIN "Categories" c ON c."StageId"=t."StageId"
    AND c."NameAr"=t."NameAr" AND c."NameEn"=t."NameEn"
  JOIN "Problems" p ON p."CategoryId"=c."Id"
    AND p."QuestionTextAr"=i."QuestionTextAr"
    AND p."QuestionTextEn"=i."QuestionTextEn"
  WHERE i."ContentKey" LIKE 'mw-depth-%'
    AND ((SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id")<>4
         OR (SELECT COUNT(*) FROM "QuestionOptions" o
             WHERE o."ProblemId"=p."Id" AND o."IsCorrect")<>1
         OR (SELECT COUNT(*) FROM "CurriculumProblemSkills" ps
             WHERE ps."ProblemId"=p."Id" AND ps."IsPrimary")<>1)
 ) THEN
   RAISE EXCEPTION 'New question choices or primary skill invalid';
 END IF;
 IF (SELECT COUNT(*) FROM "Problems" p
   JOIN "CurriculumProblemSkills" ps ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
   JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId"
   WHERE s."StableKey"='p-fractions-decimals-fraction-comparisons')<>6 THEN
    RAISE EXCEPTION 'Fraction comparison skill is not six distinct questions';
 END IF;
 IF (SELECT COUNT(*) FROM "Problems" p
   JOIN "CurriculumProblemSkills" ps ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
   JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId"
   WHERE s."StableKey"='s-sequences-series-series-convergence')<>6 THEN
    RAISE EXCEPTION 'Convergence skill is not six distinct questions';
 END IF;
END $verify$;

UPDATE "CurriculumDraftItems" SET "EditorialStatus"='Published'
WHERE "ContentKey" LIKE 'mw-depth-%' AND "EditorialStatus"='Draft';

COMMIT;
-- Deliberately one-shot. Re-run fails at preflight, never duplicates.
