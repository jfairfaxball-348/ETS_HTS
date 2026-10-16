module
public import ETSHTS.FourPoint

@[expose] public section


/-!
# S032: exact three-predecessor selection, including Cartesian lex ties

This supplies the missing purely order-theoretic fact: any three DISTINCT
predecessors have a pair satisfying the repository's exact compulsory
two-nearest rule, even when squared Euclidean distances are equal.
No general-position or noncrossing conclusion is smuggled into this result.
-/

noncomputable section
namespace ETSHTS

theorem cartLexLT_trans {p q r : Point}
    (hpq : cartLexLT p q) (hqr : cartLexLT q r) :
    cartLexLT p r := by
  unfold cartLexLT at hpq hqr ⊢
  rcases hpq with hx | ⟨hx, hy⟩
  · rcases hqr with hx' | ⟨hx', _⟩
    · exact Or.inl (lt_trans hx hx')
    · exact Or.inl (by linarith)
  · rcases hqr with hx' | ⟨hx', hy'⟩
    · exact Or.inl (by linarith)
    · exact Or.inr ⟨by linarith, lt_trans hy hy'⟩

theorem cartLexLT_total_of_ne (p q : Point) (hne : p ≠ q) :
    cartLexLT p q ∨ cartLexLT q p := by
  unfold cartLexLT
  rcases lt_trichotomy p.1 q.1 with hx | hx | hx
  · exact Or.inl (Or.inl hx)
  · have hy : p.2 ≠ q.2 := by
      intro he
      exact hne (Prod.ext hx he)
    rcases lt_trichotomy p.2 q.2 with hlt | heq | hgt
    · exact Or.inl (Or.inr ⟨hx, hlt⟩)
    · exact (hy heq).elim
    · exact Or.inr (Or.inr ⟨hx.symm, hgt⟩)
  · exact Or.inr (Or.inl hx)

/-- The precise distance-then-Cartesian-lex predecessor rank is transitive. -/
theorem priority_trans {v p q r : Point}
    (hpq : priority v p q) (hqr : priority v q r) :
    priority v p r := by
  unfold priority at hpq hqr ⊢
  rcases hpq with hd | ⟨hd, hl⟩
  · rcases hqr with hd' | ⟨hd', _⟩
    · exact Or.inl (lt_trans hd hd')
    · exact Or.inl (by linarith)
  · rcases hqr with hd' | ⟨hd', hl'⟩
    · exact Or.inl (by linarith)
    · exact Or.inr ⟨by linarith, cartLexLT_trans hl hl'⟩

/-- Distinct sites have a comparable exact priority, even at tied distance. -/
theorem priority_total_of_ne (v p q : Point) (hne : p ≠ q) :
    priority v p q ∨ priority v q p := by
  unfold priority
  rcases lt_trichotomy (sqDist v p) (sqDist v q) with h | h | h
  · exact Or.inl (Or.inl h)
  · rcases cartLexLT_total_of_ne p q hne with hl | hl
    · exact Or.inl (Or.inr ⟨h, hl⟩)
    · exact Or.inr (Or.inr ⟨h.symm, hl⟩)
  · exact Or.inr (Or.inl h)

/-- For a triple with prescribed last-ranked site t, u and w are the two
compulsory nearest predecessors, irrespective of a u/w tie. -/
theorem exactlyTwoNearest_of_three_rank
    {u w t v : Point} (huw : u ≠ w)
    (hut : priority v u t) (hwt : priority v w t) :
    exactlyTwoNearest ({u, w, t} : Finset Point) v u w := by
  refine ⟨by simp, by simp, huw, ?_⟩
  intro x hx hxu hxw
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl
  · exact (hxu rfl).elim
  · exact (hxw rfl).elim
  · exact ⟨hut, hwt⟩

/-- Unconditional existence of the mandatory nearest pair among any three
distinct prior vertices, with NO strict gap assumptions and NO changed
tie-breaker. The four-point planarity remains a separate geometric task. -/
theorem exactlyTwoNearest_three_exists (p q r v : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) :
    ∃ u w : Point, exactlyTwoNearest ({p, q, r} : Finset Point) v u w := by
  have build (u w t : Point) (huw : u ≠ w)
      (hut : priority v u t) (hwt : priority v w t)
      (hset : ({u, w, t} : Finset Point) = {p, q, r}) :
      exactlyTwoNearest ({p, q, r} : Finset Point) v u w := by
    simpa only [hset] using exactlyTwoNearest_of_three_rank huw hut hwt
  rcases priority_total_of_ne v p q hpq with hpq' | hqp'
  · rcases priority_total_of_ne v q r hqr with hqr' | hrq'
    · exact ⟨p, q, build p q r hpq
        (priority_trans hpq' hqr') hqr' rfl⟩
    · rcases priority_total_of_ne v p r hpr with hpr' | hrp'
      · refine ⟨p, r, build p r q hpr hpq' hrq' ?_⟩
        ext x
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto
      · refine ⟨r, p, build r p q hpr.symm
            (priority_trans hrp' hpq') hpq' ?_⟩
        ext x
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto
  · rcases priority_total_of_ne v p r hpr with hpr' | hrp'
    · refine ⟨q, p, build q p r hpq.symm
          (priority_trans hqp' hpr') hpr' ?_⟩
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    · rcases priority_total_of_ne v q r hqr with hqr' | hrq'
      · refine ⟨q, r, build q r p hqr hqp' hrp' ?_⟩
        ext x
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto
      · refine ⟨r, q, build r q p hqr.symm
            (priority_trans hrq' hqp') hqp' ?_⟩
        ext x
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto

/-- The exact fourth insertion needs no strict distance gap: the selected
pair may contain distance ties resolved by Cartesian lexicographic order. -/
theorem four_point_order_from_exact_nearest (p q r v u w : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hv : v ∉ ({p, q, r} : Finset Point))
    (hnear : exactlyTwoNearest ({p, q, r} : Finset Point) v u w)
    (hplane : planeEdges
      (triangleEdges p q r ∪ {edge v u, edge v w})) :
    planeNearestTwoOrder ({p, q, r, v} : Finset Point) := by
  have hvp : v ≠ p := by
    intro heq
    apply hv
    simp [heq]
  have hvq : v ≠ q := by
    intro heq
    apply hv
    simp [heq]
  have hvr : v ≠ r := by
    intro heq
    apply hv
    simp [heq]
  have hn : ([p, q, r, v] : List Point).Nodup := by
    simp [List.nodup_cons, hpq, hpr, hqr, hvp, hvq, hvr,
      hvp.symm, hvq.symm, hvr.symm]
  refine ⟨p, q, r, [v], triangleEdges p q r ∪ {edge v u, edge v w},
    hpq, hpr, hqr, ?_, ?_, ?_, hplane⟩
  · simpa using hn
  · simp
  · apply Grow.insert [p, q, r] (triangleEdges p q r)
      v u w [] (triangleEdges p q r ∪ {edge v u, edge v w})
    · simpa using hnear
    · exact Grow.finish ([p, q, r] ++ [v])
        (triangleEdges p q r ∪ {edge v u, edge v w})

/-- In the interior-fourth-site case it suffices to establish noncrossing
for every permissible nearest pair. Nearest pair existence is now proved. -/
theorem four_point_order_of_all_nearest_pairs_plane (p q r v : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hv : v ∉ ({p, q, r} : Finset Point))
    (hplane : ∀ u w : Point,
      exactlyTwoNearest ({p, q, r} : Finset Point) v u w →
      planeEdges (triangleEdges p q r ∪ {edge v u, edge v w})) :
    planeNearestTwoOrder ({p, q, r, v} : Finset Point) := by
  obtain ⟨u, w, hnear⟩ := exactlyTwoNearest_three_exists p q r v hpq hpr hqr
  exact four_point_order_from_exact_nearest p q r v u w
    hpq hpr hqr hv hnear (hplane u w hnear)

end ETSHTS
