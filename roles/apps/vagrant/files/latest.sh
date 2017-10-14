#!/usr/bin/env bash

VERSION=$(wget "https://releases.hashicorp.com/vagrant" -qO- | grep -o '/vagrant/\([0-9.]\+\)' | head -n1 | grep -o [0-9.]*)
echo "https://releases.hashicorp.com/vagrant/${VERSION}/vagrant_${VERSION}_x86_64.deb"