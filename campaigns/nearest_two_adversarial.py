"""CAM-0005 pre-registered adversarial convex-ear/nearest-two search; exact ints."""
import itertools as it, json, random, time, platform, sys
from pathlib import Path

SEED=150128
TRIALS=500
N_RANGE=list(range(4,13))
CLOCK_LIMIT=75
OUT='campaigns/CAM-0005_raw.json'

def orient(a,b,c):
    return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
def cross(a,b,c,d):
    return orient(a,b,c)*orient(a,b,d)<0 and orient(c,d,a)*orient(c,d,b)<0

def general(p):
    return len(p)==len(set(p)) and all(orient(*t)!=0 for t in it.combinations(p,3))
def hull(p):
    s=sorted(p)
    lower=[]
    for x in s:
        while len(lower)>=2 and orient(lower[-2],lower[-1],x)<=0: lower.pop()
        lower.append(x)
    upper=[]
    for x in reversed(s):
        while len(upper)>=2 and orient(upper[-2],upper[-1],x)<=0: upper.pop()
        upper.append(x)
    return lower[:-1]+upper[:-1]
def nearest_two(p,v,old):
    return tuple(sorted(old,key=lambda u:((p[u][0]-p[v][0])**2+(p[u][1]-p[v][1])**2,p[u]))[:2])
def ear_set(p):
    h=hull(p)
    if len(h)!=len(p): return None
    d={x:i for i,x in enumerate(p)}
    return [d[h[i]] for i in range(len(h)) if set(nearest_two(p,d[h[i]],range(len(p))))=={d[h[(i-1)%len(h)]],d[h[(i+1)%len(h)]]}]
def solve(p,maxnodes=300000):
    n=len(p); nodes=0
    def dfs(seq,edges):
        nonlocal nodes
        nodes+=1
        if nodes>maxnodes:return 'CAPPED'
        if len(seq)==n:return list(seq)
        for v in range(n):
            if v in seq:continue
            es=[(v,u) for u in nearest_two(p,v,seq)]
            if any(cross(p[a],p[b],p[c],p[d]) for a,b in es for c,d in edges if len({a,b,c,d})==4): continue
            q=dfs(seq+(v,),edges+es)
            if q=='CAPPED':return q
            if q is not None:return q
        return None
    for tri in it.combinations(range(n),3):
        s=dfs(tri,list(it.combinations(tri,2)))
        if s is not None:return s,nodes
    return None,nodes

def valid(p,seq):
    e=list(it.combinations(seq[:3],2))
    for i in range(3,len(p)):
        v=seq[i]
        e.extend((v,u) for u in nearest_two(p,v,seq[:i]))
    return not any(cross(p[a],p[b],p[c],p[d]) for (a,b),(c,d) in it.combinations(e,2) if len({a,b,c,d})==4)

def points(n,k,rng):
    # integer x-monotone parabola with alternating vertical reflections, strictly convex if accepted
    if k%3==0:
        x=sorted(rng.sample(range(-400,401),n));s=rng.choice([1,3,30,100])
        return [(u,s*u*u+rng.randrange(-1000,1001)) for u in x]
    if k%3==1:
        # anisotropic radial samples, validate hull/general in main
        import math
        ang=sorted(rng.uniform(0,2*math.pi) for _ in range(n)); stretch=rng.choice([1,10,100,1000]);scale=100000
        return [(round(scale*math.cos(a)),round(scale*math.sin(a)/stretch)) for a in ang]
    # two-chain thin-strip convex hull; construct from x^2 upper/lower (accept if all extreme)
    nt=n//2; nb=n-nt
    xt=sorted(rng.sample(range(-200,201),nt));xb=sorted(rng.sample(range(-200,201),nb))
    return [(x,5000-x*x//rng.choice([50,100,200])) for x in xt]+[(x,-5000+x*x//rng.choice([50,100,200])) for x in xb]

def main():
    rng=random.Random(SEED); start=time.monotonic(); seen=0;convex=0; noears=0; tried=0; capped=0; inspected=[]; witness=None
    for n in N_RANGE:
        for k in range(TRIALS):
            p=points(n,k,rng);seen+=1
            if not general(p):continue
            ears=ear_set(p)
            if ears is None:continue
            convex+=1
            if not ears:
                noears+=1
                s,nodes=solve(p)
                tried+=1
                witness={'points':p,'ear_set':ears,'order':s,'nodes':nodes,'n':n,'is_convex':True,'checked':(s is None)}
                if isinstance(s,list) and not valid(p,s):raise AssertionError('invalid purported feasible order')
                break
            if k==0:inspected.append(dict(n=n,points=p,ears=ears))
            if time.monotonic()-start>CLOCK_LIMIT:break
        if witness is not None or time.monotonic()-start>CLOCK_LIMIT:break
    report={'seed':SEED,'trials_per_size_cap':TRIALS,'n_range':N_RANGE,'generated':seen,'convex_general':convex,'convex_no_ear':noears,'exact_solver_calls':tried,'witness':witness,'illustrations':inspected,'elapsed_s':time.monotonic()-start,'platform':platform.platform(),'python':sys.version,'note':'No-ear convex witness directly disproves all-arrival-order possibility if correct; solver is corroboration. Finite no-witness does not prove universal.'}
    Path(OUT).parent.mkdir(parents=True,exist_ok=True)
    Path(OUT).write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='illustrations'}))
if __name__=='__main__':main()
