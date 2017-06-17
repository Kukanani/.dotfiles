#!/bin/bash
NAME=kinetic
if [ -z ${DOTFILE_kinetic_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
# from http://wiki.ros.org/kinetic/Installation/Ubuntu

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
  sudo apt-get update
  sudo apt-get install ros-kinetic-desktop-full
  sudo rosdep init
  rosdep update
  sudo apt-get install python-rosinstall

  echo >> .bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/ros.bash" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi