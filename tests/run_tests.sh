#! /bin/bash
set -e -o pipefail


ok_ng=${1:-ok}
scenario_name=${2:-default}

testsdir=${0%/*}
env_files="$(echo ${testsdir:?}/env_files.d/${ok_ng:?}/*.yml)"

for env_file in ${env_files:?}; do
    echo "[Info] env-file=${env_file:?}"
    if test "x{ok_ng}" = "xok"; then
	molecule --env-file ${env_file:?} \
		test --scenario-name ${scenario_name:?}
    else
	# Invert the exit code because this should fail as expected.
	molecule --env-file ${env_file} \
		converge --scenario-name ${scenario_name:?} \
		&& false || :
    fi
done
