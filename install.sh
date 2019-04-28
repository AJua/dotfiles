#!/bin/bash

# git config
unlink ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
unlink ~/.gitconfig_global
ln -s ~/dotfiles/.gitignore_global ~/.gitconfig_global

# tmux config
unlink ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# neovim config
mkdir -p ~/.config/nvim
unlink ~/.config/nvim/init.vim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
