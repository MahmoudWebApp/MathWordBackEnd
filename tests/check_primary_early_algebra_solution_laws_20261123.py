#!/usr/bin/env python3
"""Read-only independent arithmetic audit of 21 early algebra law-led solutions."""
from pathlib import Path
import json
root=Path(__file__).resolve().parents[1]
obj=json.loads((root/'content/editorial/primary-early-algebra-solution-laws-20261123.json').read_text(encoding='utf-8'))
sql=(root/'scripts/apply_primary_early_algebra_solution_laws_20261123.sql').read_text(encoding='utf-8')
oracles={
  38:(23-9,142),54:(36//4,207),70:(12-7,271),
  85:(15-8,330),100:(18-9,389),115:(21-10,452),130:(24-11,511),
  152:((10-4)//2,598),164:((17-5)//3,645),176:((26-6)//4,696),
  188:((37-7)//5,743),200:((50-8)//6,790),
  153:(2+4*3,601),165:(3+4*4,652),177:(4+4*5,699),
  189:(5+4*6,746),201:(6+4*7,793),
  689:(54//6,2811),690:(91//7,2815),691:(72//8,2819),692:(12*5,2823)
}
assert obj['reviewedProblemCount']==28
assert obj['unchangedAdequateProblemIds']==[6,7,154,166,178,190,202]
assert len(obj['changes'])==len(oracles)==21
assert {row['problemId'] for row in obj['changes']}==set(oracles)
assert sql.count('UPDATE public."Problems"')==21
assert sql.count('GET DIAGNOSTICS affected = ROW_COUNT')==21
assert sql.count('RAISE EXCEPTION')==21
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for r in obj['changes']:
    pid=r['problemId']
    assert (r['expectedNumericAnswer'],r['expectedAnswerOptionId'])==oracles[pid],pid
    assert (r['stageId'],r['categoryId'])==(1,2)
    assert r['beforeAr']!=r['afterAr'] and r['beforeEn']!=r['afterEn']
    assert len(r['afterAr'])>105 and len(r['afterEn'])>100
    assert str(oracles[pid][0]) in r['afterAr'] and str(oracles[pid][0]) in r['afterEn']
    assert f'WHERE "Id" = {pid}' in sql
    assert f'q."Id" = {r["expectedAnswerOptionId"]}' in sql
print("PASS 28 primary early algebra questions reviewed; 21 bilingual solution laws improved")
print("PASS 21 correct immutable option IDs and numeric oracles; atomic text-only SQL guards")
