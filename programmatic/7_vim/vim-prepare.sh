#!/usr/bin/env bash

# via: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	             libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev git

mkdir -p ~/.backup_dotfiles/vim_installation/
cp -r --backup=t ~/.vim ~/.backup_dotfiles/vim_installation/
cp -r --backup=t ~/.vimrc ~/.backup_dotfiles/vim_installation/

# Destroy current vim installation
sudo apt-get remove vim vim-runtime gvim
# Apparently for Ubuntu 12.04 but just in case
sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
