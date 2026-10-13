"""S009 CAM-0003 finite exact MILP search, original preregistered version.
Minimize violated Z/3 grid edges for all defect faces, m=2..5.
Uses scipy.optimize.milp / HiGHS with integer vertex phases, modulo lift, violation switches.
"""
import json, os, sys, time
import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import lil_matrix

def solve(m,i,j):
    nn=(m+1)**2
    def v(r,c): return r*(m+1)+c
    q=[[1 if (r+c)%2==0 else -1 for c in range(m)] for r in range(m)]
    q[i][j]*=-1
    ds=[]
    for r in range(m+1):
        for c in range(m): ds.append((v(r,c),v(r,c+1),0,'H',r,c))
    for r in range(m):
        acc=0
        for c in range(m+1):
            if c: acc+=q[r][c-1]
            ds.append((v(r,c),v(r+1,c),acc%3,'V',r,c))
    ne=len(ds)
    # x vertices [0..nn), k edges [nn..nn+ne), y edges last
    n=nn+2*ne
    c=np.zeros(n); c[nn+ne:]=1
    integrality=np.ones(n)
    lb=np.concatenate((np.zeros(nn), -np.ones(ne)*2,np.zeros(ne)))
    ub=np.concatenate((np.ones(nn)*2,np.ones(ne)*2,np.ones(ne)))
    A=lil_matrix((2*ne,n),dtype=float); low=np.full(2*ne,-np.inf); up=np.zeros(2*ne)
    for e,(u,v,d,*_) in enumerate(ds):
        # x_v - x_u - 3k_e <= d + 6y_e
        A[2*e,v]=1;A[2*e,u]=-1;A[2*e,nn+e]=-3;A[2*e,nn+ne+e]=-6;up[2*e]=d
        A[2*e+1,v]=-1;A[2*e+1,u]=1;A[2*e+1,nn+e]=3;A[2*e+1,nn+ne+e]=-6;up[2*e+1]=-d
    res=milp(c,integrality=integrality,bounds=Bounds(lb,ub),constraints=LinearConstraint(A.tocsr(),low,up),options={'time_limit':10.0,'mip_rel_gap':0})
    if res.status!=0 or res.x is None: return {'m':m,'i':i+1,'j':j+1,'status':int(res.status),'message':res.message}
    x=np.rint(res.x[:nn]).astype(int)
    bad=sum((x[v]-x[u]-d)%3 !=0 for u,v,d,*_ in ds)
    opt=round(float(res.fun))
    if bad!=opt: raise ValueError(f'objective mismatch: {m},{i},{j}: {bad}!={opt}')
    return {'m':m,'i':i+1,'j':j+1,'status':0,'optimum':opt,'violations':bad,'solver':'HiGHS optimal'}

def main():
    out={'campaign_id':'CAM-0003','parameters':'m=2..5, all i,j 1..m','records':[],'limits':'10 s per MILP, no retries'}
    for m in range(2,6):
        for i in range(m):
            for j in range(m):
                r=solve(m,i,j);out['records'].append(r)
                print(r,flush=True)
    out['completed_count']=len(out['records']);out['all_optimal']=all(r['status']==0 for r in out['records'])
    with open(os.path.join(os.path.dirname(__file__),'CAM-0003_raw.json'),'w') as f: json.dump(out,f,indent=2);f.write('\n')
    print('Completed',out['completed_count'], 'all optimal',out['all_optimal'])
if __name__=='__main__': main()
