#!/bin/bash
NAME=indigo
if [ -z ${DOTFILE_indigo_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  echo "Installation method via http://wiki.ros.org/indigo/Installation/Ubuntu"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
  sudo apt update
  sudo apt install ros-indigo-desktop-full
  sudo rosdep init
  rosdep update

# additional stuff

  sudo apt install python-catkin-tools

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/indigo.bash" >> ~/.bashrc
################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi