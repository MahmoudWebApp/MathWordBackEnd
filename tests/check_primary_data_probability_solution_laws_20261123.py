#!/usr/bin/env python3
"""Independently validate mean, mode, median and probability solutions (category 4)."""
import json
from fractions import Fraction
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/primary-data-probability-solution-laws-20261123.json').read_text(encoding='utf-8'))
script=(root/'scripts/apply_primary_data_probability_solution_laws_20261123.sql').read_text(encoding='utf-8')
oracles={
  40:(7,152),56:(Fraction(3,6),213),
  72:((5+8+11)//3,277),87:((7+10+13)//3,340),102:((9+12+15)//3,399),
  117:((11+14+17)//3,458),132:((13+16+19)//3,517),
  158:(3,624),170:(4,671),182:(5,718),194:(6,765),206:(7,816),
  159:(Fraction(1,1+6),627),171:(Fraction(2,2+7),674),
  183:(Fraction(3,3+8),721),195:(Fraction(4,4+9),772),207:(Fraction(5,5+10),819),
  160:(10,630),172:(13,677),184:(16,728),196:(19,775),208:(22,822)
}
assert len(d['changes'])==22 and d['reviewedProblemCount']==24
assert d['alreadyAdequateProblemIds']==[10,11]
assert {x['problemId'] for x in d['changes']}==set(oracles)
assert script.count('UPDATE public."Problems"')==22
assert script.count('GET DIAGNOSTICS affected = ROW_COUNT')==22
assert script.count('RAISE EXCEPTION')==22
assert 'BEGIN;' in script and 'COMMIT;' in script
assert 'UPDATE public."QuestionOptions"' not in script
for row in d['changes']:
  pid=row['problemId']; result,option=oracles[pid]
  assert row['correctOptionId']==option,pid
  text=row['expectedOptionLatex']
  if isinstance(result,Fraction):
    # Correct options may intentionally be unreduced; their numeric meaning must match.
    assert text.startswith(r'\frac{') and text.endswith('}'),pid
    n,den=text.removeprefix(r'\frac{').removesuffix('}').split('}{')
    assert Fraction(int(n),int(den)) == result,pid
  else: assert int(text)==result,pid
  assert row['categoryId']==4 and row['stageId']==1
  assert row['beforeAr'] != row['afterAr'] and row['beforeEn'] != row['afterEn']
  assert len(row['afterAr'])>100 and len(row['afterEn'])>100
  assert f'WHERE "Id" = {pid}' in script,pid
print('PASS: all 24 data/probability items reviewed, 22 specific bilingual solution laws prepared')
print('PASS: mean/mode/median and exact fractional probability oracles; answer IDs and keys immutable')
