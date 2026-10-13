# S007 novelty queries and translation audit — 2026-10-13 Europe/London

Web-index exploratory searches below record *submitted phrases*, not certified native-database completeness. General web provider gave no trustworthy total hit counts; each `UNKNOWN` means missing count, NEVER zero hits. Search snippet != source inspection. A separate graded `SRC` is present only for pages actually opened/inspected. No claim of absent prior art, of original priority, or of exhaustive 2025–2026 coverage.

| Lane | Scoped endpoint | Literal query | Alternate formulation | Total hits |
|---|---|---|---|---|
| T | general web index | `clock synchronization graph cycle consistent time offsets gain graphs group labeled graph balancing NP hard` | broad | UNKNOWN |
| P | general web index | `normed plane Minkowski circle circumference ratio taxicab geometry 8` | broad | UNKNOWN |
| B | general web index | `coupled oscillators graph synchronization frustration cycle Kuramoto existence computational complexity` | broad | UNKNOWN |
| Z | general web index | `meadows division zero totalized fields 0 inverse 0 Bergstra Tucker` | broad | UNKNOWN |
| C | general web index | `double sequences iterated limits row sums interchange Moore Osgood counterexample` | broad | UNKNOWN |
| I | general web index | `König infinity lemma finitely branching tree finite paths arbitrary length infinite path` | broad | UNKNOWN |
| B | general web index | `EEG neural oscillations phase synchrony network mathematical models review` | motivation | UNKNOWN |
| T | general web index | `balanced gain graph edge labels potential consistency cycle sums graph synchronization switching equivalence` | alternate gain graphs | UNKNOWN |
| T | general web index | `MAX-2-LIN modulo 2 signed graph minimum frustration index NP hard max cut` | alternate CSP | UNKNOWN |
| P | general web index | `Minkowski normed plane perimeter circumference Gołąb theorem 6 8` | alternate norm geometry | UNKNOWN |
| C | general web index | `iterated limits double sequences row limit column limit 0 1 example` | alternate analysis | UNKNOWN |
| T+B | general web index | `grid cycle area divisible by 3 edges deletion` | exact geometric framing | UNKNOWN |
| T+B | general web index | `grid graph remove minimum edges every cycle encloses multiple of three faces` | exact grid | UNKNOWN |
| T+B | general web index | `gain graph grid all faces same voltage frustration edges deletion` | gain graph | UNKNOWN |
| T+B | general web index | `plaquette flux square lattice edge deletion minimum number gauge frustration` | plaquette | UNKNOWN |
| T+B | general web index | `triomino tiling square missing corner side 3k+1 3k+2` | dual tiling | UNKNOWN |
| I | general web index constrained by site: | `site:erdosproblems.com sequence circle` | web site index only | UNKNOWN |
| I | general web index constrained by site: | `site:openproblemgarden.org oscillator synchronization` | web site index only | UNKNOWN |
| T+B | general web index constrained by site: | `site:oeis.org triomino square removed` | OEIS web index not native | UNKNOWN |
| T | general web index constrained by site: | `site:oeis.org clock graph cycles` | OEIS web index not native | UNKNOWN |
| T+B | general web index constrained by site: | `site:arxiv.org gain graph square lattice frustration` | arXiv metadata web index not full text | UNKNOWN |
| P | general web index constrained by site: | `site:mathoverflow.net normed plane perimeter circle` | MO web index | UNKNOWN |
| C | general web index constrained by site: | `site:math.stackexchange.com double sequence iterated limits different` | MSE web index | UNKNOWN |
| Z | general web index constrained by site: | `site:zenodo.org meadow division by zero` | Zenodo web index | UNKNOWN |
| T | general web index constrained by site: | `site:github.com min 2 lin gain graph` | GitHub web index | UNKNOWN |

## Two-pass novelty and equivalence caveat

Pass A tested characteristic wording and elementary boundary conditions before any hard or novel promotion. Every CND-0085..0101 was eliminated by self-contained proof, counterexample, exact renaming or known literature. `KNOWN_EXACT` status was used only where an inspected statement supports the classical theorem, and no negative claim rests on a search snippet.

Pass B (targeting the most mathematically interesting *solved* CND-0101) translated the clock comparison problem both ways into a graph potential/cycle-sum problem: potential ⇒ sums telescope; cycle sums zero ⇒ tree integration yields a potential. On the embedded planar grid, the cycle-sum condition is equivalent to zero flux around each retained bounded face; every face flux equals enclosed original cell count modulo 3. Conversely those face conditions imply all cycle sums zero because faces span the cycle space. A connected tromino tiling gives a **sufficient construction**, not a claim that every optimal deletion set must arise from trominoes. Exact/alternate terms above were probed; source totals UNKNOWN and original-priority checks incomplete. CND-0098 and CND-0086 map *bidirectionally* via x_clock↔x_phase on the same graph and constraints, preserving solutions componentwise.

## Native source access status and limits

- OEIS native numeric-term + keyword searches: **NOT_RUN**, web-index site probes only (UNKNOWN totals).
- arXiv **full-text** search: **NOT_RUN**, metadata/site-index query only (UNKNOWN totals).
- MathOverflow / Mathematics Stack Exchange: site-index queries (UNKNOWN totals); MSE mathematical example page SRC-0050 directly inspected; no comprehensive native archive search.
- Erdős Problems, Open Problem Garden: site-index probes only, totals UNKNOWN; native database search not completed.
- Wikipedia unsolved-problem lists: **NOT_RUN** (no novelty-negative inference).
- Guy, *Unsolved Problems in Number Theory*; Croft–Falconer–Guy, *Unsolved Problems in Geometry*; Brass–Moser–Pach, *Research Problems in Discrete Geometry*; Kourovka: full-text problem checks **NOT_RUN**. S006 metadata inspections do not count as S007 deep audits.
- American Mathematical Monthly / Mathematics Magazine problem sections: **NOT_RUN**.
- 2025–2026 peer-reviewed/preprints: only selected signed-graph and oscillator literature SRC-0047/SRC-0054 surfaced, not systematic coverage.
- Zenodo and GitHub repositories: site-index probes only; native searches **NOT_RUN**.

No candidate was elevated to TRIAGED/SURVIVING, so the missing full deep protocol is expressly recorded as an *unsatisfied* gate rather than a successful novelty test. All exact bibliography and access grades reside in catalogue/SOURCES.json; no paper was quoted or inferred from snippets.
