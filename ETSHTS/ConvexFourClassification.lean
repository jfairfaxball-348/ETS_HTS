import ETSHTS.ConvexFourBarycentric

/-!
# S042 continuation: four-point sign-pattern classification

These cases use the exact signed-area barycentric representation, positive
interior spoke order, and strictly crossing-diagonal metric-ear order.
All nearest-two choices are the original compulsory priority choices.
-/

noncomputable section
namespace ETSHTS

/-- All four sign patterns with the first barycentric weight positive
give an original noncrossing order, including exact nearest-distance ties.
Two negative weights produce an interior *old* site; one negative weight
produces a proper crossing of the opposite diagonal pair. -/
theorem s042_four_order_positive_first
    (p q r v : Point) (α β γ : ℝ)
    (hno : noThreeCollinear ({p, q, r, v} : Finset Point))
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hvp : v ≠ p) (hvq : v ≠ q) (hvr : v ≠ r)
    (hα : 0 < α) (hβne : β ≠ 0) (hγne : γ ≠ 0)
    (hsum : α + β + γ = 1)
    (hv : v = (α * p.1 + β * q.1 + γ * r.1,
               α * p.2 + β * q.2 + γ * r.2)) :
    planeNearestTwoOrder ({p, q, r, v} : Finset Point) := by
  rcases lt_trichotomy β 0 with hβneg | hβzero | hβpos
  · rcases lt_trichotomy γ 0 with hγneg | hγzero | hγpos
    · obtain ⟨x, y, z, hx, hy, hz, hxyz, hp⟩ :=
        s042_two_negative_barycentric_interior p q r v
          α β γ hα hβneg hγneg hsum hv
      have horder : planeNearestTwoOrder ({q, r, v, p} : Finset Point) :=
        s042_exact_interior_four_order q r v p x y z
          hqr hvr.symm hvq hpq hpr hvp.symm
          hx hy hz hxyz hp
          (hno r (by simp) v (by simp) q (by simp)
            hvr.symm hqr.symm hvq)
          (hno v (by simp) q (by simp) r (by simp)
            hvq hvr hqr)
          (hno q (by simp) r (by simp) v (by simp)
            hqr hvq.symm hvr.symm)
      have hperm : ({q, r, v, p} : Finset Point) = {p, q, r, v} := by
        ext w
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto
      rw [hperm] at horder
      exact horder
    · exact (hγne hγzero).elim
    · have hsum' : α + γ + β = 1 := by linarith
      have hv' : v = (α * p.1 + γ * r.1 + β * q.1,
                      α * p.2 + γ * r.2 + β * q.2) := by
        rw [hv]
        apply Prod.ext <;> dsimp <;> ring
      obtain ⟨o, hprcross, hqvcross⟩ :=
        s042_one_negative_barycentric_cross p r q v α γ β
          hα hγpos hβneg hsum' hv'
      exact s042_crossing_four_exact_order p q r v o hno
        hpq hpr hvp.symm hqr hvq.symm hvr.symm
        hprcross hqvcross
  · exact (hβne hβzero).elim
  · rcases lt_trichotomy γ 0 with hγneg | hγzero | hγpos
    · obtain ⟨o, hpqcross, hrvcross⟩ :=
        s042_one_negative_barycentric_cross p q r v α β γ
          hα hβpos hγneg hsum hv
      have hperm : ({p, r, q, v} : Finset Point) = {p, q, r, v} := by
        ext w
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto
      have hn : noThreeCollinear ({p, r, q, v} : Finset Point) := by
        rw [hperm]
        exact hno
      have horder := s042_crossing_four_exact_order p r q v o hn
        hpr hpq hvp.symm hqr.symm hvr.symm hvq.symm
        hpqcross hrvcross
      rw [hperm] at horder
      exact horder
    · exact (hγne hγzero).elim
    · exact s042_exact_interior_four_order p q r v α β γ
        hpq hqr hpr.symm hvp hvq hvr hα hβpos hγpos hsum hv
        (hno q (by simp) r (by simp) p (by simp)
          hqr hpq.symm hpr.symm)
        (hno r (by simp) p (by simp) q (by simp)
          hpr.symm hqr.symm hpq)
        (hno p (by simp) q (by simp) r (by simp)
          hpq hpr hqr)

/-- An arbitrary fourth point with every distinct triple noncollinear
admits a true nearest-two noncrossing order. Barycentric coordinates
must have at least one positive weight; cyclically rotate the seed so
the first weight is positive and invoke all four verified sign cases. -/
theorem s042_four_points_exact_from_noncollinear
    (p q r v : Point)
    (hno : noThreeCollinear ({p, q, r, v} : Finset Point))
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hvp : v ≠ p) (hvq : v ≠ q) (hvr : v ≠ r) :
    planeNearestTwoOrder ({p, q, r, v} : Finset Point) := by
  have hD : orientation p q r ≠ 0 :=
    hno p (by simp) q (by simp) r (by simp) hpq hpr hqr
  obtain ⟨α, β, γ, hsum, hv, hαD, hβD, hγD⟩ :=
    s042_four_barycentric_orientation p q r v hD
  have hαval : orientation q r v ≠ 0 :=
    hno q (by simp) r (by simp) v (by simp)
      hqr hvq.symm hvr.symm
  have hβval : orientation r p v ≠ 0 :=
    hno r (by simp) p (by simp) v (by simp)
      hpr.symm hvr.symm hvp.symm
  have hγval : orientation p q v ≠ 0 :=
    hno p (by simp) q (by simp) v (by simp)
      hpq hvp.symm hvq.symm
  have hαne : α ≠ 0 := by
    intro he
    apply hαval
    calc
      orientation q r v = α * orientation p q r := hαD.symm
      _ = 0 := by simp [he]
  have hβne : β ≠ 0 := by
    intro he
    apply hβval
    calc
      orientation r p v = β * orientation p q r := hβD.symm
      _ = 0 := by simp [he]
  have hγne : γ ≠ 0 := by
    intro he
    apply hγval
    calc
      orientation p q v = γ * orientation p q r := hγD.symm
      _ = 0 := by simp [he]
  have hpositive : 0 < α ∨ 0 < β ∨ 0 < γ := by
    by_contra h
    push_neg at h
    rcases h with ⟨ha, hb, hc⟩
    linarith
  rcases hpositive with hα | hβ | hγ
  · exact s042_four_order_positive_first p q r v α β γ
      hno hpq hpr hqr hvp hvq hvr hα hβne hγne hsum hv
  · have hperm : ({q, r, p, v} : Finset Point) = {p, q, r, v} := by
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    have hn : noThreeCollinear ({q, r, p, v} : Finset Point) := by
      rw [hperm]
      exact hno
    have hsum' : β + γ + α = 1 := by linarith
    have hv' : v = (β * q.1 + γ * r.1 + α * p.1,
                    β * q.2 + γ * r.2 + α * p.2) := by
      rw [hv]
      apply Prod.ext <;> dsimp <;> ring
    have horder := s042_four_order_positive_first q r p v β γ α
      hn hqr hpq.symm hpr.symm hvq hvr hvp
      hβ hγne hαne hsum' hv'
    rw [hperm] at horder
    exact horder
  · have hperm : ({r, p, q, v} : Finset Point) = {p, q, r, v} := by
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    have hn : noThreeCollinear ({r, p, q, v} : Finset Point) := by
      rw [hperm]
      exact hno
    have hsum' : γ + α + β = 1 := by linarith
    have hv' : v = (γ * r.1 + α * p.1 + β * q.1,
                    γ * r.2 + α * p.2 + β * q.2) := by
      rw [hv]
      apply Prod.ext <;> dsimp <;> ring
    have horder := s042_four_order_positive_first r p q v γ α β
      hn hpr.symm hqr.symm hpq hvr hvp hvq
      hγ hαne hβne hsum' hv'
    rw [hperm] at horder
    exact horder

/-- Exact unmodified CLM0096: all noncollinear three- and four-site sets,
with the compulsory two-nearest selection including Cartesian distance ties. -/
theorem clm0096_exact : CLM0096 := by
  intro S hthree hfour hno
  by_cases hcard3 : S.card = 3
  · exact clm0096_card_three S hcard3
  · have hcard4 : S.card = 4 := by omega
    have hnonempty : S.Nonempty := Finset.card_pos.mp (by omega)
    obtain ⟨v, hv⟩ := hnonempty
    have hrest3 : (S.erase v).card = 3 := by
      rw [Finset.card_erase_of_mem hv]
      omega
    obtain ⟨p, q, r, hpq, hpr, hqr, hrest⟩ :=
      Finset.card_eq_three.mp hrest3
    have hvp : v ≠ p := by
      intro he
      have hbad : v ∈ S.erase v := by
        rw [hrest]
        simp [he]
      exact (Finset.not_mem_erase v S) hbad
    have hvq : v ≠ q := by
      intro he
      have hbad : v ∈ S.erase v := by
        rw [hrest]
        simp [he]
      exact (Finset.not_mem_erase v S) hbad
    have hvr : v ≠ r := by
      intro he
      have hbad : v ∈ S.erase v := by
        rw [hrest]
        simp [he]
      exact (Finset.not_mem_erase v S) hbad
    have hset : S = ({p, q, r, v} : Finset Point) := by
      calc
        S = insert v (S.erase v) := (Finset.insert_erase hv).symm
        _ = insert v ({p, q, r} : Finset Point) := by rw [hrest]
        _ = ({p, q, r, v} : Finset Point) := by
          ext x
          simp only [Finset.mem_insert, Finset.mem_singleton]
          tauto
    rw [hset] at hno ⊢
    exact s042_four_points_exact_from_noncollinear p q r v
      hno hpq hpr hqr hvp hvq hvr

end ETSHTS
