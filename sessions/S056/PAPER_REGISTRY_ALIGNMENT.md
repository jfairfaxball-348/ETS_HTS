# S056 PAPER / PALOMAR ALIGNMENT — DRAFT, OWNER HAS NOT APPROVED

The eventual paper is not yet written, and its title is not final. Original theorem is frozen by S020/S021 and S053/S054; no new mathematics is offered.

## Four possible paper titles

1. **Preferred: Noncrossing Two-Nearest-Predecessor Orders on Nearly Circular Ellipses.** Specifies chronology, two compulsory closest *earlier* vertices, planarity and restricted ellipse ratios without overstating priority.
2. A Uniform Noncrossing Insertion Theorem for Ellipse-Boundary Point Sets.
3. Metric-Ear Certificates and Planar Two-Nearest-Predecessor Geometry.
4. A Sufficient Ellipse Aspect-Ratio Criterion for Noncrossing Nearest-Two Insertion.

The SAME approved title should occupy the future paper heading, current README front matter, formalization.yaml project.name and therefore Palomar public heading/BibTeX. "We prove..." belongs at the abstract start, NOT as part of a scholarly paper title.

## Candidate exact project.description / paper abstract (plain-text; quote for future use)

We prove that every finite set of at least three distinct points on an ellipse with semiaxes a >= b > 0 and a/b <= sqrt(2/sin(2 pi/5) - 1) admits a noncrossing insertion order under a compulsory Euclidean two-nearest-predecessor rule. The first three sites form a triangle. Each subsequent site is joined to exactly its two nearest earlier sites, with Cartesian-lexicographic resolution of distance ties, and all existing edges are retained. The sufficient aspect-ratio condition includes its endpoint, applies to arbitrarily many and arbitrarily close distinct sites, and includes the explicit noncircular case a/b = 101/100. We also prove a recursive metric-ear certificate characterisation for finite strictly convex position sets, the full three/four-point base cases and strict ellipse chord estimates. All five corresponding exact propositions have Lean proofs. Neither optimality of the threshold nor historical priority is claimed.

The source field project.description supports multiline plain text; direct empirical math-TeX rendering in the public abstract was NOT observed. Do NOT rely on rich LaTeX in that field.

## Paper-facing prominent theorem/formula (not promised to render in Palomar abstract)

Define E(a,b) = {(a cos t, b sin t) : t ∈ real numbers}, and

    R = sqrt( 2 / sin(2π/5) - 1 ) ≈ 1.0502020988726573.

**Theorem (uniform closed ellipse criterion).** For every 0 < b <= a with a/b <= R, and every finite set S of at least three distinct points of E(a,b), there exists an ordering of S with an initial complete triangle and, at every later insertion, exactly two edges to the Euclidean-nearest *earlier* two points (equal-distance ties settled by predecessor Cartesian lexicographic order), such that previously added edges are retained and no two final edges properly cross.

    ∀ a,b (0<b≤a ∧ a/b≤R) ⇒
      ∀ S⊆E(a,b) (finite, |S|≥3) ⇒
      ∃ ordering σ: retained two-nearest-predecessor graph is noncrossing.

The endpoint ratio a/b=R is INCLUDED; no n upper bound or minimum spacing; no assertion R is sharp. Exact nonround all-n corollary: semiaxes (101/100, 1).

## Proposed mock public record (NOT actual rendered page)

TITLE → formalization.yaml project.name → preferred title above.
ABSTRACT → project.description → exact candidate paragraph above ("We prove that...").
AUTHORS/MAINTAINERS → project.authors / project.responsible_maintainers → owner to approve names and roles.
CLASSIFICATIONS → classification.arxiv / msc2020 → to verify before recording, perhaps math.CO or computational geometry if justified.
MATH CLAIM IN PROSE → Challenge module documentation/README/paper theorem block above.
FORMAL COMPARED NAMES + TYPES → comparator.json and permitted-import concise Challenge → not written. Existing old original clm... theorem names are NOT proof that future challenge can use same names/definitions.
IMMUTABLE SOURCE/PROOF → future committed supported toolchain, repository SHA, machine report and standard-only axiom audit → not yet present.
REVIEW → future AI report only after real submission → NONE.
CITATION → only use later actually registered Palomar ID and explicit version vN; NO invented identifier.

## Three-way exact crosswalk: paper ↔ planned Palomar ↔ existing Lean

| Claim in paper | Metadata/Challenge and Comparator role | Exact frozen Lean proof | Verdict |
|---|---|---|---|
| Closed R, all finite ellipse sets, obligatory two Euclidean nearest predecessor edges, Cartesian-lex ties, retain all edges, plane | Lead abstract + headline Challenge/Comparator type | CLM0107; clm0107_exact in CyclicCompetitorExact.lean | MATCH in draft; Challenge MISSING |
| Concrete noncircular a/b=101/100 for all finite cardinalities | Corollary and separately selected Challenge declaration if five-target entry | CLM0108; clm0108_exact in ExactNonround.lean | MATCH in draft; Challenge MISSING |
| For arbitrary strictly convex finite S, plane-nearest-two order iff full metric-ear recursive certificate | Supporting structural theorem, selected Challenge declaration | CLM0099; clm0099_exact in GenuineOuterplanarCap.lean | MATCH if both directions and broad scope preserved |
| All three/four-point no-three-collinear S, including nonconvex 4-site cases | Small-case supporting declaration | CLM0096; clm0096_exact in ConvexFourClassification.lean | MATCH, not ellipse-restricted |
| Both outward endpoint derivatives, strict directed short-arc chord extension with original lambda | Analytic supporting declaration | CLM0102; clm0102_exact in Cutoff.lean | MATCH, needs both halves and short arcs |
| Claim constant optimal, novel, full range of all ellipses | None allowed | NOT a proved target | EXCLUDED |

A single Comparator config selecting ALL FIVE means one entry checks all five; a config checking only CLM0107 cannot honestly list the other four as independently compared, even when proof imports use them. The correct packaging decision awaits owner input and actual compliant independent Challenge construction. No paper or submission created in S056.