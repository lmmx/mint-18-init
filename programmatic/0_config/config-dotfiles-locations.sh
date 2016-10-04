#!/usr/bin/env bash

# NB note that this code could be generated procedurally for a given repo,
# given assurance of no namespace collisions through procedural variable generation [and sanity checking therein]

# !!! NB!!! directories MUST be terminated in a forward slash for the variables in this script!

DOTFILES_REMOTE_REPO_NAME="dotfiles"
DOTFILES_REMOTE="git@github.com:lmmx/$DOTFILES_REMOTE_REPO_NAME.git"
DOTFILES_LOCAL_DIR=/gits/ # The directory to clone into from the remote (storing the versioned copy)
DOTFILES_LOCAL_REPO_NAME="" # If specified, the name to use instead of the remote version
DOTFILES_USER_DIR=~/ # The directory to copy over to, i.e to put a [functional] dotfiles directory under

# !!! NB !!! you will screw things up if the directory names don't end in a forward slash!

cd $DOTFILES_LOCAL_DIR

# this needs to be partitioned into user-defined cf. default [DOTFILES_REMOTE_REPO_NAME]
# Goal here is to carefully copy across versioned files to match state of setup on old laptop

mkdir -p $DOTFILES_USER_DIR$(if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then echo $DOTFILES_REMOTE_REPO_NAME; else echo $DOTFILES_LOCAL_REPO_NAME; fi)

# Initialise a local copy (the functional, unversioned "user" copy) of the versioned ("local") repo
# The recursive copy command would copy the .git repo, so instead hidden files are ignored by using
# mkdir then copying '*' (to copy hidden files you'd need '.*').

# NB: as such, no .files should be placed alongside this other than .git, .gitignore etc.: those
# relevant to file versioning not functional dotfiles scripts (e.g. under the 'bashrc' directory etc)
# where they will be picked up by the recursive copy command in turn.

if [[ -z $DOTFILES_LOCAL_DIR_REPO_NAME ]]; then
	# Default, unless this variable is set in the config lines above
	echo 'git clone "$DOTFILES_REMOTE"'
	cp -r $DOTFILES_LOCAL_DIR*
else
	echo 'git clone "$DOTFILES_REMOTE" "$DOTFILES_LOCAL_DIR_REPO_NAME"'
	cp -r $DOTFILES_LOCAL_REPO_NAME
fi
