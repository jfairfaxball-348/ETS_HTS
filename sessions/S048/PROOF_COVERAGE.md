# S048 proof coverage — quantitative C3 and exact real-lift interfaces

## Newly authored source, all unchanged original metric/targets

- `ETSHTS/QuantitativeSkip.lean`: `s048_unit_circle_chord_sq`, `s048_short_span_chord_sq_le`, `s048_small_eligible_span`, `s048_selected_skip_chord_sq_upper`, `s048_selected_skip_below_closed_floor_sq`. This discharges **A2** fully: actual 4π/5 eligible cyclic averaging witness and **squared Euclidean** selected skip bounded by the S020 threshold and S036 closed-ratio squared central floor, including equality.
- `ETSHTS/CentralChordBand.lean`: `s048_middle_band_sine_lower`, `s048_lambda_mem_zero_pi`, `s048_central_actual_sqDist_sin_lower`. Correct two-half sine comparison on **closed** λ≤δ≤2π−λ, including δ=π and both inclusive endpoints.
- `ETSHTS/CentralCutoffIdentity.lean`: `s048_sin_two_arctan_rational`, `s048_exact_lambda_sine_length`, `s048_central_actual_sqDist_closed_floor`, `s048_selected_skip_le_central_actual_competitor`. True analytic **A3** actual selected metric minimum versus every central Euclidean ellipse chord; no circular replacement.
- `ETSHTS/CentralOriginalSites.lean`: `s048_original_sites_selected_central_band`. Attaches original C1/C2 and selected C3 central proof to every original arbitrary S≥5; central cases expressed on actual site-preserving lifted real phases, not yet every x.
- `ETSHTS/ShortArcLifts.lean`: `s048_forward_actual_two_successor_floor`, `s048_backward_actual_two_predecessor_floor`, including equality with original second neighbour and strict extension only beyond it. These close the **analytic** A4 rules assuming genuine original real-lift order; indexing/case assignment still required.
- `ETSHTS/CompetitorPhaseIndex.lean`: `s048_original_site_unique_index`, `s048_forward_competitor_lift_site`, `s048_forward_lift_strict_turn`, `s048_original_competitor_index_and_lift`. **A1 partially**: every original site x has its unique original Fin phase; every non-centre x has a site-preserving real forward lift 0<δ<2π across the wrap, without separation hypothesis.

## Exact remaining obligations — do not conflate interfaces with global completion

**A1 unfinished:** prove for each original x≠the two actual cyclic neighbours exactly how its Fin index and phase lift lie at/beyond the correct original two-successor and two-predecessor skip endpoints; include each wrap index and exclude the centre, including the first and last cyclic neighbour. This is *finite index/cyclic ordering*, not a new analytic estimate.

**A3 closure for every x:** instantiate the now-proved central comparison with that same unique original indexed and lifted x when λ≤δ≤2π−λ.

**A4 closure for every x:** under δ<λ show original indexed x lies at/beyond the actual second forward successor and the witness skip is eligible; under δ>2π−λ make the exact backwards lift and select the original predecessor skip. Existing ShortArcLifts theorems already prove both metric inequalities once the genuine index order is supplied.

**A5 still OPEN:** assemble all original x∈S.erase v, x≠u,w into one universally quantified skip floor, derive unconditional original `metricEar` using `s035_metric_ear_of_skip_chord_floor`, then `s042_clm0107_of_clm0096_and_ge5_ears clm0096_exact` and root `theorem clm0107_exact : CLM0107`.

Direct headline scoreboard is **unchanged 2/5**. CLM0107 OPEN, CLM0108/CLM0099 deferred. No altered S020 theorem, ratio or target, no separate novelty audit, no paper/Palomar.

CI: successful interim root-import runs `38812003518`, `38812176647`, `38812404893`, and `38812633065` establish the quantitative, central and lifted short-direction interfaces with only `[propext, Classical.choice, Quot.sound]`. Final unique-index module and final PR-head/merged-main results must be separately checked, not presumed.
