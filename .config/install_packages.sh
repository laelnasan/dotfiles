#!/bin/bash
# install_packages - initial configuration for debian buster on crostini penguin
sudo apt update
sudo apt upgrade -y

###### setup env for running Goneovim and xcape
sudo apt install -y libnss3 xsel xcape
# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

###### configure git
read -p "git config user name: " input
git config --global user.name "$input"
read -p "git config user email: " input
git config --global user.email "$input"
