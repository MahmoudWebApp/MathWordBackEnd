#!/usr/bin/env python3
"""Independent math and editorial-contract checks for fraction/series depth wave.

Automatic verification is one guardrail, not human curriculum certification.
"""
import json
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
wave=json.loads((ROOT/"content/batches/mathworld-fractions-series-depth-20261121.json").read_text(encoding="utf-8"))
older=[
json.loads((ROOT/"content/batches/mathworld-adaptive-v2-editorial-pilot-20261121.json").read_text(encoding="utf-8")),
json.loads((ROOT/"content/batches/mathworld-reasoning-extension-20261121.json").read_text(encoding="utf-8"))]
skills={c["stable_key"]:set(c["skill_keys"]) for s in json.loads((ROOT/"content/catalog/international-mathworld-taxonomy-v2.json").read_text(encoding="utf-8"))["stage_levels"] for c in s["categories"]}
items=wave["problems"]
assert wave["publication_allowed"] is False
assert wave["expert_review"]=="pending"
assert len(items)==10
assert sum(x["PrimarySkillKey"]=="fraction-comparisons" for x in items)==5
assert sum(x["PrimarySkillKey"]=="series-convergence" for x in items)==5
assert Fraction(5,6)>Fraction(7,9)
assert Fraction(7,9)>Fraction(7,11)
gaps=[1-Fraction(9,10),1-Fraction(13,16),1-Fraction(7,8),1-Fraction(11,12)]
assert min(gaps)==gaps[3]
assert Fraction(1,3)<Fraction(5,12)<Fraction(1,2)
assert Fraction(3,8)<Fraction(4,10)
assert Fraction(1,1)/(1-Fraction(-1,2))==Fraction(2,3)
assert Fraction(6,1)/(1-Fraction(1,3))==9
partial=[sum((-1)**n for n in range(k)) for k in range(1,9)]
assert set(partial)=={0,1}
terms=[(-2)**n for n in range(8)]
assert abs(terms[-1])>abs(terms[0])
# Each successive dyadic block in harmonic series contributes >= 1/2.
for k in range(1,8):
    block=sum((Fraction(1,n) for n in range(2**k+1,2**(k+1)+1)),Fraction(0))
    assert block>=Fraction(1,2)
answers={
 "mw-depth-crossmultiply-fifths":r"\frac56>\frac79",
 "mw-depth-same-numerator-units":r"\frac79",
 "mw-depth-nearest-one":r"\frac{11}{12}",
 "mw-depth-strictly-between":r"\frac5{12}",
 "mw-depth-cycling-two-classes":r"\text{Class B}",
 "mw-depth-alternating-geometric-limit":r"\frac23",
 "mw-depth-geometric-six-two":"9",
 "mw-depth-alternating-one-minus-one":r"\text{Does not converge}",
 "mw-depth-term-test-exploding":r"\text{Diverges}",
 "mw-depth-harmonic-grouping":r"\text{Every doubling block adds at least }\frac12",
}
seen=set()
old_prompts={(x["StageId"],x["QuestionTextAr"].strip().casefold(),x["QuestionTextEn"].strip().casefold()) for b in older for x in b["problems"]}
for x in items:
    k=x["ContentKey"]
    assert k in answers and k not in seen
    seen.add(k)
    assert x["ProposedCategoryKey"] in skills
    assert x["PrimarySkillKey"] in skills[x["ProposedCategoryKey"]]
    assert x["StageId"]==(1 if x["PrimarySkillKey"]=="fraction-comparisons" else 3)
    assert x["ExpertReview"]=="pending"
    assert 1<=x["DifficultyLevel"]<=5
    assert x["PisaProcess"] in {"formulate","employ","interpret_evaluate"}
    assert x["TemplateFamilyKey"]==k
    assert x["Points"]==10
    for field in ["LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn"]:
        assert x[field].strip(),(k,field)
    prompt=(x["StageId"],x["QuestionTextAr"].strip().casefold(),x["QuestionTextEn"].strip().casefold())
    assert prompt not in old_prompts
    assert len(x["Options"])==4
    assert [o["Order"] for o in x["Options"]]==[1,2,3,4]
    assert len({o["LatexCode"] for o in x["Options"]})==4
    marked=[o["LatexCode"] for o in x["Options"] if o["IsCorrect"] is True]
    assert marked==[answers[k]],(k,marked,answers[k])
print("PASS: 10 bilingual, unique, independently cross-checked fractions/series problems")
