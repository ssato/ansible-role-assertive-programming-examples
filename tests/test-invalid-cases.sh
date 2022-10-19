#! /bin/bash
set -ex -o pipefail


scenario_name=${1:-default}
invalid_group_vars_topdir=${0%/*}/../molecule/default/group_vars.d/invalids.d/
invalid_group_vars_dirs="
${invalid_group_vars_topdir:?}/*_types
${invalid_group_vars_topdir:?}/*_values
"

for gdir in ${invalid_group_vars_dirs:?}; do
    # It's relative to molecule/default/group_vars.d/.
    g_reldir=invalids.d/${gdir##*/}

    # Invert the exit status code as this should fail as expected.
    _GROUP_VARS_DIR=${g_reldir:?} molecule converge --scenario-name ${scenario_name:?} && false || :
done