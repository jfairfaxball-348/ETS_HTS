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

/-- With exactly one negative barycentric coefficient in this orientation,
the opposite original seed edge and the new opposite segment cross
PROPERLY. The witness is explicit, with both parameters strictly inside. -/
theorem s042_one_negative_barycentric_cross
    (p q r v : Point) (α β γ : ℝ)
    (hα : 0 < α) (hβ : 0 < β) (hγ : γ < 0)
    (hsum : α + β + γ = 1)
    (hv : v = (α * p.1 + β * q.1 + γ * r.1,
               α * p.2 + β * q.2 + γ * r.2)) :
    properCross p q r v := by
  let den : ℝ := α + β
  have hden : 1 < den := by
    dsimp [den]
    linarith
  have hdenpos : 0 < den := by linarith
  have hdenne : den ≠ 0 := ne_of_gt hdenpos
  have hγ' : γ = 1 - α - β := by linarith
  have ht0 : 0 < β / den := div_pos hβ hdenpos
  have ht1 : β / den < 1 :=
    (div_lt_one hdenpos).2 (by dsimp [den]; linarith)
  have hs0 : 0 < (1 : ℝ) / den := div_pos (by norm_num) hdenpos
  have hs1 : (1 : ℝ) / den < 1 := (div_lt_one hdenpos).2 hden
  let o : Point :=
    ((1 - β / den) * p.1 + (β / den) * q.1,
     (1 - β / den) * p.2 + (β / den) * q.2)
  refine ⟨o, ⟨β / den, ht0, ht1, rfl⟩,
    ⟨(1 : ℝ) / den, hs0, hs1, ?_⟩⟩
  apply Prod.ext
  · change (1 - β / den) * p.1 + β / den * q.1 =
      (1 - 1 / den) * r.1 + 1 / den * v.1
    rw [hv]
    simp only [Prod.fst]
    rw [hγ']
    field_simp [hdenne]
    dsimp [den]
    ring
  · change (1 - β / den) * p.2 + β / den * q.2 =
      (1 - 1 / den) * r.2 + 1 / den * v.2
    rw [hv]
    simp only [Prod.snd]
    rw [hγ']
    field_simp [hdenne]
    dsimp [den]
    ring

end ETSHTS
