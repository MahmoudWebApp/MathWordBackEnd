#!/usr/bin/env python3
"""Create reproducible SQL for 32 NEW editorial-only math draft questions.

Run tests first. This generator does not execute SQL or touch production data.
"""
from __future__ import annotations

import argparse
import contextlib
import io
import json
import runpy
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
DEPTH=ROOT/"content/editorial/curriculum-wave4-depth-20261123.json"
BASE=ROOT/"content/editorial/curriculum-wave4-20261123.json"

def quote(value: str) -> str:
    return "'" + value.replace("'","''") + "'"

def sql() -> str:
    # Execute independent Python mathematical checks before ever producing SQL.
    with contextlib.redirect_stdout(io.StringIO()):
        runpy.run_path(str(ROOT/"tests/check_curriculum_wave4_depth_20261123.py"))
    depth=json.loads(DEPTH.read_text(encoding="utf-8"))
    base=json.loads(BASE.read_text(encoding="utf-8"))
    assert depth["meta"]["status"]=="Draft"
    assert base["meta"]["status"]=="Draft"
    objectives={
        (t["stableKey"],skill["key"]):(skill["objectiveAr"],skill["objectiveEn"])
        for t in base["topics"] for skill in t["skills"]
    }
    rows=[]
    for topic in depth["topics"]:
        assert len(topic["items"])==8
        for item in topic["items"]:
            ar,en=objectives[(topic["existingTopicKey"],item["primarySkillKey"])]
            rows.append({
                "topicKey":topic["existingTopicKey"],
                "stageId":topic["stageId"],
                "contentKey":item["contentKey"],
                "primarySkillKey":item["primarySkillKey"],
                "templateFamilyKey":item["templateFamilyKey"],
                "difficultyLevel":item["difficultyLevel"],
                "pisaProcess":item["pisaProcess"],
                "learningObjectiveAr":ar,
                "learningObjectiveEn":en,
                "questionTextAr":item["questionTextAr"],
                "questionTextEn":item["questionTextEn"],
                "detailedSolutionAr":item["detailedSolutionAr"],
                "detailedSolutionEn":item["detailedSolutionEn"],
                "options":item["options"],
            })
    assert len(rows)==32 and len({q["contentKey"] for q in rows})==32
    payload=quote(json.dumps(rows,ensure_ascii=False,separators=(",",":")))
    statement=f"""-- 32 MathWorld draft manuscripts: no user-visible publication.
BEGIN;
DO $guard$
BEGIN
 IF (SELECT count(*) FROM public."CurriculumTopicProposals"
     WHERE "StableKey" IN ('p-number-sense','m-probability','s-vectors','u-optimization')
       AND "EditorialStatus"='Draft') <> 4 THEN
   RAISE EXCEPTION 'Four unpublished topic proposals are required';
 END IF;
END $guard$;

WITH payload AS (
  SELECT * FROM jsonb_to_recordset({payload}::jsonb)
  AS q("topicKey" text,"stageId" integer,"contentKey" text,
       "primarySkillKey" text,"templateFamilyKey" text,
       "difficultyLevel" integer,"pisaProcess" text,
       "learningObjectiveAr" text,"learningObjectiveEn" text,
       "questionTextAr" text,"questionTextEn" text,
       "detailedSolutionAr" text,"detailedSolutionEn" text,
       "options" jsonb)
)
INSERT INTO public."CurriculumDraftItems"
 ("TopicProposalId","ContentKey","PrimarySkillKey","TemplateFamilyKey",
  "DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn",
  "QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn",
  "OptionsJson","EditorialStatus")
SELECT t."Id",p."contentKey",p."primarySkillKey",p."templateFamilyKey",
       p."difficultyLevel",p."pisaProcess",p."learningObjectiveAr",p."learningObjectiveEn",
       p."questionTextAr",p."questionTextEn",p."detailedSolutionAr",
       p."detailedSolutionEn",p."options",'Draft'
FROM payload p
JOIN public."CurriculumTopicProposals" t
  ON t."StableKey"=p."topicKey" AND t."StageId"=p."stageId"
  AND t."EditorialStatus"='Draft'
WHERE jsonb_array_length(p."options")=4
  AND (SELECT count(*) FROM jsonb_array_elements(p."options") x
       WHERE (x->>'IsCorrect')::boolean)=1
ON CONFLICT ("ContentKey") DO NOTHING;

DO $verify$
BEGIN
 IF (SELECT count(*) FROM public."CurriculumDraftItems"
     WHERE "ContentKey" LIKE 'mw-wave4-depth-%' AND "EditorialStatus"='Draft') <> 32 THEN
   RAISE EXCEPTION 'Depth batch failed atomic draft verification';
 END IF;
END $verify$;
COMMIT;"""
    return statement

if __name__=="__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("--check",action="store_true")
    args=parser.parse_args()
    generated=sql()
    if args.check:
        assert 'INSERT INTO public."Problems"' not in generated
        assert 'INSERT INTO public."Categories"' not in generated
        print("PASS: 32 wave-4 depth questions generate atomic, draft-only SQL")
    else:
        print(generated)
