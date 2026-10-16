module
public import ETSHTS.ActualLastNecessity

@[expose] public section


/-!
S052: the original generic strict-convex finite-geometry neighbour obligation.
Project every other point relative to an exposed vertex onto the
normal/tangent frame; the extreme rational slopes are supporting hull sides.

No ellipse-specific phase order, axiom, weakened target or additional
geometry assumption is introduced.
-/

noncomputable section
namespace ETSHTS

/-- Each vertex of a finite, strictly exposed, noncollinear configuration
with at least four points has two distinct genuine supporting neighbours. -/
theorem s052_two_hull_sides
    (T : Finset Point) (h4 : 4 ≤ T.card)
    (hconv : strictConvexPosition T)
    (v : Point) (hv : v ∈ T) :
    ∃ x y : Point, x ≠ y ∧ hullSide T v x ∧ hullSide T v y := by
  classical
  obtain ⟨nx, ny, hexpose⟩ := hconv v hv
  let remaining : Finset Point := T.erase v
  have hremaining : 3 ≤ remaining.card := by
    dsimp [remaining]
    rw [Finset.card_erase_of_mem hv]
    omega
  have hnonempty : remaining.Nonempty :=
    Finset.card_pos.mp (by omega : 0 < remaining.card)

  let depth : Point → ℝ := fun z =>
    nx * (v.1 - z.1) + ny * (v.2 - z.2)
  let tangent : Point → ℝ := fun z =>
    -ny * (z.1 - v.1) + nx * (z.2 - v.2)
  let slope : Point → ℝ := fun z => tangent z / depth z

  have hdepth (z : Point) (hz : z ∈ remaining) : 0 < depth z := by
    have hzT : z ∈ T := (Finset.mem_erase.mp hz).2
    have hzv : z ≠ v := (Finset.mem_erase.mp hz).1
    have hh := hexpose z hzT hzv
    dsimp [depth]
    linarith

  have hnorm : 0 < nx ^ 2 + ny ^ 2 := by
    obtain ⟨z, hz⟩ := hnonempty
    have hp := hdepth z hz
    by_contra hn
    have hle : nx ^ 2 + ny ^ 2 ≤ 0 := le_of_not_gt hn
    have hx0 : nx = 0 := by nlinarith [sq_nonneg nx, sq_nonneg ny]
    have hy0 : ny = 0 := by nlinarith [sq_nonneg nx, sq_nonneg ny]
    simp [depth, hx0, hy0] at hp

  have hdet (w z : Point)
      (hw : w ∈ remaining) (hz : z ∈ remaining) :
      orientation v w z * (nx ^ 2 + ny ^ 2) =
        depth w * depth z * (slope w - slope z) := by
    have hdw : depth w ≠ 0 := ne_of_gt (hdepth w hw)
    have hdz : depth z ≠ 0 := ne_of_gt (hdepth z hz)
    dsimp [slope, tangent]
    field_simp [hdw, hdz]
    dsimp [depth, orientation]
    ring

  let values : Finset ℝ := remaining.image slope
  have hvalues : values.Nonempty := by
    obtain ⟨z, hz⟩ := hnonempty
    exact ⟨slope z, Finset.mem_image.mpr ⟨z, hz, rfl⟩⟩

  let upper : ℝ := values.max' hvalues
  let lower : ℝ := values.min' hvalues
  have hu : upper ∈ values := Finset.max'_mem values hvalues
  have hl : lower ∈ values := Finset.min'_mem values hvalues
  obtain ⟨x, hx, hxu⟩ := Finset.mem_image.mp hu
  obtain ⟨y, hy, hyl⟩ := Finset.mem_image.mp hl

  have hmax (z : Point) (hz : z ∈ remaining) : slope z ≤ slope x := by
    have hzm : slope z ∈ values :=
      Finset.mem_image.mpr ⟨z, hz, rfl⟩
    have hh : slope z ≤ values.max' hvalues :=
      Finset.le_max' values (slope z) hzm
    change slope z ≤ upper at hh
    rw [← hxu] at hh
    exact hh

  have hmin (z : Point) (hz : z ∈ remaining) : slope y ≤ slope z := by
    have hzm : slope z ∈ values :=
      Finset.mem_image.mpr ⟨z, hz, rfl⟩
    have hh : values.min' hvalues ≤ slope z :=
      Finset.min'_le values (slope z) hzm
    change lower ≤ slope z at hh
    rw [← hyl] at hh
    exact hh

  have hpositive (z : Point) (hz : z ∈ T) :
      0 ≤ orientation v x z := by
    by_cases hzv : z = v
    · subst z
      simp [orientation]
    · have hzrem : z ∈ remaining :=
        Finset.mem_erase.mpr ⟨hzv, hz⟩
      have hf := hdet x z hx hzrem
      have hd : 0 ≤ depth x * depth z * (slope x - slope z) :=
        mul_nonneg
          (le_of_lt (mul_pos (hdepth x hx) (hdepth z hzrem)))
          (sub_nonneg.mpr (hmax z hzrem))
      have hp : 0 ≤ orientation v x z * (nx ^ 2 + ny ^ 2) := by
        rw [hf]
        exact hd
      by_contra hh
      have hneg : orientation v x z < 0 := lt_of_not_ge hh
      have hbad := mul_neg_of_neg_of_pos hneg hnorm
      linarith

  have hnegative (z : Point) (hz : z ∈ T) :
      orientation v y z ≤ 0 := by
    by_cases hzv : z = v
    · subst z
      simp [orientation]
    · have hzrem : z ∈ remaining :=
        Finset.mem_erase.mpr ⟨hzv, hz⟩
      have hf := hdet y z hy hzrem
      have hd : depth y * depth z * (slope y - slope z) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos
          (le_of_lt (mul_pos (hdepth y hy) (hdepth z hzrem)))
          (sub_nonpos.mpr (hmin z hzrem))
      have hp : orientation v y z * (nx ^ 2 + ny ^ 2) ≤ 0 := by
        rw [hf]
        exact hd
      by_contra hh
      have hpos : 0 < orientation v y z := lt_of_not_ge hh
      have hbad := mul_pos hpos hnorm
      linarith

  have hxT : x ∈ T := (Finset.mem_erase.mp hx).2
  have hyT : y ∈ T := (Finset.mem_erase.mp hy).2
  have hvx : v ≠ x := (Finset.mem_erase.mp hx).1.symm
  have hvy : v ≠ y := (Finset.mem_erase.mp hy).1.symm

  have hxy : x ≠ y := by
    intro heq
    have hother : ∃ z ∈ remaining, z ≠ x := by
      by_contra hn
      push_neg at hn
      have hsub : remaining ⊆ ({x} : Finset Point) := by
        intro z hz
        simpa using hn z hz
      have hcard := Finset.card_le_card hsub
      simp at hcard
      omega
    obtain ⟨z, hz, hzx⟩ := hother
    have hzT : z ∈ T := (Finset.mem_erase.mp hz).2
    have hvz : v ≠ z := (Finset.mem_erase.mp hz).1.symm
    have hh1 := hpositive z hzT
    have hh2 := hnegative z hzT
    rw [← heq] at hh2
    have hzero : orientation v x z = 0 := by linarith
    have hno : noThreeCollinear T :=
      s041_strictConvexPosition_noThreeCollinear T hconv
    exact (hno v hv x hxT z hzT hvx hvz hzx.symm) hzero

  refine ⟨x, y, hxy, ?_, ?_⟩
  · exact ⟨hv, hxT, hvx, Or.inl hpositive⟩
  · exact ⟨hv, hyT, hvy, Or.inr hnegative⟩

end ETSHTS
