return {
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
      { "<leader>e", "<cmd>Neotree focus<CR>", desc = "Focus file explorer" },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    },
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>p", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>g", "<cmd>Telescope git_files<CR>", desc = "Git files" },
      { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>l", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>h", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>m", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search in buffer" },
      { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
      { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          mappings = {
            i = { ["<Esc>"] = require("telescope.actions").close },
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "]c", gs.next_hunk, "Next hunk")
        map("n", "[c", gs.prev_hunk, "Previous hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
      end,
    },
  },

  -- Git integration
  { "tpope/vim-fugitive", cmd = { "Git", "G", "Gstatus", "Gblame", "Gpush", "Gpull" } },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>t", function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
      { "<leader>t", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "v", desc = "Toggle comment" },
    },
    opts = {},
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- Easy motion / leap
  {
    "ggandor/leap.nvim",
    keys = {
      { "<leader>s", "<Plug>(leap-forward)", desc = "Leap forward" },
      { "<leader>S", "<Plug>(leap-backward)", desc = "Leap backward" },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview" },
    ft = "markdown",
    build = "cd app && npx --yes yarn install",
  },

  -- Easy align
  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Easy align" },
      { "<leader><Bslash>", ":EasyAlign*<Bar><CR>", mode = "v", ft = "markdown", desc = "Align table" },
    },
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
}
