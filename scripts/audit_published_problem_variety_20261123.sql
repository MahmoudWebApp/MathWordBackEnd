-- MathWorld QUESTION VARIETY AUDIT — read-only.
-- A shared numeric template is a pedagogical variety risk, NOT an incorrect answer.
-- Never delete, rewrite, repurpose or reset existing published questions / learner history.
WITH published_patterns AS (
 SELECT p."Id",p."StageId",p."CategoryId",
        regexp_replace(regexp_replace(lower(p."QuestionTextEn"),
          '[0-9]+(\\.[0-9]+)?','#','g'),'\\s+',' ','g') AS pattern
 FROM public."Problems" p
), repeated AS (
 SELECT "StageId","CategoryId",pattern,
        count(*) AS occurrences,array_agg("Id" ORDER BY "Id") AS problem_ids
 FROM published_patterns
 GROUP BY "StageId","CategoryId",pattern
 HAVING count(*) >= 3
)
SELECT "StageId","CategoryId",pattern,occurrences,problem_ids
FROM repeated ORDER BY "StageId","CategoryId",pattern;

-- Candidate preview guard: detect numeric-only skeleton reuse between Draft and
-- published questions and within Draft itself (same stage).
WITH all_problems AS (
 SELECT 'Published' AS origin,p."StageId" AS stage,p."Id"::text AS id,p."QuestionTextEn" AS question
 FROM public."Problems" p
 UNION ALL
 SELECT 'Draft',t."StageId",d."Id"::text,d."QuestionTextEn"
 FROM public."CurriculumDraftItems" d
 JOIN public."CurriculumTopicProposals" t ON t."Id"=d."TopicProposalId"
 WHERE d."EditorialStatus"='Draft'
), normal AS (
 SELECT origin,stage,id,
        regexp_replace(regexp_replace(lower(question),
          '[0-9]+(\\.[0-9]+)?','#','g'),'\\s+',' ','g') AS pattern
 FROM all_problems
)
SELECT stage,pattern,count(*) AS total,
       count(*) FILTER(WHERE origin='Published') AS published,
       count(*) FILTER(WHERE origin='Draft') AS draft,
       array_agg(origin||':'||id ORDER BY origin,id) AS problem_ids
FROM normal
GROUP BY stage,pattern
HAVING count(*) FILTER(WHERE origin='Draft') > 0 AND count(*) > 1
ORDER BY total DESC,stage,pattern;
