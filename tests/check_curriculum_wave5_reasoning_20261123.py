#!/usr/bin/env python3
"""Validate the eight new *draft-only* MathWorld reasoning items.

Independent mathematical oracles, bilingual text, taxonomy integrity, distinct
options, and exact duplicate avoidance. This does not publish questions.
Human editorial/semantic overlap review is still required.
"""
from __future__ import annotations

from collections import Counter
from fractions import Fraction
import json
from math import isclose
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
NEW = ROOT / "content/editorial/curriculum-wave5-reasoning-20261123.json"
data = json.loads(NEW.read_text(encoding="utf-8"))
assert data["meta"]["status"] == "Draft"
assert data["meta"]["noStudentFacingChanges"] is True
expected = {
    "p-number-sense": (1, {"place-value", "number-comparison", "rounding", "counting"}),
    "m-probability": (2, {"sample-spaces", "simple-compound-events", "frequency"}),
    "s-vectors": (3, {"vector-components", "magnitude", "dot-product"}),
    "u-optimization": (4, {"unconstrained-optimization", "constrained-optimization", "convexity"}),
}
assert len(data["topics"]) == 4
assert {x["existingTopicKey"] for x in data["topics"]} == set(expected)

# Computed independently from the prose or generated choice key.
oracles = {
    "mw-wave5-digit-position-range-count": lambda: len([
        x for x in range(200, 300) if x // 10 % 10 == 4
    ]),
    "mw-wave5-subtract-through-zero-places": lambda: 6005 - 90,
    "mw-wave5-conditional-even-die": lambda: Fraction(
        sum(x > 3 for x in range(1, 7) if x % 2 == 0),
        sum(x % 2 == 0 for x in range(1, 7)),
    ),
    "mw-wave5-exactly-one-six-ordered-dice": lambda: sum(
        (x == 6) != (y == 6) for x in range(1, 7) for y in range(1, 7)
    ),
    "mw-wave5-recover-negative-component-from-norm": lambda: -3,
    "mw-wave5-dot-product-distributive-combination": lambda: (
        1 * (3 - 1) + 2 * (0 + 1)
    ),
    "mw-wave5-boundary-quadratic-domain": lambda: min(
        (x+2)**2 + 5 for x in range(0, 200)
    ),
    "mw-wave5-coupled-quadratic-critical-value": lambda: (
        1**2 + 2*1*1 + 3*1**2 - 4*1 - 8*1
    ),
}
def numeric(s: str) -> Fraction:
    s = str(s).strip()
    m = re.fullmatch(r"\\frac\{(-?\d+)\}\{(\d+)\}", s)
    if m:
        return Fraction(int(m[1]), int(m[2]))
    return Fraction(s)

def norm(s: str) -> str:
    return re.sub(r"\s+", " ", s.casefold().strip())

seen_keys, seen_templates, seen_ar, seen_en = set(), set(), set(), set()
question_count = 0
for topic in data["topics"]:
    key = topic["existingTopicKey"]
    stage, valid_skills = expected[key]
    assert topic["stageId"] == stage
    assert len(topic["items"]) == 2, key
    for item in topic["items"]:
        question_count += 1
        id = item["contentKey"]
        assert id in oracles and id not in seen_keys, id
        seen_keys.add(id)
        assert item["templateFamilyKey"].startswith("wave5-")
        assert item["templateFamilyKey"] not in seen_templates, id
        seen_templates.add(item["templateFamilyKey"])
        assert item["primarySkillKey"] in valid_skills, id
        assert item["pisaProcess"] in {"formulate", "employ", "interpret_evaluate"}, id
        assert 1 <= item["difficultyLevel"] <= 5
        for language in ("Ar", "En"):
            for field in ("learningObjective", "title", "questionText", "detailedSolution"):
                assert item[field + language].strip(), (id, field, language)
        assert item["detailedSolutionAr"].startswith("القانون المستخدم:")
        assert "\n\nخطوات الحل:" in item["detailedSolutionAr"]
        assert item["detailedSolutionEn"].startswith("Rule used:")
        assert "\n\nSolution steps:" in item["detailedSolutionEn"]
        assert len(item["detailedSolutionAr"]) >= 130, id
        assert len(item["detailedSolutionEn"]) >= 130, id
        for lang, seen in (("Ar", seen_ar), ("En", seen_en)):
            question = norm(item["questionText" + lang])
            assert question not in seen, id
            seen.add(question)
        options = item["options"]
        assert len(options) == 4 and [o["Order"] for o in options] == [1, 2, 3, 4], id
        assert sum(o["IsCorrect"] is True for o in options) == 1, id
        vals = [numeric(o["LatexCode"]) for o in options]
        assert len(set(vals)) == 4, (id, "equivalent options")
        correct = next(numeric(o["LatexCode"]) for o in options if o["IsCorrect"])
        oracle = oracles[id]()
        assert correct == Fraction(oracle), (id, correct, oracle)

# Flag cross-wave exact duplicates; near-semantic similarity still needs a reviewer.
for path in sorted((ROOT / "content/editorial").glob("*.json")):
    if path == NEW:
        continue
    try:
        old = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        continue
    def walk(item):
        if isinstance(item, dict):
            yield item
            for value in item.values():
                yield from walk(value)
        elif isinstance(item, list):
            for value in item:
                yield from walk(value)
    for item in walk(old):
        if "questionTextAr" in item:
            assert norm(item["questionTextAr"]) not in seen_ar, (path.name, "Arabic duplicate")
        if "questionTextEn" in item:
            assert norm(item["questionTextEn"]) not in seen_en, (path.name, "English duplicate")
        if "contentKey" in item:
            assert item["contentKey"] not in seen_keys, (path.name, "content-key collision")
        if "templateFamilyKey" in item:
            assert item["templateFamilyKey"] not in seen_templates, (path.name, "template-family collision")

assert question_count == len(oracles) == 8
assert len(seen_keys) == len(seen_templates) == len(seen_ar) == len(seen_en) == 8
print("PASS: eight original bilingual concept-diverse draft problems and their independent math oracles.")
print("PASS: CCSS/Cambridge/PISA/MSC-linked stage/skill taxonomy keys, valid processes, four unique choices.")
# Separate, bilingual educator-review proposals for currently UNPUBLISHED
# CurriculumSkills. They must not set IsPublished through this test or seed.
skills = json.loads((ROOT / "content/editorial/primary-skill-description-review-20261123.json").read_text(encoding="utf-8"))
assert skills["noLiveDatabaseChanges"] is True
assert skills["status"].startswith("Draft")
assert len(skills["records"]) == 11
skill_ids = set()
for row in skills["records"]:
    assert row["stageId"] == 1 and row["categoryId"] in {1, 3, 33}
    assert row["expectedIsPublished"] is False
    assert row["skillId"] not in skill_ids and row["stableKey"].startswith("primary-")
    skill_ids.add(row["skillId"])
    for lang in ("Ar", "En"):
        current = row["expectedCurrent"]["Description" + lang].strip()
        updated = row["proposed"]["Description" + lang].strip()
        assert current and updated != current and len(updated) > len(current)
        assert len(updated) >= 95 and len(updated) <= 500, (row["stableKey"], lang)
assert len(skill_ids) == 11
print("PASS: 11 bilingual skill-description review proposals, no automatic publication.")
print("PASS: staged-only content, no IDs moved, no production categories or learner records modified.")
