#!/usr/bin/env python3
"""Prepare private draft-import previews and a track readiness report; no network or writes to the platform."""
import argparse
import json
from pathlib import Path
from collections import Counter
from prepare_g1_publication_batches import prepare, ROOT, load

WAVES = (
    "g1-gap-wave-01-20261124.json",
    "g1-gap-wave-02-20261124.json",
    "g1-gap-wave-03-20261124.json",
    "g1-primary-early-and-final-grade-gap-20261124.json",
    "g1-grade-depth-wave04-20261125.json",
    "g1-university-depth-wave05-20261125.json",
)

def prepare_new(root=ROOT):
    _, _, held = prepare(root)
    placement = load(root, "g1-remaining-track-placement-20261124.json")
    if placement["Status"] != "ProblemLevelPlacementProposalNotApproved":
        raise ValueError("Unexpected placement state")
    tracks = {t["Code"]: t for t in placement["Tracks"]}
    if len(tracks) != 19:
        raise ValueError("Invalid track inventory")
    if len(placement["Tracks"]) != len(tracks):
        raise ValueError("Duplicate track codes")
    all_ids = [i for t in tracks.values() for i in t["ProblemIds"]]
    if len(all_ids) != len(set(all_ids)) or len(all_ids) != 773:
        raise ValueError("Placement must partition all 773 existing questions")
    if any(t["Status"] != "UnpublishedProposal" or t["ProblemCount"] != len(t["ProblemIds"]) for t in tracks.values()):
        raise ValueError("Invalid track proposal")
    queue = load(root, "g1-track-review-queue-20261124.json")
    skill = {s["StableKey"]: s for s in queue["Skills"]}
    # New course identities must be created as drafts first. Do not mix
    # them into previews that could succeed for the existing identities.
    missing = {t["Code"] for t in queue["Tracks"] if not t["IsExistingDraftIdentity"]}
    if missing != {"numerical-analysis", "mathematical-optimization"}:
        raise ValueError("Unexpected identity prerequisites")
    existing_rows, deferred_rows = [], []
    seen = set()
    additions = Counter()
    for name in WAVES:
        manifest = load(root, name)
        if manifest["Status"] not in ("DraftCandidatesNotPublished", "ReviewedCandidateNotImported"):
            raise ValueError("Not a draft candidate manifest")
        for row in manifest["Items"]:
            key = row["ContentKey"]
            if key in seen or row["ReviewStatus"] != "Draft":
                raise ValueError("Duplicate or non-draft row: "+key)
            seen.add(key)
            c = row["Content"]
            s = skill[row["PrimarySkillKey"]]
            codes = row["ProposedTrackCodes"]
            if (c["StageId"],c["CategoryId"],c["PrimarySkillId"]) != (s["StageId"],s["CategoryId"],s["SkillId"]):
                raise ValueError("Skill source mismatch: "+key)
            if c["TrackIds"] or not codes or len(codes)!=len(set(codes)):
                raise ValueError("Unexpected resolved track IDs or duplicate codes")
            if any(tracks[t]["StageId"]!=s["StageId"] for t in codes):
                raise ValueError("Cross-stage assignment")
            if len(c["Options"])!=4 or sum(o["IsCorrect"] for o in c["Options"])!=1 or len(c["Hints"])!=2:
                raise ValueError("Question shape invalid")
            additions.update(codes)
            payload = {k:row[k] for k in ("ContentKey","PrimarySkillKey","ProposedTrackCodes","Content")}
            (deferred_rows if missing.intersection(codes) else existing_rows).append(payload)
    if len(seen)!=59 or len(existing_rows)!=51 or len(deferred_rows)!=8:
        raise ValueError("Unexpected new candidate inventory")
    def batches(rows):
        return [{"Items":rows[i:i+50], "Confirm":False} for i in range(0,len(rows),50)]
    report=[]
    held_set=set(held)
    for code,t in tracks.items():
        held_ids=sorted(held_set.intersection(t["ProblemIds"]))
        reasons=["PlacementReviewRequired","ContentApprovalRequired"]
        if code in missing: reasons.append("DraftIdentityMissingInSnapshot")
        if t["FreeProblems"]==0: reasons.append("NoFreeCategoryOverlap")
        if held_ids: reasons.append("HistoricalContentReviewRequired")
        report.append({"Code":code,"StageId":t["StageId"],
            "ExistingProblemCount":t["ProblemCount"],"ProposedNewAssignments":additions[code],
            "ExistingFreeProblems":t["FreeProblems"],"HeldProblemIds":held_ids,
            "PublicationBlocked":True,"Reasons":reasons})
    return batches(existing_rows), batches(deferred_rows), report

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--output",type=Path,required=True)
    args=ap.parse_args()
    existing,deferred,report=prepare_new()
    args.output.mkdir(parents=True,exist_ok=False)
    for prefix,items in (("draft-existing-identities",existing),("draft-missing-identities-BLOCKED",deferred)):
        for n,p in enumerate(items,1):
            (args.output/f"{prefix}-{n:02d}.json").write_text(json.dumps(p,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    (args.output/"track-readiness-NOT-APPROVED.json").write_text(json.dumps({"Status":"ReviewOnly","Tracks":report},ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print("51 existing-identity candidates; 8 blocked pending draft track creation; 19 track readiness records. No network or publication.")

if __name__=="__main__":
    main()
