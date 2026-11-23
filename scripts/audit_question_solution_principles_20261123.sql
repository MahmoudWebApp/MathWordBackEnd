-- Read-only reproducible audit of every MathWorld published solution.
-- A short explanation or a missing keyword is a REVIEW SIGNAL, not a proof
-- of mathematical inaccuracy. Do not bulk-prepend laws, delete numeric variants
-- or modify attempts/favorites/Free category access based on this report.

SELECT p."StageId",p."CategoryId",c."NameAr" AS category_ar,c."NameEn" AS category_en,
       COUNT(*) AS total_questions,
       COUNT(*) FILTER(WHERE length(btrim(coalesce(p."DetailedSolutionAr",'')))<55) AS short_ar,
       COUNT(*) FILTER(WHERE length(btrim(coalesce(p."DetailedSolutionEn",'')))<55) AS short_en,
       COUNT(*) FILTER(WHERE p."DetailedSolutionAr" !~ 'القانون المستخدم|قاعدة التحويل|القانون|محيط|مساحة|القاعدة|نستخدم|نطبق|بما أن') AS weak_law_signal_ar,
       COUNT(*) FILTER(WHERE p."DetailedSolutionEn" !~* 'rule used|conversion rule|formula|perimeter|area|theorem|identity|law|because|using') AS weak_law_signal_en
FROM "Problems" p
JOIN "Categories" c ON c."Id"=p."CategoryId" AND c."StageId"=p."StageId"
GROUP BY p."StageId",p."CategoryId",c."NameAr",c."NameEn"
ORDER BY short_ar DESC,p."StageId",p."CategoryId";

-- All actual teaching skills belong to a normalized category relation.
-- Skills marked draft MUST NOT be disclosed by the public API until reviewed.
SELECT c."StageId",c."Id" AS category_id,c."NameAr",
       COUNT(DISTINCT s."Id") AS total_skills,
       COUNT(DISTINCT s."Id") FILTER(WHERE s."IsPublished") AS public_skills,
       COUNT(DISTINCT s."Id") FILTER(WHERE NOT s."IsPublished") AS skills_needing_editorial_review,
       COUNT(DISTINCT s."Id") FILTER(WHERE btrim(s."DescriptionAr")=btrim(s."NameAr")
                                 OR btrim(s."DescriptionEn")=btrim(s."NameEn")) AS shallow_objective_descriptions
FROM "Categories" c
LEFT JOIN "CurriculumSkills" s ON s."CategoryId"=c."Id" AND s."StageId"=c."StageId"
GROUP BY c."StageId",c."Id",c."NameAr"
ORDER BY c."StageId",c."Id";

-- Highest-priority individual candidates, without editing the live solutions.
SELECT p."Id",p."StageId",p."CategoryId",
       p."TitleAr",p."QuestionTextAr",p."QuestionTextEn",
       p."DetailedSolutionAr",p."DetailedSolutionEn",
       length(btrim(coalesce(p."DetailedSolutionAr",''))) AS explanation_ar_chars,
       length(btrim(coalesce(p."DetailedSolutionEn",''))) AS explanation_en_chars
FROM "Problems" p
WHERE length(btrim(coalesce(p."DetailedSolutionAr",''))) < 55
   OR length(btrim(coalesce(p."DetailedSolutionEn",''))) < 55
ORDER BY p."StageId",p."CategoryId",p."Id";

-- Free/Premium, student answers and existing category IDs remain untouched.
