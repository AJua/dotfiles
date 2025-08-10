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

# setup tmux plugin manager
echo "Setting up tmux plugin manager..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tmux plugin manager installed"
else
    echo "tmux plugin manager already exists"
fi

# setup Nord theme for tmux
echo "Setting up Nord theme for tmux..."
if [ ! -d ~/.tmux/themes/nord-tmux ]; then
    mkdir -p ~/.tmux/themes
    git clone https://github.com/arcticicestudio/nord-tmux.git ~/.tmux/themes/nord-tmux
    echo "Nord theme installed"
else
    echo "Nord theme already exists"
fi

# neovim config
mkdir -p ~/.config/nvim
unlink ~/.config/nvim/init.vim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim

#setup vimwiki
#ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/vimwiki ~/vimwiki
ln -s ~/Syncthing/vimwiki ~/vimwiki
