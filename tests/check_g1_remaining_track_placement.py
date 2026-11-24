import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
load=lambda f: json.loads((root/f).read_text(encoding="utf-8"))
d=load("g1-remaining-track-placement-20261124.json")
p=load(d["PrimarySource"])
q=load("g1-track-review-queue-20261124.json")
source={i:s for s in q["Skills"] for i in s["ProblemIdsForIndividualReview"]}
items=[dict(x,StageId=1) for x in p["Items"]]+d["Items"]
assert len(d["Items"])==582
assert len(items)==len({x["ProblemId"] for x in items})==len(source)==773
assert set(source)=={x["ProblemId"] for x in items}
assert d["Status"]=="ProblemLevelPlacementProposalNotApproved"
for x in items:
    s=source[x["ProblemId"]]
    assert (x["StageId"],x["PrimarySkillId"],x["StableKey"],x["CategoryId"],x["FreeCategory"])==(s["StageId"],s["SkillId"],s["StableKey"],s["CategoryId"],s["FreeCategory"])
    assert x["ExpectedQuestionEn"] and x["ExpectedQuestionAr"]
assert {(t["StageId"],t["Code"]) for t in d["Tracks"]}=={(t["StageId"],t["Code"]) for t in q["Tracks"]}
for t in d["Tracks"]:
    subset=[x for x in items if x["StageId"]==t["StageId"] and x["ProposedTrackCode"]==t["Code"]]
    assert t["ProblemCount"]==len(subset)>0
    assert set(t["ProblemIds"])=={x["ProblemId"] for x in subset}
    assert set(t["SkillIds"])=={x["PrimarySkillId"] for x in subset}
    assert set(t["CategoryIds"])=={x["CategoryId"] for x in subset}
    assert t["FreeProblems"]==sum(x["FreeCategory"] for x in subset)
    assert t["FreeCoverageBlocked"]==(t["FreeProblems"]==0)
    assert t["Status"]=="UnpublishedProposal"
assert sum(t["ProblemCount"] for t in d["Tracks"])==773
assert len([x for x in d["Items"] if x["SkillReview"]])==15
print("PASS: all 773 IDs across 19 baseline track proposals, unchanged Free assignments and explicit review flags")
