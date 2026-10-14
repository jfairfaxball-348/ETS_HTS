# S021 — falsification record (symbolic only)

| Attack | Setup | Expected failure mechanism | Actual resolution |
| --- | --- | --- | --- |
| Four points | arbitrary convex quadrilateral with crossed diagonals | last point's nearest pair not hull-adjacent | opposite of a furthest-from-diagonal-crossing endpoint has both hull neighbours strictly nearer |
| n=5 extremal averaging | all two-step spans could equal 4pi/5, ratio r=R | no eligible span at equality | Lambda(R)>4pi/5 strictly; witness always eligible |
| Extreme clustering | gaps approach zero or are hierarchically unequal | infinitesimal distance advantage lost in anisotropy | distance-minimising eligible skip chord, strict outward derivative, no absolute gap margin |
| Wraparound | selected ear and near competitor straddle parameter seam | wrong signed arc | choose real lift cyclically; angular differences in (0,2pi), derivative periodic in points |
| Opposing competitors | candidate short forward and short backward | unjustified direct comparison between opposite chords | each compared separately with eligible skip chord i+1 or i-1 |
| Near antipode | delta near pi, r>1 | forward chord no longer monotone | b-scaled chord lower bound on [Lambda,2pi-Lambda] |
| Cutoff equality | delta=Lambda and r=R | outward derivative not strictly positive at endpoint | central-band weak inequality; neighbours separately strictly below L_i |
| Ties | equally distant competing non-neighbours | lex ranking could displace neighbour | neighbours strictly below L_i, all others >=L_i |
| Repeat | removed point changes angular gaps | first ear does not imply recursive order | full universal proof at each smaller m, same a/b |
| Universal -> noncircle | approximate 1.01 vs 1.0502 | numeric-rounding dependent | exact sqrt(5) and rational inequalities show strict inclusion |

No numerical search, floating-point witnesses or preregistered CAM were used. No purported exact counterexample was generated. Unresolved research questions (optimal R, r>R classification, originality) are outside S021's proof-audit theorem and cannot block internal proof PASS, but they block any sharpness/novelty claim.
