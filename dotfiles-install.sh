#!/usr/bin/env sh
# Clone dotfiles repository and setup aliases for bash

# clone from git repository if given
[ -n "$1" ] && git clone --bare $1 $HOME/.dotfiles

( # append alias to the bashrc
# TODO: make it POSIX and portable to any shell
echo ""
echo "# dotfiles alias"
echo "alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'"
	) >> $HOME/.bashrc

# checkout especific branch if given
source $HOME/.bashrc && dotfiles checkout $2
