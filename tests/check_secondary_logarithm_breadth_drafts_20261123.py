#!/usr/bin/env python3
"""Independent solution and release-gate oracle for 12 unpublished logarithm drafts.

No network or database mutation; computes each correct option independently of
the author's listed answer and verifies complete bilingual educational content.
"""
import json
from fractions import Fraction as F
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
data=json.loads((ROOT/'content/editorial/secondary-logarithm-breadth-20261123.json').read_text(encoding='utf-8'))
meta=data['meta']
items=data['items']

def exact_log_integer(base,n):
    assert isinstance(base,int) and isinstance(n,int) and base>1 and n>0
    result=1
    for k in range(40):
        if result==n: return k
        if result>n: break
        result *= base
    raise AssertionError(f'Not an exact power of {base}: {n}')

def oracle(row):
    m=row['oracle']
    kind=m['kind']
    if kind=='power_inverse':
        return str(exact_log_integer(m['base'],m['target']))
    if kind=='product_law':
        return str(exact_log_integer(m['base'],m['a']*m['b']))
    if kind=='quotient_law':
        assert m['numerator']%m['denominator']==0
        return str(exact_log_integer(m['base'],m['numerator']//m['denominator']))
    if kind=='power_law':
        return str(m['exponent']*exact_log_integer(m['base'],m['inner']))
    if kind=='shifted_equation':
        return str(m['base']**m['exponent']+m['shift'])
    if kind=='two_log_equation':
        assert m['base']**m['result']==3 and m['offset']==2
        valid=[x for x in range(-20,21) if x>m['offset'] and x*(x-m['offset'])==3]
        assert len(valid)==1 and valid[0]==3
        assert (-1)*(-1-m['offset'])==3 and -1 <= m['offset'] # extraneous algebraic root
        return str(valid[0])
    if kind=='change_base':
        assert m['numeratorBase']**m['numExp']==8
        assert m['numeratorBase']**m['denExp']==4
        val=F(m['numExp'],m['denExp'])
        return rf'\frac{{{val.numerator}}}{{{val.denominator}}}'
    if kind=='domain_shift':
        assert m['shift']==5
        return 'x>'+str(m['shift'])
    if kind=='fraction_base':
        base=F(m['baseNumerator'],m['baseDenominator'])
        vals=[k for k in range(-10,11) if base**k==m['target']]
        assert len(vals)==1
        return str(vals[0])
    if kind=='decibels':
        return str(m['multiplier']*exact_log_integer(10,m['intensityRatio']))
    if kind=='ph_scale':
        assert F(10)**m['concentrationPower']==F(1,10000)
        return str(-m['concentrationPower'])
    if kind=='symbolic_product':
        assert m['factor']*m['symbolFactor']==24 and m['symbol']=='a'
        return f"{m['symbol']}+{exact_log_integer(2,m['factor'])}"
    raise AssertionError(f'Unexpected oracle {kind}')

assert meta['status']=='Draft' and meta['noStudentFacingChanges'] is True
assert meta['stageId']==3 and meta['topicProposalId']==7
assert meta['topicStableKey']=='s-exponents-logarithms'
assert meta['plannedCount']==len(items)==12
assert len({x['contentKey'] for x in items})==12
assert len({x['templateFamilyKey'] for x in items})==12
assert len({x['questionTextAr'] for x in items})==12
assert len({x['questionTextEn'] for x in items})==12
assert len({x['oracle']['kind'] for x in items})==12
assert len({x['primarySkillKey'] for x in items})>=4

for i,row in enumerate(items):
    assert row['contentKey'].startswith('mw-log-breadth-20261123-')
    assert row['templateFamilyKey'].startswith('s-log-breadth-')
    assert row['difficultyLevel'] in range(1,6)
    assert row['pisaProcess'] in {'formulate','employ','interpret_evaluate'}
    assert row['learningObjectiveAr']!=row['learningObjectiveEn']
    assert row['questionTextAr']!=row['questionTextEn']
    for f in ('learningObjectiveAr','learningObjectiveEn','questionTextAr','questionTextEn'):
        assert len(row[f].strip())>=20,(i,f)
    assert row['detailedSolutionAr'].startswith('القانون المستخدم:'),(i,'Arabic law')
    assert row['detailedSolutionEn'].startswith('Rule used:'),(i,'English law')
    assert len(row['detailedSolutionAr'])>=145 and len(row['detailedSolutionEn'])>=145,(i,'solution short')
    opts=row['options']
    assert len(opts)==4
    assert {o['Order'] for o in opts}=={1,2,3,4}
    assert len({o['LatexCode'] for o in opts})==4
    assert sum(o['IsCorrect'] for o in opts)==1
    answer=next(o['LatexCode'] for o in opts if o['IsCorrect'])
    independently_calculated=oracle(row)
    assert independently_calculated==answer==row['independentCorrectAnswer'],(
        row['contentKey'],independently_calculated,answer)

sql=(ROOT/'scripts/apply_secondary_logarithm_breadth_drafts_20261123.sql').read_text(encoding='utf-8')
assert 'INSERT INTO public."CurriculumDraftItems"' in sql
assert '"EditorialStatus"' in sql and "'Draft'" in sql
assert 'ON CONFLICT ("ContentKey") DO NOTHING' in sql
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."Problems"' not in sql
assert 'DELETE FROM' not in sql
assert 'INSERT INTO public."Problems"' not in sql
assert 'INSERT INTO public."Categories"' not in sql
assert 'UPDATE public."CurriculumTopicProposals"' not in sql
assert 'pg_advisory_xact_lock' in sql
assert all(x['contentKey'] in sql for x in items)
print('PASS: 12 independently computed logarithm answers; 4 original distinct choices each')
print('PASS: inverse exponents, product/quotient/power, domain/extraneous roots, change of base, scientific scales')
print('PASS: bilingual rule-led reasoning, unique math families, Draft-only source/answer safe SQL')
