#!/usr/bin/env python3
"""Reproducible SQL for eight reviewed-by-oracle, UNPUBLISHED editorial drafts.

Does not execute SQL. Only inserts draft manuscripts into CurriculumDraftItems;
no Problems/Categories or any learner data are touched.
"""
from __future__ import annotations
import argparse
import contextlib
import io
import json
from pathlib import Path
import runpy

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "content/editorial/curriculum-wave5-reasoning-20261123.json"

def quote(text: str) -> str:
    return "'" + text.replace("'", "''") + "'"

def sql() -> str:
    # Always run standalone math and uniqueness checks before generating SQL.
    with contextlib.redirect_stdout(io.StringIO()):
        runpy.run_path(str(ROOT / "tests/check_curriculum_wave5_reasoning_20261123.py"))
    data = json.loads(SOURCE.read_text(encoding="utf-8"))
    assert data["meta"]["status"] == "Draft"
    assert data["meta"]["noStudentFacingChanges"]
    rows = []
    for topic in data["topics"]:
        for q in topic["items"]:
            rows.append({
                "topicKey": topic["existingTopicKey"],
                "stageId": topic["stageId"],
                "contentKey": q["contentKey"],
                "primarySkillKey": q["primarySkillKey"],
                "templateFamilyKey": q["templateFamilyKey"],
                "difficultyLevel": q["difficultyLevel"],
                "pisaProcess": q["pisaProcess"],
                "learningObjectiveAr": q["learningObjectiveAr"],
                "learningObjectiveEn": q["learningObjectiveEn"],
                "questionTextAr": q["questionTextAr"],
                "questionTextEn": q["questionTextEn"],
                "detailedSolutionAr": q["detailedSolutionAr"],
                "detailedSolutionEn": q["detailedSolutionEn"],
                "options": q["options"],
            })
    assert len(rows) == 8 and len(set(r["contentKey"] for r in rows)) == 8
    payload = quote(json.dumps(rows, ensure_ascii=False, separators=(",", ":")))
    return f"""-- MathWorld wave-five editorial manuscripts: Draft only, no student publication.
BEGIN;
DO $guard$
BEGIN
 IF (SELECT count(*) FROM public."CurriculumTopicProposals"
     WHERE "StableKey" IN ('p-number-sense','m-probability','s-vectors','u-optimization')
       AND "EditorialStatus"='Draft') <> 4 THEN
   RAISE EXCEPTION 'Expected exactly four unpublished topic proposals';
 END IF;
END $guard$;

WITH manuscript AS (
 SELECT * FROM jsonb_to_recordset({payload}::jsonb)
 AS q("topicKey" text, "stageId" integer, "contentKey" text,
      "primarySkillKey" text, "templateFamilyKey" text,
      "difficultyLevel" integer, "pisaProcess" text,
      "learningObjectiveAr" text, "learningObjectiveEn" text,
      "questionTextAr" text, "questionTextEn" text,
      "detailedSolutionAr" text, "detailedSolutionEn" text, "options" jsonb)
)
INSERT INTO public."CurriculumDraftItems"
 ("TopicProposalId","ContentKey","PrimarySkillKey","TemplateFamilyKey",
  "DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn",
  "QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn",
  "OptionsJson","EditorialStatus")
SELECT topic."Id",q."contentKey",q."primarySkillKey",q."templateFamilyKey",
       q."difficultyLevel",q."pisaProcess",q."learningObjectiveAr",q."learningObjectiveEn",
       q."questionTextAr",q."questionTextEn",q."detailedSolutionAr",
       q."detailedSolutionEn",q."options",'Draft'
FROM manuscript q
JOIN public."CurriculumTopicProposals" topic
 ON topic."StableKey"=q."topicKey" AND topic."StageId"=q."stageId"
 AND topic."EditorialStatus"='Draft'
WHERE jsonb_array_length(q."options")=4
 AND (SELECT count(*) FROM jsonb_array_elements(q."options") opt
      WHERE (opt->>'IsCorrect')::boolean)=1
ON CONFLICT ("ContentKey") DO NOTHING;

DO $verify$
BEGIN
 IF (SELECT count(*) FROM public."CurriculumDraftItems"
     WHERE "ContentKey" LIKE 'mw-wave5-%' AND "EditorialStatus"='Draft') <> 8 THEN
   RAISE EXCEPTION 'Wave five did not stage exactly eight Draft manuscripts';
 END IF;
END $verify$;
COMMIT;"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    output = sql()
    if args.check:
        assert 'INSERT INTO public."Problems"' not in output
        assert 'INSERT INTO public."Categories"' not in output
        assert 'UPDATE public."CurriculumSkills"' not in output
        assert 'DELETE FROM' not in output
        print("PASS: eight original questions generate guarded, idempotent Draft-only SQL")
    else:
        print(output)
