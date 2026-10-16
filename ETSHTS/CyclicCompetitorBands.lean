module
public import ETSHTS.CyclicCompetitorLifts

@[expose] public section


/-!
# S049 — true competitor floor in the forward and central angle bands

All inequalities use original ellipsePoint sites, the original Euclidean
squared skip, and genuine Fin neighbours, without extra angular spacing.
The backward short band is a separate remaining original proof obligation.
-/

noncomputable section
namespace ETSHTS

/-- Original non-neighbour points in the *forward* short band are
dominated by the globally selected original eligible Euclidean skip.
The new rank-order theorem discharges the actual second-successor
comparison previously missing in S048. -/
theorem s049_forward_band_actual_competitor {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hn : 4 ≤ n)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i k : Fin (n + 1))
    (hmin : ∀ j : Fin (n + 1),
      s046_cyclic_gap θ j +
        s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ j)
    (hcentre : k ≠ (finRotate (n + 1)) i)
    (hleft : k ≠ i)
    (hright : k ≠ (finRotate (n + 1))
      ((finRotate (n + 1)) i))
    (hshort : s048_forward_competitor_lift θ
      ((finRotate (n + 1)) i) k -
      θ ((finRotate (n + 1)) i) < lambda a b) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
        (ellipsePoint a b (θ k)) := by
  have hafter := s049_non_neighbour_after_real_second
    hn θ hphase i k hcentre hleft hright
  have hfloor := s048_forward_actual_two_successor_floor
    a b hb hab θ hphase i ((finRotate (n + 1)) i)
    hmin (s048_forward_competitor_lift θ
      ((finRotate (n + 1)) i) k) hafter hshort
  rw [s048_forward_competitor_lift_site] at hfloor
  exact hfloor

/-- The closed central floor applies without any index assumptions
beyond the actual finite cyclic phases: endpoints belong to the central
case by non-strict comparisons, including exact cutoff equality. -/
theorem s049_middle_band_actual_competitor {n : ℕ}
    (a b : ℝ) (hb : 0 < b) (hab : b ≤ a)
    (hr : a / b ≤ R) (hn : 4 ≤ n)
    (θ : Fin (n + 1) ↪o ℝ)
    (hphase : ∀ k : Fin (n + 1), 0 ≤ θ k ∧ θ k < 2 * Real.pi)
    (i k : Fin (n + 1))
    (hmin : ∀ j : Fin (n + 1),
      s046_cyclic_gap θ j +
        s046_cyclic_gap θ ((finRotate (n + 1)) j) < lambda a b →
      s046_squared_skip_chord a b θ i ≤
        s046_squared_skip_chord a b θ j)
    (hlower : lambda a b ≤ s048_forward_competitor_lift θ
      ((finRotate (n + 1)) i) k - θ ((finRotate (n + 1)) i))
    (hupper : s048_forward_competitor_lift θ
      ((finRotate (n + 1)) i) k - θ ((finRotate (n + 1)) i) ≤
        2 * Real.pi - lambda a b) :
    s046_squared_skip_chord a b θ i ≤
      sqDist (ellipsePoint a b (θ ((finRotate (n + 1)) i)))
        (ellipsePoint a b (θ k)) := by
  have hfloor := s048_selected_skip_le_central_actual_competitor
    a b (θ ((finRotate (n + 1)) i))
    (s048_forward_competitor_lift θ ((finRotate (n + 1)) i) k)
    hb hab hr (by omega : 5 ≤ n + 1) θ hphase i hmin hlower hupper
  rw [s048_forward_competitor_lift_site] at hfloor
  exact hfloor

end ETSHTS
