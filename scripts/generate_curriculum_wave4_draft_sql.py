#!/usr/bin/env python3
"""Generate deterministic draft-only SQL for four MathWorld wave-4 topics.

Usage:
  python3 scripts/generate_curriculum_wave4_draft_sql.py --check
  python3 scripts/generate_curriculum_wave4_draft_sql.py > /tmp/wave4_draft.sql

Never inserts into learner-facing Problems/Categories or touches accounts/progress.
Database write requires separate deliberate review and execution.
"""
from __future__ import annotations
import argparse
import json
import runpy
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/"content/editorial/curriculum-wave4-20261123.json"

def quote(text: str) -> str:
    return "'" + text.replace("'", "''") + "'"

def sql_document(doc: dict) -> str:
    # The independent math test throws on any ambiguous or incorrect answer.
    runpy.run_path(str(ROOT/"tests/check_curriculum_wave4_20261123.py"))
    assert doc["meta"]["status"]=="Draft"
    assert doc["meta"]["noStudentFacingChanges"] is True
    payload=quote(json.dumps(doc["topics"], ensure_ascii=False, separators=(",",":")))
    expected={t["stableKey"]:t["stageId"] for t in doc["topics"]}
    assert len(expected)==4
    keys=[q["contentKey"] for t in doc["topics"] for q in t["items"]]
    assert len(keys)==24 and len(set(keys))==24
    # Insert 3 new proposals; existing p-number-sense proposal remains untouched.
    # No topic is marked Published; idempotent conflict handling rejects bad states.
    return f"""-- MATHWORLD WAVE 4: EDITORIAL DRAFTS ONLY. Reviewed teaching content not yet approved.
BEGIN;
WITH batch AS (
 SELECT * FROM jsonb_to_recordset({payload}::jsonb)
 AS t("stableKey" text,"stageId" integer,"domainId" integer,
      "iconKey" text,"sortOrder" integer,"nameAr" text,"nameEn" text,
      "descriptionAr" text,"descriptionEn" text,
      "existingProposal" boolean,"skills" jsonb,"items" jsonb)
)
INSERT INTO public."CurriculumTopicProposals"
 ("StableKey","StageId","DomainId","NameAr","NameEn",
  "DescriptionAr","DescriptionEn","IconKey","SortOrder","EditorialStatus","ProposedQuestionCount")
SELECT b."stableKey",b."stageId",b."domainId",b."nameAr",b."nameEn",
       b."descriptionAr",b."descriptionEn",b."iconKey",b."sortOrder",'Draft',
       jsonb_array_length(b."items")
FROM batch b WHERE NOT b."existingProposal"
ON CONFLICT ("StableKey") DO NOTHING;

DO $guard$
BEGIN
 IF (SELECT count(*) FROM public."CurriculumTopicProposals"
     WHERE "StableKey" IN ('p-number-sense','m-probability','s-vectors','u-optimization')
       AND "EditorialStatus"='Draft') <> 4 THEN
   RAISE EXCEPTION 'Missing or published wave-4 editorial topic proposal';
 END IF;
 IF EXISTS (
   SELECT 1 FROM public."CurriculumTopicProposals"
   WHERE ("StableKey"='p-number-sense' AND "StageId"<>1)
      OR ("StableKey"='m-probability' AND "StageId"<>2)
      OR ("StableKey"='s-vectors' AND "StageId"<>3)
      OR ("StableKey"='u-optimization' AND "StageId"<>4)
 ) THEN RAISE EXCEPTION 'Existing topic conflicts with canonical stage';
 END IF;
END $guard$;

WITH batch AS (
 SELECT * FROM jsonb_to_recordset({payload}::jsonb)
 AS t("stableKey" text,"stageId" integer,"domainId" integer,
      "iconKey" text,"sortOrder" integer,"nameAr" text,"nameEn" text,
      "descriptionAr" text,"descriptionEn" text,
      "existingProposal" boolean,"skills" jsonb,"items" jsonb)
), flattened AS (
 SELECT b."stableKey",b."stageId",item.value AS q,
        skill.value->>'objectiveAr' AS objective_ar,
        skill.value->>'objectiveEn' AS objective_en
 FROM batch b CROSS JOIN LATERAL jsonb_array_elements(b."items") item
 CROSS JOIN LATERAL jsonb_array_elements(b."skills") skill
 WHERE skill.value->>'key'=item.value->>'primarySkillKey'
)
INSERT INTO public."CurriculumDraftItems"
("TopicProposalId","ContentKey","PrimarySkillKey","TemplateFamilyKey",
 "DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn",
 "QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn",
 "OptionsJson","EditorialStatus")
SELECT topic."Id",f.q->>'contentKey',f.q->>'primarySkillKey',
       f.q->>'templateFamilyKey',(f.q->>'difficultyLevel')::integer,
       f.q->>'pisaProcess',f.objective_ar,f.objective_en,
       f.q->>'questionTextAr',f.q->>'questionTextEn',
       f.q->>'detailedSolutionAr',f.q->>'detailedSolutionEn',
       f.q->'options','Draft'
FROM flattened f
JOIN public."CurriculumTopicProposals" topic
  ON topic."StableKey"=f."stableKey" AND topic."StageId"=f."stageId"
WHERE jsonb_array_length(f.q->'options')=4
  AND (SELECT count(*) FROM jsonb_array_elements(f.q->'options') choice
       WHERE (choice->>'IsCorrect')::boolean)=1
ON CONFLICT ("ContentKey") DO NOTHING;

DO $verify$
BEGIN
 IF (SELECT count(*) FROM public."CurriculumDraftItems"
     WHERE "ContentKey" LIKE 'mw-wave4-%' AND "EditorialStatus"='Draft') <> 24 THEN
   RAISE EXCEPTION 'Wave-4 draft import incomplete or status changed';
 END IF;
END $verify$;
COMMIT;"""

if __name__=="__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("--check",action="store_true")
    args=parser.parse_args()
    doc=json.loads(SRC.read_text(encoding="utf-8"))
    result=sql_document(doc)
    if args.check:
        assert 'INSERT INTO public."Problems"' not in result
        assert 'INSERT INTO public."Categories"' not in result
        assert "ROLLBACK" not in result
        print("PASS: reproducible 24-item wave-4 editorial SQL; draft tables only")
    else:
        print(result)
