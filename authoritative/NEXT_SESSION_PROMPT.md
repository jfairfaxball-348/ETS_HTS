# S042 — FUTURE / UNEXECUTED: finish the exact finite geometry, full metric-ear iff, and uniform ellipse proof

**FUTURE / UNEXECUTED.** A **new explicit owner invocation** (“run the next session”, the pasted prompt, or its canonical link) authorises exactly S042 immediately, without additional confirmation. The existence of this handover does NOT execute S042 or any later numbered session.

Canonical repository: https://github.com/jfairfaxball-348/ellipse-theorem ; Lean namespace `ETSHTS`.

## Mission: complete as much of the entire unchanged theorem as possible

S042 is an **ambitious, compiler-driven formalisation session**; do not stop merely because one lemma, module, proof pass, CI success, or preparatory roadmap is complete. Work end-to-end on the actual target declarations. Build substantial chains, run GitHub CI, inspect compiler errors, correct them, and carry on to the next dependency, interleaving workstreams if one stalls. Prefer closing exact CLM0096, CLM0099, CLM0107 and CLM0108 in this session if possible; honest resource exhaustion is the only acceptable reason to leave tractable open work for S043. Do NOT execute S043.

## LOCKED mathematics and source integrity

Use `sessions/S020/MATHEMATICS.md` and `sessions/S021/MATHEMATICS.md`/ `LEAN_BLUEPRINT.md` as the frozen underlying argument. `ETSHTS/Targets.lean` and `ETSHTS/Definitions.lean` remain **byte-for-byte immutable**. This is not a novelty audit, search for replacement mathematics, threshold optimisation, counterexample hunt, Palomar run, manuscript or publication session.

Preserve the exact theorem scope:

- CLM0096 includes all 3/4 distinct non-collinear point sets (interior sites and convex quadrilaterals).
- CLM0099 is the precise `planeNearestTwoOrder S ↔ FullEarCertificate S` for all finite strictly convex sets of size ≥3, **both directions** and genuinely recursive.
- CLM0102 is already proved as `clm0102_exact` and must be retained.
- CLM0107 is for EVERY finite n≥3 ellipse-boundary set, a≥b>0, a/b≤R including equality; exact Euclidean two-nearest predecessor selection, Cartesian lex distance ties, all old edges retained, no proper crossings; no separation or genericity assumptions.
- CLM0108 is the exact all-n nonround 101/100 ellipse.

The frozen S020 geometric method selects the **minimum Euclidean metric skip chord among eligible two-gap arcs**, not shortest angular gap, generic shortest edge, or minimax proxy. Preserve short-arc/central/backward competitor case splits and boundary cases. No `sorry`, `admit`, bespoke axioms, `native_decide` gaps, fake Lean theorem claims, or weakened target substitutions.

## Mandatory live entry and S041 inheritance

Freshly pin main SHA AND tree; inspect open PRs/branches, branch protection/rulesets (403 = UNKNOWN), latest independent PR and merged-main Lean/governance workflow evidence, actual job logs and exact `#print axioms` lines. Reconcile S041 closeout, source modules, source-level SHA and exact checks; do not infer S041 final PR number, merge SHA, or success from its pre-merge archive. Preserve S040 PR #48 merge `56e9c184f95b9054cbe175b3ab402f02dd5cdaab` and S041 entry `7f019cd8b989ce9d287174827b2fe6ad7b378ad5` (tree `6f8e261238f2c243bafdbead095b767bdd10b568`).

S041 established (conditional on checking latest merged-main CI) the following real source files and theorem names:

- `ETSHTS/GlobalCount.lean`: `s041_triangleEdges_card`, `s041_triangleEdges_supported`, `s041_planeNearestTwoOrder_exact_edge_count` proving an original planar Grow order has **exactly 2*S.card−3** supported edges.
- `ETSHTS/EarInduction.lean`: `s041_uniform_metricEar_gives_certificate`, `s041_ellipse_full_certificate_of_uniform_ears`, `s041_clm0107_of_clm0099_and_uniform_ears`, `s041_clm0108_of_clm0099_and_uniform_ears`. These are **conditional reductions**, not proofs of their premises.
- `ETSHTS/NoThreeCollinear.lean`: `s041_orientation_zero_affine`, `s041_affine_parameter_distinct`, `s041_no_three_exposed_on_affine_line`, `s041_strictConvexPosition_noThreeCollinear`, `s041_ellipse_noThreeCollinear`. This connects strict support to orientation-zero exclusion with no cardinality bound.
- `ETSHTS/HereditaryGeometry.lean`: `s041_strictConvexPosition_of_subset`, `s041_noThreeCollinear_of_subset`, `s041_hullSide_of_subset`, `s041_strictConvexPosition_erase`.
- `ETSHTS/CertificateCases.lean`: `s041_fullEarCertificate_card_ge_three`, `s041_fullEarCertificate_iff_ear_deletion`, `s041_certificate_four_has_three_site_remainder`. Check live CI before crediting.

Earlier verified modules include `Foundation.lean`, `Partial.lean`, `RationalBound.lean`, `ThreePredecessors.lean`, `EarFramework.lean`, `EarCounting.lean`, `GrowCounting.lean`, `EllipseConvex.lean`, `EligibleSkip.lean`, `CentralRatio.lean`, `Cutoff.lean`. Do not rebuild mathematics as if these proofs did not exist. Current exact CLMs: only CLM0102 VERIFIED; CLM0096/0099/0107/0108 OPEN.

## Critical-path proof tasks, to pursue iteratively and in parallel where useful

**A. Finish CLM0096, exact all four-site geometry.** For any S.card=4 and noThreeCollinear S, prove either the fourth lies inside the opposite three-site triangle (all three spokes interior/no proper crossings) or four sites form a strictly convex quadrilateral. In the convex case supply a last vertex whose exact two-nearest predecessors are its two hull neighbours, including equal Euclidean distances with CARTESIAN tie priority. Reuse `ThreePredecessors`, `FourPoint`, `s041_strictConvexPosition_noThreeCollinear` where relevant; do not leave geometric planarity as a hidden hypothesis. Compile `theorem clm0096_exact : CLM0096`.

**B. Finish CLM0099 iff, not just edge counting.** From `s041_planeNearestTwoOrder_exact_edge_count`, prove every required hull-side edge belongs to the planar full graph and that a last-inserted vertex must be a true metric ear; recurse with the entire strictly convex site set and inherited graph conditions. Separately prove that reverse insertion of ANY certified original metric ear preserves `planeEdges` and exact two-nearest selection on the preceding vertices, with all earlier edges retained. Use `s041_fullEarCertificate_iff_ear_deletion` and `s041_strictConvexPosition_erase` to keep induction honest. Finish **both** directions and compile `theorem clm0099_exact : CLM0099`.

**C. Prove uniform ellipse metric ears at ALL n≥5.** Build a finite strictly cyclic real-lift angular representation of an arbitrary `Finset Point` on the ellipse, including periodicity and uniqueness modulo 2π, positive gaps, sum 2π, two-gap sum 4π, and actual orientation/hull-neighbour bridges. Formalise 4π/5<lambda using the closed R constraint, finite eligible-witness existence, and the **eligible metric skip-chord MINIMUM** using `s035_eligible_metric_min_exists`. Connect exact angular distance formulas and `s036_closed_ratio_central_floor` to prove every non-neighbour competitor has squared distance ≥ selected skip length, in ALL forward-short, central (including equality and antipodes), and backward-short cases, with both adjacent distances STRICTLY smaller. Prove `∃ v, metricEar S v` for each finite ellipse set size≥5 (and use CLM0096 for size 3/4). Use `s041_ellipse_full_certificate_of_uniform_ears` after establishing the needed card=4 ear existence, or a precise 4-point-tail variation of its induction, to close all n. Check no hidden circular dependency: the existing uniform-ear induction asks for ears at **card≥4**; a standalone CLM0096 plus recursion-to-four may need a separate induction statement rather than falsely assuming a metric ear at card4. Once combined with CLM0099, compile `theorem clm0107_exact : CLM0107`.

**D. Complete headline chain and audit.** CLM0108 follows directly by `clm0108_of_clm0107` once CLM0107 is kernel-proved; compile `theorem clm0108_exact : CLM0108`. Keep `clm0102_exact` and all preexisting axiom prints. Prove direct unmodified target propositions, not helpers with hypotheses restating the conclusion.

## Rigorous engineering process and exit

Use a single new S042 branch from **observed** main, coherent proof commits with traceable sequential compiler-repair commits, an ordinary non-draft PR, and a normal two-parent merge after **both** PR Lean and governance SUCCESS, then distinct merged-main Lean/governance SUCCESS. Local Lean/lake may be unavailable; GitHub-hosted CI is a valid compiler, but inspect error lines/job logs and correct in multiple iterations. A green run that compiles only helper lemmas does NOT certify unproved CLMs. The CI's forbidden-token scan also matches standalone banned words inside comments; avoid those words in Lean comments as well as proof code.

Run/verify `python scripts/check_scaffold.py`, all seven governance tests, `lake build`, `lake env lean ETSHTS.lean`, target `#print axioms`, and full forbidden-token scan via local or hosted CI; list NOT_RUN when inaccessible. Preserve `Targets.lean`/`Definitions.lean` blob SHAs. Maintain `sessions/S042/INPUT.md`, `PLAN.md`, `PROOF_COVERAGE.md`, `CLOSEOUT.md`, and truthful `STATE.json`. If full targets remain genuinely blocked at a resource/context/compute limit, archive precise mathematical/formal Lean proof gaps and CI repairs, mark unchanged CLMs OPEN, and issue an equally ambitious complete **S043 FUTURE / UNEXECUTED** next-session handover. No automatic S043 execution.
