# Computation campaigns

No campaigns executed in S001. **Pre-register CAM-#### in campaigns/COMPUTATION_LEDGER.json and .md before code is run.** For each record require: candidate/claim IDs, purpose and exact expected assertion, input family/bounds including inclusivity, code path and version, SHA-256 of source/inputs (after the file actually exists), runtime language/compiler/dependencies/OS, deterministic seed or randomness policy, stopping rule and timeout, planned raw/summary outputs, independent verification strategy, start/end timestamps and result status.

Permitted statuses: REGISTERED, RUNNING, COMPLETED, FAILED, CANCELLED. Never change the preregistered bound after reading outcomes without creating a new CAM. Archive data/hash once observed, never prepopulate hashes. Exact exhaustive results certify only the enumerated domain, not infinite conjectures.
