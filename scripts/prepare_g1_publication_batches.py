#!/usr/bin/env python3
"""Build offline preview payloads; no network, credentials, approval or database writes."""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1] / "content" / "editorial"

def load(root, name):
    return json.loads((root / name).read_text(encoding="utf-8"))

def prepare(root=ROOT):
    canonical = load(root, "g1-existing-hint-candidates-20261124.json")["items"]
    separate = load(root, "g1-hint-held-review-20261124.json")
    if separate["status"] != "HeldNotImportable":
        raise ValueError("Invalid held inventory")
    all_hints = canonical + separate["items"]
    by_id = {r["problemId"]: r for r in all_hints}
    if len(all_hints) != 773 or len(by_id) != 773:
        raise ValueError("Incomplete or duplicate hint inventory")
    if any(r.get("taxonomyReviewPending") is not True for r in separate["items"]):
        raise ValueError("Unblocked separate hold")
    held = {r["problemId"] for r in all_hints if r.get("taxonomyReviewPending")}
    if len(held) != 41:
        raise ValueError("Unexpected hold count")
    clearances = load(root, "g1-taxonomy-clearances-20261125.json")
    assert clearances["Status"] == "ReviewedTaxonomyOnlyNoSourceMutation"
    cleared = clearances["Items"]
    assert len(cleared) == 6 and {r["ProblemId"] for r in cleared} == {212,224,236,248,260,1633}
    for r in cleared:
        i = r["ProblemId"]
        h = by_id[i]
        if i not in held or h.get("ProposedQuestion") or r["StableKey"] != h["primarySkillKey"] or h["question"] != {"Ar":r["ExpectedQuestionAr"],"En":r["ExpectedQuestionEn"]}:
            raise ValueError("Invalid taxonomy clearance")
        held.remove(i)
    assert len(held) == 35
    model_holds = load(root, "g1-model-assumption-holds-20261125.json")
    assert model_holds["Status"] == "HeldNotImportable"
    assert len(model_holds["Items"]) == 12
    for r in model_holds["Items"]:
        i = r["ProblemId"]
        h = by_id[i]
        if i in held or r["Status"] != "HeldStructuredCandidateNotImportable" or r["PrimarySkillKey"] != h["primarySkillKey"] or r["Content"]["Question"] != h["question"] or not all(r["ProposedQuestion"][lang].strip() for lang in ("Ar","En")):
            raise ValueError("Invalid model-assumption hold")
        held.add(i)
    assert len(held) == 47
    full = []
    for wave in range(1, 18):
        manifest = load(root, f"g1-structured-amendments-wave{wave:02d}-20261124.json")
        if manifest["Status"] != "NotImportedNotPublished":
            raise ValueError("Unexpected amendment status")
        full += manifest["Items"]
    if len(full)!=726 or len({r["ProblemId"] for r in full})!=726:
        raise ValueError("Invalid combined amendment inventory")
    full=[r for r in full if r["ProblemId"] not in held]
    reserved = {r["ProblemId"] for r in full}
    if len(full) != 726 or len(reserved) != 726 or reserved & held:
        raise ValueError("Invalid full-amendment inventory")
    for r in full:
        h = by_id[r["ProblemId"]]
        if (r["Status"] != "StructuredAmendmentCandidateNotImported"
            or len(r["Content"]["Hints"]) != 2
            or r["Content"]["Question"] != h["question"]
            or r["PrimarySkillKey"] != h["primarySkillKey"]):
            raise ValueError("Amendment/hint conflict")
    only = []
    for i, h in sorted(by_id.items()):
        if i in held or i in reserved:
            continue
        if len(h["Hints"]) != 2:
            raise ValueError("Expected two hints")
        only.append({"ProblemId": i, "PrimarySkillKey": h["primarySkillKey"],
                     "Question": h["question"], "Hints": h["Hints"],
                     "TaxonomyReviewPending": False})
    if len(only) != 0:
        raise ValueError("Unexpected hint-only count")
    def batches(rows):
        return [{"Items": rows[i:i+50], "Confirm": False} for i in range(0,len(rows),50)]
    return batches(only), batches(sorted(full, key=lambda r:r["ProblemId"])), sorted(held)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True,
                        help="New directory for private preview JSON; do not serve publicly")
    args = parser.parse_args()
    hints, amendments, held = prepare()
    args.output.mkdir(parents=True, exist_ok=False)
    for prefix, batches in (("hints",hints),("amendments",amendments)):
        for n, payload in enumerate(batches,1):
            (args.output/f"{prefix}-{n:02d}.json").write_text(
                json.dumps(payload,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    (args.output/"held-ids.json").write_text(json.dumps(held)+"\n",encoding="utf-8")
    print("0 hint-only + 15 amendment preview payloads; 47 excluded; no network requests.")

if __name__ == "__main__":
    main()
