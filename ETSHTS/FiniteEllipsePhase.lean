import ETSHTS.HullLastBridge

/-!
# S045 — finite-site normalised angular lifting (original ellipse)

Every finite set of distinct sites from the *original* ellipseBoundary
predicate is the image of a finite, equally large set of unique real angles
in [0, 2π). No angular separation, general-position bound, or ratio
restriction is introduced. This is the first finite-site input to the
still missing genuine cyclic gap construction and three-band ear proof.
-/

noncomputable section
namespace ETSHTS

/-- Reduce an arbitrary real parameter to the half-open true turn while
preserving the original ellipse site, including θ=0 and wraparound. -/
theorem s045_ellipsePoint_normalized (a b θ : ℝ) :
    ∃ φ : ℝ, 0 ≤ φ ∧ φ < 2 * Real.pi ∧
      ellipsePoint a b φ = ellipsePoint a b θ := by
  let φ : ℝ := toIcoMod Real.two_pi_pos 0 θ
  have hmem : φ ∈ Set.Ico (0 : ℝ) (2 * Real.pi) := by
    simpa [φ] using (toIcoMod_mem_Ico' Real.two_pi_pos θ)
  have hangle : (↑φ : Real.Angle) = (↑θ : Real.Angle) := by
    simpa [φ] using (Real.Angle.coe_toIcoMod θ 0)
  have hcos : Real.cos φ = Real.cos θ := by
    have h := congrArg Real.Angle.cos hangle
    simpa using h
  have hsin : Real.sin φ = Real.sin θ := by
    have h := congrArg Real.Angle.sin hangle
    simpa using h
  refine ⟨φ, hmem.1, hmem.2, ?_⟩
  simp only [ellipsePoint, hcos, hsin]

/-- The actual ellipseBoundary predicate, not an assumed real-angle listing,
supplies a representative in the canonical half-open full turn. -/
theorem s045_boundary_has_normalized_angle (a b : ℝ) (p : Point)
    (hp : ellipseBoundary a b p) :
    ∃ θ : ℝ, 0 ≤ θ ∧ θ < 2 * Real.pi ∧
      ellipsePoint a b θ = p := by
  obtain ⟨θ, rfl⟩ := hp
  exact s045_ellipsePoint_normalized a b θ

/-- Arbitrarily many distinct original boundary sites possess a *finite*
normalised phase set with exactly the same cardinality and no duplicated
angular representatives. The equality of images and cardinalities prevents
collisions of ellipse points on the selected phases. This works at the
equality ratio endpoint and for arbitrarily close or antipodal sites.

The remaining S020 bridge must turn this phase set into a cyclicly ordered
Fin n list with genuine positive successive gaps and full-turn sum. -/
theorem s045_finite_ellipse_phase_cover (a b : ℝ) (S : Finset Point)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ T : Finset ℝ,
      T.card = S.card ∧
      (∀ θ ∈ T, 0 ≤ θ ∧ θ < 2 * Real.pi) ∧
      T.image (ellipsePoint a b) = S := by
  classical
  induction S using Finset.induction_on with
  | empty =>
      refine ⟨∅, ?_, ?_, ?_⟩ <;> simp
  | @insert p S hp ih =>
      have hS : ∀ q ∈ S, ellipseBoundary a b q := by
        intro q hq
        exact hboundary q (Finset.mem_insert_of_mem hq)
      obtain ⟨T, hcard, hT, himage⟩ := ih hS
      obtain ⟨θ, hθ0, hθ2, hθp⟩ :=
        s045_boundary_has_normalized_angle a b p
          (hboundary p (Finset.mem_insert_self p S))
      have hθnot : θ ∉ T := by
        intro hθT
        have himageθ : ellipsePoint a b θ ∈ T.image (ellipsePoint a b) :=
          Finset.mem_image.mpr ⟨θ, hθT, rfl⟩
        rw [himage, hθp] at himageθ
        exact hp himageθ
      refine ⟨insert θ T, ?_, ?_, ?_⟩
      · simp [hθnot, hp, hcard]
      · intro φ hφ
        rcases Finset.mem_insert.mp hφ with rfl | hφT
        · exact ⟨hθ0, hθ2⟩
        · exact hT φ hφT
      · simpa [Finset.image_insert, hθp] using
          congrArg (insert p) himage


/-- A genuine *strictly increasing* Fin n angular parametrisation exists
for every original finite ellipse-boundary site set, with n = |S| exactly.
The image is all and only the original sites. No presumed cyclic indexing,
angle separation or replacement ellipse predicate is used. -/
theorem s045_finite_ellipse_ordered_index (a b : ℝ) (S : Finset Point)
    (hboundary : ∀ p ∈ S, ellipseBoundary a b p) :
    ∃ θ : Fin S.card ↪o ℝ,
      (∀ i : Fin S.card, 0 ≤ θ i ∧ θ i < 2 * Real.pi) ∧
      (Finset.univ : Finset (Fin S.card)).image
        (fun i => ellipsePoint a b (θ i)) = S := by
  classical
  obtain ⟨T, hcard, hbounds, himage⟩ :=
    s045_finite_ellipse_phase_cover a b S hboundary
  let θ : Fin S.card ↪o ℝ := T.orderEmbOfFin hcard
  refine ⟨θ, ?_, ?_⟩
  · intro i
    exact hbounds (θ i) (by
      simpa [θ] using (Finset.orderEmbOfFin_mem T hcard i))
  · have hindex :
        (Finset.univ : Finset (Fin S.card)).image (fun i => θ i) = T := by
      apply Finset.coe_injective
      simpa [θ] using (Finset.range_orderEmbOfFin T hcard)
    calc
      (Finset.univ : Finset (Fin S.card)).image
          (fun i => ellipsePoint a b (θ i)) =
          ((Finset.univ : Finset (Fin S.card)).image (fun i => θ i)).image
            (ellipsePoint a b) := by rfl
      _ = T.image (ellipsePoint a b) := by rw [hindex]
      _ = S := himage

/-- Consecutive indexed phases have strictly positive gaps, even when
the sites are arbitrarily close together. -/
theorem s045_ordered_index_adjacent_gap_pos
    {n : ℕ} (θ : Fin n ↪o ℝ)
    (i : Fin n) (hi : i.val + 1 < n) :
    0 < θ ⟨i.val + 1, hi⟩ - θ i := by
  apply sub_pos.mpr
  exact θ.strictMono (by
    change i.val < i.val + 1
    omega)

end ETSHTS
