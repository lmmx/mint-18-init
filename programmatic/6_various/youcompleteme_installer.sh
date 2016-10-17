#!/usr/bin/env bash

# INSTALLS: YouCompleteMe
# DEPENDS: git, go, vundle
# VIA: GH: Valloric/YouCompleteMe

GH_USER='Valloric'
GH_REPO='YouCompleteMe'
GH_REPO_URL="https://github.com/$GH_USER/$GHREPO"
GITHUB_VIA="git@github.com:$GH_USER/$GH_REPO.git"

# NB this could be done procedurally if this script was used as a systematic service
SCRIPT_INSTALLING='YouCompleteMe'

# NB if changing this variable - ensure it ends in a forward slash
INSTALLING_DIR=~/.vim/bundle/
YCM_PATH=$INSTALLING_DIR$SCRIPT_INSTALLING

echo "Installing $SCRIPT_INSTALLING from $GITHUB_VIA to $INSTALLING_DIR" >&2
mkdir -p $INSTALLING_DIR
cd $INSTALLING_DIR
git clone $GITHUB_VIA
cd $YCM_PATH
# It gave an error without doing this...
git submodule update --init --recursive
# Include Go and C support (not JS/TypeScript/C#/Rust)
./install.py --clang-completer --gocode-completer

echo -e "\n\nFinished: for further guidance see GitHub repo:\n
--> $GH_REPO_URL" >&2
