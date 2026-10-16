import ETSHTS.OuterplanarSplit
import ETSHTS.ConvexFourBarycentric

noncomputable section
namespace ETSHTS

/-- A strictly exposed site cannot be a positive barycentre of other sites. -/
theorem s053_not_positive_barycentre {T : Finset Point}
    (hc : strictConvexPosition T) {p q r v : Point}
    (hp : p ∈ T) (hq : q ∈ T) (hr : r ∈ T) (hv : v ∈ T)
    (hpv : p ≠ v) (hqv : q ≠ v) (hrv : r ≠ v)
    {α β γ : ℝ} (ha : 0 < α) (hb : 0 < β) (hg : 0 < γ)
    (hs : α + β + γ = 1)
    (he : v = (α*p.1 + β*q.1 + γ*r.1,
                α*p.2 + β*q.2 + γ*r.2)) : False := by
  obtain ⟨nx, ny, hm⟩ := hc v hv
  have h1 := hm p hp hpv
  have h2 := hm q hq hqv
  have h3 := hm r hr hrv
  have hf : nx*v.1 + ny*v.2 =
      α*(nx*p.1+ny*p.2) + β*(nx*q.1+ny*q.2) + γ*(nx*r.1+ny*r.2) := by
    rw [he]
    dsimp
    ring
  have h1' := mul_pos ha (sub_pos.mpr h1)
  have h2' := mul_pos hb (sub_pos.mpr h2)
  have h3' := mul_pos hg (sub_pos.mpr h3)
  have hs' := congrArg (fun t : ℝ => t * (nx*v.1+ny*v.2)) hs
  nlinarith [hs']

/-- Opposite strict sides in an exposed four-set force the ORIGINAL
open segments to intersect. The exposure hypotheses exclude the two
interior-point barycentric cases. -/
theorem s053_opposite_sides_cross {T : Finset Point}
    (hc : strictConvexPosition T) {p q r s : Point}
    (hp : p ∈ T) (hq : q ∈ T) (hr : r ∈ T) (hs : s ∈ T)
    (hpq : p ≠ q) (hpr : p ≠ r) (hps : p ≠ s)
    (hqr : q ≠ r) (hqs : q ≠ s) (hrs : r ≠ s)
    (hpos : 0 < orientation p q r) (hneg : orientation p q s < 0) :
    properCross p q r s := by
  have hn := s041_strictConvexPosition_noThreeCollinear T hc
  obtain ⟨α, β, γ, hsum, he, haD, hbD, hgD⟩ :=
    s042_four_barycentric_orientation p q r s (ne_of_gt hpos)
  have hg : γ < 0 := by nlinarith
  have ha0 : α ≠ 0 := by
    intro h
    have hz : orientation q r s = 0 := by rw [← haD, h]; ring
    exact hn q hq r hr s hs hqr hqs hrs hz
  have hb0 : β ≠ 0 := by
    intro h
    have hz : orientation r p s = 0 := by rw [← hbD, h]; ring
    exact hn r hr p hp s hs hpr.symm hrs hps hz
  have ha : 0 < α := by
    by_contra h
    have han : α < 0 := lt_of_le_of_ne (le_of_not_gt h) ha0
    have hbp : 0 < β := by linarith
    have he' : s = (β*q.1 + α*p.1 + γ*r.1, β*q.2 + α*p.2 + γ*r.2) := by
      rw [he]; apply Prod.ext <;> dsimp <;> ring
    obtain ⟨x,y,z,hx,hy,hz,hxyz,hq'⟩ :=
      s042_two_negative_barycentric_interior q p r s β α γ
        hbp han hg (by linarith) he'
    exact s053_not_positive_barycentre hc hp hr hs hq hpq hqr.symm hqs.symm
      hx hy hz hxyz hq'
  have hb : 0 < β := by
    by_contra h
    have hbn : β < 0 := lt_of_le_of_ne (le_of_not_gt h) hb0
    obtain ⟨x,y,z,hx,hy,hz,hxyz,hp'⟩ :=
      s042_two_negative_barycentric_interior p q r s α β γ ha hbn hg hsum he
    exact s053_not_positive_barycentre hc hq hr hs hp hpq.symm hpr.symm hps.symm
      hx hy hz hxyz hp'
  exact s042_one_negative_barycentric_cross p q r s α β γ ha hb hg hsum he

end ETSHTS
