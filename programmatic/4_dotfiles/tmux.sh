#!/usr/bin/env bash

# !!!========================================================================================
# !!! NB: directories MUST be terminated in a forward slash for the variables in this script!
# !!!========================================================================================

# NB note that this code could be generated procedurally for a given repo,
# given assurance of no namespace collisions through procedural variable generation [and sanity checking therein]

# =============================================
# Forked by Louis from 'bashrc_and_scripts.sh'
# =============================================

USER_LIVE_DIR=~/ # the directory in which you put e.g. a '.tmux.conf' file to have it load in the shell
                 # (may vary on e.g. a server, another distro, multi-user cf. system-wide cf. root etc. [?])

TMUX_BACKUP_FILENAME='.tmux.conf'
TMUX_BACKUP_DIR_NAME='.backup_dotfiles' # do not set to blank [without editing later code anyway]

# Be verbose when touching important files
echo "#---Using GitHub user $GITHUB_USER for the $DOTFILES_REMOTE_REPO_NAME repo" >&2

GITHUB_USER='lmmx'

DOTFILES_REMOTE_REPO_NAME='dotfiles'

DOTFILES_REMOTE="git@github.com:$GITHUB_USER/$DOTFILES_REMOTE_REPO_NAME.git"
DOTFILES_LOCAL_DIR=/gits/ # The directory to clone into from the remote (storing the versioned copy)
DOTFILES_LOCAL_REPO_NAME='' # If specified, the name to use instead of the remote version
DOTFILES_LOCAL_REPO=$DOTFILES_LOCAL_DIR$(if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then echo $DOTFILES_REMOTE_REPO_NAME/; else echo $DOTFILES_LOCAL_REPO_NAME/; fi)
DOTFILES_USER_DIR=~/ # The directory to copy over to, i.e to put a [functional] dotfiles directory under
DOTFILES_USER_REPO=$DOTFILES_USER_DIR$(if [[ -z $DOTFILES_LOCAL_REPO_NAME ]]; then echo $DOTFILES_REMOTE_REPO_NAME/; else echo $DOTFILES_LOCAL_REPO_NAME/; fi)

echo "#---tmux configuration being copied from $DOTFILES_LOCAL_REPO.tmux.conf to $USER_LIVE_DIR" >&2

# NB no 'local dir.': the user directory = the installation directory (i.e. directory in use is the 'live' local repo)

# This would ideally be parameterised to make it optional as for .dotfiles

# Thinking behind this difference is vaguely that .bashrc, .tmux.conf, etc. are crucial so cannot be 'live'
# or rather, not possible [well, not wise anyway] to version entire ~/ user home directory!

# ... perhaps a false distinction but on the other hand .scripts are really just a collection of tools
#    ... these should be versioned live so long as not confidential (they're not)

# !!! NB !!! you will screw things up if the directory names don't end in a forward slash!


#================================

###### Now set up .tmux.conf ######

#================================

# This is partitioned into user-defined parameters cf. default values [DOTFILES_REMOTE_REPO_NAME]
# Goal here is to carefully copy across versioned files to match state of setup on old laptop

#-----------------------------------------------
# Initialise .tmux.conf from the repo into the 
# [in-use] user home directory, at ~/.tmux.conf
#-----------------------------------------------

mkdir -p $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME

echo "#---Backing up .tmux.conf as $TMUX_BACKUP_FILENAME under $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME/" >&2
if [[ -e $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME'/'$TMUX_BACKUP_FILENAME ]]; then
	echo "$TMUX_BACKUP_FILENAME exists, so this script has probably already been run." >&2
	if [[ $(diff $USER_LIVE_DIR'.tmux.conf' $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME/$TMUX_BACKUP_FILENAME > /dev/null; echo $?) -eq 0 ]]; then
		# 0 exit code means no differences were found, 1 means differences were found (and 2 means 'trouble')
		echo "#---The backup is the same as the current system .tmux.conf, so no duplicate will be made." >&2;
	else
		echo "#---The backup differs from the current system .tmux.conf, so a backup will be made." >&2;
		cp --backup=t "$USER_LIVE_DIR.tmux.conf" $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME/$TMUX_BACKUP_FILENAME
	fi
else
	if [[ -e $USER_LIVE_DIR.tmux.conf ]]; then
		echo "Backing up the tmux config (for the first time, after this they will be numbered) under $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME" >&2
		cp --backup=t "$USER_LIVE_DIR.tmux.conf" $USER_LIVE_DIR$TMUX_BACKUP_DIR_NAME/$TMUX_BACKUP_FILENAME
	else
		# fresh config
		echo "Initialising $USER_LIVE_DIR.tmux.conf" >&2
	fi
fi

# Use a wildcard to avoid e.g. vim's temporary .swp files (not recursive: folders need to be explicitly given to avoid destructive accidents)
cp $DOTFILES_LOCAL_REPO'.tmux.conf' $USER_LIVE_DIR'.tmux.conf'

echo "#===Finished: tmux should now be using your versioned config at $USER_LIVE_DIR.tmux.conf" >&2
