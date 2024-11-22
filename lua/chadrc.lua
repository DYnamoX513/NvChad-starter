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
    St_seed = {
      fg = "#806040",
      -- see ~/.local/share/nvim/lazy/base46/lua/base46/integrations/statusline/vscode_colored.lua
      bg = { "statusline_bg", 1 },
    },
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
  header = {
    [[      .-.                         .    .                   /\   ]],
    [[        /|/|         /           /    /    .-.         _  / |   ]],
    [[       /   |  .-.---/---.-.     /    /     `-'.-.     (  /  |  .]],
    [[      /    |./.-'_ /   (  |    /    /     /  (         `/.__|_.']],
    [[ .-' /     |(__.' /     `-'-'_/_.-_/_.-_.(__. `---'.:' /    |   ]],
    [[(__.'      `.                                     (__.'     `-' ]],
    [[┳┓   ┓ •      ┏┓┓     ┳┳┓         ]],
    [[┃┃┏┓╋┣┓┓┏┓┏┓  ┣ ┃┏┏┓  ┃┃┃┏┓╋╋┏┓┏┓┏]],
    [[┛┗┗┛┗┛┗┗┛┗┗┫  ┗┛┗┛┗   ┛ ┗┗┻┗┗┗ ┛ ┛]],
    [[           ┛                      ]],
    [[󰹣  Format on save enabled (Conform)]],
    [[󱏾  Format on save disabled (Buffer)]],
    [[󱏽  Format on save disabled (Global)]],
    [[]],
  },
  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "󱩮  Toggle buffer format_on_save", keys = "Spc t f", cmd = "FormatToggle!" },
    { txt = "󱩭  Toggle global format_on_save", keys = "Spc t F", cmd = "FormatToggle" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "󱟬  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.lsp = { signature = true }

local fos_status = function()
  -- conform.nvim format_on_save status
  local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
  -- check buffer setting
  if require("configs.conform").format_on_save(buf) then
    return "󰹣 "
  end

  if vim.g.disable_autoformat then
    return "󱏽 "
  end

  return "󱏾 "
end

M.ui = {
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "fos",
      "ff",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cursor",
      "en",
      "cwd",
    },
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
          return "..." .. filename
        end

        return relative_path
      end,

      fos = function()
        return "%#St_seed#" .. fos_status() .. "%X" .. "%#StText#" -- reset
      end,

      en = function()
        local encode = vim.bo.fileencoding
        return "󰦨 " .. encode:upper() .. " "
      end,
    },
  },
}

return M
