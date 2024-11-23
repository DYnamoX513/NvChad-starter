return {
  { -- required by telescope & LSP, see telescope.lua
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = require("configs.trouble").opts,
    keys = require("configs.trouble").keys,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "prettier",
        "prettierd",
        "pyright",
        "ruff",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
      },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>", -- set to `false` to disable one of the mappings
          node_incremental = "v",
          node_decremental = "V",
          scope_incremental = "<TAB>",
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      enable = true,
      mode = "cursor",
      max_lines = 3,
    },
  },

  { "Civitasv/cmake-tools.nvim", ft = { "cmake", "cpp", "c" } },
}
