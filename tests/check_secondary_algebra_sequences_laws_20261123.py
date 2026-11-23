#!/usr/bin/env python3
"""Independent advanced algebra roots, logs, sequences and telescoping sum oracles."""
import json
from fractions import Fraction
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/secondary-algebra-sequences-solutions-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_secondary_algebra_sequences_laws_20261123.sql').read_text(encoding='utf8')
oracles={}
def check(id,ans,opt):
 assert id not in oracles
 oracles[id]=(str(ans),opt)
check(21,5,73);check(61,4,234);check(640,2**5,2552)
for i,a,b,opt in [(77,2,5,300),(92,3,6,359),(107,4,7,418),(122,5,8,477),(137,6,9,540)]:
 check(i,a+b,opt)
for i,a,b,opt in [(269,2,5,1067),(281,3,6,1114),(293,4,7,1161),(305,5,8,1212),(317,6,9,1259)]:
 check(i,a*b,opt)
for i,b,c,opt in [(270,2,3,1070),(282,3,4,1117),(294,4,5,1168),(306,5,6,1215),(318,6,7,1262)]:
 check(i,b*b-4*c,opt)
for i,a,b,opt in [(271,2,3,1073),(283,3,4,1124),(295,4,5,1171),(307,5,6,1218),(319,6,7,1265)]:
 check(i,f'(x+{a})(x+{b})',opt)
check(436,'4n+1',1733)
check(438,(27-11)//(7-3),1742)
check(440,6*(2+17)//2,1750)
check(441,sum(2**i for i in range(5)),1753)
check(443,2*(2*2+1)+1,1764)
check(483,23-4*4,1921)
check(485,13,1931)
check(709,6//2,2782)
check(773,7+4*(-3),3082)
check(774,1+2+2+3,3087)
check(775,((1*1+1)**2+1)**2+1,3092)
check(776,5,3095)
check(827,r'8,\ 12,\ 16',3299)
check(828,(47-5)//3+1,3304)
check(830,r'\frac{4}{5}',3310)
assert d['reviewedCount']==62 and d['improvedCount']==38
assert len(d['adequateOriginalIds'])==24
assert len(oracles)==len(d['changes'])==38
assert {x['problemId'] for x in d['changes']}==set(oracles)
assert sql.count('UPDATE public."Problems"')==38
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==38
assert sql.count('RAISE EXCEPTION')==38
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
 pid=x['problemId'];answer,opt=oracles[pid]
 assert x['correctOptionId']==opt and x['correctOptionLatex']==answer,pid
 assert x['stageId']==3 and x['categoryId'] in (9,23)
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>155 and len(x['afterEn'])>150
 assert f'"Id"={pid}' in sql and f'o."Id"={opt}' in sql
print('PASS 62 upper-secondary algebra/series questions reviewed, 38 bilingual law-led improvements')
print('PASS independent discriminants, Vieta roots, recurrence, geometric and telescoping sums')
print('PASS immutable correct answer option IDs and 38 exact-source atomic SQL updates')
