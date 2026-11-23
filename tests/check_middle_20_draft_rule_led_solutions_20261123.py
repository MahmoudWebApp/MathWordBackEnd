#!/usr/bin/env python3
"""Validate twenty original-option-guarded, unpublished bilingual middle-school rule explanations."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
obj=json.loads((root/'content/editorial/middle-20-draft-rule-led-solutions-20261123.json').read_text(encoding='utf8'))
prev=json.loads((root/'docs/review-data/middle-36-independent-drafts-20261123.json').read_text(encoding='utf8'))
script=(root/'scripts/apply_middle_20_draft_rule_led_solutions_20261123.sql').read_text(encoding='utf8')
assert obj['draftOnly'] and obj['reviewedCount']==len(obj['changes'])==20
original={x['id']:x for x in prev['questions']}
assert {x['id'] for x in obj['changes']}=={x['id'] for x in prev['questions'] if x['topicProposalId'] in (6,10)}
assert script.count('UPDATE public."CurriculumDraftItems"')==20
assert script.count('GET DIAGNOSTICS affected=ROW_COUNT')==20
assert script.count('RAISE EXCEPTION')==20
assert '"EditorialStatus"=' in script and '::jsonb' in script
assert 'BEGIN;' in script and 'COMMIT;' in script
assert 'UPDATE public."Problems"' not in script and 'UPDATE public."QuestionOptions"' not in script
for r in obj['changes']:
    prior=original[r['id']]
    assert r['topicProposalId']==prior['topicProposalId']
    assert r['questionAr']==prior['questionAr'] and r['questionEn']==prior['questionEn']
    assert r['beforeAr']==prior['solutionAr'] and r['beforeEn']==prior['solutionEn']
    assert r['options']==prior['options']
    assert r['correctLatex']==prior['independentCorrectAnswer']
    assert next(o['LatexCode'] for o in r['options'] if o['IsCorrect'])==r['correctLatex']
    assert sum(o['IsCorrect'] for o in r['options'])==1
    assert r['afterAr'].startswith(('القانون المستخدم:','المبدأ المستخدم:'))
    assert r['afterEn'].startswith('Rule used:')
    assert len(r['afterAr'])>=165 and len(r['afterEn'])>=155
    assert r['afterAr']!=r['beforeAr'] and r['afterEn']!=r['beforeEn']
    assert str(r['id']) in script
print('PASS: 20 middle stage integer/inequality DraftItems improved in both languages with named laws')
print('PASS: immutable question and answer fields, Draft-only transaction, full rollback on mismatch')
