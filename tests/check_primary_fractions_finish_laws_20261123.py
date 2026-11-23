#!/usr/bin/env python3
"""Independent primary fractions/percentage/decimal math review and SQL guards."""
import json,re
from decimal import Decimal,ROUND_HALF_UP
from fractions import Fraction
from pathlib import Path
root=Path(__file__).resolve().parents[1]
doc=json.loads((root/'content/editorial/primary-fractions-complete-review-20261123.json').read_text(encoding='utf-8'))
sql=(root/'scripts/apply_primary_fractions_finish_laws_20261123.sql').read_text(encoding='utf-8')
oracles={
423:(Fraction(2,3)*36,1682),424:(Fraction(3,8),1685),
426:(Fraction(25,100)*80,1694),
427:(Decimal('4.786').quantize(Decimal('0.01'),rounding=ROUND_HALF_UP),1699),
477:(Fraction(5,8),1898),617:(Fraction(10,100)*340,2459),
618:(Fraction(5,100)*260,2462),
619:(Fraction(30,120)*100,2466),620:(Fraction(25,100)*80,2470),
693:(Fraction(3,5)*20,2826),694:(Fraction(14,21),2830),
695:(Fraction(75,100),2835),
696:(Fraction(2,3)<Fraction(3,4),2839),
817:(Fraction(9,12),3257),818:(Fraction(8+3,8),3262),
819:(Fraction(1,2)*Fraction(3,4),3267),
820:(Fraction(2,3)/4,3272),822:(Decimal('0.47')*10,3278)
}
assert doc['reviewedProblemCount']==34 and len(doc['changes'])==18
assert len(doc['unchangedAdequateProblemIds'])==16
assert {x['problemId'] for x in doc['changes']}==set(oracles)
assert sql.count('UPDATE public."Problems"')==18
assert sql.count('GET DIAGNOSTICS affected = ROW_COUNT')==18
assert sql.count('RAISE EXCEPTION')==18
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
def parse_fraction(value):
  m=re.fullmatch(r'\\frac\{?(\d+)\}?\{?(\d+)\}?',value)
  assert m is not None,value
  return Fraction(int(m.group(1)),int(m.group(2)))
for r in doc['changes']:
  pid=r['problemId'];expected,option=oracles[pid]
  assert r['expectedCorrectOptionId']==option,pid
  v=r['expectedOptionLatex']
  if pid==696:
    assert v==r'\frac23<\frac34' and expected is True,pid
  elif pid==619:
    assert v=='25%' and Fraction(25,1)==expected,pid
  elif v.startswith(r'\frac'):
    assert parse_fraction(v)==expected,pid
  else:
    assert Decimal(v)==Decimal(str(expected)),pid
  assert (r['stageId'],r['categoryId'])==(1,21)
  assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
  assert len(r['afterAr'])>115 and len(r['afterEn'])>110,pid
  assert f'"Id"={pid}' in sql and f'o."Id"={option}' in sql
print('PASS: 34 primary fractions/decimals items reviewed; 18 improved bilingual solutions')
print('PASS: independent fractions, percentages, decimal rounding, percent changes and answer IDs')
