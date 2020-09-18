#!/usr/bin/env bash

# maintain fresh pacman repositories mirror list 
pacman -S --needed reflector
systemctl enable reflector

# use fish as default shell
pacman -S --needed fish

# setup sudo
pacman -S --needed sudo

# create user
useradd -m peter -s /usr/bin/fish
passwd peter


