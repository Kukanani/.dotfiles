#!/bin/bash
NAME=fun
if [ -z ${DOTFILE_fun_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  sudo apt update
  sudo apt install figlet lolcat sl cowsay

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi