"""Contract for the first 16 structured amendments; never imports production."""
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]/"content"/"editorial"
def load(name): return json.loads((ROOT/name).read_text(encoding="utf-8"))
d=load("g1-structured-amendments-wave01-20261124.json")
laws={r["ProblemId"]:r for r in load("g1-short-solution-law-candidates-20261124.json")["Items"]}
hints={r["problemId"]:r for r in load("g1-existing-hint-candidates-20261124.json")["items"]}
assert d["Status"]=="NotImportedNotPublished"
assert len(d["Items"])==len({r["ProblemId"] for r in d["Items"]})==16
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
print("PASS: 16 complete structured amendment proposals, source-bound; no automatic publication")
