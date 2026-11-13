# MathWorld — Growth, SEO, CAPTCHA and future rewarded-access plan
Date: 2026-11-13. Product requirements; no ad network or checkout is active.

## Access contract — supersedes old quota
- Exactly TWO unlocked Free categories in EACH educational stage by default. Admin chooses the IDs for every stage, with audit and effective dates. Unlimited practice attempts within them.
- Premium: all categories, unlimited attempts, early solution and export, no ads.
- Flexible editorially configured problem group sizes, not fixed 10.
- Category entitlement is enforced on backend lists, search, details, answers, media and exports. Avoid cache/search leaks. Preserve student history across subscription changes.
- Existing daily-quota controller/answer guard is legacy and must be migrated atomically with backend entitlement enforcement, then removed from web/Flutter.

## Future rewarded ad unlocks (feature flag OFF)
- A Free learner may **opt in** to a rewarded ad for one otherwise-locked problem. Never require an ad for the two Free categories.
- Define server-side RewardedProblemAccess(userId, problemId, issuedAt, expiresAt, rewardProviderTransactionId, policyVersion), replay protection, per-user frequency caps and idempotent verified provider callbacks. Avoid trusting client-side ad completion.
- Decide duration and repeat policy after testing; no unlimited/permanent unlock implied. Students retain previous progress after unlock expires, but cannot access locked problem content again without entitlement.
- No ads for Premium. Do not use manipulative ad placement or exploit younger students. Confirm provider policy for children/teens, consent, region, privacy, platform store and education rules before enabling. If a compliant provider is unavailable, leave rewarded ads disabled.
- AdsEnabled and RewardedUnlocksEnabled must both default OFF. Do not introduce ads in certificate exams or high-stakes assessments.

## SEO — technical implementation
- Next.js locale-specific crawlable public pages for stage/category/concept/educational articles; avoid indexing private problem solutions, student profiles, admin routes, preview or gated content.
- Stable canonical URLs, Arabic/English hreflang, proper RTL/LTR metadata, robots.txt, XML sitemap, redirects, meaningful titles/descriptions and Open Graph images.
- Structured data only when truthful and applicable (Organization, WebSite, BreadcrumbList, Article, VideoObject); no fabricated review/FAQ rich results.
- Core Web Vitals, mobile performance, accessible math typography, server rendering for public content, broken-link checks, clean internal links.
- Set up Google Search Console and Bing Webmaster Tools when verified domain is available; track index coverage and crawl errors. Never promise rankings.

## Content SEO and growth
- Topic clusters per educational stage/category/concept, original bilingual math guides, carefully reviewed worked examples, linked practice, selective embedded YouTube explainers.
- Editorial workflow: keyword intent -> curriculum mapping -> math review -> publish -> internal links -> refresh/update. No thin mass-produced near-duplicate pages.
- Branded YouTube long videos, Shorts, TikTok, Instagram and Facebook; reusable evergreen taxonomy, 12-month rolling calendar, creator asset templates, UTM tracking and ethical referrals.
- Measure search impressions, clicks, landing-to-signup conversion, activated learners, 7/30-day retention, challenge engagement and verified subscription conversions, with consent and privacy protection.
- Prepare product launch landing page, onboarding email, app store metadata, social channel branding and referral/share links. No spam or fake social proof.

## CAPTCHA and security
- Server-side CAPTCHA token verification on registration, login abuse, password recovery and suspicious flows; provider keys in secrets, never hardcode; token expiry, replay prevention and safe failure behavior.
- IP/account/device-aware rate limits, password reset and email verification, audit logs, admin MFA, session security, anti-bot challenge abuse protections.
- Respect accessibility and privacy, minimize third-party tracking and avoid blocking legitimate learners. CAPTCHA alone is not sufficient.
- Integration tests for invalid/missing/replayed CAPTCHA tokens, rate limits and OAuth edge cases.

## Delivery checkpoints
1. Backend category entitlements and legacy quota removal with regression tests.
2. Web/Flutter locked-category UI, entitlement refresh and flexible groups.
3. Student progress, challenge/exam integrity and verifiable certificates.
4. Notification preferences and anti-spam, content/video links.
5. SEO infrastructure + initial vetted public content + analytics consent.
6. CAPTCHA/rate limits/admin MFA and security QA.
7. Rewarded ad pilot only after policy/legal/age checks and explicit activation.
8. Marketing channels, year-long editorial calendar and staging/launch readiness.

## Definition of done
No feature marked DONE without code, build/CI evidence, mobile/web parity where applicable, auth/abuse tests, privacy review and controlled rollout.
