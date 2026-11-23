#!/usr/bin/env python3
"""Independent geometry equation oracles and atomic patch check."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=json.loads((root/'content/editorial/primary-geometry-finish-law-review-20261123.json').read_text(encoding='utf-8'))
sql=(root/'scripts/apply_primary_geometry_finish_laws_20261123.sql').read_text(encoding='utf-8')
areas={71:(6,3,274),86:(7,4,333),101:(8,5,396),131:(10,7,514)}
perimeters={155:(7,4,609),167:(8,5,660),191:(10,7,754),203:(11,8,801)}
angles={168:(57,63,663),180:(64,66,710),192:(71,69,757),204:(78,72,808)}
metres={169:(3,666),181:(4,713),193:(5,764),205:(6,811)}
answer={i:(l*w,k) for i,(l,w,k) in areas.items()}
answer.update({i:(2*(l+w),k) for i,(l,w,k) in perimeters.items()})
answer.update({i:(180-a-b,k) for i,(a,b,k) in angles.items()})
answer.update({i:(100*m,k) for i,(m,k) in metres.items()})
assert d['reviewedProblemCount']==28 and len(d['previouslyReviewedProblemIds'])==12
assert len(d['changes'])==16 and {x['problemId'] for x in d['changes']}==set(answer)
assert sql.count('UPDATE public."Problems"')==16
assert sql.count('GET DIAGNOSTICS affected = ROW_COUNT')==16
assert 'BEGIN;' in sql and 'COMMIT;' in sql
assert 'UPDATE public."QuestionOptions"' not in sql
for x in d['changes']:
    pid=x['problemId'];n,option=answer[pid]
    assert x['correctOptionId']==option and x['answerLatex']==str(n),pid
    assert x['beforeAr']!=x['afterAr'] and x['beforeEn']!=x['afterEn']
    assert len(x['afterAr'])>110 and len(x['afterEn'])>105
    assert str(n) in x['afterAr'] and str(n) in x['afterEn']
    assert f'"Id"={pid}' in sql and f'o."Id"={option}' in sql
print('PASS: full 28-problem category-3 geometry coverage; 16 new law-based bilingual explanations')
print('PASS: independent geometry and conversion oracles, original answer-option guards')
