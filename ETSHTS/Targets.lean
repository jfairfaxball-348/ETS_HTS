module
public import ETSHTS.Foundation

@[expose] public section


/-!
# Fixed full theorem obligations: CLM-0096 / 0099 / 0102 / 0107 / 0108

Each `def CLM...` is an UNPROVED proposition, *not* a theorem.
No `axiom`, `sorry`, or weakening to circles, generic angles or bounded n is used.
Future sessions must replace unproved proposition status with genuine proofs.
-/

noncomputable section
namespace ETSHTS

/-- CLM-0096: all non-collinear triples or quadruples. -/
def CLM0096 : Prop :=
  ∀ S : Finset Point, 3 ≤ S.card → S.card ≤ 4 →
    noThreeCollinear S → planeNearestTwoOrder S

/-- CLM-0099: exact plane order iff a FULL valid metric-ear certificate. -/
def CLM0099 : Prop :=
  ∀ S : Finset Point, 3 ≤ S.card →
    strictConvexPosition S →
    (planeNearestTwoOrder S ↔ FullEarCertificate S)

/--
CLM-0102: BOTH endpoint derivative signs and strict outward extension
for ANY unwrapped short arc, with NO arbitrary separation bound.
-/
def CLM0102 : Prop :=
  (∀ (a b θ φ : ℝ), 0 < b → b ≤ a →
    θ < φ → φ - θ < lambda a b →
      0 < deriv (fun t => sqDist (ellipsePoint a b θ) (ellipsePoint a b t)) φ ∧
      0 < -deriv (fun t => sqDist (ellipsePoint a b t) (ellipsePoint a b φ)) θ) ∧
  (∀ (a b θ₀ θ₁ φ₀ φ₁ : ℝ), 0 < b → b ≤ a →
    θ₀ ≤ θ₁ → θ₁ < φ₀ → φ₀ ≤ φ₁ →
    (θ₀ < θ₁ ∨ φ₀ < φ₁) →
    φ₁ - θ₀ < lambda a b →
    sqDist (ellipsePoint a b θ₁) (ellipsePoint a b φ₀) <
      sqDist (ellipsePoint a b θ₀) (ellipsePoint a b φ₁))

/--
CLM-0107: EVERY finite n≥3 set of DISTINCT boundary points of any
ellipse with a≥b>0 and a/b≤R, including a/b=R, arbitrary closeness,
the compulsory two least predecessors, Cartesian lex ties, and no crossings.
-/
def CLM0107 : Prop :=
  ∀ (a b : ℝ), 0 < b → b ≤ a → a / b ≤ R →
    ∀ S : Finset Point, 3 ≤ S.card →
      (∀ p ∈ S, ellipseBoundary a b p) →
      planeNearestTwoOrder S

/-- CLM-0108: a concrete NONROUND ellipse supports ALL cardinalities. -/
def CLM0108 : Prop :=
  (1 : ℝ) < (101 : ℝ) / 100 ∧
    ∀ S : Finset Point, 3 ≤ S.card →
      (∀ p ∈ S, ellipseBoundary ((101 : ℝ) / 100) 1 p) →
      planeNearestTwoOrder S

end ETSHTS
