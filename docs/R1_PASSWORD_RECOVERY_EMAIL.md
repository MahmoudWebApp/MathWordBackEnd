# R1 recovery and transactional mail (not activated)
- Provider: Brevo HTTPS API, endpoint fixed to api.brevo.com/v3/smtp/email. Existing manual SMTP announcements are unchanged.
- Required environment variables on backend only:
  - `MathWorldEmail__Brevo__Enabled=true`
  - `MathWorldEmail__Brevo__ApiKey` (secret)
  - `MathWorldEmail__Brevo__From` (verified sender)
  - `MathWorldEmail__Brevo__Mode=test`
  - `MathWorldEmail__Brevo__TestRecipients` (semicolon-separated verified test addresses)
  - `MathWorldEmail__OutboxEnabled=true`
  - `MathWorldRecovery__Enabled=true`
  - `MathWorldRecovery__TokenKey` (independent cryptographically random >=32 bytes, Base64; never commit)
  - `MathWorldRecovery__VerifiedAdminEmail` (explicitly verified existing administrator address, not guessed)
  - `MathWorldBrand__WebsiteUrl` only if the official website changes.
- Keep all flags off until backend + web recovery paths are ready. Disable provider click/open tracking for account recovery; do not collect or forward recovery URLs. Test sending requires test mode, current admin's own allowlisted address, and worker enabled; no automatic send occurs on deployment.
- Password recovery requests are generic. Existing local-only students prove control by redeeming the mailbox link; no claim of historical email verification. Staff email must be explicitly verified before allowing recovery. Existing linked Google/social accounts sign in via provider until their verified-email/link ownership migration is reviewed; the database historically does not distinguish Google-only accounts from local accounts later linked to Google. Do not silently add a local login or allow an unverified linked identity to survive a recovery flow.
- DB stores SHA-256 digests, not plaintext tokens; a separate server key derives a short-lived secret from random grant IDs for the worker. Rotate the recovery key only after outstanding grants expire or explicitly invalidate them.
- Outbox acceptance is not delivery. Retries only on explicit provider 429; ambiguous network or 5xx outcomes become Unknown, not automatically replayed. Max three attempts, 20-minute grant expiry, durable claim/lease, conservative 100-attempt default rolling-overlap cap with priority for recovery. Admin status excludes recipients, secrets and rendered messages.
- Delivery/bounce webhooks, verified-link account migration, real provider activation, user-facing browser/device smoke and launch acceptance remain separate checks. Do not enable live mode until verified.

Admin outbox readiness now reports missing configuration codes (never values), whether an allowlisted administrator can enqueue a test under the reserved budget, and whether admin recovery is locally configured. Provider connection and inbox delivery remain explicitly unverified; a real test must still be sent and checked. The disposable password suite asserts that configured transport with disabled worker cannot be reported ready for testing or admin recovery, and that the response contains no test key or address. No production env changes.
