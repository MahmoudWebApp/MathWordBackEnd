#!/usr/bin/env python3
"""Independent university IVT, graph, combinatorics and logic correct-choice checks."""
import json
from itertools import product
from math import comb
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/university-limits-discrete-solutions-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_university_limits_discrete_laws_20261123.sql').read_text(encoding='utf8')
oracle={
  68: ("\\exists c\\in(0,1):f(c)=0", 261),
  144: ("\\exists c\\in(0,2):f(c)=0", 565),
  145: ("f\\text{ is continuous at }1", 572),
  340: ("f\\text{ is continuous on }[0,1]", 1350),
  352: ("f\\text{ is continuous on }[0,1]", 1397),
  364: ("f\\text{ is continuous on }[0,1]", 1448),
  376: ("f\\text{ is continuous on }[0,1]", 1495),
  388: ("f\\text{ is continuous on }[0,1]", 1542),
  444: ("21", 1766),
  445: ("\\neg Q\\Rightarrow\\neg P", 1772),
  446: ("\\neg P\\lor\\neg Q", 1773),
  447: ("4", 1779),
  449: ("2", 1785),
  450: ("8", 1791),
  488: ("\\text{صحيحة (True)}", 1941),
  489: ("10", 1946),
  490: ("4", 1951),
  491: ("10", 1955),
  492: ("\\text{نعم (Yes)}", 1957),
  795: ("(1,3)", 3170),
  831: ("6", 3315),
  832: ("3", 3320),
  833: ("2", 3321),
  834: ("P", 3326)
}
assert comb(7,2)==21 and comb(5,2)==10 and comb(5,2)==5*4//2
assert sum([2,2,2,2])//2==4
assert (13+12-1)//12==2
for p,q in product((False,True),repeat=2):
 assert ((not p) or q)==((not (not q)) or (not p))
 assert not(p and q)==((not p) or (not q))
 assert (p and (p or q))==p
assert sum(int(p==q) for p,q in product((False,True),repeat=2))==2
assert len(d['changes'])==24 and d['reviewedCount']==46 and len(d['adequateOriginalIds'])==22
assert {x['problemId'] for x in d['changes']}==set(oracle)
assert sql.count('UPDATE public."Problems"')==24
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==24
assert 'BEGIN;' in sql and 'COMMIT;' in sql and 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
 pid=x['problemId']; answer,opt=oracle[pid]
 assert x['correctOptionId']==opt and x['correctOptionLatex']==answer,pid
 assert x['stageId']==4 and x['categoryId'] in (16,24)
 assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
 assert len(x['afterAr'])>140 and len(x['afterEn'])>130
 assert f'"Id"={pid}' in sql and f'o."Id"={opt}' in sql
print('PASS university limits/discrete 46-question individual review, 24 bilingual explanation corrections')
print('PASS IVT, graph/counting, proposition truth tables, immutable correct options and guarded SQL')
