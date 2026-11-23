#!/usr/bin/env python3
"""Independently check 2^5, Pythagoras, unit price and coordinate distance."""
from math import isqrt
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/middle-four-short-solutions-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_middle_four_short_laws_20261123.sql').read_text(encoding='utf8')
answers={41:(2**5,153),44:(isqrt(6**2+8**2),168),59:(12*7//4,228),857:(isqrt((7-1)**2+(10-2)**2),3422)}
assert len(d['changes'])==4 and {r['problemId'] for r in d['changes']}==set(answers)
assert sql.count('UPDATE public."Problems"')==4
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==4
assert sql.count('RAISE EXCEPTION')==4
assert 'BEGIN;' in sql and 'COMMIT;' in sql
for r in d['changes']:
 pid=r['problemId'];v,opt=answers[pid]
 assert r['correctOptionId']==opt and r['correctOptionLatex']==str(v)
 assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
 assert len(r['afterAr'])>=160 and len(r['afterEn'])>=130
 assert str(v) in r['afterAr'] and str(v) in r['afterEn']
print('PASS 4 middle-stage law clarifications, original math answers and guarded SQL')
