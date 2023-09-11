#!/bin/bash

# git config
unlink ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
unlink ~/.gitconfig_global
ln -s ~/dotfiles/.gitignore_global ~/.gitconfig_global

# tmux config
unlink ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
unlink ~/tmux.sh
ln -s ~/dotfiles/tmux.sh ~/tmux.sh

# neovim config
mkdir -p ~/.config/nvim
unlink ~/.config/nvim/init.vim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim

#setup vimwiki
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/vimwiki ~/vimwiki
