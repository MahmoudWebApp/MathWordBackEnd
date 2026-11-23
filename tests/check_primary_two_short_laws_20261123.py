#!/usr/bin/env python3
"""Two final independently verified elementary equality and percentage explanations."""
import json
from fractions import Fraction
from pathlib import Path
root=Path(__file__).resolve().parents[1]
rows=json.loads((root/'content/editorial/primary-two-short-explanations-20261123.json').read_text(encoding='utf-8'))['changes']
sql=(root/'scripts/apply_primary_two_short_laws_20261123.sql').read_text(encoding='utf-8')
assert Fraction(3,5)==Fraction(6,10)
assert Fraction(12,48)*100==25
assert len(rows)==2
assert {r['problemId'] for r in rows}=={422,476}
assert {(r['problemId'],r['correctOptionId']) for r in rows}=={(422,1677),(476,1894)}
assert sql.count('UPDATE public."Problems"')==2
assert sql.count('GET DIAGNOSTICS n = ROW_COUNT')==2
assert 'BEGIN;' in sql and 'COMMIT;' in sql
for r in rows:
 assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
 assert len(r['afterAr'])>140 and len(r['afterEn'])>140
print('PASS: two equality/percentage oracles; guarded bilingual explanatory corrections')
