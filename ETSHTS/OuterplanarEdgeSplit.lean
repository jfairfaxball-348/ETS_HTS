module
public import ETSHTS.ConvexChordSeparation

@[expose] public section


noncomputable section
namespace ETSHTS

/-- Restrict the original edges to a specified original site subset. -/
noncomputable def s053_restrict (H : Finset Edge) (U : Finset Point) : Finset Edge := by
  classical
  exact H.filter (fun e => e ⊆ U)

theorem s053_edge_in_one_half {T : Finset Point} (hc : strictConvexPosition T)
    {H : Finset Edge} (hplane : planeEdges H)
    (hsupport : ∀ e ∈ H, e ⊆ T)
    {p q r s : Point} (hp : p ∈ T) (hq : q ∈ T) (hpq : p ≠ q)
    (hpqH : edge p q ∈ H) (hrs : r ≠ s) (hrsH : edge r s ∈ H) :
    edge r s ⊆ s052_positiveHalf T p q ∨
      edge r s ⊆ s052_negativeHalf T p q := by
  classical
  have hr := hsupport _ hrsH (show r ∈ edge r s by simp [edge])
  have hs := hsupport _ hrsH (show s ∈ edge r s by simp [edge])
  have hpp : orientation p q p = 0 := by unfold orientation; ring
  have hqq : orientation p q q = 0 := by unfold orientation; ring
  have hnocross : ¬ (0 < orientation p q r ∧ orientation p q s < 0) := by
    rintro ⟨hpos, hneg⟩
    have hpr : p ≠ r := by intro h; rw [← h, hpp] at hpos; linarith
    have hqr : q ≠ r := by intro h; rw [← h, hqq] at hpos; linarith
    have hps : p ≠ s := by intro h; rw [← h, hpp] at hneg; linarith
    have hqs : q ≠ s := by intro h; rw [← h, hqq] at hneg; linarith
    have hd : Disjoint (edge p q) (edge r s) := by
      simp [edge, Finset.disjoint_left, hpq, hpr, hps, hqr, hqs]
    exact hplane _ hpqH _ hrsH hd p q r s rfl rfl
      (s053_opposite_sides_cross hc hp hq hr hs hpq hpr hps hqr hqs hrs hpos hneg)
  have hnocross' : ¬ (orientation p q r < 0 ∧ 0 < orientation p q s) := by
    rintro ⟨hneg, hpos⟩
    have hpr : p ≠ r := by intro h; rw [← h, hpp] at hneg; linarith
    have hqr : q ≠ r := by intro h; rw [← h, hqq] at hneg; linarith
    have hps : p ≠ s := by intro h; rw [← h, hpp] at hpos; linarith
    have hqs : q ≠ s := by intro h; rw [← h, hqq] at hpos; linarith
    have hd : Disjoint (edge p q) (edge s r) := by
      simp [edge, Finset.disjoint_left, hpq, hpr, hps, hqr, hqs]
    have hsH : edge s r ∈ H := by simpa [edge, Finset.pair_comm] using hrsH
    exact hplane _ hpqH _ hsH hd p q s r rfl rfl
      (s053_opposite_sides_cross hc hp hq hs hr hpq hps hpr hqs hqr hrs.symm hpos hneg)
  have hsign : (0 ≤ orientation p q r ∧ 0 ≤ orientation p q s) ∨
      (orientation p q r ≤ 0 ∧ orientation p q s ≤ 0) := by
    by_cases h1 : 0 ≤ orientation p q r
    · by_cases h2 : 0 ≤ orientation p q s
      · exact Or.inl ⟨h1,h2⟩
      · exact Or.inr ⟨by by_contra h; exact hnocross ⟨lt_of_not_ge h, lt_of_not_ge h2⟩,
          le_of_lt (lt_of_not_ge h2)⟩
    · exact Or.inr ⟨le_of_lt (lt_of_not_ge h1), by
        by_contra h; exact hnocross' ⟨lt_of_not_ge h1, lt_of_not_ge h⟩⟩
  rcases hsign with ⟨h1,h2⟩ | ⟨h1,h2⟩
  · left; intro x hx
    have hx' : x = r ∨ x = s := by simpa [edge] using hx
    rcases hx' with rfl | rfl <;>
      simp [s052_positiveHalf, hr, hs, h1, h2]
  · right; intro x hx
    have hx' : x = r ∨ x = s := by simpa [edge] using hx
    rcases hx' with rfl | rfl <;>
      simp [s052_negativeHalf, hr, hs, h1, h2]

/-- Exact edge cover and one-edge overlap for a present genuine chord. -/
theorem s053_restriction_split {T : Finset Point} (hc : strictConvexPosition T)
    {H : Finset Edge} (hplane : planeEdges H)
    (hsupport : ∀ e ∈ H, e ⊆ T)
    (hgen : ∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b)
    {p q : Point} (hp : p ∈ T) (hq : q ∈ T) (hpq : p ≠ q)
    (hpqH : edge p q ∈ H) :
    s053_restrict H (s052_positiveHalf T p q) ∪
      s053_restrict H (s052_negativeHalf T p q) = H ∧
    s053_restrict H (s052_positiveHalf T p q) ∩
      s053_restrict H (s052_negativeHalf T p q) = {edge p q} := by
  classical
  have hn := s041_strictConvexPosition_noThreeCollinear T hc
  have hinter := s052_halves_intersection T hn p q hp hq hpq
  constructor
  · ext e
    simp only [s053_restrict, Finset.mem_union, Finset.mem_filter]
    constructor
    · rintro (⟨he,_⟩ | ⟨he,_⟩) <;> exact he
    · intro he
      obtain ⟨r,s,hrs,rfl⟩ := hgen e he
      rcases s053_edge_in_one_half hc hplane hsupport hp hq hpq hpqH hrs he with h | h
      · exact Or.inl ⟨he,h⟩
      · exact Or.inr ⟨he,h⟩
  · ext e
    simp only [s053_restrict, Finset.mem_inter, Finset.mem_filter, Finset.mem_singleton]
    constructor
    · rintro ⟨⟨he,hplus⟩,⟨_,hminus⟩⟩
      obtain ⟨r,s,hrs,rfl⟩ := hgen e he
      have hsub : edge r s ⊆ edge p q := by
        intro x hx
        change x ∈ ({p,q} : Finset Point)
        rw [← hinter]
        exact Finset.mem_inter.mpr ⟨hplus hx,hminus hx⟩
      exact Finset.eq_of_subset_of_card_le hsub (by simp [edge, hrs, hpq])
    · intro he
      subst e
      have hsub : edge p q ⊆ s052_positiveHalf T p q ∩ s052_negativeHalf T p q := by
        rw [hinter]; exact Finset.Subset.refl _
      exact ⟨⟨hpqH, fun x hx => (Finset.mem_inter.mp (hsub hx)).1⟩,
        ⟨hpqH, fun x hx => (Finset.mem_inter.mp (hsub hx)).2⟩⟩

end ETSHTS
