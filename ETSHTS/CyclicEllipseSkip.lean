import ETSHTS.CyclicEllipsePhase

/-!
# S046 — actual cyclic successor, Euclidean skip chords, closed-R selection

The index rotation is the genuine Fin permutation; phases come exclusively
from the S045 original ellipse boundary indexing. Gap positivity and full-turn
sum do not require uniform spacing or exclusions around the wrap.
-/

noncomputable section
namespace ETSHTS

/-- The true successor gap, using the end-to-start full-turn lift exactly
once. All ordinary successors use their unwrapped increasing phases. -/
def s046_cyclic_gap {n : ℕ} (θ : Fin (n + 1) ↪o ℝ)
    (i : Fin (n + 1)) : ℝ :=
  θ ((finRotate (n + 1)) i) - θ i +
    (if i = Fin.last n then 2 * Real.pi else 0)

/-- The true cyclic successor gaps of a normalised strictly ordered
ellipse phase indexing are strictly positive, even for tiny gaps. -/
theorem s046_cyclic_gap_pos {n : ℕ} (θ : Fin (n + 1) ↪o ℝ)
    (hb : ∀ i : Fin (n + 1), 0 ≤ θ i ∧ θ i < 2 * Real.pi)
    (i : Fin (n + 1)) : 0 < s046_cyclic_gap θ i := by
  classical
  by_cases hi : i = Fin.last n
  · subst i
    have hwrap := s046_wrap_gap_pos θ hb
    simpa [s046_cyclic_gap, finRotate_last, sub_eq_add_neg,
      add_comm, add_left_comm, add_assoc] using hwrap
  · have hiBound : i.val < n := by
      have hlimit := i.isLt
      by_contra hnot
      have hlast : i = Fin.last n := by
        apply Fin.ext
        change i.val = n
        omega
      exact hi hlast
    have hrot : (finRotate (n + 1)) i =
        ⟨i.val + 1, by omega⟩ := by
      simpa using (finRotate_of_lt hiBound)
    have hinc : i < (finRotate (n + 1)) i := by
      rw [hrot]
      change i.val < i.val + 1
      omega
    have hlt := θ.strictMono hinc
    simpa [s046_cyclic_gap, hi] using (sub_pos.mpr hlt)

/-- The sum over every genuine cyclic successor is precisely one turn.
This includes the final successor returning from last to first. -/
theorem s046_cyclic_gap_full_turn {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ) :
    (∑ i : Fin (n + 1), s046_cyclic_gap θ i) = 2 * Real.pi := by
  classical
  have hperm : (∑ i : Fin (n + 1), θ ((finRotate (n + 1)) i)) =
      ∑ i : Fin (n + 1), θ i :=
    s042_sum_permuted_gap (n + 1) (finRotate (n + 1)) θ
  have hwrapsum :
      (∑ i : Fin (n + 1),
        if i = Fin.last n then 2 * Real.pi else 0) = 2 * Real.pi := by
    simp
  calc
    (∑ i : Fin (n + 1), s046_cyclic_gap θ i) =
        (∑ i : Fin (n + 1), θ ((finRotate (n + 1)) i)) -
          (∑ i : Fin (n + 1), θ i) +
            (∑ i : Fin (n + 1),
              if i = Fin.last n then 2 * Real.pi else 0) := by
      simp only [s046_cyclic_gap, Finset.sum_add_distrib,
        Finset.sum_sub_distrib]
    _ = 2 * Real.pi := by rw [hperm, hwrapsum]; ring

/-- Genuine squared Euclidean skip chord from i to its second cyclic
successor, not the angular span and not a surrogate circular distance. -/
def s046_squared_skip_chord {n : ℕ}
    (a b : ℝ) (θ : Fin (n + 1) ↪o ℝ)
    (i : Fin (n + 1)) : ℝ :=
  sqDist (ellipsePoint a b (θ i))
    (ellipsePoint a b (θ ((finRotate (n + 1)) ((finRotate (n + 1)) i))))

/-- The original closed aspect ratio, including equality, selects an
actual minimum EUCLIDEAN skip chord among eligible two-successor arcs of
the true ordered sites. The metric-ear comparisons remain further goals. -/
theorem s046_original_closed_ratio_skip_min
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R)
    (n : ℕ) (hn : 5 ≤ n + 1) (θ : Fin (n + 1) ↪o ℝ) :
    ∃ i : Fin (n + 1),
      s046_cyclic_gap θ i +
          s046_cyclic_gap θ ((finRotate (n + 1)) i) < lambda a b ∧
      ∀ j : Fin (n + 1),
        s046_cyclic_gap θ j +
            s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
        s046_squared_skip_chord a b θ i ≤
          s046_squared_skip_chord a b θ j := by
  exact s044_closed_ratio_metric_min_from_full_turn
    a b hb hab hr (n + 1) hn (finRotate (n + 1))
    (s046_cyclic_gap θ) (s046_squared_skip_chord a b θ)
    (s046_cyclic_gap_full_turn θ)

/-- The original arbitrary finite ellipse site set itself admits a complete
positive full-turn cyclic indexing AND a minimum of genuine Euclidean squared
skip chords. No cyclic list, spacing bound, or ear is assumed as input.
This is the B1/B2 bridge; hull-side and three-band comparisons still follow. -/
theorem s046_actual_sites_closed_ratio_skip_min
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a) (hr : a / b ≤ R)
    (S : Finset Point) (h5 : 5 ≤ S.card)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ (n : ℕ) (θ : Fin (n + 1) ↪o ℝ),
      S.card = n + 1 ∧
      (∀ i : Fin (n + 1), 0 ≤ θ i ∧ θ i < 2 * Real.pi) ∧
      ((Finset.univ : Finset (Fin (n + 1))).image
        (fun i => ellipsePoint a b (θ i)) = S) ∧
      (∀ i : Fin (n + 1), 0 < s046_cyclic_gap θ i) ∧
      (∑ i : Fin (n + 1), s046_cyclic_gap θ i) = 2 * Real.pi ∧
      (∃ i : Fin (n + 1),
        s046_cyclic_gap θ i +
          s046_cyclic_gap θ ((finRotate (n + 1)) i) < lambda a b ∧
        ∀ j : Fin (n + 1),
          s046_cyclic_gap θ j +
            s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
          s046_squared_skip_chord a b θ i ≤
            s046_squared_skip_chord a b θ j) := by
  obtain ⟨n, hcard⟩ : ∃ n : ℕ, S.card = n + 1 := by
    cases hc : S.card with
    | zero => omega
    | succ n => exact ⟨n, hc⟩
  obtain ⟨θ, hbounds, hsites, _, _, _⟩ :=
    s046_original_ellipse_cyclic_gaps a b S n hcard hboundary
  refine ⟨n, θ, hcard, hbounds, hsites, ?_, ?_, ?_⟩
  · intro i
    exact s046_cyclic_gap_pos θ hbounds i
  · exact s046_cyclic_gap_full_turn θ
  · exact s046_original_closed_ratio_skip_min a b hb hab hr n
      (by omega) θ

end ETSHTS
