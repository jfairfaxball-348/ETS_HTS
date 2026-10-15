import ETSHTS.CentralRatio

/-!
# S037 — strict convexity of arbitrary finite ellipse-boundary sets

These are unconditional geometric lemmas about the ORIGINAL positive-axis
ellipse in ETSHTS.Definitions. They do not change a target, assume generic
angular spacing, or assert that the metric-ear recursion is already proven.
-/

noncomputable section
namespace ETSHTS

/-- All ellipse boundary points satisfy the same weighted quadratic equation.
No angular-parameter injectivity or separation assumption is required. -/
theorem s037_ellipse_boundary_weighted_norm (a b : ℝ) (p : Point)
    (hp : ellipseBoundary a b p) :
    b ^ 2 * p.1 ^ 2 + a ^ 2 * p.2 ^ 2 = a ^ 2 * b ^ 2 := by
  obtain ⟨θ, rfl⟩ := hp
  change b ^ 2 * (a * Real.cos θ) ^ 2 +
    a ^ 2 * (b * Real.sin θ) ^ 2 = a ^ 2 * b ^ 2
  have htrig : Real.cos θ ^ 2 + Real.sin θ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq θ]
  calc
    b ^ 2 * (a * Real.cos θ) ^ 2 +
      a ^ 2 * (b * Real.sin θ) ^ 2 =
        (a ^ 2 * b ^ 2) * (Real.cos θ ^ 2 + Real.sin θ ^ 2) := by ring
    _ = a ^ 2 * b ^ 2 := by rw [htrig]; ring

/-- Positivity of the weighted squared separation of any distinct sites. -/
theorem s037_weighted_sqDist_pos
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (p q : Point) (hpq : p ≠ q) :
    0 < b ^ 2 * (p.1 - q.1) ^ 2 +
      a ^ 2 * (p.2 - q.2) ^ 2 := by
  have hcoord : p.1 ≠ q.1 ∨ p.2 ≠ q.2 := by
    by_contra h
    push_neg at h
    exact hpq (Prod.ext h.1 h.2)
  rcases hcoord with hx | hy
  · have hsq : 0 < (p.1 - q.1) ^ 2 :=
      sq_pos_of_ne_zero (sub_ne_zero.mpr hx)
    exact add_pos_of_pos_of_nonneg
      (mul_pos (sq_pos_of_pos hb) hsq)
      (mul_nonneg (sq_nonneg a) (sq_nonneg _))
  · have hsq : 0 < (p.2 - q.2) ^ 2 :=
      sq_pos_of_ne_zero (sub_ne_zero.mpr hy)
    exact add_pos_of_nonneg_of_pos
      (mul_nonneg (sq_nonneg b) (sq_nonneg _))
      (mul_pos (sq_pos_of_pos ha) hsq)

/-- The supporting tangent functional at p strictly exposes p amongst
every other site q of the ellipse, with no excluded ties or cardinality. -/
theorem s037_ellipse_strict_support
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (p q : Point)
    (hp : ellipseBoundary a b p)
    (hq : ellipseBoundary a b q)
    (hpq : p ≠ q) :
    (p.1 * b ^ 2) * q.1 + (p.2 * a ^ 2) * q.2 <
      (p.1 * b ^ 2) * p.1 + (p.2 * a ^ 2) * p.2 := by
  have hpn := s037_ellipse_boundary_weighted_norm a b p hp
  have hqn := s037_ellipse_boundary_weighted_norm a b q hq
  have hpos := s037_weighted_sqDist_pos a b ha hb p q hpq
  nlinarith [hpn, hqn, hpos]

/-- Genuine strict convex position in the EXISTING exact target's predicate:
every point of any finite positive-axis ellipse boundary set is uniquely
exposed by a real linear functional, regardless of n or closeness. -/
theorem s037_ellipse_strictConvexPosition
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (S : Finset Point)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    strictConvexPosition S := by
  intro v hv
  refine ⟨v.1 * b ^ 2, v.2 * a ^ 2, ?_⟩
  intro w hw hwv
  exact s037_ellipse_strict_support a b ha hb v w
    (hboundary v hv) (hboundary w hw) hwv.symm

end ETSHTS
