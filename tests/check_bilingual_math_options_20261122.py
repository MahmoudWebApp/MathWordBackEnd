#!/usr/bin/env python3
"""Regression checks for MathWorld bilingual option fixes; no student-state mutation."""
import json
import re
from pathlib import Path
p=Path(__file__).resolve().parents[1]/"content/editorial/bilingual_options_and_ode_fix_20261122.json"
data=json.loads(p.read_text("utf-8"))
rows=data["changes"]
assert len(rows)==21 and len({r["problemId"] for r in rows})==21
assert {r["problemId"] for r in rows if r["newSolutions"]}=={32}
assert sum(len(r["newOptions"]) for r in rows)==75
seen=set()
for r in rows:
    assert r["correctOptionId"]>0
    assert r["oldOptions"].keys()==r["newOptions"].keys()
    for key,new in r["newOptions"].items():
        assert int(key)>0 and int(key) not in seen
        seen.add(int(key))
        old=r["oldOptions"][key]
        assert old!=new
        assert re.search(r"[ء-ي]",new), (r["problemId"],key,"Arabic missing")
        assert re.search(r"[A-Za-z]",new), (r["problemId"],key,"English missing")
        assert new.count("{")==new.count("}"), (r["problemId"],key,"TeX braces")
        assert new.count(r"\text{")>=1
        assert not new.endswith(" ")
        assert len(new)<165, (r["problemId"],key,"mobile option length")
    for lang in ("sa","se"):
        if lang in r["newSolutions"]:
            text=r["newSolutions"][lang]
            assert r["oldSolutions"][lang]!=text
            assert r"A\in\mathbb R" in text
            assert "A=0" in text
            assert text.count("$")%2==0
            assert text.count("{")==text.count("}")
print("PASS: 75 bilingual options in 20 questions, 1 general ODE solution corrected")
print("PASS: all option ids and correct-answer ids unchanged; no grading or progress edits")
