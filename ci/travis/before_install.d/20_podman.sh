#! /bin/bash
# .. seealso::
#    - https://github.com/junaruga/podman-experiment/blob/master/.travis.yml
#    - https://travis-ci.community/t/podman-libpod-support/6823/6
#    - https://podman.io/getting-started/installation.html
#
set -ex

sudo sh -c "echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_18.04/Release.key | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get -qq -y install podman

# Show version and info.
podman --version
podman version
podman info --debug
podman pull docker.io/pycontribs/centos:8
apt-cache show podman
dpkg-query -L podman

# Hack podman's configuration files.
# /etc/containers/registries.conf does not exist.
# https://clouding.io/kb/en/how-to-install-and-use-podman-on-ubuntu-18-04/
ls -1 /etc/containers/registries.conf || true
sudo mkdir -p /etc/containers
echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | sudo tee /etc/containers/registries.conf

# vim:sw=2:ts=2:et:
