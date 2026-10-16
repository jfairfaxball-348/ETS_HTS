module
public import ETSHTS.CyclicEllipseOrientation

@[expose] public section


/-!
# S047 — exact hull sides of original finite ordered ellipse sites

Consecutive sorted phases (and the last-to-first wrap) really produce
supporting hull sides in the original S, not just abstract angular
adjacency. Every other original site comes from the exact indexed image,
and the correct orientation sign is forced by a full-turn ordered triple.
-/

noncomputable section
namespace ETSHTS

/-- Every ordinary consecutive ordered original ellipse phase gives
an actual original supporting hull side. -/
theorem s047_original_consecutive_hullSide {n : ℕ}
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) = S)
    (i : Fin (n + 1)) (hi : i.val < n) :
    hullSide S (ellipsePoint a b (θ i))
      (ellipsePoint a b (θ ⟨i.val + 1, by omega⟩)) := by
  let j : Fin (n + 1) := ⟨i.val + 1, by omega⟩
  have hij : i < j := by change i.val < i.val + 1; omega
  have hijθ : θ i < θ j := θ.strictMono hij
  have inj := s046_indexed_ellipse_sites_injective a b S hcard θ himage
  have hne : ellipsePoint a b (θ i) ≠ ellipsePoint a b (θ j) := by
    intro he
    have h := congrArg Fin.val (inj he)
    change i.val = i.val + 1 at h
    omega
  change hullSide S (ellipsePoint a b (θ i))
    (ellipsePoint a b (θ j))
  refine ⟨s046_indexed_ellipse_site_mem a b S θ himage i,
    s046_indexed_ellipse_site_mem a b S θ himage j, hne, Or.inl ?_⟩
  intro x hx
  rw [← himage] at hx
  obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hx
  by_cases hki : k = i
  · subst k
    simp [orientation] <;> nlinarith
  by_cases hkj : k = j
  · subst k
    simp [orientation] <;> nlinarith
  by_cases hpre : k.val < i.val
  · have hik : θ k < θ i :=
      θ.strictMono (by change k.val < i.val; omega)
    have hjfull := (hphase j).2
    have hk0 := (hphase k).1
    have hpos := s047_ellipse_ordered_orientation_pos a b
      (θ i) (θ j) (θ k + 2 * Real.pi)
      ha hb hijθ (by linarith) (by linarith)
    rw [s047_ellipsePoint_add_two_pi] at hpos
    exact le_of_lt hpos
  · have hpost : j.val < k.val := by
      have hval1 : k.val ≠ i.val := by
        intro he
        exact hki (Fin.ext he)
      have hval2 : k.val ≠ j.val := by
        intro he
        exact hkj (Fin.ext he)
      have hjval : j.val = i.val + 1 := rfl
      omega
    have hjk : θ j < θ k :=
      θ.strictMono (by change j.val < k.val; omega)
    have hfull := (hphase k).2
    have hi0 := (hphase i).1
    have hpos := s047_ellipse_ordered_orientation_pos a b
      (θ i) (θ j) (θ k) ha hb hijθ hjk (by linarith)
    exact le_of_lt hpos

/-- The final-to-first cyclic successor is also a true supporting
hull side of the *same* original site set, with the unique 2π lift. -/
theorem s047_original_wrap_hullSide {n : ℕ}
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) = S)
    (hn : 1 ≤ n) :
    hullSide S (ellipsePoint a b (θ (Fin.last n)))
      (ellipsePoint a b (θ 0)) := by
  have inj := s046_indexed_ellipse_sites_injective a b S hcard θ himage
  have hne : ellipsePoint a b (θ (Fin.last n)) ≠
      ellipsePoint a b (θ 0) := by
    intro he
    have h := congrArg Fin.val (inj he)
    change n = 0 at h
    omega
  have hwrap : θ (Fin.last n) < θ 0 + 2 * Real.pi := by
    have hfirst := (hphase 0).1
    have hlast := (hphase (Fin.last n)).2
    linarith
  refine ⟨s046_indexed_ellipse_site_mem a b S θ himage (Fin.last n),
    s046_indexed_ellipse_site_mem a b S θ himage 0, hne, Or.inl ?_⟩
  intro x hx
  rw [← himage] at hx
  obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hx
  by_cases hkl : k = Fin.last n
  · subst k
    simp [orientation] <;> nlinarith
  by_cases hk0 : k = 0
  · subst k
    simp [orientation] <;> nlinarith
  · have hfirstk : θ 0 < θ k :=
      θ.strictMono (by
        change 0 < k.val
        have hkval : k.val ≠ 0 := by
          intro h
          exact hk0 (Fin.ext h)
        omega)
    have hklast : θ k < θ (Fin.last n) :=
      θ.strictMono (by
        change k.val < n
        have hkval : k.val ≠ n := by
          intro h
          exact hkl (Fin.ext h)
        have hbound := k.isLt
        omega)
    have hpos := s047_ellipse_ordered_orientation_pos a b
      (θ (Fin.last n)) (θ 0 + 2 * Real.pi)
      (θ k + 2 * Real.pi)
      ha hb hwrap (by linarith) (by linarith)
    rw [s047_ellipsePoint_add_two_pi, s047_ellipsePoint_add_two_pi] at hpos
    exact le_of_lt hpos

end ETSHTS
