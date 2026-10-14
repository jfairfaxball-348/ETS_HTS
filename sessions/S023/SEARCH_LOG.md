# S023 — literal supplementary searches, original access and native failures

Date 2026-10-14 Europe/London, BST UTC+01. Individual query timestamps and whole-corpus counts unavailable; ALL counts UNKNOWN rather than zero. Search strings here are literal queries actually sent in S023. S022 W001–W073 retained unmodified. A public web-index site: query is NOT genuine native collection search. Search-result snippets are NOT source inspection.

## Public index search follow-up
| ID | Literal query | Endpoint | Hit count / evidence |
|---|---|---|---|
| W074 | Ábrego Fabila Monroy Fernandez Merchant Flores Peñaloza Hurtado Sacristán Saumell 2011 crossing numbers geometric proximity graphs pdf full | public fast index | UNKNOWN; publisher abstract/author listing |
| W075 | Bose Gudmundsson Morin ordered theta graphs 2004 pdf 2003 | public fast index | UNKNOWN; indexed old preprint |
| W076 | Finlayson Bhattacharya practical algorithm greedy triangulation convex polygon CCCG 1992 pdf | public fast index | UNKNOWN; proceedings indexed |
| W077 | Levcopoulos Lingas 1987 approximation behavior greedy triangulation convex polygons semicircular property pdf | public fast index | UNKNOWN; ORIGINAL full scan opened |
| W078 | ellipse nearly circular points nearest two predecessors planar insertion order convex polygon metric ear greedy triangulation | public fast index | UNKNOWN; related geometries |
| W079 | filetype:pdf "On crossing numbers of geometric proximity graphs" Abrego full text 2011 | public fast index | UNKNOWN; no full 2011 proof opened |
| W080 | site:dccg.upc.edu "On Crossing Numbers" proximity pdf | public fast index | UNKNOWN; author preliminary publication |
| W081 | site:upcommons.upc.edu "On crossing numbers of geometric proximity graphs" pdf | public fast index | UNKNOWN; source gap |
| W082 | "On crossing numbers of geometric proximity graphs" pdf 2010 author | public fast index | UNKNOWN; source gap |
| W083 | site:patmorin.me "Ordered theta graphs" "pdf" | public fast index | UNKNOWN; author publication list found |
| W084 | "A Practical Algorithm for the Greedy Triangulation of a Convex Polygon" pdf copy | public fast index | UNKNOWN; proceedings indexed |
| W085 | site:patmorin.me "Ordered theta graphs" "pdf" | public fast index repeated | UNKNOWN |
| W086 | site:cg.scs.carleton.ca "Ordered theta graphs" pdf | public fast index | UNKNOWN |
| W087 | site:people.scs.carleton.ca "~morin" "ordered" theta pdf | public fast index | UNKNOWN |
| W088 | "Bose" "Gudmundsson" "Morin" "Ordered theta graphs" "Theorem 1" 2004 pdf | public fast index | UNKNOWN |
| W089 | "non-crossing" "nearest" "ear" "convex polygon" triangulation | public slow index | UNKNOWN |
| W090 | "nearest two" "previous" "planar" points insertion graph | public slow index | UNKNOWN |
| W091 | "ellipse" "greedy triangulation" "semi-circular" "closest" points | public slow index | UNKNOWN |
| W092 | "ellipse" "ordered nearest neighbor" planarity | public slow index | UNKNOWN |
| W093 | site:arxiv.org/html/2025 "nearest predecessor" "triangulation" planar | public fast index, arXiv site scoped | UNKNOWN; NOT arXiv native |
| W094 | site:arxiv.org/html/2026 "nearest" "noncrossing" "ellipse" | public fast index, arXiv site scoped | UNKNOWN; NOT arXiv native |
| W095 | site:cccg.ca "two nearest" "triangulation" | public fast index, CCCG site scoped | UNKNOWN; NOT all proceedings |
| W096 | site:drops.dagstuhl.de "nearest neighbor" insertion planar triangulation | public fast index, Dagstuhl site scoped | UNKNOWN; original 2026 ICALP source inspected |
| W097 | site:oeis.org "greedy triangulation" polygon | public fast index, OEIS site scoped | UNKNOWN; NOT native OEIS |
| W098 | "ordered 2-nearest neighbour graph" planar | public fast index | UNKNOWN |

## Direct original full-text access
- **1987 Levcopoulos–Lingas:** original university-hosted complete scanned journal article PDF successfully rendered; ten screenshot image-spreads viewed, printed pp175–193. SRC0084 upgrade to PROOF_INSPECTED. Details sessions/S023/CLOSEST_WORKS.md.
- **1992 Finlayson–Bhattacharya:** proceedings https://w.opendatastructures.org/proceedings/1992/Paper57.pdf indexed with opening description of global shortest compatible chord; direct full PDF open returned 502. **FULL PROOF UNKNOWN**.
- **2004 Bose–Gudmundsson–Morin:** original journal DOI and preprint indexed; CiteSeerX DOI identifier ac1160762c871e8801c4b417c8ac8b7e55b0d72d direct PDF returned 403, author-hosted linked copy could not be dereferenced. **FULL PROOF UNKNOWN**.
- **2011 Ábrego et al:** journal DOI 10.1016/j.comgeo.2010.11.003 and publisher abstract accessible; author publication list links full journal and short 2009 preliminary. Full original 2011 text **NOT INSPECTED**. Existing SRC0071 preliminary STATEMENT_INSPECTED is not proof inspection of full journal.
- **2026 Iacono–Nekrich–Seybold:** official Dagstuhl ICALP 2026 original full-text HTML introduction/model inspected (SRC0087 STATEMENT_INSPECTED); kNN query rather than mandatory geometric edges.

## Genuine native endpoint attempts (all counts UNKNOWN)
| Collection | Exact URL / action attempted | Result, coverage |
|---|---|---|
| Crossref API | https://api.crossref.org/works/10.1016%2Fj.comgeo.2010.11.003 | direct API open not accessible; native citation graph UNKNOWN |
| OpenAlex | https://api.openalex.org/works/https://doi.org/10.1016/j.comgeo.2010.11.003 | direct API open not accessible; native works/citations UNKNOWN |
| Semantic Scholar graph | https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/j.comgeo.2010.11.003?fields=title,year,references.title,citations.title | direct API open blocked/error; references/citations UNKNOWN |
| Google Scholar native | https://scholar.google.com/scholar?q=%22nearest+two%22+triangulation+polygon | unavailable; result count UNKNOWN |
| arXiv native search interface | https://arxiv.org/search/?query=%22nearest+neighbor%22+%22triangulation%22&searchtype=all | interface disabled/unavailable in browser; native FULL TEXT corpus scan NOT done, UNKNOWN |
| OEIS keyword native | https://oeis.org/search?q=nearest+neighbor+ellipse | direct native endpoint unavailable; UNKNOWN |
| OEIS terms native | no defensible exact integer sequence of these geometric configurations specified; NOT_RUN / UNKNOWN; site: keyword searches do not count |
| MathSciNet / zbMATH | no successfully retrieved native entries/forward citation graphs during S023; earlier S022 MathSciNet 403; UNKNOWN |
| SoCG/CCCG/EuroCG/ISAAC/DCG/CGTA/JCG/SIAM DM | targeted public web-index terms only; comprehensive native proceedings/volumes NOT scanned; UNKNOWN |
| Theses and historical books; MathOverflow/MSE, Erdős Problems, Open Problem Garden, Kourovka, AMM/Math Magazine, Zenodo/GitHub | S022 limited metadata/index exploration retained; no native exhaustive inspection S023; UNKNOWN |

No finite search establishes universal absence of past work. No fabricated total hits, inaccessible results or proof pages.
