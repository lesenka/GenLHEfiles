#!/bin/sh
SCRIPT="../../../test/scripts/submitLHECondorJob.py"
MODEL="ttll_M-1to10_lo_01j"

python ${SCRIPT} --in-file /hadoop/cms/store/user/${USER}/mcProduction/GRIDPACKS/${MODEL}/${MODEL}$_tarball.tar.xz --nevents 1000 --njobs 50 --proxy /tmp/x509up_u31605 ${MODEL} 
