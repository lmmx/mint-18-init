#!/usr/bin/env bash

# INSTALLS: ruby
# DEPENDS: apt-get
# DEVNOTES: Installing-the-hub-wrapper-for-git-on-Linux

# NB this could be done procedurally if this script was used as a systematic service
SCRIPT_INSTALLING='ruby-full'
INSTALL_VIA='apt'

HELP_URL='https://www.ruby-lang.org/en/documentation/installation/#apt'

# NB if changing this variable - ensure it ends in a forward slash

echo "Installing $SCRIPT_INSTALLING from $INSTALL_VIA" >&2
sudo apt-get install ruby-full

echo -e "\n\nFinished: for further guidance see official help page:\n
--> $HELP_URL" >&2
