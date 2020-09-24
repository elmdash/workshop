#!/usr/bin/env bash

WORKSHOP_DIR=$(realpath $(dirname "$0"))

cd $WORKSHOP_DIR

source lib/funcs.sh

#### REFLECTOR
#########################################################

require_root_pkg reflector
cp confs/reflector.conf /etc/xdg/reflector/reflector.conf
systemctl enable reflector.service
systemctl enable reflector.timer

