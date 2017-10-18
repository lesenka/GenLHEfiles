SCRIPT="../../../test/scripts/submitPythiaCondorJob.py"
MODEL="ttZ01j_5f_MLM"

python ${SCRIPT} --in-dir /hadoop/cms/store/user/lshchuts/mcProduction/LHE/${MODEL} --slha ttZ.slha --qcut-range 20 25 --qcut-step 1 --proxy /tmp/x509up_u31605 --executable runPythiaJobTTZ.sh ${MODEL}
