#!/usr/bin/env python3
"""Reconcile G1 repository candidates against local read-only production exports."""
import argparse
from collections import Counter, defaultdict
from hashlib import md5
import json
from pathlib import Path
import re
import sys
import unicodedata

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from prepare_g1_new_content import WAVES
from prepare_g1_publication_batches import ROOT, load, prepare


def signature(*fields):
    parts = [str(field) for field in fields]
    if any("\x1f" in part for part in parts):
        raise ValueError("Source contains the fingerprint separator")
    return md5("\x1f".join(parts).encode(), usedforsecurity=False).hexdigest()


def source_differences(row, live):
    c = row["Content"]
    _, source, legacy, options, skills, _, _, _, _ = live
    differences = []
    if source != signature(c["StageId"], c["CategoryId"], c["Points"],
                           c["Title"]["Ar"], c["Title"]["En"],
                           c["Question"]["Ar"], c["Question"]["En"]):
        differences.append("ImmutableQuestionChanged")
    expected_options = [
        [option_id, signature(o["LatexCode"]), o["IsCorrect"]]
        for option_id, o in zip(row["ExpectedOptionIds"], c["Options"], strict=True)
    ]
    if options != expected_options:
        differences.append("OptionIdentityValueOrOrderChanged")
    if skills != [[c["PrimarySkillId"], row["PrimarySkillKey"], True]]:
        differences.append("PrimarySkillChanged")
    if legacy != signature(row["ExpectedLegacySolution"]["Ar"], row["ExpectedLegacySolution"]["En"]):
        differences.append("LegacySolutionChanged")
    return differences


def normalized(text):
    return re.sub(r"\s+", " ", unicodedata.normalize("NFKC", text).strip()).lower()


def reconcile(audit, inventory, known):
    _, batches, held_ids = prepare()
    candidates = [item for batch in batches for item in batch["Items"]]
    problems = {r[0]: r for r in audit["p"]}
    drafts = {r[0]: r for r in audit["d"]}
    if not problems or len(problems) != len(audit["p"]) or len(drafts) != len(audit["d"]):
        raise ValueError("Missing problems or duplicate snapshot identities")
    by_source = defaultdict(list)
    for draft in drafts.values():
        if draft[1] is not None and draft[3] not in ("Published", "Withdrawn"):
            by_source[draft[1]].append(draft)

    amendments = []
    for row in candidates:
        pid = row["ProblemId"]
        draft = drafts.get(f"g1-amend-{pid}")
        live = problems.get(pid)
        differences = source_differences(row, live) if live else ["ProblemMissing"]
        matching_publication = bool(live and draft and draft[1:4] == [pid, pid, "Published"]
                                    and live[5] is True and live[6] >= 2)
        if matching_publication:
            # Publishing replaces the legacy solution with the flattened solution.
            differences = [d for d in differences if d != "LegacySolutionChanged"]
        elif live and live[5] is True:
            differences.append("OtherStructuredContentRequiresReview")
        if len(by_source[pid]) > 1 or any(d != draft for d in by_source[pid]):
            differences.append("ConflictingOpenDraft")
        if draft and (draft[1] != pid or draft[3] in ("Published", "Withdrawn") and not matching_publication):
            differences.append("ExistingDraftRequiresReview")
        status = ("ReviewConflict" if differences else "PublishedWithStructuredMetadata"
                  if matching_publication else "OpenDraft" if draft else "NoMatchingDraft")
        amendments.append({
            "ProblemId": pid, "State": status, "DraftId": draft[5] if draft else None,
            "DraftStatus": draft[3] if draft else None, "Revision": draft[4] if draft else None,
            "HasTrackMapping": bool(live and live[7]), "Differences": differences,
        })

    hold_rows = [row for name in ("g1-model-assumption-holds-20261125.json",
                                  "g1-original-holds-structured-review-20261125.json")
                 for row in load(ROOT, name)["Items"] if row["ProblemId"] in held_ids]
    if sorted(r["ProblemId"] for r in hold_rows) != held_ids:
        raise ValueError("Held review files no longer match the exclusion list")
    holds = []
    for row in hold_rows:
        pid = row["ProblemId"]
        live = problems.get(pid)
        wording = "ProposedQuestion" in row and not {"ClassificationProposal", "OptionLocalization"} & row.keys()
        holds.append({
            "ProblemId": pid,
            "Kind": "Wording" if wording else "OptionsOrClassification",
            "SourceDifferences": source_differences(row, live) if live else ["ProblemMissing"],
            "HasAttemptOrProgress": live[8] if live else None,
            "OpenDraftIds": [d[5] for d in by_source[pid]],
        })

    signatures = {lang: {normalized(q[lang]) for q in known} for lang in ("Ar", "En")}
    if not signatures["Ar"] or not inventory:
        raise ValueError("Missing known questions or current taxonomy")
    slots = {(r["track"], r["categoryId"]): r for r in inventory}
    new = []
    for row in (item for name in WAVES for item in load(ROOT, name)["Items"]):
        c = row["Content"]
        required_skill = {"id": c["PrimarySkillId"], "key": row["PrimarySkillKey"]}
        unlinked = []
        for code in row["ProposedTrackCodes"]:
            slot = slots.get((code, c["CategoryId"]))
            if not slot or slot["stage"] != c["StageId"] or required_skill not in slot["skills"]:
                unlinked.append(code)
        draft = drafts.get(row["ContentKey"])
        new.append({
            "ContentKey": row["ContentKey"],
            "ExistingDraftStatus": draft[3] if draft else None,
            "ExistingDraftId": draft[5] if draft else None,
            "ExactQuestionMatchLanguages": [lang for lang, values in signatures.items()
                                            if normalized(c["Question"][lang]) in values],
            "UnlinkedTracks": unlinked,
        })
    return {
        "Amendments": amendments, "Holds": holds, "New": new,
        "Summary": {
            "LiveProblems": len(problems),
            "TrackAssignments": sum(r[7] for r in problems.values()),
            "AmendmentStates": dict(Counter(r["State"] for r in amendments)),
            "AmendmentDraftStatuses": dict(Counter(r["DraftStatus"] for r in amendments if r["DraftStatus"])),
            "NoMappedTrackAmendments": sum(not r["HasTrackMapping"] for r in amendments),
            "HoldKinds": dict(Counter(r["Kind"] for r in holds)),
            "WordingWithAttemptOrProgress": sum(r["Kind"] == "Wording" and r["HasAttemptOrProgress"] is True
                                                for r in holds),
            "NewWithExistingKey": sum(r["ExistingDraftId"] is not None for r in new),
            "NewWithExactQuestionMatch": sum(bool(r["ExactQuestionMatchLanguages"]) for r in new),
            "NewWithUnlinkedTracks": sum(bool(r["UnlinkedTracks"]) for r in new),
            "NewCandidates": len(new),
        },
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("audit", "inventory", "known", "output"):
        parser.add_argument("--" + name, type=Path, required=True)
    args = parser.parse_args()
    read = lambda path: json.loads(path.read_text(encoding="utf-8"))
    result = reconcile(read(args.audit), read(args.inventory), read(args.known))
    with args.output.open("x", encoding="utf-8") as report:
        json.dump(result, report, ensure_ascii=False, indent=2)
        report.write("\n")
    print(json.dumps(result["Summary"], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
