#!/usr/bin/env python3
"""Independent mathematics / option checks for all 36 unpublished middle-stage drafts.
Read-only editorial fixture. Publishing requires separate administrator approval.
"""
import json
from fractions import Fraction as F
from itertools import product
from math import ceil
from pathlib import Path

root = Path(__file__).resolve().parents[1]
doc = json.loads((root / "docs/review-data/middle-36-independent-drafts-20261123.json").read_text(encoding="utf-8"))
rows = doc["questions"]

def frac(v):
    v = F(v)
    return str(v.numerator) if v.denominator == 1 else rf"\frac{{{v.numerator}}}{{{v.denominator}}}"

# Compute integer/rational answers from the quantities, not from the database's
# IsCorrect flag or the published solution text.
integers = {
    71: str(-7 + 12),
    72: str(-4 - (-9)),
    73: str((-3) * (-8)),
    74: "<".join(map(str, sorted([-8, -2, 4, 0]))),
    75: str(abs(-13) - abs(5)),
    76: "−" + str(abs(F(-3,4) + F(1,2)).numerator) + "/" + str(abs(F(-3,4) + F(1,2)).denominator),
    77: "−" + str(abs(F(-5,6) - F(1,3)).numerator) + "/" + str(abs(F(-5,6) - F(1,3)).denominator),
    78: "−" + str(abs(F("-2.5") + F("1.75")).numerator / abs(F("-2.5") + F("1.75")).denominator)
}
# Python's str on floats is stable here, but use exact fraction for explicit assertion.
integers[78] = "−" + format(float(abs(F("-2.5")+F("1.75"))), ".2f")

inequalities = {
    107: "x<" + str(12-5),
    108: r"x\ge" + str(F(11+4, 3)),
    109: "x>" + str(F(10-6, -2)),
    110: r"x\ge" + str(5-2),
    111: "x>-3",  # open endpoint excludes -3, shading right
    112: r"x\le4", # filled endpoint includes 4, shading left
    113: str(len([x for x in range(-8, 9) if -2 < x <= 2])),
    114: str(sum(x for x in range(-8, 9) if -2 <= x < 3)),
    115: str((18-4)//2),
    116: str(ceil(F(75-56, 5))),
    117: str((20-3)//2),
    118: r"T\le-5",
}

outcomes = list(product(range(1,7), repeat=2))
p = {
    165: frac(F(3+1,3+2+1)),
    166: frac(F(2,5)*F(1,4)),
    167: frac(F(1,4)*F(1,2)),
    168: frac(F(18,60)),
    169: str(100*F(24,80))+r"\%",
    170: str(len(list(product(range(3),range(2))))),
    191: str(len(list(product(range(2),repeat=2)))),
    192: frac(F(sum(1 for a,b in outcomes if a+b == 7),len(outcomes))),
    193: frac(F(4,5)**3),
    194: str(100*(F(15,50)-F(18,60))),
    195: frac(F(2,5)**2),
    196: frac(F(2,4)),
    197: str(len(list(product(range(3),range(2),range(2))))),
    198: frac(F(len([i for i in range(1,11) if i%2==0 or i%5==0]), 10)),
    217: frac(F(len([i for i in (2,4,6) if i>3]), 3)),
    218: str(sum(1 for a,b in outcomes if (a==6) != (b==6))),
}
expected = {**integers,**inequalities,**p}
ids = [r["id"] for r in rows]
assert doc["questionCount"] == len(rows) == 36 and doc["stageId"] == 2
assert set(ids) == set(expected) and len(set(ids)) == len(ids)
assert not doc["changesToProduction"] and "unpublished" in doc["status"].lower()
assert [len([r for r in rows if r["topicProposalId"] == t]) for t in (6,10,13)] == [8,12,16]
assert len({r["contentKey"] for r in rows})==36
assert len({r["templateKey"] for r in rows})==36
for row in rows:
    pid = row["id"]
    assert row["topicKey"] in doc["topicKeys"]
    assert row["difficulty"] in range(1,6)
    assert row["pisaProcess"] in {"formulate","employ","interpret_evaluate"}
    for key in ("objectiveAr","objectiveEn","questionAr","questionEn","solutionAr","solutionEn"):
        assert isinstance(row[key],str) and len(row[key].strip())>=12,(pid,key)
    assert row["questionAr"] != row["questionEn"],pid
    opts = row["options"]
    assert len(opts)==4 and {x["Order"] for x in opts}=={1,2,3,4},pid
    assert len({x["LatexCode"].strip() for x in opts})==4,pid
    assert sum(x["IsCorrect"] for x in opts)==1,pid
    correct = next(x["LatexCode"] for x in opts if x["IsCorrect"])
    assert row["independentCorrectAnswer"] == expected[pid],pid
    assert correct == expected[pid],(pid,correct,expected[pid])
    if row["topicProposalId"] == 13:
        assert "probability" in row["topicKey"] or "probability" in row["solutionEn"].lower() or "frequency" in row["solutionEn"].lower() or "counting" in row["solutionEn"].lower() or "independent" in row["solutionEn"].lower() or "with-replacement" in row["solutionEn"].lower(),pid

print("PASS: 36 unpublished middle-stage questions; 8 integer/rational, 12 inequalities, 16 probability/counting")
print("PASS: independent Fraction arithmetic, inequality endpoints, boundary integer counts, exhaustive dice outcomes")
print("PASS: one correct answer in four distinct options, bilingual questions/objectives/solutions, no publication")
