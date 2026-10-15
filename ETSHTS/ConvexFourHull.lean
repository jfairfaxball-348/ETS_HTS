import ETSHTS.ConvexFourGeometry

/-!
# S042 continued — four true supporting sides from crossing diagonals

This is the original hullSide predicate. The four points form the entire
site set; no assumption about which edges are already included in a graph.
-/

noncomputable section
namespace ETSHTS

theorem s042_hullSide_first_of_crossing
    (a b c d o : Point)
    (hno : noThreeCollinear ({a, b, c, d} : Finset Point))
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hacross : openSegment a c o)
    (hbdcross : openSegment b d o) :
    hullSide ({a, b, c, d} : Finset Point) a b := by
  obtain ⟨t, ht0, _, ht⟩ := hacross
  obtain ⟨u, hu0, _, hu⟩ := hbdcross
  have hco : orientation a b o = t * orientation a b c := by
    have hh := s042_orientation_affine_segment a b a c o t ht
    simpa [orientation] using hh
  have hdo : orientation a b o = u * orientation a b d := by
    have hh := s042_orientation_affine_segment a b b d o u hu
    simpa [orientation] using hh
  have hnon : orientation a b c ≠ 0 :=
    hno a (by simp) b (by simp) c (by simp) hab hac hbc
  have hsign :
      (0 < orientation a b c ∧ 0 < orientation a b d) ∨
      (orientation a b c < 0 ∧ orientation a b d < 0) := by
    rcases lt_trichotomy (orientation a b c) 0 with hn | he | hp
    · have hto : t * orientation a b c < 0 := mul_neg_of_pos_of_neg ht0 hn
      have hother : orientation a b d < 0 := by
        by_contra h
        have hzero : 0 ≤ orientation a b d := le_of_not_gt h
        have hmul := mul_nonneg (le_of_lt hu0) hzero
        linarith
      exact Or.inr ⟨hn, hother⟩
    · exact (hnon he).elim
    · have hto : 0 < t * orientation a b c := mul_pos ht0 hp
      have hother : 0 < orientation a b d := by
        by_contra h
        have hzero : orientation a b d ≤ 0 := le_of_not_gt h
        have hmul := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hu0) hzero
        linarith
      exact Or.inl ⟨hp, hother⟩
  refine ⟨by simp, by simp, hab, ?_⟩
  rcases hsign with hpos | hneg
  · left
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · simp [orientation]
    · simp [orientation]
    · exact le_of_lt hpos.1
    · exact le_of_lt hpos.2
  · right
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · simp [orientation]
    · simp [orientation]
    · exact le_of_lt hneg.1
    · exact le_of_lt hneg.2

/-- All four true hull sides, obtained by cyclically rotating the
crossed diagonals and their strict interior witnesses. -/
theorem s042_four_hullSides_of_crossing
    (a b c d o : Point)
    (hno : noThreeCollinear ({a, b, c, d} : Finset Point))
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcrossAC : openSegment a c o)
    (hcrossBD : openSegment b d o) :
    hullSide ({a, b, c, d} : Finset Point) a b ∧
      hullSide ({a, b, c, d} : Finset Point) b c ∧
      hullSide ({a, b, c, d} : Finset Point) c d ∧
      hullSide ({a, b, c, d} : Finset Point) d a := by
  have hrAC : openSegment c a o := s042_openSegment_reverse hcrossAC
  have hrBD : openSegment d b o := s042_openSegment_reverse hcrossBD
  refine ⟨s042_hullSide_first_of_crossing a b c d o hno
      hab hac hbc hcrossAC hcrossBD, ?_, ?_, ?_⟩
  · have hn : noThreeCollinear ({b, c, d, a} : Finset Point) := by
      simpa [Finset.insert_comm, Finset.insert_left_comm, Finset.insert_assoc] using hno
    have hs := s042_hullSide_first_of_crossing b c d a o hn
      hbc hbd hcd hcrossBD hrAC
    simpa [Finset.insert_comm, Finset.insert_left_comm, Finset.insert_assoc] using hs
  · have hn : noThreeCollinear ({c, d, a, b} : Finset Point) := by
      simpa [Finset.insert_comm, Finset.insert_left_comm, Finset.insert_assoc] using hno
    have hs := s042_hullSide_first_of_crossing c d a b o hn
      hcd hac.symm had.symm hrAC hrBD
    simpa [Finset.insert_comm, Finset.insert_left_comm, Finset.insert_assoc] using hs
  · have hn : noThreeCollinear ({d, a, b, c} : Finset Point) := by
      simpa [Finset.insert_comm, Finset.insert_left_comm, Finset.insert_assoc] using hno
    have hs := s042_hullSide_first_of_crossing d a b c o hn
      had.symm hbd.symm hab hcrossBD hcrossAC
    simpa [Finset.insert_comm, Finset.insert_left_comm, Finset.insert_assoc] using hs

end ETSHTS
