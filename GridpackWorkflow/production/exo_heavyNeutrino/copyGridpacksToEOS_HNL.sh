#!/bin/sh
GRIDPACKDIR=/hadoop/cms/store/user/${USER}/mcProduction/GRIDPACKS
PROC="HeavyNeutrino_trilepton"
PARTM="_M-"
PARTFL="_V-0.01_"
PARTNLO="_NLO"
genprodir="/home/users/lshchuts/CMSSW_7_1_25_patch1/src/Configuration/GenProduction"
vomsdir="/tmp/x509up_u31605"

for M in 1 2 5 10 20 30 40 50 60 80 100 130 150 200 400 600 800 1000; do
    for FL in "e" "mu" "tau" "2l" "3l"; do
        MSTR=${M/./p}
        FLSTR=${FL/./p}
        MODEL=${PROC}${PARTM}${MSTR}${PARTFL}${FLSTR}${PARTNLO}
        echo "Copying ${GRIDPACKDIR}/${MODEL}/${MODEL}_tarball.tar.xz to the following directory on EOS:"
        echo "/store/group/phys_generator/cvmfs/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.4.2/HeavyNeutrino_trilepton/v1/${MODEL}_tarball.tar.xz"
        xrdcp ${GRIDPACKDIR}/${MODEL}/${MODEL}_tarball.tar.xz root://eoscms.cern.ch///eos/cms/store/group/phys_generator/cvmfs/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.4.2/HeavyNeutrino_trilepton/v1/${MODEL}_tarball.tar.xz
    done
done
