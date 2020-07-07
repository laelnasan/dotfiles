#!/usr/bin/env sh
# Clone dotfiles repository and setup aliases for bash

# clone from git repository if given
[ -n "$1" ] && git clone --bare $1 $HOME/.dotfiles

( # append alias to the bashrc
# TODO: make it POSIX and portable to any shell
echo ""
echo "#"
echo "# # dotfiles alias and lazy completion"
echo "#"
echo "alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'"
echo "if declare -f __load_completion > /dev/null; then"
echo "	__load_completion 'git'"
echo "	__git_complete dotfiles __git_main"
echo "fi"
	) >> $HOME/.bashrc

# checkout especific branch if given
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout $2
