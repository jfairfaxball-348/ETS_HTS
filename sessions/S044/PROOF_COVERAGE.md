# S044 — exact compiler coverage and remaining original goals

## Independently checked hosted Lean evidence

Code commit [f1541c6](https://github.com/jfairfaxball-348/ellipse-theorem/commit/f1541c69008bdf8f27f86cb51fa7513d8d55c0fe): PR Lean [38752891537](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38752891537), PR governance [38752891895](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38752891895) SUCCESS.

Code commit [297a5e0](https://github.com/jfairfaxball-348/ellipse-theorem/commit/297a5e0aa7dc70764885dc8f6cbda7cad1513581): PR Lean [38753514953](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38753514953), governance [38753515029](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38753515029) SUCCESS.

Code commit [728b149](https://github.com/jfairfaxball-348/ellipse-theorem/commit/728b14954840e2556b4cc517a3c0fc4448f3a076): PR Lean [38753860585](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38753860585), governance [38753860641](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38753860641) SUCCESS. The final code-head root `lake env lean ETSHTS.lean` prints **all five new declarations** with exact dependency list `[propext, Classical.choice, Quot.sound]` each. Pinned full mathlib build, no `sorry`/`admit`/`axiom`/`native_decide` passes. Local Lean/lake NOT_RUN. Documentation-head and independent merged-main status must be checked separately after archive/merge.

## Five new compiled original-definition theorems

| File | New theorem | Exact established content |
|---|---|---|
| [AngularCutoff.lean](../../ETSHTS/AngularCutoff.lean) | `s044_closed_ratio_cutoff_exceeds_four_pi_div_five` | Unconditional strict `4*pi/5 < lambda a b` under `0<b≤a` and **`a/b≤R`**, including equality |
| [AngularCutoff.lean](../../ETSHTS/AngularCutoff.lean) | `s044_closed_ratio_metric_min_from_full_turn` | With a genuine finite full-turn gap sum given, obtains eligible minimum of **squared Euclidean skip-chord** under the original closed-ratio hypothesis |
| [NecessityInduction.lean](../../ETSHTS/NecessityInduction.lean) | `s044_clm0099_of_last_pair_cyclic_forcing` | Full strong-induction `CLM0099` conditional on an explicitly stated, **unproved** last-pair cyclic forcing premise; valid size-three base and original certificate removal |
| [HullLastBridge.lean](../../ETSHTS/HullLastBridge.lean) | `s044_forced_last_hull_side` | Every supporting side incident to a true degree-two last arrival with saturated hull sides must use one of its two mandatory predecessor endpoints |
| [HullLastBridge.lean](../../ETSHTS/HullLastBridge.lean) | `s044_cyclic_last_of_saturation_and_two_sides` | Such a final pair are genuine unique cyclic neighbours, **conditional** on saturation, last incidence and existence of two distinct supporting hull neighbours |

The conditional theorems DO NOT assert those premises hold globally. The original `Grow`, `planeEdges`, `metricEar`, `cyclicNeighbours`, `priority` and all target definitions remain immutable.

## Five frozen exact direct targets

- **CLM0096 — VERIFIED** via `clm0096_exact` (S042); no changes.
- **CLM0102 — VERIFIED** via `clm0102_exact` (S030); no changes.
- **CLM0099 — OPEN.** Need (a) universal supported straight-chord outerplanar cap `H.card≤2*S.card−3`; (b) two genuine hull-side neighbours per strictly convex vertex; (c) actual chronological final-vertex saturated sides and exact ranked pair identification, not an arbitrary peel. Conditional S044 induction is not a direct theorem.
- **CLM0107 — OPEN.** The **strict cutoff is now proved**. Need a certified cyclic parameter lift of **any** ellipse Finset with distinct sites, positive gaps and full turn, plus actual skip squared chords, neighbour strictness, and complete forward-short/central closed-band/backward-short competitor floors to prove every n≥5 set has a `metricEar`. S042 four-tail induction can then prove `clm0107_exact` from existing direct `clm0096_exact` without requiring CLM0099.
- **CLM0108 — OPEN.** Original `clm0108_of_clm0107` yields it only after a direct `clm0107_exact`.

**Net direct target count: 2/5.** The fifth substantive new result is genuine conditional geometrical integration; none of this justifies claiming all-n Lean completion.
