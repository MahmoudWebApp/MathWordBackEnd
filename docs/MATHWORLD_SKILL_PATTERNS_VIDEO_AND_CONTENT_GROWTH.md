# MathWorld — Skill Patterns, Video Lessons and Finite Question Bank

Status: approved product direction; implementation pending.

## Core principles
- Do not generate random questions in the app. All questions are authored, reviewed, versioned and added to the database in batches.
- Premium means unlimited daily attempts, **not** an infinite supply of unique questions. Free permits 10 new attempts per stage per UTC day; retries are not charged.
- Each educational stage has categories; each category has distinct learning **patterns/skills** (e.g. adding unlike fractions). Questions belong to a pattern, difficulty and curriculum level.
- Each pattern can have one or more curated YouTube lessons, Arabic/English metadata, prerequisites, learning objectives, examples and reviewed questions.
- Students progress Learn -> Practice -> Mixed Challenge -> Mastery -> Spaced Review. Challenges reuse vetted questions without implying they are new.
- Prefer unseen questions; once exhausted, clearly label review/retry and prioritize incorrect or low-confidence questions. Never present repeats as new.
- Vary practice through mixed topics, timed/untimed challenges, milestones, personal-best goals, optional hints, and spaced repetition, without punitive streak mechanics.
- Video lessons are optional and linked by pattern, not duplicated for every question. Use official embeddable YouTube URLs, store video IDs and language, and verify rights/availability.
- Editorial flow: draft -> validation (bilingual, one correct option, distinct options, math correctness, stage/pattern fit, near-duplicate check) -> reviewer approval -> publish. Preserve published question IDs and historical progress.
- Deduplication: stable editorial content key, normalized question text, mathematical equivalence checks where feasible, and manual review for semantic near-duplicates. Do not assume string matching catches every duplicate.
- Analytics: pattern mastery, coverage, repeated-question frequency, incorrect answers, question exhaustion, and video-to-practice completion. Prioritize new batches where coverage is thin.
- Initial editorial target: ~100 reviewed questions per category; grow gradually without a hard total ceiling. Do not delay launch solely to reach an arbitrary count.

## Implementation phases
1. Inspect current stage/category/question/video schemas and API consumers; write additive migration design.
2. Add Pattern/Skill entity, question association, curated video lessons and review workflow; backfill existing questions conservatively.
3. Add admin pattern editor, batch import with duplicate prevention, and approval/publish flow.
4. Implement bilingual web and Flutter skill journey, videos, mastery, mixed review and clear exhausted-bank UX.
5. Seed reviewed question batches, QA curriculum coverage and parity, then measure and expand.

No production database migration, bulk seed, video upload, or publication is authorized by this planning document.
