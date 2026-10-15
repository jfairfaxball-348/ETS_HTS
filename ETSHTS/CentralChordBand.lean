import ETSHTS.QuantitativeSkip

/-!
# S048 — original ellipse central closed-band comparison

The directed angle includes both closed endpoints and the antipodal angle.
There is no false assertion that sine is monotone over the whole interval.
-/

noncomputable section
namespace ETSHTS

/-- Sine in a symmetric middle band has a closed, inclusive lower bound.
Split at π before applying sine monotonicity on [0, π/2]. -/
theorem s048_middle_band_sine_lower
    (cutoff δ : ℝ)
    (hcut0 : 0 ≤ cutoff) (hcutpi : cutoff ≤ Real.pi)
    (hlower : cutoff ≤ δ)
    (hupper : δ ≤ 2 * Real.pi - cutoff) :
    Real.sin (cutoff / 2) ≤ Real.sin (δ / 2) := by
  have hcut : -(Real.pi / 2) ≤ cutoff / 2 := by linarith
  by_cases hd : δ ≤ Real.pi
  · exact Real.sin_le_sin_of_le_of_le_pi_div_two hcut
      (by linarith) (by linarith)
  · have hmono : Real.sin (cutoff / 2) ≤
        Real.sin (Real.pi - δ / 2) :=
      Real.sin_le_sin_of_le_of_le_pi_div_two hcut
        (by linarith) (by linarith)
    simpa only [Real.sin_pi_sub] using hmono

/-- Under the original positive ellipse axes, lambda lies in [0, π].
The circle case b=a is included (lambda=π). -/
theorem s048_lambda_mem_zero_pi (a b : ℝ)
    (hb : 0 < b) (hab : b ≤ a) :
    0 ≤ lambda a b ∧ lambda a b ≤ Real.pi := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hx : 0 < b / a := div_pos hb ha
  have hxle : b / a ≤ (1 : ℝ) := (div_le_one ha).2 hab
  have harpos : 0 ≤ Real.arctan (b / a) := by
    have h := Real.arctan_lt_arctan hx
    simpa only [Real.arctan_zero] using (le_of_lt h)
  have harupper : Real.arctan (b / a) ≤ Real.pi / 4 := by
    calc
      Real.arctan (b / a) ≤ Real.arctan 1 :=
        Real.arctan_le_arctan hxle
      _ = Real.pi / 4 := Real.arctan_one
  unfold lambda
  constructor <;> linarith

/-- C3 central band: original squared Euclidean distance is at least
the minor-axis circular chord evaluated at the actual CLOSED cutoff.
This works at either endpoint, δ=π, a=b and a/b=R. -/
theorem s048_central_actual_sqDist_sin_lower
    (a b θ φ : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hlower : lambda a b ≤ φ - θ)
    (hupper : φ - θ ≤ 2 * Real.pi - lambda a b) :
    (2 * b * Real.sin (lambda a b / 2)) ^ 2 ≤
      sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) := by
  have hcut := s048_lambda_mem_zero_pi a b hb hab
  have hsin :
      Real.sin (lambda a b / 2) ≤
        Real.sin ((φ - θ) / 2) :=
    s048_middle_band_sine_lower (lambda a b) (φ - θ)
      hcut.1 hcut.2 hlower hupper
  have hsin0 : 0 ≤ Real.sin (lambda a b / 2) :=
    Real.sin_nonneg_of_nonneg_of_le_pi
      (by linarith [hcut.1])
      (by linarith [hcut.2, Real.pi_pos])
  have hsine0 : 0 ≤ Real.sin ((φ - θ) / 2) := by linarith
  have hsqs :
      Real.sin (lambda a b / 2) ^ 2 ≤
      Real.sin ((φ - θ) / 2) ^ 2 := by
    nlinarith [mul_nonneg
      (show 0 ≤ Real.sin ((φ - θ) / 2) -
        Real.sin (lambda a b / 2) by linarith)
      (show 0 ≤ Real.sin ((φ - θ) / 2) +
        Real.sin (lambda a b / 2) by linarith)]
  have hbmul := mul_le_mul_of_nonneg_left hsqs (sq_nonneg b)
  have hcircle :=
    (sqDist_ellipse_between_circular_bounds a b θ φ
      (le_of_lt hb) hab).1
  rw [s048_unit_circle_chord_sq] at hcircle
  nlinarith

end ETSHTS
