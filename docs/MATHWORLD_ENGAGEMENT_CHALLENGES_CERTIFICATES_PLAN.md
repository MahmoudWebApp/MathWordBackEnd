# MathWorld — Engagement, daily challenges, exams and verifiable certificates
Date: 2026-11-13. Approved product direction; this document is planning, not implementation.

## Non-negotiable current access policy
- Free: unlimited daily attempts inside admin-configurable free categories (initial target two categories per stage).
- Premium: all categories, unlimited attempts, early solutions and advanced reporting. No daily question quota.
- Groups have variable editor-configured problem counts; no fixed group size.
- Curated, mathematically verified question bank; no unreviewed automatic question generation.

## Student home — simple, optional engagement
Keep primary CTA **Continue Journey**. Secondary: Today's Challenge, Review Weak Areas, My Certificates, Weekly Tournament, Learning Insights. Avoid clutter, forced streaks, endless feeds or manipulative notification pressure.

## Challenges
1. Daily optional challenge assembled from a fixed, reviewed pool with a stable daily assignment; rotating question selections do not create new questions. Publish UTC date/time and timezone clearly; don't expose solutions before assessment ends.
2. Weekly tournament: accessible difficulty bands, fair scoring (correctness primary; reasonable time tie-break only), anti-cheat and rate limits, privacy-preserving pseudonyms, no public leaderboard by default for minors.
3. Monthly mixed revision: coverage of previously studied categories, practice-focused feedback.
4. Question pools must support versioned blueprints, item exposure limits, repeat detection and an honest fallback when inventory is insufficient. Challenges may be unavailable for an underpopulated category rather than repeated deceptively.
5. Separate challenge/assessment attempts from unlimited practice. Premium early-solution access must not reveal protected exam answers before completion.

## Certificates and assessment integrity
- Category completion certificate: optional proctored-free internal assessment drawn from vetted question pools, concept-balanced blueprint, configurable threshold (proposed 80%), minimum question coverage and retry/cooldown rules.
- Stage completion certificate: comprehensive multi-category assessment with explicit prerequisites and category coverage.
- Certificates are **MathWorld-issued learning achievements, not accredited academic qualifications**. Never imply external accreditation.
- Server issues immutable certificate number, signed/unguessable verification token, PDF and QR linking to public verification with consent/minimal data. Include issue date, title, achieved category/stage, outcome and version.
- Support revocation/reissue, exam blueprint versions, audit logs, privacy and student name controls. Prevent certificate issue by merely clicking Complete.
- Free learners may earn certificates for accessible categories; stage certificate requiring locked categories needs a transparent eligibility policy. Prefer inclusive eligibility for a free stage assessment or clearly disclose Premium gating; never misrepresent a paywalled certificate as an academic credential.

## Smart review and learning insights
- Spaced practice from existing vetted questions; identify weak concepts by first-attempt correctness and delayed recall.
- Mistake notebook, explain-why feedback, worked examples, hints and optional YouTube links by category/problem type.
- Progress, achievement and XP anti-farming; retries count for learning but do not endlessly multiply rewards.
- Optional personalized goals, progress calendar, achievement badges and recovery from missed days without shame.

## Notifications
- In-app durable notification inbox; web SignalR for live foreground; mobile FCM push for background/terminated; email only if useful and opted in.
- Event types: daily challenge ready, weekly tournament starts/results, spaced review due, certificate issued, relevant new category/video.
- Granular opt-in preferences, quiet hours/timezone, frequency cap, deduplication, disable marketing by default and age-appropriate consent.
- No unsolicited daily push flood; support notification center without push permission.

## Admin tools
- CRUD challenge templates, blueprint/pool selection, scheduling, scoring, certificates, passing thresholds, reattempts, audits, verification/revocation and analytics.
- Preview challenges and exam coverage before publication. Admin configurable feature flags and staged rollout.

## Video and evergreen media
- Optional videos for category overview, question type and selected unique questions; no forced viewing.
- Challenges and common errors inspire original YouTube long videos, Shorts, TikTok, Facebook and Instagram posts.
- Create 12-month rolling calendar and replenishable idea backlog; no claim of literally infinite original videos or guaranteed monetization.

## Proposed implementation order
P0: category entitlements and variable-sized groups -> reliable progress/review -> vetted content and admin authoring.
P1: challenge blueprint + daily/weekly engine -> exam integrity and certificates -> notification inbox and opt-in delivery -> web/Flutter parity.
P2: richer analytics, gamification, video linkage, creator content calendar and optional community features after moderation/privacy review.
Release gates: backend authorization tests, idempotent attempts, pool depletion, clock boundary, anti-cheat, PDF/QR verification, accessibility, RTL/LTR, privacy, CI and staging QA.

## Acceptance tests
- Free user can solve >10 problems in one day inside an unlocked category.
- Daily challenge is optional and stable for a given day; missing inventory fails gracefully.
- Early Premium solution cannot leak an active exam answer.
- Certificate requires server-validated exam pass and is verifiable/revocable.
- Notifications obey opt-in, quiet hours, frequency cap and age rules.
- Existing progress and achievements survive content and subscription changes.
