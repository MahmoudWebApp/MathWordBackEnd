-- Official Common Core mathematics reference mapping.
-- Related (not exact/endorsement): stage-wide skills contain multiple grades,
-- and a skill label alone does not prove all CCSS standard requirements.
BEGIN;
INSERT INTO "CurriculumSkillStandards"("SkillId","Framework","StandardCode","MappingType","ReferenceUrl")
SELECT s."Id",'CCSS',v.code,'related','https://corestandards.org/wp-content/uploads/2023/09/ADA-Compliant-Math-Standards.pdf'
FROM (VALUES
('primary-addition','3.NBT.A.2'),
('primary-subtraction','3.NBT.A.2'),
('primary-multiplication','3.OA.C.7'),
('primary-division','3.OA.C.7'),
('primary-multiplicative-word-problems','3.OA.A.3'),
('primary-number-patterns','3.OA.D.9'),
('middle-ratios','6.RP.A.3'),
('middle-unit-rates','6.RP.A.3'),
('middle-percent-discounts','7.RP.A.3'),
('middle-percent-increase','7.RP.A.3')
) AS v(skill_key,code)
JOIN "CurriculumSkills" s ON s."StableKey"=v.skill_key
ON CONFLICT ("SkillId","Framework","StandardCode") DO NOTHING;
DO $$
BEGIN
 IF (SELECT COUNT(*) FROM "CurriculumSkillStandards" WHERE "Framework"='CCSS') < 10 THEN
  RAISE EXCEPTION 'Expected at least 10 verified related CCSS links';
 END IF;
END $$;
COMMIT;