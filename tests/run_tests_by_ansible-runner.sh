#! /bin/bash
set -e -o pipefail


ok_ng=${1:-ok}

testsdir=${0%/*}

if test "${ok_ng:?}" = "ok"; then
    for project_dir in projects.d/${ok_ng}/*; do
        echo "[Info] dir=${project_dir}"
        ansible-runner run ${project_dir} -p converge.yml
    done
else
    for project_dir in projects.d/${ok_ng}/*; do
        echo "[Info] dir=${project_dir}"
        # Invert the exit code because this should fail as expected.
        ansible-runner run ${project_dir} -p converge.yml && false || :
    done
fi
