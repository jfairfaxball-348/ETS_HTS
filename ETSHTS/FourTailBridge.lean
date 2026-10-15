import ETSHTS.EarSufficiency

/-!
# S042: a correct recursion ending at four sites

The S020 ellipse argument promises uniform ears for at least five sites,
not for four. Rather than silently assuming an extra four-site metric ear,
this proof recursively deletes true ears down to an arbitrary three/four-
point base order, and reconstructs the original compulsory planar Grow
order with the proven reverse-ear insertion theorem.
-/

noncomputable section
namespace ETSHTS

/-- End-to-end original Grow induction from all-large-set metric ears and
a separate exact small-site base. No four-site ear is presumed. -/
theorem s042_planeOrder_of_four_tail_and_ge5_ears
    (P : Finset Point → Prop)
    (hereditary : ∀ (T : Finset Point) (v : Point),
      P T → v ∈ T → P (T.erase v))
    (noncollinear : ∀ (T : Finset Point), P T → noThreeCollinear T)
    (fourBase : ∀ (T : Finset Point), P T →
      3 ≤ T.card → T.card ≤ 4 → planeNearestTwoOrder T)
    (ear5 : ∀ (T : Finset Point), P T → 5 ≤ T.card →
      ∃ v : Point, metricEar T v)
    (S : Finset Point) (hP : P S) (h3 : 3 ≤ S.card) :
    planeNearestTwoOrder S := by
  classical
  suffices h : ∀ T : Finset Point, P T → 3 ≤ T.card →
      planeNearestTwoOrder T from h S hP h3
  intro T
  refine Finset.strongInductionOn T ?_
  intro U ih hPU hU
  by_cases h5 : 5 ≤ U.card
  · obtain ⟨v, hear⟩ := ear5 U hPU h5
    have hv : v ∈ U := hear.1
    have hsmall : 3 ≤ (U.erase v).card := by
      rw [Finset.card_erase_of_mem hv]
      omega
    exact s042_planeOrder_extend_metricEar
      (ih (U.erase v) (Finset.erase_ssubset hv)
        (hereditary U v hPU hv) hsmall)
      (noncollinear U hPU) hear
  · exact fourBase U hPU hU (by omega)

/-- Direct unchanged all-n CLM0107 from precisely the two obligations
of the frozen S020 mathematical proof: CLM0096 for the four-point tail
and metric-ear existence for every five-plus ellipse-boundary set.
No assumption or invocation of the still-open CLM0099 necessity direction. -/
theorem s042_clm0107_of_clm0096_and_ge5_ears
    (hfour : CLM0096)
    (hear : ∀ (a b : ℝ), 0 < b → b ≤ a → a / b ≤ R →
      ∀ T : Finset Point, 5 ≤ T.card →
        (∀ p ∈ T, ellipseBoundary a b p) →
        ∃ v : Point, metricEar T v) :
    CLM0107 := by
  intro a b hb hab hr S hcard hboundary
  have ha : 0 < a := lt_of_lt_of_le hb hab
  exact s042_planeOrder_of_four_tail_and_ge5_ears
    (fun T : Finset Point => ∀ p ∈ T, ellipseBoundary a b p)
    (by
      intro T v hT hv p hp
      exact hT p (Finset.mem_of_mem_erase hp))
    (by
      intro T hT
      exact s041_ellipse_noThreeCollinear a b ha hb T hT)
    (by
      intro T hT h3 h4
      exact hfour T h3 h4
        (s041_ellipse_noThreeCollinear a b ha hb T hT))
    (by
      intro T hT h5
      exact hear a b hb hab hr T h5 hT)
    S hboundary hcard

/-- The exact nonround 101/100 theorem follows from the same two frozen
inputs, with closed-ratio arithmetic already formally discharged. -/
theorem s042_clm0108_of_clm0096_and_ge5_ears
    (hfour : CLM0096)
    (hear : ∀ (a b : ℝ), 0 < b → b ≤ a → a / b ≤ R →
      ∀ T : Finset Point, 5 ≤ T.card →
        (∀ p ∈ T, ellipseBoundary a b p) →
        ∃ v : Point, metricEar T v) :
    CLM0108 :=
  clm0108_of_clm0107
    (s042_clm0107_of_clm0096_and_ge5_ears hfour hear)

end ETSHTS
