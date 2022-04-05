#!/bin/bash
sudo apt update
sudo apt install -yq git

cd ~ || exit
git clone git@github.com:Kukanani/.dotfiles.git
.dotfiles/install_general.sh
