module
public import ETSHTS.CertificateCases

@[expose] public section


/-!
# S042: finite cyclic-index arithmetic for the exact metric-skip selector

A successor permutation visits each index once. Its two-gap sum is twice
the total gap sum; for a full turn this is precisely four pi. The existing
eligible minimum theorem can therefore be invoked without assuming the
two-gap identity as a separate input. The remaining work is to construct
this permutation and its positive real gaps from actual ellipse sites.
-/

noncomputable section
namespace ETSHTS

/-- Index permutation preserves a finite real sum. -/
theorem s042_sum_permuted_gap (n : ℕ) (next : Fin n ≃ Fin n)
    (gap : Fin n → ℝ) :
    (∑ i : Fin n, gap (next i)) = ∑ i : Fin n, gap i := by
  classical
  apply Finset.sum_bij (fun i _ => next i)
  · intro i hi
    simp
  · intro i j hi hj hij
    exact next.injective hij
  · intro j hj
    refine ⟨next.symm j, by simp, ?_⟩
    simp
  · intro i hi
    rfl

/-- The fundamental two-gap cyclic identity is algebraic, including
cyclic wraparound: any bijective successor index is counted once. -/
theorem s042_two_gap_sum (n : ℕ) (next : Fin n ≃ Fin n)
    (gap : Fin n → ℝ) :
    (∑ i : Fin n, (gap i + gap (next i))) =
      2 * ∑ i : Fin n, gap i := by
  rw [Finset.sum_add_distrib, s042_sum_permuted_gap n next gap]
  ring

/-- The full-turn angular sum gives the exact four-pi two-gap total. -/
theorem s042_two_gap_sum_full_turn (n : ℕ) (next : Fin n ≃ Fin n)
    (gap : Fin n → ℝ)
    (hturn : (∑ i : Fin n, gap i) = 2 * Real.pi) :
    (∑ i : Fin n, (gap i + gap (next i))) = 4 * Real.pi := by
  rw [s042_two_gap_sum, hturn]
  ring

/-- The minimum Euclidean skip-chord among short two-gap arcs exists,
with the genuine 4*pi/5 averaging witness constructed from a cyclic
full-turn gap sum, not given as an independent hypothesis. -/
theorem s042_eligible_metric_min_from_full_turn
    (n : ℕ) (hn : 5 ≤ n) (next : Fin n ≃ Fin n)
    (gap skipSquared : Fin n → ℝ) (cutoff : ℝ)
    (hturn : (∑ i : Fin n, gap i) = 2 * Real.pi)
    (hcut : 4 * Real.pi / 5 < cutoff) :
    ∃ i : Fin n, gap i + gap (next i) < cutoff ∧
      ∀ j : Fin n, gap j + gap (next j) < cutoff →
        skipSquared i ≤ skipSquared j := by
  have hsum : (∑ i : Fin n, (gap i + gap (next i))) =
      4 * Real.pi :=
    s042_two_gap_sum_full_turn n next gap hturn
  have hwitness : ∃ i : Fin n, gap i + gap (next i) < cutoff :=
    s035_eligible_exists_from_average n hn
      (fun i => gap i + gap (next i)) hsum cutoff hcut
  exact s035_eligible_metric_min_exists n
    (fun i => gap i + gap (next i)) skipSquared cutoff hwitness

end ETSHTS
