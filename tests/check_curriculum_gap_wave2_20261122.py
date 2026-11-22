#!/usr/bin/env python3
"""Independent computational and editorial checks for MathWorld wave two.

These are pre-publication machine checks. A mathematics educator must still
review wording, age fit, standards mappings, and difficulty before publishing.
"""
from __future__ import annotations

import json
import math
import re
from collections import Counter
from decimal import Decimal
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CATALOG = json.loads((ROOT / "content/catalog/international-mathworld-taxonomy-v2.json").read_text("utf-8"))
STAGES = ("primary", "middle", "secondary", "university")
docs = [
    json.loads((ROOT / f"content/editorial/curriculum-wave2-{stage}-20261122.json").read_text("utf-8"))
    for stage in STAGES
]
T = {
    "p": "p-measure-units",
    "m": "m-linear-inequalities",
    "s": "s-analytic-geometry",
    "u": "u-numerical-analysis",
}
expected: dict[str, str] = {}

def register(group: str, slug: str, value: object) -> None:
    key = T[group] + "-" + slug
    assert key not in expected
    expected[key] = str(value)

def frac_tex(f: Fraction) -> str:
    assert f.denominator != 1
    return r"\frac{" + str(f.numerator) + "}{" + str(f.denominator) + "}"

# PRIMARY — independent unit conversions, differences and clock arithmetic
register("p", "rope-combine", 235+85)
register("p", "ribbon-difference", int(Decimal("1.4")*100)-135)
register("p", "rope-segments", 12*100//75)
register("p", "rice-left", 2*1000+750-900)
register("p", "mass-packets", int(Decimal("1.5")*1000)//250)
register("p", "fill-cups", 2*1000//250)
register("p", "juice-after-pour", 2*1000-350)
register("p", "mixed-juice", 750+int(Decimal("0.8")*1000))
arrival = 9*60+45+1*60+35
register("p", "train-arrival", r"\text{" + f"{arrival//60:02d}:{arrival%60:02d}" + "}")
register("p", "class-duration", (15*60+5)-(14*60+10))
register("p", "kilometres-to-metres", int(Decimal("3.25")*1000))
register("p", "centimetres-to-millimetres", 18*10)

# MIDDLE — independently derive boundaries and integer solution counts
register("m", "additive-inequality", "x<" + str(12-5))
register("m", "multiplicative-inequality", r"x\ge" + str((11+4)//3))
negative_bound = Fraction(10-6,-2)
register("m", "negative-factor", "x>" + str(negative_bound.numerator))
register("m", "subtracted-variable", r"x\ge" + str(5-2))
register("m", "open-right-ray", "x>-3")
register("m", "closed-left-ray", r"x\le4")
register("m", "bounded-integer-count", len([x for x in range(-10,11) if -2 < x <= 2]))
register("m", "bounded-integer-sum", sum(x for x in range(-10,11) if -2 <= x < 3))
register("m", "taxi-budget", (18-4)//2)
register("m", "exam-score-threshold", math.ceil(Fraction(75-56,5)))
register("m", "shipping-capacity", (20-3)//2)
register("m", "at-most-temperature", r"T\le-5")

# SECONDARY — geometry calculations, standard equations and loci
register("s", "slope-two-points", (10-2)//(5-1))
mid = ((2+8)//2,(6+0)//2)
register("s", "midpoint", f"({mid[0]},{mid[1]})")
register("s", "distance-origin", math.isqrt((6-0)**2+(8-0)**2))
register("s", "line-intercept", "y=" + str(-2) + "x+" + str(3))
register("s", "circle-radius", math.isqrt(49))
register("s", "translated-circle", "(x-2)^2+(y+3)^2=" + str(4**2))
center_x = (-2+4)//2
radius = (4-(-2))//2
register("s", "diameter-to-equation", f"(x-{center_x})^2+y^2={radius**2}")
points = [(4,4),(1,5),(3,4),(3,3)]
assert [point for point in points if point[0]**2+point[1]**2==25] == [(3,4)]
register("s", "point-on-circle", "(3,4)")
register("s", "equidistant-two-points", "x=" + str((0+4)//2))
register("s", "equidistant-parallel-lines", "y=" + str((1+7)//2))
register("s", "fixed-distance-locus", "(x-1)^2+(y-2)^2=" + str(3**2))
register("s", "vertical-segment-bisector", "y=" + str((-2+6)//2))

# UNIVERSITY — numerically recompute approximations and residuals
register("u", "bisection-first-midpoint", str(Decimal(1+2)/2))
midpoint_exact = (1+3)//2
assert midpoint_exact**2-4 == 0
register("u", "bisection-exact-root", midpoint_exact)
x0=Fraction(4,1)
newton=x0-Fraction(x0**2-9,2*x0)
register("u", "newton-first-step", str(Decimal(newton.numerator)/Decimal(newton.denominator)))
register("u", "trapezoid-single-panel", Fraction(2-0,2)*(0**2+2**2))
register("u", "midpoint-rectangle", (2-0)*(1**2))
simpson = Fraction(1,3)*(0**2+4*1**2+2**2)
register("u", "simpson-parabola", frac_tex(simpson))
register("u", "absolute-error", abs(Decimal("10")-Decimal("9.7")))
register("u", "relative-error", str(int(Fraction(50-49,50)*100)) + r"\%")
register("u", "rounding-bound", Decimal("0.01")/2)
jacobi_x = Fraction(9,4)
jacobi_y = Fraction(7,3)
register("u", "jacobi-first-step",
    "(" + r"\frac" + str(jacobi_x.numerator) + str(jacobi_x.denominator)
    + "," + r"\frac" + str(jacobi_y.numerator) + str(jacobi_y.denominator) + ")")
register("u", "linear-elimination", (7+2)//3)
residual = (4-2*2,9-3*2)
register("u", "residual-infinity-norm", max(abs(x) for x in residual))

assert len(expected) == 48, len(expected)
seen_keys: set[str] = set()
seen_templates: set[tuple[int,str,str]] = set()
seen_topic_keys: set[str] = set()
skills_total = 0
questions_total = 0
for stage, doc in enumerate(docs,1):
    assert doc["meta"]["status"] == "Draft"
    assert doc["meta"]["publication"].startswith("Requires independent")
    assert len(doc["topics"]) == 1
    topic = doc["topics"][0]
    assert topic["stageId"] == stage
    assert topic["stableKey"] not in seen_topic_keys
    seen_topic_keys.add(topic["stableKey"])
    catalog_keys = {
        c["stable_key"] for s in CATALOG["stage_levels"]
        if s["stage_id"] == stage for c in s["categories"]
    }
    assert topic["stableKey"] in catalog_keys, topic["stableKey"]
    assert len(topic["items"]) == 12
    assert topic["iconKey"].strip()
    for lang in ("Ar","En"):
        assert len(topic["name"+lang].strip()) > 7
        assert len(topic["description"+lang].strip()) > 25
    skill_keys = [x["key"] for x in topic["skills"]]
    assert len(set(skill_keys)) == len(skill_keys)
    catalog_skills = {
        k for section in CATALOG["stage_levels"] if section["stage_id"] == stage
        for c in section["categories"] if c["stable_key"] == topic["stableKey"]
        for k in c["skill_keys"]
    }
    assert set(skill_keys) <= catalog_skills, (stage,skill_keys,catalog_skills)
    usage: Counter[int] = Counter()
    for item in topic["items"]:
        questions_total+=1
        key = item["contentKey"].removeprefix("mw-wave2-")
        assert item["contentKey"].startswith("mw-wave2-"+topic["stableKey"]+"-")
        assert key in expected and key not in seen_keys, key
        seen_keys.add(key)
        assert item["templateFamilyKey"] == key, key
        assert 0 <= item["primarySkillKey"] < len(skill_keys), key
        usage[item["primarySkillKey"]] += 1
        assert item["difficultyLevel"] in range(1,6), key
        assert item["pisaProcess"] in ("formulate","employ","interpret_evaluate"), key
        for lang in ("Ar","En"):
            assert len(item["title"+lang].strip()) >= 7, key
            assert len(item["questionText"+lang].strip()) >= 20, key
            assert len(item["detailedSolution"+lang].strip()) >= 25, key
            normalized = re.sub(r"[0-9٠-٩]+","#",item["questionText"+lang].lower())
            normalized = re.sub(r"\s+"," ",normalized).strip()
            signature=(stage,lang,normalized)
            assert signature not in seen_templates, ("numeric-only clone",key)
            seen_templates.add(signature)
        choices=item["options"]
        assert len(choices)==4
        assert [x["Order"] for x in choices]==[1,2,3,4]
        assert len(set(x["LatexCode"].strip() for x in choices))==4, key
        assert all(not re.search(r"[ء-ي]",x["LatexCode"]) for x in choices), key
        answer=[x["LatexCode"] for x in choices if x["IsCorrect"] is True]
        assert answer==[expected[key]], (key,answer,expected[key])
    assert min(usage.values())>=2, (topic["stableKey"],usage)
    assert len(usage)==len(skill_keys)
    skills_total+=len(skill_keys)
assert len(seen_keys)==len(expected)==questions_total
assert skills_total==15
print("PASS: 48 distinct bilingual editorial questions across four canonical subjects")
print("PASS: 15 referenced skills and independent arithmetic/geometry/numerical oracles")
print("PASS: correct choice, four unique language-neutral options and bilingual explanations")
print("PASS: all content remains Draft, independent education review is still required")
