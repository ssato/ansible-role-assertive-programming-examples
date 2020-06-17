#! /bin/bash
set -ex

selfdir=${0%/*}

for f in ${selfdir:?}/before_install.d/*.sh; do bash -ex $f; done

# vim:sw=2:ts=2:et:
