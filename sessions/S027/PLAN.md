# S027 execution plan — exact Lean partial proof progress

1. Fresh live main b7f816989d8f65371243ee8cd4de30ebd8fe75a5, tree c20f1fdccc7c0a5c50604d62f3db88602df26ebd. Reconcile S026 PR31, its actual authored ancestry, merge parents/tree and successful independent Lean/governance CI.
2. Preserve five immutable CLM signatures in ETSHTS/Targets.lean; cross-check S020 and S021 proof. Do not infer proof from a Prop declaration.
3. Target the mathematically essential CLM0107 central-chord comparison as a concrete Lean subgoal. Derive exact dilation, positive and negative anisotropy decompositions, and universal b²/a² squared-chord bounds by existing algebra, ring and nlinarith. Add to ETSHTS.lean with independent theorem-specific axiom prints.
4. Use hosted pinned Lean 4.15.0/mathlib 9837ca9d65d9de6fad1ef4381750ca688774e608 CI for actual compilation. Local Lean, local checkout and local tests are unavailable; don't misstate them as run.
5. Record proof coverage and remaining five target blockers; one S027 authored commit and ordinary PR, normal two-parent GitHub merge only if checks permit. Queue S028 FUTURE without execution. No novelties, computations, Palomar, manuscript or submission.
