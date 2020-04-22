#/bin/bash
sudo apt-get update

# Git
sudo apt-get install -y git
git config --global user.name "Adam Allevato"
git config --global user.email "Kukanani@users.noreply.github.com"
git config --global credential.helper 'cache --timeout=3600'

# install fancy git prompt
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

sudo apt-get install -y firefox
# other utilites
sudo apt-get install -y terminator unzip curl gitk vim trash-cli meld tmux wget htop
echo "Now that Terminator is installed, you should manually configure it to allow infinite scrollback and disable scroll-on-output."
# Joplin (notes)
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
# Visual Studio Code
sudo snap install --classic code
# PDF editors
sudo apt-get install -y xournal pdfshuffler
sudo snap install krop
# fun
sudo apt-get install -y lolcat cowsay figlet

# Copy .rc files
cp ~/.screenrc ~/.screenrc.old
ln -s -f ~/.dotfiles/.screenrc ~/.screenrc
cp ~/.vimrc ~/.vimrc.old
ln -s -f ~/.dotfiles/.vimrc ~/.vimrc
# tmux from a repo
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
ln -s -f ~/.tmux/.tmux.conf.local ~/.tmux.conf.local

echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc

echo "Don't forget to run:"
echo ". ~/.bashrc"
