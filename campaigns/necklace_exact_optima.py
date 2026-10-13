#!/usr/bin/env python3
"""S006 CAM-0002. Canonical double-occurrence non-adjacent words.

For each word enumerate all complementary assignments of the two occurrences
of each symbol to two alternating interval owners. The minimum # changes of
owner between consecutive positions is exactly the minimum fair # cuts.
"""
import json
from pathlib import Path

OUTPUT=Path('campaigns/CAM-0002_raw.json')
Q_MIN,Q_MAX=2,7
PER_Q_NODE_LIMIT=2000000

def min_cuts(word,q):
    occurrences=[0]*q
    positions=[]
    for x in word:
        positions.append((x,occurrences[x]));occurrences[x]+=1
    best=2*q-1
    # global complement symmetry: canonical label zero's first occurrence -> 0
    for mask in range(1<<(q-1)):
        old=None; changes=0
        for x,which in positions:
            bit=0 if x==0 else ((mask>>(x-1))&1)
            owner=bit ^ which
            if old is not None and owner!=old: changes+=1
            old=owner
        best=min(best,changes)
    return best

def run_q(q):
    counts=[0]*q; w=[]; examined=0; max_min=-1; sample=None; truncated=False; found=None
    def visit():
        nonlocal examined,max_min,sample,truncated,found
        if found is not None or truncated: return
        if len(w)==2*q:
            if examined>=PER_Q_NODE_LIMIT:
                truncated=True;return
            examined+=1
            cost=min_cuts(w,q)
            if cost>max_min: max_min=cost;sample=''.join(chr(65+x) for x in w)
            if cost>q-1:
                found={'word': ''.join(chr(65+x) for x in w),'minimum_cuts':cost}
            return
        used=max(w,default=-1)+1
        for x in range(min(q,used+1)):
            if counts[x]>=2 or (w and w[-1]==x):continue
            counts[x]+=1;w.append(x);visit();w.pop();counts[x]-=1
            if found is not None or truncated:return
    visit()
    return {'q':q,'checked_canonical_words':examined,'complete':not truncated and found is None,
            'first_counterexample':found,'maximum_minimum_cuts_seen':max_min,'maximizer_sample':sample,
            'node_limit':PER_Q_NODE_LIMIT}

if __name__=='__main__':
    rows=[]
    for q in range(Q_MIN,Q_MAX+1):
        row=run_q(q);rows.append(row)
        print(json.dumps(row),flush=True)
        if row['first_counterexample'] is not None: break
    OUTPUT.parent.mkdir(parents=True,exist_ok=True)
    OUTPUT.write_text(json.dumps({'schema_version':1,'rows':rows},indent=2)+'\n')
