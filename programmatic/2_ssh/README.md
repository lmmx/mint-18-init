# SSH key setup

- _NB: as of time of writing, just for GitHub_

---

- I use 2 types of SSH access: this is my global, and will apply across the system, whereas work-specific (directory-limited) keys will override
  - or rather, supplement I think, but be the only one applicable and thus be selected?
- Notes on my devnotes wiki ([Regenerating SSH keys on Linux](https://github.com/lmmx/devnotes/wiki/Regenerating-SSH-keys-on-Linux)) just suggest to use [the official guide](https://help.github.com/articles/generating-an-ssh-key/) but also to run the keychain. This is attempted to be programmatically carried out in the accompanying script file.

- __NB:__ after setting up, switch any repos created over HTTPS to the SSH protocol instead, with: [replacing `user` and `repo` for yours - as in the URL provided by GitHub] `git remote set-url origin git@github.com:user/repo.git`
  - (otherwise you will continue to be asked for username and password constantly)
