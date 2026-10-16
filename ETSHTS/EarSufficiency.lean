module
public import ETSHTS.HullInsertion

@[expose] public section


/-!
# S042: exact reverse-ear insertion and the sufficiency half of CLM0099

This is the unchanged Grow/planeEdges/FullEarCertificate system.
The final graph retains every previous edge. The selected inserted pair is
exactly the Cartesian-tie-ranked nearest pair because metricEar supplies
the original exactlyTwoNearest premise. Planarity follows from the
unconditional hull-side shield, not from an assumed planar extension.
-/

noncomputable section
namespace ETSHTS

/-- Append a genuine exact-nearest insertion to a previously valid Grow
history without deleting any earlier edge. -/
theorem s042_grow_append_last
    {previous : List Point} {G : Finset Edge}
    {rest : List Point} {final : Finset Edge}
    (hg : Grow previous G rest final) (v u w : Point)
    (hnear : exactlyTwoNearest (previous ++ rest).toFinset v u w) :
    Grow previous G (rest ++ [v]) (final ∪ {edge v u, edge v w}) := by
  suffices haux :
      ∀ (pr : List Point) (H : Finset Edge)
        (xs : List Point) (F : Finset Edge),
        Grow pr H xs F →
          ∀ (v u w : Point),
            exactlyTwoNearest (pr ++ xs).toFinset v u w →
            Grow pr H (xs ++ [v]) (F ∪ {edge v u, edge v w}) from
      haux previous G rest final hg v u w hnear
  intro pr H xs F h
  induction h with
  | finish pr H =>
      intro v u w hn
      have hn' : exactlyTwoNearest pr.toFinset v u w := by
        simpa using hn
      simpa using (Grow.insert pr H v u w [] (H ∪ {edge v u, edge v w})
        hn' (Grow.finish (pr ++ [v]) (H ∪ {edge v u, edge v w})))
  | insert pr H x a b xs F hn hrest ih =>
      intro v u w hv
      have hv' : exactlyTwoNearest ((pr ++ [x]) ++ xs).toFinset v u w := by
        simpa [List.append_assoc] using hv
      exact Grow.insert pr H x a b (xs ++ [v])
        (F ∪ {edge v u, edge v w}) hn (ih v u w hv')

/-- A certified original metric ear can be appended to an arbitrary valid
planar order of the remaining sites; the new two sides are hull sides and
the old graph is retained without crossings. -/
theorem s042_planeOrder_extend_metricEar
    {S : Finset Point} {v : Point}
    (hprevious : planeNearestTwoOrder (S.erase v))
    (hno : noThreeCollinear S) (hear : metricEar S v) :
    planeNearestTwoOrder S := by
  obtain ⟨p, q, r, rest, final, hpq, hpr, hqr,
    hnodup, hcover, hg, hplane⟩ := hprevious
  obtain ⟨hv, u, w, hcyclic, hnearest⟩ := hear
  have hnot : v ∉ ([p, q, r] ++ rest) := by
    intro h
    have hvrest : v ∈ S.erase v := by
      rw [← hcover]
      simpa using h
    exact (by simp : v ∉ S.erase v) hvrest
  have hnodup' : ([p, q, r] ++ (rest ++ [v])).Nodup := by
    have hn : (([p, q, r] ++ rest) ++ [v]).Nodup := by
      apply (List.nodup_append).2
      refine ⟨hnodup, by simp, ?_⟩
      intro x hx y hy hxy
      have hy' : y = v := by simpa using hy
      exact hnot (by simpa [hxy, hy'] using hx)
    simpa [List.append_assoc] using hn
  have hcover' : ([p, q, r] ++ (rest ++ [v])).toFinset = S := by
    calc
      ([p, q, r] ++ (rest ++ [v])).toFinset =
          insert v (([p, q, r] ++ rest).toFinset) := by
            ext x
            simp [List.mem_append, or_left_comm, or_assoc]
      _ = insert v (S.erase v) := by rw [hcover]
      _ = S := Finset.insert_erase hv
  have hnear' : exactlyTwoNearest ([p, q, r] ++ rest).toFinset v u w := by
    rw [hcover]
    exact hnearest
  have hsuppOld : ∀ e ∈ final, e ⊆ ([p, q, r] ++ rest).toFinset :=
    (s040_grow_support_and_exact_count hg hnodup
      (s041_triangleEdges_supported p q r)).1
  have hsupp : ∀ e ∈ final, e ⊆ S := by
    intro e he x hx
    have hx' : x ∈ S.erase v := by
      rw [← hcover]
      exact hsuppOld e he hx
    exact Finset.mem_of_mem_erase hx'
  have hplane' : planeEdges (final ∪ {edge v u, edge v w}) :=
    s042_planeEdges_insert_both_hullSides hno hplane hsupp
      hcyclic.2.1 hcyclic.2.2.1
  exact ⟨p, q, r, rest ++ [v], final ∪ {edge v u, edge v w},
    hpq, hpr, hqr, hnodup', hcover',
    s042_grow_append_last hg v u w hnear', hplane'⟩

/-- Entire one direction of the original global CLM0099 equivalence.
No recursive planarity oracle: induction follows the actual ear certificate
to size three, and each reverse step proves planarity from strict convexity. -/
theorem s042_fullEarCertificate_implies_planeNearestTwoOrder
    {S : Finset Point} (hconv : strictConvexPosition S)
    (hcert : FullEarCertificate S) : planeNearestTwoOrder S := by
  suffices h : ∀ T : Finset Point, FullEarCertificate T →
      strictConvexPosition T → planeNearestTwoOrder T from
    h S hcert hconv
  intro T ht
  induction ht with
  | base T hcard =>
      intro _
      exact clm0096_card_three T hcard
  | remove T v hcard hv hear hrec ih =>
      intro hT
      exact s042_planeOrder_extend_metricEar
        (ih (s041_strictConvexPosition_erase hT v))
        (s041_strictConvexPosition_noThreeCollinear T hT)
        hear

end ETSHTS
