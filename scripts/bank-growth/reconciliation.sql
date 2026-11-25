-- Read-only source evidence. Keep the result private; no learner IDs are exported.
begin read only;
set local statement_timeout = '5s';

with option_signatures as (
    select "ProblemId", jsonb_agg(
        jsonb_build_array("Id", md5("LatexCode"), "IsCorrect")
        order by "Order", "Id"
    ) as signatures
    from "QuestionOptions" group by "ProblemId"
), primary_skills as (
    select k."ProblemId", jsonb_agg(
        jsonb_build_array(s."Id", s."StableKey", s."IsPublished" and d."IsPublished")
        order by s."Id"
    ) as skills
    from "CurriculumProblemSkills" k
    join "CurriculumSkills" s on s."Id" = k."SkillId"
    join "CurriculumDomains" d on d."Id" = s."DomainId"
    where k."IsPrimary" group by k."ProblemId"
), problem_rows as (
    select p."Id", jsonb_build_array(
        p."Id",
        md5(concat_ws(chr(31), p."StageId", p."CategoryId", p."Points",
            p."TitleAr", p."TitleEn", p."QuestionTextAr", p."QuestionTextEn")),
        md5(concat_ws(chr(31), p."DetailedSolutionAr", p."DetailedSolutionEn")),
        coalesce(o.signatures, '[]'::jsonb), s.skills,
        p."EditorialDetailsJson"::jsonb ? 'Solution',
        jsonb_array_length(coalesce(p."EditorialDetailsJson"::jsonb -> 'Hints', '[]'::jsonb)),
        (select count(*) from "LearningTrackProblems" m where m."ProblemId" = p."Id"),
        (exists (select 1 from "ProblemAttempts" a where a."ProblemId" = p."Id")
         or exists (select 1 from "UserProgresses" u where u."ProblemId" = p."Id"))
    ) as row
    from "Problems" p
    left join option_signatures o on o."ProblemId" = p."Id"
    left join primary_skills s on s."ProblemId" = p."Id"
)
select jsonb_build_object(
    'p', coalesce((select jsonb_agg(row order by "Id") from problem_rows), '[]'::jsonb),
    'd', coalesce((select jsonb_agg(jsonb_build_array("ContentKey", "SourceProblemId",
        "PublishedProblemId", "EditorialStatus", "Revision", "Id") order by "Id")
        from "CurriculumDraftItems"
        where "SourceProblemId" is not null or "ContentKey" like 'g1-%'), '[]'::jsonb)
) as audit;

commit;
