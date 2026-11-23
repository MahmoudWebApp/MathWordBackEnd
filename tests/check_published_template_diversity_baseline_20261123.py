#!/usr/bin/env python3
"""Read-only quality baseline: verify 63 published numeric-template families.

The fixture is a historical production database snapshot. Similarity does not
mean mathematical incorrectness. We must never rewrite existing question
identities or student attempts merely to make this test green.
"""
import json
from collections import Counter
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
snapshot=json.loads((ROOT/'docs/review-data/published-template-diversity-20261123.json').read_text(encoding='utf-8'))
groups=snapshot['families']

assert snapshot['publishedProblemCount']==601
assert snapshot['unpublishedDraftCountAtAudit']==172
assert len(groups)==snapshot['numericTemplateFamilyCount']==63
assert sum(x['variantCount'] for x in groups)==snapshot['problemsInFamilies']==315
assert sum(x['variantCount']-1 for x in groups)==snapshot['excessNumericVariantsBeyondOnePerFamily']==252
assert snapshot['noAutomaticDeletion'] and snapshot['learnerHistoryMustBePreserved']
assert 'Heuristic similarity' in snapshot['method']

by_stage=Counter(x['stageId'] for x in groups)
assert dict(by_stage)=={1:16,2:16,3:16,4:15}
seen=set()
ids=set()
for g in groups:
    assert g['stageId'] in (1,2,3,4)
    assert g['variantCount']>=3
    assert len(g['problemIds'])==g['variantCount']
    assert g['problemIds']==sorted(g['problemIds'])
    assert len(set(g['problemIds']))==g['variantCount']
    assert isinstance(g['categoryId'],int)
    assert g['categoryAr'].strip() and g['categoryEn'].strip()
    assert g['normalizedPattern'].strip()
    k=(g['stageId'],g['categoryId'],g['normalizedPattern'])
    assert k not in seen,k
    seen.add(k)
    for pid in g['problemIds']:
        assert pid not in ids,f'Duplicate problem ID in different families: {pid}'
        ids.add(pid)
assert len(ids)==315
sql=(ROOT/'scripts/audit_published_problem_variety_20261123.sql').read_text(encoding='utf-8')
assert 'SELECT' in sql and 'regexp_replace' in sql
assert 'UPDATE public."Problems"' not in sql
assert 'DELETE FROM' not in sql and 'DROP TABLE' not in sql
print('PASS: 63 numeric-template families / 315 published questions / 252 extra variants')
print('PASS: per-stage families: 16, 16, 16, 15; disjoint problem IDs and repeatable read-only SQL')
print('PASS: historical answers and learner attempts are protected by non-destructive audit policy')
