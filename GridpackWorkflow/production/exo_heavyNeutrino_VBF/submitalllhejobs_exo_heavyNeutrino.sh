#!/bin/sh
SCRIPT="../../test/scripts/submitLHECondorJob.py"
PROC="HeavyNeutrino_VBF_trilepton"
PARTM="_M-"
PARTFL="_V-0.01_"
PARTNLO="_NLO"
genprodir="/home/users/lshchuts/CMSSW_7_1_25_patch1/src/Configuration/GenProduction"
vomsdir="/tmp/x509up_u31605"
#for M in 80 100 130 150 200 400 600 800 1000; do
for M in 80; do
#    for FL in "e" "mu" "tau" "2l" "3l"; do
    for FL in "e"; do
        MSTR=${M/./p}
        FLSTR=${FL/./p}
        MODEL=${PROC}${PARTM}${MSTR}${PARTFL}${FLSTR}${PARTNLO}
        python ${SCRIPT} ${MODEL} --in-file /hadoop/cms/store/user/${USER}/mcProduction/GRIDPACKS/${MODEL}/${MODEL}_tarball.tar.xz --proxy ${vomsdir} --nevents 25000 --njobs 5
    done
done
