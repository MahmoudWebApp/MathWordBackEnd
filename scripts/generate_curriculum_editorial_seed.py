#!/usr/bin/env python3
"""Deterministic, offline SQL generator for UNPUBLISHED MathWorld editorial items.

Usage:
  python3 scripts/generate_curriculum_editorial_seed.py --check
  python3 scripts/generate_curriculum_editorial_seed.py > /tmp/mathworld-editorial-seed.sql

Only execute the SQL against a development database after the taxonomy,
topic-proposal and draft-item migrations and domain/topic seeds are present.
This never writes to the active learner Problems table.
"""
import argparse
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BATCH = ROOT / "content/batches/mathworld-adaptive-v2-editorial-pilot-20261121.json"
CATALOG = ROOT / "content/catalog/international-mathworld-taxonomy-v2.json"


def quote(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def validate(batch: dict, catalog: dict) -> list:
    assert batch.get("publication_allowed") is False
    assert batch.get("status") == "draft_only_requires_independent_math_and_language_review"
    approved_skill_keys = {
        topic["stable_key"]: (stage["stage_id"], set(topic["skill_keys"]))
        for stage in catalog["stage_levels"] for topic in stage["categories"]
    }
    expected = {row["stable_key"]: row["stage_id"] for row in batch["categories"]}
    problems = batch["problems"]
    seen_keys, seen_prompts = set(), set()
    counts = Counter()

    for item in problems:
        content_key = item["ContentKey"]
        category_key = item["ProposedCategoryKey"]
        assert content_key not in seen_keys, content_key
        seen_keys.add(content_key)
        assert category_key in expected and item["StageId"] == expected[category_key]
        stage_id, skills = approved_skill_keys[category_key]
        assert stage_id == item["StageId"] and item["PrimarySkillKey"] in skills
        assert item["ExpertReview"] == "pending"
        assert 1 <= item["DifficultyLevel"] <= 5
        assert item["PisaProcess"] in ("formulate", "employ", "interpret_evaluate")
        for field in ("ContentKey", "TemplateFamilyKey", "LearningObjectiveAr",
                      "LearningObjectiveEn", "QuestionTextAr", "QuestionTextEn",
                      "DetailedSolutionAr", "DetailedSolutionEn"):
            assert item[field].strip(), (content_key, field)
        prompt = (item["StageId"], item["QuestionTextAr"].strip().casefold(),
                  item["QuestionTextEn"].strip().casefold())
        assert prompt not in seen_prompts, content_key
        seen_prompts.add(prompt)
        options = item["Options"]
        assert len(options) == 4 and [o["Order"] for o in options] == [1, 2, 3, 4]
        assert sum(o["IsCorrect"] is True for o in options) == 1
        assert len({o["LatexCode"].strip() for o in options}) == 4
        counts[category_key] += 1

    assert set(counts) == set(expected)
    assert len(problems) == sum(counts.values())
    return problems


def generate_sql(problems: list) -> str:
    payload = quote(json.dumps(problems, ensure_ascii=False, separators=(",", ":")))
    return f"""-- Draft-only import. No public category or learner question is published.
BEGIN;
WITH payload AS (
 SELECT * FROM jsonb_to_recordset({payload}::jsonb) AS q(
 "ContentKey" text, "StageId" integer, "ProposedCategoryKey" text,
 "PrimarySkillKey" text, "TemplateFamilyKey" text, "DifficultyLevel" integer,
 "PisaProcess" text, "LearningObjectiveAr" text, "LearningObjectiveEn" text,
 "QuestionTextAr" text, "QuestionTextEn" text,
 "DetailedSolutionAr" text, "DetailedSolutionEn" text,
 "Options" jsonb, "ExpertReview" text
 )
)
INSERT INTO "CurriculumDraftItems"
("TopicProposalId","ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel",
"PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn",
"DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus")
SELECT c."Id",p."ContentKey",p."PrimarySkillKey",p."TemplateFamilyKey",
p."DifficultyLevel",p."PisaProcess",p."LearningObjectiveAr",p."LearningObjectiveEn",
p."QuestionTextAr",p."QuestionTextEn",p."DetailedSolutionAr",p."DetailedSolutionEn",
p."Options",'Draft'
FROM payload p
JOIN "CurriculumTopicProposals" c
 ON c."StableKey"=p."ProposedCategoryKey" AND c."StageId"=p."StageId"
WHERE p."ExpertReview"='pending'
AND jsonb_array_length(p."Options")=4
AND (SELECT count(*) FROM jsonb_array_elements(p."Options") o
     WHERE (o->>'IsCorrect')::boolean)=1
ON CONFLICT ("ContentKey") DO NOTHING;
DO $$
BEGIN
 IF (SELECT count(*) FROM "CurriculumDraftItems"
     WHERE "ContentKey" LIKE 'mw-adaptive-%') < {len(problems)} THEN
    RAISE EXCEPTION 'Pilot draft item count is lower than expected';
 END IF;
END $$;
COMMIT;
"""


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="validate only; emit no SQL")
    args = parser.parse_args()
    batch = json.loads(BATCH.read_text(encoding="utf-8"))
    catalog = json.loads(CATALOG.read_text(encoding="utf-8"))
    items = validate(batch, catalog)
    if args.check:
        print(f"PASS: {len(items)} unpublished questions validated for editorial staging")
    else:
        print(generate_sql(items))
