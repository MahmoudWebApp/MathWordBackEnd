import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content/editorial"
held=json.loads((root/"g1-structured-amendments-held-20261124.json").read_text(encoding="utf-8"))
assert held["Status"]=="HeldNotImportable"
assert {r["ProblemId"] for r in held["Items"]}=={20,649,706,707}
laws={r["ProblemId"]:r for r in json.loads((root/"g1-short-solution-law-candidates-20261124.json").read_text(encoding="utf-8"))["Items"]}
for r in held["Items"]:
    c=r["Content"]; l=laws[r["ProblemId"]]
    assert r["Status"]=="HeldStructuredCandidateNotImportable" and r["HoldReason"]
    assert c["Question"]=={"Ar":l["ExpectedQuestionAr"],"En":l["ExpectedQuestionEn"]}
    assert r["ExpectedLegacySolution"]=={"Ar":l["ExpectedSolutionAr"],"En":l["ExpectedSolutionEn"]}
    assert len(c["Options"])==len(set(r["ExpectedOptionIds"]))==4
    assert [o["LatexCode"] for o in c["Options"] if o["IsCorrect"]]==[l["ExpectedCorrectOption"]]
    assert all(o["Reason"]["Ar"] and o["Reason"]["En"] for o in c["Options"] if not o["IsCorrect"])
    assert len(c["Hints"])==2 and c["Solution"]["FormulaLatex"]
    for k in ("Idea","Substitution","Result","Unit","Verification","CommonError"):
        assert c["Solution"][k]["Ar"] and c["Solution"][k]["En"]
    if r["ProblemId"] in (706,707):
        assert "independence" in c["Solution"]["Result"]["En"]
print("PASS: four complete but explicitly held structured candidates; not eligible for draft payload import")
