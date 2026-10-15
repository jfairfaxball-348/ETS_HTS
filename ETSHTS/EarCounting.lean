import ETSHTS.EarFramework

/-!
# S039 — exact fresh-edge counting under the original mandatory insertion

These are partial dependencies for the original CLM0099 necessity proof:
the graph adds precisely two distinct edges at a fresh insertion provided
all old edges have endpoints in earlier sites. No substitute selector, graph
model, geometric hypothesis, or target proposition is introduced.

The global nodup-to-freshness induction and maximal outerplanar argument
remain to be proved. The source below does not close CLM0099.
-/

noncomputable section
namespace ETSHTS

/-- Every inserted edge has endpoints among the old sites and the new site.
The original exact-two-nearest certificate supplies both old endpoints. -/
theorem s039_insert_edges_supported
    {previous : Finset Point} {G : Finset Edge} {v u w : Point}
    (hnear : exactlyTwoNearest previous v u w)
    (hG : ∀ e ∈ G, e ⊆ previous) :
    ∀ e ∈ G ∪ {edge v u, edge v w}, e ⊆ insert v previous := by
  rcases hnear with ⟨hu, hw, _, _⟩
  intro e he x hx
  rcases Finset.mem_union.mp he with he | he
  · exact Finset.mem_insert_of_mem (hG e he hx)
  · simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl
    · have hxu : x = v ∨ x = u := by simpa [edge] using hx
      rcases hxu with rfl | rfl
      · simp
      · simp [hu]
    · have hxw : x = v ∨ x = w := by simpa [edge] using hx
      rcases hxw with rfl | rfl
      · simp
      · simp [hw]

/-- A fresh arrival satisfying the unchanged exactlyTwoNearest predicate
increases the number of edges by EXACTLY two, not merely by at most two.
The support invariant prevents an earlier edge from containing the new
vertex; the mandatory nearest pair guarantees the two new edges differ. -/
theorem s039_fresh_insert_two_edges
    {previous : Finset Point} {G : Finset Edge} {v u w : Point}
    (hnear : exactlyTwoNearest previous v u w)
    (hfresh : v ∉ previous)
    (hG : ∀ e ∈ G, e ⊆ previous) :
    (G ∪ {edge v u, edge v w}).card = G.card + 2 := by
  rcases hnear with ⟨hu, hw, huw, _⟩
  have hvu : v ≠ u := by
    intro h
    apply hfresh
    rw [h]
    exact hu
  have hvw : v ≠ w := by
    intro h
    apply hfresh
    rw [h]
    exact hw
  have hdifferent : edge v u ≠ edge v w := by
    intro h
    have hmem : u ∈ edge v w := by
      rw [← h]
      simp [edge]
    have hcases : u = v ∨ u = w := by
      simpa [edge] using hmem
    rcases hcases with huv | huw'
    · exact hvu huv.symm
    · exact huw huw'
  have hno : ∀ e ∈ G, v ∉ e := by
    intro e he hve
    exact hfresh (hG e he hve)
  have hdisjoint : Disjoint G ({edge v u, edge v w} : Finset Edge) := by
    apply Finset.disjoint_left.mpr
    intro e he hnew
    simp only [Finset.mem_insert, Finset.mem_singleton] at hnew
    rcases hnew with rfl | rfl
    · exact hno (edge v u) he (by simp [edge])
    · exact hno (edge v w) he (by simp [edge])
  calc
    (G ∪ {edge v u, edge v w}).card =
        G.card + ({edge v u, edge v w} : Finset Edge).card :=
      Finset.card_union_of_disjoint hdisjoint
    _ = G.card + 2 := by
      simp [hdifferent, hdifferent.symm]

end ETSHTS
