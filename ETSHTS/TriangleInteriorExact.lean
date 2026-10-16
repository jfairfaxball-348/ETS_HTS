module
public import ETSHTS.TriangleInteriorOrder

@[expose] public section


/-!
# S042: the exact compulsory four-site order for a strict interior site

This theorem is a genuine CLM0096 case: start with an arbitrary triangle,
then add a strictly interior fourth vertex to precisely its two nearest
predecessors, including all Cartesian-lex ties. Its complete drawing is
planar because it is a subdrawing of the six-edge interior wheel.
The remaining CLM0096 tasks are the exhaustive geometric case split and
the strictly convex four-site quadrilateral.
-/

noncomputable section
namespace ETSHTS

theorem s042_exact_interior_four_order
    (p q r v : Point) (α β γ : ℝ)
    (hpq : p ≠ q) (hqr : q ≠ r) (hrp : r ≠ p)
    (hvp : v ≠ p) (hvq : v ≠ q) (hvr : v ≠ r)
    (hα : 0 < α) (hβ : 0 < β) (hγ : 0 < γ)
    (hsum : α + β + γ = 1)
    (hv : v = (α * p.1 + β * q.1 + γ * r.1,
               α * p.2 + β * q.2 + γ * r.2))
    (hnp : orientation q r p ≠ 0)
    (hnq : orientation r p q ≠ 0)
    (hnr : orientation p q r ≠ 0) :
    planeNearestTwoOrder ({p, q, r, v} : Finset Point) := by
  have hfull : planeEdges
      (triangleEdges p q r ∪ {edge v p, edge v q, edge v r}) :=
    s042_interior_triangle_all_spokes_plane
      p q r v α β γ hpq hqr hrp hvp hvq hvr
      hα hβ hγ hsum hv hnp hnq hnr
  obtain ⟨u, w, hnear⟩ :=
    exactlyTwoNearest_three_exists p q r v hpq hrp.symm hqr
  have hin (x : Point) (hx : x ∈ ({p, q, r} : Finset Point)) :
      edge v x ∈ ({edge v p, edge v q, edge v r} : Finset Edge) := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl <;> simp
  have hsub :
      triangleEdges p q r ∪ {edge v u, edge v w} ⊆
        triangleEdges p q r ∪ {edge v p, edge v q, edge v r} := by
    intro e he
    rcases Finset.mem_union.mp he with htri | hnew
    · exact Finset.mem_union.mpr (Or.inl htri)
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hnew
      rcases hnew with rfl | rfl
      · exact Finset.mem_union.mpr (Or.inr (hin u hnear.1))
      · exact Finset.mem_union.mpr (Or.inr (hin w hnear.2.1))
  have hvnot : v ∉ ({p, q, r} : Finset Point) := by
    simp [hvp, hvq, hvr]
  exact four_point_order_from_exact_nearest p q r v u w
    hpq hrp.symm hqr hvnot hnear
    (s038_planeEdges_of_subset hsub hfull)

end ETSHTS
