#!/usr/bin/env bash
#
# This script is intended to be run with curl, i.e.
#
# bash <(curl -s https://raw.githubusercontent.com/eliasnorrby/dotfiles/develop/bootstrap.sh)

SECONDS=0

if [ -z "$TARGET_BRANCH" ] ; then
  TARGET_BRANCH=${1:-master}
fi

set -exo pipefail

export DOTFILES_REPO="https://github.com/eliasnorrby/dotfiles"
export TARBALL_URL="$DOTFILES_REPO/tarball/$TARGET_BRANCH"
export DOTFILES=~/.dotfiles

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }

_get_repo_snapshot() {
  curl -sL $TARBALL_URL | tar xz
}

_msg "Downloading repository snapshot from eliasnorrby/dotfiles@$TARGET_BRANCH..."
cd $(mktemp -d)
_get_repo_snapshot
cd eliasnorrby-dotfiles*

_msg "Installing pip..."
sudo easy_install pip

_msg "Installing ansible..."
sudo pip install ansible

_msg "Installing playbook requirements..."
cd _provision
ansible-galaxy install -r requirements.yml

_msg "Running the playbook..."
ansible-playbook playbook.yml --tags 'all,do_homebrew,do_packages,do_defaults' -v

_msg "Run post-install script..."
cd $DOTFILES
./post-install.zsh

_msg "Done!"

ELAPSED="$(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"

_msg "Setup completed in $ELAPSED"
