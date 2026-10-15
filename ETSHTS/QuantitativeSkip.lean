import ETSHTS.CyclicEllipseNeighbourBridge

/-!
# S048 — quantitative bound for the actual minimum original ellipse skip

The selected skip is still the minimum original squared Euclidean chord
among eligible true two-gap spans. We prove the absolute bound using a
genuine averaging witness and its true lifted ellipse endpoints.
-/

noncomputable section
namespace ETSHTS

/-- Exact unit-circle half-angle identity, for arbitrary real phase lifts. -/
theorem s048_unit_circle_chord_sq (θ φ : ℝ) :
    sqDist (ellipsePoint 1 1 θ) (ellipsePoint 1 1 φ) =
      4 * Real.sin ((φ - θ) / 2) ^ 2 := by
  rw [sqDist_unit_circle_cos_sub]
  have hc : Real.cos (θ - φ) =
      1 - 2 * Real.sin ((φ - θ) / 2) ^ 2 := by
    calc
      Real.cos (θ - φ) = Real.cos (-(θ - φ)) := (Real.cos_neg _).symm
      _ = Real.cos (2 * ((φ - θ) / 2)) := by congr 1 <;> ring
      _ = 1 - 2 * Real.sin ((φ - θ) / 2) ^ 2 := by
        rw [Real.cos_two_mul]
        nlinarith [Real.sin_sq_add_cos_sq ((φ - θ) / 2)]
  rw [hc]
  ring

/-- The ORIGINAL Euclidean ellipse chord has the sharp circular upper
estimate on any genuine directed arc no longer than 4π/5. This works for
real lifts across the original zero-phase seam. -/
theorem s048_short_span_chord_sq_le (a b θ φ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hspan0 : 0 ≤ φ - θ)
    (hspan : φ - θ ≤ 4 * Real.pi / 5) :
    sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) ≤
      (2 * a * Real.sin (2 * Real.pi / 5)) ^ 2 := by
  have hx0 : 0 ≤ (φ - θ) / 2 := by linarith
  have hxupper : (φ - θ) / 2 ≤ 2 * Real.pi / 5 := by linarith
  have hyupper : 2 * Real.pi / 5 ≤ Real.pi / 2 := by
    nlinarith [Real.pi_pos]
  have hsin0 : 0 ≤ Real.sin ((φ - θ) / 2) :=
    Real.sin_nonneg_of_nonneg_of_le_pi hx0
      (by linarith [Real.pi_pos])
  have hsinR : 0 ≤ Real.sin (2 * Real.pi / 5) :=
    le_of_lt s036_sin_two_pi_div_five_pos
  have hsinle :
      Real.sin ((φ - θ) / 2) ≤ Real.sin (2 * Real.pi / 5) :=
    Real.sin_le_sin_of_le_of_le_pi_div_two
      (by linarith [Real.pi_pos]) hyupper hxupper
  have hsqs :
      Real.sin ((φ - θ) / 2) ^ 2 ≤
        Real.sin (2 * Real.pi / 5) ^ 2 := by
    nlinarith [mul_nonneg
      (show 0 ≤ Real.sin (2 * Real.pi / 5) -
        Real.sin ((φ - θ) / 2) by linarith)
      (show 0 ≤ Real.sin (2 * Real.pi / 5) +
        Real.sin ((φ - θ) / 2) by linarith)]
  have hsqmul := mul_le_mul_of_nonneg_left hsqs (sq_nonneg a)
  have hcircle :=
    (sqDist_ellipse_between_circular_bounds a b θ φ
      (le_of_lt hb) hab).2
  rw [s048_unit_circle_chord_sq] at hcircle
  nlinarith

/-- The actual positive cyclic gaps furnish an eligible ORIGINAL skip
spanning at most 4π/5. This is stronger than merely finding some
index beneath lambda; it is what produces the quantitative bound. -/
theorem s048_small_eligible_span {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R) (hn : 5 ≤ n + 1)
    (θ : Fin (n + 1) ↪o ℝ) :
    ∃ j : Fin (n + 1),
      s046_cyclic_gap θ j +
          s046_cyclic_gap θ ((finRotate (n + 1)) j) ≤
        4 * Real.pi / 5 ∧
      s046_cyclic_gap θ j +
          s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b := by
  classical
  let span : Fin (n + 1) → ℝ :=
    fun k => s046_cyclic_gap θ k +
      s046_cyclic_gap θ ((finRotate (n + 1)) k)
  have hn0 : 0 < n + 1 := by omega
  have hall : (Finset.univ : Finset (Fin (n + 1))).Nonempty :=
    ⟨⟨0, hn0⟩, Finset.mem_univ _⟩
  obtain ⟨j, _, hmin⟩ :=
    Finset.exists_min_image (Finset.univ : Finset (Fin (n + 1))) span hall
  have hsum : (∑ k : Fin (n + 1), span k) = 4 * Real.pi := by
    exact s042_two_gap_sum_full_turn (n + 1) (finRotate (n + 1))
      (s046_cyclic_gap θ) (s046_cyclic_gap_full_turn θ)
  have hle : span j ≤ 4 * Real.pi / ((n + 1 : ℕ) : ℝ) :=
    s033_cyclic_min_two_gap_average (n + 1) hn0 span hsum j
      (fun k => hmin k (Finset.mem_univ k))
  have hnreal : (5 : ℝ) ≤ ((n + 1 : ℕ) : ℝ) := by
    exact_mod_cast hn
  have hnrealpos : (0 : ℝ) < ((n + 1 : ℕ) : ℝ) := by
    exact_mod_cast hn0
  have hbound : 4 * Real.pi / ((n + 1 : ℕ) : ℝ) ≤
      4 * Real.pi / 5 := by
    apply (div_le_div_iff₀ hnrealpos (by norm_num : (0 : ℝ) < 5)).2
    have hnonneg : 0 ≤ (4 * Real.pi) * (((n + 1 : ℕ) : ℝ) - 5) :=
      mul_nonneg (by positivity) (by linarith)
    nlinarith
  have hsmall : span j ≤ 4 * Real.pi / 5 := hle.trans hbound
  exact ⟨j, hsmall,
    lt_of_le_of_lt hsmall
      (s044_closed_ratio_cutoff_exceeds_four_pi_div_five a b hb hab hr)⟩

/-- A2 completed: the TRUE Euclidean squared metric-minimal original
skip is bounded by the original S020 length threshold, squared.
No proxy distance, angularly minimum selector or extra spacing. -/
theorem s048_selected_skip_chord_sq_upper {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R) (hn : 5 ≤ n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i : Fin (n + 1))
    (hmin : ∀ j : Fin (n + 1),
      s046_cyclic_gap θ j +
        s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ j) :
    s046_squared_skip_chord a b θ i ≤
      (2 * a * Real.sin (2 * Real.pi / 5)) ^ 2 := by
  obtain ⟨j, hjsmall, hjeligible⟩ :=
    s048_small_eligible_span a b hb hab hr hn θ
  have htotal :
      s047_right_lift θ j - θ j =
        s046_cyclic_gap θ j +
          s046_cyclic_gap θ ((finRotate (n + 1)) j) := by
    rw [← s047_mid_lift_gap θ j,
      ← s047_right_lift_gap θ j]
    ring
  have hpositive : 0 ≤ s047_right_lift θ j - θ j := by
    rw [htotal]
    have h1 := s046_cyclic_gap_pos θ hphase j
    have h2 := s046_cyclic_gap_pos θ hphase ((finRotate (n + 1)) j)
    linarith
  have hsmall : s047_right_lift θ j - θ j ≤ 4 * Real.pi / 5 := by
    rw [htotal]
    exact hjsmall
  have hchord : s046_squared_skip_chord a b θ j ≤
      (2 * a * Real.sin (2 * Real.pi / 5)) ^ 2 := by
    have h := s048_short_span_chord_sq_le a b
      (θ j) (s047_right_lift θ j) hb hab hpositive hsmall
    unfold s046_squared_skip_chord
    rw [← s047_right_lift_site a b θ j]
    exact h
  exact (hmin j hjeligible).trans hchord

/-- The actual selected original squared skip lies under the CLOSED
central-distance floor squared, including a/b = R. -/
theorem s048_selected_skip_below_closed_floor_sq {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R) (hn : 5 ≤ n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i : Fin (n + 1))
    (hmin : ∀ j : Fin (n + 1),
      s046_cyclic_gap θ j +
        s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ j) :
    s046_squared_skip_chord a b θ i ≤
      (4 * a * b ^ 2 / (a ^ 2 + b ^ 2)) ^ 2 := by
  have hupper :=
    s048_selected_skip_chord_sq_upper a b hb hab hr hn θ hphase i hmin
  have hfloor := s036_closed_ratio_central_floor a b hb hab hr
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hden : 0 < a ^ 2 + b ^ 2 := by
    nlinarith [sq_pos_of_pos hb, sq_nonneg a]
  have hleft : 0 ≤ 2 * a * Real.sin (2 * Real.pi / 5) := by
    positivity
  have hright : 0 ≤ 4 * a * b ^ 2 / (a ^ 2 + b ^ 2) := by
    positivity
  have hsq :
      (2 * a * Real.sin (2 * Real.pi / 5)) ^ 2 ≤
      (4 * a * b ^ 2 / (a ^ 2 + b ^ 2)) ^ 2 := by
    nlinarith [mul_nonneg
      (show 0 ≤ 4 * a * b ^ 2 / (a ^ 2 + b ^ 2) -
        2 * a * Real.sin (2 * Real.pi / 5) by linarith)
      (show 0 ≤ 4 * a * b ^ 2 / (a ^ 2 + b ^ 2) +
        2 * a * Real.sin (2 * Real.pi / 5) by linarith)]
  exact hupper.trans hsq

end ETSHTS
