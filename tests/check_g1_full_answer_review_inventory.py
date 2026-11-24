"""Reconcile the five recorded read-only answer-review manifests with the saved catalog inventory.
This checks inventory coverage, not mathematical correctness or editorial approval.
"""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]/"content"/"editorial"
names=["repeated-template-oracle","primary-distinct-answer","middle-distinct-answer","secondary-distinct-answer","university-distinct-answer"]
reports=[json.loads((root/f"g1-{name}-review-20261124.json").read_text(encoding="utf-8")) for name in names]
rows=[r for report in reports for r in report["Results"]]
assert len(rows)==773 and len({r["id"] for r in rows})==773
queue=json.loads((root/"g1-track-review-queue-20261124.json").read_text(encoding="utf-8"))
catalog={p for skill in queue["Skills"] for p in skill["ProblemIdsForIndividualReview"]}
assert len(catalog)==773 and catalog=={r["id"] for r in rows}
for report in reports:
    assert sum(report["Counts"].values())==len(report["Results"])
assert sum(r["status"]=="MARKED_ANSWER_MATCHES" for r in rows)==758
flags=[r for r in rows if r["status"]!="MARKED_ANSWER_MATCHES"]
assert len(flags)==15
assert all(r["status"].startswith(("CORRECT_","MATCHES_STANDARD_")) for r in flags)
print("PASS: 773 distinct reviewed answer IDs match the saved catalog inventory; 758 supported matches, 15 documented assumptions")
