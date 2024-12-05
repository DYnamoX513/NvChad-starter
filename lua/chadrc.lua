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
    -- theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "fos", -- format_on_save
      "ff",
      "lc",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp_all",
      "en",
      -- "lsp",
      -- "cursor",
      -- "cwd",
    },
    modules = {
      -- f = "%f",

      -- dynamic relative_path
      ff = function()
        local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local path = vim.api.nvim_buf_get_name(buf)
        if path == "" then
          return "Empty"
        end

        local relative_path = vim.fn.fnamemodify(path, ":.")

        -- further truncated
        if vim.o.columns < 60 then
          return "..."
        end
        -- filename only
        if vim.o.columns < 100 or #relative_path > 50 then
          local filename = vim.fn.fnamemodify(path, ":t")
          return ".../" .. filename
        end

        return relative_path
      end,

      -- format_on_save status
      fos = function()
        return "%#St_seed#" .. fos_status() .. "%X" .. "%#StText# " -- reset
      end,

      -- all attached LSPs
      lsp_all = function()
        if rawget(vim, "lsp") then
          local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
          local clients = {}
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[buf] then
              table.insert(clients, client.name)
            end
          end
          if #clients > 0 then
            if vim.o.columns > 100 then
              return "%#St_Lsp#󰟥 " .. table.concat(clients, "/") .. " "
            else
              return "%#St_Lsp#󰟥 " .. #clients .. " "
            end
          end
        end
        return ""
      end,

      -- line-column
      lc = " %3l,%-3c",

      -- file encoding
      en = function()
        local encode = vim.bo.fileencoding
        return "%#StText#󰴓 " .. encode:upper() .. " "
      end,
    },
  },
}

return M
