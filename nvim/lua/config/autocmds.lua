-- Autocommands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Return to last edit position
autocmd("BufReadPost", {
  group = augroup("LastPosition", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Resize splits on window resize
autocmd("VimResized", {
  group = augroup("ResizeSplits", { clear = true }),
  command = "tabdo wincmd =",
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("TrimWhitespace", { clear = true }),
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Set filetype for common dotfiles
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("FileTypes", { clear = true }),
  pattern = { ".bash*", "*.bash" },
  command = "setfiletype bash",
})

-- Auto-enter insert mode in terminal
autocmd("TermOpen", {
  group = augroup("TerminalMode", { clear = true }),
  pattern = "*",
  command = "startinsert",
})

-- Disable line numbers in terminal
autocmd("TermOpen", {
  group = augroup("TerminalUI", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})
