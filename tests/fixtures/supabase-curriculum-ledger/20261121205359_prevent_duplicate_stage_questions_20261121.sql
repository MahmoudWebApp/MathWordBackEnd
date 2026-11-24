-- TEST FIXTURE ONLY. Supabase schema-migrations ledger snapshot, 2026-11-24.
-- Replay ONLY in disposable, CI-owned PostgreSQL. No production credentials or private student data.
-- Original Supabase migration: 20261121205359_prevent_duplicate_stage_questions_20261121
CREATE UNIQUE INDEX IF NOT EXISTS "UX_Problems_StageQuestionArNormalized"
ON "Problems" ("StageId", md5(regexp_replace(lower(btrim("QuestionTextAr")), '[[:space:]]+', ' ', 'g')));
CREATE UNIQUE INDEX IF NOT EXISTS "UX_Problems_StageQuestionEnNormalized"
ON "Problems" ("StageId", md5(regexp_replace(lower(btrim("QuestionTextEn")), '[[:space:]]+', ' ', 'g')));
