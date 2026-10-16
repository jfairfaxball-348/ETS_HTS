module
public import ETSHTS.CyclicCompetitorBackwardIndex

@[expose] public section


/-!
# S049 — exact original reverse-short Euclidean competitor bound

No surrogate cyclic list. The original second predecessor is the true
inverse rotation of the left skip endpoint. The backward competitor is
shifted by a turn only in the case where its real lift requires it.
-/

noncomputable section
namespace ETSHTS

/-- Every actual non-neighbour in the reverse short band has Euclidean
squared distance at least the chosen original eligible skip. -/
theorem s049_backward_band_actual_competitor {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hn : 4 ≤ n)
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
      ((finRotate (n + 1)) i))
    (hback : 2 * Real.pi - lambda a b <
      s048_forward_competitor_lift θ ((finRotate (n + 1)) i) k -
        θ ((finRotate (n + 1)) i)) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
        (ellipsePoint a b (θ k)) := by
  let c : Fin (n + 1) := (finRotate (n + 1)) i
  let j : Fin (n + 1) := s049_previous i
  let δ : ℝ := s048_forward_competitor_lift θ c k
  let shift : ℝ := if j < c then 2 * Real.pi else 0
  let φ : ℝ := δ - shift
  have hjrank : s049_forward_rank c j = n - 1 :=
    s049_rank_second_predecessor hn i
  have hkbound : s049_forward_rank c k ≤ n - 1 :=
    (s049_non_neighbour_rank_interval hn i k
      hcentre hleft hright).2
  have hle : s049_forward_rank c k ≤ s049_forward_rank c j := by
    rw [hjrank]
    exact hkbound
  have hlift_le : δ ≤ s048_forward_competitor_lift θ c j := by
    by_cases heq : k = j
    · dsimp [δ]
      rw [heq]
    · have hne : s049_forward_rank c k ≠
          s049_forward_rank c j := by
        intro hh
        exact heq (s049_forward_rank_injective c k j hh)
      have hlt : s049_forward_rank c k <
          s049_forward_rank c j := lt_of_le_of_ne hle hne
      exact le_of_lt (s049_forward_rank_strictMono_lift
        θ hphase c k j hlt)
  have hjne : j ≠ c := by
    intro heq
    have hzero : s049_forward_rank c c = 0 :=
      (s049_forward_rank_eq_zero c c).2 rfl
    rw [heq, hzero] at hjrank
    omega
  have hrot2 : (finRotate (n + 1))
      ((finRotate (n + 1)) j) = c :=
    s049_second_predecessor_reaches_centre i
  have hright0 := s049_right_lift_eq_forward_second
    (by omega : 2 ≤ n) θ j
  rw [hrot2] at hright0
  have hturn : s047_right_lift θ j + shift =
      θ c + 2 * Real.pi := by
    by_cases hjlt : j < c
    · have hnot : ¬ c < j := not_lt_of_ge (le_of_lt hjlt)
      rw [hright0]
      simp only [s048_forward_competitor_lift, if_neg hnot,
        add_zero]
      simp only [shift, if_pos hjlt]
    · have hclt : c < j :=
        lt_of_le_of_ne (le_of_not_gt hjlt) (Ne.symm hjne)
      rw [hright0]
      simp only [s048_forward_competitor_lift, if_pos hclt]
      simp only [shift, if_neg hjlt, add_zero]
  have hliftj : s048_forward_competitor_lift θ c j =
      θ j + shift := rfl
  have hbefore : φ ≤ θ j := by
    rw [hliftj] at hlift_le
    dsimp [φ]
    linarith
  have hshort : s047_right_lift θ j - φ < lambda a b := by
    dsimp [φ, δ] at *
    linarith
  have hsite : ellipsePoint a b φ = ellipsePoint a b (θ k) := by
    have hbase := s048_forward_competitor_lift_site a b θ c k
    by_cases hjlt : j < c
    · have hminus : ellipsePoint a b (δ - 2 * Real.pi) =
          ellipsePoint a b δ := by
        have hplus := s047_ellipsePoint_add_two_pi a b
          (δ - 2 * Real.pi)
        have harg : δ - 2 * Real.pi + 2 * Real.pi = δ := by ring
        rw [harg] at hplus
        exact hplus.symm
      calc
        ellipsePoint a b φ =
            ellipsePoint a b (δ - 2 * Real.pi) := by
              simp [φ, shift, hjlt]
        _ = ellipsePoint a b δ := hminus
        _ = ellipsePoint a b (θ k) := hbase
    · simpa [φ, shift, hjlt, δ] using hbase
  have hcentresite :
      ellipsePoint a b (s047_right_lift θ j) =
        ellipsePoint a b (θ c) := by
    simpa only [hrot2] using (s047_right_lift_site a b θ j)
  have hfloor := s048_backward_actual_two_predecessor_floor
    a b hb hab θ hphase i j hmin φ hbefore hshort
  rw [hcentresite, hsite] at hfloor
  exact hfloor

end ETSHTS
