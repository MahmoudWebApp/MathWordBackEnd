-- Preview only. No DDL, data changes, or personal details.
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ READ ONLY;
SET LOCAL statement_timeout = '20s';
WITH proposal(level_code,category_id) AS (VALUES
 ('university-level-1',16),('university-level-1',36),('university-level-1',14),('university-level-1',24),
 ('university-level-2',13),('university-level-2',15),('university-level-2',89),('university-level-2',90),('university-level-2',91)
), source_tracks AS (
 SELECT * FROM "LearningTracks" WHERE "StageId"=4 AND "Kind"='course'
), source_links AS (
 SELECT DISTINCT t."Id" track_id,p."Id" problem_id,p."CategoryId" category_id,ps."SkillId" skill_id
 FROM source_tracks t JOIN "LearningTrackProblems" l ON l."TrackId"=t."Id"
 JOIN "Problems" p ON p."Id"=l."ProblemId" AND p."StageId"=t."StageId"
 JOIN "Categories" c ON c."Id"=p."CategoryId" AND c."StageId"=t."StageId"
 JOIN "CurriculumProblemSkills" ps ON ps."ProblemId"=p."Id" AND ps."IsPrimary"
 JOIN "CurriculumSkills" s ON s."Id"=ps."SkillId" AND s."IsPublished" AND s."StageId"=t."StageId" AND s."CategoryId"=p."CategoryId"
 JOIN "CurriculumDomains" d ON d."Id"=s."DomainId" AND d."IsPublished"
 JOIN "LearningTrackCategories" lc ON lc."TrackId"=t."Id" AND lc."CategoryId"=p."CategoryId"
 JOIN "LearningTrackSkills" ls ON ls."TrackId"=t."Id" AND ls."SkillId"=s."Id"
), counts AS (
 SELECT p.level_code,p.category_id,c."NameEn" category_name,c."Order" editorial_order,
 COUNT(DISTINCT l.problem_id) problem_count,COUNT(DISTINCT l.skill_id) skill_count
 FROM proposal p LEFT JOIN "Categories" c ON c."Id"=p.category_id AND c."StageId"=4
 LEFT JOIN source_links l ON l.category_id=p.category_id
 GROUP BY p.level_code,p.category_id,c."NameEn",c."Order"
), ranked AS (
 SELECT *,CASE WHEN problem_count>0 THEN row_number() OVER(PARTITION BY level_code ORDER BY (problem_count=0),editorial_order,category_id)<=2 ELSE false END free_category
 FROM counts
)
SELECT jsonb_build_object(
 'categories',(SELECT jsonb_agg(to_jsonb(r) ORDER BY level_code,editorial_order,category_id) FROM ranked r),
 'sourceTrackCount',(SELECT count(*) FROM source_tracks),
 'sourceMappedDistinctProblems',(SELECT count(DISTINCT problem_id) FROM source_links),
 'uncoveredDistinctProblems',(SELECT count(DISTINCT l.problem_id) FROM source_links l WHERE NOT EXISTS(SELECT 1 FROM proposal p WHERE p.category_id=l.category_id)),
 'levelDeficits',(SELECT jsonb_object_agg(level_code,deficit) FROM (SELECT level_code, sum(greatest(20-problem_count,0)) + (5-count(*))*20 deficit FROM ranked GROUP BY level_code) q),
 'history',(SELECT jsonb_agg(jsonb_build_object('code',t."Code",'trackId',t."Id",'revision',t."Revision",'published',t."IsPublished",
 'selectedStudents',(SELECT count(*) FROM "Users" u WHERE u."CurrentTrackId"=t."Id"),
 'progressRows',(SELECT count(*) FROM "UserProgresses" p WHERE p."PracticeScopeId"=t."Id"),
 'attemptRows',(SELECT count(*) FROM "ProblemAttempts" a WHERE a."PracticeScopeId"=t."Id"),
 'candidateLevels',(SELECT coalesce(jsonb_agg(DISTINCT p.level_code),'[]'::jsonb) FROM source_links l JOIN proposal p ON p.category_id=l.category_id WHERE l.track_id=t."Id")
 ) ORDER BY t."Code") FROM source_tracks t)
) AS preview;
ROLLBACK;
