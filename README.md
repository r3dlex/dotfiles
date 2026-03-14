# Dotfiles

Personal configuration files for shell, editor, and terminal tools.

## Quick Start

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script detects your shell (bash/zsh) and sets up configurations accordingly.

## Structure

```
dotfiles/
├── bash/              Bash shell configuration
│   ├── bash_profile   Main profile (prompt, history, sourcing)
│   ├── bash_aliases   Aliases and functions
│   ├── bash_exports   Environment variables and PATH
│   └── install.sh     Install bash configs
├── zsh/               Zsh shell configuration
│   ├── zshrc          Main config (completion, vi-mode, prompt)
│   ├── zsh_aliases    Aliases and functions
│   ├── zsh_exports    Environment variables and PATH
│   └── install.sh     Install zsh configs
├── nvim/              Neovim configuration (modern)
│   ├── init.lua       Entry point with lazy.nvim
│   ├── lua/config/    Core options, keymaps, autocommands
│   ├── lua/plugins/   Plugin specs (LSP, AI tools, editor)
│   └── install.sh     Symlink to ~/.config/nvim
├── vim/               Legacy Vim configuration (vim-plug)
│   ├── vimrc          Main vimrc
│   └── vimrc_mac      macOS variant
├── tmux/              Tmux terminal multiplexer
│   ├── tmux.conf      Config with Catppuccin colors
│   └── install.sh     Install tmux config
├── vimperator/        Legacy Firefox Vimperator (archived)
├── lyx/               LyX document templates and layouts
├── install.sh         Global install script
├── CLAUDE.md          Claude Code configuration
└── AGENTS.md          Agent guidelines
```

## Features

### Shell (Bash & Zsh)
- Colored prompt with **full path**, **username**, and **hostname** differentiation
- Root vs normal user visual distinction (red vs green)
- Modern aliases (git, docker, kubernetes, navigation)
- Utility functions (`up`, `mkcd`, `extract`)
- Platform detection (macOS/Linux) with OS-specific configs
- Sensitive data kept in `*_exports_hidden` files (gitignored)

### Neovim
- **lazy.nvim** plugin manager with lazy loading
- **Native LSP** with Mason for automatic server installation
- **Treesitter** for syntax highlighting and code understanding
- **Telescope** fuzzy finder for files, grep, buffers
- **AI coding tools**: Claude Code, Augment, Gemini CLI, OpenAI Codex terminals
- **Copilot** and **Avante** (multi-provider AI assistant)
- Catppuccin Mocha color scheme

### Tmux
- Catppuccin-inspired color scheme (matching Neovim)
- Vim-style pane navigation
- Mouse support
- True color (RGB) support
- Vi copy mode with system clipboard integration

## Prerequisites

```bash
# macOS
brew install neovim tmux fd ripgrep node npm fzf

# Optional zsh plugins
brew install zsh-autosuggestions zsh-syntax-highlighting

# Neovim providers
npm install -g neovim
```

## Security

No tokens, passwords, or credentials are stored in this repository. Sensitive environment variables should go in:
- `~/.bash_exports_hidden` (bash)
- `~/.zsh_exports_hidden` (zsh)

These files are sourced automatically but excluded from version control via `.gitignore`.

## License

MIT License - see [LICENSE](LICENSE) for details.
