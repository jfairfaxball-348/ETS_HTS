module
public import ETSHTS.NecessityInduction

@[expose] public section


/-!
# S044 — genuinely saturated hull sides force the exact last ranked pair

These are geometry-to-history bridges under explicitly displayed
hypotheses: an actual final edge set containing every hull side and the
S043 proven two-edge incidence of the last arrival. No abstract cap or
global two-neighbour existence is asserted by this file.
-/

noncomputable section
namespace ETSHTS

/-- A precise version using the original edge-valued final drawing. -/
theorem s044_forced_last_hull_side
    {S : Finset Point} {final : Finset Edge} {v u w x : Point}
    (hsat : ∀ p q : Point, hullSide S p q → edge p q ∈ final)
    (hinc : ∀ e ∈ final, v ∈ e → e = edge v u ∨ e = edge v w)
    (hside : hullSide S v x) :
    x = u ∨ x = w := by
  have hvx : v ∈ edge v x := by simp [edge]
  have he : edge v x ∈ final := hsat v x hside
  rcases hinc (edge v x) he hvx with h | h
  · have hxmem : x ∈ edge v u := by rw [← h]; simp [edge]
    have hxcase : x = v ∨ x = u := by simpa [edge] using hxmem
    rcases hxcase with heq | heq
    · exact False.elim (hside.2.2.1 heq.symm)
    · exact Or.inl heq
  · have hxmem : x ∈ edge v w := by rw [← h]; simp [edge]
    have hxcase : x = v ∨ x = w := by simpa [edge] using hxmem
    rcases hxcase with heq | heq
    · exact False.elim (hside.2.2.1 heq.symm)
    · exact Or.inr heq

/-- If there are at least two distinct real hull-side neighbours, the
saturated final drawing and genuine last-incidence rule identify them as
the exact compulsory pair, including cyclic uniqueness. -/
theorem s044_cyclic_last_of_saturation_and_two_sides
    {S : Finset Point} {final : Finset Edge} {v u w : Point}
    (hsat : ∀ p q : Point, hullSide S p q → edge p q ∈ final)
    (hinc : ∀ e ∈ final, v ∈ e → e = edge v u ∨ e = edge v w)
    (hnear : exactlyTwoNearest (S.erase v) v u w)
    (htwo : ∃ x y : Point, x ≠ y ∧ hullSide S v x ∧ hullSide S v y) :
    cyclicNeighbours S v u w := by
  obtain ⟨x, y, hxy, hx, hy⟩ := htwo
  have hx' : x = u ∨ x = w :=
    s044_forced_last_hull_side hsat hinc hx
  have hy' : y = u ∨ y = w :=
    s044_forced_last_hull_side hsat hinc hy
  have hboth : hullSide S v u ∧ hullSide S v w := by
    rcases hx' with hxu | hxw
    · rcases hy' with hyu | hyw
      · exact False.elim (hxy (hxu.trans hyu.symm))
      · exact ⟨by simpa [hxu] using hx, by simpa [hyw] using hy⟩
    · rcases hy' with hyu | hyw
      · exact ⟨by simpa [hyu] using hy, by simpa [hxw] using hx⟩
      · exact False.elim (hxy (hxw.trans hyw.symm))
  refine ⟨hnear.2.2.1, hboth.1, hboth.2, ?_⟩
  intro z hz hzside
  exact s044_forced_last_hull_side hsat hinc hzside

end ETSHTS
