module
public import ETSHTS.CyclicFinite

@[expose] public section


/-!
# S042: exact orientation control for planar hull-side protection

This module works directly with the unchanged openSegment, properCross,
noThreeCollinear, orientation and hullSide definitions. Its results are
needed to reconstruct planar convex-hull edges in an original Grow order.
-/

noncomputable section
namespace ETSHTS

/-- Signed orientation is affine in the third argument. -/
theorem s042_orientation_affine_segment (p q r s x : Point) (t : ℝ)
    (hx : x = ((1 - t) * r.1 + t * s.1,
               (1 - t) * r.2 + t * s.2)) :
    orientation p q x =
      (1 - t) * orientation p q r + t * orientation p q s := by
  rw [hx]
  unfold orientation
  dsimp
  ring

/-- An interior point of a segment lies exactly on its supporting line. -/
theorem s042_orientation_openSegment_zero {p q x : Point}
    (hx : openSegment p q x) : orientation p q x = 0 := by
  obtain ⟨t, _, _, heq⟩ := hx
  rw [heq]
  unfold orientation
  dsimp
  ring

/-- Segments strictly on the same side of a supporting line cannot
properly cross its defining segment. Both side orientations are accepted. -/
theorem s042_no_properCross_of_same_strict_side
    (p q r s : Point)
    (hsame :
      (0 < orientation p q r ∧ 0 < orientation p q s) ∨
      (orientation p q r < 0 ∧ orientation p q s < 0)) :
    ¬ properCross p q r s := by
  rintro ⟨x, hx_pq, ⟨t, ht0, ht1, hx_rs⟩⟩
  have hz : orientation p q x = 0 :=
    s042_orientation_openSegment_zero hx_pq
  have haff := s042_orientation_affine_segment p q r s x t hx_rs
  have htleft : 0 < 1 - t := by linarith
  rcases hsame with ⟨hr, hs⟩ | ⟨hr, hs⟩
  · have h₁ : 0 < (1 - t) * orientation p q r :=
      mul_pos htleft hr
    have h₂ : 0 < t * orientation p q s :=
      mul_pos ht0 hs
    linarith
  · have h₁ : 0 < (1 - t) * (-orientation p q r) :=
      mul_pos htleft (by linarith)
    have h₂ : 0 < t * (-orientation p q s) :=
      mul_pos ht0 (by linarith)
    linarith

/-- An original hull side is noncrossing with every chord between other
vertices whose endpoints are disjoint from the side. This supplies a real
missing geometric implication for the full retained-graph theorem. -/
theorem s042_hullSide_safe_against_disjoint_chord
    {S : Finset Point} (hno : noThreeCollinear S)
    {p q r s : Point} (hside : hullSide S p q)
    (hr : r ∈ S) (hs : s ∈ S)
    (hdisj : Disjoint (edge p q) (edge r s)) :
    ¬ properCross p q r s := by
  obtain ⟨hp, hq, hpq, hsign⟩ := hside
  have hsep (z : Point) (hz : z ∈ ({r, s} : Finset Point)) :
      p ≠ z ∧ q ≠ z := by
    constructor
    · intro heq
      have hpedge : p ∈ edge p q := by simp [edge]
      have hzedge : p ∈ edge r s := by
        rcases Finset.mem_insert.mp hz with hz | hz
        · simp [edge, heq, hz]
        · simp [edge, heq, hz]
      exact (Finset.disjoint_left.mp hdisj) hpedge hzedge
    · intro heq
      have hqedge : q ∈ edge p q := by simp [edge]
      have hzedge : q ∈ edge r s := by
        rcases Finset.mem_insert.mp hz with hz | hz
        · simp [edge, heq, hz]
        · simp [edge, heq, hz]
      exact (Finset.disjoint_left.mp hdisj) hqedge hzedge
  have hpr := (hsep r (by simp)).1
  have hqr := (hsep r (by simp)).2
  have hps := (hsep s (by simp)).1
  have hqs := (hsep s (by simp)).2
  have hnr : orientation p q r ≠ 0 :=
    hno p hp q hq r hr hpq hpr hqr
  have hns : orientation p q s ≠ 0 :=
    hno p hp q hq s hs hpq hps hqs
  apply s042_no_properCross_of_same_strict_side p q r s
  rcases hsign with hl | hr'
  · exact Or.inl ⟨lt_of_le_of_ne (hl r hr) hnr.symm,
        lt_of_le_of_ne (hl s hs) hns.symm⟩
  · exact Or.inr ⟨lt_of_le_of_ne (hr' r hr) hnr,
        lt_of_le_of_ne (hr' s hs) hns⟩

end ETSHTS
