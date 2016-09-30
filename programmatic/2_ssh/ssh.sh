#!/usr/bin/env bash

# Set up SSH keys for GitHub
# ===

echo "Please enter the email to be used to authenticate with GitHub (the one you've registered there)" >&2

read GITHUB_USER_EMAIL

# Creates a new ssh key, using the provided email as a label
echo "Great! Here's a hint: just hit enter next to use the default RSA key location" >&2

ssh-keygen -t rsa -b 4096 -C "$GITHUB_USER_EMAIL"

# (Generates public/private RSA key pair)

# Starts the ssh-agent in the background
eval "$(ssh-agent -s)"

# Store in the keychain:
ssh-add -k ~/.ssh/id_rsa
