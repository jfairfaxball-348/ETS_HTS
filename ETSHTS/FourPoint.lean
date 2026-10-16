module
public import ETSHTS.RationalBound

@[expose] public section


/-!
# S031: the exact fourth-insertion certificate interface

This theorem is a proof about the original Grow, exactlyTwoNearest and
planeEdges definitions. It is NOT a proof of all convex/interior quadruples:
its two geometric inputs (strict distance separation and planarity) remain
to be derived from general position. They are exposed, not silently assumed.
-/

noncomputable section
namespace ETSHTS

/-- Given a seed triangle and a fourth site strictly closer to q and r
than to p, the mandatory insertion is q,r, regardless of lex ties.
If the five-edge drawing is plane, the exact four-site retained order follows. -/
theorem four_point_order_from_strict_separation
    (p q r v : Point)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hv : v ∉ ({p, q, r} : Finset Point))
    (hq : sqDist v q < sqDist v p)
    (hr : sqDist v r < sqDist v p)
    (hplane : planeEdges
      (triangleEdges p q r ∪ {edge v q, edge v r})) :
    planeNearestTwoOrder ({p, q, r, v} : Finset Point) := by
  have hnear : exactlyTwoNearest ({p, q, r} : Finset Point) v q r := by
    apply exactlyTwoNearest_of_strict_gap (by simp) (by simp) hqr
    intro x hx hxq hxr
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact ⟨hq, hr⟩
    · exact (hxq rfl).elim
    · exact (hxr rfl).elim
  have hvp : v ≠ p := by
    intro heq
    apply hv
    simp [heq]
  have hvq : v ≠ q := by
    intro heq
    apply hv
    simp [heq]
  have hvr : v ≠ r := by
    intro heq
    apply hv
    simp [heq]
  have hn : ([p, q, r, v] : List Point).Nodup := by
    simp [List.nodup_cons, hpq, hpr, hqr, hvp, hvq, hvr,
      hvp.symm, hvq.symm, hvr.symm]
  refine ⟨p, q, r, [v], triangleEdges p q r ∪ {edge v q, edge v r},
    hpq, hpr, hqr, ?_, ?_, ?_, hplane⟩
  · simpa using hn
  · simp
  · apply Grow.insert [p, q, r] (triangleEdges p q r)
      v q r [] (triangleEdges p q r ∪ {edge v q, edge v r})
    · simpa using hnear
    · exact Grow.finish ([p, q, r] ++ [v])
        (triangleEdges p q r ∪ {edge v q, edge v r})

end ETSHTS
