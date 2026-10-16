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
end ETSHTS
