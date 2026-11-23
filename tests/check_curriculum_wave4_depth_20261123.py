#!/usr/bin/env python3
"""Independent mathematical oracles for 32 new wave-4 depth drafts.

This test checks manuscript integrity only. Human educational review and
student-facing publication are deliberately outside its scope.
"""
from __future__ import annotations

import json
import math
import re
from fractions import Fraction
from itertools import product
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "content/editorial/curriculum-wave4-depth-20261123.json"
DATA = json.loads(TARGET.read_text(encoding="utf-8"))
CATALOG = json.loads((ROOT/"content/catalog/international-mathworld-taxonomy-v2.json").read_text(encoding="utf-8"))
assert DATA["meta"]["status"] == "Draft"
assert DATA["meta"]["publication"].startswith("Pending")
assert len(DATA["topics"]) == 4

def latex_fraction(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return r"\frac{" + str(value.numerator) + "}{" + str(value.denominator) + "}"

def point(a: int | Fraction, b: int | Fraction) -> str:
    return f"({a},{b})"

stages = {(st["stage_id"],cat["stable_key"]):set(cat["skill_keys"])
          for st in CATALOG["stage_levels"] for cat in st["categories"]}

# Independently calculate the intended answers, including sample-space enumeration.
dice = list(product(range(1,7), repeat=2))
coin_pairs = list(product("HT", repeat=2))
eligible = [x for x in range(1,11) if x%2==0 or x%5==0]
rounded_candidates = [x for x in (4490,4563,4650,4790) if (x+50)//100*100==4600]
assert rounded_candidates == [4563]
assert sum(a+b==7 for a,b in dice)==6
assert sum(a!=b for a,b in coin_pairs)==2
assert eligible == [2,4,5,6,8,10]
assert Fraction(15,50)==Fraction(18,60)
assert min(x*x + (6-x)*(6-x) for x in range(-100,101))==18
assert max(-(x-1)**2+9 for x in range(0,5))==9
assert (2*4+2)**2 == 100 and 4*4+2*2==20
assert (1+1)**2 == 4 and 1*1+1*1==2

ORACLE = {
 "p-digit-move":str(4000//400),
 "p-place-zeros":str(6000+40+9),
 "p-number-line-mid":str((340+360)//2),
 "p-round-candidate":str(rounded_candidates[0]),
 "p-budget-remainder":str(1500-sum((490,390,610))),
 "p-pencils-tens":point(*divmod(36,10)),
 "p-smallest-number":str(1000+6*100+8),
 "p-tens-in-interval":str(len([x for x in range(366,390) if x%10==0])),
 "m-two-coins-space":str(len(coin_pairs)),
 "m-dice-sum-seven":latex_fraction(Fraction(sum(a+b==7 for a,b in dice),len(dice))),
 "m-none-red-three":latex_fraction(Fraction(4,5)**3),
 "m-frequency-comparison":str(int(abs(Fraction(15,50)-Fraction(18,60))*100)),
 "m-replacement-blue":latex_fraction(Fraction(2,5)**2),
 "m-exactly-one-head":latex_fraction(Fraction(sum(a!=b for a,b in coin_pairs),len(coin_pairs))),
 "m-three-stage-count":str(3*2*2),
 "m-even-or-five":latex_fraction(Fraction(len(eligible),10)),
 "s-linear-combination":point(2*4-(-1),2*(-2)-3),
 "s-unit-vector":point(r"\frac{3}{5}",r"\frac{4}{5}"),
 "s-angle-pi-four":r"\frac{\pi}{4}",
 "s-obtuse-dot":str(1*(-2)+(-2)*1),
 "s-scalar-projection":str((3*1+4*0)//1),
 "s-vector-triangle-area":str(abs(3*4-0*0)//2),
 "s-point-distance":str(math.isqrt((7-1)**2+(10-2)**2)),
 "s-parallelogram-area":str(abs(2*3-1*1)),
 "u-quadratic-min-negative":str((2**2)-4*2+1),
 "u-convex-cubic-domain":"x>0",
 "u-bounded-quadratic-max":str(max(-(x-1)**2+9 for x in range(0,5))),
 "u-circle-constraint-max":str(round(math.sqrt(2)*math.sqrt(2))),
 "u-gradient-point":point(2*1,4*(-1)),
 "u-hessian-determinant":str(4*6-1*1),
 "u-least-norm-linear":str(4**2+2**2),
 "u-convex-parameter":r"a\ge1",
}
assert len(ORACLE)==32

def normalize(text: str) -> str:
    return re.sub(r"\s+"," ",re.sub(r"[0-9٠-٩]+","#",text.lower())).strip()

def numeric_value(text: str):
    fraction=re.fullmatch(r"\\frac\{(-?\d+)\}\{(\d+)\}", text)
    if fraction:
        return Fraction(int(fraction.group(1)),int(fraction.group(2)))
    if re.fullmatch(r"-?\d+",text):
        return Fraction(int(text),1)
    return text

prior_signatures = set()
for path in (ROOT/"content/editorial").glob("*.json"):
    if path==TARGET:
        continue
    other=json.loads(path.read_text(encoding="utf-8"))
    def traverse(node):
        if isinstance(node,dict):
            for field in ("questionTextAr","questionTextEn","QuestionTextAr","QuestionTextEn"):
                val=node.get(field)
                if isinstance(val,str):
                    prior_signatures.add(("Ar" if field.endswith("Ar") else "En",normalize(val)))
            for v in node.values():
                traverse(v)
        elif isinstance(node,list):
            for v in node:
                traverse(v)
    traverse(other)

seen_keys,seen_prompts,topic_ids=set(),set(),set()
expected_topics={"p-number-sense":1,"m-probability":2,"s-vectors":3,"u-optimization":4}
for t in DATA["topics"]:
    topic=t["existingTopicKey"]
    stage=t["stageId"]
    assert expected_topics[topic]==stage
    assert topic not in topic_ids
    topic_ids.add(topic)
    assert len(t["items"])==8
    assert (stage,topic) in stages
    for q in t["items"]:
        key=q["contentKey"].removeprefix("mw-wave4-depth-")
        assert q["contentKey"]=="mw-wave4-depth-"+key
        assert key in ORACLE and key not in seen_keys
        seen_keys.add(key)
        assert q["primarySkillKey"] in stages[(stage,topic)]
        assert q["templateFamilyKey"]=="wave4-depth-"+key
        assert 1<=q["difficultyLevel"]<=5
        assert q["pisaProcess"] in ("formulate","employ","interpret_evaluate")
        for lang in ("Ar","En"):
            prompt=q["questionText"+lang].strip()
            explanation=q["detailedSolution"+lang].strip()
            title=q["title"+lang].strip()
            assert len(prompt)>=27 and len(explanation)>=35 and len(title)>=7, (key,lang)
            sig=(lang,normalize(prompt))
            assert sig not in seen_prompts and sig not in prior_signatures, ("repeated numerical template",key)
            seen_prompts.add(sig)
        answers=q["options"]
        assert [x["Order"] for x in answers]==[1,2,3,4]
        values=[x["LatexCode"] for x in answers]
        assert len(set(values))==len(set(map(numeric_value,values)))==4,key
        correct=[x["LatexCode"] for x in answers if x["IsCorrect"] is True]
        assert correct==[ORACLE[key]], (key,correct,ORACLE[key])
        assert all(not re.search(r"[ء-ي]", v) for v in values)
assert topic_ids==set(expected_topics)
assert len(seen_keys)==32
print("PASS: 32 bilingual, skill-tagged, independent answer-checked depth questions")
print("PASS: 4 stage-canonical topics, unique options, one correct answer, no numerical clones in editorial files")
print("PASS: editorial Draft only; no learner problem or category publication")
