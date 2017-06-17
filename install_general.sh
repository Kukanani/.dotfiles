#!/bin/bash
NAME=general
if [ -z ${DOTFILE_general_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################

  sudo apt install git gitk mercurial terminator

  cd ~
  # install fancy git prompt
  git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi