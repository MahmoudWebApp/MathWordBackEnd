"""Read-only comparison of a JSON Lines bank export with the G1-06 review evidence."""
import argparse
from collections import Counter
import csv
import hashlib
import json
from pathlib import Path

from check_numeric_family_answers import ROOT, audit


def objects(value):
    if isinstance(value, dict):
        yield value
        for child in value.values():
            yield from objects(child)
    elif isinstance(value, list):
        for child in value:
            yield from objects(child)


def historical_evidence():
    prompts = set()
    solutions = set()
    folders = [ROOT / "content/batches", ROOT / "content/editorial", ROOT / "docs/review-data"]
    for folder in folders:
        for path in folder.glob("*.json"):
            # Compare against the prior files independently verified by the curriculum workflow.
            if not any(date in path.name for date in ("20261121", "20261122", "20261123")):
                continue
            for entry in objects(json.loads(path.read_text(encoding="utf-8"))):
                row = {key.lower(): value for key, value in entry.items()}
                if row.get("afterar") and row.get("afteren"):
                    solutions.add((row["afterar"], row["afteren"]))
                ar = row.get("questiontextar") or row.get("questionar")
                en = row.get("questiontexten") or row.get("questionen")
                opts = row.get("options")
                if ar and en and isinstance(opts, list) and len(opts) == 4:
                    choices = []
                    for opt in opts:
                        if not isinstance(opt, dict):
                            break
                        values = {key.lower(): v for key, v in opt.items()}
                        if not isinstance(values.get("latexcode"), str) or type(values.get("iscorrect")) is not bool:
                            break
                        choices.append((values["latexcode"], values["iscorrect"]))
                    if len(choices) == 4:
                        prompts.add((ar, en, tuple(sorted(choices))))
    return prompts, solutions


def digest(row):
    content = [row["a"], row["q"], [choice for choice, _ in row["opts"]]]
    data = json.dumps(content, ensure_ascii=False, separators=(",", ":"))
    return hashlib.sha256(data.encode()).hexdigest()


# Exact post-correction production fingerprints, read back on 2026-11-24.
# Values pair the full prompt/choice fingerprint with the unchanged one-based key.
# The frozen source evidence remains intact; unreviewed changes must still fail.
REVIEWED_CORRECTIONS = {
    23: ("b04a4767ff770bd890d01b09bd297c4856965aab6844aa8525643d898697775e", 1),
    145: ("4b921d7b39340e8af9eb886e453e4f155b52eedae4cacb31c8faa0181cf68a44", 4),
    340: ("70a46b7dbdd029a0ebe4b0d7b1d7ee3777ac08cfa556a1be3593fb396b5591ec", 2),
    352: ("a1e424661b90590ee841fabecadebdaa766604f2c5f06a77e2353e0b78d3a785", 1),
    364: ("a50ce9b8e6b1cab12af938e5b44f22983b6dc9d34b49615cc7372f82a6ed85a3", 4),
    376: ("0e16f525eecb72fefb662d05a04288ba5ff343c044e58a73a678682592b472f1", 3),
    388: ("bdb535388d650a6e3b5c5b57ec2dde65f4d60aa94f60d524578df4db9ee07279", 2),
    512: ("f23b8a51cb6d3ef839632154fe1e88b238e684dbdfad1db3451906c95e75ba7e", 2),
    800: ("76ae2d999e3a3d7b076b12379916a22c3022916ae7381cb7225778691dd2be18", 1),
    818: ("ec46fe6fffd491f2d607a9e958e49d4e45c832732686ec1627c075cd2679f061", 2),
    851: ("effac31e08e86490c7d1e468d8cb2817b50a89210755d11ac385cf5879bea5ed", 2),
}


def verify(path):
    prompts, solutions = historical_evidence()
    review_data = ROOT / "docs/review-data"
    with (review_data / "g1-legacy-answer-review-20261124.tsv").open(encoding="utf-8") as file:
        reviews = {int(r["problem_id"]): r for r in csv.DictReader(file, delimiter="\t")}
    proposals = json.loads((review_data / "g1-published-wording-proposals-20261124.json").read_text(encoding="utf-8"))
    by_id = {r["problemId"]: r for r in proposals["items"]}
    held = []
    hint_path = ROOT / "content/editorial/g1-existing-hint-candidates-20261124.json"
    hint_candidates = json.loads(hint_path.read_text(encoding="utf-8"))["items"]
    hints_by_id = {r["problemId"]: r for r in hint_candidates}
    if len(hints_by_id) != len(hint_candidates):
        raise ValueError("Duplicate hint candidate ID")
    counts = Counter()
    seen = set()
    problems = []
    with path.open(encoding="utf-8") as stream:
        for line in stream:
            if not line.strip():
                continue
            row = json.loads(line)
            pid = row["id"]
            if pid in seen:
                raise ValueError(f"Duplicate ID {pid}")
            seen.add(pid)
            opts = row["opts"]
            if (len(opts) != 4 or any(type(flag) is not bool for _, flag in opts)
                    or sum(flag for _, flag in opts) != 1):
                problems.append((pid, "Invalid option set"))
                continue
            if (row.get("sa"), row.get("sol")) in solutions:
                counts["Reviewed solution pair matched"] += 1
            if candidate := hints_by_id.get(pid):
                pair = candidate["Hints"]
                source_matches = (candidate["question"] == {"Ar": row["a"], "En": row["q"]}
                                  and candidate["primarySkillKey"] == row["sk"])
                if (not source_matches or len(pair) != 2
                        or any(not hint[lang].strip() for hint in pair for lang in ("Ar", "En"))
                        or any(pair[0][lang].strip() == pair[1][lang].strip() for lang in ("Ar", "En"))):
                    problems.append((pid, "Hint candidate needs review against this source"))
                else:
                    counts["Source-matched bilingual hint pairs"] += 1
            proposal = by_id.get(pid)
            correction = REVIEWED_CORRECTIONS.get(pid)
            corrected = (correction is not None
                         and correction[0] == digest(row)
                         and opts[correction[1] - 1][1])
            if corrected:
                counts["Exact reviewed applied wording corrections"] += 1
            elif proposal and proposal["sourceSha256"] == digest(row):
                counts["Published items with wording proposals"] += 1
                if proposal["blocksAnswerAcceptance"]:
                    held.append(pid)
            elif proposal:
                problems.append((pid, "Wording proposal needs a fresh source review"))
            matched, _, mismatches = audit([row])
            if mismatches:
                problems.append((pid, "Recomputed key differs"))
            elif matched:
                counts["Recomputed from prompt"] += 1
            elif corrected:
                counts["Applied correction key matches independent review"] += 1
            elif (row["a"], row["q"], tuple(sorted(map(tuple, opts)))) in prompts:
                counts["Both prompts and all flagged choices match archive"] += 1
            elif pid in reviews and reviews[pid]["content_sha256"] == digest(row):
                position = int(reviews[pid]["expected_choice"])
                if position == 0:
                    counts["Reviewed, no exact choice as written"] += 1
                elif opts[position - 1][1]:
                    counts["Reviewed ledger key matches"] += 1
                else:
                    problems.append((pid, "Reviewed choice differs from key"))
            else:
                problems.append((pid, "New or changed item requires review"))
    # A partial export cannot stand in for the frozen November 24 inventory.
    id_list = ",".join(map(str, sorted(seen))).encode()
    if hashlib.sha256(id_list).hexdigest() != "0f28a6bd82864be5f299903e5b77e63b54dffdeb5abfbece65dfd33d3384e2d7":
        problems.append(("inventory", "Published IDs differ from the reviewed 773-item snapshot"))
    print(f"Read {len(seen)} unique published IDs")
    for label, total in sorted(counts.items()):
        print(f"{label}: {total}")
    for pid, reason in problems:
        print(f"#{pid}: {reason}")
    if not seen:
        raise ValueError("Empty bank export")
    if held:
        print("Answer acceptance held for published IDs:", ", ".join(map(str, sorted(held))))
    if problems:
        return 1
    return 2 if held else 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("snapshot", type=Path)
    raise SystemExit(verify(parser.parse_args().snapshot))
