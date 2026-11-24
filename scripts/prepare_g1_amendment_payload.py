#!/usr/bin/env python3
"""Offline preparation of an editorial amendment PUT body, never a publish call.

Input is a fresh Draft response from POST /api/editorial/problems/amend/{id}
and a reviewed source-bound manifest. No network, credentials or DB access.
"""
import argparse
import copy
import json
from pathlib import Path

def prepare(manifest, draft):
    if manifest.get("Status") != "NotImportedNotPublished":
        raise ValueError("Expected a source-bound candidate manifest")
    if draft.get("Status") != "Draft" or draft.get("Revision") != 0:
        raise ValueError("Only an untouched amendment draft may be prepared")
    matches=[r for r in manifest["Items"] if r["ProblemId"]==draft.get("SourceProblemId")]
    if len(matches)!=1:
        raise ValueError("Missing or duplicate source candidate")
    row=matches[0]
    if row.get("Status")!="StructuredAmendmentCandidateNotImported":
        raise ValueError("Candidate status invalid")
    old=draft["Content"]; new=row["Content"]
    for key in ("StageId","CategoryId","PrimarySkillId","Points","Title","Question"):
        if old.get(key)!=new.get(key):
            raise ValueError("Source changed: "+key)
    for lang in ("Ar","En"):
        if draft.get("LegacySolution"+lang)!=row["ExpectedLegacySolution"][lang]:
            raise ValueError("Source solution changed: "+lang)
    def immutable_options(c):
        return [(o["LatexCode"],o["IsCorrect"]) for o in c["Options"]]
    if immutable_options(old)!=immutable_options(new):
        raise ValueError("Source options changed")
    if len(immutable_options(old))!=4 or sum(o["IsCorrect"] for o in old["Options"])!=1:
        raise ValueError("Source option count invalid")
    # Do not overwrite an already structured explanation or approved metadata.
    # Its preservation/review is a separate explicit decision.
    if old.get("Solution") is not None or old.get("Hints"):
        raise ValueError("Existing structured content requires manual merge")
    if any(o.get("ErrorType") or o.get("Reason") for o in old["Options"]):
        raise ValueError("Existing distractor metadata requires manual merge")
    body=copy.deepcopy(old)
    for key in ("Options","Hints","Solution"):
        body[key]=copy.deepcopy(new[key])
    # Existing TrackIds/SecondarySkillIds/DifficultyLevel remain unchanged.
    # A track-less legacy draft still needs an approved track before submit.
    return {"Revision":draft["Revision"],"Content":body}

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--manifest",type=Path,required=True)
    ap.add_argument("--draft",type=Path,required=True)
    ap.add_argument("--output",type=Path,required=True)
    args=ap.parse_args()
    load=lambda path:json.loads(path.read_text(encoding="utf-8"))
    body=prepare(load(args.manifest),load(args.draft))
    with args.output.open("x",encoding="utf-8") as f:
        json.dump(body,f,ensure_ascii=False,indent=2); f.write("\n")
    print("Draft PUT body only; no API request or publication performed.")
    if not body["Content"].get("TrackIds"):
        print("Submission remains blocked until an appropriate track is reviewed.")
if __name__=="__main__":
    main()
