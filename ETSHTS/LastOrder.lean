import ETSHTS.LastArrival

/-!
# S043: extracting the preceding planar order from a complete order

This is a necessity-side reduction for the *original* retained-edge
nearest-two process. It recovers a real chronological predecessor order
rather than postulating an ear-deletion history. The missing geometric
step is still to prove that the final compulsory pair are the two cyclic
hull neighbours.
-/

noncomputable section
namespace ETSHTS

/-- A true final insertion of a concrete chronological order can be
removed while retaining a planar original nearest-two order of the
preceding vertices. -/
theorem s043_order_peel_explicit_last
    (p q r : Point) (rest : List Point) (v : Point)
    (final : Finset Edge)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hnodup : ([p, q, r] ++ (rest ++ [v])).Nodup)
    (hg : Grow [p, q, r] (triangleEdges p q r) (rest ++ [v]) final)
    (hplane : planeEdges final) :
    ∃ u w : Point,
      planeNearestTwoOrder (([p, q, r] ++ rest).toFinset) ∧
      exactlyTwoNearest (([p, q, r] ++ rest).toFinset) v u w := by
  obtain ⟨H, u, w, hprefix, hnearest, _, hplaneH⟩ :=
    s043_grow_last_prefix_planar hg hplane
  have hn : (([p, q, r] ++ rest) ++ [v]).Nodup := by
    simpa [List.append_assoc] using hnodup
  have hnpre : ([p, q, r] ++ rest).Nodup :=
    (List.nodup_append.mp hn).1
  refine ⟨u, w, ?_, hnearest⟩
  exact ⟨p, q, r, rest, H, hpq, hpr, hqr, hnpre, rfl,
    hprefix, hplaneH⟩

/-- Elementary last-element decomposition, independent of a generic
list API naming convention; used for arbitrary nontrivial order tails. -/
theorem s043_nonempty_list_has_last (xs : List Point) (hne : xs ≠ []) :
    ∃ (pref : List Point) (v : Point), xs = pref ++ [v] := by
  induction xs with
  | nil =>
      exact (hne rfl).elim
  | cons x tail ih =>
      cases tail with
      | nil =>
          exact ⟨[], x, rfl⟩
      | cons y ys =>
          obtain ⟨pre, v, hsplit⟩ := ih (by simp)
          refine ⟨x :: pre, v, ?_⟩
          simp [hsplit]

/-- Every original planar order with at least four sites has a last
site whose deletion has an actual original planar order, and whose
compulsory two predecessors are exactly nearest among the surviving
set. This is NOT yet the cyclic-neighbour metric-ear conclusion. -/
theorem s043_planeOrder_has_last_ranked_predecessors
    {S : Finset Point}
    (horder : planeNearestTwoOrder S) (hcard : 4 ≤ S.card) :
    ∃ (v u w : Point),
      v ∈ S ∧
      planeNearestTwoOrder (S.erase v) ∧
      exactlyTwoNearest (S.erase v) v u w := by
  obtain ⟨p, q, r, tail, final, hpq, hpr, hqr,
    hnodup, hcover, hg, hplane⟩ := horder
  have hlen : S.card = 3 + tail.length := by
    rw [← hcover, List.toFinset_card_of_nodup hnodup]
    simp
    omega
  have hne : tail ≠ [] := by
    intro he
    subst tail
    simp at hlen
    omega
  obtain ⟨xs, v, htail⟩ := s043_nonempty_list_has_last tail hne
  subst tail
  have hn : (([p, q, r] ++ xs) ++ [v]).Nodup := by
    simpa [List.append_assoc] using hnodup
  have hdisj : ([p, q, r] ++ xs).Disjoint [v] :=
    (List.nodup_append.mp hn).2.2
  have hnot : v ∉ ([p, q, r] ++ xs).toFinset := by
    intro hv
    exact (List.disjoint_singleton.mp hdisj) (by simpa using hv)
  have hset : S = insert v (([p, q, r] ++ xs).toFinset) := by
    rw [← hcover]
    ext x
    simp [List.mem_append, or_left_comm, or_comm, or_assoc]
  have hpref : (([p, q, r] ++ xs).toFinset) = S.erase v := by
    rw [hset]
    ext x
    simp only [Finset.mem_erase, Finset.mem_insert]
    constructor
    · intro hx
      refine ⟨?_, Or.inr hx⟩
      intro he
      subst x
      exact hnot hx
    · rintro ⟨hne, hv | hx⟩
      · exact (hne hv).elim
      · exact hx
  have hv : v ∈ S := by
    rw [hset]
    simp
  obtain ⟨u, w, hpre, hnnear⟩ :=
    s043_order_peel_explicit_last p q r xs v final
      hpq hpr hqr hnodup hg hplane
  refine ⟨v, u, w, hv, ?_, ?_⟩
  · rw [← hpref]
    exact hpre
  · rw [← hpref]
    exact hnnear

end ETSHTS
