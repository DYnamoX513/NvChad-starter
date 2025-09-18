-- `opts` should be a table (will be merged with parent specs) (shallow),
-- return a table (replaces parent specs) or should change a table.
-- The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()
return {

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
        "pyright",
        "ruff",
      },
    },
  },

  {
    "Civitasv/cmake-tools.nvim",
    ft = { "cmake", "cpp", "c" },
    opts = {},
  },

  -- Neovim doesn't support builtin block comment as of 0.10
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
  },

  { import = "nvchad.blink.lazyspec" },
}
