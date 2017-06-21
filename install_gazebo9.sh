#!/bin/bash
NAME=gazebo9
if [ -z ${DOTFILE_cuda_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  cd ~
  mkdir osrf
  cd osrf
  hg clone https://bitbucket.org/osrf/gazebo
  cd gazebo
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=~/.local
  make && sudo make install
  cd ..

  hg clone https://bitbucket.org/osrf/gazebo_models
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=~/.local
  make && sudo make install
  cd ..

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/gazebo9.bash" >> ~/.bashrc
################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi