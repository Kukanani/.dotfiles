#/bin/bash
###################################################################
# Git
###################################################################
sudo apt-get update
sudo apt-get install -y git
git config --global user.name "Adam Allevato"
git config --global user.email "Kukanani@users.noreply.github.com"

# install fancy git prompt
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y mercurial terminator unzip sublime-text gitk

echo "Now that Terminator is installed, you should manually configure it to allow infinite scrollback and disable scroll-on-output."
################################################################################
echo "Don't forget to run:"
echo ". ~/.bashrc"
