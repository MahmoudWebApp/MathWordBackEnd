#!/usr/bin/env python3
"""40 distinct Arabic/English MathWorld problems, one answer each; independent oracle.

These tests validate formal/mathematical conditions and publication contracts.
They do not constitute external accreditation or human pedagogical review.
"""
from __future__ import annotations
import itertools
import json
import math
import re
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SOURCES=[
 "mathworld-bank4-primary-20261122.json",
 "mathworld-bank4-lower-secondary-20261122.json",
 "mathworld-bank4-upper-secondary-20261122.json",
 "mathworld-bank4-university-20261122.json",
]
SKILLS={
 1:{"primary-subtraction"},
 2:{"middle-evaluate-powers"},
 3:{"secondary-quadratic-roots","s-sequences-series-recurrence-relations"},
 4:{"university-ode-order","university-series-convergence",
    "u-discrete-math-combinatorics","u-discrete-math-proofs",
    "u-discrete-math-relations","university-differentiability-continuity"},
}
def texfrac(value: Fraction) -> str:
    value=Fraction(value)
    if value.denominator==1:
        return str(value.numerator)
    sign="-" if value.numerator<0 else ""
    n=abs(value.numerator)
    a=(str(n) if n<10 else "{"+str(n)+"}")
    b=(str(value.denominator) if value.denominator<10 else "{"+str(value.denominator)+"}")
    return rf"{sign}\frac{a}{b}"

def first_index_over(values, threshold):
    return next(i for i,x in enumerate(values,1) if x>threshold)

def roots_nonmonic():
    # For 2x^2 - 7x + 3: discriminant 25, rational roots (7±5)/4.
    d=(-7)**2-4*2*3
    assert d==25
    roots={Fraction(7+math.isqrt(d),4),Fraction(7-math.isqrt(d),4)}
    return r"\{3,\frac12\}" if roots=={Fraction(3),Fraction(1,2)} else "INVALID"

def recurrence_two_step():
    a,b=1,2
    for _ in range(3):
        a,b=b,a+b
    return b

def recurrence_square():
    x=1
    for _ in range(3): x=x*x+1
    return x

def recurrence_geometric_threshold():
    seq=[2*3**k for k in range(10)]
    return first_index_over(seq,100)

def harmonic_dyadic_blocks():
    # Every block [2^k+1, 2^(k+1)] contributes at least 1/2.
    for k in range(1,9):
        block=sum((Fraction(1,n) for n in range(2**k+1,2**(k+1)+1)),Fraction(0))
        assert block>=Fraction(1,2)
    return r"\text{Diverges}"

def alternate_harmonic():
    # Terms 1/n decrease monotonically to 0 (Leibniz), absolute
    # values form the divergent harmonic series.
    assert all(Fraction(1,n+1)<Fraction(1,n) for n in range(1,100))
    assert harmonic_dyadic_blocks()==r"\text{Diverges}"
    return r"\text{Converges conditionally}"

def proof_contrapositive():
    # Odd integer squares remain odd.
    for k in range(-20,21):
        n=2*k+1
        assert (n*n)%2==1
    return r"\text{Odd n implies odd }n^2"

def relation_partition():
    relation={(1,1),(2,2),(3,3),(1,2),(2,1)}
    assert all((x,x) in relation for x in [1,2,3])
    classes=[{y for y in [1,2,3] if (x,y) in relation} for x in [1,2,3]]
    return len({frozenset(group) for group in classes})

def relation_properties():
    domain=[-3,-2,-1,0,1,2,3]
    reflexive=all(x<=x for x in domain)
    symmetric=all(not x<=y or y<=x for x in domain for y in domain)
    transitive=all(not (x<=y and y<=z) or x<=z for x in domain for y in domain for z in domain)
    assert (reflexive,symmetric,transitive)==(True,False,True)
    return sum((reflexive,symmetric,transitive))

def valid_partial_order():
    domain=range(1,11)
    r=lambda a,b:b%a==0
    assert all(r(a,a) for a in domain)
    assert all(not(r(a,b) and r(b,a)) or a==b for a in domain for b in domain)
    assert all(not(r(a,b) and r(b,c)) or r(a,c) for a in domain for b in domain for c in domain)
    assert not r(2,3) and not r(3,2)
    return r"\text{Partial but not total order}"

def cont_not_diff():
    # h^(2/3)/h has unbounded magnitude as h -> 0, while f(h)->0.
    for n in range(2,8):
        h=10**(-n)
        assert h**(2/3)<10**(-n*0.5)
        assert h**(2/3)/h>1
    return r"\text{Continuous but not differentiable}"

# Every value below is derived independently, not read from any IsCorrect flag.
ORACLE={
 "p-subtract-water":str(425-178),
 "p-subtract-compare":str(650-487),
 "p-subtract-missing-start":str(95+38),
 "p-subtract-borrowing":str(503-287),
 "m-power-negative-base":str((-4)**3),
 "m-power-zero-exponent":str(17**0),
 "m-power-negative-exponent":texfrac(Fraction(1,2**3)),
 "m-power-cube-volume":str(3**3),
 "s-quadratic-repeated-root":str(10//2),
 "s-quadratic-nonmonic":roots_nonmonic(),
 "s-quadratic-area-model":str(next(x for x in range(1,50) if x*(x+2)==48)),
 "s-quadratic-no-real-roots":str(0 if 4**2-4*1*8<0 else 2),
 "s-recurrence-arithmetic-decreasing":str(7-3*(5-1)),
 "s-recurrence-two-previous":str(recurrence_two_step()),
 "s-recurrence-nonlinear":str(recurrence_square()),
 "s-recurrence-threshold":str(recurrence_geometric_threshold()),
 "u-ode-third-derivative":str(3),
 "u-ode-degree-trap":str(2),
 "u-ode-nonlinear-first":str(1),
 "u-ode-identify-fourth":r"y^{(4)}+y=0",
 "u-series-geometric-sum":texfrac(Fraction(1,1)/(1-Fraction(3,5))),
 "u-series-harmonic-diverges":harmonic_dyadic_blocks(),
 "u-series-alternating-harmonic":alternate_harmonic(),
 "u-series-telescoping":str(Fraction(1)),
 "u-comb-repeat-letters":str(math.factorial(5)//(math.factorial(2)**2)),
 "u-comb-group-constraint":str(math.comb(5,2)*math.comb(4,1)),
 "u-comb-no-replacement":str(math.perm(5,3)),
 "u-comb-round-table":str(math.factorial(5-1)),
 "u-proof-contrapositive":proof_contrapositive(),
 "u-proof-induction-step":r"2n+1",
 "u-proof-sqrt2":r"\text{a and b are both even}",
 "u-proof-counterexample":str(next(n for n in range(2,20) if n%2==0 and all(n%d for d in range(2,math.isqrt(n)+1)))),
 "u-relations-nonstrict-order":str(relation_properties()),
 "u-relations-block-classes":str(relation_partition()),
 "u-relations-transitive-closure":r"(1,3)",
 "u-relations-divisibility":valid_partial_order(),
 "u-diff-continuity-param":texfrac(Fraction(4-1,2)),
 "u-diff-xabsx":"0",
 "u-diff-piecewise-both":str(1**2+1),
 "u-diff-fractional-power":cont_not_diff(),
}
assert len(ORACLE)==40

def family(text):
    text=re.sub(r"[0-9٠-٩]+","#",text.strip().lower())
    return re.sub(r"\s+"," ",text)

items=[]
stage_counts={}
for stage,name in enumerate(SOURCES,1):
    data=json.loads((ROOT/"content/batches"/name).read_text(encoding="utf-8"))
    assert data["stage"]==stage and data["status"]=="editorial_pending"
    assert len(data["problems"])=={1:4,2:4,3:8,4:24}[stage]
    stage_counts[stage]=len(data["problems"])
    items.extend(data["problems"])

keys=set()
families=set()
questions=set()
counts={}
for item in items:
    key=item["ContentKey"]
    slug=key.removeprefix("mw-bank4-")
    assert key.startswith("mw-bank4-") and slug in ORACLE and key not in keys
    keys.add(key)
    assert item["PrimarySkillKey"] in SKILLS[item["StageId"]]
    counts[item["PrimarySkillKey"]]=counts.get(item["PrimarySkillKey"],0)+1
    assert item["TemplateFamilyKey"]=="concept-"+slug
    assert item["TemplateFamilyKey"] not in families
    families.add(item["TemplateFamilyKey"])
    assert item["ExpertReview"]=="pending" and item["Points"]==10
    assert item["PisaProcess"] in {"formulate","employ","interpret_evaluate"}
    assert item["CognitiveType"].strip()
    assert 1<=item["DifficultyLevel"]<=5
    for field in ("LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn"):
        assert isinstance(item[field],str) and len(item[field].strip())>=10,(key,field)
    for lang in ("Ar","En"):
        normalized=family(item["QuestionText"+lang])
        ident=(item["StageId"],lang,normalized)
        assert ident not in questions,("Repeated prompt family",key,lang)
        questions.add(ident)
    opts=item["Options"]
    assert len(opts)==4
    assert [o["Order"] for o in opts]==[1,2,3,4]
    assert len({o["LatexCode"] for o in opts})==4
    answer=[o["LatexCode"] for o in opts if o["IsCorrect"] is True]
    assert answer==[ORACLE[slug]],(key,answer,ORACLE[slug])
assert len(items)==40
assert len(counts)==10 and all(n==4 for n in counts.values()),counts
print("PASS: 40 questions, 10 under-covered skills and 4 concept families per skill")
print("PASS: 160 unique answer choices within their questions, independent exact math oracle")
print("PASS: bilingual prompts, explanations, primary skill keys and no internal numeric-only clones")
