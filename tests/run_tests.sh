#! /bin/bash
set -e -o pipefail


scenario_name=${1:-default}
ok_ng=${2:-ok}

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
