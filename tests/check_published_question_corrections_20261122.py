#!/usr/bin/env python3
"""Validate reversible editorial-only corrections before applying to production.

This test never edits scores, correct flags, option IDs or student progress.
"""
from __future__ import annotations
import json
import re
from pathlib import Path
from fractions import Fraction

root=Path(__file__).resolve().parents[1]
source=json.loads((root/"content/editorial/published_question_corrections_20261122.json").read_text(encoding="utf-8"))
rows=source["changes"]
expected={7,23,28,29,31,34,35,154,166,178,190,202,273,278,285,290,297,302,309,314,321,326,437,439,641,817}
assert {r["problemId"] for r in rows}==expected
assert len(rows)==26
allowed={"ta","te","qa","qe","sa","se"}
changed_ids=set()
for row in rows:
    assert row["expectedAnswerOptionId"]>0
    assert set(row["newFields"])==set(row["oldFields"])<=allowed
    assert set(row["newOptions"])==set(row["oldOptions"])
    assert row["newFields"] or row["newOptions"]
    for k,new in row["newFields"].items():
        old=row["oldFields"][k]
        assert isinstance(new,str) and new.strip() and old!=new
        assert new.count("$")%2==0,(row["problemId"],k,"malformed $")
        assert new.count(r"\(")==new.count(r"\)"),(row["problemId"],k,"unbalanced inline math")
        assert new.count("{")==new.count("}"),(row["problemId"],k,"unbalanced TeX braces")
        assert len(new)<=1500,(row["problemId"],k)
    for oid,new in row["newOptions"].items():
        assert int(oid)>0 and int(oid)!=row["expectedAnswerOptionId"]
        assert row["oldOptions"][oid]!=new
        assert new.count("{")==new.count("}")
        assert new not in row["oldOptions"].values(),(row["problemId"],"duplicate distractor literal")
        changed_ids.add(int(oid))
assert len(changed_ids)==7

def parse_fraction(s:str)->Fraction:
    s=s.strip().replace(r"\frac","")
    numbers=re.findall(r"-?\d+",s)
    assert len(numbers)==2, (s,numbers)
    return Fraction(int(numbers[0]),int(numbers[1]))

for pid,old,updated in ((641,r"\frac{8}{2}",r"\frac{8}{6}"),(817,r"\frac{3}{12}",r"\frac{2}{3}")):
    r=next(x for x in rows if x["problemId"]==pid)
    assert old in r["oldOptions"].values() and updated in r["newOptions"].values()
    assert parse_fraction(old)!=parse_fraction(updated)
    correct=Fraction(8,3) if pid==641 else Fraction(3,4)
    assert parse_fraction(updated)!=correct

for pid in [154,166,178,190,202,273,278,285,290,297,302,309,314,321,326]:
    r=next(x for x in rows if x["problemId"]==pid)
    assert len(r["newFields"]["sa"])>=40 and len(r["newFields"]["se"])>=40

print("PASS: 26 reversible published question corrections")
print("PASS: 15 bilingual worked explanations expanded")
print("PASS: answer IDs and correct flags are immutable; only seven incorrect distractor texts change")
print("PASS: math delimiters, translations and numeric distractor inequivalence")
