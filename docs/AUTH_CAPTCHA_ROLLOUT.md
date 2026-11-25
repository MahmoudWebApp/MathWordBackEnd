# CAPTCHA rollout — MW-08
Backend foundation only. Disabled by default. Do not enable until web and native Android challenge flows both pass real-device acceptance. No client-controlled exemption.
Provider: Cloudflare Turnstile Siteverify (https://developers.cloudflare.com/turnstile/get-started/server-side-validation/).
- Configure MathWorldCaptcha__Enabled, MathWorldCaptcha__SecretKey (protected host secret), MathWorldCaptcha__Hostname (exact official hostname). No real secrets in source.
- Client obtains a new token for each password login, registration, forgot-password and reset-password request with matching action; sends X-MathWorld-Captcha header. Error is localized and requires a fresh token. Google sign-in is separate and not modified.
- Fail closed when enabled and configuration, token, provider, action or hostname invalid. No redirect to arbitrary endpoint. Local hashed replay reservation; distributed state needed for multiple backend instances.
- Test with mocked HTTP transport, then approved test widget and production hostname, web and Android. Do not enable merely because backend CI passes. Existing rate limits remain.
