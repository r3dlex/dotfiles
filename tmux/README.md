# Tmux Configuration

Modern tmux configuration with Catppuccin-inspired colors and vim-like keybindings.

## Installation

```bash
./install.sh
```

## Requirements

- tmux >= 3.0

## Prefix Key

`Ctrl+A` (instead of the default `Ctrl+B`, for better ergonomics)

## Key Bindings

| Key | Action |
|-----|--------|
| `prefix + v` | Split pane vertically |
| `prefix + b` | Split pane horizontally |
| `prefix + c` | New window (in current path) |
| `prefix + h/j/k/l` | Navigate panes (vim-style) |
| `prefix + H/J/K/L` | Resize panes |
| `prefix + n/p` | Next/previous window |
| `prefix + r` | Reload config |

## Copy Mode

Vi-style copy mode:
- `v` to start selection
- `y` to copy (pipes to system clipboard via pbcopy)

## Features

- True color (RGB) support
- Mouse support enabled
- Automatic window renaming
- Windows and panes numbered from 1
- Activity monitoring
- Catppuccin Mocha color scheme matching Neovim
