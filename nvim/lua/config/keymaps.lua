-- Key mappings

local map = vim.keymap.set

-- Escape alternatives
map("i", "jk", "<Esc>", { desc = "Escape" })
map("i", "JK", "<Esc>", { desc = "Escape" })

-- Save
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Close buffer
map("n", "<leader>q", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Force quit" })

-- Clear search highlighting
map("n", "<C-l>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Yank to end of line
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Splits
map("n", "<leader><leader>v", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader><leader>h", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Navigate splits
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Resize splits
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Clipboard
map("v", "<leader>c", '"+y', { desc = "Copy to clipboard" })
map("v", "<leader>x", '"+c', { desc = "Cut to clipboard" })
map("n", "<leader>v", 'c<ESC>"+p', { desc = "Paste from clipboard" })

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Open terminal" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Terminal in vsplit" })
map("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Terminal in split" })

-- Folding
map("n", "<leader>zi", "<cmd>setlocal foldmethod=indent<CR>", { desc = "Fold by indent" })
map("n", "<leader>zs", "<cmd>setlocal foldmethod=syntax<CR>", { desc = "Fold by syntax" })

-- JSON formatting
map("n", "<leader>pj", ":%!python3 -m json.tool<CR>", { desc = "Format JSON" })

-- Edit/source config
map("n", "<leader>ev", "<cmd>edit $MYVIMRC<CR>", { desc = "Edit nvim config" })
map("n", "<leader>sv", "<cmd>source $MYVIMRC<CR>", { desc = "Source nvim config" })
