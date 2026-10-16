import ETSHTS.CompetitorPhaseIndex

/-!
# S049 — arithmetic rank of the original forward cyclic site index

An index rank is taken *relative to an actual original centre*, not a
synthetic permutation of the geometric sites.  It records exactly where
the original Fin index lies in the one-turn lift established in S048.
This module establishes the ordering needed in the forward and reverse
short-arc estimates, including the zero-phase seam.
-/

noncomputable section
namespace ETSHTS

/-- The number of original successor steps, measured from an original
centre to a site index in its cyclic order.  Rank zero is the centre. -/
def s049_forward_rank {n : ℕ}
    (centre k : Fin (n + 1)) : ℕ :=
  if centre ≤ k then k.val - centre.val
  else n + 1 + k.val - centre.val

/-- Forward rank is always contained in the original finite cycle. -/
theorem s049_forward_rank_le {n : ℕ}
    (centre k : Fin (n + 1)) :
    s049_forward_rank centre k ≤ n := by
  classical
  unfold s049_forward_rank
  split_ifs with h
  · have hc := centre.isLt
    have hk := k.isLt
    omega
  · have hc := centre.isLt
    have hk := k.isLt
    have hlt : k.val < centre.val := (Fin.lt_def).mp (lt_of_not_ge h)
    omega

/-- Rank zero identifies the actual centre, across every wrap case. -/
theorem s049_forward_rank_eq_zero {n : ℕ}
    (centre k : Fin (n + 1)) :
    s049_forward_rank centre k = 0 ↔ k = centre := by
  classical
  constructor
  · intro h
    unfold s049_forward_rank at h
    split_ifs at h with hc
    · apply Fin.ext
      omega
    · have hlt : k.val < centre.val := (Fin.lt_def).mp (lt_of_not_ge hc)
      have hck := centre.isLt
      omega
  · rintro rfl
    simp [s049_forward_rank]

/-- Strict order of cyclic ranks gives strict order of true S048 real
lifts.  In the seam-crossing case this uses the original 0 ≤ phase < 2π,
not an artificial minimum spacing. -/
theorem s049_forward_rank_strictMono_lift {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (centre j k : Fin (n + 1))
    (hrank : s049_forward_rank centre j <
      s049_forward_rank centre k) :
    s048_forward_competitor_lift θ centre j <
      s048_forward_competitor_lift θ centre k := by
  classical
  by_cases hj : centre ≤ j
  · by_cases hk : centre ≤ k
    · have hval : j.val < k.val := by
        simp only [s049_forward_rank, if_pos hj, if_pos hk] at hrank
        omega
      have hphase_lt : θ j < θ k :=
        θ.strictMono (Fin.lt_def.mpr hval)
      have hnj : ¬ j < centre := not_lt_of_ge hj
      have hnk : ¬ k < centre := not_lt_of_ge hk
      simpa [s048_forward_competitor_lift, hnj, hnk] using hphase_lt
    · have hjnot : ¬ j < centre := not_lt_of_ge hj
      have hklt : k < centre := lt_of_not_ge hk
      have hθj := (hphase j).2
      have hθk := (hphase k).1
      simp only [s048_forward_competitor_lift, if_neg hjnot, if_pos hklt,
        add_zero]
      linarith
  · have hjlt : j < centre := lt_of_not_ge hj
    by_cases hk : centre ≤ k
    · have hkj := k.isLt
      have hcj := centre.isLt
      have hjval : j.val < centre.val := Fin.lt_def.mp hjlt
      simp only [s049_forward_rank, if_neg hj, if_pos hk] at hrank
      omega
    · have hklt : k < centre := lt_of_not_ge hk
      have hval : j.val < k.val := by
        simp only [s049_forward_rank, if_neg hj, if_neg hk] at hrank
        omega
      have hθ : θ j < θ k := θ.strictMono (Fin.lt_def.mpr hval)
      simpa [s048_forward_competitor_lift, hjlt, hklt] using
        (add_lt_add_right hθ (2 * Real.pi))


/-- The actual index is uniquely determined by its cyclic rank.  This
complements S048 unique phase indexing with a combinatorial cycle coordinate. -/
theorem s049_forward_rank_injective {n : ℕ}
    (centre : Fin (n + 1)) (j k : Fin (n + 1))
    (heq : s049_forward_rank centre j = s049_forward_rank centre k) :
    j = k := by
  classical
  by_cases hj : centre ≤ j
  · by_cases hk : centre ≤ k
    · simp only [s049_forward_rank, if_pos hj, if_pos hk] at heq
      apply Fin.ext
      have hvj : centre.val ≤ j.val := Fin.le_def.mp hj
      have hvk : centre.val ≤ k.val := Fin.le_def.mp hk
      omega
    · simp only [s049_forward_rank, if_pos hj, if_neg hk] at heq
      have hvj : centre.val ≤ j.val := Fin.le_def.mp hj
      have hvk : k.val < centre.val := Fin.lt_def.mp (lt_of_not_ge hk)
      have hjbd := j.isLt
      have hcbd := centre.isLt
      omega
  · by_cases hk : centre ≤ k
    · simp only [s049_forward_rank, if_neg hj, if_pos hk] at heq
      have hvj : j.val < centre.val := Fin.lt_def.mp (lt_of_not_ge hj)
      have hvk : centre.val ≤ k.val := Fin.le_def.mp hk
      have hkbd := k.isLt
      have hcbd := centre.isLt
      omega
    · simp only [s049_forward_rank, if_neg hj, if_neg hk] at heq
      apply Fin.ext
      have hvj : j.val < centre.val := Fin.lt_def.mp (lt_of_not_ge hj)
      have hvk : k.val < centre.val := Fin.lt_def.mp (lt_of_not_ge hk)
      have hcbd := centre.isLt
      omega


/-- The immediate successor in the original finite rotation has rank one. -/
theorem s049_rank_first_successor {n : ℕ} (hn : 1 ≤ n)
    (centre : Fin (n + 1)) :
    s049_forward_rank centre ((finRotate (n + 1)) centre) = 1 := by
  classical
  by_cases hlast : centre = Fin.last n
  · subst centre
    rw [finRotate_last]
    have hnot : ¬ (Fin.last n : Fin (n + 1)) ≤ 0 := by
      intro hh
      change n ≤ 0 at hh
      omega
    simp only [s049_forward_rank, if_neg hnot]
    change n + 1 + 0 - n = 1
    omega
  · have hlt : centre.val < n := by
      have hcbd := centre.isLt
      have hne : centre.val ≠ n := by
        intro he
        apply hlast
        apply Fin.ext
        exact he
      omega
    have hrot : (finRotate (n + 1)) centre =
        ⟨centre.val + 1, by omega⟩ := by
      simpa using (finRotate_of_lt hlt)
    rw [hrot]
    have hle : centre ≤ (⟨centre.val + 1, by omega⟩ : Fin (n + 1)) := by
      change centre.val ≤ centre.val + 1
      omega
    simp only [s049_forward_rank, if_pos hle]
    change centre.val + 1 - centre.val = 1
    omega

/-- The genuine second successor is exactly rank two, including when
either of its two steps traverses the end-to-start seam. -/
theorem s049_rank_second_successor {n : ℕ} (hn : 2 ≤ n)
    (centre : Fin (n + 1)) :
    s049_forward_rank centre
      ((finRotate (n + 1)) ((finRotate (n + 1)) centre)) = 2 := by
  classical
  by_cases hplain : centre.val + 2 ≤ n
  · have hrot : (finRotate (n + 1)) centre =
        ⟨centre.val + 1, by omega⟩ := by
      simpa using (finRotate_of_lt (show centre.val < n by omega))
    have hrot2 : (finRotate (n + 1))
        (⟨centre.val + 1, by omega⟩ : Fin (n + 1)) =
        ⟨centre.val + 2, by omega⟩ := by
      simpa using (finRotate_of_lt
        (show centre.val + 1 < n by omega))
    rw [hrot, hrot2]
    have hle : centre ≤ (⟨centre.val + 2, by omega⟩ : Fin (n + 1)) := by
      change centre.val ≤ centre.val + 2
      omega
    simp only [s049_forward_rank, if_pos hle]
    change centre.val + 2 - centre.val = 2
    omega
  · by_cases hlast : centre.val = n
    · have hcentre : centre = Fin.last n := Fin.ext hlast
      subst centre
      rw [finRotate_last]
      have hrot0 : (finRotate (n + 1)) (0 : Fin (n + 1)) =
          ⟨1, by omega⟩ := by
        simpa using (finRotate_of_lt (show (0 : Fin (n + 1)).val < n by
          simp; omega))
      rw [hrot0]
      have hnot : ¬ (Fin.last n : Fin (n + 1)) ≤
          (⟨1, by omega⟩ : Fin (n + 1)) := by
        intro hh
        change n ≤ 1 at hh
        omega
      simp only [s049_forward_rank, if_neg hnot]
      change n + 1 + 1 - n = 2
      omega
    · have hpenultimate : centre.val + 1 = n := by
        have hcbd := centre.isLt
        omega
      have hrot : (finRotate (n + 1)) centre = Fin.last n := by
        calc
          (finRotate (n + 1)) centre =
              ⟨centre.val + 1, by omega⟩ := by
                simpa using (finRotate_of_lt
                  (show centre.val < n by omega))
          _ = Fin.last n := Fin.ext hpenultimate
      rw [hrot, finRotate_last]
      have hnot : ¬ centre ≤ (0 : Fin (n + 1)) := by
        intro hh
        have hz : centre.val ≤ 0 := Fin.le_def.mp hh
        omega
      simp only [s049_forward_rank, if_neg hnot]
      change n + 1 + 0 - centre.val = 2
      omega

/-- The immediate predecessor of the original centre (the left endpoint
of the selected skip) has the final positive cyclic rank. -/
theorem s049_rank_predecessor {n : ℕ} (hn : 1 ≤ n)
    (i : Fin (n + 1)) :
    s049_forward_rank ((finRotate (n + 1)) i) i = n := by
  classical
  by_cases hlast : i = Fin.last n
  · subst i
    rw [finRotate_last]
    have hle : (0 : Fin (n + 1)) ≤ Fin.last n := bot_le
    simp only [s049_forward_rank, if_pos hle]
    change n - 0 = n
    omega
  · have hlt : i.val < n := by
      have hibd := i.isLt
      have hne : i.val ≠ n := by
        intro he
        apply hlast
        apply Fin.ext
        exact he
      omega
    have hrot : (finRotate (n + 1)) i =
        ⟨i.val + 1, by omega⟩ := by
      simpa using (finRotate_of_lt hlt)
    rw [hrot]
    have hnot : ¬ (⟨i.val + 1, by omega⟩ : Fin (n + 1)) ≤ i := by
      intro hh
      have hv : i.val + 1 ≤ i.val := Fin.le_def.mp hh
      omega
    simp only [s049_forward_rank, if_neg hnot]
    change n + 1 + i.val - (i.val + 1) = n
    omega

/-- Crucial original-index classification: any actual non-neighbour x
different from the selected ear centre and its two original hull neighbours
has cyclic rank between the SECOND successor and SECOND predecessor
(inclusively).  This is an exact finite classification, valid at the seam. -/
theorem s049_non_neighbour_rank_interval {n : ℕ} (hn : 4 ≤ n)
    (i k : Fin (n + 1))
    (hcentre : k ≠ (finRotate (n + 1)) i)
    (hleft : k ≠ i)
    (hright : k ≠ (finRotate (n + 1))
      ((finRotate (n + 1)) i)) :
    2 ≤ s049_forward_rank ((finRotate (n + 1)) i) k ∧
      s049_forward_rank ((finRotate (n + 1)) i) k ≤ n - 1 := by
  let c : Fin (n + 1) := (finRotate (n + 1)) i
  have hz : s049_forward_rank c k ≠ 0 := by
    intro hh
    exact hcentre ((s049_forward_rank_eq_zero c k).mp hh)
  have hfirst : s049_forward_rank c k ≠ 1 := by
    intro hh
    have hone := s049_rank_first_successor (by omega : 1 ≤ n) c
    have heq : k = (finRotate (n + 1)) c :=
      s049_forward_rank_injective c k
        ((finRotate (n + 1)) c) (hh.trans hone.symm)
    exact hright heq
  have hlast : s049_forward_rank c k ≠ n := by
    intro hh
    have hnrank := s049_rank_predecessor (by omega : 1 ≤ n) i
    have heq : k = i := s049_forward_rank_injective c k i
      (hh.trans hnrank.symm)
    exact hleft heq
  have hbound := s049_forward_rank_le c k
  change 2 ≤ s049_forward_rank c k ∧
    s049_forward_rank c k ≤ n - 1
  constructor <;> omega
end ETSHTS
