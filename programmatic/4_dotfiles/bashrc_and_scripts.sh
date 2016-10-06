#!/usr/bin/env bash

# !!!========================================================================================
# !!! NB: directories MUST be terminated in a forward slash for the variables in this script!
# !!!========================================================================================

# NB note that this code could be generated procedurally for a given repo,
# given assurance of no namespace collisions through procedural variable generation [and sanity checking therein]

GITHUB_USER='lmmx'

USER_LIVE_DIR=~/ # the directory in which you put e.g. a '.bashrc' file to have it load in the shell
                 # (may vary on e.g. a server, another distro, multi-user cf. system-wide cf. root etc. [?])

BASHRC_BACKUP_FILENAME='.linux_mint_initial_bashrc'
BASHRC_BACKUP_DIR_NAME='.backup_dotfiles' # do not set to blank [without editing later code anyway]

DOTFILES_REMOTE_REPO_NAME='dotfiles'
# Be verbose when touching important files
echo "#---Using GitHub user $GITHUB_USER for the $DOTFILES_REMOTE_REPO_NAME repo" >&2

DOTFILES_REMOTE="git@github.com:$GITHUB_USER/$DOTFILES_REMOTE_REPO_NAME.git"
DOTFILES_LOCAL_DIR=/gits/ # The directory to clone into from the remote (storing the versioned copy)
DOTFILES_LOCAL_REPO_NAME='' # If specified, the name to use instead of the remote version
DOTFILES_LOCAL_REPO=$DOTFILES_LOCAL_DIR$(if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then echo $DOTFILES_REMOTE_REPO_NAME/; else echo $DOTFILES_LOCAL_REPO_NAME/; fi)
DOTFILES_USER_DIR=~/ # The directory to copy over to, i.e to put a [functional] dotfiles directory under
DOTFILES_USER_REPO=$DOTFILES_USER_DIR$(if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then echo $DOTFILES_REMOTE_REPO_NAME/; else echo $DOTFILES_LOCAL_REPO_NAME/; fi)

echo "#---Versioned dotfiles from $DOTFILES_LOCAL_REPO will go to $DOTFILES_USER_REPO" >&2

# NB no 'local dir.': the user directory = the installation directory (i.e. directory in use is the 'live' local repo)

# This would ideally be parameterised to make it optional as for .dotfiles

# Thinking behind this difference is vaguely that .bashrc, .tmux.conf, etc. are crucial so cannot be 'live'
# or rather, not possible [well, not wise anyway] to version entire ~/ user home directory!

# ... perhaps a false distinction but on the other hand .scripts are really just a collection of tools
#    ... these should be versioned live so long as not confidential (they're not)

DOTSCRIPTS_REMOTE_REPO_NAME='dot-scripts'
DOTSCRIPTS_REMOTE="git@github.com:$GITHUB_USER/$DOTSCRIPTS_REMOTE_REPO_NAME.git"
DOTSCRIPTS_LOCAL_REPO_NAME='.scripts'
DOTSCRIPTS_USER_DIR=~/ # The directory to clone a [live] git VCS repository under

# !!! NB !!! you will screw things up if the directory names don't end in a forward slash!


#================================

###### Now set up dotfiles ######

#================================

cd $DOTFILES_LOCAL_DIR

# This is partitioned into user-defined parameters cf. default values [DOTFILES_REMOTE_REPO_NAME]
# Goal here is to carefully copy across versioned files to match state of setup on old laptop

echo "#---Touching directory $DOTFILES_USER_REPO"'bashrc/' >&2
mkdir -p $DOTFILES_USER_REPO'bashrc/confidential/' # makes an empty sub-directory as well as necessary bashrc dir
touch $DOTFILES_USER_REPO'bashrc/confidential/bashrc_confidential'

# Initialise a local copy (the functional, unversioned "user" copy) of the versioned ("local") repo
# The recursive copy command would copy the .git repo, so instead hidden files are ignored by using
# mkdir then copying '*' (to copy hidden files you'd need '.*').

# NB: as such, no files starting '.' (hidden "dotfiles") should be placed alongside this other than .git, .gitignore etc.:
# Those relevant to file versioning not functional dotfiles scripts (e.g. under the 'bashrc/' directory etc.)
# where they will be picked up by the recursive copy command in turn.

if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then
	# Default, unless this variable is set in the config lines above
	# repo will be named $DOTFILES_REMOTE_REPO_NAME but no need to specify this
	git clone "$DOTFILES_REMOTE"
else
	git clone "$DOTFILES_REMOTE" "$DOTFILES_LOCAL_REPO_NAME"
fi

#--------------------------------------------------
# Initialise bashrc from the repo into the [in-use]
# .bashrc-supplementary bashrc/ dir. module scripts
#--------------------------------------------------

#==========!!!============
# NB: the tmux script
# now does this better (?)
#===========!!!===========

mkdir -p $USER_LIVE_DIR$BASHRC_BACKUP_DIR_NAME

echo "#---Backing up .bashrc as $BASHRC_BACKUP_FILENAME" >&2
if [[ -e $USER_LIVE_DIR$BASHRC_BACKUP_DIR_NAME'/'$BASHRC_BACKUP_FILENAME ]]; then
	echo "$BASHRC_BACKUP_FILENAME exists, so this script has probably already been run." >&2
	if [[ $(diff $USER_LIVE_DIR'.bashrc' $USER_LIVE_DIR$BASHRC_BACKUP_DIR_NAME/$BASHRC_BACKUP_FILENAME > /dev/null; echo $?) -eq 0 ]]; then
		# 0 exit code means no differences were found, 1 means differences were found (and 2 means 'trouble')
		echo "#---The backup is the same as the current system .bashrc, so no duplicate will be made." >&2;
	else
		echo "#---The backup differs from the current system .bashrc, so a backup will be made." >&2;
		cp --backup=t $USER_LIVE_DIR'.bashrc' $USER_LIVE_DIR$BASHRC_BACKUP_DIR_NAME/$BASHRC_BACKUP_FILENAME
	fi
else
	echo "Creating $USER_LIVE_DIR$BASHRC_BACKUP_DIR_NAME/$BASHRC_BACKUP_FILENAME" >&2
	cp $USER_LIVE_DIR'.bashrc' $USER_LIVE_DIR$BASHRC_BACKUP_DIR_NAME/$BASHRC_BACKUP_FILENAME
fi

# Use a wildcard to avoid e.g. vim's temporary .swp files (not recursive: folders need to be explicitly given to avoid destructive accidents)
cp $DOTFILES_LOCAL_REPO'bashrc/bashrc_*' $DOTFILES_USER_REPO'bashrc/' # will copy the bashrc directory's supplementary modules from the repo to the in-use directory
cp $DOTFILES_LOCAL_REPO'.bashrc' $USER_LIVE_DIR'.bashrc'

# TODO: ensure the dotscripts procedure below works, and we're away

#==================================

###### Now set up dotscripts ######

#==================================

cd $DOTSCRIPTS_USER_DIR

if [[ -z $DOTSCRIPTS_LOCAL_REPO_NAME ]]; then
	git clone "$DOTSCRIPTS_REMOTE"
else
	git clone "$DOTSCRIPTS_REMOTE_REPO_NAME" "$DOTSCRIPTS_LOCAL_REPO_NAME"
fi
