#!/usr/bin/env python3
"""Generate atomic development-only SQL for 32 independently checked MathWorld items.

No student-account, attempt, progress, subscription, stage, or category edits.
The permanent canonical source is four bilingual JSON content files. A failed
preflight/postflight rolls the entire insertion back.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
FILES=[
    "mathworld-bank3-primary-20261122.json",
    "mathworld-bank3-lower-secondary-20261122.json",
    "mathworld-bank3-upper-secondary-20261122.json",
    "mathworld-bank3-university-20261122.json",
]

def load():
    items=[]
    for stage,name in enumerate(FILES,1):
        batch=json.loads((ROOT/"content/batches"/name).read_text(encoding="utf-8"))
        if batch["stage"]!=stage or batch["status"]!="editorial_pending" or len(batch["problems"])!=8:
            raise ValueError(f"Unexpected content review stage: {name}")
        items.extend(batch["problems"])
    if len(items)!=32 or len({x["ContentKey"] for x in items})!=32:
        raise ValueError("Expected 32 unique questions")
    return items

def quote(s):
    return "'"+s.replace("'","''")+"'"

def generate(items):
    payload=quote(json.dumps(items,ensure_ascii=False,separators=(",",":")))
    return f"""-- MathWorld DEVELOPMENT ONLY: 32 new skill-targeted questions.
-- Candidate content was mathematically tested, but no official certification
-- or institution endorsement is implied. One-shot guarded transaction.
BEGIN;
SELECT pg_advisory_xact_lock(20261122);
CREATE TEMP TABLE mw_question_bank_wave_3 ON COMMIT DROP AS
SELECT * FROM jsonb_to_recordset({payload}::jsonb) AS q(
  "ContentKey" text, "StageId" integer, "PrimarySkillKey" text,
  "TemplateFamilyKey" text, "LearningObjectiveAr" text, "LearningObjectiveEn" text,
  "QuestionTextAr" text, "QuestionTextEn" text,
  "DetailedSolutionAr" text, "DetailedSolutionEn" text,
  "DifficultyLevel" integer, "PisaProcess" text, "CognitiveType" text,
  "Points" integer, "Options" jsonb, "ExpertReview" text
);

DO $preflight$
BEGIN
 IF (SELECT COUNT(*) FROM "Problems")<>495
 OR (SELECT COUNT(*) FROM "Categories")<>24
 OR (SELECT COUNT(*) FROM "QuestionOptions")<>1980
 OR (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary")<>495 THEN
   RAISE EXCEPTION 'Unexpected current inventory; stop and re-audit the question bank';
 END IF;
 IF (SELECT COUNT(*) FROM mw_question_bank_wave_3)<>32
 OR (SELECT COUNT(DISTINCT "ContentKey") FROM mw_question_bank_wave_3)<>32
 OR (SELECT COUNT(DISTINCT "TemplateFamilyKey") FROM mw_question_bank_wave_3)<>32 THEN
   RAISE EXCEPTION 'Incorrect wave cardinality or repeated conceptual family';
 END IF;
 IF EXISTS(SELECT 1 FROM mw_question_bank_wave_3 q WHERE
   q."StageId" NOT BETWEEN 1 AND 4 OR
   q."ContentKey" NOT LIKE 'mw-bank3-%' OR
   q."ExpertReview"<>'pending' OR
   q."Points"<>10 OR
   q."DifficultyLevel" NOT BETWEEN 1 AND 5 OR
   q."PisaProcess" NOT IN ('formulate','employ','interpret_evaluate') OR
   NULLIF(btrim(q."CognitiveType"),'') IS NULL OR
   NULLIF(btrim(q."QuestionTextAr"),'') IS NULL OR
   NULLIF(btrim(q."QuestionTextEn"),'') IS NULL OR
   NULLIF(btrim(q."LearningObjectiveAr"),'') IS NULL OR
   NULLIF(btrim(q."LearningObjectiveEn"),'') IS NULL OR
   NULLIF(btrim(q."DetailedSolutionAr"),'') IS NULL OR
   NULLIF(btrim(q."DetailedSolutionEn"),'') IS NULL OR
   jsonb_typeof(q."Options")<>'array' OR
   jsonb_array_length(q."Options")<>4 OR
   (SELECT COUNT(*) FROM jsonb_array_elements(q."Options") o
     WHERE (o->>'IsCorrect')::boolean)<>1 OR
   (SELECT COUNT(DISTINCT o->>'LatexCode')
     FROM jsonb_array_elements(q."Options") o)<>4) THEN
   RAISE EXCEPTION 'Missing bilingual solution, bad cognition metadata or invalid distractors';
 END IF;
 IF EXISTS (SELECT 1 FROM mw_question_bank_wave_3 q
   LEFT JOIN "CurriculumSkills" s ON s."StableKey"=q."PrimarySkillKey"
   LEFT JOIN "Categories" c ON c."Id"=s."CategoryId"
   WHERE s."Id" IS NULL OR c."Id" IS NULL
      OR s."StageId"<>q."StageId" OR c."StageId"<>q."StageId") THEN
   RAISE EXCEPTION 'One or more objective keys no longer match their stages/categories';
 END IF;
 IF (SELECT COUNT(*) FROM mw_question_bank_wave_3 q
     INNER JOIN "CurriculumSkills" s ON s."StableKey"=q."PrimarySkillKey")<>32 THEN
   RAISE EXCEPTION 'Some objective keys are not unique';
 END IF;
 IF EXISTS(SELECT 1 FROM mw_question_bank_wave_3 q
   GROUP BY q."StageId",regexp_replace(lower(btrim(q."QuestionTextAr")),'[[:space:]]+',' ','g')
   HAVING COUNT(*)>1)
 OR EXISTS(SELECT 1 FROM mw_question_bank_wave_3 q
   GROUP BY q."StageId",regexp_replace(lower(btrim(q."QuestionTextEn")),'[[:space:]]+',' ','g')
   HAVING COUNT(*)>1) THEN
   RAISE EXCEPTION 'New wave has a repeated Arabic or English question';
 END IF;
 IF EXISTS (SELECT 1 FROM mw_question_bank_wave_3 q JOIN "Problems" p
   ON p."StageId"=q."StageId" AND
     (regexp_replace(lower(btrim(p."QuestionTextAr")),'[[:space:]]+',' ','g')
       =regexp_replace(lower(btrim(q."QuestionTextAr")),'[[:space:]]+',' ','g')
     OR regexp_replace(lower(btrim(p."QuestionTextEn")),'[[:space:]]+',' ','g')
       =regexp_replace(lower(btrim(q."QuestionTextEn")),'[[:space:]]+',' ','g'))) THEN
   RAISE EXCEPTION 'Wave duplicates existing student-bank wording; do not publish';
 END IF; 
 -- A numerical-substitution clone does not add a distinct mathematical concept.
 -- Strict flag for this curated wave; review the original family manually when
 -- planning future additions. A numerical-template match is a warning elsewhere.
 IF EXISTS(SELECT 1 FROM mw_question_bank_wave_3 q
   GROUP BY q."StageId",
    regexp_replace(regexp_replace(lower(btrim(q."QuestionTextAr")),
       '[[:digit:]٠-٩]+','#','g'),'[[:space:]]+',' ','g')
   HAVING COUNT(*)>1) THEN
   RAISE EXCEPTION 'The new wave repeats a template with changed numbers';
 END IF;
 IF EXISTS (SELECT 1 FROM mw_question_bank_wave_3 q JOIN "Problems" p
  ON p."StageId"=q."StageId"
  AND regexp_replace(regexp_replace(lower(btrim(p."QuestionTextAr")),
       '[[:digit:]٠-٩]+','#','g'),'[[:space:]]+',' ','g')
    =regexp_replace(regexp_replace(lower(btrim(q."QuestionTextAr")),
       '[[:digit:]٠-٩]+','#','g'),'[[:space:]]+',' ','g')) THEN
   RAISE EXCEPTION 'A candidate repeats an existing numerical template';
 END IF;
END $preflight$;

INSERT INTO "Problems"
 ("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn",
  "DetailedSolutionAr","DetailedSolutionEn",
  "StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt")
SELECT q."LearningObjectiveAr",q."LearningObjectiveEn",
 q."QuestionTextAr",q."QuestionTextEn",
 q."DetailedSolutionAr",q."DetailedSolutionEn",
 q."StageId",s."CategoryId",q."Points",0,0,NOW()
FROM mw_question_bank_wave_3 q
JOIN "CurriculumSkills" s ON s."StableKey"=q."PrimarySkillKey";

INSERT INTO "QuestionOptions"("LatexCode","IsCorrect","Order","ProblemId")
SELECT o->>'LatexCode',(o->>'IsCorrect')::boolean,(o->>'Order')::integer,p."Id"
FROM mw_question_bank_wave_3 q
JOIN "Problems" p ON p."StageId"=q."StageId" AND
 p."QuestionTextAr"=q."QuestionTextAr" AND p."QuestionTextEn"=q."QuestionTextEn"
CROSS JOIN LATERAL jsonb_array_elements(q."Options") o;

INSERT INTO "CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary")
SELECT p."Id",s."Id",TRUE
FROM mw_question_bank_wave_3 q
JOIN "Problems" p ON p."StageId"=q."StageId" AND
 p."QuestionTextAr"=q."QuestionTextAr" AND p."QuestionTextEn"=q."QuestionTextEn"
JOIN "CurriculumSkills" s ON s."StableKey"=q."PrimarySkillKey";

DO $postflight$
BEGIN
 IF (SELECT COUNT(*) FROM "Problems")<>527
 OR (SELECT COUNT(*) FROM "Categories")<>24
 OR (SELECT COUNT(*) FROM "QuestionOptions")<>2108
 OR (SELECT COUNT(*) FROM "CurriculumProblemSkills" WHERE "IsPrimary")<>527 THEN
   RAISE EXCEPTION 'Question bank totals failed; automatic rollback';
 END IF;
 IF (SELECT COUNT(*) FROM mw_question_bank_wave_3 q
     JOIN "Problems" p ON p."StageId"=q."StageId" AND
       p."QuestionTextAr"=q."QuestionTextAr" AND p."QuestionTextEn"=q."QuestionTextEn")<>32 THEN
   RAISE EXCEPTION 'Not all 32 questions were inserted exactly once';
 END IF;
 IF EXISTS(SELECT 1 FROM mw_question_bank_wave_3 q
   JOIN "Problems" p ON p."StageId"=q."StageId" AND
     p."QuestionTextAr"=q."QuestionTextAr" AND p."QuestionTextEn"=q."QuestionTextEn"
   WHERE (SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id")<>4
      OR (SELECT COUNT(*) FROM "QuestionOptions" o WHERE o."ProblemId"=p."Id" AND o."IsCorrect")<>1
      OR (SELECT COUNT(*) FROM "CurriculumProblemSkills" x WHERE x."ProblemId"=p."Id" AND x."IsPrimary")<>1)
 THEN
   RAISE EXCEPTION 'New question option count, answer or objective link invalid';
 END IF;
 IF EXISTS(SELECT 1 FROM "Problems" p
    JOIN "CurriculumProblemSkills" x ON x."ProblemId"=p."Id" AND x."IsPrimary"
    JOIN "CurriculumSkills" s ON s."Id"=x."SkillId"
    WHERE p."CategoryId"<>s."CategoryId" OR p."StageId"<>s."StageId") THEN
   RAISE EXCEPTION 'A problem has been assigned outside its true topic';
 END IF;
 IF EXISTS(SELECT 1 FROM (SELECT c."Id" FROM "Categories" c LEFT JOIN "Problems" p ON p."CategoryId"=c."Id"
   GROUP BY c."Id" HAVING COUNT(p."Id")=0) z) THEN
   RAISE EXCEPTION 'The operation left an empty topic';
 END IF;
END $postflight$;
COMMIT;
-- Deliberate one-shot: any rerun is rejected by inventory preflight.
"""

if __name__=="__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("--sql",action="store_true")
    parser.add_argument("--check",action="store_true")
    args=parser.parse_args()
    items=load()
    output=generate(items)
    if args.sql:
        print(output)
    else:
        assert output.count("BEGIN;")==1 and output.count("COMMIT;")==1
        assert "UPDATE \"UserProgresses\"" not in output
        print(f"PASS: reproducible guarded SQL for {len(items)} bilingual questions")
