# S047 proof coverage — actual original ellipse, direct CLM0107 still OPEN

## Original immutable exact headline declarations

- **VERIFIED direct (2/5):** `clm0096_exact : CLM0096` (S042); `clm0102_exact : CLM0102` (S030).
- **OPEN sole active:** `clm0107_exact : CLM0107` does **NOT** exist. Full all-n statement cannot be promoted without proof of original uniform metricEar ≥5 from complete three-band *all original non-neighbour* comparison.
- **OPEN deferred:** `clm0108_exact : CLM0108`, `clm0099_exact : CLM0099`. Neither worked on in S047.

## New genuine Lean declarations

1. `ETSHTS/CyclicEllipseHull.lean`: `s047_orientation_reverse_last`, `s047_hullSide_at_most_two`, `s047_cyclicNeighbours_of_two_hullSides`, `s047_hullSide_second_mem_erase` (unique two original hull sides, no no-three-collinear exception).
2. `ETSHTS/CyclicEllipseIncident.lean`: `s047_ellipsePoint_add_two_pi`, `s047_ellipsePoint_add_if_two_pi`, `s047_mid_lift`, `s047_right_lift`, gap/site lifts, and `s047_eligible_cyclic_incident_lt_skip`: strict original Euclidean squared incident comparisons, true first-successor centre and wrap.
3. `ETSHTS/CyclicEllipseOrientation.lean`: exact original elliptic orientation sine identity, three-sine factor and strict orientation positive for three phases inside one turn.
4. `ETSHTS/CyclicEllipseHullSides.lean`: ordinary and final-wrap consecutive indexed original site chords are true `hullSide S`, not merely assumed neighbouring angles.
5. `ETSHTS/CyclicEllipseNeighbourBridge.lean`: `s047_original_cyclic_hullSide`, `s047_eligible_true_neighbours_and_strict_incidents`, `s047_actual_sites_min_skip_cyclic_neighbours`. Apply the exact closed-R S046 minimal **squared Euclidean** eligible skip to all original arbitrary finite site sets S≥5, yielding an actual original cyclic centre with two true original hull neighbours, their membership in `S.erase v`, both incident squared distances **strictly** less than the same selected skip, and min property among all eligible cyclic skip chords.

## Missing critical proof and honesty gate

**C1 and C2 complete as support theorems, conditional on successful final PR-head and merged-main Lean and governance validation.** C3 is genuinely not complete: the selected candidate still requires `∀ x∈S.erase v, x≠u→x≠w→s046_squared_skip_chord ≤ sqDist v x`, partitioned by the *original angular separation* into forward short, central **closed** including antipodal/equality, and backward short; preserve both central endpoints. The S036 central closed ratio theorem is only algebra on the true length thresholds; prove real angle sine floor and actual minimal skip witness upper with original Euclidean metric, then square valid positive quantities. Thereafter C4 `metricEar` and literal `clm0107_exact` via `s042_clm0107_of_clm0096_and_ge5_ears`. Do not claim direct theorem is proved.

Hosted compiler cycles: initial hull module built; incident module failed missing `Decidable P` then built; orientation sine proof corrected repeated rewrite/half-angle normalisation and built; HullSides Fin index and orientation-zero goals repaired and built; NeighbourBridge built in PR Lean 38796775306. That PR-head run nevertheless failed **repository source-token policy** because the word `admit` appeared innocuously in a comment; changed comment before final codehead. Its Lean axiom prints for all new declarations including `s047_actual_sites_min_skip_cyclic_neighbours` are only `[propext, Classical.choice, Quot.sound]`. Check final CI on final commit and independent merged-main before integration; local Lean NOT_RUN. Original Targets/Definitions hashes unchanged. No `sorry`, intentional `admit`, custom axioms or numerical oracles.
