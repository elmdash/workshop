#!/usr/bin/env bash

require_root_pkg () {
	pacman -Qi $1 &> /dev/null
	if [ $? -ne 0 ]; then
		pacman -S --noconfirm $1
	fi
}

require_pkg () {
	pacman -Qi $1 &> /dev/null
	if [ $? -ne 0 ]; then
		doas pacman -S --noconfirm $1
	fi
}
