#!/usr/bin/env python3
"""Independent combinations, fair-coin probability, weighted mean and population variance."""
import json,re
from fractions import Fraction
from math import comb
from pathlib import Path
base=Path(__file__).resolve().parents[1]
d=json.loads((base/'content/editorial/secondary-probability-statistics-solutions-20261123.json').read_text(encoding='utf8'))
sql=(base/'scripts/apply_secondary_probability_stats_laws_20261123.sql').read_text(encoding='utf8')

checks={}
for id,n,opt in [(64,3,245),(279,2,1107),(291,3,1154),(303,4,1201),(315,5,1252),(327,6,1299)]:
 checks[id]=(Fraction(1,2**n),opt)
for id,n,opt in [(80,4,309),(95,5,372),(110,6,431),(125,7,490),(140,8,549)]:
 checks[id]=(Fraction(comb(n,2),2**n),opt)
for id,a,b,k,opt in [(280,2,8,3,1110),(292,3,9,4,1157),(304,4,10,5,1208),(316,5,11,6,1255),(328,6,12,7,1302)]:
 checks[id]=(Fraction(a*k+b*k,2*k),opt)
data=[2,2,4,4]
mean=Fraction(sum(data),len(data))
variance=sum((Fraction(x)-mean)**2 for x in data)/len(data)
checks[48]=(variance,184)

def to_fraction(raw):
 m=re.fullmatch(r'\\frac\{?(\d+)\}?\{?(\d+)\}?',raw)
 if m:return Fraction(int(m.group(1)),int(m.group(2)))
 return Fraction(int(raw))

assert d['reviewedCount']==32 and d['improvedCount']==17
assert len(d['unchangedAdequateIds'])==15
assert len(checks)==len(d['changes'])==17
assert {x['problemId'] for x in d['changes']}==set(checks)
assert sql.count('UPDATE public."Problems"')==17
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==17
assert sql.count('RAISE EXCEPTION')==17
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
 pid=x['problemId'];result,opt=checks[pid]
 assert x['correctOptionId']==opt and to_fraction(x['correctOptionLatex'])==result,pid
 assert x['stageId']==3 and x['categoryId'] in {12,35}
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>160 and len(x['afterEn'])>150
 assert f'"Id"={pid}' in sql and f'o."Id"={opt}' in sql
print('PASS: 32 secondary probability/statistics questions reviewed, 17 law-led bilingual improvements')
print('PASS: exact combinations, unsimplified-but-correct probability fractions and population variance')
print('PASS: original answer options and stage/category guarded in atomic 17-row SQL')
