return {
  "folke/trouble.nvim",
  opts = {
    -- preview = {
    --   type = "float",
    --   relative = "editor",
    --   border = "rounded",
    --   title = "Preview",
    --   title_pos = "center",
    --   position = { 0, -2 },
    --   size = { width = 0.3, height = 0.3 },
    --   zindex = 200,
    -- },
    modes = {
      diagnostics = {
        mode = "diagnostics",
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 0, -2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
      lsp_document_symbols = {
        focus = false,
        win = { position = "right" },
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          position = { 0, 2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
      symbols = {
        desc = "quick symbols",
      },
    },
    icons = {
      kinds = {
        Constant = "󱥌 ",
        Enum = "󰆩 ",
        EnumMember = "󰆩 ",
        Method = "󰆧 ",
        Module = "󰏗 ",
        Function = "󰡱 ",
        Package = "󰏗 ",
        Variable = "󰫧 ",
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>tx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble Diagnostics",
    },
    {
      "<leader>tX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble Buffer Diagnostics",
    },
    {
      "<leader>ts",
      "<cmd>Trouble lsp_document_symbols toggle focus=false<cr>",
      desc = "Trouble Lsp Symbols",
    },
    {
      "<leader>tS",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Trouble Filtered Symbols",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Tourble LSP Definitions / references / ...",
    },
    {
      "<leader>tL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble Location List",
    },
    {
      "<leader>tQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix List",
    },
  },
}
