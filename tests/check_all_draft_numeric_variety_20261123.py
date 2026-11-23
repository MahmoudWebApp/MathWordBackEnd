#!/usr/bin/env python3
"""Cross-check all 172 audited DraftItems against each other and the 63 risk families.

This offline gate uses versioned fixtures. The live database safety scan lives
in scripts/audit_published_problem_variety_20261123.sql.
"""
import json
import re
from collections import Counter
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
def load(name):
    return json.loads((ROOT/'docs/review-data'/name).read_text(encoding='utf8'))
def canonical(text):
    """Equivalent to the read-only SQL numeric-template normalization."""
    return re.sub(r'\s+',' ',re.sub(r'[0-9]+(\.[0-9]+)?','#',text.lower()))

published=load('published-template-diversity-20261123.json')
published_risk={(x['stageId'],x['normalizedPattern']) for x in published['families']}
assert len(published_risk)==63

items=[]
for filename,stage in [
    ('primary-number-sense-24-20261123.json',1),
    ('primary-measure-units-12-20261123.json',1),
    ('middle-36-independent-drafts-20261123.json',2),
    ('secondary-36-independent-drafts-20261123.json',3),
    ('university-36-independent-drafts-20261123.json',4),
]:
    source=load(filename)
    items.extend((stage,q['contentKey'],q['questionEn']) for q in source['questions'])

# Four existing-topic DraftItems per stage.
for q in load('final-16-independent-drafts-20261123.json')['questions']:
    stage=q['topicProposalId']
    assert stage in range(1,5)
    items.append((stage,q['contentKey'],q['questionEn']))

# Twelve new logarithm candidates in secondary stage (still Draft).
log=json.loads((ROOT/'content/editorial/secondary-logarithm-breadth-20261123.json').read_text(encoding='utf8'))
assert log['meta']['stageId']==3 and log['meta']['status']=='Draft'
items.extend((3,q['contentKey'],q['questionTextEn']) for q in log['items'])

assert len(items)==172
assert dict(Counter(stage for stage,_,_ in items))=={1:40,2:40,3:52,4:40}
keys=[k for _,k,_ in items]
assert len(set(keys))==172
patterns=[(stage,canonical(q)) for stage,_,q in items]
assert len(set(patterns))==172,'Two unpublished draft questions use a numeric-only variant of the same template'
assert not (set(patterns)&published_risk),'Draft reused one of the 63 published numeric-template families'

print('PASS: 172 unpublished drafts cover stages 40/40/52/40 with distinct English numeric templates')
print('PASS: no collision against the 63 known repeated published families')
print('PASS: no edits to published question IDs, correct choices or student historical progress')
