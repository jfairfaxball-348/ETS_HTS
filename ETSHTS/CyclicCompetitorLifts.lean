module
public import ETSHTS.CyclicCompetitorRank

@[expose] public section


/-!
# S049 — identify the exact second-successor real lift

The two-gap chord endpoint and the rank-two competitor must have the
same real phase *not merely the same ellipse site*.  The proof below
separates ordinary indices, penultimate indices and the terminal wrap.
-/

noncomputable section
namespace ETSHTS

/-- The S047 two-successor real phase equals the S048 genuine forward
competitor lift at the actual second successor.  This is an equality
of REAL NUMBERS, with the single seam shift made explicit. -/
theorem s049_right_lift_eq_forward_second {n : ℕ} (hn : 2 ≤ n)
    (θ : Fin (n + 1) ↪o ℝ) (c : Fin (n + 1)) :
    s047_right_lift θ c =
      s048_forward_competitor_lift θ c
        ((finRotate (n + 1)) ((finRotate (n + 1)) c)) := by
  classical
  by_cases hplain : c.val + 2 ≤ n
  · have hrot : (finRotate (n + 1)) c =
        ⟨c.val + 1, by omega⟩ := by
      simpa using (finRotate_of_lt (show c.val < n by omega))
    have hrot2 : (finRotate (n + 1))
        (⟨c.val + 1, by omega⟩ : Fin (n + 1)) =
        ⟨c.val + 2, by omega⟩ := by
      simpa using (finRotate_of_lt
        (show c.val + 1 < n by omega))
    have hnlast : c ≠ Fin.last n := by
      intro he
      have hv := congrArg Fin.val he
      change c.val = n at hv
      omega
    have hnlast1 : (finRotate (n + 1)) c ≠ Fin.last n := by
      rw [hrot]
      intro he
      have hv := congrArg Fin.val he
      change c.val + 1 = n at hv
      omega
    have hnot : ¬ ((finRotate (n + 1)) ((finRotate (n + 1)) c)) < c := by
      rw [hrot, hrot2]
      change ¬ (c.val + 2 < c.val)
      omega
    simp only [s047_right_lift, s048_forward_competitor_lift,
      if_neg hnlast, if_neg hnlast1, if_neg hnot, add_zero]
  · by_cases hlast : c.val = n
    · have hc : c = Fin.last n := Fin.ext hlast
      subst c
      have hrot0 : (finRotate (n + 1)) (0 : Fin (n + 1)) =
          ⟨1, by omega⟩ := by
        simpa using (finRotate_of_lt (show (0 : Fin (n + 1)).val < n by
          simp; omega))
      have hne0 : (0 : Fin (n + 1)) ≠ Fin.last n := by
        intro he
        have hv := congrArg Fin.val he
        change 0 = n at hv
        omega
      have hlt : (⟨1, by omega⟩ : Fin (n + 1)) < Fin.last n := by
        change 1 < n
        omega
      simp [s047_right_lift, s048_forward_competitor_lift,
        finRotate_last, hrot0, hne0, hlt]
    · have hpenultimate : c.val + 1 = n := by
        have hbd := c.isLt
        omega
      have hrot : (finRotate (n + 1)) c = Fin.last n := by
        calc
          (finRotate (n + 1)) c =
              ⟨c.val + 1, by omega⟩ := by
                simpa using (finRotate_of_lt (show c.val < n by omega))
          _ = Fin.last n := Fin.ext hpenultimate
      have hne : c ≠ Fin.last n := by
        intro he
        have hv := congrArg Fin.val he
        change c.val = n at hv
        omega
      have hlt : (0 : Fin (n + 1)) < c := by
        change 0 < c.val
        omega
      simp [s047_right_lift, s048_forward_competitor_lift,
        hrot, finRotate_last, hne, hlt]

/-- Every actual non-neighbour in the full original cycle lies at or
beyond its real second-successor phase in the S048 lift. -/
theorem s049_non_neighbour_after_real_second {n : ℕ} (hn : 4 ≤ n)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i k : Fin (n + 1))
    (hcentre : k ≠ (finRotate (n + 1)) i)
    (hleft : k ≠ i)
    (hright : k ≠
      (finRotate (n + 1)) ((finRotate (n + 1)) i)) :
    s047_right_lift θ ((finRotate (n + 1)) i) ≤
      s048_forward_competitor_lift θ ((finRotate (n + 1)) i) k := by
  have hbound := (s049_non_neighbour_rank_interval hn i k
    hcentre hleft hright).1
  have hsecond := s049_rank_second_successor (by omega : 2 ≤ n)
    ((finRotate (n + 1)) i)
  have hle : s049_forward_rank ((finRotate (n + 1)) i)
      ((finRotate (n + 1)) ((finRotate (n + 1))
        ((finRotate (n + 1)) i))) ≤
      s049_forward_rank ((finRotate (n + 1)) i) k := by
    rw [hsecond]
    exact hbound
  have hphase_le :
      s048_forward_competitor_lift θ ((finRotate (n + 1)) i)
        ((finRotate (n + 1)) ((finRotate (n + 1))
          ((finRotate (n + 1)) i))) ≤
      s048_forward_competitor_lift θ ((finRotate (n + 1)) i) k := by
    by_cases heq : (finRotate (n + 1))
        ((finRotate (n + 1)) ((finRotate (n + 1)) i)) = k
    · rw [heq]
    · have hlt : s049_forward_rank ((finRotate (n + 1)) i)
          ((finRotate (n + 1)) ((finRotate (n + 1))
            ((finRotate (n + 1)) i))) <
          s049_forward_rank ((finRotate (n + 1)) i) k := by
        have hneq_rank : s049_forward_rank ((finRotate (n + 1)) i)
            ((finRotate (n + 1)) ((finRotate (n + 1))
              ((finRotate (n + 1)) i))) ≠
            s049_forward_rank ((finRotate (n + 1)) i) k := by
          intro hh
          exact heq (s049_forward_rank_injective
            ((finRotate (n + 1)) i) _ _ hh)
        exact lt_of_le_of_ne hle hneq_rank
      exact le_of_lt (s049_forward_rank_strictMono_lift
        θ hphase _ _ _ hlt)
  rw [s049_right_lift_eq_forward_second (by omega : 2 ≤ n)]
  exact hphase_le

end ETSHTS
