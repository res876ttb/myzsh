#!/bin/bash -e

which zsh

# backup original tmux configuration
mv $HOME/.zshrc $HOME/.zshrc.$(date "+%Y.%m.%d-%H:%M:%S")

# install oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# clone from github
git clone https://github.com/res876ttb/myzsh.git ~/.myzsh
cd ~/.myzsh

# Backup original script
mv $HOME/.zshrc $HOME/.zshrc.$(date "+%Y.%m.%d-%H:%M:%S")
mv $HOME/.p10k.zsh $HOME/.p10k.zsh.$(date "+%Y.%m.%d-%H:%M:%S")
mv $HOME/.zimrc $HOME/.zimrc.$(date "+%Y.%m.%d-%H:%M:%S")

# creaet symbolic link to $HOME
ln -s $PWD/.zshrc $HOME/
ln -s $PWD/.p10k.zsh $HOME/
ln -s $PWD/.zimrc $HOME/

touch $HOME/.zsh_profile

# install powerlevel10k
zsh $HOME/.zim/zimfw.zsh install

exec zsh
