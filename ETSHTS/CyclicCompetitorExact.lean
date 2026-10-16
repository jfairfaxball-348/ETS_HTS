import ETSHTS.CyclicCompetitorReverseBand

/-!
# S049 — all actual original competitors and the direct all-n theorem

Three-band partition of the genuine original forward phase lift.  Every
non-neighbour is tested against the same minimum ORIGINAL Euclidean
squared skip, then the unchanged metricEar and all-cardinality Grow
definitions are invoked.  No spacing, genericity or altered tie rule.
-/

noncomputable section
namespace ETSHTS

/-- Exact C3: ALL non-neighbour original Fin-indexed competitors are no
closer than the selected eligible original Euclidean squared skip. -/
theorem s049_every_indexed_non_neighbour_floor {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R) (hn : 4 ≤ n)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ t : Fin (n + 1), 0 ≤ θ t ∧ θ t < 2 * Real.pi)
    (i k : Fin (n + 1))
    (hmin : ∀ t : Fin (n + 1),
      s046_cyclic_gap θ t +
        s046_cyclic_gap θ ((finRotate (n + 1)) t) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ t)
    (hcentre : k ≠ (finRotate (n + 1)) i)
    (hleft : k ≠ i)
    (hright : k ≠ (finRotate (n + 1))
      ((finRotate (n + 1)) i)) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
        (ellipsePoint a b (θ k)) := by
  let δ : ℝ :=
    s048_forward_competitor_lift θ ((finRotate (n + 1)) i) k -
      θ ((finRotate (n + 1)) i)
  by_cases hf : δ < lambda a b
  · exact s049_forward_band_actual_competitor
      a b hb hab hn θ hphase i k hmin hcentre hleft hright hf
  · by_cases hbwd : 2 * Real.pi - lambda a b < δ
    · exact s049_backward_band_actual_competitor
        a b hb hab hn θ hphase i k hmin hcentre hleft hright hbwd
    · have hlower : lambda a b ≤ δ := le_of_not_gt hf
      have hupper : δ ≤ 2 * Real.pi - lambda a b := le_of_not_gt hbwd
      exact s049_middle_band_actual_competitor
        a b hb hab hr hn θ hphase i k hmin hlower hupper

/-- Actual uniform original metric ear for every finite ellipse set of
size at least five, at the original CLOSED aspect threshold R. -/
theorem s049_original_ellipse_ge5_metricEar
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R)
    (S : Finset Point) (h5 : 5 ≤ S.card)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ v : Point, metricEar S v := by
  obtain ⟨n, θ, i, hcard, hphase, himage,
    heligible, hmin, hbridge⟩ :=
    s047_actual_sites_min_skip_cyclic_neighbours
      a b hb hab hr S h5 hboundary
  have hn : 4 ≤ n := by omega
  let c : Fin (n + 1) := (finRotate (n + 1)) i
  let v : Point := ellipsePoint a b (θ c)
  let u : Point := ellipsePoint a b (θ i)
  let w : Point := ellipsePoint a b (θ ((finRotate (n + 1)) c))
  change cyclicNeighbours S v u w ∧ u ∈ S.erase v ∧
    w ∈ S.erase v ∧
    sqDist v u < s046_squared_skip_chord a b θ i ∧
    sqDist v w < s046_squared_skip_chord a b θ i at hbridge
  obtain ⟨hcyclic, hu, hw, huL, hwL⟩ := hbridge
  have hv : v ∈ S := hcyclic.2.1.1
  have hfloor :
      ∀ x ∈ S.erase v, x ≠ u → x ≠ w →
        s046_squared_skip_chord a b θ i ≤ sqDist v x := by
    intro x hx hxu hxw
    have hxS : x ∈ S := Finset.mem_of_mem_erase hx
    obtain ⟨k, hk, _⟩ :=
      s048_original_site_unique_index a b S hcard θ himage x hxS
    have hxc : x ≠ v := (Finset.mem_erase.mp hx).1
    have hc : k ≠ c := by
      intro heq
      apply hxc
      rw [← hk, heq]
    have hi : k ≠ i := by
      intro heq
      apply hxu
      rw [← hk, heq]
    have hwidx : k ≠ (finRotate (n + 1)) c := by
      intro heq
      apply hxw
      rw [← hk, heq]
    have hkfloor := s049_every_indexed_non_neighbour_floor
      a b hb hab hr hn θ hphase i k hmin hc hi hwidx
    change s046_squared_skip_chord a b θ i ≤
        sqDist (ellipsePoint a b (θ c)) (ellipsePoint a b (θ k))
      at hkfloor
    rw [← hk]
    exact hkfloor
  exact ⟨v, s035_metric_ear_of_skip_chord_floor
    (s046_squared_skip_chord a b θ i)
    hv hcyclic hu hw huL hwL hfloor⟩

/-- LITERAL unchanged all-cardinality closed-threshold ellipse theorem.
The finite original metric ear closes through the already kernel-proved
CLM0096 four-point tail and exact original Grow insertion. -/
theorem clm0107_exact : CLM0107 :=
  s042_clm0107_of_clm0096_and_ge5_ears clm0096_exact
    (by
      intro a b hb hab hr S h5 hboundary
      exact s049_original_ellipse_ge5_metricEar
        a b hb hab hr S h5 hboundary)

end ETSHTS
