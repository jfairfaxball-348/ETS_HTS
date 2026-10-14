# CAM-0008/9 exact bounded observations (summary; originals detached)

Preregistered scripts frozen *before* run. Python 3.13.5, stdlib exact fractions, Linux. CAM-0008 original script SHA256 `e66472b91802b66ed8333f13a53edf7d52bd561c42277207dced8bf974f209ef`; prereg SHA256 `0fad246c65634ef64a43995cbabb3286c359acc5586a86f6722d4683142f87e3`. Deterministic RNG seed 20261014; 2,000 exact rational parameter sets at each of 18 aspect/size cells (36,000 total), m sampled without replacement from [-300,300], t=m/32, x=(a/b)*2t/(1+t²), y=(1−t²)/(1+t²).

| Aspect a:b | n4 no-ear | n5 no-ear | n6 no-ear |
|---|---:|---:|---:|
| 1:1 | 0 | 0 | 0 |
| 51:50 | 0 | 0 | 0 |
| 6:5 | 0 | 0 | 0 |
| 2:1 | 0 | 0 | 0 |
| 5:1 | 0 | 2 | 1 |
| 20:1 | 0 | 1 | 2 |

First aspect5,n5 no-ear parameters m=(-194,3,25,217,257), trial index284 (0-based), found after prereg. Other first witnesses: aspect5,n6 m=(-193,-167,-57,-6,32,296) index1014; aspect20,n5 m=(-225,-89,-88,-72,-12) index262; aspect20,n6 m=(-131,1,2,37,205,261) index191. No test covers all configurations of any n or aspect.

CAM-0009 independent code SHA256 `f2d4b00915943afd8cecf8c118fbc67205afb8cba490fa095b0282643168ceaf`; prereg SHA256 `bd07215305c1cf45878e53f282ff035871ed84ddbf5f26f6560fe4d11e953320`. Independent exact rational verifier checks convexity and all 120 complete arrival graphs by orientation-sign segment crossings; **120/120 have proper crossing, minimum 1**, all five sites have incorrect two-nearest hull-ear pair, strict rank2<rank3. Separate 100,000 deterministic integer-parabola quintuple samples seed16009 range[-60,60] yielded zero no-ear sample, finite only.

**ARCHIVE BLOCKER:** original full raw files, code and prereg JSON are available in detached owner-downloadable `S016_frozen_CAM0008_0009.tar.gz` with SHA256 `f30f4fbed674e26c7be26f434a915fd5062ac08f6c6d18d1c98d5a460640cb35` and not yet copied to GitHub. This MD is a faithful subset of actual observed output, NOT a substitute for original raw/histograms. Do not claim complete in-repo scientific computation closeout.
