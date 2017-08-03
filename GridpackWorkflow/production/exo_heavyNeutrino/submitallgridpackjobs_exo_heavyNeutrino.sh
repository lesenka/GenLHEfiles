#!/bin/sh
SCRIPT="../../test/scripts/submitGridpackCondorJob.py"
JOBS="jobs"
PROC="HeavyNeutrino_trilepton"
PARTM="_M-"
PARTFL="_V-0.01_"
PARTNLO="_NLO"
genprodir="/home/users/lshchuts/CMSSW_7_1_25_patch1/src/Configuration/GenProduction"
vomsdir="/tmp/x509up_u31605"

for M in 1 2 5 10 20 30 40 50 60 80 100 130 150 200 400 600 800 1000; do
#    for FL in "e" "mu" "tau" "2l" "3l"; do
    for FL in "tau"; do
        MSTR=${M/./p}
        FLSTR=${FL/./p}
        MODEL=${PROC}${PARTM}${MSTR}${PARTFL}${FLSTR}${PARTNLO}
        python ${SCRIPT} ${MODEL} --cards-dir ${JOBS}/${MODEL} --proxy ${vomsdir} --genproductions-dir ${genprodir}
    done
done
