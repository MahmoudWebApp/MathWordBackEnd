# Private pre-release backup and restore gate

The script `scripts/mathworld-backup.py` is retained in the source repository; the backup data and secrets must NEVER be committed, uploaded as CI artifacts, or pasted into chat. It targets only the existing MathWorld Supabase project. This is a local operator procedure, not a completed backup or an unattended automation.

## Export

Install and authenticate the Supabase CLI, Docker and age locally. Ensure the backup directory is outside all Git repositories and on an encrypted disk. Use a consistent maintenance window: the separate role/schema/data dumps are not a single transaction. The owner must confirm that application writes and schema changes are quiesced before exporting. Review CLI help for supported flags and the actual dump scope.

```powershell
python scripts/mathworld-backup.py --output "D:\MathWorldPrivateBackups"
```

Enter credentials only at the local prompts. Keep the independent age passphrase in a password manager. The script checks the linked project, exports three SQL files into a temporary local directory, calculates SHA-256 hashes, encrypts the archive and verifies decryption. No database restore is performed. Keep a second independent encrypted copy.

## Restore verification (required before merge)

Use an isolated disposable local Supabase/PostgreSQL target, never the production connection. Follow the current Supabase CLI restore guidance for the target version and managed schemas, and test roles, schema, data, sequences, constraints, EF and Supabase migration ledgers, private schemas, and server-only RLS/grants. Verify expected schema and row counts against the same source snapshot. Do not log learner data. Rehearse the complete pending EF migration sequence and check preservation of user accounts, progress, subscriptions and content. Separately inventory and back up any storage objects, auth configuration and hosting settings not included in the database dump. Decryptability is not proof of restorability.

## Release evidence

As of this checkpoint the backend runtime head `fea1a2f704dcc62eb3ec17ecff59fb92acd5a3d4` has 16/16 successful workflows, web `8f3ee17e4739085ad3fb4b1966e41fa168f110a0` has 2/2 and Flutter `37c3d219430aa183350316a469411c03d0e325bc` has 4/4 (signed APK job was skipped). Backend PR #148 is mergeable but not merged. Render auto-deploys main. No independent production backup/restore evidence is available. Do not merge or enable migrations merely because CI is green.

Record only non-secret evidence: UTC time, source project, archive hash, restored target type, schema/row count reconciliation, migration test result and owner acceptance. Keep archive bytes and credentials off-repository. See `docs/G1_RELEASE_ACCEPTANCE_GATES.md` for remaining release gates.
