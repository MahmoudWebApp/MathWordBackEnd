# MathWorld — Simple Student Journey and Growing Question Bank

Status: approved product direction; implementation pending. This document supersedes any more complex unit/skill navigation proposed earlier.

## Student navigation (only three levels)
**Educational stage -> Category -> Group of 10 questions.**
- No mandatory nested units, lesson hierarchies, or complex pattern trees in the student interface.
- Groups are numbered clearly (Group 1, Group 2, ...), contain 10 curated questions each, and display completed/current/locked states.
- Completing a group unlocks the next group. Keep completion criteria straightforward; do not block students indefinitely due to mistakes.
- A category is complete when all its currently available groups are complete. Students can review previous questions.
- Adding new groups later must not revoke historical completions or change the identity of previously answered questions.
- Free: 10 new question attempts per educational stage per UTC day; retrying old questions does not consume quota. Premium: no daily attempt cap; both tiers follow the same educational sequence.
- Unlimited attempts does **not** mean unlimited distinct questions; clearly distinguish new questions from review.

## Video lessons: optional and gradually added
- Videos are **never required** to start, complete or unlock a group.
- Admin can optionally attach a YouTube video to a category or group, and update the link later.
- Only show a 'Watch explanation' action if a valid, published video link exists; otherwise hide it entirely, with no empty placeholders or 'coming soon' blocker.
- Add videos incrementally as the MathWorld YouTube channel publishes them. Store YouTube ID/URL and bilingual optional title; validate links.

## Content management and quality
- Admin manually adds questions or imports reviewed batches. No random question generation in the student application.
- All questions have bilingual text, four distinct answer choices, one verified correct answer, detailed bilingual solution, stage/category and stable IDs.
- Group membership/order must be stable; do not silently reshuffle previously completed groups.
- Detect duplicates with stable content keys, normalized bilingual text, and editorial review for mathematical/semantic equivalents.
- Draft -> validate -> review -> publish. Never auto-publish generated or unreviewed content.
- Existing 34 questions and user progress must be preserved and assigned to groups carefully.
- Start with 100 curated questions per category (10 groups); expand later with more groups. No arbitrary lifetime question cap.

## Implementation steps
1. Audit existing models, endpoints and progress semantics, and design additive group tables/fields.
2. Add category group listing, group-question assignment and unlock/progress API while preserving existing IDs.
3. Implement matching simple UI on web and Flutter.
4. Implement admin manual/batch authoring, deduplication and optional video links.
5. Backfill existing questions safely, verify completion and quota behavior, then add reviewed content batches.

This is a specification, not a claim that features or database changes have been deployed.
