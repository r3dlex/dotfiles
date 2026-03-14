-- AI Coding Tools Integration
-- Supports: Claude Code, Augment, Gemini CLI, OpenAI Codex
return {
  -- Copilot (GitHub)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          accept_word = "<M-w>",
          accept_line = "<M-e>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
      },
    },
  },

  -- Avante (AI-assisted coding - supports Claude, OpenAI, Gemini)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      provider = "claude",
      providers = {
        claude = {
          model = "claude-sonnet-4-20250514",
        },
      },
      mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
      },
    },
  },

  -- Terminal integration for CLI AI tools
  -- Use with Claude Code, Gemini CLI, OpenAI Codex
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tc", function()
        require("toggleterm.terminal").Terminal:new({
          cmd = "claude",
          direction = "vertical",
          size = function() return math.floor(vim.o.columns * 0.4) end,
          on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<Esc>", { noremap = true })
          end,
        }):toggle()
      end, desc = "Claude Code terminal" },
      { "<leader>tg", function()
        require("toggleterm.terminal").Terminal:new({
          cmd = "gemini",
          direction = "vertical",
          size = function() return math.floor(vim.o.columns * 0.4) end,
        }):toggle()
      end, desc = "Gemini CLI terminal" },
      { "<leader>to", function()
        require("toggleterm.terminal").Terminal:new({
          cmd = "codex",
          direction = "vertical",
          size = function() return math.floor(vim.o.columns * 0.4) end,
        }):toggle()
      end, desc = "OpenAI Codex terminal" },
      { "<leader>ta", function()
        require("toggleterm.terminal").Terminal:new({
          cmd = "augment",
          direction = "vertical",
          size = function() return math.floor(vim.o.columns * 0.4) end,
        }):toggle()
      end, desc = "Augment Code terminal" },
      { "<C-\\>", "<cmd>ToggleTerm direction=horizontal size=15<CR>", desc = "Toggle terminal" },
    },
    opts = {
      open_mapping = false,
      shade_terminals = true,
      shading_factor = 2,
      persist_mode = true,
    },
  },
}
