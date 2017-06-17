#!/bin/bash
NAME=python
if [ -z ${DOTFILE_python_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################

  sudo apt python3 virtualenv virtualenvwrapper

  echo >> .bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/python.bash" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi