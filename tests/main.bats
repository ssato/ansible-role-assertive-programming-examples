#! /usr/bin/bats
#
# Requirements:
#   - bats: https://github.com/sstephenson/bats
#
function setup () {
    export INVENTORY=${1:-hosts}
    cd $BATS_TEST_DIRNAME
}

function test_success () {
    [[ ${status} -eq 0 ]] || {
        cat << EOM
output:
${output}
EOM
        exit ${status}
    }
}

function test_failure () {
    [[ ${status} -ne 0 ]] || {
        cat << EOM
output:
${output}
EOM
        exit ${status}
    }
}

@test "Lint all yaml files" {
    run yamllint --strict -c yamllint.cfg .
    test_success
}

@test "Check styles of all playbook files" {
    run ansible-lint -x 303 -c dot.ansible-lint playbook.yml
    test_success
}

@test "Test applying the role using invalid type data" {
    for f in res/invalid_types_*.yml; do \
        echo "# ${f}"
        run ansible-playbook -v -i ${INVENTORY} playbook.yml -e @${f}
        test_failure
    done
}

@test "Test applying the role using invalid value data" {
    for f in res/invalid_value_*.yml; do \
        echo "# ${f}"
        run ansible-playbook -v -i ${INVENTORY} playbook.yml -e @${f}
        test_failure
    done
}

@test "Test applying the role" {
    run ansible-playbook -v -i ${INVENTORY} playbook.yml
    test_success
}

@test "Test applying the role, doing more complex checks" {
    run ansible-playbook -v -i ${INVENTORY} playbook.yml -e @res/do_more_complex_checks.yml
    test_success
}

# vim:sw=4:ts=4:et:filetype=sh:
