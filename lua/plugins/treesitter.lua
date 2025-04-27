return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- ensure_installed = {
      --   "vim",
      --   "lua",
      --   "vimdoc",
      -- },
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
}
