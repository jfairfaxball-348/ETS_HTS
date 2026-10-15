import ETSHTS.RatioWindow
import ETSHTS.CyclicFinite

/-!
# S044 — the original closed ratio permits the exact two-gap cutoff

This is a formalisation of the *unchanged* S020 angular threshold at
a/b ≤ R, including equality. It makes no angular-separation assumption
and does not assert that the selected index is already a metric ear.
-/

noncomputable section
namespace ETSHTS

/-- Every ratio in the original closed aspect interval has angular cutoff
strictly greater than 4π/5. In particular, the endpoint a/b = R is allowed. -/
theorem s044_closed_ratio_cutoff_exceeds_four_pi_div_five
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R) :
    4 * Real.pi / 5 < lambda a b := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hx : (10 : ℝ) / 11 < b / a :=
    s043_closed_ratio_minor_axis_floor a b hb hab hr
  have hxpos : 0 < b / a := div_pos hb ha
  have hxle : b / a ≤ (1 : ℝ) := (div_le_one ha).2 hab
  have hx2 : (100 : ℝ) / 121 < (b / a) ^ 2 := by
    have h1 : 0 < b / a - (10 : ℝ) / 11 := by linarith
    have h2 : 0 < b / a + (10 : ℝ) / 11 := by linarith
    nlinarith [mul_pos h1 h2]
  have hden : 0 < (1 : ℝ) + (b / a) ^ 2 := by positivity
  have hcos_upper :
      Real.cos (2 * Real.arctan (b / a)) < (1 : ℝ) / 4 := by
    rw [cos_two_arctan_rational]
    apply (div_lt_iff₀ hden).2
    nlinarith
  have hroot_sq : (Real.sqrt (5 : ℝ)) ^ 2 = 5 :=
    Real.sq_sqrt (by norm_num)
  have hroot : (2 : ℝ) ≤ Real.sqrt 5 := by
    nlinarith [Real.sqrt_nonneg (5 : ℝ)]
  have hcos_lower :
      (1 : ℝ) / 4 ≤ Real.cos (2 * Real.pi / 5) := by
    rw [cos_two_pi_div_five_exact]
    linarith
  have hpos : 0 ≤ 2 * Real.arctan (b / a) := by
    have har : Real.arctan 0 < Real.arctan (b / a) :=
      Real.arctan_lt_arctan hxpos
    simp only [Real.arctan_zero] at har
    linarith
  have hpi : 2 * Real.pi / 5 ≤ Real.pi / 2 := by
    nlinarith [Real.pi_pos]
  have hangle : Real.pi / 5 < Real.arctan (b / a) := by
    by_contra hnot
    have hle : 2 * Real.arctan (b / a) ≤ 2 * Real.pi / 5 := by
      linarith [le_of_not_gt hnot]
    rcases eq_or_lt_of_le hle with heq | hlt
    · have heqcos := congrArg Real.cos heq
      linarith
    · have hgt : Real.cos (2 * Real.pi / 5) <
          Real.cos (2 * Real.arctan (b / a)) :=
        Real.cos_lt_cos_of_nonneg_of_le_pi_div_two hpos hpi hlt
      linarith
  unfold lambda
  linarith

/-- The S020 eligible minimum exists at the exact closed R without an
extra cutoff hypothesis, once a genuine finite full-turn cyclic listing
has been constructed. The listing is still an explicit independent task. -/
theorem s044_closed_ratio_metric_min_from_full_turn
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R)
    (n : ℕ) (hn : 5 ≤ n) (next : Fin n ≃ Fin n)
    (gap skipSquared : Fin n → ℝ)
    (hturn : (∑ i : Fin n, gap i) = 2 * Real.pi) :
    ∃ i : Fin n, gap i + gap (next i) < lambda a b ∧
      ∀ j : Fin n, gap j + gap (next j) < lambda a b →
        skipSquared i ≤ skipSquared j := by
  exact s042_eligible_metric_min_from_full_turn n hn next
    gap skipSquared (lambda a b) hturn
    (s044_closed_ratio_cutoff_exceeds_four_pi_div_five a b hb hab hr)

end ETSHTS
