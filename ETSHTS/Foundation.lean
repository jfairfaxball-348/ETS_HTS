module
public import ETSHTS.Definitions

@[expose] public section


/-!
# First low-level theorems

Only the declarations proved here can claim kernel-level proof AFTER a compiler run.
S025 has no local Lean toolchain; these sources remain uncompiled until hosted CI.
-/

noncomputable section
namespace ETSHTS

theorem sqDist_self (p : Point) : sqDist p p = 0 := by
  simp [sqDist]

theorem sqDist_nonneg (p q : Point) : 0 ≤ sqDist p q := by
  unfold sqDist
  positivity

theorem sqDist_symm (p q : Point) : sqDist p q = sqDist q p := by
  unfold sqDist
  ring

theorem priority_of_strict_distance {v u x : Point}
    (h : sqDist v u < sqDist v x) : priority v u x :=
  Or.inl h

/--
Strictly nearer two selected predecessors beat every other predecessor,
including under the EXACT Cartesian lexicographic tie-breaking rule.
-/
theorem exactlyTwoNearest_of_strict_gap
    {previous : Finset Point} {v u w : Point}
    (hu : u ∈ previous) (hw : w ∈ previous) (huw : u ≠ w)
    (hgap : ∀ x ∈ previous, x ≠ u → x ≠ w →
      sqDist v u < sqDist v x ∧ sqDist v w < sqDist v x) :
    exactlyTwoNearest previous v u w := by
  refine ⟨hu, hw, huw, ?_⟩
  intro x hx hxu hxw
  obtain ⟨hux, hwx⟩ := hgap x hx hxu hxw
  exact ⟨Or.inl hux, Or.inl hwx⟩

end ETSHTS
