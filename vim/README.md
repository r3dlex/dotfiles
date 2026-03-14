# Vim Configuration (Legacy)

Legacy Vim/Neovim configuration using vim-plug. Kept for reference and backward compatibility.

For the modern Neovim setup, see the [nvim/](../nvim/) directory.

## Files

| File | Description |
|------|-------------|
| `vimrc` | Main configuration with vim-plug plugins, keymaps, and settings |
| `vimrc_mac` | macOS-specific variant (older) |

## Plugin Manager

Uses [vim-plug](https://github.com/junegunn/vim-plug). Install with:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then run `:PlugInstall` inside Vim.

## Migration

This config has been superseded by the Lua-based Neovim configuration in `nvim/`. Key improvements:
- lazy.nvim replaces vim-plug (lazy loading, better performance)
- Native LSP replaces YouCompleteMe
- Telescope replaces FZF (within nvim)
- Treesitter replaces regex-based syntax highlighting
- AI coding tool integrations (Claude, Copilot, Gemini, Codex)
