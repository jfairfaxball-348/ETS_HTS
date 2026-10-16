module
public import ETSHTS.CyclicCompetitorExact
public import ETSHTS.RationalBound

@[expose] public section


/-!
# S050 — exact specific noncircular ellipse, CLM0108

The frozen all-cardinality ellipse theorem CLM0107, proved in S049,
and the original exact rational aspect estimate are sufficient.
There is no additional geometric hypothesis or replacement graph.
-/

noncomputable section
namespace ETSHTS

/-- Literal original CLM0108 at axes 101/100 and 1:
strictly nonround, all finite cardinalities ≥3, compulsory ranked
two-nearest insertion, retained edges and original noncrossing predicate. -/
theorem clm0108_exact : CLM0108 :=
  clm0108_of_clm0107 clm0107_exact

end ETSHTS
