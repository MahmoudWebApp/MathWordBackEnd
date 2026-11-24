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
            if proposal and proposal["sourceSha256"] == digest(row):
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
