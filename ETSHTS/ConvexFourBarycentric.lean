import ETSHTS.ConvexFourOrder

/-!
# S042 continuation — exact affine barycentric bridge for four-site classification

A noncollinear seed triangle provides real barycentric coordinates for
EVERY fourth site. The coefficients are explicit signed orientation ratios,
so their signs can drive the remaining exhaustive interior-versus-crossing
classification without replacing the original coordinate geometry.
-/

noncomputable section
namespace ETSHTS

/-- Exact signed-area barycentric coordinates of an arbitrary fourth site
relative to a noncollinear triangle. Both Cartesian coordinate identities
and all three signed-orientation identities hold without side assumptions. -/
theorem s042_four_barycentric_orientation
    (p q r v : Point) (hD : orientation p q r ≠ 0) :
    ∃ α β γ : ℝ,
      α + β + γ = 1 ∧
      v = (α * p.1 + β * q.1 + γ * r.1,
           α * p.2 + β * q.2 + γ * r.2) ∧
      α * orientation p q r = orientation q r v ∧
      β * orientation p q r = orientation r p v ∧
      γ * orientation p q r = orientation p q v := by
  let D : ℝ := orientation p q r
  let A : ℝ := orientation q r v
  let B : ℝ := orientation r p v
  let C : ℝ := orientation p q v
  have hD0 : D ≠ 0 := hD
  have hsum : A + B + C = D := by
    dsimp [A, B, C, D, orientation]
    ring
  refine ⟨A / D, B / D, C / D, ?_, ?_, ?_, ?_, ?_⟩
  · calc
      A / D + B / D + C / D = (A + B + C) / D := by ring
      _ = D / D := by rw [hsum]
      _ = 1 := div_self hD0
  · apply Prod.ext
    · change v.1 = A / D * p.1 + B / D * q.1 + C / D * r.1
      field_simp [hD0]
      dsimp [A, B, C, D, orientation]
      ring
    · change v.2 = A / D * p.2 + B / D * q.2 + C / D * r.2
      field_simp [hD0]
      dsimp [A, B, C, D, orientation]
      ring
  · change A / D * D = A
    field_simp [hD0]
  · change B / D * D = B
    field_simp [hD0]
  · change C / D * D = C
    field_simp [hD0]

end ETSHTS
