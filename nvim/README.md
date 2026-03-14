# Neovim Configuration

Modern Neovim configuration using Lua and lazy.nvim plugin manager.

## Structure

```
nvim/
├── init.lua                  # Entry point, bootstraps lazy.nvim
├── lua/
│   ├── config/
│   │   ├── options.lua       # Core editor options
│   │   ├── keymaps.lua       # Key mappings
│   │   └── autocmds.lua      # Autocommands
│   └── plugins/
│       ├── colorscheme.lua   # Catppuccin theme
│       ├── editor.lua        # Editor plugins (telescope, neo-tree, etc.)
│       ├── lsp.lua           # LSP, completion, treesitter
│       └── ai.lua            # AI coding tool integrations
└── install.sh                # Symlinks config to ~/.config/nvim
```

## Installation

```bash
./install.sh
```

On first launch, lazy.nvim will automatically install all plugins. Run `:Mason` to install LSP servers.

## Prerequisites

```bash
brew install neovim fd ripgrep node npm
npm install -g neovim
```

## Key Mappings

Leader key: `;`

### Navigation
| Key | Action |
|-----|--------|
| `<C-p>` / `;p` | Find files (Telescope) |
| `;g` | Git files |
| `;b` | Buffers |
| `;l` | Live grep |
| `;h` | Recent files |
| `;n` | Toggle file explorer |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `;rn` | Rename symbol |
| `;ca` / `;i` | Code action |
| `;f` | Format |

### AI Tools
| Key | Action |
|-----|--------|
| `;tc` | Open Claude Code terminal |
| `;tg` | Open Gemini CLI terminal |
| `;to` | Open OpenAI Codex terminal |
| `;ta` | Open Augment Code terminal |
| `<C-\>` | Toggle terminal |
| `;aa` | Avante ask (AI chat) |
| `;ae` | Avante edit |

### Editing
| Key | Action |
|-----|--------|
| `;t` | Toggle comment |
| `;s` | Leap forward |
| `jk` / `JK` | Escape (insert mode) |
| `<A-j>` / `<A-k>` | Move line up/down |

## Plugin Highlights

- **lazy.nvim** - Plugin manager with lazy loading
- **Telescope** - Fuzzy finder for files, grep, buffers
- **Neo-tree** - File explorer
- **nvim-lspconfig + Mason** - LSP with auto-install
- **nvim-cmp** - Autocompletion with snippets
- **Treesitter** - Syntax highlighting and code understanding
- **Gitsigns** - Git integration in the gutter
- **Copilot** - GitHub Copilot integration
- **Avante** - AI assistant (Claude, OpenAI, Gemini)
- **ToggleTerm** - Terminal integration for CLI AI tools
- **Catppuccin** - Color scheme
