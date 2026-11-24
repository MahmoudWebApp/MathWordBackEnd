import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
d=json.loads((root/"g1-primary-grade-placement-20261124.json").read_text(encoding="utf-8"))
q=json.loads((root/"g1-track-review-queue-20261124.json").read_text(encoding="utf-8"))
source={p:s for s in q["Skills"] if s["StageId"]==1 for p in s["ProblemIdsForIndividualReview"]}
items=d["Items"]
assert len(items)==len({x["ProblemId"] for x in items})==191
assert set(source)=={x["ProblemId"] for x in items}
assert d["Status"]=="ProblemLevelPlacementProposalNotApproved"
for x in items:
    s=source[x["ProblemId"]]
    assert x["PrimarySkillId"]==s["SkillId"] and x["CategoryId"]==s["CategoryId"] and x["StableKey"]==s["StableKey"] and x["FreeCategory"]==s["FreeCategory"]
    assert x["ExpectedQuestionAr"] and x["ExpectedQuestionEn"]
assert {t["Code"] for t in d["Tracks"]}=={f"grade-{i}" for i in range(1,7)}
for t in d["Tracks"]:
    subset=[x for x in items if x["ProposedTrackCode"]==t["Code"]]
    assert set(t["ProblemIds"])=={x["ProblemId"] for x in subset}
    assert set(t["CategoryIds"])=={x["CategoryId"] for x in subset}
    assert set(t["SkillIds"])=={x["PrimarySkillId"] for x in subset}
    assert t["FreeProblems"]==sum(x["FreeCategory"] for x in subset)
    assert t["Status"]=="UnpublishedProposal"
assert {x["ProblemId"] for x in items if x["ProposedTrackCode"]=="grade-1"}=={3,7,1680}
print("PASS: 191 primary problem-level placements, six unpublished grades, original Free flags")
