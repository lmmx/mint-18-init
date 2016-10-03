#!/usr/bin/env bash

# USERNAME="user"
# GROUPNAME="group"

# for louis@louis I set both from shell commands (can hardcode, up to you)

# Make an array from the list of users, assuming it's just 1 then no issue
# Maybe hardcode or write a switch statement if more than 1
CONF_USER_LIST=($(users))
CONF_GROUP_LIST=($(groups))

if [[ ${#CONF_USER_LIST[@]} -eq 1 ]]; then
	CONF_USER=${CONF_USER_LIST[0]}
	# not a shared PC, continue trying to assume
	if [[ ${CONF_GROUP_LIST[0]} == $CONF_USER ]]; then
		# there's a user group with the same name as the only user
		CONF_GROUP=$CONF_USER
	else
		echo "No group for the user '"$CONF_USER"' - try hardcoding into '0_config/config-folders.sh'.\nExiting process." >&2
	fi
else
	echo "More than one user on the system, run 'users' command and hardcode one or write a switch statement in '0_config/config-folders.sh'.\nExiting process." >&2
fi

# Optional: change to /gits/ if you wish to set system-wide gits folder:
CONF_CREATING_DIRS=(/gits/)
if [[ -z $CONF_USER ]]; then
	echo "No user available, set this manually [hardcode/edit etc]" >&2
else
	if [[ -z $CONF_GROUP ]]; then
		echo "No group named, set this manually [hardcode/edit etc]" >&2
	fi
fi

echo "Enter your password to run 'sudo chown -R $CONF_USER:$CONF_GROUP" >&2

for CC_DIR in ${CONF_CREATING_DIRS[@]}; do
	mkdir -p $CC_DIR # p flag silences error if directory exists
	sudo chown -R $CONF_USER:$CONF_GROUP $CC_DIR
done
