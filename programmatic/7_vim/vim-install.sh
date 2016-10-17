#!/usr/bin/env bash

# via: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install

mkdir -p ~/.backup_dotfiles/vim_installation/
cp -r --backup=t ~/.vim ~/.backup_dotfiles/vim_installation/
cp -r --backup=t ~/.vimrc ~/.backup_dotfiles/vim_installation/

# Destroy current vim installation
sudo apt-get remove vim vim-runtime gvim
# Apparently for Ubuntu 12.04 but just in case
sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

echo "Done. For further help see $GH_HELP_URL :" >&2
echo " - 'Double check that you are in fact running the new Vim binary by looking at the output of vim --version;" >&2
echo " - 'If you don't get gvim working (on ubuntu 12.04.1 LTS), try changing --enable-gui=gtk2 to --enable-gui=gnome2'" >&2
