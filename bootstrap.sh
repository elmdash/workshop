#!/usr/bin/env bash

# configure some git stuff
git config pull.ff only

# maintain fresh pacman repositories mirror list 
pacman -S reflector
systemctl enable reflector

# use fish as default shell
pacman -S fish

# create user
useradd -m peter -s /usr/bin/fish
passwd peter
