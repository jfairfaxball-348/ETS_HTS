# Governance integrity checklist

## Before editing
- [x] S001 owner instruction archived as submitted (no paraphrase in INPUT)
- [x] Initial repository observed empty; seed needed to create main
- [x] Branches and PRs enumerated (zero before seed)
- [x] Rulesets queried (none returned); protection endpoint 403 means UNKNOWN
- [x] Workflows path absent before authored scaffold; no claimed CI

## Records and maths
- [x] S001 contains no CND, SRC, CLM or CAM research records
- [x] Candidate schema, status grades, access grades, claims and CAM pre-registration specified
- [x] Kill ledger and state/gate/authorization boundaries explicit
- [x] S002 labelled FUTURE UNEXECUTED (new invocation required)
- [ ] S002 candidate novelty/difficulty work (out of scope)

## Exit checklist (requires live observation; do not infer from authored files)
- [ ] Execute checker on checkout; preserve observed output
- [ ] Execute unittest on checkout; preserve observed output
- [ ] Observe hosted workflow run/jobs/checks; ABSENT_NOT_PASS if missing
- [ ] Verify session commit sole parent and tree
- [ ] Verify ordinary PR and GitHub non-force merge with two parents
- [ ] Verify final remote main SHA/tree independently
- [ ] Log any permissions, merge or CI blocker as UNKNOWN/ABSENT/FAILED, not PASS

These checkboxes distinguish known entry facts, authored format and **unobserved** future GitHub exit facts. Green governance tests are not mathematical validation.
