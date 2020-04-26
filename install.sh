#!/bin/bash -e

which zsh

# backup original tmux configuration
if [ -f $HOME/.zshrc ]; then
  mv $HOME/.zshrc $HOME/.zshrc.$(date "+%Y.%m.%d-%H:%M:%S")
fi

rm -rf ~/.myzsh
rm -rf ~/.zim

# install oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# clone from github
git clone https://github.com/res876ttb/myzsh.git ~/.myzsh
cd ~/.myzsh

# Backup original script
if [ -f $HOME/.zshrc ]; then
  mv $HOME/.zshrc $HOME/.zshrc.$(date "+%Y.%m.%d-%H:%M:%S")
fi
if [ -f $HOME/.p10k.zsh ]; then
  mv $HOME/.p10k.zsh $HOME/.p10k.zsh.$(date "+%Y.%m.%d-%H:%M:%S")
fi
if [ -f $HOME/.zimrc ]; then
  mv $HOME/.zimrc $HOME/.zimrc.$(date "+%Y.%m.%d-%H:%M:%S")
fi
if [ -f $HOME/.zlogin ]; then
  mv $HOME/.zlogin $HOME/.zlogin.$(date "+%Y.%m.%d-%H:%M:%S")
fi

# creaet symbolic link to $HOME
ln -s $PWD/.zshrc $HOME/
ln -s $PWD/.p10k.zsh $HOME/
ln -s $PWD/.zimrc $HOME/
ln -s $PWD/.zlogin $HOME/

touch $HOME/.zsh_profile

# install powerlevel10k
zsh $HOME/.zim/zimfw.zsh install

exec zsh
