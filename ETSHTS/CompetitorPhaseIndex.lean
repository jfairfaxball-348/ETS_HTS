import ETSHTS.ShortArcLifts

/-!
# S048 — each original competitor has a unique genuine cyclic phase index

No artificial angular spacing. Every original non-centre site gets a true
real forward phase difference strictly between 0 and 2π, including across
the final-to-first seam and in arbitrarily short gaps.
-/

noncomputable section
namespace ETSHTS

/-- Recover the UNIQUE original index of any site in the original S. -/
theorem s048_original_site_unique_index {n : ℕ}
    (a b : ℝ) (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) = S)
    (x : Point) (hx : x ∈ S) :
    ∃! k : Fin (n + 1), ellipsePoint a b (θ k) = x := by
  have hmem : x ∈ (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) := by
    simpa only [himage] using hx
  obtain ⟨k, _, hk⟩ := Finset.mem_image.mp hmem
  refine ⟨k, hk, ?_⟩
  intro j hj
  exact (s046_indexed_ellipse_sites_injective a b S hcard θ himage)
    (hj.trans hk.symm)

/-- One-turn lift of an actual phase index beyond an actual centre index.
The conditional adds a full turn only when crossing the zero-phase seam. -/
def s048_forward_competitor_lift {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ) (centre k : Fin (n + 1)) : ℝ :=
  θ k + (if k < centre then 2 * Real.pi else 0)

/-- The lift gives precisely the ORIGINAL ellipse site, not a replacement. -/
theorem s048_forward_competitor_lift_site {n : ℕ}
    (a b : ℝ) (θ : Fin (n + 1) ↪o ℝ)
    (centre k : Fin (n + 1)) :
    ellipsePoint a b (s048_forward_competitor_lift θ centre k) =
      ellipsePoint a b (θ k) := by
  classical
  exact s047_ellipsePoint_add_if_two_pi a b (θ k) (k < centre)

/-- Unique non-centre indexes have a strictly positive, strictly
sub-full-turn forward angular difference, regardless of the seam. -/
theorem s048_forward_lift_strict_turn {n : ℕ}
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (centre k : Fin (n + 1)) (hne : k ≠ centre) :
    0 < s048_forward_competitor_lift θ centre k - θ centre ∧
      s048_forward_competitor_lift θ centre k - θ centre <
        2 * Real.pi := by
  classical
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · have hθ := θ.strictMono hlt
    have hk0 := (hphase k).1
    have hcupper := (hphase centre).2
    simp only [s048_forward_competitor_lift, if_pos hlt]
    constructor <;> linarith
  · have hθ := θ.strictMono hgt
    have hc0 := (hphase centre).1
    have hkupper := (hphase k).2
    have hnlt : ¬ k < centre := not_lt_of_ge (le_of_lt hgt)
    simp only [s048_forward_competitor_lift, if_neg hnlt, add_zero]
    constructor <;> linarith

/-- Each original competitor outside an original selected centre has an
actual indexed phase and a site-preserving forward real lift in (0,2π).
This is the A1 membership/index/phase foundation for three-band partition. -/
theorem s048_original_competitor_index_and_lift {n : ℕ}
    (a b : ℝ) (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun k => ellipsePoint a b (θ k)) = S)
    (centre : Fin (n + 1))
    (x : Point) (hx : x ∈ S)
    (hne : x ≠ ellipsePoint a b (θ centre)) :
    ∃ k : Fin (n + 1),
      x = ellipsePoint a b (θ k) ∧ k ≠ centre ∧
      0 < s048_forward_competitor_lift θ centre k - θ centre ∧
      s048_forward_competitor_lift θ centre k - θ centre <
        2 * Real.pi ∧
      ellipsePoint a b (s048_forward_competitor_lift θ centre k) = x := by
  obtain ⟨k, hk, _⟩ :=
    s048_original_site_unique_index a b S hcard θ himage x hx
  have hkne : k ≠ centre := by
    intro heq
    apply hne
    rw [← hk, heq]
  have hturn := s048_forward_lift_strict_turn θ hphase centre k hkne
  refine ⟨k, hk.symm, hkne, hturn.1, hturn.2, ?_⟩
  rw [s048_forward_competitor_lift_site]
  exact hk

end ETSHTS
