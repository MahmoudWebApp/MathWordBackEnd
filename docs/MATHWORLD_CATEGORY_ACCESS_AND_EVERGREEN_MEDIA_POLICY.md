# MathWorld — Updated access and evergreen media policy (2026-11-13)

## Superseding decision: NO daily question quota
The former Free limit of 10 new questions per stage per day is **cancelled**. Do not present it as current product policy. The student-facing groups with configurable question counts are **navigation units only**, not a daily limit.

## Access policy
- Free learners have unlimited attempts and retries in **exactly two categories per stage** (or fewer only when a stage lacks two categories). The initial default is the first two by editorial order; active admins can explicitly save a different pair. This is enforced by the server, not just the UI.
- Premium learners can access all categories with unlimited attempts and retries, early detailed solutions and personal analytics/CSV export. Native PDF/XLSX generation, future ad-free benefits and tutor access are **planned, not shipped**.
- Premium target price: USD 5/year, subject to payments readiness.
- Admins can grant Premium for fixed or indefinite terms and issue audited one-use 100%-gift codes on development branches. Percentage-off checkout coupons and paid subscriptions require a future payment integration.
- Access control must be enforced on the backend for category lists, problem details, answer submission, progress and early solutions, not just by hiding UI.
- The legacy StageDailyQuota endpoint remains for backward compatibility but returns **unlimited**, with no ten-per-day enforcement. Free category entitlements are enforced in protected problem endpoints; the backend/Flutter/web integration checks run on feature branches, not deployed production.
- Ensure students retain progress and attempts when category access changes or Premium expires. Avoid exposing paid question text through search or caching.

## Implemented Free-category administration — development branches only

- `GET /api/stages/{stageId}/free-categories` returns the effective public access catalog.
- `PUT /api/admin/stages/{stageId}/free-categories` accepts `{ "CategoryIds": [firstId, secondId] }` for an authenticated **active Admin** only. Two different existing categories belonging to the same stage are mandatory. It writes the persisted selection with admin ID and timestamp.
- The Next.js Admin Categories page displays a bilingual two-category editor with validation and confirmation. Selection changes are **not** silently applied during category editing.
- Both `/api/categories/{id}` and `/api/admin/categories/{id}` reject moving populated/Free-selected categories and deleting Free-selected categories. This includes default Free categories before a custom pair is stored. Editorial reordering that would change the **implicit** Free pair is also rejected. Use the dedicated selector to pin the current pair before reordering.
- The public stage catalog includes `HasSavedFreeSelection` so the admin UI can offer a one-click pin of the existing default pair without changing the student's current access.
- Disposable PostgreSQL checks validate no daily quota, Free/Premium access boundaries, the selection endpoint, unauthorized changes and both category-management routes.
- Migration, release authorization, device QA and rollout are still required before production uses this feature.

## Student journey and longevity
- Simple visible flow: Stage -> Category -> ordered groups with flexible counts of vetted problems, with Continue Journey, Retry, Review Mistakes and Mixed Challenge.
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

## Group-size clarification (2026-11-13)
- Groups are not fixed at ten. Editorial admins choose a suitable count for each group (e.g., 10, 20, 30, or more) based on concept coverage and difficulty.
- Group size is not a daily allowance. Both Free and Premium have unlimited attempts in categories they are entitled to access.
- Students see group question counts and completion progress; progress survives group expansion and content additions.
