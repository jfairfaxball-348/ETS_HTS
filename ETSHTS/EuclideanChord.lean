module
public import ETSHTS.ConvexFourSelector

@[expose] public section


/-!
# S042 continued — strict Euclidean triangle inequalities

All lengths use the actual original coordinate squared distance, and
positive square roots. Noncollinear triples satisfy a strict triangle
inequality. Algebraic proof uses the planar dot/determinant identity,
without any substitute norm or floating approximations.
-/

noncomputable section
namespace ETSHTS

def s042_chordLength (p q : Point) : ℝ := Real.sqrt (sqDist p q)

theorem s042_chordLength_nonneg (p q : Point) :
    0 ≤ s042_chordLength p q := by
  unfold s042_chordLength
  exact Real.sqrt_nonneg _

theorem s042_chordLength_sq (p q : Point) :
    (s042_chordLength p q) ^ 2 = sqDist p q := by
  unfold s042_chordLength
  exact Real.sq_sqrt (sqDist_nonneg p q)

theorem s042_chordLength_symm (p q : Point) :
    s042_chordLength p q = s042_chordLength q p := by
  unfold s042_chordLength
  rw [sqDist_symm]

private def s042_dot (p z q : Point) : ℝ :=
  (p.1 - z.1) * (z.1 - q.1) +
  (p.2 - z.2) * (z.2 - q.2)

private def s042_det (p z q : Point) : ℝ :=
  (p.1 - z.1) * (z.2 - q.2) -
  (p.2 - z.2) * (z.1 - q.1)

private theorem s042_det_eq_orientation (p z q : Point) :
    s042_det p z q = orientation p z q := by
  unfold s042_det orientation
  ring

private theorem s042_sqDist_vector_add (p z q : Point) :
    sqDist p q = sqDist p z + sqDist z q + 2 * s042_dot p z q := by
  unfold sqDist s042_dot
  ring

private theorem s042_sqDist_dot_det_identity (p z q : Point) :
    sqDist p z * sqDist z q =
      (s042_dot p z q) ^ 2 + (s042_det p z q) ^ 2 := by
  unfold sqDist s042_dot s042_det
  ring

/-- A strict non-collinear Euclidean triangle inequality in the exact
coordinate length used by the nearest-neighbour problem. -/
theorem s042_strict_chord_triangle (p z q : Point)
    (hnon : orientation p z q ≠ 0) :
    s042_chordLength p q <
      s042_chordLength p z + s042_chordLength z q := by
  let A := s042_chordLength p z
  let B := s042_chordLength z q
  let C := s042_chordLength p q
  let dot := s042_dot p z q
  let det := s042_det p z q
  have hA : 0 ≤ A := s042_chordLength_nonneg p z
  have hB : 0 ≤ B := s042_chordLength_nonneg z q
  have hC : 0 ≤ C := s042_chordLength_nonneg p q
  have hAsq : A ^ 2 = sqDist p z := s042_chordLength_sq p z
  have hBsq : B ^ 2 = sqDist z q := s042_chordLength_sq z q
  have hCsq : C ^ 2 = sqDist p q := s042_chordLength_sq p q
  have hsum : C ^ 2 = A ^ 2 + B ^ 2 + 2 * dot := by
    rw [hCsq, hAsq, hBsq]
    exact s042_sqDist_vector_add p z q
  have hident : (A * B) ^ 2 = dot ^ 2 + det ^ 2 := by
    have hid := s042_sqDist_dot_det_identity p z q
    rw [← hAsq, ← hBsq] at hid
    nlinarith [hid]
  have hdne : det ≠ 0 := by
    simpa only [det, s042_det_eq_orientation] using hnon
  have hdpos : 0 < det ^ 2 := sq_pos_of_ne_zero hdne
  have hAB : 0 ≤ A * B := mul_nonneg hA hB
  have hdot : dot < A * B := by
    by_contra h
    have hge : A * B ≤ dot := le_of_not_gt h
    have hprod : 0 ≤ (dot - A * B) * (dot + A * B) :=
      mul_nonneg (by linarith) (by linarith)
    nlinarith [hident, hdpos, hprod]
  have hcs : C ^ 2 < (A + B) ^ 2 := by
    nlinarith [hsum, hdot]
  change C < A + B
  nlinarith [hcs]

end ETSHTS
