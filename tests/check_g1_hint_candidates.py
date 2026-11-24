"""Validate the source-bound published-question hint proposal file."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
items = json.loads((ROOT / "content/editorial/g1-existing-hint-candidates-20261124.json").read_text(encoding="utf-8"))["items"]
ids = [row["problemId"] for row in items]
assert len(ids) == len(set(ids)) == 152
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
print("PASS: 152 source-bound bilingual hint pairs; 2 taxonomy-held; no unresolved wording imports")

# Every new law-review hint is bound to both independently retained source manifests.
primary=json.loads((ROOT/"content/editorial/g1-primary-grade-placement-20261124.json").read_text(encoding="utf-8"))["Items"]
remaining=json.loads((ROOT/"content/editorial/g1-remaining-track-placement-20261124.json").read_text(encoding="utf-8"))["Items"]
source={r["ProblemId"]:r for r in primary+remaining}
laws=json.loads((ROOT/"content/editorial/g1-short-solution-law-candidates-20261124.json").read_text(encoding="utf-8"))["Items"]
new_ids={6,11,420,421,428,473,503,821,12,14,15,43,478,855,856,858,27,484,634,635,636,638,642,643,711,712,772,829,860,147,148,645,646,648,651,653,655,714,715,717,720,777,778,781,784,785,786,787,789,790,863,865}
assert len(new_ids)==52
assert not new_ids.intersection({20,649,706,707})
for item in items:
    if item["problemId"] not in new_ids: continue
    p=source[item["problemId"]]
    l=next(r for r in laws if r["ProblemId"]==item["problemId"])
    assert item["primarySkillKey"]==p["StableKey"]
    for lang in ("Ar","En"):
        assert item["question"][lang]==p["ExpectedQuestion"+lang]==l["ExpectedQuestion"+lang]
    assert not p.get("SkillReview") and not p.get("RequiresWordingReview")
print("PASS: all new hints have matching source and law evidence")

# Wave 03 and the previously adequate explanations share one canonical hint inventory.
long_review=json.loads((ROOT/"content/editorial/g1-remaining-long-solution-review-20261124.json").read_text(encoding="utf-8"))["Items"]
wave03=json.loads((ROOT/"content/editorial/g1-structured-amendments-wave03-20261124.json").read_text(encoding="utf-8"))["Items"]
by_id={r["problemId"]:r for r in items}
adequate={r["ProblemId"]:r for r in long_review if r["Disposition"]=="ExistingExplanationAdequateInDeskReview"}
assert len(adequate)==56
for i,r in adequate.items():
    assert by_id[i]["question"]==r["Question"]
    assert by_id[i]["primarySkillKey"]==source[i]["StableKey"]
    assert not source[i].get("SkillReview") and not source[i].get("RequiresWordingReview")
for r in wave03:
    i=r["ProblemId"]
    assert by_id[i]["Hints"]==r["Content"]["Hints"]
    assert by_id[i]["question"]==r["Content"]["Question"]
    assert by_id[i]["primarySkillKey"]==r["PrimarySkillKey"]
print("PASS: all 56 adequate-review questions and 20 wave-three amendments have canonical hints")
