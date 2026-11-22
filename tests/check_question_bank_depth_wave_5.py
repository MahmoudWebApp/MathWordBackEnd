#!/usr/bin/env python3
"""Independent answer oracles for 18 bilingual depth-wave 5 questions.

Machine mathematics and language-contract checks do NOT replace review by a
mathematics educator before production use.
"""
from __future__ import annotations
import json
import re
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
batch=json.loads((ROOT/"content/batches/mathworld-bank5-nine-skill-coverage-20261122.json").read_text(encoding="utf-8"))
items=batch["problems"]
def tex(v):
    v=Fraction(v)
    if v.denominator==1:
        return str(v.numerator)
    return rf"\frac{{{v.numerator}}}{{{v.denominator}}}"

# Mathematical answers computed independently from the author-provided flags.
oracle={
"p-grid":tex(Fraction(9,12)),
"p-improper":tex(Fraction(8+3,8)),
"p-part-of-part":tex(Fraction(1,2)*Fraction(3,4)),
"p-sharing":tex(Fraction(2,3)/4),
"p-expanded":str(8 + Fraction(3,10)+Fraction(6,100)), # format below
"p-times-ten":str(Fraction(47,100)*10),
"m-pictograph":str((6-3)*4),
"m-line-trend":str(max(23-14,19-23,31-19)),
"m-mean-deviation":tex(Fraction(abs(2-4)+abs(4-4)+abs(6-4),3)),
"m-iqr-compare":str((18-6)-(15-9)),
"s-missing-terms":r"8,\ 12,\ 16",
"s-target-index":str(1+(47-5)//3),
"s-alternating-pairs":str(sum(i if i%2 else -i for i in range(1,21))),
"s-telescope":tex(sum((Fraction(1,i)-Fraction(1,i+1) for i in range(1,5)),Fraction(0))),
"u-bipartite":str(2*3),
"u-odd-cycle":str(2+int(5%2==1)),
"u-biconditional":str(sum(p==q for p in (False,True) for q in (False,True))),
"u-absorption":"P",
}
oracle["p-expanded"]=f"{float(Fraction(8)+Fraction(3,10)+Fraction(6,100)):.2f}"
oracle["p-times-ten"]=f"{float(Fraction(47,100)*10):g}"
assert len(items)==len(oracle)==18
assert batch["status"]=="editorial_pending"
expected_skill_counts={
"p-fractions-decimals-fraction-models":2,
"p-fractions-decimals-fraction-operations":2,
"p-fractions-decimals-decimal-place-value":2,
"m-statistics-charts":2,
"m-statistics-distributions":2,
"s-sequences-series-arithmetic-sequences":2,
"s-sequences-series-series-sums":2,
"u-discrete-math-graphs":2,
"u-discrete-math-logic":2,
}
skill_counts={}
family_keys=set()
question_families=set()
for item in items:
    key=item["ContentKey"]
    slug=key.removeprefix("mw-bank5-")
    assert key.startswith("mw-bank5-") and slug in oracle, key
    assert item["ExpertReview"]=="pending"
    assert item["Points"]==10 and 1<=item["DifficultyLevel"]<=5
    assert item["PisaProcess"] in {"formulate","employ","interpret_evaluate"}
    assert item["CognitiveType"].strip()
    skill=item["PrimarySkillKey"]
    skill_counts[skill]=skill_counts.get(skill,0)+1
    assert item["TemplateFamilyKey"] not in family_keys
    family_keys.add(item["TemplateFamilyKey"])
    for lang in ("Ar","En"):
        for field in ("LearningObjective","QuestionText","DetailedSolution"):
            assert len(item[field+lang].strip())>=10,(key,field+lang)
        normalized=re.sub(r"\s+"," ",re.sub(r"[0-9٠-٩]+","#",item["QuestionText"+lang].strip().lower()))
        assert (item["StageId"],lang,normalized) not in question_families,(key,lang)
        question_families.add((item["StageId"],lang,normalized))
    opts=item["Options"]
    assert len(opts)==4 and [x["Order"] for x in opts]==[1,2,3,4]
    assert len({x["LatexCode"] for x in opts})==4
    actual=[x["LatexCode"] for x in opts if x["IsCorrect"] is True]
    assert actual==[oracle[slug]],(key,actual,oracle[slug])
assert skill_counts==expected_skill_counts,skill_counts
assert len(family_keys)==18
print("PASS: 18 bilingual questions, nine skills x two concept families")
print("PASS: 18 independent mathematical answer checks and unique distractors")
print("PASS: no internal numeric-only template clones; expert review still pending")
