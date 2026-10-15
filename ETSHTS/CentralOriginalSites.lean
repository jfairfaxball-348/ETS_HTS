import ETSHTS.CentralCutoffIdentity

/-!
# S048 — attach the C3 central band to arbitrary original finite sites

There are no additional spacing assumptions, changed angular enumerations
or metric proxies. The C3 short-direction comparisons remain separate.
-/

noncomputable section
namespace ETSHTS

/-- Given ANY original ellipse boundary site set of at least five points at
the original closed aspect bound, a chosen actual metric-minimal skip
provides two true strict hull neighbours AND dominates all real-lift
central-band competitors in original squared Euclidean distance.
The open A1/A4 job is to show which actual non-neighbours lie in this
closed band, and to handle the remaining two short bands. -/
theorem s048_original_sites_selected_central_band
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R)
    (S : Finset Point) (h5 : 5 ≤ S.card)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ (n : ℕ) (θ : Fin (n + 1) ↪o ℝ) (i : Fin (n + 1)),
      S.card = n + 1 ∧
      (∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi) ∧
      ((Finset.univ : Finset (Fin (n + 1))).image
        (fun k => ellipsePoint a b (θ k)) = S) ∧
      (let v := ellipsePoint a b (θ ((finRotate (n + 1)) i))
       let u := ellipsePoint a b (θ i)
       let w := ellipsePoint a b
         (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i)))
       cyclicNeighbours S v u w ∧ u ∈ S.erase v ∧
         w ∈ S.erase v ∧
         sqDist v u < s046_squared_skip_chord a b θ i ∧
         sqDist v w < s046_squared_skip_chord a b θ i ∧
         (∀ φ : ℝ,
           lambda a b ≤ φ - θ ((finRotate (n + 1)) i) →
           φ - θ ((finRotate (n + 1)) i) ≤
             2 * Real.pi - lambda a b →
           s046_squared_skip_chord a b θ i ≤
             sqDist v (ellipsePoint a b φ))) := by
  obtain ⟨n, θ, i, hcard, hphase, himage, _, hmin, hbridge⟩ :=
    s047_actual_sites_min_skip_cyclic_neighbours
      a b hb hab hr S h5 hboundary
  have hn : 5 ≤ n + 1 := by omega
  refine ⟨n, θ, i, hcard, hphase, himage, ?_⟩
  dsimp at hbridge ⊢
  obtain ⟨hcyclic, hu, hw, huL, hwL⟩ := hbridge
  refine ⟨hcyclic, hu, hw, huL, hwL, ?_⟩
  intro φ hlow hup
  exact s048_selected_skip_le_central_actual_competitor
    a b (θ ((finRotate (n + 1)) i)) φ hb hab hr
    hn θ hphase i hmin hlow hup

end ETSHTS
