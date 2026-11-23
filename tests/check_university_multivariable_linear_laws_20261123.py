#!/usr/bin/env python3
"""Independent oracle for 22 multivariable & 23 linear-algebra worked-solution changes."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/university-multivariable-linear-solutions-20261123.json').read_text(encoding='utf-8'))
sql=(root/'scripts/apply_university_multivariable_linear_laws_20261123.sql').read_text(encoding='utf-8')
oracles={}
def add(pid,value,option):
 assert pid not in oracles
 oracles[pid]=(str(value),option)

# Multivariable calculus: partials, gradients and directional derivatives.
add(49,2*2*1,185);add(65,'(2,4)',250)
for pid,a,b,x,y,opt in [(81,2,1,2,1,316),(96,3,2,3,2,375),(111,4,3,4,3,434),(126,5,4,5,4,493),(141,6,5,6,5,556)]:
 add(pid,2*a*x*y,opt)
for pid,a,b,x,y,opt in [(329,2,1,2,3,1307),(341,3,2,3,4,1354),(353,4,3,4,5,1401),(365,5,4,5,6,1452),(377,6,5,6,7,1499)]:
 add(pid,a*x*x+2*b*y,opt)
for pid,x,y,opt in [(330,2,3,1310),(342,3,4,1357),(354,4,5,1408),(366,5,6,1455),(378,6,7,1502)]:
 add(pid,'('+str(2*x)+','+str(2*y)+')',opt)
for pid,x,y,opt in [(331,1,2,1313),(343,2,3,1364),(355,3,4,1411),(367,4,5,1458),(379,5,6,1505)]:
 add(pid,2*x,opt)

# Linear algebra: determinant ad−bc, traces, scalar products, triangular determinants.
add(30,2*4-3*1,109);add(50,2*4-1*3,190);add(66,1*3+2*4,255)
for pid,a,b,c,dd,opt in [(82,2,1,2,4,319),(97,3,2,2,5,378),(112,4,3,2,6,437),(127,5,4,2,7,500),(142,6,5,2,8,559)]:
 add(pid,a*dd-b*c,opt)
for pid,a,b,opt in [(332,2,4,1318),(344,3,5,1365),(356,4,6,1416),(368,5,7,1463),(380,6,8,1510)]:
 add(pid,a+b,opt)
for pid,a,b,k,opt in [(333,3,4,2,1321),(345,4,5,3,1372),(357,5,6,4,1419),(369,6,7,5,1466),(381,7,8,6,1513)]:
 add(pid,'('+str(a*k)+','+str(b*k)+')',opt)
for pid,a,b,c,opt in [(334,2,3,5,1328),(346,3,4,6,1375),(358,4,5,7,1422),(370,5,6,8,1469),(382,6,7,9,1520)]:
 add(pid,a*c,opt)

assert d['reviewedCount']==60 and d['improvedCount']==45 and len(d['adequateOriginalIds'])==15
assert len(oracles)==len(d['changes'])==45
assert {x['problemId'] for x in d['changes']}==set(oracles)
assert sql.count('UPDATE public."Problems"')==45
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==45
assert sql.count('RAISE EXCEPTION')==45
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
 pid=x['problemId'];answer,opt=oracles[pid]
 assert x['correctOptionId']==opt and x['correctOptionLatex']==answer,pid
 assert x['stageId']==4 and x['categoryId'] in (13,14)
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>125 and len(x['afterEn'])>120
 assert f'"Id"={pid}' in sql and f'o."Id"={opt}' in sql
print('PASS 60 university multivariable and linear-algebra questions reviewed')
print('PASS independent partial, gradient, directional, determinant, trace and vector oracles for 45 explanations')
print('PASS correct option IDs and original source guarded in one atomic SQL transaction')
