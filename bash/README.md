# Bash Configuration

Bash shell configuration files with modern defaults.

## Files

| File | Description |
|------|-------------|
| `bash_profile` | Main profile loaded for login shells. Sets prompt, history, and sources other files |
| `bash_aliases` | Aliases and shell functions (git, navigation, extraction, etc.) |
| `bash_exports` | Environment variables (editor, paths, language runtimes) |
| `install.sh` | Copies configs to `$HOME` with dot-prefixed names |

## Installation

```bash
./install.sh
```

This copies files to `~/.bash_profile`, `~/.bashrc`, `~/.bash_aliases`, and `~/.bash_exports`.

## Prompt

The prompt displays: `[timestamp] user@host full/path`

- Green username for normal users, red for root
- Yellow hostname for easy identification
- Blue full working directory path
- Return code shown on error

## Secrets

Store sensitive environment variables (API tokens, credentials) in `~/.bash_exports_hidden`. This file is loaded automatically but is not tracked by git.
