#! /bin/bash
set -ex -o pipefail


scenario_name=${1:-default}
success_cases="
00_default
10_do_more_advanced_checks
"

for gdir in ${success_cases:?}; do
    # It's relative to molecule/default/group_vars.d/.
    g_reldir=${gdir}

    _GROUP_VARS_DIR=${g_reldir:?} molecule test --scenario-name ${scenario_name:?}
done
