import ETSHTS.ThreePredecessors

/-!
# S033: arithmetic guardrail for the cyclic minimum-two-gap approach

The finite averaging lemma is *conditional* on the cyclic sum = 4*pi
and on the selected index being a minimum. It does NOT assert that a
minimum two-gap site is an actual Euclidean metric ear. The two exact
rational distances below exhibit the obstruction to that inference on
the 101/100 ellipse; cyclic ordering is proved in the mathematics file
and is not falsely advertised as a Lean theorem here.
-/

noncomputable section
namespace ETSHTS

theorem s033_cyclic_min_two_gap_average (n : ℕ) (hn : 0 < n)
    (T : Fin n → ℝ) (hsum : (∑ j : Fin n, T j) = 4 * Real.pi)
    (i : Fin n) (hmin : ∀ j : Fin n, T i ≤ T j) :
    T i ≤ 4 * Real.pi / (n : ℝ) := by
  have hs : (∑ j : Fin n, T i) ≤ (∑ j : Fin n, T j) := by
    exact Finset.sum_le_sum (by
      intro j hj
      exact hmin j)
  have hcount : (∑ _j : Fin n, T i) = (n : ℝ) * T i := by
    simp [mul_comm]
  rw [hcount, hsum] at hs
  have hnreal : (0 : ℝ) < (n : ℝ) := by exact_mod_cast hn
  apply (le_div_iff₀ hnreal).2
  nlinarith [hs]

private def s033_v : Point := (-(1313 : ℝ) / 1940, (72 : ℝ) / 97)
private def s033_u : Point := ((101 : ℝ) / 125, (3 : ℝ) / 5)
private def s033_x : Point := (-(1313 : ℝ) / 1940, -(72 : ℝ) / 97)

/-- Exact squared-distance reversal for rational sites P(9/4),
P(1/3), P(-9/4) on the ellipse of semiaxes 101/100 and 1. -/
theorem s033_distance_reversal :
    sqDist s033_v s033_u - sqDist s033_v s033_x =
      (49482169 : ℝ) / 2352250000 := by
  norm_num [sqDist, s033_v, s033_u, s033_x]

theorem s033_nonadjacent_strictly_closer :
    sqDist s033_v s033_x < sqDist s033_v s033_u := by
  have hgap : (0 : ℝ) < (49482169 : ℝ) / 2352250000 := by
    norm_num
  linarith [s033_distance_reversal]

end ETSHTS
