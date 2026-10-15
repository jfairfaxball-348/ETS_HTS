# S045 — FUTURE / UNEXECUTED: finish original exact ellipse theorem Lean formalisation

**FUTURE / UNEXECUTED.** A new explicit owner invocation, including an owner instruction “Run next session”, this prompt's link, or this prompt pasted with an execution request **immediately authorises exactly S045**; no second confirmation. Publishing this handover **does not execute S045**, and S045 never silently executes S046. Repository https://github.com/jfairfaxball-348/ellipse-theorem ; namespace `ETSHTS`.

## Binding mathematics, no substitutions

Locked original [S020](../sessions/S020/MATHEMATICS.md) and [S021](../sessions/S021/MATHEMATICS.md). The original `ETSHTS/Targets.lean` and `ETSHTS/Definitions.lean` **byte immutable**; preserve original `Grow`, compulsory Euclidean two-nearest with Cartesian lexicographic distance ties, retained edges, `planeEdges`, supporting `hullSide`, `cyclicNeighbours`, `metricEar`, no spacing restrictions, all n≥3 and `a/b≤R` **closed equality endpoint**. No new mathematical research/novelty audits, weakened theorem, extra hypothesis, external oracle, custom axiom, `sorry`/`admit`/`native_decide`, Palomar, paper or press. Formalisation only; aim for **all three missing exact targets**, not a token lemma. Make repeated substantive proof+compiler repair passes, switch tracks when one is blocked, and record genuinely unsolved steps without false closure.

## Mandatory independent live entry

Pin fresh `main` commit/tree, verify S044 [PR #54](https://github.com/jfairfaxball-348/ellipse-theorem/pull/54) final authored single-parent commit, full changed tree, normal two-parent merge, last PR-head **Lean and governance**, independent *merged-main* Lean and governance, no open PRs and branch list. Rulesets and branch protection (403 = UNKNOWN). Check root `ETSHTS.lean` imports and exact printed axiom lines. S044 entry was `da2e0065077d6ab56a32aacf5e7fa6dc9871b565`, code-head `728b14954840e2556b4cc517a3c0fc4448f3a076`; final documentation commit and merge SHA must be discovered live. S044 pinned code-head Lean [38753860585](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38753860585) and governance [38753860641](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38753860641) SUCCESS, all five new axioms [propext, Classical.choice, Quot.sound]. Read [S044 coverage](../sessions/S044/PROOF_COVERAGE.md).

Existing direct exact targets kernel verified: `clm0096_exact : CLM0096`, `clm0102_exact : CLM0102`. Original `CLM0099`, `CLM0107`, `CLM0108` **OPEN** at S044 closeout.

## Track A — finish CLM0099 original iff through actual last insertion

1. Prove the **universal** combinatorial bound `H.card ≤ 2 * S.card - 3` for any supported `planeEdges H` on strictly convex/no-three-collinear finite `S`, with valid cardinality assumptions. Account for disjoint straight chords, shared endpoints, triangulation and arbitrary supported graphs. Do not assume it as an axiom or quietly replace original `planeEdges` by another drawing predicate.
2. Prove **every vertex has precisely two distinct supporting hull-side neighbours** for |S|≥4 in genuine strict convex position. Then use `s042_order_saturates_all_hullSides_of_cap` and `s043_grow_last_incident_edges` together with S044 `s044_forced_last_hull_side` / `s044_cyclic_last_of_saturation_and_two_sides` to force the compulsory pair of the **actual chronological last arrival**. The S044 `s044_clm0099_of_last_pair_cyclic_forcing` is CONDITIONAL and its hforced premise may be stronger than the exact last-witness result: if necessary rebuild the necessity induction around a witnessed true final arrival. Do not assert hforced or substitute an arbitrary ear.
3. Close direct `theorem clm0099_exact : CLM0099`, combine existing S042 certificate⇒order sufficiency; print exact axioms.

## Track B — finish CLM0107 genuinely all finite ellipse site sets

1. S044 now proved `s044_closed_ratio_cutoff_exceeds_four_pi_div_five`: **do not repeat** the strict cutoff challenge. Construct a bona fide cyclic angular lift from an **arbitrary original Finset of distinct ellipse boundary points** with positive successive gaps summing 2π, including wraparound, antipodal points and near-0 sites. Establish actual indexed sites, cyclic neighbours, and actual squared Euclidean skip chords; instantiate `s044_closed_ratio_metric_min_from_full_turn` with those values. No assumption of an already existing cyclic listing in the final universal theorem.
2. From the true minimising eligible skip chord, use `s035_eligible_skip_exceeds_both_neighbours` to obtain strict incident-chord inequalities; for every other site perform the full S020 **forward short** / **central closed band at both equality endpoints** / **backward short** analysis, invoking `s035_forward_short_arc_competitor`, `s036_closed_ratio_central_floor`, `s035_backward_short_arc_competitor`, original `sqDist_ellipse_strict_outward`. Prove the central distance lower bound and two-step witness upper bound rigorously with original circle/ellipse distance identities; selection is squared metric skip length, NOT angular minimum.
3. Prove uniform ≥5 `metricEar T v` for every such Finset, no extra site separation. Apply `clm0096_exact` and `s042_clm0107_of_clm0096_and_ge5_ears` **directly**, independent of CLM0099 necessity, to compile `theorem clm0107_exact : CLM0107`. Do not demand a size-four metric ear.

## Track C — CLM0108 and proof integrity

Once (not before) direct `clm0107_exact` compiles, derive `theorem clm0108_exact : CLM0108` via `clm0108_of_clm0107`. Root-import and `#print axioms` all five direct targets and new lemma chain; only standard `propext`, `Classical.choice`, `Quot.sound`. Full pinned hosted Lean 4.15.0 mathlib build, independent governance, no proof holes/custom axioms. Mark local Lean NOT_RUN if unavailable, never substitute for hosted check.

## Closeout

Use one fresh S045 branch from actual live main, ordinary PR, no rewrite/force, merge **only after latest PR-head Lean and governance SUCCESS**, then verify distinct merged-main Lean/governance. Write `sessions/S045/{INPUT,PLAN,PROOF_COVERAGE,CLOSEOUT}.md`, README, ledger, `authoritative/STATE.json`, and if needed issue S046 **FUTURE / UNEXECUTED**. Do not execute S046 without next owner's instruction. Preserve all S044 proven source. If a direct target remains OPEN, list precise uncovered lemma and do not call it Lean proved.
