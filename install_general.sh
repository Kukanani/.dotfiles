#!/bin/bash
NAME=general
if [ -z ${DOTFILE_general_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################

  sudo apt install git gitk mercurial terminator

  # install sublime
  sudo add-apt-repository ppa:webupd8team/sublime-text-3
  sudo apt update
  sudo apt install sublime-text-installer

  # install fancy git prompt
  cd ~
  git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc

  echo "Now that Terminator is installed, you should manually configure it to allow infinite scrollback and disable scroll-on-output."
################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi