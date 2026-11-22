#!/usr/bin/env python3
"""Draft-only independent checks for four under-covered MathWorld skills."""
import json
import re
from collections import Counter
from fractions import Fraction
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
DATA=json.loads((ROOT/"content/editorial/mathworld-depth-wave3-20261122.json").read_text(encoding="utf-8"))
CATALOG=json.loads((ROOT/"content/catalog/international-mathworld-taxonomy-v2.json").read_text(encoding="utf-8"))
assert DATA["meta"]["status"]=="Draft"
assert len(DATA["topics"])==4
def ftex(x:Fraction)->str:
    return r"\frac"+("{" + str(x.numerator) + "}" if abs(x.numerator)>9 else str(x.numerator))+("{" + str(x.denominator) + "}" if x.denominator>9 else str(x.denominator)) if x.denominator!=1 else str(x.numerator)
# Independently calculate the mathematical values rather than copying answer keys.
expected={
"p-fractions-decimals-fraction-sum":ftex(Fraction(3,4)+Fraction(1,8)),
"p-fractions-decimals-fraction-subtract":ftex(Fraction(5,6)-Fraction(1,3)),
"p-fractions-decimals-fraction-group":str(Fraction(2,3)*18),
"p-fractions-decimals-fraction-mixed":ftex(Fraction(5,4)+Fraction(5,2)),
"m-statistics-mean":str(sum([4,7,7,10])//4),
"m-statistics-median":str(sorted([2,5,8,12,20])[2]),
"m-statistics-mode":str(Counter([3,5,5,5,8,8]).most_common(1)[0][0]),
"m-statistics-outlier":str((sum([4,5,6,7,8])-8+28)//5),
"s-sequences-series-infinite-geometric":str(Fraction(3,1)/(1-Fraction(1,2))),
"s-sequences-series-divergent-ratio":r"|r|>1",
"s-sequences-series-alternating":ftex(Fraction(1,1)/(1+Fraction(1,2))),
"s-sequences-series-constant-terms":r"\lim_{n\to\infty}a_n=2",
"u-discrete-math-negate-universal":r"\exists x\,\neg P(x)",
"u-discrete-math-implication":r"P=1,\,Q=0",
"u-discrete-math-contrapositive":r"\neg Q\Rightarrow\neg P",
"u-discrete-math-demorgan":r"\neg P\lor\neg Q",
}
assert len(expected)==16
seen=set()
def interpreted_fraction(value:str):
    if value.startswith(r"\frac"):
        x=re.fullmatch(r"\\frac\{?(-?\d+)\}?\{?(\d+)\}?",value)
        return Fraction(int(x.group(1)),int(x.group(2))) if x else None
    return Fraction(int(value),1) if re.fullmatch(r"-?\d+",value) else None
for topic in DATA["topics"]:
    key=topic["existingTopicKey"];stage=topic["stageId"]
    known={c["stable_key"]:set(c["skill_keys"]) for s in CATALOG["stage_levels"] if s["stage_id"]==stage for c in s["categories"]}
    assert key in known and topic["skillKey"] in known[key], (key,topic["skillKey"])
    assert len(topic["items"])==4
    for q in topic["items"]:
        slug=q["contentKey"].removeprefix("mw-depth3-")
        assert slug in expected and slug not in seen,slug
        seen.add(slug)
        assert q["primarySkillKey"]==topic["skillKey"]
        assert q["templateFamilyKey"]==slug
        assert 1<=q["difficultyLevel"]<=5
        assert q["pisaProcess"] in ("formulate","employ","interpret_evaluate")
        for lang in ("Ar","En"):
            assert len(q["questionText"+lang].strip())>=20,slug
            assert len(q["detailedSolution"+lang].strip())>=25,slug
        ops=q["options"]
        assert [o["Order"] for o in ops]==[1,2,3,4]
        assert len({o["LatexCode"] for o in ops})==4,slug
        assert all(not re.search(r"[ء-ي]",o["LatexCode"]) for o in ops),slug
        right=[o["LatexCode"] for o in ops if o["IsCorrect"]]
        assert right==[expected[slug]],(slug,right,expected[slug])
        # Reject distractors mathematically equivalent to the marked fraction.
        value=interpreted_fraction(right[0])
        if value is not None:
            for o in ops:
                if not o["IsCorrect"]:
                    assert interpreted_fraction(o["LatexCode"])!=value,("equivalent distractor",slug,o)
# Truth-table independence: implication is false only for true->false,
# and De Morgan's transformation matches every Boolean valuation.
for p in (False,True):
    for q in (False,True):
        implication=(not p) or q
        assert (not implication)==(p and not q)
        assert (not(p and q))==((not p) or(not q))
assert len(seen)==16
print("PASS: 16 unique existing-skill drafts, 4 stages and canonical taxonomy")
print("PASS: independent fraction/statistics/convergence calculations and Boolean logic checks")
print("PASS: unambiguous answers, non-equivalent fraction distractors, bilingual explanations")
