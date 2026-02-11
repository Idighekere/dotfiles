# Dotfiles

Personal configuration files for a Linux development environment featuring Neovim, tmux, Kitty terminal, and Zsh.

## Overview

This repository contains my dotfiles for setting up a consistent development environment across machines. The configuration is optimized for web development (JavaScript/TypeScript), Python, R, and general software engineering workflows.

## Components

### Neovim

A fully configured Neovim setup using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

**Features:**
- Leader key: `<Space>`
- Plugin management with lazy.nvim
- LSP support via mason.nvim and lspconfig
- Autocompletion with nvim-cmp
- GitHub Copilot integration
- Fuzzy finding with Telescope
- File explorer with nvim-tree
- Git integration (gitsigns, lazygit)
- Syntax highlighting with Treesitter
- Code formatting and linting
- Session management with auto-session
- Multiple colorscheme options (OneDark theme active)

**Key Plugins:**
| Category | Plugins |
|----------|---------|
| LSP | lspconfig, mason, lsp-signature |
| Completion | nvim-cmp, copilot, copilot-cmp |
| Navigation | telescope, harpoon, flash |
| UI | lualine, bufferline, alpha, indent-blankline |
| Git | gitsigns, lazygit |
| Editing | autopairs, surround, comment, substitute |
| Languages | treesitter, quarto, otter, r-lang |

**Directory Structure:**
```
.config/nvim/
├── init.lua              # Entry point
└── lua/idighs/
    ├── core/             # Core settings and keymaps
    ├── plugins/          # Plugin configurations
    │   └── lsp/          # LSP-specific configs
    ├── lazy.lua          # Lazy.nvim setup
    └── lsp.lua           # LSP configuration
```

### tmux

Terminal multiplexer configuration with vim-style navigation.

**Features:**
- Prefix key: `Ctrl+a`
- Vi mode for copy operations
- Mouse support enabled
- Tokyo Night theme
- Session persistence with tmux-resurrect and tmux-continuum
- Seamless vim-tmux navigation

**Key Bindings:**
| Binding | Action |
|---------|--------|
| `Ctrl+a \|` | Split window vertically |
| `Ctrl+a -` | Split window horizontally |
| `Ctrl+a r` | Reload tmux config |
| `Ctrl+a h/j/k/l` | Resize panes |
| `Ctrl+a m` | Toggle pane zoom |

**Plugins:**
- tpm (Tmux Plugin Manager)
- vim-tmux-navigator
- tmux-tokyo-night
- tmux-resurrect
- tmux-continuum

### Kitty Terminal

GPU-accelerated terminal emulator configuration.

**Features:**
- Font: Fira Code with ligatures
- Background opacity: 0.94
- Powerline-style tab bar (slanted)
- Hidden window decorations
- Shell: Zsh
- Editor: Neovim
- Splits layout enabled

### Zsh

Shell configuration using Oh My Zsh framework.

**Features:**
- Theme: robbyrussell
- Auto-suggestions and syntax highlighting
- fzf integration for fuzzy finding
- Custom greeting with figlet
- Smart directory navigation with auto-ls

**Custom Aliases:**
| Alias | Command |
|-------|---------|
| `v` | Open Neovim (current dir or specified files) |
| `j` | Jump to project directory with fzf |
| `gs` | git status |
| `gd` | git diff |
| `ts` | tmuxinator start |
| `nrd` / `prd` | npm/pnpm run dev |
| `tree` | tree (excluding node_modules, dist, etc.) |

**Custom Functions:**
- `j` - Fuzzy jump to any project in ~/dev
- `v` - Smart Neovim launcher
- `chpwd` - Auto-ls on directory change (with noise filtering)
- `boilerplate` - Download project boilerplates from GitHub

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```

2. Create symlinks for the configurations:
   ```bash
   # Neovim
   ln -s ~/dotfiles/.config/nvim ~/.config/nvim

   # tmux
   ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

   # Kitty
   ln -s ~/dotfiles/kitty/.config/kitty ~/.config/kitty

   # Zsh
   ln -s ~/dotfiles/.zshrc ~/.zshrc
   ```

3. Install dependencies:
   ```bash
   # Oh My Zsh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

   # Zsh plugins
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh/plugins/zsh-syntax-highlighting

   # tmux plugin manager
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

   # fzf
   # Install via your package manager

   # figlet (for shell greeting)
   # Install via your package manager
   ```

4. Open Neovim and let lazy.nvim install plugins automatically.

5. In tmux, press `Ctrl+a I` to install tmux plugins.

## Requirements

- Neovim >= 0.9.0
- tmux >= 3.0
- Kitty terminal
- Zsh
- Git
- Node.js (for LSP servers and Copilot)
- ripgrep (for Telescope)
- fzf
- Fira Code font (or your preferred Nerd Font)

## License

See [LICENSE](LICENSE) file.
