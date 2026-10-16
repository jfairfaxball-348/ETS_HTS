# S051 PROOF_COVERAGE — eight root-axiom audited bridges

Original `ETSHTS/GenuineEdges.lean` proves: `s051_triangleEdges_genuine`, `s051_grow_edges_genuine` (original duplicate-free ranked compulsory Grow genuinely two-endpoint), `s051_planeNearestTwoOrder_edges_genuine` (supported and actual 2n−3 final count), `s051_insert_hullSide_edges_genuine`, `s051_hullSide_present_of_genuine_cap`, `s051_order_saturates_all_hullSides_of_genuine_cap`.

`ETSHTS/ActualLastNecessity.lean` proves: `s051_actual_last_metricEar_of_saturation`, `s051_actual_history_saturates_of_genuine_cap`, `s051_order_has_actual_last_metricEar_of_cap`, `s051_clm0099_of_genuine_outerplanar_cap_and_two_sides`. This last is a kernel-proved CONDITIONAL original CLM0099 iff using real chronological last `Grow`, original strict convexity and S042 sufficiency, not an arbitrary removable-v assertion.

**Not yet proved — exactly two original geometric inputs to `s051_clm0099_of_genuine_outerplanar_cap_and_two_sides`:**
```lean
-- A: TRUE restricted convex outerplanar cap
∀ T : Finset Point, 4 ≤ T.card → strictConvexPosition T →
  ∀ H : Finset Edge, planeEdges H →
    (∀ e ∈ H, e ⊆ T) →
    (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
    H.card ≤ 2 * T.card - 3

-- B: two distinct genuine supporting neighbours per convex vertex
∀ T : Finset Point, 4 ≤ T.card → strictConvexPosition T →
  ∀ v ∈ T, ∃ x y : Point, x ≠ y ∧
    hullSide T v x ∧ hullSide T v y
```

Once A and B are proved, `theorem clm0099_exact : CLM0099 := s051_clm0099_of_genuine_outerplanar_cap_and_two_sides proofA proofB`. That theorem is **NOT** present now. Original 4/5 direct claims remain.

Hosted [S051 Lean source run 38882163342](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38882163342) SUCCESS. Eight root `#print axioms` new S051 declarations each exactly `[propext, Classical.choice, Quot.sound]`. Full project source-hole and custom-axiom guard PASS. No changes to original frozen blobs. Earlier independent code root [38881832365](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38881832365) SUCCESS.
