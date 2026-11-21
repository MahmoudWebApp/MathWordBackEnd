#!/usr/bin/env python3
"""Generate development-only SQL to stage the 10 fraction/series depth problems.

Use:
  python3 tests/check_curriculum_depth_wave_1.py
  python3 scripts/generate_curriculum_depth_wave_sql.py --check
  python3 scripts/generate_curriculum_depth_wave_sql.py --sql > /tmp/mathworld-depth-wave.sql

The SQL writes only to the private review table, never student Problems.
"""
import argparse
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/"content/batches/mathworld-fractions-series-depth-20261121.json"

def sql_quote(x):
    return "'"+x.replace("'","''")+"'"

def load():
    d=json.loads(SOURCE.read_text(encoding="utf-8"))
    p=d["problems"]
    assert d["publication_allowed"] is False and d["expert_review"]=="pending"
    assert len(p)==10
    assert len({x["ContentKey"] for x in p})==len(p)
    assert all(x["ContentKey"].startswith("mw-depth-") and x["ExpertReview"]=="pending" for x in p)
    assert all(len(x["Options"])==4 and sum(o["IsCorrect"] is True for o in x["Options"])==1 for x in p)
    return p

def generate(rows):
    raw=sql_quote(json.dumps(rows,ensure_ascii=False,separators=(",",":")))
    return f"""-- MathWorld DEV ONLY. Editorial review queue; no learner publication.
BEGIN;
SELECT pg_advisory_xact_lock(20261122);
WITH payload AS (
 SELECT * FROM jsonb_to_recordset({raw}::jsonb) AS q(
 "ContentKey" text,"StageId" integer,"ProposedCategoryKey" text,
 "PrimarySkillKey" text,"TemplateFamilyKey" text,"DifficultyLevel" integer,
 "PisaProcess" text,"LearningObjectiveAr" text,"LearningObjectiveEn" text,
 "QuestionTextAr" text,"QuestionTextEn" text,"DetailedSolutionAr" text,
 "DetailedSolutionEn" text,"Options" jsonb,"ExpertReview" text
 )
)
INSERT INTO "CurriculumDraftItems"
("TopicProposalId","ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel",
"PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn",
"DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus")
SELECT t."Id",p."ContentKey",p."PrimarySkillKey",p."TemplateFamilyKey",p."DifficultyLevel",
p."PisaProcess",p."LearningObjectiveAr",p."LearningObjectiveEn",p."QuestionTextAr",
p."QuestionTextEn",p."DetailedSolutionAr",p."DetailedSolutionEn",p."Options",'Draft'
FROM payload p JOIN "CurriculumTopicProposals" t
 ON t."StableKey"=p."ProposedCategoryKey" AND t."StageId"=p."StageId"
WHERE t."EditorialStatus"='Published' AND p."ExpertReview"='pending'
AND jsonb_array_length(p."Options")=4
AND (SELECT COUNT(*) FROM jsonb_array_elements(p."Options") o
  WHERE (o->>'IsCorrect')::boolean)=1
AND NOT EXISTS (
 SELECT 1 FROM "Problems" existing WHERE existing."StageId"=p."StageId"
 AND (existing."QuestionTextAr"=p."QuestionTextAr" OR existing."QuestionTextEn"=p."QuestionTextEn")
)
ON CONFLICT ("ContentKey") DO NOTHING;
DO $mw_check$
BEGIN
 IF (SELECT COUNT(*) FROM "CurriculumDraftItems" WHERE "ContentKey" LIKE 'mw-depth-%')<>10 THEN
   RAISE EXCEPTION 'Expected exactly ten review questions in depth wave';
 END IF;
 IF EXISTS(SELECT 1 FROM "CurriculumDraftItems" WHERE "ContentKey" LIKE 'mw-depth-%'
     AND "EditorialStatus"<>'Draft') THEN
   RAISE EXCEPTION 'Wave must remain unpublished until reviewed';
 END IF;
END $mw_check$;
COMMIT;
"""

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--sql",action="store_true")
    p.add_argument("--check",action="store_true")
    a=p.parse_args()
    rows=load()
    if a.sql:
        print(generate(rows))
    else:
        print(f"PASS: {len(rows)} unpublished draft problems")
