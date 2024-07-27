#!/bin/bash -e

# show warnings
cat << EOF
Welcome using myzsh!
This script will help you creating fancy zsh shell with auto completion features.
Note that the following files will be replaced:
.zshrc, .p10k.zsh, .zimrc, .zlogin
Also, the .zshenv will be modified: being created or adding one line "skip_global_compinit=1"
EOF
read -p "Press enter to continue or ctrl+c to abort:"

# setup environments
which zsh
cwd="$(pwd)"

export ZIM_HOME=$HOME/.zim

rm -rf ~/.myzsh
rm -rf ~/.zim
rm -f ~/.zshrc
rm -f ~/.p10k.zsh
rm -f ~/.zimrc
rm -f ~/.zlogin

# install zim without executing chsh... fool it by setting SHELL to zsh
zsh -c "export SHELL=zsh; $(curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh)"

# clone myzsh
git clone https://github.com/res876ttb/myzsh.git ~/.myzsh
cd ~/.myzsh

# creaet symbolic link to $HOME
rm -f ~/.zshrc
rm -f ~/.zimrc
ln -s $PWD/.zshrc $HOME/
ln -s $PWD/.p10k.zsh $HOME/
ln -s $PWD/.zimrc $HOME/
ln -s $PWD/.zlogin $HOME/

# create customized zsh file
touch $HOME/.zsh_profile

# install powerlevel10k
zsh $HOME/.zim/zimfw.zsh install

# Check whether we have skip_global_compinit in ~/.zshenv
if [ -e "$HOME/.zshenv" ]; then
	if [ "$(grep skip_global_compinit $HOME/.zshenv)" == "" ]; then
		echo "skip_global_compinit=1" >> $HOME/.zshenv
	fi
else
	echo "skip_global_compinit=1" > $HOME/.zshenv
fi

# Launch zsh
cd $cwd
exec zsh
