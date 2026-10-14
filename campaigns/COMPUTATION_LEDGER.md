# CAM computation ledger

No registered CAM campaigns in S001. The JSON file is the machine-readable partner. Pre-register every run before starting with id CAM-####, candidate_ids, claim_ids, purpose, bounds, code_version, code_hash, input_hash, environment, stopping_rule, output_paths, status. Do not invent hashes or fabricate a result. Computations justify only finite registered claims.

## S006 — two preregistered campaigns
- **CAM-0001 COMPLETED:** independent code SHA256 `2e32d7e3547f28f4b8e9444c491f3d2e71741bf3faa62a91455f7dfe99ff21df`, frozen locally 2026-10-13 16:19:16 UTC before run. Tested all canonical words q2..7 (1,5,36,329,3655,47844); none failed q−1. The raw field `maximum_minimum_cuts_seen` is **NOT** a true optimum, due to premature return. Retained defect, no backdating.
- **CAM-0002 COMPLETED:** code SHA256 `7743b0d1db8293abf2eee2908ec82a0171b028475c92c573617f88b4c6c13636`, frozen locally 2026-10-13 16:23:27 UTC before corrected run. All orientations checked; exact maxima of minimum cuts q2..7: **1,2,3,3,4,5**. No counterexamples, complete finite bounds. Raw, code and immutable prereg snapshot paths under campaigns/. The symbolic proof CLM-0038, not these finite runs, resolves all q.

## S009 — interrupted preregistered finite search
- **CAM-0003 FAILED/PARTIAL:** immutable preregistration UTC 2026-10-13T18:37:19.829521Z before code execution, SHA256 `285038eae3993c1f8ffe3e20273fb68702e71d66b4f3a6b499e389e85d7eeabb`, scipy/HiGHS. Planned 54 solver models m2..5, logged 37 status=optimal (all m2..4, eight m5); container runtime interrupted before the remaining 17 or end-of-run raw creation. Raw JSON transcribed from preserved stdout, never promoted to complete. Finite only. See CAM-0003_preregistration.json and CAM-0003_raw.json.

## CAM-0004 — S014 exact bounded ordering audit

Preregistered 2026-10-14T07:50:52.223324Z; frozen campaigns/nearest_two_order.py SHA256 e1d861c8aaa7f2c44846816056bf9c18caba069158338d7be742466260942634. Bounds: all general-position 3x3-grid subsets n4..6 plus 30 seed140014 samples each n4..8 in [-20,20]²; cap60s. COMPLETED:258/258 sets admit an order;198 independently checked;124 lex-order failures. Raw input and witnesses preserved. CND-0128 / CLM-0091. No universal, hardness or novelty conclusion. CAM-0003 unchanged FAILED/PARTIAL37/54.

## S015 — immutable CAM-0005/0006/0007

- **CAM-0005 FAILED:** frozen SHA256 6737ade5cb7bca7d481332a0ade39885ca679b52805b5c4ff31240e9fca11c4f. Self included erroneously among its own nearest two; spurious 4-vertex no-ear reported, while full arrival-order validator found a valid order. Preserve bad code/raw/prereg; absolutely not a counterexample.
- **CAM-0006 COMPLETED:** repaired code SHA256 7331053878d247d802cf12f0e64185cecfa437425762850a692dc1c93e7bb422, preregistered before run. Generated 1346, of which 1263 convex/general; first no-ear strict convex sample at n=6. Exact DFS (53 nodes) also found no plane order.
- **CAM-0007 COMPLETED:** independent certificate code SHA256 dab713cea4a1c57abf9a6742b682ce7e323c0be1184b631324178921bf2262ec. Exact small-coordinate six-site example, strict convexity and squared distances verified, 720/720 permutations proper-crossing. Proof CLM-0093 is decisive even without this finite run. CAM-0003 remains FAILED/PARTIAL37/54; CAM-0004 preserved COMPLETE258/258 finite positive.
