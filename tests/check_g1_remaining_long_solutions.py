import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content/editorial"
doc=json.loads((root/"g1-remaining-long-solution-review-20261124.json").read_text(encoding="utf-8"))
rows=doc["Items"]
assert len(rows)==len({r["ProblemId"] for r in rows})==81
assert {r["ProblemId"] for r in rows if r["Disposition"]=="AssumptionOrWordingHold"}=={7,10,26,705,708}
short=json.loads((root/"g1-short-solution-law-candidates-20261124.json").read_text(encoding="utf-8"))["Items"]
assert not {r["ProblemId"] for r in rows}.intersection(r["ProblemId"] for r in short)
for r in rows:
    assert r["ReviewNote"]
    assert len(r["ExpectedOptions"])==4
    assert sum(o[2] for o in r["ExpectedOptions"])==1
    for lang in ("Ar","En"):
        assert r["Question"][lang] and r["ExpectedSolution"][lang]
        if r["ProposedSolution"]: assert r["ProposedSolution"][lang]
    if r["Disposition"]=="ExistingExplanationAdequateInDeskReview":
        assert r["ProposedSolution"] is None
    else:
        assert r["ProposedSolution"] is not None
print("PASS: 81 source-bound longer-solution desk reviews, 5 explicit wording holds")
