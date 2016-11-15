#!/usr/bin/env bash
sudo apt-get update

#shell:
#-terminal management, full unicode in system font
sudo apt-get install tmux ttf-ancient-fonts
sudo apt-get install parcellite
sudo apt-get install gedit

sudo apt-get install build-essential python-numpy cmake python-dev sqlite3 libsqlite3-dev libboost-dev python-dev python3-dev
sudo apt-get install libboost-system-dev libboost-thread-dev libboost-serialization-dev libboost-python-dev libboost-regex-dev

# python-config (removed from programmatic/5_python/python-config.sh)
#-via-@Dean
#-..via-url:https://benevolentai.slack.com/archives/D2DKAJ7EH/p1475658948000010
#-.,changed to Python 3 libraries (given old Python 2 libraries)
sudo apt-get install python3-pip

sudo apt-get install python-dev python3-dev

sudo apt-get install python3-numpy python3-scipy python3-matplotlib ipython3 ipython3-notebook
sudo apt-get install python3-pandas python3-sympy python3-nose
sudo apt-get install librdkit-dev librdkit1 python-chemfp rdkit-doc python-rdkit rdkit-data python-rdkit
