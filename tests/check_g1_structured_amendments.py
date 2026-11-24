"""Contract for the first 16 structured amendments; never imports production."""
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]/"content"/"editorial"
def load(name): return json.loads((ROOT/name).read_text(encoding="utf-8"))
d=load("g1-structured-amendments-wave01-20261124.json")
second=load("g1-structured-amendments-wave02-20261124.json")
assert second["Status"]==d["Status"]
d["Items"]+=second["Items"]
laws={r["ProblemId"]:r for r in load("g1-short-solution-law-candidates-20261124.json")["Items"]}
hints={r["problemId"]:r for r in load("g1-existing-hint-candidates-20261124.json")["items"]}
assert d["Status"]=="NotImportedNotPublished"
assert len(d["Items"])==len({r["ProblemId"] for r in d["Items"]})==52
def pair(x): return all(isinstance(x.get(k),str) and x[k].strip() for k in ("Ar","En"))
for row in d["Items"]:
    i=row["ProblemId"]; c=row["Content"]; l=laws[i]; h=hints[i]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert c["Question"]==h["question"]=={"Ar":l["ExpectedQuestionAr"],"En":l["ExpectedQuestionEn"]}
    assert row["ExpectedLegacySolution"]=={"Ar":l["ExpectedSolutionAr"],"En":l["ExpectedSolutionEn"]}
    assert c["Hints"]==h["Hints"] and len(c["Hints"])==2
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]
    assert len(opts)==len({o["LatexCode"] for o in opts})==4
    assert [o["LatexCode"] for o in opts if o["IsCorrect"]]==[l["ExpectedCorrectOption"]]
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
    assert pair(c["Title"]) and c["Points"]>0 and c["PrimarySkillId"]>0
print("PASS: 52 complete structured amendment proposals, source-bound; no automatic publication")


# Wave 03: independent recomputation from the actual source-guarded English
# questions, not from the proposed answer text or existing correctness flag.
import re
from fractions import Fraction
wave=load("g1-structured-amendments-wave03-20261124.json")
assert wave["Status"]=="NotImportedNotPublished"
placements={r["ProblemId"]:(g,r) for g in load("g1-track-draft-batch-20261124.json")["Tracks"] for r in g["Rows"]}
wave_ids={r["ProblemId"] for r in wave["Items"]}
assert len(wave_ids)==len(wave["Items"])==20
assert not wave_ids.intersection({r["ProblemId"] for r in d["Items"]})
assert not wave_ids.intersection(hints)
def numeric_choice(text):
    f=re.fullmatch(r"\\frac\{(\d+)\}\{(\d+)\}",text)
    if f: return Fraction(int(f[1]),int(f[2]))
    match=re.match(r"^(\d+)(?:\s+\\text\{ [^}]+\}.*)?$",text)
    assert match,text
    return Fraction(int(match[1]))
def expected_from_prompt(q, key):
    values=[int(x) for x in re.findall(r"\d+",q)]
    if key=="primary-subtraction": return values[0]-values[1]
    if key=="primary-multiplication": return values[0]*values[1]
    if key=="primary-perimeter":
        return 4*values[0] if "square" in q.lower() else 2*sum(values)
    if key=="primary-rectangle-area": return values[0]*values[1]
    if key=="primary-addition": return sum(values)
    if key=="primary-one-step-additive-equations": return values[1]-values[0]
    if key=="primary-one-step-multiplicative-equations": return Fraction(values[1],values[0])
    if key=="primary-arithmetic-mean": return Fraction(sum(values),len(values))
    if key=="primary-triangle-area": return Fraction(values[0]*values[1],2)
    if key=="primary-simple-probability":
        assert "fair six-sided die" in q and "even" in q
        return Fraction(sum(i%2==0 for i in range(1,7)),6)
    if key=="primary-multistep-arithmetic": return values[0]+values[1]-values[2]
    raise AssertionError(key)
for row in wave["Items"]:
    c=row["Content"]; g,p=placements[row["ProblemId"]]
    assert row["Status"]=="StructuredAmendmentCandidateNotImported"
    assert row["PrimarySkillKey"]==p["StableKey"]
    assert row["ProposedTrackCode"]==g["Code"]
    assert c["StageId"]==g["StageId"]==1
    assert c["CategoryId"]==p["CategoryId"] and c["PrimarySkillId"]==p["PrimarySkillId"]
    assert c["Question"]=={"Ar":p["ExpectedQuestionAr"],"En":p["ExpectedQuestionEn"]}
    assert pair(row["ExpectedLegacySolution"]) and pair(c["Title"])
    assert len(row["ExpectedOptionIds"])==len(set(row["ExpectedOptionIds"]))==4
    opts=c["Options"]
    expected=expected_from_prompt(c["Question"]["En"],row["PrimarySkillKey"])
    values=[numeric_choice(o["LatexCode"]) for o in opts]
    assert len(opts)==len(set(values))==4
    assert sum(bool(o["IsCorrect"]) for o in opts)==1
    assert all(o["IsCorrect"]==(v==expected) for v,o in zip(values,opts))
    assert all(o["ErrorType"] and pair(o["Reason"]) for o in opts if not o["IsCorrect"])
    assert len(c["Hints"])==2 and all(pair(h) for h in c["Hints"])
    assert all(c["Hints"][0][k]!=c["Hints"][1][k] for k in ("Ar","En"))
    sol=c["Solution"]
    assert sol["FormulaLatex"] and not sol["FormulaLatex"].startswith("$")
    assert all(pair(sol[k]) for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"))
    assert all(numeric_choice(sol["Result"][lang].strip("$"))==expected for lang in ("Ar","En"))
    assert 1<=len(sol["Steps"])<=20 and all(pair(s) for s in sol["Steps"])
print("PASS: 20 additional primary proposals, independently recomputed options, source-matched placement, full bilingual solution and progressive hints")
