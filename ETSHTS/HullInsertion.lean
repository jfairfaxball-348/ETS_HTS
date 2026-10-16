module
public import ETSHTS.HullShield

@[expose] public section


/-!
# S042: planar insertion of exact convex-hull ears

The exact graph definition stores unoriented two-element edges, but its
planarity predicate quantifies over BOTH endpoint orderings. We transfer
hull-side certificates across edge equality before applying the proven
same-side crossing exclusion. No changes to the original graph model.
-/

noncomputable section
namespace ETSHTS

theorem s042_orientation_swap (p q x : Point) :
    orientation q p x = -orientation p q x := by
  unfold orientation
  ring

theorem s042_properCross_swap {p q r s : Point}
    (h : properCross p q r s) : properCross r s p q := by
  obtain ⟨x, hpq, hrs⟩ := h
  exact ⟨x, hrs, hpq⟩

theorem s042_hullSide_swap {S : Finset Point} {p q : Point}
    (h : hullSide S p q) : hullSide S q p := by
  obtain ⟨hp, hq, hpq, hsign⟩ := h
  refine ⟨hq, hp, hpq.symm, ?_⟩
  rcases hsign with hl | hr
  · exact Or.inr (fun x hx => by
      rw [s042_orientation_swap]
      linarith [hl x hx])
  · exact Or.inl (fun x hx => by
      rw [s042_orientation_swap]
      linarith [hr x hx])

/-- An unordered two-element edge with distinct known vertices has just
the two possible oriented endpoint representations. -/
theorem s042_edge_eq_pair_or_swap
    {a b p q : Point} (hpq : p ≠ q)
    (he : edge a b = edge p q) :
    (a = p ∧ b = q) ∨ (a = q ∧ b = p) := by
  have hpa : p = a ∨ p = b := by
    have hm : p ∈ edge a b := by rw [he]; simp [edge]
    simpa [edge] using hm
  have hqa : q = a ∨ q = b := by
    have hm : q ∈ edge a b := by rw [he]; simp [edge]
    simpa [edge] using hm
  rcases hpa with hpa | hpb
  · rcases hqa with hqa | hqb
    · exact False.elim (hpq (hpa.trans hqa.symm))
    · exact Or.inl ⟨hpa.symm, hqb.symm⟩
  · rcases hqa with hqa | hqb
    · exact Or.inr ⟨hqa.symm, hpb.symm⟩
    · exact False.elim (hpq (hpb.trans hqb.symm))

theorem s042_hullSide_edge_transport
    {S : Finset Point} {a b p q : Point}
    (hside : hullSide S p q)
    (he : edge a b = edge p q) : hullSide S a b := by
  rcases s042_edge_eq_pair_or_swap hside.2.2.1 he with h | h
  · rcases h with ⟨rfl, rfl⟩
    exact hside
  · rcases h with ⟨rfl, rfl⟩
    exact s042_hullSide_swap hside

/-- Inserting a genuine supporting hull side preserves the ORIGINAL
planeEdges predicate, for any planar chord graph supported on S. -/
theorem s042_planeEdges_insert_hullSide
    {S : Finset Point} {G : Finset Edge}
    (hno : noThreeCollinear S)
    (hplane : planeEdges G)
    (hsupport : ∀ e ∈ G, e ⊆ S)
    {p q : Point} (hside : hullSide S p q) :
    planeEdges (insert (edge p q) G) := by
  intro e₁ he₁ e₂ he₂ hdisj a b c d heq₁ heq₂
  rcases Finset.mem_insert.mp he₁ with hnew₁ | hold₁
  · rcases Finset.mem_insert.mp he₂ with hnew₂ | hold₂
    · have hd : Disjoint (edge p q) (edge p q) := by
        simpa only [hnew₁, hnew₂] using hdisj
      have hp : p ∈ edge p q := by simp [edge]
      exact False.elim ((Finset.disjoint_left.mp hd) hp hp)
    · have hside' : hullSide S a b :=
        s042_hullSide_edge_transport hside (heq₁.symm.trans hnew₁)
      have hc : c ∈ S := (hsupport e₂ hold₂) (by rw [heq₂]; simp [edge])
      have hd : d ∈ S := (hsupport e₂ hold₂) (by rw [heq₂]; simp [edge])
      have hdisj' : Disjoint (edge a b) (edge c d) := by
        simpa only [heq₁, heq₂] using hdisj
      exact s042_hullSide_safe_against_disjoint_chord
        hno hside' hc hd hdisj'
  · rcases Finset.mem_insert.mp he₂ with hnew₂ | hold₂
    · have hside' : hullSide S c d :=
        s042_hullSide_edge_transport hside (heq₂.symm.trans hnew₂)
      have ha : a ∈ S := (hsupport e₁ hold₁) (by rw [heq₁]; simp [edge])
      have hb : b ∈ S := (hsupport e₁ hold₁) (by rw [heq₁]; simp [edge])
      have hdisj' : Disjoint (edge c d) (edge a b) := by
        have h : Disjoint (edge a b) (edge c d) := by
          simpa only [heq₁, heq₂] using hdisj
        exact h.symm
      intro hcross
      exact (s042_hullSide_safe_against_disjoint_chord
        hno hside' ha hb hdisj') (s042_properCross_swap hcross)
    · exact hplane e₁ hold₁ e₂ hold₂ hdisj a b c d heq₁ heq₂

/-- Both compulsory hull-neighbour edges of an ear may be inserted into
ANY supported planar drawing with all previous edges retained. -/
theorem s042_planeEdges_insert_both_hullSides
    {S : Finset Point} {G : Finset Edge}
    (hno : noThreeCollinear S)
    (hplane : planeEdges G)
    (hsupport : ∀ e ∈ G, e ⊆ S)
    {v u w : Point}
    (hu : hullSide S v u) (hw : hullSide S v w) :
    planeEdges (G ∪ {edge v u, edge v w}) := by
  have hp₁ : planeEdges (insert (edge v u) G) :=
    s042_planeEdges_insert_hullSide hno hplane hsupport hu
  have hs₁ : ∀ e ∈ insert (edge v u) G, e ⊆ S := by
    intro e he x hx
    rcases Finset.mem_insert.mp he with hnew | hold
    · rw [hnew] at hx
      have hcase : x = v ∨ x = u := by simpa [edge] using hx
      rcases hcase with rfl | rfl
      · exact hu.1
      · exact hu.2.1
    · exact hsupport e hold hx
  have hp₂ : planeEdges (insert (edge v w) (insert (edge v u) G)) :=
    s042_planeEdges_insert_hullSide hno hp₁ hs₁ hw
  convert hp₂ using 1
  ext e
  simp [or_comm, or_left_comm, or_assoc]

end ETSHTS
