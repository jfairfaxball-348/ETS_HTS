# S045 — precise proof coverage and remaining obligations

## Original-direct-goal ledger

| Exact target | Status | Reason |
|---|---|---|
| `clm0096_exact : CLM0096` | VERIFIED (prior S042) | Original no-three-collinear size three/four theorem |
| `clm0102_exact : CLM0102` | VERIFIED (prior S030) | Original exact two derivative signs and strict outward extension |
| `clm0099_exact : CLM0099` | **OPEN** | Universal supported outerplanar cap, two distinct hull-side neighbours and true last chronological forced cyclic pair still missing |
| `clm0107_exact : CLM0107` | **OPEN** | Full-turn cyclic phase gaps, actual skip Euclidean selection, and three-band all-competitor metric-ear theorem still missing |
| `clm0108_exact : CLM0108` | **OPEN** | Requires direct original `CLM0107` (then verified `clm0108_of_clm0107`) |

**Total: 2/5 direct targets.** No status promotion on partial parameterisation alone.

## New S045 source

In [`ETSHTS/FiniteEllipsePhase.lean`](../../ETSHTS/FiniteEllipsePhase.lean):

1. `s045_ellipsePoint_normalized` gives a true parameter in `[0,2*pi)` for every real input without changing the original ellipsePoint.
2. `s045_boundary_has_normalized_angle` invokes the original `ellipseBoundary`, not an alternative boundary predicate.
3. `s045_finite_ellipse_phase_cover` constructs from any actual finite original ellipse boundary set `S` a finite real phase set `T`, cardinality exactly `S.card`, bounded to the half-open turn and with `T.image (ellipsePoint a b) = S`.
4. `s045_finite_ellipse_ordered_index` constructs an order embedding `Fin S.card ↪o ℝ` with exact full finite-site image, strictly increasing parameters and true phase bounds; not an assumed cyclic list.
5. `s045_ordered_index_adjacent_gap_pos` establishes positive real gaps at genuine successive ordinary indices for arbitrary finite site spacing.

Root `ETSHTS.lean` imports the source and prints all five exact dependencies. Code development made multiple hosted compiler repairs after failures: forbidden token in a comment removed; pinned Mathlib `Finset.range_orderEmbOfFin` substituted for a nonexistent API; explicit finite image composition simplification. Treat **only successful final PR-head Lean/axiom prints** as verification, not code appearance or past failed runs. Local Lean/lake **NOT_RUN**, not represented by hosted CI.

## Remaining mathematics-to-Lean bridges (no new mathematics)

- **B1:** prove positive **wraparound** gap and telescoping full-turn sum, plus actual successor permutation and cyclic neighbours of actual indexed sites; ordinary sorted gaps from S045 are not yet a full cyclic representation.
- **B2:** instantiate S044 true squared Euclidean eligible skip-chord minimum from the actual finite phase sequence, including every n≥5.
- **B3:** compare both immediate neighbours strictly against selected skip length and rigorously bound every non-neighbour via S020 forward short/central **closed band** at both equality endpoints/backward short; obtain original `metricEar` uniformly with no point-separation restriction.
- **B4:** derive direct `clm0107_exact` via existing `clm0096_exact` and `s042_clm0107_of_clm0096_and_ge5_ears`, then `clm0108_exact` via the unchanged direct corollary.
- **A1–A3:** universal supported noncrossing straight-chord graph edge cap, both genuine unique hull supporting neighbours in strict convex position, and exact last-arrival cyclic pair; finish necessity and `clm0099_exact` through witnessed chronological insertion, never assume these premises.

No added hypotheses to original direct targets, custom axioms, proof holes, external computational oracle or novelty research.
