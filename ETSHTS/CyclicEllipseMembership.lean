import ETSHTS.CyclicEllipseSkip

/-!
# S046 — original finite indexed sites are genuinely distinct

The S045 exact cardinal/image covering proves the ellipse-site map on the
actual indexed original sites is injective. This is a finite-cardinality
argument, not a false global injectivity claim for periodic angles.
-/

noncomputable section
namespace ETSHTS

/-- Every indexed point is a member of the *original* finite ellipse site
set; no replacement angular image has been introduced. -/
theorem s046_indexed_ellipse_site_mem {n : ℕ} (a b : ℝ)
    (S : Finset Point) (θ : Fin (n + 1) ↪o ℝ)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun i => ellipsePoint a b (θ i)) = S)
    (i : Fin (n + 1)) :
    ellipsePoint a b (θ i) ∈ S := by
  rw [← himage]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

/-- Since the original finite site image has the exact source cardinality,
all actual indexed sites are distinct. In particular this handles
arbitrarily close and antipodal original sites with no extra hypothesis. -/
theorem s046_indexed_ellipse_sites_injective {n : ℕ} (a b : ℝ)
    (S : Finset Point) (hcard : S.card = n + 1)
    (θ : Fin (n + 1) ↪o ℝ)
    (himage : (Finset.univ : Finset (Fin (n + 1))).image
      (fun i => ellipsePoint a b (θ i)) = S) :
    Function.Injective (fun i : Fin (n + 1) => ellipsePoint a b (θ i)) := by
  classical
  have hsame :
      ((Finset.univ : Finset (Fin (n + 1))).image
        (fun i => ellipsePoint a b (θ i))).card =
      (Finset.univ : Finset (Fin (n + 1))).card := by
    rw [himage, hcard]
    simp
  have hinj := (Finset.card_image_iff).mp hsame
  intro i j hij
  exact hinj (Finset.mem_univ i) (Finset.mem_univ j) hij

end ETSHTS
