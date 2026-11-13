# MathWorld — Updated access and evergreen media policy (2026-11-13)

## Superseding decision: NO daily question quota
The former Free limit of 10 new questions per stage per day is **cancelled**. Do not present it as current product policy. The student-facing groups of ten questions are **navigation units only**, not a daily limit.

## Access policy
- Free learners have unlimited attempts and retries within a configurable set of unlocked categories; initial proposal: **two free categories per educational stage**, with exact category IDs configurable by admins.
- Premium learners can access all categories with unlimited attempts and retries, early detailed solutions, advanced analytics and PDF/Excel exports, no ads when ads exist, and future tutor access when launched.
- Premium target price: USD 5/year, subject to payments readiness.
- Admins can grant Premium for a fixed term or indefinitely, run 100%-off introductory promotions, issue discount codes with expiration/redemption limits and audit every grant.
- Access control must be enforced on the backend for category lists, problem details, answer submission, progress and early solutions, not just by hiding UI.
- Existing StageDailyQuota implementation is **legacy and conflicts with this decision**. Plan to remove/disable its enforcement with tests and replace it with category-entitlement checks; do not claim this migration is already done.
- Ensure students retain progress and attempts when category access changes or Premium expires. Avoid exposing paid question text through search or caching.

## Student journey and longevity
- Simple visible flow: Stage -> Category -> ordered groups of ten vetted problems, with Continue Journey, Retry, Review Mistakes and Mixed Challenge.
- Build curriculum coverage per stage, category, concept, difficulty and prerequisite internally without cluttering student UI.
- A finite, curated question bank can grow without a fixed upper ceiling; never promise mathematically infinite unique questions or guaranteed 12 months of unseen questions to every Premium learner.
- Target a year-long learning **program** through progressive coverage, spaced review, mixed practice and periodic additions. Faster students may advance freely.
- Question content is human-authored and mathematically verified; no automated question generation or low-value near-duplicate padding.
- Add stable group/problem IDs, editorial review, bulk import with deduplication, content coverage and exhaustion dashboards.

## Evergreen YouTube / social engine
- Build an evergreen taxonomy per category: foundations, concept explanations, worked patterns, common mistakes, challenges, exam-style applications, and advanced extensions.
- Preferred video hierarchy: category overview, **problem-type explanation** reusable across many vetted questions, selective individual-question deep dives. Do not require one video per question.
- Every math video has an objective, verified examples, a linked practice destination and optional bilingual subtitles/metadata.
- Video is optional for learning progression; do not gate questions on video views.
- Produce original long-form YouTube lessons and genuinely useful derivative Shorts, TikTok, Instagram Reels and Facebook videos, with platform-specific editing and calls to action.
- Maintain a rolling 12-month editorial calendar plus a renewable backlog: each category supplies multiple concepts, difficulties, real-world applications, mistake clinics, student FAQs and seasonal exam topics. Update based on analytics and curriculum changes.
- Monetization is conditional on platform eligibility, rights and review; do not promise revenue or post repetitive low-value mass content.
- Priority sequence: complete/test product and category entitlements -> curriculum and video linkage -> prepare one-year media calendar -> publish consistently after product readiness.

## Acceptance criteria for revised access
1. Free learner can solve >10 questions on one day in an unlocked category without quota errors.
2. Free learner cannot read or submit answers for a locked category; web and Flutter show clear upgrade UX.
3. Premium learner can access all categories and all available questions.
4. Free category selection and promo windows are admin-configurable and audited.
5. Progress survives downgrade, re-upgrade and content additions.
6. All tests explicitly assert the obsolete daily quota is not enforced.
