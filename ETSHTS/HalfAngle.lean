import ETSHTS.Derivatives

/-!
# S029: two independent half-angle derivative factorisations

Every theorem below has an authored proof term. The two endpoint derivatives
are factorised independently, then their positivity is derived CONDITIONAL on
the real half-angle cutoff. The actual cutoff from 0 < φ-θ < lambda a b,
the strict four-parameter extension, and all five exact CLM targets remain open.
-/

noncomputable section
namespace ETSHTS

/-- The exact double half-angle sine identity, for arbitrary real lifts. -/
theorem sin_chord_double_half (θ φ : ℝ) :
    Real.sin (φ - θ) =
      2 * Real.sin ((φ - θ) / 2) * Real.cos ((φ - θ) / 2) := by
  calc
    _ = Real.sin ((φ - θ) / 2 + (φ - θ) / 2) := by congr 1 <;> ring
    _ = _ := by rw [Real.sin_add]; ring

/-- The right-endpoint anisotropy term has its own half-angle factor. -/
theorem sin_chord_right_anisotropy (θ φ : ℝ) :
    Real.sin (θ + φ) - Real.sin (2 * φ) =
      -2 * Real.sin ((φ - θ) / 2) *
        Real.cos ((θ + 3 * φ) / 2) := by
  calc
    _ = Real.sin ((θ + 3 * φ) / 2 - (φ - θ) / 2) -
          Real.sin ((θ + 3 * φ) / 2 + (φ - θ) / 2) := by
            congr 1 <;> congr 1 <;> ring
    _ = _ := by rw [Real.sin_sub, Real.sin_add]; ring

/-- The left-endpoint anisotropy term is a separately proved identity. -/
theorem sin_chord_left_anisotropy (θ φ : ℝ) :
    Real.sin (θ + φ) - Real.sin (2 * θ) =
      2 * Real.sin ((φ - θ) / 2) *
        Real.cos ((3 * θ + φ) / 2) := by
  calc
    _ = Real.sin ((3 * θ + φ) / 2 + (φ - θ) / 2) -
          Real.sin ((3 * θ + φ) / 2 - (φ - θ) / 2) := by
            congr 1 <;> congr 1 <;> ring
    _ = _ := by rw [Real.sin_add, Real.sin_sub]; ring

/-- Independently rewrite the RIGHT derivative as an isotropic sine
plus an anisotropic sine difference; no derivative sign is assumed. -/
theorem deriv_sqDist_ellipse_right_sine (a b θ φ : ℝ) :
    deriv (fun t : ℝ => sqDist (ellipsePoint a b θ) (ellipsePoint a b t)) φ =
      (a ^ 2 + b ^ 2) * Real.sin (φ - θ) +
      (a ^ 2 - b ^ 2) *
        (Real.sin (θ + φ) - Real.sin (2 * φ)) := by
  have htwo : Real.sin (2 * φ) = 2 * Real.sin φ * Real.cos φ := by
    calc
      _ = Real.sin (φ + φ) := by congr 1 <;> ring
      _ = _ := by rw [Real.sin_add]; ring
  rw [deriv_sqDist_ellipse_right, Real.sin_sub, Real.sin_add, htwo]
  ring

/-- Independently rewrite the outward LEFT derivative, without borrowing
a right-motion inequality. -/
theorem neg_deriv_sqDist_ellipse_left_sine (a b θ φ : ℝ) :
    -deriv (fun t : ℝ => sqDist (ellipsePoint a b t) (ellipsePoint a b φ)) θ =
      (a ^ 2 + b ^ 2) * Real.sin (φ - θ) -
      (a ^ 2 - b ^ 2) *
        (Real.sin (θ + φ) - Real.sin (2 * θ)) := by
  have htwo : Real.sin (2 * θ) = 2 * Real.sin θ * Real.cos θ := by
    calc
      _ = Real.sin (θ + θ) := by congr 1 <;> ring
      _ = _ := by rw [Real.sin_add]; ring
  rw [deriv_sqDist_ellipse_left, Real.sin_sub, Real.sin_add, htwo]
  ring

/-- Exact RIGHT factorised derivative: both factors and the phase are
determined by original Euclidean squared-chord data. -/
theorem deriv_sqDist_ellipse_right_factorized (a b θ φ : ℝ) :
    deriv (fun t : ℝ => sqDist (ellipsePoint a b θ) (ellipsePoint a b t)) φ =
      4 * Real.sin ((φ - θ) / 2) *
        (((a ^ 2 + b ^ 2) / 2) * Real.cos ((φ - θ) / 2) -
          ((a ^ 2 - b ^ 2) / 2) * Real.cos ((θ + 3 * φ) / 2)) := by
  rw [deriv_sqDist_ellipse_right_sine,
    sin_chord_double_half, sin_chord_right_anisotropy]
  ring

/-- Exact independent LEFT outward derivative factorisation. -/
theorem neg_deriv_sqDist_ellipse_left_factorized (a b θ φ : ℝ) :
    -deriv (fun t : ℝ => sqDist (ellipsePoint a b t) (ellipsePoint a b φ)) θ =
      4 * Real.sin ((φ - θ) / 2) *
        (((a ^ 2 + b ^ 2) / 2) * Real.cos ((φ - θ) / 2) -
          ((a ^ 2 - b ^ 2) / 2) * Real.cos ((3 * θ + φ) / 2)) := by
  rw [neg_deriv_sqDist_ellipse_left_sine,
    sin_chord_double_half, sin_chord_left_anisotropy]
  ring

/-- Elementary exact anisotropy coefficient inequalities. -/
theorem ellipse_MD_bounds (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) :
    0 < (a ^ 2 + b ^ 2) / 2 ∧ 0 ≤ (a ^ 2 - b ^ 2) / 2 := by
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hprod : 0 ≤ (a - b) * (a + b) :=
    mul_nonneg (sub_nonneg.mpr hab) (le_of_lt (add_pos ha hb))
  constructor
  · have hbsq : 0 < b * b := mul_pos hb hb
    nlinarith [sq_nonneg a]
  · nlinarith

/-- STRICT bracket positivity from the genuine ratio cutoff, for either
independent endpoint phase. This does not assume any unproved ellipse fact. -/
theorem positive_MD_bracket (M D t ψ : ℝ)
    (hM : 0 < M) (hD : 0 ≤ D) (hcut : D / M < Real.cos t) :
    0 < M * Real.cos t - D * Real.cos ψ := by
  have hratio : D < Real.cos t * M := (div_lt_iff₀ hM).mp hcut
  have hnonneg : 0 ≤ D * (1 - Real.cos ψ) :=
    mul_nonneg hD (sub_nonneg.mpr (Real.cos_le_one ψ))
  nlinarith

/-- The RIGHT strict derivative sign follows from precisely the two real
half-angle inequalities still to be derived from the short-arc hypothesis. -/
theorem deriv_sqDist_ellipse_right_pos_of_cutoff (a b θ φ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hs : 0 < Real.sin ((φ - θ) / 2))
    (hc : ((a ^ 2 - b ^ 2) / 2) / ((a ^ 2 + b ^ 2) / 2) <
      Real.cos ((φ - θ) / 2)) :
    0 < deriv (fun t : ℝ =>
      sqDist (ellipsePoint a b θ) (ellipsePoint a b t)) φ := by
  obtain ⟨hM, hD⟩ := ellipse_MD_bounds a b hb hab
  have hbracket := positive_MD_bracket
    ((a ^ 2 + b ^ 2) / 2) ((a ^ 2 - b ^ 2) / 2)
    ((φ - θ) / 2) ((θ + 3 * φ) / 2) hM hD hc
  rw [deriv_sqDist_ellipse_right_factorized]
  exact mul_pos (mul_pos (by norm_num : (4 : ℝ) > 0) hs) hbracket

/-- The LEFT outward strict derivative sign, independently from its own
factorisation, subject to the same explicit cutoff obligations. -/
theorem neg_deriv_sqDist_ellipse_left_pos_of_cutoff (a b θ φ : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hs : 0 < Real.sin ((φ - θ) / 2))
    (hc : ((a ^ 2 - b ^ 2) / 2) / ((a ^ 2 + b ^ 2) / 2) <
      Real.cos ((φ - θ) / 2)) :
    0 < -deriv (fun t : ℝ =>
      sqDist (ellipsePoint a b t) (ellipsePoint a b φ)) θ := by
  obtain ⟨hM, hD⟩ := ellipse_MD_bounds a b hb hab
  have hbracket := positive_MD_bracket
    ((a ^ 2 + b ^ 2) / 2) ((a ^ 2 - b ^ 2) / 2)
    ((φ - θ) / 2) ((3 * θ + φ) / 2) hM hD hc
  rw [neg_deriv_sqDist_ellipse_left_factorized]
  exact mul_pos (mul_pos (by norm_num : (4 : ℝ) > 0) hs) hbracket

end ETSHTS
