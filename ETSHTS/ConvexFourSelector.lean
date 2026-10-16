module
public import ETSHTS.TriangleInteriorExact

@[expose] public section


/-!
# S042 continued — four-site crossing inequalities

A convex four-site configuration with crossing diagonals AC and BD
satisfies strict opposite-side path bounds:
AB + CD < AC + BD and BC + DA < AC + BD.
This file proves the nontrivial combinatorial selector which turns just
those inequalities into a vertex whose two incident sides are strictly
shorter than its opposite diagonal. The proof is independent of all
distance ties and of the coordinates; the actual Euclidean strict path
inequalities and geometric crossing classification remain separate.
-/

noncomputable section
namespace ETSHTS

/-- If AC is at least as long as BD, the two crossing-path inequalities
force a vertex with both sides STRICTLY shorter than its diagonal. -/
theorem s042_crossing_selector_AC_long
    (a b c d x y : ℝ)
    (hfirst : a + c < x + y)
    (hsecond : b + d < x + y)
    (horder : y ≤ x) :
    (a < x ∧ d < x) ∨ (b < x ∧ c < x) ∨
      (a < y ∧ b < y) ∨ (c < y ∧ d < y) := by
  by_cases hax : a < x
  · by_cases hdx : d < x
    · exact Or.inl ⟨hax, hdx⟩
    · have hby : b < y := by linarith
      by_cases hcx : c < x
      · exact Or.inr (Or.inl ⟨by linarith, hcx⟩)
      · have hay : a < y := by linarith
        exact Or.inr (Or.inr (Or.inl ⟨hay, hby⟩))
  · have hcy : c < y := by linarith
    by_cases hbx : b < x
    · exact Or.inr (Or.inl ⟨hbx, by linarith⟩)
    · have hdy : d < y := by linarith
      exact Or.inr (Or.inr (Or.inr ⟨hcy, hdy⟩))

/-- The full four-way strict diagonal selector. Both diagonal-length
orderings and their equality boundary are included. The conclusion is
robust to Cartesian lexicographic nearest-predecessor ties. -/
theorem s042_crossing_selector
    (a b c d x y : ℝ)
    (hfirst : a + c < x + y)
    (hsecond : b + d < x + y) :
    (a < x ∧ d < x) ∨ (b < x ∧ c < x) ∨
      (a < y ∧ b < y) ∨ (c < y ∧ d < y) := by
  rcases le_total y x with hxy | hyx
  · exact s042_crossing_selector_AC_long
      a b c d x y hfirst hsecond hxy
  · have hrotate := s042_crossing_selector_AC_long
      b c d a y x (by linarith) (by linarith) hyx
    rcases hrotate with h | h | h | h
    · exact Or.inr (Or.inr (Or.inl ⟨h.2, h.1⟩))
    · exact Or.inr (Or.inr (Or.inr h))
    · exact Or.inr (Or.inl h)
    · exact Or.inl ⟨h.2, h.1⟩

end ETSHTS
