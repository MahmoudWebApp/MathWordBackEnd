#!/usr/bin/env python3
"""Independent place-value editorial review. Does NOT publish student-visible content."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
doc=json.loads((root/'content/editorial/reviewed-primary-number-sense-24-20261123.json').read_text(encoding='utf-8'))
rows=doc['questions']
# Oracles are computed independently of the source draft's correct-option flags.
expected={
 63:6*10000,
 64:70000+500+40+3,
 65:'<' if 58209<58290 else '>',
 66:(37648+50)//100*100,
 67:(9650+500)//1000*1000,
 68:(392+50)//100*100+(614+50)//100*100,
 69:(1508+50)//100*100-(692+50)//100*100,
 70:40*100,
 159:7*1000,
 160:max(4096,4609,4690,4906),
 161:(3867+50)//100*100,
 162:1250+25*3,
 163:(198+50)//100*100+(304+50)//100*100,
 164:4*1000+3*100+2*10+7,
 183:(4*1000)//(4*100),
 184:6*1000+0*100+4*10+9,
 185:(340+360)//2,
 186:[v for v in (4490,4650,4790,4563) if (v+50)//100*100==4600][0],
 187:1500-(490+390+610),
 188:divmod(36,10),
 189:1000+6*100+0*10+8,
 190:len([x for x in range(366,390) if x%10==0]),
 215:len([x for x in range(200,300) if x//10%10==4]),
 216:6005-90
}
assert doc['status'].endswith('authorized editorial publication')
assert not doc['changesToProduction']
assert doc['stageId']==1 and doc['questionCount']==24 and len(rows)==24
assert {r['id'] for r in rows}==set(expected)
assert len({r['contentKey'] for r in rows})==len(rows)
assert len({r['questionEn'].strip().lower() for r in rows})==len(rows)
assert len({r['templateFamilyKey'] for r in rows})==len(rows)
def normalized(value):
 value=value.replace(',','').replace(' ','')
 if value.startswith('(') and value.endswith(')'):
  a,b=value[1:-1].split(',')
  return (int(a),int(b))
 try:return int(value)
 except ValueError:return value
for r in rows:
 pid=r['id']
 assert r['topicProposalId']==5 and r['primarySkillKey']
 assert 1<=r['difficulty']<=5
 assert r['pisaProcess'] in ('formulate','employ','interpret_evaluate')
 for k in ('objectiveAr','objectiveEn','questionAr','questionEn','solutionAr','solutionEn'):
  assert len(r[k].strip())>12,(pid,k)
 assert r['questionAr']!=r['questionEn'] and r['solutionAr']!=r['solutionEn']
 options=r['options']
 assert len(options)==4 and {o['Order'] for o in options}=={1,2,3,4}
 assert sum(bool(o['IsCorrect']) for o in options)==1,pid
 vals=[normalized(o['LatexCode']) for o in options]
 assert len(vals)==len(set(vals)),('equivalent options',pid)
 right=next(o for o in options if o['IsCorrect'])
 assert normalized(right['LatexCode'])==expected[pid],(pid,right['LatexCode'],expected[pid])
 assert right['LatexCode']==r['independentCorrectAnswer']
print('PASS 24/24 independent arithmetic and place-value oracles and unique answer choices')
print('PASS 24 bilingual draft problems: varied templates, objectives, options, and no published-side mutation')
