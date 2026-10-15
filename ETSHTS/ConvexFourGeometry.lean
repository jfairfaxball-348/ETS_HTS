import ETSHTS.EuclideanChord

/-!
# S042 continued — strict opposite-side lengths for crossing diagonals

These lemmas connect strict Euclidean triangle inequalities and
the openSegment definition to the exact metric crossing selector.
-/

noncomputable section
namespace ETSHTS

/-- Length is additive when the intermediate point lies in the
strict affine interior of a straight segment. -/
theorem s042_chord_segment_add {p q z : Point}
    (hz : openSegment p q z) :
    s042_chordLength p z + s042_chordLength z q =
      s042_chordLength p q := by
  obtain ⟨t, ht0, ht1, heq⟩ := hz
  have ht' : 0 ≤ 1 - t := by linarith
  have hs₁ : sqDist p z = t ^ 2 * sqDist p q := by
    rw [heq]
    unfold sqDist
    ring
  have hs₂ : sqDist z q = (1 - t) ^ 2 * sqDist p q := by
    rw [heq]
    unfold sqDist
    ring
  have hp : 0 ≤ s042_chordLength p q := s042_chordLength_nonneg p q
  have h₁ : s042_chordLength p z = t * s042_chordLength p q := by
    have hsq := s042_chordLength_sq p z
    rw [hs₁, ← s042_chordLength_sq] at hsq
    have hnn := s042_chordLength_nonneg p z
    have hprod := mul_nonneg (le_of_lt ht0) hp
    nlinarith [hsq]
  have h₂ : s042_chordLength z q = (1 - t) * s042_chordLength p q := by
    have hsq := s042_chordLength_sq z q
    rw [hs₂, ← s042_chordLength_sq] at hsq
    have hnn := s042_chordLength_nonneg z q
    have hprod := mul_nonneg ht' hp
    nlinarith [hsq]
  rw [h₁, h₂]
  ring

/-- Orientation when the second site slides strictly along an edge. -/
theorem s042_orientation_second_segment
    {p r q o : Point} (ho : openSegment p r o) :
    ∃ t : ℝ, 0 < t ∧
      orientation p o q = t * orientation p r q := by
  obtain ⟨t, ht, _, heq⟩ := ho
  refine ⟨t, ht, ?_⟩
  rw [heq]
  unfold orientation
  dsimp
  ring

/-- Noncollinearity passes to a strictly interior point of an edge. -/
theorem s042_orientation_second_segment_ne
    {p r q o : Point} (ho : openSegment p r o)
    (hnon : orientation p r q ≠ 0) :
    orientation p o q ≠ 0 := by
  obtain ⟨t, ht, heq⟩ := s042_orientation_second_segment ho
  rw [heq]
  exact mul_ne_zero (ne_of_gt ht) hnon

/-- Both strict crossing-path inequalities for a nondegenerate
quadrilateral with intersecting diagonals. All four noncollinear
orientation hypotheses are the genuine site geometry conditions. -/
theorem s042_crossing_opposite_path_strict
    (a b c d o : Point)
    (hac : openSegment a c o) (hbd : openSegment b d o)
    (hacb : orientation a c b ≠ 0)
    (hcad : orientation c a d ≠ 0)
    (hbdc : orientation b d c ≠ 0)
    (hdba : orientation d b a ≠ 0) :
    s042_chordLength a b + s042_chordLength c d <
        s042_chordLength a c + s042_chordLength b d ∧
      s042_chordLength b c + s042_chordLength d a <
        s042_chordLength a c + s042_chordLength b d := by
  have hacrev : openSegment c a o := s042_openSegment_reverse hac
  have hbdrev : openSegment d b o := s042_openSegment_reverse hbd
  have hAB := s042_strict_chord_triangle a o b
    (s042_orientation_second_segment_ne hac hacb)
  have hCD := s042_strict_chord_triangle c o d
    (s042_orientation_second_segment_ne hacrev hcad)
  have hBC := s042_strict_chord_triangle b o c
    (s042_orientation_second_segment_ne hbd hbdc)
  have hDA := s042_strict_chord_triangle d o a
    (s042_orientation_second_segment_ne hbdrev hdba)
  have hAC := s042_chord_segment_add hac
  have hBD := s042_chord_segment_add hbd
  have hAO := s042_chordLength_symm a o
  have hBO := s042_chordLength_symm b o
  have hCO := s042_chordLength_symm c o
  have hDO := s042_chordLength_symm d o
  constructor <;> linarith

/-- Main geometric-to-metric bridge: crossing diagonals and the
original noThreeCollinear site predicate force one site to have
both incident boundary sides STRICTLY shorter than the opposite
diagonal, robust even when other pairwise distances tie. -/
theorem s042_crossing_diagonals_choose_strict_ear
    {S : Finset Point} (hno : noThreeCollinear S)
    (a b c d o : Point)
    (ha : a ∈ S) (hb : b ∈ S) (hc : c ∈ S) (hd : d ∈ S)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcrossAC : openSegment a c o)
    (hcrossBD : openSegment b d o) :
    (s042_chordLength a b < s042_chordLength a c ∧
     s042_chordLength a d < s042_chordLength a c) ∨
    (s042_chordLength c b < s042_chordLength c a ∧
     s042_chordLength c d < s042_chordLength c a) ∨
    (s042_chordLength b a < s042_chordLength b d ∧
     s042_chordLength b c < s042_chordLength b d) ∨
    (s042_chordLength d c < s042_chordLength d b ∧
     s042_chordLength d a < s042_chordLength d b) := by
  obtain ⟨h₁,h₂⟩ := s042_crossing_opposite_path_strict a b c d o
    hcrossAC hcrossBD
    (hno a ha c hc b hb hac hab hbc.symm)
    (hno c hc a ha d hd hac.symm hcd had)
    (hno b hb d hd c hc hbd hbc hcd.symm)
    (hno d hd b hb a ha hbd.symm had.symm hab.symm)
  have hsel := s042_crossing_selector
    (s042_chordLength a b) (s042_chordLength b c)
    (s042_chordLength c d) (s042_chordLength d a)
    (s042_chordLength a c) (s042_chordLength b d)
    h₁ h₂
  rcases hsel with h | h | h | h
  · exact Or.inl ⟨h.1, by simpa [s042_chordLength_symm] using h.2⟩
  · exact Or.inr (Or.inl ⟨by simpa [s042_chordLength_symm] using h.1,
      by simpa [s042_chordLength_symm] using h.2⟩)
  · exact Or.inr (Or.inr (Or.inl
      ⟨by simpa [s042_chordLength_symm] using h.1,
        by simpa [s042_chordLength_symm] using h.2⟩))
  · exact Or.inr (Or.inr (Or.inr
      ⟨by simpa [s042_chordLength_symm] using h.1, h.2⟩))

end ETSHTS
