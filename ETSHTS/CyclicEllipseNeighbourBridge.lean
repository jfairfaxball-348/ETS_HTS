import ETSHTS.CyclicEllipseHullSides

/-!
# S047 — original cyclicNeighbours and incident metric gap for eligible skip

This closes the true-neighbourhood and both strict-incident inequalities
for the actual original finite ellipse site set with arbitrary cardinality
at least five, including wrap and near-antipodal configurations. The
remaining three-band competitor floor and global CLM0107 remain open.
-/

noncomputable section
namespace ETSHTS

/-- Each original phase-indexed cyclic successor edge is a genuine
original supporting hull side, including the final-to-first wrap. -/
theorem s047_original_cyclic_hullSide {n : ℕ}
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) = S)
    (hn : 1 ≤ n) (i : Fin (n + 1)) :
    hullSide S (ellipsePoint a b (θ i))
      (ellipsePoint a b (θ ((finRotate (n + 1)) i))) := by
  by_cases hi : i = Fin.last n
  · subst i
    simpa only [finRotate_last] using
      (s047_original_wrap_hullSide a b ha hb S hcard θ
        hphase himage hn)
  · have hlt : i.val < n := by
      have hbound := i.isLt
      have hneq : i.val ≠ n := by
        intro eq
        apply hi
        apply Fin.ext
        exact eq
      omega
    have hrot : (finRotate (n + 1)) i =
        ⟨i.val + 1, by omega⟩ := by
      simpa using (finRotate_of_lt hlt)
    rw [hrot]
    exact s047_original_consecutive_hullSide a b ha hb
      S hcard θ hphase himage i hlt

/-- Exact C1+C2 bridge: the FIRST successor of every eligible skip
is a true original cyclic-neighbour centre, both hull neighbours belong
to the original predecessor set, and both of their original Euclidean
squared distances are strictly below the eligible skip chord.
No global metricEar is asserted: non-neighbour comparisons are C3. -/
theorem s047_eligible_true_neighbours_and_strict_incidents {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) = S)
    (hn : 4 ≤ n) (i : Fin (n + 1))
    (heligible : s046_cyclic_gap θ i +
      s046_cyclic_gap θ ((finRotate (n + 1)) i) < lambda a b) :
    let v := ellipsePoint a b (θ ((finRotate (n + 1)) i))
    let u := ellipsePoint a b (θ i)
    let w := ellipsePoint a b
      (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i)))
    cyclicNeighbours S v u w ∧ u ∈ S.erase v ∧ w ∈ S.erase v ∧
      sqDist v u < s046_squared_skip_chord a b θ i ∧
      sqDist v w < s046_squared_skip_chord a b θ i := by
  dsimp
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hboundary : ∀ p ∈ S, ellipseBoundary a b p := by
    intro p hp
    rw [← himage] at hp
    obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hp
    exact ⟨θ k, rfl⟩
  have hno : noThreeCollinear S :=
    s041_ellipse_noThreeCollinear a b ha hb S hboundary
  have hsideL :
      hullSide S
        (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
        (ellipsePoint a b (θ i)) :=
    s042_hullSide_swap
      (s047_original_cyclic_hullSide a b ha hb S hcard θ
        hphase himage (by omega) i)
  have hsideR :
      hullSide S
        (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
        (ellipsePoint a b
          (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i)))) :=
    s047_original_cyclic_hullSide a b ha hb S hcard θ
      hphase himage (by omega) ((finRotate (n + 1)) i)
  have hmetric := s047_eligible_cyclic_incident_lt_skip
    a b hb hab θ hphase i heligible
  have hne : ellipsePoint a b (θ i) ≠
      ellipsePoint a b
        (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i))) := by
    intro he
    have hz : s046_squared_skip_chord a b θ i = 0 := by
      unfold s046_squared_skip_chord
      rw [← he]
      exact sqDist_self _
    have hm := hmetric.1
    rw [hz] at hm
    exact (not_lt_of_ge (sqDist_nonneg _ _)) hm
  have hcyclic :=
    s047_cyclicNeighbours_of_two_hullSides hno hsideL hsideR hne
  exact ⟨hcyclic, s047_hullSide_second_mem_erase hsideL,
    s047_hullSide_second_mem_erase hsideR, hmetric.1, hmetric.2⟩


/-- Uniform original-site C1+C2 candidate: the actual minimum metric
skip chosen from every finite ellipse site set of size at least five has
two genuine original hull neighbours, both strictly closer than its
original Euclidean skip chord. The C3 comparison against all other
original sites is still required to conclude metricEar. -/
theorem s047_actual_sites_min_skip_cyclic_neighbours
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R)
    (S : Finset Point) (h5 : 5 ≤ S.card)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ (n : ℕ) (θ : Fin (n + 1) ↪o ℝ) (i : Fin (n + 1)),
      S.card = n + 1 ∧
      (∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi) ∧
      ((Finset.univ : Finset (Fin (n + 1))).image
        (fun k => ellipsePoint a b (θ k)) = S) ∧
      (s046_cyclic_gap θ i +
        s046_cyclic_gap θ ((finRotate (n + 1)) i) < lambda a b) ∧
      (∀ j : Fin (n + 1),
        s046_cyclic_gap θ j +
          s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
        s046_squared_skip_chord a b θ i ≤
          s046_squared_skip_chord a b θ j) ∧
      (let v := ellipsePoint a b (θ ((finRotate (n + 1)) i))
       let u := ellipsePoint a b (θ i)
       let w := ellipsePoint a b
         (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i)))
       cyclicNeighbours S v u w ∧ u ∈ S.erase v ∧
         w ∈ S.erase v ∧
         sqDist v u < s046_squared_skip_chord a b θ i ∧
         sqDist v w < s046_squared_skip_chord a b θ i) := by
  obtain ⟨n, θ, hcard, hphase, himage, _, _,
      ⟨i, heligible, hmin⟩⟩ :=
    s046_actual_sites_closed_ratio_skip_min a b hb hab hr
      S h5 hboundary
  have hn : 4 ≤ n := by omega
  refine ⟨n, θ, i, hcard, hphase, himage,
    heligible, hmin, ?_⟩
  exact s047_eligible_true_neighbours_and_strict_incidents
    a b hb hab S hcard θ hphase himage hn i heligible

end ETSHTS
