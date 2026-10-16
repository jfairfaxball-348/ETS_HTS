module
public import ETSHTS.GenuineEdges

@[expose] public section


/-!
# S051 — necessity using the TRUE chronological last arrival

Unlike the S044 arbitrarily removable vertex reduction, this proof is
about the actual last site in the supplied original planar `Grow`
history. It retains and reuses that history's original edge set.

Two independent geometric obligations are explicitly visible:
(1) the genuine-edge finite convex outerplanar cap; and
(2) existence of two different genuine hull-side neighbours at each site.
Neither obligation is silently assumed to be a proved theorem.
-/

noncomputable section
namespace ETSHTS

/-- The actual final inserted site of a planar original history is
an original metric ear once *its own final graph* saturates hull sides
and it has two distinct hull-side neighbours. The preceding original
planar history is recovered, not reconstructed. -/
theorem s051_actual_last_metricEar_of_saturation
    {S : Finset Point}
    {p q r v : Point} {rest : List Point} {final : Finset Edge}
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hnodup : ([p, q, r] ++ (rest ++ [v])).Nodup)
    (hcover : ([p, q, r] ++ (rest ++ [v])).toFinset = S)
    (hg : Grow [p, q, r] (triangleEdges p q r) (rest ++ [v]) final)
    (hplane : planeEdges final)
    (hsat : ∀ a b : Point, hullSide S a b → edge a b ∈ final)
    (htwo : ∃ x y : Point, x ≠ y ∧ hullSide S v x ∧ hullSide S v y) :
    metricEar S v ∧ planeNearestTwoOrder (S.erase v) := by
  obtain ⟨H, u, w, hprefix, hnear, hfinal, hinc⟩ :=
    s043_grow_last_incident_edges hg hnodup
      (s041_triangleEdges_supported p q r)
  have hplaneH : planeEdges H := by
    apply s038_planeEdges_of_subset (H := final)
    · rw [hfinal]
      exact Finset.subset_union_left
    · exact hplane
  have hn : (([p, q, r] ++ rest) ++ [v]).Nodup := by
    simpa [List.append_assoc] using hnodup
  have hpreN : ([p, q, r] ++ rest).Nodup :=
    (List.nodup_append.mp hn).1
  have hnot : v ∉ ([p, q, r] ++ rest).toFinset := by
    intro hv
    have hv' : v ∈ [p, q, r] ++ rest := by simpa using hv
    have hne := (List.nodup_append.mp hn).2.2 v hv' v (by simp)
    exact hne rfl
  have hset : S = insert v (([p, q, r] ++ rest).toFinset) := by
    rw [← hcover]
    ext x
    simp [List.mem_append, or_left_comm, or_comm, or_assoc]
  have hpref : ([p, q, r] ++ rest).toFinset = S.erase v := by
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
  have hnear' : exactlyTwoNearest (S.erase v) v u w := by
    rw [← hpref]
    exact hnear
  have hc : cyclicNeighbours S v u w :=
    s044_cyclic_last_of_saturation_and_two_sides
      hsat hinc hnear' htwo
  constructor
  · exact ⟨hv, u, w, hc, hnear'⟩
  · exact ⟨p, q, r, rest, H, hpq, hpr, hqr,
      hpreN, hpref, hprefix, hplaneH⟩

/-- With a genuine-edge outerplanar cap, the *same final graph*
from the supplied historical witness saturates its supporting sides. -/
theorem s051_actual_history_saturates_of_genuine_cap
    {S : Finset Point} (hconv : strictConvexPosition S)
    (hcap : ∀ H : Finset Edge,
      planeEdges H →
      (∀ e ∈ H, e ⊆ S) →
      (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
      H.card ≤ 2 * S.card - 3)
    {p q r v : Point} {rest : List Point} {final : Finset Edge}
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hn : ([p, q, r] ++ (rest ++ [v])).Nodup)
    (hcover : ([p, q, r] ++ (rest ++ [v])).toFinset = S)
    (hg : Grow [p, q, r] (triangleEdges p q r) (rest ++ [v]) final)
    (hplane : planeEdges final) :
    ∀ a b : Point, hullSide S a b → edge a b ∈ final := by
  obtain ⟨hGsupport, hGcount⟩ :=
    s040_grow_support_and_exact_count hg hn
      (s041_triangleEdges_supported p q r)
  have hsupport : ∀ e ∈ final, e ⊆ S := by
    intro e he
    rw [← hcover]
    exact hGsupport e he
  have hgenuine :=
    s051_grow_edges_genuine hg hn
      (s051_triangleEdges_genuine p q r hpq hpr hqr)
  have hseedcard := s041_triangleEdges_card p q r hpq hpr hqr
  have hsites : S.card = 4 + rest.length := by
    rw [← hcover, List.toFinset_card_of_nodup hn]
    simp
    omega
  have hcount : final.card = 2 * S.card - 3 := by
    simp only [List.length_append, List.length_singleton] at hGcount
    omega
  intro a b hside
  exact s051_hullSide_present_of_genuine_cap
    (s041_strictConvexPosition_noThreeCollinear S hconv)
    hcap hplane hsupport hgenuine hcount hside

/-- The complete original order has a TRUE last chronological ear,
rather than the synthetic arbitrary-v premise of S044. -/
theorem s051_order_has_actual_last_metricEar_of_cap
    {S : Finset Point} (h4 : 4 ≤ S.card)
    (hconv : strictConvexPosition S)
    (horder : planeNearestTwoOrder S)
    (hcap : ∀ H : Finset Edge,
      planeEdges H →
      (∀ e ∈ H, e ⊆ S) →
      (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
      H.card ≤ 2 * S.card - 3)
    (htwo : ∀ v ∈ S,
      ∃ x y : Point, x ≠ y ∧ hullSide S v x ∧ hullSide S v y) :
    ∃ v : Point, metricEar S v ∧ planeNearestTwoOrder (S.erase v) := by
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
  have hv : v ∈ S := by
    rw [← hcover]
    simp [List.mem_append]
  have hsat :=
    s051_actual_history_saturates_of_genuine_cap
      hconv hcap hpq hpr hqr hnodup hcover hg hplane
  obtain ⟨hear, hpre⟩ :=
    s051_actual_last_metricEar_of_saturation
      hpq hpr hqr hnodup hcover hg hplane hsat (htwo v hv)
  exact ⟨v, hear, hpre⟩

/-- Complete original CLM0099 iff, conditional on precisely two truthful
independent finite geometric facts. Proves the original chronological
necessity induction all the way to the three-site base and reuses S042
sufficiency, without assuming false arbitrary-v cyclic forcing. -/
theorem s051_clm0099_of_genuine_outerplanar_cap_and_two_sides
    (hcap : ∀ T : Finset Point, 4 ≤ T.card →
      strictConvexPosition T →
      ∀ H : Finset Edge, planeEdges H →
        (∀ e ∈ H, e ⊆ T) →
        (∀ e ∈ H, ∃ a b : Point, a ≠ b ∧ e = edge a b) →
        H.card ≤ 2 * T.card - 3)
    (htwo : ∀ T : Finset Point, 4 ≤ T.card →
      strictConvexPosition T →
      ∀ v ∈ T, ∃ x y : Point, x ≠ y ∧
        hullSide T v x ∧ hullSide T v y) :
    CLM0099 := by
  intro S h3 hconv
  constructor
  · intro horder
    suffices h : ∀ T : Finset Point,
        3 ≤ T.card → strictConvexPosition T →
        planeNearestTwoOrder T → FullEarCertificate T from
      h S h3 hconv horder
    intro T
    refine Finset.strongInductionOn T ?_
    intro U ih hU3 hUconv hUorder
    by_cases h4 : 4 ≤ U.card
    · obtain ⟨v, hear, hpre⟩ :=
        s051_order_has_actual_last_metricEar_of_cap
          h4 hUconv hUorder (hcap U h4 hUconv) (htwo U h4 hUconv)
      have hv : v ∈ U := hear.1
      have hsmall : 3 ≤ (U.erase v).card := by
        rw [Finset.card_erase_of_mem hv]
        omega
      have hsub : U.erase v ⊂ U := Finset.erase_ssubset hv
      have hpreconv : strictConvexPosition (U.erase v) :=
        s041_strictConvexPosition_erase hUconv v
      have hrec : FullEarCertificate (U.erase v) :=
        ih (U.erase v) hsub hsmall hpreconv hpre
      exact FullEarCertificate.remove U v h4 hv hear hrec
    · exact FullEarCertificate.base U (by omega)
  · intro hcert
    exact s042_fullEarCertificate_implies_planeNearestTwoOrder hconv hcert

end ETSHTS
