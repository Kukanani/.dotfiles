#!/bin/bash
NAME=graphics
if [ -z ${DOTFILE_graphics_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################

  sudo apt install inkscape gimp blender openshot

  echo >> ~/.bashrc
  echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
  # echo "source ~/.dotfiles/bash/graphics.bash" >> ~/.bashrc

################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi