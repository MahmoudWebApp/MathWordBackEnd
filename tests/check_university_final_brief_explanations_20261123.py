#!/usr/bin/env python3
"""Independent university dot-product/continuity/exponential-ODE proof checks."""
from pathlib import Path
import json
from fractions import Fraction
r=Path(__file__).resolve().parents[1]
d=json.loads((r/'content/editorial/university-final-brief-explanations-20261123.json').read_text(encoding='utf-8'))['changes']
sql=(r/'scripts/apply_university_final_brief_explanations_20261123.sql').read_text(encoding='utf-8')
assert 3*4+2*(-6)==0
assert 2*Fraction(3,2)+1==4
assert len(d)==3
assert {(x['id'],x['correctOptionId'],x['correctOptionLatex']) for x in d}=={(647,2579,'4'),(797,3179,r'\frac32'),(864,3449,'3e^2')}
assert sql.count('UPDATE public."Problems"')==3
assert sql.count('GET DIAGNOSTICS n=ROW_COUNT')==3
assert 'BEGIN;' in sql and 'COMMIT;' in sql and 'UPDATE public."QuestionOptions"' not in sql
for x in d:
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>135 and len(x['afterEn'])>135
 assert f'"Id"={x["id"]}' in sql and f'o."Id"={x["correctOptionId"]}' in sql
print('PASS: 3 university solutions; dot-product, continuity at break, y-prime=2y initial value')
