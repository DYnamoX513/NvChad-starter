-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme_toggle = { "ashes", "rosepine-dawn" },
  theme = "rosepine-dawn",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  hl_add = {
    -- for seed icon (format_on_save)
    St_seed = {
      fg = "#607560",
      -- see ~/.local/share/nvim/lazy/base46/lua/base46/integrations/statusline/vscode_colored.lua
      bg = { "statusline_bg", 1 },
    },
    TreesitterContextBottom = {
      bold = true,
      italic = true,
      underline = true,
      sp = "#A0A0A0",
    },
    -- TreesitterContextLineNumberBottom = {
    --   bold = true,
    --   italic = true,
    --   underline = true,
    --   sp = "#A0A0A0",
    -- },
  },
}

M.nvdash = require "configs.nvdash"

M.lsp = { signature = true }

M.ui = {
  statusline = require "configs.statusline",
}

return M
