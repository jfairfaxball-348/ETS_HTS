module
public import ETSHTS.HullSaturation

@[expose] public section


/-!
# S043: recover the actual final compulsory insertion

The original Grow relation is retained exactly. These results split the
actual last insertion from a complete history, recover its exact Euclidean
plus Cartesian-lex predecessor ranking, and recover its planar prefix.
They do not infer that the last vertex is a cyclic hull ear: that requires
the independent outerplanar saturation and hull-neighbour argument.
-/

noncomputable section
namespace ETSHTS

/-- Peel the actual last insertion from the original chronological Grow,
with no reordering, synthetic ear witness or discarded edges. -/
theorem s043_grow_extract_last
    {previous : List Point} {G : Finset Edge}
    {rest : List Point} {v : Point} {final : Finset Edge}
    (hg : Grow previous G (rest ++ [v]) final) :
    ∃ (H : Finset Edge) (u w : Point),
      Grow previous G rest H ∧
      exactlyTwoNearest (previous ++ rest).toFinset v u w ∧
      final = H ∪ {edge v u, edge v w} := by
  induction rest generalizing previous G final with
  | nil =>
      simp only [List.nil_append] at hg
      cases hg with
      | insert previous G v u w tail final hnear hrest =>
          cases hrest with
          | finish _ _ =>
              exact ⟨G, u, w, Grow.finish previous G,
                by simpa using hnear, rfl⟩
  | cons x xs ih =>
      change Grow previous G (x :: (xs ++ [v])) final at hg
      cases hg with
      | insert previous G x u₀ w₀ tail final hnear hrest =>
          obtain ⟨H, u, w, hprefix, hnearest, hfinal⟩ := ih hrest
          refine ⟨H, u, w, ?_, ?_, hfinal⟩
          · exact Grow.insert previous G x u₀ w₀ xs H hnear hprefix
          · simpa [List.append_assoc] using hnearest

/-- In any genuinely planar completed Grow history, deleting its last
insertion recovers the *same* earlier history, an exactly ranked final
nearest predecessor pair and an independently planar earlier graph. -/
theorem s043_grow_last_prefix_planar
    {previous : List Point} {G : Finset Edge}
    {rest : List Point} {v : Point} {final : Finset Edge}
    (hg : Grow previous G (rest ++ [v]) final)
    (hplane : planeEdges final) :
    ∃ (H : Finset Edge) (u w : Point),
      Grow previous G rest H ∧
      exactlyTwoNearest (previous ++ rest).toFinset v u w ∧
      final = H ∪ {edge v u, edge v w} ∧
      planeEdges H := by
  obtain ⟨H, u, w, hprefix, hnear, hfinal⟩ :=
    s043_grow_extract_last hg
  refine ⟨H, u, w, hprefix, hnear, hfinal, ?_⟩
  apply s038_planeEdges_of_subset (H := final)
  · rw [hfinal]
    exact Finset.subset_union_left
  · exact hplane

/-- Exactly two final edges can contain the last genuinely fresh arrival;
none of the older retained edges may contain it. This is the precise
degree-two ingredient needed for CLM0099 necessity, before hull saturation. -/
theorem s043_grow_last_incident_edges
    {previous : List Point} {G : Finset Edge}
    {rest : List Point} {v : Point} {final : Finset Edge}
    (hg : Grow previous G (rest ++ [v]) final)
    (hnodup : (previous ++ (rest ++ [v])).Nodup)
    (hseed : ∀ e ∈ G, e ⊆ previous.toFinset) :
    ∃ (H : Finset Edge) (u w : Point),
      Grow previous G rest H ∧
      exactlyTwoNearest (previous ++ rest).toFinset v u w ∧
      final = H ∪ {edge v u, edge v w} ∧
      (∀ e ∈ final, v ∈ e → e = edge v u ∨ e = edge v w) := by
  obtain ⟨H, u, w, hprefix, hnear, hfinal⟩ :=
    s043_grow_extract_last hg
  have hn : ((previous ++ rest) ++ [v]).Nodup := by
    simpa [List.append_assoc] using hnodup
  have hnpre : (previous ++ rest).Nodup :=
    (List.nodup_append.mp hn).1
  have hnot : v ∉ (previous ++ rest).toFinset := by
    intro hv
    have hv' : v ∈ previous ++ rest := by simpa using hv
    have hne := (List.nodup_append.mp hn).2.2 v hv' v (by simp)
    exact hne rfl
  have hsupport : ∀ e ∈ H, e ⊆ (previous ++ rest).toFinset :=
    (s040_grow_support_and_exact_count hprefix hnpre hseed).1
  refine ⟨H, u, w, hprefix, hnear, hfinal, ?_⟩
  intro e he hve
  rw [hfinal] at he
  rcases Finset.mem_union.mp he with hold | hnew
  · exact False.elim (hnot (hsupport e hold hve))
  · simpa only [Finset.mem_insert, Finset.mem_singleton] using hnew

end ETSHTS
