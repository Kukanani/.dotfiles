#!/bin/bash

# preauth sudo
sudo -v

# Set up SSH keys and Git
echo "Create SSH key"
echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
read -r "press enter when done"

echo "Add SSH key to GitHub"
echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account"
read -r "press enter when done"

echo "Add SSH key to GitLab"
echo "https://docs.gitlab.com/ee/user/ssh.html#add-an-ssh-key-to-your-gitlab-account"
read -r "press enter when done"

# Git
sudo apt-get update
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
    direnv \
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

# GitHub CLI
# https://github.com/cli/cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# PDF editors
sudo apt-get install -yq xournal pdfshuffler
sudo snap install krop
# fun
sudo apt-get install -yq lolcat cowsay figlet

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

## Remove pointless folders
rm -rf ~/Videos
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Music
rm -rf ~/Public

# Increase inotify limit for large file systems etc. See:
# https://askubuntu.com/questions/1088272/inotify-add-watch-failed-no-space-left-on-device
echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# Basic quality-of-life GNOME improvements

# load gnome extensions
# if you want to save your current extensions to this repo, run:
# cp -R ~/.local/share/gnome-shell/extensions ~/.dotfiles/.local/share/gnome-shell
mkdir -p ~/.local/share/gnome-shell/extensions
cp -R ~/.dotfiles/.local/share/gnome-shell/extensions ~/.local/share/gnome-shell

# load gnome settings
# if you want to save your current settings to this repo, run:
# dconf dump / > ~/.dotfiles/saved_settings.dconf
dconf load / < ~/.dotfiles/saved_settings.dconf

# OnePassword
# from https://support.1password.com/install-linux/
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password
