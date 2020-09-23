#!/usr/bin/env bash

is_installed () {
  pacman -Qi $i &> /dev/null
  return $?
}

install_git () {
  if [! is_installed 'git']; then
    pacman -S --noconfirm git
  elif
    echo "git already installed"
  fi
}