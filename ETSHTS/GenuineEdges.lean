import ETSHTS.HullLastBridge

/-!
# S051 — genuine original retained edges and the corrected saturation interface

The original `planeEdges` predicate does not forbid singleton/empty
Finsets. Consequently the former universal cap premise is not true.
The lemmas here prove the genuine-two-endpoint invariant for the *actual*
chronological `Grow` history and preserve it when adjoining a genuine
hull side. The corrected saturation theorem explicitly demands that the
outerplanar cap apply only to genuine supported simple edges.

No outerplanar cap is postulated as a theorem. Its combinatorial proof is
a separate and still-open obligation needed for the exact CLM0099.
-/

noncomputable section
namespace ETSHTS

/-- Every edge in a genuine triangle seed has two distinct endpoints. -/
theorem s051_triangleEdges_genuine (p q r : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) :
    ∀ e ∈ triangleEdges p q r,
      ∃ a b : Point, a ≠ b ∧ e = edge a b := by
  intro e he
  simp only [triangleEdges, Finset.mem_insert, Finset.mem_singleton] at he
  rcases he with rfl | rfl | rfl
  · exact ⟨p, q, hpq, rfl⟩
  · exact ⟨q, r, hqr, rfl⟩
  · exact ⟨r, p, hpr.symm, rfl⟩

/-- A *duplicate-free original Grow* never produces a degenerate edge.
In particular, this excludes empty and singleton edge Finsets. -/
theorem s051_grow_edges_genuine
    {previous : List Point} {G : Finset Edge}
    {rest : List Point} {final : Finset Edge}
    (hg : Grow previous G rest final)
    (hn : (previous ++ rest).Nodup)
    (hG : ∀ e ∈ G, ∃ p q : Point, p ≠ q ∧ e = edge p q) :
    ∀ e ∈ final, ∃ p q : Point, p ≠ q ∧ e = edge p q := by
  induction hg with
  | finish previous G =>
      simpa using hG
  | insert previous G v u w rest final hnear hrest ih =>
      have hdisj : previous.Disjoint (v :: rest) :=
        List.disjoint_of_nodup_append hn
      have hvprev : v ∉ previous := by
        intro hv
        exact hdisj hv (by simp)
      have hvfresh : v ∉ previous.toFinset := by
        simpa using hvprev
      have hnrec : ((previous ++ [v]) ++ rest).Nodup := by
        simpa [List.append_assoc] using hn
      have hvu : v ≠ u := by
        intro h
        apply hvfresh
        rw [h]
        exact hnear.1
      have hvw : v ≠ w := by
        intro h
        apply hvfresh
        rw [h]
        exact hnear.2.1
      have hnext :
          ∀ e ∈ G ∪ {edge v u, edge v w},
            ∃ p q : Point, p ≠ q ∧ e = edge p q := by
        intro e he
        rcases Finset.mem_union.mp he with hold | hnew
        · exact hG e hold
        · simp only [Finset.mem_insert, Finset.mem_singleton] at hnew
          rcases hnew with rfl | rfl
          · exact ⟨v, u, hvu, rfl⟩
          · exact ⟨v, w, hvw, rfl⟩
      exact ih hnrec hnext

/-- The final edge set of an original planar nearest-two order is genuine;
unrestricted `planeEdges` alone does NOT imply this. -/
theorem s051_planeNearestTwoOrder_edges_genuine
    {S : Finset Point} (horder : planeNearestTwoOrder S) :
    ∃ final : Finset Edge,
      planeEdges final ∧
      (∀ e ∈ final, e ⊆ S) ∧
      (∀ e ∈ final, ∃ p q : Point, p ≠ q ∧ e = edge p q) ∧
      final.card = 2 * S.card - 3 := by
  obtain ⟨p, q, r, rest, final, hpq, hpr, hqr,
    hn, hcover, hg, hp⟩ := horder
  obtain ⟨hsupport, hcount⟩ :=
    s040_grow_support_and_exact_count hg hn
      (s041_triangleEdges_supported p q r)
  have hseed := s041_triangleEdges_card p q r hpq hpr hqr
  have hsites : S.card = 3 + rest.length := by
    rw [← hcover, List.toFinset_card_of_nodup hn]
    simp
    omega
  refine ⟨final, hp, ?_, ?_, ?_⟩
  · intro e he
    rw [← hcover]
    exact hsupport e he
  · exact s051_grow_edges_genuine hg hn
      (s051_triangleEdges_genuine p q r hpq hpr hqr)
  · omega

/-- Inserting a true hull side into a genuine-edge graph preserves the
two-distinct-endpoint property. -/
theorem s051_insert_hullSide_edges_genuine
    {S : Finset Point} {G : Finset Edge}
    (hG : ∀ e ∈ G, ∃ p q : Point, p ≠ q ∧ e = edge p q)
    {p q : Point} (hside : hullSide S p q) :
    ∀ e ∈ insert (edge p q) G,
      ∃ a b : Point, a ≠ b ∧ e = edge a b := by
  intro e he
  rcases Finset.mem_insert.mp he with rfl | hold
  · exact ⟨p, q, hside.2.2.1, rfl⟩
  · exact hG e hold

/-- Corrected saturation step: the upper bound only concerns actual
two-distinct-vertex edges. It is false with this conjunct dropped. -/
theorem s051_hullSide_present_of_genuine_cap
    {S : Finset Point} (hno : noThreeCollinear S)
    (hcap : ∀ H : Finset Edge,
      planeEdges H →
      (∀ e ∈ H, e ⊆ S) →
      (∀ e ∈ H, ∃ p q : Point, p ≠ q ∧ e = edge p q) →
      H.card ≤ 2 * S.card - 3)
    {G : Finset Edge} (hplane : planeEdges G)
    (hsupport : ∀ e ∈ G, e ⊆ S)
    (hgenuine : ∀ e ∈ G, ∃ p q : Point, p ≠ q ∧ e = edge p q)
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
  have hgen := s051_insert_hullSide_edges_genuine hgenuine hside
  have hc := hcap (insert (edge p q) G) hp hs hgen
  have hnewcard : (insert (edge p q) G).card = G.card + 1 := by
    simp [hmiss]
  omega

/-- Corrected form of S042 saturation for the *original* complete
history. The finite geometric outerplanar cap remains to be proved. -/
theorem s051_order_saturates_all_hullSides_of_genuine_cap
    {S : Finset Point} (hconv : strictConvexPosition S)
    (hcap : ∀ H : Finset Edge,
      planeEdges H →
      (∀ e ∈ H, e ⊆ S) →
      (∀ e ∈ H, ∃ p q : Point, p ≠ q ∧ e = edge p q) →
      H.card ≤ 2 * S.card - 3)
    (horder : planeNearestTwoOrder S) :
    ∃ final : Finset Edge,
      planeEdges final ∧
      (∀ e ∈ final, e ⊆ S) ∧
      (∀ e ∈ final, ∃ p q : Point, p ≠ q ∧ e = edge p q) ∧
      (∀ p q : Point, hullSide S p q → edge p q ∈ final) := by
  obtain ⟨final, hp, hs, hgenuine, hcount⟩ :=
    s051_planeNearestTwoOrder_edges_genuine horder
  refine ⟨final, hp, hs, hgenuine, ?_⟩
  intro p q hside
  exact s051_hullSide_present_of_genuine_cap
    (s041_strictConvexPosition_noThreeCollinear S hconv)
    hcap hp hs hgenuine hcount hside

end ETSHTS
