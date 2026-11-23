#!/usr/bin/env python3
"""Immutable-source and law-first checks for 20 previously mathematically verified primary drafts."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
obj=json.loads((root/'content/editorial/primary-20-draft-rule-led-solutions-20261123.json').read_text(encoding='utf8'))
a=json.loads((root/'docs/review-data/primary-number-sense-24-20261123.json').read_text(encoding='utf8'))
b=json.loads((root/'docs/review-data/primary-measure-units-12-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_primary_20_draft_rule_led_solutions_20261123.sql').read_text(encoding='utf8')
previous={x['id']:x for x in a['questions']+b['questions']}
ids={63,64,65,66,67,68,69,70,*range(95,107)}
assert obj['reviewedCount']==len(obj['changes'])==20 and obj['draftOnly']
assert {x['id'] for x in obj['changes']}==ids
assert sql.count('UPDATE public."CurriculumDraftItems"')==20
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==20
assert sql.count('RAISE EXCEPTION')==20
assert '"EditorialStatus"=' in sql and '::jsonb' in sql
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."Problems"' not in sql and 'UPDATE public."QuestionOptions"' not in sql
for r in obj['changes']:
    v=previous[r['id']]
    assert r['topicProposalId']==v['topicProposalId']
    assert r['questionAr']==v['questionAr'] and r['questionEn']==v['questionEn']
    assert r['beforeAr']==v['solutionAr'] and r['beforeEn']==v['solutionEn']
    assert r['options']==v['options']
    assert r['correctLatex']==v['independentCorrectAnswer']
    assert sum(o['IsCorrect'] for o in r['options'])==1
    assert next(o['LatexCode'] for o in r['options'] if o['IsCorrect'])==r['correctLatex']
    assert r['afterAr'].startswith(('القانون المستخدم:','المبدأ المستخدم:'))
    assert r['afterEn'].startswith('Rule used:')
    assert len(r['afterAr'])>=160 and len(r['afterEn'])>=150
    assert r['afterAr']!=r['beforeAr'] and r['afterEn']!=r['beforeEn']
print('PASS: 20 primary number-sense / unit-conversion draft explanations have explicit bilingual rules')
print('PASS: all original mathematics/options remain answer-oracle checked, guards atomic and Draft only')
