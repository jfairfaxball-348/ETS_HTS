module
public import ETSHTS.ConvexFourExact

@[expose] public section


/-!
# S042 continued — exact compulsory planar order for crossed quadrilaterals

This derives a full original planeNearestTwoOrder certificate for any four
distinct noncollinear sites with opposite diagonals properly crossing.
No arbitrary nearest-neighbour choice, no lex tie relaxation and no
assumed planarity of the last insertion.
-/

noncomputable section
namespace ETSHTS

theorem s042_crossing_four_exact_order
    (a b c d o : Point)
    (hno : noThreeCollinear ({a, b, c, d} : Finset Point))
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcrossAC : openSegment a c o)
    (hcrossBD : openSegment b d o) :
    planeNearestTwoOrder ({a, b, c, d} : Finset Point) := by
  let S : Finset Point := {a, b, c, d}
  obtain ⟨v, hear⟩ := s042_crossing_four_has_metricEar
    a b c d o hno hab hac had hbc hbd hcd hcrossAC hcrossBD
  have hcard : S.card = 4 := by
    simp [S, hab, hac, had, hbc, hbd, hcd,
      hab.symm, hac.symm, had.symm, hbc.symm, hbd.symm, hcd.symm]
  have hthree : (S.erase v).card = 3 := by
    have hv : v ∈ S := hear.1
    rw [Finset.card_erase_of_mem hv]
    omega
  exact s042_planeOrder_extend_metricEar
    (clm0096_card_three (S.erase v) hthree) hno hear

end ETSHTS
