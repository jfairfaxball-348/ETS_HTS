import ETSHTS.EarInduction

/-!
# S041 — orientation-zero affine geometry and ellipse noncollinearity

This module proves a general bridge: the existing strictConvexPosition
predicate implies the existing noThreeCollinear predicate. It uses only
finite point geometry, not a spacing hypothesis, altered selector or
numerical ellipse approximation.
-/

noncomputable section
namespace ETSHTS

/-- Vanishing Cartesian orientation gives an exact real affine parameter,
provided the first two sites differ. Both coordinate cases are covered. -/
theorem s041_orientation_zero_affine (p q r : Point)
    (hpq : p ≠ q) (hzero : orientation p q r = 0) :
    ∃ t : ℝ,
      r.1 = (1 - t) * p.1 + t * q.1 ∧
      r.2 = (1 - t) * p.2 + t * q.2 := by
  by_cases hx : p.1 ≠ q.1
  · have hd : q.1 - p.1 ≠ 0 := sub_ne_zero.mpr hx.symm
    let t : ℝ := (r.1 - p.1) / (q.1 - p.1)
    refine ⟨t, ?_, ?_⟩
    · dsimp [t]
      field_simp [hd]
      ring
    · unfold orientation at hzero
      dsimp [t]
      field_simp [hd]
      nlinarith [hzero]
  · have hpeq : p.1 = q.1 := by
      by_contra h
      exact hx h
    have hy : p.2 ≠ q.2 := by
      intro h
      exact hpq (Prod.ext hpeq h)
    have hd : q.2 - p.2 ≠ 0 := sub_ne_zero.mpr hy.symm
    have hrx : r.1 = p.1 := by
      have hprod : (q.2 - p.2) * (r.1 - p.1) = 0 := by
        unfold orientation at hzero
        rw [← hpeq] at hzero
        nlinarith [hzero]
      have hzero' : r.1 - p.1 = 0 :=
        (mul_eq_zero.mp hprod).resolve_left hd
      linarith
    let t : ℝ := (r.2 - p.2) / (q.2 - p.2)
    refine ⟨t, ?_, ?_⟩
    · rw [hrx, ← hpeq]
      ring
    · dsimp [t]
      field_simp [hd]
      ring

/-- For three distinct sites, an affine parameter cannot be either
endpoint parameter. -/
theorem s041_affine_parameter_distinct
    (p q r : Point) (hpr : p ≠ r) (hqr : q ≠ r)
    (t : ℝ)
    (hx : r.1 = (1 - t) * p.1 + t * q.1)
    (hy : r.2 = (1 - t) * p.2 + t * q.2) :
    t ≠ 0 ∧ t ≠ 1 := by
  constructor
  · intro ht
    have heq : r = p := by
      apply Prod.ext
      · rw [hx, ht]
        ring
      · rw [hy, ht]
        ring
    exact hpr heq.symm
  · intro ht
    have heq : r = q := by
      apply Prod.ext
      · rw [hx, ht]
        ring
      · rw [hy, ht]
        ring
    exact hqr heq.symm

/-- Three distinct collinear points cannot all be strictly exposed by
linear functionals: whichever lies between the others violates exposure.
The proof handles negative, interior, and greater-than-one parameters. -/
theorem s041_no_three_exposed_on_affine_line
    {S : Finset Point} (hconv : strictConvexPosition S)
    {p q r : Point} (hp : p ∈ S) (hq : q ∈ S) (hr : r ∈ S)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (t : ℝ) (ht0 : t ≠ 0) (ht1 : t ≠ 1)
    (hx : r.1 = (1 - t) * p.1 + t * q.1)
    (hy : r.2 = (1 - t) * p.2 + t * q.2) :
    False := by
  obtain ⟨np, mp, hmaxp⟩ := hconv p hp
  obtain ⟨nq, mq, hmaxq⟩ := hconv q hq
  obtain ⟨nr, mr, hmaxr⟩ := hconv r hr
  have hpq' := hmaxp q hq hpq.symm
  have hpr' := hmaxp r hr hpr.symm
  have hqp' := hmaxq p hp hpq
  have hqr' := hmaxq r hr hqr.symm
  have hrp' := hmaxr p hp hpr
  have hrq' := hmaxr q hq hqr
  have hFp :
      np * r.1 + mp * r.2 =
        (1 - t) * (np * p.1 + mp * p.2) +
          t * (np * q.1 + mp * q.2) := by
    rw [hx, hy]
    ring
  have hFq :
      nq * r.1 + mq * r.2 =
        (1 - t) * (nq * p.1 + mq * p.2) +
          t * (nq * q.1 + mq * q.2) := by
    rw [hx, hy]
    ring
  have hFr :
      nr * r.1 + mr * r.2 =
        (1 - t) * (nr * p.1 + mr * p.2) +
          t * (nr * q.1 + mr * q.2) := by
    rw [hx, hy]
    ring
  rcases lt_trichotomy t 0 with hneg | heq0 | hpos
  · have hprod :
        0 < t * ((np * q.1 + mp * q.2) -
          (np * p.1 + mp * p.2)) :=
      mul_pos_of_neg_of_neg hneg (by linarith)
    nlinarith [hFp, hpr', hprod]
  · exact ht0 heq0
  · rcases lt_trichotomy t 1 with hsmall | heq1 | hlarge
    · have hprod1 :
          0 < (1 - t) * ((nr * r.1 + mr * r.2) -
            (nr * p.1 + mr * p.2)) :=
        mul_pos (by linarith) (by linarith)
      have hprod2 :
          0 < t * ((nr * r.1 + mr * r.2) -
            (nr * q.1 + mr * q.2)) :=
        mul_pos hpos (by linarith)
      nlinarith [hFr, hprod1, hprod2]
    · exact ht1 heq1
    · have hprod :
          0 < (t - 1) * ((nq * q.1 + mq * q.2) -
            (nq * p.1 + mq * p.2)) :=
        mul_pos (by linarith) (by linarith)
      nlinarith [hFq, hqr', hprod]

/-- Genuine strict convex position rules out all distinct collinear triples
in the ORIGINAL determinant-based predicate. -/
theorem s041_strictConvexPosition_noThreeCollinear
    (S : Finset Point) (hconv : strictConvexPosition S) :
    noThreeCollinear S := by
  intro p hp q hq r hr hpq hpr hqr hzero
  obtain ⟨t, hx, hy⟩ := s041_orientation_zero_affine p q r hpq hzero
  obtain ⟨ht0, ht1⟩ :=
    s041_affine_parameter_distinct p q r hpr hqr t hx hy
  exact s041_no_three_exposed_on_affine_line hconv
    hp hq hr hpq hpr hqr t ht0 ht1 hx hy

/-- No three DISTINCT boundary sites of any positive-axis ellipse are
collinear. The result is independent of n and of the aspect-ratio cutoff. -/
theorem s041_ellipse_noThreeCollinear
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (S : Finset Point)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    noThreeCollinear S :=
  s041_strictConvexPosition_noThreeCollinear S
    (s037_ellipse_strictConvexPosition a b ha hb S hboundary)

end ETSHTS
