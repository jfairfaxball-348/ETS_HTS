# S004 dated two-pass novelty/audit log — 2026-10-13 Europe/London

**Critical scope:** Every row below corresponds to a literal search *actually issued* to the web search provider during S004. The provider generally does NOT expose exact query hit totals, so **result count UNKNOWN in every row**. A `site:` query is a search-provider filter, not a native database API. Some returned webpages were opened and are separately registered as SRC. No source was invented or upgraded on a snippet alone. Time within 13 October unspecified; time-of-day exact UNKNOWN.

## Pass A and targeted Pass B queries

| Candidate | Channel | Literal query (verbatim) | Hit count | Inspected source | Observation |
|---|---|---|---|---|---|
| CND-0057/0058 | web search provider | `"abelian cubes" "binary" infinite words avoid arbitrarily long` | UNKNOWN | SRC-0015 | Discovered Rao/Rosenfeld 2015; unbounded-period question not settled by period>=2 result |
| CND-0057/0058 | web search provider | `infinite binary word arbitrarily long abelian cubes avoidance` | UNKNOWN | SRC-0015 | Detected important different quantifier problem; excluded it from CND-0058 |
| CND-0061/0062 | web search provider | `partition 1 2n distinct prime sums pairs matching rainbow` | UNKNOWN | SRC-0019 | Found directly studied distinct-prime matching |
| CND-0062 | web search provider | `rainbow prime sum perfect matching integers 1 to 2n distinct prime sums` | UNKNOWN | SRC-0019 | Found elementary obstruction n=7 via direct Math.SE opening |
| CND-0061/0064 | web search provider | `Bertrand postulate pairing 1 through 2n into primes sums` | UNKNOWN | SRC-0017,SRC-0018 | Matched Greenfield/Bertrand construction and OEIS |
| CND-0063 | web search provider | `noncrossing red blue perfect matching planar points ham sandwich theorem` | UNKNOWN | SRC-0021 | Located 2002 Kano presentation of matching theorem |
| CND-0058 | web search provider | `Mäkelä abelian cubes arbitrarily large binary words problem solved 2025` | UNKNOWN | SRC-0015 | Related distinct stronger problem found; incomplete deep check |
| CND-0062 | web search provider | `"distinct prime sums" pairing integers 1 2n` | UNKNOWN | SRC-0019 | Direct prior exact question located |
| CND-0064 | web search provider | `"noncrossing" "prime" "matching" "consecutive integers"` | UNKNOWN | SRC-0020 | No exact indexed result established, but known intervallic construction located separately |
| CND-0064 | web search provider | `prime-sum noncrossing perfect matching circle 1 2n` | UNKNOWN | SRC-0020 | General noncrossing results, no exact problem statement independently certified |
| CND-0064 | web search provider | `pair 1 to 2n prime sums non crossing chords` | UNKNOWN | SRC-0020 | Prior construction implies property |
| CND-0064 | web search provider | `"prime" "noncrossing" "perfect matching" numbers` | UNKNOWN | NONE | No exhaustive result count available |
| CND-0064 | web search provider | `site:mathoverflow.net "noncrossing" "prime" "pairs"` | UNKNOWN | SRC-0020 | Adjacent matching topic not identical; prior prime-pair matching MO opened separately |
| CND-0062 | web search provider | `site:oeis.org "distinct primes" "pairs" sums 1 to 2n` | UNKNOWN | SRC-0017 | Exact sequence missing in returned snippets; count UNKNOWN |
| CND-0064 | web search provider | `site:oeis.org "prime" "noncrossing" "matching"` | UNKNOWN | SRC-0017 | Related OEIS A000341 covers unrestricted prime-sum pairings, not exact noncrossing count |
| CND-0064 | web search provider | `site:arxiv.org "prime sum" "noncrossing matching"` | UNKNOWN | NONE | Search provider only, native full-text NOT_RUN |
| CND-0064 | web search provider | `site:mathoverflow.net "noncrossing" "prime sums"` | UNKNOWN | SRC-0020 | MO 2016 intervallic pairing recursion inspected from other query |
| CND-0064 | web search provider | `site:math.stackexchange.com "noncrossing" "prime sums"` | UNKNOWN | SRC-0019 | Distinct-prime match question nearby, not noncrossing equivalence |
| CND-0061/0064 | web search provider | `site:erdosproblems.com "prime sum" "pairing"` | UNKNOWN | NONE | Provider search only, native collection not verified |
| CND-0057/0058 | web search provider | `site:openproblemgarden.org "abelian cubes"` | UNKNOWN | NONE | Provider search only, native collection not verified |
| CND-0057/0058 | web search provider | `site:en.wikipedia.org "abelian square" binary` | UNKNOWN | NONE | Provider search only, Wikipedia topic not a primary proof audit |
| CND-0064 | web search provider | `site:zenodo.org prime sum matching noncrossing` | UNKNOWN | NONE | Provider search only; no native Zenodo query/verified total |
| CND-0064 | web search provider | `site:github.com prime sum noncrossing matching` | UNKNOWN | NONE | Provider search only; no code-search native result totals |
| CND-0061/0064 | web search provider | `"Guy" "Unsolved Problems in Number Theory" prime pairing` | UNKNOWN | SRC-0022 | Springer book metadata only; actual pages/paywall inaccessible |
| CND-0063 | web search provider | `"Croft" "Falconer" "Guy" bichromatic matching` | UNKNOWN | NONE | Not a native book-inspection search |
| CND-0063 | web search provider | `"Brass" "Moser" "Pach" noncrossing matching` | UNKNOWN | NONE | Not a native book-inspection search |
| CND-0057/0058 | web search provider | `"Kourovka Notebook" abelian cube` | UNKNOWN | NONE | Not group-theory-relevant; native text NOT_INSPECTED |
| CND-0061/0064 | web search provider | `"American Mathematical Monthly" prime sums matching` | UNKNOWN | NONE | Problem/solution section NOT_INSPECTED |
| CND-0057/0058 | web search provider | `"Mathematics Magazine" abelian cube pattern` | UNKNOWN | NONE | Problem/solution section NOT_INSPECTED |
| CND-0064 | web search provider | `2025 2026 prime sum noncrossing matching` | UNKNOWN | NONE | Recent literature search provider only; no dated exhaustive archive clearance |

## Direct source opens and access levels

- SRC-0014: public full-text reproduction of Entringer/Jackson/Schatz (1974), opening sentence and theorem statement read: STATEMENT_INSPECTED (not independently proof checked).
- SRC-0015: arXiv/abs/1507.02581 abstract opened: ABSTRACT_INSPECTED; abelian cubes of **some** period at least 2; NOT automatically arbitrarily large.
- SRC-0016: arXiv/abs/2207.09937 survey abstract: ABSTRACT_INSPECTED.
- SRC-0017: OEIS A000341 directly opened, prime-sum pairing counts and Greenfield reference: STATEMENT_INSPECTED. Native OEIS term API was not executed; no CAM-produced candidate terms and no assertion of a negative terms search.
- SRC-0018: secondary exposition of Bertrand/Greefield result directly opened with induction: PROOF_INSPECTED *secondary*; 1998 original not opened.
- SRC-0019: Mathematics Stack Exchange #3031150 question and accepted response opened, including n=7 95<105 bound: PROOF_INSPECTED.
- SRC-0020: MathOverflow #244662 opened, including Bertrand suggestion and intervallic-matchings recursion; statement and discussion read, no claim that all published extensions were checked.
- SRC-0021: Mikio Kano lecture transcript directly opened, theorem statement for balanced red-blue matching read; not a full journal proof.
- SRC-0022: Springer publisher page for Richard Guy's textbook inspected only as metadata, no pages checked.

## Bidirectional translations and false equivalences

See MATHEMATICS.md for explicit maps including edge/prime-sum ↔ perfect bipartite matching, distinct primes ↔ rainbow matching, noncrossing chords ↔ Dyck words, binary 1-count ↔ Parikh vector ↔ balanced random-walk displacement, and red-blue assignments ↔ Euclidean min-weight matchings. These translations are preserved **in both directions** including n=1 and adjacency/per-period edge cases. Crucial non-equivalences: OEIS A000341 unrestricted pairings ≠ noncrossing count; an abelian-cube occurrence of period>=2 ≠ arbitrarily long periods; red-blue existence ≠ bounded-length NP-hard variant.

## Coverage gaps explicitly UNKNOWN, never zero hits

Native full-text arXiv query NOT_RUN; mathoverflow and math.SE native all-results search NOT_RUN (specific pages inspected); OEIS exact-term API NOT_RUN (no registered experiment); Erdős Problems/Open Problem Garden native index NOT_RUN; Wikipedia pages were not used as a primary exact audit; Guy/Croft-Falconer-Guy/Brass-Moser-Pach books not full-text inspected; Kourovka Notebook not inspected; AMM and Mathematics Magazine solution archives not inspected; Zenodo and GitHub native code search not performed; 2025–2026 archival full-text sweep not completed. Scoping queries issued above where applicable, but the search provider does not prove native coverage. **No candidate SURVIVING or DEEP_SEARCH_NO_HIT**; every retained older candidate remains killed and every S004 question is killed by independent decisive mathematics/located prior art. Zero surviving is deliberate, not an audit failure to be disguised.
