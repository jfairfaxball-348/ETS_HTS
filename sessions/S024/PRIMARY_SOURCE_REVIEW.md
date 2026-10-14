# S024 — final primary-source closest-work map and hostile subsumption test

## Formal target (CLM0099, CLM0102, CLM0107, CLM0108)
For any finite n≥3 distinct points S of an ellipse with 1≤a/b≤R=sqrt(2/sin(2π/5)−1), there EXISTS an order: start with three joined as triangle; each later site joins its two globally Euclidean-nearest PREDECESSORS (lex Cartesian tie rule), retain all old edges, and obtain NO proper crossings. The interval is uniform in n and in point separation. The model equals existence of a COMPLETE metric-hull-ear deletion certificate on strictly convex sets (CLM0099); short directed ellipse chord extension is CLM0102; nonround 101/100 follows (CLM0108).

### 2011 Ábrego et al — AUTHOR-MANUSCRIPT PROOF INSPECTED (SRC0086)
The paper's k-NNG(P) uses all n sites simultaneously to define every site's k closest NEIGHBOURS. Theorems 2.2.1 and §§3.2.1–3.2.5 quantify minima of crossings over CHOSEN point sets Q of size n; Proposition 3.2.2 proves cr(2-NNG(n))=0 by selecting slightly perturbed regular n-gons. An existential *configuration* with planar static 2-NNG is logically weaker and different from ∀ configurations S on ALL near-round ellipses ∃ suitable arrival order. Conversely our older-neighbour graph may include edges absent from static 2-NNG, since later nearer sites displace predecessor ranks. Neither direction is a valid subsumption; no hidden proof of uniform positive ellipse perturbation found in inspected relevant sections. Its convex-position 1-Delaunay crossing results are also separate. The 2011 published journal text was not individually compared with the author manuscript. Source: https://www.csun.edu/~ba70714/publications/Cros_prox_graphs_CGTA_sub.pdf, §1 pp1–3, §2.2 pp4–5, §3.2 pp15–16.

### 2004 Bose–Gudmundsson–Morin (SRC0085, ABSTRACT_INSPECTED)
Ordered θ-graph edges choose per angular cone and a θ-projection rule, optimised order targets spanning ratio, maximum degree and diameter, not compulsory globally closest TWO earlier sites nor 2n−3 edge maximal outerplanarity. A cone-selected predecessor need not be one of globally closest two; globally closest predecessors need not fill one chosen cone each. Thus translating the selection rule is not valid both directions. Full PDF proof unavailable, so no proof-level claim about every hidden lemma; source https://doi.org/10.1016/j.comgeo.2004.01.003; abstract and indexed original preprint https://citeseerx.ist.psu.edu/document?doi=2f68dd9b6327234f97541848c021703bb852513a&repid=rep1&type=pdf .

### 1992 Finlayson–Bhattacharya (original proceedings first-page text indexed)
Greedy triangulation chooses MINIMUM-length chord among NONCROSSING-compatible candidates, may REJECT a crossed chord, processes edges globally on fixed convex polygon. Our process selects two mandatory incoming edges from nearest predecessors regardless of crossed old edges; one cannot simply skip a crossing. Neither method produces the other's arrival-order certificate without a new theorem. Full proceedings body not directly read; source https://w.opendatastructures.org/proceedings/1992/Paper57.pdf .

### Earlier full proof Levcopoulos–Lingas 1987 (SRC0084)
Full original scan audited at S023. Its shortest compatible diagonal and semicircular-property lemmas are technique precedents; q-open polygon parameter is NOT ellipse ratio/eccentricity. No direct stronger implication identified in printed proofs pp175–193.

## Three precise translations, with nonconverses
1. Maximal outerplanar graph/metric-ear: E=2n−3 + strict convex position forces hull edges, then last degree two gives metric hull ear; reverse FULL recursively deleting metric ears proves existence, not every ordinary geometric ear works. Ordinary ear ↛ metric ear (exact 5-site convex counterexample retained).
2. Ellipse ↔ anisotropically weighted Euclidean metric on circle via A=diag(a,b): crossing and cyclic order invariant, but closest-pair rank changes if one incorrectly reverts to circular Euclidean metric. Eccentricity e=sqrt(1−r^(−2)) bound is e≤sqrt(1−R^(−2)); e for 101/100 is sqrt(201)/101. No earlier inspected threshold in e or r establishes all-n theorem.
3. Static proximity/edge-greedy/θ-spanner ↛ dynamic nearest-two retained triangulation: membership tests, edge counts, quantifiers and ability to reject crossing differ. Opposite implication also fails generally; no bijective identification of constructions supplied.

## Independently scoped originality
- CLM0099: internally proved; may be elementary or folklore. No standalone originality assertion.
- CLM0102: analytic chord derivative elementary; technique originality UNKNOWN.
- CLM0107: substantial all-n uniform non-round sufficient interval; strongest plausible theorem contribution; NO exact/stronger inspected prior statement located, but historical first-discovery UNPROVED.
- Constant R: sufficient bound, not optimal or novel numerical constant certified; no claim of sharpness.
- CLM0108: logical consequence, not a second priority claim.
- No new proof stress test, computation, refinement, CAM/CND/CLM or publication in this session.

## Why conditional advance is warranted
The main S023 mathematical proof remains internally hostile-audited. Crucially, the largest unresolved original 2011 paper has now been examined at relevant original author-manuscript proof pages and is logically distinct, while the inspected statements/models of 1987, 1992 and 2004 do not show subsumption. Thus support is **CONDITIONAL**, not categorical novelty certification; inaccessible papers/indexes remain plainly recorded. The owner specifically ends audit repetition and authorises a formalisation handoff IF this bounded scrutiny survives, not a declaration of historical priority. Formalisation can expose proof flaws, and publication still needs fresh priority checks and owner approval later.
