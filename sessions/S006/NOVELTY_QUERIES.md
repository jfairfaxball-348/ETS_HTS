# S006 literal dated search record — 2026-10-13 (Europe/London)
The two provisional questions were resolved by self-contained proof/counterexample. Deep negative-prior-art clearance is NOT achieved or claimed. This log distinguishes actually submitted provider queries and native endpoints. Provider total hit counts were not supplied and thus are UNKNOWN, not zero. Two passes: original formulations, then XOR/graph-degree/fan translations.

## Pass 1 — actual general search-provider queries; total hits UNKNOWN
- `necklace splitting no adjacent equal beads q-1 cuts fair each color twice probability method`
- `simple polygon unique triangulation all diagonals fan reflex chain minimum possible maximum triangle incidence vertex`
- `site:oeis.org necklace adjacency no two consecutive beads identical split`
- `site:arxiv.org triangulations polygons bounded vertex degree incident triangles`
- `site:mathoverflow.net splitting necklace q-1 cuts no adjacent same beads`
- `site:math.stackexchange.com unique triangulation simple polygon fan concave chain`
- `site:erdosproblems.com necklace splitting triangulation simple polygon`
- `site:openproblemgarden.org necklace splitting polygon triangulation degree`

## Pass 2 — exact variations, books and 2025–2026; total hits UNKNOWN
- `site:arxiv.org/abs 2025 2026 necklace splitting adjacent equal beads two occurrences`
- `site:arxiv.org/abs 2025 2026 triangulations simple polygons maximum degree fan`
- `site:mathoverflow.net/questions necklace "no adjacent" splitting`
- `site:math.stackexchange.com/questions "uniquely triangulable" polygon`
- `site:oeis.org/A328150 necklace adjacent equal`
- `site:zenodo.org/records necklace fair cutting adjacent colors`
- `site:github.com polygon unique triangulation concave chain`
- `Brass Moser Pach research problems computational geometry bounded degree polygon triangulation`
- `Croft Falconer Guy Unsolved problems geometry polygon triangulation unique`
- `Kourovka notebook triangulation polygon problem`
- `American Mathematical Monthly Mathematics Magazine problems necklace splitting adjacent colors triangulation`

## Actual native direct URL attempts, success and limitations
- OEIS term search https://oeis.org/search?q=necklace+adjacent+different&language=english&go=Search: inaccessible, result count UNKNOWN.
- OEIS keyword search https://oeis.org/search?q=triangulations+simple+polygons&language=english&go=Search: inaccessible, count UNKNOWN. Direct entry https://oeis.org/A328150 **opened** (SRC-0034), adjacency structures, no cut bound.
- arXiv native full-text/search https://arxiv.org/search/?query=necklace+splitting+adjacent+beads&searchtype=all and https://arxiv.org/search/?query=unique+triangulation+simple+polygon&searchtype=all returned DisabledError: UNKNOWN results. Direct arXiv abstract https://arxiv.org/abs/2510.00162 opened (SRC-0042).
- MO https://mathoverflow.net/search?q=necklace+splitting+adjacent: inaccessible; UNKNOWN.
- Math.SE https://math.stackexchange.com/search?q=polygon+unique+triangulation: inaccessible; UNKNOWN.
- Erdős Problems https://www.erdosproblems.com/search?q=necklace: inaccessible; UNKNOWN.
- Open Problem Garden https://www.openproblemgarden.org/search/node/triangulation: inaccessible; UNKNOWN.
- Zenodo https://zenodo.org/search?q=polygon%20unique%20triangulation: inaccessible; UNKNOWN.
- GitHub native code search https://github.com/search?q=necklace+splitting+adjacent&type=code: DisabledError; UNKNOWN.
- Wikipedia https://en.wikipedia.org/wiki/Fan_triangulation: opened, secondary general fan details, NOT exact witness (SRC-0037).
- Croft–Falconer–Guy https://link.springer.com/book/10.1007/978-1-4612-0963-8: catalogue/contents opened; book full text not inspected (SRC-0041).
- Brass–Moser–Pach https://link.springer.com/book/10.1007/0-387-29929-7: catalogue opened; full book not inspected (SRC-0040).
- 2025/2026: arXiv 2510.00162 abstract opened; https://discreteanalysisjournal.com/article/165102-possible-sizes-of-sumsets opened 2026 editorial exact 2n−1 bound (SRC-0039). Not comprehensive.
- Original Alon https://www.sciencedirect.com/science/article/pii/0001870887900557: search-provider abstract surfaced, direct fetch returned 403; SRC-0036 METADATA_ONLY.
- Guy other volumes, Kourovka original, AMM and Mathematics Magazine problem sections, Wikipedia unsolved list in full: **NOT_RUN/UNKNOWN** native deep coverage; search-provider terms attempted for a subset.

## Mathematically exact two-way formulations
- CND-0068 ↔ independent complementary owner orientation for each doubled colour ↔ signed XOR equality constraints on adjacent distinct colours; fair split reconstructs X from first occurrences, then changes encode cuts; conversely X reconstructs a fair split.
- CND-0080 ↔ triangle load t at each polygon vertex equals triangulation graph degree d−1 ↔ strictly concave lower chain prohibiting all lower-lower diagonals and forcing an apex fan. Converse fan supplies actual noncrossing diagonals. Complete reasoning in MATHEMATICS.md.

No-hit is never proof of novelty. All candidate outcomes are kills; no claim of a new open/hard question, precise literature priority, or deep negative coverage.
