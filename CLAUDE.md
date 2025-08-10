# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files and scripts for development environment setup. The repository manages configurations for:

- **Neovim**: Complete Vim configuration with plugin management via vim-plug
- **tmux**: Terminal multiplexer configuration and session scripts
- **Git**: Global git configuration and gitignore settings
- **VimWiki**: Personal wiki and diary template generation

## Setup and Installation

The primary installation method is via the setup script:

```bash
./setup.sh
```

This script creates symbolic links from the dotfiles directory to standard configuration locations in the home directory.

## Key Components

### Configuration Files

- `init.vim` - Neovim configuration with extensive plugin setup, custom keybindings, and language support
- `.tmux.conf` - tmux terminal multiplexer configuration
- `.gitconfig` - Global git configuration
- `.gitignore_global` - Global gitignore patterns

### Scripts and Utilities

- `setup.sh` - Main installation script that creates symlinks for all configurations
- `tmux.sh` - tmux session management script that creates a predefined workspace with multiple windows
- `generate-vimwiki-diary-template` - Python script that generates diary templates for VimWiki with Japanese/Chinese locale support

### Neovim Configuration Highlights

The Neovim setup includes:
- Plugin management via vim-plug with 20+ plugins for development
- Language support for TypeScript, Vue.js, Python, PowerShell, and more
- Auto-completion via deoplete
- File management with NERDTree
- Markdown preview capabilities
- VimWiki integration for note-taking
- Custom keybindings with comma (,) as leader key
- Auto-save functionality
- Syntax folding for multiple languages

### tmux Workspace

The `tmux.sh` script creates a development workspace with predefined windows:
- Window 0: VimWiki (automatically opens vim with vimwiki)
- Window 1: Appium server
- Window 2: scrcpy (screen mirroring)
- Window 3: lnav (log navigator)
- Window 4: Flutter development environment

## Development Environment Requirements

The configuration expects these tools to be installed:
- Neovim with Python 2.7 and Python 3.10 support
- tmux
- Various command-line tools: jq, pandoc, clang
- Development tools: appium, scrcpy, flutter, lnav

## VimWiki Integration

VimWiki is configured to:
- Use markdown syntax with `.md` extension
- Store files in `~/vimwiki` directory (linked to iCloud)
- Generate HTML output to `~/vimwiki/site_html/`
- Auto-generate diary entries with Japanese/Chinese date formatting

## File Management

The repository uses a symlink-based approach where configuration files remain in the dotfiles directory and are linked to their expected locations. This allows for version control while maintaining standard configuration paths.
