# S046 — exact formalisation coverage (no direct CLM0107 proof yet)

## Immutable headline target ledger

| Exact original target | At S046 close | Evidence |
|---|---|---|
| `clm0096_exact : CLM0096` | **VERIFIED** | Prior S042 original three/four-point theorem, standard axioms |
| `clm0102_exact : CLM0102` | **VERIFIED** | Prior S030 exact endpoint derivatives/extension, standard axioms |
| `clm0099_exact : CLM0099` | **OPEN / DEFERRED** | Full outerplanar necessity; expressly out of scope for S046 |
| `clm0107_exact : CLM0107` | **OPEN / ACTIVE** | Genuine hull cyclic adjacency and full geometric ear proof remain |
| `clm0108_exact : CLM0108` | **OPEN / DEFERRED** | Direct all-n CLM0107 still open; not worked in S046 |

**2/5 unchanged.** No lemma proves direct `clm0107_exact` yet. Targets and Definitions unchanged.

## Formalised supporting results

`ETSHTS/CyclicEllipsePhase.lean`:
- `s046_clamped_phase` creates an exact natural-number view of indexed phases.
- `s046_telescope`: finite real successive-difference telescoping.
- `s046_clamped_adjacent_gap_pos`: strict positive adjacent gaps for any strict order embedding.
- `s046_wrap_gap_pos`: positive final wrap at true 2π without extra spacing conditions.
- `s046_true_full_turn`: exact `2*pi` total of ordinary increments plus final wrap.
- `s046_original_ellipse_cyclic_gaps`: actual original finite ellipse site set with the exact original site image, cardinality, positive ordinary and wrap gaps, and full turn.

`ETSHTS/CyclicEllipseSkip.lean`:
- `s046_cyclic_gap`: genuine `finRotate` successor difference with one wrap.
- `s046_cyclic_gap_pos`: each actual indexed successor gap strictly positive, including wrap.
- `s046_cyclic_gap_full_turn`: full cyclic successor sum exactly `2*pi`.
- `s046_squared_skip_chord`: original `sqDist` of actual ellipse sites at i and second successor.
- `s046_original_closed_ratio_skip_min`: instantiates S044 exact minimum *Euclidean squared skip chord* over eligible two-gap arcs under `a/b≤R` **including equality**.
- `s046_actual_sites_closed_ratio_skip_min`: applies the preceding results to every genuine original finite ellipse site set with ≥5 elements, retaining exact site image and all geometric inputs rather than assuming a cyclic list.

The code-head before archival (`7ab1a46ae88e50f4e1b764d3eca9f44375c404d9`) [Lean PR run 38768896754](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38768896754) passed; final documentation-head and independent merged-main check must be checked live. All new declarations have root `#print axioms`; acceptable dependencies are only `propext`, `Classical.choice`, `Quot.sound`. No `sorry`/custom axiom/`native_decide`. Local Lean NOT_RUN.

## Exact outstanding obligations before direct CLM0107

**B1 geometric part:** prove the two true predecessor/successor sites from indexed original phases are the original `hullSide` neighbours and exhaust `cyclicNeighbours`. This requires actual strict orientation and successor index proof, not assumed cyclic neighbours. 

**B3 strict incident and complete all-competitor:** the eligible skip from i to i+2 centres the candidate ear at i+1. Lift its real angles across wrap, prove both genuine incident `sqDist` strictly below skip via `s035_eligible_skip_exceeds_both_neighbours`; then every original other site must have distance ≥ skip via the forward short, central **closed** band (both equality endpoints), backward short case. The true floor/witness geometry under closed R must be formalised and fed to `s035_metric_ear_of_skip_chord_floor`.

**B4:** only after a uniform true `metricEar` at every eligible finite original set ≥5 is proved, apply `clm0096_exact` and `s042_clm0107_of_clm0096_and_ge5_ears` to compile the literal unchanged `clm0107_exact : CLM0107`. No four-site ear premise and no CLM0099 requirement. Full direct theorem **not compiled** in S046.

## Additional original-site uniqueness bridge

`ETSHTS/CyclicEllipseMembership.lean` is root-imported and prints:
- `s046_indexed_ellipse_site_mem`: every phase-indexed ellipse site is an **actual member** of the unchanged original finite `S`.
- `s046_indexed_ellipse_sites_injective`: if the indexed image is all of the original `S` and `S.card = n+1`, distinct `Fin (n+1)` indices yield distinct ellipse sites. It derives this using `Finset.card_image_iff`, not an unsupported claim of global injectivity of trigonometric periodic coordinates.

The S046 original arbitrary-site composition previously failed at an dependent `Fin`/cardinality witness in CI; repaired using the actual `5 ≤ S.card` hypothesis and natural-number arithmetic, so `s046_actual_sites_closed_ratio_skip_min` is included in hosted compilation. All new statements require successful latest PR-head Lean and standard-only axiom prints; prior failures are retained as evidence rather than silently erased.
