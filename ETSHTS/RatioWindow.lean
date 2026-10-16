module
public import ETSHTS.LastOrder

@[expose] public section


/-!
# S043: rational aspect-ratio window for the exact locked threshold

A strict rational envelope on the original closed cutoff R is useful
when relating admissible ellipse axes to positive angular gaps. This
module does NOT assert the still-open cutoff-angle or uniform-ear proof.
-/

noncomputable section
namespace ETSHTS

/-- The exact S020 closed cutoff has the unconditional strict bound
R < 11/10, proved from the already verified exact cosine of 2*pi/5.
The boundary R itself is unchanged. -/
theorem s043_R_lt_11_div_10 : R < (11 : ℝ) / 10 := by
  let t : ℝ := 2 * Real.pi / 5
  let s : ℝ := Real.sin t
  let c : ℝ := Real.cos t
  have hspos : 0 < s := by
    dsimp [s, t]
    exact s036_sin_two_pi_div_five_pos
  have hsle : s ≤ 1 := by
    dsimp [s]
    exact Real.sin_le_one t
  have hroot_sq : (Real.sqrt (5 : ℝ)) ^ 2 = 5 :=
    Real.sq_sqrt (by norm_num)
  have hroot_nonneg : 0 ≤ Real.sqrt (5 : ℝ) :=
    Real.sqrt_nonneg _
  have hroot_lo : (2 : ℝ) ≤ Real.sqrt 5 := by
    nlinarith
  have hroot_hi : Real.sqrt (5 : ℝ) < 5 / 2 := by
    nlinarith
  have hcos_lo : 0 ≤ c := by
    dsimp [c, t]
    rw [cos_two_pi_div_five_exact]
    linarith
  have hcos_hi : c < (3 : ℝ) / 8 := by
    dsimp [c, t]
    rw [cos_two_pi_div_five_exact]
    linarith
  have hcsq : c ^ 2 < ((3 : ℝ) / 8) ^ 2 := by
    nlinarith
  have hcircle : s ^ 2 + c ^ 2 = 1 := by
    dsimp [s, c]
    exact Real.sin_sq_add_cos_sq t
  have hsin_lower : (200 : ℝ) / 221 < s := by
    by_contra h
    have hsup : s ≤ (200 : ℝ) / 221 := le_of_not_gt h
    have hm : 0 ≤ ((200 : ℝ) / 221 - s) * ((200 : ℝ) / 221 + s) :=
      mul_nonneg (by linarith) (by linarith)
    nlinarith
  have harg : 0 ≤ 2 / s - 1 := by
    have hdiv : (1 : ℝ) ≤ 2 / s :=
      (le_div_iff₀ hspos).2 (by linarith)
    linarith
  have hRsq : R ^ 2 = 2 / s - 1 := by
    unfold R
    dsimp [s, t] at harg ⊢
    exact Real.sq_sqrt harg
  have hRnonneg : 0 ≤ R := by
    unfold R
    positivity
  have hupper : 2 / s < (221 : ℝ) / 100 := by
    apply (div_lt_iff₀ hspos).2
    nlinarith [hsin_lower]
  nlinarith

/-- The original closed boundary ratio gives a strict rational
upper bound on the physical aspect a/b. -/
theorem s043_closed_ratio_strict_aspect_bound
    (a b : ℝ) (hb : 0 < b) (hr : a / b ≤ R) :
    a < ((11 : ℝ) / 10) * b := by
  have h : a / b < (11 : ℝ) / 10 :=
    lt_of_le_of_lt hr s043_R_lt_11_div_10
  exact (div_lt_iff₀ hb).mp h

/-- Equivalently, the short-to-long axis quotient is bounded away
from zero uniformly on the complete original closed aspect interval. -/
theorem s043_closed_ratio_minor_axis_floor
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R) :
    (10 : ℝ) / 11 < b / a := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hup := s043_closed_ratio_strict_aspect_bound a b hb hr
  apply (lt_div_iff₀ ha).2
  nlinarith

end ETSHTS
