import ETSHTS.CyclicEllipseHull

/-!
# S047 — strict actual indexed ellipse incident chords

The centre of an eligible i-to-i+2 skip is its FIRST successor, not i.
Explicit real lifts cross the 0/2π seam without perturbing actual sites.
The strict nearest incident metric gap below its squared Euclidean skip
requires no new spacing or aspect assumption.
-/

noncomputable section
namespace ETSHTS

/-- Exactly one full ellipse turn leaves original Cartesian coordinates
unchanged. -/
theorem s047_ellipsePoint_add_two_pi (a b t : ℝ) :
    ellipsePoint a b (t + 2 * Real.pi) = ellipsePoint a b t := by
  simp [ellipsePoint, Real.cos_add_two_pi, Real.sin_add_two_pi]

theorem s047_ellipsePoint_add_if_two_pi (a b t : ℝ) (P : Prop) [Decidable P] :
    ellipsePoint a b (t + (if P then 2 * Real.pi else 0)) =
      ellipsePoint a b t := by
  classical
  split_ifs with h
  · exact s047_ellipsePoint_add_two_pi a b t
  · simp

/-- True real lift of the next indexed site. -/
def s047_mid_lift {n : ℕ} (θ : Fin (n + 1) ↪o ℝ)
    (i : Fin (n + 1)) : ℝ :=
  θ ((finRotate (n + 1)) i) +
    (if i = Fin.last n then 2 * Real.pi else 0)

/-- True real lift of the *second* successor, including the possible
wrap at either one of the two successor steps. -/
def s047_right_lift {n : ℕ} (θ : Fin (n + 1) ↪o ℝ)
    (i : Fin (n + 1)) : ℝ :=
  (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i)) +
    (if i = Fin.last n then 2 * Real.pi else 0)) +
    (if ((finRotate (n + 1)) i) = Fin.last n then
       2 * Real.pi else 0)

theorem s047_mid_lift_gap {n : ℕ} (θ : Fin (n + 1) ↪o ℝ)
    (i : Fin (n + 1)) :
    s047_mid_lift θ i - θ i = s046_cyclic_gap θ i := by
  unfold s047_mid_lift s046_cyclic_gap
  ring

theorem s047_right_lift_gap {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ) (i : Fin (n + 1)) :
    s047_right_lift θ i - s047_mid_lift θ i =
      s046_cyclic_gap θ ((finRotate (n + 1)) i) := by
  unfold s047_right_lift s047_mid_lift s046_cyclic_gap
  ring

theorem s047_mid_lift_site {n : ℕ} (a b : ℝ)
    (θ : Fin (n + 1) ↪o ℝ) (i : Fin (n + 1)) :
    ellipsePoint a b (s047_mid_lift θ i) =
      ellipsePoint a b (θ ((finRotate (n + 1)) i)) := by
  exact s047_ellipsePoint_add_if_two_pi a b
    (θ ((finRotate (n + 1)) i)) (i = Fin.last n)

theorem s047_right_lift_site {n : ℕ} (a b : ℝ)
    (θ : Fin (n + 1) ↪o ℝ) (i : Fin (n + 1)) :
    ellipsePoint a b (s047_right_lift θ i) =
      ellipsePoint a b
        (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i))) := by
  unfold s047_right_lift
  rw [s047_ellipsePoint_add_if_two_pi, s047_ellipsePoint_add_if_two_pi]

/-- Exact C2: when the original two-successor arc is eligible, both
genuine original incident squared Euclidean chords from the correct
successor-centred ear are strictly shorter than the chosen skip chord.
Works across the wrap, for arbitrarily small gaps, and at a/b = R. -/
theorem s047_eligible_cyclic_incident_lt_skip {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (θ : Fin (n + 1) ↪o ℝ)
    (hbound : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i : Fin (n + 1))
    (heligible : s046_cyclic_gap θ i +
      s046_cyclic_gap θ ((finRotate (n + 1)) i) < lambda a b) :
    sqDist (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
      (ellipsePoint a b (θ i)) < s046_squared_skip_chord a b θ i ∧
    sqDist (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
      (ellipsePoint a b
        (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i)))) <
      s046_squared_skip_chord a b θ i := by
  have hleft : θ i < s047_mid_lift θ i := by
    have h := s046_cyclic_gap_pos θ hbound i
    rw [← s047_mid_lift_gap θ i] at h
    linarith
  have hright : s047_mid_lift θ i < s047_right_lift θ i := by
    have h := s046_cyclic_gap_pos θ hbound
      ((finRotate (n + 1)) i)
    rw [← s047_right_lift_gap θ i] at h
    linarith
  have htotal :
      s047_right_lift θ i - θ i =
        s046_cyclic_gap θ i +
        s046_cyclic_gap θ ((finRotate (n + 1)) i) := by
    rw [← s047_mid_lift_gap θ i,
        ← s047_right_lift_gap θ i]
    ring
  have hspan : s047_right_lift θ i - θ i < lambda a b := by
    rw [htotal]
    exact heligible
  obtain ⟨hL, hR⟩ :=
    s035_eligible_skip_exceeds_both_neighbours a b
      (θ i) (s047_mid_lift θ i) (s047_right_lift θ i)
      hb hab hleft hright hspan
  rw [s047_mid_lift_site, s047_right_lift_site] at hL hR
  exact ⟨hL, hR⟩

end ETSHTS
