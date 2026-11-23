#!/usr/bin/env python3
"""Independent original-answer and protected law-first editorial contract for 40 remaining drafts."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
s=json.loads((root/'content/editorial/final-secondary-20-draft-laws-20261123.json').read_text(encoding='utf8'))
u=json.loads((root/'content/editorial/final-university-20-draft-laws-20261123.json').read_text(encoding='utf8'))
old_s=json.loads((root/'docs/review-data/secondary-36-independent-drafts-20261123.json').read_text(encoding='utf8'))
old_u=json.loads((root/'docs/review-data/university-36-independent-drafts-20261123.json').read_text(encoding='utf8'))
sql=(root/'scripts/apply_final_40_draft_rule_led_solutions_20261123.sql').read_text(encoding='utf8')
changes=s['changes']+u['changes']
previous={x['id']:x for x in old_s['questions']+old_u['questions']}
assert s['draftOnly'] and u['draftOnly'] and s['stageId']==3 and u['stageId']==4
assert s['reviewedCount']==len(s['changes'])==20 and u['reviewedCount']==len(u['changes'])==20
assert {x['id'] for x in s['changes']}=={x['id'] for x in old_s['questions'] if x['topicProposalId'] in (7,11)}
assert {x['id'] for x in u['changes']}=={x['id'] for x in old_u['questions'] if x['topicProposalId'] in (8,12)}
assert len({x['id'] for x in changes})==40
assert sql.count('UPDATE public."CurriculumDraftItems"')==40
assert sql.count('GET DIAGNOSTICS affected=ROW_COUNT')==40
assert sql.count('RAISE EXCEPTION')==40
assert sql.count('"EditorialStatus"=')==40
assert sql.count('::jsonb')==40
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."Problems"' not in sql and 'UPDATE public."QuestionOptions"' not in sql
for r in changes:
    old=previous[r['id']]
    assert r['topicProposalId']==old['topicProposalId']
    assert r['questionAr']==old['questionAr'] and r['questionEn']==old['questionEn']
    assert r['beforeAr']==old['solutionAr'] and r['beforeEn']==old['solutionEn']
    assert r['options']==old['options']
    assert r['correctLatex']==old['independentCorrectAnswer']
    assert sum(o['IsCorrect'] for o in r['options'])==1
    assert next(o['LatexCode'] for o in r['options'] if o['IsCorrect'])==r['correctLatex']
    assert r['afterAr'].startswith(('القانون المستخدم:','المبدأ المستخدم:'))
    assert r['afterEn'].startswith('Rule used:')
    assert len(r['afterAr'])>=150 and len(r['afterEn'])>=140,r['id']
    assert r['afterAr']!=r['beforeAr'] and r['afterEn']!=r['beforeEn']
print('PASS: all 40 remaining upper-secondary/university draft explanations have explicit bilingual laws')
print('PASS: unchanged independently checked answers, questions and option JSON')
print('PASS: Draft-only atomic rollback on all 40 updates; no published or learner mutation')
