"""Independent numeric checks of grade-depth draft content, no database writes."""
import json
from pathlib import Path
from fractions import Fraction
from math import isqrt
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
def load(name): return json.loads((root/name).read_text(encoding="utf-8"))
d=load("g1-grade-depth-wave04-20261125.json")
assert d["Status"]=="ReviewedCandidateNotImported"
skills={s["StableKey"]:s for s in load("g1-track-review-queue-20261124.json")["Skills"]}
from collections import Counter
assert Counter(r["ProposedTrackCodes"][0] for r in d["Items"])=={"grade-1":6,"grade-6":4,"grade-9":4}
def frac(a,b): return r"\frac"+str(a)+str(b) if a<10 and b<10 else r"\frac{"+str(a)+"}{"+str(b)+"}"
prob=Fraction(3+5,4+3+5)
ratio=Fraction(isqrt(100),isqrt(16))
expected={
"make-ten-two-ways":str(10-8),"compare-difference":str(11-9),
"compare-tens-trap":"47<52" if 47<52 else "47>52",
"regroup-ten":str((10+2*10)//10),"ruler-not-zero":str(9-2),
"skip-count-missing-middle":str(4+3*2),"missing-mean":str(4*15-sum([12,14,16])),
"triangle-ratio-two":str(2*(180-60)//3),"substitute-perimeter-model":str(3*7+5),
"probability-complement-one":frac(prob.numerator,prob.denominator),
"slope-from-table":str((-1-7)//(6-2)),"polygon-exterior":str(360//24),
"exponent-compare-ratio":"3^"+str(7+2-5),"similar-area-inverse":frac(ratio.numerator,ratio.denominator)}
assert len(d["Items"])==len(expected)==14
stems=set()
for name in ("g1-primary-grade-placement-20261124.json","g1-remaining-track-placement-20261124.json"):
    for r in load(name)["Items"]:
        stems.update(r["ExpectedQuestion"+l].strip().casefold() for l in ("Ar","En"))
for name in ("g1-primary-early-and-final-grade-gap-20261124.json","g1-gap-wave-01-20261124.json","g1-gap-wave-02-20261124.json","g1-gap-wave-03-20261124.json"):
    for r in load(name)["Items"]:
        stems.update(r["Content"]["Question"][l].strip().casefold() for l in ("Ar","En"))
def pair(p): return all(p[l].strip() for l in ("Ar","En"))
seen=set()
for r in d["Items"]:
    key=r["ContentKey"].removeprefix("g1-grade-depth-")
    assert key not in seen and r["ReviewStatus"]=="Draft";seen.add(key)
    c=r["Content"];s=skills[r["PrimarySkillKey"]]
    assert c["PrimarySkillId"]==s["SkillId"] and c["CategoryId"]==s["CategoryId"] and c["StageId"]==s["StageId"]
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
print("PASS: 14 independently checked grade-depth candidates, bilingual structured content, no duplicate stems or live writes")
