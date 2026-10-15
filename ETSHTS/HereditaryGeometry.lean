import ETSHTS.NoThreeCollinear

/-!
# S041 — hereditary finite strict geometry for ear removal

Deleting sites preserves strict exposure, noncollinearity, and previously
supported hull sides between surviving endpoints. These results apply to
the original Finset geometry and original definitions, and do not claim
that all hull sides remain the same after deletion.
-/

noncomputable section
namespace ETSHTS

/-- Strict linear exposure survives restriction to any finite subset. -/
theorem s041_strictConvexPosition_of_subset
    {T S : Finset Point} (hsub : T ⊆ S)
    (hconv : strictConvexPosition S) : strictConvexPosition T := by
  intro v hv
  obtain ⟨nx, ny, hmax⟩ := hconv v (hsub hv)
  refine ⟨nx, ny, ?_⟩
  intro w hw hwv
  exact hmax w (hsub hw) hwv

/-- Every noncollinear triple of a subset remains noncollinear. -/
theorem s041_noThreeCollinear_of_subset
    {T S : Finset Point} (hsub : T ⊆ S)
    (hno : noThreeCollinear S) : noThreeCollinear T := by
  intro p hp q hq r hr hpq hpr hqr
  exact hno p (hsub hp) q (hsub hq) r (hsub hr) hpq hpr hqr

/-- An existing supporting hull side stays supporting after site deletion,
as long as its endpoints remain. The converse is not assumed. -/
theorem s041_hullSide_of_subset
    {T S : Finset Point} (hsub : T ⊆ S)
    {p q : Point} (hside : hullSide S p q)
    (hp : p ∈ T) (hq : q ∈ T) :
    hullSide T p q := by
  obtain ⟨_, _, hpq, hsign⟩ := hside
  refine ⟨hp, hq, hpq, ?_⟩
  rcases hsign with hleft | hright
  · exact Or.inl (fun x hx => hleft x (hsub hx))
  · exact Or.inr (fun x hx => hright x (hsub hx))

/-- In particular every strict-convex deletion certificate recursively
passes to the smaller original site set without a new exposure premise. -/
theorem s041_strictConvexPosition_erase
    {S : Finset Point} (hconv : strictConvexPosition S)
    (v : Point) : strictConvexPosition (S.erase v) :=
  s041_strictConvexPosition_of_subset (Finset.erase_subset v S) hconv

end ETSHTS
