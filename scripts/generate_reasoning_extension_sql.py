#!/usr/bin/env python3
"""Generate idempotent, draft-only SQL for reviewed reasoning extension.

Usage:
    python3 scripts/generate_reasoning_extension_sql.py --check
    python3 scripts/generate_reasoning_extension_sql.py --sql > reasoning-draft.sql

The SQL NEVER publishes student problems; execute it only on MathWorld dev.
Run tests/check_curriculum_reasoning_extension.py before the SQL.
"""
import argparse
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "content/batches/mathworld-reasoning-extension-20261121.json"

def sql_quote(text: str) -> str:
    return "'" + text.replace("'", "''") + "'"

def load():
    data = json.loads(SOURCE.read_text(encoding="utf-8"))
    assert data["publication_allowed"] is False
    rows = data["problems"]
    assert rows and all(row["ExpertReview"] == "pending" for row in rows)
    assert len({row["ContentKey"] for row in rows}) == len(rows)
    assert all(len(row["Options"]) == 4 and
               sum(option["IsCorrect"] is True for option in row["Options"]) == 1 and
               len({option["LatexCode"] for option in row["Options"]}) == 4
               for row in rows)
    return rows

def create_sql(rows):
    payload = sql_quote(json.dumps(rows, ensure_ascii=False, separators=(",", ":")))
    return f"""-- MathWorld DEV: stage unpublished reasoning-extension questions only.
BEGIN;
WITH payload AS (
 SELECT * FROM jsonb_to_recordset({payload}::jsonb) AS q(
 "ContentKey" text, "StageId" integer, "ProposedCategoryKey" text,
 "PrimarySkillKey" text, "TemplateFamilyKey" text, "DifficultyLevel" integer,
 "PisaProcess" text, "LearningObjectiveAr" text, "LearningObjectiveEn" text,
 "QuestionTextAr" text, "QuestionTextEn" text, "DetailedSolutionAr" text,
 "DetailedSolutionEn" text, "Options" jsonb, "ExpertReview" text
 )
)
INSERT INTO "CurriculumDraftItems" (
 "TopicProposalId", "ContentKey", "PrimarySkillKey", "TemplateFamilyKey",
 "DifficultyLevel", "PisaProcess", "LearningObjectiveAr", "LearningObjectiveEn",
 "QuestionTextAr", "QuestionTextEn", "DetailedSolutionAr", "DetailedSolutionEn",
 "OptionsJson", "EditorialStatus")
SELECT t."Id", p."ContentKey", p."PrimarySkillKey", p."TemplateFamilyKey",
p."DifficultyLevel", p."PisaProcess", p."LearningObjectiveAr", p."LearningObjectiveEn",
p."QuestionTextAr", p."QuestionTextEn", p."DetailedSolutionAr", p."DetailedSolutionEn",
p."Options", 'Draft'
FROM payload p JOIN "CurriculumTopicProposals" t ON
t."StableKey"=p."ProposedCategoryKey" AND t."StageId"=p."StageId"
WHERE p."ExpertReview"='pending'
AND t."EditorialStatus"='Published'
AND jsonb_array_length(p."Options")=4
AND (SELECT COUNT(*) FROM jsonb_array_elements(p."Options") o
     WHERE (o->>'IsCorrect')::boolean)=1
AND NOT EXISTS (
 SELECT 1 FROM "Problems" current
 WHERE current."StageId"=p."StageId"
   AND (current."QuestionTextAr"=p."QuestionTextAr"
       OR current."QuestionTextEn"=p."QuestionTextEn"))
ON CONFLICT ("ContentKey") DO NOTHING;
DO $mw_draft$
BEGIN
 IF (SELECT COUNT(*) FROM "CurriculumDraftItems" WHERE "ContentKey" LIKE 'mw-reasoning-%') <> {len(rows)} THEN
    RAISE EXCEPTION 'Expected {len(rows)} unpublished reasoning questions';
 END IF;
 IF EXISTS (SELECT 1 FROM "CurriculumDraftItems"
   WHERE "ContentKey" LIKE 'mw-reasoning-%'
   AND "EditorialStatus" <> 'Draft') THEN
    RAISE EXCEPTION 'Unexpected draft publication state';
 END IF;
END $mw_draft$;
COMMIT;
"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--sql", action="store_true")
    args = parser.parse_args()
    items = load()
    if args.sql:
        print(create_sql(items))
    else:
        print("PASS:", len(items), "private draft questions validated",
              dict(Counter(x["ProposedCategoryKey"] for x in items)))
