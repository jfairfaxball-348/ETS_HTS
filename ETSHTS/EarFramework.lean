import ETSHTS.EllipseConvex

/-!
# S038 — exact exposed-segment and retained-edge prerequisites

The S020/S021 mathematics is frozen. These are partial proof dependencies
under the unmodified original geometric and Grow definitions.
No exact four-point or all-cardinality target is claimed here.
-/

noncomputable section
namespace ETSHTS

/-- A site exposed by a strict linear functional cannot be strictly
inside a segment joining two other sites of the same finite set.
This is an unconditional consequence of the EXISTING convexity predicate. -/
theorem s038_strictConvexPosition_no_openSegment
    {S : Finset Point} (hconv : strictConvexPosition S)
    {p q r : Point} (hp : p ∈ S) (hq : q ∈ S) (hr : r ∈ S)
    (hpq : p ≠ q) (hpr : p ≠ r) :
    ¬ openSegment q r p := by
  rintro ⟨t, ht0, ht1, hseg⟩
  obtain ⟨nx, ny, hmax⟩ := hconv p hp
  have hqmax : nx * q.1 + ny * q.2 < nx * p.1 + ny * p.2 :=
    hmax q hq hpq.symm
  have hrmax : nx * r.1 + ny * r.2 < nx * p.1 + ny * p.2 :=
    hmax r hr hpr.symm
  have hpx : p.1 = (1 - t) * q.1 + t * r.1 :=
    congrArg Prod.fst hseg
  have hpy : p.2 = (1 - t) * q.2 + t * r.2 :=
    congrArg Prod.snd hseg
  have hlin : nx * p.1 + ny * p.2 =
      (1 - t) * (nx * q.1 + ny * q.2) +
        t * (nx * r.1 + ny * r.2) := by
    rw [hpx, hpy]
    ring
  have hpos : (0 : ℝ) < 1 - t := by linarith
  have hbad :
      (1 - t) * (nx * q.1 + ny * q.2) +
        t * (nx * r.1 + ny * r.2) <
        nx * p.1 + ny * p.2 := by
    calc
      (1 - t) * (nx * q.1 + ny * q.2) +
          t * (nx * r.1 + ny * r.2) <
          (1 - t) * (nx * p.1 + ny * p.2) +
            t * (nx * p.1 + ny * p.2) :=
        add_lt_add
          (mul_lt_mul_of_pos_left hqmax hpos)
          (mul_lt_mul_of_pos_left hrmax ht0)
      _ = nx * p.1 + ny * p.2 := by ring
  rw [hlin] at hbad
  exact (lt_irrefl _ hbad)

/-- Direct ellipse-boundary consequence of the S037 strict-support proof:
no boundary site is in the strict interior of the chord between two others.
No bound on aspect ratio or angular separation is imposed. -/
theorem s038_ellipse_no_boundary_strictly_between
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (S : Finset Point)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p)
    {p q r : Point} (hp : p ∈ S) (hq : q ∈ S) (hr : r ∈ S)
    (hpq : p ≠ q) (hpr : p ≠ r) :
    ¬ openSegment q r p :=
  s038_strictConvexPosition_no_openSegment
    (s037_ellipse_strictConvexPosition a b ha hb S hboundary)
    hp hq hr hpq hpr

/-- The exact original Grow operation never deletes any edge of its seed
graph, including when every later insertion uses the lexicographic tie rule. -/
theorem s038_grow_retains_initial_edges
    {previous rest : List Point} {G final : Finset Edge}
    (h : Grow previous G rest final) : G ⊆ final := by
  induction h with
  | finish _ _ =>
      intro e he
      exact he
  | insert previous G v u w rest final hnear hrest ih =>
      intro e he
      exact ih (Finset.mem_union.mpr (Or.inl he))

/-- Planarity of an actual graph passes to a retained-edge subgraph. -/
theorem s038_planeEdges_of_subset {G H : Finset Edge}
    (hsub : G ⊆ H) (hplane : planeEdges H) : planeEdges G := by
  intro e₁ he₁ e₂ he₂ hdisj p q r s heq₁ heq₂
  exact hplane e₁ (hsub he₁) e₂ (hsub he₂) hdisj
    p q r s heq₁ heq₂

/-- Therefore any completed planar Grow certificate also certifies
planarity of the entire original seed drawing. -/
theorem s038_grow_planar_initial_edges
    {previous rest : List Point} {G final : Finset Edge}
    (h : Grow previous G rest final) (hplane : planeEdges final) :
    planeEdges G :=
  s038_planeEdges_of_subset (s038_grow_retains_initial_edges h) hplane

/-- The exact two-sided CLM0099 equivalence on its three-site base case.
The remaining card≥4 ear-counting and hull-saturation cases are OPEN. -/
theorem s038_card_three_plane_iff_fullEarCertificate
    (S : Finset Point) (hcard : S.card = 3) :
    (planeNearestTwoOrder S ↔ FullEarCertificate S) := by
  constructor
  · intro _
    exact FullEarCertificate.base S hcard
  · intro _
    exact clm0096_card_three S hcard

end ETSHTS
