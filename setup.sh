#!/bin/bash
sudo apt install -y git

cd ~
git clone https://github.com/Kukanani/.dotfiles.git
.dotfiles/install_general.sh
