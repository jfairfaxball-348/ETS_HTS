# S043 — theorem-by-theorem proof coverage

## Independent compiler evidence

At authored Lean code commit `926660e9adb5156ca8a8e619a1e30611b99e800c`, [PR Lean run 38745083059](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38745083059) reports SUCCESS with pinned Lean 4.15.0, full mathlib build, root `lake env lean ETSHTS.lean` and a no-proof-hole/axiom-token scan; [PR governance 38745083093](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38745083093) reports SUCCESS. The nine new printed axiom lines are individually **exactly** `[propext, Classical.choice, Quot.sound]`. Old direct CLM0096/0102 keep their original printed dependencies. No local Lean/lake was run (NOT_RUN); hosted GitHub Actions provide the independent certification.

## New certified Lean declarations (nine)

**`ETSHTS/LastArrival.lean`**:
- `s043_grow_extract_last` — peel a *genuine* last step from original `Grow`, exposing prefix `Grow`, compulsory exact nearest-two ranking and retained edges.
- `s043_grow_last_prefix_planar` — peel a genuinely planar history, retaining independent planarity of prefix.
- `s043_grow_last_incident_edges` — under actual nodup history and initial endpoint support, every final edge incident to last arrival is one of its two mandatory edges.

**`ETSHTS/LastOrder.lean`**:
- `s043_order_peel_explicit_last` — recover true planar original order and exact ranked pair after explicit final deletion.
- `s043_nonempty_list_has_last` — valid decomposition of any nonempty arrival tail.
- `s043_planeOrder_has_last_ranked_predecessors` — every actual `planeNearestTwoOrder S` with |S|≥4 admits last arrival v∈S with `planeNearestTwoOrder (S.erase v)` and `exactlyTwoNearest (S.erase v) v u w`. **This does NOT assert cyclicNeighbours or metricEar**, which need geometric hull-side forcing.

**`ETSHTS/RatioWindow.lean`**:
- `s043_R_lt_11_div_10` — strict exact bound on the **unchanged original** R from proved trigonometric identities.
- `s043_closed_ratio_strict_aspect_bound` — a/b≤R and b>0 imply a<11b/10.
- `s043_closed_ratio_minor_axis_floor` — b/a>10/11 on entire closed original aspect interval.

## Open exact direct targets

| Target | Verdict after S043 | Exact mathematical/Lean obstruction |
| --- | --- | --- |
| CLM0096 | VERIFIED (S042) | None; unchanged four-site exact classification |
| CLM0102 | VERIFIED (S030) | None; unchanged strict real-lift outward chords |
| CLM0099 | **OPEN** (S042 sufficiency, S043 true last-order peeling proved) | Universal supported planar outerplanar cap `|H|≤2|S|−3`; hull-sides saturated; prove exactly two supporting hull neighbours for any vertex and identify last compulsory pair as them, then induct on actual deleted order |
| CLM0107 | **OPEN** | Arbitrary ellipse Finset positive cyclic angular lift and gaps; `4π/5<lambda` at R; instantiate true skip squared-distance minimiser; strict neighbours and forward-short/central-closed/backward-short all competitors; uniform ≥5 `metricEar` existence |
| CLM0108 | **OPEN** | Direct corollary only after CLM0107 |

The S043 bound `R<11/10` is an additional compiled analytic fact; it **does not itself prove** `4π/5<lambda`, nor the uniform ear existence. `s043_planeOrder_has_last_ranked_predecessors` is genuinely unconditional, but **does not prove** CLM0099 necessity without outerplanar hull-side forcing.

## Integrity

`Targets.lean` original blob SHA `e12f117589b1852e06aa669a405a6dc3ee652549` unchanged; `Definitions.lean` SHA `f5e71b625bdbf40f6c84551dd93f9ce375154519` unchanged. Original `Grow`, `planeEdges`, `metricEar`, `lambda` and closed `R` untouched. No assumed new certificate, imported unproved lemma, proof holes, modified metric or custom axioms. New files imported from root and printed there. Documentation commit and final PR and merged-main checks must be checked separately before claiming full integration.
