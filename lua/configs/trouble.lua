local M = {}

M.opts = {
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
    kinds = require "configs.symbol_icon",
  },
}

M.keys = {
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
    desc = "Trouble LSP Definitions / references / ...",
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
  {
    "<leader>tt",
    "<cmd>Trouble telescope toggle<cr>",
    desc = "Trouble Last telescope list",
  },
  {
    "<leader>tT",
    "<cmd>Trouble telescope_files toggle<cr>",
    desc = "Trouble Last telescope file list",
  },
}

return M
