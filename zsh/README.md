# Zsh Configuration

Modern Zsh shell configuration with completion, vi-mode, and plugin support.

## Files

| File | Description |
|------|-------------|
| `zshrc` | Main config: history, completion, prompt, vi-mode, plugin loading |
| `zsh_aliases` | Aliases and shell functions (same features as bash version) |
| `zsh_exports` | Environment variables with zsh-idiomatic `path` array |
| `install.sh` | Copies configs to `$HOME` with dot-prefixed names |

## Installation

```bash
./install.sh
```

This copies files to `~/.zshrc`, `~/.zsh_aliases`, and `~/.zsh_exports`.

## Features

- Vi-mode key bindings (`jk` to enter normal mode)
- Case-insensitive tab completion with menu selection
- Shared history across sessions with deduplication
- Auto-cd, spelling correction, extended globbing
- Colored prompt with full path, user@host differentiation
- Support for zsh-autosuggestions and zsh-syntax-highlighting plugins

## Recommended Plugins

Install via Homebrew:

```bash
brew install zsh-autosuggestions zsh-syntax-highlighting
```

## Secrets

Store sensitive environment variables in `~/.zsh_exports_hidden`. This file is loaded automatically but is not tracked by git.
