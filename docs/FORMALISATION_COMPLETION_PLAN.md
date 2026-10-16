# Complete the exact ellipse theorem formalisation — critical path after S047

**Planning and handover document only; no S048 execution or advance authorisation.** Owner decision: freeze S020/S021 mathematics and the exact original definitions/targets; formalise **one direct original theorem at a time**, doing many dependencies per authorised session. Never replace CLM0107 by a simpler variant. A successful helper theorem or Lean build is not headline closure.

## Precise baseline (verified merged S047)

- `clm0096_exact : CLM0096` and `clm0102_exact : CLM0102` proved; **2/5 original headline claims**.
- `clm0107_exact : CLM0107` OPEN. This is the sole active direct theorem.
- `clm0108_exact : CLM0108` OPEN, deferred, with direct Lean reduction `clm0108_of_clm0107_and_ratio` and verified `ellipse_ratio_101_le_R` available.
- `clm0099_exact : CLM0099` OPEN, deferred; the certificate -> order implication is proved.
- S047's `s047_actual_sites_min_skip_cyclic_neighbours` proves, for *every original* finite ellipse-boundary S with ≥5 points under **closed** a/b ≤ R, actual ordered phases, genuine hull-side neighbours of a minimum *Euclidean squared* eligible skip, and strict incident distances. It does **not** compare other sites or produce a `metricEar`.

## Critical path A — prove original CLM0107 (stay until compiled)

The S020 theorem's essential remaining mathematical interface is one unconditional original-site result:

```lean
∀ (a b : ℝ), 0 < b → b ≤ a → a / b ≤ R →
∀ S : Finset Point, 5 ≤ S.card →
(∀ p ∈ S, ellipseBoundary a b p) →
∃ v : Point, metricEar S v
```

Then use exact existing `s042_clm0107_of_clm0096_and_ge5_ears clm0096_exact` to compile literal `theorem clm0107_exact : CLM0107`, print its axioms. No CLM0099 necessity, no four-site metric-ear assertion.

Implementation interfaces, ordered by dependency (combine as many as feasible within S048 and successors):

**A1: actual cyclic competitor indexing.** For S047 true phase embedding and chosen centre `v = ellipsePoint a b (θ (finRotate i))`, map each original `x ∈ S.erase v` to its *unique* actual `Fin (n+1)` index. Prove explicit next/previous/two-away index separation and real unwrapped `δ∈(0,2π)`, handling the 0/2π seam, antipodal and arbitrary tiny gaps. Compare actual `sqDist` after `ellipsePoint` 2π periodic rewrites. Do NOT postulate a cyclic listing or silently invoke an angular selector.

**A2: true eligible witness upper bound (high priority).** Derive an index with two-gap span ≤ 4π/5 from the proved full-turn sum, show eligibility via the strict `4π/5 < lambda` result, and prove original Euclidean **length** skip ≤ 2a sin(2π/5), or equivalent **squared** inequality with nonnegativity. Reuse `s046_original_closed_ratio_skip_min` to compare selected squared skip to witness. Do not confuse the existing *minimum among eligible indices* with an absolute chord upper bound: this bound must be proved.

**A3: central CLOSED band.** For λ ≤ δ ≤ 2π−λ, bound the *original* elliptical squared chord below by the squared circular b-axis chord; bound sin(δ/2) from below by sin(λ/2), including δ exactly λ and 2π−λ. Use the exact half-angle identity to obtain `4*a*b^2/(a^2+b^2)` and S036's verified `s036_closed_ratio_central_floor` at **a/b = R equality**, then square/order using nonnegative real lengths. Include antipodal δ=π and both band endpoints.

**A4: forward and backward short arcs.** If δ < λ, non-neighbour x is at least the second forward successor; its intervening eligible skip is bounded below by the selected metric skip. Apply the genuine S035 forward extension under actual real lifts. For x exactly the second successor, use the minimum directly (strict-extension lemma does not accept equality). Mirror for δ > 2π−λ, including reverse wrapping and exactly the second predecessor. Assign δ=λ and δ=2π−λ to A3; no gaps and no double-count boundary assumptions.

**A5: one all-competitor theorem, then close main.** Prove for the original selected centre and every original x not either true hull neighbour that `s046_squared_skip_chord a b θ i ≤ sqDist v x`; combine with S047's strictly smaller incidents using `s035_metric_ear_of_skip_chord_floor`. Prove the unconditional ∀S≥5 ear theorem, then invoke `s042_clm0107_of_clm0096_and_ge5_ears` to prove EXACT `clm0107_exact : CLM0107`. Root import and `#print axioms`. No weakening of `Targets.lean`.

Architecture: small purposeful modules for real lift/index, Euclidean chord bounds, the closed central band, the two short bands and the final bridge. Reuse S035/S036/S044/S045/S046/S047 rather than cloning. Prefer finish one connected proof obligation end-to-end; multiple hosted Lean repair passes are expected. Avoid arbitrary 'one helper per session' caps.

## Critical path B — immediate exact CLM0108

**Only once CLM0107 is verified:** instantiate existing `clm0108_of_clm0107_and_ratio` using `clm0107_exact` and already verified `ellipse_ratio_101_le_R`; compile `theorem clm0108_exact : CLM0108`, run independent CI and axiom audit. This is a separately owner-authorised direct theorem session, or a later separately authorised follow-on, not automatically executed by A.

## Critical path C — finish CLM0099 necessity (separate graph-theory work)

The certificate → order direction is already `s042_fullEarCertificate_implies_planeNearestTwoOrder`. To prove the converse, recover the **actual chronological final insertion** from an original planar `Grow` history (S043); show its final incident edge set consists exactly of the two ranked predecessor edges; show both genuine hull-side edges at that last vertex are present in the final graph; identify its ranked neighbours using `s044_cyclic_last_of_saturation_and_two_sides`; recursively peel the true last vertex and reuse `s044` induction structure.

**Crucial trap 1 — the S044 forcing hypothesis is too strong:** `s044_clm0099_of_last_pair_cyclic_forcing` currently asks for cyclic forcing for *any* v with a separate valid order of S.erase v and two nearest sites. This is not the same as v being the **actual final insertion** in the particular planar history and should NOT be treated as generally provable. Refactor the helper's sufficient premise to a predicate on the *actual last-history witness*, or prove the induction directly from the original last-step decomposition. Preserve the unchanged CLM0099 target.

**Crucial trap 2 — the S042 edge cap as typed cannot be the final theorem:** `s042_order_saturates_all_hullSides_of_cap` assumes `∀ H, planeEdges H → (∀ e∈H, e⊆S) → H.card ≤ 2*S.card-3`. Unrestricted `Finset (Finset Point)` H includes empty/singleton 'edges'; `planeEdges` does not exclude them, so the universal premise is too broad. Formulate and prove an outerplanar cap for a **simple graph of genuine two-distinct-vertex edges** with endpoints in a strictly convex finite S, and prove every edge in the original final Grow graph meets this invariant. Then reconstruct a valid saturation lemma with the strengthened cap and original edge count `2*|S|-3`. Do not assume the false unrestricted cap. Prove existence of exactly two hull neighbours via actual finite convex geometry, not by choosing arbitrary edge endpoints.

A clean possible route to the cap: cyclic order of S, bound a noncrossing set of distinct genuine diagonals by |S|-3, plus ≤|S| hull sides, or derive the standard outerplanar 2|S|-3 bound via an explicit finite induction. Check definitions carefully: `planeEdges` only rejects proper crossing between disjoint genuine edges; use no-three-collinear / strict convexity to bridge. Finish necessity with literal `clm0099_exact : CLM0099` and standard axioms.

## Session policy and stop condition

- S048 focuses on A1–A5, prioritising **A2 and A3** because these turn existing selection/algebra into a genuinely quantitative result; attack the other bands in the same session if feasible. If not finished, S049 remains the **same sole CLM0107** target, with explicit handover of specific remaining Lean types and compiler errors.
- Beyond S048, do **not** use predetermined session counts, rotate between direct targets, or count source files as evidence of theorem completion. Session closure means an actual newly compiled proof on the critical path, explicit blocker diagnosis, or verified headline theorem; record changed proof interfaces, not generic 'progress'.
- When CLM0107 genuinely compiles, switch next explicitly authorised session to CLM0108, then to CLM0099. Do not infer completion from a PR being merged.
- Verify PR-head Lean + governance before an ordinary merge, verify **independent merged-main** Lean + governance afterwards, and audit `#print axioms` standard-only. Original `ETSHTS/Definitions.lean` and `ETSHTS/Targets.lean` blobs remain unchanged. Frozen mathematics S020/S021. No new mathematical theorem substituted or paper/release claim.
- If the frozen mathematical argument contains a real gap, identify the exact failed inequality / case in the original S020 proof and ask the owner to decide whether to reopen mathematics. Never fabricate a Lean proof or silently alter the target.


## S048 update — exact proofs that now exist

A2 is proved in `QuantitativeSkip.lean`: selected original squared Euclidean skip ≤ [2a sin(2π/5)]² ≤ [4ab²/(a²+b²)]² from a **true** 4π/5 cyclic averaging witness, not merely eligible-min existence. Analytic A3 is proved in `CentralChordBand.lean` and `CentralCutoffIdentity.lean`, with the exact λ sine formula and correct sine monotonicity on both half-bands; `CentralOriginalSites.lean` attaches this to arbitrary original S≥5. Conditional real-lift forward/back short A4 estimates, including exact second-neighbour equality, are compiled in `ShortArcLifts.lean`. Genuine original x unique indexing and seam-aware δ∈(0,2π) are in `CompetitorPhaseIndex.lean`.

**Only critical CLM0107 gap after S048:** actual Fin rotation order and true lifted-angle position of *each* original non-neighbour x relative to the correct second successor and second predecessor, so every x can be put into one of the now-proved three metric inequalities. Close `∀x` skip floor → uniform original `metricEar` → literal `clm0107_exact`; do not pivot to deferred CLM0108 or CLM0099. Read [S049 handover](../authoritative/NEXT_SESSION_PROMPT.md).

## S049 update — original CLM0107 is now kernel proved

S049 source [CyclicCompetitorExact.lean](../ETSHTS/CyclicCompetitorExact.lean) proves the exact original `clm0107_exact : CLM0107`, compiled and axiom-printed on hosted Lean run 38872864840. Original true site indexing, eligible Euclidean metric skip, actual cyclic hull neighbours and reverse real lifts were all used; no repaired theorem statement, spacing or tie condition. Exact metric-ear existence on every ellipse site set of ≥5 points now closes the previous gap and uses `s042_clm0107_of_clm0096_and_ge5_ears clm0096_exact`.

The **sole next direct original theorem** is CLM0108, which is already reduced to CLM0107 and a verified closed-ratio arithmetic bound, but requires separately owner-authorised S050 and its own compiled literal theorem plus axiom/CI audit. **After that** CLM0099 necessity remains distinct graph-theoretic work, with the previously documented simple-edge outerplanar cap and genuine last-arrival forcing pitfalls unchanged. Do not work on CLM0099 during S050. Direct coverage 3/5. S049 PR-head governance and independent merged-main CI must be checked before recording merge validation.


## S050 proof completion update

The precise nonround original CLM0108 theorem is now a root-imported direct compiled proof `clm0108_exact` using S049 `clm0107_exact` and the already proved rational aspect bridge. Code-head Lean run [38878900054](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38878900054) SUCCESS, `#print axioms ETSHTS.clm0108_exact` standard-only. Direct original coverage is **4/5**; CLM0099 necessity is the sole remaining original statement. S051 is separately owner-gated and should replace the false unrestricted `planeEdges` edge cap by an actual genuine-two-vertex noncrossing outerplanar cap and reason about the actual final chronological insertion.


## S051 — 16 October 2026

Owner authorised S051 from main `10500aec53f3024a2a88509e6e867df2c1157716` after S050 PR #62 final PR Lean 38879662680/governance 38879662603 and independent merged-main Lean 38879982293/governance 38879982337 SUCCESS. New genuine-edge Lean invariant, restricted truthful saturation and complete **actual chronological** last-arrival necessity induction **conditional on two geometric inputs** compile. Source Lean [38882163342](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38882163342) SUCCESS; eight root S051 axiom prints all standard-only. The two outstanding generic strict-convex results are genuine supported planar `2n−3` upper cap and two hull-side neighbours. `clm0099_exact` STILL OPEN (4/5 direct theorem score); `Definitions.lean` and `Targets.lean` unchanged. See [S051 coverage](sessions/S051/PROOF_COVERAGE.md) and [owner-gated S052](authoritative/NEXT_SESSION_PROMPT.md). No mathematical expansion/paper/release.


## S052 update — generic hull-side neighbours discharged

The source `FiniteHullNeighbours.lean` has a Lean-verified strict-convex projected-slope-extrema proof `s052_two_hull_sides` (hosted run 38885231074, printed only standard axioms). Orientation half-planes for an original non-hull chord partition vertices with precisely the two endpoints overlapping; the S052 split proves the exact `|T+|+|T−|=|T|+2` identity and properness, preparing full edge-count induction. The one-premise `s052_clm0099_of_genuine_outerplanar_cap` is the shortest remaining route to the literal original CLM0099. Critical missing component is genuine convex four-point crossed-chord separation followed by edge partition and induction, including the hull-side-only base. Score remains 4/5 until exact A and literal `clm0099_exact` compile. S053 is owner-gated and solely targets this.
