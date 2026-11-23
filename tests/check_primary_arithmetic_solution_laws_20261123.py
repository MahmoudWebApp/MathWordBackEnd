#!/usr/bin/env python3
"""Read-only check for 16 independently calculated primary arithmetic solutions."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
doc = json.loads((ROOT / "content/editorial/primary-arithmetic-reviewed-solution-laws-20261123.json").read_text(encoding="utf-8"))
rows = doc["changes"]
sql = (ROOT / "scripts/apply_sixteen_primary_arithmetic_solution_laws_20261123.sql").read_text(encoding="utf-8")
expected = {
    3: (12-5,1), 36: (25+17,133), 37: (84-29,137),
    69: (17+9-4,268), 84: (21+12-5,327), 99: (25+15-6,386),
    114: (29+18-7,445), 129: (33+21-8,508),
    609: (275+168,2426), 610: (725-486,2431),
    611: (round(198,-2)+round(306,-2),2434), 612: (38+27+16,2439),
    761: (425-178,3034), 762: (650-487,3038),
    763: (38+95,3043), 764: (503-287,3046),
}
assert len(rows) == 16
assert {r["id"] for r in rows} == set(expected)
assert sql.count('UPDATE public."Problems"') == 16
assert sql.count("GET DIAGNOSTICS affected = ROW_COUNT") == 16
assert sql.startswith("-- MathWorld primary arithmetic:")
assert "BEGIN;" in sql and "COMMIT;" in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for row in rows:
    pid = row["id"]
    result, option = expected[pid]
    assert (row["expectedNumber"],row["correctOptionId"]) == (result,option), pid
    assert (row["stageId"],row["categoryId"]) == (1,1)
    assert row["questionAr"].strip()
    assert row["beforeAr"] != row["afterAr"] and row["beforeEn"] != row["afterEn"]
    for lang in ("Ar","En"):
        text = row["after" + lang]
        assert len(text)>90, (pid,lang)
        assert str(result) in text, (pid,lang)
    assert f'WHERE "Id" = {pid} AND "StageId" = 1 AND "CategoryId" = 1' in sql, pid
    assert f'q."Id" = {option} AND q."ProblemId" = {pid}' in sql, pid
print("PASS 16 bilingual independently calculated primary arithmetic worked solutions")
print("PASS guarded and atomic solution-only SQL; immutable answer option IDs")
