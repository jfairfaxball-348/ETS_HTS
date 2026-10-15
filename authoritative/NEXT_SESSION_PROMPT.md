# S044 — FUTURE / UNEXECUTED: finish exact immutable ellipse theorem through repeated Lean compiler passes

**FUTURE / UNEXECUTED.** A new explicit owner invocation (“run next session”, this prompt link, or a pasted copy with an execution instruction) immediately authorises exactly S044; no redundant confirmation. The creation of this handover does NOT execute it. S044 does not authorise S045.

Repository: https://github.com/jfairfaxball-348/ellipse-theorem. Lean namespace: `ETSHTS`.

## Binding mathematical and operational constraints

The mathematical theorem is **frozen**, as in `sessions/S020/MATHEMATICS.md` and `sessions/S021/MATHEMATICS.md`. S044 is only Lean formalisation; do not initiate new mathematics, novelty searches, altered theorem statement, modified metric/lex tie rule, extra angular spacing, open-ratio substitution, weaker target, arbitrary unproved hypotheses, proof holes, custom axioms, publication, Palomar or outreach. The original `ETSHTS/Targets.lean` and `ETSHTS/Definitions.lean` are immutable byte-for-byte. Continue with original `Grow`, `planeEdges`, `cyclicNeighbours`, `metricEar`, full `CLM0099`, and original `CLM0107` at the **closed** R endpoint.

**Aim to compile all three remaining exact direct targets, not a single file or administrative pass.** Conduct repeated substantial proof/repair passes using hosted pinned Lean 4.15.0 and mathlib. When stuck on one component, move to another verified step in the same session. Context/time constraints allow incomplete closure provided the actual verified results and next lemma-level gaps are recorded honestly.

## Mandatory live entry

Pin fresh live main SHA and Git tree, compare S043 [PR #53](https://github.com/jfairfaxball-348/ellipse-theorem/pull/53) authored code/head, normal two-parent merge status, separate newest PR Lean/governance status and independent merged-main Lean/governance runs. List open PRs and branches; inspect rulesets and branch protection (403 means UNKNOWN, not absent). Inspect actual `ETSHTS.lean` imports, exact #print axioms and latest source; do not trust just this handover for the final merge verdict.

S043 nine new Lean theorems are in `ETSHTS/LastArrival.lean`, `ETSHTS/LastOrder.lean`, `ETSHTS/RatioWindow.lean`, including
`s043_grow_extract_last`,
`s043_grow_last_prefix_planar`,
`s043_grow_last_incident_edges`,
`s043_order_peel_explicit_last`,
`s043_nonempty_list_has_last`,
`s043_planeOrder_has_last_ranked_predecessors`,
`s043_R_lt_11_div_10`,
`s043_closed_ratio_strict_aspect_bound`,
`s043_closed_ratio_minor_axis_floor`.
PR code-head [Lean 38745083059](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38745083059) and [governance 38745083093](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38745083093) both SUCCESS on 926660e9adb5156ca8a8e619a1e30611b99e800c. Inspect **final documentation PR head** and merged-main runs separately.

Already kernel-verified original direct exact targets: **`clm0096_exact : CLM0096` and `clm0102_exact : CLM0102`**. OPEN direct targets: **`CLM0099`, `CLM0107`, `CLM0108`**. S042 certificate ⇒ planar direction of 0099 verified. S043 necessity peeling verified *without yet proving cyclic-hull neighbourhood*. S042 all-n four-tail induction verified but **requires uniform ≥5 metric ear input**. Conditional bridges are not direct proofs.

## B. Finish CLM0099 necessity, then exact iff

1. Prove universal planar outerplanar edge bound for an arbitrary Finset of straight chords H supported on strictly convex/no-three-collinear S with original `planeEdges H`: `H.card ≤ 2 * S.card - 3`. No unverified triangulation or external oracle. Formalise correct finite polygon chord crossing, planar triangulation/diagonal count or combinatorial outerplanar embedding with every endpoint and edge accounted for.
2. Use existing `s041_planeNearestTwoOrder_exact_edge_count` and `s042_order_saturates_all_hullSides_of_cap`. Prove every vertex in strictly convex position with |S|≥4 has exactly two distinct genuine supporting hull neighbours, then use S043 proven `s043_grow_last_incident_edges` / `s043_planeOrder_has_last_ranked_predecessors` to identify actual exact nearest pair as *those* two cyclic neighbours. Do not substitute any ear other than the **actual last insertion**.
3. Apply strong induction through original deletion and `FullEarCertificate.remove` (triangle base already proved). Combine necessity with `s042_fullEarCertificate_implies_planeNearestTwoOrder`, compile `theorem clm0099_exact : CLM0099` and print exact axioms. The empty-card and four-card boundary cases must be correct; no hidden "some ear" substitute.

## C. Finish CLM0107 — genuinely every finite ellipse site set

1. From any Finset of ≥5 distinct points on the positive-axis ellipse, construct a cyclic indexed enumeration of genuine lifted angular representatives with positive gaps summing to 2π; use periodicity/injectivity and handle all wraparound and any site near 0/2π. Lean must tie each index to an actual original `ellipsePoint` site and preserve uniqueness.
2. Prove `4 * pi / 5 < lambda a b` for **all** `0<b≤a` and `a/b≤R`, equality included. S043 `R<11/10` can be used only if it actually facilitates the required arctan inequality; it is not itself the needed cutoff statement. Instantiate certified `s042_eligible_metric_min_from_full_turn` with actual squared skip chords (not angular-minimising selector).
3. Show neighbour chords strictly shorter with `sqDist_ellipse_strict_outward`. For every non-neighbour, prove **forward-short / central closed-band / backward-short** distance lower bounds as in S020/S021; use S036 `s036_closed_ratio_central_floor`, square/sqrt comparisons, antipodal cases and equality at both central endpoints. Obtain a true `metricEar T v` for *every* eligible size≥5 set with no separation assumptions or choice of lex ties overriding strict gaps.
4. Apply completed `clm0096_exact` and `s042_clm0107_of_clm0096_and_ge5_ears` directly to compile `theorem clm0107_exact : CLM0107`. Do not require a size-four ear.

## D. Exact CLM0108, no-holes and closeout

If and only if CLM0107 is compiled, use original `clm0108_of_clm0107` to compile `theorem clm0108_exact : CLM0108`. Ensure `clm0102_exact` and `clm0096_exact` retain existing certification. Print axioms on all five exact direct targets and new lemma chains; standard dependencies only `propext`, `Classical.choice`, `Quot.sound`. Pinned hosted full build, root `lake env lean ETSHTS.lean`, no `sorry`/`admit`/custom axiom/`native_decide`, independent governance. If local Lean not available, explicitly mark local checks NOT_RUN, use hosted logs only.

Work on one fresh S044 branch from actual live main, regular PR, no force/rewritten history, merge only when latest PR Lean and governance both SUCCESS; then separately check new merged-main Lean/governance. Update `sessions/S044/{INPUT,PLAN,PROOF_COVERAGE,CLOSEOUT}.md`, README/ledger and `authoritative/STATE.json` and issue **S045 FUTURE / UNEXECUTED** if needed. Do not execute S045. If any target remains OPEN, state the exact next unproved lemma, do not call it formalised, and preserve all proven code.
