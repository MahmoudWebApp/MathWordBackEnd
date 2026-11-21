#!/usr/bin/env python3
"""Read-only contract checks for the adaptable MathWorld curriculum draft.

No Postgres connection or production writes. Every existing problem keeps its
historical ID until a human-reviewed migration plan is approved.
"""
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CATALOG = ROOT / "content/catalog/international-mathworld-taxonomy-v2.json"
CROSSWALK = ROOT / "content/catalog/existing-problems-crosswalk-v2.json"

def read(path):
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)

def validate():
    taxonomy, crosswalk = read(CATALOG), read(CROSSWALK)
    assert taxonomy["schema_version"] == "2.0.0"
    assert taxonomy["status"].startswith("proposed_not_published")
    assert crosswalk["status"] == "read_only_heuristic_crosswalk_not_applied"
    assert "question_count" in taxonomy["target"]
    assert isinstance(taxonomy["target"]["question_count"], str)
    assert isinstance(taxonomy["target"]["category_count"], str)

    stages = taxonomy["stage_levels"]
    stage_ids = [stage["stage_id"] for stage in stages]
    assert len(stage_ids) == len(set(stage_ids))
    assert len(stages) == crosswalk["source_database"]["stage_count"]
    keys = {}
    for stage in stages:
        categories = stage["categories"]
        assert stage["category_count"] == len(categories)
        assert [c["order"] for c in categories] == list(range(1, len(categories) + 1))
        assert len({c["name_ar"] for c in categories}) == len(categories)
        assert len({c["name_en"] for c in categories}) == len(categories)
        for category in categories:
            key = category["stable_key"]
            assert key not in keys, f"Duplicate taxonomy key: {key}"
            keys[key] = stage["stage_id"]
            assert category["name_ar"].strip() and category["name_en"].strip()
            assert category["publication_status"] == "editorial_proposal"
            skills = category["skill_keys"]
            assert skills and len(skills) == len(set(skills)), key

    items = crosswalk["problem_mapping"]
    seen = set()
    for item in items:
        pid = item["problem_id"]
        assert isinstance(pid, int) and pid > 0 and pid not in seen, pid
        seen.add(pid)
        assert item["proposed_category_key"] in keys
        assert keys[item["proposed_category_key"]] == item["stage_id"], pid
        assert item["review_status"] == "needs_subject_expert_review"
    assert len(items) == crosswalk["source_database"]["problem_count"]
    assert len({item["old_category_id"] for item in items}) == crosswalk["source_database"]["category_count"]
    assert sum(s["categories"] for s in crosswalk["new_taxonomy_category_counts"]) == len(keys)

    by_old = Counter((item["old_category_id"], item["proposed_category_key"]) for item in items)
    for old in crosswalk["old_category_distribution"]:
        for dest in old["proposed_destinations"]:
            assert by_old[(old["old_category_id"], dest["new_category_key"])] == dest["existing_problems"]
    for duplicate in crosswalk["duplicate_exact_question_flags"]:
        assert all(pid in seen for pid in duplicate["problem_ids"])

    quality = taxonomy["quality_policy"]
    assert len(quality["practice_dimensions"]) >= 4
    assert len(quality["duplicate_checks"]) >= 4
    assert "no fixed" in quality["question_count_policy"].lower()
    print(
        "PASS: adaptive international curriculum, "
        f"{len(stages)} stages, {len(keys)} distinct proposed subjects, "
        f"{len(seen)} unique reviewed-pending problem IDs; no writes"
    )

if __name__ == "__main__":
    validate()
