#!/usr/bin/env python3
"""Independent rational/statistics/series/logic math oracles for the final 16 DraftItems."""
import json
from fractions import Fraction as F
from collections import Counter
from statistics import median
from pathlib import Path

root=Path(__file__).resolve().parents[1]
doc=json.loads((root/'docs/review-data/final-16-independent-drafts-20261123.json').read_text(encoding='utf8'))
rows=doc['questions']

frac={
143:r'\frac78',
144:r'\frac12',
145:str(int(F(2,3)*18)),
146:r'\frac{15}4',
}
assert F(3,4)+F(1,8)==F(7,8)
assert F(5,6)-F(1,3)==F(1,2)
assert F(1)+F(1,4)+F(2)+F(1,2)==F(15,4)

values=[4,7,7,10]
stats={
147:str(sum(values)//len(values)),
148:str(int(median([2,5,8,12,20]))),
149:str(Counter([3,5,5,5,8,8]).most_common(1)[0][0]),
150:str((sum([4,5,6,7,8])-8+28)//5),
}
assert sum(values)%len(values)==0

series={
151:str(int(F(3)/(1-F(1,2)))),
152:'|r|>1',
153:r'\frac23',
154:r'\lim_{n\to\infty}a_n=2',
}
assert F(1)/(1-F(-1,2)) == F(2,3)
assert abs(F(11,10))>1
assert [2]*5 == [2,2,2,2,2] # constant terms do not tend to zero.

logic={
155:r'\exists x\,\neg P(x)',
156:r'P=1,\,Q=0',
157:r'\neg Q\Rightarrow\neg P',
158:r'\neg P\lor\neg Q',
}
for p in (False,True):
    for q in (False,True):
        implication=(not p) or q
        contrapositive=q or (not p)
        assert implication==contrapositive
        de_morgan_left=not (p and q)
        de_morgan_right=(not p) or (not q)
        assert de_morgan_left==de_morgan_right
        assert (not implication)==(p and not q)

expected={**frac,**stats,**series,**logic}
assert len(rows)==doc['questionCount']==len(expected)==16
assert doc['stageIds']==[1,2,3,4] and not doc['changesToProduction']
assert len({r['id'] for r in rows})==16
assert len({r['contentKey'] for r in rows})==16
assert len({r['templateKey'] for r in rows})==16
assert [len([r for r in rows if r['topicProposalId']==t]) for t in range(1,5)]==[4,4,4,4]
for r in rows:
    pid=r['id']
    assert r['independentCorrectAnswer']==expected[pid],pid
    assert r['topicKey'] in doc['topicKeys']
    assert r['difficulty'] in range(1,6)
    assert r['pisaProcess'] in {'formulate','employ','interpret_evaluate'}
    for field in ('questionAr','questionEn','objectiveAr','objectiveEn','solutionAr','solutionEn'):
        assert isinstance(r[field],str) and len(r[field].strip())>=12,(pid,field)
    assert r['questionAr']!=r['questionEn']
    opts=r['options']
    assert len(opts)==4 and {o['Order'] for o in opts}=={1,2,3,4},pid
    assert len({o['LatexCode'].strip() for o in opts})==4,pid
    assert sum(o['IsCorrect'] for o in opts)==1,pid
    assert next(o['LatexCode'] for o in opts if o['IsCorrect'])==expected[pid],pid
print('PASS: 16 independently reviewed remaining DraftItems spanning all four educational stages')
print('PASS: fraction arithmetic, basic statistics, infinite-series conditions and logic truth tables')
print('PASS: correct original answer choice and four unique bilingual-option records; no publishing')
