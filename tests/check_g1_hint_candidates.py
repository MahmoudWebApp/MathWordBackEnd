"""Validate the source-bound published-question hint proposal file."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
items = json.loads((ROOT / "content/editorial/g1-existing-hint-candidates-20261124.json").read_text(encoding="utf-8"))["items"]
canonical_ids = [row["problemId"] for row in items]
assert len(canonical_ids) == len(set(canonical_ids)) == 734
assert {row["problemId"] for row in items if row.get("taxonomyReviewPending")} == {1566, 1578}
assert {23,145,340,352,364,376,388,512,800,818,851}.issubset(canonical_ids)
assert not {10,20}.intersection(canonical_ids), "Do not attach new hints to unresolved wording revisions"
for row in items:
    assert row["primarySkillKey"].strip()
    assert isinstance(row["problemId"], int) and row["problemId"] > 0
    assert len(row["Hints"]) == 2
    for lang in ("Ar", "En"):
        assert row["question"][lang].strip()
        hints = [h[lang].strip() for h in row["Hints"]]
        assert all(0 < len(h) <= 1000 for h in hints)
        assert hints[0] != hints[1]
print("PASS: 734 source-bound bilingual hint pairs; 2 taxonomy-held; no unresolved wording imports")

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
wave03=json.loads((ROOT/"content/editorial/g1-structured-amendments-alternate-clarity-20261124.json").read_text(encoding="utf-8"))["Items"]
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

# Further reviewed, source-bound families; no category-wide implicit assignment.
family_ids_2 = {"place-value":[1555,1651,1556,1656,1676,1557,1562,1675,1681,1708],"secondary-trigonometric-special-angles":[22,286,310,298,46,62,274,322],"primary-subtraction":[3,37,761,762,763,764],"primary-perimeter":[8,39,155,167,191,203],"primary-one-step-additive-equations":[38,70,85,100,115,130],"primary-arithmetic-mean":[40,72,87,102,117,132],"primary-simple-probability":[56,159,171,183,195,207],"p-fractions-decimals-basic-percentages":[426,617,620,476,619,618],"simple-compound-events":[1657,1658,1684,1685,1690,1709],"s-sequences-series-recurrence-relations":[443,485,773,775,774,776],"dot-product":[1667,1694,1668,1693,1695,1712],"primary-addition":[36,609,610,611,612],"primary-one-step-multiplicative-equations":[54,689,690,691,692],"primary-multistep-arithmetic":[69,84,99,114,129],"primary-division":[150,162,174,186,198],"primary-number-patterns":[153,165,177,189,201],"rounding":[1558,1653,1559,1655,1678],"middle-linear-equations":[58,624,621,622,623],"middle-vertical-angles":[60,701,702,703,704],"middle-linear-function-evaluation":[74,89,104,119,134],"middle-lcm":[211,223,235,247,259],"middle-slope":[213,225,237,249,261],"middle-percent-discounts":[215,227,239,251,263],"middle-map-scale":[216,228,240,252,264],"middle-percent-increase":[217,229,241,253,265],"middle-polygon-angles":[218,230,242,254,266]}
assert sum(len(v) for v in family_ids_2.values())==147
assert len({i for ids in family_ids_2.values() for i in ids})==147
assert not {i for ids in family_ids_2.values() for i in ids}.intersection({i for ids in family_ids.values() for i in ids})
for skill, ids in family_ids_2.items():
    for i in ids:
        r=by_id[i]; s=source[i]
        assert r["primarySkillKey"]==s["StableKey"]==skill
        assert not s.get("RequiresWordingReview") and not s.get("SkillReview")
        assert r["question"]=={"Ar":s["ExpectedQuestionAr"],"En":s["ExpectedQuestionEn"]}
print("PASS: 147 additional explicitly reviewed family hints source-bound")

# Third extension: explicit reviewed IDs and exact source snapshots.
family_ids_3 = {"middle-similar-triangles":[220,232,244,256,268],"m-statistics-distributions":[433,479,482,825,826],"secondary-discriminant":[270,282,294,306,318],"secondary-factor-quadratics":[271,283,295,307,319],"secondary-arithmetic-mean":[280,292,304,316,328],"s-sequences-series-arithmetic-sequences":[436,438,483,827,828],"magnitude":[1665,1666,1692,1697,1711],"logarithm-properties":[1716,1717,1718,1721,1726],"university-directional-derivative":[331,343,355,367,379],"university-matrix-trace":[332,344,356,368,380],"university-vector-scaling":[333,345,357,369,381],"university-second-order-ivp":[336,348,360,372,384],"u-discrete-math-logic":[445,446,488,833,834],"u-discrete-math-graphs":[447,450,491,831,832],"unconstrained-optimization":[1669,1670,1699,1701,1714],"constrained-optimization":[1671,1672,1702,1705,1713],"convexity":[1673,1674,1700,1704,1706],"primary-triangle-area":[55,614,615,613],"p-fractions-decimals-fraction-models":[423,424,477,817],"p-fractions-decimals-equivalence":[693,694,695,696],"fraction-operations":[1635,1636,1637,1638],"counting":[1654,1680,1682,1707],"middle-evaluate-powers":[41,765,766,767],"m-statistics-charts":[429,434,823,824],"m-statistics-summary-measures":[431,432,435,481],"middle-circle-area":[625,626,627,628],"middle-ratios":[629,630,631,632],"middle-triangle-angles":[697,698,699,700],"solve-linear-inequalities":[1599,1600,1601,1602],"number-line-solutions":[1603,1604,1605,1606],"inequality-contexts":[1607,1608,1609,1610],"summary-measures":[1639,1640,1641,1642],"sample-spaces":[1662,1689,1683,1710],"secondary-quadratic-roots":[45,769,770],"secondary-logarithm-evaluation":[21,61,637,640],"s-sequences-series-series-sums":[440,441,442,830]}
assert sum(len(v) for v in family_ids_3.values())==160
assert len({i for ids in family_ids_3.values() for i in ids})==160
assert not {i for ids in family_ids_3.values() for i in ids}.intersection({i for family in (family_ids, family_ids_2) for ids in family.values() for i in ids})
for skill, ids in family_ids_3.items():
    for i in ids:
        r=by_id[i]; s=source[i]
        assert r["primarySkillKey"]==s["StableKey"]==skill
        assert not s.get("RequiresWordingReview") and not s.get("SkillReview")
        assert r["question"]=={"Ar":s["ExpectedQuestionAr"],"En":s["ExpectedQuestionEn"]}
print("PASS: 160 additional explicitly reviewed family hints source-bound")

# Final eligible extension and explicit held inventory.
family_ids_4 = {"p-fractions-decimals-decimal-place-value":[422,427,822],"p-fractions-decimals-fraction-operations":[819,820],"length":[1587,1588,1589],"capacity":[1592,1593,1594],"number-comparison":[1652,1677,1679],"signed-operations":[1563,1564,1565],"rational-arithmetic":[1568,1569,1570],"frequency":[1660,1661,1686],"secondary-population-variance":[48],"s-sequences-series-series-convergence":[509],"s-sequences-series-geometric-sequences":[709,710],"growth-models":[1571,1572,1573],"decay-half-life":[1574,1575,1576],"coordinate-lines":[1611,1612,1613,1614],"circles":[1615,1616,1617,1618],"loci":[1619,1622,1620,1621],"series-convergence":[1643,1645,1644,1646],"vector-components":[1663,1664,1691],"logarithm-inverse-and-equations":[1715,1719,1720,1723],"university-dot-product":[66,647],"university-intermediate-value-theorem":[68,144],"u-discrete-math-combinatorics":[444,489],"u-discrete-math-proofs":[449,492],"u-discrete-math-relations":[490,795],"university-differentiability-continuity":[797],"root-finding":[1623,1624,1625],"numerical-integration":[1626,1627,1628],"error-analysis":[1629,1630,1631],"linear-systems":[1632,1634],"logic":[1647,1648,1649,1650]}
assert sum(len(v) for v in family_ids_4.values())==82
assert len({i for ids in family_ids_4.values() for i in ids})==82
assert not {i for ids in family_ids_4.values() for i in ids}.intersection({i for family in (family_ids, family_ids_2, family_ids_3) for ids in family.values() for i in ids})
for skill, group in family_ids_4.items():
    for i in group:
        r=by_id[i]; s=source[i]
        assert r["primarySkillKey"]==s["StableKey"]==skill
        assert not s.get("RequiresWordingReview") and not s.get("SkillReview")
        assert r["question"]=={"Ar":s["ExpectedQuestionAr"],"En":s["ExpectedQuestionEn"]}
held_file=json.loads((ROOT/"content/editorial/g1-hint-held-review-20261124.json").read_text(encoding="utf-8"))
assert held_file["status"]=="HeldNotImportable"
held=held_file["items"]
assert len(held)==len({r["problemId"] for r in held})==39
assert not set(canonical_ids).intersection({r["problemId"] for r in held})
assert set(canonical_ids)|{r["problemId"] for r in held}==set(source)
assert len(source)==773
for r in held:
    s=source[r["problemId"]]
    assert r["taxonomyReviewPending"] is True and r["HoldReason"].strip()
    assert len(r["Hints"])==2
    for lang in ("Ar","En"):
        values=[h[lang].strip() for h in r["Hints"]]
        assert all(0<len(v)<=1000 for v in values) and values[0]!=values[1]
    assert r["primarySkillKey"]==s["StableKey"]
    assert r["question"]=={"Ar":s["ExpectedQuestionAr"],"En":s["ExpectedQuestionEn"]}
print("PASS: complete 773-item coverage inventory: 732 eligible hint pairs, 2 in-file taxonomy holds, 39 separately held with hints; no publication")

# The offline preparation must exactly partition all source IDs.
import sys
sys.path.insert(0,str(ROOT/"scripts"))
from prepare_g1_publication_batches import prepare
hint_batches, full_batches, blocked = prepare()
assert [len(b["Items"]) for b in hint_batches]==[49]
assert [len(b["Items"]) for b in full_batches]==[50]*13+[39]
hint_ids={r["ProblemId"] for b in hint_batches for r in b["Items"]}
full_ids={r["ProblemId"] for b in full_batches for r in b["Items"]}
assert len(hint_ids)==49 and len(full_ids)==689 and len(blocked)==35
assert {212,224,236,248,260} <= full_ids and set(range(1623,1635)) <= full_ids
assert not hint_ids.intersection(full_ids) and not (hint_ids|full_ids).intersection(blocked)
assert hint_ids|full_ids|set(blocked)==set(source)
assert all(b["Confirm"] is False for b in hint_batches+full_batches)
print("PASS: 15 disjoint preview-only batches cover 738 eligible problems; all 35 current holds excluded")

# New questions are not existing amendments and never auto-published.
from prepare_g1_new_content import prepare_new
new_existing,new_deferred,readiness=prepare_new()
assert [len(b["Items"]) for b in new_existing]==[50,1]
assert [len(b["Items"]) for b in new_deferred]==[8]
assert all(b["Confirm"] is False for b in new_existing+new_deferred)
all_new=[r for b in new_existing+new_deferred for r in b["Items"]]
assert len({r["ContentKey"] for r in all_new})==59
assert all(not r["Content"]["TrackIds"] for r in all_new)
assert len(readiness)==19 and sum(t["ExistingProblemCount"] for t in readiness)==773
assert sum(t["ProposedNewAssignments"] for t in readiness)==59
assert {t["Code"] for t in readiness if "NoFreeCategoryOverlap" in t["Reasons"]}=={
    "differential-equations","probability-statistics","discrete-mathematics","numerical-analysis","mathematical-optimization"}
assert {t["Code"] for t in readiness if "DraftIdentityMissingInSnapshot" in t["Reasons"]}=={"numerical-analysis","mathematical-optimization"}
assert all(t["PublicationBlocked"] for t in readiness)
assert {i for t in readiness for i in t["HeldProblemIds"]}==set(blocked)
print("PASS: 59 draft-only candidates, 19 track readiness records, five access gates, no publication")

from prepare_g1_track_mapping import prepare_mapping
mapping,identities=prepare_mapping()
tracks=mapping["Tracks"]
assert len(tracks)==19
assert sum(t["ProblemCount"] for t in tracks)==738
assert {i for t in tracks for i in t["ProblemIds"]}==hint_ids|full_ids
assert {i for t in tracks for i in t["ExcludedHeldIds"]}==set(blocked)
assert all(not t["PublicationApproved"] and t["ProblemCount"] and t["SkillIds"] and t["CategoryIds"] for t in tracks)
assert {t["Code"] for t in tracks if t["FreeCoverageBlocked"]}=={
    "differential-equations","probability-statistics","discrete-mathematics","numerical-analysis","mathematical-optimization"}
assert {t["Code"] for t in identities}=={"numerical-analysis","mathematical-optimization"}
assert all(t["StageId"]==4 and t["Kind"]=="course" for t in identities)
print("PASS: 19 source-bound mapping proposals with 738 eligible IDs, 35 held excluded, two draft identities; no publication")
