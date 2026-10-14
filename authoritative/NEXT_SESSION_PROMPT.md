# S033 — FUTURE / UNEXECUTED: prove the four-point geometric cases and metric-ear/cyclic reductions

**FUTURE / UNEXECUTED. A new explicit owner invocation authorises exactly S033.** Repository `jfairfaxball-348/ellipse-theorem`, namespace `ETSHTS`. The owner's invocation of this file is sufficient authorisation for S033 itself; do not request a second confirmation. Do not execute S034 in S033.

## Mandatory entry

Pin fresh LIVE main commit and actual commit tree, verify S032 authored single-parent commit, ordinary PR, merge parents/tree, open PRs and branches, and separately inspect both PR and merged-main Lean/governance checks and exact axiom lines. Previous main at S032 entry: `3920bfd71d2b882068e417d2aef19d82b0a3dda0`, commit tree `10d4de27bacbbd70c4329b412eb31974708c907c`. S031 merged-main Lean run `38638823699`, job `116108811872` SUCCESS; governance `38638823717`, job `116108811613` SUCCESS. Its `ellipse_ratio_101_le_R`, `four_point_order_from_strict_separation`, and `clm0102_exact` were all kernel-checked with only standard axioms. Read `AGENTS.md`, `authoritative/STATE.json`, `ETSHTS/ThreePredecessors.lean`, `sessions/S032/MATHEMATICS.md`, `sessions/S032/VALIDATION.txt`. Source-level S032 additions are not themselves a validated theorem until hosted S032 logs confirm.

## Fixed exact five targets — never weaken

- CLM0096: ALL 3/4 general-position site sets and their valid retained nearest-two plane order.
- CLM0099: strict-convex all-n **iff** FULL recursive metric-ear certificate.
- CLM0102: both endpoint derivatives and strict outward real-lift extension, already certified S030.
- CLM0107: EVERY n≥3 nondegenerate ellipse with a≥b>0 and a/b≤R **including equality**, exact Euclidean predecessors with original Cartesian lex ties, all edges retained, no proper crossings.
- CLM0108: all n for a/b=101/100, deducible only when CLM0107 is genuinely proved.

## S033 research priorities

1. **Finish CLM0096 in actual Lean.** S032's tie-safe `exactlyTwoNearest_three_exists` (verify first) handles nearest-pair existence even on equal squared distances. For the interior-fourth case prove triangle interior means any corner spokes make the five-edge graph plane. For convex case formalise the four-site interior/convex dichotomy, diagonals' strict intersection O, farthest endpoint, triangle-inequality strict squared-distance ordering of B,D ahead of opposite A, and no crossing. Apply S032 `four_point_order_from_exact_nearest` or S031 strict witness; construct a theorem with exact type `CLM0096`, print axioms.
2. **CLM0099:** independent Lean proof of edge count `3+2(n−3)=2n−3` with freshness, straight-line outerplanarity bound and hull-side saturation, last vertex degree/two compulsory hull neighbours, genuine full recursive deletion and reverse construction. Do not state an iff from a mere one-ear condition.
3. **CLM0107:** formalise finite cyclic lift and minimum two-gap inequality `T_i≤4π/n≤4π/5` for n≥5, including tied minima; prove a metric-ear selection from S030 strict short-arc lemma plus b-floor and wraparound/closed-R cases. Verify whether the cyclic two-gap minimum really yields required strict **Euclidean** comparisons in all cases. Seek explicit adversarial symbolic counterexamples before asserting missing inequalities. Incorporate n=3/4 base after CLM0096.
4. **CLM0108:** original ratio bound is already verified; call `clm0108_of_clm0107` only with an actual closed CLM0107 proof.

## Exit and validation

One isolated branch and one authored atomic commit, one non-draft PR, ordinary two-parent merge only after both independent PR checks pass. Recheck merged main checks. Run pinned `lake build`, `lake env lean ETSHTS.lean`, full axiom prints, grep prohibition of sorry/admit/axiom/native_decide, `python scripts/check_scaffold.py` and all tests. Distinguish kernel-verified statements from formal interfaces conditional on geometric premises and mathematical paper lemmas. All-five exact CLM theorem proofs → PASS; otherwise PARTIAL, and list exact unfinished goals. Keep immutable `ETSHTS/Targets.lean` unchanged; no Palomar, paper, arXiv, publication or outreach. Author the complete S034 future prompt for next explicit owner invocation only.
