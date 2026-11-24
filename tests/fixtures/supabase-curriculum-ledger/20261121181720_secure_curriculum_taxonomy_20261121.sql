-- TEST FIXTURE ONLY. Supabase schema-migrations ledger snapshot, 2026-11-24.
-- Replay ONLY in disposable, CI-owned PostgreSQL. No production credentials or private student data.
-- Original Supabase migration: 20261121181720_secure_curriculum_taxonomy_20261121
ALTER TABLE "CurriculumDomains" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "CurriculumSkills" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "CurriculumSkillStandards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "CurriculumSkillPrerequisites" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "CurriculumProblemSkills" ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON "CurriculumDomains","CurriculumSkills","CurriculumSkillStandards","CurriculumSkillPrerequisites","CurriculumProblemSkills" FROM anon,authenticated;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM anon,authenticated;
