# S026 — exact Lean theorem-engineering record

## Partial contribution, not completion

New module `ETSHTS/Partial.lean` has concrete `theorem` terms, not definitions of `Prop`:
- `planeEdges_triangle`: all three seed edges pairwise share endpoints, so no independent proper crossings.
- `planeNearestTwoOrder_triangle`: original exact `planeNearestTwoOrder` witness for any distinct triple, with initial triangle, empty `Grow` continuation, retained edges.
- `clm0096_card_three`: true `S.card = 3` subcase of CLM0096 (even without no-three-collinear). The **four-point** case is unproved.
- `fullEarCertificate_of_card_three`: full recursive certificate's original three-point base.
- `sqDist_ellipsePoint_expand`: precise Cartesian squared distance identity; genuine input for calculus, **not** both endpoint derivative formulae.
- `metricEar_of_strict_gap`: given a proper hull-neighbour pair and strict distances to all other sites, the exact metricEar condition follows including lex tie semantics. Establishing the geometric strict-gap hypotheses universally remains open.
- `clm0108_of_clm0107_and_ratio`: exact universal (all finite `S`, no cardinality cap or generic position extra) CLM0108 conditional on **a genuine CLM0107 proof and the exact 101/100≤R bound**. Neither antecedent is provided here.

The original `ETSHTS/Targets.lean` (five `def ... : Prop`) is intentionally unchanged. A `#check` of a `Prop` does not discharge it. No algebraic floating approximations or sorry/axiom/native_decide were used.

## Prior proof map and exact open blockers

1. CLM0096: strictly convex four-set diagonal/intersection construction, all order/nodup and no-crossing Finset witnesses; also interior 4-site placement.
2. CLM0099: for strictly convex finite S, embed order graph, count distinct retained edges 2m−3, prove outerplane ≤2m−3, hull-side saturation, last degree-two metric ear, recursive reversal.
3. CLM0102: calculate both separate real endpoint derivatives; show strictly positive on 0<Δ<Λ and genuine strict outward chord inequalities, not just formula for squared distance.
4. CLM0107: cyclic sorted angular lifts and exact boundary-point bijections, strict ellipse convexity, pair-gap averaging giving eligible span at n=5 and closed R, minimum metric skip-chord selection, short forward and backward cases, central/antipodal floor, exact nearest two and complete recursive certificate, all finite-cardinality induction.
5. CLM0108: exact numerical radical/trig proof of (101/100)≤R and application of proved CLM0107 via supplied bridge.

No main target theorem is declared proved. S020/S021 internal paper proof/audit are not Lean certificates; S024's final novelty decision is conditional and independent from kernel proof status.

## Toolchain and evidence boundary

`lean-toolchain` remains `leanprover/lean4:v4.15.0`, `lakefile.lean` mathlib pin `9837ca9d65d9de6fad1ef4381750ca688774e608`. These declarations require actual hosted `lake build` plus `lake env lean ETSHTS.lean` and review of `#print axioms` outputs. Local `lean/lake/elan` absent; direct GitHub network resolution in container unavailable. S026 build state at authored commit time: **PENDING_REMOTE_CI**, not implied PASS; see PR/Actions results produced after branch push.

## Audit

All five immutable CLM statements retain exact closed-R endpoint, every n≥3, Cartesian tie, two nearest predecessors, retained edges and planarity. S026 adds *proof lemmas*, never changes these targets. Historical registry counts and old negative campaigns untouched.
