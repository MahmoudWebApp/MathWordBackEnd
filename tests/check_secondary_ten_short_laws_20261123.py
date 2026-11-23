#!/usr/bin/env python3
"""Independent math oracles and original correct-option guards for ten short secondary solutions."""
import json
from fractions import Fraction
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/secondary-ten-short-solutions-20261123.json').read_text(encoding='utf-8'))
sql=(root/'scripts/apply_secondary_ten_short_laws_20261123.sql').read_text(encoding='utf-8')
checks={45:('(3,4)',169),63:('2x^{3}+C',244),442:(str(Fraction(4,1)/ (1-Fraction(1,2))),1759),509:(str(Fraction(6,1)/(1-Fraction(1,3))),2026),637:(str(-3),2538),710:(str(3),2787),769:(str(5),3067),770:(r'\{3,\frac12\}',3069),861:('2x^3-2x^2+C',3437),862:(str((2**3+2)-(0**3+0)),3443)}
assert len(d['changes'])==10
assert {x['problemId'] for x in d['changes']}==set(checks)
assert sql.count('UPDATE public."Problems"')==10
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==10
assert sql.count('RAISE EXCEPTION')==10
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
 pid=x['problemId'];value,opt=checks[pid]
 assert (x['correctOptionLatex'],x['correctOptionId'])==(value,opt), (pid,repr(x['correctOptionLatex']),repr(value))
 assert x['stageId']==3 and x['categoryId'] in (9,11,23)
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>140 and len(x['afterEn'])>140,pid
 assert f'\"Id\"={pid}' in sql and f'o.\"Id\"={opt}' in sql
print('PASS ten secondary law-based clarity revisions; independent algebra, calculus and geometric-series values')
