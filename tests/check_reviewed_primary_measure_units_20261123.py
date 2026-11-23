#!/usr/bin/env python3
"""Independent quality gates for 12 unpublished elementary measurement drafts."""
import json
from pathlib import Path
from datetime import datetime,timedelta
from fractions import Fraction
root=Path(__file__).resolve().parents[1]
doc=json.loads((root/'docs/review-data/primary-measure-units-12-20261123.json').read_text(encoding='utf-8'))
rows=doc['questions']
arrival=(datetime.strptime('09:45','%H:%M')+timedelta(hours=1,minutes=35)).strftime('%H:%M')
duration=(datetime.strptime('15:05','%H:%M')-datetime.strptime('14:10','%H:%M')).seconds//60
answers={
 95:235+85,
 96:Fraction(14,10)*100-135,
 97:(12*100)//75,
 98:2*1000+750-900,
 99:(Fraction(15,10)*1000)//250,
 100:(2*1000)//250,
 101:2*1000-350,
 102:750+Fraction(8,10)*1000,
 103:r'\text{'+arrival+'}',
 104:duration,
 105:Fraction(325,100)*1000,
 106:18*10
}
assert doc['questionCount']==12 and len(rows)==12 and doc['stageId']==1
assert doc['topicKey']=='p-measure-units' and not doc['changesToProduction']
assert set(x['id'] for x in rows)==set(answers)
assert len({x['contentKey'] for x in rows})==12
assert len({x['templateKey'] for x in rows})==12
for x in rows:
  pid=x['id']
  assert x['topicProposalId']==9
  assert 1<=x['difficulty']<=5 and x['pisaProcess'] in ('formulate','employ','interpret_evaluate')
  for k in ('objectiveAr','objectiveEn','questionAr','questionEn','solutionAr','solutionEn'):
    assert len(x[k].strip())>=12,(pid,k)
  assert x['questionAr']!=x['questionEn']
  opts=x['options']
  assert len(opts)==4 and {o['Order'] for o in opts}=={1,2,3,4}
  assert len({o['LatexCode'].strip() for o in opts})==4
  assert sum(o['IsCorrect'] for o in opts)==1
  right=next(o for o in opts if o['IsCorrect'])
  assert right['LatexCode']==str(answers[pid]),(pid,right['LatexCode'],answers[pid])
  assert right['LatexCode']==x['independentCorrectAnswer']
print('PASS: 12 measurement drafts independently checked (length, mass, litres, time, conversions)')
print('PASS: four distinct options, one correct key, Arabic/English objectives and no live publication')
