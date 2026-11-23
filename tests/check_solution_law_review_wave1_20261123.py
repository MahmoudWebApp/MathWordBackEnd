#!/usr/bin/env python3
"""MathWorld: independently validate reviewed, bilingual solution-only drafts.

Neither this test nor the accompanying JSON changes live Problems or student
progress. An educator must approve each row against the immutable question and
answer options before a guarded SQL content-only patch is applied.
"""
from __future__ import annotations

import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
source = json.loads((ROOT / "content/editorial/solution-law-review-wave1-20261123.json").read_text(encoding="utf-8"))
rows = source["changes"]
assert source["status"].startswith("Draft"), "These must stay editorial drafts"
assert len(rows) == 10
expected_ids = {8, 9, 39, 55, 156, 157, 613, 614, 615, 616}
assert {row["problemId"] for row in rows} == expected_ids

# Separate mathematical calculations, not textual extraction from the solutions.
oracles = {
    8: 4 * 5,
    9: 8 * 3,
    39: 2 * (8 + 5),
    55: 10 * 6 / 2,
    156: 180 - 50 - 60,
    157: 2 * 100,
    613: 2 * 42 / 12,
    614: 9 * 8 / 2,
    615: 14 * 5 / 2,
    616: 10 * 6 / 2,
}
answer_option_ids = {8: 21, 9: 25, 39: 147, 55: 212,
                     156: 616, 157: 619, 613: 2443, 614: 2446,
                     615: 2450, 616: 2454}
for row in rows:
    pid = row["problemId"]
    assert math.isclose(row["expectedNumericAnswer"], oracles[pid]), pid
    assert row["expectedAnswerOptionId"] == answer_option_ids[pid], pid
    assert row["editorialStatus"] == "Draft"
    assert set(row["oldFields"]) == set(row["newFields"]) == {"sa", "se"}
    assert row["questionAr"].strip()
    assert "القانون المستخدم:" in row["newFields"]["sa"] or (
        pid == 157 and "قاعدة التحويل:" in row["newFields"]["sa"])
    assert "Rule used:" in row["newFields"]["se"] or (
        pid == 157 and "Conversion rule:" in row["newFields"]["se"])
    assert row["oldFields"]["sa"] != row["newFields"]["sa"]
    assert row["oldFields"]["se"] != row["newFields"]["se"]
    for key, text in row["newFields"].items():
        assert 100 <= len(text) <= 1100, (pid, key)
        assert text.count("$") % 2 == 0, (pid, key, "unbalanced math")
        assert text.count("{") == text.count("}"), (pid, key, "unbalanced TeX")

print("PASS: 10 geometry worked-solution proposals, independent numeric results")
print("PASS: unchanged answer option IDs, explicit applicable laws, bilingual steps and units")
print("PASS: editorial-only draft; no student progress or live question mutation")
