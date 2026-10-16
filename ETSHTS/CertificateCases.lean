module
public import ETSHTS.HereditaryGeometry

@[expose] public section


/-!
# S041 — the exact recursive certificate's higher-cardinality case

These lemmas unpack the ORIGINAL FullEarCertificate, with no replacement
recursion and no weakening of the mandatory Euclidean nearest-two rule.
The geometric task of producing such ears remains separate.
-/

noncomputable section
namespace ETSHTS

/-- Every original recursive ear certificate has at least three sites. -/
theorem s041_fullEarCertificate_card_ge_three
    {S : Finset Point} (hcert : FullEarCertificate S) :
    3 ≤ S.card := by
  cases hcert with
  | base _ hcard => omega
  | remove _ _ hcard _ _ _ => omega

/-- Exact unfolding of the original complete certificate beyond the
three-site base. Both directions preserve every constructor premise. -/
theorem s041_fullEarCertificate_iff_ear_deletion
    (S : Finset Point) (h4 : 4 ≤ S.card) :
    FullEarCertificate S ↔
      ∃ v : Point, v ∈ S ∧ metricEar S v ∧
        FullEarCertificate (S.erase v) := by
  constructor
  · intro hcert
    cases hcert with
    | base _ hcard => omega
    | remove _ v _ hv hear hrec =>
        exact ⟨v, hv, hear, hrec⟩
  · rintro ⟨v, hv, hear, hrec⟩
    exact FullEarCertificate.remove S v h4 hv hear hrec

/-- In the four-site case, any complete certificate removes an actual
metric ear and leaves the original three-site base exactly. -/
theorem s041_certificate_four_has_three_site_remainder
    (S : Finset Point) (hcard : S.card = 4)
    (hcert : FullEarCertificate S) :
    ∃ v : Point, v ∈ S ∧ metricEar S v ∧ (S.erase v).card = 3 := by
  obtain ⟨v, hv, hear, _⟩ :=
    (s041_fullEarCertificate_iff_ear_deletion S (by omega)).mp hcert
  refine ⟨v, hv, hear, ?_⟩
  rw [Finset.card_erase_of_mem hv]
  omega

end ETSHTS
