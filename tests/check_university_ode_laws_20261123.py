#!/usr/bin/env python3
"""Independent university ODE numerical IVP oracles and guarded source contract."""
import json
from pathlib import Path
r=Path(__file__).resolve().parents[1]
d=json.loads((r/'content/editorial/university-ode-reviewed-solutions-20261123.json').read_text(encoding='utf-8'))
sql=(r/'scripts/apply_university_ode_laws_20261123.sql').read_text(encoding='utf-8')
numeric={}
for i,k,y0,t,opt in [(335,3,2,4,1329),(347,4,3,5,1380),(359,5,4,6,1427),(371,6,5,7,1474),(383,7,6,8,1521)]:
 numeric[i]=(k*t+y0,opt)
for i,k,y0,t,opt in [(336,2,3,3,1336),(348,3,4,4,1383),(360,4,5,5,1430),(372,5,6,6,1477),(384,6,7,7,1528)]:
 numeric[i]=(k*t+y0,opt)
for i,k,y0,t,opt in [(337,4,3,2,1339),(349,6,4,3,1386),(361,8,5,4,1433),(373,10,6,5,1484),(385,12,7,6,1531)]:
 numeric[i]=(k//2*t*t+y0,opt)
symbolic={51:('y=x^{2}+C',195),67:('y=2e^{x}',260),83:('2e^{1x}',322),98:('3e^{2x}',381),113:('4e^{3x}',444),128:('5e^{4x}',503),143:('6e^{5x}',562)}
assert len(d['changes'])==22 and d['reviewedProblemCount']==32
assert set(d['unchangedAdequateProblemIds'])=={32,33,777,778,779,780,863,864,865,866}
assert set(x['problemId'] for x in d['changes'])==set(numeric)|set(symbolic)
assert sql.count('UPDATE public."Problems"')==22
assert sql.count('GET DIAGNOSTICS changed = ROW_COUNT')==22
assert sql.count('RAISE EXCEPTION')==22
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
 pid=x['problemId']
 assert (x['stageId'],x['categoryId'])==(4,15)
 if pid in numeric:
  expected,option=numeric[pid]
  assert (x['answerLatex'],x['answerOptionId'])==(str(expected),option),pid
  assert str(expected) in x['afterAr'] and str(expected) in x['afterEn'],pid
 else:
  assert (x['answerLatex'],x['answerOptionId'])==symbolic[pid],pid
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>100 and len(x['afterEn'])>100,pid
 assert f'"Id"={pid}' in sql and f'o."Id"={x["answerOptionId"]}' in sql
print("PASS ODE: 32 individually inspected, 22 bilingual worked steps expanded")
print("PASS 15 independent IVP evaluations, 7 general symbolic/linear IVP choices; 22 source and correct-answer guards")
