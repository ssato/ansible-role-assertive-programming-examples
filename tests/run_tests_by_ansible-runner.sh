#! /bin/bash
set -e -o pipefail


testsdir=${0%/*}

ok_ng=${1:-ok}
ee_image=${2:-quay.io/ansible/awx-ee:latest}

project_dirs=${testsdir:?}/projects.d/${ok_ng}/*

# @param project_dir  project dir where playbook and test data exist
function run_ansible_runner () {
    local project_dir=$1

    echo "[Info] project dir: ${project_dir}"
    ansible-runner run ${project_dir} \
        --playbook converge.yml \
        --container-image ${ee_image} \
        --rotate-artifacts 1 \
        --omit-event-data \
        --only-failed-event-data \
        --omit-env-files
}


# main
podman pull ${ee_image} || docker pull ${ee_image}

if test "${ok_ng:?}" = "ok"; then
    for prj_dir in ${project_dirs:?}; do
        run_ansible_runner ${prj_dir}
    done
else
    for prj_dir in ${project_dirs:?}; do
        # Invert the exit code because this should fail as expected.
        run_ansible_runner ${prj_dir} && false || :
    done
fi
