#!/bin/bash
NAME=adept
if [ -z ${DOTFILE_adept_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  echo "Installation method via https://wikis.utexas.edu/display/NRG/Installing+Adept+Software"

  cd /tmp
  wget --user=utaust --password=PxW5gcc= http://robots.mobilerobots.com/ARIA/download/current/libaria_2.9.1+ubuntu16_amd64.deb
  sleep 1
  sudo dpkg -i ./libaria_2.9.1+ubuntu16_amd64.deb && sudo apt install -f

  wget --user=utaust --password=PxW5gcc= http://robots.mobilerobots.com/BaseArnl/download/current/arnl-base_1.9.2+ubuntu16_amd64.deb
  sleep 1
  sudo dpkg -i ./arnl-base_1.9.2+ubuntu16_amd64.deb && sudo apt install -f

  wget --user=utaust --password=PxW5gcc= http://robots.mobilerobots.com/ARNL/download/current/libarnl_1.9.2+ubuntu16_amd64.deb
  sleep 1
  sudo dpkg -i ./libarnl_1.9.2+ubuntu16_amd64.deb && sudo apt install -f
################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi