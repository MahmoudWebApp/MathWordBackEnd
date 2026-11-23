#!/usr/bin/env python3
"""Validate independent geometry/stats oracles and the locked 31-row editorial patch."""
import json
from fractions import Fraction
from pathlib import Path

base=Path(__file__).resolve().parents[1]
obj=json.loads((base/'content/editorial/middle-geometry-statistics-solutions-20261123.json').read_text(encoding='utf8'))
script=(base/'scripts/apply_middle_geometry_statistics_laws_20261123.sql').read_text(encoding='utf8')

# Exact correct option values independently derived from the original mathematics.
geometry={
 60:(117,229),
 218:((5-2)*180,864),230:((6-2)*180,911),242:((7-2)*180,958),
 254:((8-2)*180,1005),266:((9-2)*180,1056),
 625:(25,2490),626:((18//2)**2,2495),627:(6**2//2,2499),628:(8,2502),
 697:((180-40)//2,2843),698:(125-45,2847),699:(90-35,2851),
 700:(3*180//(1+2+3),2747),701:(30,2750),702:(65,2756),
 703:(146//2,2759),704:(2,2762)
}
stats={
 429:(8+12+10,1707),431:(3,1713),
 432:(7,1719),433:(20-3,1724),
 434:(Fraction(5,20)*100,1726),
 435:((3*2+2*7)//5,1732),
 479:(6,1906),481:(3,1915),482:(0,1919),
 823:((6-3)*4,3283),824:(max(23-14,19-23,31-19),3288),
 825:(Fraction(abs(2-4)+abs(4-4)+abs(6-4),3),3289),
 826:((18-6)-(15-9),3294)
}
expected={**geometry,**stats}
assert obj['reviewedCount']==36 and len(obj['unchangedAdequateIds'])==5
assert obj['unchangedAdequateIds']==[18,19,430,478,480]
assert len(obj['changes'])==31
assert {r['problemId'] for r in obj['changes']}==set(expected)
assert script.count('UPDATE public."Problems"')==31
assert script.count('GET DIAGNOSTICS affected = ROW_COUNT')==31
assert script.count('RAISE EXCEPTION')==31
assert 'BEGIN;' in script and 'COMMIT;' in script and 'UPDATE public."QuestionOptions"' not in script

pi_ids={625,626,627}
text_ids={479,482}
for r in obj['changes']:
  pid=r['problemId']; result,opt=expected[pid]
  assert r['correctOptionId']==opt,pid
  assert r['categoryId']==(8 if pid in geometry else 22) and r['stageId']==2
  assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
  assert len(r['afterAr'])>135 and len(r['afterEn'])>115
  assert f'"Id"={pid}' in script and f'o."Id"={opt}' in script
  answer=r['correctOptionLatex']
  if pid in pi_ids: assert answer==str(result)+r'\pi',pid
  elif pid==825: assert answer==r'\frac{4}{3}' and result==Fraction(4,3),pid
  elif pid==434: assert answer==r'25\%' and result==25,pid
  elif pid==431: assert answer=='+3' and result==3,pid
  elif pid in text_ids:
    assert answer.startswith(r'\text{'),pid
  else: assert answer==str(result),pid
print('PASS: 36 middle-stage questions reviewed, 31 individual Arabic/English law-led improvements')
print('PASS: independent geometry/probability/statistical arithmetic checks and immutable option IDs')
print('PASS: 31 exact-match conditional solution updates with transaction-wide rollback')
