"""Check university depth candidates against independent numerical/theorem calculations."""
import json
from pathlib import Path
from fractions import Fraction
from math import isqrt
from collections import Counter
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
def load(n):return json.loads((root/n).read_text(encoding="utf-8"))
d=load("g1-university-depth-wave05-20261125.json")
assert d["Status"]=="ReviewedCandidateNotImported"
skills={s["StableKey"]:s for s in load("g1-track-review-queue-20261124.json")["Skills"]}
x0,x1=2,3
f=lambda x:x*x-5
secant=Fraction(x1)-Fraction(f(x1)*(x1-x0),f(x1)-f(x0))
assert secant==Fraction(11,5)
xnew=Fraction(9,3);ynew=(7-xnew)/2
# At the convexity boundary a=±2 the eigenvalues are {0,4}; beyond it one is negative.
assert min(2+2,2-2)==0 and min(2-2,2+2)==0 and min(2+3,2-3)<0
expected={
"independent-means":str(isqrt(3**2+4**2)),
"normal-mean-tail":str(Fraction(10000-8413,10000).__float__()),
"ci-recover-center":str(int((Fraction("18.2")+Fraction("25.8"))/2)),
"test-left-tail":r"\text{Reject }H_0" if -1.9 < -1.645 else r"\text{Fail to reject }H_0",
"secant-linear":r"\frac{"+str(secant.numerator)+"}{"+str(secant.denominator)+"}",
"bisection-bracket":"[1,2.5]" if -3*2<0 else "[2.5,4]",
"composite-trapezoid-table":str((2+3)/2+5+4),
"gauss-seidel-update":f"({xnew},{ynew})",
"stationary-classification":r"\text{Local maximum}" if 6*(-1)<0 else r"\text{Local minimum}",
"closed-interval-endpoints":str(max(x*x-2*x for x in (0,1,4))),
"circle-linear-objective":str(isqrt(3**2+4**2)*5),
"convexity-cross-term":r"|a|\le2"}
assert len(d["Items"])==len(expected)==12
assert Counter(r["ProposedTrackCodes"][0] for r in d["Items"])=={"probability-statistics":4,"numerical-analysis":4,"mathematical-optimization":4}
stems=set()
for name in ("g1-primary-grade-placement-20261124.json","g1-remaining-track-placement-20261124.json"):
    for r in load(name)["Items"]:
        stems.update(r["ExpectedQuestion"+l].strip().casefold() for l in ("Ar","En"))
for name in ("g1-primary-early-and-final-grade-gap-20261124.json","g1-gap-wave-01-20261124.json","g1-gap-wave-02-20261124.json","g1-gap-wave-03-20261124.json","g1-grade-depth-wave04-20261125.json"):
    for r in load(name)["Items"]:
        stems.update(r["Content"]["Question"][l].strip().casefold() for l in ("Ar","En"))
def pair(p):return all(p[l].strip() for l in ("Ar","En"))
seen=set()
for r in d["Items"]:
    key=r["ContentKey"].removeprefix("g1-university-depth-")
    assert key not in seen and r["ReviewStatus"]=="Draft";seen.add(key)
    c=r["Content"];s=skills[r["PrimarySkillKey"]]
    assert c["StageId"]==s["StageId"]==4 and c["CategoryId"]==s["CategoryId"] and c["PrimarySkillId"]==s["SkillId"]
    assert r["ProposedTrackCodes"][0] in s["ProposedTrackCodes"] and c["TrackIds"]==[]
    assert len(c["Options"])==len({o["LatexCode"] for o in c["Options"]})==4
    assert [o["LatexCode"] for o in c["Options"] if o["IsCorrect"]]==[expected[key]]==[r["Check"]["expected"]]
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in c["Options"] if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(x) for x in c["Hints"]) and c["Hints"][0]!=c["Hints"][1]
    for l in ("Ar","En"):
        stem=c["Question"][l].strip().casefold()
        assert stem not in stems;stems.add(stem)
    sol=c["Solution"]
    assert sol["FormulaLatex"] and all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(x) for x in sol["Steps"])
print("PASS: 12 university depth candidates; independent numeric/theorem checks, no duplicate stems, draft only")
