#!/usr/bin/env bash

WORKSHOP_DIR=$(realpath $(dirname "$0"))

cd $WORKSHOP_DIR

source lib/funcs.sh


#### ENVIRONMENT
#########################################################
cp confs/.pam_enviroment ~/.pam_environment


#### UTILS
#########################################################

require_pkg man-db
require_pkg which
require_pkg alsa-utils


#### FIREFOX
#########################################################

require_pkg noto-fonts # optoinal font choice, could be something else
require_pkg firefox-developer-edition


#### GIT
#########################################################

require_pkg git
git config --global user.email "peter.sooley@gmail.com"
git config --global user.name "Peter Sooley"
git config --global pull.ff only
git config --global push.followTags true
git config --global core.fileMode false
git config --global push.default simple
git config --global color.ui true
git config --global format.pretty oneline
git config --global alias.co checkout
git config --global alias.s status
git config --global alias.d diff
git config --global alias.cm "commit -m"
git config --global alias.ca "commit -am"
git config --global alias.pl pull
git config --global alias.pu push
git config --global alias.a add
git config --global alias.l "log --oneline -n20"
git config --global alias.aa "commit --amend"
git config --global alias.sb "show-branch"
git config --global alias.subdate '!git submodule update --init --recursive'
git config --global alias.mote '!git fetch --all && git show-branch $(git rev-parse --abbrev-ref HEAD) origin/$(git rev-parse --abbrev-ref HEAD)'


#### ALACRITTY
#########################################################

# alacritty wont start unless at least one font exists on the system
require_pkg ttf-fira-code
require_pkg alacritty


#### NEOVIM
#########################################################

require_pkg neovim

