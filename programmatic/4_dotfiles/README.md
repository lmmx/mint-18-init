# dotfiles

Port dot files to another machine

A local copy is kept in `~/dotfiles` as well as a versioned copy used only when pushing to remote (so that edits do not corrupt the local repo which matches the remote (other than changes made to the remote, which can be pulled before changes in home directory are instantiated to the `/gits` repo, added to a commit and pushed to master branch).

- `bashrc_and_scripts` is the initial setup script

## TODO

- `TODO:sync` match up the `tmux.sh` (proper) handling [as delineated in code comments] to `bashrc_and_scripts.sh` (conditional over handling non-existence of an initialised file differs for a `.bashrc` but think it still may be wrong - need to check.
- `TODO:controller` make a single executable controller script (perhaps call 'main' in same way all dir's docs are `README.md`), having now removed all content from `dotfiles-port.sh` [rename perhaps]
