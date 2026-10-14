"""Preregistered CAM-0010 finite metric-ear exploration. No novelty/proof beyond finite trials."""
import json, sys, random, math
import numpy as np
from scipy.optimize import differential_evolution

SEED=20261014_17
RATIOS=[1.01,1.02,1.2,2.,5.]
N_LIST=[5,6]
RANDOM_TRIALS=20000
DE_MAXITER=70
DE_POPSIZE=10

def margin(theta, aspect):
    n=len(theta)
    x=np.column_stack((aspect*np.cos(theta), np.sin(theta)))
    d=np.sum((x[:,None,:]-x[None,:,:])**2,axis=2)
    deficits=[]
    for i in range(n):
        nei=((i-1)%n,(i+1)%n)
        far=[j for j in range(n) if j!=i and j not in nei]
        deficits.append(float(np.max(d[i,list(nei)])-np.min(d[i,far])))
    return min(deficits), deficits, x

def decode(z):
    gaps=np.exp(np.asarray(z[:-1])*5.-2.5)
    theta=np.mod(2*math.pi*(np.cumsum(np.r_[0.,gaps[:-1]])/np.sum(gaps))+2*math.pi*z[-1],2*math.pi)
    return theta

def calc():
    rng=np.random.default_rng(SEED)
    out={'seed':SEED,'python':sys.version,'numpy':np.__version__,'scipy':__import__('scipy').__version__,
         'ratios':RATIOS,'n':N_LIST,'random_trials_per_cell':RANDOM_TRIALS,'de_maxiter':DE_MAXITER,'de_popsize':DE_POPSIZE,'cells':[]}
    for a in RATIOS:
      for n in N_LIST:
        best=(-1e100,None)
        count_noear=0
        for t in range(RANDOM_TRIALS):
            alpha=float(rng.choice([.01,.05,.2,1.,5.]))
            gaps=rng.dirichlet(np.full(n,alpha))
            phase=rng.uniform(0,2*math.pi)
            theta=phase+2*math.pi*np.cumsum(np.r_[0,gaps[:-1]])
            val,_,_=margin(theta,a)
            if val>0: count_noear+=1
            if val>best[0]:best=(val,[float(v) for v in theta])
        for t in range(2):
            result=differential_evolution(lambda zz:-margin(decode(zz),a)[0],bounds=[(0,1)]*(n+1),seed=SEED+int(a*10000)+n*100+t,maxiter=DE_MAXITER,popsize=DE_POPSIZE,polish=False,atol=0,tol=.001)
            val=-result.fun
            if val>best[0]:best=(float(val),[float(v) for v in decode(result.x)])
        out['cells'].append({'a':a,'n':n,'random_noear':count_noear,'best_margin':best[0],'best_angles':best[1] if best[0]>0 else None})
        print(a,n,'noear',count_noear,'bestmargin',round(best[0],11),flush=True)
    with open('/mnt/data/ETS_HTS_S017/CAM-0010_raw.json','w') as f:json.dump(out,f,indent=2)

if __name__=='__main__':calc()
