import ETSHTS.TriangleInterior

/-!
# S042: endpoint reversal invariance and interior four-site planarity

The original Edge type is an unordered Finset. These lemmas ensure that
both orientations of an open segment give the same crossing condition.
They then reconstruct the entire six-edge triangle-and-spokes drawing,
which is plane for a strictly interior fourth point.
-/

noncomputable section
namespace ETSHTS

theorem s042_openSegment_reverse {p q x : Point}
    (h : openSegment p q x) : openSegment q p x := by
  obtain ⟨t, ht0, ht1, hx⟩ := h
  refine ⟨1 - t, by linarith, by linarith, ?_⟩
  rw [hx]
  congr 1 <;> ring

theorem s042_properCross_reverse_first {p q r s : Point}
    (h : properCross p q r s) : properCross q p r s := by
  obtain ⟨x, hx, hy⟩ := h
  exact ⟨x, s042_openSegment_reverse hx, hy⟩

theorem s042_properCross_reverse_second {p q r s : Point}
    (h : properCross p q r s) : properCross p q s r := by
  obtain ⟨x, hx, hy⟩ := h
  exact ⟨x, hx, s042_openSegment_reverse hy⟩

/-- A crossing of unordered edges would occur in either of the original
chosen orientations: the proof handles every endpoint orientation. -/
theorem s042_noCross_edge_transport
    {p q r s a b c d : Point}
    (hpq : p ≠ q) (hrs : r ≠ s)
    (hsafe : ¬ properCross p q r s)
    (he₁ : edge a b = edge p q)
    (he₂ : edge c d = edge r s) :
    ¬ properCross a b c d := by
  intro hcross
  rcases s042_edge_eq_pair_or_swap hpq he₁ with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · rcases s042_edge_eq_pair_or_swap hrs he₂ with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
    · exact hsafe hcross
    · exact hsafe (s042_properCross_reverse_second hcross)
  · rcases s042_edge_eq_pair_or_swap hrs he₂ with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
    · exact hsafe (s042_properCross_reverse_first hcross)
    · exact hsafe
        (s042_properCross_reverse_second
          (s042_properCross_reverse_first hcross))

/-- Interior spokes and boundary triangle form a planar six-edge wheel.
Strictly positive barycentric weights provide all three opposing-side
crossing exclusions, with no tie-breaking or distance assumptions. -/
theorem s042_interior_triangle_all_spokes_plane
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
    planeEdges
      (triangleEdges p q r ∪ {edge v p, edge v q, edge v r}) := by
  have ⟨hs₁, hs₂, hs₃⟩ :=
    s042_barycentric_three_spokes_safe
      p q r v α β γ hα hβ hγ hsum hv hnp hnq hnr
  have hs₁' : ¬ properCross q r v p := by
    intro h
    exact hs₁ (s042_properCross_swap h)
  have hs₂' : ¬ properCross r p v q := by
    intro h
    exact hs₂ (s042_properCross_swap h)
  have hs₃' : ¬ properCross p q v r := by
    intro h
    exact hs₃ (s042_properCross_swap h)
  intro e₁ he₁ e₂ he₂ hdisj a b c d heq₁ heq₂
  simp only [triangleEdges, Finset.mem_union,
    Finset.mem_insert, Finset.mem_singleton] at he₁ he₂
  rcases he₁ with (h₁ | h₁ | h₁) | (h₁ | h₁ | h₁) <;>
    rcases he₂ with (h₂ | h₂ | h₂) | (h₂ | h₂ | h₂)
  all_goals
    first
    | (subst e₁; subst e₂; simp [edge, Finset.disjoint_left] at hdisj; done)
    | exact s042_noCross_edge_transport hqr hvp hs₁'
        (heq₁.symm.trans h₁) (heq₂.symm.trans h₂)
    | exact s042_noCross_edge_transport hvp hqr hs₁
        (heq₁.symm.trans h₁) (heq₂.symm.trans h₂)
    | exact s042_noCross_edge_transport hrp hvq hs₂'
        (heq₁.symm.trans h₁) (heq₂.symm.trans h₂)
    | exact s042_noCross_edge_transport hvq hrp hs₂
        (heq₁.symm.trans h₁) (heq₂.symm.trans h₂)
    | exact s042_noCross_edge_transport hpq hvr hs₃'
        (heq₁.symm.trans h₁) (heq₂.symm.trans h₂)
    | exact s042_noCross_edge_transport hvr hpq hs₃
        (heq₁.symm.trans h₁) (heq₂.symm.trans h₂)

end ETSHTS
