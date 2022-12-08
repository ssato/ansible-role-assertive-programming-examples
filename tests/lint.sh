#! /bin/bash

set -ex -o pipefail

role_dir=${1:-${0%/*}/..}
cd ${role_dir:?}

yamllint -c molecule/yamllint.cfg .
ansible-lint -c molecule/dot.ansible-lint .
