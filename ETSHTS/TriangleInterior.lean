import ETSHTS.HullSaturation

/-!
# S042: strict triangle interior cannot cross an opposite side

This is a direct geometric component of the unchanged CLM0096 interior
four-point case. A point strictly inside a nondegenerate triangle is
given by positive barycentric weights. Its spoke to any corner cannot
properly cross the opposite side. It does not claim the entire four-site
planar Grow order has yet been reconstructed.
-/

noncomputable section
namespace ETSHTS

/-- Positive barycentric interpolation preserves the strict signed side
of the opposite segment. Every orientation is the original determinant. -/
theorem s042_barycentric_orientation
    (p q r v : Point) (α β γ : ℝ)
    (hsum : α + β + γ = 1)
    (hv : v = (α * p.1 + β * q.1 + γ * r.1,
               α * p.2 + β * q.2 + γ * r.2)) :
    orientation q r v = α * orientation q r p := by
  have hα : α = 1 - β - γ := by linarith
  rw [hv]
  unfold orientation
  dsimp
  rw [hα]
  ring

/-- The strict triangle interior spoke v--p stays on the correct side
of the opposite side q--r, independent of any Euclidean distances. -/
theorem s042_barycentric_spoke_no_cross
    (p q r v : Point) (α β γ : ℝ)
    (hα : 0 < α)
    (hsum : α + β + γ = 1)
    (hv : v = (α * p.1 + β * q.1 + γ * r.1,
               α * p.2 + β * q.2 + γ * r.2))
    (hnon : orientation q r p ≠ 0) :
    ¬ properCross v p q r := by
  have heq := s042_barycentric_orientation p q r v α β γ hsum hv
  have hsafe : ¬ properCross q r v p := by
    apply s042_no_properCross_of_same_strict_side
    rcases lt_trichotomy (orientation q r p) 0 with hneg | hz | hpos
    · exact Or.inr ⟨by rw [heq]; exact mul_neg_of_pos_of_neg hα hneg,
        hneg⟩
    · exact (hnon hz).elim
    · exact Or.inl ⟨by rw [heq]; exact mul_pos hα hpos, hpos⟩
  intro h
  exact hsafe (s042_properCross_swap h)

/-- All three interior spokes avoid the respective opposite sides.
This directly addresses the non-convex four-site branch of CLM0096;
combining them into a full mandatory-nearest planar order is separate. -/
theorem s042_barycentric_three_spokes_safe
    (p q r v : Point) (α β γ : ℝ)
    (hα : 0 < α) (hβ : 0 < β) (hγ : 0 < γ)
    (hsum : α + β + γ = 1)
    (hv : v = (α * p.1 + β * q.1 + γ * r.1,
               α * p.2 + β * q.2 + γ * r.2))
    (hnp : orientation q r p ≠ 0)
    (hnq : orientation r p q ≠ 0)
    (hnr : orientation p q r ≠ 0) :
    ¬ properCross v p q r ∧
      ¬ properCross v q r p ∧
      ¬ properCross v r p q := by
  have hvq :
      v = (β * q.1 + γ * r.1 + α * p.1,
           β * q.2 + γ * r.2 + α * p.2) := by
    rw [hv]
    congr 1 <;> ring
  have hvr :
      v = (γ * r.1 + α * p.1 + β * q.1,
           γ * r.2 + α * p.2 + β * q.2) := by
    rw [hv]
    congr 1 <;> ring
  constructor
  · exact s042_barycentric_spoke_no_cross p q r v α β γ
      hα hsum hv hnp
  constructor
  · exact s042_barycentric_spoke_no_cross q r p v β γ α
      hβ (by linarith) hvq hnq
  · exact s042_barycentric_spoke_no_cross r p q v γ α β
      hγ (by linarith) hvr hnr

end ETSHTS
