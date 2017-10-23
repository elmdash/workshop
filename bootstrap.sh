#!/usr/bin/env bash

sudo add-apt-repository ppa:ansible/ansible
sudo apt update
sudo apt upgrade
sudo apt install git ansible aptitude
mkdir -p ~/Projects/ElmDash
git clone https://github.com/elmdash/workshop.git ~/Projects/ElmDash/workshop
