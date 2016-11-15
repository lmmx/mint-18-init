#!/usr/bin/env sh

DOWNLOAD_DIR=~/Downloads/
BOOST_INSTALL_DIR=~/opt/bin/boost/

sudo apt-get install build-essential python-numpy python3-numpy cmake python-dev python3-dev sqlite3 libsqlite3-dev libboost-dev libboost-system-dev libboost-thread-dev
sudo apt-get install libboost-serialization-dev libboost-python-dev libboost-regex-dev

cd $DOWNLOAD_DIR
wget https://github.com/rdkit/rdkit/archive/Release_2016_03_4.tar.gz
BOOST_VER='boost_1_62_0'

wget https://sourceforge.net/projects/boost/files/boost/1.62.0/boost_1_62_0.tar.gz
tar -xvzf Release_2016_03_4.tar.gz
tar -xvzf $BOOST_VER.tar.gz
BOOST=$(dirname $BOOST_INSTALL_DIR)"/$BOOST_VER/"
mv $BOOST_VER $BOOST
cd $BOOST
./bootstrap.sh --with-libraries=python,regex,thread,serialization --prefix=$BOOST_INSTALL_DIR --with-python=$(which python3) --with-python-version=3.5 --with-python-root=/usr/local/lib/python3.5/
# if you don't have Unicode support for Regex see http://www.boost.org/doc/libs/1_60_0/libs/regex/doc/html/boost_regex/install.html
sudo ./b2 --enable-unicode=ucs4 install

#arg - appears to be missing pyconfig.h (also unicode/ICSU wouldn't work to support Regex but doubt that's important)
