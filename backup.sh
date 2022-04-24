#!/bin/sh

# Add ssh to ssh-agent for single-sign-on
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

git pull origin main

# Copy all files within Dotfiles to this repos
while read f; do
	echo "Backing up file $f..."
	cp -rf $HOME/$f ./
done < Dotfiles
echo "Back up done, commiting..."

# Let commit all of them
git add . -A
git commit -m "Back up at $(date)"
git push origin main
