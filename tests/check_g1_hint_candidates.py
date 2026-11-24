"""Validate the source-bound published-question hint proposal file."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
items = json.loads((ROOT / "content/editorial/g1-existing-hint-candidates-20261124.json").read_text(encoding="utf-8"))["items"]
ids = [row["problemId"] for row in items]
assert len(ids) == len(set(ids)) == 28
assert {row["problemId"] for row in items if row.get("taxonomyReviewPending")} == {1566, 1578}
assert {23,145,340,352,364,376,388,512,800,818,851}.issubset(ids)
assert not {10,20}.intersection(ids), "Do not attach new hints to unresolved wording revisions"
for row in items:
    assert row["primarySkillKey"].strip()
    assert isinstance(row["problemId"], int) and row["problemId"] > 0
    assert len(row["Hints"]) == 2
    for lang in ("Ar", "En"):
        assert row["question"][lang].strip()
        hints = [h[lang].strip() for h in row["Hints"]]
        assert all(0 < len(h) <= 1000 for h in hints)
        assert hints[0] != hints[1]
print("PASS: 28 source-bound bilingual hint pairs; 2 taxonomy-held; no unresolved wording imports")
