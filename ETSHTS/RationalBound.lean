import ETSHTS.Cutoff

/-!
# S031: an unconditional explicit nonround parameter bound

This module supplies the missing numerical premise in the exact S026
CLM0108 reduction. It does NOT prove CLM0107 or CLM0108 outright.
The bound uses a deliberately coarse rational estimate sin(2π/5)<49/50,
deduced from the exact cosine of π/5 and sin²+cos²=1.
-/

noncomputable section
namespace ETSHTS

theorem cos_two_pi_div_five_exact :
    Real.cos (2 * Real.pi / 5) = (Real.sqrt 5 - 1) / 4 := by
  have hsq : (Real.sqrt 5) ^ 2 = (5 : ℝ) :=
    Real.sq_sqrt (by norm_num)
  have hc : Real.cos (2 * Real.pi / 5) =
      2 * (Real.cos (Real.pi / 5)) ^ 2 - 1 := by
    convert Real.cos_two_mul (Real.pi / 5) using 1 <;> ring
  rw [hc, Real.cos_pi_div_five]
  nlinarith

/-- Coarse strict bound, with room for the exact 101/100 inequality. -/
theorem sin_two_pi_div_five_lt_49_div_50 :
    Real.sin (2 * Real.pi / 5) < (49 : ℝ) / 50 := by
  let x : ℝ := 2 * Real.pi / 5
  have hxpos : 0 < x := by dsimp [x]; positivity
  have hxpi : x < Real.pi := by dsimp [x]; nlinarith [Real.pi_pos]
  have hspos : 0 < Real.sin x :=
    Real.sin_pos_of_pos_of_lt_pi hxpos hxpi
  have hroot : (2 : ℝ) ≤ Real.sqrt 5 := by
    have hsq : (Real.sqrt 5) ^ 2 = (5 : ℝ) :=
      Real.sq_sqrt (by norm_num)
    nlinarith [Real.sqrt_nonneg (5 : ℝ)]
  have hcge : (1 : ℝ) / 4 ≤ Real.cos x := by
    change (1 : ℝ) / 4 ≤ Real.cos (2 * Real.pi / 5)
    rw [cos_two_pi_div_five_exact]
    linarith
  have hcsq : (1 : ℝ) / 16 ≤ (Real.cos x) ^ 2 := by
    have hprod : 0 ≤
        (Real.cos x - 1 / 4) * (Real.cos x + 1 / 4) :=
      mul_nonneg (by linarith) (by linarith)
    nlinarith
  have hcircle := Real.sin_sq_add_cos_sq x
  by_contra h
  have hge : (49 : ℝ) / 50 ≤ Real.sin x := le_of_not_gt h
  have hssq : ((49 : ℝ) / 50) ^ 2 ≤ (Real.sin x) ^ 2 := by
    have hprod : 0 ≤
        (Real.sin x - 49 / 50) * (Real.sin x + 49 / 50) :=
      mul_nonneg (by linarith) (by linarith)
    nlinarith
  nlinarith

/-- The precise original closed threshold R includes the nonround 101/100 ellipse. -/
theorem ellipse_ratio_101_le_R : (101 : ℝ) / 100 ≤ R := by
  let s : ℝ := Real.sin (2 * Real.pi / 5)
  have hspos : 0 < s := by
    dsimp [s]
    apply Real.sin_pos_of_pos_of_lt_pi
    · positivity
    · nlinarith [Real.pi_pos]
  have hsupper : s < (49 : ℝ) / 50 := by
    dsimp [s]
    exact sin_two_pi_div_five_lt_49_div_50
  have hratio_sq : ((101 : ℝ) / 100) ^ 2 + 1 ≤ 2 / s := by
    apply (le_div_iff₀ hspos).2
    nlinarith
  have harg : 0 ≤ 2 / s - 1 := by linarith
  have hRsq : R ^ 2 = 2 / s - 1 := by
    unfold R
    exact Real.sq_sqrt harg
  have hRnonneg : 0 ≤ R := by
    unfold R
    positivity
  nlinarith

/-- Only CLM0107 remains as a premise; there is no longer a ratio premise. -/
theorem clm0108_of_clm0107 (hmain : CLM0107) : CLM0108 :=
  clm0108_of_clm0107_and_ratio hmain ellipse_ratio_101_le_R

end ETSHTS
