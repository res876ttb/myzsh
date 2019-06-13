#!/bin/bash -e

# backup original tmux configuration
mv $HOME/.zshrc $HOME/.zshrc.$(date "+%Y.%m.%d-%H:%M:%S")

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install oh-my-zsh plugin
cd $HOME/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git

# clone from github
git clone https://github.com/res876ttb/myzsh.git ~/.myzsh
cd ~/.myzsh

# creaet symbolic link to $HOME
mv $HOME/.zshrc $HOME/.zshrc.$(date "+%Y.%m.%d-%H:%M:%S").2
ln -s $PWD/.zshrc $HOME/

zsh
