#!/usr/bin/env bash

# INSTALLS: pygist
# DEPENDS: python3
# VIA: https://github.com/mattikus/pygist

# NB this could be done procedurally if this script was used as a systematic service
SCRIPT_INSTALLING='pygist'

# NB if changing this variable - ensure it ends in a forward slash
INSTALLING_DIR=~/opt/bin/
PYGIST_PATH=$INSTALLING_DIR$SCRIPT_INSTALLING

EXPORT_AS=''

DOT_SCRIPTS_EXPORT_DIR=~/.scripts/exports/
DOT_SCRIPTS_EXPORT_PATH=$DOT_SCRIPTS_EXPORT_DIR$EXPORT_AS

mkdir -p ~/opt/bin/
wget http://github.com/mattikus/pygist/raw/master/pygist.py -O $PYGIST_PATH
chmod +x $PYGIST_PATH

# If custom command specified to export (i.e. what pygist will be called via then use that otherwise default)
# DEFAULT_VALUE: SCRIPT_INSTALLING
# CUSTOMISABLE_PARAMETER: EXPORT_AS
ln -s $PYGIST_PATH $DOT_SCRIPTS_EXPORT_PATH$(if [[ -z $EXPORT_AS ]]; then echo $SCRIPT_INSTALLING; else echo $EXPORT_AS; fi)
