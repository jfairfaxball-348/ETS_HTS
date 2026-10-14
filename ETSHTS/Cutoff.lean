import ETSHTS.HalfAngle

/-!
# S030: real arctangent cutoff and exact short-arc extension

No additional hypotheses are imposed on the five original headline targets.
Each argument below works for arbitrary real angle lifts and the original
strict lambda cutoff. The geometric full-set claims remain separate.
-/

noncomputable section
namespace ETSHTS

/-- Rational double-angle identity, with the exact arctangent branch. -/
theorem cos_two_arctan_rational (x : ℝ) :
    Real.cos (2 * Real.arctan x) = (1 - x ^ 2) / (1 + x ^ 2) := by
  rw [Real.cos_two_mul, Real.cos_sq_arctan]
  have hd : 1 + x ^ 2 ≠ (0 : ℝ) := by positivity
  field_simp
  <;> ring

/-- The physical anisotropy ratio is precisely a double arctangent cosine. -/
theorem ellipse_anisotropy_cos_cutoff (a b : ℝ)
    (hb : 0 < b) (hab : b ≤ a) :
    ((a ^ 2 - b ^ 2) / 2) / ((a ^ 2 + b ^ 2) / 2) =
      Real.cos (2 * Real.arctan (b / a)) := by
  rw [cos_two_arctan_rational]
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hane : a ≠ 0 := ne_of_gt ha
  have hsum : a ^ 2 + b ^ 2 ≠ (0 : ℝ) := by
    have hp : 0 < b ^ 2 := sq_pos_of_pos hb
    have hnonneg : 0 ≤ a ^ 2 := sq_nonneg a
    exact ne_of_gt (by linarith)
  have hden : 1 + (b / a) ^ 2 ≠ (0 : ℝ) := by positivity
  field_simp
  <;> ring

/-- Directly discharge BOTH half-angle obligations from the exact lambda,
without a supplementary trigonometric assumption. -/
theorem ellipse_short_arc_half_bounds (a b θ φ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hθφ : θ < φ) (hshort : φ - θ < lambda a b) :
    0 < Real.sin ((φ - θ) / 2) ∧
      ((a ^ 2 - b ^ 2) / 2) / ((a ^ 2 + b ^ 2) / 2) <
        Real.cos ((φ - θ) / 2) := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hx : 0 < b / a := div_pos hb ha
  have hxle : b / a ≤ (1 : ℝ) :=
    (div_le_one ha).2 hab
  have hp : 0 < Real.arctan (b / a) := Real.arctan_pos.mpr hx
  have hple : Real.arctan (b / a) ≤ Real.pi / 4 := by
    calc
      Real.arctan (b / a) ≤ Real.arctan 1 :=
        Real.arctan_mono hxle
      _ = Real.pi / 4 := Real.arctan_one
  have htpos : 0 < (φ - θ) / 2 := by linarith
  have htcut : (φ - θ) / 2 < 2 * Real.arctan (b / a) := by
    unfold lambda at hshort
    linarith
  have hpbound : 2 * Real.arctan (b / a) ≤ Real.pi / 2 := by
    linarith
  constructor
  · exact Real.sin_pos_of_pos_of_lt_pi htpos (by linarith [Real.pi_pos])
  · rw [ellipse_anisotropy_cos_cutoff a b hb hab]
    exact Real.cos_lt_cos_of_nonneg_of_le_pi_div_two
      (le_of_lt htpos) hpbound htcut

/-- Both independent strict signs, without extra cutoff hypotheses. -/
theorem ellipse_short_arc_both_derivatives (a b θ φ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hθφ : θ < φ) (hshort : φ - θ < lambda a b) :
    0 < deriv (fun t : ℝ =>
      sqDist (ellipsePoint a b θ) (ellipsePoint a b t)) φ ∧
    0 < -deriv (fun t : ℝ =>
      sqDist (ellipsePoint a b t) (ellipsePoint a b φ)) θ := by
  obtain ⟨hs, hc⟩ :=
    ellipse_short_arc_half_bounds a b θ φ hb hab hθφ hshort
  exact ⟨deriv_sqDist_ellipse_right_pos_of_cutoff a b θ φ hb hab hs hc,
    neg_deriv_sqDist_ellipse_left_pos_of_cutoff a b θ φ hb hab hs hc⟩

/-- The squared ellipse chord is strictly increasing in its RIGHT endpoint
on every permitted nondegenerate real-lift interval. -/
theorem sqDist_ellipse_strict_right (a b θ φ₀ φ₁ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hθ : θ < φ₀) (hφ : φ₀ < φ₁)
    (hshort : φ₁ - θ < lambda a b) :
    sqDist (ellipsePoint a b θ) (ellipsePoint a b φ₀) <
      sqDist (ellipsePoint a b θ) (ellipsePoint a b φ₁) := by
  let f : ℝ → ℝ := fun t => sqDist (ellipsePoint a b θ) (ellipsePoint a b t)
  have hc : Continuous f := by
    dsimp [f, sqDist, ellipsePoint]
    fun_prop
  have hmono : StrictMonoOn f (Set.Icc φ₀ φ₁) := by
    apply strictMonoOn_of_deriv_pos (convex_Icc φ₀ φ₁) hc.continuousOn
    intro t ht
    have ht' : t ∈ Set.Ioo φ₀ φ₁ := by
      simpa only [interior_Icc] using ht
    exact (ellipse_short_arc_both_derivatives a b θ t hb hab
      (lt_trans hθ ht'.1) (by linarith [ht'.2])).1
  exact hmono ⟨le_refl _, le_of_lt hφ⟩
    ⟨le_of_lt hφ, le_refl _⟩ hφ

/-- Independently, the squared chord is strictly DECREASING in its
LEFT endpoint on every permitted nondegenerate real-lift interval. -/
theorem sqDist_ellipse_strict_left (a b θ₀ θ₁ φ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hθ : θ₀ < θ₁) (hφ : θ₁ < φ)
    (hshort : φ - θ₀ < lambda a b) :
    sqDist (ellipsePoint a b θ₁) (ellipsePoint a b φ) <
      sqDist (ellipsePoint a b θ₀) (ellipsePoint a b φ) := by
  let f : ℝ → ℝ := fun t => sqDist (ellipsePoint a b t) (ellipsePoint a b φ)
  have hc : Continuous f := by
    dsimp [f, sqDist, ellipsePoint]
    fun_prop
  have hanti : StrictAntiOn f (Set.Icc θ₀ θ₁) := by
    apply strictAntiOn_of_deriv_neg (convex_Icc θ₀ θ₁) hc.continuousOn
    intro t ht
    have ht' : t ∈ Set.Ioo θ₀ θ₁ := by
      simpa only [interior_Icc] using ht
    have hneg := (ellipse_short_arc_both_derivatives a b t φ hb hab
      (lt_trans ht'.2 hφ) (by linarith [ht'.1])).2
    exact neg_pos.mp hneg
  exact hanti ⟨le_refl _, le_of_lt hθ⟩
    ⟨le_of_lt hθ, le_refl _⟩ hθ

/-- Exact four-parameter endpoint extension, including either strict
endpoint and both strict endpoints, with no restriction on absolute lifts. -/
theorem sqDist_ellipse_strict_outward (a b θ₀ θ₁ φ₀ φ₁ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hθ : θ₀ ≤ θ₁) (hsep : θ₁ < φ₀) (hφ : φ₀ ≤ φ₁)
    (hchange : θ₀ < θ₁ ∨ φ₀ < φ₁)
    (hshort : φ₁ - θ₀ < lambda a b) :
    sqDist (ellipsePoint a b θ₁) (ellipsePoint a b φ₀) <
      sqDist (ellipsePoint a b θ₀) (ellipsePoint a b φ₁) := by
  have hright : sqDist (ellipsePoint a b θ₁) (ellipsePoint a b φ₀) ≤
      sqDist (ellipsePoint a b θ₁) (ellipsePoint a b φ₁) := by
    rcases eq_or_lt_of_le hφ with heq | hlt
    · rw [heq]
    · exact le_of_lt (sqDist_ellipse_strict_right a b θ₁ φ₀ φ₁
        hb hab hsep hlt (by linarith))
  have hleft : sqDist (ellipsePoint a b θ₁) (ellipsePoint a b φ₁) ≤
      sqDist (ellipsePoint a b θ₀) (ellipsePoint a b φ₁) := by
    rcases eq_or_lt_of_le hθ with heq | hlt
    · rw [heq]
    · exact le_of_lt (sqDist_ellipse_strict_left a b θ₀ θ₁ φ₁
        hb hab hlt (lt_of_lt_of_le hsep hφ) hshort)
  rcases hchange with hs | hs
  · exact lt_of_le_of_lt hright
      (sqDist_ellipse_strict_left a b θ₀ θ₁ φ₁ hb hab
        hs (lt_of_lt_of_le hsep hφ) hshort)
  · exact lt_of_lt_of_le
      (sqDist_ellipse_strict_right a b θ₁ φ₀ φ₁
        hb hab hsep hs (by linarith)) hleft

/-- A proof term for the UNMODIFIED original CLM0102 proposition.
The formalisation gate requires that hosted Lean actually compile this
declaration and print its exact dependencies. -/
theorem clm0102_exact : CLM0102 := by
  unfold CLM0102
  constructor
  · intro a b θ φ hb hab hθφ hshort
    exact ellipse_short_arc_both_derivatives a b θ φ hb hab hθφ hshort
  · intro a b θ₀ θ₁ φ₀ φ₁ hb hab hθ hsep hφ hchange hshort
    exact sqDist_ellipse_strict_outward a b θ₀ θ₁ φ₀ φ₁
      hb hab hθ hsep hφ hchange hshort

end ETSHTS
