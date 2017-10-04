#!/bin/bash
NAME=cuda
if [ -z ${DOTFILE_cuda_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  echo "CUDA and CUDNN have to be installed manually. Get it from NVIDIA."
  read -p "Press any key..."

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  echo "source ~/.dotfiles/bash/cuda.bash" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi