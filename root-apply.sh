#!/usr/bin/env bash

WORKSHOP_DIR=$(realpath $(dirname "$0"))

cd $WORKSHOP_DIR

source lib/funcs.sh

#### REFLECTOR
#########################################################

require_root_pkg reflector
cp confs/reflector.conf /etc/xdg/reflector/reflector.conf
systemctl start reflector
systemctl enable reflector.service
systemctl enable reflector.timer


#### DOAS
#########################################################

require_root_pkg opendoas
cp confs/doas.conf /etc/doas.conf


#### MY ACCOUNT
#########################################################

# just create account with fish shell from the start
require_root_pkg fish
useradd -m peter -s /usr/bin/fish
passwd peter
usermod -aG wheel peter

# copy these configs in since they're needed to start X
mkdir -p /home/peter/.configs/fish
cp confs/config.fish /home/peter/.configs/fish/config.fish
chown -R peter:peter /home/peter
rm -rf /home/peter/.bash*

# xmonad needs a default terminal, we're going to install that now
require_root_pkg ttf-fira-code
require_root_pkg alacritty

# other user configs are created when logged in as peter


#### XMONAD
#########################################################

require_root_pkg xorg-server
require_root_pkg xorg-xinit
require_root_pkg xmonad
require_root_pkg xmonad-contrib
mkdir /home/peter/.xmonad
cp confs/xmonad.hs /home/peter/.xmonad/
chown -R peter:peter /home/peter/.xmonad
