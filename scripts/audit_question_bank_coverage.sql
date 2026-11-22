-- MathWorld: reproducible READ-ONLY curriculum question-bank health report.
-- Run on any environment before and after adding a content wave.
-- Content density thresholds below are editorial signals, not official standards.
-- Inherited legacy CurriculumSkills.IsPublished=false does not mean that
-- linked Problems are invisible: do not equate the two statuses.
SELECT c."StageId" AS stage_id,
       COUNT(DISTINCT c."Id") AS categories,
       COUNT(DISTINCT p."Id") AS questions
FROM "Categories" c LEFT JOIN "Problems" p ON p."CategoryId"=c."Id"
GROUP BY c."StageId" ORDER BY c."StageId";

SELECT s."StageId", c."NameAr" category_ar,c."NameEn" category_en,
       s."StableKey" skill_key, s."NameEn" skill_en,
       COUNT(ps."ProblemId") AS questions,
       CASE WHEN COUNT(ps."ProblemId") < 3 THEN 'critical'
            WHEN COUNT(ps."ProblemId") < 8 THEN 'thin'
            ELSE 'developing' END AS evidence_band
FROM "CurriculumSkills" s
JOIN "Categories" c ON c."Id"=s."CategoryId"
LEFT JOIN "CurriculumProblemSkills" ps ON ps."SkillId"=s."Id"
 AND ps."IsPrimary"
GROUP BY s."Id",c."Id",c."NameAr",c."NameEn"
ORDER BY questions,s."StageId",s."StableKey";

SELECT
 (SELECT COUNT(*) FROM "Problems") total_questions,
 (SELECT COUNT(*) FROM "Categories") total_categories,
 (SELECT COUNT(*) FROM "CurriculumSkills") total_skills,
 (SELECT COUNT(*) FROM "Problems" p LEFT JOIN "CurriculumProblemSkills" ps
   ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
   WHERE ps."ProblemId" IS NULL) missing_primary_skill,
 (SELECT COUNT(*) FROM "Problems" p JOIN "CurriculumProblemSkills" ps
   ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
   JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId"
   WHERE p."StageId"<>s."StageId" OR p."CategoryId"<>s."CategoryId") wrong_skill_category,
 (SELECT COUNT(*) FROM (
   SELECT p."Id" FROM "Problems" p
   LEFT JOIN "QuestionOptions" o ON o."ProblemId"=p."Id"
   GROUP BY p."Id" HAVING COUNT(o."Id")<>4 OR
     COUNT(*) FILTER(WHERE o."IsCorrect")<>1) invalid) invalid_answer_sets,
 (SELECT COUNT(*) FROM "Problems" WHERE
   NULLIF(btrim("TitleAr"),'') IS NULL OR NULLIF(btrim("TitleEn"),'') IS NULL OR
   NULLIF(btrim("QuestionTextAr"),'') IS NULL OR NULLIF(btrim("QuestionTextEn"),'') IS NULL OR
   NULLIF(btrim("DetailedSolutionAr"),'') IS NULL OR NULLIF(btrim("DetailedSolutionEn"),'') IS NULL) missing_bilingual_parts,
 (SELECT COUNT(*) FROM (
   SELECT "StageId",
     regexp_replace(lower(btrim("QuestionTextAr")),'[[:space:]]+',' ','g') normalized
   FROM "Problems" GROUP BY 1,2 HAVING COUNT(*)>1) duplicated_ar) duplicate_ar_groups,
 (SELECT COUNT(*) FROM (
   SELECT "StageId",
     regexp_replace(lower(btrim("QuestionTextEn")),'[[:space:]]+',' ','g') normalized
   FROM "Problems" GROUP BY 1,2 HAVING COUNT(*)>1) duplicated_en) duplicate_en_groups,
 (SELECT COUNT(*) FROM (
   SELECT c."Id" FROM "Categories" c
   LEFT JOIN "Problems" p ON p."CategoryId"=c."Id"
   GROUP BY c."Id" HAVING COUNT(p."Id")=0) empty) empty_categories;

-- A distinct-numbers-only near-duplicate flag for EDITORIAL INSPECTION.
-- This can have false positives; do NOT delete or merge automatically.
SELECT p."StageId",
 regexp_replace(
   regexp_replace(lower(btrim(p."QuestionTextAr")),'[[:digit:]٠-٩]+','#','g'),
   '[[:space:]]+',' ','g') as candidate_family,
 COUNT(*) similar_question_count,
 array_agg(p."Id" ORDER BY p."Id") question_ids
FROM "Problems" p
GROUP BY 1,2
HAVING COUNT(*)>1
ORDER BY similar_question_count DESC,p."StageId"
LIMIT 35;


-- Per-stage pedagogical breadth after every wave (read-only heuristic).
-- Only numeric digits are masked; structurally similar prompts may represent
-- different conceptual exercises and should not be automatically removed.
WITH numeric_families AS (
  SELECT p."StageId",
         regexp_replace(
           regexp_replace(lower(btrim(p."QuestionTextAr")),
             '[[:digit:]٠-٩]+','#','g'),
           '[[:space:]]+',' ','g') AS family,
         COUNT(*) AS question_count
  FROM "Problems" p GROUP BY p."StageId",family
)
SELECT "StageId", SUM(question_count) AS problems,
       COUNT(*) AS approximate_structural_families,
       COUNT(*) FILTER (WHERE question_count>1) AS repeated_family_groups,
       SUM(question_count-1) AS additional_numeric_variants
FROM numeric_families GROUP BY ROLLUP("StageId")
ORDER BY "StageId" NULLS LAST;

-- Next content wave priorities; thresholds are editorial guidance, never
-- an official curriculum requirement or proof of mastery.
WITH skill_coverage AS (
 SELECT s."StageId",s."StableKey",s."NameAr",
        COUNT(ps."ProblemId") AS question_count
 FROM "CurriculumSkills" s
 LEFT JOIN "CurriculumProblemSkills" ps ON ps."SkillId"=s."Id"
   AND ps."IsPrimary"
 GROUP BY s."Id"
)
SELECT "StageId","StableKey","NameAr",question_count
FROM skill_coverage
WHERE question_count<5
ORDER BY "StageId",question_count,"StableKey";

-- Ensure answer choices within each question are individually distinct too.
SELECT COUNT(*) AS questions_with_repeated_options
FROM (
 SELECT p."Id" FROM "Problems" p
 LEFT JOIN "QuestionOptions" o ON o."ProblemId"=p."Id"
 GROUP BY p."Id"
 HAVING COUNT(DISTINCT o."LatexCode")<>4
) invalid;
