import ETSHTS.OuterplanarEdgeSplit

noncomputable section
namespace ETSHTS

theorem s053_three_site_cap {T : Finset Point} (h3 : T.card = 3)
    {H : Finset Edge} (hs : ∀ e ∈ H, e ⊆ T)
    (hg : ∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) : H.card ≤ 3 := by
  classical
  obtain ⟨p,q,r,hpq,hpr,hqr,hT⟩ := Finset.card_eq_three.mp h3
  have hsub : H ⊆ triangleEdges p q r := by
    intro e he
    obtain ⟨a,b,hab,rfl⟩ := hg e he
    have ha := hs _ he (show a ∈ edge a b by simp [edge])
    have hb := hs _ he (show b ∈ edge a b by simp [edge])
    rw [hT] at ha hb
    simp only [Finset.mem_insert, Finset.mem_singleton] at ha hb
    rcases ha with rfl | rfl | rfl <;> rcases hb with rfl | rfl | rfl <;>
      simp_all [triangleEdges, edge, Finset.pair_comm]
  have hh := Finset.card_le_card hsub
  rw [s041_triangleEdges_card p q r hpq hpr hqr] at hh
  exact hh

/-- At a fixed vertex, a hull-side-only graph has at most two edges.
This is the local incidence count used in the hull-only induction branch. -/
theorem s053_hull_incident_card {T : Finset Point}
    (h4 : 4 ≤ T.card) (hc : strictConvexPosition T) {v : Point} (hv : v ∈ T)
    {H : Finset Edge}
    (hg : ∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b)
    (hhull : ∀ a b : Point, edge a b ∈ H → a ≠ b → hullSide T a b) :
    (H.filter (fun e => v ∈ e)).card ≤ 2 := by
  classical
  obtain ⟨u,w,huw,hu,hw⟩ := s052_two_hull_sides T h4 hc v hv
  have hn := s041_strictConvexPosition_noThreeCollinear T hc
  have hsub : H.filter (fun e => v ∈ e) ⊆ {edge v u, edge v w} := by
    intro e he
    obtain ⟨he,hve⟩ := Finset.mem_filter.mp he
    obtain ⟨a,b,hab,rfl⟩ := hg e he
    have hcase : v = a ∨ v = b := by simpa [edge] using hve
    rcases hcase with rfl | rfl
    · have hside := hhull a b he hab
      rcases s047_hullSide_at_most_two hn hu hw hside huw with rfl | rfl <;> simp
    · have he' : edge b a ∈ H := by simpa [edge, Finset.pair_comm] using he
      have hside := hhull b a he' hab.symm
      rcases s047_hullSide_at_most_two hn hu hw hside huw with rfl | rfl <;>
        simp [edge, Finset.pair_comm]
  apply le_trans (Finset.card_le_card hsub)
  by_cases h : edge v u = edge v w <;> simp [h]

/-- Original genuine supported noncrossing edges on any finite exposed
set of at least three sites satisfy the exact outerplanar cap. -/
theorem s053_genuine_outerplanar_cap (T : Finset Point) :
    3 ≤ T.card → strictConvexPosition T →
    ∀ H : Finset Edge, planeEdges H → (∀ e ∈ H, e ⊆ T) →
      (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
      H.card ≤ 2 * T.card - 3 := by
  classical
  refine Finset.strongInductionOn T ?_
  intro U ih h3 hc H hp hs hg
  by_cases hcard : U.card = 3
  · have hh := s053_three_site_cap hcard hs hg
    omega
  have h4 : 4 ≤ U.card := by omega
  have hn := s041_strictConvexPosition_noThreeCollinear U hc
  by_cases hchord : ∃ p q : Point, p ≠ q ∧ edge p q ∈ H ∧ ¬ hullSide U p q
  · obtain ⟨p,q,hpq,hpqH,hnon⟩ := hchord
    have hpU := hs _ hpqH (show p ∈ edge p q by simp [edge])
    have hqU := hs _ hpqH (show q ∈ edge p q by simp [edge])
    let P := s052_positiveHalf U p q
    let N := s052_negativeHalf U p q
    let HP := s053_restrict H P
    let HN := s053_restrict H N
    have hPsub : P ⊆ U := by intro x hx; exact (Finset.mem_filter.mp hx).1
    have hNsub : N ⊆ U := by intro x hx; exact (Finset.mem_filter.mp hx).1
    have hproper := s052_nonhull_halves_proper U p q hpU hqU hpq hnon
    have hcards := s052_halves_card U hn p q hpU hqU hpq
    have hPpq : ({p,q} : Finset Point) ⊆ P := by
      intro x hx
      have hi := s052_halves_intersection U hn p q hpU hqU hpq
      rw [← hi] at hx
      exact (Finset.mem_inter.mp hx).1
    have hNpq : ({p,q} : Finset Point) ⊆ N := by
      intro x hx
      have hi := s052_halves_intersection U hn p q hpU hqU hpq
      rw [← hi] at hx
      exact (Finset.mem_inter.mp hx).2
    obtain ⟨⟨r,hr,hrneg⟩,⟨s,hsU,hspos⟩⟩ :=
      s052_nonhull_witnesses U p q hpU hqU hpq hnon
    have hP3 : 3 ≤ P.card := by
      have h2 := Finset.card_le_card hPpq
      have hnot : s ∉ ({p,q} : Finset Point) := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        constructor <;> intro he <;> subst s <;> unfold orientation at hspos <;> nlinarith only [hspos]
      have hsub : insert s ({p,q} : Finset Point) ⊆ P := by
        intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact Finset.mem_filter.mpr ⟨hsU,le_of_lt hspos⟩
        · exact hPpq hx
      have hh := Finset.card_le_card hsub
      simpa [hnot,hpq] using hh
    have hN3 : 3 ≤ N.card := by
      have hnot : r ∉ ({p,q} : Finset Point) := by
        simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
        constructor <;> intro he <;> subst r <;> unfold orientation at hrneg <;> nlinarith only [hrneg]
      have hsub : insert r ({p,q} : Finset Point) ⊆ N := by
        intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact Finset.mem_filter.mpr ⟨hr,le_of_lt hrneg⟩
        · exact hNpq hx
      have hh := Finset.card_le_card hsub
      simpa [hnot,hpq] using hh
    have hHP : HP ⊆ H := by intro e he; exact (Finset.mem_filter.mp he).1
    have hHN : HN ⊆ H := by intro e he; exact (Finset.mem_filter.mp he).1
    have hcP := ih P hproper.1 hP3
      (s041_strictConvexPosition_of_subset hPsub hc) HP
      (s038_planeEdges_of_subset hHP hp)
      (fun e he => (Finset.mem_filter.mp he).2)
      (fun e he => hg e (hHP he))
    have hcN := ih N hproper.2 hN3
      (s041_strictConvexPosition_of_subset hNsub hc) HN
      (s038_planeEdges_of_subset hHN hp)
      (fun e he => (Finset.mem_filter.mp he).2)
      (fun e he => hg e (hHN he))
    obtain ⟨hunion,hinter⟩ := s053_restriction_split hc hp hs hg hpU hqU hpq hpqH
    have hcount := Finset.card_union_add_card_inter HP HN
    change (HP ∪ HN).card + (HP ∩ HN).card = HP.card + HN.card at hcount
    rw [hunion,hinter] at hcount
    simp only [Finset.card_singleton] at hcount
    change P.card + N.card = U.card + 2 at hcards
    omega
  · have hhull : ∀ a b : Point, edge a b ∈ H → a ≠ b → hullSide U a b := by
      intro a b he hab
      by_contra h
      exact hchord ⟨a,b,hab,he,h⟩
    obtain ⟨v,hv⟩ := Finset.card_pos.mp (show 0 < U.card by omega)
    let H0 := s053_restrict H (U.erase v)
    let HI := H.filter (fun e => v ∈ e)
    have hH0 : H0 ⊆ H := by intro e he; exact (Finset.mem_filter.mp he).1
    have h0support : ∀ e ∈ H0, e ⊆ U.erase v := by
      intro e he; exact (Finset.mem_filter.mp he).2
    have h0cap := ih (U.erase v) (Finset.erase_ssubset hv)
      (by rw [Finset.card_erase_of_mem hv]; omega)
      (s041_strictConvexPosition_erase hc v) H0
      (s038_planeEdges_of_subset hH0 hp) h0support
      (fun e he => hg e (hH0 he))
    have hIcap := s053_hull_incident_card h4 hc hv hg hhull
    have hu : H0 ∪ HI = H := by
      ext e
      simp only [H0, HI, s053_restrict, Finset.mem_union, Finset.mem_filter]
      constructor
      · rintro (⟨he,_⟩ | ⟨he,_⟩) <;> exact he
      · intro he
        by_cases hve : v ∈ e
        · exact Or.inr ⟨he,hve⟩
        · exact Or.inl ⟨he, fun x hx => Finset.mem_erase.mpr
            ⟨by intro h; exact hve (h ▸ hx), hs e he hx⟩⟩
    have hd : H0 ∩ HI = ∅ := by
      apply Finset.eq_empty_iff_forall_not_mem.mpr
      intro e he
      obtain ⟨he0,heI⟩ := Finset.mem_inter.mp he
      have hve := (Finset.mem_filter.mp heI).2
      exact Finset.not_mem_erase v U (h0support e he0 hve)
    have hcount := Finset.card_union_add_card_inter H0 HI
    rw [hu,hd] at hcount
    have hsize := Finset.card_erase_of_mem hv
    change HI.card ≤ 2 at hIcap
    omega

theorem clm0099_exact : CLM0099 := by
  apply s052_clm0099_of_genuine_outerplanar_cap
  intro T h4 hc H hp hs hg
  exact s053_genuine_outerplanar_cap T (by omega) hc H hp hs hg

end ETSHTS
