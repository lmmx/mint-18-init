#!/usr/bin/env bash

# NB note that this code could be generated procedurally for a given repo,
# given assurance of no namespace collisions through procedural variable generation [and sanity checking therein]

# !!! NB!!! directories MUST be terminated in a forward slash for the variables in this script!

GITHUB_USER='lmmx'

DOTFILES_REMOTE_REPO_NAME='dotfiles'
DOTFILES_REMOTE="git@github.com:$GITHUB_USER/$DOTFILES_REMOTE_REPO_NAME.git"
DOTFILES_LOCAL_DIR=/gits/ # The directory to clone into from the remote (storing the versioned copy)
DOTFILES_LOCAL_REPO_NAME="" # If specified, the name to use instead of the remote version
DOTFILES_USER_DIR=~/ # The directory to copy over to, i.e to put a [functional] dotfiles directory under

# NB no 'local dir.': the user directory = the installation directory (i.e. directory in use is the 'live' local repo)

# This would ideally be parameterised to make it optional as for .dotfiles

# Thinking behind this difference is vaguely that .bashrc etc. are crucial so cannot be 'live'

# ... perhaps a false distinction but on the other hand .scripts are really just a collection of tools
#    ... these should be versioned live so long as not confidential (they're not)

DOTSCRIPTS_REMOTE_REPO_NAME='dot-scripts'
DOTSCRIPTS_REMOTE="git@github.com:$GITHUB_USER/$DOTSCRIPTS_REMOTE_REPO_NAME.git"
DOTSCRIPTS_LOCAL_REPO_NAME='.scripts'
DOTSCRIPTS_USER_DIR=~/ # The directory to clone a [live] git VCS repository under

# !!! NB !!! you will screw things up if the directory names don't end in a forward slash!




###### Now set up dotfiles ######



cd $DOTFILES_LOCAL_DIR

# This is partitioned into user-defined parameters cf. default values [DOTFILES_REMOTE_REPO_NAME]
# Goal here is to carefully copy across versioned files to match state of setup on old laptop

mkdir -p $DOTFILES_USER_DIR$(if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then echo $DOTFILES_REMOTE_REPO_NAME; else echo $DOTFILES_LOCAL_REPO_NAME; fi)

# Initialise a local copy (the functional, unversioned "user" copy) of the versioned ("local") repo
# The recursive copy command would copy the .git repo, so instead hidden files are ignored by using
# mkdir then copying '*' (to copy hidden files you'd need '.*').

# NB: as such, no files starting '.' (hidden "dotfiles") should be placed alongside this other than .git, .gitignore etc.:
# Those relevant to file versioning not functional dotfiles scripts (e.g. under the 'bashrc' directory etc)
# where they will be picked up by the recursive copy command in turn.

if [[ -z $DOTFILES_LOCAL_DIR_REPO_NAME ]]; then
	# Default, unless this variable is set in the config lines above
	git clone "$DOTFILES_REMOTE"
	cp -r $DOTFILES_LOCAL_DIR* 
else
	git clone "$DOTFILES_REMOTE" "$DOTFILES_LOCAL_DIR_REPO_NAME"
	cp -r $DOTFILES_LOCAL_REPO_NAME
fi

# TODO: Finish the cloning above, ensure the dotscripts below works, and we're away

###### Now set up dotscripts ######

cd $DOTSCRIPTS_USER_DIR

if [[ -z $DOTSCRIPTS_LOCAL_REPO_NAME ]]; then
	git clone "$DOTSCRIPTS_REMOTE"
else
	git clone "$DOTSCRIPTS_REMOTE_REPO_NAME" "$DOTSCRIPTS_LOCAL_REPO_NAME"
fi

