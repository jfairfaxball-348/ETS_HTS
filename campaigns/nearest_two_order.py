"""CAM-0004: bounded exact ordering audit; never certifies the universal question."""
import itertools as it
import json
import random
import time
from pathlib import Path

def orient(a,b,c):
    return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])

def cross(a,b,c,d):
    return orient(a,b,c)*orient(a,b,d)<0 and orient(c,d,a)*orient(c,d,b)<0

def general(p):
    return all(orient(*t)!=0 for t in it.combinations(p,3))

def neighbours(p,v,old):
    return sorted(old,key=lambda u:((p[u][0]-p[v][0])**2+(p[u][1]-p[v][1])**2,p[u]))[:2]

def edges_for(p,order):
    edges=list(it.combinations(order[:3],2))
    for i,v in enumerate(order[3:],3):
        edges.extend((v,u) for u in neighbours(p,v,order[:i]))
    return edges

def valid(p,order):
    return not any(cross(p[a],p[b],p[c],p[d]) for (a,b),(c,d) in it.combinations(edges_for(p,order),2) if len({a,b,c,d})==4)

def dfs(p):
    nodes=0
    def extend(order,edges):
        nonlocal nodes
        nodes+=1
        if len(order)==len(p): return order
        for v in range(len(p)):
            if v in order: continue
            new=[(v,u) for u in neighbours(p,v,order)]
            if any(cross(p[a],p[b],p[c],p[d]) for a,b in new for c,d in edges if len({a,b,c,d})==4): continue
            out=extend(order+[v],edges+new)
            if out is not None: return out
        return None
    for tri in it.combinations(range(len(p)),3):
        out=extend(list(tri),list(it.combinations(tri,2)))
        if out is not None: return out,nodes
    return None,nodes

def brute(p):
    for order in it.permutations(range(len(p))):
        if valid(p,order): return list(order)
    return None

def main():
    start=time.monotonic()
    rng=random.Random(140014)
    sets=[]
    grid=list(it.product(range(3),repeat=2))
    for n in range(4,7):
        sets.extend(('grid',list(p)) for p in it.combinations(grid,n) if general(p))
    for n in range(4,9):
        for _ in range(30):
            for attempt in range(1000):
                p=sorted(rng.sample(list(it.product(range(-20,21),repeat=2)),n))
                if general(p): break
            else: raise RuntimeError('sample cap')
            sets.append(('seeded_sample',p))
    rows=[]
    for family,p in sets:
        witness,nodes=dfs(p)
        independent=brute(p) if len(p)<=6 else None
        if len(p)<=6 and (witness is None)!=(independent is None): raise RuntimeError('solver disagreement')
        if witness is not None and not valid(p,witness): raise RuntimeError('invalid witness')
        rows.append(dict(family=family,points=p,n=len(p),witness=witness,nodes=nodes,independent_checked=len(p)<=6,lex_order_planar=valid(p,list(range(len(p))))))
        if witness is None or time.monotonic()-start>60: break
    doc=dict(rows=rows,planned_sets=len(sets),completed_sets=len(rows),complete=len(rows)==len(sets),counterexample=next((r for r in rows if r['witness'] is None),None),seconds=time.monotonic()-start,tie_break='lexicographic coordinates',limitations='Finite selected sets only; neither proof nor hardness or novelty certificate.')
    Path('campaigns/CAM-0004_raw.json').write_text(json.dumps(doc,indent=2)+'\n')
    print(json.dumps({k:v for k,v in doc.items() if k!='rows'}))

if __name__=='__main__': main()
