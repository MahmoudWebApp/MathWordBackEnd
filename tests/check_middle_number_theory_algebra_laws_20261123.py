#!/usr/bin/env python3
"""Independent number-theory/algebra oracle verification for all 51 bilingual changes."""
import json
from math import gcd, lcm
from pathlib import Path
root=Path(__file__).resolve().parents[1]
data=json.loads((root/'content/editorial/middle-number-theory-algebra-solutions-20261123.json').read_text(encoding='utf8'))
script=(root/'scripts/apply_middle_number_theory_algebra_laws_20261123.sql').read_text(encoding='utf8')
checks={}
def put(i,ans,opt):
    assert i not in checks
    checks[i]=(str(ans),opt)

put(57,gcd(48,60),218)
for i,m,opt in [(73,3,284),(88,4,343),(103,5,402),(118,6,461),(133,7,524)]:
    put(i,'2^{'+str(m+2)+'}',opt)
for i,k,opt in [(209,2,827),(221,3,874),(233,4,921),(245,5,972),(257,6,1019)]:
    put(i,gcd(k*3,k*5),opt)
for i,b,exp1,exp2,opt in [(210,2,5,3,830),(222,3,6,4,877),(234,4,7,5,928),(246,5,8,6,975),(258,6,9,7,1022)]:
    put(i,str(b)+'^{'+str(exp1-exp2)+'}',opt)
for i,k,opt in [(211,2,833),(223,3,884),(235,4,931),(247,5,978),(259,6,1025)]:
    put(i,lcm(4*k,5*k),opt)
put(765,(-4)**3,3049);put(766,17**0,3054);put(767,r'\frac18',3057);put(768,3**3,3063)

put(42,4**2-3,158);put(58,(19-7)//2,223)
for i,a,b,x,opt in [(74,2,3,2,287),(89,3,4,3,346),(104,4,5,4,405),(119,5,6,5,468),(134,6,7,6,527)]:
    put(i,a*x+b,opt)
for i,a,b,target,opt in [(212,2,5,11,838),(224,3,6,18,885),(236,4,7,27,936),(248,5,8,38,983),(260,6,9,51,1030)]:
    put(i,(target-b)//a,opt)
for i,x1,y1,x2,y2,opt in [(213,1,4,4,10,841),(225,2,5,6,17,892),(237,3,6,8,26,939),(249,4,7,10,37,986),(261,5,8,12,50,1033)]:
    assert (y2-y1)%(x2-x1)==0
    put(i,(y2-y1)//(x2-x1),opt)
for i,a,b,x,opt in [(214,2,3,2,848),(226,3,4,3,895),(238,4,5,4,942),(250,5,6,5,989),(262,6,7,6,1040)]:
    put(i,a*x**2+b,opt)
put(621,28//4+3,2475)
put(622,13,2480)
put(623,9*3-6,2483)
put(624,(41-5)//3,2486)

assert data['reviewedCount']==56 and len(data['adequateOriginalIds'])==5
assert data['adequateOriginalIds']==[12,13,41,14,15]
assert len(checks)==len(data['changes'])==51
assert {r['problemId'] for r in data['changes']}==set(checks)
assert script.count('UPDATE public."Problems"')==51
assert script.count('GET DIAGNOSTICS affected=ROW_COUNT')==51
assert script.count('RAISE EXCEPTION')==51
assert 'BEGIN;' in script and 'COMMIT;' in script
assert 'UPDATE public."QuestionOptions"' not in script
for r in data['changes']:
    pid=r['problemId']; expected,opt=checks[pid]
    assert r['correctOptionId']==opt and r['correctOptionLatex']==expected,pid
    assert r['stageId']==2 and r['categoryId']==(5 if pid in {57,73,88,103,118,133,209,210,211,221,222,223,233,234,235,245,246,247,257,258,259,765,766,767,768} else 6)
    assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
    assert len(r['afterAr'])>150 and len(r['afterEn'])>140,pid
    assert f'"Id"={pid}' in script and f'o."Id"={opt}' in script
print('PASS 56 middle number theory/algebra questions reviewed; 51 distinct bilingual solution-law improvements')
print('PASS independent power, integer, GCD/LCM, slope and function answer oracles')
print('PASS all 51 exact-source/answer conditional SQL updates with transaction-wide rollback')
