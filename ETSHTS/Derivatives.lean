module
public import ETSHTS.AnalyticBounds

@[expose] public section


/-!
# S028 — independently differentiated ellipse chords

The two endpoint derivatives are derived by distinct HasDerivAt calculations
with the opposite endpoint held fixed. They are unconditional identities, not
positivity assertions. CLM0102 also requires strict signs throughout its
exact short-arc range and a four-parameter strict extension; both remain open.

The circle identity is an exact prerequisite for the central chord floor.
-/

noncomputable section
namespace ETSHTS

/-- Independently differentiate the right endpoint of the original squared
Euclidean ellipse chord, keeping the left endpoint fixed. -/
theorem hasDerivAt_sqDist_ellipse_right (a b θ φ : ℝ) :
    HasDerivAt (fun t : ℝ =>
      sqDist (ellipsePoint a b θ) (ellipsePoint a b t))
      (2 * a ^ 2 * (Real.cos θ - Real.cos φ) * Real.sin φ -
       2 * b ^ 2 * (Real.sin θ - Real.sin φ) * Real.cos φ) φ := by
  have hc : HasDerivAt (fun t : ℝ => Real.cos θ - Real.cos t)
      (Real.sin φ) φ := by
    convert (hasDerivAt_const φ (Real.cos θ)).sub (Real.hasDerivAt_cos φ) using 1 <;> ring
  have hs : HasDerivAt (fun t : ℝ => Real.sin θ - Real.sin t)
      (-Real.cos φ) φ := by
    convert (hasDerivAt_const φ (Real.sin θ)).sub (Real.hasDerivAt_sin φ) using 1 <;> ring
  have h := (HasDerivAt.const_mul (a ^ 2) (hc.pow 2)).add
    (HasDerivAt.const_mul (b ^ 2) (hs.pow 2))
  convert h using 1
  · funext t
    exact sqDist_ellipsePoint_expand a b θ t
  · ring

/-- Independently differentiate the left endpoint, keeping the right fixed.
This is NOT obtained by assuming outward derivative symmetry. -/
theorem hasDerivAt_sqDist_ellipse_left (a b θ φ : ℝ) :
    HasDerivAt (fun t : ℝ =>
      sqDist (ellipsePoint a b t) (ellipsePoint a b φ))
      (-2 * a ^ 2 * (Real.cos θ - Real.cos φ) * Real.sin θ +
        2 * b ^ 2 * (Real.sin θ - Real.sin φ) * Real.cos θ) θ := by
  have hc : HasDerivAt (fun t : ℝ => Real.cos t - Real.cos φ)
      (-Real.sin θ) θ := by
    convert (Real.hasDerivAt_cos θ).sub (hasDerivAt_const θ (Real.cos φ)) using 1 <;> ring
  have hs : HasDerivAt (fun t : ℝ => Real.sin t - Real.sin φ)
      (Real.cos θ) θ := by
    convert (Real.hasDerivAt_sin θ).sub (hasDerivAt_const θ (Real.sin φ)) using 1 <;> ring
  have h := (HasDerivAt.const_mul (a ^ 2) (hc.pow 2)).add
    (HasDerivAt.const_mul (b ^ 2) (hs.pow 2))
  convert h using 1
  · funext t
    exact sqDist_ellipsePoint_expand a b t φ
  · ring

/-- Exact right-endpoint derivative, with no angle or axis restrictions. -/
theorem deriv_sqDist_ellipse_right (a b θ φ : ℝ) :
    deriv (fun t : ℝ => sqDist (ellipsePoint a b θ) (ellipsePoint a b t)) φ =
      2 * a ^ 2 * (Real.cos θ - Real.cos φ) * Real.sin φ -
      2 * b ^ 2 * (Real.sin θ - Real.sin φ) * Real.cos φ :=
  (hasDerivAt_sqDist_ellipse_right a b θ φ).deriv

/-- Exact left-endpoint derivative, proven independently. -/
theorem deriv_sqDist_ellipse_left (a b θ φ : ℝ) :
    deriv (fun t : ℝ => sqDist (ellipsePoint a b t) (ellipsePoint a b φ)) θ =
      -2 * a ^ 2 * (Real.cos θ - Real.cos φ) * Real.sin θ +
       2 * b ^ 2 * (Real.sin θ - Real.sin φ) * Real.cos θ :=
  (hasDerivAt_sqDist_ellipse_left a b θ φ).deriv

/-- Circle chord squared-length identity at arbitrary real angles. -/
theorem sqDist_unit_circle_cos_sub (θ φ : ℝ) :
    sqDist (ellipsePoint 1 1 θ) (ellipsePoint 1 1 φ) =
      2 - 2 * Real.cos (θ - φ) := by
  rw [sqDist_ellipsePoint_expand]
  simp only [one_pow, one_mul]
  rw [Real.cos_sub]
  nlinarith [Real.sin_sq_add_cos_sq θ, Real.sin_sq_add_cos_sq φ]

end ETSHTS
