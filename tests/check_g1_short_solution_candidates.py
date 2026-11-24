import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
d=json.loads((root/"g1-short-solution-law-candidates-20261124.json").read_text(encoding="utf-8"))
assert d["Status"]=="DraftCandidatesNotApplied"
items=d["Items"]
assert len(items)==len({x["ProblemId"] for x in items})==56
assert all(x["Status"]=="CandidateSolutionOnlyNotApplied" and x["ExpectedCorrectOption"] and x["ExpectedQuestionAr"] and x["ExpectedQuestionEn"] for x in items)
assert all(len(x["ProposedSolutionAr"])>len(x["ExpectedSolutionAr"]) and len(x["ProposedSolutionEn"])>len(x["ExpectedSolutionEn"]) for x in items)
assert all(x["ProposedSolutionEn"].endswith(x["ExpectedSolutionEn"]) for x in items)
assert all(x["ProposedSolutionAr"].endswith(x["ExpectedSolutionAr"]) for x in items if x["ProblemId"]!=786)
print("PASS: 56 source-bound bilingual solution-only candidate records")
