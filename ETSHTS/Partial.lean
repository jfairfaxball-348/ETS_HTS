import ETSHTS.Targets

/-!
# S026 verified-proof candidates

All declarations below have proof terms. They are deliberately *not* asserted
to be the five target CLM theorems. The closed-threshold all-n theorem and
four-point/ear-equivalence/derivative lemmas remain separate obligations.
-/

noncomputable section
namespace ETSHTS

/-- The three seed edges have no disjoint pair, hence are plane
under the repository's exact proper-crossing definition. -/
theorem planeEdges_triangle (p q r : Point) :
    planeEdges (triangleEdges p q r) := by
  intro e₁ he₁ e₂ he₂ hdisj
  simp only [triangleEdges, Finset.mem_insert, Finset.mem_singleton] at he₁ he₂
  rcases he₁ with h₁ | h₁ | h₁ <;>
    rcases he₂ with h₂ | h₂ | h₂ <;>
    rw [h₁, h₂] at hdisj <;>
    simp [edge, Finset.disjoint_left] at hdisj

/-- An actual retained-nearest-two order exists for every three distinct
points: the entire set is the initial triangle; no insertion is needed. -/
theorem planeNearestTwoOrder_triangle (p q r : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) :
    planeNearestTwoOrder ({p, q, r} : Finset Point) := by
  refine ⟨p, q, r, [], triangleEdges p q r,
    hpq, hpr, hqr, ?_, ?_, ?_, planeEdges_triangle p q r⟩
  · simp [List.nodup_cons, hpq, hpr, hqr]
  · simp
  · exact Grow.finish [p, q, r] (triangleEdges p q r)

/-- The full three-point slice of CLM0096; no collinearity assumption is needed. -/
theorem clm0096_card_three (S : Finset Point) (hcard : S.card = 3) :
    planeNearestTwoOrder S := by
  obtain ⟨p, q, r, hpq, hpr, hqr, rfl⟩ :=
    Finset.card_eq_three.mp hcard
  exact planeNearestTwoOrder_triangle p q r hpq hpr hqr

/-- Direct base constructor of the *full* recursive deletion certificate. -/
theorem fullEarCertificate_of_card_three (S : Finset Point)
    (hcard : S.card = 3) : FullEarCertificate S :=
  FullEarCertificate.base S hcard

/-- Analytic identity, at the level of squared Euclidean chord distance. -/
theorem sqDist_ellipsePoint_expand (a b θ φ : ℝ) :
    sqDist (ellipsePoint a b θ) (ellipsePoint a b φ) =
      a ^ 2 * (Real.cos θ - Real.cos φ) ^ 2 +
      b ^ 2 * (Real.sin θ - Real.sin φ) ^ 2 := by
  dsimp [sqDist, ellipsePoint]
  ring

/-- A strict distance separation certificate defeats every lexicographic tie
and supplies an exact metric ear when the two sites are hull neighbours. -/
theorem metricEar_of_strict_gap
    {S : Finset Point} {v u w : Point}
    (hv : v ∈ S) (hneighbours : cyclicNeighbours S v u w)
    (hu : u ∈ S.erase v) (hw : w ∈ S.erase v)
    (hgap : ∀ x ∈ S.erase v, x ≠ u → x ≠ w →
      sqDist v u < sqDist v x ∧ sqDist v w < sqDist v x) :
    metricEar S v := by
  exact ⟨hv, u, w, hneighbours,
    exactlyTwoNearest_of_strict_gap hu hw hneighbours.1 hgap⟩

/-- This is the genuine all-n corollary-reduction: a complete proof of
CLM0107 and the exact rational-vs-R bound imply CLM0108 without any
new restriction on finite sets, cardinalities, or tie-breaking. -/
theorem clm0108_of_clm0107_and_ratio
    (hmain : CLM0107) (hratio : (101 : ℝ) / 100 ≤ R) :
    CLM0108 := by
  constructor
  · norm_num
  · intro S hcard hboundary
    have hbound : ((101 : ℝ) / 100) / 1 ≤ R := by
      simpa using hratio
    exact hmain ((101 : ℝ) / 100) 1 (by norm_num) (by norm_num)
      hbound S hcard hboundary

end ETSHTS
