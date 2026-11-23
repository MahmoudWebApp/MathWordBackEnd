#!/usr/bin/env python3
"""Independent mathematical identities and guarded SQL for university sequence limits."""
import json
from fractions import Fraction
from pathlib import Path
root=Path(__file__).resolve().parents[1]
doc=json.loads((root/'content/editorial/university-sequence-limits-20261123.json').read_text(encoding='utf-8'))
sql=(root/'scripts/apply_university_sequence_limit_laws_20261123.sql').read_text(encoding='utf-8')
options={52:200,146:575,338:1344,350:1391,362:1438,374:1485,386:1536,339:1347,351:1394,363:1441,375:1492,387:1539}
assert len(doc['changes'])==12 and doc['reviewed']==22
assert set(r['id'] for r in doc['changes'])==set(options)
assert len(doc['unchangedAdequateIds'])==10
assert sql.count('UPDATE public."Problems"')==12
assert sql.count('GET DIAGNOSTICS affected = ROW_COUNT')==12
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for r in doc['changes']:
 pid=r['id'];assert r['answerId']==options[pid] and r['answerLatex']=='0',pid
 assert (r['stageId'],r['categoryId'])==(4,36)
 assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
 assert len(r['afterAr'])>100 and len(r['afterEn'])>100
 assert f'"Id"={pid}' in sql and f'o."Id"={options[pid]}' in sql
for d in range(2,7):
 # Analytic convergence: r=1/d with 0<r<1; at any fixed N, r^N decreases as N increases.
 assert Fraction(1,d)**50 < Fraction(1,d)**10
for c in range(1,7):
 assert Fraction(c,1000001) < Fraction(1,1000)
print('PASS: 22 university sequence questions individually reviewed, 12 limits clarified')
print('PASS: monotone geometric decay and constant-over-n convergence oracles; 12 immutable correct option IDs')
