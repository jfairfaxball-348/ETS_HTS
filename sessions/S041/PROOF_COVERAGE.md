# S041 — proof coverage and exact open obligations

## VERIFIED in branch Lean CI

Branch source through commit `d754b71767266ce6ed588583ecb6797ed9571557` compiled under pinned Lean 4.15.0 in [run 38723468079](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38723468079), SUCCESS, including root `lake env lean ETSHTS.lean` and standard kernel `#print axioms` dependencies `[propext, Classical.choice, Quot.sound]`. The scanner enforces no proof holes. These do not imply any open headline CLM is complete.

- `GlobalCount.lean`: `s041_triangleEdges_card`, `s041_triangleEdges_supported`, `s041_planeNearestTwoOrder_exact_edge_count` (original final 2n−3 supported edges).
- `EarInduction.lean`: `s041_uniform_metricEar_gives_certificate`, `s041_ellipse_full_certificate_of_uniform_ears`, `s041_clm0107_of_clm0099_and_uniform_ears`, `s041_clm0108_of_clm0099_and_uniform_ears` (conditional on both currently missing mathematical inputs).
- `NoThreeCollinear.lean`: `s041_orientation_zero_affine`, `s041_affine_parameter_distinct`, `s041_no_three_exposed_on_affine_line`, `s041_strictConvexPosition_noThreeCollinear`, `s041_ellipse_noThreeCollinear`.
- `HereditaryGeometry.lean`: `s041_strictConvexPosition_of_subset`, `s041_noThreeCollinear_of_subset`, `s041_hullSide_of_subset`, `s041_strictConvexPosition_erase`.

## SOURCE_PENDING_CI as initially archived

- `CertificateCases.lean`: `s041_fullEarCertificate_card_ge_three`, `s041_fullEarCertificate_iff_ear_deletion`, `s041_certificate_four_has_three_site_remainder`. New branch [run 38723741322](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38723741322) was IN_PROGRESS at archive authoring. Confirm its conclusion and PR/main CI separately before saying VERIFIED.

## Exact target status and the next missing implications

| Target | Status | First missing inference |
| --- | --- | --- |
| `CLM0096` | OPEN | The general four-point geometric case split, with a planar mandatory exact-nearest pair for an interior site or a convex quadrilateral, including lex ties |
| `CLM0099` | OPEN | Necessity: edge-count plus hull-side saturation must force last inserted metric ear; recursive deletion on original graphs. Sufficiency: inserting the certified ear's two exact nearest edges without crossing |
| `CLM0102` | VERIFIED | `clm0102_exact` already compiled; keep it unchanged |
| `CLM0107` | OPEN | Uniform exact metric-ear existence from cyclic ellipse geometry at every size ≥5, covering short, central, backward competitor regimes and closed ratio equality, plus CLM0099 and four-site tail |
| `CLM0108` | OPEN | Follows from a genuine proof of CLM0107 via preverified `clm0108_of_clm0107`; the ratio bound is already proved |

The existing `s041_uniform_metricEar_gives_certificate` assumes an ear for every set of cardinality **at least four**. The locked S020 ellipse proof only establishes uniform ears at `k≥5` before using the universal four-point lemma. This **interface mismatch is important**: either prove the card-four ear statement (not automatic from a general insertion order), or write a correct `k≥5` induction that stops at CLM0096 and reverses the remaining ear steps. Do not incorrectly infer card-four metric-ear existence from CLM0096 alone.

## Validation scope

No local Lean/lake toolchain and no GitHub DNS access from local container, so local `lake build`, `lake env lean`, Python scaffold/tests were NOT_RUN. Hosted Lean CI validated dependencies above through `d754b717`; latest `CertificateCases` proof must be checked live. Governance checks run only on pull_request or main: S041 PR and merged-main governance evidence must be gathered independently. No modifications to `ETSHTS/Targets.lean` or `ETSHTS/Definitions.lean`; no new mathematical research, Palomar, arXiv, journal or outreach.
