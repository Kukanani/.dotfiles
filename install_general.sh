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

# python
python3 -m pip install --user powerline-status
sudo apt install fonts-powerline

# install tmux conf
git clone https://github.com/gpakosz/.tmux.git .tmux

cp .tmux/.tmux.conf.local .

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

# other utilites
sudo apt-get install -y mercurial terminator unzip curl gitk vim trash-cli meld
echo "Now that Terminator is installed, you should manually configure it to allow infinite scrollback and disable scroll-on-output."

# Increase number of filesystem watches to allow for IntelliJ, Sublime etc.
#  to notice file changes more quickly
# See https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf

# Copy .rc files
cp ~/.screenrc ~/.screenrc.old
ln -s -f ~/.dotfiles/.screenrc ~/.screenrc
cp ~/.vimrc ~/.vimrc.old
ln -s -f ~/.dotfiles/.vimrc ~/.vimrc
ln -s -f ~/.dotfiles/.tmux.conf ~/.tmux.conf

echo "source ~/.dotfiles/bash/general.bash" >> ~/.bashrc
################################################################################
echo "Don't forget to run:"
echo ". ~/.bashrc"
