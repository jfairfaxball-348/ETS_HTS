import ETSHTS.CentralOriginalSites

/-!
# S048 — two actual cyclic skip endpoint comparisons for short bands

These are the S020 short-direction estimates instantiated on real lifts
of original Fin-rotation ellipse sites. Equality with a second successor
or predecessor is treated directly by selected-minimum, without invoking
strict extension at equal endpoints.
-/

noncomputable section
namespace ETSHTS

private theorem s048_two_gap_lift_span {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ) (j : Fin (n + 1)) :
    s047_right_lift θ j - θ j =
      s046_cyclic_gap θ j +
        s046_cyclic_gap θ ((finRotate (n + 1)) j) := by
  rw [← s047_mid_lift_gap θ j, ← s047_right_lift_gap θ j]
  ring

private theorem s048_two_gap_lift_pos {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (j : Fin (n + 1)) :
    θ j < s047_right_lift θ j := by
  have hg := s046_cyclic_gap_pos θ hphase j
  have hg' := s046_cyclic_gap_pos θ hphase ((finRotate (n + 1)) j)
  have htotal : 0 < s047_right_lift θ j - θ j := by
    rw [s048_two_gap_lift_span θ j]
    linarith
  linarith

/-- Forward short band for original squared-chord metric minimum:
any competitor at or beyond a genuine second successor is no closer.
The equality case is the two-step eligible skip itself. -/
theorem s048_forward_actual_two_successor_floor {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i j : Fin (n + 1))
    (hmin : ∀ k : Fin (n + 1),
      s046_cyclic_gap θ k +
        s046_cyclic_gap θ ((finRotate (n + 1)) k) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ k)
    (competitor : ℝ)
    (hafter : s047_right_lift θ j ≤ competitor)
    (hshort : competitor - θ j < lambda a b) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b (θ j)) (ellipsePoint a b competitor) := by
  have hstart := s048_two_gap_lift_pos θ hphase j
  have heligible : s046_cyclic_gap θ j +
      s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b := by
    rw [← s048_two_gap_lift_span θ j]
    linarith
  have hmetric := hmin j heligible
  have hmetriclift :
      s046_squared_skip_chord a b θ i ≤
        sqDist (ellipsePoint a b (θ j))
          (ellipsePoint a b (s047_right_lift θ j)) := by
    rw [s047_right_lift_site]
    exact hmetric
  rcases eq_or_lt_of_le hafter with heq | hstrict
  · rw [← heq]
    exact hmetriclift
  · exact le_of_lt (s035_forward_short_arc_competitor
      a b (θ j) (s047_right_lift θ j) competitor
      (s046_squared_skip_chord a b θ i) hb hab
      hstart hstrict hshort hmetriclift)

/-- Reverse short band for original squared-chord metric minimum:
the lifted original two-successor endpoint may be the centre, and a
competitor at or before its earlier original predecessor has distance
at least the selected skip. Includes equality with that predecessor. -/
theorem s048_backward_actual_two_predecessor_floor {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i j : Fin (n + 1))
    (hmin : ∀ k : Fin (n + 1),
      s046_cyclic_gap θ k +
        s046_cyclic_gap θ ((finRotate (n + 1)) k) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ k)
    (competitor : ℝ)
    (hbefore : competitor ≤ θ j)
    (hshort : s047_right_lift θ j - competitor < lambda a b) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b (s047_right_lift θ j))
        (ellipsePoint a b competitor) := by
  have hfinish := s048_two_gap_lift_pos θ hphase j
  have heligible : s046_cyclic_gap θ j +
      s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b := by
    rw [← s048_two_gap_lift_span θ j]
    linarith
  have hmetric := hmin j heligible
  have hmetriclift :
      s046_squared_skip_chord a b θ i ≤
        sqDist (ellipsePoint a b (θ j))
          (ellipsePoint a b (s047_right_lift θ j)) := by
    rw [s047_right_lift_site]
    exact hmetric
  rcases eq_or_lt_of_le hbefore with heq | hstrict
  · rw [heq]
    calc
      s046_squared_skip_chord a b θ i ≤
          sqDist (ellipsePoint a b (θ j))
            (ellipsePoint a b (s047_right_lift θ j)) := hmetriclift
      _ = sqDist (ellipsePoint a b (s047_right_lift θ j))
            (ellipsePoint a b (θ j)) := sqDist_symm _ _
  · exact le_of_lt (s035_backward_short_arc_competitor
      a b competitor (θ j) (s047_right_lift θ j)
      (s046_squared_skip_chord a b θ i) hb hab
      hstrict hfinish hshort hmetriclift)

end ETSHTS
