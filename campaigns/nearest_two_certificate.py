"""CAM-0007: independent 6-point exact counterexample certificate, all 720 orders."""
from itertools import permutations, combinations
from pathlib import Path
import json, platform, sys

P=[(-40,400),(-22,121),(-20,100),(-4,4),(24,144),(28,196)]

def det(a,b,c):
    return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
def d2(a,b):
    return (a[0]-b[0])**2+(a[1]-b[1])**2

def proper_intersection(a,b,c,d):
    return det(a,b,c)*det(a,b,d)<0 and det(c,d,a)*det(c,d,b)<0

def nearest_two(v,old):
    return sorted(old,key=lambda u:(d2(P[v],P[u]),P[u]))[:2]

def drawing(order):
    e=list(combinations(order[:3],2))
    for k in range(3,len(order)):
        v=order[k]
        e.extend((v,u) for u in nearest_two(v,order[:k]))
    bad=[(f,g) for f,g in combinations(e,2) if len(set(f+g))==4 and proper_intersection(P[f[0]],P[f[1]],P[g[0]],P[g[1]])]
    return e,bad

def main():
    assert len(set(P))==6
    assert all(det(*t)!=0 for t in combinations(P,3))
    h=[det(P[i],P[(i+1)%6],P[(i+2)%6]) for i in range(6)]
    assert all(x>0 for x in h) # A..F, then F->A supporting edge; convex
    nearest={str(i):nearest_two(i,[j for j in range(6) if i!=j]) for i in range(6)}
    ears=[i for i in range(6) if set(nearest[str(i)])=={(i-1)%6,(i+1)%6}]
    assert not ears
    outcomes=[]
    for order in permutations(range(6)):
        edges,bad=drawing(order)
        outcomes.append(bool(bad))
    assert len(outcomes)==720
    assert all(outcomes)
    doc=dict(points=P,cyclic_hull_indices=list(range(6)),strict_convex_orientations=h,
             squared_distance_matrix=[[d2(a,b) for b in P] for a in P],
             nearest_two_all_others=nearest,eligible_last_ears=ears,
             permutations_checked=720,orders_with_at_least_one_proper_crossing=sum(outcomes),
             orders_crossing_free=720-sum(outcomes),python=sys.version,platform=platform.platform(),
             proof_scope='Direct exact orientation/distance arithmetic plus independent 720-permutation full graph check; finite concrete counterexample. General principle of hull ear necessity proved separately.')
    Path('campaigns/CAM-0007_raw.json').write_text(json.dumps(doc,indent=2)+'\n')
    print(json.dumps(doc))
if __name__=='__main__':main()
