#!/usr/bin/env python3
"""Source-controlled release safety contract; NO database changes.

Live rollback-only transaction proof is performed separately before executing
the final immutable, source-fingerprint-gated SQL on production.
"""
import json
from collections import Counter
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
manifest=json.loads((ROOT/'content/editorial/reviewed-172-release-manifest-20261123.json').read_text(encoding='utf-8'))
sql=(ROOT/'scripts/publish_reviewed_172_curriculum_drafts_20261123.sql').read_text(encoding='utf-8')
icons=manifest['newCategories']
skills=manifest['skillNames']
assert len(icons)==11
assert len(skills)==46
assert len({i['topicKey'] for i in icons})==11
assert len({i['iconSlug'] for i in icons})==11
assert len({s['primarySkillKey'] for s in skills})==46
assert {x['stageId'] for x in icons}=={1,2,3,4}
assert Counter(x['stageId'] for x in icons)=={1:2,2:3,3:3,4:3}
assert manifest['publishedBefore']=={'problems':601,'categories':24,'skills':94,'primaryLinks':601}
assert manifest['expectedAfter']=={'problems':773,'categories':35,'skills':140,'primaryLinks':773}
assert manifest['drafts']==172 and manifest['noExistingLearnerDataModification']
assert manifest['expectedSourceFingerprint']=='382e21999d40c5d6cfb40cadbe784df7'
assert manifest['existingPublishedTopicIds']==[1,2,3,4]
assert manifest['existingPublishedCategoryIds']==[21,22,23,24]
for icon in icons:
    assert icon['topicKey'] in sql
    assert icon['iconSlug'] in sql
    assert icon['iconSlug']+'.svg' not in icon['iconSlug']
for skill in skills:
    assert skill['primarySkillKey'] in sql
    assert len(skill['nameAr'].strip())>=3
    assert len(skill['nameEn'].strip())>=4
assert sql.strip().endswith('COMMIT;')
assert sql.count('BEGIN;')>=1
assert 'ROLLBACK;' not in sql
assert 'SELECT pg_advisory_xact_lock(-987654319)' in sql
assert 'actual_hash<>expected_hash' in sql
assert '382e21999d40c5d6cfb40cadbe784df7' in sql
assert 'UPDATE public."CurriculumDraftItems" SET "EditorialStatus"=' in sql
assert 'UPDATE public."CurriculumTopicProposals" t SET' in sql
assert 'INSERT INTO public."Categories"' in sql
assert 'INSERT INTO public."CurriculumSkills"' in sql
assert 'INSERT INTO public."Problems"' in sql
assert 'INSERT INTO public."QuestionOptions"' in sql
assert 'INSERT INTO public."CurriculumProblemSkills"' in sql
assert 'IF old_free IS DISTINCT FROM' in sql
assert 'RAISE EXCEPTION' in sql
assert 'Source bank or taxonomy changed' in sql
assert 'four' not in manifest['name'].lower()
for forbidden in ('TRUNCATE','DELETE FROM','DROP TABLE','UPDATE public."Problems"','UPDATE public."QuestionOptions"','UPDATE public."Users"','UPDATE public."StageFreeCategorySelections"','UPDATE public."CurriculumSkills"'):
    assert forbidden not in sql,forbidden
# There are no database schema changes and no user data mutations.
print('PASS: audited exactly 11 categories + 46 bilingual skills + 172 proposed published questions')
print('PASS: immutable 601 prior question identities and Free category settings')
print('PASS: source-fingerprint-guarded transaction, no partial release')
