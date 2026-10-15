import ETSHTS.FiniteEllipsePhase

/-!
# S046 — true cyclic phase gaps from the original finite ellipse sites

The ordered indexing supplied by S045 is not assumed to be a cyclic
enumeration. We construct the gap arithmetic with an explicit final-to-first
wrap and exactly one full turn, including phases close to either endpoint.
-/

noncomputable section
namespace ETSHTS

/-- Extend the increasing finite phase index to natural numbers by clamping
at its actual final index. All uses below are within the original range. -/
def s046_clamped_phase {n : ℕ} (θ : Fin (n + 1) ↪o ℝ) (k : ℕ) : ℝ :=
  θ ⟨min k n, Nat.lt_succ_of_le (Nat.min_le_right k n)⟩

/-- Finite telescoping does not assume uniform angular gaps. -/
theorem s046_telescope (f : ℕ → ℝ) (n : ℕ) :
    (∑ k ∈ Finset.range n, (f (k + 1) - f k)) = f n - f 0 := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [Finset.sum_range_succ, ih]
      ring

/-- Every consecutive original phase has strictly positive gap, no
matter how close the corresponding ellipse points are. -/
theorem s046_clamped_adjacent_gap_pos {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ) (k : ℕ) (hk : k < n) :
    0 < s046_clamped_phase θ (k + 1) -
      s046_clamped_phase θ k := by
  have hk0 : k < n + 1 := by omega
  have hk1 : k + 1 < n + 1 := by omega
  have h0 : s046_clamped_phase θ k = θ ⟨k, hk0⟩ := by
    simp [s046_clamped_phase, Nat.min_eq_left (show k ≤ n by omega)]
  have h1 : s046_clamped_phase θ (k + 1) =
      θ ⟨k + 1, hk1⟩ := by
    simp [s046_clamped_phase, Nat.min_eq_left (show k + 1 ≤ n by omega)]
  rw [h0, h1]
  apply sub_pos.mpr
  exact θ.strictMono (by
    change k < k + 1
    omega)

/-- The true last-to-first phase gap is strictly positive; 0/2π
wraparound is handled directly, without generic-position conditions. -/
theorem s046_wrap_gap_pos {n : ℕ} (θ : Fin (n + 1) ↪o ℝ)
    (hb : ∀ i : Fin (n + 1), 0 ≤ θ i ∧ θ i < 2 * Real.pi) :
    0 < 2 * Real.pi - θ (Fin.last n) + θ 0 := by
  have h0 := (hb 0).1
  have hlast := (hb (Fin.last n)).2
  linarith

/-- The genuine adjacent increments and the single final wrap sum to
exactly 2π. This identity is not a circular-listing assumption. -/
theorem s046_true_full_turn {n : ℕ} (θ : Fin (n + 1) ↪o ℝ) :
    (∑ k ∈ Finset.range n,
      (s046_clamped_phase θ (k + 1) -
       s046_clamped_phase θ k)) +
      (2 * Real.pi - θ (Fin.last n) + θ 0) = 2 * Real.pi := by
  have hlast : s046_clamped_phase θ n = θ (Fin.last n) := by
    simp [s046_clamped_phase, Fin.last]
  have hfirst : s046_clamped_phase θ 0 = θ 0 := by
    simp [s046_clamped_phase]
  rw [s046_telescope, hlast, hfirst]
  ring

/-- On every genuine ellipse site set of successor cardinality, one may
choose the actual ordered original phases; their ordinary and wrap gaps
are all positive and sum to a full turn. No alternate site set appears. -/
theorem s046_original_ellipse_cyclic_gaps
    (a b : ℝ) (S : Finset Point) (n : ℕ)
    (hcard : S.card = n + 1)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ θ : Fin (n + 1) ↪o ℝ,
      (∀ i : Fin (n + 1), 0 ≤ θ i ∧ θ i < 2 * Real.pi) ∧
      ((Finset.univ : Finset (Fin (n + 1))).image
        (fun i => ellipsePoint a b (θ i)) = S) ∧
      (∀ k : ℕ, k < n →
        0 < s046_clamped_phase θ (k + 1) -
          s046_clamped_phase θ k) ∧
      0 < 2 * Real.pi - θ (Fin.last n) + θ 0 ∧
      (∑ k ∈ Finset.range n,
        (s046_clamped_phase θ (k + 1) -
         s046_clamped_phase θ k)) +
        (2 * Real.pi - θ (Fin.last n) + θ 0) = 2 * Real.pi := by
  obtain ⟨θ, hb, hS⟩ :=
    s045_finite_ellipse_ordered_index a b S hboundary
  rw [hcard] at θ hb hS
  refine ⟨θ, hb, hS, ?_, ?_, ?_⟩
  · intro k hk
    exact s046_clamped_adjacent_gap_pos θ k hk
  · exact s046_wrap_gap_pos θ hb
  · exact s046_true_full_turn θ

end ETSHTS
