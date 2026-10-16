import ETSHTS.CyclicCompetitorBands

/-!
# S049 — the actual second predecessor at the reverse short arc

The predecessor is an ORIGINAL Fin site, with the seam handled by a
single explicit last-index case. Its cyclic rank from the selected
centre is exactly n-1, the final non-neighbour rank.
-/

noncomputable section
namespace ETSHTS

def s049_previous {n : ℕ} (i : Fin (n + 1)) : Fin (n + 1) :=
  if h : i.val = 0 then Fin.last n
  else ⟨i.val - 1, by have hi := i.isLt; omega⟩

theorem s049_rotate_previous {n : ℕ} (i : Fin (n + 1)) :
    (finRotate (n + 1)) (s049_previous i) = i := by
  classical
  by_cases hz : i.val = 0
  · have he : i = (0 : Fin (n + 1)) := Fin.ext hz
    subst i
    simp [s049_previous, finRotate_last]
  · have hprev : s049_previous i =
        ⟨i.val - 1, by have hi := i.isLt; omega⟩ := by
      simp [s049_previous, hz]
    rw [hprev]
    have hval : i.val - 1 < n := by have hi := i.isLt; omega
    calc
      (finRotate (n + 1))
          (⟨i.val - 1, by have hi := i.isLt; omega⟩ : Fin (n + 1)) =
          ⟨i.val - 1 + 1, by omega⟩ := by
            simpa using (finRotate_of_lt hval)
      _ = i := by
        apply Fin.ext
        change i.val - 1 + 1 = i.val
        omega

/-- The selected centre is the second actual successor of the
predecessor of the selected left skip endpoint. -/
theorem s049_second_predecessor_reaches_centre {n : ℕ}
    (i : Fin (n + 1)) :
    (finRotate (n + 1))
      ((finRotate (n + 1)) (s049_previous i)) =
      (finRotate (n + 1)) i := by
  rw [s049_rotate_previous]

/-- Exact last non-neighbour rank, including i=0 and i=n. -/
theorem s049_rank_second_predecessor {n : ℕ} (hn : 4 ≤ n)
    (i : Fin (n + 1)) :
    s049_forward_rank ((finRotate (n + 1)) i)
      (s049_previous i) = n - 1 := by
  classical
  by_cases hz : i.val = 0
  · have hi : i = (0 : Fin (n + 1)) := Fin.ext hz
    subst i
    have hrot0 : (finRotate (n + 1)) (0 : Fin (n + 1)) =
        ⟨1, by omega⟩ := by
      simpa using (finRotate_of_lt (show (0 : Fin (n + 1)).val < n by
        simp; omega))
    have hprev : s049_previous (0 : Fin (n + 1)) = Fin.last n := by
      simp [s049_previous]
    rw [hrot0, hprev]
    have hle : (⟨1, by omega⟩ : Fin (n + 1)) ≤ Fin.last n := by
      change 1 ≤ n
      omega
    simp only [s049_forward_rank, if_pos hle]
    change n - 1 = n - 1
    rfl
  · by_cases hlast : i.val = n
    · have hi : i = Fin.last n := Fin.ext hlast
      subst i
      have hprev : s049_previous (Fin.last n) =
          ⟨n - 1, by omega⟩ := by
        simp [s049_previous, show n ≠ 0 by omega]
      rw [finRotate_last, hprev]
      have hle : (0 : Fin (n + 1)) ≤
          (⟨n - 1, by omega⟩ : Fin (n + 1)) := bot_le
      simp only [s049_forward_rank, if_pos hle]
      change n - 1 - 0 = n - 1
      omega
    · have hlt : i.val < n := by have hi := i.isLt; omega
      have hpos : 0 < i.val := by omega
      have hrot : (finRotate (n + 1)) i =
          ⟨i.val + 1, by omega⟩ := by
        simpa using (finRotate_of_lt hlt)
      have hprev : s049_previous i =
          ⟨i.val - 1, by omega⟩ := by
        simp [s049_previous, hz]
      rw [hrot, hprev]
      have hnot : ¬ (⟨i.val + 1, by omega⟩ : Fin (n + 1)) ≤
          (⟨i.val - 1, by omega⟩ : Fin (n + 1)) := by
        intro hh
        have hv : i.val + 1 ≤ i.val - 1 := Fin.le_def.mp hh
        omega
      simp only [s049_forward_rank, if_neg hnot]
      change n + 1 + (i.val - 1) - (i.val + 1) = n - 1
      omega

end ETSHTS
