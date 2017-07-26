#!/usr/bin/env python

### Script to define scan grid

### Authors:
### Manuel Franco Sevilla
### Ana Ovcharova

import os,sys,math
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from grid_utils import *

# Parameters that define the grid in the bulk and diagonal
class gridBlock:
  def __init__(self, xmin, xmax, xstep, ystep):
    self.xmin = xmin
    self.xmax = xmax
    self.xstep = xstep
    self.ystep = ystep
    
model = "TChiWZ"
process = "C1N2"

# Number of events: min(goalLumi*xsec, maxEvents) (always in thousands)
minEvents, maxEvents = 20, 1000
xdiagStep, ydiagStep = 25, 10
minDM, maxDM = 10, 50

scanBlocks = []
scanBlocks.append(gridBlock(100,  301, 25, 10)) #Using only [x,y]diagStep
ymin, ymax = 0, 300 

extras = range(3,8,2)


# Number of events for mass point, in thousands
def events(dm):
  if dm<=40: return 100
  else: return 50

# -------------------------------
#    Constructing grid

mpoints = []
Ndiag = 0
xmin, xmax = 9999, 0
for block in scanBlocks:
  for mx in range(block.xmin, block.xmax, xdiagStep):
    xmin = min(block.xmin, xmin)
    xmax = min(block.xmin, xmax)
    for my in range(mx-maxDM, mx-minDM+1, ydiagStep):
      if my > ymax: continue
      nev = events(mx-my)
      Ndiag += nev
      mpoints.append([mx,my, nev])
    for ydm in extras:
      nev = events(ydm)
      if (mx-ydm <= ymax) and (mx-ydm>=0): mpoints.append([mx,mx-ydm, nev])

## Test print out for repeated points
mset = set()
for mp in mpoints: mset.add(mp[0]*10000+mp[1]+mp[2]*13)
Ntot, Ndiff = len(mpoints), len(mset)
if Ntot==Ndiff: print "\nGrid contains "+str(Ntot)+" mass points. No duplicates\n"
else: print "\n\nGRID CONTAINS "+str(Ntot-Ndiff)+" DUPLICATE POINTS!!\n\n"

# -------------------------------
#     Plotting and printing

makePlot([mpoints], 'events', model, process, xmin, xmax, ymin, ymax)
Ntot = makePlot([mpoints], 'lumi', model, process, xmin, xmax, ymin, ymax)
#makePlot(cols, 'factor')

print '\nScan contains '+"{0:,.0f}".format(Ntot*1e3)+" events\n"
print 'Average matching efficiency (for McM and GEN fragment) = '+"{0:.3f}".format(getAveEff(mpoints,process))
print

print
