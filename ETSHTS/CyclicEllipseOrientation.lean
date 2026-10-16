module
public import ETSHTS.CyclicEllipseIncident

@[expose] public section


/-!
# S047 — positive orientation of true short-of-one-turn ordered ellipse arcs

Exact orientation of arbitrary original ellipse sites is reduced to three
positive half-angle sines. This is the analytic C1 input for showing
consecutive actual phase-indexed sites are genuine supporting hull sides.
No angular gap lower bound, special angle choice or circle replacement.
-/

noncomputable section
namespace ETSHTS

theorem s047_orientation_ellipse_sine_identity
    (a b α β γ : ℝ) :
    orientation (ellipsePoint a b α) (ellipsePoint a b β)
        (ellipsePoint a b γ) =
      a * b * (Real.sin (γ - β) + Real.sin (β - α) -
        Real.sin (γ - α)) := by
  unfold orientation ellipsePoint
  rw [Real.sin_sub, Real.sin_sub, Real.sin_sub]
  ring

/-- The exact ordered-angle area identity, without any approximation. -/
theorem s047_sine_triangle_factor (α β γ : ℝ) :
    Real.sin (γ - β) + Real.sin (β - α) -
      Real.sin (γ - α) =
    4 * Real.sin ((β - α) / 2) *
        Real.sin ((γ - β) / 2) *
        Real.sin ((γ - α) / 2) := by
  let x : ℝ := (β - α) / 2
  let y : ℝ := (γ - β) / 2
  have hx : β - α = 2 * x := by dsimp [x]; ring
  have hy : γ - β = 2 * y := by dsimp [y]; ring
  have hxy : γ - α = 2 * (x + y) := by dsimp [x,y]; ring
  have hmid : (γ - α) / 2 = x + y := by dsimp [x,y]; ring
  have hunitx : Real.sin x ^ 2 + Real.cos x ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq x]
  have hunity : Real.sin y ^ 2 + Real.cos y ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq y]
  have hz1 :
      (Real.sin x ^ 2 + Real.cos x ^ 2 - 1) *
        (2 * Real.sin y * Real.cos y) = 0 := by rw [sub_eq_zero.mpr hunitx]; ring
  have hz2 :
      (Real.sin y ^ 2 + Real.cos y ^ 2 - 1) *
        (2 * Real.sin x * Real.cos x) = 0 := by rw [sub_eq_zero.mpr hunity]; ring
  rw [hmid, hx, hy, hxy]
  have hhalfx : (2 * x) / 2 = x := by ring
  have hhalfy : (2 * y) / 2 = y := by ring
  rw [hhalfx, hhalfy]
  rw [Real.sin_two_mul, Real.sin_two_mul, Real.sin_two_mul]
  rw [Real.sin_add, Real.cos_add]
  nlinarith [hz1, hz2]

/-- Any three original ellipse points in strictly increasing real-angle
order inside a single full turn have positive Cartesian orientation.
This includes arbitrarily close, near-seam and antipodal triples. -/
theorem s047_ellipse_ordered_orientation_pos
    (a b α β γ : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hab : α < β) (hbc : β < γ)
    (hfull : γ < α + 2 * Real.pi) :
    0 < orientation (ellipsePoint a b α)
      (ellipsePoint a b β) (ellipsePoint a b γ) := by
  have hpi : 0 < Real.pi := Real.pi_pos
  have hαβ : 0 < (β - α) / 2 ∧ (β - α) / 2 < Real.pi := by
    constructor <;> linarith
  have hβγ : 0 < (γ - β) / 2 ∧ (γ - β) / 2 < Real.pi := by
    constructor <;> linarith
  have hαγ : 0 < (γ - α) / 2 ∧ (γ - α) / 2 < Real.pi := by
    constructor <;> linarith
  have hx : 0 < Real.sin ((β - α) / 2) :=
    Real.sin_pos_of_pos_of_lt_pi hαβ.1 hαβ.2
  have hy : 0 < Real.sin ((γ - β) / 2) :=
    Real.sin_pos_of_pos_of_lt_pi hβγ.1 hβγ.2
  have hz : 0 < Real.sin ((γ - α) / 2) :=
    Real.sin_pos_of_pos_of_lt_pi hαγ.1 hαγ.2
  rw [s047_orientation_ellipse_sine_identity,
      s047_sine_triangle_factor]
  positivity

end ETSHTS
