#/bin/bash
sudo apt-get update

###################################################################
# Git
###################################################################
sudo apt-get install -y git
git config --global user.name "Adam Allevato"
git config --global user.email "Kukanani@users.noreply.github.com"
git config --global credential.helper 'cache --timeout=3600'

# install fancy git prompt
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

# other utilites
sudo apt-get install -y mercurial unzip curl

echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc
################################################################################
echo "Don't forget to run:"
echo ". ~/.bashrc"
