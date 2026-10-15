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

/-- Arbitrarily many distinct original boundary sites admit a *finite*
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

end ETSHTS
