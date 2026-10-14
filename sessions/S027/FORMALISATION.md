# S027 — formalisation record: exact chord inequalities

## Honest outcome
**PARTIAL / OPEN.** No proof of complete CLM0096, CLM0099, CLM0102, CLM0107 or CLM0108 is claimed. All exact fixed proposition signatures in `ETSHTS/Targets.lean` are unchanged. S026's true proof declarations remain present. This session supplies one substantive analytic prerequisite for S020's all-n ellipse proof without resolving the five theorems.

## Concrete new Lean proof candidates
File `ETSHTS/AnalyticBounds.lean` adds four declarations, imported by `ETSHTS.lean` and included in `#print axioms`:

1. `sqDist_ellipse_scale`: a common dilation `c` of both semiaxes multiplies **squared** chord distance by `c²`.
2. `sqDist_ellipse_as_circle_plus`: exact identity `d²_(a,b)(θ,φ)=b² d²_(1,1)(θ,φ)+(a²-b²)(cos θ-cos φ)²`.
3. `sqDist_ellipse_as_circle_minus`: exact identity `d²_(a,b)(θ,φ)=a² d²_(1,1)(θ,φ)-(a²-b²)(sin θ-sin φ)²`.
4. `sqDist_ellipse_between_circular_bounds`: for `0≤b≤a`, **every** pair of real unwrapped angles satisfies `b² d²_circle≤d²_ellipse≤a² d²_circle` (including equal angles, equal semiaxes, antipodal and all θ,φ). No floating approximation, generic-position or positive-separation hypothesis.

The uniform lower bound is the key *algebraic* piece of the central chord floor `|P(θ)-P(φ)|≥2b sin(Δ/2)`; deriving the trigonometric dependence on a central band, independently proving both outward derivatives, proving closed-R eligibility and assembling all-n ears remain necessary. The identity does **not** by itself imply a strict metric ear.

## Explicit remaining obligations
- CLM0096: full general-position four-site interior/convex cases in exact Finset/Grow/planeEdges form.
- CLM0099: complete recursive metric-ear iff under original strictConvexPosition, including outerplanar `2m−3` and all hull sides.
- CLM0102: independently prove right and left outward derivatives, their strict signs on every <Λ unwrapped directed arc, and the full 4-angle extension.
- CLM0107: sorted cyclic angle lift for arbitrary finite ellipse S, short-span eligible witness even at R/n=5, minimum *metric* skip chord, forward/central/backward bounds, complete recursive ear deletion, exact insertion and planarity.
- CLM0108: unconditional exact 101/100≤R trig/radical inequality, and true proven CLM0107 instantiation (S026 already has conditional bridge).

## Toolchain, verification and distinction of checks
The manifest, toolchain and pinned dependencies are unchanged. Entry S026 merged main SHA `b7f816989d8f65371243ee8cd4de30ebd8fe75a5`, tree `c20f1fdccc7c0a5c50604d62f3db88602df26ebd`, had separate Lean and governance **SUCCESS** hosted checks (workflows 38601168066 and 38601168206). Those checks cover **S026** only, not this source. At authored time the S027 build is `PENDING_REMOTE_CI`. Local Lean/lake absent, GitHub DNS unresolvable: local `lake build`, `lake env lean ETSHTS.lean`, checker and unittest `NOT_RUN` on a checkout. After PR CI inspect actual jobs and their axiom output separately; a governance PASS does not validate Lean or mathematics. The four lemmas become host-verified only if the correct Lean job succeeds.

No theorem semantic weakening, `sorry`, `admit`, project `axiom`, or mathematical `native_decide` has been introduced. No change to CND131 all killed/SRC87/CLM108/CAM10 and S016/S024 archive verdict. No research publication, Palomar or outreach.
