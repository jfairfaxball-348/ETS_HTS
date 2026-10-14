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

## S016 — CAM-0008 / CAM-0009
- **CAM-0008 COMPLETED, DETACHED ARCHIVE:** sha256 code `e66472b91802b66ed8333f13a53edf7d52bd561c42277207dced8bf974f209ef`; prereg sha256 `0fad246c65634ef64a43995cbabb3286c359acc5586a86f6722d4683142f87e3`; 36,000 exact rational sampled point sets in six ellipse families. At aspect 5:1 zero-good-ear counts n5=2,n6=1; aspect20:1 n5=1,n6=2; other aspect/size cells zero. Circle proof mathematical, not derived from samples.
- **CAM-0009 COMPLETED, DETACHED ARCHIVE:** code sha256 `f2d4b00915943afd8cecf8c118fbc67205afb8cba490fa095b0282643168ceaf`; prereg sha256 `bd07215305c1cf45878e53f282ff035871ed84ddbf5f26f6560fe4d11e953320`; five-site certificate 120/120 crossing, min1; 100,000 parabola quintuple random screens found no example, not a universal proof.
- **Archival exception**: full immutable originals, preregs and raw outputs were generated before this commit but are stored in a **detached owner-downloadable tar.gz**, SHA256 `f30f4fbed674e26c7be26f434a915fd5062ac08f6c6d18d1c98d5a460640cb35`; NOT yet physically present in GitHub remote. `campaigns/S016_CAM_ARCHIVE_MANIFEST.md` gives exact paths. This is a deviation from normal GitHub archival governance; do not claim it is resolved. CAM-0003 PARTIAL FAILED, CAM-0005 FAILED, and CAM-0004/6/7 records untouched.

