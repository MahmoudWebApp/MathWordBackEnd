-- TEST FIXTURE ONLY. Supabase schema-migrations ledger snapshot, 2026-11-24.
-- Replay ONLY in disposable, CI-owned PostgreSQL. No production credentials or private student data.
-- Original Supabase migration: 20261121183315_curriculum_skills_category_index_20261121
CREATE INDEX IF NOT EXISTS "IX_CurriculumSkills_CategoryId" ON "CurriculumSkills"("CategoryId");
