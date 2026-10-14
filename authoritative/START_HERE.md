# Start here — ellipse theorem formalisation

**Active home:** https://github.com/jfairfaxball-348/ellipse-theorem (formerly ETS_HTS, same repository ID and history).

S025 is complete and has a verified compiling Lean foundation. **CLM0096/0099/0102/0107/0108 are still UNPROVED in Lean.** The next research session is **S026 FUTURE / UNEXECUTED**; a fresh explicit owner invocation is mandatory. Updating this handover does not execute S026.

1. Fetch **live canonical main SHA and tree**, branches, open PRs, governance and Lean CI run details, accessible rules; don't trust dated SHA text as the current head.
2. Read [STATE](STATE.json) → [AGENTS](../AGENTS.md) → [session protocol](../docs/SESSION_PROTOCOL.md) → [S026 handover](NEXT_SESSION_PROMPT.md) and [migration provenance](../docs/FORMALISATION_HANDOVER.md).
3. Reconstruct S025 [PR #29](https://github.com/jfairfaxball-348/ellipse-theorem/pull/29), the two-parent merge, and the successful [S025 compiled build](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38596176639); inspect current `ETSHTS` files and pinned Lean/mathlib.
4. Read the full [S020 mathematical proof](../sessions/S020/MATHEMATICS.md), [S021 hostile proof audit](../sessions/S021/MATHEMATICS.md), [S021 Lean blueprint](../sessions/S021/LEAN_BLUEPRINT.md), [S024 final novelty record](../sessions/S024/CLOSEOUT.md), [S025 formalisation status](../sessions/S025/FORMALISATION.md).
5. **On fresh S026 authorisation only**, develop actual proofs with exact all-n/closed-R/tie quantifiers; run `lake build` and `#print axioms` on final theorem declarations; independently inspect statements. Definitions of `Prop` do not suffice.
6. At exit preserve one authored session commit, ordinary PR, two-parent merge where possible, fresh main/tree, and **separate** hosted Lean vs record-validation outcomes. Publication, Palomar and outreach remain separately owner-gated.

Historical ETS_HTS documents remain intact for provenance; this is no longer an open-problem-generation task.
