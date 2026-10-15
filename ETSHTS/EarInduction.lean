import ETSHTS.GlobalCount

/-!
# S041 — uniform metric-ear existence implies a full recursive certificate

These are honest conditional reductions for the ORIGINAL inductive
FullEarCertificate, CLM0099, CLM0107 and CLM0108. The required uniform
metric-ear theorem and CLM0099 equivalence remain open; this module does
not assume either as an axiom or claim a headline theorem is proved.
-/

noncomputable section
namespace ETSHTS

/-- A hereditary family with a metric ear in every member of size at least
four has a complete, recursively valid original ear certificate on every
member of size at least three. Every deletion reduces the actual Finset. -/
theorem s041_uniform_metricEar_gives_certificate
    (P : Finset Point → Prop)
    (hereditary : ∀ (T : Finset Point) (v : Point),
      P T → v ∈ T → metricEar T v → P (T.erase v))
    (exists_ear : ∀ (T : Finset Point),
      P T → 4 ≤ T.card → ∃ v : Point, metricEar T v)
    (S : Finset Point) (hP : P S) (h3 : 3 ≤ S.card) :
    FullEarCertificate S := by
  classical
  suffices h : ∀ T : Finset Point, P T → 3 ≤ T.card →
      FullEarCertificate T from h S hP h3
  intro T
  refine Finset.strongInductionOn T ?_
  intro U ih hPU hU
  by_cases h4 : 4 ≤ U.card
  · obtain ⟨v, hear⟩ := exists_ear U hPU h4
    have hv : v ∈ U := hear.1
    have hsmall : 3 ≤ (U.erase v).card := by
      rw [Finset.card_erase_of_mem hv]
      omega
    exact FullEarCertificate.remove U v h4 hv hear
      (ih (U.erase v) (Finset.erase_ssubset hv)
        (hereditary U v hPU hv hear) hsmall)
  · exact FullEarCertificate.base U (by omega)

/-- Closing under vertex deletion is automatic for ellipse-boundary sets.
An actual uniform metric-ear result therefore yields a complete certificate
for every finite ellipse-boundary set, not just one convenient first ear. -/
theorem s041_ellipse_full_certificate_of_uniform_ears
    (a b : ℝ)
    (hear : ∀ T : Finset Point,
      4 ≤ T.card →
      (∀ p ∈ T, ellipseBoundary a b p) →
      ∃ v : Point, metricEar T v)
    (S : Finset Point) (h3 : 3 ≤ S.card)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    FullEarCertificate S := by
  refine s041_uniform_metricEar_gives_certificate
    (fun T : Finset Point => ∀ p ∈ T, ellipseBoundary a b p)
    ?_ ?_ S hboundary h3
  · intro T v hT _ _
    intro p hp
    exact hT p (Finset.mem_of_mem_erase hp)
  · intro T hT h4
    exact hear T h4 hT

/-- Exact semantic reduction of the every-cardinality ellipse theorem:
the two remaining inputs are the unchanged CLM0099 iff and uniform
metric-ear existence under the SAME closed aspect ratio hypothesis. -/
theorem s041_clm0107_of_clm0099_and_uniform_ears
    (hiff : CLM0099)
    (hear : ∀ (a b : ℝ), 0 < b → b ≤ a → a / b ≤ R →
      ∀ T : Finset Point, 4 ≤ T.card →
        (∀ p ∈ T, ellipseBoundary a b p) →
        ∃ v : Point, metricEar T v) :
    CLM0107 := by
  intro a b hb hab hr S hcard hboundary
  have ha : 0 < a := lt_of_lt_of_le hb hab
  have hconv : strictConvexPosition S :=
    s037_ellipse_strictConvexPosition a b ha hb S hboundary
  have hcert : FullEarCertificate S :=
    s041_ellipse_full_certificate_of_uniform_ears
      a b (hear a b hb hab hr) S hcard hboundary
  exact (hiff S hcard hconv).2 hcert

/-- No extra parameter or cardinality restriction is introduced in the
concrete 101/100 corollary reduction. -/
theorem s041_clm0108_of_clm0099_and_uniform_ears
    (hiff : CLM0099)
    (hear : ∀ (a b : ℝ), 0 < b → b ≤ a → a / b ≤ R →
      ∀ T : Finset Point, 4 ≤ T.card →
        (∀ p ∈ T, ellipseBoundary a b p) →
        ∃ v : Point, metricEar T v) :
    CLM0108 :=
  clm0108_of_clm0107
    (s041_clm0107_of_clm0099_and_uniform_ears hiff hear)

end ETSHTS
