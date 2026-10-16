module
public import ETSHTS.Partial

@[expose] public section


/-!
# S027: exact ellipse chord algebra and anisotropic distance bounds

All results are concrete unconditional Lean proof candidates under the unchanged
definitions in ETSHTS.Definitions, at the *original* Cartesian squared distance.
They are not claims of CLM0096/0099/0102/0107/0108.

For a ≥ b ≥ 0, the ellipse chord squared length lies between b² and a²
times the corresponding unit-circle chord squared length.
-/

noncomputable section
namespace ETSHTS

/-- Dilation by c multiplies the squared Euclidean ellipse chord by c². -/
theorem sqDist_ellipse_scale (a b c θ φ : ℝ) :
    sqDist (ellipsePoint (c * a) (c * b) θ)
      (ellipsePoint (c * a) (c * b) φ) =
    c ^ 2 * sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) := by
  simp only [sqDist_ellipsePoint_expand]
  ring

/-- Exact decomposition into an isotropic circular term and anisotropic
horizontal correction, with no approximations. -/
theorem sqDist_ellipse_as_circle_plus (a b θ φ : ℝ) :
    sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) =
    b ^ 2 * sqDist (ellipsePoint 1 1 θ) (ellipsePoint 1 1 φ) +
      (a ^ 2 - b ^ 2) * (Real.cos θ - Real.cos φ) ^ 2 := by
  simp only [sqDist_ellipsePoint_expand, one_pow, one_mul]
  ring

/-- Symmetric exact decomposition: the anisotropic correction is removed
from the larger circular upper estimate. -/
theorem sqDist_ellipse_as_circle_minus (a b θ φ : ℝ) :
    sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) =
    a ^ 2 * sqDist (ellipsePoint 1 1 θ) (ellipsePoint 1 1 φ) -
      (a ^ 2 - b ^ 2) * (Real.sin θ - Real.sin φ) ^ 2 := by
  simp only [sqDist_ellipsePoint_expand, one_pow, one_mul]
  ring

/-- Uniform all-arc squared-chord sandwich. This is the exact
circle-comparison step needed for CLM0107's central-distance floor;
the remaining sine-angle, threshold and ear-selection steps are open. -/
theorem sqDist_ellipse_between_circular_bounds (a b θ φ : ℝ)
    (hb : 0 ≤ b) (hab : b ≤ a) :
    b ^ 2 * sqDist (ellipsePoint 1 1 θ) (ellipsePoint 1 1 φ) ≤
      sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) ∧
    sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) ≤
      a ^ 2 * sqDist (ellipsePoint 1 1 θ) (ellipsePoint 1 1 φ) := by
  have hsq : 0 ≤ a ^ 2 - b ^ 2 := by
    have hsub : 0 ≤ a - b := by linarith
    have hadd : 0 ≤ a + b := by linarith
    nlinarith [mul_nonneg hsub hadd]
  constructor
  · rw [sqDist_ellipse_as_circle_plus a b θ φ]
    nlinarith [mul_nonneg hsq (sq_nonneg (Real.cos θ - Real.cos φ))]
  · rw [sqDist_ellipse_as_circle_minus a b θ φ]
    nlinarith [mul_nonneg hsq (sq_nonneg (Real.sin θ - Real.sin φ))]

end ETSHTS
