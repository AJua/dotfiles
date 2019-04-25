#!/bin/bash

# git config
ln -s ./.gitconfig ~/.gitconfig
ln -s ./.gitignore_global ~/.gitconfig_global

# tmux config
ln -s ./.tmux.conf ~/.tmux.conf

# neovim config
mkdir -p ~/.config/nvim
ln -s ./init.vim ~/.config/nvim/init.vim
