#!/usr/bin/env python3
"""Independent law-first bilingual editorial contract for 16 unpublished source-locked drafts."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
obj=json.loads((root/'content/editorial/final-16-draft-rule-led-solutions-20261123.json').read_text(encoding='utf8'))
source=json.loads((root/'docs/review-data/final-16-independent-drafts-20261123.json').read_text(encoding='utf8'))
script=(root/'scripts/apply_final_16_draft_rule_led_solutions_20261123.sql').read_text(encoding='utf8')
assert obj['draftOnly'] and obj['reviewedCount']==obj['changeCount']==16
assert len(source['questions'])==len(obj['changes'])==16
assert script.count('UPDATE public."CurriculumDraftItems"')==16
assert script.count('GET DIAGNOSTICS affected=ROW_COUNT')==16
assert script.count('RAISE EXCEPTION')==16
assert 'BEGIN;' in script and 'COMMIT;' in script
assert '"EditorialStatus"=' in script and '::jsonb' in script
assert 'UPDATE public."Problems"' not in script and 'UPDATE public."QuestionOptions"' not in script
by_id={x['id']:x for x in source['questions']}
assert len(by_id)==16
for x in obj['changes']:
    v=by_id[x['id']]
    assert x['topicProposalId']==v['topicProposalId'],x['id']
    assert x['questionAr']==v['questionAr'] and x['questionEn']==v['questionEn']
    assert x['beforeAr']==v['solutionAr'] and x['beforeEn']==v['solutionEn']
    assert x['options']==v['options']
    assert x['correctLatex']==v['independentCorrectAnswer']
    assert len([a for a in x['options'] if a['IsCorrect']])==1
    assert next(a['LatexCode'] for a in x['options'] if a['IsCorrect'])==x['correctLatex']
    assert x['afterAr'].startswith(('القانون المستخدم:', 'المبدأ المستخدم:')),x['id']
    assert x['afterEn'].startswith('Rule used:'),x['id']
    assert len(x['afterAr'])>=170 and len(x['afterEn'])>=165,x['id']
    assert x['afterAr']!=x['beforeAr'] and x['afterEn']!=x['beforeEn']
    assert str(x['id']) in script
print('PASS: 16 previously answer-reviewed DraftItems have bilingual law-first worked solutions')
print('PASS: exact source questions, answers and options JSON protected in transaction')
print('PASS: draft-only, atomic rollback on any mismatch, no student or published problem mutation')
