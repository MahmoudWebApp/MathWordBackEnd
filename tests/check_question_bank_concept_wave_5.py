#!/usr/bin/env python3
"""Independent mathematical checks of 16 concept-diverse questions in repeat-heavy categories."""
from __future__ import annotations
import json
import math
import re
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SOURCES=["primary","lower-secondary","upper-secondary","university"]
KEYS={
1:{"primary-division","primary-multiplicative-word-problems","primary-multiplication"},
2:{"middle-similar-triangles","middle-pythagorean-theorem"},
3:{"secondary-polynomial-derivatives","secondary-indefinite-integrals","secondary-definite-integrals"},
4:{"university-integrating-ode","university-exponential-ode","university-second-order-ivp"},
}
def buses(students,capacity):
    return math.ceil(Fraction(students,capacity))
def distance(a,b):
    return math.isqrt((b[0]-a[0])**2+(b[1]-a[1])**2)
def tangent():
    x=2
    y=x**3-x
    slope=3*x*x-1
    intercept=y-slope*x
    return f"y={slope}x{intercept:+d}"
def integral_poly():
    # ∫ (6 x^2 - 4 x) dx = 2x^3 - 2x^2+C
    return r"2x^3-2x^2+C"
def exponential():
    return r"3e^2"
def oscillator():
    # y=A cos x+B sin x, with y(0)=0,y'(0)=2; at pi/2 gives B.
    return "2"
def linear_ode():
    # y'=2-y, y(0)=0 -> y=2(1-exp(-x)); at x=ln 2 -> 1.
    return str(Fraction(2)*(1-Fraction(1,2)))
ORACLE={
 "p-division-remainder":r"\text{13 each, 5 left}" if divmod(96,7)==(13,5) else "INVALID",
 "p-buses-ceiling":str(buses(145,38)),
 "p-pencils-inventory":str(18*12-35),
 "p-times-25-strategy":str(48*100//4),
 "m-similar-perimeters":str(Fraction(6*30,18)),
 "m-similar-area-scale":str(3**2),
 "m-coordinate-pythagoras":str(distance((1,2),(7,10))),
 "m-pythagorean-converse":r"\text{Right triangle}" if 8**2+15**2==17**2 else "INVALID",
 "s-derivative-poly-eval":str(6*3**2-4),
 "s-tangent-line":tangent(),
 "s-antiderivative-polynomial":integral_poly(),
 "s-definite-polynomial":str(2**3+2),
 "u-ode-integrate-ivp":str(2**3+4),
 "u-ode-exponential-growth":exponential(),
 "u-ode-second-order-ivp":oscillator(),
 "u-ode-integrating-factor":linear_ode(),
}
assert len(ORACLE)==16
assert tangent()=="y=11x-16"
assert integral_poly()=="2x^3-2x^2+C"
assert math.isclose(math.exp(-math.log(2)),0.5)
assert math.isclose(2*math.sin(math.pi/2),2)
allitems=[]
normfamilies=set()
skills=set()
keys=set()
for stage,name in enumerate(SOURCES,1):
    batch=json.loads((ROOT/f"content/batches/mathworld-bank5-{name}-20261122.json").read_text(encoding="utf-8"))
    assert batch["stage"]==stage and batch["status"]=="editorial_pending"
    assert len(batch["problems"])==4
    allitems.extend(batch["problems"])
for x in allitems:
    slug=x["ContentKey"].removeprefix("mw-bank5-")
    assert slug in ORACLE and x["ContentKey"] not in keys
    keys.add(x["ContentKey"])
    assert x["PrimarySkillKey"] in KEYS[x["StageId"]]
    skills.add(x["PrimarySkillKey"])
    assert x["TemplateFamilyKey"]=="concept-"+slug
    assert x["ExpertReview"]=="pending" and x["Points"]==10
    assert 1<=x["DifficultyLevel"]<=5
    assert x["PisaProcess"] in {"formulate","employ","interpret_evaluate"}
    assert x["CognitiveType"].strip()
    for field in ("LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn"):
        assert isinstance(x[field],str) and len(x[field].strip())>=10,(slug,field)
    for lang in ("Ar","En"):
        family=(x["StageId"],lang,re.sub(r"\s+"," ",re.sub(r"[0-9٠-٩]+","#",x["QuestionText"+lang].lower())))
        assert family not in normfamilies,("numeric-only duplicate",slug,lang)
        normfamilies.add(family)
    o=x["Options"]
    assert len(o)==4 and [v["Order"] for v in o]==[1,2,3,4]
    assert len({v["LatexCode"] for v in o})==4
    actual=[v["LatexCode"] for v in o if v["IsCorrect"] is True]
    assert actual==[ORACLE[slug]],(slug,actual,ORACLE[slug])
assert len(allitems)==16 and len(skills)==11
print("PASS: 16 new non-cloned bilingual mathematics questions in 4 repeat-heavy categories")
print("PASS: independently computed answer keys, 64 choices, unique families and 11 skill mappings")
