#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install -y git

cd ~
git clone https://github.com/Kukanani/.dotfiles.git
.dotfiles/install_general.sh
