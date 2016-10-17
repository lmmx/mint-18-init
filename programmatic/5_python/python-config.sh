#!/usr/bin/env bash

#-via-@Dean
#-..via-url:https://benevolentai.slack.com/archives/D2DKAJ7EH/p1475658948000010
#-.,changed to Python 3 libraries (given old Python 2 libraries)

pip3 install --upgrade pip

sudo pip3 install --upgrade autopep8

cd ~/Downloads
wget -O vim-autopep8 https://github.com/tell-k/vim-autopep8/archive/master.zip
mkdir -p ~/.vim/bundle ~/.vim/plugin
mv vim-autopep8-master ~/.vim/bundle/vim-autopep8
ln -s ~/.vim/bundle/vim-autopep8/ftplugin/python_autopep8.vim ~/.vim/plugin/python_autopep8.vim
