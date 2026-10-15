# S034 mathematics — exact homogeneous chords and an adversarial replacement-selector audit

## Exact S033 entry status

LIVE remote main at entry: `67e93fc2fc0c3f08228bcddf39c5cfd838e9e0d3`, commit tree `52dc1578e6c48c30e491ad9ca4ee10f7b3567051`. Authored S033 commit `23b4294e0a416a8b6c9e3d24903a5d320c8988da` has sole parent `eb0ce2def5cb1d7fa365370aa34f77eb58c12bc5`. PR #39 was ordinary non-draft; merged main has parents in that order and the same tree as authored. Verified separate PR Lean [38643322853](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38643322853), governance [38643323024](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38643323024), merged-main Lean [38643600876](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38643600876), governance [38643601278](https://github.com/jfairfaxball-348/ellipse-theorem/actions/runs/38643601278): all SUCCESS. Actual job logs show `lake build`, `lake env lean ETSHTS.lean`, standard theorem axiom lists, project hole checks, scaffold validation and seven unittest successes. S033's exact rational distance theorem is therefore now kernel-verified, including standard `[propext, Classical.choice, Quot.sound]` dependencies. It does NOT formally establish the associated arctan cyclic order.

## New exact reusable algebraic identity

For real semiaxes a,b and finite real parameter t, set
`P(t)=(a(1-t²)/(1+t²), 2bt/(1+t²))`. Define `D(t)=1+t²`,
`X(t)=a(1-t²)`, `Y(t)=2bt`.
Direct polynomial expansion yields:

```
X(t)D(u) - X(u)D(t) = -2a(t-u)(t+u)
Y(t)D(u) - Y(u)D(t) =  2b(t-u)(1-tu)
```

Consequently the Euclidean squared chord has the **exact rational formula**

```
|P(t)-P(u)|² =
    4(t-u)²[a²(t+u)² + b²(1-tu)²]
    / [(1+t²)²(1+u²)²].
```

All denominators are strictly positive. S034 adds Lean polynomial numerator equalities and positivity, which are easier to apply to **actual Euclidean distance comparisons** than an unsupported angular-order shortcut. CI must verify the Lean declarations. This formula is algebraic: it does not by itself prove a global metric ear, cyclic closure (t=∞ needs a separate chart), CLM0096 or CLM0107.

## Counterexample to another tempting selector

The globally shortest *adjacent* chord may have an endpoint which is **not** a metric ear, even with ellipse ratio exactly `101/100`. Take five cyclically ordered points `P(0), P(1/8), P(1/4), P(-6), P(-4)`. In angle order, positive t runs to π, then negative t runs from π to 2π. Exact rational arithmetic gives

```
|P(-6)-P(-4)|² = 252404/9891025,
|P(1/8)-P(1/4)|² = 44315776/763140625,
|P(-6)-P(1/4)|² = 6396329/1582564,
|P(-6)-P(0)|² = 3395124/855625.
```

The edge `P(-6)P(-4)` is strictly shortest among the five polygon boundary edges (its squared length is about 0.02552, versus the next about 0.05807). But at its endpoint `P(-6)`, the non-neighbour `P(0)` is strictly closer than neighbour `P(1/4)`: `3395124/855625 < 6396329/1582564`. Hence **select an arbitrary endpoint of the shortest boundary edge** is also an invalid universal metric-ear rule. The *other endpoint* `P(-4)` is a valid ear in this example, so this does not refute the proposed two-endpoint/minimax variants or CLM0107. All comparisons are exact rational statements checked separately with Python `Fraction`, but these five-point comparisons have not yet been given Lean theorem certificates.

## New research direction, carefully qualified

A better candidate is the vertex minimising the **larger of its two adjacent Euclidean squared chord lengths**:
`M_i = max(d(P_i,P_(i-1))², d(P_i,P_(i+1))²)`.
Unlike minimum adjacent two-angle gap, this measures the actual compulsory distances and treats the curved ellipse without substituting angular closeness. Random stress tests across n=5–10 and ratios up to 1.5 did not supply a counterexample in the tested samples at a/b=1.01 or 1.05, but did produce examples of failures at ratio 2. **These are exploratory numerical observations only, neither exhaustive nor evidence of threshold sharpness.** Their computations were not repository-preregistered and must not be promoted to certified finite theorem checks. The minimax rule is NOT stated as theorem and needs adversarial testing especially near ties, near-collisions, and a/b=R.

The s033 unique minimum-two-gap witness has a different minimax site: with n=5, the candidate gap vertex 2 is not a metric ear, while sites 1 and 3 are ears. Thus the new proposal is not just renaming the refuted angular minimum selector.

## Four-point/full-ear exact proof obstacles remain

For an interior fourth site, all three spokes lie within the seed triangle, but Lean needs explicit segment-convexity and no-proper-crossing against its three sides. For a convex quadrilateral A-B-C-D with diagonal intersection O, choose A farthest from O; strict triangle inequality yields `|CB| < |CO|+|OB| ≤ |CO|+|OA| = |CA|` and analogously `|CD|<|CA|`; seed A,B,D then insert C, whose new edges are hull sides. This is a **paper proof skeleton**, not a Lean proof of general-position hull/interior dichotomy, nor of the exact type CLM0096. Ties at farthest-distance selection are harmless because the triangle inequality is strict when B,O,C are not collinear.

CLM0099 needs the actual maximal-outerplanar argument: 2n-3 distinct edges, triangulation and degree-two final ear, and a certified reconstruction preserving nearest-two. One valid metric ear alone does not imply FullEarCertificate. The converse remains a separate induction challenge; do not assume the prior graph retained all hull sides without proving it.

The all-n ellipse metric-ear existence, n=3/4 bases, cyclic wraparound, closed a/b=R threshold, Euclidean lex tie rules, and subsequent CLM0108 deduction remain **unproved**. CLM0102 is still proved. S034 verdict PARTIAL.
