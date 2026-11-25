#!/usr/bin/env python3
"""Prepare reviewed-source mapping proposals, not mapping or publication requests."""
import argparse
import json
from pathlib import Path
from prepare_g1_publication_batches import prepare, ROOT, load

def prepare_mapping(root=ROOT):
    _, _, blocked = prepare(root)
    held=set(blocked)
    cleared={r['ProblemId']:r for r in load(root,'g1-taxonomy-clearances-20261125.json')['Items']}
    p=load(root,"g1-primary-grade-placement-20261124.json")
    o=load(root,"g1-remaining-track-placement-20261124.json")
    source={r["ProblemId"]:r for r in p["Items"]+o["Items"]}
    if len(source)!=773:
        raise ValueError("Invalid source inventory")
    tracks=[]
    seen=set()
    for track in o["Tracks"]:
        rows=[source[i] for i in track["ProblemIds"] if i not in held]
        ids={r["ProblemId"] for r in rows}
        if not ids or seen.intersection(ids):
            raise ValueError("Empty or overlapping track mapping")
        if any(r["ProposedTrackCode"]!=track["Code"] or r.get("StageId",1)!=track["StageId"] for r in rows):
            raise ValueError("Track source mismatch")
        if any(r.get('RequiresWordingReview') or (r.get('SkillReview') and r['ProblemId'] not in cleared) for r in rows):
            raise ValueError("Unresolved source review")
        seen.update(ids)
        free=sum(bool(r["FreeCategory"]) for r in rows)
        tracks.append({"StageId":track["StageId"],"Code":track["Code"],
            "Status":"UnpublishedProposal","ProblemCount":len(ids),
            "ProblemIds":sorted(ids),"SkillIds":sorted({r["PrimarySkillId"] for r in rows}),
            "CategoryIds":sorted({r["CategoryId"] for r in rows}),
            "FreeProblems":free,"FreeCoverageBlocked":free==0,
            "ExcludedHeldIds":sorted(held.intersection(track["ProblemIds"])),
            "PublicationApproved":False})
    if len(tracks)!=19 or seen!=set(source)-held or len(seen)!=728:
        raise ValueError("Incomplete mapping")
    # These identities are missing in the source snapshot. Creating them does
    # not publish a track or grant access to a category.
    identities=[
        {"StageId":4,"Code":"numerical-analysis","Kind":"course","NameAr":"التحليل العددي","NameEn":"Numerical Analysis",
         "DescriptionAr":"تقريب الجذور والتكاملات وحل الأنظمة الخطية وتحليل الخطأ.","DescriptionEn":"Approximate roots, integrals and linear systems, and analyze numerical error.","SortOrder":6},
        {"StageId":4,"Code":"mathematical-optimization","Kind":"course","NameAr":"التحسين الرياضي","NameEn":"Mathematical Optimization",
         "DescriptionAr":"دراسة التحدب والقيم المثلى المقيدة وغير المقيدة.","DescriptionEn":"Study convexity and constrained and unconstrained optima.","SortOrder":7}
    ]
    return {"Status":"ProblemLevelPlacementProposalNotApproved","Tracks":tracks},identities

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--output",type=Path,required=True)
    args=ap.parse_args()
    mapping,identities=prepare_mapping()
    args.output.mkdir(parents=True,exist_ok=False)
    for name,value in (("mapping-proposal-728.json",mapping),("missing-draft-identities.json",identities)):
        (args.output/name).write_text(json.dumps(value,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print("19 mapping proposals, 728 eligible IDs, 45 held excluded; two draft identity payloads. No API requests.")

if __name__=="__main__":
    main()
