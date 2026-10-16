module
public import ETSHTS.EligibleSkip

@[expose] public section


/-!
# S036 — the original S020 central-band closed-ratio algebra

No changed ellipse theorem, no alternative selector. In the S020 proof the
central competitor comparison needs a bound valid also at a/b = R.
The trigonometric angular distance bounds and the global ear induction
are separate obligations, not assumptions concealed in these declarations.
-/

noncomputable section
namespace ETSHTS

/-- The fixed central angle sine is strictly positive. -/
theorem s036_sin_two_pi_div_five_pos :
    0 < Real.sin (2 * Real.pi / 5) := by
  apply Real.sin_pos_of_pos_of_lt_pi
  · positivity
  · nlinarith [Real.pi_pos]

/-- CLOSED ratio: the exact definition of R implies
(a/b)^2 + 1 ≤ 2/sin(2π/5), including equality at a/b = R. -/
theorem s036_closed_ratio_square
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R) :
    (a / b) ^ 2 + 1 ≤ 2 / Real.sin (2 * Real.pi / 5) := by
  let s : ℝ := Real.sin (2 * Real.pi / 5)
  have hspos : 0 < s := by
    dsimp [s]
    exact s036_sin_two_pi_div_five_pos
  have hsupper : s < (49 : ℝ) / 50 := by
    dsimp [s]
    exact sin_two_pi_div_five_lt_49_div_50
  have harg : 0 ≤ 2 / s - 1 := by
    have hdiv : (1 : ℝ) ≤ 2 / s :=
      (le_div_iff₀ hspos).2 (by linarith)
    linarith
  have hRsq : R ^ 2 = 2 / s - 1 := by
    unfold R
    change (Real.sqrt (2 / s - 1)) ^ 2 = 2 / s - 1
    exact Real.sq_sqrt harg
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hratio_nonneg : 0 ≤ a / b := le_of_lt (div_pos ha hb)
  have hRnonneg : 0 ≤ R := by
    unfold R
    positivity
  have hprod : 0 ≤ (R - a / b) * (R + a / b) :=
    mul_nonneg (sub_nonneg.mpr hr) (add_nonneg hRnonneg hratio_nonneg)
  have hbound : (a / b) ^ 2 + 1 ≤ 2 / s := by
    nlinarith [hprod, hRsq]
  simpa only [s] using hbound

/-- The ratio bound with denominators cleared: this is the exact
central-chord versus eligible-witness algebra used in S020. -/
theorem s036_closed_ratio_central_product
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R) :
    Real.sin (2 * Real.pi / 5) * (a ^ 2 + b ^ 2) ≤ 2 * b ^ 2 := by
  let s : ℝ := Real.sin (2 * Real.pi / 5)
  have hspos : 0 < s := by
    dsimp [s]
    exact s036_sin_two_pi_div_five_pos
  have hsq : (a / b) ^ 2 + 1 ≤ 2 / s := by
    simpa only [s] using s036_closed_ratio_square a b hb hab hr
  have hmul := mul_le_mul_of_nonneg_right hsq (sq_nonneg b)
  have hbne : b ≠ 0 := ne_of_gt hb
  have hid : ((a / b) ^ 2 + 1) * b ^ 2 = a ^ 2 + b ^ 2 := by
    field_simp [hbne]
    <;> ring
  rw [hid] at hmul
  have hdiv : a ^ 2 + b ^ 2 ≤ (2 * b ^ 2) / s := by
    calc
      a ^ 2 + b ^ 2 ≤ (2 / s) * b ^ 2 := hmul
      _ = (2 * b ^ 2) / s := by ring
  have hcross := (le_div_iff₀ hspos).1 hdiv
  dsimp [s] at hcross
  nlinarith [hcross]

/-- Exact S020 central floor comparison, valid at the R equality endpoint.
The remaining central-band angle and skip-chord upper estimates are geometric. -/
theorem s036_closed_ratio_central_floor
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R) :
    2 * a * Real.sin (2 * Real.pi / 5) ≤
      4 * a * b ^ 2 / (a ^ 2 + b ^ 2) := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hden : 0 < a ^ 2 + b ^ 2 := by
    have hbsq : 0 < b ^ 2 := sq_pos_of_pos hb
    nlinarith [sq_nonneg a]
  apply (le_div_iff₀ hden).2
  calc
    (2 * a * Real.sin (2 * Real.pi / 5)) * (a ^ 2 + b ^ 2) =
        (2 * a) * (Real.sin (2 * Real.pi / 5) * (a ^ 2 + b ^ 2)) := by ring
    _ ≤ (2 * a) * (2 * b ^ 2) :=
      mul_le_mul_of_nonneg_left
        (s036_closed_ratio_central_product a b hb hab hr) (by positivity)
    _ = 4 * a * b ^ 2 := by ring

/-- An explicitly CONDITIONAL bridge: any true geometric upper bound
on the minimum eligible skip length may use the closed-R floor immediately. -/
theorem s036_skip_witness_le_central_floor
    (a b L : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R)
    (hupper : L ≤ 2 * a * Real.sin (2 * Real.pi / 5)) :
    L ≤ 4 * a * b ^ 2 / (a ^ 2 + b ^ 2) :=
  le_trans hupper (s036_closed_ratio_central_floor a b hb hab hr)

end ETSHTS
