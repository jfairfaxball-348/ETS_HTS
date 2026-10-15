import ETSHTS.RationalChord

/-!
# S035 — frozen S020 eligible skip-chord selector: verified substeps

These lemmas formalise the actual S020 selection: eligible means a two-gap
span below the strict lambda cutoff; among eligible sites choose the least
EUCLIDEAN skip-chord length (squared distance, which has the same ordering).
The hypotheses isolating cyclic order, the 4π span identity, and the
central-distance floor remain independent proof obligations.
-/

noncomputable section
namespace ETSHTS

/-- If cyclic two-gap sums add to 4π at n≥5 and the strict cutoff exceeds
4π/5, at least one eligible cyclic index exists. This does not assume
a minimum angular-span index is a metric ear. -/
theorem s035_eligible_exists_from_average
    (n : ℕ) (hn : 5 ≤ n) (span : Fin n → ℝ)
    (hsum : (∑ j : Fin n, span j) = 4 * Real.pi)
    (cutoff : ℝ) (hcut : 4 * Real.pi / 5 < cutoff) :
    ∃ i : Fin n, span i < cutoff := by
  classical
  have hn0 : 0 < n := by omega
  have hall : (Finset.univ : Finset (Fin n)).Nonempty := by
    exact ⟨⟨0, hn0⟩, Finset.mem_univ _⟩
  obtain ⟨i, _, hmin⟩ :=
    Finset.exists_min_image (Finset.univ : Finset (Fin n)) span hall
  have hle : span i ≤ 4 * Real.pi / (n : ℝ) :=
    s033_cyclic_min_two_gap_average n hn0 span hsum i
      (fun j => hmin j (Finset.mem_univ j))
  have hnreal : (5 : ℝ) ≤ (n : ℝ) := by exact_mod_cast hn
  have hnrealpos : (0 : ℝ) < (n : ℝ) := by exact_mod_cast hn0
  have hbound : 4 * Real.pi / (n : ℝ) ≤ 4 * Real.pi / 5 := by
    apply (div_le_div_iff₀ hnrealpos (by norm_num : (0 : ℝ) < 5)).2
    have hnonneg : 0 ≤ (4 * Real.pi) * ((n : ℝ) - 5) :=
      mul_nonneg (by positivity) (by linarith)
    nlinarith
  exact ⟨i, lt_of_le_of_lt (le_trans hle hbound) hcut⟩

/-- The S020 choice is a true finite minimum of the metric skip-chord
length among eligible indices, not an angular two-gap minimum. -/
theorem s035_eligible_metric_min_exists
    (n : ℕ) (span skipSquared : Fin n → ℝ)
    (cutoff : ℝ) (hwitness : ∃ i : Fin n, span i < cutoff) :
    ∃ i : Fin n, span i < cutoff ∧
      ∀ j : Fin n, span j < cutoff → skipSquared i ≤ skipSquared j := by
  classical
  let E : Finset (Fin n) := Finset.univ.filter (fun j => span j < cutoff)
  have hE : E.Nonempty := by
    obtain ⟨i, hi⟩ := hwitness
    exact ⟨i, by simp [E, hi]⟩
  obtain ⟨i, hi, hmin⟩ := Finset.exists_min_image E skipSquared hE
  refine ⟨i, ?_, ?_⟩
  · simpa [E] using hi
  · intro j hj
    exact hmin j (by simp [E, hj])

/-- The actual eligible skip chord strictly exceeds BOTH incident chords,
independent of ties elsewhere or of an absolute angular rotation. -/
theorem s035_eligible_skip_exceeds_both_neighbours
    (a b left middle right : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hl : left < middle) (hr : middle < right)
    (hshort : right - left < lambda a b) :
    sqDist (ellipsePoint a b middle) (ellipsePoint a b left) <
      sqDist (ellipsePoint a b left) (ellipsePoint a b right) ∧
    sqDist (ellipsePoint a b middle) (ellipsePoint a b right) <
      sqDist (ellipsePoint a b left) (ellipsePoint a b right) := by
  constructor
  · calc
      sqDist (ellipsePoint a b middle) (ellipsePoint a b left) =
          sqDist (ellipsePoint a b left) (ellipsePoint a b middle) :=
        sqDist_symm _ _
      _ < _ := sqDist_ellipse_strict_right a b left middle right
        hb hab hl hr hshort
  · exact sqDist_ellipse_strict_left a b left middle right
      hb hab hl hr hshort

/-- S020 forward short-arc case: an eligible successor's skip chord,
bounded below by the selected metric minimum, bounds a later competitor. -/
theorem s035_forward_short_arc_competitor
    (a b start skipEnd competitor L : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hstart : start < skipEnd) (hnext : skipEnd < competitor)
    (hshort : competitor - start < lambda a b)
    (hmin : L ≤ sqDist (ellipsePoint a b start)
      (ellipsePoint a b skipEnd)) :
    L < sqDist (ellipsePoint a b start)
      (ellipsePoint a b competitor) := by
  exact lt_of_le_of_lt hmin
    (sqDist_ellipse_strict_right a b start skipEnd competitor
      hb hab hstart hnext hshort)

/-- S020 backward short-arc case with a real-lift wraparound: the eligible
predecessor's skip chord supplies the analogous lower bound. -/
theorem s035_backward_short_arc_competitor
    (a b competitor skipStart finish L : ℝ)
    (hb : 0 < b) (hab : b ≤ a)
    (hfirst : competitor < skipStart) (hlast : skipStart < finish)
    (hshort : finish - competitor < lambda a b)
    (hmin : L ≤ sqDist (ellipsePoint a b skipStart)
      (ellipsePoint a b finish)) :
    L < sqDist (ellipsePoint a b finish)
      (ellipsePoint a b competitor) := by
  calc
    L ≤ sqDist (ellipsePoint a b skipStart)
      (ellipsePoint a b finish) := hmin
    _ < sqDist (ellipsePoint a b competitor)
      (ellipsePoint a b finish) :=
      sqDist_ellipse_strict_left a b competitor skipStart finish
        hb hab hfirst hlast hshort
    _ = sqDist (ellipsePoint a b finish)
      (ellipsePoint a b competitor) := sqDist_symm _ _

/-- Exact tie-safe closure of S020: once the three competitor cases
establish the skip-chord floor, the chosen cyclic site is a metric ear
under the frozen priority order. The competitor floor and cyclic
neighbourhood still require full ellipse geometry. -/
theorem s035_metric_ear_of_skip_chord_floor
    {S : Finset Point} {v u w : Point} (L : ℝ)
    (hv : v ∈ S) (hcyclic : cyclicNeighbours S v u w)
    (hu : u ∈ S.erase v) (hw : w ∈ S.erase v)
    (huL : sqDist v u < L) (hwL : sqDist v w < L)
    (hfar : ∀ x ∈ S.erase v, x ≠ u → x ≠ w → L ≤ sqDist v x) :
    metricEar S v := by
  apply metricEar_of_strict_gap hv hcyclic hu hw
  intro x hx hxu hxw
  exact ⟨lt_of_lt_of_le huL (hfar x hx hxu hxw),
    lt_of_lt_of_le hwL (hfar x hx hxu hxw)⟩

end ETSHTS
