#!/usr/bin/env bash

# INSTALLS: hub
# DEPENDS: curl
# VIA: https://hub.github.com/standalone
# DEVNOTES: Installing-the-hub-wrapper-for-git-on-Linux

# NB this could be done procedurally if this script was used as a systematic service
SCRIPT_INSTALLING='hub'
INSTALL_VIA='https://hub.github.com/standalone'
DEVNOTES_WIKI='Installing-the-hub-wrapper-for-git-on-Linux'
DEVNOTES_WIKI_URL="https://github.com/lmmx/devnotes/$DEVNOTES_WIKI"

# NB if changing this variable - ensure it ends in a forward slash
INSTALLING_DIR=/usr/bin/
HUB_PATH=$INSTALLING_DIR$SCRIPT_INSTALLING

echo "Installing $SCRIPT_INSTALLING from $INSTALL_VIA to $INSTALLING_DIR" >&2
sudo curl "$INSTALL_VIA" -Lo "$HUB_PATH"
chmod 755 $HUB_PATH

if [[ $(grep "hub alias" ~/.bashrc > /dev/null; echo $?) -eq 0 ]]; then
	echo "It looks like hub is already aliased in your .bashrc, you're good to go!" >&2
else
	echo "Hm, couldn't find hub aliased in your .bashrc..." >&2
fi

echo -e "\n\nFinished: for further guidance see devnotes wiki:\n
--> $DEVNOTES_WIKI_URL" >&2
