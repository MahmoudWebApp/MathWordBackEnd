#!/usr/bin/env python3
"""Read-only independent math answer audit for 36 unpublished upper-secondary drafts."""
import json
from fractions import Fraction as F
from math import isqrt
from pathlib import Path

doc=json.loads((Path(__file__).resolve().parents[1]/'docs/review-data/secondary-36-independent-drafts-20261123.json').read_text(encoding='utf8'))
items=doc['questions']

# Independently evaluate exponential models, half-life, proportional change.
exp={
79:str(int(250*F(6,5)**2)),
80:str(80*(2**3)),
81:format(int(2000*F(11,10)**2),','),
82:str(int(1200*F(9,10)**2)),
83:str(4*3),  # 640 / 80 = 2^3 half-lives, four hours each
84:str(int((1-F(7,10))*100))+'%',
85:str(int((F(103,100)-1)*100))+'%',
86:r'a_n=2\cdot3^{n-1}', # first term 2 and common ratio 3
}
assert [2*3**(n-1) for n in range(1,5)]==[2,6,18,54]

geo={
119:str(F(10-2,5-1)),
120:f'({(2+8)//2},{(6+0)//2})',
121:str(isqrt((6-0)**2+(8-0)**2)),
122:'y='+str(-2)+'x+'+str(3),
123:str(isqrt(49)),
124:f'(x-2)^2+(y+3)^2={4*4}',
125:f'(x-1)^2+y^2={((4-(-2))//2)**2}',
126:'(3,4)',  # 3^2 + 4^2 = 25
127:'x='+str((0+4)//2),
128:'y='+str((1+7)//2),
129:f'(x-1)^2+(y-2)^2={3*3}',
130:'y='+str((-2+6)//2),
}
assert 3**2+4**2==25

vectors={
171:f'({-1-2},{5-(-1)})',
172:f'({2+(-5)},{-3+4})',
173:str(isqrt(5**2+12**2)),
174:str(isqrt((-6)**2+8**2)),
175:str(2*4+(-1)*3),
176:str((2*6)//3),
199:f'({2*4-(-1)},{2*(-2)-3})',
200:r'(\frac{3}{5},\frac{4}{5})',
201:r'\frac{\pi}{4}',
202:str(1*(-2)+(-2)*1),
203:str(F(3*1+4*0,isqrt(1**2+0**2))),
204:str(abs(3*4-0*0)//2),
205:str(isqrt((7-1)**2+(10-2)**2)),
206:str(abs(2*3-1*1)),
219:str(-isqrt(5**2-4**2)),
220:str(1*(3+(-1))+2*(0+1)),
}
expected={**exp,**geo,**vectors}
assert doc['stageId']==3 and doc['questionCount']==36
assert len(items)==len(expected)==36 and not doc['changesToProduction']
assert len(set(x['id'] for x in items))==36
assert [len([x for x in items if x['topicProposalId']==i]) for i in (7,11,14)] == [8,12,16]
assert len(set(x['contentKey'] for x in items))==36
assert len(set(x['templateKey'] for x in items))==36

for row in items:
    pid=row['id']
    assert row['independentCorrectAnswer']==expected[pid],pid
    assert row['topicKey'] in doc['topicKeys'] and row['difficulty'] in range(1,6),pid
    assert row['pisaProcess'] in {'formulate','employ','interpret_evaluate'},pid
    for field in ('objectiveAr','objectiveEn','questionAr','questionEn','solutionAr','solutionEn'):
        assert isinstance(row[field],str) and len(row[field].strip())>=12,(pid,field)
    assert row['questionAr']!=row['questionEn'],pid
    options=row['options']
    assert len(options)==4 and {o['Order'] for o in options}=={1,2,3,4},pid
    assert len({o['LatexCode'].strip() for o in options})==4,pid
    assert sum(o['IsCorrect'] for o in options)==1,pid
    flagged=next(o['LatexCode'] for o in options if o['IsCorrect'])
    assert flagged==expected[pid],(pid,flagged,expected[pid])
    if row['topicProposalId']==14:
        assert row['solutionEn'].startswith('Rule used:'),(pid,'vector rule not explicit')

print('PASS: 36 upper-secondary unpublished drafts, 8 exponential, 12 analytic geometry, 16 vector items')
print('PASS: independent fractional exponentials, coordinates, circle centers, norms, products, determinants')
print('PASS: 4 distinct options, exactly one correct key, bilingual math and objectives, no publishing')
