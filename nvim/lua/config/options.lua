-- Core Neovim options

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false
opt.pumheight = 10
opt.title = true
opt.laststatus = 3

-- Editing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Performance
opt.lazyredraw = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.ttimeoutlen = 20

-- Files
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wildmenu = true
opt.wildignore:append({ "*.o", "*~", "*.pyc", "*/.git/*", "*/.DS_Store" })

-- Folding (treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevel = 99

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Session
opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize"
