import ETSHTS.ConvexFourHull

/-!
# S042 continued — exact compulsory insertion for crossing diagonals

The crossing-diagonal geometry provides a strict metric-ear selector.
Here the chosen site is promoted to an ORIGINAL metricEar with the
ORIGINAL Cartesian-tie nearest-two and true hull-neighbour uniqueness.
The complete plane order then follows from S042 reverse-ear insertion.
-/

noncomputable section
namespace ETSHTS

/-- A proper crossing of disjoint diagonals contradicts the ORIGINAL
strict hull-side support property. -/
theorem s042_crossing_diagonal_not_hullSide
    {S : Finset Point} (hno : noThreeCollinear S)
    {a b c d : Point} (hb : b ∈ S) (hd : d ∈ S)
    (hab : a ≠ b) (had : a ≠ d)
    (hcb : c ≠ b) (hcd : c ≠ d)
    (hcross : properCross a c b d) :
    ¬ hullSide S a c := by
  intro hs
  have hdisj : Disjoint (edge a c) (edge b d) := by
    simp [edge, Finset.disjoint_left, hab, had, hcb, hcd,
      hab.symm, had.symm, hcb.symm, hcd.symm]
  exact (s042_hullSide_safe_against_disjoint_chord
    hno hs hb hd hdisj) hcross

theorem s042_chordLength_lt_sqDist {p u v : Point}
    (h : s042_chordLength p u < s042_chordLength p v) :
    sqDist p u < sqDist p v := by
  have hsq₁ := s042_chordLength_sq p u
  have hsq₂ := s042_chordLength_sq p v
  have hn₁ := s042_chordLength_nonneg p u
  have hn₂ := s042_chordLength_nonneg p v
  nlinarith

/-- Any specified A-site with two sides shorter than its crossing
diagonal is a genuine compulsory metric ear on the four-point set. -/
theorem s042_metricEar_of_crossing_A
    (a b c d o : Point)
    (hno : noThreeCollinear ({a, b, c, d} : Finset Point))
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcrossAC : openSegment a c o)
    (hcrossBD : openSegment b d o)
    (hAB : s042_chordLength a b < s042_chordLength a c)
    (hAD : s042_chordLength a d < s042_chordLength a c) :
    metricEar ({a, b, c, d} : Finset Point) a := by
  let S : Finset Point := {a, b, c, d}
  obtain ⟨hsAB, _, _, hsDA⟩ :=
    s042_four_hullSides_of_crossing a b c d o hno
      hab hac had hbc hbd hcd hcrossAC hcrossBD
  have hsAD : hullSide S a d := s042_hullSide_swap hsDA
  have hcross : properCross a c b d := ⟨o, hcrossAC, hcrossBD⟩
  have hnon : ¬ hullSide S a c :=
    s042_crossing_diagonal_not_hullSide hno (by simp [S]) (by simp [S])
      hab had hbc.symm hcd hcross
  have hneighbors : cyclicNeighbours S a b d := by
    refine ⟨hbd, hsAB, hsAD, ?_⟩
    intro x hx hside
    have hxs : x = a ∨ x = b ∨ x = c ∨ x = d := by
      simpa only [S, Finset.mem_insert, Finset.mem_singleton] using hx
    rcases hxs with rfl | rfl | rfl | rfl
    · exact False.elim (hside.2.2.1 rfl)
    · exact Or.inl rfl
    · exact False.elim (hnon hside)
    · exact Or.inr rfl
  have hnear : exactlyTwoNearest (S.erase a) a b d := by
    apply exactlyTwoNearest_of_strict_gap
      (by simp [S, hab.symm]) (by simp [S, had.symm]) hbd
    intro x hx hxb hxd
    have hxS : x ∈ S := Finset.mem_of_mem_erase hx
    have hcases : x = a ∨ x = b ∨ x = c ∨ x = d := by
      simpa only [S, Finset.mem_insert, Finset.mem_singleton] using hxS
    rcases hcases with he | he | he | he
    · exact False.elim ((Finset.ne_of_mem_erase hx) he)
    · exact False.elim (hxb he)
    · subst x
      exact ⟨s042_chordLength_lt_sqDist hAB,
        s042_chordLength_lt_sqDist hAD⟩
    · exact False.elim (hxd he)
  exact ⟨by simp [S], b, d, hneighbors, hnear⟩

/-- A crossing-diagonal four-point set has a compulsory metric ear,
with strict distance separation, hence valid regardless of ties. -/
theorem s042_crossing_four_has_metricEar
    (a b c d o : Point)
    (hno : noThreeCollinear ({a, b, c, d} : Finset Point))
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcrossAC : openSegment a c o)
    (hcrossBD : openSegment b d o) :
    ∃ v : Point, metricEar ({a, b, c, d} : Finset Point) v := by
  have hchoose := s042_crossing_diagonals_choose_strict_ear
    hno a b c d o (by simp) (by simp) (by simp) (by simp)
    hab hac had hbc hbd hcd hcrossAC hcrossBD
  rcases hchoose with h | h | h | h
  · exact ⟨a, s042_metricEar_of_crossing_A a b c d o hno
      hab hac had hbc hbd hcd hcrossAC hcrossBD h.1 h.2⟩
  · have hn : noThreeCollinear ({c, d, a, b} : Finset Point) := by
      simpa [Finset.insert_comm] using hno
    have hear := s042_metricEar_of_crossing_A c d a b o hn
      hcd hac.symm hbc.symm had.symm hbd.symm hab
      (s042_openSegment_reverse hcrossAC)
      (s042_openSegment_reverse hcrossBD)
      (by simpa [s042_chordLength_symm] using h.2)
      (by simpa [s042_chordLength_symm] using h.1)
    exact ⟨c, by simpa [Finset.insert_comm,
      Finset.insert_left_comm, Finset.insert_assoc] using hear⟩
  · have hn : noThreeCollinear ({b, c, d, a} : Finset Point) := by
      simpa [Finset.insert_comm] using hno
    have hear := s042_metricEar_of_crossing_A b c d a o hn
      hbc hbd hab.symm hcd hac.symm had.symm
      hcrossBD (s042_openSegment_reverse hcrossAC)
      h.2 (by simpa [s042_chordLength_symm] using h.1)
    exact ⟨b, by simpa [Finset.insert_comm,
      Finset.insert_left_comm, Finset.insert_assoc] using hear⟩
  · have hn : noThreeCollinear ({d, a, b, c} : Finset Point) := by
      simpa [Finset.insert_comm] using hno
    have hear := s042_metricEar_of_crossing_A d a b c o hn
      had.symm hbd.symm hcd.symm hab hac hbc
      (s042_openSegment_reverse hcrossBD) hcrossAC
      h.2 (by simpa [s042_chordLength_symm] using h.1)
    exact ⟨d, by simpa [Finset.insert_comm,
      Finset.insert_left_comm, Finset.insert_assoc] using hear⟩

end ETSHTS
