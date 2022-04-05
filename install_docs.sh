#!/bin/bash
sudo apt-get update

# Document utilities
sudo apt-get install -y xournal pdfshuffler

# Joplin for taking notes
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# PDF cropper
snap install krop

################################################################################
echo "Don't forget to run:"
echo ". ~/.bashrc"
