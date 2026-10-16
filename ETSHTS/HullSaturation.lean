module
public import ETSHTS.FourTailBridge

@[expose] public section


/-!
# S042: hull-edge saturation from a planar edge-count cap

For original convex points, every supported hull side can be inserted
without crossing. Combining this genuinely geometric fact with the exact
original Grow edge count converts an outerplanar edge-cap theorem to
mandatory hull-edge saturation. The general outerplanar cap itself is an
independent remaining combinatorial proof obligation, not assumed proven.
-/

noncomputable section
namespace ETSHTS

/-- A supported planar graph attaining an upper edge bound must contain
all genuine supporting hull sides. The exact premise is an upper bound
on EVERY supported planar graph; no hidden maximisation assumption is used. -/
theorem s042_hullSide_present_of_planar_cap
    {S : Finset Point} (hno : noThreeCollinear S)
    (hcap : ∀ H : Finset Edge,
      planeEdges H → (∀ e ∈ H, e ⊆ S) →
      H.card ≤ 2 * S.card - 3)
    {G : Finset Edge} (hplane : planeEdges G)
    (hsupport : ∀ e ∈ G, e ⊆ S)
    (hcount : G.card = 2 * S.card - 3)
    {p q : Point} (hside : hullSide S p q) :
    edge p q ∈ G := by
  classical
  by_contra hmiss
  have hp : planeEdges (insert (edge p q) G) :=
    s042_planeEdges_insert_hullSide hno hplane hsupport hside
  have hs : ∀ e ∈ insert (edge p q) G, e ⊆ S := by
    intro e he x hx
    rcases Finset.mem_insert.mp he with hnew | hold
    · rw [hnew] at hx
      have hxcase : x = p ∨ x = q := by simpa [edge] using hx
      rcases hxcase with rfl | rfl
      · exact hside.1
      · exact hside.2.1
    · exact hsupport e hold hx
  have hc := hcap (insert (edge p q) G) hp hs
  have hnewcard : (insert (edge p q) G).card = G.card + 1 := by
    simp [hmiss]
  omega

/-- The exact original retained-nearest-two order saturates every hull
side once an independently proved planar-graph edge cap is available.
No alternate drawing or edge count is used. -/
theorem s042_order_saturates_all_hullSides_of_cap
    {S : Finset Point} (hno : noThreeCollinear S)
    (hcap : ∀ H : Finset Edge,
      planeEdges H → (∀ e ∈ H, e ⊆ S) →
      H.card ≤ 2 * S.card - 3)
    (horder : planeNearestTwoOrder S) :
    ∃ final : Finset Edge,
      planeEdges final ∧
      (∀ e ∈ final, e ⊆ S) ∧
      (∀ p q : Point, hullSide S p q → edge p q ∈ final) := by
  obtain ⟨final, hplane, hsupp, hcount⟩ :=
    s041_planeNearestTwoOrder_exact_edge_count horder
  refine ⟨final, hplane, hsupp, ?_⟩
  intro p q hside
  exact s042_hullSide_present_of_planar_cap hno hcap
    hplane hsupp hcount hside

end ETSHTS
