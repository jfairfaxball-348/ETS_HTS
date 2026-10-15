import ETSHTS.AngularCutoff

/-!
# S044 — complete necessity induction for the original CLM0099

This is a genuine strong induction on the original planar nearest-two
history using S043 actual-last peeling. The remaining geometric premise
is explicitly the cyclic-neighbour forcing for that last ranked pair.
It is NOT silently imported as a theorem or assumed in the headline.
-/

noncomputable section
namespace ETSHTS

/-- Exact CLM0099 follows once an actual chronological last pair in each
strictly convex planar order is forced to be the genuine cyclic pair.
This proves the *entire* deletion induction, including the size-three base,
and combines it with S042's already verified converse. -/
theorem s044_clm0099_of_last_pair_cyclic_forcing
    (hforced : ∀ (T : Finset Point), 4 ≤ T.card →
      strictConvexPosition T → planeNearestTwoOrder T →
      ∀ (v u w : Point), v ∈ T →
        planeNearestTwoOrder (T.erase v) →
        exactlyTwoNearest (T.erase v) v u w →
        cyclicNeighbours T v u w) :
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
    · obtain ⟨v, u, w, hv, hpre, hnear⟩ :=
        s043_planeOrder_has_last_ranked_predecessors hUorder h4
      have hsmall : 3 ≤ (U.erase v).card := by
        rw [Finset.card_erase_of_mem hv]
        omega
      have hsub : U.erase v ⊂ U := Finset.erase_ssubset hv
      have hpreconv : strictConvexPosition (U.erase v) :=
        s041_strictConvexPosition_erase hUconv v
      have hrec : FullEarCertificate (U.erase v) :=
        ih (U.erase v) hsub hsmall hpreconv hpre
      have hcyclic : cyclicNeighbours U v u w :=
        hforced U h4 hUconv hUorder v u w hv hpre hnear
      have hear : metricEar U v := ⟨hv, u, w, hcyclic, hnear⟩
      exact FullEarCertificate.remove U v h4 hv hear hrec
    · exact FullEarCertificate.base U (by omega)
  · intro hcert
    exact s042_fullEarCertificate_implies_planeNearestTwoOrder hconv hcert

end ETSHTS
