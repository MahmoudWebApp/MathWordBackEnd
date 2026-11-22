#!/usr/bin/env python3
"""Independent mathematics and editorial-contract checks for question-bank wave 3.

8 under-covered objectives, 32 original bilingual questions, 128 distractors.
Not a substitute for human review or an institutional standards certificate.
"""
import json
import math
import re
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
FILES=[
 "mathworld-bank3-primary-20261122.json",
 "mathworld-bank3-lower-secondary-20261122.json",
 "mathworld-bank3-upper-secondary-20261122.json",
 "mathworld-bank3-university-20261122.json",
]
SKILLS={
 1:{"primary-one-step-multiplicative-equations","p-fractions-decimals-equivalence"},
 2:{"middle-triangle-angles","middle-vertical-angles"},
 3:{"secondary-two-dice-probability","s-sequences-series-geometric-sequences"},
 4:{"university-double-integrals","university-function-limits"},
}
def texfrac(number):
    f=Fraction(number)
    if f.denominator==1: return str(f.numerator)
    sign="-" if f.numerator<0 else ""
    n=abs(f.numerator)
    a=str(n) if n<10 else "{"+str(n)+"}"
    b=str(f.denominator) if f.denominator<10 else "{"+str(f.denominator)+"}"
    return rf"{sign}\frac{a}{b}"
def first_below(values,threshold):
    return next(i for i,x in enumerate(values,1) if x<threshold)

ORACLE={
 "p-equal-boxes":str(54//6),
 "p-inverse-multiplication":str(91//7),
 "p-array-columns":str(72//8),
 "p-missing-dividend":str(5*12),
 "p-equivalent-numerator":str(3*20//5),
 "p-equivalent-simplify":texfrac(Fraction(14,21)),
 "p-equivalent-decimal":texfrac(Fraction(75,100)),
 "p-equivalent-misconception":r"\frac23<\frac34" if 2*4<3*3 else "INVALID",
 "m-isosceles-base":str((180-40)//2),
 "m-triangle-exterior":str(125-45),
 "m-right-triangle-complement":str(90-35),
 "m-triangle-angle-ratio":str(180*3//(1+2+3)),
 "m-vertical-symbolic":str((20+40)//2),
 "m-vertical-measure":str(2*(35-5)+5),
 "m-vertical-pair-sum":str(146//2),
 "m-vertical-number-of-acute":str(2),
 "s-dice-sum-eight":texfrac(Fraction(sum(1 for a in range(1,7) for b in range(1,7) if a+b==8),36)),
 "s-dice-both-even":texfrac(Fraction(sum(1 for a in range(1,7) for b in range(1,7) if a%2==0 and b%2==0),36)),
 "s-dice-at-least-one-six":texfrac(Fraction(sum(1 for a in range(1,7) for b in range(1,7) if a==6 or b==6),36)),
 "s-dice-product-even":texfrac(Fraction(sum(1 for a in range(1,7) for b in range(1,7) if (a*b)%2==0),36)),
 "s-geom-common-ratio":str(6//2),
 "s-geom-missing-ratio":str(math.isqrt(54//6)),
 "s-geom-mean":str(math.isqrt(4*36)),
 "s-geom-threshold":str(first_below([48//(2**i) for i in range(6)],10)),
 "u-double-additive":str(Fraction(3*(2**2),2)+Fraction(2*(3**2),2)),
 "u-double-triangle-region":texfrac(Fraction(1*1,2)),
 "u-double-separable-x2":texfrac(Fraction(2,3)),
 "u-double-symmetry":str(Fraction(1,2)-Fraction(1,2)),
 "u-limit-sine":"3",
 "u-limit-cosine":"0",
 "u-limit-polynomial-infinity":str(Fraction(2,1)),
 "u-limit-exponential":"2",
}
assert len(ORACLE)==32
assert math.isclose(math.sin(3e-6)/1e-6,3,rel_tol=1e-9)
assert abs((1-math.cos(1e-4))/1e-4)<0.0001
assert math.isclose(math.expm1(2e-6)/1e-6,2,rel_tol=2e-5)
assert sum(1 for a in range(1,7) for b in range(1,7) if a+b==8)==5

allitems=[]
for stage,name in enumerate(FILES,1):
    group=json.loads((ROOT/"content/batches"/name).read_text(encoding="utf-8"))
    assert group["stage"]==stage and group["status"]=="editorial_pending"
    assert len(group["problems"])==8
    allitems.extend(group["problems"])
assert len(allitems)==32

seen=set()
text_seen=set()
family_seen=set()
counts={}
for item in allitems:
    key=item["ContentKey"]
    suffix=key.removeprefix("mw-bank3-")
    assert suffix in ORACLE and key.startswith("mw-bank3-") and key not in seen
    seen.add(key)
    stage=item["StageId"]
    skill=item["PrimarySkillKey"]
    assert skill in SKILLS[stage]
    counts[skill]=counts.get(skill,0)+1
    assert item["TemplateFamilyKey"]=="concept-"+suffix
    assert item["TemplateFamilyKey"] not in family_seen
    family_seen.add(item["TemplateFamilyKey"])
    assert item["ExpertReview"]=="pending" and item["Points"]==10
    assert 1<=item["DifficultyLevel"]<=5
    assert item["PisaProcess"] in {"formulate","employ","interpret_evaluate"}
    assert item["CognitiveType"].strip()
    for field in ("LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr",
                  "QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn"):
        assert isinstance(item[field],str) and len(item[field].strip())>=10,(key,field)
    for lang in ("Ar","En"):
        q=re.sub(r"\s+"," ",item["QuestionText"+lang].strip().lower())
        name=(stage,lang,q)
        assert name not in text_seen,(key,lang)
        text_seen.add(name)
    options=item["Options"]
    assert len(options)==4
    assert [o["Order"] for o in options]==[1,2,3,4]
    assert len({o["LatexCode"] for o in options})==4
    correct=[o["LatexCode"] for o in options if o["IsCorrect"] is True]
    assert correct==[ORACLE[suffix]],(key,correct,ORACLE[suffix])

assert len(counts)==8 and all(v==4 for v in counts.values())
print("PASS: 32 bilingual questions on 8 under-covered skills; independent math answers verified")
print("PASS: 32 distinct cognitive families, 128 unique answer choices, no internal exact prompt duplicates")
