# S035 formalisation progress (frozen S020)

## Source proof contributions

`ETSHTS/EligibleSkip.lean` is a single new proof module containing six Lean proof terms:

1. `s035_eligible_exists_from_average`: if cyclic two-gap spans sum to 4π, n≥5, and 4π/5<cutoff, an eligible index exists. Uses S033 arithmetic mean, NOT the failed angular-gap ear inference.
2. `s035_eligible_metric_min_exists`: chooses the least **squared Euclidean metric skip chord among eligible indices**, not least angular span. This depends on a nonempty eligible set, and the ranking by squared distance is the actual metric ranking on nonnegative distances.
3. `s035_eligible_skip_exceeds_both_neighbours`: strict directed short-arc chord extension supplies both shorter incident chords under the real-lift eligibility cutoff.
4. `s035_forward_short_arc_competitor`: metric minimum + verified directed extension makes a forward short-arc competitor strictly farther than the selected floor.
5. `s035_backward_short_arc_competitor`: corresponding independent backward extension on a real lift, including wraparound representation.
6. `s035_metric_ear_of_skip_chord_floor`: strict incident edge upper bounds plus universal nonneighbor lower bound yield the **exact** tie-safe `metricEar` definition.

All are exact subimplications of the original S020 argument, with transparent hypotheses. Source is not kernel certification until S035 hosted CI succeeds. This session did not complete the four-site geometric case, all-cardinality parameterisation, central floor, full recursive ear iff or any new exact target. `Targets.lean` was not edited.

## Original proof DAG remaining

- **CLM0096:** three-site slice already certified. `ETSHTS/FourPoint.lean` and `ETSHTS/ThreePredecessors.lean` supply only conditional planarity wrappers. Missing: interior-fourth-site geometry, convex diagonal crossing, farthest-from-intersection inequality and five-edge plane case. Prove all general-position four-site configurations.
- **CLM0099:** absent exact outerplanar 2n-3 saturation, hull-side necessity, last-ear extraction and complete reverse-reconstruction proof; `FullEarCertificate` is already defined in `ETSHTS/Definitions.lean`.
- **CLM0102:** `clm0102_exact` inherited kernel-verified (both derivatives + both-endpoint strict extension), preserve unchanged.
- **CLM0107:** must establish cyclic strictly ordered ellipse parametrisation, `∑s_i=4π`, closed-ratio strict eligibility threshold `4π/5<lambda`, connect actual index geometry to S035 abstract selection, central chord lower bound and witness upper bound, all near-cutoff and wrap boundaries, strict metric-ear certificate at each recursive deletion, then apply CLM0096 and CLM0099.
- **CLM0108:** exact ratio inequality `ellipse_ratio_101_le_R` and conditional reduction `clm0108_of_clm0107` are kernel-verified; exact corollary awaits CLM0107.

## Mathematical-defect classification

No logical defect in the frozen S020 mechanism was demonstrated in S035. Unfinished Lean engineering and geometric interfaces are **not** counterexamples. The S033–S034 alternative-selector counterexamples remain irrelevant to the specified original selection.
