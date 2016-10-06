#!/usr/bin/env bash

# INSTALLS: git-helpers
# DEPENDS: git
# VIA: GH: ryan-williams/git-helpers

GH_USER='ryan-williams'
GH_REPO='git-helpers'
GH_REPO_URL="https://github.com/$GH_USER/$GHREPO"
GITHUB_VIA="git@github.com:$GH_USER/$GH_REPO.git"

# NB this could be done procedurally if this script was used as a systematic service
SCRIPT_INSTALLING='git-helpers'

# NB if changing this variable - ensure it ends in a forward slash
INSTALLING_DIR=/gits/
HUB_PATH=$INSTALLING_DIR$SCRIPT_INSTALLING

echo "Installing $SCRIPT_INSTALLING from $GITHUB_VIA to $INSTALLING_DIR" >&2
cd $INSTALLING_DIR
git clone $GITHUB_VIA

echo -e "\n\nFinished: for further guidance see GitHub repo:\n
--> $GH_REPO_URL" >&2
