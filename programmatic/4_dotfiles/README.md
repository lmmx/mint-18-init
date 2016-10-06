# dotfiles

Port dot files to another machine

A local copy is kept in `~/dotfiles` as well as a versioned copy used only when pushing to remote (so that edits do not corrupt the local repo which matches the remote (other than changes made to the remote, which can be pulled before changes in home directory are instantiated to the `/gits` repo, added to a commit and pushed to master branch).

- `bashrc_and_scripts` is the initial setup script
