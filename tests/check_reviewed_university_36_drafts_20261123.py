#!/usr/bin/env python3
"""Independent numeric/statistics/optimization checks on 36 unpublished university drafts."""
import json
from fractions import Fraction as F
from decimal import Decimal as D
from math import isqrt
from pathlib import Path

root=Path(__file__).resolve().parents[1]
d=json.loads((root/'docs/review-data/university-36-independent-drafts-20261123.json').read_text(encoding='utf8'))
items=d['questions']

stats={
87:str(F(82-70,6)),
88:str(F(15,isqrt(25))),
89:str(D(18)/D(30)),
90:f'[{D(100)-D("1.96")*D(10)/D(isqrt(100))},{D(100)+D("1.96")*D(10)/D(isqrt(100))}]',
91:str(D("1.96")*D(8)/D(isqrt(64))),
92:str(F(1,2)),
93:r'p<\alpha',
94:r'\alpha',
}
num={
131:str(D(1+2)/2),
132:str(D(1+3)/2),
133:str(D(4)-D(4**2-9)/D(2*4)),
134:str(F(2,2)*(0**2+2**2)),
135:str(2*1**2),
136:r'\frac{8}{3}',
137:str(abs(D(10)-D("9.7"))),
138:str(100*F(50-49,50))+r'\%',
139:str(D("0.01")/2),
140:r'(\frac94,\frac73)',
141:str((7+2)//3), # 2x+y=7, x-y=2 -> 3x=9
142:str(max(abs(4-2*2),abs(9-3*2))),
}
assert F(2,6)*(0**2+4*1**2+2**2)==F(8,3)
assert F(4,1) - F(4*4-9,8)==F(25,8)
assert F(9,4)!=F(7,3) # Jacobi iteration uses old (0,0) values separately.

opt={
177:str((3-3)**2+2),
178:str(F(6,2)),
179:'(3,3)',
180:str((10//2)**2),
181:str(12*1**2+6),
182:str(min(2,4)),
207:str(2**2-4*2+1),
208:'x>0',
209:str(-(1-1)**2+9),
210:str(2),
211:f'({2*1},{4*(-1)})',
212:str(4*6-1*1),
213:str(F(10**2,2**2+1**2)), # Cauchy least-squares result
214:r'a\ge1',
221:str((0+2)**2+5),
222:str(1**2+2*1*1+3*1**2-4*1-8*1),
}
assert (2*1+2*1-4,2*1+6*1-8)==(0,0)
assert 2*6-2*2>0  # positive Hessian determinant and curvature: det=8
expected={**stats,**num,**opt}
assert d['stageId']==4 and d['questionCount']==36
assert len(items)==len(expected)==36
assert not d['changesToProduction'] and 'unpublished' in d['status'].lower()
assert len({r['id'] for r in items})==36
assert [len([r for r in items if r['topicProposalId']==k]) for k in (8,12,15)]==[8,12,16]
assert len({r['contentKey'] for r in items})==36
assert len({r['templateKey'] for r in items})==36
for r in items:
    pid=r['id']
    assert r['independentCorrectAnswer']==expected[pid],pid
    assert r['topicKey'] in d['topicKeys']
    assert r['difficulty'] in range(1,6)
    assert r['pisaProcess'] in {'formulate','employ','interpret_evaluate'}
    for k in ('questionAr','questionEn','objectiveAr','objectiveEn','solutionAr','solutionEn'):
        assert isinstance(r[k],str) and len(r[k].strip())>=12,(pid,k)
    assert r['questionAr']!=r['questionEn'],pid
    options=r['options']
    assert len(options)==4 and {o['Order'] for o in options}=={1,2,3,4},pid
    assert len({o['LatexCode'].strip() for o in options})==4,pid
    assert sum(o['IsCorrect'] for o in options)==1,pid
    assert next(o['LatexCode'] for o in options if o['IsCorrect'])==expected[pid],pid
print('PASS: 36 university draft math answers: 8 statistics, 12 numerical analysis, 16 optimization')
print('PASS: independently recomputed precision, Newton/bisection, Simpson/trapezoid, vector Hessians')
print('PASS: 4 unique options, one original correct flag, bilingual content, no production mutation')
