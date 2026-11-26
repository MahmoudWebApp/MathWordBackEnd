-- Read-only inventory. Flags are review candidates, never mathematical approval.
-- Run with psql -X -v ON_ERROR_STOP=1 -f scripts/audit_legacy_math_content.sql
BEGIN TRANSACTION READ ONLY;
WITH opts AS (
 SELECT "ProblemId", count(*) AS n, count(*) FILTER (WHERE "IsCorrect") AS correct,
 count(DISTINCT btrim("LatexCode")) AS distinct_n,
 bool_or(btrim("LatexCode")='') AS blank
 FROM "QuestionOptions" GROUP BY 1
), flags AS (
 SELECT p."Id", p."StageId", p."CategoryId",
  (p."EditorialDetailsJson" IS NULL OR btrim(p."EditorialDetailsJson")='') AS legacy,
  (btrim(coalesce(p."DetailedSolutionAr",''))='' OR btrim(coalesce(p."DetailedSolutionEn",''))='') AS missing_solution,
  (coalesce(o.n,0)<>4 OR coalesce(o.correct,0)<>1 OR coalesce(o.distinct_n,0)<>4 OR coalesce(o.blank,false)) AS option_flag,
  (concat_ws(' ',p."TitleAr",p."QuestionTextAr",p."DetailedSolutionAr") ~ '(^|[^[:alnum:]])[سصع]([[:space:]]*[=+*/^<>−-]|[[:space:]]*[0-9٠-٩]|[^[:alnum:]]|$)'
   OR concat_ws(' ',p."TitleAr",p."QuestionTextAr",p."DetailedSolutionAr") ~ '[0-9٠-٩][سصع]([^[:alnum:]]|$)') AS possible_arabic_variable,
  ((length(coalesce(p."TitleAr",''))-length(replace(coalesce(p."TitleAr",''),'$',''))) % 2 <>0 OR
   (length(coalesce(p."TitleEn",''))-length(replace(coalesce(p."TitleEn",''),'$',''))) % 2 <>0) AS odd_title_delimiter,
  EXISTS (SELECT 1 FROM "CurriculumDraftItems" d WHERE d."SourceProblemId"=p."Id" AND d."EditorialStatus" NOT IN ('Published','Withdrawn')) AS open_review
 FROM "Problems" p LEFT JOIN opts o ON o."ProblemId"=p."Id"
)
SELECT "StageId",count(*) AS total,count(*) FILTER(WHERE legacy) AS legacy,
 count(*) FILTER(WHERE missing_solution) AS missing_solution,
 count(*) FILTER(WHERE option_flag) AS option_flags,
 count(*) FILTER(WHERE possible_arabic_variable) AS possible_arabic_variable,
 count(*) FILTER(WHERE odd_title_delimiter) AS odd_title_delimiter,
 count(*) FILTER(WHERE possible_arabic_variable AND open_review) AS flagged_with_open_review
FROM flags GROUP BY 1 ORDER BY 1;

-- Concrete priority queue; includes already structured problems that need correction.
SELECT p."Id",p."StageId",p."CategoryId",p."TitleAr",
 p."EditorialDetailsJson" IS NOT NULL AS has_editorial_metadata,
 (SELECT array_agg(d."Id" ORDER BY d."Id") FROM "CurriculumDraftItems" d
  WHERE d."SourceProblemId"=p."Id" AND d."EditorialStatus" NOT IN ('Published','Withdrawn')) AS open_draft_ids
FROM "Problems" p
WHERE concat_ws(' ',p."TitleAr",p."QuestionTextAr",p."DetailedSolutionAr") ~ '(^|[^[:alnum:]])[سصع]([[:space:]]*[=+*/^<>−-]|[[:space:]]*[0-9٠-٩]|[^[:alnum:]]|$)'
 OR concat_ws(' ',p."TitleAr",p."QuestionTextAr",p."DetailedSolutionAr") ~ '[0-9٠-٩][سصع]([^[:alnum:]]|$)'
ORDER BY p."StageId",p."CategoryId",p."Id";
COMMIT;
