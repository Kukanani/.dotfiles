#!/bin/bash
sudo apt-get update

# Git
sudo apt-get install -y git
git config --global user.name "Adam Allevato"
git config --global user.email "Kukanani@users.noreply.github.com"
git config --global credential.helper 'cache --timeout=3600'

# install fancy git prompt
cd ~ || exit
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

sudo apt-get install -y firefox

# basic utilites
sudo apt-get install -yq \
    curl \
    flameshot \
    gitk \
    htop \
    meld \
    peek \
    terminator \
    tmux \
    trash-cli \
    unzip \
    vim \
    vlc \
    wget \
    xclip \
;

# Joplin (notes)
# https://joplinapp.org/help/#desktop-applications
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# Visual Studio Code
# https://code.visualstudio.com/docs/setup/linux
sudo snap install --classic code
# ...and extensions
# shellcheck disable=2162
while read e; do
    code --install-extension "$e"
done <~/.dotfiles/vs-extensions.txt

# GitHub CLI
# https://github.com/cli/cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# PDF editors
sudo apt-get install -y xournal pdfshuffler
sudo snap install krop
# fun
sudo apt-get install -y lolcat cowsay figlet

# Copy .rc files
cp ~/.screenrc ~/.screenrc.old
ln -s -f ~/.dotfiles/.screenrc ~/.screenrc
cp ~/.vimrc ~/.vimrc.old
ln -s -f ~/.dotfiles/.vimrc ~/.vimrc
cp ~/.emacs ~/.emacs.old
ln -s -f ~/.dotfiles/.emacs ~/.emacs
cp -R ~/.config/terminator ~/.config/terminator.old
ln -s -f ~/.dotfiles/.terminator_config ~/.config/terminator

# tmux from a repo
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
ln -s -f ~/.tmux/.tmux.conf.local ~/.tmux.conf.local

# eternal bash history setup - comment out lines that shrink history in bashrc
sed -i 's/HISTSIZE/# HISTSIZE/; s/HISTFILESIZE/# HISTFILESIZE/' ~/.bashrc

echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc

echo "Don't forget to run:"
echo ". ~/.bashrc"

# Basic quality-of-life GNOME improvements

# don't show windows that are in one workspace in another workspace's Dock
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
# When using the alt-` switcher, don't show apps on other workspaces
# Note: The alt-tab switcher already isolates properly without any settings changes
gsettings set org.gnome.shell.app-switcher current-workspace-only true
