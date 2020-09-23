#!/usr/bin/env bash

is_installed () {
  pacman -Qi $i &> /dev/null
  return $?
}

install_git () {
  if [! is_installed 'git']; then
    pacman -S --noconfirm git
  else
    echo "git already installed"
  fi
}

hello () {
  echo "hello"
}

hello
