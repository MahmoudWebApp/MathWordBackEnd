-- Read-only coverage inventory. Counts assignments, not distinct bank-wide questions.
-- Retain every existing populated category and add curriculum-aligned categories until at least five per track.
WITH coverage AS (
 SELECT t."Id",t."Code",t."NameAr",t."StageId",c."Id" AS category_id,
 count(DISTINCT p."Id") AS questions,
 count(DISTINCT p."Id") FILTER (WHERE p."EditorialDetailsJson" IS NOT NULL
 AND jsonb_typeof(p."EditorialDetailsJson"::jsonb->'Solution')='object'
 AND jsonb_typeof(p."EditorialDetailsJson"::jsonb->'Hints')='array') AS structured
 FROM "LearningTracks" t
 LEFT JOIN "LearningTrackCategories" tc ON tc."TrackId"=t."Id"
 LEFT JOIN "Categories" c ON c."Id"=tc."CategoryId"
 LEFT JOIN "LearningTrackProblems" tp ON tp."TrackId"=t."Id"
 LEFT JOIN "Problems" p ON p."Id"=tp."ProblemId" AND p."CategoryId"=c."Id"
 WHERE t."IsPublished"
 GROUP BY t."Id",t."Code",t."NameAr",t."StageId",c."Id"
), summary AS (
 SELECT "Id","Code","NameAr","StageId",
 count(*) FILTER(WHERE questions>0) AS populated_categories,
 count(*) FILTER(WHERE category_id IS NOT NULL) AS linked_categories,
 sum(questions) AS mapped_questions,sum(structured) AS structured_questions,
 count(*) FILTER(WHERE questions>=101) AS categories_at_target,
 greatest(0,5-count(*) FILTER(WHERE questions>0)) AS missing_populated_categories,
 greatest(5,count(*) FILTER(WHERE category_id IS NOT NULL))*101-sum(questions) AS minimum_assignment_deficit
 FROM coverage GROUP BY "Id","Code","NameAr","StageId"
)
SELECT * FROM summary ORDER BY "StageId","Id";
