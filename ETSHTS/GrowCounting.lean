import ETSHTS.EarCounting

/-!
# S040 — full-history edge support and exact two-edge counting

This is a strictly combinatorial formalisation of the existing Grow
constructor, not an alternative geometry or nearest-predecessor rule.
In a complete duplicate-free history, each compulsory insertion creates
exactly two new distinct edges and retains the old ones.

Still open: triangle seed cardinality combined into 2n-3, hull-side
saturation, metric-ear necessity and converse, CLM0099 itself and the
geometric/ellipse target declarations.
-/

noncomputable section
namespace ETSHTS

/-- Every edge in a complete duplicate-free Grow is supported on the
complete site history, and the final graph has exactly two additional
edges per appended site. Uses S039's original exact two-nearest rule. -/
theorem s040_grow_support_and_exact_count
    {previous : List Point} {G : Finset Edge}
    {rest : List Point} {final : Finset Edge}
    (hg : Grow previous G rest final) :
    (previous ++ rest).Nodup →
    (∀ e ∈ G, e ⊆ previous.toFinset) →
    (∀ e ∈ final, e ⊆ (previous ++ rest).toFinset) ∧
      final.card = G.card + 2 * rest.length := by
  induction hg with
  | finish previous G =>
      intro _ hG
      constructor
      · intro e he
        simpa using hG e he
      · simp
  | insert previous G v u w rest final hnear hrest ih =>
      intro hn hG
      have hdisj : previous.Disjoint (v :: rest) :=
        List.disjoint_of_nodup_append hn
      have hvprev : v ∉ previous := by
        intro hv
        exact hdisj hv (by simp)
      have hvfresh : v ∉ previous.toFinset := by
        simpa using hvprev
      have hnrec : ((previous ++ [v]) ++ rest).Nodup := by
        simpa [List.append_assoc] using hn
      have hstep :
          ∀ e ∈ G ∪ {edge v u, edge v w},
            e ⊆ (previous ++ [v]).toFinset := by
        intro e he x hx
        have hx' := s039_insert_edges_supported hnear hG e he hx
        rcases Finset.mem_insert.mp hx' with hxv | hxprev
        · simp [hxv]
        · simp [hxprev]
      obtain ⟨hfinal, hcount⟩ := ih hnrec hstep
      constructor
      · intro e he
        simpa [List.append_assoc] using hfinal e he
      · calc
          final.card =
              (G ∪ {edge v u, edge v w}).card + 2 * rest.length := hcount
          _ = (G.card + 2) + 2 * rest.length := by
              rw [s039_fresh_insert_two_edges hnear hvfresh hG]
          _ = G.card + 2 * (v :: rest).length := by
              simp
              omega

end ETSHTS
