-- Read-only coverage and skill links for the offline planner and prepare command.
select t."Code" as track,t."StageId" as stage,c."Id" as "categoryId",c."NameAr" as "categoryAr",c."NameEn" as "categoryEn",count(distinct p."Id") as questions,
coalesce((select jsonb_agg(jsonb_build_object('id',s."Id",'key',s."StableKey") order by s."Id") from "LearningTrackSkills" ts join "CurriculumSkills" s on s."Id"=ts."SkillId" where ts."TrackId"=t."Id" and s."CategoryId"=c."Id" and s."StageId"=t."StageId" and s."IsPublished"),'[]'::jsonb) as skills
from "LearningTracks" t left join "LearningTrackCategories" tc on tc."TrackId"=t."Id" left join "Categories" c on c."Id"=tc."CategoryId" left join "LearningTrackProblems" tp on tp."TrackId"=t."Id" left join "Problems" p on p."Id"=tp."ProblemId" and p."CategoryId"=c."Id"
where t."IsPublished" group by t."Id",t."Code",t."StageId",c."Id",c."NameAr",c."NameEn" order by t."StageId",t."Code",c."Id";
