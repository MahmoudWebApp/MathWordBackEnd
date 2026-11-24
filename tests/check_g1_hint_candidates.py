"""Validate the source-bound published-question hint proposal file."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
items = json.loads((ROOT / "content/editorial/g1-existing-hint-candidates-20261124.json").read_text(encoding="utf-8"))["items"]
ids = [row["problemId"] for row in items]
assert len(ids) == len(set(ids)) == 345
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
print("PASS: 345 source-bound bilingual hint pairs; 2 taxonomy-held; no unresolved wording imports")

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

# Reviewed family expansion: explicit source IDs only, no automatic category-wide assignment.
family_ids = {"secondary-right-triangle-trig-ratios":[78,93,108,123,138,272,284,296,308,320,273,285,297,309,321],"middle-pythagorean-theorem":[44,76,91,106,121,136,219,231,243,255,267,857],"secondary-polynomial-derivatives":[47,79,94,109,124,139,859,275,287,299,311,323],"university-matrix-determinants":[30,50,82,97,112,127,142,334,346,358,370,382],"university-sequence-limits":[52,146,338,350,362,374,386,339,351,363,375,387],"university-partial-derivatives":[49,81,96,111,126,141,329,341,353,365,377],"university-integrating-ode":[51,335,347,359,371,383,337,349,361,373,385],"middle-exponent-laws":[73,88,103,118,133,210,222,234,246,258],"secondary-vieta-roots":[77,92,107,122,137,269,281,293,305,317],"primary-multiplication":[53,149,161,173,185,197,854],"primary-multiplicative-word-problems":[151,163,175,187,199,852,853],"secondary-indefinite-integrals":[63,276,288,300,312,324,861],"university-exponential-ode":[67,83,98,113,128,143,864],"primary-rectangle-area":[9,71,86,101,131],"primary-two-step-equations":[152,164,176,188,200],"primary-triangle-angle-sum":[156,168,180,192,204],"primary-unit-conversions":[157,169,181,193,205],"primary-mode":[158,170,182,194,206],"primary-median":[160,172,184,196,208],"university-gradient":[65,330,342,354,366,378],"middle-unit-rates":[59,75,90,105,120,135],"middle-quadratic-function-evaluation":[42,214,226,238,250,262],"middle-gcd":[57,209,221,233,245,257],"secondary-definite-integrals":[277,289,301,313,325,862]}
assert sum(len(v) for v in family_ids.values())==193
assert len({i for ids in family_ids.values() for i in ids})==193
for skill, ids in family_ids.items():
    for i in ids:
        r=by_id[i]; s=source[i]
        assert r["primarySkillKey"]==s["StableKey"]==skill
        assert not s.get("RequiresWordingReview") and not s.get("SkillReview")
        assert r["question"]=={"Ar":s["ExpectedQuestionAr"],"En":s["ExpectedQuestionEn"]}
print("PASS: 193 explicitly reviewed family hints source-bound")
