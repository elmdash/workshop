#!/usr/bin/env bash

is_installed () {
	pacman -Qi $1 &> /dev/null
	return $?
}

require_doas () {
	if ! is_installed opendoas; then
		pacman -S opendoas
	else 
		echo "already installed"
	fi
}




require_doas


