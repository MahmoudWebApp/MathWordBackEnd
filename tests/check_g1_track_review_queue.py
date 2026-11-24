"""Validate saved read-only review queue; no database changes."""
import json
from pathlib import Path
from collections import Counter
ROOT=Path(__file__).resolve().parents[1]
d=json.loads((ROOT/"content/editorial/g1-track-review-queue-20261124.json").read_text(encoding="utf-8"))
assert d["Status"]=="ReviewQueueNotApprovedNotImported"
skills=d["Skills"]; tracks=d["Tracks"]
assert len(skills)==140 and len({s["SkillId"] for s in skills})==140
assert len({s["CategoryId"] for s in skills})==35
ids=[p for s in skills for p in s["ProblemIdsForIndividualReview"]]
assert len(ids)==len(set(ids))==773
assert Counter(s["StageId"] for s in skills)=={1:37,2:33,3:35,4:35}
assert len(tracks)==19 and sum(t["IsExistingDraftIdentity"] for t in tracks)==17
for t in tracks:
    selected=[s for s in skills if t["Code"] in s["ProposedTrackCodes"]]
    assert selected and all(s["StageId"]==t["StageId"] for s in selected)
    assert t["RequiresProblemLevelReview"] is True
    assert t["CandidateSkills"]==len(selected)
    assert t["CandidateProblems"]==sum(len(s["ProblemIdsForIndividualReview"]) for s in selected)
    free=sum(len(s["ProblemIdsForIndividualReview"]) for s in selected if s["CategoryId"] in d["FreeCategoryIds"][str(s["StageId"])])
    assert t["CandidateFreeProblems"]==free and t["FreeCoverageBlocked"]==(free==0)
    assert all(s["FreeCategory"]==(s["CategoryId"] in d["FreeCategoryIds"][str(s["StageId"])]) for s in selected)
print("PASS: 140 skills, 773 distinct review candidates, 19 proposed tracks, Free gates preserved")
