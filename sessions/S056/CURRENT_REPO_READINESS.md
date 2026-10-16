# S056 AS-IS REPO READINESS — SOURCE LEVEL

Pinned main e2b9199be6d1eac82bec73c81da136daa1914a38, Git tree 998ad9f2b6d3ce22b7bca76e839cc5fc8f7d46e2. Exhaustive Git tree result truncated=false: **511 tracked entries / 78 .lean files**. Root: .github, .gitignore, AGENTS.md, ETSHTS.lean, ETSHTS/, README.md, authoritative/, campaigns/, catalogue/, docs/, lake-manifest.json, lakefile.lean, lean-toolchain, research/, scripts/, sessions/, tests/. This is SUBSTANTIVE development (not a wrapper).

| Requirement | Verdict | Evidence |
|---|---|---|
| Lake root | PRESENT | lakefile.lean defines ETSHTS package/library |
| Manifest | PRESENT | committed lake-manifest.json |
| Lean version | INCOMPATIBLE | lean-toolchain leanprover/lean4:v4.15.0 vs Palomar minimum v4.35.0-rc2 |
| Mathlib | PRESENT / MIGRATION NEEDED | pinned mathlib 9837ca9d65d9de6fad1ef4381750ca688774e608 in lakefile/manifest, matched historic v4.15; upgrade untested |
| Recognised single root SPDX licence | MISSING | complete root Git tree has none |
| formalization.yaml (any path) | MISSING | complete recursive tree has none |
| comparator.json | MISSING | none in complete tree |
| Challenge.lean/Solution.lean | MISSING | neither in complete tree |
| Modern module headers | INCOMPATIBLE | ETSHTS.lean, Definitions.lean, Targets.lean, Foundation.lean and all five checked direct theorem files begin old import declarations, not module; full 78-header/parser scan NOT_RUN |
| Independent Challenge closure | INCOMPATIBLE_AS_IS | existing ETSHTS-specific definitions imported from Targets/Foundation, forbidden as Challenge import closure |
| Existing proven theorems | HISTORICALLY VERIFIED | literal clm0096_exact, clm0099_exact, clm0102_exact, clm0107_exact, clm0108_exact; S054 standard-only axiom evidence, no proof at new Palomar floor |
| 10,000-line cap | PARTIAL_INSPECTION | Definitions ~122 physical lines; ETSHTS.lean 360; direct proof files 216, 187, 170, 113, 21 lines; full 78-file counts NOT_RUN. Largest source tree file ETSHTS.lean 14,454 bytes (byte count not equivalent to line count) |
| Challenge 1,000-line and 100 KiB caps | NOT_APPLICABLE_YET | file absent |
| Locally compiled current | NOT_RUN | no Lean/lake installed; no public GitHub preflight initiated |

## Five immutable results and file crosswalk
- CLM0096 → ETSHTS/ConvexFourClassification.lean; all 3/4 no-three-collinear sites.
- CLM0099 → ETSHTS/GenuineOuterplanarCap.lean; full iff recursive valid metric ear certificate.
- CLM0102 → ETSHTS/Cutoff.lean; both signed outward endpoint derivatives, strict short directed-arc distance extension.
- CLM0107 → ETSHTS/CyclicCompetitorExact.lean; universal finite ellipse sets, closed R, compulsory exact two predecessor rank and old-edge retention.
- CLM0108 → ETSHTS/ExactNonround.lean; universal 101/100 nonround example.
Frozen Definitions blob f5e71b... and Targets blob e12f117... unchanged.

## Packaging architectures evaluated, NOT IMPLEMENTED
A. Upgrade SAME substantive project: migrate all 78 source headers/public imports and Lean/mathlib pins, preserve exact original statements, recompile and recheck standard axioms, then independently craft Challenge/Solution/Comparator and metadata/licence. This has high technical work and needs explicit owner authorisation.
B. Create thin wrapper pointing to old v4.15 substantive repo: **not a bypass**. Palomar also scans substantive repository sources and Challenge cannot import custom ETSHTS, so old source/module/toolchain compliance still a hard issue.
C. Independently restate math using Mathlib-only Challenge, prove via solution bridge: possible architecture but statement/type identity, exposed definitions and special package migration remain genuine problems, NOT a cosmetic wrapper or accepted proof as-is.

## Previous session CI verified live
S055 PR #70 final head d08ba2f99425543f59e836273e86758b15f4e3d7: Lean 38895681052 SUCCESS, governance 38895681053 SUCCESS. Merge 01ea142c6a419a63e8ab3ea175d3e2bdcd19a953: independent merged-main Lean 38895991976 SUCCESS, governance 38895992266 SUCCESS (subsequent Lean rerun 38898898836 SUCCESS). These are GitHub project CI, not Palomar. Novelty INDETERMINATE_ACCESS_GAP unchanged.