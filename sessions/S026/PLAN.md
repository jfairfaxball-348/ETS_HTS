# S026 plan — exact Lean proof work

1. Reconcile canonical main/rename history, STATE, AGENTS, S025 PR29 and Lean check, existing typed definitions.
2. Independently inspect S020/S021 proof strategy and exact CLM propositions in `ETSHTS/Targets.lean`; no target changes.
3. Produce actual proof declarations beyond S025: triangle planarity, valid seed order for any three distinct sites, cardinal-three slice of CLM0096, direct certificate base, explicit squared ellipse chord expansion, strict-gap-to-metric-ear reduction, and exact all-n CLM0108 implication conditional on CLM0107 and its rational-R inequality. These are **partial only**.
4. Connect them to `ETSHTS.lean` and print theorem-specific axioms. Host CI is the available pinned compiler (container has no Lean/lake and cannot reach GitHub DNS). No local build PASS claimed.
5. Record exact remaining obligations, update future S027 prompt, branch/PR integration and CI evidence if available. No weakened target theorem or holes.
