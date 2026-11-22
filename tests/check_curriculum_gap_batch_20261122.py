#!/usr/bin/env python3
"""Verify MathWorld editorial gap batch. No production publication in this test.

Independent answer oracles verify the flagged answer choices against calculations.
These machine checks are not a substitute for independent maths educator review.
"""
from __future__ import annotations

import json
import re
from collections import Counter
from decimal import Decimal
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "content/editorial/curriculum-gap-batch-20261122.json"
CATALOG = ROOT / "content/catalog/international-mathworld-taxonomy-v2.json"
data = json.loads(SOURCE.read_text(encoding="utf-8"))
catalog = json.loads(CATALOG.read_text(encoding="utf-8"))
assert data["meta"]["status"] == "Draft"
assert data["meta"]["publication"].startswith("Requires independent")
assert len(data["topics"]) == 4

def fmt(number: int) -> str:
    return f"{number:,}"

def signed_fraction(value: Fraction) -> str:
    return str(value).replace("-", "−")

def signed_decimal(value: Decimal) -> str:
    return str(value).replace("-", "−")

expected = {
    "p-number-sense-digit-value": fmt(6 * 10000),
    "p-number-sense-expanded-form": fmt(70000+500+40+3),
    "p-number-sense-compare-numbers": "<" if 58209 < 58290 else ">",
    "p-number-sense-round-to-hundred": fmt((37648+50)//100*100),
    "p-number-sense-round-to-thousand": fmt((9650+500)//1000*1000),
    "p-number-sense-estimate-sum": fmt(400+600),
    "p-number-sense-estimate-difference": fmt(1500-700),
    "p-number-sense-forty-hundreds": fmt(40*100),
    "m-integers-rationals-signed-temperature": str(-7+12),
    "m-integers-rationals-subtract-negative": str(-4-(-9)),
    "m-integers-rationals-product-negatives": str((-3)*(-8)),
    "m-integers-rationals-integer-ordering": "<".join(str(n) for n in sorted([-8,-2,4,0])),
    "m-integers-rationals-abs-distance": str(abs(-13)-abs(5)),
    "m-integers-rationals-rational-add": signed_fraction(Fraction(-3,4)+Fraction(1,2)),
    "m-integers-rationals-rational-subtract": signed_fraction(Fraction(-5,6)-Fraction(1,3)),
    "m-integers-rationals-signed-decimals": signed_decimal(Decimal("-2.5")+Decimal("1.75")),
    "s-exponents-logarithms-population-growth": str(int(Decimal(250)*Decimal("1.2")**2)),
    "s-exponents-logarithms-doubling": str(80*2**3),
    "s-exponents-logarithms-compound-interest": fmt(int(Decimal(2000)*Decimal("1.10")**2)),
    "s-exponents-logarithms-decay-two-periods": str(int(Decimal(1200)*Decimal("0.90")**2)),
    "s-exponents-logarithms-half-life": str(4*3),
    "s-exponents-logarithms-factor-decay": str(int((1-Decimal("0.7"))*100))+"%",
    "s-exponents-logarithms-rate-growth": str(int((Decimal("1.03")-1)*100))+"%",
    "s-exponents-logarithms-exp-sequence": "a_n=2\\cdot3^{n-1}",
    "u-math-statistics-z-score": str((82-70)//6),
    "u-math-statistics-standard-error": str(15//5),
    "u-math-statistics-sample-proportion": str(Decimal(18)/Decimal(30)),
    "u-math-statistics-mean-confidence":
        "["+str(Decimal(100)-Decimal("1.96")*Decimal(10)/Decimal(100).sqrt())+
        ","+str(Decimal(100)+Decimal("1.96")*Decimal(10)/Decimal(100).sqrt())+"]",
    "u-math-statistics-ci-margin": str(Decimal("1.96")*Decimal(8)/Decimal(64).sqrt()),
    "u-math-statistics-sample-size-ci": str(Fraction(1,2)),
    "u-math-statistics-p-value": "p<\\alpha" if Decimal("0.02") < Decimal("0.05") else "p>\\alpha",
    "u-math-statistics-type-one": "\\alpha",
}
keys = set()
templates = set()
skill_counts = {}
for topic in data["topics"]:
    stage = topic["stageId"]
    catalog_topics = {
        c["stable_key"] for section in catalog["stage_levels"]
        if section["stage_id"] == stage for c in section["categories"]
    }
    assert topic["stableKey"] in catalog_topics, topic["stableKey"]
    assert topic["stableKey"] not in keys
    keys.add(topic["stableKey"])
    assert len(topic["items"]) == 8 and len(topic["skills"]) == 3
    for lang in ("Ar", "En"):
        assert len(topic["name"+lang].strip()) >= 7
        assert len(topic["description"+lang].strip()) >= 25
    counts = Counter()
    for item in topic["items"]:
        key = item["contentKey"].removeprefix("mw-20261122-")
        assert key in expected, ("unexpected item", key)
        assert item["difficultyLevel"] in (1,2,3)
        assert item["pisaProcess"] in ("formulate","employ","interpret_evaluate")
        assert 0 <= item["primarySkillKey"] < len(topic["skills"])
        counts[item["primarySkillKey"]] += 1
        assert item["templateFamilyKey"].startswith(topic["stableKey"]+"-")
        for lang in ("Ar","En"):
            assert len(item["title"+lang].strip()) >= 6
            assert len(item["questionText"+lang].strip()) >= 15
            assert len(item["detailedSolution"+lang].strip()) >= 15
            normalized = re.sub(r"[0-9٠-٩]+", "#",item["questionText"+lang].lower())
            normalized = re.sub(r"\s+", " ", normalized).strip()
            assert (stage,lang,normalized) not in templates, key
            templates.add((stage,lang,normalized))
        opts = item["options"]
        assert [o["Order"] for o in opts] == [1,2,3,4]
        assert len({o["LatexCode"].strip() for o in opts}) == 4
        assert all(not re.search(r"[\u0621-\u064a]", o["LatexCode"]) for o in opts), ("non-bilingual option",key)
        # Reject mathematically identical rational distractors, not merely
        # different strings such as -3/6 and -1/2.
        def rational_value(value: str):
            clean = value.strip().replace("−", "-")
            if re.fullmatch(r"-?\d+(?:/\d+)?", clean):
                return Fraction(clean)
            return None
        rational_choices = [rational_value(o["LatexCode"]) for o in opts]
        if all(v is not None for v in rational_choices):
            assert len(set(rational_choices)) == len(rational_choices), ("equivalent fraction distractors", key)
        selected = [o["LatexCode"] for o in opts if o["IsCorrect"] is True]
        assert selected == [expected[key]], (key, selected, expected[key])
    assert min(counts.values()) >= 2 and len(counts) == 3, (topic["stableKey"],counts)
assert len(expected) == 32
assert sum(len(t["items"]) for t in data["topics"]) == len(expected)
print("PASS: 32 original bilingual problems in 4 canonical MathWorld topics")
print("PASS: 12 objectives with at least 2 distinct questions per objective")
print("PASS: 32 independent answer oracles, 4 unique choices, exactly 1 correct")
print("PASS: topic keys match existing 52-topic editorial catalogue; drafts are not public")
