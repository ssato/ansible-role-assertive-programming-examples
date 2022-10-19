#! /bin/bash
set -ex -o pipefail


scenario_name=${1:-default}
ok_ng=${2:-ok}

testsdir=${0%/*}
gdirs="$(echo ${testsdir:?}/group_vars.d/${ok_ng:?}/*)"

for gdir in ${gdirs:?}; do
    # It's relative to tests/group_vars.d/.
    g_reldir=${ok_ng}/${gdir##*/}

    if test "x{ok_ng}" = "xok"; then
        _GROUP_VARS_DIR=${g_reldir:?} \
		molecule test --scenario-name ${scenario_name:?}
    else
	# Invert the exit code because this should fail as expected.
	_GROUP_VARS_DIR=${g_reldir:?} \
		molecule converge --scenario-name ${scenario_name:?} \
		&& false || :
    fi
done
