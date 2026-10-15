import ETSHTS.CentralChordBand

/-!
# S048 — exact closed cutoff equality and selected central competitor

All identities are on the original elliptical squared Euclidean chord;
the S020 middle-band equality is proved without numerical approximation.
-/

noncomputable section
namespace ETSHTS

/-- Exact double-arctangent sine in a rational square form. -/
theorem s048_sin_two_arctan_rational (x : ℝ) :
    Real.sin (2 * Real.arctan x) = 2 * x / (1 + x ^ 2) := by
  have hd : 0 < (1 : ℝ) + x ^ 2 := by positivity
  have hs : 0 < Real.sqrt (1 + x ^ 2) := Real.sqrt_pos.2 hd
  have hsq : (Real.sqrt (1 + x ^ 2)) ^ 2 = 1 + x ^ 2 :=
    Real.sq_sqrt (le_of_lt hd)
  rw [Real.sin_two_mul, Real.sin_arctan, Real.cos_arctan]
  calc
    2 * (x / Real.sqrt (1 + x ^ 2)) *
        (1 / Real.sqrt (1 + x ^ 2)) =
        2 * x / (Real.sqrt (1 + x ^ 2)) ^ 2 := by
          field_simp [ne_of_gt hs]
          <;> ring
    _ = 2 * x / (1 + x ^ 2) := by rw [hsq]

/-- The central S020 length floor is EXACT at all positive ellipse axes;
there is no strict bound accidentally excluding a/b = R. -/
theorem s048_exact_lambda_sine_length (a b : ℝ)
    (hb : 0 < b) (hab : b ≤ a) :
    2 * b * Real.sin (lambda a b / 2) =
      4 * a * b ^ 2 / (a ^ 2 + b ^ 2) := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hane : a ≠ 0 := ne_of_gt ha
  have hden : 0 < a ^ 2 + b ^ 2 := by
    nlinarith [sq_pos_of_pos hb, sq_nonneg a]
  have hratio : (1 : ℝ) + (b / a) ^ 2 ≠ 0 := by positivity
  rw [show lambda a b / 2 = 2 * Real.arctan (b / a) by
    unfold lambda
    ring]
  rw [s048_sin_two_arctan_rational]
  field_simp [hane, ne_of_gt hden, hratio]
  <;> ring

/-- The central band has the fully evaluated, squared, closed endpoint
floor from S020, not merely a symbolic sin(lambda/2) placeholder. -/
theorem s048_central_actual_sqDist_closed_floor
    (a b θ φ : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hlower : lambda a b ≤ φ - θ)
    (hupper : φ - θ ≤ 2 * Real.pi - lambda a b) :
    (4 * a * b ^ 2 / (a ^ 2 + b ^ 2)) ^ 2 ≤
      sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) := by
  rw [← s048_exact_lambda_sine_length a b hb hab]
  exact s048_central_actual_sqDist_sin_lower
    a b θ φ hb hab hlower hupper

/-- C3's entire central comparison: selected minimum ORIGINAL Euclidean
squared skip ≤ any central competitor's ORIGINAL squared Euclidean chord.
True original phases and the selected eligible metric minimum are inputs. -/
theorem s048_selected_skip_le_central_actual_competitor {n : ℕ}
    (a b θ₀ φ : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R) (hn : 5 ≤ n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i : Fin (n + 1))
    (hmin : ∀ j : Fin (n + 1),
      s046_cyclic_gap θ j +
        s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ j)
    (hlower : lambda a b ≤ φ - θ₀)
    (hupper : φ - θ₀ ≤ 2 * Real.pi - lambda a b) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b θ₀) (ellipsePoint a b φ) := by
  exact (s048_selected_skip_below_closed_floor_sq
    a b hb hab hr hn θ hphase i hmin).trans
      (s048_central_actual_sqDist_closed_floor a b θ₀ φ
        hb hab hlower hupper)

end ETSHTS
