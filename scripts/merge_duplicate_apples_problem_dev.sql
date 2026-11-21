-- MathWorld DEVELOPMENT ONLY: consolidate the exact duplicated apples problem.
-- Keep canonical problem ID 3, retire duplicate ID 4, preserve historical
-- attempts/progress and selected-option semantics; retain private audit backup.
-- Idempotence safety: intentionally refuses a second execution.
BEGIN;
SELECT pg_advisory_xact_lock(20261121);

DO $preflight$
BEGIN
 IF (SELECT COUNT(*) FROM "Problems" WHERE "Id" IN (3,4)) <> 2 THEN
   RAISE EXCEPTION 'Expected canonical problems 3 and 4';
 END IF;
 IF NOT EXISTS (
   SELECT 1 FROM "Problems" a JOIN "Problems" b
     ON a."Id"=3 AND b."Id"=4
     AND a."StageId"=b."StageId" AND a."CategoryId"=b."CategoryId"
     AND a."QuestionTextAr"=b."QuestionTextAr"
     AND a."QuestionTextEn"=b."QuestionTextEn"
     AND a."DetailedSolutionAr"=b."DetailedSolutionAr"
     AND a."DetailedSolutionEn"=b."DetailedSolutionEn"
 ) THEN
    RAISE EXCEPTION 'Two problems no longer have exactly the same questions and solutions';
 END IF;
 IF EXISTS (SELECT 1 FROM "QuestionOptions" o4 WHERE o4."ProblemId"=4 AND
   NOT EXISTS(SELECT 1 FROM "QuestionOptions" o3 WHERE o3."ProblemId"=3
     AND o3."LatexCode"=o4."LatexCode"
     AND o3."IsCorrect"=o4."IsCorrect" AND o3."Order"=o4."Order")) THEN
   RAISE EXCEPTION 'Option mapping differs, refusing to corrupt attempt history';
 END IF;
 IF (SELECT COUNT(*) FROM "QuestionOptions" WHERE "ProblemId"=3)<>4 OR
    (SELECT COUNT(*) FROM "QuestionOptions" WHERE "ProblemId"=4)<>4 THEN
   RAISE EXCEPTION 'Each duplicate problem must have four equivalent answer options';
 END IF;
 IF EXISTS (SELECT 1 FROM "UserProgresses" p4 JOIN "UserProgresses" p3
    ON p3."UserId"=p4."UserId" AND p3."ProblemId"=3 WHERE p4."ProblemId"=4) THEN
   RAISE EXCEPTION 'Conflicting learner progress: manual merge required';
 END IF;
 IF EXISTS (SELECT 1 FROM "ProblemAttempts" a4 JOIN "ProblemAttempts" a3
    ON a3."UserId"=a4."UserId" AND a3."AttemptNumber"=a4."AttemptNumber"
       AND a3."ProblemId"=3 WHERE a4."ProblemId"=4) THEN
   RAISE EXCEPTION 'Conflicting attempt numbering: manual merge required';
 END IF;
 IF EXISTS (SELECT 1 FROM "ProblemAttempts" a WHERE a."ProblemId"=4
    AND a."SelectedOptionId" IS NOT NULL AND NOT EXISTS (
     SELECT 1 FROM "QuestionOptions" q4 JOIN "QuestionOptions" q3
      ON q3."ProblemId"=3 AND q3."LatexCode"=q4."LatexCode"
        AND q3."IsCorrect"=q4."IsCorrect" AND q3."Order"=q4."Order"
     WHERE q4."Id"=a."SelectedOptionId" AND q4."ProblemId"=4)) THEN
   RAISE EXCEPTION 'Historical selected option cannot be mapped safely';
 END IF;
 IF EXISTS(SELECT 1 FROM "ProblemDiagrams" WHERE "ProblemId"=4) THEN
   RAISE EXCEPTION 'Problem 4 has diagrams requiring a separate review';
 END IF;
 IF (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "ProblemId"=4 AND "SkillId"=2 AND "IsPrimary")<>1
    OR (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "ProblemId"=3 AND "SkillId"=2 AND "IsPrimary")<>1 THEN
   RAISE EXCEPTION 'Skill references changed; recheck duplicate merge';
 END IF;
END $preflight$;

-- A private schema stays out of the public Supabase Data API.
CREATE SCHEMA IF NOT EXISTS curriculum_maintenance;
REVOKE ALL ON SCHEMA curriculum_maintenance FROM PUBLIC;
CREATE TABLE IF NOT EXISTS curriculum_maintenance.problem_dedupe_audit(
 "Key" text PRIMARY KEY, "SavedAt" timestamptz NOT NULL DEFAULT now(),
 "Snapshot" jsonb NOT NULL
);
ALTER TABLE curriculum_maintenance.problem_dedupe_audit ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON curriculum_maintenance.problem_dedupe_audit FROM PUBLIC;

INSERT INTO curriculum_maintenance.problem_dedupe_audit("Key","Snapshot")
SELECT 'apples-3-4-20261121',jsonb_build_object(
  'problems', (SELECT COALESCE(jsonb_agg(to_jsonb(p)),'[]'::jsonb) FROM "Problems" p WHERE p."Id" IN (3,4)),
  'options', (SELECT COALESCE(jsonb_agg(to_jsonb(o)),'[]'::jsonb) FROM "QuestionOptions" o WHERE o."ProblemId" IN (3,4)),
  'attempts', (SELECT COALESCE(jsonb_agg(to_jsonb(a)),'[]'::jsonb) FROM "ProblemAttempts" a WHERE a."ProblemId" IN (3,4)),
  'progress', (SELECT COALESCE(jsonb_agg(to_jsonb(g)),'[]'::jsonb) FROM "UserProgresses" g WHERE g."ProblemId" IN (3,4)),
  'skills', (SELECT COALESCE(jsonb_agg(to_jsonb(m)),'[]'::jsonb) FROM "CurriculumProblemSkills" m WHERE m."ProblemId" IN (3,4))
);

UPDATE "ProblemAttempts" a
SET "ProblemId"=3, "SelectedOptionId"=(
  SELECT q3."Id" FROM "QuestionOptions" q4
  JOIN "QuestionOptions" q3 ON q3."ProblemId"=3
   AND q3."LatexCode"=q4."LatexCode" AND q3."IsCorrect"=q4."IsCorrect"
   AND q3."Order"=q4."Order"
  WHERE q4."ProblemId"=4 AND q4."Id"=a."SelectedOptionId"
)
WHERE a."ProblemId"=4;

UPDATE "UserProgresses" SET "ProblemId"=3 WHERE "ProblemId"=4;

UPDATE "Problems" p3
SET "ViewsCount"=p3."ViewsCount"+p4."ViewsCount",
    "SolvedCount"=p3."SolvedCount"+p4."SolvedCount"
FROM "Problems" p4
WHERE p3."Id"=3 AND p4."Id"=4;

DELETE FROM "Problems" WHERE "Id"=4;

DO $postflight$
BEGIN
 IF (SELECT COUNT(*) FROM "Problems")<>447 OR
    (SELECT COUNT(*) FROM "QuestionOptions")<>1788 OR
    (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary")<>447 THEN
   RAISE EXCEPTION 'Unexpected totals after deduplication';
 END IF;
 IF (SELECT COUNT(*) FROM "ProblemAttempts" WHERE "ProblemId"=3)<>3 OR
    (SELECT COUNT(*) FROM "UserProgresses" WHERE "ProblemId"=3)<>3 THEN
   RAISE EXCEPTION 'Lost learner attempts or progress in merge';
 END IF;
 IF EXISTS (SELECT 1 FROM "ProblemAttempts" WHERE "ProblemId"=3
    AND "SelectedOptionId" NOT IN (SELECT "Id" FROM "QuestionOptions" WHERE "ProblemId"=3)) THEN
   RAISE EXCEPTION 'Attempt references a stale answer option';
 END IF;
 IF (SELECT COUNT(*) FROM "Problems" WHERE "Id"=4)<>0 THEN
   RAISE EXCEPTION 'Duplicate record still exists';
 END IF;
END $postflight$;
COMMIT;
