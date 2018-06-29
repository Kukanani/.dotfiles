#!/bin/bash
sudo apt update
sudo apt install -yq git

cd ~
git clone https://github.com/Kukanani/.dotfiles.git
.dotfiles/install_general.sh
