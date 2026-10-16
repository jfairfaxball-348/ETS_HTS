# Start here — ellipse theorem formalisation

Canonical https://github.com/jfairfaxball-348/ellipse-theorem (renamed from ETS_HTS; same repository ID). Lean namespace remains `ETSHTS`.

**S030 exact milestone verified on merged main:** `clm0102_exact : CLM0102` compiled on pinned Lean 4.15.0/mathlib `9837ca9d65d9de6fad1ef4381750ca688774e608`. Merge SHA `de69530995b13be9a4f32b234cc10f9a00556cae`; separate Lean and governance runs successful; `#print axioms` returns [propext, Classical.choice, Quot.sound]. This does NOT verify the other four CLMs.

**S031** proves a source-level four-site mandatory insertion interface and attempts an unconditional exact `101/100 ≤ R` certificate, alongside a mathematical convex/interior four-point argument. See [mathematics](../sessions/S031/MATHEMATICS.md) and [closeout](../sessions/S031/CLOSEOUT.md); source candidate requires S031 hosted CI for Lean certification. CLM0096 (universal four sites), CLM0099 (full iff), CLM0107 (all n), CLM0108 (all n nonround) remain OPEN. [S032 FUTURE prompt](NEXT_SESSION_PROMPT.md) requires new owner invocation.

Historical CND131 all killed/SRC87/CLM108/CAM10 and S024 conditional novelty remain intact. No Palomar/paper/outreach authority.

## S032 authenticated continuation

Independently inspected S031 merged-main Lean [38638823699](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38638823699) and governance [38638823717](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38638823717): both SUCCESS. S031 ratio and strict-gap wrapper are thus kernel-verified with standard axioms. S032 [math](../sessions/S032/MATHEMATICS.md) adds source-level exact-tie predecessor selection and four-point insertion wrapper (new hosted checks required). CLM0096, 0099, 0107, 0108 remain OPEN. [S033 prompt](NEXT_SESSION_PROMPT.md) remains future/unexecuted.

## S033 research handover

S032 merged `eb0ce2def5cb1d7fa365370aa34f77eb58c12bc5`, tree `64f0f460abb5e84d5c8678c6d7e539398188a445`, via ordinary two-parent PR #37 after separate PR Lean/governance success; both merged-main Lean/governance additionally success. All S032 new theorem axiom prints are `[propext, Classical.choice, Quot.sound]`. See [S033 exact cyclic-gap witness](../sessions/S033/MATHEMATICS.md): the *minimum two-gap candidate* is not necessarily a metric ear on the a/b=101/100 ellipse. This does not contradict CLM0107. S033 Lean source needs new CI before verification; the complete four-point geometric case, full metric-ear iff, and all-n closed-R theorem remain open. [S034 FUTURE](NEXT_SESSION_PROMPT.md) may only run on fresh explicit owner invocation.

## S034 mathematical continuation

S033 [PR #39](https://github.com/jfairfaxball-348/ellipse-theorem/pull/39) independently passed PR Lean/governance and merged-main Lean/governance; new S033 exact polynomial distance statements are now certified with standard Lean axioms, not the paper cyclic arctan argument. S034 adds a homogeneous rational ellipse chord formula and second exact rational five-point obstruction to the 'arbitrary endpoint of shortest adjacent edge' selector. The proposed Euclidean minimax selector remains unproved. Review [S034 mathematics](../sessions/S034/MATHEMATICS.md) and [S034 Lean source](../ETSHTS/RationalChord.lean) (new S034 CI pending). CLM0102 remains verified; all other four exact CLMs remain open. [S035 future prompt](NEXT_SESSION_PROMPT.md) requires fresh explicit owner invocation.

## S035 strict frozen-proof correction

Owner's S035 invocation supersedes any S034 handover invitation to investigate a different selector. The S020/S021 proof is locked. S035's [original-selector sublemmas](../ETSHTS/EligibleSkip.lean) and [formalisation report](../sessions/S035/FORMALISATION.md) target the **eligible Euclidean skip-chord minimum**, not angular/minimax/shortest-edge alternatives. Exact CLM0102 was previously certified; four other exact targets are open. New S035 source requires independent hosted CI. [S036 FUTURE](NEXT_SESSION_PROMPT.md) continues strictly the same original proof.

## S050 — exact nonround all-cardinality corollary (16 October 2026)

S049 [PR #61](https://github.com/jfairfaxball-348/ellipse-theorem/pull/61) has merged and independent merged-main Lean/governance passed. S050 [PR #62](https://github.com/jfairfaxball-348/ellipse-theorem/pull/62) directly proves the **literal original `theorem clm0108_exact : CLM0108`** in [ExactNonround.lean](../ETSHTS/ExactNonround.lean) from S049's certified full all-cardinality `clm0107_exact` and the verified exact nonround aspect lemma, without any new geometry or changed original theorem. Hosted code-head [Lean 38878900054](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38878900054) SUCCESS and standard-only printed axioms. The exact direct headline ledger is now **4/5 proven**: CLM0096, CLM0102, CLM0107, CLM0108. **CLM0099 (full metric-ear certificate iff) remains OPEN**; see [FUTURE S051](NEXT_SESSION_PROMPT.md), requiring a fresh owner invocation. Final documentary PR-head and post-merge verification are separately required.
