#!/usr/bin/env python3
"""Independent pre-publication review checks for MathWorld wave 4 (24 drafts).

This does not approve or publish any item. Human educator + bilingual review is required.
"""
from __future__ import annotations

import json
import math
import re
from fractions import Fraction
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PATH = ROOT / "content/editorial/curriculum-wave4-20261123.json"
DATA = json.loads(PATH.read_text(encoding="utf-8"))
CATALOG = json.loads((ROOT / "content/catalog/international-mathworld-taxonomy-v2.json").read_text(encoding="utf-8"))
assert DATA["meta"]["status"] == "Draft"
assert DATA["meta"]["noStudentFacingChanges"] is True
assert len(DATA["topics"]) == 4
catalog_by_stage = {
    (s["stage_id"], t["stable_key"]): t
    for s in CATALOG["stage_levels"] for t in s["categories"]
}
F = Fraction
# Each expected answer is recomputed from the mathematics, not copied from JSON.
oracle = {
    "p-digit-value": str(7 * 1000),
    "p-compare-four": str(max(4096,4609,4690,4906)),
    "p-round-hundreds": str(((3867 + 50) // 100) * 100),
    "p-step-count": str(1250 + 25 * 3),
    "p-estimate-sum": str(((198 + 50)//100 + (304 + 50)//100) * 100),
    "p-expanded-number": str(4*1000 + 3*100 + 2*10 + 7),
    "m-spinner-not-blue": r"\frac{2}{3}",
    "m-without-replacement": r"\frac{1}{10}",
    "m-spinner-coin": r"\frac{1}{8}",
    "m-frequency-ratio": r"\frac{3}{10}",
    "m-frequency-percent": str(F(24,80)*100) + r"\%",
    "m-sample-outfits": str(3*2),
    "s-displacement": str((-1-2,5-(-1))).replace(" ", ""),
    "s-vector-addition": str((2-5,-3+4)).replace(" ", ""),
    "s-length-5-12": str(math.isqrt(5**2+12**2)),
    "s-length-minus6-8": str(math.isqrt((-6)**2+8**2)),
    "s-dot-product": str(2*4+(-1)*3),
    "s-orthogonal-unknown": str((2*6)//3),
    "u-square-min": str(2),
    "u-stationary": str(6//2),
    "u-constrained-equal": str((6//2,6//2)).replace(" ", ""),
    "u-product-max": str((10//2)**2),
    "u-second-derivative": str(12*1**2+6),
    "u-hessian-eigen": str(min(2,4)),
}
assert len(oracle) == 24
assert F(4,6) == F(2,3)
assert F(2,5)*F(1,4) == F(1,10)
assert F(1,4)*F(1,2) == F(1,8)
assert F(18,60) == F(3,10)
# Validate the constrained extrema numerically around their unique optima.
assert all(x*x+(6-x)**2 >= 18 for x in range(-12,19))
assert all(x*(10-x) <= 25 for x in range(0,11))

def normalize(prompt: str) -> str:
    return re.sub(r"\s+", " ", re.sub(r"[0-9٠-٩]+", "#", prompt.casefold())).strip()

def canonical(value: str):
    """Detect mathematically equivalent numeric and fractional distractors."""
    m = re.fullmatch(r"\\frac\{(-?\d+)\}\{(\d+)\}", value)
    if m:
        return F(int(m.group(1)), int(m.group(2)))
    if re.fullmatch(r"-?\d+", value):
        return F(int(value),1)
    m = re.fullmatch(r"(\d+)\\%", value)
    if m:
        return F(int(m.group(1)),100)
    return value

# Compare prompts with other draft content as well as within this wave.
prior = set()
for path in (ROOT / "content/editorial").glob("*.json"):
    if path == PATH:
        continue
    payload = json.loads(path.read_text(encoding="utf-8"))
    def walk(node):
        if isinstance(node, dict):
            for field in ("questionTextAr","questionTextEn","QuestionTextAr","QuestionTextEn"):
                if isinstance(node.get(field),str):
                    prior.add((field.lower().endswith("ar"),normalize(node[field])))
            for v in node.values():
                walk(v)
        elif isinstance(node, list):
            for v in node:
                walk(v)
    walk(payload)

seen, prompts, topic_keys = set(),set(),set()
for topic in DATA["topics"]:
    stage,key=topic["stageId"],topic["stableKey"]
    assert (stage,key) in catalog_by_stage
    assert key not in topic_keys
    topic_keys.add(key)
    assert topic["existingProposal"] is (key == "p-number-sense")
    assert topic["domainId"] in range(1,9)
    assert topic["iconKey"] and topic["sortOrder"] > 0
    assert len(topic["items"]) == 6
    for lang in ("Ar","En"):
        assert len(topic["name"+lang]) >= 7
        assert len(topic["description"+lang]) >= 40
    available=set(catalog_by_stage[(stage,key)]["skill_keys"])
    skills={s["key"] for s in topic["skills"]}
    assert skills and skills <= available
    assert len(skills) == len(topic["skills"])
    counts={skill:0 for skill in skills}
    for item in topic["items"]:
        cid=item["contentKey"]
        assert cid.startswith("mw-wave4-")
        slug=cid.removeprefix("mw-wave4-")
        assert slug not in seen and slug in oracle
        seen.add(slug)
        assert item["templateFamilyKey"] == "wave4-"+slug
        assert item["primarySkillKey"] in skills
        counts[item["primarySkillKey"]] += 1
        assert 1 <= item["difficultyLevel"] <= 5
        assert item["pisaProcess"] in ("formulate","employ","interpret_evaluate")
        assert item["detailedSolutionAr"].startswith("القانون المستخدم: "), key
        assert "خطوات الحل:" in item["detailedSolutionAr"], key
        assert item["detailedSolutionEn"].startswith("Rule used: "), key
        assert "Solution steps:" in item["detailedSolutionEn"], key
        for lang in ("Ar","En"):
            question=item["questionText"+lang].strip()
            assert len(question) >= 25 and len(item["detailedSolution"+lang].strip()) >= 35,slug
            key2=(lang=="Ar",normalize(question))
            assert key2 not in prompts and key2 not in prior, ("duplicate/question template",slug)
            prompts.add(key2)
        choices=item["options"]
        assert [o["Order"] for o in choices]==[1,2,3,4]
        codes=[o["LatexCode"] for o in choices]
        assert len(set(codes))==4
        assert len(set(map(canonical,codes)))==4,("equivalent distractor",slug)
        assert all(not re.search(r"[ء-ي]",value) for value in codes)
        correct=[o["LatexCode"] for o in choices if o["IsCorrect"] is True]
        assert correct==[oracle[slug]],(slug,correct,oracle[slug])
    assert min(counts.values()) >= 1,(key,counts)
assert len(seen) == len(oracle) == 24
assert topic_keys == {"p-number-sense","m-probability","s-vectors","u-optimization"}
print("PASS: 24 original bilingual editorial questions across 4 canonical topics")
print("PASS: 3 new topic proposals, 1 extension; no learner-facing publication")
print("PASS: independent mathematical answer checks and non-equivalent distractors")
print("PASS: unique question templates against existing editorial JSON files")
print("NOTE: educator and bilingual editorial approval remain required")
