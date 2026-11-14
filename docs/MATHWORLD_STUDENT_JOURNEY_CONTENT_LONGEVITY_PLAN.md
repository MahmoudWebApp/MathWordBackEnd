# MathWorld — Simple Journey, Long-Lived Content and Meaningful Learning

Status: proposed product plan, not yet implemented or seeded.

## Three non-negotiable outcomes
1. Students never get lost: one obvious 'Continue journey' action and simple Stage -> Category -> 10-question Group navigation.
2. Content remains useful without constant uploads: finite reviewed question bank plus explicitly labeled retries, error review, spaced review and mixed challenges.
3. Students genuinely learn: track first-attempt accuracy, repeat performance, coverage, progress and mastery separately.

## Bank size and realistic expectations
- Editorial target: ~300 carefully reviewed questions per core category, split into 30 groups of 10. Category targets can vary by breadth and difficulty.
- At 16 categories, 300/category = 4,800 unique questions across the platform, not per stage. At four evenly distributed stages this averages 1,200 per stage.
- Premium unlimited daily attempts is **not** unlimited unique content. A student completing 100 new questions/day could exhaust an average 1,200-question stage in ~12 days. Do not promise a month-long minimum or secretly throttle Premium.
- Build content quality, progression and voluntary review; expand based on observed exhaustion, coverage gaps and learning outcomes. Don't pad banks with near-duplicate questions.

## Simple student UI
- Primary: 'Continue journey' opens current category/group.
- Secondary: 'New practice', 'Retry training', 'Review mistakes', 'Mixed challenge'.
- Group 1 -> 2 unlocks on completion, without punitive gates or compulsory video.
- Show counts for unique completed, group progress, category progress, first-attempt accuracy, review accuracy and questions needing review.
- When all groups finish, show 'Category completed' and voluntary review/challenges. New groups append without revoking past completions.
- Free: 10 new question attempts per stage per UTC day; retries free. Premium: unlimited new attempts/day while unseen questions remain, and unlimited reviews.

## Adaptive review (no generation)
- Prefer unseen questions for new practice.
- Review missed questions after a delay; combine prior categories and weak areas in mixed challenges.
- Clearly mark previously seen questions as review; avoid presenting recycled questions as new.
- Prevent XP/leaderboard farming from repeatedly answering the same question. Separate review rewards and new-question rewards.
- Use a simple explainable selection algorithm, not AI dependency.
- Optional YouTube video link only when one exists for the category/group; video never blocks progress.

## Learning integrity
- Distinguish completion from mastery: group completion means attempted all assigned questions; mastery reflects first-attempt and delayed review performance.
- Don't let failure permanently lock the next group. Recommend review, not punishment.
- Admin error-report workflow and math/editorial validation before publishing.
- Stable question IDs, immutable historical attempt references, deduplication and safe append-only group growth.

## Technical delivery phases
1. Audit existing attempts, progress, XP, stage quota and category APIs.
2. Implement group ordering and per-student resume/unlock state with additive schema changes and tests.
3. Add review and mixed-challenge selection without question generation; ensure retries do not consume free quota or inflate XP.
4. Build consistent bilingual Next.js/Flutter journey UI.
5. Admin curated batch import, deduplication, editorial approval and optional YouTube links.
6. Seed reviewed question batches and measure unique-question exhaustion and mastery; expand where needed.

## Release acceptance checks
- Continue journey resumes the right stage/category/group on both platforms.
- 10 questions per group, deterministic order and stable IDs.
- Free quota is correct; Premium never hits daily quota; retry does not count as a new question.
- No duplicate XP, attempts or unlocks on retry/race/reconnect.
- Exhausted categories show honest completion and useful review, not an infinite-new-questions promise.
- Adding groups does not reset historical completion.
- Missing video never blocks the learner.
- Content and database backup/restore verified before bulk publication.
