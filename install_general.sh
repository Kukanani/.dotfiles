#!/bin/bash
NAME=general
if [ -z ${DOTFILE_general_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################

sudo apt update
###################################################################
# Git
###################################################################

sudo apt install git gitk
git config --global user.name "Adam Allevato"
git config --global user.email "Kukanani@users.noreply.github.com"

# install fancy git prompt
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

sudo apt install mercurial terminator unzip sublime-text

# install GIF screen capture program
# PPAs do not exist on 14 or below. Use silentcast (https://github.com/colinkeenan/silentcast)
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

echo >> ~/.bashrc
echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc

echo "Now that Terminator is installed, you should manually configure it to allow infinite scrollback and disable scroll-on-output."
echo "Now that Git is installed, you should generated and register ssh keys by following the instructions at"
echo "https://help.github.com/articles/generating-ssh-keys/"
################################################################################
echo "Finished installing $NAME"
echo "Don't forget to run:"
echo ". ~/.bashrc"
else
echo "$NAME is already installed."
fi