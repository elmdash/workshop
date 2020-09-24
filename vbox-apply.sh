#!/usr/bin/env bash

WORKSHOP_DIR=$(realpath $(dirname "$0"))

cd $WORKSHOP_DIR

require_pkg virtualbox-guest-utils
doas systemctl start vboxservice
doas systemctl enable vboxservice
VBoxClient-all
