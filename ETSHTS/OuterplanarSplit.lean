import ETSHTS.FiniteHullNeighbours

/-!
S052: exact signed half-plane split for the unrestricted finite
strict-convex outerplanar counting campaign.

This is a genuine, reusable step in the outerplanar-cap induction, NOT
the outerplanar cap itself. A non-hull chord partitions the site set
into two proper subsets with common vertices exactly its two endpoints.
The missing crossing-of-opposite-halves and edge-count induction remain
explicitly open.
-/

noncomputable section
namespace ETSHTS

/-- Original finite vertices in the nonnegative orientation half-plane. -/
noncomputable def s052_positiveHalf (T : Finset Point) (p q : Point) :
    Finset Point := by
  classical
  exact T.filter (fun z => 0 ≤ orientation p q z)

/-- Original finite vertices in the nonpositive orientation half-plane. -/
noncomputable def s052_negativeHalf (T : Finset Point) (p q : Point) :
    Finset Point := by
  classical
  exact T.filter (fun z => orientation p q z ≤ 0)

/-- Both closed chord half-planes cover every original site. -/
theorem s052_halves_union (T : Finset Point) (p q : Point) :
    s052_positiveHalf T p q ∪ s052_negativeHalf T p q = T := by
  classical
  ext z
  simp only [Finset.mem_union, s052_positiveHalf, s052_negativeHalf,
    Finset.mem_filter]
  constructor
  · rintro (⟨hz, _⟩ | ⟨hz, _⟩) <;> exact hz
  · intro hz
    rcases le_total 0 (orientation p q z) with h | h
    · exact Or.inl ⟨hz, h⟩
    · exact Or.inr ⟨hz, h⟩

/-- With no three collinear, exactly the two chord endpoints belong
to both closed sides. -/
theorem s052_halves_intersection
    (T : Finset Point) (hno : noThreeCollinear T)
    (p q : Point) (hp : p ∈ T) (hq : q ∈ T)
    (hpq : p ≠ q) :
    s052_positiveHalf T p q ∩ s052_negativeHalf T p q =
      ({p, q} : Finset Point) := by
  classical
  have hpp : orientation p q p = 0 := by unfold orientation; ring
  have hqq : orientation p q q = 0 := by unfold orientation; ring
  ext z
  simp only [Finset.mem_inter, s052_positiveHalf, s052_negativeHalf,
    Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨⟨hz, hge⟩, ⟨_, hle⟩⟩
    have hzero : orientation p q z = 0 := le_antisymm hle hge
    by_cases hzp : z = p
    · exact Or.inl hzp
    by_cases hzq : z = q
    · exact Or.inr hzq
    exact False.elim
      ((hno p hp q hq z hz hpq (by intro h; exact hzp h.symm) (by intro h; exact hzq h.symm)) hzero)
  · rintro (rfl | rfl)
    · exact ⟨⟨hp, by simp [hpp]⟩,
        ⟨hp, by simp [hpp]⟩⟩
    · exact ⟨⟨hq, by simp [hqq]⟩,
        ⟨hq, by simp [hqq]⟩⟩

/-- The exact cardinality identity for either chord-induced partition. -/
theorem s052_halves_card
    (T : Finset Point) (hno : noThreeCollinear T)
    (p q : Point) (hp : p ∈ T) (hq : q ∈ T)
    (hpq : p ≠ q) :
    (s052_positiveHalf T p q).card +
      (s052_negativeHalf T p q).card = T.card + 2 := by
  classical
  have hh := Finset.card_union_add_card_inter
    (s052_positiveHalf T p q) (s052_negativeHalf T p q)
  rw [s052_halves_union, s052_halves_intersection T hno p q hp hq hpq] at hh
  have hpqcard : ({p, q} : Finset Point).card = 2 := by
    simp [hpq]
  rw [hpqcard] at hh
  omega

/-- A genuine non-hull chord has at least one original vertex strictly
on either side of its supporting line. -/
theorem s052_nonhull_witnesses
    (T : Finset Point) (p q : Point)
    (hp : p ∈ T) (hq : q ∈ T) (hpq : p ≠ q)
    (hnon : ¬ hullSide T p q) :
    (∃ r ∈ T, orientation p q r < 0) ∧
      (∃ s ∈ T, 0 < orientation p q s) := by
  have hn : ¬ ((∀ x ∈ T, 0 ≤ orientation p q x) ∨
      (∀ x ∈ T, orientation p q x ≤ 0)) := by
    intro h
    exact hnon ⟨hp, hq, hpq, h⟩
  have hn₁ : ¬ (∀ x ∈ T, 0 ≤ orientation p q x) :=
    fun h => hn (Or.inl h)
  have hn₂ : ¬ (∀ x ∈ T, orientation p q x ≤ 0) :=
    fun h => hn (Or.inr h)
  push_neg at hn₁ hn₂
  exact ⟨hn₁, hn₂⟩

/-- A non-hull chord splits the original finite sites into two
STRICTLY smaller site sets, permitting strong induction on the original
number of sites once the geometric crossing/edge partition is proved. -/
theorem s052_nonhull_halves_proper
    (T : Finset Point) (p q : Point)
    (hp : p ∈ T) (hq : q ∈ T) (hpq : p ≠ q)
    (hnon : ¬ hullSide T p q) :
    s052_positiveHalf T p q ⊂ T ∧
      s052_negativeHalf T p q ⊂ T := by
  classical
  obtain ⟨⟨r, hr, hrneg⟩, ⟨s, hs, hspos⟩⟩ :=
    s052_nonhull_witnesses T p q hp hq hpq hnon
  have hpsub : s052_positiveHalf T p q ⊆ T := by
    intro z hz
    exact (Finset.mem_filter.mp hz).1
  have hnsub : s052_negativeHalf T p q ⊆ T := by
    intro z hz
    exact (Finset.mem_filter.mp hz).1
  apply And.intro
  · apply (Finset.ssubset_iff_of_subset hpsub).2
    refine ⟨r, hr, ?_⟩
    simp only [s052_positiveHalf, Finset.mem_filter, not_and]
    intro _
    exact not_le.mpr hrneg
  · apply (Finset.ssubset_iff_of_subset hnsub).2
    refine ⟨s, hs, ?_⟩
    simp only [s052_negativeHalf, Finset.mem_filter, not_and]
    intro _
    exact not_le.mpr hspos

/-- Only the TRUE universal simple-edge convex outerplanar bound remains
between the compiled S051 necessity induction and the literal CLM0099.
The second formerly missing finite geometric premise is discharged by
s052_two_hull_sides in the UNCHANGED original predicates. -/
theorem s052_clm0099_of_genuine_outerplanar_cap
    (hcap : ∀ T : Finset Point, 4 ≤ T.card →
      strictConvexPosition T →
      ∀ H : Finset Edge, planeEdges H →
        (∀ e ∈ H, e ⊆ T) →
        (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
        H.card ≤ 2 * T.card - 3) : CLM0099 := by
  apply s051_clm0099_of_genuine_outerplanar_cap_and_two_sides hcap
  intro T h4 hconv v hv
  exact s052_two_hull_sides T h4 hconv v hv

end ETSHTS
