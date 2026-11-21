#!/usr/bin/env python3
"""MathWorld editorial pilot: read-only integrity and arithmetic regression checks.

Passing this script does not replace independent mathematics and translation
review. The draft must not be automatically published.
"""
import json
import math
import re
import statistics
from fractions import Fraction
from pathlib import Path

root = Path(__file__).resolve().parents[1]
draft = json.loads((root / "content/batches/mathworld-adaptive-v2-editorial-pilot-20261121.json").read_text(encoding="utf-8"))
tax = json.loads((root / "content/catalog/international-mathworld-taxonomy-v2.json").read_text(encoding="utf-8"))
assert draft["publication_allowed"] is False
assert draft["status"] == "draft_only_requires_independent_math_and_language_review"
subjects = {c["stable_key"]: (s["stage_id"], set(c["skill_keys"]))
            for s in tax["stage_levels"] for c in s["categories"]}
assert len(draft["categories"]) == len({c["stable_key"] for c in draft["categories"]})

known, prompts, families, answers = set(), set(), set(), {}
for item in draft["problems"]:
    key = item["ContentKey"]
    assert key not in known
    known.add(key)
    stage, skills = subjects[item["ProposedCategoryKey"]]
    assert item["StageId"] == stage and item["PrimarySkillKey"] in skills
    assert item["ExpertReview"] == "pending"
    assert item["PisaProcess"] in ("formulate", "employ", "interpret_evaluate")
    assert 1 <= item["DifficultyLevel"] <= 5
    for field in ("QuestionTextAr", "QuestionTextEn", "DetailedSolutionAr",
                  "DetailedSolutionEn", "LearningObjectiveAr", "LearningObjectiveEn"):
        assert item[field].strip(), (key, field)
    prompt = (item["StageId"], item["QuestionTextAr"].strip().casefold(),
              item["QuestionTextEn"].strip().casefold())
    assert prompt not in prompts
    prompts.add(prompt)
    template = (item["ProposedCategoryKey"],
                re.sub(r"\d+", "#", item["QuestionTextAr"].casefold()))
    assert template not in families, (key, template)
    families.add(template)
    assert len(item["Options"]) == 4
    assert [c["Order"] for c in item["Options"]] == [1, 2, 3, 4]
    assert sum(c["IsCorrect"] for c in item["Options"]) == 1
    assert len(set(c["LatexCode"] for c in item["Options"])) == 4
    for phrase in (item["QuestionTextAr"], item["QuestionTextEn"],
                   item["DetailedSolutionAr"], item["DetailedSolutionEn"],
                   *(c["LatexCode"] for c in item["Options"])):
        assert r"\\" not in phrase, (key, "double-escaped-tex")
        assert phrase.count("$") % 2 == 0, (key, "unmatched-math-delimiter")
    answers[key.removeprefix("mw-adaptive-")] = next(
        c["LatexCode"] for c in item["Options"] if c["IsCorrect"])

checks = {
    "fraction-of-pie": r"\frac{3}{8}",
    "equivalent-quarters": r"\frac{9}{12}",
    "adding-unlike-fractions": r"\frac58",
    "fraction-of-collection": str(Fraction(2,3)*36),
    "fraction-decimal-comparison": r"0.6=\frac35",
    "twentieths-to-decimal": str(float(Fraction(7,20))),
    "rounding-hundredths": "4.79",
    "percentage-of-total": str(int(Fraction(25,100)*80)),
    "mixed-number-sum": r"2\frac14",
    "weighted-mean-frequency": str((2*3+7*2)//5),
    "median-ordered-odd": str(statistics.median([1,4,7,9,12])),
    "iqr-seven-values": str(12-4),
    "mean-translation-property": "+3",
    "range-with-outlier": str(20-3),
    "chart-counts-total": str(8+12+10),
    "relative-frequency-percentage": r"25\%",
    "arithmetic-nth-expression": "4n+1",
    "find-tenth-term": str(4+9*3),
    "fifth-geometric-term": str(3*2**4),
    "finite-arithmetic-sum": str(sum([2,5,8,11,14,17])),
    "finite-geometric-sum": str(sum(2**n for n in range(5))),
    "recursive-third-term": str(2*(2*2+1)+1),
    "infinite-geometric-sum": str(int(Fraction(4,1)/(1-Fraction(1,2)))),
    "find-common-difference-two-terms": str((27-11)//(7-3)),
    "demorgan-conjunction": r"\neg P\lor\neg Q",
    "contrapositive-equivalence": r"\neg Q\Rightarrow\neg P",
    "handshake-lemma-edges": str(sum([2,2,2,2])//2),
    "choose-two-seven": str(math.comb(7,2)),
    "pigeonhole-thirteen-twelve": str(math.ceil(13/12)),
    "modulo-three-equivalence": "3",
    "tree-nine-vertices": str(9-1),
}
assert set(checks) == set(answers), (set(checks)^set(answers))
for key, correct in checks.items():
    assert answers[key] == correct, (key, answers[key], correct)
for p in (False, True):
    for q in (False, True):
        assert (not (p and q)) == (not p or not q)
        assert (not p or q) == (q or not p)
for a in range(-5,6):
    assert (a-a)%3 == 0
    for b in range(-5,6):
        if (a-b)%3==0:
            assert (b-a)%3==0
            for c in range(-5,6):
                if (b-c)%3==0:
                    assert (a-c)%3==0
print(f"PASS: {len(answers)} bilingual adaptive draft questions with unique family hints, options and arithmetic checks. Human review still required.")
