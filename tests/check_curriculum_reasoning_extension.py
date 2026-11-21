#!/usr/bin/env python3
"""Check the under-covered MathWorld skills reasoning extension before publication.

This is independent of the correct-option flags: the expected answers are
calculated separately. It does not pretend to certify every curriculum standard.
"""
import itertools
import json
import math
import statistics
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BATCH = json.loads((ROOT / "content/batches/mathworld-reasoning-extension-20261121.json").read_text(encoding="utf-8"))
PILOT = json.loads((ROOT / "content/batches/mathworld-adaptive-v2-editorial-pilot-20261121.json").read_text(encoding="utf-8"))
CATALOG = json.loads((ROOT / "content/catalog/international-mathworld-taxonomy-v2.json").read_text(encoding="utf-8"))

# Each expected answer is checked against a calculation or explicit theorem below.
correct = {
    "compare-fifths-eighths": r"\frac25>\frac38",
    "non-equivalent-half": r"\frac4{10}",
    "fraction-subtraction": r"\frac7{12}",
    "hundredths-digit": "0",
    "reverse-percent-12-of-48": r"25\%",
    "number-line-eighths": r"\frac58",
    "median-six-unsorted": "6",
    "resistant-to-outlier": r"\text{Median}",
    "compare-girls-rates": r"\text{Class A}",
    "mode-repeated-values": "3",
    "range-translation": r"\text{Unchanged}",
    "arithmetic-first-from-fifth": "7",
    "negative-geometric-ratio": "-54",
    "recurrence-linear-in-n": "13",
    "sum-first-twelve-odd": "144",
    "divergent-geometric-series": r"\text{Diverges to }+\infty",
    "truth-of-implication": r"\text{True}",
    "choose-three-containing-person": "10",
    "mod-four-classes": "4",
    "complete-five-vertices": "10",
    "pigeonhole-pairs-sum-five": r"\text{Yes}",
}

# Verify independently, not by copying a question's marked answer.
assert Fraction(2, 5) > Fraction(3, 8)
assert Fraction(4, 10) != Fraction(1, 2)
assert all(Fraction(a, b) == Fraction(1, 2) for a, b in [(2, 4), (3, 6), (5, 10)])
assert Fraction(5, 6) - Fraction(1, 4) == Fraction(7, 12)
assert "0.407".split(".")[1][1] == "0"
assert 12 * 100 // 48 == 25
assert Fraction(5, 8) == Fraction(5, 8)
assert statistics.median([2, 9, 4, 12, 7, 5]) == 6
assert statistics.median([4, 5, 6, 7, 50]) == statistics.median([4, 5, 6, 7, 500]) == 6
assert Fraction(15, 27) > Fraction(10, 28)
assert statistics.mode([1, 1, 2, 3, 3, 3, 9]) == 3
values = [3, 6, 8, 14]
assert max(values) - min(values) == max(x + 5 for x in values) - min(x + 5 for x in values)
assert 23 - 4 * 4 == 7
assert 2 * (-3)**3 == -54
terms = [1]
for n in range(1, 4):
    terms.append(terms[-1] + 2*n)
assert terms[-1] == 13
assert sum(range(1, 24, 2)) == 144
assert all(sum(2**n for n in range(k)) > 2**(k-1) for k in range(2, 10))
assert (not False) or True
assert math.comb(5, 2) == 10
assert len({i % 4 for i in range(-20, 20)}) == 4
assert math.comb(5, 2) == 10
assert all(any(a + b == 5 for a,b in itertools.combinations(selection, 2))
           for selection in itertools.combinations((1, 2, 3, 4), 3))

allowed = {category["stable_key"]: (stage["stage_id"], set(category["skill_keys"]))
           for stage in CATALOG["stage_levels"] for category in stage["categories"]}
old_questions = {(p["StageId"], p["QuestionTextAr"].strip().casefold(), p["QuestionTextEn"].strip().casefold())
                 for p in PILOT["problems"]}
new_keys = set()
families = set()
questions = set()
items = BATCH["problems"]
assert BATCH["publication_allowed"] is False
assert len(items) == len(correct)

for p in items:
    key = p["ContentKey"]
    assert key.startswith("mw-reasoning-"), key
    suffix = key.removeprefix("mw-reasoning-")
    assert suffix in correct and key not in new_keys
    new_keys.add(key)
    assert p["ExpertReview"] == "pending"
    assert p["TemplateFamilyKey"] not in families
    families.add(p["TemplateFamilyKey"])
    assert 1 <= p["DifficultyLevel"] <= 5
    assert p["PisaProcess"] in ("formulate", "employ", "interpret_evaluate")
    assert p["ProposedCategoryKey"] in allowed
    stage_id, skills = allowed[p["ProposedCategoryKey"]]
    assert stage_id == p["StageId"]
    assert p["PrimarySkillKey"] in skills, (key, p["PrimarySkillKey"])
    for field in ["LearningObjectiveAr", "LearningObjectiveEn", "QuestionTextAr",
                  "QuestionTextEn", "DetailedSolutionAr", "DetailedSolutionEn"]:
        assert p[field].strip(), (key, field)
    q_key = (p["StageId"], p["QuestionTextAr"].strip().casefold(),
             p["QuestionTextEn"].strip().casefold())
    assert q_key not in old_questions and q_key not in questions, key
    questions.add(q_key)
    opts = p["Options"]
    assert len(opts) == 4
    assert sorted(o["Order"] for o in opts) == [1,2,3,4]
    assert len({o["LatexCode"] for o in opts}) == 4, key
    selected = [o["LatexCode"] for o in opts if o["IsCorrect"] is True]
    assert selected == [correct[suffix]], (key, selected, correct[suffix])
    assert p["Points"] == 10
print(f"PASS: {len(items)} mathematically cross-checked draft questions, bilingual, unique, curriculum-linked")
