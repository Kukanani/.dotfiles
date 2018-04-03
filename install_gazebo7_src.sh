#!/bin/bash
NAME=gazebo7_src
if [ -z ${DOTFILE_gazebo7_src_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################

  sudo apt-get remove '.*sdformat.*' '.*ignition-math.*' '.*ignition-msgs.*' '.*ignition-transport.*'

  sudo apt-get install
    build-essential \
    cmake \
    mercurial \
    libprotoc-dev \
    libprotobuf-dev \
    protobuf-compiler \
    python \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-iostreams-dev \
    libtinyxml-dev \
    libxml2-utils \
    ruby-dev \
    ruby \
    ruby-ronn \
    libprotoc-dev \
    libprotobuf-dev \
    protobuf-compiler \
    uuid-dev \
    libzmq3-dev

  hg clone https://bitbucket.org/ignitionrobotics/ign-math
  cd ign-math
  hg up ign-math2
  mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/home/adam/.local .. && make -j7 && sudo make install
  cd ../..

  hg clone https://bitbucket.org/osrf/sdformat
  cd sdformat
  hg up sdf4
  mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/home/adam/.local .. && make -j7 && sudo make install
  cd ../..

  hg clone https://bitbucket.org/ignitionrobotics/ign-msgs
  cd ign-msgs
  hg up ign-msgs0
  mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/home/adam/.local .. && make -j7 && sudo make install
  cd ../..

  hg clone https://bitbucket.org/ignitionrobotics/ign-transport -r ign-transport2
  cd ign-transport
  mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/home/adam/.local .. && make -j7 && sudo make install
  cd ../..

  hg clone https://bitbucket.org/osrf/gazebo gazebo7 -r gazebo7
  cd gazebo7
  mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/home/adam/.local -DENABLE_TESTS_COMPILATION=true -DCMAKE_BUILD_TYPE=Debug .. && make -j7 && sudo make install

  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi