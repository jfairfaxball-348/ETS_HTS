import ETSHTS.CyclicGapObstruction

/-!
# S034 — homogeneous rational half-angle ellipse chord formula

For P(t) = (a (1-t^2)/(1+t^2), 2 b t/(1+t^2)), define the
homogeneous numerators X,Y and denominator D. The identity below
is exact for arbitrary real parameters and avoids introducing a
trigonometric order or a false metric-ear selection theorem.
It is algebra, NOT CLM0096/0099/0107/0108.
-/

noncomputable section
namespace ETSHTS

private def s034_X (a t : ℝ) : ℝ := a * (1 - t ^ 2)
private def s034_Y (b t : ℝ) : ℝ := 2 * b * t
private def s034_D (t : ℝ) : ℝ := 1 + t ^ 2

/-- Strictly positive denominator for every finite real half-angle parameter. -/
theorem s034_rational_denominator_positive (t : ℝ) : 0 < s034_D t := by
  dsimp [s034_D]
  positivity

/-- Difference of horizontal coordinate numerators after common denominators. -/
theorem s034_chord_horizontal_numerator (a t u : ℝ) :
    s034_X a t * s034_D u - s034_X a u * s034_D t =
      -2 * a * (t - u) * (t + u) := by
  dsimp [s034_X, s034_D]
  ring

/-- Difference of vertical coordinate numerators after common denominators. -/
theorem s034_chord_vertical_numerator (b t u : ℝ) :
    s034_Y b t * s034_D u - s034_Y b u * s034_D t =
      2 * b * (t - u) * (1 - t * u) := by
  dsimp [s034_Y, s034_D]
  ring

/-- Exact squared Euclidean chord numerator for an arbitrary a,b,t,u.
This is the polynomial form of the rational-ellipse chord formula:
D(t)^2 D(u)^2 |P(t)-P(u)|^2 =
4(t-u)^2 (a^2(t+u)^2 + b^2(1-tu)^2).
The rational-divided equality is not claimed in this lemma. -/
theorem s034_homogeneous_chord_square (a b t u : ℝ) :
    (s034_X a t * s034_D u - s034_X a u * s034_D t) ^ 2 +
      (s034_Y b t * s034_D u - s034_Y b u * s034_D t) ^ 2 =
      4 * (t - u) ^ 2 *
        (a ^ 2 * (t + u) ^ 2 + b ^ 2 * (1 - t * u) ^ 2) := by
  rw [s034_chord_horizontal_numerator, s034_chord_vertical_numerator]
  ring

end ETSHTS
