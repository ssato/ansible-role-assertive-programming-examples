#! /bin/bash
set -e -o pipefail


ok_ng=${1:-ok}
scenario_name=${2:-default}

testsdir=${0%/*}
env_files="$(echo ${testsdir:?}/env_files.d/${ok_ng:?}/*.yml)"

# @param env_file environment file path for molecule
function runner () {
    local env_file=$1

    echo "[Info] env-file=${env_file:?}"
    molecule --env-file ${env_file:?} \
        test --scenario-name ${scenario_name:?}
}


# main
for env_file in ${env_files:?}; do
    if test "x{ok_ng}" = "xok"; then
	runner ${env_file:?}
    else
	# Invert the exit code because this should fail as expected.
	runner ${env_file} && false || :
    fi
done
