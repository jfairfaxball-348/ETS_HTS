import ETSHTS.CyclicEllipseMembership

/-!
# S047 — hull-side exhaustiveness for original convex ellipse sites

The original hullSide predicate cannot admit a third distinct supporting
edge at the same vertex when the finite site set has no collinear triple.
The positive-side existence of both adjacent edges remains to be derived
from the S046 original angular indexing.
-/

noncomputable section
namespace ETSHTS

theorem s047_orientation_reverse_last (v u w : Point) :
    orientation v w u = -orientation v u w := by
  unfold orientation
  ring

/-- Exhaustiveness of the two ORIGINAL hull-side neighbours, without
assuming cyclicNeighbour as an artificial indexing hypothesis. -/
theorem s047_hullSide_at_most_two {S : Finset Point}
    (hno : noThreeCollinear S) {v u w x : Point}
    (hu : hullSide S v u) (hw : hullSide S v w)
    (hx : hullSide S v x) (huw : u ≠ w) :
    x = u ∨ x = w := by
  by_contra hthird
  have hxu : x ≠ u := by
    intro he
    exact hthird (Or.inl he)
  have hxw : x ≠ w := by
    intro he
    exact hthird (Or.inr he)
  have hA : orientation v u w ≠ 0 :=
    hno v hu.1 u hu.2.1 w hw.2.1
      hu.2.2.1 hw.2.2.1 huw
  have hB : orientation v u x ≠ 0 :=
    hno v hu.1 u hu.2.1 x hx.2.1
      hu.2.2.1 hx.2.2.1 hxu.symm
  have hC : orientation v w x ≠ 0 :=
    hno v hw.1 w hw.2.1 x hx.2.1
      hw.2.2.1 hx.2.2.1 hxw.symm
  rcases hu.2.2.2 with huS | huS <;>
    rcases hw.2.2.2 with hwS | hwS <;>
    rcases hx.2.2.2 with hxS | hxS
  all_goals
    have hAu := huS w hw.2.1
    have hBu := huS x hx.2.1
    have hAw := hwS u hu.2.1
    have hCw := hwS x hx.2.1
    have hBx := hxS u hu.2.1
    have hCx := hxS w hw.2.1
    rw [s047_orientation_reverse_last] at hAw hBx hCx
    rcases lt_trichotomy (orientation v u w) 0 with hAn | hAz | hAp
    · rcases lt_trichotomy (orientation v u x) 0 with hBn | hBz | hBp
      · rcases lt_trichotomy (orientation v w x) 0 with hCn | hCz | hCp
        · linarith
        · exact hC hCz
        · linarith
      · exact hB hBz
      · rcases lt_trichotomy (orientation v w x) 0 with hCn | hCz | hCp
        · linarith
        · exact hC hCz
        · linarith
    · exact hA hAz
    · rcases lt_trichotomy (orientation v u x) 0 with hBn | hBz | hBp
      · rcases lt_trichotomy (orientation v w x) 0 with hCn | hCz | hCp
        · linarith
        · exact hC hCz
        · linarith
      · exact hB hBz
      · rcases lt_trichotomy (orientation v w x) 0 with hCn | hCz | hCp
        · linarith
        · exact hC hCz
        · linarith

theorem s047_cyclicNeighbours_of_two_hullSides {S : Finset Point}
    (hno : noThreeCollinear S) {v u w : Point}
    (hu : hullSide S v u) (hw : hullSide S v w)
    (huw : u ≠ w) : cyclicNeighbours S v u w := by
  refine ⟨huw, hu, hw, ?_⟩
  intro x hx hxside
  exact s047_hullSide_at_most_two hno hu hw hxside huw

theorem s047_hullSide_second_mem_erase {S : Finset Point}
    {v u : Point} (hu : hullSide S v u) :
    u ∈ S.erase v := by
  exact Finset.mem_erase.mpr ⟨hu.2.2.1.symm, hu.2.1⟩

end ETSHTS
