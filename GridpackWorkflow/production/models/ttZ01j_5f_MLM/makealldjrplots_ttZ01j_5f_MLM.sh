#!/bin/sh
QMIN=$1
QMAX=$2
SCRIPT="../../../test/scripts/djr.py"
MODEL="ttZ01j_5f_MLM"

python ${SCRIPT} ${MODEL} /hadoop/cms/store/user/${USER}/mcProduction/RAWSIM/${MODEL} --qcut-range ${QMIN} ${QMAX}
