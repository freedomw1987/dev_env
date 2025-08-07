# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup and Installation

This repository contains a macOS development environment setup. To install all dependencies:

```bash
./install.sh
```

This script installs:
- Development tools: fzf, fd, bat, ripgrep, tmux, vim, neovim, yabai, skhd
- Formatters: clang-format, js-beautify, shfmt, yamlfmt, stylelint, prettier, htmlq, stylua
- Node.js packages: lessc, swagger-ui-watcher, emmet-language-server, eslint, claude-code
- Vim plugins via Vim-plug and Pathogen

## Architecture Overview

### Core Components

1. **Neovim Configuration** (`nvim/`): Lua-based configuration with lazy loading
   - `init.lua`: Entry point loading core modules and plugin system
   - `lua/core/`: Core Neovim settings (options, keymaps, autocmds)
   - `lua/plugins/`: Plugin configurations including claude-code integration
   - `lua/configs/lazy.lua`: Lazy.nvim plugin manager setup

2. **Window Management** (`yabai/`, `skhd/`): macOS tiling window manager
   - `yabairc`: BSP layout configuration with 8px padding
   - `skhdrc`: Keyboard shortcuts for window management and navigation

3. **Editor Settings**:
   - `coc-settings.json`: CoC.nvim configuration with format-on-save for multiple languages
   - Claude Code integration via `claude-code.nvim` plugin

### Key Keybindings

- **Leader key**: `<Space>`
- **File explorer**: `<leader>e` - Toggle NvimTree
- **Terminal**: `<leader>gg` - Open lazygit in floating terminal
- **Claude Code**: `<C-,>` - Toggle Claude Code terminal
- **Search**: `<leader>rg` - Ripgrep search
- **Window management**: `<leader>vs` (vertical split), `<leader>ss` (horizontal split)
- **Tabs**: `<tab>` (next), `<S-Tab>` (previous), `<leader>1-6` (go to tab)

### Plugin Ecosystem

The Neovim setup includes:
- **AI/Completion**: Codeium, Claude Code integration, CoC.nvim
- **Navigation**: Telescope, NvimTree, Ripgrep
- **Git**: Lazy git integration via Floaterm
- **Formatting**: Language-specific formatters with format-on-save
- **Theme**: Catppuccin Mocha colorscheme
- **Development**: LSP, Treesitter, syntax highlighting

## Development Workflow

1. **Setup**: Run `./install.sh` to configure the entire environment
2. **Neovim**: Uses lazy loading for fast startup times
3. **Window Management**: Yabai provides BSP tiling with skhd shortcuts
4. **Code Formatting**: Automatic formatting on save for supported languages
5. **AI Integration**: Claude Code accessible via `<C-,>` with conversation management

## Claude Code Integration

The repository includes specific Claude Code configuration:
- Terminal opens in bottom-right with 30% screen height
- Auto-enters insert mode with hidden line numbers
- File change detection with 1-second intervals
- Git root detection for proper project context
- Conversation management with continue/resume options