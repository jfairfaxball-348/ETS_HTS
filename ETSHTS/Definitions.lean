import Mathlib

/-!
# Formal definitions for ETS_HTS S025

This module defines *statements*, not the claimed all-cardinality proof.
It keeps the exact compulsory two-nearest PREDECESSOR rule, Cartesian
lexicographic ties, retained edges, proper crossings, and a finite ear
deletion certificate. No geometric or numerical theorem is assumed.
-/

noncomputable section
namespace ETSHTS

abbrev Point := ℝ × ℝ
abbrev Edge := Finset Point

def ellipsePoint (a b θ : ℝ) : Point :=
  (a * Real.cos θ, b * Real.sin θ)

def ellipseBoundary (a b : ℝ) (p : Point) : Prop :=
  ∃ θ : ℝ, p = ellipsePoint a b θ

def sqDist (p q : Point) : ℝ :=
  (p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2

/-- Strict Cartesian coordinate order, used ONLY to break equal squared distances. -/
def cartLexLT (p q : Point) : Prop :=
  p.1 < q.1 ∨ (p.1 = q.1 ∧ p.2 < q.2)

/-- Strict ordering of predecessors by (distance squared, Cartesian coordinates). -/
def priority (v p q : Point) : Prop :=
  sqDist v p < sqDist v q ∨
  (sqDist v p = sqDist v q ∧ cartLexLT p q)

/-- The unordered pair (u,w) consists of EXACTLY the two least ranked predecessors. -/
def exactlyTwoNearest (previous : Finset Point) (v u w : Point) : Prop :=
  u ∈ previous ∧ w ∈ previous ∧ u ≠ w ∧
  ∀ x ∈ previous, x ≠ u → x ≠ w →
    priority v u x ∧ priority v w x

def edge (p q : Point) : Edge := {p, q}

def triangleEdges (p q r : Point) : Finset Edge :=
  {edge p q, edge q r, edge r p}

/-- Strict interior of a closed straight line segment, parameterised affinely. -/
def openSegment (p q x : Point) : Prop :=
  ∃ t : ℝ, 0 < t ∧ t < 1 ∧
    x = ((1 - t) * p.1 + t * q.1, (1 - t) * p.2 + t * q.2)

def properCross (p q r s : Point) : Prop :=
  ∃ x : Point, openSegment p q x ∧ openSegment r s x

/-- No proper crossing between independent edges. Ellipse sites have no three collinear. -/
def planeEdges (G : Finset Edge) : Prop :=
  ∀ e₁ ∈ G, ∀ e₂ ∈ G, Disjoint e₁ e₂ →
    ∀ p q r s : Point, e₁ = edge p q → e₂ = edge r s →
      ¬ properCross p q r s

/-- Every later point adds its EXACT two mandatory edges; old edges persist. -/
inductive Grow : List Point → Finset Edge → List Point → Finset Edge → Prop where
  | finish (previous : List Point) (G : Finset Edge) :
      Grow previous G [] G
  | insert (previous : List Point) (G : Finset Edge)
      (v u w : Point) (rest : List Point) (final : Finset Edge)
      (hnear : exactlyTwoNearest previous.toFinset v u w)
      (hrest : Grow (previous ++ [v]) (G ∪ {edge v u, edge v w}) rest final) :
      Grow previous G (v :: rest) final

/-- Existence of an initial triangle followed by the compulsory retained rule. -/
def planeNearestTwoOrder (S : Finset Point) : Prop :=
  ∃ p q r : Point, ∃ rest : List Point, ∃ final : Finset Edge,
    p ≠ q ∧ p ≠ r ∧ q ≠ r ∧
    ([p, q, r] ++ rest).Nodup ∧
    ([p, q, r] ++ rest).toFinset = S ∧
    Grow [p, q, r] (triangleEdges p q r) rest final ∧
    planeEdges final

def orientation (p q r : Point) : ℝ :=
  (q.1 - p.1) * (r.2 - p.2) -
  (q.2 - p.2) * (r.1 - p.1)

def noThreeCollinear (S : Finset Point) : Prop :=
  ∀ p ∈ S, ∀ q ∈ S, ∀ r ∈ S,
    p ≠ q → p ≠ r → q ≠ r → orientation p q r ≠ 0

/-- Each site is uniquely exposed by some linear functional. -/
def strictConvexPosition (S : Finset Point) : Prop :=
  ∀ v ∈ S, ∃ nx ny : ℝ,
    ∀ w ∈ S, w ≠ v →
      nx * w.1 + ny * w.2 < nx * v.1 + ny * v.2

/-- Convex hull supporting side (the strict-convex setting singles out actual sides). -/
def hullSide (S : Finset Point) (p q : Point) : Prop :=
  p ∈ S ∧ q ∈ S ∧ p ≠ q ∧
    ((∀ x ∈ S, 0 ≤ orientation p q x) ∨
     (∀ x ∈ S, orientation p q x ≤ 0))

def cyclicNeighbours (S : Finset Point) (v u w : Point) : Prop :=
  u ≠ w ∧ hullSide S v u ∧ hullSide S v w ∧
  ∀ x ∈ S, hullSide S v x → x = u ∨ x = w

/-- The two hull neighbours are precisely the two compulsory closest others. -/
def metricEar (S : Finset Point) (v : Point) : Prop :=
  v ∈ S ∧ ∃ u w : Point,
    cyclicNeighbours S v u w ∧ exactlyTwoNearest (S.erase v) v u w

/-- A FULL recursively valid ear certificate, not just one convenient ear. -/
inductive FullEarCertificate : Finset Point → Prop where
  | base (S : Finset Point) (hcard : S.card = 3) : FullEarCertificate S
  | remove (S : Finset Point) (v : Point)
      (hcard : 4 ≤ S.card) (hv : v ∈ S)
      (hear : metricEar S v)
      (hrec : FullEarCertificate (S.erase v)) : FullEarCertificate S

def lambda (a b : ℝ) : ℝ := 4 * Real.arctan (b / a)

/-- The CLOSED sufficient threshold, no assertion of optimality. -/
def R : ℝ := Real.sqrt (2 / Real.sin (2 * Real.pi / 5) - 1)

end ETSHTS
