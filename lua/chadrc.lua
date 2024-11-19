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
    TreesitterContextBottom = {
      -- bold = true,
      italic = true,
      underline = true,
      sp = "#A0A0A0",
    },
    -- TreesitterContextLineNumberBottom = {
    --   underline = true,
    --   sp = "grey",
    -- },
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.lsp = { signature = true }

M.ui = {
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    order = { "mode", "file", "git", "%=", "ff", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "en", "cwd" },
    modules = {
      -- f = "%f",
      ff = function()
        local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local path = vim.api.nvim_buf_get_name(buf)
        if path == "" then
          return "Empty"
        end

        local relative_path = vim.fn.fnamemodify(path, ":.")

        -- truncated
        if #relative_path > 40 then
          local filename = vim.fn.fnamemodify(path, ":t")
          return "¶ " .. filename
        end

        return relative_path
      end,

      en = function()
        local encode = vim.bo.fileencoding
        return "󰦨 " .. encode:upper() .. " "
      end,
    },
  },
}

return M
