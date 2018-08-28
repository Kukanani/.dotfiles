#!/bin/bash
NAME=steam
if [ -z ${DOTFILE_steam_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  echo "Installation method via https://askubuntu.com/questions/257084/how-do-i-install-steam-on-a-64bit-system"

  sudo dpkg --add-architecture i386
  sudo apt update
  sudo apt install steam

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi