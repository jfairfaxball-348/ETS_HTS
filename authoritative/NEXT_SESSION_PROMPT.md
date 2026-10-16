# S053 — FUTURE / UNEXECUTED: prove the genuine outerplanar cap and literal CLM0099

**FUTURE / UNEXECUTED. A new explicit owner invocation (e.g. “run next session”) authorises S053 only.** Do not execute S053 or S054 without their respective distinct owner invocations.

Canonical repository: `jfairfaxball-348/ellipse-theorem`. Namespace `ETSHTS`. Original frozen mathematical references `sessions/S020/MATHEMATICS.md`, `sessions/S021/MATHEMATICS.md`; immutable `ETSHTS/Definitions.lean` blob `f5e71b625bdbf40f6c84551dd93f9ce375154519` and `ETSHTS/Targets.lean` blob `e12f117589b1852e06aa669a405a6dc3ee652549`. No surrogate graph, new mathematics, changed geometry or theorem statement, additional axiom, proof hole, paper, Palomar, arXiv or novelty campaign.

## Mandatory independent entry validation

Fetch fresh LIVE main commit/tree (never trust this prompt's historical SHA); verify S052 source commit and ordinary PR #64 two-parent merge, latest PR-head Lean and governance SUCCESS, independently merged-main Lean and governance SUCCESS, exact root `#print axioms` lines, open PRs, branches/rulesets, frozen original blobs. Branch-protection 403 means UNKNOWN, not unprotected. Read `ETSHTS/GenuineEdges.lean`, `ETSHTS/ActualLastNecessity.lean`, `ETSHTS/FiniteHullNeighbours.lean`, `ETSHTS/OuterplanarSplit.lean`, S052 coverage and closeout, S020/S021.

## Only direct theorem target: unchanged `theorem clm0099_exact : CLM0099`

S052 proves the original two-neighbour fact `s052_two_hull_sides` for all strictly convex `T.card ≥ 4`. Its theorem `s052_clm0099_of_genuine_outerplanar_cap` has **exactly ONE remaining input**. Do not revisit the now-closed B route or rotate target.

Prove A, the TRUE **simple/genuine supported** noncrossing convex outerplanar bound:

```lean
∀ T : Finset Point, 4 ≤ T.card → strictConvexPosition T →
∀ H : Finset Edge, planeEdges H →
  (∀ e ∈ H, e ⊆ T) →
  (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
  H.card ≤ 2 * T.card - 3
```

S052's `s052_positiveHalf`/`s052_negativeHalf` (closed orientation halves), `s052_halves_union`, `s052_halves_intersection`, `s052_halves_card`, `s052_nonhull_witnesses`, and `s052_nonhull_halves_proper` are implemented to attack A by finite strong induction. Reuse these modules, not a new substitute definition.

### Mandatory proof attack, aggressively in one session

1. For a non-hull chord `edge p q ∈ H`, prove the actual four-point strict-convex crossing separation: if `r,s ∈ T` lie strictly on opposite sides of line pq, and `{r,s}` is independent of `{p,q}`, then `properCross p q r s`. Prove with original `openSegment` and `orientation`, leveraging existing S042 four-point barycentric and no-three-collinear geometry. This is the essential missing geometric lemma; no circular invocation of the cap or fictitious Mathlib planar Euler theorem.
2. Define `Hplus`, `Hminus` as original H edges entirely supported in each S052 half; show every genuine edge of H lies in one, since a mixed edge would properly cross the present pq. If edge shares p/q handle explicitly. Their intersection is exactly `{edge p q}` (not arbitrary singleton/empty) by two-vertex overlap and genuine-edge condition.
3. Both half-site sets are proper original strict-convex subsets, each with ≥3 vertices, and their cardinalities sum to `T.card+2`. Apply induction to their genuine noncrossing edge restrictions, including the 3-site simple complete graph bound `3 = 2·3−3`. Count `H.card = Hplus.card + Hminus.card − 1`; finish `2·T.card−3` exactly.
4. If no original H edge is a non-hull chord, all H edges are true hull sides. Bound their number by `T.card` (each site has at most two supporting neighbours, reuse `s047_hullSide_at_most_two`, with an explicit Finset incidence count). Then `T.card ≤ 2·T.card−3` since ≥4.
5. Declare the **unconditional** cap and instantiate `s052_clm0099_of_genuine_outerplanar_cap` to obtain literal `theorem clm0099_exact : CLM0099`, root import and `#print axioms ETSHTS.clm0099_exact`. Only then certify original direct theorem coverage 5/5, and only with standard-only axioms.

Multiple pinned hosted Lean 4.15.0 repair/build passes are expected; do not stop after one helper. If the proof is incomplete, preserve kernel-verified progress, identify exact remaining Lean goal(s), honestly retain 4/5, and hand over the SAME direct CLM0099 target in S054.

Archive S053 INPUT/PLAN/PROOF_COVERAGE/CLOSEOUT, edit authoritative STATE and ledger/README and separate owner-gated next prompt. Normal ordinary PR; final PR-head Lean + governance SUCCESS, merge, distinct merged-main Lean + governance SUCCESS. No S054 execution or publication in S053.
