#!/usr/bin/env python3
"""Independent ratio, percentage, scale, similarity and Pythagoras regression contract."""
import json
from math import isqrt
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/middle-ratios-pythagoras-solutions-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_middle_ratios_pythagoras_laws_20261123.sql').read_text(encoding='utf8')

checks={}
def check(id,value,option):
    assert id not in checks
    checks[id]=(value,option)

for id,cost,opt in [(75,12,290),(90,15,349),(105,18,412),(120,21,471),(135,24,530)]:
    check(id,cost*5//3,opt)
for id,price,pct,opt in [(215,100,10,849),(227,120,20,900),(239,140,25,947),(251,160,40,994),(263,180,50,1041)]:
    check(id,price*pct//100,opt)
for id,scale,map_distance,opt in [(216,2,3,856),(228,3,4,903),(240,4,5,950),(252,5,6,997),(264,6,7,1048)]:
    check(id,scale*map_distance,opt)
for id,initial,opt in [(217,40,859),(229,60,906),(241,80,953),(253,100,1004),(265,120,1051)]:
    check(id,initial*125//100,opt)
check(629,45*2//(2+7),2506)
check(630,35*3//5,2510)
check(631,36*4//9,2515)
check(632,12*5//3,2519)

for id,a,b,opt in [(76,3,4,293),(91,6,8,356),(106,9,12,415),(121,12,16,474),(136,15,20,533)]:
    check(id,isqrt(a*a+b*b),opt)
for id,hyp,leg,opt in [(219,5,3,867),(231,13,5,914),(243,17,8,961),(255,25,7,1012),(267,41,9,1059)]:
    check(id,isqrt(hyp*hyp-leg*leg),opt)
for id,side,factor,opt in [(220,3,2,870),(232,4,3,917),(244,5,4,968),(256,6,5,1015),(268,7,6,1062)]:
    check(id,side*factor,opt)

assert d['reviewedCount']==48 and len(d['unchangedAdequateIds'])==9
assert d['unchangedAdequateIds']==[16,17,43,59,44,855,856,857,858]
assert len(checks)==len(d['changes'])==39
assert {x['problemId'] for x in d['changes']}==set(checks)
assert sql.count('UPDATE public."Problems"')==39
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==39
assert sql.count('RAISE EXCEPTION')==39
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for row in d['changes']:
    pid=row['problemId'];expected,opt=checks[pid]
    assert row['correctOptionId']==opt and row['correctOptionLatex']==str(expected),pid
    assert row['stageId']==2 and row['categoryId'] in {7,34}
    assert row['beforeAr']!=row['afterAr'] and row['beforeEn']!=row['afterEn']
    assert len(row['afterAr'])>160 and len(row['afterEn'])>150,pid
    assert str(expected) in row['afterAr'] and str(expected) in row['afterEn']
    assert f'"Id"={pid}' in sql and f'o."Id"={opt}' in sql
print('PASS: all 48 middle ratio/triangles questions reviewed and 39 individualized bilingual solutions')
print('PASS: independent percent/proportion and Pythagorean/similarity numeric answers')
print('PASS: 39 exact original-answer SQL guards, all-or-nothing transaction, no learner data edits')
