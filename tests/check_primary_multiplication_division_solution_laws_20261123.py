#!/usr/bin/env python3
"""Independently validate bilingual category-33 arithmetic law revisions.

No DB network access and no mutation; before states are guarded in SQL.
"""
import json
from pathlib import Path
r=Path(__file__).resolve().parents[1]
d=json.loads((r/"content/editorial/primary-multiplication-division-solution-laws-20261123.json").read_text(encoding="utf-8"))
sql=(r/"scripts/apply_primary_multiplication_division_solution_laws_20261123.sql").read_text(encoding="utf-8")
# Independent arithmetic, separate from editorial record.
answers={
 53:(9*6,202),149:(12*4,587),150:(36//3,590),151:(7*4,593),
 161:(15*5,634),162:(56//4,637),163:(8*5,644),173:(18*6,681),
 174:(80//5,688),175:(9*6,691),185:(21*7,732),186:(108//6,735),
 187:(10*7,738),197:(24*8,779),198:(140//7,782),199:(11*8,785),
 851:(96//7,3398),852:((145+38-1)//38,3402),
 853:(18*12-35,3406),854:(48*25,3411)
}
assert d["reviewedProblemCount"] == 21
assert d["alreadyAdequateProblemIds"] == [5]
assert len(d["changes"]) == 20
assert {a["problemId"] for a in d["changes"]} == set(answers)
assert sql.count('UPDATE public."Problems"') == 20
assert sql.count('GET DIAGNOSTICS affected = ROW_COUNT') == 20
assert 'UPDATE public."QuestionOptions"' not in sql
assert sql.count("RAISE EXCEPTION") == 20
assert "BEGIN;" in sql and "COMMIT;" in sql
for x in d["changes"]:
    pid=x["problemId"]
    assert (x["expectedNumericAnswer"],x["expectedAnswerOptionId"]) == answers[pid], pid
    assert (x["stageId"],x["categoryId"]) == (1,33)
    assert x["questionAr"] and x["questionEn"]
    assert x["beforeAr"] != x["afterAr"] and x["beforeEn"] != x["afterEn"]
    assert len(x["afterAr"]) > 105 and len(x["afterEn"]) > 100
    assert str(answers[pid][0]) in x["afterAr"] and str(answers[pid][0]) in x["afterEn"]
    assert "WHERE \"Id\" = {}".format(pid) in sql
    assert '"Id" = {}'.format(x["expectedAnswerOptionId"]) in sql
print("PASS: 21 category-33 math items reviewed, 20 individual bilingual law-led revisions")
print("PASS: 20 independent numerical answers + correct option IDs; atomic source-guarded SQL")
