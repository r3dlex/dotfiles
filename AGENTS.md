# Agents Guidelines

## Repository Overview

This is a personal dotfiles repository containing shell, editor, terminal multiplexer, and other tool configurations.

## Structure

```
dotfiles/
├── bash/          # Bash shell configuration
├── zsh/           # Zsh shell configuration
├── nvim/          # Neovim configuration (modern, lazy.nvim)
├── vim/           # Legacy Vim configuration (vim-plug)
├── tmux/          # Tmux terminal multiplexer
├── vimperator/    # Legacy Firefox Vimperator (archived)
├── lyx/           # LyX document processor templates
└── install.sh     # Global install script
```

## Conventions

- Shell configs follow the pattern: `{shell}_profile`, `{shell}_aliases`, `{shell}_exports`
- Each directory contains its own `README.md` with setup instructions
- Install scripts copy configs to `$HOME` with appropriate dot-prefixed names
- No secrets, tokens, or credentials should be committed to this repository
- Editor configurations should support modern AI coding tools (Claude Code, Augment, Gemini CLI, OpenAI Codex)
- Neovim is the preferred editor; vim/ is kept for legacy compatibility

## Security

- Never commit API tokens, passwords, or secrets
- Use `*_exports_hidden` files (gitignored) for sensitive environment variables
- All sensitive data should be loaded from external, non-tracked files

## Shell Configurations

- Both bash and zsh configs should provide colored prompts with full path, username, and hostname
- Install scripts handle symlinking/copying to `$HOME`
- Platform-specific configs are loaded conditionally (macOS vs Linux)
