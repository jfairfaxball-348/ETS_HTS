import ETSHTS.GrowCounting

/-!
# S041 — exact global edge count and endpoint support

Consequences of the original retained-nearest-two Grow relation. The counting
formula is for the ORIGINAL planeNearestTwoOrder proposition, not a surrogate.
No unproved geometric premise, modified priority, or new axiom is used.
-/

noncomputable section
namespace ETSHTS

/-- For three distinct sites, the seed has exactly three different edges. -/
theorem s041_triangleEdges_card (p q r : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) :
    (triangleEdges p q r).card = 3 := by
  have hpq_qr : edge p q ≠ edge q r := by
    intro h
    have hp : p ∈ edge q r := by rw [← h]; simp [edge]
    have hcases : p = q ∨ p = r := by simpa [edge] using hp
    rcases hcases with he | he
    · exact hpq he
    · exact hpr he
  have hpq_rp : edge p q ≠ edge r p := by
    intro h
    have hq : q ∈ edge r p := by rw [← h]; simp [edge]
    have hcases : q = r ∨ q = p := by simpa [edge] using hq
    rcases hcases with he | he
    · exact hqr he
    · exact hpq he.symm
  have hqr_rp : edge q r ≠ edge r p := by
    intro h
    have hq : q ∈ edge r p := by rw [← h]; simp [edge]
    have hcases : q = r ∨ q = p := by simpa [edge] using hq
    rcases hcases with he | he
    · exact hqr he
    · exact hpq he.symm
  simp [triangleEdges, hpq_qr, hpq_rp, hqr_rp,
    hpq_qr.symm, hpq_rp.symm, hqr_rp.symm]

/-- The triangle seed satisfies the endpoint-support invariant needed by S040. -/
theorem s041_triangleEdges_supported (p q r : Point) :
    ∀ e ∈ triangleEdges p q r, e ⊆ ([p, q, r] : List Point).toFinset := by
  intro e he x hx
  simp only [triangleEdges, Finset.mem_insert, Finset.mem_singleton] at he
  rcases he with rfl | rfl | rfl <;> simp [edge] at hx ⊢ <;> tauto

/-- Any exact retained-nearest-two planar order on n sites has exactly 2n-3
edges, and EVERY final edge joins vertices of the original site set.
This theorem extracts an existing genuine Grow witness and proves both
conclusions, independent of any convexity or special ellipse. -/
theorem s041_planeNearestTwoOrder_exact_edge_count
    {S : Finset Point} (horder : planeNearestTwoOrder S) :
    ∃ final : Finset Edge,
      planeEdges final ∧
      (∀ e ∈ final, e ⊆ S) ∧
      final.card = 2 * S.card - 3 := by
  obtain ⟨p, q, r, rest, final, hpq, hpr, hqr,
    hnodup, hcover, hg, hplane⟩ := horder
  obtain ⟨hsupport, hcount⟩ :=
    s040_grow_support_and_exact_count hg hnodup
      (s041_triangleEdges_supported p q r)
  have hseed : (triangleEdges p q r).card = 3 :=
    s041_triangleEdges_card p q r hpq hpr hqr
  have hsites : S.card = 3 + rest.length := by
    rw [← hcover]
    rw [List.toFinset_card_of_nodup hnodup]
    simp
    omega
  refine ⟨final, hplane, ?_, ?_⟩
  · intro e he
    rw [← hcover]
    exact hsupport e he
  · omega

end ETSHTS
