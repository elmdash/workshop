#!/usr/bin/env bash

source lib/vars.sh

is_git_installed () {
	pacman -Qi git &> /dev/null
	return $?
}

require_git () {
	if ! is_git_installed; then
		doas pacman -S --needed --noconfirm git
	fi
}

configure_git () {
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
}

add_git_aliases () {
	cat <<- EOF > $WORKSHOP_DIR/partials/aliases/git.txt
	abbr --add g git
EOF
}

require_git
configure_git
add_git_aliases
