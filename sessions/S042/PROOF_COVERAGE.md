# S042 — precise proof coverage and missing claims

## Independent verified compiler evidence

The S042 branch `dfc74d43a156fdaa36f21ba913153a5efbe2b2c9` passed [Lean PR CI 38729502266](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38729502266) and [governance PR CI 38729502281](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38729502281). Root `ETSHTS.lean` imports the actual definitions and prints kernel dependencies. The original `CLM0102` had already passed earlier independent CI; it is unchanged.

Verified S042 through the cited commit:

- `CyclicFinite.lean`: `s042_sum_permuted_gap`, `s042_two_gap_sum`, `s042_two_gap_sum_full_turn`, `s042_eligible_metric_min_from_full_turn`. The last theorem genuinely minimises Euclidean squared skip lengths among eligible finite indices, **given** an actual finite cyclic successor and full-turn gaps; it does NOT construct a cyclic parameterisation of an arbitrary ellipse boundary Finset.
- `HullShield.lean`: orientation affineness and vanishing on open segments; strict same-side exclusion of `properCross`; and `s042_hullSide_safe_against_disjoint_chord` for all supported hull edges, given original noThreeCollinear.
- `HullInsertion.lean`: endpoint orientation and `hullSide` transport; `s042_planeEdges_insert_hullSide`, `s042_planeEdges_insert_both_hullSides`, both on original `planeEdges` and all previously retained edges.
- `EarSufficiency.lean`: `s042_grow_append_last`, `s042_planeOrder_extend_metricEar`, `s042_fullEarCertificate_implies_planeNearestTwoOrder`. **This certifies the original CLM0099 SUFFICIENCY direction**, for a strictly convex site set; necessity remains OPEN.
- `FourTailBridge.lean`: `s042_planeOrder_of_four_tail_and_ge5_ears`; conditional direct `s042_clm0107_of_clm0096_and_ge5_ears` and `s042_clm0108_of_clm0096_and_ge5_ears`. Crucially does NOT demand an at-cardinality-four metric ear. Both named headline reductions require the STILL OPEN CLM0096 and uniform metric-ear inputs.
- `HullSaturation.lean`: `s042_hullSide_present_of_planar_cap`, `s042_order_saturates_all_hullSides_of_cap`. This isolates the universal supported planar graph upper bound (2n−3) still missing for CLM0099 necessity. It does **not** assert that bound without proof.
- `TriangleInterior.lean`: barycentric signed orientation and all three interior spokes avoiding their respective opposite triangle side for positive coefficients. Valid geometric progress toward the interior case of CLM0096.

`TriangleInteriorOrder.lean` and `TriangleInteriorExact.lean` are an additional attempt to compile the complete six-edge interior wheel and a four-site exact compulsory insertion with lex ties. Their final CI is to be checked after this document's initial drafting. Until independently green, label only SOURCE_PENDING_CI; if necessary repair or remove failing source before the merge. Do not count those claims as verified here.

## Unmodified exact target status

| Name | Final status at this archive's initial drafting | Exact remaining obstruction |
| --- | --- | --- |
| CLM0096 | OPEN | Complete all-four classification: convex quadrilateral case and all exact lex tie cases; strict interior case needs final six-edge wheel proof/CI and general finite S case split |
| CLM0099 | OPEN, SUFFICIENCY VERIFIED | Necessity needs every missing hull side saturated by an independent planar outerplanar cap, then force last inserted vertex to have its two cyclic neighbours as exact nearest pair, recurse on original Grow graph |
| CLM0102 | VERIFIED | None; keep exact declaration unchanged |
| CLM0107 | OPEN | Construct indexed cyclic ellipse angles/gaps from arbitrary Finset; prove `4π/5<lambda`, eligible skip metric floor and all forward/central/backward competitor inequalities for size≥5, including closed ratio equality; apply exact S042 four-tail using completed CLM0096 |
| CLM0108 | OPEN | Follows once CLM0107 is proved, since exact 101/100 ≤ R bound and reduction are already kernel certified |

## Scope and validation

Targets and Definitions were not edited. Hosted Lean 4.15.0 with pinned mathlib, original root axiom audit and forbidden-token scan used. Early CI failures came from proof elaboration, Finset case splits, and an explanatory comment matching a forbidden scanner token; explicit repair commits preserved. Python scaffold, seven local tests, local Lean/lake, and direct local Git/GitHub DNS were NOT_RUN; CI provides its own independent governance. PR #51 is non-draft and normal merge is required after newest Lean and governance are BOTH SUCCESS; merged-main workflow evidence must be checked separately. No Palomar/paper/journal/outreach.
