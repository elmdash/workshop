#!/usr/bin/env bash

sudo apt update
sudo apt upgrade
sudo apt install git ansible aptitude
mkdir -p ~/projects/elmdash
git clone https://psoots@bitbucket.org/elmdash/workshop.git projects/elmdash/workshop
